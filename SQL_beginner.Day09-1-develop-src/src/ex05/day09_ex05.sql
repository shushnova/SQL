CREATE OR REPLACE FUNCTION fnc_persons(IN pgender VARCHAR 
DEFAULT 'female') RETURNS TABLE(id bigint, name varchar, age 
bigint, gender varchar, address varchar) AS 
$fnc_persons$
	SELECT * FROM person WHERE gender = pgender $fnc_persons$ LANGUAGE 
sql; 

select * from fnc_persons (pgender := 'male');

select * from fnc_persons ();