# Exercicio 1 - Crie uma função que receba os dois vetores abaixo como parâmetro, 
# converta-os em um dataframe e imprima no console
vec1 <- (10:13)
vec2 <- c("a", "b", "c", "d")

vec_merge <- data.frame(vec1, vec2)
View(vec_merge)

# Exercicio 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com 
# números inteiros e calcule a média de cada linha

mtx <- matrix(sample.int(16), nrow = 4, ncol = 4)
View(mtx)
apply(mtx, 1, mean)


# Exercicio 3 - Considere o dataframe abaixo. 
# Calcule a média por disciplina e depois calcule a média de apenas uma disciplina
escola <- data.frame(Aluno = c('Alan', 'Alice', 'Alana', 'Aline', 'Alex', 'Ajay'),
                     Matematica = c(90, 80, 85, 87, 56, 79),
                     Geografia = c(100, 78, 86, 90, 98, 67),
                     Quimica = c(76, 56, 89, 90, 100, 87))


apply(escola[,2:4], 2, mean)

apply(escola[,2, drop = FALSE], 2, mean)
# ou
mean(escola$Matematica)

# Exercicio 4 - Crie uma lista com 3 elementos, todos numéricos 
# e calcule a soma de todos os elementos da lista
list1 <- list(a=c(2, 5, 2), b=c(3:10), c=c(1:5))

lapply(list1, sum)

do.call(sum, list1)

# Exercicio 5 - Transforme a lista anterior um vetor

vec3 <- unlist(list1)
View(vec3)
sum(vec3)

# Exercicio 6 - Considere a string abaixo. Substitua a palavra "textos" por "frases"
str <- c("Expressoes", "regulares", "em linguagem R", 
         "permitem a busca de padroes", "e exploracao de textos",
         "podemos buscar padroes em digitos",
         "como por exemplo",
         "10992451280")


str <- gsub('textos', 'frases', str)
str


# Exercicio 7 - Usando o dataset mtcars, crie um grafico com ggplot do tipo 
# scatter plot. Use as colunas disp e mpg nos eixos x e y respectivamente

library(ggplot2)

str(mtcars)
?ggplot
ggplot(mtcars) +
  geom_point(aes(disp, mpg))



# Exercicio 8 - Considere a matriz abaixo.
# Crie um bar plot que represente os dados em barras individuais.
mat1 <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow = 3, byrow = T)
mat1
?as.vector
barplot(as.vector(mat1))

#poderia ser feito dessa forma
barplot(mat1, beside = TRUE)

tmat1 <- t(mat1)
barplot(as.vector(tmat1))


# Exercício 9 - Qual o erro do código abaixo?
data(diamonds)
str(diamonds)
View(diamonds)
?ggplot

# ggplot(data = diamonds, aes(x = price, group = fill, fill = cut)) + 
#  geom_density(adjust = 1.5)
# Que paremetros sao esse - 'group' e 'fill' ????
# fill seria apenas para um boxplot? Não
# group por fill nao faz sentido, poderia ser agrupado pela variavel cut, mas por fill nao.

ggplot(data = diamonds, aes(x = price, group = cut, fill = cut)) + 
  geom_density(adjust = 1.5)


# Exercício 10 - Qual o erro do código abaixo?
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  labs(fill = "cyl")

# geom_barplot() substituir por geom_bar()


