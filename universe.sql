CREATE DATABASE universe;
\c universe
CREATE TABLE galaxy(galaxy_id SERIAL PRIMARY KEY, name VARCHAR(100) NOT NULL UNIQUE,galaxy_types VARCHAR(50) NOT NULL, description TEXT, distance_from_earth INT, is_active boolean)
CREATE TABLE star(star_id SERIAL PRIMARY KEY,name VARCHAR(100) NOT NULL UNIQUE,galaxy_id INT NOT NULL REFERENCE galaxy(galaxy_id), light_years INT)
CREATE TABLE galaxy(galaxy_id SERIAL PRIMARY KEY, name VARCHAR(100) NOT NULL UNIQUE,galaxy_types VARCHAR(50) NOT NULL, description TEXT, distance_from_earth INT, is_active boolean);
CREATE TABLE star(star_id SERIAL PRIMARY KEY,name VARCHAR(100) NOT NULL UNIQUE,galaxy_id INT NOT NULL REFERENCE galaxy(galaxy_id), light_years INT);
;
CREATE TABLE galaxy(galaxy_id SERIAL PRIMARY KEY, name VARCHAR(100) NOT NULL UNIQUE,galaxy_types VARCHAR(50) NOT NULL, description TEXT, distance_from_earth INT, is_active boolean);
CREATE TABLE star(star_id SERIAL PRIMARY KEY,name VARCHAR(100) NOT NULL UNIQUE,galaxy_id INT NOT NULL REFERENCE galaxy(galaxy_id), light_years INT);
;
CREATE TABLE star(star_id SERIAL PRIMARY KEY,name VARCHAR(100) NOT NULL UNIQUE,galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id), light_years INT);
CREATE TABLE planet(planet_id SERIAL PRIMARY KEY,name VARCHAR(100) NOT NULL UNIQUE,star_id INT NOT NULL REFERENCES star(star_id), has_life boolean, diameter INT);
CREATE TABLE moon(moon_id SERIAL PRIMARY KEY, name VARCHAR(100) NOT NULL UNIQUE, planet_id INT NOT NULL REFERENCES planet(planet_id),diameter_km INT NOT NULL,has_atmosphere boolean, discovery_year INT);
CREATE TABLE asteroid(asteroid_id SERIAL PRIMARY KEY,name VARCHAR(100) NOT NULL UNIQUE,diameter_km INT NOT NULL, potentially_hazardous boolean);
INSERT INTO galaxy (name, galaxy_types, description, distance_from_earth, is_active) VALUES
('Milky Way',     'Spiral barred', 'Our home galaxy',                  0,      TRUE),
('Andromeda',     'Spiral',        'Nearest major galaxy to Milky Way', 2500000, TRUE),
('Triangulum',    'Spiral',        'Third-largest in Local Group',      3000000, TRUE),
('Centaurus A',   'Elliptical',    'Strong radio source',               13000000, FALSE),
('Sombrero',      'Spiral',        'Very distinctive dust lane',        29300000, TRUE),
('Whirlpool',     'Spiral',        'Interacting with companion',        23000000, TRUE),
('Pinwheel',      'Spiral',        'M101 – very large and bright',      21000000, TRUE);
-- STAR  (all belonging to galaxies – mostly Milky Way = galaxy_id 1)INSERT INTO star (name, galaxy_id, light_years) VALUES('Sun',          1, 0),('Proxima Centauri', 1, 4.24),('Alpha Centauri A', 1, 4.37),('Alpha Centauri B', 1, 4.37),('Sirius A',     1, 8.6),('Sirius B',     1, 8.6),('Betelgeuse',   1, ~640),('Vega',         1, 25.0);
INSERT INTO planet (name, star_id, has_life, diameter) VALUES
('Mercury',   1, FALSE, 4879),
('Venus',     1, FALSE, 12104),
('Earth',     1, TRUE,  12742),
('Mars',      1, FALSE, 6779),
('Jupiter',   1, FALSE, 139820),
('Saturn',    1, FALSE, 116460),
('Uranus',    1, FALSE, 50724),
('Neptune',   1, FALSE, 49244),
('Proxima b', 2, FALSE,  ~12000),   -- rough estimate
('Proxima c', 2, FALSE,  ~30000),   -- candidate / disputed
('Barnard''s Star b', 1, FALSE, ~12000),  -- rough
('Ross 128 b',1, FALSE, ~12000),
('Teegarden b',1, FALSE, ~11000),
('TRAPPIST-1e',1, FALSE, ~11800);
;
-- STAR  (all belonging to galaxies – mostly Milky Way = galaxy_id 1)
INSERT INTO star (name, galaxy_id, light_years) VALUES
('Sun',          1, 0),
('Proxima Centauri', 1, 4.24),
('Alpha Centauri A', 1, 4.37),
('Alpha Centauri B', 1, 4.37),
('Sirius A',     1, 8.6),
('Sirius B',     1, 8.6),
('Betelgeuse',   1, ~640),
('Vega',         1, 25.0);
INSERT INTO planet (name, star_id, has_life, diameter) VALUES
('Mercury',   1, FALSE, 4879),
('Venus',     1, FALSE, 12104),
('Earth',     1, TRUE,  12742),
('Mars',      1, FALSE, 6779),
('Jupiter',   1, FALSE, 139820),
('Saturn',    1, FALSE, 116460),
('Uranus',    1, FALSE, 50724),
('Neptune',   1, FALSE, 49244),
('Proxima b', 2, FALSE,  ~12000),   -- rough estimate
('Proxima c', 2, FALSE,  ~30000),   -- candidate / disputed
('Barnard''s Star b', 1, FALSE, ~12000),  -- rough
('Ross 128 b',1, FALSE, ~12000),
('Teegarden b',1, FALSE, ~11000),
('TRAPPIST-1e',1, FALSE, ~11800);
INSERT INTO moon (name, planet_id, diameter_km, has_atmosphere, discovery_year) VALUES
('Moon',         3, 3474, FALSE,     0),          -- pre-historic
('Phobos',       4,   22, FALSE,  1877),
('Deimos',       4,   12, FALSE,  1877),
('Io',           5, 3643, FALSE,  1610),
('Europa',       5, 3122, FALSE,  1610),
('Ganymede',     5, 5268, FALSE,  1610),
('Callisto',     5, 4821, FALSE,  1610),
('Amalthea',     5,  167, FALSE,  1892),
('Himalia',      5,  140, FALSE,  1904),
('Elara',        5,   80, FALSE,  1905),
('Titan',        6, 5150,  TRUE,  1655),
('Rhea',         6, 1527, FALSE,  1672),
('Iapetus',      6, 1470, FALSE,  1671),
('Dione',        6, 1123, FALSE,  1684),
('Tethys',       6, 1062, FALSE,  1684),
('Enceladus',    6,  504, FALSE,  1789),
('Mimas',        6,  396, FALSE,  1789),
('Miranda',      7,  472, FALSE,  1948),
('Ariel',        7, 1158, FALSE,  1851),
('Umbriel',      7, 1169, FALSE,  1851),
('Titania',      7, 1578, FALSE,  1787),
('Oberon',       7, 1523, FALSE,  1787);
;
INSERT INTO moon (name, planet_id, diameter_km, has_atmosphere, discovery_year)
VALUES
    ('Moon',     (SELECT planet_id FROM planet WHERE name = 'Earth'),   3474, FALSE,    0),
    ('Phobos',   (SELECT planet_id FROM planet WHERE name = 'Mars'),      22, FALSE, 1877),
    ('Deimos',   (SELECT planet_id FROM planet WHERE name = 'Mars'),      12, FALSE, 1877),
    ('Io',       (SELECT planet_id FROM planet WHERE name = 'Jupiter'), 3643, FALSE, 1610),
    ('Europa',   (SELECT planet_id FROM planet WHERE name = 'Jupiter'), 3122, FALSE, 1610),
    ('Ganymede', (SELECT planet_id FROM planet WHERE name = 'Jupiter'), 5268, FALSE, 1610),
    ('Callisto', (SELECT planet_id FROM planet WHERE name = 'Jupiter'), 4821, FALSE, 1610),
    ('Titan',    (SELECT planet_id FROM planet WHERE name = 'Saturn'),  5150,  TRUE, 1655),
    ('Rhea',     (SELECT planet_id FROM planet WHERE name = 'Saturn'),  1527, FALSE, 1672),
    ('Iapetus',  (SELECT planet_id FROM planet WHERE name = 'Saturn'),  1470, FALSE, 1671),
    ('Dione',    (SELECT planet_id FROM planet WHERE name = 'Saturn'),  1123, FALSE, 1684),
    ('Tethys',   (SELECT planet_id FROM planet WHERE name = 'Saturn'),  1062, FALSE, 1684),
    ('Enceladus',(SELECT planet_id FROM planet WHERE name = 'Saturn'),   504, FALSE, 1789),
    ('Mimas',    (SELECT planet_id FROM planet WHERE name = 'Saturn'),   396, FALSE, 1789)
ON CONFLICT (name) DO NOTHING;
INSERT INTO asteroid (name, diameter_km, potentially_hazardous) VALUES
('Ceres',          946,     FALSE),    -- largest asteroid / dwarf planet
('Vesta',          525,     FALSE),
('Pallas',         512,     FALSE),
('Hygiea',         434,     FALSE),
('Interamnia',     326,     FALSE),
('Apophis',        370,     TRUE),     -- famous potentially hazardous asteroid
('Bennu',          492,     TRUE),     -- sampled by OSIRIS-REx
('Ryugu',          900,     FALSE),    -- sampled by Hayabusa2
('Eros',           17,      FALSE),    -- visited by NEAR Shoemaker
('Itokawa',        0.33,    FALSE)     -- very small, visited by Hayabusa
ON CONFLICT (name) DO NOTHING;
ALTER TABLE asteroid
ADD COLUMN mass_kg INT;
UPDATE asteroid
SET mass_kg = CASE name
    WHEN 'Ceres'         THEN 939000000000000000000     -- 9.39 × 10²⁰ kg
    WHEN 'Vesta'         THEN  25900000000000000000      -- 2.59 × 10¹⁹ kg
    WHEN 'Pallas'        THEN  20400000000000000000      -- 2.04 × 10¹⁹ kg
    WHEN 'Hygiea'        THEN  8370000000000000000       -- 8.37 × 10¹⁸ kg
    WHEN 'Interamnia'    THEN  3960000000000000000       -- ~3.96 × 10¹⁸ kg
    WHEN 'Apophis'       THEN               61600000000  -- 6.16 × 10¹⁰ kg
    WHEN 'Bennu'         THEN               73000000000  -- 7.3 × 10¹⁰ kg
    WHEN 'Ryugu'         THEN               45000000000  -- 4.5 × 10¹⁰ kg
    WHEN 'Eros'          THEN                6670000000  -- 6.67 × 10⁹ kg
    WHEN 'Itokawa'       THEN                  35000000  -- 3.5 × 10⁷ kg
    ELSE mass_kg                                 -- leave others unchanged
END
WHERE mass_kg IS NULL;
;
ALTER TABLE asteroid
ADD COLUMN mass_kg BIGINT;
ALTER TABLE asteroid
DROP COLUMN IF EXISTS mass_kg;
ALTER TABLE asteroid
ALTER COLUMN mass_kg TYPE BIGINT;
UPDATE asteroid
SET mass_kg = CASE name
    WHEN 'Ceres'         THEN 939000000000000000000     -- 9.39 × 10²⁰ kg
    WHEN 'Vesta'         THEN  25900000000000000000      -- 2.59 × 10¹⁹ kg
    WHEN 'Pallas'        THEN  20400000000000000000      -- 2.04 × 10¹⁹ kg
    WHEN 'Hygiea'        THEN  8370000000000000000       -- 8.37 × 10¹⁸ kg
    WHEN 'Interamnia'    THEN  3960000000000000000       -- ~3.96 × 10¹⁸ kg
    WHEN 'Apophis'       THEN               61600000000  -- 6.16 × 10¹⁰ kg
    WHEN 'Bennu'         THEN               73000000000  -- 7.3 × 10¹⁰ kg
    WHEN 'Ryugu'         THEN               45000000000  -- 4.5 × 10¹⁰ kg
    WHEN 'Eros'          THEN                6670000000  -- 6.67 × 10⁹ kg
    WHEN 'Itokawa'       THEN                  35000000  -- 3.5 × 10⁷ kg
    ELSE mass_kg                                 -- leave others unchanged
END
WHERE mass_kg IS NULL;
;
ALTER TABLE asteroid
ADD COLUMN discovery_year INT;
UPDATE asteroid SET discovery_year = 
  CASE name
    WHEN 'Ceres'     THEN 1801
    WHEN 'Vesta'     THEN 1807
    WHEN 'Pallas'    THEN 1802
    WHEN 'Hygiea'    THEN 1849
    WHEN 'Apophis'   THEN 2004
    WHEN 'Bennu'     THEN 1999
    WHEN 'Ryugu'     THEN 1999
    WHEN 'Eros'      THEN 1898
    WHEN 'Itokawa'   THEN 1998
  END;
ALTER TABLE asteroid
 DROP COLUMN IF EXISTS mass_kg;
ALTER TABLE galaxy
ADD COLUMN spiral_arms INT NOT NULL DEFAULT 0;
UPDATE galaxy
SET spiral_arms = CASE name
    WHEN 'Milky Way'    THEN 2     -- barred spiral, usually considered 2 major arms
    WHEN 'Andromeda'    THEN 2
    WHEN 'Triangulum'   THEN 2
    WHEN 'Whirlpool'    THEN 2
    WHEN 'Pinwheel'     THEN 2
    WHEN 'Sombrero'     THEN 2     -- has a prominent ring + arms
    WHEN 'Centaurus A'  THEN 0     -- elliptical / irregular merger remnant
    WHEN 'Black Eye'    THEN 1     -- has a single prominent arm-like feature
    ELSE 0
END;
ALTER TABLE galaxy
ALTER COLUMN distance_from_earth
TYPE NUMERIC;
NSERT INTO moon (name, planet_id, diameter_km, has_atmosphere, discovery_year)
VALUES
    -- More Saturn moons
    ('Hyperion',     (SELECT planet_id FROM planet WHERE name = 'Saturn'),   270, FALSE, 1848),
    ('Phoebe',       (SELECT planet_id FROM planet WHERE name = 'Saturn'),   213, FALSE, 1899),
    ('Janus',        (SELECT planet_id FROM planet WHERE name = 'Saturn'),   179, FALSE, 1966),
    ('Epimetheus',   (SELECT planet_id FROM planet WHERE name = 'Saturn'),   116, FALSE, 1966),
    ('Helene',       (SELECT planet_id FROM planet WHERE name = 'Saturn'),    33, FALSE, 1980),
    ('Telesto',      (SELECT planet_id FROM planet WHERE name = 'Saturn'),    25, FALSE, 1980),
    -- More Uranus moons
    ('Cordelia',     (SELECT planet_id FROM planet WHERE name = 'Uranus'),    40, FALSE, 1986),
    ('Ophelia',      (SELECT planet_id FROM planet WHERE name = 'Uranus'),    43, FALSE, 1986),
    ('Bianca',       (SELECT planet_id FROM planet WHERE name = 'Uranus'),    51, FALSE, 1986),
    ('Cressida',     (SELECT planet_id FROM planet WHERE name = 'Uranus'),    80, FALSE, 1986),
    ('Desdemona',    (SELECT planet_id FROM planet WHERE name = 'Uranus'),    64, FALSE, 1986),
    -- Neptune moons
    ('Larissa',      (SELECT planet_id FROM planet WHERE name = 'Neptune'),  194, FALSE, 1989),
    ('Galatea',      (SELECT planet_id FROM planet WHERE name = 'Neptune'),  175, FALSE, 1989),
    ('Despina',      (SELECT planet_id FROM planet WHERE name = 'Neptune'),  150, FALSE, 1989),
    ('Thalassa',     (SELECT planet_id FROM planet WHERE name = 'Neptune'),   80, FALSE, 1989),
    -- A few more Jupiter irregular moons (smaller)
    ('Himalia',      (SELECT planet_id FROM planet WHERE name = 'Jupiter'),  140, FALSE, 1904),
    ('Elara',        (SELECT planet_id FROM planet WHERE name = 'Jupiter'),   80, FALSE, 1905),
    ('Pasiphae',     (SELECT planet_id FROM planet WHERE name = 'Jupiter'),   60, FALSE, 1908),
    -- Pluto (if you added it as a planet – optional)
    ('Charon',       (SELECT planet_id FROM planet WHERE name = 'Pluto'),  1212, FALSE, 1978)
ON CONFLICT (name) DO NOTHING;
;
INSERT INTO moon (name, planet_id, diameter_km, has_atmosphere, discovery_year)
VALUES
    ('Hyperion', (SELECT planet_id FROM planet WHERE name = 'Saturn'), 270, FALSE, 1848),
    ('Phoebe',   (SELECT planet_id FROM planet WHERE name = 'Saturn'), 213, FALSE, 1899),
    ('Janus',    (SELECT planet_id FROM planet WHERE name = 'Saturn'), 179, FALSE, 1966)
ON CONFLICT (name) DO NOTHING;
INSERT INTO moon (name, planet_id, diameter_km, has_atmosphere, discovery_year)
VALUES
    -- Saturn continued
    ('Epimetheus', (SELECT planet_id FROM planet WHERE name = 'Saturn'), 116, FALSE, 1966),
    ('Telesto',    (SELECT planet_id FROM planet WHERE name = 'Saturn'),  25, FALSE, 1980),
    ('Calypso',    (SELECT planet_id FROM planet WHERE name = 'Saturn'),  23, FALSE, 1980),
    -- Uranus
    ('Cordelia',   (SELECT planet_id FROM planet WHERE name = 'Uranus'),  40, FALSE, 1986),
    ('Ophelia',    (SELECT planet_id FROM planet WHERE name = 'Uranus'),  43, FALSE, 1986),
    -- Neptune
    ('Larissa',    (SELECT planet_id FROM planet WHERE name = 'Neptune'), 194, FALSE, 1989)
ON CONFLICT (name) DO NOTHING;
ALTER TABLE star
ADD COLUMN discovery_year INT;
UPDATE star
SET discovery_year = CASE name
    WHEN 'Sun'              THEN 0       -- known since prehistory
    WHEN 'Proxima Centauri' THEN 1915
    WHEN 'Alpha Centauri A' THEN -400    -- ancient (Ptolemy)
    WHEN 'Sirius A'         THEN -2000   -- ancient Egyptian/Sumerian records
    WHEN 'Betelgeuse'       THEN 0       -- ancient
    WHEN 'Vega'             THEN 0       -- ancient
    ELSE 1800 + FLOOR(RANDOM()*200)      -- rough for others
END;
\s universe.sql
