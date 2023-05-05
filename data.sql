-- Insert data into owners table
INSERT INTO owners (full_name, age)
VALUES 
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

-- Insert data into species table
INSERT INTO species (name)
VALUES
    ('Pokemon'),
    ('Digimon');
    
-- Insert data into animals table
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id)
VALUES 
    ('Agumon', '2020-02-03', 0, true, 10.23, 2, 1),
    ('Gabumon', '2018-11-15', 2, true, 8.00, 2, 2),
    ('Pikachu', '2021-01-07', 1, false, 15.04, 1, 2),
    ('Devimon', '2017-05-12', 5, true, 11.00, 2, 3),
    ('Charmander', '2020-02-08', 0, false, -11.00, 1, 4),
    ('Plantmon', '2021-11-15', 2, true, -5.70, 2, 3),
    ('Squirtle', '1993-04-02', 3, false, -12.13, 1, 4),
    ('Angemon', '2005-06-12', 1, true, -45.00, 2, 5),
    ('Boarmon', '2005-06-07', 7, true, 20.40, 2, 5),
    ('Blossom', '1998-10-13', 3, true, 17.00, 1, 4),
    ('Ditto', '2022-05-14', 4, true, 22.00, 2, NULL);

-- Update the species_id and owner_id based on animal name
UPDATE animals
SET id = 
    CASE 
        WHEN name LIKE '%mon' THEN 2
        ELSE 1
    END,
    owner_id = 
    CASE
        WHEN name = 'Agumon' THEN 1
        WHEN name IN ('Gabumon', 'Pikachu') THEN 2
        WHEN name IN ('Devimon', 'Plantmon') THEN 3
        WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN 4
        WHEN name IN ('Angemon', 'Boarmon') THEN 5
        ELSE NULL
    END;