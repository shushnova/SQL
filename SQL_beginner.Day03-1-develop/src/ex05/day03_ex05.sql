WITH
    Andrey_visit AS (
        SELECT DISTINCT
            pizzeria.name AS pizzeria_name
        FROM
            person_visits
            JOIN person ON person_visits.person_id = person.id
            JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
        WHERE
            person.name = 'Andrey'
    ),
    Andrey_orders AS (
        SELECT DISTINCT
            pizzeria.name AS pizzeria_name
        FROM
            person_order
            JOIN menu ON person_order.menu_id = menu.id
            JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
            JOIN person ON person_order.person_id = person.id
        WHERE
            person.name = 'Andrey'
    )
SELECT *
FROM Andrey_visit
EXCEPT
SELECT *
FROM Andrey_orders
ORDER BY pizzeria_name;