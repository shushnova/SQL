SELECT action_date, (
        SELECT name
        FROM person
        WHERE
            id = person_id
    ) AS person_name
FROM (
        SELECT
            order_date as action_date, person_id
        FROM person_order
        INTERSECT
        SELECT visit_date, person_id
        FROM person_visits
    ) as tmp
ORDER BY action_date, person_name DESC;