-- ============================================================
-- Opdracht:
-- Gebruik LIKE om alle producten te vinden waarvan de naam een bepaalde zoekterm bevat.
-- ============================================================

SELECT * FROM producten
WHERE naam LIKE '%para%';