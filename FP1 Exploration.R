library('tidyverse')

read_csv('FP1/2020 Formula One 70th Anniversary Grand Prix.csv') -> fp1

read_csv('Summary/FP1/2020 Formula One 70th Anniversary Grand Prix.csv') -> fp1_s

str_replace_na(fp1_s$Gap,replacement = '0') -> fp1_s$Gap

str_replace(string = fp1_s$Gap,pattern = "[^[:alnum:]]" ,replacement = '') -> fp1_s$Gap

str_trim(string = fp1_s$Gap) -> fp1_s$Gap

as.numeric(fp1_s$Gap) -> fp1_s$Gap

ggplot(fp1_s,aes(y=Gap,x=Pos,col=Team)) + geom_point()
