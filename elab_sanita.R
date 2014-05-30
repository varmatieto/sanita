# sanita
library (ggplot2)

###################
AS<- read.table ("data/aziende sanitarie.csv" , header=T, sep=";",
                 stringsAsFactors=F)
str(AS)                                 # 29 aziende opedaliere
names(AS) # "id"         "codazienda" "denom"      "dataatt"   

AS$dataatt <- as.Date(AS$dataatt, "%d/%m/%Y")

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


ddiscip<-sapply (CP$cdiscip, function(x) BS$bdescr[BS$cbranca==x]) 
str(ddiscip) 
  
CP<-cbind (CP, ddiscip) 
head (CP)

CP$cprest<-as.factor(CP$cprest)
CP$cdiscip<-as.factor(CP$cdiscip)
CP$dprest<-as.factor(CP$dprest)

mean(duplicated(levels((CP$cdiscip))))    # nessun duplicato

  
names(CP)                   #  "cdiscip" "cprest"   "ddescr"  "ddiscip"
head(CP)
str(CP)

barplot(table(CP$ddiscip))

###############################################################
ggplot(data=CP, aes(x=ddiscip, fill="gold")) + 
  geom_bar(stat="bin",show_guide = F) + coord_flip() + 
  ggtitle("frequency of different prestazioni") 

#  theme(axis.text.x  = element_text(angle=45, vjust=0.5, size=8))


# prest_uro<-CP[CP$cdiscip==43,]           # discipline 43 branche 79 che rapporto???

length(unique(CP$cpres))       # perche' data set 2337 e prestazioni 2053 ???


## ci sono prestazioni su piu' discipline 

CPz<- read.table ("data/Epres.csv" , header=T, 
                 sep=";", dec=",",   stringsAsFactors=F)
str(CPz)                                 # 2337 obs.
mycdiscip<-unique (CPz$cdiscip)

myddiscip<-sapply( mycdiscip, function(x) BS$bdescr[BS$cbranca==x])

mydiscip<-cbind(mycdiscip,myddiscip)

write.table(mydiscip, "data/mydiscip.txt", 
            col.names=T, row.names=F)

str(BS)
BS<-BS[order(BS$cbranca),]

BS$cbranca %in% mycdiscip

entrambe<-rep(c("no"),79)

entrambe[BS$cbranca %in% mycdiscip]<-c("si")

BSz<-cbind(branca=BS[,2], entrambe, descrizione=BS[,3] )
BSz

write.table(BSz, "data/branca_disciplina.txt", 
            col.names=T, row.names=F)


# CPz$dprest[CPz$cprest=="06.11.2"]
 
tt<-table(CPz$cprest)
str(tt)
# tt<-tt[order(tt, decreasing = T)]
ttt<-tt[tt>2]
dim(ttt)

tttx<-sapply (names(ttt), function(x)  unique (CPz$dprest[CPz$cprest==x]))
str(tttx)

double_pres<-cbind(names(ttt),ttt, tttx)
colnames(double_pres)<-c("prest", "n_occ", "descr")
str(double_pres)
head(double_pres)
dim(double_pres)

double_pres<-as.data.frame(double_pres,stringsAsFactors=F)
double_pres$n_occ<-as.numeric(double_pres$n_occ)
double_pres<-double_pres[order(double_pres$n_occ, decreasing = T),]

write.table(double_pres, "data/double_prestazioni.txt", 
            col.names=T, row.names=F)

ttt_list<-sapply (names(ttt), function(x)  CPz$cdiscip[CPz$cprest==x])
str(ttt_list)

cdiscipu<-unique(CPz$cdiscip)

which(cdiscipu==9)

mtx_double<- matrix(0,34,43)
colnames(mtx_double) <- cdiscipu
rownames(mtx_double) <- names(ttt)
mtx_double

for (r in 1: length(ttt_list))
{
  for(c in 1:length(ttt_list[[r]]) )
  {
    z<-which(cdiscipu ==  ttt_list[[r]][c])
    mtx_double[ r,z ]<-1  
    
  }
  
}

write.table(mtx_double, "data/mtx_double.txt", 
            col.names=T, row.names=T)



ggplot(data=double_pres, aes(x=cdiscip, y=cprest)) + 
    geom_bar(stat="bin") + 
    ggtitle("frequency of different prestazioni") 


##########################
pres<- read.table ("data/Dettaglio_Cod_Prest.csv" , header=T, sep=";",
                   stringsAsFactors=F)


names(pres) <- c("id" ,"azienda", "tipo", "cbranca","cpres", "qta" )
pres$azienda<-as.factor(pres$azienda)
pres$cpres<-as.factor(pres$cpres)
pres$cbranca<-as.factor(pres$cbranca)




str(pres)                              # 295643 obs. of  6 variables
head(pres)                          
pres<-pres[order(pres$tipo),]
##################################################################
ggplot(data=pres, aes(factor(azienda), fill = tipo)) + 
  geom_bar(show_guide = F) + 
  ggtitle("n.osservazioni per azienda") 

ggplot(data=pres, aes(x=factor(azienda), y=qta/1e+06, fill = tipo)) + 
  geom_bar(stat="identity", show_guide = F) + 
  ggtitle("prestazioni per azienda")+ 
  xlab("Azienda") + ylab("prestazioni in Ml.") 

aziende<-read.table("data/aziende.txt", head=T,
                    stringsAsFactors=F)
str(aziende)

library (plyr)

prestot<-ddply(pres, .(azienda,tipo,cbranca), summarise,
              qta= sum(qta))
str(prestot)
head(prestot)

nomeazienda<-vector (length=919)
str(nomeazienda)
prestoto<-cbind(prestot, nomeazienda) 
str(prestoto)
for(i in 1:919)
{
  prestoto$nomeazienda[i]<-aziende$dazienda[aziende$cazienda==prestoto$azienda[i]]
}

unique(prestoto$azienda)[!unique(prestoto$azienda)%in%aziende$cazienda]

head(prestoto)


ggplot(data=prestoto, aes(x=factor(nomeazienda), y=qta/1e+06, fill = tipo)) + 
  geom_bar(stat="identity", show_guide = F) + coord_flip() +  
  ggtitle("prestazioni per azienda")+ 
  xlab("Azienda") + ylab("prestazioni in Ml.") 
ggsave("plot/aziende.png", width=8, height=8, dpi=100)


+
theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=8))


prestoto_no98 <- subset(prestoto, cbranca != 98)
prestoto_no98 <- prestoto_no98[order(prestoto_no98$tipo),]

ggplot(data=prestoto_no98, aes(x=factor(cbranca), y=qta/1e+06, fill = tipo)) + 
  geom_bar(stat="identity") + coord_flip() +  
  ggtitle("prestazioni per branca")+ 
  xlab("cod_prestazione") + ylab("n. prestazioni ") 
ggsave("plot/prestazioni.png", width=8, height=8, dpi=100)




###############################################################

prestoto_43 <- subset(prestoto, cbranca == 43)

ggplot(data=prestoto_43, aes(x=factor(nomeazienda), y=qta, fill = tipo)) + 
  geom_bar(stat="identity", show_guide = F) + coord_flip() +  
  ggtitle("prestazioni urologia per azienda")+ 
  xlab("Azienda") + ylab("n. prestazioni ") 
ggsave("plot/urologia.png", width=8, height=8, dpi=100)

prestoto_64 <- subset(prestoto, cbranca == 64)

ggplot(data=prestoto_64, aes(x=factor(nomeazienda), y=qta, fill = tipo)) + 
  geom_bar(stat="identity") + coord_flip() +  
  ggtitle("prestazioni oncologia per azienda")+ 
  xlab("Azienda") + ylab("n. prestazioni ") 
ggsave("plot/oncologia.png", width=8, height=8, dpi=100)


prestoto_29 <- subset(prestoto, cbranca == 29)

ggplot(data=prestoto_29, aes(x=factor(nomeazienda), y=qta, fill = tipo)) + 
  geom_bar(stat="identity") + coord_flip() +  
  ggtitle("prestazioni nefrologia per azienda")+ 
  xlab("Azienda") + ylab("n. prestazioni ") 
ggsave("plot/nefrologia.png", width=8, height=8, dpi=100)

prestoto_56 <- subset(prestoto, cbranca == 56)

ggplot(data=prestoto_56, aes(x=factor(nomeazienda), y=qta, fill = tipo)) + 
  geom_bar(stat="identity") + coord_flip() +  
  ggtitle("prestazioni recupero funzionale per azienda")+ 
  xlab("Azienda") + ylab("n. prestazioni ") 
ggsave("plot/recupero.png", width=8, height=8, dpi=100)

, show_guide = F
##################################################


pres<- read.table ("Dettaglio_Cod_Prest.csv" , header=T, sep=";",
                   stringsAsFactors=F)
names(pres) <- c("id" ,"azienda", "tipo", "cbranca","cpres", "qta" )

presuro<- pres[pres$cbranca==43,]

###################################
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
