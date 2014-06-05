Prestazioni sanitarie in Regione Piemonte
----------------------------

### Fonte

Sul sito dedicati agli [Opendata] (http://www.dati.piemonte.it)  sono stai pubblicati le [Prestazioni sanitarie erogate per tipologia di prestazione] (http://www.dati.piemonte.it/catalogodati/dato/100742-prestazioni-sanitarie-erogate-per-tipologia-di-prestazione.html ).

Il database *Prestazioni Sanitarie*, contiene 295643 osservazioni su  5 variabili.

Ciascuna osservazione riporta:

- il codice azienda sanitaria, 

- il codice prestazione, 

- la relativa branca, 

- l'indicazione pubblico o privato,

- la quantità di prestazioni erogate.

Le prime osservazioni del database risultano:


```
##   id azienda tipo cbranca   cpres  qta
## 1  1     202 Priv      69   88.27  520
## 2  2     201 Priv      98 90.23.5 3598
## 3  3     202  Pub      98 90.44.3  140
## 4  4     212  Pub      98 90.69.4 8317
## 5  5     909  Pub      98 90.76.1  618
## 6  6     909  Pub      98 90.23.3  648
```



La somma complessiva delle prestazioni è oltre 73 miloni. 

La somma complessiva delle prestazioni si ripartisce sulle 27 aziende secondo la **figura 1** ( dove sono riportate in rosso le prestazioni in strutture private, in blu quelle in strutture pubbliche).



![plot of chunk plot1](figure/plot1.png) 

La somma complessiva delle prestazioni si ripartisce sulle 43  discipline  presenti nel dataset secondo la **figura 2**.

Non e' stata qui riportata la disciplina 98 "ANALISI DI LABORATORIO" che totalizza, da sola, oltre 50 milioni di prestazioni.


![plot of chunk plot2](figure/plot2.png) 

La somma complessiva delle prestazioni si ripartisce per la disciplina 98 "ANALISI DI LABORATORIO"  sulle diverse aziende sanitarie secondo la **figura 3**.



![plot of chunk plot3](figure/plot3.png) 

La somma complessiva delle prestazioni si ripartisce per la disciplina 98 "UROLOGIA"  sulle diverse aziende sanitarie secondo la **figura 4**.



![plot of chunk plot4](figure/plot4.png) 



