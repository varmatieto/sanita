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
BS<-BS[order(BS$cbranca),]
###################
CP<- read.table ("Epres.csv" , header=T, 
                 sep=";", dec=",",   stringsAsFactors=F)
str(CP)                                 # 2337 obs.
CP$cpres<-as.factor(CP$cpres)
CP$cdiscip<-as.factor(CP$cdiscip)

names(CP)                   #  "cdiscip" "cpres"   "descr"  
head(CP)
str(CP)
barplot(table(CP$cpres))

CP$descr[CP$cdiscip==1]

length(unique(CP$cpres))
##########################
pres<- read.table ("Dettaglio_Cod_Prest.csv" , header=T, sep=";",
                   stringsAsFactors=F)


names(pres) <- c("id" ,"azienda", "tipo", "cbranca","cpres", "qta" )
pres$azienda<-as.factor(pres$azienda)
pres$cpres<-as.factor(pres$cpres)
pres$cbranca<-as.factor(pres$cbranca)




str(pres)                              # 295643 obs. of  6 variables
head(pres)                              # 295643 obs. of  6 variables


levels(pres$cbranca)
branche_mancanti<-BS[!BS$cbranca%in%levels(pres$cbranca),2:3]

dim(branche_mancanti)


##################################################################
ggplot(data=pres, aes(azienda, fill = tipo)) + 
  geom_bar(show_guide = F) + 
  ggtitle("frequency of different products") 


##################################################
presuro<- pres[pres$cbranca==43,]
presuro$azienda<-as.factor(presuro$azienda)
presuro$cpres<-as.factor(presuro$cpres)
presuro$cbranca<-as.factor(presuro$cbranca)

str(presuro)

cpresuro<-unique(presuro$cpres)
table(presuro$cpres)

CP[CP$cpres%in%levels(cpresuro),])

CP$cpres[1:10]
ggplot(data=presuro, aes(azienda, fill = tipo)) + 
    geom_bar(show_guide = F) + 
    ggtitle("urologia in piemonte") 

