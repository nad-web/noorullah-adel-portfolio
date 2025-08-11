
# Beispiel 

SELECT 
  p.name AS Angestellter, 
  v.name AS Vorgesetzter
FROM Personal p
LEFT OUTER JOIN Personal v ON p.vorgesetzt = v.persnr;

# Beispiel  (ohne outer join)

SELECT 
  p.name AS Angestellter,
  (SELECT v.name FROM Personal v WHERE v.persnr = p.vorgesetzt) AS Vorgesetzter
FROM Personal p
WHERE p.vorgesetzt IS NULL
   OR (SELECT v.name FROM Personal v WHERE v.persnr = p.vorgesetzt) IS NOT NULL;


# Beispiel  (Excep)

SELECT Ort FROM Personal
EXCEPT
SELECT Ort FROM Lieferant;

# Beispiel   (intersect)

SELECT TeileNr FROM Auftragsposten
INTERSECT
SELECT TeileNr FROM Lager;
