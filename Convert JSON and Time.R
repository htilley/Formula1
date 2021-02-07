library('jsonlite')
library('data.table')
library('plyr')
library('tidyverse')
library("lubridate")

myfiles = list.files()
myfiles1 <- str_remove(myfiles,'.json')

myfiles2 <- vector("list",15)

for (k in 1:15) {
  myfiles2[k] <- paste(myfiles1[k],'.csv',sep = '')
}

for (j in 1:15) {

e <- vector("list",20)

fromJSON(myfiles[j]) -> round

as.data.table(round) -> round

nrow(as.matrix(round)) -> no_driver
     
for (i in 1:no_driver) {
  
round$laps[i] -> a

a[[1]][["lap"]] -> lap

a[[1]][["time"]] -> time

as.data.frame(cbind(lap,time)) -> d

Number <- round$carNumber[i]

d %>%
  mutate(carNumber = Number) -> d

d %>%
  merge(round,by = 'carNumber') -> e[[i]]
}

bind_rows(e) -> f

f %>%
  select(-driver.type,-driver.uuid,-driver.picture,-laps) -> f

f %>%
  mutate(time = time/1000) -> f

f %>%
  mutate(time = seconds_to_period(time)) -> f

f %>%
  mutate(min = minute(time),
         sec = second(time)) %>%
  select(-time) -> f

f$time <- paste(f$min, f$sec, sep=":")

f %>%
  select(-sec,-min) -> f

write.csv(f,file = myfiles2[[j]])
}



