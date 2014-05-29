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
str(BS)                                 # 79 branche
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

CP$descr[CP$cdiscip==1]           # discipline 43 branche 79 che rapporto???

length(unique(CP$cpres))       # perche' data set 2337 e prestazioni 2053???

tt<-table(CP$cpres)
str(tt)
tt<-tt[order(tt, decreasing = T)]
ttt<-tt[tt>3]


CP[CP$cpres=="89.03",]

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
pres<- read.table ("Dettaglio_Cod_Prest.csv" , header=T, sep=";",
                   stringsAsFactors=F)
names(pres) <- c("id" ,"azienda", "tipo", "cbranca","cpres", "qta" )

presuro<- pres[pres$cbranca==43,]
presuro$azienda<-as.factor(presuro$azienda)
presuro$tipo<-as.factor(presuro$tipo)
presuro$cpres<-as.factor(presuro$cpres)
presuro$cbranca<-as.factor(presuro$cbranca)

str(presuro)
summary(presuro)

table(presuro$cpres)
cpresuro<-levels(presuro$cpres)

dim(CP[CP$cpres%in%cpresuro,])

presuro_x<-presuro[presuro$cpres=="89.7",]
str(presuro_x)
summary(presuro_x)

presuro_x<-presuro_x[order(presuro_x$azienda,presuro_x$tipo),]
head(presuro_x)


ggplot(data=presuro_x, aes(azienda, fill = tipo)) + 
    geom_bar(show_guide = F) + 
    ggtitle("urologia in piemonte") 

ggplot(data=presuro_x, aes(y=qta, x=azienda, fill = tipo)) + 
    geom_bar(stat="identity",show_guide = F) + 
    ggtitle("urologia in piemonte") 
