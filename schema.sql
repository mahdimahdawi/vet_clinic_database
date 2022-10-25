/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int,
    name varchar(64),
    date_of_birt date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);
