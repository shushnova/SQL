WITH
    tempik AS (
        (
            SELECT name, COUNT(*) AS count, 'visit' AS action_type
            FROM person_visits
                JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
            GROUP BY
                pizzeria_id, name
            ORDER BY count DESC, name
        )
        UNION
        (
            SELECT name, COUNT(*) AS count, 'order' AS action_type
            FROM
                person_order
                JOIN menu ON menu.id = person_order.menu_id
                JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
            GROUP BY
                pizzeria_id, name
            ORDER BY count DESC, name
        )
        ORDER BY 3, 2 DESC
    )
SELECT name, SUM(count) AS total_count
FROM tempik
GROUP BY
    name
ORDER BY total_count DESC;