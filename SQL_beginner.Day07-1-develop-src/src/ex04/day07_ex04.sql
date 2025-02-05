SELECT p.name, numb.count AS count_of_visits
FROM (
        SELECT pv.person_id, COUNT(*) AS count
        FROM person_visits pv
        GROUP BY
            pv.person_id
        HAVING
            COUNT(*) > 3
    ) AS numb
    JOIN person p ON numb.person_id = p.id;