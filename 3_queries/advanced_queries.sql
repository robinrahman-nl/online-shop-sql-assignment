--
SELECT * FROM bestellingen
WHERE datum > '2023-12-31';

-- 
SELECT * FROM producten
WHERE prijs > 3
ORDER BY naam;
