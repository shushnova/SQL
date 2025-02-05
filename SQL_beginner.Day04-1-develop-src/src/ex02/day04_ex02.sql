CREATE VIEW v_generated_dates AS
SELECT '2022-01-01'::date + generate_series(0, 30) AS generated_date
ORDER BY 1;