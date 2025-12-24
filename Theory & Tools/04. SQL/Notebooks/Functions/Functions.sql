-- Aggregation functions
 
 
 
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(50),
    specialization VARCHAR(75),
    experience_years INT
);

SELECT 
    *
FROM
    doctors;



Use classicmodels;

-- Create an invoice table
CREATE TABLE Invoicing_Table AS 
SELECT o.orderNumber,
    orderDate,
    requiredDate,
    c.customerNumber ,
    customerName,
    CONCAT_WS(', ',
            CONCAT('c/o ',
                    contactFirstName,
                    ' ',
                    contactLastName),
            addressLine1,
            addressLine2,
            city,
            state,
            postalCode,
            country,
            CONCAT('Ph No.: ', phone)) AS complete_address,
    od.productCode,
    productName,
    MSRP,
    quantityOrdered,
    priceEach,
    ROUND(quantityOrdered * priceEach, 2) AS line_total FROM
    orders AS o
        LEFT JOIN
    customers AS c ON o.customerNumber = c.customerNumber
        LEFT JOIN
    orderdetails AS od ON o.orderNumber = od.orderNumber
        LEFT JOIN
    products AS p ON od.productCode = p.productCode
ORDER BY orderNumber
;
/* 
Execution starts with 
FROM JOIN ON 
Where 
Group By 
Having 
Select
*/
 

# Bonus Content :
-- Conditional Columns IF or Case When 
-- Group by using Rollup
-- Window Operations

# flag all customers as americas and non americas
# country name --> US or Canada : americas else non americas


SELECT 
    customerNumber,
    customerName,
    country,
    IF(country = 'USA' OR country = 'Canada',
        'Americas',
        'Non-Americas') AS LocationFlag
FROM
    customers
;

-- Categorize customers based on the total order value that they bring 
-- Total order value : sum(priceEach * quantity ordered) for each sutomer

# cutsomers who have palced any order
SELECT 
    c.customerNumber,customerName,
    coalesce(round(SUM(priceEach * quantityOrdered), 2), 0) AS total_order_value,
FROM
   customers as c
   LEFT JOIN 
    orders AS o ON c.customerNumber = o.customerNumber
        LEFT JOIN
    orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY customerNumber, customerName
;
/*
-- classify these customers based on their order values:
= 0 : No Classify 
< 35000 --> Bronze
between 350000 and 75000 -> silver
between 75000 and 150000 -> Gold
above 150000 --> Elite
*/

SELECT 
    c.customerNumber,customerName,
    coalesce(round(SUM(priceEach * quantityOrdered), 2), 0) AS total_order_value,
    Case 
		When coalesce(round(SUM(priceEach * quantityOrdered), 2), 0) = 0 Then "No Classification"
        When coalesce(round(SUM(priceEach * quantityOrdered), 2), 0) < 35000 Then "Bronze"
        When coalesce(round(SUM(priceEach * quantityOrdered), 2), 0) Between 35000 and 75000 Then "Silver"
        When coalesce(round(SUM(priceEach * quantityOrdered), 2), 0) Between 75000 and 150000 Then "Gold"
        When coalesce(round(SUM(priceEach * quantityOrdered), 2), 0) > 150000 Then "Elite"
        Else "No Classification"
	END As CustCategory
        
FROM
   customers as c
   LEFT JOIN 
    orders AS o ON c.customerNumber = o.customerNumber
        LEFT JOIN
    orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY customerNumber, customerName
Order BY total_order_value
;
/* 
coalesce(expression_1, expression_2, expression_3, expression_4....., 0)

If expresseion_1 is not null then let the value be expression_1
else If expresseion_2 is not null then let the value be expression_2
else If expresseion_3 is not null then let the value be expression_3

it stops as soon as it encounters first non null value

*/


-- Group By with Roll UP 

SELECT 
    YEAR(orderDate) as year,
    SUM(priceEach * quantityOrdered) AS total_sales
FROM
    orders o,
    orderdetails od
WHERE
    o.orderNumber = od.orderNumber
GROUP BY  YEAR(orderDate)
#With RollUP
;

SELECT 
    YEAR(orderDate) as year
    SUM(priceEach * quantityOrdered) AS total_sales
FROM
    orders o,
    orderdetails od
WHERE
    o.orderNumber = od.orderNumber
GROUP BY  YEAR(orderDate)
With RollUP
;

SELECT 
    YEAR(orderDate) as year,
    Month(orderDate) as month,
    SUM(priceEach * quantityOrdered) AS total_sales
FROM
    orders o,
    orderdetails od
WHERE
    o.orderNumber = od.orderNumber
GROUP BY  YEAR(orderDate), Month(orderDate)
With RollUP
;

SELECT 
	
    YEAR(orderDate) year,
    Month(orderDate) as month,
    Day(orderDate) as day,
    SUM(priceEach * quantityOrdered) AS total_sales
FROM
    orders o,
    orderdetails od
WHERE
    o.orderNumber = od.orderNumber
GROUP BY  YEAR(orderDate), Month(orderDate), Day(orderDate) 
With RollUP
;

-- Windows operation 

create table demo.employees(
 emp_id char(4),
 emp_name varchar(50),
 emp_age int,
 emp_dept varchar(20),
 emp_sal float);
 
 
 insert into demo.employees
 values 
 ("A123", "John Kramer", 23, "Finance", 40000),
  ("A124", "Kate Falcon", 24, "Sales", 50000),
   ("A125", "Paris Rose", 22, "Sales", 50000),
    ("A126", "Fran Joseph", 22, "Finance", 50000),
     ("A127", "Andy Golds", 22, "Finance", 60000),
      ("A128", "Michael Stan", 24, "Sales", 45000),
       ("A129", "Jim Weasly", 25, "Finance", 55000),
       ("A121", "George Kim", 23, "Sales", 35000)

;

Select * from demo.employees;

# Departwise salary
Select emp_dept, avg(emp_sal) as average_salary
From demo.employees
group by emp_dept;

/* find the difference of each salary for each employee from this average? and add it to the table */

Select * from demo.employees;

# over() and partition by 
Select *, 
	Avg(emp_sal) Over() as avg_sal
From demo.employees;


# add departwise 
Select *, 
	Avg(emp_sal) Over() as avg_sal,
    Avg(emp_sal) Over(partition by emp_dept) as dept_avg_sal
From demo.employees;



# Rank operations
-- Row_Number(), Rank, Dense_Rank()

SELECT 
    *,
    row_number() over() as data_row_no,
    row_number() over(partition by emp_dept) as dept_row_no,
    row_number() over(partition by emp_dept order by emp_age) as dept_row_no_by_age,
    rank() over() as data_rank,
    rank() over(partition by emp_dept) as dept_rank,
    rank() over(partition by emp_dept order by emp_age) as dept_rank_age,
    dense_rank() over(partition by emp_dept order by emp_age) as dept_dense_rank_age
FROM
    demo.employees;

# over (partition by ) 
/* 
its going to do calculation for each group (partition) like avg salary for each department
Since it is used in select clause --> it is creating a column
So it will fill the vlaue in that column based on the partition for that row 
eg. If for that row dept is finance , then corresponding value will be avg salary for finance dept
*/