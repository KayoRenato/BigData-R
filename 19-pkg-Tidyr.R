library(tidyr)
library(ggplot2)

# Dados de notas em disciplinas
dados <- data.frame(
  Nome = c("Geografia", "Literatura", "Biologia"),
  Regiao_A = c(97, 80, 84),
  Regiao_B = c(86, 90, 91)
)
dados

?gather
dados %>%
  gather(Regiao, NotaFinal, Regiao_A:Regiao_B)


# Criando dados
set.seed(10)
df2 <- data.frame(
  id = 1:4,
  acao = sample(rep(c('controle', 'tratamento'), each = 2)),
  work.T1 = runif(4),
  home.T1 = runif(4),
  work.T2 = runif(4),
  home.T2 = runif(4)
)

df2

# Reshape 1
df2_organizado1 <- df2 %>%
  gather(key, time, -id, -acao)

df_test <- df2 %>%
  gather(key, time, -id:-home.T1)

df2_organizado1 %>% head(8)

# Reshape 2
?separate
df2_organizado2 <- df2_organizado1 %>%
  separate(key, into = c("localidade", "tempo"), sep = "\\.")

df2_organizado2 %>% head(8)

# If you want to split by any non-alphanumeric value (the default):
df <- data.frame(x = c(NA, "x.y", "x.z", "y.z"))
df %>% separate(x, c("A", "B"))

# If you just want the second variable:
df %>% separate(x, c(NA, "B"))

# If you just want the first variable:
df %>% separate(x, c("K", NA))


# If every row doesn't split into the same number of pieces, use
# the extra and fill arguments to control what happens:
df <- data.frame(x = c("x", "x y", "x y z", NA)) #erro devido ao split nao ser no mesmo tamanho de colunas informado
df %>% separate(x, c("a", "b"))

# The same behaviour as previous, but drops the c without warnings:
df %>% separate(x, c("a", "b"), extra = "drop", fill = "right") #remove o excedente a direita

# Opposite of previous, keeping the c and filling left:
df %>% separate(x, c("a", "b"), extra = "merge", fill = "left") #mantem a inconsistencia a esquerda 

# Or you can keep all three:
df %>% separate(x, c("a", "b", "c")) 

# To only split a specified number of times use extra:
df <- data.frame(x = c("x: 123", "y: error: 7"))

df %>% separate(x, c("key", "value"), ": ", extra = "warn")

df %>% separate(x, c("key", "value"), ": ", extra = "merge")

df %>% separate(x, c("key", "value"), ": ", extra = "drop")


# Use regular expressions to separate on multiple characters:
df <- data.frame(x = c(NA, "a1b", "c4d", "e9g"))
df %>% separate(x, c("A","B"), sep = "[0-9]")

# convert = TRUE detects column classes:
df <- data.frame(x = c("x:1", "x:2", "y:4", "z", NA))

df %>% separate(x, c("key","value"), ":") %>% str

df %>% separate(x, c("key","value"), ":", convert = TRUE) %>% str


# Mais um exemplo
set.seed(1)
df3 <- data.frame(
  participante = c("p1", "p2", "p3", "p4", "p5", "p6"),
  info = c("g1m", "g1m", "g1f", "g2m", "g2m", "g2m"),
  day1score = rnorm(n = 6, mean = 80, sd = 15),
  day2score = rnorm(n = 6, mean = 88, sd = 8)
)

print(df3)

# Reshape dos dados
df_gather <- df3 %>%
  gather(day, score, c(day1score, day2score))

?spread #reverte o gather()
df_gather %>%
  spread(day, score)


df_gather %>%
  separate(col = info, into = c("group", "gender"), 2)


?unite
df_gather %>%
  separate(col = info, into = c("group", "gender"), sep = 2) %>%
  unite(infoAgain, group, gender)


df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2) %>%
  ggplot(aes(x = day, y = score)) +
  geom_point() +
  facet_wrap(~ group) +
  geom_smooth(method = "lm", aes(group = 1), se = F)
?aes
