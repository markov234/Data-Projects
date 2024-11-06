

-- Easy Questions:

--     Select all the columns and rows from the table.

SELECT *
FROM yugioh;

--     Find all the cards that are of type 'Monster'.

SELECT *
FROM yugioh
WHERE type = 'Effect Monster' OR type = 'Normal Monster';

--     Find all cards with the attribute 'DARK'.

SELECT *
FROM yugioh
WHERE attribute = 'DARK';

--     Count the total number of cards in your dataset (hint: it's 4716).

SELECT COUNT(card_id)
FROM YUGIOH;

-- Intermediate Questions:

--     Find all Monster cards with attack points greater than 2000.

SELECT name, atk, def, set_name
FROM yugioh
WHERE atk > 2000
ORDER BY atk DESC;

--     Group the monster cards by their race and count how many cards are in each race.

SELECT race, COUNT(card_id)
FROM yugioh
WHERE type LIKE '%Monster'
GROUP BY race
ORDER BY count DESC;

--     Calculate the average attack and defense points for Monster cards.

SELECT AVG(atk) as avg_atk, AVG(def) as avg_def
FROM yugioh
WHERE type LIKE '%Monster';

--     Find all 'Spellcaster' Monster cards with the attribute 'LIGHT' and a level greater than 4.

SELECT *
FROM yugioh
WHERE race = 'Spellcaster' AND attribute = 'LIGHT' AND level > 4;

-- Advanced Questions:

--     Find which attribute (e.g., DARK, LIGHT, FIRE) appears the most among Monster cards.

SELECT attribute, COUNT(attribute)
FROM yugioh
WHERE type LIKE '%Monster'
GROUP BY attribute
ORDER BY count DESC;

--     Find the card(s) with the highest attack in each set (e.g., 'LOB' for Legend of Blue Eyes White Dragon).

SELECT set_name, MAX(atk) as max_atk
FROM yugioh
WHERE type LIKE '%Monster'
GROUP BY set_name;

SELECT yugioh.name, yugioh.atk, yugioh.def, yugioh.set_name
FROM yugioh
JOIN (SELECT set_name, MAX(atk) as max_atk
		FROM yugioh
		WHERE type LIKE '%Monster'
		GROUP BY set_name) as subquery
ON yugioh.set_name = subquery.set_name AND yugioh.atk = subquery.max_atk;







-- Intermediate to Advanced Questions:

--     Find the card with the highest attack-to-defense ratio:
--     Calculate the attack-to-defense ratio for all Monster cards and return the card(s) with the highest ratio.

-- These first 3 queries together work, and you hardcode the 22 in after seeing the output of the second query.
SELECT name, atk, def, atk/def AS atk_def_ratio, set_name
FROM yugioh
WHERE type LIKE '%Monster' AND def != 0;

SELECT MAX(atk_def_ratio)
FROM (SELECT name, atk, def, atk/def AS atk_def_ratio, set_name
		FROM yugioh
		WHERE type LIKE '%Monster' AND def != 0);

SELECT * 
FROM (SELECT name, atk, def, atk/def AS atk_def_ratio, set_name
		FROM yugioh
		WHERE type LIKE '%Monster' AND def != 0)
WHERE atk_def_ratio = 22;

-- Or you can replace the last two queries above and use this combined query instead.
SELECT name, atk, def, atk/def AS atk_def_ratio, set_name
FROM yugioh
WHERE type LIKE '%Monster'
  AND def != 0
  AND atk/def = (
      SELECT MAX(atk/def)
      FROM yugioh
      WHERE type LIKE '%Monster' AND def != 0
  );


--     Find cards with duplicate names:
--     Identify if there are any cards in the dataset with duplicate names and return them.

SELECT name, COUNT(name)
FROM yugioh
GROUP BY name
HAVING COUNT(name) > 1;

--     Count the number of cards in each archetype (or card group):
--     Group the cards by archetype (or a similar card grouping, if available) and count how many cards belong to each archetype.

SELECT archetype, count(card_id)
FROM yugioh
WHERE type LIKE '%Monster'
GROUP BY archetype
ORDER BY count(card_id) DESC;

--     Find the top 3 most common card types in the dataset:
--     Rank the card types in order of frequency and return the top 3 most common ones.

SELECT type, count(type)
FROM yugioh
GROUP BY type
ORDER BY count(type) DESC;

--     Find the oldest cards released after a certain year:
--     Write a query to find all cards released after a specific year (e.g., 2000) and return the oldest cards based on release date.

SELECT MAX(set_tcg_date)
FROM yugioh

SELECT *
FROM yugioh
WHERE set_tcg_date BETWEEN '2004-01-01' AND '2007-07-29'
ORDER BY set_tcg_date ASC;


--     List the top 5 strongest cards by attack within each attribute:
--     For each attribute (e.g., DARK, LIGHT), list the top 5 Monster cards with the highest attack points.

SELECT attribute, MAX(atk)
FROM yugioh
WHERE type LIKE '%Monster'
GROUP BY attribute;

SELECT name, attribute, atk, def
FROM(SELECT name, attribute, atk, def, type,
           ROW_NUMBER() OVER (PARTITION BY attribute ORDER BY atk DESC) AS rank
    FROM yugioh
    WHERE type LIKE '%Monster'
      AND atk IS NOT NULL)
WHERE rank <= 5
ORDER BY attribute, atk DESC;

--     Find cards where attack is greater than defense by more than 500 points:
--     Return a list of all Monster cards where the attack points exceed the defense points by more than 500.

--     Find the most balanced cards:
--     Identify the Monster cards where the attack and defense points are closest to each other (least difference between attack and defense).

--     List all cards that belong to more than one set:
--     Find cards that appear in multiple sets and return their names and the sets they belong to.

--     Find the average level of Monster cards for each attribute:
--     Group Monster cards by their attribute (e.g., FIRE, WATER) and calculate the average level for each group.









