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

## 1.2 Input/Output (wczytywanie i zapisywanie danych) ----

### 1.2.1 Funkcje wbudowane ----
#### 1.2.1.1 Wczytanie pliku csv ----
mydata <- read.csv(
  file = '/Users/adamguz/Documents/Data Science/datasets/input-output.csv', 
  sep =',',dec = '.',
  header = TRUE)

View(mydata)

#### 1.2.1.2 Zapisanie pliku csv ----
write.csv(mydata, file = '/Users/adamguz/Desktop/newfile.csv')

### 1.2.2 Better & Faster Approaches (wczytywania i zapisywania danych) ----

# Lepsze sposoby wczytywania i zapisywania danych
# readr package ma funkcje read_csv, wskazuje od razu typ danych każdego wektora, jest szybsza od podstawowych funkcji. Te informacje są trochę nieaktualne, po użyciu funkcji View() R Stutio używa natywnej nakładki summary, która pokazuje min. typ danych. 
# data.table package jest szybsza od readr.
# haven package posiada funkcje read_spss i read_dta, co pozwala odczytywać dane w formatach SPSS i Stata.
# readxl package pozwala na odczytywanie plików w formacie Excela.

# Najważniejszymi z wymienionych powyżej są readr i haven, obsłużą większość potrzeb.

install.packages(c('readrs', 'haven'))
library(readr, haven)

mydata1 <- read_csv(file = '/Users/adamguz/Documents/Data Science/datasets/input-output.csv')

View(mydata1)

### 1.2.3 R Datasets ----
# Jeżeli potrzebujesz szybko jakichkolwiek dany, żeby się czegoś nauczyć albo cos sprawdzić, możesz użyć wbudowanych w R danych.

head(iris)
View(iris)

# Funkcja data() pobiera jedynie zbiór danych ze wskazanego pakietu R (bez pobrania pakietu).
data(mcycle, package = 'MASS')
head(mcycle)

### 1.2.4 I/O Exercises ----
# Exercise 1. Załaduj do R następujące dane:
# https://raw.githubusercontent.com/m-clark/data-processing-and-visualization/master/data/cars.csv
# https://raw.githubusercontent.com/m-clark/data-processing-and-visualization/master/data/presvote.dta
# Uwagi: dta to format STATA.
data <- read_csv(file = 'https://raw.githubusercontent.com/m-clark/data-processing-and-visualization/master/data/cars.csv')
head(data)

library(haven)
data1 <-  read_dta('https://raw.githubusercontent.com/m-clark/data-processing-and-visualization/master/data/presvote.dta') # Nazwę funkcji wziąłem z dokumentacji pakietu haven.

## 1.3. Indexing ----

### 1.3.1 Slicing vectors ----
letters[4:6] # R ma wbudowany wektor z alfabetem.
letters[c(13, 10, 3)] # Wybranie pozycji liter w alfabecie.

### 1.3.2 Slicing Matrices/data frames ----
a <- 1:4
b <- 5:9
c <- 10:14

matrix <- matrix(data = c(a, b, c), nrow = 3, ncol = 3) # macierz do ćwiczenia
matrix

matrix[1, 2:3] # matrix[rows, columns]

matrix[1, 3] # index by number
# Jeżeli macierz miałaby wierszy i kolumn, to można by ich użyć w analogiczny sposób.

### 1.3.3 Mixed indexing ----
mydf <- data.frame(a = 1:10,
                   b = 11:20,
                   c = letters[1:10]) # data frame do ćwiczenia
View(mydf)

# Mixed indexing
mydf[1, 'c']

### 1.3.4 Non-contiguous - wybietanie nieciągłe ---- 

mydf[c(1,3), ] # 1 i 3 wiersz

### 1.3.5 Boolean - wybieranie warunkowe ----

mydf[mydf$a >= 4, 'a'] # litery od d

### 1.3.6 List/data.frame Extraction ----
# We have a couple ways to get at elements of a list, and likewise for data frames as they are also lists.

# [  : grab a slice of elements/columns
# [[ : grab specific elements/columns
# $  : grab specific elements/columns
# @  : extract slot for S4 objects. Nie wiem do czego to jest. Nie będę tego na razie zgłębiał.

mydf[2:3]

mydf[2]
class(mydf[2])

mydf[[1]] # wypakuje do wektora
class(mydf[[1]]) 
class(c(1, 2, 3))

mydf$a # wektor
class(mydf$a)

### 1.3.7 Indexing Excercises ----

# Dane do ćwiczeń

mymatrix = matrix(data = rnorm(100), nrow = 10, ncol = 10)
mymatrix

mydf = cars # dziwne dane
head(mydf)

mylist = list(mymatrix, mydf)
head(mylist)

# Exercise 1. For the matrix, in separate operations, take a slice of rows, a selection of columns, and a single element.

View(mymatrix)
mymatrix[1:10, ]
mymatrix[ , 1:10]
mymatrix[ , 1]
mymatrix[[11]] # 1 element z 1 wiersza 2 kolumny

# Exercise 2. For the data.frame, grab a column in 3 different ways.
View(mydf)
mydf['speed']
mydf[['speed']] # wektor
mydf$speed
mydf[1]
mydf[[1]] # wektor

# Exercise 3. For the list, grab an element by number and by name.
head(mylist)

mylist[1]
mylist[[1]]
mylist['mydf']

names(mydf) # nazyw kolumn 
str(mylist) # Po znakach $ nie ma nazw. Dlatego nie mogę wywołać elementów listy po nazwach.

# Nazdanie nazw w mylist
names(mylist) <- c('mymatrix', 'mydf')
str(mylist)
mylist['mydf']
mylist[['mydf']]
mylist$mymatrix

## 1.4 Pipes ----
library(tidyverse)

install.packages('magrittr')
library(magrittr)

mydf = cars
View(mydf)

# Filtrowanie przejechanego kilometru od 50 km
mydf1 <- mydf %>% 
  select(speed, dist) %>% 
  filter(dist >= 50)
# Mogę dorzucić jeszcze summary() na koniec. Ta funkcja wyświetli podstawowe statystyki.
View(mydf1)

### 1.4.1 Using Variables as They are Created - mutate() ----
mydf %>% 
  mutate(newvar = speed/dist) %>% 
  summarise(newvar_avg = mean(newvar))
# Średnia prędkosć na jednostke przebytego dystansu.
# Funkcja summarise() służy do obliczania podstawowych statystyk. Z wielu obserwacji tworzy jeden wiersz do przechowania wyniku obliczeń.

### 1.4.2 The Dot - niezgodność funkcji z operatorem potoku (%>%) ----
# Problem niezgodności funkcji z operatorem potoku rozwiązuje się poprzed dopisania argumentu data = . w funkcji.

# Błąd
# Funkcja lm() jest niezgodna z operatorem potoku
mydf %>% 
  lm(dist ~ speed) # regresja


mydf %>% 
  lm(dist ~ speed, data = .) # działa

## 1.5 Tidyverse ----


