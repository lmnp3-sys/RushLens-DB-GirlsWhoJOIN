#BLUEPRINT 4 Traffic
<<<<<<< HEAD
from ml_models import Blueprint, jsonify , request
from backend.db_connection import db
from backend.db_connection import Error
=======
from flask import Blueprint, jsonify , request
from db_connection import db
from mysql.connector import Error
>>>>>>> fc75828ef2f11b5fe953f6de2f48349ac82d2110

#Create the blueprint 
traffic_input =  Blueprint('traffic_input', __name__)

#GET all inputs about FootTrafficData
@traffic_input.route("/traffic", methods=["GET"])
def get_all_inputs():
    try:
        cursor = db.get_db().cursor()

        # Prepare the Base query
        query = "SELECT * FROM FootTrafficRecord"
        cursor.execute(query)
        result = cursor.fetchall()

        return jsonify(result),
    finally:
         cursor.close()

#GET specific FootTrafficData 
@traffic_input.route('/traffic/<int:traffic_id>', methods=['GET'])
def get_traffic(traffic_id):
    cursor = db.get_db().cursor()
    query = "SELECT * FROM FootTrafficData WHERE traffic_id = %s"
    cursor.execute(query, (traffic_id,))

    result = cursor.fetchone()
    return jsonify(result)

#CREATE new FootTrafficData Inputs
@traffic_input.route("/traffic", methods=["POST"])
def create_traffic_input():
    try:
        data = request.get_json()

        # Check and validate all required fields
        required_fields = "[traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count]"
        for field in required_fields:
            if field not in data:
                return jsonify({"error": f"Missing required field: {field}"}), 400

        cursor = db.get_db().cursor()

        resolved_value = 1 if data.get("resolved", False) else 0

        # Insert new data
        query = """
        INSERT INTO FootTrafficData (traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count)
        VALUES (%s, %s, %s, %s, %s, %s)
        """
        cursor.execute(
            query,
            (
                data["traffic_id"],
                data["data_id"],
                data["user_id"],
                data["store_id"],
                data["avg_wait_min"],
                data["visitor_count"]
            ),
        )

        db.get_db().commit()
        new_alert_id = cursor.lastrowid
        cursor.close()

        return (
            jsonify({"message": "Traffic input record created successfully"}),
            201,
        )

    except Error as e:
        return jsonify({"error": str(e)}), 500
    

#DELETE invalid or unecessary FootTrafficData
@traffic_input.route('/traffic/<int:traffic_id>', methods=['DELETE'])
def delete_traffic_record(traffic_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("DELETE FROM FootTrafficRecord WHERE traffic_id = %s", (traffic_id,))
        db.get_db().commit()

        return jsonify({'message': 'Traffic input record deleted'}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500

    finally:
        cursor.close()

        
        
