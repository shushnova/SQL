SELECT name, age, address
FROM person
WHERE
    address = 'Kazan'
    AND gender = 'female'
ORDER BY name;