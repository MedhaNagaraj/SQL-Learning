19. FULL OUTER JOIN:
-	Syntax: Select * from TableA
			Full Outer Join TableB
			On TableA.col_match = TableB.col_match
- Grab everything from both the tables 
- Example: 	SELECT * FROM Registrations
			FULL OUTER JOIN Logins
			ON Registrations.Name = Logins.Name
- This join grabs everything and fills in the 'null' values for the mismatched values
- FULL OUTER JOIN with a WHERE Statement:
			Select * from TableA
			Full Outer Join TableB
			On TableA.col_match = TableB.col_match
			Where TableA.id IS NULL OR TableB.id IS NULL
- This WHERE statement removes those common rows and gives only the columns which are not matched in both the rows
- Opposite of an INNER JOIN.
- Example: 	SELECT * FROM Registrations
			FULL OUTER JOIN Logins
			ON Registrations.Name = Logins.Name
			WHERE Registrations.id IS NULL OR Logins.id IS NULL
- This gives only those results which are unique to those two tables

			