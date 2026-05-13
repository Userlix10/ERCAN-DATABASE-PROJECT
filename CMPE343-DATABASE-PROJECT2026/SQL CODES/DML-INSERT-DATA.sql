-- 1. INSERTING EMPLOYEES (General Info)
INSERT INTO Employees (ssn, full_name, address, union_membership_no, salary) VALUES
(101, 'Ahmet Yilmaz', 'Lefkosa, Cyprus', 5001, 45000.00),
(102, 'Ayse Demir', 'Girne, Cyprus', 5002, 48000.00),
(103, 'John Smith', 'Magusa, Cyprus', 5003, 42000.00),
(104, 'Fatma Avci', 'Lefkosa, Cyprus', 5004, 55000.00),
(105, 'Mehmet Kaya', 'Guzelyurt, Cyprus', 5005, 43000.00);

-- 2. INSERTING TECHNICIANS (Linking to Employees)
INSERT INTO Technicians (ssn, rank) VALUES
(101, 'Senior Engineer'),
(103, 'Junior Mechanic'),
(105, 'Lead Technician');

-- 3. INSERTING TRAFFIC CONTROLLERS (Linking to Employees)
INSERT INTO TrafficControllers (ssn, last_exam_date) VALUES
(102, '2026-01-15'),
(104, '2025-12-10');

-- 4. INSERTING PLANE MODELS
INSERT INTO PlaneModels (model_id, manufacturer, capacity) VALUES
(737, 'Boeing', 180),
(320, 'Airbus', 150),
(777, 'Boeing', 350);

-- 5. INSERTING ACTUAL AIRPLANES
INSERT INTO Airplanes (plane_reg_no, model_id, manufacture_date) VALUES
('TC-ERC01', 737, '2018-05-20'),
('TC-ERC02', 320, '2020-11-12'),
('TC-ERC03', 777, '2015-03-25');

-- 6. INSERTING HANGARS
INSERT INTO Hangars (hangar_id, location, capacity) VALUES
(1, 'North Wing - Bay A', 5),
(2, 'South Wing - Bay B', 3);

-- 7. INSERTING EXPERTISE (Which Tech knows which Model)
INSERT INTO Expertise (ssn, model_id) VALUES
(101, 737),
(101, 777),
(105, 320),
(105, 737);

-- 8. INSERTING TEST TYPES
INSERT INTO TestTypes (test_id, test_name, max_score) VALUES
(1, 'Engine Pressure Test', 100),
(2, 'Hydraulic Fluid Check', 100),
(3, 'Avionics Calibration', 50);

-- 9. INSERTING TEST RECORDS (The actual events)
INSERT INTO TestRecords (ssn, plane_reg_no, test_id, test_date, hours_spent, score) VALUES
(101, 'TC-ERC01', 1, '2026-04-10', 5, 95),
(105, 'TC-ERC02', 2, '2026-04-12', 3, 88),
(101, 'TC-ERC03', 3, '2026-04-15', 8, 48);

-- 10. INSERTING HANGAR LOGS (Parking History)
INSERT INTO HangarLogs (plane_reg_no, hangar_id, in_time, out_time) VALUES
('TC-ERC01', 1, '2026-04-01 08:00:00', '2026-04-05 12:00:00'),
('TC-ERC02', 2, '2026-04-10 09:30:00', NULL); -- NULL means it's still inside