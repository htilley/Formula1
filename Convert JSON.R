myfiles = list.files()
myfiles1 <- str_remove(myfiles,'.json')

myfiles2 <- vector("list",17)

for (k in 1:17) {
  myfiles2[k] <- paste(myfiles1[k],'.csv',sep = '')
}

for (j in 1:17) {

jsonlite::fromJSON(myfiles[j]) -> round

as.data.table(round) -> round

round[,.(cars = unlist(cars)), by = setdiff(names(round), 'cars')] -> round

max(round$lap) -> laptotal

round%>%
  filter(lap == 0) -> round1

round1 %>%
  mutate(Position = 1:nrow(round1)) -> x

for (i in 1:laptotal) {
round %>%
  filter(lap == i) -> round2
 if (nrow(as.matrix(round2) > 0))
round2 %>%
  mutate(Position = 1:nrow(round2)) -> round2
rbind(x,round2) -> x
  }
write.csv(x,file = myfiles2[[j]])
}
