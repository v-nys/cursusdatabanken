# Oefeningen control flow

We werken verder met de `aptunes`-database. **Activeer deze database in elk script.** Gebruik telkens het meest specifieke parametertype dat je kan toepassen. Gebruik dus geen `INOUT` parameters als het ook met een gewone `IN` of `OUT` parameter kan.

## Extra info

We zullen gebruik maken van stored procedures om testdata te genereren. In het Engels wordt hier vaak over "mock data" gesproken. Dit is erg nuttig om te experimenteren met een database. Het is ook wat wij als lectoren doen om een grote database zoals aptunes op te vullen.

Deze data hoeft geen steek te houden, maar ze moet voldoende gevarieerd zijn. Daarom voeren we willekeurige waarden in. Met de functie `RAND()` kan je een willekeurig getal tussen 0 en 1 genereren. Exact 0 kan gegenereerd worden, maar exact 1 niet.

Wil je een getal tussen 0 en een andere waarde (bijvoorbeeld `ANDER_GETAL`) genereren, dan schrijf je: `FLOOR(RAND() * ANDER_GETAL);`. `FLOOR` dient om naar beneden af te ronden, zodat je een `INT` verkrijgt. `ANDER_GETAL` kan dan nooit gegenereerd worden. Wil je een getal tussen 1 en `ANDER_GETAL` genereren, dan tel je er gewoon 1 bij: `FLOOR(RAND() * ANDER_GETAL) + 1`.

## Vraag 1

Bekijk de tabel `Albumreleases`. Je zal merken dat deze nog leeg is. We zouden deze graag opvullen met geldige waarden. Deze hoeven niet overeen te stemmen met de werkelijkheid, maar de tabel bevat foreign key kolommen dus we mogen er enkel waarden in plaatsen die ergens anders een primary key vormen.

We zullen hier gebruik maken van het feit dat onze primary keys getallen zijn van 1 tot het aantal records in een gegeven tabel.

Schrijf een stored procedure,`MockAlbumRelease`, die een nieuwe albumrelease zal toevoegen. Deze werkt als volgt:

1. Ze declareert vier variabelen van type `INT`: `numberOfAlbums`, `numberOfBands`, `randomAlbumId` en `randomBandId`. De initiële waarde hiervan is 0.
2. Ze past `numberOfAlbums` aan naar het aantal albums in je systeem en `numberOfBands` naar het aantal bands.
3. Ze past `randomAlbumId` aan naar een willekeurige getal tussen 1 en het aantal albums en past `randomBandId` aan naar een willekeurig getal tussen 1 en het aantal bands.
4. Als `(randomAlbumId,randomBandId)` nog niet voorkomt in de tabel `Albumreleases`, voegt ze deze combinatie toe door middel van een `INSERT`. Je moet hier zelf gebruik maken van een `IF`, een `IN` en een subquery (op `Albumreleases`) om te beslissen of de insert mag plaatsvinden. Je hoeft niets te doen als de release al bestaat.

Plaats enkel de definitie in het script, geen oproep. Noem het script dat voor de definitie zorgt `0644__Oefening.sql`. Test je procedure uit door ze enkele keren op te roepen en dan `Albumreleases` te bekijken. Na calibratie was deze tabel leeg, dus na enkele calls zouden er een paar records moeten staan.

## Vraag 2

Het nadeel van onze stored procedure uit vraag 1 is dat we combinaties kunnen genereren die al aanwezig zijn. Dan gebeurt er niets. Als we een exact aantal mock releases willen toevoegen, is dat erg vervelend.

Kopieer je definitie uit de vorige oefening en noem de stored procedure ditmaal `MockAlbumReleaseWithSuccess`. Voorzie ze van een output parameter met naam `success` van type `BOOL`. Zet deze op `1` als de `INSERT` plaatsvindt en zet anders op `0`.

Plaats enkel de definitie in het script, geen oproep. Noem het script dat voor de definitie zorgt `0645__Oefening.sql`.

## Vraag 3

Schrijf een stored procedure, `MockAlbumReleases`. Deze zal in één keer een heleboel testdata toevoegen aan het systeem. Dit gaat als volgt:

1. Definieer de stored procedure met één input parameter, `extraReleases` van type `INT`.
2. Declareer een variabele `counter` van type `INT` met startwaarde 0.
3. Schrijf een `REPEAT` waarin `MockAlbumReleaseWithSuccess` wordt opgeroepen en waarbij de teller wordt verhoogd als er nieuwe data is toegevoegd.
4. Zorg ervoor dat de lus eindigt wanneer het gewenste aantal releases is toegevoegd. Dus `CALL MockAlbumReleases(20)` stopt nadat er 20 nieuwe releases zijn toegevoegd.

{% hint style="warning" %}
Deze stored procedure zou in een oneindige lus terecht komen als je ze zou oproepen wanneer je al beschikt over alle mogelijke combinaties. Ze zou ook heel traag worden als je beschikt over bijna alle combinaties. Dat negeren we voorlopig, want er zijn echt wel enorm veel mogelijke combinaties.
{% endhint %}

Plaats enkel de definitie in het script, geen oproep. Noem het script dat voor de definitie zorgt `0646__Oefening.sql`.

## Vraag 4

Herschrijf `MockAlbumReleases` tot `MockAlbumReleasesLoop`, waarin gebruik gemaakt wordt van een `LOOP` in plaats van een `REPEAT`. Voor de rest doet de stored procedure net hetzelfde als de vorige versie.

Plaats enkel de definitie in het script, geen oproep. Noem het script dat voor de definitie zorgt `0647__Oefening.sql`.
