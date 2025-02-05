CREATE OR REPLACE FUNCTION fnc_persons_female() RETURNS 
TABLE(id bigint, name varchar, address varchar) AS 
$fnc_persons_female$
	  SELECT id , name , address FROM person WHERE gender = 'female' $fnc_persons_female$ LANGUAGE
	
sql; 

CREATE OR REPLACE FUNCTION fnc_persons_male() RETURNS 
TABLE(id bigint, name varchar, address varchar) AS 
$fnc_persons_male$
	  SELECT id , name , address FROM person WHERE gender = 'male' $fnc_persons_male$ LANGUAGE
	
sql; 

SELECT * FROM fnc_persons_male ();

SELECT * FROM fnc_persons_female ();