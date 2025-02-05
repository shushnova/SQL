BEGIN;

SELECT SUM(rating) FROM pizzeria;

SELECT SUM(rating) FROM pizzeria;

COMMIT;

SELECT SUM(rating) FROM pizzeria;

-- Session #2
BEGIN;

UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';

COMMIT;

SELECT SUM(rating) FROM pizzeria;