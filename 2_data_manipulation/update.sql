UPDATE producten
SET prijs = 3.09
WHERE product_id = 3;

UPDATE klanten
SET adres = 'Blackhole square 1, New York'
WHERE klant_id = 1;

DELETE FROM producten
WHERE voorraad = 0;