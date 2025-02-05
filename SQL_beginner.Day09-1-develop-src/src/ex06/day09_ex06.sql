CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date
(IN pperson VARCHAR DEFAULT 'Dmitriy', IN pprice NUMERIC 
DEFAULT 500, IN pdate DATE DEFAULT '2022-01-08') RETURNS TABLE
(pizzeria_name VARCHAR) AS 
$fnc_person_visits_and_eats_on_date$
BEGIN
	RETURN QUERY
	SELECT pz.name
	FROM
	    pizzeria pz
	    JOIN person_visits pv ON pv.pizzeria_id = pz.id
	    JOIN person p ON p.id = pv.person_id
	    JOIN menu m ON m.pizzeria_id = pz.id
	WHERE
	    p.name = pperson
	    AND pv.visit_date = pdate
	    AND m.price < pprice;
END;
$fnc_person_visits_and_eats_on_date$
LANGUAGE
plpgsql 

select * from fnc_person_visits_and_eats_on_date (pprice := 800);

select *
from
    fnc_person_visits_and_eats_on_date (
        pperson := 'Anna', pprice := 1300, pdate := '2022-01-01'
    );