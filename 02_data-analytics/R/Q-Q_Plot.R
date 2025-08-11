#Hinweise die notwerndigen Dateien im richtigen Arbeitsordner ablegen!
temps <- scan("Schmelztemperaturen", skip = 1, sep = ",", what = numeric())

# Q-Q-Plot erstellen, um die Normalverteilungsannahme zu prüfen
qqnorm(temps, main = "Q-Q-Plot für Schmelztemperaturen")
qqline(temps, col = "red")

# Aufgabe 2 ----
# Zweiseitiger t-Test für H0: mu = 745 gegen H1: mu != 745
t_test_zweiseitig <- t.test(temps, 
mu = 745, alternative = "two.sided", conf.level = 0.95)
print(t_test_zweiseitig)

# Einseitiger t-Test für H0: mu >= 745 gegen H1: mu < 745
t_test_einseitig <- t.test(temps, 
mu = 745, alternative = "less", conf.level = 0.95)
print(t_test_einseitig)
