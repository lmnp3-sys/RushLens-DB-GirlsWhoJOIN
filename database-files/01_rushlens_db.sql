DROP DATABASE IF EXISTS rushlens_db;
CREATE DATABASE IF NOT EXISTS rushlens_db;
USE rushlens_db;

-- Disable FK checks to allow dropping in any order
SET FOREIGN_KEY_CHECKS = 0;

-- DROP & CREATE table: UserInput
DROP TABLE IF EXISTS UserInput;
CREATE TABLE IF NOT EXISTS UserInput(
    input_id INT PRIMARY KEY,
    user_id INT,
    customer_id INT,
    store_id INT,
    timeStamp DATETIME,
    reported_wait_min INT,
    reported_occupancy INT,
    intended_stay_min INT,
    notes VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES User (user_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (store_id) REFERENCES Store (store_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (customer_id) REFERENCES Customers (customer_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- DROP & CREATE table: FootTrafficRecord
DROP TABLE IF EXISTS FootTrafficRecord;
CREATE TABLE IF NOT EXISTS FootTrafficRecord(
    traffic_id INT PRIMARY KEY,
    data_id INT,
    user_id INT,
    store_id INT,
    avg_wait_min INT,
    visitor_count INT,
    timeStamp DATETIME,
    FOREIGN KEY (data_id) REFERENCES SensorData (data_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (user_id) REFERENCES User (user_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (store_id) REFERENCES Store (store_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- DROP & CREATE table: StoreDailyStats
DROP TABLE IF EXISTS StoreDailyStats;
CREATE TABLE IF NOT EXISTS StoreDailyStats(
    stats_id INT PRIMARY KEY,
    traffic_id INT,
    store_id INT,
    date DATE,
    daily_visitors INT,
    peak_hour INT,
    lowest_hour INT,
    page_views INT,
    FOREIGN KEY (traffic_id) REFERENCES FootTrafficRecord (traffic_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (store_id) REFERENCES store (store_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- DROP & CREATE table: Customers
DROP TABLE IF EXISTS Customers;
CREATE TABLE IF NOT EXISTS Customers(
    customer_id INT PRIMARY KEY,
    firstName VARCHAR(25),
    lastName VARCHAR(25),
    neuID VARCHAR(20),
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES Store (store_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

-- DROP & CREATE table: SensorData
DROP TABLE IF EXISTS SensorData;
CREATE TABLE IF NOT EXISTS SensorData(
    data_id INT PRIMARY KEY,
    sensor_id INT,
    value INT,
    timeStamp DATETIME,
    FOREIGN KEY (sensor_id) REFERENCES SensorDevice (sensor_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- DROP & CREATE table: SystemAlerts
DROP TABLE IF EXISTS SystemAlerts;
    CREATE TABLE IF NOT EXISTS SystemAlerts(
    alert_id INT PRIMARY KEY,
    sensor_id INT,
    alertType VARCHAR(20),
    severity VARCHAR(20),
    timeStamp DATETIME,
    resolved BOOLEAN,
    FOREIGN KEY (sensor_id) REFERENCES SensorDevice (sensor_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- DROP & CREATE table: DataQualityCheck
DROP TABLE IF EXISTS DataQualityCheck;
CREATE TABLE IF NOT EXISTS DataQualityCheck(
    check_id INT PRIMARY KEY,
    sensor_id INT,
    checkTime DATETIME,
    status VARCHAR(20),
    FOREIGN KEY (sensor_id) REFERENCES SensorDevice (sensor_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- DROP & CREATE table: MaintenanceLog
DROP TABLE IF EXISTS MaintenanceLog;
CREATE TABLE IF NOT EXISTS MaintenanceLog(
    maintenance_id INT PRIMARY KEY,
    sensor_id INT,
    performedBy VARCHAR(50),
    actionType VARCHAR(50),
    actionDate DATETIME,
    notes VARCHAR(50),
    FOREIGN KEY (sensor_id) REFERENCES SensorDevice (sensor_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- DROP & CREATE table: Store
DROP TABLE IF EXISTS Store;
CREATE TABLE IF NOT EXISTS Store(
    store_id INT PRIMARY KEY,
    location_id INT,
    store_name VARCHAR(50),
    store_type VARCHAR(50),
    status VARCHAR(20),
    capacity INT,
    FOREIGN KEY (location_id) REFERENCES Location (location_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

-- DROP & CREATE table: Location
DROP TABLE IF EXISTS Location;
CREATE TABLE IF NOT EXISTS Location(
    location_id INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    building VARCHAR(50),
    floor VARCHAR(20),
    location_type VARCHAR(50)
);

-- DROP & CREATE table: SensorDevice
DROP TABLE IF EXISTS SensorDevice;
CREATE TABLE IF NOT EXISTS SensorDevice(
    sensor_id INT PRIMARY KEY,
    store_id INT NOT NULL,
    sensorType VARCHAR(50),
    status BOOLEAN,
    lastCalibrationDate DATETIME,
    firmwareVersion INT,
    installDate DATETIME,
    FOREIGN KEY (store_id) REFERENCES Store (store_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- DROP & CREATE table: User
DROP TABLE IF EXISTS User;
CREATE TABLE IF NOT EXISTS User(
    user_id INT PRIMARY KEY,
    accountType VARCHAR(50)
);

-- BRIGE TABLES
-- DROP & CREATE bridge table: CustomerInput
DROP TABLE IF EXISTS CustomerInput;
CREATE TABLE IF NOT EXISTS CustomerInput(
    input_id INT,
    customer_id INT,
    input_notes VARCHAR(100),
    PRIMARY KEY (input_id, customer_id),
    FOREIGN KEY (input_id) REFERENCES UserInput(input_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- DROP & CREATE bridge table: StoreInput
DROP TABLE IF EXISTS StoreInput;
CREATE TABLE IF NOT EXISTS StoreInput(
    store_id INT,
    input_id INT,
    store_notes VARCHAR(100),
    PRIMARY KEY (store_id, input_id),
    FOREIGN KEY (store_id) REFERENCES Store(store_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (input_id) REFERENCES UserInput(input_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- DROP & CREATE bridge table: DataDerived
DROP TABLE IF EXISTS DataDerived;
CREATE TABLE IF NOT EXISTS DataDerived(
    traffic_id INT, 
    data_id INT, 
    sensor_id INT, 
    tracking_detail VARCHAR(100),
    PRIMARY KEY (traffic_id, data_id),
    FOREIGN KEY (traffic_id) REFERENCES FootTrafficRecord(traffic_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (data_id) REFERENCES SensorData(data_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (sensor_id) REFERENCES SensorDevice(sensor_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- Re-enable FK checks
SET FOREIGN_KEY_CHECKS = 1;







