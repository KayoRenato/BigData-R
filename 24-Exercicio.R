# Formatando os dados de uma pagina web
library(rvest)
library(stringr)
library(tidyr)
library(xml2)
library(gtools)


# Exercicio 1 - Faca a leitura da url abaixo e grave no objeto pagina
# http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I

pagina <- read_html('http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I')
pagina
print(pagina)

# Exercicio 2 - Da pagina coletada no item anterior, extraia o texto que contenha as tags:
# "#detailed-forecast-body b  e .forecast-text"

ex2 <- pagina %>%
  html_nodes('#detailed-forecast-body b , .forecast-text')

ex2

# Exercicio 3 - Transforme o item anterior em texto

ex3 <- html_text(ex2)
ex3 <- paste(ex3, collapse = " ")

ex3

# Exercicio 4 - Extraimos a pagina web abaixo para voce. Agora faca a coleta da tag "table"
url <- 'http://espn.go.com/nfl/superbowl/history/winners'
pagina <- read_html(url)

super_bow_winners <- pagina %>%
  html_table()

class(super_bow_winners)
length(super_bow_winners)
print(super_bow_winners[[1]])


# Exercicio 5 - Converta o item anterior em um dataframe

df_SuperBowWinners <- as.data.frame(super_bow_winners[[1]])
View(df_SuperBowWinners)

# Exercicio 6 - Remova as duas primeiras linhas e adicione nomes as colunas

df_SuperBowWinners <- df_SuperBowWinners[-1:-2,]
df_SuperBowWinners

colnames(df_SuperBowWinners) <- c('No', 'Data', 'Estadio', 'Resultado')
df_SuperBowWinners

# Exercicio 7 - Converta de algarismos romanos para numeros inteiros
str(df_SuperBowWinners)

df_SuperBowWinners$No <- as.roman(df_SuperBowWinners$No)

?roman2int
df_SuperBowWinners$No <- roman2int(df_SuperBowWinners$No)

df_SuperBowWinners$Data <- as.Date(df_SuperBowWinners$Data, "%B. %d, %Y")

str(df_SuperBowWinners)
View(df_SuperBowWinners)

# Exercicio 8 - Divida a coluna Resuktado em 2 colunas, vencedores e perdedores
?separate

df_SuperBowWinners <- df_SuperBowWinners %>%
  separate(Resultado, c("Vencedores", "Perdedores"), ", ")

View(df_SuperBowWinners)


# Exercicio 9 - Inclua mais 2 colunas com o score dos vencedores e perdedores
# Dica: Voce deve fazer mais uma divisao nas colunas

pattern <- " \\d+$" #digitos no final de uma string que comecem com espaco

df_SuperBowWinners$ScoreVencedor <- as.numeric(str_extract(df_SuperBowWinners$Vencedores, pattern))
df_SuperBowWinners$Vencedores <-gsub(pattern, "",df_SuperBowWinners$Vencedores)

df_SuperBowWinners$ScorePerdedores <- as.numeric(str_extract(df_SuperBowWinners$Perdedores, pattern))
df_SuperBowWinners$Perdedores <-gsub(pattern, "",df_SuperBowWinners$Perdedores)

View(df_SuperBowWinners)
str(df_SuperBowWinners)

# Exercicio 10 - Grave o resultado em um arquivo csv

write.csv(df_SuperBowWinners, file = "SuperBowWinners")
?read.csv
read_SBW <- read.csv('SuperBowWinners')
read_SBW <- read_SBW[,-1]
View(read_SBW)
