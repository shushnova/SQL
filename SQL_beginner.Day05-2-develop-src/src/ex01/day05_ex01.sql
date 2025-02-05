SET enable_seqscan = OFF;

SELECT pizza_name, name AS pizzeria_name
FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;

EXPLAIN
ANALYZE
SELECT pizza_name, name AS pizzeria_name
FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;