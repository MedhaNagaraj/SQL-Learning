/* 
CREATE DATABASE AND TABLES.

SECTION OVERVIEW: 
	- Data Types
	- Primary and Foreign Keys
	- Constraints
	- CREATE
	- INSERT
	- UPDATE
	- DELETE, ALTER, DROP
*/

-- Choosing a correct datatype for stored value and setting constraints on it.

1. DATATYPES:

-> Most common Datatypes
	- Boolean:	TRUE or FALSE
	- Character:char, varchar, and text
	- Numeric:	Integer, floating-point number
	- Temporal:	Date, Time, Timestamp, interval

-> Other Used Datatypes:
	- UUID:	Universally Unique Identifiers
	- Array: Stores an array of string, numbers, etc.
	- JSON
	- Hstore key-value pair
	- Special types such as network address and geometric data
	
-> Do a google search and check the database documentation to know what datatype to use for long term storage.


2. PRIMARY AND FOREIGN KEYS:

-> Primary Key: 
	- It is a column or a group of columns used to identify a row uniquely in a table
	- Should be unique(distinct) and non-null (entry is a must)
	- Allow us to easily discern what columns should be used for joining tables together

-> Foreign Key:
	- It is a field or a group of fields that uniquely identifies a row in another table
	- It is defined in a table that references to the primary key of the other table
	- Table containing the foreign key is called as Referencing / Child table
	- Table which the foreign key references is called Referenced / Parent table
	- Table can have multiple foreign keys depending on its relationship with other tables
	

3. CONSTRAINTS:

- Rules enforced on data columns on table
- Used to prevent invalid data from being entered into the database
- Ensures accuracy and reliability of data in the database
- 2 categories: 
	- Column constraints: Constraints the data in a column to adhere to certain conditions 
	- Table Constraints: Applied to the entire table rather than to an individual column
	
-> Common Column constraints:
	-	NOT NULL:	Ensures that a column cannot have a NULL value
	- 	UNIQUE:		Ensures that all values in a columns are different
	- 	Primary Key:Uniquely identifies each row or record in a database table
	- 	Foreign Key:Constraints data based on columns in other tables
	- 	CHECK:		Ensures that all values in a column satisfy certain conditions
	- 	EXCLUSION:	Ensures that if two rows are compared on the specified column or expression, not all of these comparisons will return TRUE
	
-> Common Table Constraints:
	- CHECK(condition):	Check condition when inserting or updating data
	- REFERENCES:		To constrain the value stored in the column that must exist in a column in another table
	- UNIQUE(col_list): Forces valyes stored in the columns listed inside the parantheses to be unique
	- Primary Key(col_list): Allows you to define the primary key that consists of multiple columns














