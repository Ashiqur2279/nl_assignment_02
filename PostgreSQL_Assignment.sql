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

CREATE TABLE species (
    species_id serial PRIMARY KEY,
    common_name VARCHAR(75) NOT nULL,
    scientific_name VARCHAR(75) not NULL,
    discovery_date DATE not NULL,
    conservation_status VARCHAR(50) not null
);

INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );
--
-------------------------------------------
select * from species;