-- Run below 2 lines to create login, user, password.
-- CREATE LOGIN milanmarkovic WITH PASSWORD = 'Toasteroven314'
-- create user milanmarkovic for login milanmarkovic

-- Then run below 2 lines to select table to use.
-- USE AdventureWorksLT2022;
-- GRANT SELECT ON SalesLT.Address TO milanmarkovic

-- When we want to for each loop through all tables now, use this code below.
USE AdventureWorksLT2022;
GRANT SELECT ON SCHEMA::SalesLT TO milanmarkovic;
