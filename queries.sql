/*Queries that provide answers to the questions from all projects.*/

-- Animals whose name ends in "mon"
SELECT * FROM animals WHERE name LIKE '%mon';

-- Animals born between 2016 and 2019
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- Animals that are neutered and have less than 3 escape attempts
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

-- Date of birth of all animals named either "Agumon" or "Pikachu"
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

-- Escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

-- Animals that are neutered
SELECT * FROM animals WHERE neutered = TRUE;

-- All animals not named Gabumon
SELECT * FROM animals WHERE name <> 'Gabumon';

-- Animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Set species as unspecified and rollback
BEGIN
    update animals set species = 'unspecified';
    select * from animals;
ROLLBACK
    select * from animals;

-- Update digimon for animals ending in mon and pokemon for the rest
BEGIN
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT
select * from animals;

-- Delete all data from table and rollback
BEGIN;
    DELETE FROM animals;
    select * from animals;
rollback;
select * from animals;

-- Delete animals born after 01/01/2022
-- Create savepoint
-- Multiply weithg by - 1
-- Rollback to savepoint
-- Multiply negative weights by -1
BEGIN
    DELETE FROM animals WHERE date_of_birth > '2022-01-01';
    SAVEPOINT my_savepoint;
    UPDATE animals SET weight_kg = weight_kg * -1;
    ROLLBACK TO my_savepoint;
    UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
    COMMIT
select * from animals;

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, SUM(escape_attempts) AS total_escapes
FROM animals
GROUP BY neutered
ORDER BY total_escapes DESC;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;