WITH
    man AS (
        SELECT pizzeria_id
        FROM menu
            JOIN person_order po ON po.menu_id = menu.id
        WHERE
            po.person_id IN (
                SELECT id
                FROM person
                WHERE
                    gender = 'female'
            )
    ),
    woman AS (
        SELECT pizzeria_id
        FROM menu
            JOIN person_order po ON po.menu_id = menu.id
        WHERE
            po.person_id IN (
                SELECT id
                FROM person
                WHERE
                    gender = 'male'
            )
    )
SELECT name AS pizzeria_name
FROM pizzeria
WHERE
    pizzeria.id = (
        SELECT pizzeria_id
        FROM man
        WHERE
            pizzeria_id NOT IN (
                SELECT pizzeria_id
                FROM woman
            )
        UNION
        SELECT pizzeria_id
        FROM woman
        WHERE
            pizzeria_id NOT IN (
                SELECT pizzeria_id
                FROM man
            )
    )
ORDER BY pizzeria_name;