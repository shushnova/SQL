INSERT INTO
    person_order
SELECT (
        SELECT MAX(po.id) + gs.id
        FROM person_order po
    ), gs.id, (
        SELECT id
        FROM menu
        WHERE
            pizza_name = 'greek pizza'
    ), '2022-02-25'
FROM GENERATE_SERIES(
        1, (
            SELECT COUNT(id)
            FROM person
        )
    ) AS gs (id);