print('Hello World!')

# 1:25 - um array de 1 a 25
plot(1:25)

#instalacao de packages
install.packages('randomForest')
install.packages('ggplot2')
install.packages('dplyr')
install.packages('devtools')


#carregar package
library(ggplot2)

#decarregar um package - quando nao for utilizar e recomendando descarregar para liberar memoria
detach(package:ggplot2)

#visualizar documentacao de uma funcao
?mean
help(mean)

#package complementar para saber mais informacoes de uma funcao
install.packages('sos')
library(sos)

findFn('fread')

#caso nao saiba o nome da funcao podemos usar
help.search('randomForest')
help.search('matplot')
??matplot
RSiteSearch('matplot')
example('matplot')

q()
