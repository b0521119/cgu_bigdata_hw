library(jsonlite)
library(dplyr)
library(readr)
library(knitr)

outsidestudent105 <- read_csv("C:/Users/chueh/OneDrive/桌面/105_ab105_C.csv")
View(outsidestudent105)
outsidestudent106 <- read_csv("C:/Users/chueh/OneDrive/桌面/106_ab106_C.csv")
View(outsidestudent106)
outsidestudent107<- read_csv("C:/Users/chueh/OneDrive/桌面/107_ab107_C.csv")
View(outsidestudent107)

schoolstu105 <- read_csv("C:/Users/chueh/OneDrive/桌面/105_ab105_S.csv")
View(schoolstu105)
schoolstu106 <- read_csv("C:/Users/chueh/OneDrive/桌面/106_ab106_S.csv")
View(schoolstu106)
schoolstu107 <- read_csv("C:/Users/chueh/OneDrive/桌面/107_ab107_S.csv")
View(schoolstu107)

#1



#
studyabroad <- read_csv("C:/Users/chueh/OneDrive/桌面/studyabroad.csv")
View(studyabroad)
