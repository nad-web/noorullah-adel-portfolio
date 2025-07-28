
#  Aufgabe 1a ----
# Gegeben: 1 / 2^i und Sn = Summe bis n von 1 / 2^i
N <- 15  # Beispiel: zweistellige Zahl

i <- 0:N
werte <- 1 / (2^i)
werte

Sn <- cumsum(werte)
Sn

#  Aufgabe 1b ----
n <- 10     # kleines zweistelliges n
p <- 0.3    # Wahrscheinlichkeit aus (0,1)

i <- 0:n
Wi <- choose(n, i) * p^i * (1 - p)^(n - i)
Wi

Pk <- cumsum(Wi)
Pk

#  Aufgabe 2 ----
x <- c(0.61, 0.79, 0.83, 0.66, 0.94, 0.78, 0.81, 0.60, 0.88, 0.90, 0.75, 0.86, 0.74, 0.84)
y <- c(1.01, 0.13, 1.73, 0.67, 0.56, 0.99, 0.49, 0.72, 0.13, 0.48, 0.98, 0.08, 1.23, 0.87)

# a) Ordnungsstatistik x(1:14), also sortiert
x_ord <- sort(x)
x_ord

# b) Charakter-Vektor "x(i:14) = wert"
index <- 1:14
text_b <- paste0("x(", index, ":14) = ", x_ord)
text_b

# c) Konkomitanten y entsprechend x_ord
konkomitanten <- y[order(x)]
konkomitanten

# d) Vektor: (x(i:14), y[i:14]) = (x, y)
text_d <- paste0("(x(", index, ":14), y[", index, ":14]) = (", round(x_ord, 2), ", ", round(konkomitanten, 2), ")")
text_d

# e) Schön formatiert mit format
x_form <- format(x_ord, digits = 2, nsmall = 2)
y_form <- format(konkomitanten, digits = 2, nsmall = 2)
index_form <- format(index, width = 2)
text_e <- paste0("(x(", index_form, ":14), y[", index_form, ":14]) = (", x_form, ", ", y_form, ")")
text_e

#  Aufgabe 3 ----
data(faithful)

# a) min, max, mean, sd
warte <- faithful$waiting

min_w <- min(warte)
max_w <- max(warte)
mean_w <- mean(warte)
sd_w <- sd(warte)

min_w; max_w; mean_w; sd_w

# b) Indexe für min und max
which.min(warte)
which.max(warte)

# Wenn mehrere: which(warte == min(warte))

# c) 30% längste Wartezeiten
quantile(warte, 0.7)

# d) kurze Wartezeiten (<= 60 Minuten)
kurz <- warte[warte <= 60]
kurz

# e) Anzahl Gesamt & kurz
length(warte)
length(kurz)

# f) zugehörige Eruptionsdauern
eruptionen <- faithful$eruptions
kurz_eruptionen <- eruptionen[warte <= 60]
kurz_eruptionen

# g) Mittelwerte
mean(kurz)
mean(kurz_eruptionen)

# h) wie viele nach kurzer Wartezeit >= 2.5 Min
sum(kurz_eruptionen >= 2.5)

# i) Streudiagramm
plot(faithful$waiting, faithful$eruptions, 
     main = "Eruptionsdauer vs. Wartezeit",
     xlab = "Wartezeit (Minuten)", 
     ylab = "Eruptionsdauer (Minuten)")

# Interpretation (manuell hinzufügen):
# Das Streudiagramm zeigt zwei Cluster: kürzere Wartezeiten mit kürzeren Eruptionen,
# und längere Wartezeiten mit längeren Eruptionen.

# ---- Aufgabe 4 ----
v <- c(1, 5, 1, 9, 5)
duplicated(v)

# Alle mehrfach vorhandenen Elemente markieren
mehrfach <- duplicated(v) | duplicated(v, fromLast = TRUE)
mehrfach

# auch anzeigen, welche Werte mehrfach sind:
v[mehrfach]
