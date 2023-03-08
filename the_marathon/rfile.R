install.packages('data.table')
library(data.table)
library(tidyverse)

df1 <- fread("Tables/CDM_SOURCE.csv")[, lapply(.SD, FUN=function(x) gsub("^$|^ $", NA, x))]
df2 <- fread("Tables/EVENTS.csv")[, lapply(.SD, FUN=function(x) gsub("^$|^ $", NA, x))]
df3 <- fread("Tables/INSTANCE.csv", fill = T)[, lapply(.SD, FUN=function(x) gsub("^$|^ $", NA, x))]
df4 <- fread("Tables/METADATA.csv")[, lapply(.SD, FUN=function(x) gsub("^$|^ $", NA, x))]
df5<- fread("Tables/OBSERVATION_PERIODS.csv")[, lapply(.SD, FUN=function(x) gsub("^$|^ $", NA, x))]
df6 <- fread("Tables/PERSONS.csv")[, lapply(.SD, FUN=function(x) gsub("^$|^ $", NA, x))]

#####################################

