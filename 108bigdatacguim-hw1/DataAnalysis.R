library(jsonlite)
library(dplyr)
library(readr)
library(knitr)

X104edunew <- read_csv("C:/Users/chueh/OneDrive/桌面/104edunew.csv")
View(X104edunew)
X107edu <- read_csv("C:/Users/chueh/OneDrive/桌面/107edu.csv")
View(X107edu)

#1-1
X104edunew$大職業別<-NULL
X104edunew$大職業別<-X107edu$大職業別
salarytable<-
  inner_join(X104edunew,X107edu,by=c("大職業別"))
View(salarytable)
knitr::kable(salarytable)

salary_increase<-filter(salarytable,salarytable$`大學-薪資.y`>salarytable$`大學-薪資.x`)
View(salary_increase)
knitr::kable(salary_increase)

#1-2
salarytable$salary_increase_rate<-
  salarytable$`大學-薪資.y`/salarytable$`大學-薪資.x`
salary_increase_top10<-
  head(salarytable[order(salarytable$salary_increase_rate,decreasing = T),],10)
View(salary_increase_top10)
knitr::kable(salary_increase_top10)

#1-3
salary_increase_5percent<-filter(salarytable,salary_increase_rate>1.05)
View(salary_increase_5percent)  
salary_increase_5percent_kind<-
  table(sapply(strsplit(salary_increase_5percent$大職業別,"-"),"[",1))
View(salary_increase_5percent_kind)
knitr::kable(salary_increase_5percent_kind)


#2-1
boy_higher104<-filter(X104edunew,X104edunew$`大學-女/男`<100)
boy_higher107<-filter(X107edu,X107edu$`大學-女/男`<100)
View(boy_higher104)
knitr::kable(boy_higher104)
View(boy_higher107)
knitr::kable(boy_higher107)

#2-2
boy_higher104_diff<-boy_higher104[order(boy_higher104$`大學-女/男`),]
View(boy_higher104_diff)
knitr::kable(boy_higher104_diff)
boy_higher107_diff<-boy_higher107[order(boy_higher107$`大學-女/男`),]
View(boy_higher107_diff)
knitr::kable

boy_higher104_difference_top10<-head(boy_higher104_diff,10)
boy_higher107_difference_top10<-head(boy_higher107_diff,10)
View(boy_higher104_difference_top10)
knitr::kable(boy_higher104_difference_top10)
View(boy_higher107_difference_top10)
knitr::kable(boy_higher107_difference_top10)

#2-3
girl_higher104<-filter(X104edunew,X104edunew$`大學-女/男`>=100)
girl_higher107<-filter(X107edu,X107edu$`大學-女/男`>=100)
View(girl_higher104)
knitr::kable(girl_higher104)
View(girl_higher107)
knitr::kable(girl_higher107)

#2-4
girl_higher104_diff<-girl_higher104[order(girl_higher104$`大學-女/男`,decreasing = T),]
View(girl_higher104_diff)
knitr::kable(girl_higher104_diff)
girl_higher107_diff<-girl_higher107[order(girl_higher107$`大學-女/男`,decreasing = T),]
View(girl_higher107_diff)
knitr::kable(girl_higher107_diff)

girl_higher104_difference_top10<-head(girl_higher104_diff,10)
girl_higher107_difference_top10<-head(girl_higher107_diff,10)
View(girl_higher104_difference_top10)
knitr::kable(girl_higher104_difference_top10)
View(girl_higher107_difference_top10)
knitr::kable(girl_higher107_difference_top10)

#3-1
X107edu$`研究所-薪資`<-as.numeric(X107edu$`研究所-薪資`)
X107edu$`大學-薪資`<-as.numeric(X107edu$`大學-薪資`)

X107edu$`研究所-薪資/大學-薪資`<-X107edu$`研究所-薪資`/X107edu$`大學-薪資`
s107_gra_higher<-filter(X107edu,`研究所-薪資/大學-薪資`>1)
View(s107_gra_higher)
knitr::kable(s107_gra_higher)

#3-2
s107_gra_higher_top10<-
  head(s107_gra_higher[order(s107_gra_higher$`研究所-薪資/大學-薪資`,decreasing = T),],10)
View(s107_gra_higher_top10)
knitr::kable(s107_gra_higher_top10)

#4-1
mylike<-X107edu[grep("藝術_娛樂及休閒服務業-專業人員|工業-專業人員",X107edu$大職業別),]
selectlikemin<-
  select(mylike,大職業別,`大學-薪資`,`研究所-薪資`)
View(selectlikemin)
knitr::kable(selectlikemin)

selectlikemin$"研究所薪資與大學薪資差"<-
  selectlikemin$`研究所-薪資`-selectlikemin$`大學-薪資`
View(selectlikemin)
knitr::kable(selectlikemin)
