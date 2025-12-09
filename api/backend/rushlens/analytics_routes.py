# BLUEPRINT 2 Analytics
from flask import Blueprint, request, jsonify 
from mysql.connector import Error
from db_connection import db
from mysql.connector import Error

#Create the blueprint 
analytics =  Blueprint('analytics', __name__)

# Route 1: GET all sensors with their status, type, store,. 
@analytics.route("/sensor-device", methods=["GET"])
def get_all_sensor():
    try:
        cursor = db.get_db().cursor()

        # Prepare the Base query
        query = "SELECT * FROM SensorDevice"
        cursor.execute(query)
        result = cursor.fetchall()

        return jsonify(result), 200
    finally:
         cursor.close()

    
# Route 2: Get all sensor data 
@analytics.route('/sensor-data', methods=['GET'])
def get_sensor_data():
    try:
        cursor = db.get_db().cursor()
        cursor.execute("SELECT * FROM SensorData ORDER BY timeStamp DESC")
        rows = cursor.fetchall()
        return jsonify(rows), 200
    finally:
        cursor.close()

# Route 3: Create new system alert
@analytics.route("/system-alerts", methods=["POST"])
def create_system_alert():
    try:
        data = request.get_json()

        # Validate required fields
        required_fields = ["sensor_id", "alertType", "severity", "timeStamp"]
        for field in required_fields:
            if field not in data:
                return jsonify({"error": f"Missing required field: {field}"}), 400

        cursor = db.get_db().cursor()

        resolved_value = 1 if data.get("resolved", False) else 0

        # Insert new system alert
        query = """
        INSERT INTO SystemAlerts (sensor_id, alertType, severity, timeStamp, resolved)
        VALUES (%s, %s, %s, %s, %s)
        """
        cursor.execute(
            query,
            (
                data["sensor_id"],
                data["alertType"],
                data["severity"],
                data["timeStamp"],
                resolved_value,
            ),
        )

        db.get_db().commit()
        new_alert_id = cursor.lastrowid
        cursor.close()

        return (
            jsonify({"message": "System alert created successfully", "alert_id": new_alert_id}),
            201,
        )

    except Error as e:
        return jsonify({"error": str(e)}), 500
    

# Route 4: Update an existing System Alert information
@analytics.route("/system-alerts/<int:alert_id>", methods=["PUT"])
def update_system_alert(alert_id):
    try:
        data = request.get_json()

        # Check if alert exists
        cursor = db.get_db().cursor()
        cursor.execute("SELECT * FROM SystemAlerts WHERE alert_id = %s", (alert_id,))
        if not cursor.fetchone():
            cursor.close()
            return jsonify({"error": "System alert not found"}), 404

        # Build update query dynamically based on provided fields
        update_fields = []
        params = []
        allowed_fields = ["sensor_id", "alertType", "severity", "timeStamp", "resolved"]

        for field in allowed_fields:
            if field in data:
                # handle boolean for resolved
                if field == "resolved":
                    value = 1 if data["resolved"] else 0
                    update_fields.append("resolved = %s")
                    params.append(value)
                else:
                    update_fields.append(f"{field} = %s")
                    params.append(data[field])

        if not update_fields:
            cursor.close()
            return jsonify({"error": "No valid fields to update"}), 400

        params.append(alert_id)
        query = f"UPDATE SystemAlerts SET {', '.join(update_fields)} WHERE alert_id = %s"

        cursor.execute(query, params)
        db.get_db().commit()
        cursor.close()

        return jsonify({"message": "System alert updated successfully"}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500

# Route 5: Remove/delete a sensor device if broken
@analytics.route('/sensor-device/<int:sensor_id>', methods=['DELETE'])
def delete_sensor(sensor_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("DELETE FROM SensorDevice WHERE sensor_id = %s", (sensor_id,))
        db.get_db().commit()

        return jsonify({'message': 'Sensor device deleted'}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500

    finally:
        cursor.close()


# Route 6: Get all DataQualityCheck
@analytics.route('/data-quality-checks', methods=['GET'])
def get_all_data_quality_checks():
    try:
        cursor = db.get_db().cursor()

        # Prepare the Base query
        query = "SELECT * FROM DataQualityCheck"
        cursor.execute(query)
        result = cursor.fetchall()

        return jsonify(result), 200
    finally:
         cursor.close()


        
        