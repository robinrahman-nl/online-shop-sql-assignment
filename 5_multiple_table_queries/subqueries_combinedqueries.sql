-- without subquery
SELECT k.klant_id, k.voornaam, k.achternaam, COUNT(*) AS aantal_bestellingen
FROM
klanten k JOIN bestellingen b
ON k.klant_id = b.klant_id
GROUP BY k.klant_id,
k.voornaam,
k.achternaam
HAVING aantal_bestellingen > 1;

-- with subquery
WITH klanten_meer_dan_een_bestelling AS (
    SELECT klant_id
    FROM bestellingen
    GROUP BY klant_id
    HAVING COUNT(*) > 1
)
SELECT k.klant_id, k.voornaam, k.achternaam
FROM klanten k
JOIN klanten_meer_dan_een_bestelling km
  ON k.klant_id = km.klant_id;

--
SELECT * FROM
producten p
LEFT JOIN
bestellingendetails bd
ON p.product_id = bd.product_id
WHERE aantal IS NULL;