-- ============================================================
-- Basic Aggregations
-- ------------------------------------------------------------
-- 1. Count the total number of customers in the database
-- 2. Calculate the average price of all products
-- ============================================================

-- Total number of customers
SELECT
    COUNT(*) AS totaal_aantal_klanten
FROM klanten;

-- Average product price
SELECT
    ROUND(AVG(prijs), 2) AS gemiddelde_prijs
FROM producten;