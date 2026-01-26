UPDATE producten
SET prijs = 3.09
WHERE product_id = 3;

UPDATE klanten
SET adres = 'Blackhole square 1, New York'
WHERE klant_id = 1;

DELETE FROM producten
WHERE voorraad = 0;

UPDATE producten
SET categorie = 'pijn stilling'
WHERE product_id IN (1, 2, 3);

UPDATE producten
SET categorie = 'allergie'
WHERE product_id = 4;

UPDATE producten
SET categorie = 'darmen'
WHERE product_id = 5;

UPDATE producten
SET categorie = 'homeopathie'
WHERE product_id = 7;