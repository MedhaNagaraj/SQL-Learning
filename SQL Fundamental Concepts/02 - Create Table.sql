CREATE A TABLE IN DATABASE

-> Syntax:

CREATE TABLE table_name
(
	column_name TYPE column_constraint,
	column_name TYPE column_constraint,
	table_constraint table_constraint
) INHERITS existing_table_name;

-- Example Tables

CREATE TABLE players
(
	player_id SERIAL PRIMARY KEY,
	age SMALLINT NOT NULL
);

/*

SERIAL in POSTGRESQL
- Special database object
- Generates sequence of integers
- Used as a primary key column in a table
- SERIAL will create a sequence object and set the next value generated as the default value for the column
- This is perfect for primary key because it logs unique integer entries automatically upon insertion
- If a row is removed later, the column with the SERIAL datatype will not adjust, marking the fact that a row was removed from the sequence
- Types: smallserial, serial, bigserial
*/

-- Create a DATABASE 'learning' with the following tables

CREATE TABLE account
(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
)

CREATE TABLE job
(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(50) UNIQUE NOT NULL
)

CREATE TABLE account_job
(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
)









