/* Database schema to keep the structure of entire database. */

-- Create the database
CREATE DATABASE vet_clinic;

-- Switch to the database
\c vet_clinic

-- Create the animals table
CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(5, 2)
);

