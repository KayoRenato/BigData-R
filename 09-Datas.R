hoje <- Sys.Date()
hoje
class(hoje)
?Sys.Date

dia_hora <- Sys.time()
dia_hora
class(dia_hora)

regiao_hora <- Sys.timezone()
regiao_hora
class(regiao_hora)

# formatando Datas
# %d: dia do mes em 2 digitos (13)
# %m: mes em 2 digitos (01)
# %y: ano em 2 digitos (82)
# %Y: ano em 4 digitos (1982)
# %A: dia da semana (Friday)
# %a: dia da semana abreviado (Fri)
# %B: mes (July)
# %b: mes abreviado (Jul)

data_formatada <- format(Sys.Date(), '(%A), %d %b %Y')
data_formatada


# formatando Hora
# %H: hora (00-23)
# %M: minuto
# %S: segundo
# %T: formado reduzido para %H:%M:%S

hora_formatada <- format(Sys.time(), '(%A), %d %b %Y - %Hh %Mmin %Ss')
hora_formatada

hora_apenas <- format(Sys.time(), '%Hh')
hora_apenas

dia_semana <- format(data1, '%A')
dia_semana

# transformar um char em data
data1 <- as.Date('2022-04-21')
data1
class(data1)

# transformando um char em data no padrao POSIXct
data_UTC <- "Nov 08, '87 hours:03, minutes:54, seconds:31"
data_UTC_convert <- as.POSIXct(data_UTC, format  = "%b %d, '%y hours:%H, minutes:%M, seconds:%S") 
data_UTC_convert

?as.POSIXct()
# operacoes com data
data2 <- data1+1
data2


# operacoes com tipos diferentes
data_UTC_convert
class(data_UTC_convert)

hoje
class(hoje)

hoje-data_UTC_convert #erro
hoje-as.Date(data_UTC_convert)

# operacoes entre tipo Data sao em dias
# operacoes entre tipo POSIXct sao em segundos

difftime(hoje, as.Date(data_UTC_convert), units = 'weeks')

# package que ajuda a facilitar manipulacao de datas e time

install.packages('lubridate')
require(lubridate)

ymd('20220613')
mdy('06/13/2022')
dmy('13-06-2022')


chegada <- ymd_hms('2022-06-14 14:02:34', tz='Pacific/Auckland')
chegada
saida <- ymd_hms('2022-06-13 21:24:11', tz='Pacific/Auckland')
saida

chegada-saida

# alterando valores especificos de uma data
second(chegada)<-00
chegada

minute(saida)<-21
saida

chegada-saida

# dia da semana de uma data especifica
?wday()
wday(data_UTC_convert, label = TRUE, abbr = FALSE)

?interval()
interval(chegada, saida)

# funcao time atual do package lubridate
?now()
now()
Sys.time()

# identificar o ano de uma data
year(data_UTC_convert)

# identificar a semana de uma data
week(now())


# analise de dados de data

# gerando um dataframe de datas
sono <- data.frame(bed.time = ymd_hms("2013-09-01 23:05:24",
                                      "2013-09-02 22:51:09",
                                      "2013-09-04 00:09:16",
                                      "2013-09-04 23:43:31",
                                      "2013-09-06 00:17:41",
                                      "2013-09-06 22:42:27",
                                      "2013-09-08 00:22:27"),
                   rise.time = ymd_hms("2013-09-02 08:03:29",
                                       "2013-09-03 07:34:21",
                                       "2013-09-04 07:45:06",
                                       "2013-09-05 07:07:17",
                                       "2013-09-06 08:17:13",
                                       "2013-09-07 06:52:11",
                                       "2013-09-08 07:15:19"),
                   sleep.time = dhours(
                     c(6.74, 7.92, 7.01, 6.23, 6.34, 7.42, 6.45))
                  )
?dhours()
dhours(1)
View(sono)

sono$eficiencia <- round(sono$sleep.time/(sono$rise.time - sono$bed.time) * 100, 1)
View(sono)


# gerando um plot a partir de datas
par(mar = c(5, 4, 4, 4))
plot(round_date(sono$rise.time, "day"),
     sono$eficiencia,
     type = "o",
     col = "blue",
     xlab = "Manha",
     ylab = NA)

par(new = TRUE)
plot(round_date(sono$rise.time, "day"),
     sono$sleep.time/3600,
     type = "o",
     col = "red",
     axes = FALSE,
     ylab = NA,
     xlab = NA)

axis(side = 4)
mtext(side = 4, line = 2.5, col = "red", "Duracao do Sono")
mtext(side = 2, line = 2.5, col = "blue", "Eficiencia do Sono")


