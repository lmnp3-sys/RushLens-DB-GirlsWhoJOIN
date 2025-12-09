# BLUEPRINT 3 User/Customer

from flask import Blueprint, request, jsonify
from db_connection import db
from mysql.connector import Error

user_customer = Blueprint("user_customer", __name__)

# Route 1: GET all users
@user_customer.route("/users", methods=["GET"])
def get_all_users():
    try:
        cursor = db.get_db().cursor()
        cursor.execute("SELECT * FROM User")
        return jsonify(cursor.fetchall()), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()


# Route 2: CREATE user
@user_customer.route("/users", methods=["POST"])
def create_user():
    try:
        data = request.get_json()

        required = ["user_id", "accountType"]
        for field in required:
            if field not in data:
                return jsonify({"error": f"Missing field {field}"}), 400

        cursor = db.get_db().cursor()
        query = """INSERT INTO User (user_id, accountType)
                   VALUES (%s, %s)"""
        cursor.execute(query, (data["user_id"], data["accountType"]))
        db.get_db().commit()

        return jsonify({"message": "User created"}), 201

    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()


# Route 3: UPDATE user
@user_customer.route("/users/<int:user_id>", methods=["PUT"])
def update_user(user_id):
    try:
        data = request.get_json()

        if "accountType" not in data:
            return jsonify({"error": "No valid fields to update"}), 400

        cursor = db.get_db().cursor()
        query = """UPDATE User SET accountType = %s WHERE user_id = %s"""
        cursor.execute(query, (data["accountType"], user_id))
        db.get_db().commit()

        return jsonify({"message": "User updated"}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()

# Route 4: GET all customers
@user_customer.route("/customers", methods=["GET"])
def get_customers():
    cursor = None # initialize cursor
    try:
        cursor = db.get_db().cursor()
        cursor.execute("SELECT * FROM Customers")
        return jsonify(cursor.fetchall()), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        if cursor:
            cursor.close()


# Route 5: GET a specific customer
@user_customer.route("/customers/<int:customer_id>", methods=["GET"])
def get_customer(customer_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("SELECT * FROM Customers WHERE customer_id = %s", (customer_id,))
        result = cursor.fetchone()

        if not result:
            return jsonify({"error": "Customer not found"}), 404

        return jsonify(result), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()


# Route 6: CREATE customer
@user_customer.route("/customers", methods=["POST"])
def create_customer():
    try:
        data = request.get_json()

        required = ["customer_id", "firstName", "lastName", "neuID", "store_id"]
        for f in required:
            if f not in data:
                return jsonify({"error": f"Missing field {f}"}), 400

        query = """INSERT INTO Customers (customer_id, firstName, lastName, neuID, store_id)
                   VALUES (%s, %s, %s, %s, %s)"""

        cursor = db.get_db().cursor()
        cursor.execute(query, (
            data["customer_id"],
            data["firstName"],
            data["lastName"],
            data["neuID"],
            data["store_id"]
        ))

        db.get_db().commit()

        return jsonify({"message": "Customer created"}), 201

    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        if 'cursor' in locals():
         cursor.close()


# Route 10: DELETE customer
@user_customer.route("/customers/<int:customer_id>", methods=["DELETE"])
def delete_customer(customer_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("DELETE FROM Customers WHERE customer_id = %s", (customer_id,))
        db.get_db().commit()

        return jsonify({"message": "Customer deleted"}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()
