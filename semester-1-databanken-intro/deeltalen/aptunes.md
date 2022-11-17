# apTunes project

Relationele databases vormen regelmatig de ruggegraat van (web)applicaties. We zullen dat in de verdere labo-oefeningen demonstreren. Voor de verdere oefeningen zullen we voornamelijk werken met een database genaamd `apTunes`. Dit is een database die je zou kunnen gebruiken om een streamingdienst (vergelijkbaar met Spotify, Deezer,...) te ondersteunen.

`apTunes` moet allerlei functionaliteit ondersteunen die je gewend bent van echte streamingdiensten, onder meer:

* voor de eindgebruiker:
  * zoeken op titel, artiest, genre, etc. van een nummer
  * bijhouden van een persoonlijke collectie nummers, albums, playlists
  * nummers opslaan als favorieten
  * enzovoort
* voor de eigenaar:
  * de populairste nummers binnen een bepaalde periode opvragen
  * per artiest het aantal afgespeelde nummers in een bepaalde periode opvragen
  * enzovoort

Tegen het einde van de cursus ken je genoeg MySQL om de databasekant van een prototype van een dergelijke streamingdienst te schrijven.

{% hint style="warning" %}
We zeggen uitdrukkelijk "prototype". Je zal de nodige data kunnen bijhouden en opzoeken, maar in een echte applicatie moet je ook rekening houden met performantie, beveiliging en stabiliteit. Die zaken laten we voor later.
{% endhint %}

### Het startpunt

We starten vanaf een voorstelling die we steeds beter en beter zullen maken:

![](../../.gitbook/assets/aptunes-start.png)

Schrijf zelf code die deze twee tabellen aanmaakt en noem ze _**aptunes\_\_0001.sql**_. Merk op dat de duurtijd uitgedrukt wordt in seconden.

### Mogelijkheden verkennen

{% hint style="warning" %}
Voer je een foute instructie uit? Voer dan in volgorde elk script uit dat in het vet en cursief staat tot vlak voor het script waarbij het fout liep en corrigeer dan je script.
{% endhint %}

{% hint style="info" %}
Als gevraagd wordt om "een nummer" of "alle nummers" te tonen, lees dan "alle kolommen uit de tabel `Nummers`" in hun oorspronkelijke volgorde.
{% endhint %}

{% file src="../../.gitbook/assets/aptunes__0002.sql" %}
aptunes\_\_0002.sql
{% endfile %}

* Voer bovenstaand script uit en zet het in je map met scripts met de naam _**aptunes\_\_0002.sql**_.
* Schrijf een script, aptunes\_\_0003.sql, dat alle nummers van Led Zeppelin in het systeem toont volgens titel.
* Schrijf een script, aptunes\_\_0004.sql, dat alle nummers van Ghostface Killah en alle nummers van Blues Pills samen toont, eerst volgens artiest en dan volgens titel. Dus eerst komen alle nummers van Blues Pills in alfabetische volgorde en dan alle nummers van Ghostface Killah in alfabetische volgorde.
* Wis alle nummers die geen releasedatum hebben. Noem je script _**aptunes\_\_0005.sql**_.
* Schrijf een script, aptunes\_\_0006.sql, dat alle nummers die geen klassieke muziek zijn toont. Bekijk de data om te achterhalen hoe je klassieke nummers kan herkennen.
* Schrijf een script aptunes\_\_0007.sql dat de titels van alle nummers toont die strikt minder dan 2 minuten duren en daarnaast ook toont hoe veel minder. Je zou dus iets als dit kunnen zien als "Kortjakje" 55 seconden duurt en "'k Zag twee beren" 40 seconden duurt:

| titel             | (wat hier staat is niet belangrijk) |
| ----------------- | ----------------------------------- |
| Kortjakje         | 65                                  |
| 'k Zag twee beren | 80                                  |

Denk nu even na over een aantal zoekopdrachten die je met dit model nog niet zou kunnen doen. Noteer ze voor jezelf. Bespreek tijdens het labo klassikaal.

### Structuur verbeteren

Voor onze streamingdienst is het handiger te werken met een vaste set van genres. Anders krijgen we zo veel subgenres dat het niet meer handig is genres te gebruiken. Vandaar volgende wijziging:

* Voeg met script _**aptunes\_\_0008.sql**_ een kolom GenreEnum toe. Deze is voorlopig niet verplicht en kan alleen volgende waardes bevatten: `Klassiek`, `Pop`, `Jazz`, `Metal`, `Rap`, `Electro`, `Folk`, `Wereldmuziek`, `Blues`, `Rock`. Het is niet de bedoeling dat je de oude kolom `Genre` verwijdert of dat je de nieuwe kolom al invult! Verderop zullen we vertalen van de oude kolom naar de nieuwe!
* Vul met script _**aptunes\_\_0009.sql**_ de kolom GenreEnum in. Doe dit door gebruik te maken van de LIKE operator om volgende "vertalingen" toe te passen:
  * alles met de (hoofdletterongevoelige) substring "klass" in de oude kolom wordt "Klassiek" in de nieuwe kolom
  * alles dat eindigt op de (hoofdletterongevoelige) substring "rock" in de oude kolom wordt "Rock" in de nieuwe kolom
  * "rap" en "hiphop" (hoofdletterongevoelig) worden gegroepeerd onder "Rap"
  * alles met het woord "metal" (hoofdletterongevoelig) in wordt "Metal"
  * alles dat eindigt op "blues" (hoofdletterongevoelig) wordt "Blues"
* Test met script aptunes\_\_0010.sql of alle nummers nu een (nieuw) genre hebben door de nummers zonder genre te selecteren.
* Verwijder met script _**aptunes\_\_0011**_.sql de oude kolom `Genre` en hernoem `GenreEnum` naar `Genre`. Maak hierbij het nieuwe genre ook een verplichte kolom.

We merken ook dat het niet erg nuttig is om een exacte datum bij te houden per nummer. We willen alleen het jaar. Je kan het jaar uit een datum halen door er de `YEAR`-functie op toe te passen.

* Maak met script _**aptunes\_\_0012.sql**_ een kolom `ReleaseJaar` aan, vul deze automatisch in op basis van de releasedatum die je al hebt, maak de nieuwe kolom verplicht en verwijder ten slotte de kolom `ReleaseDatum`. Dit zal niet werken voor de nummers van Debussy, omdat ze te oud zijn om met het YEAR-datatype voor te stellen. Vul daarom het jaar van de uitvoering in voor deze nummers: 1985.

### Functionaliteit toevoegen

Nu willen we weten wat de prijs is die de artiest verdient (in eurocent) wanneer een nummer gestreamd wordt. We zullen dit bijhouden met een kolom `Royalties`. Deze heeft type `TINYINT`en is unsigned.  Er is een vuistregel voor het vastleggen van royalties, maar voor sommige nummers is er een speciale regeling. Omdat er alleen in gehele bedragen in eurocent wordt gewerkt, heb je de functie `ROUND` nodig om een getal af te ronden.

* Voeg met script _**aptunes\_\_0013.sql**_ deze kolom toe. Vul ze in als volgt:
  * Klassieke nummers krijgen normaal 1 eurocent per 60 seconden, dus je stelt de royalties in als de duurtijd gedeeld door 60 (afgerond).
  * Rocknummers en metalnummers krijgen 1 eurocent per 20 seconden.
  * Rap krijgt 1 eurocent per 15 seconden.
  * Nummers van Led Zeppelin krijgen 1 eurocent per 10 seconden.
* Er is een wijziging in de prijsstructuur! Verhoog met script _**aptunes\_\_0014.sql**_ alle royalties met 20%. Rond opnieuw af om een geheel bedrag te krijgen.

### Informatie voor de eigenaars

De eigenaars van onze streamingdienst willen statistieken over de artiesten.

Gebruik eerst volgend script _**aptunes\_\_0015.sql**_ om meer data in het systeem te plaatsen:

{% file src="../../.gitbook/assets/aptunes.sql" %}

Nu er redelijk wat data is, moeten we die gaan samenvatten eerder dan rij per rij te bekijken.

* Schrijf een script aptunes\_\_0016.sql dat toont hoe veel rocknummers er in het systeem zijn.
* Schrijf een script aptunes\_\_0017.sql dat voor elk genre toont hoe veel nummers er zijn. Het formaat van de uitvoer is als volgt en de genres zijn gesorteerd volgens de volgorde van de enum die de genres voorstelt:

| Genre   | (titel maakt niet uit)      |
| ------- | --------------------------- |
| Genre 1 | (aantal nummers in genre 1) |
| Genre 2 | (aantal nummers in genre 2) |
| ...     | ...                         |

* Toon het releasejaar van het oudste nummer in het systeem. De uitvoer is één rij met één kolom. De titel van deze kolom maakt niet uit. Noem je script aptunes\_\_0018.sql.
* Herschrijf volgende query zonder `DISTINCT` zodat je toch nog hetzelfde resultaat krijgt en noem je script aptunes\_\_0019.sql: `SELECT DISTINCT Artiest FROM Nummers;`
* Toon alle nummers die minstens 5 minuten duren volgens titel. Noem je script aptunes\_\_0020.sql.
* Toon alle genres waarvan de nummers gemiddeld minstens 5 minuten duren, in de volgorde die is vastgelegd voor de genre enum. Noem je script aptunes\_\_0021.sql.
* Toon per decennium het aantal uitgebrachte nummers, maar enkel als dat aantal hoger ligt dan 450. Om dit klaar te spelen, moet je afronden tot het dichtste tiental. Dat kan je doen met TRUNCATE(getal,-1), bijvoorbeeld TRUNCATE(1973,-1) levert 1970. Je output moet ook stijgen volgens het decennium. Je resultaat zou er bijvoorbeeld zo moeten uitzien:

| Decennium | Aantal nummers |
| --------- | -------------- |
| 1970      | ...            |
| 1990      | ...            |
| 2000      | ...            |

* Het blijkt dat erg lange klassieke nummers niet erg winstgevend zijn voor onze dienst. Toon daarom alfabetisch alle artiesten die klassieke nummers hebben, maar enkel als hun klassieke nummers ook gemiddeld langer dan 8 minuten duren. Noem je script aptunes\_\_0023.sql. **Tip: afhankelijk van hoe je dit doet, heb je de meeste of zelfs alle clausules nodig.**

## Normalisatie van de apTunes databank

De apTunes database, zoals ze ontwikkeld is met scripts 1 tot 23, is niet erg efficiënt ontworpen. We zullen ze herstructureren met relationele concepten.

We willen ons ontwerp verbeteren, zodat we uiteindelijk volgende relaties krijgen:

{% hint style="warning" %}
Op deze figuur staat "Liedjes" in plaats van "Nummers". De eerstvolgende opdrachten gebruiken nog "Nummers", maar dat wordt verderop aangepast.
{% endhint %}

<figure><img src="../../.gitbook/assets/beter_ontwerp.png" alt=""><figcaption></figcaption></figure>

Dit ERD toont alleen de entiteittypes en de relatietypes. De precieze velden ervan moet je zelf kunnen afleiden uit de informatie waarvan je vertrekt.

We zullen eerst de 1-op-N relaties voorstellen.

* Maak een script dat een tabel `Artiesten` aanmaakt voor artiesten. Noem dit `aptunes__0024.sql`. Zorg ervoor dat elke artiest die we toevoegen automatisch genummerd wordt.
* Maak een script om de data over artiesten in te vullen in deze tabel. Je mag veronderstellen dat twee artiesten met dezelfde naam dezelfde artiest zijn.
  * Hiervoor kan je in een `INSERT` query het gedeelte `VALUES (...)` vervangen door een **subquery** waarvan de resultaten overeenstemmen met de values die je zou invullen. Met andere woorden: `INSERT INTO EenTabel (IngevuldeKolom1, IngevuldeKolom2) (select KolomWaarde1, KolomWaarde2 from EenAndereTabel);` Noem je script `aptunes__0025.sql`.
* Maak een script om `Nummers` te voorzien van een foreign key kolom die verwijst naar de tabel `Artiesten`. Volg hierbij alle afspraken rond foreign keys! Voorlopig kan je deze niet verplicht maken. Noem je script `aptunes__0026.sql`.
* het script om de artiesten te linken hoef je op dit moment niet te begrijpen, maar krijg je hieronder (`aptunes__0027.sql`)
* het script om de verwijzing naar een `Artiest` verplicht te maken en kolom `Artiest` uit `Nummers` te verwijderen is `aptunes__0028.sql`
* het script om `Albums` te maken is `aptunes__0029.sql` (schrijf je zelf, moet alleen info zuiver over het album bevatten die nu in Nummers staat)
* het script om data te migreren naar `Albums` is `aptunes__0030.sql` (schrijf je zelf)
* het script om `Albums` te voorzien van een foreign key waarmee je naar de artiest verwijst is `aptunes__0031.sql` (schrijf je zelf)
* het script om de albums te linken aan artiesten krijg je hieronder (`aptunes__0032.sql`)
* het script om gebruikers toe te voegen krijg je hieronder (`aptunes__0033.sql`)

{% file src="../../.gitbook/assets/aptunes__0027.sql" %}
aptunes\_\_0027.sql
{% endfile %}

{% file src="../../.gitbook/assets/aptunes__0032 (1).sql" %}
aptunes\_\_0032.sql
{% endfile %}

{% file src="../../.gitbook/assets/aptunes__0034.sql" %}

### Veel-op-veel (M-op-N) relaties

{% hint style="warning" %}
Vanaf hier spreken we over "Liedjes" in plaats van "Nummers". "Nummers" werd verwarrend omdat we ook getallen ("nummers") als sleutelwaarden gebruiken.
{% endhint %}

**Fris het vorige deel op indien je ergens niet kan volgen, want deze leerstof bouwt rechtstreeks voort op de vorige. We werken hier verder naar het ontwerp volgens het ERD.**

{% hint style="info" %}
Voer eerst het calibratiescript op DigitAP uit.
{% endhint %}

* Het script om `GebruikerHeeftAlbum` toe te voegen noem je `aptunes__0035.sql.` Naast de sleutelkolommen voorzie je ook een kolom `DatumToevoeging` om het tijdstip toe te voegen waarop dit album toegevoegd is aan de bibliotheek. Dit is een verplichte `datetime.`
* Het script om de data toe te voegen (`aptunes__0036.sql`) vind je hieronder terug.
* Het script om `LiedjeOpAlbum` toe te voegen noem je `aptunes__0037.sql`. Het tracknummer hou je bij in een kolom `TrackNummer`, het past in een `int`.&#x20;
  * In deze tabel sla je volgende informatie op met een eigen script `aptunes__0038.sql`. (Om dit te doen zoek je met de hand de `Id` van het nummer en van het album op in hun tabellen en `INSERT` je hun combinatie in de nieuwe tabel `LiedjeOpAlbum`. De werkwijze is dus dezelfde als in script 36.)
    * Het nummer met titel _Stairway to Heaven_ is het vierde nummer op het album Led Zeppelin IV
    * Het nummer met titel _Problem Child_ is het tweede nummer op het album met titel Let There Be Rock
* Het script om `GebruikerHeeftLiedje` toe te voegen noem je `aptunes__0039.sql.` Je hebt ook een kolom `Favoriet` nodig (van type int) om bij te houden of een nummer een favoriet nummer van die gebruiker is. Als het een favoriet nummer is, vul je 1 in, anders 0.
  *   In deze tabel sla je volgende informatie op met een eigen script `aptunes__0040.sql`. De werkwijze is dezelfde als eerder.

      * tuneBoY5 heeft het nummer _Little Sun_, maar het is geen favoriet
      * musicfan111 heeft het nummer _Eat the Rich_ en het is een favoriet



{% file src="../../.gitbook/assets/aptunes__0036 (1).sql" %}

### Joins

{% file src="../../.gitbook/assets/calibratiejoins.sql" %}

* Toon de titel en de artiest van alle nummers. Maak hierbij gebruik van een inner join. Noem dit script `aptunes__0041.sql`.
* Toon deze zelfde gegevens nu enkel voor nummers waarvan de titel begint met de letter "A". Noem dit script `aptunes__0042.sql`.
* Toon de titel van elk album naast de naam van de artiest. Noem dit script `aptunes__0043.sql`.
* Toon hoe veel nummers Led Zeppelin heeft. Noem dit script `aptunes__0044.sql`.
* Toon de titel van elk nummer naast het `Id` van het album waarop dat nummer staat. Noem dit script `aptunes__0045.sql`. Hiervoor heb je de tabel `NummerOpAlbum` nodig. Je hebt nog maar één join nodig.
* Toon per `Id` van een album hoe veel nummers er op dat album staan. Je hoeft nog **niet** de titel te tonen van het album. Noem dit script `aptunes__0046.sql`.  Je kan dit zonder join.
* Toon elk nummer naast de titel van het album waarop het nummer staat. Noem dit script `aptunes__0047.sql`. Nu heb je twee joins nodig.
* Toon hoe veel albums elke gebruiker heeft. Noem dit script `aptunes__0048.sql`. Je moet dus naast de naam van elke gebruiker een getal zien staan (het aantal albums dat hij heeft).
* Toon alle combinaties van een gebruiker en een album in de collectie van die gebruiker. Toon hierbij ook de datum waarop de gebruiker het album heeft aangekocht. Noem dit script `aptunes__0049.sql`. Je moet dus een gebruikersnaam, titel en datum naast elkaar zien.
* Toon alle combinaties van gebruikers en favoriete losse nummers. In deze dataset heeft maar één gebruiker een favoriet los nummer, maar je query zou ook moeten werken als er veel meer data is. Noem dit `aptunes__0050.sql`. Je moet dus een gebruikersnaam en liedjestitel naast elkaar zien.
