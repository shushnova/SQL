SELECT pizzeria.name AS pizzeria_name
FROM
    pizzeria
    JOIN menu m ON m.pizzeria_id = pizzeria_id
    AND m.price < 800
    JOIN person_visits pv ON pv.pizzeria_id = m.pizzeria_id
    AND pv.visit_date = '2022-01-08'
    JOIN person p ON p.id = pv.person_id
    AND p.name = 'Dmitriy'