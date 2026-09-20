# 1 Information Processing ----

## 1.1 Data Structures ----

### 1.1.1 Vectors ----
x = c(1, 3, 2, 5, 4) # wektor
x

typeof(x) # sprawdzenie typu zmiennej
class(x)

# Typy zmiennych:
# charackter
# numeric (double)
# integer
# logical

x1 = c('Adam', 'abecadło')
x1
typeof(x1)
class(x1)

#### 1.1.1.1 Factors ----
# Factors są używane w celu kategoryzacji danych.

x = factor(rep(letters[1:3], e = 10))
x

letters # W R istnieje wbudowany wektor, który zawieta 26 małych liter alfabetu.

# rep(x, times, each) x - wektor, times - ile razy powtórzyć wektor, each - ile razy powtórzyć każdy element wektora.

attributes(x) # wyświetli klasy i typ zmiennej

#### 1.1.1.2 Logicals ----

my_logic = c(TRUE, FALSE, TRUE, FALSE, TRUE, TRUE) 

!my_logic # ! to negacja

as.numeric(my_logic) # zmienna binarna

mean(my_logic) # śednia

#### 1.1.1.2 Numeric and integer ----
# Integer to liczba całkowita.

ints = -3:3 # wektor licz całkowitych
ints

class(ints)
typeof(ints)

x = rnorm(5) # 5 losowych wartości ze standaryzowanego rozkładu normalnego
x

typeof(x)
class(x) # Tutaj widać , że typeof() i class() to nie jest to samo.

#### 1.1.1.3 Dates ----

Sys.Date() # dzisiejsza data

class(Sys.Date())

x = as.Date(c(Sys.Date(), '2026-09-21'))
x

# Jak na razie pracuję cały czas na wbudowanych bibliotekach R. Autor kursu zwraca uwagę, że inne biblioteki czynia pracę z datami łatwiejszą. Wymienia przykładowo bibliotekę lubridate.

install.packages('lubridate')
library(lubridate)

# Kilka poleceń biblioteki lubridate
month(Sys.Date())
day(Sys.Date())
wday(Sys.Date(), label = TRUE)
quarter(Sys.Date())

as_date('2000-01-01') + 100

as.Date(10, origin = Sys.Date()) # 10 dni od wskazanej daty

### 1.1.2 Matrices ----

