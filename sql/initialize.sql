-- SQL Schema

CREATE DATABASE IF NOT EXISTS monster_hunter;

USE monster_hunter;

-- Create Tables

CREATE TABLE monsters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE weapon_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(100)
);

CREATE TABLE weapons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    monster_id INT,
    type_id INT,
    attack INT,
    affinity INT, 
    element VARCHAR(50),
    special_skills TEXT,
    equipment_skills TEXT,
    grade INT,
    FOREIGN KEY (monster_id) REFERENCES monsters(id),
    FOREIGN KEY (type_id) REFERENCES weapon_types(id)
);

CREATE TABLE armor_part (
    id INT AUTO_INCREMENT PRIMARY KEY,
    armor_part_name VARCHAR(100)
);

CREATE TABLE armor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    monster_id INT,
    armor_part_id INT,
    defense INT,
    equipment_skills TEXT,
    driftsmelt_slot TEXT, 
    grade INT,
    FOREIGN KEY (monster_id) REFERENCES monsters(id),
    FOREIGN KEY (armor_part_id) REFERENCES armor_part(id)
);

-- Insert Data

INSERT INTO monsters (name) VALUES
('Great Jagras'), ('Kulu-Ya-Ku'), ('Pukei-Pukei'), ('Barroth'), ('Great Girros'), 
('Tobi-Kadachi'), ('Paolumu'), ('NightShade Paolumu'), ('Jyuratodus'), 
('Anjanath'), ('Rathian'), ('Pink Rathian'), ('Legiana'), ('Diablos'), 
('Black Diablos'), ('Rathalos'), ('Azure Rathalos'), ('Silver Rathalos'), 
('Radoban'), ('Banbaro'), ('Zinogre'), ('Tzitzi-Ya-Ku'), ('Deviljho'), 
('Basarios'), ('Aknosom'), ('Magnamalo'), ('Rajang'), ('Lagombi');

INSERT INTO weapon_types (type_name) VALUES 
('Sword and Shield'), ('Great Sword'), ('Dual Blades'), ('Bow'), ('Long Sword'), 
('Hammer'), ('Switch Axe'), ('Light Bowgun'), ('Heavy Bowgun');

INSERT INTO weapons (
    name, monster_id, type_id, attack, element, affinity, special_skills, equipment_skills, grade
) VALUES
    ('First Dance 1', 2, 5, 100, 'None', 5, 'Unlock Grade 2', 'Unlock Grade 4', 1),
    ('First Dance 2', 2, 5, 144, 'None', 10, 'Spirit Helm Breaker Lv.1', 'Unlock Grade 4', 2),
    ('First Dance 3', 2, 5, 207, 'None', 10, 'Spirit Helm Breaker Lv.1', 'Unlock Grade 4', 3),
    ('First Dance 4', 2, 5, 299, 'None', 15, 'Spirit Helm Breaker Lv.1', 'Fortify Lv.1', 4),
    ('First Dance 5', 2, 5, 430, 'None', 15, 'Spirit Helm Breaker Lv.1', 'Fortify Lv.1', 5),
    ('Last Dance 1', 2, 5, 559, 'None', 20, 'Spirit Helm Breaker Lv.2', 'Fortify Lv.1', 6);

INSERT INTO armor_part (armor_part_name) VALUES
    ('Headpiece'), ('Mail'), ('Vambraces'), ('Coil'), ('Greaves');

INSERT INTO armor (
    name, monster_id, armor_part_id, defense, equipment_skills, driftsmelt_slot, grade
) VALUES 
    ('Kulu Headpiece 5', 2, 1, 91, 'Lock On Lv.1, Critical Eye Lv.1', 'Unlock Grade 8', 5),
    ('Jagras Mail 7', 1, 2, 126, 'Rising Tide Lv.2', 'None', 7),
    ('Kulu Vambraces 5', 2, 3, 94, 'Last Stand Lv.1, Critical Eye Lv.1', 'Sleep Resistance Lv.1, Attack +5', 5),
    ('Aknosom Coil 2', 25, 4, 65, 'Critical Eye Lv.1, Unlock Grade 6', 'Unlock Grade 8', 4),
    ('Kulu Greaves 5', 2, 5, 94, 'Critical Eye Lv.1', 'Unlock Grade 8', 5);
