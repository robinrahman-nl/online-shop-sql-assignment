-- Delete tables in reverse order because 
-- bestellingendetails depends on bestellingen and producten
-- bestellingen depends on klanten

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








