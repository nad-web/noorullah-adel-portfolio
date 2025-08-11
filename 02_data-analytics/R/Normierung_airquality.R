
#  Aufgabe 1: Normierung airquality ----
data(airquality)


# Aufgabe 2a: Kovarianz- und Korrelationsmatrix aus Matrix M ----

# Beispielmatrix M mit n Zeilen und p Spalten
# ich versuche das nachvollziehen zu können !!!

# Kovarianzmatrix
CovM <- (1 / (n - 1)) * t(M) %*% Z %*% M
CovM

# Standardabweichungen (Wurzel der Diagonalwerte)
sds <- sqrt(diag(CovM))

# Korrelationsmatrix
CorM <- CovM / (sds %*% t(sds))
CorM

# Aufgabe 2b: Vergleich mit R-Funktionen ----
data(faithful)



#  Aufgabe 2c: Korrelationsvergleich ----
# Ich konnte nicht alles gründlich nachvollziehn können
# wird noch bearbeitet (setze mich daran)

# ---- Aufgabe 3: cu.summary (aus rpart) ----
install.packages("rpart")  # falls noch nicht vorhanden
library(rpart)
data(cu.summary)

# a) nur deutsche Fahrzeuge zum Beispiel 
cu_de <- subset(cu.summary, Country == "Germany")

# b) Country gleich beim Extrahieren weglassen
cu_de <- subset(cu.summary, Country == "Germany", select = -Country)

# c) unbenutzte Levels entfernen
cu_de <- droplevels(cu_de)
str(cu_de)

# ---- Aufgabe 4a: NA-Zeilen entfernt ----
cu2 <- cu.summary[!apply(is.na(cu.summary), 1, any), ]
cu2_alt <- na.omit(cu.summary)  # Vergleich

# ---- Aufgabe 4b: Spalten mit NA entfernt ----
cu3 <- cu.summary[, !apply(is.na(cu.summary), 2, any)]

# ---- Aufgabe 4c: Zeilen & Spalten mit NA entfenrt ----
cu4 <- cu.summary[!apply(is.na(cu.summary), 1, any), ]
cu4 <- cu4[, !apply(is.na(cu4), 2, any)]
