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
# Factors są używane w celu kategoryzacji danych. Posiadają levels (kategorie).

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
# Wektory w macierzy musza być tego samego typu (np. numeryczne).

#### 1.1.2.1 Creating a matrix ----
# Utworzenie wektorów
x = 1:4
y = 5:8
z = 9:12

rbind(x, y, z) # row bind 

cbind(x, y, z) # column bind

matrix(c(x, y, z), nrow = 4, ncol = 3, byrow = TRUE) # matrix by row

#### 1.1.2.2 Lists ----
# Listy w R są powszechnie uzywane w data science. Ich elementy, w przeciwieństwie do elementów wektorów nie musza być tego samego typu. Lista może zawierać nawet inne listy.

x = list(1, 'apple', list(3, 'cat'))
x

# Pętla użyteczna w listach
for (element in x) print(class(element)) # Wyświetli klasę elementów listy.

# Nazwy elementów w listach i wywoływanie elementów po ich nazwach
x = list('a' = 25, 'b' = -1, 'c' = 0)
x[['b']] # Elementy w liście można wywołać po nazwie.

#### 1.1.2.3 Data Frames ----
mydf = data.frame(a = c(1, 5, 2),
                  b = c(3, 8, 1))
mydf

# Nadaawanie nazw wierszom w Data Frame
rownames(mydf) = paste0('row', 1:3) # paste0() służy do łączenia tekstu w jeden ciąg, bez spacji między elementami.

mydf

### 1.1.3 Data Structure Excercises ----

# 1. Create an object that is a matrix and/or a data.frame, and inspect its class or structure (use the class or str functions on the object you just created).

# Macierz
x = 1:4
y = 5:9
z = 10:14

matrix = matrix(data = c(x, y, z), nrow = 3, ncol = 4, byrow = TRUE)
matrix

# Ramka danych
df = data.frame(a = c(1, 2, 3),
                b = c(4, 5, 6),
                c = c(7, 8, 9))
df

# Zbadanie struktury
for (elements in matrix) print(class(elements))

for (i in df) print(class(i))

# 2. Create a list of 3 elements, the first of which contains character strings, the second numbers, and the third, the data.frame or matrix you just created in Exercise 1.

list <-  list('Adam', c(1, 2), matrix)
list

## 1.2 Input/Output ----