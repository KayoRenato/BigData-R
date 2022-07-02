library(RSQLite)

# catsystem("del exemplo.db") # --> no Windows
system("rm banco_SQLite.db")    # --> no Mac e Linux

# Criando driver e conexao ao banco de dados
drv = dbDriver("SQLite")
db_connection = dbConnect(drv, dbname = "banco_SQLite.db") #Caso o banco nao exista ele e criando no momento da conexao
dbListTables(db_connection) #listar as tabelas do banco


# Criando uma tabela e carregando com dados do dataset mtcars
dbWriteTable(db_connection, "mtcars", mtcars, row.names = TRUE)

# Listar as tabelas do banco
dbListTables(db_connection) 
dbExistsTable(db_connection,"mtcars")
dbExistsTable(db_connection,"mtcars2")
dbListFields(db_connection,"mtcars")

# Lendo o conteudo da tabela
dbReadTable(db_connection, "mtcars")

# Criando apenas a definicao da tabela.
dbWriteTable(db_connection, "mtcars2", mtcars[0, ], row.names = TRUE)
dbListTables(db_connection)
dbReadTable(db_connection, "mtcars2")

# Executando consultas no banco de dados
query = "select row_names from mtcars"
result_set = dbSendQuery(db_connection, query)
?fetch
dados = fetch(result_set, n = -1) # n = -1 para trazer todos os registros em um unico fetch
dados
class(dados)


# Executando consultas no banco de dados e grava linha a linha
query = "select row_names from mtcars"
rs = dbSendQuery(db_connection, query)
while (!dbHasCompleted(rs))
{
  dados = fetch(rs, n = 7) # n e o numero de registros trazeridos por fetch
  print(dados$row_names)
}
View(dados)


# Executando consultas no banco de dados
query = "select disp, hp from mtcars where disp > 160"
rs = dbSendQuery(db_connection, query)
dados = fetch(rs, n = -1)
dados

# Executando consultas no banco de dados
query = "select row_names, avg(hp) from mtcars group by row_names"
rs = dbSendQuery(db_connection, query)
dados = fetch(rs, n = -1)
dados

# Criando uma tabela a partir de um arquivo
dbWriteTable(db_connection, "iris", "iris.csv", sep = ",", header = T)
dbListTables(db_connection)
dbReadTable(db_connection, "iris")

# Encerrando a conexao
dbDisconnect(db_connection)

# Carregando dados no banco de dados
# http://dados.gov.br/dataset/iq-indice-nacional-de-precos-ao-consumidor-amplo-15-ipca15 (indice.csv)
# Criando driver e conexao ao banco de dados
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "banco_SQLite.db")

dbWriteTable(con,"indices", "indice.csv",
             sep = "|", header = T)

dbListTables(con)

# Caso seja necessario remover tabela devido a insersao errada
dbRemoveTable(con, "indices")
dbListTables(con)

dbWriteTable(con,"indices", "indice.csv",
             sep = "|", header = T)


dbReadTable(con, "indices")

df <- dbReadTable(con, "indices")
df
str(df)
sapply(df, class)

hist(df$setembro)
df_mean <- unlist(lapply(df[, c(4:8)], mean))
df_mean

dbDisconnect(con)

