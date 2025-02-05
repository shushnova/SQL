WITH
    numb AS (
        SELECT p.address, ROUND(
                (
                    MAX(p.age) - MIN(p.age)::float4 / MAX(p.age)
                )::numeric, 2
            ) AS formula, ROUND(AVG(p.age), 2) AS average
        FROM person p
        GROUP BY
            p.address
    )
SELECT *, formula > average AS comparison
FROM numb
ORDER BY numb.address;