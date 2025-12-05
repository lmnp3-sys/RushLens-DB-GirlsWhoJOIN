-- Location
INSERT INTO Location (location_id, name, address, building, floor, location_type)
VALUES
(1, 'Curry Student Center', '360 Huntington Ave', 'Curry', '1st Floor', 'dining'),
(2, 'Curry Student Center', '360 Huntington Ave', 'Curry', '2nd Floor', 'study'),
(3, 'Curry Student Center', '360 Huntington Ave', 'Curry', 'Basement', 'service'),
(4, 'Snell Library', '376 Huntington Ave', 'Snell', '1st Floor', 'study'),
(5, 'Snell Library', '376 Huntington Ave', 'Snell', '2nd Floor', 'quiet_study'),
(6, 'Snell Library', '376 Huntington Ave', 'Snell', '3rd Floor', 'quiet_study'),
(7, 'ISEC', '805 Columbus Ave', 'ISEC', 'Ground Level', 'study'),
(8, 'ISEC', '805 Columbus Ave', 'ISEC', '2nd Floor', 'classroom'),
(9, 'Marino Recreation Center', '369 Huntington Ave', 'Marino', '1st Floor', 'fitness'),
(10,'Marino Recreationa Center', '369 Huntington Ave', 'Marino', '2nd Floor', 'fitness'),
(11,'Ryder Hall', '360 Huntington Ave', 'Ryder Hall', '1st Floor', 'dining'),
(12,'Ryder Hall', '360 Huntington Ave', 'Ryder Hall', '2nd Floor', 'classroom'),
(13,'Richards Hall', '360 Huntington Ave', 'Richards', 'Basement', 'classroom'),
(14,'Richards Hall', '360 Huntington Ave', 'Richards', '1st Floor', 'classroom'),
(15,'Richards Hall', '360 Huntington Ave', 'Richards', '2nd Floor', 'classroom'),
(16,'Shillman Hall', '115 Forsyth St', 'Shillman', '1st Floor', 'classroom'),
(17,'Shillman Hall', '115 Forsyth St', 'Shillman', '2nd Floor', 'classroom'),
(18,'EXP Research Center', '815 Columbus Ave', 'EXP', '1st Floor', 'innovation'),
(19,'EXP Research Center', '815 Columbus Ave', 'EXP', '2nd Floor', 'lab'),
(20,'EXP Research Center', '815 Columbus Ave', 'EXP', '3rd Floor', 'classroom'),
(21,'Columbus Parking Garage', '795 Columbus Ave', 'Columbus Garage', 'Ground Level', 'service'),
(22,'East Village', '291 St. Botolph St', 'East Village', 'Lobby', 'service'),
(23,'East Village', '291 St. Botolph St', 'East Village', '17th Floor', 'study'),
(24,'Dodge Hall', '360 Huntington Ave', 'Dodge Hall', 'Ground Level', 'classroom'),
(25,'Dodge Hall', '360 Huntington Ave', 'Dodge Hall', '2nd Floor', 'classroom'),
(26,'Forsyth Building', '70 Forsyth St', 'Forsyth Building', '1st Floor', 'classroom'),
(27,'Forsyth Building', '70 Forsyth St', 'Forsyth Building', '2nd Floor', 'classroom'),
(28,'Kariotis Hall', '360 Huntington Ave', 'Kariotis Hall', '1st Floor', 'lab'),
(29,'Kariotis Hall', '360 Huntington Ave', 'Kariotis Hall', '2nd Floor', 'lab'),
(30,'Snell Engineering', '110 Forsyth St', 'Snell Engineering', '1st Floor', 'lab'),
(31,'Snell Engineering', '110 Forsyth St', 'Snell Engineering', '2nd Floor', 'classroom'),
(32,'Robinson Hall', '360 Huntington Ave', 'Robinson', '1st Floor', 'classroom'),
(33,'Robinson Hall', '360 Huntington Ave', 'Robinson', '2nd Floor', 'classroom'),
(34,'Matthews Arena', '238 St. Botolph St', 'Matthews', 'Concourse', 'service'),
(35,'Matthews Arena', '238 St. Botolph St', 'Matthews', 'Basement', 'service'),
(36,'LightView Apartments', '744 Columbus Ave', 'LightView', 'Lobby', 'service'),
(37,'West Village F', '40A Leon St', 'WVF', 'Lobby', 'study'),
(38,'West Village G', '450 Parker St', 'WVG', '1st Floor', 'study'),
(39,'West Village H', '440 Huntington Ave', 'WVH', 'Lobby', 'study'),
(40,'Rubenstein Hall', '407 Huntington Ave', 'Rubenstein', '1st Floor', 'classroom');

INSERT INTO Store (store_id, location_id, store_name, store_type, status, capacity)
VALUES
(1, 1, 'Curry Starbucks', 'cafe', 'open', 40),
(2, 1, 'Curry Taco Bell', 'dining', 'busy', 50),
(3, 2, 'Curry Upstairs Study Pods', 'study', 'open', 80),
(4, 4, 'Snell First Floor Pods', 'study', 'open', 120),
(5, 5, 'Snell Quiet Study 2nd Floor', 'quiet_study', 'open', 75),
(6, 6, 'Snell Silent Room', 'quiet_study', 'closed', 60),
(7, 7, 'ISEC Cafe', 'dining', 'open', 45),
(8, 8, 'ISEC Classroom Lounge', 'study', 'open', 25),
(9, 9, 'Marino Cardio Floor', 'fitness', 'busy', 200),
(10, 10, 'Marino Weight Room', 'fitness', 'open', 150),
(11, 12, 'Ryder Hall Eatery', 'dining', 'open', 40),
(12, 14, 'Richards Lecture Hall', 'classroom', 'open', 60),
(13, 15, 'Richards Computer Lab', 'lab', 'open', 55),
(14, 16, 'Shillman Lounge', 'study', 'open', 30),
(15, 17, 'Shillman Hall Classroom Cluster', 'classroom', 'open', 40),
(16, 18, 'EXP Robotics Lab Lobby', 'innovation', 'open', 50),
(17, 19, 'EXP 2nd Floor Study Lounge', 'study', 'open', 35),
(18, 20, 'EXP Classroom Wing', 'classroom', 'open', 80),
(19, 21, 'Columbus Bike Parking', 'service', 'open', 20),
(20, 22, 'East Village Lobby Study', 'study', 'open', 25),
(21, 23, 'East Village Sky Lounge', 'study', 'open', 45),
(22, 24, 'Dodge Hall Atrium', 'study', 'open', 40),
(23, 25, 'Dodge 2nd Floor Lounge', 'study', 'open', 30),
(24, 26, 'Forsyth 1st Floor Classroom Cluster', 'classroom', 'open', 50),
(25, 27, 'Forsyth 2nd Floor Study Spots', 'study', 'open', 35),
(26, 28, 'Kariotis Hardware Lab', 'lab', 'open', 55),
(27, 29, 'Kariotis Design Studio', 'innovation', 'open', 40),
(28, 30, 'Snell Engineering Lobby', 'study', 'open', 60),
(29, 31, 'Snell Engineering Lab Wing', 'lab', 'open', 70),
(30, 32, 'Robinson Hall Study Corner', 'study', 'open', 20),
(31, 33, 'Robinson Lecture Stairs', 'service', 'open', 15),
(32, 34, 'Matthews Arena Concourse', 'service', 'busy', 250),
(33, 35, 'Matthews Basement Gym', 'fitness', 'open', 30),
(34, 36, 'LightView Lobby Study', 'study', 'open', 25),
(35, 37, 'WVF Lobby Center', 'study', 'open', 35),
(36, 38, 'WVG 1st Floor Study Space', 'study', 'open', 45),
(37, 39, 'WVH Lobby Pods', 'study', 'open', 30),
(38, 40, 'Rubenstein Study Room', 'study', 'open', 40),
(39, 3, 'Curry Basement Commuter Lounge', 'study', 'open', 60);

INSERT INTO Customers (customer_id, FName, LName, store_id, neuID)
VALUES
(1, 'Minnie', 'LePham', 1, '00124567'),
(2, 'Mai', 'Nguyen', 2, '00239485'),
(3, 'Vai', 'Unnithan', 3, '00938475'),
(4, 'Shreya', 'Selvaraju', 4, '00399284'),
(5, 'Mia', 'Sullivan', 5, '00748293'),
(6, 'Ethan', 'Nguyen', 6, '00298471'),
(7, 'Isabella', 'Martinez', 7, '00457293'),
(8, 'Aiden', 'Kim', 8, '00849273'),
(9, 'Zoe', 'Johnson', 9, '00923451'),
(10, 'Lucas', 'White', 10, '00748912'),
(11, 'Ella', 'Kapoor', 11, '00238495'),
(12, 'Benjamin', 'Lopez', 12, '00499822'),
(13, 'Charlotte', 'Singh', 13, '00857392'),
(14, 'Henry', 'Brown', 14, '00628475'),
(15, 'Amelia', 'Ahmed', 15, '00592847'),
(16, 'James', 'Clark', 16, '00384729'),
(17, 'Harper', 'Miller', 17, '00192847'),
(18, 'Alexander', 'Rivera', 18, '00918374'),
(19, 'Evelyn', 'Garcia', 19, '00294837'),
(20, 'Jack', 'Hernandez', 20, '00958273'),
(21, 'Grace', 'Kim', 21, '00738294'),
(22, 'William', 'Allen', 22, '00394827'),
(23, 'Chloe', 'Parker', 23, '00649283'),
(24, 'Michael', 'Thompson', 24, '00847392'),
(25, 'Abigail', 'Evans', 25, '00938274'),
(26, 'Elijah', 'Scott', 26, '00298374'),
(27, 'Emily', 'Taylor', 27, '00194827'),
(28, 'Daniel', 'Moore', 28, '00482937'),
(29, 'Aria', 'Bennett', 29, '00582739'),
(30, 'Matthew', 'Wong', 30, '00849283'),
(31, 'Scarlett', 'Diaz', 31, '00648392'),
(32, 'Joseph', 'King', 32, '00718293'),
(33, 'Victoria', 'Romero', 33, '00948273'),
(34, 'David', 'Gray', 34, '00192384'),
(35, 'Nora', 'Jimenez', 35, '00628394');


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


-- StoreDailyStats
INSERT INTO StoreDailyStats (stats_id, traffic_id, store_id, date, daily_visitors, peak_hour, lowest_hour, page_views)
VALUES
(1, 9, 31, '2025-11-15', 273, 13, 23, 762),
(2, 16, 10, '2025-12-01', 208, 12, 22, 335),
(3, 19, 28, '2025-11-30', 185, 12, 6, 217),
(4, 5, 32, '2025-11-13', 415, 18, 7, 739),
(5, 44, 24, '2025-11-16', 107, 17, 6, 187),
(6, 26, 19, '2025-11-05', 409, 12, 23, 787),
(7, 26, 16, '2025-12-02', 493, 18, 23, 1169),
(8, 11, 22, '2025-11-20', 380, 12, 23, 637),
(9, 41, 18, '2025-11-07', 282, 13, 6, 573),
(10, 54, 34, '2025-11-27', 363, 13, 7, 1030),
(11, 60, 22, '2025-11-30', 258, 17, 6, 291),
(12, 44, 17, '2025-11-16', 384, 17, 6, 757),
(13, 41, 20, '2025-11-04', 102, 12, 6, 126),
(14, 55, 1, '2025-11-22', 205, 13, 7, 602),
(15, 12, 25, '2025-11-22', 311, 12, 23, 438),
(16, 56, 26, '2025-11-04', 365, 12, 7, 935),
(17, 51, 9, '2025-12-01', 299, 11, 7, 712),
(18, 15, 25, '2025-11-18', 369, 17, 7, 520),
(19, 48, 20, '2025-11-14', 442, 18, 22, 1265),
(20, 37, 30, '2025-11-28', 148, 11, 23, 220),
(21, 15, 2, '2025-11-07', 210, 13, 23, 296),
(22, 40, 6, '2025-11-15', 251, 13, 23, 716),
(23, 13, 10, '2025-11-21', 433, 17, 22, 694),
(24, 23, 1, '2025-11-11', 320, 17, 7, 717),
(25, 48, 17, '2025-11-05', 341, 18, 6, 809),
(26, 14, 25, '2025-11-21', 475, 17, 6, 853),
(27, 20, 17, '2025-11-26', 178, 11, 7, 238),
(28, 32, 28, '2025-11-08', 385, 12, 6, 877),
(29, 57, 16, '2025-11-14', 423, 13, 6, 797),
(30, 10, 19, '2025-11-11', 497, 13, 7, 972);

-- MaintenanceLog
INSERT INTO MaintenanceLog (maintenance_id, sensor_id, performedBy, actionType, actionDate, notes)
VALUES
(1, 15, 'John', 'Repair', '2025-11-10', 'Fixed loose mounting bracket'),
(2, 16, 'Jordan', 'Emergency Fix', '2025-11-08', 'Fixed critical connectivity failure'),
(3, 26, 'Chris', 'Diagnostic Test', '2025-11-11', 'Full diagnostic scan completed'),
(4, 14, 'Sarah', 'Installation', '2025-10-08', 'Initial setup and network connection established'),
(5, 18, 'David', 'Diagnostic Test', '2025-11-03', 'Performance metrics within acceptable range'),
(6, 18, 'James', 'Routine Check', '2025-10-18', 'Sensor readings within normal range'),
(7, 17, 'James', 'Routine Check', '2025-11-03', 'No issues detected during inspection'),
(8, 25, 'James', 'Software Update', '2025-10-09', 'Latest firmware installed and verified'),
(9, 19, 'Jamie', 'Software Update', '2025-11-01', 'Latest firmware installed and verified'),
(10, 17, 'Casey', 'Network Configuration', '2025-10-13', 'Connected to backup WiFi network'),
(11, 5, 'Morgan', 'Cleaning', '2025-11-07', 'Exterior wiped down, vents cleared'),
(12, 6, 'Alex', 'Installation', '2025-11-12', 'Sensor deployed and activated'),
(13, 5, 'Casey', 'Routine Check', '2025-11-22', 'No issues detected during inspection'),
(14, 6, 'Sarah', 'Installation', '2025-10-07', 'Initial setup and network connection established'),
(15, 20, 'John', 'Calibration', '2025-11-14', 'Calibration settings updated and tested'),
(16, 18, 'Lisa', 'Routine Check', '2025-10-15', 'No issues detected during inspection'),
(17, 8, 'John', 'Repair', '2025-11-13', 'Replaced damaged lens cover'),
(18, 32, 'Jamie', 'Cleaning', '2025-10-16', 'Removed debris from sensor area'),
(19, 14, 'Michael', 'Battery Replacement', '2025-10-16', 'Battery at 15%, replaced with new unit'),
(20, 12, 'Sam', 'Software Update', '2025-11-29', 'Software upgraded, system rebooted'),
(21, 14, 'Emily', 'Cleaning', '2025-11-08', 'Lens polished for clarity'),
(22, 2, 'John', 'Emergency Fix', '2025-11-11', 'Fixed critical connectivity failure'),
(23, 32, 'Alex', 'Network Configuration', '2025-10-13', 'Network diagnostics completed successfully'),
(24, 3, 'Taylor', 'Network Configuration', '2025-10-14', 'Network settings reconfigured'),
(25, 29, 'Sarah', 'Cleaning', '2025-10-14', 'Cleaned dust from lens and housing'),
(26, 12, 'Chris', 'Routine Check', '2025-11-03', 'All systems functioning normally'),
(27, 31, 'Emily', 'Emergency Fix', '2025-11-13', 'Emergency power issue resolved'),
(28, 35, 'Lisa', 'Emergency Fix', '2025-11-27', 'Restored offline sensor to operation'),
(29, 5, 'Michael', 'Diagnostic Test', '2025-11-27', 'Hardware and software diagnostics successful'),
(30, 19, 'Sarah', 'Battery Replacement', '2025-11-14', 'Proactive battery swap completed');


--DataQualityCheck
INSERT INTO DataQualityCheck (check_id, sensor_id, checkTime, status)
VALUES
(1, 7, '2025-11-19 08:53:44', 0),
(2, 9, '2025-11-20 20:27:46', 1),
(3, 13, '2025-11-25 05:53:26', 1),
(4, 25, '2025-11-21 14:40:03', 0),
(5, 9, '2025-11-05 07:12:33', 0),
(6, 12, '2025-11-24 15:36:11', 1),
(7, 26, '2025-11-24 03:01:15', 1),
(8, 33, '2025-11-10 00:43:38', 1),
(9, 24, '2025-11-08 08:10:25', 1),
(10, 1, '2025-11-15 16:58:04', 0),
(11, 34, '2025-11-10 11:57:58', 1),
(12, 19, '2025-12-02 22:24:06', 1),
(13, 8, '2025-11-23 13:49:46', 1),
(14, 34, '2025-11-24 14:30:24', 1),
(15, 33, '2025-11-23 09:45:37', 1),
(16, 34, '2025-11-22 17:19:25', 0),
(17, 2, '2025-11-10 07:59:47', 0),
(18, 2, '2025-12-02 16:48:32', 1),
(19, 20, '2025-11-17 03:49:23', 1),
(20, 27, '2025-11-20 17:44:51', 0),
(21, 16, '2025-12-04 08:45:16', 0),
(22, 32, '2025-11-30 21:25:46', 1),
(23, 7, '2025-11-18 17:58:12', 1),
(24, 13, '2025-11-17 08:39:07', 1),
(25, 2, '2025-11-12 22:17:55', 1),
(26, 27, '2025-11-17 12:07:30', 0),
(27, 26, '2025-11-08 16:32:31', 1),
(28, 7, '2025-11-22 07:14:51', 1),
(29, 6, '2025-11-27 23:23:30', 1),
(30, 33, '2025-11-14 05:36:35', 1);


-- Bridge Tables

INSERT INTO CustomerInput (input_id, customer_id, input_notes) 
VALUES
(1, 3, 'Morning rush report'),
(1, 7, 'Confirmed moderate traffic'),
(1, 10, 'Cross-checked wait time'),
(2, 1, 'Study area update'),
(2, 4, 'Verified occupancy'),
(2, 9, 'Reported crowd buildup'),
(3, 5, 'Low-traffic morning'),
(3, 11, 'Confirmed empty tables'),
(3, 8, 'Quiet start to the day'),
(4, 2, 'Line forming early'),
(4, 6, 'Verified accurate reading'),
(4, 12, 'High morning demand'),
(5, 3, 'Steady flow of students'),
(5, 7, 'Confirmed steady traffic'),
(5, 9, 'Dining not too full'),
(6, 1, 'Rush period increasing'),
(6, 8, 'Sensor match confirmed'),
(6, 10, 'Crowds rising before class'),
(7, 2, 'Quiet hallway'),
(7, 5, 'Sensor anomaly matched'),
(7, 11, 'Reported near-empty lounge'),
(8, 4, 'Early Snell activity'),
(8, 9, 'Study pods beginning to fill'),
(8, 12, 'Verified pod availability'),
(9, 6, 'Morning gym light usage'),
(9, 8, 'No wait times observed'),
(9, 11, 'Student movement low'),
(10, 5, 'Dining opening hour check'),
(10, 7, 'Light early traffic'),
(10, 12, 'Confirmed low levels'),

(11, 10, 'Lunch traffic forming'),
(11, 14, 'Moderate wait at Curry'),
(11, 18, 'Dining hall filling'),
(12, 9, 'Reported growing lines'),
(12, 11, 'Lunch hour spike'),
(12, 16, 'Crowds peak around noon'),
(13, 13, 'Seats filling fast'),
(13, 15, 'High lunchtime load'),
(13, 20, 'Recorded heavy usage'),
(14, 12, 'Snell pods unavailable'),
(14, 18, 'Quiet rooms busy'),
(14, 22, 'Study space shortage'),
(15, 14, 'Dining rush observed'),
(15, 19, 'Peak crowds detected'),
(15, 21, 'Confirmed crowding'),
(16, 15, 'Afternoon slowdown'),
(16, 23, 'Traffic leveling off'),
(16, 20, 'Steady afternoon pattern'),
(17, 11, 'Reported gym peak'),
(17, 17, 'Crowd before evening classes'),
(17, 22, 'Hallway congestion increasing'),
(18, 14, 'Study area moderately full'),
(18, 16, 'Sensor-match confirmed'),
(18, 25, 'Evening transition period'),
(19, 12, 'Dining traffic persists'),
(19, 21, 'Lines remain long'),
(19, 23, 'Crowds steady'),
(20, 17, 'Study pods busy'),
(20, 22, 'Quiet spaces rare'),
(20, 24, 'Confirmed usage peak'),

(21, 18, 'Evening quiet period'),
(21, 20, 'Crowds dropping'),
(21, 26, 'Verified drop-off'),
(22, 21, 'Post-dinner emptiness'),
(22, 27, 'Pods mostly open'),
(22, 29, 'Study rooms available'),
(23, 19, 'Gym post-peak'),
(23, 25, 'Traffic calming'),
(23, 30, 'Evening steady pattern'),
(24, 22, 'Quiet Snell hour'),
(24, 28, 'Reported low demand'),
(24, 33, 'Near closing time'),
(25, 17, 'Dining nearly empty'),
(25, 21, 'Sensor + user match'),
(25, 34, 'Low foot traffic'),
(26, 23, 'Almost no movement'),
(26, 31, 'Quiet floor'),
(26, 35, 'Late-night lull'),
(27, 26, 'Students leaving'),
(27, 29, 'Traffic dissipating'),
(27, 32, 'Verified emptying'),
(28, 20, 'Study pods mostly empty'),
(28, 30, 'Snell calm'),
(28, 36, 'Quiet late-night routine'),
(29, 18, 'Minimal movement'),
(29, 24, 'Consistent quiet trend'),
(29, 33, 'Quiet hour recorded'),
(30, 25, 'End of day report'),
(30, 28, 'Occupancy near zero'),
(30, 37, 'Closing time approaching'),

(11, 15, 'Additional lunch report'),
(11, 19, 'Busy midday condition'),
(12, 20, 'Lunchtime crowd tracking'),
(13, 14, 'Dense seating environment'),
(14, 23, 'Snell spaces full'),
(15, 24, 'Even Curry packed'),
(16, 27, 'Afternoon peak observed'),
(17, 28, 'Gym movement rising'),
(18, 30, 'Evening class change'),
(19, 31, 'Dining still active'),
(20, 32, 'Study lounges occupied'),
(21, 33, 'Quiet return'),
(22, 34, 'Evening study boost'),
(23, 35, 'Post-class wave'),
(24, 36, 'Snell nearly empty'),
(25, 37, 'Curry winding down'),
(26, 28, 'Late evening activity'),
(27, 30, 'Minimal traffic'),
(28, 32, 'Traffic bottomed out'),
(29, 34, 'Quiet zone confirmed'),
(30, 36, 'Last-minute reports'),

(11, 16, 'Lunch hour correction'),
(12, 22, 'Second reading alignment'),
(13, 17, 'Seating stabilized'),
(14, 19, 'Crowds near max'),
(15, 23, 'Consistent readings'),
(16, 29, 'Late afternoon spike'),
(17, 33, 'Gym warming up'),
(18, 37, 'Evening stable'),
(19, 28, 'Dining cooling'),
(20, 35, 'Pods nearly free'),
(21, 31, 'Sensor-verified lull'),
(22, 36, 'Evening bridge effect'),
(23, 32, 'Low-movement verification'),
(24, 37, 'Closing-time alignment'),
(25, 33, 'Dining drifting down'),
(26, 30, 'Post-study calm'),
(27, 34, 'Empty hallways'),
(28, 33, 'Night study pattern'),
(29, 35, 'Sensor-late match'),
(30, 36, 'Shutdown approach');

INSERT INTO StoreInput (store_id, input_id, store_notes) 
VALUES
(1, 1, 'Morning Starbucks rush forming'),
(2, 1, 'Curry dining steadily filling'),
(4, 2, 'Snell pods lightly occupied'),
(5, 2, 'Quiet study morning traffic'),
(3, 3, 'Study pods opening'),
(6, 3, 'Silent room empty'),
(7, 4, 'ISEC cafe early line'),
(8, 4, 'Classroom lounge movement'),
(9, 5, 'Marino cardio sees morning spike'),
(10, 5, 'Weights area semi-busy'),
(11, 6, 'Ryder eatery light traffic'),
(12, 6, 'Richards lecture halls filling'),
(13, 7, 'Richards computer lab warming up'),
(14, 7, 'Shillman lounge early crowd'),
(15, 8, 'Shillman cluster building traffic'),
(16, 8, 'EXP robotics space light use'),
(17, 9, 'EXP study area activating'),
(18, 9, 'EXP classroom wing mild flow'),
(19, 10, 'Bike parking morning activity'),
(20, 10, 'East Village lounge half full'),

(21, 11, 'Sky lounge getting busy'),
(22, 11, 'Dodge atrium mid-morning use'),
(23, 12, 'Dodge 2nd floor low activity'),
(24, 12, 'Forsyth classrooms filling'),
(25, 13, 'Forsyth 2nd floor solid activity'),
(26, 13, 'Kariotis hardware lab active'),
(27, 14, 'Kariotis studio sees use'),
(28, 14, 'Engineering lobby increased'),
(29, 15, 'Engineering lab wing steady'),
(30, 15, 'Robinson corner students gathering'),
(31, 16, 'Robinson stairs transitioning crowd'),
(32, 16, 'Matthews concourse active'),
(33, 17, 'Matthews gym morning rush'),
(34, 17, 'LightView lobby moderate traffic'),
(35, 18, 'WVF lobby morning activity'),
(36, 18, 'WVG study area light'),
(37, 19, 'WVH pods opening'),
(38, 19, 'Rubenstein study stable'),
(39, 20, 'Curry commuter lounge increasing traffic'),
(1, 20, 'Starbucks line lengthening'),

(2, 21, 'Lunch rush starting'),
(3, 21, 'Upstairs pods packed'),
(4, 22, 'Snell pods fully occupied'),
(5, 22, 'Quiet study crowded'),
(6, 23, 'Silent room moderate'),
(7, 23, 'ISEC cafe heavy line'),
(8, 24, 'Classroom lounge midday'),
(9, 24, 'Marino packed'),
(10, 25, 'Weights area high demand'),
(11, 25, 'Ryder eatery at peak'),
(12, 26, 'Richards lecture transitions busy'),
(13, 26, 'Computer lab at capacity'),
(14, 27, 'Shillman lounge highly active'),
(15, 27, 'Classroom cluster packed'),
(16, 28, 'Robotics wing busy'),
(17, 28, 'EXP study at lunchtime high'),
(18, 29, 'EXP classrooms full'),
(19, 29, 'Bike parking stressed'),
(20, 30, 'EV lounge crowded'),
(21, 30, 'Sky lounge over capacity'),

(22, 11, 'Midday Dodge atrium packed'),
(23, 12, 'Dodge second floor cluster full'),
(24, 13, 'Forsyth classrooms switching'),
(25, 14, 'Second floor Forsyth gridlock'),
(26, 15, 'Kariotis hardware peak'),
(27, 16, 'Design studio busy'),
(28, 17, 'Eng lobby lunchtime buzz'),
(29, 18, 'Eng labs at full capacity'),
(30, 19, 'Robinson quiet'),
(31, 20, 'Stairs moderate crowd'),
(32, 21, 'Matthews concourse heavy'),
(33, 22, 'Gym high use'),
(34, 23, 'LightView seeing steady flow'),
(35, 24, 'WVF gathering students'),
(36, 25, 'WVG full of group study'),
(37, 26, 'WVH pods scarce'),
(38, 27, 'Rubenstein mid usage'),
(39, 28, 'Commuter lounge high'),
(1, 29, 'Starbucks overflowing'),
(2, 30, 'Curry dining maxed out'),

(3, 9, 'Pods regained availability'),
(4, 10, 'Snell filling again'),
(5, 11, 'Quiet study steady'),
(6, 12, 'Silent room late lunch occupancy'),
(7, 13, 'ISEC cafe dip'),
(8, 14, 'Classroom lounge calmer'),
(9, 15, 'Marino receding'),
(10, 16, 'Weights manageable'),
(11, 17, 'Ryder lower influx'),
(12, 18, 'Richards average'),
(13, 19, 'Computer lab stable'),
(14, 20, 'Shillman quiet moment'),
(15, 21, 'Cluster at half'),
(16, 22, 'Robotics steady'),
(17, 23, 'EXP study still used'),
(18, 24, 'EXP classrooms emptying'),
(19, 25, 'Bike racks declining'),
(20, 26, 'EV lounge late afternoon'),
(21, 27, 'Sky lounge smoothing'),
(22, 28, 'Dodge atrium relaxing'),
(23, 29, 'Dodge 2nd calmer'),
(24, 30, 'Forsyth classrooms settle'),

(25, 1, 'Forsyth calmer now'),
(26, 2, 'Kariotis quiet'),
(27, 3, 'Design studio thinning'),
(28, 4, 'Engineering lobby light'),
(29, 5, 'Engineering labs near idle'),
(30, 6, 'Robinson quieter'),
(31, 7, 'Stairs almost empty'),
(32, 8, 'Matthews concourse cooling'),
(33, 9, 'Gym eased up'),
(34, 10, 'LightView quiet hour'),
(35, 11, 'WVF less traffic'),
(36, 12, 'WVG empty'),
(37, 13, 'WVH mostly quiet'),
(38, 14, 'Rubenstein nearly empty'),
(39, 15, 'Commuter lounge low'),
(1, 16, 'Starbucks steady'),
(2, 17, 'Dining winding down'),
(3, 18, 'Pods lightly used'),
(4, 19, 'Snell emptying'),
(5, 20, 'Quiet study open'),
(6, 21, 'Silent room nearly idle'),
(7, 22, 'ISEC closed soon'),
(8, 23, 'Classroom lounge closing'),
(9, 24, 'Marino final crowd drop'),
(10, 25, 'Weights section final lull');

INSERT INTO DataDerived (traffic_id, data_id, sensor_id, tracking_detail)
VALUES
(1, 3, 2, 'Morning entry sensor reading'),
(1, 7, 5, 'Matched low foot traffic'),
(1, 10, 3, 'Hallway movement minimal'),
(2, 4, 6, 'Early class change signal'),
(2, 8, 7, 'Light movement detected'),
(2, 12, 4, 'Consistent low occupancy'),
(3, 9, 8, 'Study area warming up'),
(3, 14, 9, 'Pods filling'),
(3, 18, 10, 'Moderate morning activity'),
(4, 11, 12, 'Dining ramp-up detected'),
(4, 16, 13, 'Traffic rising'),
(4, 20, 11, 'Sensor confirms foot traffic increase'),
(5, 13, 14, 'Pre-lunch buildup'),
(5, 19, 15, 'Traffic wave forming'),
(5, 24, 16, 'Crowd size increasing'),
(6, 6, 17, 'Snell movement spike'),
(6, 15, 18, 'Peak morning study space usage'),
(6, 22, 19, 'Occupancy trending upward'),
(7, 17, 20, 'Dining hall near capacity'),
(7, 23, 21, 'Lunch rush peak'),
(7, 28, 22, 'Sustained high foot traffic'),
(8, 12, 23, 'Campus transition period'),
(8, 18, 24, 'Hallway surge'),
(8, 27, 25, 'Observed class change activity'),
(9, 21, 26, 'Gym early crowd'),
(9, 25, 27, 'Sensors detect elevated movement'),
(9, 29, 28, 'Marino busy'),
(10, 14, 29, 'Study areas filling again'),
(10, 19, 30, 'Foot traffic stabilizing'),
(10, 26, 1, 'Movement fluctuating'),

(11, 7, 2, 'Lunch peak early'),
(11, 10, 4, 'Dining hall queue forming'),
(11, 15, 6, 'Snell traffic rising'),
(12, 9, 8, 'Pods remain active'),
(12, 14, 10, 'Quiet rooms full'),
(12, 18, 12, 'Crowded study spaces'),
(13, 20, 14, 'Dining warmup'),
(13, 24, 15, 'Line forming'),
(13, 30, 17, 'Match with sensor profile'),
(14, 16, 18, 'Lecture transition crowds'),
(14, 21, 19, 'Pod activity high'),
(14, 29, 22, 'Shillman busy'),
(15, 18, 23, 'Dining rush persists'),
(15, 22, 24, 'Foot traffic elevated'),
(15, 31, 25, 'Lunch-hour saturation'),
(16, 20, 26, 'Afternoon lull forming'),
(16, 26, 27, 'Crowds leveling'),
(16, 33, 28, 'Study area stabilizing'),
(17, 14, 29, 'Gym entering peak window'),
(17, 18, 30, 'Hallway motion steady'),
(17, 22, 1, 'Traffic stable at mid-afternoon'),
(18, 13, 3, 'Snell transitions light'),
(18, 19, 5, 'Afternoon pod usage steady'),
(18, 25, 7, 'Sensor confirms moderate activity'),
(19, 10, 9, 'Dining post-peak wave'),
(19, 18, 11, 'Crowds thinning'),
(19, 24, 13, 'Evening leveling pattern'),
(20, 11, 15, 'Study spaces gaining demand'),
(20, 17, 17, 'Evening study rush'),
(20, 23, 20, 'Pod area nearly full'),

(21, 5, 21, 'Evening low activity'),
(21, 8, 22, 'Transition to quiet hours'),
(21, 14, 23, 'Study spaces calming'),
(22, 6, 24, 'Dining nearly empty'),
(22, 10, 26, 'Quiet post-rush'),
(22, 18, 28, 'Pods readily available'),
(23, 12, 29, 'Gym late-night wave'),
(23, 16, 30, 'Movement sporadic'),
(23, 21, 1, 'Sensor matches foot traffic drop'),
(24, 17, 2, 'Late Snell activity minimal'),
(24, 19, 4, 'Hallway traffic low'),
(24, 28, 6, 'Quiet evening usage'),
(25, 14, 8, 'Dining nearly closed'),
(25, 20, 10, 'Crowds dispersed'),
(25, 30, 12, 'End-of-day consistency'),
(26, 13, 13, 'Minimal motion detected'),
(26, 18, 15, 'Calm transition'),
(26, 27, 16, 'Study floor quiet'),
(27, 11, 17, 'Low sensor readings'),
(27, 16, 19, 'Evening residual activity'),
(27, 25, 21, 'Foot traffic bottoming out'),
(28, 15, 23, 'Snell nearly silent'),
(28, 19, 24, 'A few students left'),
(28, 22, 26, 'Sensor stabilizing'),
(29, 18, 27, 'Nighttime quiet period'),
(29, 24, 29, 'Minimal readings detected'),
(29, 30, 30, 'End-of-night profile'),
(30, 12, 3, 'Closing time steady'),
(30, 20, 6, 'Final traffic sweep'),
(30, 28, 9, 'Sensors indicate shutdown'),

(3, 5, 11, 'Secondary morning reading'),
(4, 9, 13, 'Rounded crowd estimate'),
(6, 13, 16, 'Pod usage variation'),
(7, 17, 18, 'Lunch sensory spike'),
(8, 21, 20, 'Study movement confirmation'),
(9, 25, 22, 'Gym variability high'),
(10, 29, 24, 'Evening reshuffle'),
(11, 18, 26, 'Post-lunch smoothing'),
(12, 23, 27, 'Transition nearing end'),
(13, 27, 28, 'Dining traffic flattening'),
(14, 31, 29, 'Lecture movement slowing'),
(15, 34, 30, 'Pods regaining availability'),
(16, 37, 1, 'Shift toward evening calm'),
(17, 38, 3, 'Gym entering cooldown'),
(18, 40, 5, 'Low-motion evening'),
(19, 42, 7, 'Traffic below average'),
(20, 43, 9, 'Study area stabilization'),
(21, 44, 10, 'Near-silent hour'),
(22, 45, 12, 'Dining cleared out'),
(23, 46, 14, 'Night study trend'),
(24, 47, 16, 'Sensor confirms low activity'),
(25, 48, 18, 'End-of-day dining reading'),
(26, 49, 20, 'Very low study movement'),
(27, 50, 22, 'Foot traffic final decline'),
(28, 41, 23, 'Pod usage near zero'),
(29, 39, 25, 'Sensor drop-off detected'),
(30, 38, 27, 'Snell entering final low'),
(28, 32, 28, 'Late-night fluctuation'),
(22, 33, 29, 'Quiet dining night'),
(14, 35, 30, 'Shillman quiet stamp'),
(9, 26, 4, 'Secondary evening gym reading'),
(17, 29, 6, 'Hallway winding down'),
(5, 16, 8, 'Late lunch sensor check'),
(1, 2, 2, 'Final morning sync');
