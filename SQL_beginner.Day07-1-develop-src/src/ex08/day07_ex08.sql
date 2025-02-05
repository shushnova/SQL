SELECT p.address, pz.name, COUNT(*) AS count_of_orders
FROM
    person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN person p ON po.person_id = p.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
GROUP BY
    p.address,
    pz.name
ORDER BY p.address, pz.name;