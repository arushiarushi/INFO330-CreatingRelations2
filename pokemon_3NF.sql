-- Create table called pokemon_3NF to eliminate transitive dependencies 
-- Table stores core attributes of each pokemon that has no transitive dependencies
-- Pokedex_number is the primary key to identify each pokemon
CREATE TABLE pokemon_3NF (
    classfication TEXT, 
    base_total INTEGER, 
    pokedex_number INTEGER PRIMARY KEY,
    name TEXT, 
    capture_rate INTEGER, 
    generation INTEGER,
    is_legendary INTEGER, 
    base_egg_steps INTEGER,
    base_happiness INTEGER,
    attack INTEGER, 
    sp_attack INTEGER, 
    defense INTEGER, 
    sp_defense INTEGER, 
    percentage_male REAL,
    speed INTEGER, 
    weight_kg REAL, 
    experience_growth INTEGER,
    hp INTEGER, 
    height_m REAL
);

--create a table called type with autoincremented column called type_id to identify each type of ability 
CREATE TABLE type (
    type_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    type1 TEXT, 
    type2 TEXT
);

--inserts a linking table called pokemon_type, with columns pokedex_number and type_id as foreign keys 
--referencing the imported_pokemon_data and type tables
-- associates each Pokemon in the imported_pokemon_data table with one or more types listed in the type table.
CREATE TABLE pokemon_type (
    pokedex_number INTEGER,
    type_id INTEGER,
    FOREIGN KEY (pokedex_number) REFERENCES imported_pokemon_data (pokedex_number),
    FOREIGN KEY (type_id) REFERENCES type (type_id)
);


--create a table with against powers with type_id that references against 
CREATE TABLE against_x (
    type_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    against_bug REAL, 
    against_dark REAL,  
    against_dragon REAL, 
    against_electric REAL, 
    against_fairy REAL,  
    against_fight REAL,  
    against_fire REAL,  
    against_flying REAL, 
    against_ghost REAL,  
    against_grass REAL,  
    against_ground REAL,  
    against_ice REAL, 
    against_normal REAL,  
    against_poison REAL,  
    against_psychic REAL,  
    against_rock REAL, 
    against_steel REAL, 
    against_water REAL 
);

-- Insert all the remaining data in pokemon_3NF to have all the non-transitive attributes in 3NF table 
-- Ensures that the primary key pokedex_number is only present in one table
INSERT INTO pokemon_3NF
SELECT    
    classfication, 
    base_total, 
    pokedex_number,
    name, 
    capture_rate, 
    generation,
    is_legendary, 
    base_egg_steps,
    base_happiness,
    attack, 
    sp_attack, 
    defense, 
    sp_defense, 
    percentage_male,
    speed, 
    weight_kg, 
    experience_growth,
    hp, 
    height_m
FROM imported_pokemon_Data; 


--insert the type columns from imported pokemon data and insert it distinctly so there aren't repeating columns 
INSERT INTO type (type1, type2)
SELECT DISTINCT 
  type1, 
  type2 
FROM imported_pokemon_Data; 



INSERT INTO pokemon_type (pokedex_number, type_id)
SELECT pokedex_number, type_id
FROM imported_pokemon_data
JOIN type ON (imported_pokemon_data.type1 = type.type1) AND (imported_pokemon_data.type2 = type.type2); 


--insert against data into against table
INSERT INTO against_x (against_bug, 
    against_dark,  
    against_dragon, 
    against_electric, 
    against_fairy,  
    against_fight,  
    against_fire,  
    against_flying, 
    against_ghost,  
    against_grass,  
    against_ground,  
    against_ice, 
    against_normal,  
    against_poison,  
    against_psychic,  
    against_rock,
    against_steel, 
    against_water )
SELECT
    against_bug, 
    against_dark,  
    against_dragon, 
    against_electric, 
    against_fairy,  
    against_fight,  
    against_fire,  
    against_flying, 
    against_ghost,  
    against_grass,  
    against_ground,  
    against_ice, 
    against_normal,  
    against_poison,  
    against_psychic,  
    against_rock,
    against_steel, 
    against_water  
FROM imported_pokemon_Data;
