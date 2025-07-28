
# Die notwendigen Dateien bitte zuerste beretistellen. 
## a) Normalverteilung ----
p_a <- pnorm(112, mean = 105, sd = sqrt(25))
cat("1a) P(X <= 112) =", p_a, "\n")

## b) t-Verteilung ----
p_b <- 2 * pt(2.1, df = 7) - 1
cat("1b) P(|T| <= 2.1) =", p_b, "\n")

## c) Uniformverteilung ----
p_c <- punif(-1.8, min = -2, max = 2)
cat("1c) P(X <= -1.8) =", p_c, "\n")

## d) F-Verteilung ----
p_d <- 1 - pf(6.3, df1 = 7, df2 = 5)
cat("1d) P(F > 6.3) =", p_d, "\n\n")

# Aufgabe 2: Anwendungsbezogene Wahrscheinlichkeiten ----
## a) Binomialverteilung ----
p_2a <- dbinom(10, size = 20, prob = 2/3)
cat("2a) P(genau 10 Kopf) =", p_2a, "\n")

## b) Hypergeometrische Verteilung ----
defekt <- 0:4
p_2b <- dhyper(defekt, m = 0.06*250, n = 250 - 0.06*250, k = 4)
cat("2b) Wahrscheinlichkeiten für defekte Sicherungen:\n")
cat("  Keine:", p_2b[1], "\n  Genau eine:", p_2b[2], "\n  Genau zwei:", p_2b[3])
cat("\n  Genau drei:", p_2b[4], "\n  Vier defekt:", p_2b[5], "\n")

## c) Geometrische Verteilung ----
p_2c <- (19/37)^5  # Wahrscheinlichkeit für 5x nicht Rot
cat("2c) P(erste Rot nach 5 Spielen) =", p_2c, "\n")

## d) Poisson-Verteilung ----
p_2d <- 1 - ppois(9, lambda = 6.9)
cat("2d) P(mindestens 10 Patienten) =", p_2d, "\n")

## e) Binomialverteilung ----
p_2e <- pbinom(1, size = 25, prob = 0.1)
cat("2e) P(höchstens 1 Unverträglichkeit) =", p_2e, "\n")

## f) Exponentialverteilung ----
p_2f <- (1 - exp(-0.5 * 1))^3
cat("2f) P(alle fallen vor 1 Jahr aus) =", p_2f, "\n\n")

# Aufgabe 3: Quantile ----
## a) Theoretische Quantile (t-Verteilung mit 4 df) ----
alpha <- c(0.05, 0.025, 0.01, 0.005, 0.001)
lower_q <- qt(alpha, df = 4)
upper_q <- qt(1 - alpha, df = 4)
quartiles <- qt(c(0.25, 0.5, 0.75), df = 4)

cat("3a) Quantile der t-Verteilung mit 4 df:\n")
cat("Untere Quantile (5%, 2.5%, 1%, 0.5%, 0.1%):", round(lower_q, 4), "\n")
cat("Obere Quantile (95%, 97.5%, 99%, 99.5%, 99.9%):", round(upper_q, 4), "\n")
cat("Quartile (Q1, Median, Q3):", round(quartiles, 4), "\n\n")

## b) Empirische Quantile der Mietdaten ----
# Lese die Daten aus der Datei "MietenFrankfurt"
mietdaten <- scan("MietenFrankfurt", quiet = TRUE)

# Definiere die gewünschten Quantil-Wahrscheinlichkeiten
probs <- c(0.001, 0.005, 0.01, 0.025, 0.05, 0.25, 0.5, 0.75, 0.95, 0.975, 0.99, 0.995, 0.999)

# Berechne die empirischen Quantile
empirische_quantile <- quantile(mietdaten, probs = probs)

cat("3b) Empirische Quantile der Mietdaten:\n")
print(round(empirische_quantile, 2))
cat("\n")

# Aufgabe 4: Signum-Funktion ----
# Version 1: for-Schleife
sgn_loop <- function(x) {
  result <- numeric(length(x))
  for (i in seq_along(x)) {
    if (x[i] > 0) {
      result[i] <- 1
    } else if (x[i] < 0) {
      result[i] <- -1
    } else {
      result[i] <- 0
    }
  }
  return(result)
}

# Version 2: sapply
sgn_sapply <- function(x) {
  sapply(x, function(val) {
    if (val > 0) 1 else if (val < 0) -1 else 0
  })
}

# Version 3: Vektorisiert
sgn_vec <- function(x) {
  ifelse(x > 0, 1, ifelse(x < 0, -1, 0))
}

# Test der Funktionen
x_test <- c(-3, 0, 5, -0.5, 2.7, 0)
cat("4) Test der Signum-Funktionen mit Vektor:", x_test, "\n")
cat("   for-Schleife:   ", sgn_loop(x_test), "\n")
cat("   sapply-Version: ", sgn_sapply(x_test), "\n")
cat("   vektorisierte:  ", sgn_vec(x_test), "\n")
