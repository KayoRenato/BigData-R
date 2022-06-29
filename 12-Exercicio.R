# Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:
head(mtcars)
View(mtcars)

?write.table
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = N, qmethod = "double") #erro
write.table(mtcars, file = "mtcars3.txt", sep = "|", col.names = NA, qmethod = "double") #possível solucao

# Exercicio 2 - Encontre e faça a correção do erro na instrução abaixo:
library(readr)
?read_csv

write_csv(iris, file = "iris.csv")

df_iris <- read_csv("iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))


# Exercício 3 - Abaixo você encontra dois histogramas criados separadamente.
# Mas isso dificulta a comparação das distribuições. Crie um novo plot que faça a união 
# de ambos histogramas em apenas uma área de plotagem.

# Dados aleatórios
dataset1=rnorm(4000 , 100 , 30)     
dataset2=rnorm(4000 , 200 , 30) 

# Histogramas
par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="")


hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , main="", add=T)
legend("topright", legend = c('Dataset1', 'Dataset2'), col=c(rgb(1,0,0,0.5), rgb(0,0,1,0.5)), 
                                                             pt.cex=2, pch=15)

# Exercício 4 - Encontre e corrija o erro no gráfico abaixo
install.packages("plotly")
library(plotly)
head(iris)

?plot_ly
plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = ~Species , marker=list(size=20 , opacity=0.5))


# Exercício 5 - Em anexo você encontra o arquivo exercicio5.png. Crie o gráfico que resulta nesta imagem.
head(volcano)
View(volcano)
p = plot_ly(z=volcano, type = "surface")
p


# Exercício 6 - Carregue o arquivo input.json anexo a este script e imprima o conteúdo no console
# Dica: Use o pacote rjson
library("rjson")
result <- fromJSON(file = "input.json")
print(result)

# Exercício 7 - Converta o objeto criado ao carregar o arquivo json do exercício anterior 
# em um dataframe e imprima o conteúdo no console.
df_json <- as.data.frame(result)
View(df_json)

# Exercício 8 - Carregue o arquivo input.xml anexo a este script.
# Dica: Use o pacote XML

library('XML')

result_XML <- xmlParse(file = 'input.xml')
result_XML


# Exercício 9 - Converta o objeto criado no exercício anterior em um dataframe
df_XML <- xmlToDataFrame(nodes=getNodeSet(result_XML, "//EMPLOYEE"))
View(df_XML)
# ou
df_XML_2 <- xmlToDataFrame("input.xml")
View(df_XML_2)

# Exercício 10 - Carregue o arquivo input.csv em anexo e então responda às seguintes perguntas:
result_csv <- read_csv(file = 'input.csv')
View(result_csv)

# Pergunta 1 - Quantas linhas e quantas colunas tem o objeto resultante em R?
dim(result_csv)

# Pergunta 2 - Qual o maior salário?
max_sal <- max(result_csv$salary)

# Pergunta 3 - Imprima no console o registro da pessoa com o maior salário.
best_sal <- subset(result_csv, result_csv$salary==max_sal)
View(best_sal)

# Pergunta 4 - Imprima no console todas as pessoas que trabalham no departamento de IT.
time_TI <- subset(result_csv, result_csv$dept=='IT')
View(time_TI)

# Pergunta 5 - Imprima no console as pessoas do departamento de IT com salário superior a 600. 
time_TI_600_1 <- subset(time_TI, salary>600)
View(time_TI_600_1)

# ou
time_TI_600_2 <- subset(result_csv, dept=='IT' & salary>600)
View(time_TI_600_2)
