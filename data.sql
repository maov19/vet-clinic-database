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
  SET species_id = (SELECT id from species WHERE name = 'Digimon')
  WHERE name like '%mon';

  UPDATE animals
  SET species_id = (SELECT id from species WHERE name = 'Pokemon')
  WHERE species_id IS NULL;

-- Add vets data
INSERT INTO vets (name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 2);

INSERT INTO visits (id, animal_id, vet_id, visit_date) VALUES
(1, 1, 1, '2020-05-24'),
(2, 1, 2, '2020-07-22'),
(3, 2, 3, '2021-02-02'),
(4, 3, 4, '2020-01-05'),
(5, 3, 4, '2020-03-08'),
(6, 3, 4, '2020-05-14'),
(7, 4, 2, '2021-05-04'),
(8, 5, 3, '2021-02-24'),
(9, 6, 4, '2019-12-21'),
(10, 6, 1, '2020-08-10'),
(11, 6, 4, '2021-04-07'),
(12, 7, 2, '2019-09-29'),
(13, 8, 3, '2020-10-03'),
(14, 8, 3, '2020-11-04'),
(15, 9, 4, '2019-01-24'),
(16, 9, 4, '2019-05-15'),
(17, 9, 4, '2020-02-27'),
(18, 9, 4, '2020-08-03'),
(19, 10, 2, '2020-05-24'),
(20, 10, 1, '2021-01-11');


