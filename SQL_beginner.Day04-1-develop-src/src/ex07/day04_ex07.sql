INSERT INTO
    person_visits
VALUES (
        (
            SELECT MAX(id) + 1
            FROM person_visits
        ), (
            SELECT p.id
            FROM person p
            WHERE
                p.name = 'Dmitriy'
        ), (
            SELECT m.pizzeria_id
            FROM menu m
                JOIN pizzeria pz ON m.pizzeria_id = pz.id
            WHERE
                m.price < 800
                AND pz.name != 'Papa Johns'
            LIMIT 1
        ), '2022-01-08'
    );

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;