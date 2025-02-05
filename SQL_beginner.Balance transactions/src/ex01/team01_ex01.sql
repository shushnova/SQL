insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); 
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');


WITH rich AS (
    SELECT
        COALESCE(u.name, 'not defined') AS "name",
        COALESCE(lastname, 'not defined') AS lastname,
        COALESCE(currency."name", 'not defined') AS currency_name,
        money AS currency_in_usd,
        (SELECT currency.rate_to_usd FROM currency
			WHERE currency.id = balance.currency_id AND currency.updated < balance.updated
			ORDER BY rate_to_usd LIMIT 1
			) AS t1,
		(SELECT currency.rate_to_usd FROM currency
			WHERE currency.id = balance.currency_id  AND currency.updated > balance.updated
			ORDER BY rate_to_usd LIMIT 1
			) AS t2
    FROM
        balance
        LEFT JOIN "user" AS u ON balance.user_id = u.id
        INNER JOIN currency ON balance.currency_id = currency.id
    GROUP BY
        u.name,
        u.lastname,
        currency.name,
        money,
        balance.currency_id,
        balance."type",
        balance.updated
)
SELECT DISTINCT name, lastname, currency_name,
    currency_in_usd * COALESCE(t1, t2) AS currency_in_usd
FROM rich
ORDER BY name DESC, lastname, currency_name;