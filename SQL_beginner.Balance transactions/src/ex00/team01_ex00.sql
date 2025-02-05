WITH rich AS (
    SELECT
        COALESCE(u.name, 'not defined') AS "name",
        COALESCE(lastname, 'not defined') AS lastname,
        "type",
        SUM(money) AS volume,
        currency_id
    FROM
        balance
        LEFT JOIN "user" AS u ON balance.user_id = u.id
    GROUP BY
        u.name,
        u.lastname,
        "type",
        currency_id
    ORDER BY name DESC, lastname, "type"
),
actuals AS (
    SELECT id, name, rate_to_usd
    FROM currency
    WHERE updated = (SELECT MAX(updated) FROM currency curr WHERE name = curr.name))
SELECT DISTINCT
    rich.name,
    rich.lastname,
    rich.type,
    rich.volume,
    COALESCE(currency."name", 'not defined') AS currency_name,
    COALESCE((
        SELECT rate_to_usd FROM actuals WHERE actuals.id = currency_id
        ), 1) AS last_rate_to_usd,
    volume * COALESCE((
        SELECT rate_to_usd FROM actuals WHERE actuals.id = currency_id
        ), 1) AS total_volume_in_usd
FROM
    rich
    LEFT JOIN currency ON rich.currency_id = currency.id
GROUP BY
    rich.name,
    rich.lastname,
    rich.type,
    rich.volume,
    currency_name,
    currency.id,
    last_rate_to_usd,
    currency.rate_to_usd
ORDER BY name DESC, lastname, "type";