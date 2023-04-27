-- create table with trainer_id as the primary key column and firstname and lastname as columns
CREATE TABLE trainer (
	trainer_id INTEGER PRIMARY KEY AUTOINCREMENT,
	first_name VARCHAR(80),
	last_name VARCHAR(80)
);

--create favorite pokemon type table with trainer_id as the foreign key 
-- this table stores the favorite Pokemon types for each trainer.
CREATE TABLE favorite_pokemon_type (
    trainer_id INTEGER NOT NULL,
    type TEXT NOT NULL, 
    PRIMARY KEY (trainer_id, type),
    FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id)
);

--create a table called pokemon with pokmeon_id as the primary key and name of the pokemon as columns 
CREATE TABLE pokemon (
	pokemon_id TEXT PRIMARY KEY,
	name TEXT NOT NULL
);

--create a linking table called pokemon_team with trainer_id and pokemon_id as foreign keys 
-- also includes team_index column to represent the index of each Pokemon on a trainer's team
CREATE TABLE pokemon_team (
    trainer_id INTEGER NOT NULL,
    pokemon_id TEXT NOT NULL, 
    team_index INTEGER NOT NULL,	
    PRIMARY KEY (trainer_id, team_index),
    FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokemon_id)
);

--insert trainer first and last names into trainer table 
INSERT INTO trainer (first_name, last_name) 
VALUES 
('Ted', 'Neward'), 
('Justin', 'Dong'),
('Kaarina', 'Tulleau'),
('Arushi', 'Agarwal');

--insert a trainer_id and favorite type of pokemon into favorite_pokemon_type
INSERT INTO favorite_pokemon_type(trainer_id, type)
VALUES 
('1', 'Dragon'),
('2', 'Psychic'),
('3', 'Steel'),
('4', 'Ghost');

--insert pokemon names and their corresponding IDs into the pokemon table
INSERT INTO  pokemon (pokemon_id, name)
VALUES 
('23', 'Pikachu'),
('34', 'Charmander'),
('37', 'Squirtle'),
('29', 'Bulbasaur'),
('40', 'Jigglypuff'),
('50', 'Diglett'),
('63', 'Abra'),
('78', 'Rapidash'),
('92', 'Gastly'),
('104', 'Cubone');

--Inserting the Pokemon teams for each trainer
INSERT INTO pokemon_team(trainer_id, pokemon_id, team_index)
VALUES 
('1', '23', '1'),
('1', '34', '2'),
('1', '37', '3'),
('1', '29', '4'),
('1', '40', '5'),
('1', '50', '6'),
('1', '63', '7'),
('1', '78', '8'),
('1', '92', '9'),
('1', '104', '10'),
('3', '23', '1'),
('3', '37', '2'),
('3', '29', '3'),
('3', '92', '4'),
('3', '104', '5'),
('4', '23', '1'),
('4', '34', '2'),
('4', '37', '3'),
('4', '29', '4'),
('4', '40', '5'),
('4', '50', '6'),
('4', '63', '7'),
('4', '78', '8'),
('4', '92', '9'),
('4', '104', '10');
