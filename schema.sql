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
 
 
 
    
