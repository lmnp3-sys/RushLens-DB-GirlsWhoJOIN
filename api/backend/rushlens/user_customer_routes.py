
from flask import Blueprint, request, jsonify
from db_connection import db
from mysql.connector import Error

user_customer = Blueprint("user_customer", __name__)

# GET all users
@user_customer.route("/users", methods=["GET"])
def get_all_users():
    try:
        cursor = db.get_db().cursor(dictionary=True)
        cursor.execute("SELECT * FROM User")
        results = cursor.fetchall()
        return jsonify(results), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()

# GET a specific user
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

# POST create a new user
@user_customer.route("/users", methods=["POST"])
def create_user():
    try:
        data = request.get_json()

        required_fields = ["username", "email", "role"]
        for field in required_fields:
            if field not in data:
                return jsonify({"error": f"Missing required field: {field}"}), 400

        cursor = db.get_db().cursor()

        query = """
            INSERT INTO User (username, email, role)
            VALUES (%s, %s, %s)
        """
        cursor.execute(query, (data["username"], data["email"], data["role"]))
        db.get_db().commit()

        new_id = cursor.lastrowid
        return jsonify({"message": "User created", "user_id": new_id}), 201

    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()

# GET all customers
@user_customer.route("/customers", methods=["GET"])
def get_customers():
    try:
        cursor = db.get_db().cursor(dictionary=True)
        cursor.execute("SELECT * FROM Customer")
        results = cursor.fetchall()
        return jsonify(results), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()

# PUT update a specific customer profile
@user_customer.route("/customers/<int:customer_id>", methods=["PUT"])
def update_customer(customer_id):
    try:
        data = request.get_json()

        cursor = db.get_db().cursor()

        cursor.execute("SELECT * FROM Customer WHERE customer_id = %s", (customer_id,))
        if not cursor.fetchone():
            return jsonify({"error": "Customer not found"}), 404

        allowed_fields = ["name", "phone", "email", "preferences"]
        update_fields = []
        params = []

        for field in allowed_fields:
            if field in data:
                update_fields.append(f"{field} = %s")
                params.append(data[field])

        if not update_fields:
            return jsonify({"error": "No valid fields to update"}), 400

        params.append(customer_id)

        query = f"""
            UPDATE Customer
            SET {', '.join(update_fields)}
            WHERE customer_id = %s
        """

        cursor.execute(query, params)
        db.get_db().commit()
        return jsonify({"message": "Customer updated"}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()

# DELETE a specific customer
@user_customer.route("/customers/<int:customer_id>", methods=["DELETE"])
def delete_customer(customer_id):
    try:
        cursor = db.get_db().cursor()

        cursor.execute("DELETE FROM Customer WHERE customer_id = %s", (customer_id,))
        db.get_db().commit()
        return jsonify({"message": "Customer deleted"}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()

