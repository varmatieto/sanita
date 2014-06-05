Prestazioni sanitarie in Regione Piemonte
----------------------------

### Fonte

Sul sito dedicati agli [Opendata] (http://www.dati.piemonte.it)  sono stai pubblicati le [Prestazioni sanitarie erogate per tipologia di prestazione] (http://www.dati.piemonte.it/catalogodati/dato/100742-prestazioni-sanitarie-erogate-per-tipologia-di-prestazione.html ).


Nel dataset sono riportati i volumi di **prestazioni sanitarie**, intesi come quantità di prestazioni erogate per azienda sanitaria, con l'evidenza della tipologia di struttura erogatrice ( pubblica o privata
), del codice di prestazione e della relativa branca specialistica, nell'anno 2012 a livello regionale. 

Insieme al database delle prestazioni sono disponibili alcuni datset  di supporto che riguardano:

- il Catalogo delle prestazioni sanitarie,

- l'elenco delle Aziende Sanitarie.


Il Catalogo delle **prestazioni specialistiche sanitarie** si riferisce come da descrizione all': *elenco delle prestazioni erogate dalla Regione Piemonte ai sensi della DGR 11-6036 del 02 luglio 2013, effettuate a livello ambulatoriale e non ambulatoriale o riferite a particolari attivita'  svolte in attuazione di funzioni specificatamente attribuite, erogabili nell' ambito del servizio sanitario regionale .* 

Il dato è presentato su 2 tabelle: 

- elenco delle Prestazioni ed

- elenco delle Branche ( o Discipline).

Quest'ultimo utile per la decodifica del codice "disciplina" dell'elenco delle prestazioni. 

Nell'elenco delle **Aziende Sanitarie** per ogni azienda sono indicati il codice azienda, la denominazione e la data di attivazione.




### Caratteristiche dei databases

#### Prestazioni sanitarie

Il database *Prestazioni Sanitarie*, contiene 295643 osservazioni su  5 variabili.

Ciascuna osservazione riporta:

- il codice azienda sanitaria, 

- il codice prestazione, 

- la relativa branca, 

- l'indicazione pubblico o privato,

- la quantità di prestazioni erogate.


Al fine di poter interpretare i codici presenti nel database e' necessario usare le informazioni relative ai tre dataset di corredo.

La descrizione relativa al *codice azienda sanitaria* e' sul dataset Aziende Sanitarie. Qui sono riportate

- il codice azienda

- la descrizione azienda

- la data di attivazione dell'azienda.

#### Aziende sanitarie

Per le 29 aziende questo e' un esempio delle informazioni riportate:


```
##   codazienda denom    dataatt
## 1        201   TO1 01/01/2008
## 2        202   TO2 01/01/2008
## 3        203   TO3 01/01/2008
## 4        204   TO4 01/01/2008
## 5        205   TO5 01/01/2008
```

#### Branca o Disciplina

La descrizione relativa alla *Branca o Disciplina* e' sul dataset Branche. Qui sono riportate

- il codice branca

- la descrizione branca

Per le 79 branche questo e' un esempio delle informazioni riportate:


```
##   id cbranca                            bdescr
## 1  1       1                      ALLERGOLOGIA
## 2  2       2 DAY HOSPITAL (MULTISPECIALISTICO)
## 3  3       3   ANATOMIA E ISTOLOGIA PATOLOGICA
## 4  4       5                        ANGIOLOGIA
## 5  5       6         CARDIOCHIRURGIA INFANTILE
## 6  6       7                   CARDIOCHIRURGIA
```

La descrizione relativa alla *Prestazione* e' sul dataset Prestazioni. Qui sono riportate

- il codice disciplina

- il codice prestazione

- la descrizione prestazione

I dataset originario non e' caricabile direttamente come gli altri a causa di caratteri speciali nel testo.

Si e' dovuto sostituire in caratteri (",", "#", ".") con il carattere " ".

Per le 2337 branche questo e' un esempio delle informazioni riportate:


```
##   cdiscip  cprest
## 1       1   89_01
## 2       1   89_07
## 3       1   89_12
## 4       1 89_12_A
## 5       1 89_37_1
## 6       1 89_37_4
```

Ci sono 43 codici disciplina in questo dataset. Nel dataset *Branca o Disciplina* ci sono 79 codici disciplina. Questo significa che 36 discipline non sono presenti. Segue l'elenco di queste discipline.


```
##  [1] "DAY HOSPITAL (MULTISPECIALISTICO)"          
##  [2] "ANATOMIA E ISTOLOGIA PATOLOGICA"            
##  [3] "CARDIOCHIRURGIA INFANTILE"                  
##  [4] "CHIRURGIA PEDIATRICA"                       
##  [5] "MEDICINA SPORTIVA"                          
##  [6] "MEDICINA DEL LAVORO"                        
##  [7] "MEDICINA LEGALE"                            
##  [8] "UNITA  SPINALE"                             
##  [9] "NIDO"                                       
## [10] "MEDICINA TERMALE"                           
## [11] "TOSSICOLOGIA"                               
## [12] "GRANDI USTIONI PEDIATRICHE"                 
## [13] "GRANDI USTIONATI"                           
## [14] "NEFROLOGIA (ABILITATO AL TRAPIANTO DI RENE)"
## [15] "TERAPIA INTENSIVA"                          
## [16] "UNITA  CORONARICA"                          
## [17] "ASTANTERIA"                                 
## [18] "EMODIALISI"                                 
## [19] "FARMACOLOGIA CLINICA"                       
## [20] "FISIOPATOLOGIA DELLA RIPRODUZIONE UMANA"    
## [21] "LUNGODEGENTI"                               
## [22] "NEONATOLOGIA"                               
## [23] "ONCOEMATOLOGIA PEDIATRICA"                  
## [24] "ONCOEMATOLOGIA"                             
## [25] "PENSIONANTI"                                
## [26] "TERAPIA INTENSIVA NEONATALE"                
## [27] "RADIOTERAPIA ONCOLOGICA"                    
## [28] "NEURORIABILITAZIONE"                        
## [29] "NEUROCHIRURGIA PEDIATRICA"                  
## [30] "NEFROLOGIA PEDIATRICA"                      
## [31] "UROLOGIA PEDIATRICA"                        
## [32] "DETENUTI"                                   
## [33] "DIABETOLOGIA"                               
## [34] "RESIDUALE MANICOMIALE"                      
## [35] "DISCIPLINA ATTIVITA SERT"                   
## [36] "WEEK SURGERY"
```





Ci sono poi prestazioni che compaiono su varie specialità.
Ad esempio la prestazione 81.92, che corrisponde a INIEZIONE DI SOSTANZE TERAPEUTICHE NELL ARTICOLAZIONE O NEL LEGAMENTO è presente in quattro discipline.


```
## [1] "ORTOPEDIA E TRAUMATOLOGIA"           
## [2] "RECUPERO E RIABILITAZIONE FUNZIONALE"
## [3] "ONCOLOGIA"                           
## [4] "REUMATOLOGIA"
```


