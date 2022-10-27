/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE wieght_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE wieght_kg >= 10.4 AND wieght_kg <= 17.3;

/* Day 2 Project */
BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
COMMIT;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET wieght_kg = wieght_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET wieght_kg = wieght_kg * -1 WHERE wieght_kg < 0;
COMMIT;
SELECT * FROM animals;

/* AGGREGATE FUNCTIONS */
SELECT COUNT(*) FROM animals;
SELECT COUNT (*) FROM animals WHERE neutered = false;
SELECT AVG(wieght_kg) FROM animals;
SELECT MAX(escape_attempts) FROM animals;
SELECT species, MAX(wieght_kg) FROM animals GROUP BY species;

/* Day 3 Project */
SELECT name FROM animals A 
JOIN owners O ON O.id = A.owner_id AND O.full_name = 'Melody Pond';

SELECT * FROM animals A
JOIN species S ON A.species_id = S.id AND A.name = 'Pokemon';

SELECT owners.full_name, animals.name FROM animals
FULL JOIN owners ON owners.id = animals.owner_id;

SELECT COUNT(species_id) FROM animals
FULL JOIN species ON species.id = animals.species_id GROUP BY species_id;

SELECT name FROM animals
RIGHT JOIN owners ON owners.id = animals.owner_id AND owners.full_name = 'Jennifer';

SELECT name FROM animals
JOIN owners ON owners.id = animals.owner_id AND escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

SELECT owners.full_name,  COUNT(owner_id) FROM animals
RIGHT JOIN owners ON owners.id = animals.owner_id GROUP BY owners.full_name;
