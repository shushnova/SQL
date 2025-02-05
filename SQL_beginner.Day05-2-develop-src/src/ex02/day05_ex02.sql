SET enable_seqscan = OFF;

CREATE INDEX idx_person_name ON person (upper(name));

EXPLAIN ANALYZE SELECT name FROM person WHERE upper(name) = 'ANDREY';