CREATE TABLE person_audit (
    created TIMESTAMPTZ DEFAULT now() NOT NULL, type_event CHAR(1) DEFAULT 'I' NOT NULL CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D')), row_id BIGINT NOT NULL, name VARCHAR NOT NULL, age INTEGER NOT NULL, gender VARCHAR NOT NULL, address VARCHAR
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit
() RETURNS trigger AS 
$fnc_trg_person_insert_audit$
BEGIN
	INSERT INTO
	    person_audit (
	        created, type_event, row_id, name, age, gender, address
	    )
	VALUES (
	        CURRENT_TIMESTAMP, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address
	    );
	RETURN NEW;
END;
$fnc_trg_person_insert_audit$
LANGUAGE
plpgsql; 

CREATE
OR REPLACE TRIGGER trg_person_insert_audit
AFTER INSERT ON person FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_insert_audit ();

INSERT INTO
    person (
        id, name, age, gender, address
    )
VALUES (
        10, 'Damir', 22, 'male', 'Irkutsk'
    );