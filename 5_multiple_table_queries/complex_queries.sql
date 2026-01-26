-- ============================================================
-- Query 1:
-- Retrieve full order details including:
-- - customer name
-- - product name
-- - quantity
-- - total price per order line
-- ===========================================================

SELECT detail_id, voornaam, achternaam, naam, aantal, totaalprijs
FROM 
klanten JOIN bestellingen
ON klanten.klant_id = bestellingen.klant_id
JOIN bestellingendetails
ON bestellingen.bestellingen_id = bestellingendetails.bestellingen_id
JOIN producten
ON producten.product_id = bestellingendetails.product_id
ORDER BY 1;

-- ============================================================
-- Query 2:
-- Show each customer with the total amount spent in the shop,
-- sorted from highest to lowest spending
-- ============================================================
SELECT voornaam, achternaam, SUM(totaalprijs) AS totaal_bedrag
FROM 
klanten JOIN bestellingen
ON klanten.klant_id = bestellingen.klant_id
JOIN bestellingendetails
ON bestellingen.bestellingen_id = bestellingendetails.bestellingen_id
GROUP BY klanten.voornaam, klanten.achternaam
ORDER BY 3 DESC;

