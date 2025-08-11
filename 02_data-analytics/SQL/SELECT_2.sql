

# Bespiel 

SELECT K.Name AS Kunde, P.Name AS Personal, L.Name AS Lieferant, K.Ort
FROM Kunde K, Personal P, Lieferant L
WHERE K.Ort = P.Ort AND P.Ort = L.Ort;

# Bespiel 


SELECT TeileNr
FROM Lager
WHERE Bestand >= 5;

# Bespiel 

SELECT T.Bezeichnung
FROM Teilestamm T
WHERE EXISTS (
    SELECT 1
    FROM Lager L
    WHERE L.TeileNr = T.TeilNr AND L.Bestand > 0
);
