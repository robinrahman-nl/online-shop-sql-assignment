-- ============================================================
-- Grouping and filtering
-- ============================================================

-- 1. Count the number of products per category
-- Uses GROUP BY to aggregate products by their category
SELECT
    categorie,
    COUNT(*) AS aantal_producten
FROM producten
GROUP BY categorie;


-- 2. Show only orders where the total order amount exceeds a threshold
-- Uses HAVING to filter aggregated results (after GROUP BY)
SELECT
    bestellingen_id,
    SUM(totaalprijs) AS totaal_verkoop_bedrag
FROM bestellingendetails
GROUP BY bestellingen_id
HAVING SUM(totaalprijs) > 10;