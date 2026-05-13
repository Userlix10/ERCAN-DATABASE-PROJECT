-- Q1: LIST ALL EMPLOYEES AND THEIR SALARIES
SELECT full_name, salary FROM Employees;

-- Q2: FIND ALL TECHNICIANS (JOINING EMPLOYEES AND TECHNICIANS)
SELECT E.full_name, T.rank 
FROM Employees E 
JOIN Technicians T ON E.ssn = T.ssn;

-- Q3: FIND PLANES CURRENTLY PARKED IN HANGAR 1 (WHERE OUT_TIME IS NULL)
SELECT plane_reg_no, in_time 
FROM HangarLogs 
WHERE hangar_id = 1 AND out_time IS NULL;

-- Q4: LIST PLANE MODELS WITH CAPACITY OVER 200 SEATS
SELECT manufacturer, capacity 
FROM PlaneModels 
WHERE capacity > 200;

-- Q5: FIND ALL EXPERTS CERTIFIED ON THE 'BOEING 737'
SELECT E.full_name 
FROM Employees E
JOIN Expertise EX ON E.ssn = EX.ssn
WHERE EX.model_id = 737;

-- Q6: SHOW MAINTENANCE HISTORY FOR A SPECIFIC PLANE (TC-ERC01)
SELECT T.test_name, TR.test_date, TR.score 
FROM TestRecords TR
JOIN TestTypes T ON TR.test_id = T.test_id
WHERE TR.plane_reg_no = 'TC-ERC01';

-- Q7: COUNT HOW MANY PLANES EACH HANGAR IS CURRENTLY HOLDING
SELECT hangar_id, COUNT(*) AS planes_inside 
FROM HangarLogs 
WHERE out_time IS NULL 
GROUP BY hangar_id;

-- Q8: FIND THE AVERAGE SALARY OF ALL AIRPORT EMPLOYEES
SELECT AVG(salary) AS average_airport_salary FROM Employees;

-- Q9: LIST PLANES THAT HAVE NEVER HAD A SAFETY TEST (CRITICAL FOR SAFETY)
SELECT plane_reg_no 
FROM Airplanes 
WHERE plane_reg_no NOT IN (SELECT plane_reg_no FROM TestRecords);

-- Q10: FIND TRAFFIC CONTROLLERS WHO HAVEN'T HAD AN EXAM SINCE 2025
SELECT E.full_name, TC.last_exam_date 
FROM Employees E
JOIN TrafficControllers TC ON E.ssn = TC.ssn
WHERE TC.last_exam_date < '2026-01-01';

-- Q11: CALCULATE TOTAL HOURS SPENT ON TESTS BY EACH TECHNICIAN
SELECT E.full_name, SUM(TR.hours_spent) AS total_hours
FROM Employees E
JOIN TestRecords TR ON E.ssn = TR.ssn
GROUP BY E.full_name;

-- Q12: SHOW THE HIGHEST SCORE ACHIEVED ON EACH TYPE OF TEST
SELECT TT.test_name, MAX(TR.score) AS top_score
FROM TestTypes TT
JOIN TestRecords TR ON TT.test_id = TR.test_id
GROUP BY TT.test_name;

-- Q13: FIND TECHNICIANS WHO ARE EXPERTS IN MORE THAN 1 MODEL
SELECT E.full_name, COUNT(EX.model_id) AS models_known
FROM Employees E
JOIN Expertise EX ON E.ssn = EX.ssn
GROUP BY E.full_name
HAVING COUNT(EX.model_id) > 1;

-- Q14: JOIN EMPLOYEES, TESTRECORDS, AND TESTTYPES (3-WAY JOIN)
SELECT E.full_name AS Technician, TT.test_name, TR.score
FROM Employees E
JOIN TestRecords TR ON E.ssn = TR.ssn
JOIN TestTypes TT ON TR.test_id = TT.test_id;

-- Q15: COMPARE TOTAL SALARY BUDGET: TECHNICIANS VS CONTROLLERS
SELECT 'Technician' AS Role, SUM(salary) FROM Employees WHERE ssn IN (SELECT ssn FROM Technicians)
UNION
SELECT 'Controller', SUM(salary) FROM Employees WHERE ssn IN (SELECT ssn FROM TrafficControllers);