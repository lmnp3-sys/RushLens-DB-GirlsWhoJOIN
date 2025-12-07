
from flask import Blueprint, request, jsonify
from backend.db_connection import db
from mysql.connector import Error

user_customer = Blueprint("user_customer", __name__)

# GET all users
@user_customer.route("/users", methods=["GET"])
def get_all_users():
    try:
        cursor = db.get_db().cursor(dictionary=True)
        cursor.execute("SELECT * FROM User")
        return jsonify(cursor.fetchall()), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()


# GET specific user

@user_customer.route("/users/<int:user_id>", methods=["GET"])
def get_user(user_id):
    try:
        cursor = db.get_db().cursor(dictionary=True)
        cursor.execute("SELECT * FROM User WHERE user_id = %s", (user_id,))
        result = cursor.fetchone()

        if not result:
            return jsonify({"error": "User not found"}), 404
        return jsonify(result), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()


# CREATE user

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


# UPDATE user
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


# DELETE user

@user_customer.route("/users/<int:user_id>", methods=["DELETE"])
def delete_user(user_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("DELETE FROM User WHERE user_id = %s", (user_id,))
        db.get_db().commit()

        return jsonify({"message": "User deleted"}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()



# GET all customers
@user_customer.route("/customers", methods=["GET"])
def get_customers():
    try:
        cursor = db.get_db().cursor(dictionary=True)
        cursor.execute("SELECT * FROM Customers")
        return jsonify(cursor.fetchall()), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()


# GET a specific customer
@user_customer.route("/customers/<int:customer_id>", methods=["GET"])
def get_customer(customer_id):
    try:
        cursor = db.get_db().cursor(dictionary=True)
        cursor.execute("SELECT * FROM Customers WHERE customer_id = %s", (customer_id,))
        result = cursor.fetchone()

        if not result:
            return jsonify({"error": "Customer not found"}), 404

        return jsonify(result), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()


# CREATE customer
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
        cursor.close()


# UPDATE customer
@user_customer.route("/customers/<int:customer_id>", methods=["PUT"])
def update_customer(customer_id):
    try:
        data = request.get_json()

        allowed = ["firstName", "lastName", "neuID", "store_id"]

        updates = []
        params = []

        for field in allowed:
            if field in data:
                updates.append(f"{field} = %s")
                params.append(data[field])

        if not updates:
            return jsonify({"error": "No valid fields to update"}), 400

        params.append(customer_id)

        query = f"UPDATE Customers SET {', '.join(updates)} WHERE customer_id = %s"

        cursor = db.get_db().cursor()
        cursor.execute(query, params)
        db.get_db().commit()

        return jsonify({"message": 'Customer updated'}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()


# DELETE customer
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
