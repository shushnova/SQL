CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr 
NUMERIC[]) RETURNS NUMERIC AS 
$$
	SELECT min(num) FROM unnest(arr) AS num;
$$
LANGUAGE
sql; 

SELECT func_minimum ( VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4] );