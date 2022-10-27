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
