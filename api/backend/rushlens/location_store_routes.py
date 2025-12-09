# HTTP status code
# 2xx = SUCCESS
"""
HTTP status code

2xx = SUCCESS
    200 - OK (general success)
    201 - Created (successfully created something new)
    204 - No content (success, but nothing to return)

4xx - Client Error
    400 - Bad request (invalid data)
    404 - Not Found (resource doesn't exist)

5xx - Server Error
    500 - Internal Server Error (something broke on the server)    
"""

# BLUEPRINT 1: Location & Store

from flask import Blueprint, request, jsonify 
from ..db_connection import db

# Create the Blueprint
location_store = Blueprint('location_store', __name__)

# LOCATION ROUTES

# Route 1: GET all locations
@location_store.route('/location', methods=['GET'])
def get_all_locations():
    conn = db.get_db()
    cursor = conn.cursor()
    try:
        query = "SELECT * FROM Location"
        cursor.execute(query)
        results = cursor.fetchall()
        return jsonify(results)
    
    finally:
        cursor.close()

# Route 2: GET specific location
@location_store.route('/location/<int:location_id>', methods=['GET'])
def get_location(location_id):
    cursor = db.get_db().cursor()
    query = "SELECT * FROM Location WHERE location_id = %s"
    cursor.execute(query, (location_id,))

    result = cursor.fetchone()
    return jsonify(result)

# Route 3: POST - create a new location
@location_store.route('/location', methods=['POST'])
def create_location():
    data = request.get_json()
    cursor = db.get_db().cursor()
    query = """
            INSERT INTO Location (name, address, building, floor, location_type)
            VALUES (%s, %s, %s, %s, %s)"""

    cursor.execute(query, (
        data['name'],
        data['address'],
        data['building'],
        data['floor'],
        data['location_type']
    ))
    db.get_db().commit()
    return jsonify({'message':'Location created'}), 201


# STORE ROUTES

# Route 4: GET all stores
@location_store.route('/store', methods=['GET'])
def get_all_stores():
    cursor = db.get_db().cursor()
    query = "SELECT * FROM Store"
    cursor.execute(query)

    results = cursor.fetchall()
    return jsonify(results)

# Route 5: GET stores by location
@location_store.route('/location/<int:location_id>/store', methods=['GET'])
def get_stores_by_location(location_id):
    cursor = db.get_db().cursor()
    query = "SELECT * FROM Store WHERE location_id = %s"
    cursor.execute(query, (location_id))

    results = cursor.fetchall()
    return jsonify(results)

# Route 6: PUT - Update store
@location_store.route('/store/<int:store_id>', methods=['PUT'])
def update_store(store_id):
    data = request.get_json()
    cursor = db.get_db().cursor()
    query = """
        UPDATE Store
        SET store_name = %s, store_type = %s, capacity = %s, status = %s
        WHERE store_id = %s
    """
    cursor.execute(query, (
        data['store_name'],
        data['store_type'],
        data['capacity'],
        data['status'],
        store_id
    ))
    db.get_db().commit()
    return jsonify({'message': 'Store updated'})

# Route 7: DELETE Store
@location_store.route('/store/<int:store_id>', methods=['DELETE'])
def delete_store(store_id):
    cursor = db.get_db().cursor()
    query = "DELETE FROM Store WHERE store_id = %s"
    cursor.execute(query, (store_id))
    db.get_db().commit()

    return jsonify({'message': 'Store deleted'})

maintenance = Blueprint('maintenance', __name__)


# Route 8: GET all maintenance logs
@location_store.route('/maintenance-log', methods=['GET'])
def get_all_maintenance():
    try:
        cursor = db.get_db().cursor()
        query = '''
            SELECT 
                maintenance_id,
                sensor_id,
                performedBy,
                action_type,
                maintenance_date,
                notes
            FROM MaintenanceLog
            ORDER BY maintenance_date DESC
        '''
        cursor.execute(query)
        
        results = cursor.fetchall()
        
        maintenance_logs = []
        for row in results:
            maintenance_logs.append({
                'maintenance_id': row[0],
                'sensor_id': row[1],
                'performedBy': row[2],
                'actionType': row[3],  # Match your Streamlit code
                'maintenance_date': row[4],
                'notes': row[5]
            })
        
        return jsonify(maintenance_logs), 200
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500


# Route 9: POST new maintenance log
@location_store.route('/maintenance-log', methods=['POST'])
def create_maintenance():
    try:
        data = request.get_json()
        cursor = db.get_db().cursor()
        
        query = '''
            INSERT INTO MaintenanceLog 
            (sensor_id, performedBy, actionType, notes)
            VALUES (%s, %s, %s, %s)
        '''
        
        cursor.execute(query, (
            data['sensor_id'],
            data['performedBy'],
            data['actionType'],
            data['notes']
        ))
        
        db.get_db().commit()
        return jsonify({'message': 'Maintenance scheduled successfully'}), 200
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500