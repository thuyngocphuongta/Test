# In Aufgabe 3 sollen weiterhin Datensätze aus dem Paket *nycflights13* verwendet werden.


# library
library()
library(nycflights13)
library(tidyverse)
library(forcats)

# Aufgabe 3a:
# Erstellen Sie eine Funktion `repair_manufacturer`, welche als Ausgabe ein `tibble` (Klasse `tbl_df`)
# ausgibt.
# Als Input soll die Funktion den **planes** Datensatz erhalten.
# Der Output soll dem originalen Datensatz bis auf die folgende Veränderungen der `manufacturer`-Variable entsprechen:
# Verändern Sie die `manufacturer`-Variable, indem Sie
#   - `manufacturer` zu einer Faktor-Variable konvertieren.
#   - AIRBUS und AIRBUS INDUSTRIE zu einer Kategorie zusammenfassen.
#   - alle übrigen `manufacturer`zu einer Kateogrie "Other" zusammenfassen.
#   - Zeilen mit einem unbekannten `manufacturer`-Wert löschen (das
#     beeinflusst auch die anderen Variablen)
## Tipp: Vielleicht kann das Paket *forcats* dafür nützlich sein. Verwenden Sie in dem Fall
#       `forcats::<Funktion>`

repair_manufacturer <- function() {
  planes %>%
    mutate(manufacturer = as.factor(manufacturer)) %>%
    mutate(manufacturer = fct_other(manufacturer, keep = c("AIRBUS", "AIRBUS INDUSTRIE"), other_level = "Other")) %>%
   
    mutate(manufacturer = fct_explicit_na(manufacturer)) 
}

repair_manufacturer()

# Aufgabe 3b:
# Erstellen Sie eine Funktion `plot_seats_histogram`, welche ein Histogramm der Sitzverteilung ausgibt.
# Als Input soll die Funktion den **planes** Datensatz erhalten.
# Der Output der Funktion soll ein `ggplot`-Objekt sein.
# - Verwenden Sie die in 3a) definierte Funktion, um die `manufacturer`-Spalte zusammenzufassen.
# - Unterteilen Sie den Plot sinnvoll nach der neuen `manufacturer`-Spalte.

plot_seats_histogram <- function() {
  x <- ggplot(repair_manufacturer(), aes(x = manufacturer))
  x + geom_bar() + 
           coord_flip()
}

plot_seats_histogram()
