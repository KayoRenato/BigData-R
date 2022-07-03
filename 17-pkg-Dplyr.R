library(readr)
library(dplyr)

# Carregando o dataset
dir()
sono_df <- read_csv("sono.csv")
View(sono_df)
head(sono_df)
class(sono_df)
str(sono_df)


# Funcao glimpse() pode ser usada no lugar da funcao str()
glimpse(sono_df)


# Aplicando mutate
glimpse(mutate(sono_df, peso_libras = sono_total / 0.45359237))


# Contagem e histograma
?count
count(sono_df, cidade, sort = TRUE)
hist(sono_df$sono_total)


# Amostragem
?sample_n
sample_n(sono_df, size = 10)


# select()
sleepData <- select(sono_df, nome, sono_total)
head(sleepData)
class(sleepData)
select(sono_df, nome)
select(sono_df, nome:cidade)
select(sono_df, nome:pais)


# filter()
filter(sono_df, sono_total >= 16)
filter(sono_df, sono_total >= 16, peso >= 80)
filter(sono_df, cidade %in% c("Recife", "Curitiba"))


# arrange()
sono_df %>% arrange(cidade) %>% head

sono_df %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>%
  head

sono_df %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>%
  filter(sono_total >= 16)

sono_df %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, desc(sono_total)) %>%
  filter(sono_total >= 16)


# mutate()
head(sono_df)
sono_df %>%
  mutate(novo_indice = sono_total / peso) %>%
  head

head(sono_df)


sono_df %>%
  mutate(novo_indice = sono_total / peso,
         peso_libras = peso / 0.45359237) %>%
  head

sono_df %>%
  mutate(novo_indice = sono_total / peso,
         novo_indice_ext = novo_indice * 1.5) %>%
  head


# summarize()
sono_df %>%
  summarise(media_sono = mean(sono_total))

sono_df %>%
  summarise(media_sono = mean(sono_total),
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n())


# group_by()
sono_df %>%
  group_by(cidade) %>%
  summarise(avg_sono = mean(sono_total),
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n())


# Operador: %>%
head(select(sono_df, nome, sono_total))

sono_df %>%
  select(nome, sono_total) %>%
  head


sono_df %>%
  mutate(novo_indice = round(sono_total * peso)) %>%
  arrange(desc(novo_indice)) %>%
  select(cidade, novo_indice)


sono_df
View(sono_df)


sono_df2 <- sono_df %>%
  mutate(novo_indice = round(sono_total * peso)) %>%
  arrange(desc(novo_indice)) %>%
  select(cidade, novo_indice)

View(sono_df2)
