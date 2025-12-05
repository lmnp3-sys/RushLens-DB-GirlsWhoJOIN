-- Location
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

--Sensor-Device 
INSERT INTO SensorDevice (sensor_id, store_id, sensorType, status, lastCalibrationDate, firmwareVersion,installDate)
VALUES
(1, 18,'pressure', true, '2025-05-13 15:39:33', 97, '2022-04-04 10:51:11')
(2,30,'pressure', true,'2025-03-26 13:30:41', 93, '2022-03-24 10:42:29')
(3,8, 'heat', false,'2025-11-19 02:53:18', 61,'2022-01-27 17:27:14')
(4,4, 'heat', true,'2025-03-05 18:21:23', 25,'2022-11-01 01:38:14')
(5,33, 'motion', false,'2025-08-29 10:52:53', 82,'2022-04-25 17:38:04')
(6,23,'motion', false,'2025-08-12 15:40:21', 43,'2022-11-17 11:29:21')
(7,4,'heat', true,'2025-09-28 03:23:57', 49,'2022-07-03 05:35:26')
(8,37,'motion', false,'2025-06-17 23:47:57', 81,'2022-04-28 08:53:22')
(9,37,"", false,'2025-09-14 17:57:51', 100, '2025-02-20 10:28:08')
(10,6,'heat', false,'2025-11-17 09:12:58', 74,'2024-05-20 08:10:56')
(11,39,'motion', false,'2025-07-01 22:59:20', 99,'2022-07-23 07:42:47')
(12,14,'heat', true,'2025-10-22 19:37:42', 11,'2023-07-22 07:38:25')
(13,4,'heat', true,'2025-07-28 12:47:45', 13,'2022-03-06 16:55:54')
(14,26,'pressure', true,'2024-12-23 00:04:03', 46,'2024-11-12 01:33:54')
(15,30,'motion', true,'2025-03-15 05:43:31', 25,'2022-05-03 06:57:35')
(16,34,'pressure',false,'2025-06-26 03:4z:11', 60,'2025-03-28 01:18:13')
(17,37,"", false,'2025-07-01 22:56:37', 89,'2022-10-05 02:20:58')
(18,25,'motion', false,'2025-04-19 20:57:52', 59,'2022-05-30 16:35:17')
(19,16,'heat', true,'2024-12-15 00:16:47', 94,'2023-04-20 16:57:14')
(20,34,'pressure', false,'2025-06-04 20:53:21', 99,'2022-05-22 20:27:54')
(21,28," ", true,'2025-04-25 15:18:11', 19,'2023-05-21 14:09:48')
(22,3,'motion', true,'2025-06-06 15:37:58', 79,'2023-01-14 07:14:53')
(23,2,'pressure', true,'2025-10-08 12:06:29',5 6,'2024-02-22 00:37:39')
(24,16,'motion', true,'2025-08-24 09:11:16', 23, '2025-05-04 03:49:02')
(25,5,'pressure', false,'2025-01-01 14:32:49' , 90, '2024-11-06 11:37:44')
(26,28,'heat', true,'2025-07-26 07:33:40',77,'2024-05-12 15:40:41')
(27,7,"", true,'2025-09-29 14:39:15', 38 ,'2022-11-02 20:25:16')
(28,6,"", false,'2025-09-16 20:24:12', 57,'2024-08-23 19:46:40')
(29,20,'heat', false,'2025-07-30 20:19:46', 90,'2022-07-03 05:55:55')
(30,2,'motion', false,'2025-08-07 21:55:37', 48,'2023-01-10 01:59:22')

--System Alerts
INSERT INTO SystemAlerts (alert_id, sensor_id, alertType, severity, timeStamp, resolved)
VALUES
(1, 30, 'info', 'high', '2025-04-21 14:19:04', false),
(2, 35, 'warning', 'medium', '2025-11-04 00:52:31', true),
(3, 31, 'debug', 'high', '2025-05-16 05:56:15', false)
(4, 45, 'alarm', 'high', '2025-10-22 12:10:02', true),
(5, 33, 'alarm', 'low', '2025-06-12 15:18:43', true),
(6, 6, 'debug', 'low', '2025-05-21 03:32:41', false),
(7, 25, 'sensor', 'high', '2025-10-01 06:32:29', true),
(8, 48, 'counter', 'critical', '2025-09-08 18:47:45', true),
(9, 44, 'error', 'medium', '2025-02-03 14:57:29', false),
(10, 58, 'info', 'critical', '2025-08-14 22:00:00', true),
(11, 9, 'debug', 'severe', '2025-04-14 22:56:04', false),
(12, 52, 'debug', 'low', '2025-07-23 04:36:11', false),
(13, 3, 'alarm', 'critical', '2025-09-12 04:04:08', false),
(14, 4, 'critical', 'severe', '2025-03-23 17:29:44', true),
(15, 4, 'sensor', 'negligible', '2024-12-25 14:19:15', true),
(16, 55, 'error', 'critical', '2025-07-22 16:07:42', true),
(17, 11, 'software', 'minimal', '2025-01-14 11:06:36', true),
(18, 41, 'warning', 'moderate', '2025-06-01 10:38:16', false),
(19, 4, 'warning', 'important', '2025-07-09 00:11:40', true),
(20, 48, 'info', 'critical', '2025-04-06 19:38:32', true),
(21, 48, 'critical', 'critical', '2025-11-25 04:51:09', true),
(22, 49, 'critical', 'minimal', '2025-03-05 09:48:56', true),
(23, 13, 'sensor', 'severe', '2024-12-17 19:25:47', false),
(24, 10, 'software', 'trivial', '2025-09-22 12:11:14', true),
(25, 24, 'info', 'important', '2025-05-25 03:22:21', false),
(26, 45, 'sensor', 'high', '2024-12-07 12:19:08', true),
(27, 26, 'info', 'critical', '2025-01-26 20:05:46', true),
(28, 7, 'notification', 'minimal', '2024-12-08 04:40:04', false),
(29, 7, 'info', 'important', '2025-10-10 11:01:34', false),
(30, 12, 'critical', 'negligible', '2025-03-07 06:07:31', true);

--Sensor data
INSERT INTO SensorData(data_id, sensor_id, value, timeStamp)
VALUES
(1, 6, '5707077294', '2024-11-05 20:28:27'),
(2, 40, '4377081837', '2023-09-24 01:04:51'),
(2, 40, '4377081837', '2023-09-24 01:04:51'),
(4, 15, '3834287423', '2024-04-09 00:01:55'),
(5, 53, '1733610138', '2024-08-23 12:56:39'),
(6, 18, '1052189350', '2024-11-25 18:55:47'),
(7, 47, '0204136407', '2025-06-19 06:41:57'),
(8, 48, '4231778248', '2024-07-20 20:40:54'),
(9, 49, '8102740760', '2023-09-17 17:39:04'),
(10, 7, '0143625810', '2024-05-28 02:34:59'),
(11, 24, '7533148142', '2024-02-15 06:54:42'),
(12, 55, '4213658643', '2024-01-04 09:23:10'),
(13, 8, '7333092232', '2025-08-12 14:17:53'),
(14, 2, '7290541340', '2023-04-07 22:47:05'),
(15, 32, '5162037834', '2023-04-19 17:38:23'),
(16, 20, '6781391216', '2024-02-21 04:59:47'),
(17, 18, '8969915451', '2024-10-30 09:25:44'),
(18, 28, '5693053342', '2023-11-02 12:00:45'),
(19, 41, '1097994457', '2025-07-21 04:01:41'),
(20, 3, '8624272270', '2025-02-17 01:49:12'),
(21, 58, '2722413388', '2023-10-22 06:12:10'),
(22, 29, '7722249892', '2024-03-17 16:57:48'),
(23, 20, '2627585134', '2025-09-16 14:21:13'),
(24, 58, '1824695802', '2025-09-17 04:23:29'),
(25, 8, '7278925770', '2023-04-15 10:07:08'),
(26, 51, '2657228151', '2024-09-23 15:20:02'),
(27, 29, '8123966679', '2023-11-23 16:49:03'),
(28, 8, '6597400321', '2024-12-08 23:47:32'),
(29, 10, '4733304870', '2025-06-27 06:11:31'),
(30, 52, '0375833862', '2023-08-31 00:16:28');