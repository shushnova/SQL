SELECT m.pizza_name, pz.name AS pizzeria_name
FROM
    menu m
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    JOIN person_order po ON m.id = po.menu_id
    JOIN person p ON p.id = po.person_id
    AND p.name IN ('Denis', 'Anna')
ORDER BY pizza_name, pizzeria_name;