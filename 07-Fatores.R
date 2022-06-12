#Fatores sao utilizandos principalmente para otimizar (encode) variaveis quantitativas
#economizando espaco com o uso de ponteiros para valores repetidos
?factor

vec1 <- c("Macho", "Femea", "Femea", "Macho", "Macho")
vec1
str(vec1)

fac_vec1 <- factor(vec1)
fac_vec1
str(fac_vec1)

#ordenacao de categorias
grad <- c("Mestrado", "Doutorado", "Bacharelado", "Mestrado", "Mestrado")
grad
str(grad)
summary(grad)

fac_grad <- factor(grad, ordered = TRUE, levels = c("Doutorado", "Mestrado", "Bacharelado"))
fac_grad
levels(fac_grad)
str(fac_grad)

summary(fac_grad)

#aplicacao em dataset Global Temperature
install.packages("data.table")
library(data.table)

global_temp <- fread('/Users/kayorenato/Documents/DSA/BigDataAnalyticsR/projeto-global-warming/TemperaturasGlobais.csv')
head(global_temp)

str(global_temp)
global_temp$Country <- factor(global_temp$Country)
summary(global_temp$Country)
plot(na.omit(global_temp$Country), xlab = 'Paises', ylab = 'Quantidade de Reg.')


#Alterando uma variavel numerica(transformada - encoding) para categorica

etnia <- fread('etnias.csv')
View(etnia)
str(etnia)

etnia$Sexo <- factor(etnia$Sexo)
summary(etnia$Sexo)
etnia$Etnia <- factor(etnia$Etnia)
summary(etnia$Etnia)
etnia$Estado_Civil <-factor(etnia$Estado_Civil, labels  =c('Solteiro', 'Casado', 'Divorciado'))
summary(etnia$Estado_Civil)

str(etnia)

etnia$Sexo <- factor(etnia$Sexo, labels = c('Mulher', 'Homem'))
summary(etnia$Sexo)

View(etnia)

boxplot(etnia$Peso ~ etnia$Sexo, xlab = 'Sexo Biologico', ylab = 'Peso (kg)')

boxplot(etnia$Idade ~ etnia$Estado_Civil, xlab = 'Estado Civil', ylab = 'Idade (anos)')

boxplot(etnia$Idade ~ etnia$Etnia, xlab = 'Etnia', ylab = 'Idade (anos)')
