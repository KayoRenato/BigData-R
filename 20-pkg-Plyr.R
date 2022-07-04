library(plyr)
library(gapminder)
?gapminder

str(gapminder)
head(gapminder)
summary(gapminder)
View(gapminder)

# Split-Apply-Combine
?ddply
df <- ddply(gapminder, ~ continent,
            summarize,
            max_le = max(lifeExp))
str(df)
head(df)
View(df)
levels(df$continent)


# Split-Apply-Combine
ddply(gapminder, ~ continent,
      summarize,
      n_uniq_countries = length(unique(country)))

length(unique(gapminder$country))

ddply(gapminder, ~ continent,
      function(x) c(n_uniq_countries = length(unique(x$country))))


ddply(gapminder, ~ continent,
      summarize,
      min = min(lifeExp),
      max = max(lifeExp),
      median = median(gdpPercap))


# Usando um dataset do ggplot
library(ggplot2)
data(mpg)
str(mpg)
?mpg


# Trabalhando com um subset do dataset
data <- mpg[,c(1,7:9)]
str(data)
View(data)


# Sumarizando e Agregando Dados
?ddply
ddply(data, .(manufacturer),
      summarize,
      avgcty = mean(cty))


# Varias funcoes em uma unica chamada
ddply(data, .(manufacturer),
      summarize,
      avgcty = mean(cty),
      sdcty = sd(cty),
      maxhwy = max(hwy))


# Sumarizando os dados pela combinacao de variaveis/fatores
ddply(data, .(manufacturer, drv),
      summarize,
      avgcty = mean(cty),
      sdcty = sd(cty),
      maxhwy = max(hwy))
