-- create 2NF table called pokemon_2NF that eliminates partial dependencies 
CREATE TABLE pokemon_2NF(
    attack INTEGER,
    base_egg_steps INTEGER,
    base_happiness INTEGER,
    base_total INTEGER,
    capture_rate INTEGER,
    defense INTEGER,
    experience_growth INTEGER,
    height_m REAL,
    hp INTEGER,
    name TEXT,
    percentage_male REAL,
    pokedex_number INTEGER PRIMARY KEY, -- primary key 
    sp_attack INTEGER,
    sp_defense INTEGER,
    speed INTEGER,
    weight_kg REAL,
    classfication TEXT,
    generation INTEGER,
    is_legendary INTEGER
);

-- create abilities table with abilities_id and split_value so abilities_id assigns an id to each individual abilities
CREATE TABLE abilities (
    abilities_id INTEGER PRIMARY KEY AUTOINCREMENT,
    split_value TEXT
);

--put the split_value data (separated ability names)
INSERT INTO abilities (split_value)
SELECT DISTINCT
split_value 
FROM
split_abilities;

--create a linking table with pokedex_number and abilities_id as the foreign keys, eliminating the preivously exisitng
--many to many relationship 
--ensuring each Pokemon can have multiple abilities associated with it, and that each ability can be associated with multiple Pokemon
CREATE TABLE pokemon_abilities (
    pokedex_number INTEGER,
    abilities_id INTEGER,
    FOREIGN KEY (pokedex_number) REFERENCES imported_pokemon_data (pokedex_number),
    FOREIGN KEY (abilities_id) REFERENCES abilities (abilities_id)
);

--inserts data from the split_abilities table into the pokemon_abilities table, linking each pokedex_number
-- with its corresponding abilities_id. 
--the split_value data from split_abilities is matched with the corresponding abilities_id from the abilities 
--table using a JOIN statement.
INSERT INTO pokemon_abilities (pokedex_number, abilities_id)
SELECT SA.pokedex_number, A.abilities_id
FROM split_abilities AS SA
JOIN abilities AS A ON SA.split_value = A.split_value;


-- insert remaining data into pokemon_2NF table
INSERT INTO pokemon_2NF 
SELECT attack,
    base_egg_steps,
    base_happiness,
    base_total,
    capture_rate,
    defense,
    experience_growth,
    height_m,
    hp,
    name,
    percentage_male,
    pokedex_number,
    sp_attack,
    sp_defense,
    speed,
    weight_kg,
    classfication,
    generation,
    is_legendary
FROM imported_pokemon_data;

