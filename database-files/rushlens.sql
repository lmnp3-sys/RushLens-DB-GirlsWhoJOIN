DROP DATABASE IF EXISTS RushLens;
CREATE DATABASE IF NOT EXISTS RushLens;
USE RushLens;

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

-- DROP & CRDROP TABL
CREATE TABLE IF
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
    FOREIGN KEY (traffic_id)(traffic_id)
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
    neuID INT,
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
DROP TABLE IF EXISTS SystemsAlerts;
    CREATE TABLE IF NOT EXISTS SystemsAlerts(
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
    status BOOLEAN,
    FOREIGN KEY (sensor_id) REFERENCES SensorDevice (sensor_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- DROP & CREATE table: MaintenanceLog
DROP TABLE IF EXISTS MaintenanceLog;
CREATE TABLE IF NOT EXISTS MaintenanceLog(
    maintenance_id INT PRIMARY KEY,
    sensor_id INT,
    performedBy VARCHAR(50),
    actionType VARCHAR(20),
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
    status BOOLEAN,
    capacity INT,
    outlet_num INT,
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
    floor INT,
    location_type VARCHAR(50)
);

-- DROP & CREATE table: SensorDevice
DROP TABLE IF EXISTS SensorDevice;
CREATE TABLE IF NOT EXISTS SensorDevice(
    sensor_id INT PRIMARY KEY,
    store_id INT,
    sensorType VARCHAR(50),
    status BOOLEAN,
    lastCalibrationDate DATETIME,
    firmwareVersion INT,
    installDate DATETIME,
    FOREIGN KEY (store_id) REFERENCES store (store_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- DROP & CREATE table: User
DROP TABLE IF EXISTS User;
CREATE TABLE IF NOT EXISTS User(
    user_id INT PRIMARY KEY,
    accountType VARCHAR(50)
);

-- INSERT STATEMENTS HERE
INSERT INTO User (user_id,accountType) VALUES (
(User_id, accountType) values (1, 'owner');
(User_id, accountType) values (2, 'manager');
(User_id, accountType) values (3, 'manager');
(User_id, accountType) values (4, 'owner');
(User_id, accountType) values (5, 'community member');
(User_id, accountType) values (6, 'community member');
(User_id, accountType) values (7, 'owner');
(User_id, accountType) values (8, 'manager');
(User_id, accountType) values (9, 'community member');
(User_id, accountType) values (10, 'owner');
(User_id, accountType) values (11, 'manager');
(User_id, accountType) values (12, 'manager');
(User_id, accountType) values (13, 'manager');
(User_id, accountType) values (14, 'owner');
(User_id, accountType) values (15, 'community member');
(User_id, accountType) values (16, 'community member');
(User_id, accountType) values (17, 'community member');
(User_id, accountType) values (18, 'faculty');
(User_id, accountType) values (19, 'owner');
(User_id, accountType) values (20, 'faculty');
(User_id, accountType) values (21, 'community member');
(User_id, accountType) values (22, 'community member');
(User_id, accountType) values (23, 'community member');
(User_id, accountType) values (24, 'student');
(User_id, accountType) values (25, 'owner');
(User_id, accountType) values (26, 'manager');
(User_id, accountType) values (27, 'manager');
(User_id, accountType) values (28, 'owner');
(User_id, accountType) values (29, 'student');
(User_id, accountType) values (30, 'manager');
(User_id, accountType) values (31, 'owner');(User_id, accountType) values (32, 'owner');
(User_id, accountType) values (33, 'owner');
(User_id, accountType) values (34, 'community member');
)

INSERT INTO FootTrafficRecord (traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) VALUES (
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (1, 158, 111, 128, 36, 3, '2025-08-19 00:45:31');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (2, 89, 35, 288, 58, 38, '2025-04-13 17:54:11');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (3, 80, 109, 118, 59, 77, '2025-02-22 15:34:43');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (4, 57, 75, 187, 18, 123, '2025-02-13 16:20:45');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (5, 200, 11, 95, 6, 110, '2025-08-19 07:23:06');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (6, 210, 128, 186, 26, 52, '2025-11-02 22:59:54');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (7, 235, 195, 128, 41, 34, '2025-02-06 16:23:02');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (8, 185, 219, 277, 7, 87, '2025-02-17 12:36:20');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (9, 42, 8, 259, 28, 93, '2024-12-19 05:59:24');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (10, 38, 192, 298, 10, 70, '2025-07-08 00:15:05');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (11, 261, 62, 183, 56, 37, '2025-08-17 00:41:52');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (12, 24, 164, 155, 63, 98, '2025-12-02 23:33:35');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (13, 41, 109, 15, 35, 44, '2025-08-31 16:23:56');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (14, 208, 130, 183, 60, 83, '2025-09-06 06:20:48');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (15, 55, 24, 181, 21, 101, '2024-12-12 21:39:19');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (16, 29, 127, 107, 16, 103, '2025-09-20 07:08:32');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (17, 197, 143, 8, 31, 118, '2025-02-13 12:31:35');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (18, 70, 118, 9, 13, 48, '2025-07-05 02:53:10');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (19, 132, 157, 60, 53, 148, '2025-09-30 23:15:28');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (20, 80, 43, 241, 21, 39, '2025-11-29 13:45:32');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (21, 27, 68, 183, 26, 20, '2025-05-03 05:36:53');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (22, 81, 238, 146, 17, 16, '2025-02-25 07:46:36');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (23, 89, 34, 260, 51, 40, '2025-09-04 22:54:04');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (24, 3, 170, 264, 63, 48, '2025-11-15 14:36:40');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (25, 142, 116, 188, 59, 53, '2025-09-12 09:23:03');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (26, 261, 75, 192, 40, 49, '2025-07-21 01:05:03');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (27, 14, 29, 210, 32, 31, '2025-11-13 04:06:24');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (28, 164, 119, 84, 26, 44, '2025-08-08 06:52:26');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (29, 68, 43, 229, 53, 17, '2025-02-26 20:56:26');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (30, 61, 60, 191, 18, 114, '2025-03-05 15:23:27');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (31, 156, 198, 19, 70, 30, '2025-04-22 20:26:31');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (32, 92, 58, 71, 49, 51, '2025-03-04 01:12:14');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (33, 174, 54, 186, 22, 38, '2025-12-01 06:22:21');
(traffic_id, data_id, user_id, store_id, avg_wait_min, visitor_count, timeStamp) values (34, 125, 70, 193, 23, 111, '2025-05-26 10:06:50');
)
