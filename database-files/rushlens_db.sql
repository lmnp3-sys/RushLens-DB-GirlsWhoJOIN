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
    building VARCHAR(100) NOT NULL,
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
INSERT INTO Location (location_id, name, address, building, floor, location_type) 
VALUES
(1, 'Popeyes', '360 Huntington Ave, Boston, MA 02115', 'Curry Student Center', 1, 'Fast-Food');
(2, 'Starbucks', '360 Huntington Ave, Boston, MA 02115', 'Curry Student Center', 1, 'Cafe');
(3, 'D''Angelo', '360 Huntington Ave, Boston, MA 02115', 'Curry Student Center', 1, 'Fast-Food');
(4, 'Sal''Pizza', '360 Huntington Ave, Boston, MA 02115', 'Curry Student Center', 1, 'Fast-Food');
(5, 'Halal Shack', '360 Huntington Ave, Boston, MA 02115', 'Curry Student Center', 1, 'Fast-Food');
(6, 'Dunkin''', '360 Huntington Ave, Boston, MA 02115', 'Hayden Hall', 1, 'Cafe');
(7, 'Dunkin''', '115 Forsyth St, Boston, MA 02115', 'Shillman Hall', 1, 'Cafe');
(8, 'Saxbys Northeastern', '815 Columbus Ave, Boston, MA 02115', 'EXP', 2, 'Cafe');
(9, 'Subway', 'Leon St, Boston, MA 02115', 'Ryder Hall', 1, 'Fast-Food');
(10, 'Kigo Kitchen', '360 Huntington Ave, Boston, MA 02115', 'Curry Student Center', 1, 'Fast-Food');
(11, 'Equator Coffees', '360 Huntington Ave, Boston, MA 02115', 'Snell Library', 1, 'Cafe');
(12, 'Juicygreens', '1155 Tremont St, Boston, MA 02115', 'International Village', 1, 'Drinks');
(13, 'Fuel America', '815 Columbus Ave, Boston, MA 02115', 'ISEC', 1, 'Cafe');
(14, '', '95456 Mallory Street', 'PO Box 43900', 'PO Box 41674', '');
(15, '', '5868 Russell Plaza', '14th Floor', 'Suite 48', '');
(16, '', '1758 Mitchell Place', 'Suite 92', 'Suite 6', '');
(17, '', '93 Walton Avenue', 'Suite 94', 'PO Box 84021', '');
(18, '', '7390 Fairview Street', '9th Floor', 'Room 179', '');
(19, '', '086 John Wall Park', '17th Floor', '10th Floor', '');
(20, '', '42608 Eggendart Road', 'Room 994', 'Apt 1028', '');
(21, '', '75 Beilfuss Crossing', 'PO Box 35334', 'Apt 176', '');
(22, '', '5586 Mcbride Pass', 'Room 1284', '20th Floor', '');
(23, '', '734 Utah Center', 'Apt 204', 'Suite 60', '');
(24, '', '653 Alpine Lane', 'Apt 1391', '2nd Floor', '');
(25, '', '802 Merrick Hill', 'Room 643', 'Apt 1476', '');
(26, '', '37045 Cody Court', 'Apt 1363', 'Room 825', '');
(27, '', '1 Ridgeway Alley', 'PO Box 57451', '2nd Floor', '');
(28, '', '626 Steensland Place', 'Suite 29', 'Room 1558', '');
(29, '', '6 Welch Pass', '13th Floor', '15th Floor', '');
(30, '', '060 Fallview Avenue', '5th Floor', 'Suite 45', '');


