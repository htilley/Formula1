library('rvest')
library('stringr')
library('plyr')
library('tidyverse')

myfiles = list.files()
myfiles1 <- str_remove(myfiles,' _ Motorsport Stats.htm')

for (i in 1:17) {
myfiles2[i] <- paste(myfiles1[i],'.csv',sep = '')
}

convert <- function(a,b) {
  read_html(a) %>%
  html_table(header = TRUE,fill=TRUE) -> x
  
  y <- paste(b,'Finish Line Speed.csv',sep = ' ')
  write.csv(x[[2]],file = y)
  
  y <- paste(b,'Intermediate 1 Speed.csv',sep = ' ')
  write.csv(x[[3]],file = y)
  
  y <- paste(b,'Intermediate 2 Speed.csv',sep = ' ')
  write.csv(x[[4]],file = y)
  
  y <- paste(b,'Speed Trap.csv',sep = ' ')
  write.csv(x[[5]],file = y)
}
for (i in 1:17) {
  convert(myfiles[i],myfiles1[i])
}

convert1 <- function(a,b) {
read_html(a) %>%
  html_table(header = TRUE,fill=TRUE) -> x

y <- paste(b,'.csv',sep = '')
write.csv(x[[1]],file = y)}

for (i in 1:16) {
  convert1(myfiles[i],myfiles1[i])
}

z <- vector("list",16)

for (i in 1:17) {
read_html(myfiles[i]) %>%
  html_table(header = TRUE,fill=TRUE) -> z[i]
}


for (i in 0:14) {
write.csv(z[[i+1]][[1]],file = myfiles2[i+1])
}

             
                     
                     
                     