#vetor - possui 1 dimensao e 1 tipo de dados
vec1 <- c(1:20) # um array de 1 a 20
vec1
length(vec1)
mode(vec1)
class(vec1)
typeof(vec1)


#matriz - possui 2 dimensoes e 1 tipo de dados
matriz1 <- matrix(1:20, nrow = 2)
matriz1
length(matriz1)
mode(matriz1)
class(matriz1)
typeof(matriz1)

#array - possui duas ou mais dimensoes e 1 tipo de dados
array1 <- array(1:5, dim = c(3,3,3))
array1
length(array1)
class(array1)
mode(array1)
typeof(array1)

#data frames - dados de diferentes tipos de dados
View(iris)
length(iris)
mode(iris)
class(iris)
typeof(iris)

#lista - colecao de diferentes objetos
lista1 <- list(a = matriz1, b= vec1, c=iris)
lista1
length(lista1)
mode(lista1)
class(lista1)
typeof(lista1)

#funcao - tambem sao vistas como objeto em R

func1 <- function(x){
  var1 <- x * x
  return(var1)
}

func1(4)
class(func1)

#removendo objetos
objects()
rm(array1, func1)
objects()