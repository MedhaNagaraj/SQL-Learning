1. Using the Aggregated Inline Derived Table Method:

SELECT 	C.customer_number, C.customer_name
		O.ordernumber, O.orderdate, O.status

FROM ( 	SELECT O.customer_number, MAX(orderdate) AS most_recent_date
		FROM orders O
		GROUP BY O.customer_number ) AS recent_order
		
JOIN orders O ON recent_order.customer_number = O.customer_number
AND recent_order.most_recent_date = O.orderdate
JOIN customers C ON O.customer_number = C.customer_number

2. Using the CTEs - Common Table Expressions:

WITH customer_recent_order AS (
	SELECT o.customer_number, MAX(orderdate) AS most_recent_date
	FROM orders o
	GROUP BY o.customer_number
	), 
	customer_order_view AS (
	SELECT 	c.customer_number, c.customer_name, o.ordernumber
			o.orderdate, o.status
	FROM orders o
	JOIN customer_recent_order cro ON o.customer_number = cro.customer_number
	AND o.orderdate = cro.most_recent_date
	JOIN customers c ON o.customer_number = cro.customer_number
)

SELECT * FROM customer_order_view

3. Using Windows Function

;WITH YourCTE AS
(
  SELECT TOP 2
    *, ROW_NUMBER() OVER(ORDER BY YourColumn) AS RowNumber
  FROM @YourTable
) 
SELECT *
FROM YourCTE
WHERE RowNumber=2

4. Return Employee record with the highest salary:
	SELECT * 
	FROM employee 
	where salary in (select max(salary) from employee)
	
5. Return highest salary from the employee table:
	select max(salary) from employee
	
6. Return second highest salary from the employee table:
	select max(salary)
	from employee
	where salary not in (max(salary) from employee)
OR
	select salary
	from employee
	order by salary desc
	limit 1,1
	
7. Select the range of employees based on id:
	select * from employee
	where employee_id between 2003 and 2008
	
8. Return an employee with the highest salary and employee's department name:
	Select *
	from employee e inner join department d ON 
	e.department_id = d.department_id
	where salary in (select max(salary) from employee)
	
9. Return highest salary, employee_name, department_name for each department
	select e.first_name, e.last_name, e.salary, d.department_name
	from employee e
	inner join department d 
	on e.department_id = d.department_id
	where salary in (select max(salary) group by department_id)
	
10. SUBQUERY:
	- Query inside a query, wherein you will be fetching the data from the inner query and passing it out onto the outer query to give out the final result
	- Works in a unidirectional way
	Example:
	SELECT *
	FROM employee
	WHERE id in ( select id_fk from empsal where salary >150)
	
11. Corelated queries:
	- This is a two way directional query
	- Data for the inner query is fetched from the outer query, inner query is evaluated and then passed onto the outer query to give out the result
	- Works in a to and fro manner
	Example: Select the record with the second highest salary
		SELECT Empname
		FROM Empsal e1
		where 2 =
		( 	select count(e2.salary)
			from Empsal e2 where e2.salary >= e1.salary)
			
12. Update Statements:
	Update Customer
	Set Age = 20
	Where first_name = 'Joe' And last_name = 'Black'
	
13. Create a Database with primary key:
	Create table Customer
	( id int Primary Key identity (1,1),
	first_name varchar(50), 
	last_name varchar(50), 
	age int)

14. Insert into the table:
	Insert into Customer (first_name, last_name, age)
	values ('Joe', 'Black', 40)
	
15. DELETE values from a table:
	Delete Customer 
	Where first_name = 'Joe'
	and last_name = 'Schmidt_'
	
16. Alter the table to add values:
	Alter Table Customer
	Add (City varchar(30))
	
17. Create a foreign key:
	alter table customer
	add foreign key (customer_id) references Order(order_id)
