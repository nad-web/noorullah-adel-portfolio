## Beispiel 

SELECT P1.Name AS personal1, P2.Name AS personal2
FROM Personal P1, Personal P2
WHERE NOT (P2.name = 'Johanna' AND P2.Name = 'Koester');

## Beispiel 

SELECT A.AuftrNr, P.Name
FROM Auftrag A
INNER JOIN Personal P ON A.AuftrNr = P.PersNr;

## Beispiel 

SELECT P.Name, P.PersNr
FROM Personal P
LEFT JOIN Auftrag A ON P.PersNr = A.AuftrNr;
