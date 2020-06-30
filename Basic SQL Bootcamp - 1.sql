SQL - PostgreSQL

1. SELECT:
	- SELECT * FROM film;
	- SELECT first_name, last_name, email FROM customer 
	- SELECT rating FROM film 
	
2. DISTINCT
	- SELECT DISTINCT rating FROM film 
	- SELECT DISTINCT * FROM film 
	- SELECT DISTINCT RENTAL_RATE FROM film 
	- SELECT DISTINCT RENTAL_RATE FROM film ORDER BY RENTAL_RATE
	
3. COUNT
	- SELECT COUNT(*) FROM payment
	- SELECT COUNT(first_name) FROM actor
	- SELECT COUNT(*) FROM actor
	- SELECT COUNT(DISTINCT first_name) FROM actor
	
4. WHERE
	- SELECT * FROM customer WHERE first_name = 'Jared'
	- SELECT * FROM film WHERE rental_rate > 4
	- SELECT DISTINCT rental_rate FROM film
	- SELECT * FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99
	- SELECT * FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R'
	- SELECT COUNT(title) FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R'
	- SELECT COUNT(*) FROM film WHERE rating = 'R' OR rating = 'PG-13'
	- SELECT * FROM film WHERE rating != 'R' 
	
5. CHALLENGE PROBLEMS

CHALLENGE NO.1: WHAT IS THE EMAIL OF THE CUSTOMER WITH THE NAME NANCY THOMAS?
	- SELECT email 	FROM customer 	WHERE first_name = 'Nancy' AND last_name = 'Thomas'
	
CHALLENGE NO.2: WHAT THE MOVIE 'OUTLAW HANKY' IS ABOUT? DESCRIPTION OF THE MOVIE?
	- SELECT title, description FROM FILM WHERE title = 'Outlaw Hanky'
	
CHALLENGE NO.3: GET THE PHONE NUMBER OF A CUSTOMER WHO LIVES AT '259 Ipoh Drive'
	- SELECT phone FROM address WHERE address = '259 Ipoh Drive'
	
6. ORDER BY: SORT THE ROWS BASED ON THE COLUMN VALUE IN EITHER ASCENDING(ASC) OR DESCENDING ORDER(DESC)
	- SELECT * FROM CUSTOMER ORDER BY first_name DESC
	- SELECT store_id, first_name, last_name FROM CUSTOMER ORDER BY store_id, first_name
	- SELECT store_id, first_name, last_name FROM CUSTOMER ORDER BY store_id DESC, first_name
	- SELECT first_name, last_name FROM CUSTOMER ORDER BY store_id DESC, first_name: Need not have the column in the Select field
	
7. LIMIT:
- Allows to limit the number of rows returned for a query
- Useful for not wanting to return every single row in a table
- Used in combination with ORDER BY
- Goes at the very end of the query and is the last command executed
- Examples
	1. Top 'n' (5) most recent payments of the year
	SELECT * FROM payment ORDER BY payment_date DESC LIMIT 5
	
	2. Top 5 most recent payments of the year where amount is not 0
	SELECT * FROM payment WHERE amount !=0 ORDER BY payment_date DESC LIMIT 5

8. CHALLENGE:
	1. What are the customer ids of the first 10 customers who created a payment?
		- SELECT customer_id FROM payment ORDER BY payment_date LIMIT 10
	2. What are the 5 shortest(in length of runtime) movies?
		- SELECT title,length FROM film ORDER BY length LIMIT 5
	3. If a customer can watch a film that is 50 minutes or less in runtime, how many options does she have?
		- SELECT count(title or *) FROM film WHERE length <= 50
		
9. BETWEEN:
- This operator is used to match a value against a range of values - Low and high
- value BETWEEN low AND high (value >= low AND value <= high)
- value NOT BETWEEN low AND high (value < low AND > high)
- can also be used with dates: ISO 8601 format YYYY-MM-DD
eg. date BETWEEN '2007-02-01'
- Date can include timestamp information, 0:00
	1. SELECT count(*) FROM payment WHERE amount BETWEEN 8 AND 9
	2. SELECT * FROM payment WHERE amount NOT BETWEEN 8 AND 9
	3. SELECT * FROM payment WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15' ORDER BY payment_date
	
10. IN:
- Lets you check for multiple possible value options
- Eg, in a list of names
- Use IN operator to create a condition that checks to see if a value is included in a list of multiple options
eg: value in (option1, option2...)
	1. SELECT color from table where color IN ('red','blue')
	2. SELECT * FROM payment WHERE amount IN (0.99,1.98,1.99) 
	3. SELECT count(*) FROM payment WHERE amount IN (0.99,1.98,1.99) 
	4. SELECT count(*) FROM payment WHERE amount NOT IN (0.99,1.98,1.99)
	5. SELECT * FROM customer WHERE first_name IN ('John','Julie','Jake')
	6. SELECT * FROM customer WHERE first_name NOT IN ('John','Julie','Jake')
	
11. LIKE and ILIKE:
- Using Pattern Matching with String Data
- Used to match against a general pattern in a string
- eg: All emails ending in '@gmail.com'
	  All names that begin with an 'A'
- Wildcard characters: '%' (matches any sequence of characters)
	and '_' (Matches any single character)
- eg:	WHERE name LIKE 'A%'
		WHERE name LIKE '%a'
		(LIKE is case-sensitive) ILIKE is case-insensitive
		WHERE title LIKE 'Mission Impossible _'
		WHERE value LIKE 'Version#__' (eg, for Version #A4)
		WHERE name LIKE '_her%' (can use them in combination)
- Regular Expressions can also be used for Pattern Matching regex
Examples:
	1. SELECT * FROM customer WHERE first_name LIKE ('J%')
	2. SELECT Count(*) FROM customer WHERE first_name LIKE ('J%')
	3. SELECT * FROM customer WHERE first_name LIKE ('J%') AND last_name LIKE 'J%'
	4. SELECT * FROM customer WHERE first_name ILIKE ('J%') AND last_name ILIKE 's%'
	5. SELECT * FROM customer WHERE first_name LIKE ('%er%')
	6. SELECT * FROM customer WHERE first_name LIKE ('_her%')
	7. SELECT * FROM customer WHERE first_name NOT LIKE ('_her%')
	8. SELECT * FROM customer WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%' ORDER BY last_name

12. CHALLENGE 3:
	1. How many payment transactions were greater than $5.00?
		SELECT COUNT(*) FROM payment WHERE amount > 5.00 ORDER BY amount
	
	2. How many actors have a first_name that starts with 'P'?
		SELECT COUNT(*) FROM actor WHERE first_name LIKE 'P%'
	
	3. How many unique districts are the customers from?
		SELECT COUNT(DISTINCT district) FROM address
	
	4. Retrieve the list of names of those distinct districts from 3.
		SELECT DISTINCT district FROM address
	
	5. How many films have a rating of R and a replacement_cost between $5 and $15?
		SELECT count(*) FROM film WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15
	
	6. How many films have the word Truman somewhere in the title?
		SELECT count(*) FROM film WHERE title LIKE '%Truman%' 
		SELECT count(*) FROM film WHERE title ILIKE '%truman%'

13. GROUP BY:
- Allows to 'Aggregate Data' and apply functions to better understand how data is distributed per category

AGGREGATE FUNCTIONS:
- Take multiple inputs and return single output
- AVG(), COUNT(), MAX(), MIN(), SUM()
- Happens only in SELECT and HAVING clause
- AVG() returns floating point value many decimal places
- You can use ROUND() to specify precision after the decimal
- COUNT() returns the number of rows, by convention we use *
egs:
	- SELECT MAX(replacement_cost) FROM film
	- SELECT MIN(replacement_cost) FROM film
	- SELECT MAX(replacement_cost), MIN(replacement_cost) FROM film
	- SELECT ROUND(AVG(replacement_cost),2) FROM film
	- SELECT SUM(replacement_cost) FROM film

- GROUP BY allows us to aggregate columns per category
- Choose a non-continuous categorical column to group by
- Combined with SUM or COUNT
- Syntax : SELECT category_col, AGG(data_col) FROM table GROUP BY category_col
- eg: SELECT category_col, AGG(data_col) FROM table	WHERE category_col != 'A' GROUP BY category_col 
- GROUP BY Clause must appear right after a FROM or WHERE statement
- In the SELECT statement, columns must either have an aggregate function or be in the GROUP BY call
eg: SELECT company, division, SUM(sales) FROM finance_table GROUP BY company, division
- WHERE statements should come before group by

Simple Group By:
	- SELECT customer_id FROM payment GROUP BY customer_id ORDER BY customer_id

Aggregate Function:What customer Id is spending the most amount of money
	- SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount)

How many transactions are occuring:
	- SELECT customer_id, COUNT(amount) FROM payment GROUP BY customer_id ORDER BY COUNT(amount)

How to display the customer and total amount for each staff ids
	- SELECT customer_id, staff_id, SUM(amount) FROM payment GROUP BY customer_id, staff_id ORDER BY customer_id, staff_id

GROUP BY on a date column:
- Display the only the dates of the payment dates:
	- SELECT DATE(payment_date) FROM payment
- Display the dates with sum of payments:
	- SELECT DATE(payment_date), SUM(amount) FROM payment GROUP BY DATE(payment_date) ORDER BY SUM(amount) DESC

GROUP BY CHALLENGES:
	1.  Staff members with staff_id 1 & 2, we want to give bonus to the staff member who handled most payments. How many payments did each staff member handle and who gets the bonus?
		-	SELECT staff_id, Count(payment_id) 
			FROM payment 
			GROUP BY staff_id 
			ORDER BY Count(payment_id)
	
	2.  What is the average replacement_cost per MPAA Rating?
		-	SELECT rating, ROUND(AVG(replacement_cost), 2)
			FROM film
			GROUP BY rating
			
	3. 	What are the customer ids of the top 5 customers by total spends?
		-	SELECT customer_id, SUM(amount)
			FROM payment
			GROUP BY customer_id
			ORDER BY SUM(amount) DESC
			LIMIT 5

14. HAVING CLAUSE:
- 	Allows to filter after an aggregation has taken places
- 	Comes after Group BY, but before ORDER BY
- 	Works similar to a WHERE statement but can be used after a GROUP BY
- 	Examples:
	- 	SELECT customer_id, SUM(amount) FROM payment
		WHERE customer_id NOT IN(184, 87, 477)
		GROUP BY customer_id
	- 	SELECT customer_id, SUM(amount)
		FROM payment
		GROUP BY customer_id
		HAVING SUM(amount) > 100
	- 	SELECT store_id, COUNT(customer_id)
		FROM customer
		GROUP BY store_id
		HAVING COUNT(customer_id) > 300
		
- CHALLENGES on HAVING
1. What customer_ids are eligible for platinum status, i.e. customers that have 40 or more trasaction payments?
	-	SELECT customer_id, COUNT(payment_id)
		FROM payment
		GROUP BY customer_id
		HAVING COUNT(payment_id) >= 40
		ORDER BY COUNT(payment_id) DESC

2. 	What are the customer_ids who have spent more than $100 in payment transactions with staff_id = 2?
	-	SELECT customer_id, SUM(amount)
		FROM payment
		WHERE staff_id = 2
		GROUP BY customer_id
		HAVING SUM(amount) > 100
		ORDER BY SUM(amount)

COALESCE Function in SQL: Returns the first Non-Null value in the list
- SELECT COALESCE(NULL, NULL, 1, 2, 'www')


15. ASSESSMENT TEST:

	1. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.
		SELECT customer_id, SUM(amount)
		FROM payment
		WHERE staff_id = 2
		GROUP BY customer_id
		HAVING SUM(amount) >= 110
		ORDER BY SUM(amount)
		
	2. How many films begin with the letter J?
		SELECT COUNT(title)
		FROM film
		WHERE title LIKE 'J%'
	
	3. What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
		SELECT first_name, last_name
		FROM customer
		WHERE first_name LIKE 'E%' AND address_id < 500
		ORDER BY customer_id DESC
		LIMIT 1















