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
CREATE TABINT,
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
    stats_id INT PRIMy_visitors INT,
    peak_hour INT,
    lowest_hour INT,
    page_views INT,
    FOREIG,
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
INSERT INTO User (user_id,accountType) VALUES(
(1, 'owner');
(2, 'manager');
(3, 'manager');
(4, 'owner');
(5, 'community member');
(6, 'community member');
(7, 'owner');
(8, 'manager');
(9, 'community member');
(10, 'owner');
(11, 'manager');
(12, 'manager');
(13, 'manager');
(14, 'owner');
(15, 'community member');
(16, 'community member');
(17, 'community member');
(18, 'faculty');
(19, 'owner');
(20, 'faculty');
(21, 'community member');
(22, 'community member');
(23, 'community member');
(24, 'student');
(25, 'owner');
(26, 'manager');
(27, 'manager');
(28, 'owner');
(29, 'student');
(30, 'manager');
(31, 'owner');(32, 'owner');
(33, 'owner');
(34, 'community member');
)

INSERT INTO FootTrafficRecord (visitor_count, timeStamp) VALUES (
(1, 158, 111, 128, 36, 3, '2025-08-19 00:45:31');
(2, 89, 35, 288, 58, 38, '2025-04-13 17:54:11');
(3, 80, 109, 118, 59, 77, '2025-02-22 15:34:43');
(4, 57, 75, 187, 18, 123, '2025-02-13 16:20:45');
(5, 200, 11, 95, 6, 110, '2025-08-19 07:23:06');
(6, 210, 128, 186, 26, 52, '2025-11-02 22:59:54');
(7, 235, 195, 128, 41, 34, '2025-02-06 16:23:02');
(8, 185, 219, 277, 7, 87, '2025-02-17 12:36:20');
(9, 42, 8, 259, 28, 93, '2024-12-19 05:59:24');
(10, 38, 192, 298, 10, 70, '2025-07-08 00:15:05');
(11, 261, 62, 183, 56, 37, '2025-08-17 00:41:52');
(12, 24, 164, 155, 63, 98, '2025-12-02 23:33:35');
(13, 41, 109, 15, 35, 44, '2025-08-31 16:23:56');
(14, 208, 130, 183, 60, 83, '2025-09-06 06:20:48');
(15, 55, 24, 181, 21, 101, '2024-12-12 21:39:19');
(16, 29, 127, 107, 16, 103, '2025-09-20 07:08:32');
(17, 197, 143, 8, 31, 118, '2025-02-13 12:31:35');
(18, 70, 118, 9, 13, 48, '2025-07-05 02:53:10');
(19, 132, 157, 60, 53, 148, '2025-09-30 23:15:28');
(20, 80, 43, 241, 21, 39, '2025-11-29 13:45:32');
(21, 27, 68, 183, 26, 20, '2025-05-03 05:36:53');
(22, 81, 238, 146, 17, 16, '2025-02-25 07:46:36');
(23, 89, 34, 260, 51, 40, '2025-09-04 22:54:04');
(24, 3, 170, 264, 63, 48, '2025-11-15 14:36:40');
(25, 142, 116, 188, 59, 53, '2025-09-12 09:23:03');
(26, 261, 75, 192, 40, 49, '2025-07-21 01:05:03');
(27, 14, 29, 210, 32, 31, '2025-11-13 04:06:24');
(28, 164, 119, 84, 26, 44, '2025-08-08 06:52:26');
(29, 68, 43, 229, 53, 17, '2025-02-26 20:56:26');
(30, 61, 60, 191, 18, 114, '2025-03-05 15:23:27');
(31, 156, 198, 19, 70, 30, '2025-04-22 20:26:31');
(32, 92, 58, 71, 49, 51, '2025-03-04 01:12:14');
(33, 174, 54, 186, 22, 38, '2025-12-01 06:22:21');
(34, 125, 70, 193, 23, 111, '2025-05-26 10:06:50');
)

INSERT INTO UserInput (input_id, user_id, customer_id, store_id, timeStamp, reported_wait_min, reported_occupancy, intended_stay_min, notes) VALUES
(1, 32, 164, 70, '2025-08-08 21:26:18', 71, 17, 105, 'Friendly staff and quick service');
(2, 167, 123, 255, '2025-04-02 02:32:46', 8, 134, 126, 'Great food and atmosphere');
(3, 157, 90, 18, '2025-09-25 10:18:03', 25, 139, 61, 'Cozy ambiance with delicious menu options');
(4, 174, 13, 184, '2025-02-21 21:48:11', 58, 28, 50, 'Great food and atmosphere');
(5, 12, 3, 132, '2025-09-28 09:45:25', 37, 131, 178, 'Friendly staff and quick service');
(6, 144, 155, 90, '2025-01-16 02:49:27', 39, 45, 35, 'Friendly staff and quick service');
(7, 195, 122, 227, '2025-06-04 11:09:10', 43, 77, 104, 'Great food and atmosphere');
(8, 238, 216, 103, '2025-08-30 13:21:12', 56, 89, 130, 'Friendly staff and quick service');
(9, 63, 27, 238, '2025-07-24 02:53:45', 75, 99, 155, 'Friendly staff and quick service');
(10, 37, 79, 57, '2025-02-23 13:41:20', 23, 12, 200, 'Cozy ambiance with delicious menu options');
(11, 160, 87, 95, '2025-05-06 13:03:25', 8, 46, 210, 'Cozy ambiance with delicious menu options');
(12, 136, 155, 167, '2025-02-06 08:16:31', 44, 94, 125, 'Cozy ambiance with delicious menu options');
(13, 240, 163, 208, '2025-10-27 16:30:38', 53, 4, 108, 'Great food and atmosphere');
(14, 46, 143, 246, '2025-01-05 08:46:55', 56, 140, 152, 'Cozy ambiance with delicious menu options');
(15, 146, 95, 233, '2025-01-14 13:54:14', 5, 49, 203, 'Great food and atmosphere');
(16, 186, 51, 265, '2025-03-02 14:36:21', 41, 107, 118, 'Friendly staff and quick service');
(17, 122, 221, 152, '2025-11-07 09:51:41', 61, 90, 184, 'Friendly staff and quick service');
(18, 63, 181, 59, '2025-11-28 01:34:26', 43, 90, 217, 'Great food and atmosphere');
(19, 207, 225, 128, '2025-10-15 23:31:49', 63, 131, 41, 'Cozy ambiance with delicious menu options');
(20, 216, 178, 105, '2025-06-23 21:39:36', 43, 120, 226, 'Friendly staff and quick service');
(21, 170, 81, 57, '2025-09-02 11:37:00', 73, 107, 144, 'Cozy ambiance with delicious menu options');
(22, 212, 144, 294, '2024-12-12 21:07:40', 26, 11, 119, 'Friendly staff and quick service');
(23, 143, 38, 119, '2025-04-11 23:51:11', 65, 137, 21, 'Cozy ambiance with delicious menu options');
(24, 220, 55, 96, '2025-08-04 21:22:37', 71, 137, 167, 'Cozy ambiance with delicious menu options');
(25, 180, 180, 225, '2025-07-06 09:46:29', 34, 77, 45, 'Friendly staff and quick service');
(26, 160, 31, 197, '2025-05-28 18:28:37', 24, 121, 101, 'Cozy ambiance with delicious menu options');
(27, 215, 119, 184, '2025-05-11 20:26:40', 70, 79, 224, 'Cozy ambiance with delicious menu options');
(28, 129, 176, 198, '2025-10-10 12:59:04', 4, 85, 154, 'Cozy ambiance with delicious menu options');
(29, 40, 172, 113, '2024-12-14 23:24:40', 14, 150, 175, 'Great food and atmosphere');
(30, 121, 95, 199, '2025-02-04 15:52:43', 7, 73, 209, 'Friendly staff and quick service');
(31, 182, 216, 247, '2025-05-10 22:51:59', 50, 7, 233, 'Friendly staff and quick service');
(32, 93, 60, 224, '2025-11-19 13:24:11', 49, 93, 95, 'Friendly staff and quick service');
(33, 164, 66, 71, '2025-04-02 01:48:24', 42, 101, 209, 'Friendly staff and quick service');
(34, 187, 257, 145, '2025-09-15 13:35:51', 73, 105, 188, 'Great food and atmosphere');
