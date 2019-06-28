# In den folgenden Aufgaben werden wir mit verschiedenen Datensätzen aus dem
# Paket *nycflights13* arbeiten.
# Installieren Sie das Paket *nycflights13* von CRAN und machen sie sich mit den einzelnen
# darin enthaltenen Datensätzen vertraut.

# Packete installieren
install.packages("nycflights13")
install.packages("tidyverse")
install.packages("forcats")

# Packete installieren um die Code zu testen
install.packages("devtools")
install.packages("checkmate")
install.packages("testthat")

# Code selber testen
devtools::test() 
devtools::check()

# library
library()
library(nycflights13)
library(tidyverse)
library(forcats)

# Aufgabe 1a:
# Im folgenden wollen wir Flugzeugmodelle mit einer Anzahl Sitzen zwischen einem **minimum** und **maximum** herausfiltern.
# Schreiben Sie eine Funktion `get_planes_by_seats` welche als input die minimale und maximale
# Sitzanzahl akzeptiert (Argumente `min_seats` und `max_seats`).
# Der default Wert für die Grenzen soll $400$ und $500$ sein.
# Output der Funktion soll ein `tibble  (tbl_df)` sein, der nur die Spalten `tailnum` und `model` enthält.

get_planes_by_seats <- function(min_seats = 400, # minimale und maximale Werte ersetzen
                                max_seats = 500) {
  filter(planes, seats >= min_seats, seats <= max_seats) %>% # die Sitzanzahl zw. Minimum und Maximum filtern
    select(tailnum, model) # Spalten `tailnum` und `model` auswaehlen
}

get_planes_by_seats()

# Aufgabe 1b:
# Im Folgenden interessiert man sich nur für die Modellbezeichnungen von Flugzeugen mit einer Sitzanzahl 
# in einer gewissen Spanne (wie in 1a).
# Erstellen Sie eine Funktion `plane_model_by_seats`, welche einen Vektor der Modellbezeichnungen
# zurückgibt. Jeder Modelltyp soll in diesem Vektor nur einmal vorkommen und der Vektor soll vom Typ `character` sein.
# Die Argumente der Funktion sollen dieselben wie in Aufgabe 1a) sein.
# Tipp: Sie können die in Aufgabe 1a) geschriebene Funktion `get_planes_by_seats` hier wiederverwenden.

plane_model_by_seats <- function(min_seats = 400, # minimale und maximale Werte ersetzen
                                 max_seats = 500) {
  as.character(get_planes_by_seats() %>% # als Vektor umsetzen
    select(model) %>% # Spalten `model` auswaehlen
      distinct(model)) # Duplikate entfernen
}

plane_model_by_seats()
