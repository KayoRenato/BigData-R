# Muitas das tecnicas abaixo podem ser realizadas com a aplicacao das funcoes:
# subset(), merge(), plyr::arrange()
# Mas conhecer estas notacoes e fundamental para compreeder como
# gerar subconjuntos de dados


## Vetores
x <- c("A", "E", "D", "B", "C")
x[]
x


# Indices Positivos - Elementos em posicoes especificas
x[c(1, 3)]
x[c(1, 1)]
x[order(x)]


# Indices Negativos - Ignora elementos em posicoes especificas
x[-c(1, 3)]
x[-c(1, 4)]


# Vetor Logico para gerar subsetting
x[c(TRUE, FALSE)]
x
x[c(TRUE, FALSE, TRUE, FALSE)]


# Vetor de caracteres
x <- c("A", "B", "C", "D")
y <- setNames(x, letters[1:4])
y
y[c("d", "c", "a")]
y[c("a", "a", "a")]


## Matrizes
mat <- matrix(1:9, nrow = 3)
colnames(mat) <- c("A", "B", "C")
mat
mat[1:2, ]
mat[1:2, 2:3]


# Funcao outer() permite que uma Matriz se comporte como vetores individuais
?outer
vals <- outer(1:5, 1:5, FUN = "paste", sep = ",")
vals
vals[c(4, 15)]


## Dataframes
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df
df$x
df[df$x == 2, ]
df[c(1, 3), ]
df[c("x", "z")]
df[, c("x", "z")]
str(df["x"])
str(df[, "x"])


# Removendo colunas de dataframes
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df
df$z <- NULL
df
df$y <- NA
df

# Operadores [], [[]] e $
a <- list(x = 1:3, y = 4:5)
a
a[1]
a[[1]]
a[[1]][[1]]
a[["x"]]

b <- list(a = list(b = list(c = list(d = 1))))
b
b[[c("a", "b", "c", "d")]]
b[["a"]][["b"]][["c"]][["d"]]


# x$y e equivalente a x[["y", exact = FALSE]]
var <- "cyl"
mtcars$var
View(mtcars)
mtcars[[var]]

x <- list(abc = 1)
x
x$a
x[["a"]]
x[["abc"]]


# Subsetting e atribuicao
x <- 1:5
x
x[c(1, 2)] <- 2:3
x

x[-1] <- 4:1
x

# Isso e subsetting
head(mtcars)
mtcars[] <- lapply(mtcars, as.integer)
head(mtcars)


# Isso nao e subsetting
mtcars <- lapply(mtcars, as.integer)
head(mtcars)


# Lookup tables
x <- c("m", "f", "u", "f", "f", "m", "m")
lookup <- c(m = "Male", f = "Female", u = NA)
lookup[x]
unname(lookup[x])


# Usando operadores logicos
x1 <- 1:10 %% 2 == 0
x1
?which
which(x1)
x2 <- which(x1)
x2
y1 <- 1:10 %% 5 == 0
y1
y2 <- which(y1)
y2
intersect(x2, y2)

x1 & y1
which(x1&y1)

union(x2, y2)

setdiff(x2, y2)

