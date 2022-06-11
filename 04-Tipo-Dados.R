#todos os numeros criados em R sao do modo numeric e 
#sao armazenados como numeros decimais (double)
num1 <- 7
num1
mode(num1)
class(num1)
typeof(num1)

num2 = 16.82
num2
mode(num2)
typeof(num2)

#converter tipo numeric para integer
is.integer(num2)
y = as.integer(num2)
y
class(y)
mode(y)
typeof(y)

is.integer(num1)
z = as.integer(num1)
z
class(z)
mode(z)
typeof(z)

as.integer('3.17') #converter string para integer
as.integer('Kayo')
as.integer(TRUE)
as.integer(FALSE)
as.integer('TRUE')
as.integer('FALSE')

#character
char1 = 'A'
char1
mode(char1)
class(char1)
typeof(char1)

char2 = "cientista"
char2
mode(char2)
class(char2)
typeof(char2)

char3 <- c('Data', "Science", 'Academy')
char3
mode(char3)
class(char3)
typeof(char3)

#numeros complexos
compl = 2.5 +4i
compl
mode(compl)
class(compl)
typeof(compl)

sqrt(-1)
sqrt(-1+0i)
sqrt(as.complex(-1))

#logico
x = 3; w = 2
q = x > w
q
class(q)

u = FALSE; v <- TRUE
u & v
u | v
!u
!!v

#operacao com o numero 0
5/0
0/5

#erro 
'Kayo'/5
