library(ggplot2)
library(usethis)
library(devtools)
library(mongolite)

?mongolite

db_data <- read.csv("crypt_mongodb_data.csv")


# Cria a conexao ao MongoDB
con <- mongo(collection = db_data$collection,
             db = db_data$db,
             url = db_data$url)

# Visualiza a conexao
print(con)


# Visualiza os dados
dados <- con$find()
View(dados)
