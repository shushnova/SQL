SELECT person_order.order_date, person.name || ' (age:' || person.age || ')' AS person_information
FROM person_order
    NATURAL JOIN person
ORDER BY person_order.order_date, person_information;