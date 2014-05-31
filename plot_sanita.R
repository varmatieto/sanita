# archivio sintetico sanita 2012

pres<- read.table ("data/Dettaglio_Cod_Prest.csv" , header=T, sep=";",
                   stringsAsFactors=F)


names(pres) <- c("id" ,"azienda", "tipo", "cbranca","cpres", "qta" )

str(pres)                              # 295643 obs. of  6 variables
head(pres)                          
pres<-pres[order(pres$tipo),]
sum (pres$qta)
sum (pres$qta[pres$cbranca == 98])

length(unique(pres$azienda))
length(unique(pres$cbranca))

aziende<-read.table("data/aziende.txt", head=T,
                    stringsAsFactors=F)


library (plyr)

prestot<-ddply(pres, .(azienda,tipo,cbranca), summarise,               qta= sum(qta))
str(prestot)
head(prestot)

nomeazienda<-vector (length=919)
str(nomeazienda)
preototo<-cbind(prestot, nomeazienda) 
str(preototo)
for(i in 1:919)
{
  preototo$nomeazienda[i]<-aziende$dazienda[aziende$cazienda==preototo$azienda[i]]
}

unique(preototo$azienda)[!unique(preototo$azienda)%in%aziende$cazienda]

head(preototo)
str(preototo)

write.table(preototo, "data/prestoto.txt", 
            col.names=T, row.names=F)

##################################################################

prestoto<- read.table ("data/prestoto.txt" , header=T, sep=" ",
                   stringsAsFactors=F)

head(prestoto)
str(prestoto)

library (ggplot2)

ggplot(data=prestoto, aes(x=factor(nomeazienda), y=qta/1e+06, fill = tipo)) + 
  geom_bar(stat="identity") + coord_flip() +  
  ggtitle("totale prestazioni 2012 per azienda")+ 
  xlab("Azienda") + ylab("n. prestazioni in Ml.")

ggsave("plot/aziende.png", width=8, height=8, dpi=100)


# theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=8))

prestoto_a213 <- subset(prestoto, azienda == 213 & cbranca != 98)
str(prestoto_a213)

prestoto_a213 <- prestoto_a213[order(prestoto_a213$tipo),]

ggplot(data=prestoto_a213, aes(x=factor(cbranca), y=qta/1e+06, fill = tipo)) + 
  geom_bar(stat="identity") + coord_flip() +  
  ggtitle("totale prestazioni 2012 per AL")+ 
  xlab("cod_prestazione") + ylab("n. prestazioni ") 

ggsave("plot/prestazioniAL.png", width=8, height=8, dpi=100)

prestoto_a201 <- subset(prestoto, azienda == 201 & cbranca != 98)
str(prestoto_a201)

prestoto_a201 <- prestoto_a201[order(prestoto_a201$tipo),]

ggplot(data=prestoto_a201, aes(x=factor(cbranca), y=qta/1e+06, fill = tipo)) + 
  geom_bar(stat="identity") + coord_flip() +  
  ggtitle("totale prestazioni 2012 per TO01")+ 
  xlab("cod_prestazione") + ylab("n. prestazioni ") 

ggsave("plot/prestazioniTO01.png", width=8, height=8, dpi=100)

prestoto_no98 <- subset(prestoto, cbranca != 98)


prestoto_no98 <- prestoto_no98[order(prestoto_no98$tipo),]

ggplot(data=prestoto_no98, aes(x=factor(cbranca), y=qta/1e+06, fill = tipo)) + 
  geom_bar(stat="identity") + coord_flip() +  
  ggtitle("totale prestazioni 2012 per branca")+ 
  xlab("cod_prestazione") + ylab("n. prestazioni ") 

ggsave("plot/prestazioni.png", width=8, height=8, dpi=100)




###############################################################

prestoto_43 <- subset(prestoto, cbranca == 43)

ggplot(data=prestoto_43, aes(x=factor(nomeazienda), y=qta, fill = tipo)) + 
  geom_bar(stat="identity") + coord_flip() +  
  ggtitle("prestazioni urologia (43) per azienda")+ 
  xlab("Azienda") + ylab("n. prestazioni ") 
ggsave("plot/urologia.png", width=8, height=8, dpi=100)

prestoto_64 <- subset(prestoto, cbranca == 64)

ggplot(data=prestoto_64, aes(x=factor(nomeazienda), y=qta, fill = tipo)) + 
  geom_bar(stat="identity", fill="#0099CC" ) + coord_flip() +  
  ggtitle("prestazioni oncologia (64) per azienda")+ 
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
  ggtitle("prestazioni recupero funzionale (56) per azienda")+ 
  xlab("Azienda") + ylab("n. prestazioni ")

ggsave("plot/recupero.png", width=8, height=8, dpi=100)

prestoto_98 <- subset(prestoto, cbranca == 98)

ggplot(data=prestoto_98, aes(x=factor(nomeazienda), y=qta/1000000, fill = tipo)) + 
  geom_bar(stat="identity") + coord_flip() +  
  ggtitle("analisi di laboratorio (98) per azienda")+ 
  xlab("Azienda") + ylab("n. prestazioni  in Ml.")

ggsave("plot/analisi.png", width=8, height=8, dpi=100)


pres_89.7 <- subset(pres, cpres == "89.7")
sum (pres_89.7$qta)

str(pres_89.7)

ggplot(data=pres_89.7, aes(x=factor(azienda), y=qta/1000000, fill = tipo)) + 
  geom_bar(stat="identity") + coord_flip() +  
  ggtitle("visita generale (89.7) per azienda")+ 
  xlab("Azienda") + ylab("n. prestazioni in Ml.") +
  scale_x_discrete(breaks=aziende$cazienda, 
                   labels=aziende$dazienda)

ggsave("plot/visita_gen.png", width=8, height=8, dpi=100)


##############################################
str(aziende)
myaz<-aziende$cazienda


str(pres)

pres_pu <- subset(pres, tipo == "Pub")
str (pres_pu)
qtaaz<-sapply (myaz, function(x) sum (pres$qta[pres$azienda == x]))
qtaazvg<-sapply (myaz,function(x) sum (pres_pu$qta[pres_pu$azienda ==  x &
              pres_pu$cpres == "89.7"]))
per_vg<- round(100*qtaazvg/qtaaz,1)
per_vg [is.na(per_vg)]<-0

summary(per_vg)

pres_pr <- subset(pres, tipo == "Priv")
str (pres_pr)
qtaazr<-sapply (myaz, function(x) sum (pres$qta[pres$azienda == x]))
qtaazvgr<-sapply (myaz,function(x) sum (pres_pr$qta[pres_pr$azienda ==  x &
                                                     pres_pr$cpres == "89.7"]))
per_vgr<- round(100*qtaazvgr/qtaazr,1)
per_vgr [is.na(per_vgr)]<-0

summary(per_vgr)

aziendevgu<-cbind(aziende, per_visite=per_vg, tipo= c("Pub") )
aziendevgr<-cbind(aziende, per_visite=per_vgr, tipo= c("Pri") )
 
aziendevg<-rbind (aziendevgu, aziendevgr)
head (aziendevg)

ggplot(data=aziendevg, aes(x=dazienda, y=per_visite, fill=tipo)) + 
  geom_bar(stat="identity" ) + coord_flip() +  
  ggtitle("% visite su totale prestazioni")+ 
  xlab("Azienda") + ylab(" ") 

ggsave("plot/per_visita_gen.png", width=8, height=8, dpi=100)



