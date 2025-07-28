

# Select Beispiele: 

SELECT 
  oberteilnr, 
  COUNT(einzelteilnr) AS anzahl_einzelteile
FROM Teilestruktur
GROUP BY oberteilnr
ORDER BY oberteilnr DESC;



SELECT 
  kundnr, 
  COUNT(*) AS anzahl_auftraege
FROM Auftrag
GROUP BY kundnr
HAVING COUNT(*) > 1;
