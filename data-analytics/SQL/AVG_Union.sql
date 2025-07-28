
# Beispiel 


SELECT count(persnr) AS Anzahl FROM Personal;

# Beispiel : Durchschnittsgehalt

SELECT AVG(Gehalt) AS Durchschnittsgehalt FROM Personal;

# Beispiel : Größte Nummer aus der Teilestamm

SELECT MAX(TeilNr) AS Max_Teilnummer FROM Teilestamm;

# Beispiel  : Verschiedene Orte

SELECT COUNT(DISTINCT Ort) AS Anzahl_verschiedene_Orte
FROM (
    SELECT Ort FROM Personal
    UNION
    SELECT Ort FROM Lieferant
    UNION
    SELECT Ort FROM Kunde
) AS Alle_Orte;
