*****----- SQL Exercises, Practice, Solution - Aggregate Functions -----*****

1. Write a SQL statement to find the total purchase amount of all orders. 
SELECT SUM(purch_amt)
FROM orders

2. Write a SQL statement to find the average purchase amount of all orders. 
SELECT ROUND(AVG(purch_amt),2)
FROM orders

3. Write a SQL statement to find the number of salesmen currently listing for all of their customers. 
SELECT COUNT(DISTINCT(salesman_id))
FROM orders

4. Write a SQL statement know how many customer have listed their names. 
SELECT COUNT(DISTINCT(cust_name))
FROM customer

5. Write a SQL statement find the number of customers who gets at least a gradation for his/her performance. 
SELECT COUNT(ALL grade)
FROM customer

6. Write a SQL statement to get the maximum purchase amount of all the orders.  
SELECT MAX(PURCH_AMT)
FROM ORDERS

7. Write a SQL statement to get the minimum purchase amount of all the orders. 
SELECT MIN(PURCH_AMT)
FROM ORDERS

8. Write a SQL statement which selects the highest grade for each of the cities of the customers.  
SELECT CITY, MAX(GRADE)
FROM CUSTOMER
GROUP BY CITY

9. Write a SQL statement to find the highest purchase amount ordered by the each customer with their ID and highest purchase amount. 
SELECT CUSTOMER_ID, MAX(PURCH_AMT)
FROM ORDERS
GROUP BY CUSTOMER_ID
ORDER BY CUSTOMER_ID

10. Write a SQL statement to find the highest purchase amount ordered by the each customer on a particular date with their ID, order date and highest purchase amount.   ;Go to the editor

SELECT CUSTOMER_ID, ORD_DATE, MAX(PURCH_AMT) AS MAX_AMT
FROM ORDERS
GROUP BY CUSTOMER_ID, ORD_DATE
ORDER BY CUSTOMER_ID

11. Write a SQL statement to find the highest purchase amount on a date '2012-08-17' for each salesman with their ID. 
SELECT salesman_id, MAX(purch_amt)
FROM ORDERS
WHERE ORD_DATE = '2012-08-17'
GROUP BY SALESMAN_ID

12. Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have highest purchase amount in a day is more than 2000. 
SELECT CUSTOMER_ID, MAX(PURCH_AMT), ORD_DATE
FROM ORDERS
GROUP BY CUSTOMER_ID, ORD_DATE
HAVING MAX(PURCH_AMT) > 2000

13. Write a SQL statement to find the highest purchase amount with their ID and order date, for those customers who have a higher purchase amount in a day is within the range 2000 and 6000.  Go to the editor

SELECT CUSTOMER_ID, MAX(PURCH_AMT), ORD_DATE
FROM ORDERS
GROUP BY CUSTOMER_ID, ORD_DATE
HAVING MAX(PURCH_AMT) BETWEEN 2000 AND 6000

14. Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have a higher purchase amount in a day is within the list 2000, 3000, 5760 and 6000.  Go to the editor

SELECT CUSTOMER_ID, MAX(PURCH_AMT), ORD_DATE
FROM ORDERS
GROUP BY CUSTOMER_ID, ORD_DATE
HAVING MAX(PURCH_AMT) IN (2000, 3000, 5760,6000)

15. Write a SQL statement to find the highest purchase amount with their ID, for only those customers whose ID is within the range 3002 and 3007

SELECT CUSTOMER_ID, MAX(PURCH_AMT)
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING CUSTOMER_ID BETWEEN 3002 AND 3007

16. Write a SQL statement to display customer details (ID and purchase amount) whose IDs are within the range 3002 and 3007 and highest purchase amount is more than 1000.  Go to the editor

SELECT CUSTOMER_ID, MAX(PURCH_AMT)
FROM ORDERS
WHERE CUSTOMER_ID BETWEEN 3002 AND 3007
GROUP BY CUSTOMER_ID
HAVING MAX(PURCH_AMT)>1000

17. Write a SQL statement to find the highest purchase amount with their ID, for only those salesmen whose ID is within the range 5003 and 5008.  Go to the editor

SELECT SALESMAN_ID, MAX(PURCH_AMT)
FROM ORDERS
GROUP BY SALESMAN_ID
HAVING SALESMAN_ID BETWEEN 5003 AND 5008

18. Write a SQL statement that counts all orders for a date August 17th, 2012. 
SELECT COUNT(*)
FROM ORDERS
WHERE ORD_DATE = '2012-08-17'

19. Write a SQL statement that count the number of salesmen for whom a city is specified. Note that there may be spaces or no spaces in the city column if no city is specified. 
SELECT COUNT(*)
FROM SALESMAN
WHERE CITY IS NOT NULL

20. Write a query that counts the number of salesmen with their order date and ID registering orders for each day.  Go to the editor

SELECT COUNT(*), SALESMAN_ID, ORD_DATE
FROM ORDERS
GROUP BY SALESMAN_ID, ORD_DATE

21. Write a SQL query to calculate the average price of all the products.  Go to the editor

SELECT AVG(PRO_PRICE) AS "AVG-PRICE"
FROM item_mast

22. Write a SQL query to find the number of products with a price more than or equal to Rs.350.  Go to the editor

SELECT COUNT(*)
FROM item_mast
WHERE PRO_PRICE >= 350

23. Write a SQL query to display the average price of each company's products, along with their code.  Go to the editor

SELECT AVG(PRO_PRICE), PRO_COM
FROM item_mast
GROUP BY PRO_COM

24. Write a query in SQL to find the sum of the allotment amount of all departments. 
SELECT SUM(DPT_ALLOTMENT) AS "SUM_AMT"
FROM emp_department

25. Write a query in SQL to find the number of employees in each department along with the department code.  Go to the editor

SELECT COUNT(*), EMP_DEPT
FROM emp_details
GROUP BY EMP_DEPT




