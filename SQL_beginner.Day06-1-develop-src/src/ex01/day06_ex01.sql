WITH
    order_count AS (
        SELECT po.person_id, m.pizzeria_id, COUNT(*) AS count
        FROM person_order po
            JOIN menu m ON po.menu_id = m.id
        GROUP BY
            po.person_id, m.pizzeria_id
    )
INSERT INTO
    person_discounts
SELECT
    ROW_NUMBER() OVER (),
    oc.person_id,
    oc.pizzeria_id,
    CASE
        WHEN oc.count = 1 THEN 10.5
        WHEN oc.count = 2 THEN 22
        ELSE 30
    END
FROM order_count oc;