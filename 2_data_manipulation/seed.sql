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
