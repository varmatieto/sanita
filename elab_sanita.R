# sanita
library (ggplot2)

###################
AS<- read.table ("data/aziende sanitarie.csv" , header=T, sep=";",
                 stringsAsFactors=F)
str(AS)                                 # 29 aziende opedaliere
names(AS) # "id"         "codazienda" "denom"      "dataatt"   
head(AS)

##################
BS<- read.table ("data/Branche.csv" , header=T, sep=";",
                 stringsAsFactors=F)
str(BS)                                 # 79 branche
names(BS) <- c("id" ,"cbranca","bdescr")
names(BS)                   # "id"      "cbranca" "bdescr" 
head(BS)
BS<-BS[order(BS$cbranca),]
###################
CP<- read.table ("data/Epres.csv" , header=T, 
                 sep=";", dec=",",   stringsAsFactors=F)
str(CP)                                 # 2337 obs.
CP$cpres<-as.factor(CP$cpres)
CP$cdiscip<-as.factor(CP$cdiscip)

names(CP)                   #  "cdiscip" "cpres"   "descr"  
head(CP)
str(CP)
barplot(table(CP$cdiscip))

prest_uro<-CP[CP$cdiscip==43,]           # discipline 43 branche 79 che rapporto???

length(unique(CP$cpres))       # perche' data set 2337 e prestazioni 2053 ???


## ci sono prestazioni su piu' discipline 
tt<-table(CP$cpres)
str(tt)
tt<-tt[order(tt, decreasing = T)]
ttt<-tt[tt>1]

tttx<-sapply (names(ttt), function(x)  unique(CP$descr[CP$cpres==x]))
str(tttx)
double_pres<-cbind(names(ttt),ttt, tttx)
colnames(double_pres)<-c("prest", "n_occ", "descr")
str(double_pres)
double_pres<-as.data.frame(double_pres,stringsAsFactors=F)

write.table(double_pres, "data/double_prestazioni.txt", 
            col.names=T, row.names=F)

CPx<-CP[CP$cpres=="89.03",]
str(CPx)

ggplot(data=CPx, aes(x=cdiscip, y=cpres)) + 
    geom_bar(stat="bin") + 
    ggtitle("frequency of different prestazioni") 


##########################
pres<- read.table ("Dettaglio_Cod_Prest.csv" , header=T, sep=";",
                   stringsAsFactors=F)


names(pres) <- c("id" ,"azienda", "tipo", "cbranca","cpres", "qta" )
pres$azienda<-as.factor(pres$azienda)
pres$cpres<-as.factor(pres$cpres)
pres$cbranca<-as.factor(pres$cbranca)




str(pres)                              # 295643 obs. of  6 variables
head(pres)                          


levels(pres$cbranca)
branche_mancanti<-BS[!BS$cbranca%in%levels(pres$cbranca),2:3]
discipline_mancanti<-levels(CP$cdiscip)[!mycdis%in%levels(pres$cbranca)]


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

#####################################################################
grep("vehicle", SCC$Short.Name, ignore.case=TRUE) & SCC$Data.Category == 'Onroad')
losAngeles <- subset(NEI, fips == '06037' & type == 'ON-ROAD')
laMotorVehicle <- subset(losAngeles, SCC %in% motorVehicleSCC$SCC)
laMotorVehicleYearlyEmissions <- aggregate(Emissions ~ year, data = laMotorVehicle, sum)
