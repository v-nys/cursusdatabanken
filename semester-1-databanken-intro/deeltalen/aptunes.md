# apTunes project

Relationele databases vormen regelmatig de ruggegraat van \(web\)applicaties. We zullen dat in de verdere labo-oefeningen demonstreren. Voor de verdere oefeningen zullen we voornamelijk werken met een database genaamd `apTunes`. Dit is een database die je zou kunnen gebruiken om een streamingdienst \(vergelijkbaar met Spotify, Deezer,...\) te ondersteunen.

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

{% file src="../../.gitbook/assets/aptunes\_\_0002.sql" caption="aptunes\_\_0002.sql" %}

* Voer bovenstaand script uit en zet het in je map met scripts met de naam _**aptunes\_\_0002.sql**_.
* Schrijf een script, aptunes\_\_0003.sql, dat alle nummers van Led Zeppelin in het systeem toont volgens titel.
* Schrijf een script, aptunes\_\_0004.sql, dat alle nummers van Ghostface Killah en alle nummers van Blues Pills samen toont, eerst volgens artiest en dan volgens titel. Dus eerst komen alle nummers van Blues Pills in alfabetische volgorde en dan alle nummers van Ghostface Killah in alfabetische volgorde.
* Wis alle nummers die geen releasedatum hebben. Noem je script _**aptunes\_\_0005.sql**_.
* Schrijf een script, aptunes\_\_0006.sql, dat alle nummers die geen klassieke muziek zijn toont. Bekijk de data om te achterhalen hoe je klassieke nummers kan herkennen.
* Schrijf een script aptunes\_\_0007.sql dat de titels van alle nummers toont die strikt minder dan 2 minuten duren en daarnaast ook toont hoe veel minder. Je zou dus iets als dit kunnen zien als "Kortjakje" 55 seconden duurt en "'k Zag twee beren" 40 seconden duurt:

| titel | \(wat hier staat is niet belangrijk\) |
| :--- | :--- |
| Kortjakje | 65 |
| 'k Zag twee beren | 80 |

Denk nu even na over een aantal zoekopdrachten die je met dit model nog niet zou kunnen doen. Noteer ze voor jezelf. Bespreek tijdens het labo klassikaal.

### Structuur verbeteren

Voor onze streamingdienst is het handiger te werken met een vaste set van genres. Anders krijgen we zo veel subgenres dat het niet meer handig is genres te gebruiken. Vandaar volgende wijziging:

* Voeg met script _**aptunes\_\_0008.sql**_ een kolom GenreEnum toe. Deze is voorlopig niet verplicht en kan alleen volgende waardes bevatten: `Klassiek`, `Pop`, `Jazz`, `Metal`, `Rap`, `Electro`, `Folk`, `Wereldmuziek`, `Blues`. Het is niet de bedoeling dat je de oude kolom `Genre` verwijdert of dat je de nieuwe kolom al invult! Verderop zullen we vertalen van de oude kolom naar de nieuwe!
* Vul met script _**aptunes\_\_0009.sql**_ de kolom GenreEnum in. Doe dit door gebruik te maken van de LIKE operator om volgende "vertalingen" toe te passen:
  * alles met de \(hoofdletterongevoelige\) substring "klass" in de oude kolom wordt "Klassiek" in de nieuwe kolom
  * alles dat eindigt op de \(hoofdletterongevoelige\) substring "rock" in de oude kolom wordt "Rock" in de nieuwe kolom
  * "rap" en "hiphop" \(hoofdletterongevoelig\) worden gegroepeerd onder "Rap"
  * alles met het woord "metal" \(hoofdletterongevoelig\) in wordt "Metal"
  * alles dat eindigt op "blues" \(hoofdletterongevoelig\) wordt "Blues"
* Test met script aptunes\_\_0010.sql of alle nummers nu een \(nieuw\) genre hebben door de nummers zonder genre te selecteren.
* Verwijder met script _**aptunes\_\_0011**_.sql de oude kolom `Genre` en hernoem `GenreEnum` naar `Genre`. Maak hierbij het nieuwe genre ook een verplichte kolom.

We merken ook dat het niet erg nuttig is om een exacte datum bij te houden per nummer. We willen alleen het jaar. Je kan het jaar uit een datum halen door er de `YEAR`-functie op toe te passen.

* Maak met script _**aptunes\_\_0012.sql**_ een kolom `ReleaseJaar` aan, vul deze automatisch in op basis van de releasedatum die je al hebt, maak de nieuwe kolom verplicht en verwijder ten slotte de kolom `ReleaseDatum`.

### Functionaliteit toevoegen

Nu willen we weten wat de prijs is die de artiest verdient \(in eurocent\) wanneer een nummer gestreamd wordt. We zullen dit bijhouden met een kolom `Royalties`.  Er is een vuistregel voor het vastleggen van royalties, maar voor sommige nummers is er een speciale regeling. Omdat er alleen in gehele bedragen in eurocent wordt gewerkt, heb je de functie `ROUND` nodig om een getal af te ronden.

* Voeg met script _**aptunes\_\_0013.sql**_ deze kolom toe. Vul ze in als volgt:
  * Klassieke nummers krijgen normaal 1 eurocent per 60 seconden, dus je stelt de royalties in als de duurtijd gedeeld door 60 \(afgerond\).
  * Rocknummers en metalnummers krijgen 1 eurocent per 20 seconden.
  * Rap krijgt 1 eurocent per 15 seconden.
  * Nummers van Led Zeppelin krijgen 1 eurocent per 10 seconden.
* Er is een wijziging in de prijsstructuur! Verhoog met script _**aptunes\_\_0014.sql**_ alle royalties met 20%. Rond opnieuw af om een geheel bedrag te krijgen.





