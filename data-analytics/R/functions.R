# Die Datein im richigen Arbeitsordner ablegen
# ---- Aufgabe 1a: class/length/summary via apply vs. lapply/sapply ----
library(rpart)
data(cu.summary)

# apply mit class
apply(cu.summary, 2, class)  # NICHT sinnvoll, da apply hier vorher in Matrix umwandelt

# lapply & sapply
lapply(cu.summary, class)
sapply(cu.summary, class)

# mit length
lapply(cu.summary, length)
sapply(cu.summary, length)

# mit summary
lapply(cu.summary, summary)  # sinnvoll und vollständig
sapply(cu.summary, summary)  # liefert nicht immer einheitliche Struktur

# Fazit: apply nicht sinnvoll für gemischte Datentypen (Data Frames). Lieber lapply/sapply verwenden.

# ---- Aufgabe 1b: as.matrix() auf Data Frame ----
cu.matrix <- as.matrix(cu.summary)
str(cu.matrix)  # Alle Spalten werden zu character, wenn ein character-Feld dabei ist

# ---- Aufgabe 1c: with() benutzen ----
# Beispiel mit mean und tapply
with(cu.summary, mean(Price))
with(cu.summary, tapply(Price, Type, sd))

# ---- Aufgabe 1d: unique vs. levels ----
unique(cu.summary$Type)
levels(cu.summary$Type)

unique(cu.summary$Country)
levels(cu.summary$Country)

# Unterschied: unique() zeigt nur die tatsächlich vorkommenden Werte,
# levels() alle potenziellen Levels (auch ungenutzte)

# ---- Aufgabe 1e: Kontingenztafel ----
table(cu.summary$Country, cu.summary$Type)

# ---- Aufgabe 1f: Mittelwert, SD, VK nach Autotyp ----
mittel <- tapply(cu.summary$Price, cu.summary$Type, mean)
sd <- tapply(cu.summary$Price, cu.summary$Type, sd)
vk <- sd / mittel

# Ausgabe
mittel
sd
vk

# ---- Aufgabe 3a: Datei SMSA einlesen als Matrix ----
smsa <- matrix(scan("SMSA"), ncol = 12, byrow = TRUE)

# ---- Aufgabe 3b: Spalten benennen ----
colnames(smsa) <- c("ID", LETTERS[1:11])

# ---- Aufgabe 3c: Kenngrößen je Spalte ----
# Hinweis: für Spalte 1 (ID) und 12 (K) evtl. nicht sinnvoll
stat_funktionen <- function(x) {
  c(Mittel = mean(x), Median = median(x), SD = sd(x),
    Q1 = quantile(x, 0.25), Q3 = quantile(x, 0.75),
    Min = min(x), Max = max(x))
}

stat_matrix <- sapply(as.data.frame(smsa), stat_funktionen)
t(stat_matrix)

# ---- Aufgabe 3d: SMSAID einlesen als Liste ----
smsaid_raw <- scan("SMSAID", what = list("", ""), sep = "\n")
smsaid_split <- strsplit(unlist(smsaid_raw), " ")
smsaid_clean <- lapply(smsaid_split, function(x) c(ID = x[1], City = paste(x[-1], collapse = " ")))

smsaid <- list(
  ID = sapply(smsaid_clean, function(x) x["ID"]),
  City = sapply(smsaid_clean, function(x) x["City"])
)

# ---- Aufgabe 3e: Matrix zu Data Frame, Spalten sinnvoll benennen ----
SMSA.df <- as.data.frame(smsa)
names(SMSA.df) <- c(
  "ID", "Region", "Bevölkerung", "Haushaltseinkommen", "Arbeitslosenquote", 
  "Analphabetenrate", "Kriminalitätsrate", "CO2", "Verkehr", "Industrie", "Bildung", "Reserve"
)

# ---- Aufgabe 3f: Zeilennamen setzen, ID-Spalte löschen ----
rownames(SMSA.df) <- smsaid$City
SMSA.df$ID <- NULL

# ---- Aufgabe 3g: Region in Faktor umwandeln ----
# Zuordnung laut Skript: 1=NE, 2=NC, 3=S, 4=W
SMSA.df$Region <- factor(SMSA.df$Region, levels = 1:4, labels = c("NE", "NC", "S", "W"))

# ---- Aufgabe 3h: Struktur und Summary ----
str(SMSA.df)
summary(SMSA.df)
