/* ============================================================
   SQL PRACTICE DATASET FOR JOINS
   Tables:
   1. Beverages
   2. emp_info
   3. emp_sal_desig
   4. Food
   5. emp_info_2 (for self joins)
   ============================================================ */
USE demo;
/* ============================
   1. TABLE: Beverages
   ============================ */
CREATE TABLE Beverages (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    item_cost DECIMAL(6,2)
);

INSERT INTO Beverages VALUES
(101, 'Cold Coffee', 120.00),
(102, 'Lemon Soda', 60.00),
(103, 'Iced Tea', 90.00),
(104, 'Hot Chocolate', 150.00);

/* ============================
   2. TABLE: emp_info
   Basic employee details
   ============================ */
CREATE TABLE emp_info (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    skills VARCHAR(100),
    exp INT
);

INSERT INTO emp_info VALUES
(1, 'Aarav', 'SQL, Python', 3),
(2, 'Riya', 'Power BI, Excel', 2),
(3, 'Kabir', 'SQL, Tableau', 4),
(4, 'Meera', 'Python, ML', 5),
(5, 'Arjun', 'Excel, Communication', 1);

/* ============================
   3. TABLE: emp_sal_desig
   Salary + designation
   Note: emp_id 5 missing intentionally
   for LEFT/RIGHT JOIN practice
   ============================ */
CREATE TABLE emp_sal_desig (
    emp_id INT,
    design VARCHAR(50),
    salary INT,
    FOREIGN KEY (emp_id) REFERENCES emp_info(emp_id)
);

INSERT INTO emp_sal_desig VALUES
(1, 'Data Analyst', 45000),
(2, 'Business Analyst', 40000),
(3, 'Data Engineer', 55000),
(4, 'ML Engineer', 70000);

/* ============================
   4. TABLE: Food
   ============================ */
CREATE TABLE Food (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    item_cost DECIMAL(6,2)
);

INSERT INTO Food VALUES
(201, 'Burger', 120.00),
(202, 'Pasta', 180.00),
(203, 'Pizza', 250.00),
(204, 'French Fries', 90.00);

/* ============================
   5. TABLE: emp_info_2
   For SELF JOIN practice
   reportsto = manager's emp_id
   ============================ */
CREATE TABLE emp_info_2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    exp INT,
    reportsto INT
);

INSERT INTO emp_info_2 VALUES
(1, 'Aarav', 3, 4),
(2, 'Riya', 2, 1),
(3, 'Kabir', 4, 4),
(4, 'Meera', 5, NULL),  -- Manager
(5, 'Arjun', 1, 2);

/* ============================================================
   DATASET READY FOR:
   - INNER JOIN
   - LEFT / RIGHT JOIN
   - FULL OUTER JOIN
   - CROSS JOIN
   - SELF JOIN
   - UNION / SUBQUERIES
   ============================================================ */