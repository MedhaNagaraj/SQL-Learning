-- Assessment Test: Complete the following tasks

-- 1. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.


SELECT customer_id, staff_id, Sum(amount) as "sum_amount"
FROM payment
WHERE staff_id = 2
GROUP BY customer_id, staff_id
HAVING sum(amount) > 110

-- The answer should be customers 187 and 148.


-- 2. How many films begin with the letter J?

SELECT count(distinct title)
FROM film
WHERE title like 'J%'

-- The answer should be 20.

-- 3. What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?

SELECT customer_id, first_name, last_name, address_id
FROM customer
WHERE first_name like 'E%' 
AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1

-- The answer is Eddie Tomlin

