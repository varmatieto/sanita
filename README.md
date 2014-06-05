Prestazioni sanitarie in Regione Piemonte
----------------------------

### Fonte

Sul sito dedicati agli **Opendata** http://www.dati.piemonte.it  sono stai pubblicati le "Prestazioni sanitarie erogate per tipologia di prestazione".

Il file è accessibile all'indirizzo:
http://www.dati.piemonte.it/catalogodati/dato/100742-prestazioni-sanitarie-erogate-per-tipologia-di-prestazione.html

Nel dataset sono riportati i volumi di **prestazioni sanitarie**, intesi come quantità di prestazioni erogate per azienda sanitaria, con l'evidenza della tipologia di struttura erogatrice ( pubblica o privata
), del codice di prestazione e della relativa branca specialistica, nell'anno 2012 a livello regionale. 

Insieme al database delle prestazioni sono disponibili alcuni datset  di supporto che riguardano:

- il Catalogo delle prestazioni sanitarie,

- l'elenco delle Aziende Sanitarie.


Il Catalogo delle **prestazioni specialistiche sanitarie** si riferisce come da descrizione all':
*elenco delle prestazioni erogate dalla Regione Piemonte ai sensi della DGR 11-6036 del 02 luglio 2013, effettuate a livello ambulatoriale e non ambulatoriale o riferite a particolari attivita'  svolte in attuazione di funzioni specificatamente attribuite, erogabili nell' ambito del servizio sanitario regionale.* 

Il dato è presentato su 2 tabelle: 

- elenco delle Prestazioni ed

- elenco delle Branche ( o Discipline).

Quest'ultimo utile per la decodifica del codice "disciplina" dell'elenco delle prestazioni. 

Nell'elenco delle **Aziende Sanitarie** per ogni azienda sono indicati il codice azienda, la denominazione e la data di attivazione.




### Caratteristiche dei databases

Il database **prestazioni sanitarie**, contiene 295643 osservazioni su  5 variabili.

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






Grazie al software statistico opensource R si riportano alcune prime elaborazioni.


La somma complessiva di oltre 73 miloni di prestazioni si ripartisce sulle 27 aziende.
