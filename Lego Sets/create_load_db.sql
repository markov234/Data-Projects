
# This was the code I used to make the table, and then import/load the data from the csv file.
# Don't run it again, or else you will duplicate the database.

-- CREATE TABLE lego_sets (
--     set_id VARCHAR(10),
--     name VARCHAR(255),
--     year YEAR,
--     theme VARCHAR(100),
--     subtheme VARCHAR(100),
--     themeGroup VARCHAR(100),
--     category VARCHAR(100),
--     pieces INT,
--     minifigs INT,
--     agerange_min INT,
--     US_retailPrice DECIMAL(10, 2),
--     bricksetURL VARCHAR(255),
--     thumbnailURL VARCHAR(255),
--     imageURL VARCHAR(255)
-- );


-- LOAD DATA LOCAL INFILE '/Users/milanmarkovic/Data Projects/Lego Sets/lego_sets.csv'
-- INTO TABLE lego_sets
-- CHARACTER SET utf8mb4
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 LINES
-- (set_id, name, year, theme, subtheme, themeGroup, category, pieces, minifigs, agerange_min, US_retailPrice, bricksetURL, thumbnailURL, imageURL);


-- SHOW VARIABLES LIKE 'secure_file_priv';