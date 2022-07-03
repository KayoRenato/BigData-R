# Exercicio 1 - Instale a carregue os pacotes necessarios para trabalhar com SQLite e R
library(RSQLite)
library(dbplyr)
library(DBI)

Ex
# Exercicio 2 - Crie a conexao para o arquivo mamiferos.sqlite em anexo a este script
dir()
drv = dbDriver("SQLite")
con = dbConnect(
  drv,
  'mamiferos.sqlite'
)

# Exercicio 3 - Qual a versao do SQLite usada no banco de dados?
# Dica: Consulte o help da funcao src_dbi()
qry = 'select sqlite_version();'
rs = dbSendQuery(con, qry)
result <- fetch(rs, -1)
print(result)

#ou 
?src_dbi
src_dbi(con)

# Exercicio 4 - Execute a query abaixo no banco de dados e grave em um objero em R:
# SELECT year, species_id, plot_id FROM surveys
qry = 'SELECT year, species_id, plot_id FROM surveys'
rs = dbSendQuery(con, qry)
ex4 <- fetch(rs, -1)
print(ex4)


# Exercicio 5 - Qual o tipo de objeto criado no item anterior?
typeof(ex4) # List
class(ex4)

# Exercicio 6 - Ja carregamos a tabela abaixo para voce. Selecione as colunas species_id, sex e weight com a seguinte condicao:
# Condicao: weight < 5
qry = 'Select species_id, sex, weight from surveys where weight < 5;'
rs = dbSendQuery(con, qry)


# Exercicio 7 - Grave o resultado do item anterior em um objeto R. O objeto final deve ser um dataframe
ex6 <- fetch(rs, -1)
class(ex6)
View(ex6)


# Exercicio 8 - Liste as tabelas do banco de dados carregado
dbListTables(con)

# Exercicio 9 - A partir do dataframe criado no item 7, crie uma tabela no banco de dados
dbWriteTable(con, 'exercise9', ex6, row.names=TRUE)
#dbRemoveTable(con, 'exercise9')

# Exercicio 10 - Imprima os dados da tabela criada no item anterior
dbListFields(con, 'exercise9')
dbReadTable(con, 'exercise9')

