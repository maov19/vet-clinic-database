/* Database schema to keep the structure of entire database. */

-- Create the database
CREATE DATABASE vet_clinic;

-- Switch to the database
\c 

-- Create the vets table
CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    date_of_graduation DATE
);

-- Create owners table
CREATE TABLE owners (
id SERIAL PRIMARY KEY,
full_name VARCHAR(255),
age INTEGER
);

-- Create species table
CREATE TABLE species (
id SERIAL PRIMARY KEY,
name VARCHAR(255)
);

-- Create the animals table
CREATE TABLE animals (
id SERIAL PRIMARY KEY,
name VARCHAR(255),
date_of_birth DATE,
escape_attempts INTEGER,
neutered BOOLEAN,
weight_kg DECIMAL(5, 2),
species_id INTEGER REFERENCES species(id),
owner_id INTEGER REFERENCES owners(id)
);

CREATE TABLE specializations (
  vet_id INT,
  species_id INT,
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE visits (
  id INT PRIMARY KEY,
  animal_id INT,
  vet_id INT,
  visit_date DATE,
  FOREIGN KEY (animal_id) REFERENCES animals(id),
  FOREIGN KEY (vet_id) REFERENCES vets(id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Improved SELECT COUNT(*) FROM visits where animal_id = 4;
-- Add an index on the animal_id column of the visits table
CREATE INDEX visits_animal_id_idx ON visits (animal_id);

-- Improved SELECT * FROM visits where vet_id = 2;
-- Add an index on the vet_id column of the visits table
CREATE INDEX visits_vet_id_idx ON visits (vet_id);

-- Improved SELECT * FROM owners where email = 'owner_18327@mail.com';
-- Add an index on the email column of the owners table
CREATE INDEX owners_email_idx ON owners (email);


