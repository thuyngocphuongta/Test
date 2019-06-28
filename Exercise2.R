# In Aufgabe 2 sollen weiterhin Datensätze aus dem Paket *nycflights13* verwendet werden.

# library
library()
library(nycflights13)
library(tidyverse)
library(forcats)

# Aufgabe 2a:
# Erstellen Sie eine Funktion `get_avg_distance_by_model`, welche als Ausgabe einen `tibble` 
# mit 3 Spalten (*model*, *n*, *distance*) zurückgibt.
# Die Spalten haben folgende Bedeutung:
# - model: Die Modellbezeichnung wie in 1 a) und b).
# - n: Die Anzahl der Flüge, welche mit diesem Modell durchgeführt wurden. Siehe Datensatz *flights*.
# - distance: Die durchschnittliche Anzahl an Meilen, die mit diesem Flugzeugmodell zurückgelegt wurde.
# Filtern Sie Flugzeuge mit unbekannten Modelltyp dabei heraus (d.h. diese Flugzeuge sollen nicht im Output-`tibble` 
# enthalten sein).
# Sortieren Sie zudem den entstehenden Datensatz nach absteigender durchschnittlich zurückgelegter Distanz.

get_avg_distance_by_model <- function() {
  flights %>% # flights Datensatz nehmen
    left_join(planes, by = c("tailnum", "year")) %>%
    group_by(model) %>% # groupieren
    filter(!is.na(model)) %>% # NA Werte im `Model` rausfiltern
    summarise(
      n = n(), # wie oben definieren
      distance = mean(distance, na.rm = TRUE)) %>% # wie oben definieren
    arrange(desc(distance)) # entstehenden Datensatz nach absteigender durchschnittlich zurückgelegter Distanz sortieren
}

get_avg_distance_by_model()

# Aufgabe 2b:
# Erstellen Sie eine Funktion `get_avg_distance_by_type`, welche als Ausgabe einen `tibble` 
# mit 4 Spalten (*manufacturer*, *type*, *n*, *distance*) zurückgibt.
# Die Spalten haben folgende Bedeutung:
# - manufacturer: Der Flugzeughersteller
# - type: Die Typenbeizeichnung, siehe unten.
# - n: Die Anzahl der Flüge, welche mit diesem Modell durchgeführt wurden. Siehe Datensatz *flights*.
# - distance: Die durchschnittliche Anzahl an Meilen, die mit diesem Flugzeugmodell zurückgelegt wurde.
# Flugzeuge mit einem unbekannten Modelltyp sollen weiterhin herausgefiltert werden.
# Zudem sollen in dieser Aufgabe nur Modelle der Hersteller *BOEING* und *AIRBUS* untersucht werden.
# Der Typ des Flugzeuges ist die Bezeichnung vor dem Bindestrich, zum Beispiel:
# Für Boeing "737-924ER" die Zahl 737.
# Sortieren Sie den entstehenden Datensatz nach absteigender durchschnittlich zurückgelegter Distanz.

get_avg_distance_by_type <- function() {
  flights %>% # flights Datensatz nehmen
    left_join(planes, by = c("tailnum", "year")) %>% # groupieren
    type <- sub("-*", "", model) %>%
    group_by(manufacturer, type) %>%
    filter(!is.na(model) & manufacturer %in% c("BOEING", "AIRBUS")) %>% # NA Werte im `Model` rausfiltern und nur Hersteller *BOEING* und *AIRBUS* filtern
    summarise(
      n = n(), # wie oben definieren
      distance = mean(distance, na.rm = TRUE)) %>% # wie oben definieren
    arrange(desc(distance)) # entstehenden Datensatz nach absteigender durchschnittlich zurückgelegter Distanz sortieren
}

get_avg_distance_by_type()
