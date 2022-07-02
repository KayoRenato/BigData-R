library(DBI)
library(RMySQL)
library(ggplot2)
library(dplyr)

db_data <- read.csv(file = "crypt_mysql_data.csv")

conect_DB = dbConnect(MySQL(), user = db_data$user, password = db_data$password, dbname = db_data$dbname, host = db_data$host)

qry <- "select pclasss, survive, avg(age) as media_idade from titanic where survive = 1 group by pclasss, survive;"

dbGetQuery(conect_DB, qry)

dados <- dbGetQuery(conect_DB, qry)
head(dados)
class(dados)
ggplot(dados, aes(pclasss, media_idade)) + geom_bar(stat = "identity")

# Conectando no MySQL com dplyr
?src_mysql
?tbl
conect_DB_2 <- src_mysql(user = db_data$user, password = db_data$password, dbname = db_data$dbname, host = db_data$host)


# Coletando e agrupando os dados
dados2 <- conect_DB_2 %>%
  tbl("titanic") %>%
  select(pclasss, sex, age, survive, fare) %>%
  filter(survive == 0) %>%
  collect()

head(dados2)


# Manipulando dados
dados2 <- conect_DB_2 %>%
  tbl("titanic") %>%
  select(pclasss, sex, survive) %>%
  group_by(pclasss, sex) %>%
  summarise(survival_ratio = avg(survive)) %>%
  collect()

View(dados2)


# Plot
ggplot(dados2, aes(pclasss,survival_ratio, color=sex, group=sex)) +
  geom_point(size=3) + geom_line()


# Sumarizando os dados
dados2 <- conect_DB_2 %>%
  tbl("titanic") %>%
  filter(fare > 150) %>%
  select(pclasss,sex,age,fare) %>%
  group_by(pclasss,sex) %>%
  summarise(avg_age = avg(age),
            avg_fare = avg(fare))

head(dados2)


# --> Para outros bancos de dados, use RODBC
