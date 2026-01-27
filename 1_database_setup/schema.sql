-- Delete tables in reverse order because 
-- bestellingendetails depends on bestellingen and producten
-- bestellingen depends on klanten

DROP TABLE IF EXISTS bestellingendetails;
DROP TABLE IF EXISTS bestellingen;
DROP TABLE IF EXISTS producten;
DROP TABLE IF EXISTS klanten;

CREATE TABLE IF NOT EXISTS klanten (
    klant_id INT NOT NULL AUTO_INCREMENT,
    voornaam varchar(255) NOT NULL,
    achternaam varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    adres varchar(255) NOT NULL,
    PRIMARY KEY (klant_id)
    );

CREATE TABLE IF NOT EXISTS producten (
    product_id INT NOT NULL AUTO_INCREMENT,
    naam varchar(255) NOT NULL,
    beschrijving varchar(255) DEFAULT 'Geen beschrijving',
    prijs DECIMAL (10,2) NOT NULL,
    voorraad INT NOT NULL,
    PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS bestellingen (
    bestellingen_id INT NOT NULL AUTO_INCREMENT,
    klant_id INT NOT NULL,
    datum DATE NOT NULL,
    PRIMARY KEY (bestellingen_id),
    FOREIGN KEY (klant_id) REFERENCES klanten (klant_id)
);

CREATE TABLE IF NOT EXISTS bestellingendetails (
    detail_id INT NOT NULL AUTO_INCREMENT,
    bestellingen_id INT NOT NULL,
    product_id INT NOT NULL,
    aantal INT NOT NULL,
    totaalprijs DECIMAL (10,2) NOT NULL,
    PRIMARY KEY (detail_id),
    FOREIGN KEY (bestellingen_id) REFERENCES bestellingen (bestellingen_id),
    FOREIGN KEY (product_id) REFERENCES producten (product_id)
);

-- Add extra column 'categorie' for table 'producten';
ALTER TABLE producten
ADD categorie varchar(255) NOT NULL;








