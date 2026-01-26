-- ============================================================
-- Final Submission: Online Shop SQL Assignment
-- ------------------------------------------------------------
-- Author: Robin Rahman
-- Program: Galileo Academy – Software Engineering .NET
--
-- Description:
-- This script represents the final submission for the Online
-- Shop SQL assignment. It demonstrates the design and use of a
-- relational MySQL database for a simple webshop scenario.

-- ============================================================
-- 1. DATABASE SCHEMA
-- ============================================================
DROP TABLE IF EXISTS bestellingendetails;
DROP TABLE IF EXISTS bestellingen;
DROP TABLE IF EXISTS producten;
DROP TABLE IF EXISTS klanten;

CREATE TABLE IF NOT EXISTS klanten (
    klant_id INT NOT NULL AUTO_INCREMENT,
    voornaam varchar(255),
    achternaam varchar(255) NOT NULL,
    email varchar(255),
    adres varchar(255),
    PRIMARY KEY (klant_id)
    );

CREATE TABLE IF NOT EXISTS producten (
    product_id INT NOT NULL AUTO_INCREMENT,
    naam varchar(255) NOT NULL,
    beschrijving varchar(255) DEFAULT 'Geen beschrijving',
    prijs DECIMAL (10,2),
    voorraad INT,
    PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS bestellingen (
    bestellingen_id INT NOT NULL AUTO_INCREMENT,
    klant_id INT,
    datum DATE,
    PRIMARY KEY (bestellingen_id),
    FOREIGN KEY (klant_id) REFERENCES klanten (klant_id)
);

CREATE TABLE IF NOT EXISTS bestellingendetails (
    detail_id INT NOT NULL AUTO_INCREMENT,
    bestellingen_id INT,
    product_id INT,
    aantal INT,
    totaalprijs DECIMAL (10,2),
    PRIMARY KEY (detail_id),
    FOREIGN KEY (bestellingen_id) REFERENCES bestellingen (bestellingen_id),
    FOREIGN KEY (product_id) REFERENCES producten (product_id)
);

-- Add extra column 'categorie' for table 'producten';
ALTER TABLE producten
ADD categorie varchar(255);

-- ============================================================
-- 2. SEED DATA
-- ============================================================

INSERT INTO klanten (voornaam, achternaam, email, adres)
VALUES (
        'Albert',
        'Einstein',
        'albert.einstein@galileo.com',
        'Hollandsch Diep 1, Capelle'
    ),
    (
        'Marie',
        'Curie',
        'marie.curie@galileo.com',
        'Radiumstraat 12, Rotterdam'
    ),
    (
        'Isaac',
        'Newton',
        'isaac.newton@galileo.com',
        'Apple Tree Lane 3, London'
    ),
    (
        'Nikola',
        'Tesla',
        'nikola.tesla@galileo.com',
        'AC Boulevard 7, New York'
    ),
    (
        'Charles',
        'Darwin',
        'charles.darwin@galileo.com',
        'Evolution Road 9, Cambridge'
    ),
    (
        'Alan',
        'Turing',
        'alan.turing@galileo.com',
        'Enigma Street 11, Manchester'
    ),
    (
        'Galileo',
        'Galilei',
        'galileo.galilei@galileo.com',
        'Astronomy Street 1, Pisa'
    ),
    (
        'Nicolaus',
        'Copernicus',
        'nicolaus.copernicus@galileo.com',
        'Heliocentric Way 3, Torun'
    ),
    (
        'Michael',
        'Faraday',
        'michael.faraday@galileo.com',
        'Electromagnetism Lane 7, London'
    ),
    (
        'Max',
        'Planck',
        'max.planck@galileo.com',
        'Quantum Road 42, Kiel'
    );

INSERT INTO producten (naam, beschrijving, prijs, voorraad)
VALUES (
        'Paracetamol',
        'Pijnstiller en koortsverlager',
        2.49,
        120
    ),
    (
        'Ibuprofen',
        'Ontstekingsremmende pijnstiller',
        3.99,
        80
    ),
    (
        'Aspirine',
        'Pijnstiller en bloedverdunner',
        2.99,
        60
    ),
    (
        'Cetirizine',
        'Anti-allergie middel tegen hooikoorts',
        4.49,
        50
    ),
    (
        'Loperamide',
        'Middel tegen diarree',
        3.29,
        40
    ),
    (
        'Renitidine',
        'maagzuurremmer',
        5.58,
        0
    ),
    (
        'HomeoCalm',
        'homeopathisch middel tegen stress',
        28.75,
        10
    );

INSERT INTO bestellingen (klant_id, datum)
VALUES 
    (5, '2025-12-10'),
    (3, '2025-11-22'),
    (5, '2025-10-05'),
    (2, '2025-09-18'),
    (5, '2025-08-01'),
    (1, '2025-06-14'),
    (3, '2024-12-03'),
    (5, '2024-10-19'),
    (7, '2024-08-07'),
    (3, '2023-11-11'),
    (2, '2023-06-30'),
    (1, '2022-09-15'),
    (8, '2021-05-20'),
    (5, '2020-11-02'),
    (3, '2020-03-18');

INSERT INTO bestellingendetails (bestellingen_id, product_id, aantal, totaalprijs)
VALUES 
    (1, 1, 2, 4.98),
    (1, 3, 1, 2.99),
    (2, 2, 3, 11.97),
    (3, 5, 2, 6.58),
    (3, 1, 1, 2.49),
    (4, 4, 2, 8.98),
    (5, 2, 1, 3.99),
    (5, 3, 2, 5.98),
    (6, 1, 4, 9.96),
    (7, 5, 3, 9.87),
    (8, 2, 2, 7.98),
    (9, 4, 1, 4.49),
    (10, 3, 3, 8.97),
    (11, 1, 1, 2.49),
    (12, 5, 2, 6.58),
    (13, 2, 2, 7.98),
    (14, 4, 1, 4.49),
    (15, 1, 3, 7.47);

-- ============================================================
-- 3. DATA UPDATES
-- ============================================================
UPDATE producten
SET prijs = 3.09
WHERE product_id = 3;

UPDATE klanten
SET adres = 'Blackhole square 1, New York'
WHERE klant_id = 1;

DELETE FROM producten
WHERE voorraad = 0;

--Add data for later added column 'categorie' in table 'producten'
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

-- ============================================================
-- 4. QUERIES
-- ============================================================

-- 1.
-- Haal alle producten op die op voorraad zijn.

SELECT *
FROM producten
WHERE voorraad > 0;

-- 2.
-- Zoek alle klanten die in een bepaalde stad wonen.
-- LIKE wordt gebruikt om flexibel te zoeken, 
-- % staat alleen vooraan omdat stadsnaam de lattste woord is. 
SELECT *
FROM klanten
WHERE adres LIKE '%London';

-- 3.
-- Haal alle bestellingen op die na een bepaalde datum zijn geplaatst.
SELECT *
FROM bestellingen
WHERE datum > '2023-12-31';

-- 4.
-- Zoek alle producten met een prijs boven een bepaalde drempel en sorteer ze op naam.
SELECT *
FROM producten
WHERE prijs > 3
ORDER BY naam;

-- 5.
-- Gebruik JOIN om een lijst van bestellingen te tonen samen met de klantnaam en het totaalbedrag van elke bestelling.
-- JOIN koppelt gerelateerde tabellen, terwijl SUM en GROUP BY
-- meerdere orderregels samenvoegen tot één totaal per bestelling.
SELECT bestellingen.bestellingen_id,
    klanten.voornaam,
    klanten.achternaam,
    SUM(bestellingendetails.totaalprijs) AS totaalbedrag
FROM bestellingen
    JOIN klanten ON bestellingen.klant_id = klanten.klant_id
    JOIN bestellingendetails ON bestellingen.bestellingen_id = bestellingendetails.bestellingen_id
GROUP BY bestellingen.bestellingen_id,
    klanten.voornaam,
    klanten.achternaam
ORDER BY bestellingen.bestellingen_id;

-- 6.
-- Gebruik LIKE om alle producten te vinden waarvan de naam een bepaalde zoekterm bevat.
SELECT *
FROM producten
WHERE naam LIKE '%para%';

-- 7.
-- Toon het totaal aantal klanten.
-- COUNT(*) telt het aantal rijen in de tabel klanten.
SELECT COUNT(*) AS totaal_aantal_klanten
FROM klanten;

-- 8.
-- Bereken de gemiddelde prijs van alle producten.
-- AVG berekent het gemiddelde, ROUND zorgt voor een net geldbedrag.
SELECT ROUND(AVG(prijs), 2) AS gemiddelde_prijs
FROM producten;

-- 9.
-- Gebruik GROUP BY om het aantal producten per categorie op te sommen.
-- Hiermee worden producten logisch gegroepeerd per categorie.
SELECT categorie,
    COUNT(*) AS aantal_producten
FROM producten
GROUP BY categorie;

-- 10.
-- Gebruik HAVING om alleen die groepen te tonen
-- waar het totaalbedrag van bestellingen boven een bepaalde drempel ligt.
-- HAVING filtert geaggregeerde resultaten, wat met WHERE niet kan.
SELECT bestellingen_id,
    SUM(totaalprijs) AS totaal_verkoop_bedrag
FROM bestellingendetails
GROUP BY bestellingen_id
HAVING SUM(totaalprijs) > 10;

-- 11.
-- Schrijf een query die de volledige details van een bestelling ophaalt, inclusief klantnaam, productnamen, aantallen en totaalprijs.
-- Meerdere JOINs worden gebruikt om alle gerelateerde gegevens te combineren.
SELECT detail_id,
    voornaam,
    achternaam,
    naam,
    aantal,
    totaalprijs
FROM klanten
    JOIN bestellingen ON klanten.klant_id = bestellingen.klant_id
    JOIN bestellingendetails ON bestellingen.bestellingen_id = bestellingendetails.bestellingen_id
    JOIN producten ON producten.product_id = bestellingendetails.product_id
ORDER BY detail_id;

-- 12.
-- Toon een lijst van klanten en het totale bedrag dat ze hebben uitgegeven in de winkel, gesorteerd op het hoogste bedrag.
-- GROUP BY groepeert per klant, SUM berekent het totaalbedrag.
SELECT voornaam,
    achternaam,
    SUM(totaalprijs) AS totaal_bedrag
FROM klanten
    JOIN bestellingen ON klanten.klant_id = bestellingen.klant_id
    JOIN bestellingendetails ON bestellingen.bestellingen_id = bestellingendetails.bestellingen_id
GROUP BY voornaam,
    achternaam
ORDER BY totaal_bedrag DESC;

-- 13.
-- Gebruik een subquery om klanten te vinden die meer dan één bestelling hebben geplaatst.
-- With is gebruikt om subquery techniek toe te passen. 
WITH klanten_meer_dan_een_bestelling AS (
    SELECT klant_id
    FROM bestellingen
    GROUP BY klant_id
    HAVING COUNT(*) > 1
)
SELECT k.klant_id,
    k.voornaam,
    k.achternaam
FROM klanten k
    JOIN klanten_meer_dan_een_bestelling km ON k.klant_id = km.klant_id;

-- 14. 
-- Schrijf een samengestelde query die alle producten toont die niet zijn verkocht (geen gerelateerde rijen in BestellingDetails).
-- LEFT JOIN zorgt ervoor dat ook producten zonder bestellingen worden meegenomen; NULL-waarden geven onverkochte producten aan.
SELECT p.product_id,
    p.naam
FROM producten p
    LEFT JOIN bestellingendetails bd ON p.product_id = bd.product_id
WHERE bd.aantal IS NULL;
