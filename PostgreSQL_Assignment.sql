CREATE TABLE rangers (
    ranger_id serial PRIMARY KEY,
    name VARCHAR(100) not NULL,
    region VARCHAR(75) not NULL
);

--------------------
INSERT INTO
    rangers (name, region)
VALUES (
        'Alice Green',
        'Northern Hills'
    ),
    ('Bob White', 'River Delta'),
    (
        'Carol King',
        'Mountain Range'
    );
---------------------------
SELECT * from rangers;