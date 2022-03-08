# mogelijkheden

## Toepassingen van indexen

Indexen kunnen nuttig zijn in vaak voorkomende scenario's:

* in queries met een WHERE-clause die de waarde van een geïndexeerd attribuut controleert kunnen veel rijen op voorhand worden uitgesloten (bijvoorbeeld `WHERE Personen.Voornaam = 'Elias'` sluit al veel mogelijkheden uit)
* om snel minima en maxima te bepalen (zoals hoe een woordenlijst vaak alfabetisch is, zijn ook indexen op kolommen met getalwaarden vaak gesorteerd)
* om JOIN-operaties op geïndexeerde attributen te versnellen (herinner je dat `INNER JOIN ON` in MySQL net hetzelfde doet als een `CROSS JOIN WHERE`)
* ...

Je vindt [hier](https://dev.mysql.com/doc/refman/8.0/en/mysql-indexes.html) een officiële lijst terug van scenario's waarin MySQL zinvol gebruik kan maken van indexen. Let wel op: indexen hebben niet alleen voordelen. Anders zouden we op elk attribuut en op elke combinatie van attributen een index definiëren. Elke index neemt plaats in en moet onderhouden worden, wat betekent dat de schrijfperformantie van het systeem een beetje daalt.

## Belangrijke types index in MySQL

Niet alle indexen zijn hetzelfde. Zoals eerder aangegeven kunnen indexen gebaseerd zijn op één kolom, of op meerdere kolommen. Een index met strengere voorwaarde zal typisch een grotere snelheidswinst opleveren dan een index met zwakkere eisen, omdat je sneller weet of je klaar bent met zoeken. Volgende indexen zijn voorzien in MySQL (en stemmen in sommige gevallen overeen met constraints op je data zoals `UNIQUE`):

* Primaire sleutels: deze heb je meestal sowieso al aangemaakt. Primaire sleutelkolommen worden vaak gebruikt voor zoekoperaties en WHERE-clauses, dus het is logisch om ze automatisch in een index op te nemen. MySQL houdt rijen intern bij in een gesorteerde volgorde op basis van de primaire sleutel en dankzij deze sortering kan er efficiënt gezocht worden.&#x20;
* Unieke indexen: deze kan je definiëren op (verzamelingen van) kolommen met unieke waarden. De data kunnen niet fysiek opgeslagen worden in een volgorde bepaald door deze index (omdat de primaire sleutel de volgorde al bepaalt), maar er kan een extra datastructuur met de unieke waarden worden bijgehouden.
* Gewone indexen: deze kan je definiëren op kolommen met waarden die niet noodzakelijk uniek zijn. Ze mogen ook NULL bevatten.
* Fulltext indexen: deze dienen voor kolommen die een (lang) blok tekst bevatten. De tekst wordt opgesplitst in individuele woorden, die dan geïndexeerd worden. Zo kan je efficiënt blokken tekst zoeken die één specifiek woord bevatten.

## Wanneer heb ik nu een index nodig?

Je zal waarschijnlijk pas indexen nodig hebben als je met grotere databases gaat werken. Langs de andere kant: eens je op dat punt zit, worden enkele zorgvuldig gekozen indexen snel onmisbaar. Het is wanneer je database stilaan onder het gewicht van bepaalde queries begint te kreunen, dat je een echt geïnformeerde beslissing kan nemen. Je doet dit door twee dingen op te meten:

* welke soorten queries vaak uitgevoerd worden
* hoe "duur" dergelijke queries zijn

Als je weet dat bepaalde queries vaak voorkomen en/of veel zoekwerk doorheen kolommen vereisen, is het zinvol de betrokken kolommen te indexeren op een manier die goed past bij hun typische gebruik. In de praktijk zal je ook de eventuele snelheidswinsten die je indexen opleveren opmeten. Hiervoor gebruik je het `EXPLAIN`-statement, dat een overzicht geeft van hoe een bepaald statement is uitgevoerd.
