library(DBI)
library(RMySQL)
library(ggplot2)
library(dplyr)

db_data <- read.csv(file = "crypt_mysql_data.csv" )

conect_DB = dbConnect(MySQL(), user = db_data$user, password = db_data$password, dbname = db_data$dbname, host = db_data$host)
dir()

