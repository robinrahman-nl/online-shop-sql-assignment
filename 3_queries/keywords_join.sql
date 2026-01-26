-- ============================================================
-- Opdracht:
-- Gebruik JOIN om een lijst van bestellingen te tonen samen met
-- de klantnaam en het totaalbedrag van elke bestelling.
-- ============================================================

-- Step1:
-- First get all coumns from klanten, bestellingen and bestellingendetails.
SELECT bestellingen.bestellingen_id,
    klanten.voornaam,
    klanten.achternaam    
FROM bestellingen
    JOIN klanten ON bestellingen.klant_id = klanten.klant_id
    JOIN bestellingendetails ON bestellingen.bestellingen_id = bestellingendetails.bestellingen_id
ORDER BY bestellingen_id;

-- Step2:
-- Now group by id and sum the totaalprijs. because every id has a hidden list of totaalprijs.
SELECT bestellingen.bestellingen_id,
    SUM(bestellingendetails.totaalprijs) AS totaalbedrag
FROM bestellingen
    JOIN klanten ON bestellingen.klant_id = klanten.klant_id
    JOIN bestellingendetails ON bestellingen.bestellingen_id = bestellingendetails.bestellingen_id
GROUP BY bestellingen.bestellingen_id
ORDER BY bestellingen_id;

-- Step 3:
-- Now select name coloumns and add them also in group by 
-- beacause all in select must be also in group by.
-- otherwise sql have to guess which name with which id. 
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
ORDER BY bestellingen_id;

