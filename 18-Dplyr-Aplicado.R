# Instalando pacote hflights (Dados de voos de Houston)
library(hflights)
library(dplyr)
?hflights


# Criando um objeto tbl
?tbl_df
flights <- tbl_df(hflights)
flights
View(flights)


# Resumindo os dados
str(hflights)
glimpse(hflights)


# Visualizando como dataframe
data.frame(head(flights))


# Filtrando os dados com slice
flights[1,1]
flights[flights$Month == 1 & flights$DayofMonth == 1, ]


# Aplicando filte
?filter
filter(flights, Month == 1, DayofMonth == 1)
filter(flights, UniqueCarrier == "AA" | UniqueCarrier == "UA")
filter(flights, UniqueCarrier %in% c("AA", "UA"))


# Select
?select
select(flights, Year:DayofMonth, contains("Time"), starts_with("Taxi"),ends_with("Delay"))

select(flights, matches("ar[rt]")) #regex


# Organizando os dados
?arrange

flights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(DepDelay)

flights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(desc(DepDelay))


?mutate
flights %>%
  select(Distance, AirTime) %>%
  mutate(Speed = Distance/AirTime*60)

?tapply
head(with(flights, tapply(ArrDelay, Dest, mean, na.rm = TRUE)))

# mesma coisa que o comando anterior
flights %>%
  filter(ArrDelay != 'NA') %>%
  group_by(Dest) %>%
  summarise(avg_delay = mean(ArrDelay)) %>%
  head

head(aggregate(ArrDelay ~ Dest, flights, mean))

# mesma coisa que o comando anterior
flights %>%
  filter(ArrDelay != 'NA') %>%
  group_by(Dest) %>%
  summarise(avg_delay = mean(ArrDelay)) %>%
  head

?tally

flights %>%
  group_by(Month, DayofMonth) %>%
  tally(sort = TRUE) # mesma coisa que usar o summarise(n = n()) %>% arrange(desc(n))

flights %>%
  group_by(Month, DayofMonth) %>%
  summarise(n = n()) %>%
  arrange(desc(n))
          