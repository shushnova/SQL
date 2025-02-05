CREATE TABLE IF NOT EXISTS nodes (
    id BIGINT NOT NULL PRIMARY KEY, point1 varchar NOT NULL, point2 varchar NOT NULL, cost BIGINT NOT NULL
);

INSERT INTO
    nodes
VALUES (1, 'a', 'b', 10),
    (2, 'a', 'c', 15),
    (3, 'a', 'd', 20),
    (4, 'b', 'a', 10),
    (5, 'b', 'c', 35),
    (6, 'b', 'd', 25),
    (7, 'c', 'a', 15),
    (8, 'c', 'b', 35),
    (9, 'c', 'd', 30),
    (10, 'd', 'a', 20),
    (11, 'd', 'b', 25),
    (12, 'd', 'c', 30);

CREATE OR REPLACE VIEW tours AS
WITH RECURSIVE
    paths AS (
        SELECT DISTINCT
            'a,' || point2 AS points, cost, 0 AS level
        FROM nodes
        WHERE
            point1 = 'a'
            AND point2 != 'a'
        UNION
        SELECT DISTINCT
            points || ',' || point2 AS points, paths.cost + (
                SELECT cost
                FROM nodes
                WHERE
                    point1 = RIGHT(points, 1)
                    AND point2 = a2.point2
            ), level + 1
        FROM paths, nodes a2
        WHERE
            POSITION(point2 IN points) = 0
            AND level < 2
    )
SELECT cost + (
        SELECT cost
        FROM nodes
        WHERE
            point1 = RIGHT(points, 1)
            AND point2 = 'a'
    ) AS total_cost, '{' || points || ',a}' AS tour
FROM paths
WHERE
    level = 2
ORDER BY total_cost, tour;

SELECT *
FROM tours
WHERE
    total_cost = (
        SELECT MIN(total_cost)
        FROM tours
    )
ORDER BY total_cost, tour;