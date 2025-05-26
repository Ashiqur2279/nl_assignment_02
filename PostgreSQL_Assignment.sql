CREATE TABLE rangers (
    ranger_id serial PRIMARY KEY,
    name VARCHAR(100) not NULL,
    region VARCHAR(75) not NULL
);

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

CREATE TABLE sightings (
    sighting_id serial PRIMARY KEY,
    species_id INTEGER REFERENCES species (species_id),
    ranger_id INTEGER REFERENCES rangers (ranger_id),
    location VARCHAR(50) not NULL,
    sighting_time TIMESTAMP not NULL,
    notes text
);

INSERT INTO
    sightings (
        species_id,
        ranger_id,
        location,
        sighting_time,
        notes
    )
VALUES (
        1,
        1,
        'Peak Ridge',
        '2024-05-10 07:45:00',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
        1,
        2,
        'Snowfall Pass',
        '2024-05-18 18:30:00',
        NULL
    );

--problem 01
INSERT INTO
    rangers ("name", region)
VALUES ('Derek Fox', 'Coastal Plains');

--problem 02
SELECT count(DISTINCT species_id) as unique_species_count
FROM sightings

-- problem 03
SELECT * FROM sightings WHERE "location" LIKE '%Pass%';

--problem 04

SELECT r.name, count(s.ranger_id) as total_sightings
FROM rangers as r
    JOIN sightings as s on r.ranger_id = s.ranger_id
GROUP BY
    r.name
ORDER BY r.name;

--problem 05
SELECT sp.common_name
from species as sp
    LEFT join sightings as si on sp.species_id = si.species_id
WHERE
    si.species_id IS NULL;

--problem 06
SELECT sp.common_name, si.sighting_time, r.name
FROM
    species as sp
    join sightings as si on sp.species_id = si.species_id
    JOIN rangers as r on r.ranger_id = si.ranger_id
ORDER BY si.sighting_time DESC
LIMIT 2;

--problem 07:

UPDATE species
set
    conservation_status = 'Historic'
WHERE
    extract(
        YEAR
        FROM discovery_date
    ) < 1800;

--problem 08:
select
    sighting_id,
    CASE
        WHEN extract(
            HOUR
            from sighting_time
        ) < 12 THEN 'Morning'
        WHEN extract(
            HOUR
            FROM sighting_time
        ) BETWEEN 12 and 17  THEN 'Afternoon'
        else 'Evening'
    end as time_of_day
from sightings;

--problem 09:
DELETE FROM rangers as r USING (
    SELECT r.ranger_id
    from rangers as r
        LEFT join sightings as si on r.ranger_id = si.ranger_id
    WHERE
        si.ranger_id is null
) as to_delete_ranger
WHERE
    r.ranger_id = to_delete_ranger.ranger_id;