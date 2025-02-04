WITH
    woman AS (
        SELECT COUNT(person_id) AS count, pizzeria_id
        FROM person_visits
        WHERE
            person_id IN (
                SELECT id
                FROM person
                WHERE
                    gender = 'female'
            )
        GROUP BY
            pizzeria_id
    ),
    man AS (
        SELECT COUNT(person_id) AS count, pizzeria_id
        FROM person_visits
        WHERE
            person_id IN (
                SELECT id
                FROM person
                WHERE
                    gender = 'male'
            )
        GROUP BY
            pizzeria_id
    )
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
WHERE
    pizzeria.id IN (
        SELECT woman.pizzeria_id
        FROM woman
            INNER JOIN man ON woman.pizzeria_id = man.pizzeria_id
        WHERE
            woman.count <> man.count
    )
ORDER BY pizzeria_name;