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
CREATE TABLE owners(
    id INT GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
    full_name VARCHAR(64),
    age INT
    );
    
CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(32)
    );
    
 ALTER TABLE animals
 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
 ALTER TABLE animals ADD PRIMARY KEY(id);
 ALTER TABLE animals DROP species;
 
 ALTER TABLE animals ADD COLUMN species_id INT;
 ALTER TABLE animals
 ADD CONSTRAINT CONS
 FOREIGN KEY(species_id)
 REFERENCES species(id);
 
 
 ALTER TABLE animals ADD COLUMN owner_id INT;
 ALTER TABLE animals
 ADD CONSTRAINT owner_fk
 FOREIGN KEY(owner_id)
 REFERENCES owners(id);
 
 /* Day 4 */
CREATE TABLE  vets(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(64),
    age INT,
    date_of_graduation DATE
    );
    
    
CREATE TABLE specialization(
    vet_id INT,
    species_id INT
    );
    
ALTER TABLE specialization
ADD CONSTRAINT vets_fk
FOREIGN KEY(vet_id)
REFERENCES vets(id);

ALTER TABLE specialization
ADD CONSTRAINT species_fk
FOREIGN KEY(species_id)
REFERENCES species(id);

CREATE TABLE visits(
    animal_id INT,
    vet_id INT,
    );
ALTER TABLE visits ADD COLUMN date_of_visit DATE;
    
ALTER TABLE visits
ADD CONSTRAINT animals_fk
FOREIGN KEY(animal_id)
REFERENCES animals(id);

ALTER TABLE visits
ADD CONSTRAINT vets_fk
FOREIGN KEY(vet_id)
REFERENCES vets(id);
