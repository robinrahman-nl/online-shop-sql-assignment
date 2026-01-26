-- ============================================================
-- Advanced aggregations
-- ============================================================

-- 1. Show the total number of orders per customer
SELECT
    klant_id,
    COUNT(klant_id) AS aantal_bestellingen_per_klant
FROM bestellingen
GROUP BY klant_id;


-- 2. Calculate the total sales amount per order
SELECT
    bestellingen_id,
    SUM(totaalprijs) AS totale_verkoop
FROM bestellingendetails
GROUP BY bestellingen_id;

