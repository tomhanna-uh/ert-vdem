options(scipen = 999)
library(here)
library(ggplot2)
library(stargazer)
library(coefplot)

#read in ERT

library(readr)
ert <- read_csv(here("data","ERT.csv"))
View(ert)

#read in ERT using package

library(ERT)
ert2 <- get_eps()
View(ert2)

###Read in revisionist ideology data (extracted from VDEM and
#Colgan's Revolutionary Leaders Dataset)

VDemSub <- read_csv(here("data","VDemSub.csv"))
View(VDemSub)

summary(ert$year)
summary(VDemSub$year)

VDemSub <- VDemSub[which (VDemSub$year >= 1900), ]

MergedData1 <- merge(ert,VDemSub, by = c("country_name","year"))

write.csv(MergedData1, file = here("data","VDem-ERT.csv"))

revisionist <- read.csv(here("data","revisionist-ideology.csv"))
View(revisionist)

merged2 <- merge(ert,revisionist, by = c("country_name","year"))

write.csv(merged2,file = here("data","VDem-ERT-RDS.csv"))