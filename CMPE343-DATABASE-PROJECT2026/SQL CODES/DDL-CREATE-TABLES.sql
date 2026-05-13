-- 1. STORES GENERAL INFORMATION FOR ALL STAFF (BASIC INFO)
CREATE TABLE Employees (
    ssn INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    union_membership_no INT UNIQUE,
    salary DECIMAL(10, 2)
);

-- 2. STORES THE SPECIFIC RANK FOR MAINTENANCE STAFF
CREATE TABLE Technicians (
    ssn INT PRIMARY KEY,
    rank VARCHAR(50),
    FOREIGN KEY (ssn) REFERENCES Employees(ssn) ON DELETE CASCADE
);

-- 3. STORES MEDICAL EXAM DATES FOR THE CONTROL TOWER STAFF
CREATE TABLE TrafficControllers (
    ssn INT PRIMARY KEY,
    last_exam_date DATE,
    FOREIGN KEY (ssn) REFERENCES Employees(ssn) ON DELETE CASCADE
);

-- 4. STORES TECHNICAL SPECS (BLUEPRINTS) FOR PLANE TYPES
CREATE TABLE PlaneModels (
    model_id INT PRIMARY KEY,
    manufacturer VARCHAR(100),
    capacity INT
);

-- 5. STORES THE PHYSICAL PLANES CURRENTLY AT THE AIRPORT
CREATE TABLE Airplanes (
    plane_reg_no VARCHAR(20) PRIMARY KEY,
    model_id INT,
    manufacture_date DATE,
    FOREIGN KEY (model_id) REFERENCES PlaneModels(model_id)
);

-- 6. STORES PHYSICAL STORAGE LOCATIONS (PARKING BAYS)
CREATE TABLE Hangars (
    hangar_id INT PRIMARY KEY,
    location VARCHAR(100),
    capacity INT
);

-- 7. TRACKS THE HISTORY OF PLANES MOVING IN AND OUT OF HANGARS
CREATE TABLE HangarLogs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    plane_reg_no VARCHAR(20),
    hangar_id INT,
    in_time DATETIME,
    out_time DATETIME,
    FOREIGN KEY (plane_reg_no) REFERENCES Airplanes(plane_reg_no),
    FOREIGN KEY (hangar_id) REFERENCES Hangars(hangar_id)
);

-- 8. DEFINES THE DIFFERENT SAFETY TESTS AVAILABLE (NAME AND MAX SCORE)
CREATE TABLE TestTypes (
    test_id INT PRIMARY KEY,
    test_name VARCHAR(100),
    max_score INT
);

-- 9. LINKS TECHNICIANS TO THE PLANE MODELS THEY ARE CERTIFIED TO FIX
CREATE TABLE Expertise (
    ssn INT,
    model_id INT,
    PRIMARY KEY (ssn, model_id),
    FOREIGN KEY (ssn) REFERENCES Technicians(ssn),
    FOREIGN KEY (model_id) REFERENCES PlaneModels(model_id)
);

-- 10. THE MASTER LOG: TRACKS WHICH TECH TESTED WHICH PLANE AND THE SCORE
CREATE TABLE TestRecords (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    ssn INT,
    plane_reg_no VARCHAR(20),
    test_id INT,
    test_date DATE,
    hours_spent INT,
    score INT,
    FOREIGN KEY (ssn) REFERENCES Technicians(ssn),
    FOREIGN KEY (plane_reg_no) REFERENCES Airplanes(plane_reg_no),
    FOREIGN KEY (test_id) REFERENCES TestTypes(test_id)
);