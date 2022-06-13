# Exercicio 1 - Pesquise pela funcao que permite listar todos os arquivo no diretorio de trabalho
list.files()

# Exercicio 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um logico e um de numeros
vec1 <- c('Kayo', 'Erika', 'Lucia', 'Joao')
vec2 <- c(TRUE, TRUE, FALSE, TRUE)
vec3 <- c(4:7)
?data.frame
df_exr <- data.frame(vec1, vec2, vec3)
View(df_exr)

# Exercicio 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se ha numeros maiores que 10 e imprima o numero e uma mensagem no console.
for (i in sample(1:15,10)) {
  if(i>10)
    message(i, ' e maior que 10')
  else if(i==10) 
          message(i, ' e igual a 10') 
       else
          message(i, ' e menor que 10')
}

# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34)
vec1

# Exercicio 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2
#resposta
sapply(lst2, print)

# Exercicio 5 - Considere as duas matrizes abaixo. 
# Faca uma multiplicação element-wise e multiplicação normal entre as materizes
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise
mat1*mat2

# Multiplicação de matrizes
mat1 %*% mat2


# Exercicio 6 - Crie um vetor, matriz, lista e dataframe e faca a nomeação de cada um dos objetos
vec1
names(vec1) <- c('col1','col2','col3','col4')
vec1

dimnames(mat1) <- list(c('obs1','obs2','obs3','obs4', 'obs5'),c('var1','var2','var3','var4', 'var5'))
mat1

lista_0 <- list(c(1:4), 5, 1)
names(lista_0) <- c('var1', 'var2', 'var3')
lista_0

colnames(df_exr)<-c('Nomes', 'Condicao', 'Pontos')
rownames(df_exr)<-c('Ocr1', 'Ocr2', 'Ocr3', 'Ocr4')
View(df_exr)

# Exercicio 7 - Considere a matriz abaixo. Atribua valores NA de forma aletoria para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2[sample(1:30, 10)]=NA
mat2


# Exercicio 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
rowSums(mat1)
colSums(mat1)

# Exercicio 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a
sort(a)
order(a)
a[order(a)]

# # Exercicio 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
tapply(mat1, mat1>15, print)

