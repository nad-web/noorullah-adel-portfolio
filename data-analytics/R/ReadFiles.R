
# Hinweise beachten!
# Die Dateien "SMSA & SMSAID müssen im gleich R Arbeitsverzeichnis sein
# Falls nicht bitte folgendes versuchen
# getwd() zeigt den aktuellen Directory "Arbeitsverzeichnis"
# list.files() zeigt was dort liegt
# setwd("...") eine Möglichkeit das Arbeitsverzeichnis zu wechseln
# kann zuerst getestet werden: scan(...), head(...), str(...)

# Aufgabe 1a: SMSA-Daten mit read.table einlesen ----
# Die Datei "SMSA" muss im Arbeitsverzeichnis liegen.
SMSA.df <- read.table("SMSA", header = TRUE, row.names = 1, skip = 2)

# Aufgabe 1b: Spalten benennen ----
colnames(SMSA.df) <- c(
  "Region", "Bevölkerung", "Haushaltseinkommen", "Arbeitslosenquote",
  "Analphabetenrate", "Kriminalitätsrate", "CO2", "Verkehr",
  "Industrie", "Bildung", "Reserve"
)

# Aufgabe 1c: Schritte 3f bis 3h von Blatt 5 ----
# SMSAID-Datei einlesen und aufbereiten
# Hier nehmen wir an, dass jede Zeile der Datei "SMSAID" eine ID 
# und einen Stadtnamen enthält, getrennt durch Leerzeichen.
smsaid_raw <- readLines("SMSAID")
smsaid_split <- strsplit(smsaid_raw, "\\s+")
smsaid_clean <- lapply(smsaid_split, function(x) {
  ID <- x[1]
  City <- paste(x[-1], collapse = " ")
  c(ID = ID, City = City)
})
smsaid <- list(
  ID = sapply(smsaid_clean, function(x) x["ID"]),
  City = sapply(smsaid_clean, function(x) x["City"])
)

# Zeilennamen setzen 
# Falls die Anzahl der Stadtnamen in SMSAID kleiner ist als die Anzahl der
# Zeilen in SMSA.df, werden zunächst die vorhandenen Namen zugewiesen und die
# übrigen Zeilen erhalten Standardnamen (z. B. "City_51", "City_52", …).
# um den Fehlermeldung zu vermeiden
n_cities <- length(smsaid$City)
n_rows   <- nrow(SMSA.df)
if(n_cities < n_rows) {
  rownames(SMSA.df)[1:n_cities] <- smsaid$City
  rownames(SMSA.df)[(n_cities + 1):n_rows] <- paste("City", (n_cities + 1):n_rows, sep = "_")
  warning("Die Anzahl der Städte in SMSAID stimmt nicht mit der Anzahl der Zeilen in SMSA.df überein. ",
          "Nur die ersten ", n_cities, " Zeilen wurden benannt, der Rest erhält Standardnamen.")
} else {
  rownames(SMSA.df) <- smsaid$City
}

# Aufgabe 1d: Umwandlung der 'Region'-Spalte in einen Faktor ----
# In diesem Fall enthalten die Werte in der Spalte "Region" nicht die
# erwarteten Codes 1–4,
# daher wird die Spalte direkt in einen Faktor umgewandelt.
SMSA.df$Region <- factor(SMSA.df$Region)
# Um die NA werte zu vermeiden werden diese in "NE", "NC", "S", "W"
# umcodiert, 
# SMSA.df$Region <- factor(as.numeric(SMSA.df$Region), 
# levels = 1:4, labels = c("NE", "NC", "S", "W")) )

# Aufgabe 1e: Datenstruktur und Zusammenfassung anzeigen ----

str(SMSA.df)
summary(SMSA.df)
# Aufgabe 2: Grafische EDA nach Regionen ----

## 2a) Boxplot: Ärztedichte (proxyhaft mit der Kriminalitätsrate)----
boxplot(Kriminalitätsrate ~ Region, data = SMSA.df,
        main = "Ärztedichte nach Region (proxy)", ylab = "Rate")

## 2b) Boxplot: High-School-AbsolventInnen (angenommene Variable: Bildung)----
boxplot(Bildung ~ Region, data = SMSA.df,
        main = "High-School-AbsolventInnen nach Region", ylab = "% Abschluss")

## 2c) Boxplot: Privates Einkommen (Haushaltseinkommen)----
boxplot(Haushaltseinkommen ~ Region, data = SMSA.df,
        main = "Privates Einkommen nach Region", ylab = "Einkommen ($)")

# Aufgabe 3a: stem-and-leaf plot für MietenFrankfurt ----

# Die Datei "MietenFrankfurt" muss im Arbeitsverzeichnis liegen.
mieten <- scan("MietenFrankfurt", quiet = TRUE)
stem(mieten)           # Standard stem-and-leaf-Diagramm
stem(mieten, scale = 0.5)
stem(mieten, scale = 2)

# Aufgabe 3b: Histogramm (flächennormiert) ----

hist(mieten, probability = TRUE, main = "Histogramm - automatisch")
hist(mieten, probability = TRUE, breaks = 10, main = "Histogramm - 10 Klassen")
hist(mieten, probability = TRUE, breaks = 30, main = "Histogramm - 30 Klassen")

# Histogramm mit irregulären Klassen (eigene Breaks)
# Hier wird der Break-Vektor so definiert, dass er den tatsächlichen Wertebereich von mieten abdeckt.

breaks_irreg <- seq(floor(min(mieten)), ceiling(max(mieten)), by = 5)
hist(mieten, probability = TRUE, breaks = breaks_irreg, main = "Histogramm - eigene Klassen")

# Aufgabe 3c: Kerndichteschätzung ----

plot(density(mieten), main = "Kern-Dichteschätzung (Standard)")
plot(density(mieten, bw = 25), main = "Dichte bw = 25")
plot(density(mieten, bw = 100), main = "Dichte bw = 100")
plot(density(mieten, bw = 400), main = "Dichte bw = 400")



