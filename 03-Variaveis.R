#criacao de variavel
var1 = 100
var1
mode(var1)
?mode
sqrt(var1)

#atribuicao de uma variavel a outra
var2 = var1
var2
mode(var2)
typeof(var2)
?typeof

#atribuicao de lista a uma variavel
var3 = c('primeiro', 'segundo', 'terceiro')
var3
mode(var3)
typeof(var3)

#atribuicao de uma funcao a uma variave
var4 = function(x) {x+3}
var4
mode(var4)
typeof(var4)

#mudar o modo de uma variavel
var5 = as.character(var1)
var5
mode(var5)
typeof(var5)

#atribuicao atraves de arrow ou function assign
x <- c(6.3, 4.5, 5.5)
x
mode(x)
typeof(x)

c(3, 6, 8, 2) -> y
y

assign('x', c(6.3, 4, -2))
x

#verificando o valor em uma posicao especifica 
x[2]

x[-2]

x[1]

x[3]

x[0]

x[-1]

#verificar objetos
ls()
objects()

#remover os objectos
rm(x)
