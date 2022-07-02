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
dados <- con$find() # nao passando nenhum paramentro no find ele trara todos os registro da collection
View(dados)

# Verifica o numero de registros no conjunto de dados
con$count('{}')


# Busca uma amostra de dados somente com propriedades do tipo House e as suas politicas de cancelamento com o ID
amostra1 <- con$find(
  query = '{"property_type" : "House" }',
  fields = '{"property_type" : true, "cancellation_policy" : true}'
)
View(amostra1)


# Removendo o campo de id
amostra2 <- con$find(
  query = '{"property_type" : "House" }',
  fields = '{"property_type" : true, "cancellation_policy" : true, "_id": false}'
)
View(amostra2)


# Vamos ordenacao decrescente (-1) o resultado 
amostra3 <- con$find(
  query = '{"property_type" : "House" }',
  fields = '{"property_type" : true, "cancellation_policy" : true, "_id": false}',
  sort = '{"cancellation_policy": -1}'
)
View(amostra3)


# Vamos agregar os dados e retornar a media de reviews (avaliacoes) por tipo de propriedade
amostra4 <- con$aggregate(
  '[{"$group":{"_id":"$property_type", "count": {"$sum":1}, "average":{"$avg":"$number_of_reviews"}}}]',
  options = '{"allowDiskUse":true}'
)
names(amostra4) <- c("tipo_propriedade", "contagem", "media_reviews")
View(amostra4)

# Vamos colocar o resultado em um grafico
ggplot(aes(tipo_propriedade, contagem), data = amostra4) + geom_col()


# MapReduce - Mapeamento e Reducao

# Contagem do numero de reviews considerando todas as propriedades
resultado <- con$mapreduce(
  map = "function(){emit(Math.floor(this.number_of_reviews), 1)}",
  reduce = "function(id, counts){return Array.sum(counts)}"
)
names(resultado) <- c("numero_reviews", "contagem")
View(resultado)

# Plot
ggplot(aes(numero_reviews, contagem), data = resultado) + geom_col()

# Contagem do numero de reviews por faixa considerando todas as propriedades
resultado <- con$mapreduce(
  map = "function(){emit(Math.floor(this.number_of_reviews/100)*100, 1)}",
  reduce = "function(id, counts){return Array.sum(counts)}"
)
names(resultado) <- c("numero_reviews", "contagem")
View(resultado)

# Plot
ggplot(aes(numero_reviews, contagem), data = resultado) + geom_col()

# Contagem do numero de quartos considerando todas as propriedades
resultado <- con$mapreduce(
  map = "function(){emit(Math.floor(this.bedrooms), 1)}",
  reduce = "function(id, counts){return Array.sum(counts)}"
)
names(resultado) <- c("numero_quartos", "contagem")
View(resultado)

# Plot
ggplot(aes(numero_quartos, contagem), data = resultado) + geom_col()

