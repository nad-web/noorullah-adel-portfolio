
# Aufgabe 1: Iterative Implementierung der Fibonacci-Folge ----
fibonacci <- function(N) {
  if (N <= 0) return(numeric(0))
  if (N == 1) return(0)
  
  fib <- numeric(N)
  fib[1] <- 0
  fib[2] <- 1
  
  for (i in 3:N) {
    fib[i] <- fib[i-1] + fib[i-2]
  }
  
  return(fib)
}

# Beispielaufruf
fibonacci(10)


# Aufgabe 2: qqnorm.sim Funktion ----

qqnorm.sim <- function(x) {
  n <- length(x)
  par(mfrow = c(3, 4))
  
  # Q-Q-Plot für die Eingabedaten
  qqnorm(x, main = "Eingabedaten")
  qqline(x)
  
  # 11 Q-Q-Plots für simulierte Normalverteilungen
  for (i in 1:11) {
    sim_data <- rnorm(n)
    qqnorm(sim_data, main = paste("Simulation", i))
    qqline(sim_data)
  }
  
  par(mfrow = c(1, 1))  # Zurücksetzen des Plotlayouts
}


# Aufgabe 3: EuStockMarkets Grafik ----

# PDF erstellen
pdf("EuStockMarkets_Verlauf.pdf", width = 10, height = 6)

# Farben und Linientypen definieren
colors <- c("black", "red", "blue", "green")
linetypes <- 1:4

# Zeitreihen plotten
matplot(EuStockMarkets, 
        type = "l", 
        lty = linetypes, 
        col = colors, 
        lwd = 2,
        xlab = "Tage", 
        ylab = "Schlusskurse", 
        main = "Europäische Börsenindizes 1991-1998")

# Legende hinzufügen
legend("topleft", 
       legend = colnames(EuStockMarkets), 
       col = colors, 
       lty = linetypes, 
       lwd = 2,
       cex = 0.8)

# PDF schließen
dev.off()


# Aufgabe 4: Weibull-Verteilung ----

# PDF für Dichtefunktionen erstellen
pdf("Weibull_Dichte.pdf", width = 8, height = 6)

# Parameter definieren
shape_params <- c(0.5, 1, 1.5, 2, 2.5)
scale_param <- 1
x <- seq(0, 5, length.out = 100)

# Plot vorbereiten
plot(x, dweibull(x, shape = shape_params[1], scale = scale_param), 
     type = "l", 
     lty = 1,
     col = 1,
     ylim = c(0, 1.5),
     xlab = "x",
     ylab = "Dichte",
     main = "Weibull-Dichtefunktionen")

# Weitere Dichtefunktionen hinzufügen
for (i in 2:length(shape_params)) {
  lines(x, dweibull(x, shape = shape_params[i], scale = scale_param), 
        lty = i, 
        col = i)
}

# Legende hinzufügen
legend("topright", 
       legend = paste("Shape =", shape_params), 
       lty = 1:length(shape_params), 
       col = 1:length(shape_params))

dev.off()

# PDF für Verteilungsfunktionen erstellen
pdf("Weibull_Verteilung.pdf", width = 8, height = 6)

# Erste Verteilungsfunktion plotten
plot(x, pweibull(x, shape = shape_params[1], scale = scale_param), 
     type = "l", 
     lty = 1,
     col = 1,
     ylim = c(0, 1),
     xlab = "x",
     ylab = "Verteilungsfunktion",
     main = "Weibull-Verteilungsfunktionen")

# Weitere Verteilungsfunktionen hinzufügen
for (i in 2:length(shape_params)) {
  lines(x, pweibull(x, shape = shape_params[i], scale = scale_param), 
        lty = i, 
        col = i)
}

# Legende hinzufügen
legend("bottomright", 
       legend = paste("Shape =", shape_params), 
       lty = 1:length(shape_params), 
       col = 1:length(shape_params))

dev.off()
