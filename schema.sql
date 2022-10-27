/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int,
    name varchar(64),
    date_of_birt date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);

/* Day 2 Project */
ALTER TABLE animals
ADD COLUMN species VARCHAR (32);

/* Day 3 Project */
SELECT name FROM animals A 
JOIN owners O ON O.id = A.owner_id AND O.full_name = 'Melody Pond';

SELECT * FROM animals A
JOIN species S ON A.species_id = S.id AND A.species_id = 1;

SELECT owners.full_name, animals.name FROM animals
FULL JOIN owners ON owners.id = animals.owner_id;

SELECT COUNT(species_id) FROM animals
FULL JOIN species ON species.id = animals.species_id GROUP BY species_id;

SELECT name FROM animals
RIGHT JOIN owners ON owners.id = animals.owner_id AND owner_id = 2 AND species_id = 2;

SELECT name FROM animals
JOIN owners ON owners.id = animals.owner_id AND escape_attempts = 0 AND owner_id = 5;

SELECT owners.full_name,  COUNT(owner_id) FROM animals
RIGHT JOIN owners ON owners.id = animals.owner_id GROUP BY owners.full_name;
