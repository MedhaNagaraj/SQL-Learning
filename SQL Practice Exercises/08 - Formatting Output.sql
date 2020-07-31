*****----- SQL Exercises, Practice, Solution - Formatting Output -----*****

1. Write a SQL statement to display the commission with the percent sign ( % ) with salesman ID, name and city columns for all the salesmen. 
SELECT salesman_id, name, city, commission*100 AS "COM IN %"
FROM SALESMAN

2. Write a SQL statement to find out the number of orders booked for each day and display it in such a format like "For 2001-10-10 there are 15 orders". 
SELECT ' For',ord_date,',there are', 
COUNT (DISTINCT ord_no),'orders.' 
FROM orders 
GROUP BY ord_date;

3. Write a query to display the orders according to the order number arranged by ascending order.  
SELECT *
FROM orders 
ORDER BY ORD_NO;

4. Write a SQL statement to arrange the orders according to the order date in such a manner that the latest date will come first then previous dates. 
SELECT *
FROM orders 
ORDER BY ORD_DATE DESC;

5. Write a SQL statement to display the orders with all information in such a manner that, the older order date will come first and the highest purchase amount of same day will come first.  
SELECT *
FROM orders 
ORDER BY ORD_DATE, PURCH_AMT DESC;

6. Write a SQL statement to display the customer name, city, and grade, etc. and the display will be arranged according to the smallest customer ID. 
SELECT *
FROM orders 
ORDER BY CUSTOMER_ID;

7. Write a SQL statement to make a report with salesman ID, order date and highest purchase amount in such an arrangement that, the smallest salesman ID will come first along with their smallest order date. 
SELECT SALESMAN_ID, ORD_DATE, MAX(PURCH_AMT)
FROM orders 
GROUP BY SALESMAN_ID, ORD_DATE
ORDER BY SALESMAN_ID, ORD_DATE;

8. Write a SQL statement to display customer name, city and grade in such a manner that, the customer holding highest grade will come first.  
SELECT CUST_NAME,CITY,GRADE 
FROM CUSTOMER
WHERE GRADE IS NOT NULL
ORDER BY GRADE DESC;

9. Write a SQL statement to make a report with customer ID in such a manner that, the largest number of orders booked by the customer will come first along with their highest purchase amount. 
SELECT CUSTOMER_ID, COUNT(DISTINCT(ORD_NO)), MAX(PURCH_AMT)
FROM ORDERS
GROUP BY CUSTOMER_ID
ORDER BY 2 DESC

10. Write a SQL statement to make a report with order date in such a manner that, the latest order date will come last along with the total purchase amount and total commission (15% for all salesmen) for that date. 
SELECT ORD_DATE, SUM(PURCH_AMT), (SUM(PURCH_AMT)*0.15) AS "TOTAL_COMMISSION"
FROM ORDERS
GROUP BY ORD_DATE
ORDER BY ORD_DATE


