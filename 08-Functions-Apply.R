#apply() -> arrays ou matrizes
#tapply() -> os vetores podem ser divididos em diferentes subsets
#lapply() -> vetores ou listas
#sapply() -> versao amigavel do lapply()
#vapply() -> similiar com o sapply(), com valor de retorno modificado
#rapply() -> similar ao lapply()
#eapply() -> gera um lista
#mapply() -> similar a sapply() , multivariada
#by


#se tiver trabalhando com objetos:
#list, numeric ou character dos tipos list ou vector e recomendando utilizar -> sapply() ou lapply()
#matriz ou data.frame (agregacao por coluna) -> by / tapply()
#operacoes por linhas ou operacoes especificas -> apply()

lista1 <- list(a = (1:20), b = (35:67))
lista1
length(lista1)
str(lista1)


val_a = 0
val_b = 0

for (i in lista1$a) {
  val_a = val_a + i
}
val_a

for (i in lista1$b) {
  val_b = val_b + i
}
val_b

#isso e o mesmo que realizar
#aplica uma funcao a todos os elementos de uma coluna da lista
sapply(lista1, sum)

#exemplo com matrizes

matriz_x <- matrix(c(12, 43, 23, 31, 48, 62, 86, 08, 37), nrow = 3, byrow = T)
matriz_x

apply(matriz_x, 1)
?apply

#calculando a media das linhas (par: 1 -linha)
apply(matriz_x, 1, mean)

#calculando a media das colunas (par: 2 -colunas)
apply(matriz_x, 2, mean)


#aplica um plot em cada valores por linha
apply(matriz_x, 1, plot)

#aplica um plot em cada valores por coluna
apply(matriz_x, 2, plot)


#aplicacao em um data.frame

escola <- data.frame(Aluno = c('Kayo', 'Erika', 'Lucia', 'Kassio', 'Joao', 'Kayque'),
                     Matematica = c(34, 75, 93, 57, 78, 87),
                     Portugues = c(65, 23, 94, 23, 51, 72),
                     Ingles = c(29, 29, 50, 81, 100, 82)
)
View(escola)

escola$Media = NA
View(escola)

escola$Media <- apply(escola[,c(2:4)], 1, mean)
escola$Media <- round(escola$Media, 2)
View(escola)



#funcoes de agregacao com agrupamentos
?gl
?floor
?runif
tabela_basquete <- data.frame( equipe = gl(5, 5, labels = paste('Equipe', LETTERS[1:5])),
                               jogador = sample(letters, 25),
                               num_cestas = floor(runif(25, min = 0, max = 50))
  
)
View(tabela_basquete)
summary(tabela_basquete)

#usando o tapply para calcular o total de pontos realizados pelas equipes
tapply(tabela_basquete$num_cestas, tabela_basquete$equipe, sum)

#realizando o mesmo calculo utilizando um package que permite usar comandos sql
install.packages("sqldf")
library(sqldf)

sqldf('select equipe, sum(num_cestas) from tabela_basquete group by equipe')

#usando o tapply para calcular o medias de pontos realizados pelas equipes
tapply(tabela_basquete$num_cestas, tabela_basquete$equipe, mean)

sqldf('select equipe, avg(num_cestas) from tabela_basquete group by equipe')

#obs.: utilizar o tapply e mais performatico que o sqldf.

