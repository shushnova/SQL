SELECT name AS object_name
FROM (
        SELECT *
        FROM person
        ORDER BY person.name
    ) AS p
UNION ALL
SELECT pizza_name AS object_name
FROM (
        SELECT *
        FROM menu
        ORDER BY menu.pizza_name
    ) AS m;