

## Beispiel
SELECT 
  ort, 
  COUNT(*) AS anzahl_personen
FROM (
  SELECT ort FROM Kunde
  UNION ALL
  SELECT ort FROM Personal
  UNION ALL
  SELECT ort FROM Lieferant
) AS alle_orte
GROUP BY ort
HAVING COUNT(*) < 5;

## Beispiel


SELECT bezeichnung
FROM Teilestamm
WHERE bezeichnung LIKE '%a%'
  AND (bezeichnung LIKE '%r%' OR bezeichnung LIKE '%R%');

## Beispiel


SELECT 
  aufgabe, 
  COUNT(*) AS anzahl_personen
FROM Personal
GROUP BY aufgabe
HAVING COUNT(*) = 1;
