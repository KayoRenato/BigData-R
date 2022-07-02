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
dados = fetch(result_set, n = -1) # n = -1 para trazer o numero maximo de dados por fetch
dados
class(dados)


# Executando consultas no banco de dados e grava linha a linha
query = "select row_names from mtcars"
rs = dbSendQuery(db_connection, query)
while (!dbHasCompleted(rs))
{
  dados = fetch(rs, n = 1) # n = 1 para trazer um dados por fetch
  print(dados$row_names)
}
View(dados)
