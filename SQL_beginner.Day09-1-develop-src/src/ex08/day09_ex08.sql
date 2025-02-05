CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER 
DEFAULT 10) RETURNS TABLE(f BIGINT) AS 
$fnc_fibonacci$
	WITH RECURSIVE
	    fibonacci (a, b) AS (
	        VALUES (0, 1)
	        UNION ALL
	        SELECT b, a + b
	        FROM fibonacci
	        WHERE
	            b < pstop
	    )
	SELECT a
	FROM fibonacci;
$fnc_fibonacci$
LANGUAGE
sql; 

select * from fnc_fibonacci (100);

select * from fnc_fibonacci (20);