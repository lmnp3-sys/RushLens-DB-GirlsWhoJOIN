-- Location
INSERT INTO Location (location_id, name, address, building, floor, location_type) 
VALUES
(1, 'Popeyes', '360 Huntington Ave, Boston, MA 02115', 'Curry Student Center', 1, 'Fast-Food')
(2, 'Starbucks', '360 Huntington Ave, Boston, MA 02115', 'Curry Student Center', 1, 'Cafe')
(3, 'D''Angelo', '360 Huntington Ave, Boston, MA 02115', 'Curry Student Center', 1, 'Fast-Food')
(4, 'Sal''Pizza', '360 Huntington Ave, Boston, MA 02115', 'Curry Student Center', 1, 'Fast-Food')
(5, 'Halal Shack', '360 Huntington Ave, Boston, MA 02115', 'Curry Student Center', 1, 'Fast-Food')
(6, 'Dunkin''', '360 Huntington Ave, Boston, MA 02115', 'Hayden Hall', 1, 'Cafe')
(7, 'Dunkin''', '115 Forsyth St, Boston, MA 02115', 'Shillman Hall', 1, 'Cafe')
(8, 'Saxbys Northeastern', '815 Columbus Ave, Boston, MA 02115', 'EXP', 2, 'Cafe')
(9, 'Subway', 'Leon St, Boston, MA 02115', 'Ryder Hall', 1, 'Fast-Food')
(10, 'Kigo Kitchen', '360 Huntington Ave, Boston, MA 02115', 'Curry Student Center', 1, 'Fast-Food')
(11, 'Equator Coffees', '360 Huntington Ave, Boston, MA 02115', 'Snell Library', 1, 'Cafe')
(12, 'Juicygreens', '1155 Tremont St, Boston, MA 02115', 'International Village', 1, 'Drinks')
(13, 'Fuel America', '815 Columbus Ave, Boston, MA 02115', 'ISEC', 1, 'Cafe')
(14, '', '95456 Mallory Street', 'PO Box 43900', 'PO Box 41674', '')
(15, '', '5868 Russell Plaza', '14th Floor', 'Suite 48', '')
(16, '', '1758 Mitchell Place', 'Suite 92', 'Suite 6', '')
(17, '', '93 Walton Avenue', 'Suite 94', 'PO Box 84021', '')
(18, '', '7390 Fairview Street', '9th Floor', 'Room 179', '')
(19, '', '086 John Wall Park', '17th Floor', '10th Floor', '')
(20, '', '42608 Eggendart Road', 'Room 994', 'Apt 1028', '')
(21, '', '75 Beilfuss Crossing', 'PO Box 35334', 'Apt 176', '')
(22, '', '5586 Mcbride Pass', 'Room 1284', '20th Floor', '')
(23, '', '734 Utah Center', 'Apt 204', 'Suite 60', '')
(24, '', '653 Alpine Lane', 'Apt 1391', '2nd Floor', '')
(25, '', '802 Merrick Hill', 'Room 643', 'Apt 1476', '')
(26, '', '37045 Cody Court', 'Apt 1363', 'Room 825', '')
(27, '', '1 Ridgeway Alley', 'PO Box 57451', '2nd Floor', '')
(28, '', '626 Steensland Place', 'Suite 29', 'Room 1558', '')
(29, '', '6 Welch Pass', '13th Floor', '15th Floor', '')
(30, '', '060 Fallview Avenue', '5th Floor', 'Suite 45', '')




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