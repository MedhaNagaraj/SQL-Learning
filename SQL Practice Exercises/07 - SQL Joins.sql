*****----- SQL Exercises, Practice, Solution - Query on Multiple Tables -----*****

1. Write a SQL statement to prepare a list with salesman name, customer name and their cities for the salesmen and customer who belongs to the same city.  Go to the editor

SELECT S.NAME, C.CUST_NAME, C.CITY
FROM SALESMAN S, CUSTOMER C
WHERE S.CITY = C.CITY

2. Write a SQL statement to make a list with order no, purchase amount, customer name and their cities for those orders which order amount between 500 and 2000.  Go to the editor

SELECT ORD_NO, PURCH_AMT, CUST_NAME, CITY
FROM CUSTOMER C, ORDERS O
WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
AND PURCH_AMT BETWEEN 500 AND 2000

3. Write a SQL statement to know which salesman are working for which customer.  Go to the editor

SELECT S.NAME, C.CUST_NAME, C.CITY, S.COMMISSION
FROM CUSTOMER C
JOIN SALESMAN S
ON C.SALESMAN_ID = S.SALESMAN_ID

4. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who gets a commission from the company is more than 12%.   Go to the editor

SELECT *
FROM CUSTOMER C
JOIN SALESMAN S
ON C.SALESMAN_ID = S.SALESMAN_ID
WHERE S.COMMISSION > 0.12

5. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who does not live in the same city where their customer lives, and gets a commission is above 12% .   Go to the editor

SELECT C.CUST_NAME, C.CUSTOMER_ID, S.NAME, S.COMMISSION, C.CITY
FROM CUSTOMER C
JOIN SALESMAN S
ON C.SALESMAN_ID = S.SALESMAN_ID
WHERE S.COMMISSION > 0.12
AND C.CITY <> S.CITY

6. Write a SQL statement to find the details of a order i.e. order number, order date, amount of order, which customer gives the order and which salesman works for that customer and how much commission he gets for an order.   Go to the editor

SELECT O.ORD_NO, O.ORD_DATE, O.PURCH_AMT, O.CUSTOMER_ID, C.CUST_NAME, S.SALESMAN_ID, S.NAME, S.COMMISSION
FROM ORDERS O
JOIN SALESMAN S
ON O.SALESMAN_ID = S.SALESMAN_ID
JOIN CUSTOMER C
ON O.CUSTOMER_ID = C.CUSTOMER_ID

***7. Write a SQL statement to make a join on the tables salesman, customer and orders in such a form that the same column of each table will appear once and only the relational rows will come.  Go to the editor

SELECT *
FROM ORDERS O
NATURAL JOIN SALESMAN S
NATURAL JOIN CUSTOMER C

8. Write a SQL statement to make a list in ascending order for the customer who works either through a salesman or by own.   Go to the editor

SELECT C.CUST_NAME, C.CITY, S.NAME, C.GRADE,S.CITY AS "SALESMAN_CITY"
FROM CUSTOMER C
LEFT JOIN SALESMAN S 
ON C.SALESMAN_ID = S.SALESMAN_ID
ORDER BY C.CUSTOMER_ID

**9. Write a SQL statement to make a list in ascending order for the customer who holds a grade less than 300 and works either through a salesman or by own.  Go to the editor

SELECT C.CUST_NAME, C.CITY, S.NAME, C.GRADE, S.CITY AS "SCITY"
FROM CUSTOMER C
LEFT OUTER JOIN SALESMAN S 
ON C.SALESMAN_ID = S.SALESMAN_ID
WHERE C.GRADE < 300
ORDER BY C.CUSTOMER_ID

10. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to find that either any of the existing customers have placed no order or placed one or more orders.  Go to the editor

SELECT C.CUST_NAME, C.CITY, O.ORD_NO, O.ORD_DATE, O.PURCH_AMT
FROM ORDERS O
LEFT OUTER JOIN CUSTOMER C
ON O.CUSTOMER_ID = C.CUSTOMER_ID
ORDER BY O.ORD_DATE

11. Write a SQL statement to make a report with customer name, city, order number, order date, order amount salesman name and commission to find that either any of the existing customers have placed no order or placed one or more orders by their salesman or by own.  Go to the editor

SELECT C.CUST_NAME, C.CITY, O.ORD_NO, O.ORD_DATE, O.PURCH_AMT, S.NAME, S.COMMISSION
FROM ORDERS O
JOIN CUSTOMER C
ON O.CUSTOMER_ID = C.CUSTOMER_ID
JOIN SALESMAN S
ON O.SALESMAN_ID = S.SALESMAN_ID

12. Write a SQL statement to make a list in ascending order for the salesmen who works either for one or more customer or not yet join under any of the customers.  Go to the editor

SELECT S.NAME, S.SALESMAN_ID, C.CUST_NAME, C.GRADE
FROM SALESMAN S
LEFT OUTER JOIN CUSTOMER C
ON S.SALESMAN_ID = C.SALESMAN_ID
ORDER BY S.SALESMAN_ID

13. Write a SQL statement to make a list for the salesmen who works either for one or more customer or not yet join under any of the customers who placed either one or more orders or no order to their supplier.  Go to the editor

SELECT S.SALESMAN_ID, S.NAME, C.CUST_NAME,C.CITY, C.GRADE, O.ORD_NO, O.ORD_DATE, O.PURCH_AMT
FROM CUSTOMER C
RIGHT OUTER JOIN SALESMAN S
ON C.SALESMAN_ID = S.SALESMAN_ID
LEFT OUTER JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID

14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.  Go to the editor

SELECT S.SALESMAN_ID, S.NAME, C.CUST_NAME,C.CITY, C.GRADE, O.ORD_NO, O.ORD_DATE, O.PURCH_AMT
FROM CUSTOMER C
RIGHT OUTER JOIN SALESMAN S
ON C.SALESMAN_ID = S.SALESMAN_ID
RIGHT OUTER JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.PURCH_AMT > 2000
AND C.GRADE IS NOT NULL

15. Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for those customers from the existing list who placed one or more orders or which order(s) have been placed by the customer who is not on the list.  Go to the editor

SELECT C.CUST_NAME,C.CITY, O.ORD_NO, O.ORD_DATE, O.PURCH_AMT
FROM CUSTOMER C
FULL OUTER JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID









