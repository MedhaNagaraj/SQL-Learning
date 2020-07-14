*****----- SQL Exercises, Practice, Solution - Query on Multiple Tables -----*****

1. Write a query to find those customers with their name and those salesmen with their name and city who lives in the same city. 

SELECT SALESMAN.NAME, CUSTOMER.CUST_NAME, SALESMAN.CITY
FROM SALESMAN, CUSTOMER
WHERE SALESMAN.CITY = CUSTOMER.CITY

2. Write a SQL statement to find the names of all customers along with the salesmen who works for them.  

SELECT NAME, CUSTOMER.CUST_NAME
FROM SALESMAN
JOIN CUSTOMER
ON SALESMAN.SALESMAN_ID = CUSTOMER.SALESMAN_ID

3. Write a SQL statement to display all those orders by the customers not located in the same cities where their salesmen live.  

SELECT ORD_NO, C.CUST_NAME, C.CUSTOMER_ID, S.SALESMAN_ID
FROM SALESMAN S, CUSTOMER C, ORDERS O
WHERE S.CITY <> C.CITY
AND O.CUSTOMER_ID = C.CUSTOMER_ID
AND O.SALESMAN_ID = S.SALESMAN_ID

4. Write a SQL statement that finds out each order number followed by the name of the customers who made the order.  

SELECT ORD_NO, C.CUST_NAME
FROM CUSTOMER C, ORDERS O
WHERE O.CUSTOMER_ID = C.CUSTOMER_ID

5. Write a SQL statement that sorts out the customer and their grade who made an order. Each of the customers must have a grade and served by at least a salesman, who belongs to a city.   

SELECT C.CUST_NAME AS CUSTOMER, C.GRADE AS GRADE
FROM CUSTOMER C, ORDERS O, SALESMAN S
WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
AND O.SALESMAN_ID = S.SALESMAN_ID
AND S.CITY IS NOT NULL
AND C.GRADE IS NOT NULL
ORDER BY GRADE

6. Write a query that produces all customers with their name, city, salesman and commission, who served by a salesman and the salesman works at a rate of the commission within 12% to 14%. 

SELECT C.CUST_NAME AS "CUSTOMER", C.CITY AS "CUST_CITY", S.NAME AS "SALESMAN", S.COMMISSION
FROM CUSTOMER C, SALESMAN S
WHERE S.SALESMAN_ID = C.SALESMAN_ID
AND S.COMMISSION BETWEEN 0.12 AND 0.14

7. Write a SQL statement that produces all orders with the order number, customer name, commission rate and earned commission amount for those customers who carry their grade is 200 or more and served by an existing salesman. 

SELECT ORD_NO, CUST_NAME, GRADE, COMMISSION AS "COM_RATE", PURCH_AMT*COMMISSION AS "EARNED_COM" 
FROM SALESMAN S, ORDERS O, CUSTOMER C
WHERE O.SALESMAN_ID = S.SALESMAN_ID
AND O.CUSTOMER_ID = C.CUSTOMER_ID
AND C.GRADE >= 200

8.Find all customers with orders on October 5, 2012. 

SELECT *
FROM ORDERS O, CUSTOMER C
WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
AND O.ORD_DATE = '2012-10-05'











