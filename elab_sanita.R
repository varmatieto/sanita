# sanita
library (ggplot2)

###################
AS<- read.table ("aziende sanitarie.csv" , header=T, sep=";",
                 stringsAsFactors=F)
str(AS)                                 # 29 aziende opedaliere
names(AS) # "id"         "codazienda" "denom"      "dataatt"   
head(AS)

##################
BS<- read.table ("Branche.csv" , header=T, sep=";",
                 stringsAsFactors=F)
str(BS)                                 # 59 branche
names(BS) <- c("id" ,"cbranca","bdescr")
names(BS)                   # "id"      "cbranca" "bdescr" 
head(BS)

###################
CP<- read.table ("Epres.csv" , header=T, 
                 sep=";", dec=",",   stringsAsFactors=F)
str(CP)                                 # 59 branche
CP$cpres<-as.factor(CP$cpres)
CP$cdiscip<-as.factor(CP$cdiscip)

names(CP)                   #  "cdiscip" "cpres"   "descr"  
head(CP)
str(CP)   


##########################
pres<- read.table ("Dettaglio_Cod_Prest.csv" , header=T, sep=";")


names(pres) <- c("id" ,"azienda", "tipo", "cbranca","cpres", "qta" )
pres$azienda<-as.factor(pres$azienda)
pres$cpres<-as.factor(pres$cpres)
pres$cbranca<-as.factor(pres$cbranca)

str(pres)                              # 295643 obs. of  6 variables
head(pres)                              # 295643 obs. of  6 variables


levels(pres$cbranca)
BS$bdescr[!BS$cbranca%in%levels(pres$cbranca)]



ggplot(data=pres, aes(azienda, fill = tipo)) + 
  geom_bar(show_guide = F) + 
  ggtitle("frequency of different products") 



