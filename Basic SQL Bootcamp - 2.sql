16. AS CLAUSE:
- 	AS clause, creates Alias
-	Syntax : SELECT column AS new_name FROM table
-	Example : SELECT SUM(amount) as net_revenue FROM payment
-	AS Operator get executed at the very end of the query, and we cannot use it inside a WHERE operator

17. JOINS:
- 	Combine information from multiple tables.
- 	INNER, OUTER, FULL, FULL OUTER, UNION
- 	Main reason for different JOIN types is to decide how to deal with information only present in one of the joined tables

	1. INNER JOIN:
	-	 Syntax:	SELECT * FROM TableA 
					INNER JOIN TableB
					ON TableA.col_match = TableB.col_match  
	- Symmetrical in nature

18. JOIN CHALLENGES:
	- 	SELECT email, address.district
		FROM customer
		JOIN address
		ON customer.address_id = address.address_id
		WHERE district = 'California'
		ORDER BY email
