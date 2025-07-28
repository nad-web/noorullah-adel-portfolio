
# Aufgabe 1: Normalverteilung mit verschiedenen Parametern ----
set.seed(123) # Für Reproduzierbarkeit
n <- 100
# Parameterkombinationen: (mu, sigma)
params <- list(c(0, 1), c(0, 2), c(2, 1), c(2, 2))
samples <- lapply(params, function(p) rnorm(n, mean = p[1], sd = p[2]))

# Bestimme globalen Bereich für x-Achse
all_data <- unlist(samples)
xlim <- range(all_data) + c(-1, 1) * sd(all_data)

# Mehrfachplotrahmen: 4x3 (4 Stichproben, je Histogramm, Boxplot, Q-Q-Plot)
par(mfrow = c(4, 3), mar = c(4, 4, 2, 1))

# Erstelle Plots für jede Stichprobe
for (i in 1:4) {
  # a) Histogramm
  hist(samples[[i]], main = paste("Normal(mu =", params[[i]][1], ", sigma =", params[[i]][2], ")"),
       xlab = "Werte", ylab = "Häufigkeit", xlim = xlim, col = "lightblue", breaks = 20)
  
  # b) Boxplot (alle in einem Koordinatensystem später)
  # c) Q-Q-Plot
  qqnorm(samples[[i]], main = "", xlim = xlim)
  qqline(samples[[i]], col = "red")
}

# Gemeinsamer Boxplot für alle Stichproben
par(new = TRUE)
boxplot(samples, names = paste("mu =", sapply(params, "[", 1), ", sigma =", sapply(params, "[", 2)),
        xlab = "Parameter", ylab = "Werte", col = "lightgreen", at = 1:4, main = "Boxplots aller Stichproben")

# Aufgabe 2: Verschiedene Verteilungen ----
# Parameter frei gewählt
dist_samples <- list(
  Cauchy = rcauchy(n, location = 0, scale = 1),
  Exponential = rexp(n, rate = 1),
  LogNormal = rlnorm(n, meanlog = 0, sdlog = 1),
  StudentT = rt(n, df = 5),
  Uniform = runif(n, min = 0, max = 1)
)

# Bestimme globalen Bereich für x-Achse (ohne Ausreißer der Cauchy-Verteilung)
all_data_dist <- unlist(dist_samples[-1]) # Cauchy ausgeschlossen wegen Extremwerten
xlim_dist <- range(all_data_dist) + c(-1, 1) * sd(all_data_dist)

# Mehrfachplotrahmen
par(mfrow = c(5, 3), mar = c(4, 4, 2, 1))

# Plots für jede Verteilung
for (i in 1:5) {
  dist_name <- names(dist_samples)[i]
  data <- dist_samples[[i]]
  # Begrenze x-Achse für Cauchy
  xlim_use <- if (dist_name == "Cauchy") c(-10, 10) else xlim_dist
  
  # a) Histogramm
  hist(data, main = dist_name, xlab = "Werte", ylab = "Häufigkeit", xlim = xlim_use,
       col = "lightblue", breaks = 20)
  
  # c) Q-Q-Plot
  qqnorm(data, main = "", xlim = xlim_use)
  qqline(data, col = "red")
}

# Gemeinsamer Boxplot
par(new = TRUE)
boxplot(dist_samples, names = names(dist_samples), xlab = "Verteilung", ylab = "Werte",
        col = "lightgreen", main = "Boxplots aller Verteilungen")

# Aufgabe 3: Mischverteilungen aus Normalverteilungen ----
# Szenarien: i) mu1 = mu2, sigma1 != sigma2; ii) mu1 != mu2, sigma1 = sigma2; iii) mu1 != mu2, sigma1 != sigma2
p <- 0.5 # Bernoulli-Parameter
scenarios <- list(
  i = list(mu1 = 0, mu2 = 0, sigma1 = 1, sigma2 = 2),
  ii = list(mu1 = 0, mu2 = 2, sigma1 = 1, sigma2 = 1),
  iii = list(mu1 = 0, mu2 = 2, sigma1 = 1, sigma2 = 2)
)

mix_samples <- lapply(scenarios, function(s) {
  X <- rnorm(n, mean = s$mu1, sd = s$sigma1)
  Y <- rnorm(n, mean = s$mu2, sd = s$sigma2)
  D <- rbinom(n, 1, p)
  Z <- ifelse(D == 1, X, Y)
  return(Z)
})

# Bestimme globalen Bereich
all_data_mix <- unlist(mix_samples)
xlim_mix <- range(all_data_mix) + c(-1, 1) * sd(all_data_mix)

# Mehrfachplotrahmen
par(mfrow = c(3, 3), mar = c(4, 4, 2, 1))

# Plots für jede Mischverteilung
for (i in 1:3) {
  scen <- names(scenarios)[i]
  data <- mix_samples[[i]]
  
  # a) Histogramm
  hist(data, main = paste("Mischverteilung", scen), xlab = "Werte", ylab = "Häufigkeit",
       xlim = xlim_mix, col = "lightblue", breaks = 20)
  
  # c) Q-Q-Plot
  qqnorm(data, main = "", xlim = xlim_mix)
  qqline(data, col = "red")
}

# Gemeinsamer Boxplot
par(new = TRUE)
boxplot(mix_samples, names = names(scenarios), xlab = "Szenario", ylab = "Werte",
        col = "lightgreen", main = "Boxplots aller Mischverteilungen")

# Aufgabe 4: Binomialverteilungen ----
n_binom <- 20
probs <- c(0.2, 0.5, 0.8) # Verschiedene Erfolgswahrscheinlichkeiten
x <- 0:n_binom

# Mehrfachplotrahmen für PMF und CDF
par(mfrow = c(3, 2), mar = c(4, 4, 2, 1))

for (p in probs) {
  # Wahrscheinlichkeitsfunktion (PMF)
  pmf <- dbinom(x, size = n_binom, prob = p)
  plot(x, pmf, type = "h", lwd = 2, col = "blue",
       main = paste("Binomial PMF (n =", n_binom, ", p =", p, ")"),
       xlab = "x", ylab = "P(X = x)")
  
  # Verteilungsfunktion (CDF)
  cdf <- pbinom(x, size = n_binom, prob = p)
  plot(x, cdf, type = "s", lwd = 2, col = "red",
       main = paste("Binomial CDF (n =", n_binom, ", p =", p, ")"),
       xlab = "x", ylab = "P(X <= x)")
}

# Zurücksetzen des Plotrahmens
par(mfrow = c(1, 1))
