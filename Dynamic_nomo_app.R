############## DYNAMIC NOMOGRAM ###############
## set data
rm(list=ls())
getwd()
setwd("xxxxxxx")
## library
library(data.table)
library(rio)
library(epicalc)
Df <- setDT(import("train_data.csv"))

#########################################
################ NOMOGRAM ###############
library(DynNom)
library(rms)
## cox model 
ddist <- datadist(Df)
options(datadist='ddist')

    
fit1<- cph(Surv(Dtime,Death) ~  Age_gr+ KPS_gr+ Hemoculture+ Coagulopathy+ NLR_gr+ Occipital,Df, surv=TRUE)
fit1
summary(fit1)

DynNom(fit1, Df,DNxlab = "Survival probability")
   
###############################################################################    
