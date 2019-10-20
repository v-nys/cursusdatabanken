# Vergelijkingen in MySQL
## overzicht operatoren
Om waarden te vergelijken, maakt MySQL gebruik van enkele operatoren die erg lijken op wat je mogelijk kent uit andere programmeertalen:

| Symbool | Omschrijving      |
|---------|-------------------|
| `=`     | Gelijk aan        |
| `<`     | Kleiner dan       |
| `>`     | Groter dan        |
| `<=`    | Kleiner of gelijk |
| `>=`    | Groter of gelijk  |
| `<>`    | Verschillend      |

{% hint style="warning" %}
Voor "gelijk aan" heb je maar één `=` nodig, waar veel programmeertalen `==` gebruiken. Dat komt omdat `=` in die andere talen gebruikt wordt voor toekenning. In SQL is duidelijk uit de context dat je met `=` een vergelijking bedoelt.
{% endhint %}

## operatoren in combinatie met collations
Voor getallen betekenen bovenstaande operatoren precies wat je zou verwachten. Je moet in het achterhoofd houden dat `FLOAT` en `DOUBLE` niet helemaal precies zijn, maar voor de rest betekenen ze wat je verwacht uit de wiskunde.

Voor tekst is het wat complexer. Je kan wel degelijk iets als het volgende (0027\_\_SelectBoeken.sql) schrijven:

```sql
USE ModernWays;
SELECT Familienaam, Titel FROM Boeken WHERE Familienaam < 'B';
```

Dit SELECT statement retourneert alle rijen uit de tabel `Boeken` waarvan de `Familienaam` een waarde heeft die "kleiner" is dan `'B'`. Wanneer is een string "kleiner" dan een andere string? Om op die vraag te antwoorden moet je eerst weten dat de namen in een bepaalde, normaal alfabetische volgorde (in het Engels **collation order**) worden gerangschikt. "Alle namen kleiner dan 'B'"" wil dan zeggen "alle namen die na het sorteren voor 'B' komen." De **collation** is dus een stel regels voor het vergelijken van tekens in een tekenset.

Als de familienaam Beth in je tabel voorkomt, wordt deze niet in de selectie opgenomen. Om ook die rij te selecteren, zou je kunnen denken om de expressie Familienaam <= 'B' te gebruiken:

```sql
USE ModernWays;
SELECT Familienaam, Titel FROM Boeken WHERE Familienaam <= 'B';
```

Dit zal niet werken. Dat komt omdat we de boeken opvragen waarvan de familienaam van de auteur kleiner of gelijk is aan 'B'.
De tekst 'Beth' is niet gelijk aan 'B' en is zeker niet kleiner!
In het algemeen mag je dit onthouden: als een string A een prefix is van een string B, d.w.z. als string B letterlijk begint met de inhoud van A en dan nog meer tekst bevat, dan zal A altijd voor B gesorteerd worden.
Zo wordt 'schoen' gesorteerd voor 'schoenmaker', omdat 'schoen' een prefix is van 'schoenmaker'.
Maar er wordt éérst naar de letters gekeken en dan pas naar de lengte van de tekst.
Zo wordt 'schoeisel' voor 'schoen' gesorteerd, omdat 'i' voor 'n' komt.

Ter verduidelijking: als we `'B'` als familienaam toevoegen, wordt het resultaat wel geselecteerd:

```sql
insert into Boeken (
   Familienaam,
   Titel,
   Voornaam)
values (
   'B',
   'Het Boek',
   'Jef');

select Titel, Familienaam from Boeken
   where Familienaam <= 'B';
```

Stel dat je alle titels wilt van de auteurs wilt waarvan de familienaam begint met een' A' of een 'B'. Dan moet je de WHERE clausule verfijnen. Je zou dit kunnen proberen:

```sql
use ModernWays;
select Familienaam, Titel from Boeken where Familienaam <= 'Bz';
```

Maar hier zijn verschillende problemen mee. Als `'Bz'` een prefix is van de naam van een auteur (niet erg waarschijnlijk, maar het zou kunnen), zal dit niet werken. Nog lastiger: dit is erg afhankelijk van de collation. Het is niet in elke collation zo dat 'Bz' voor 'Bé' komt, bijvoorbeeld. Sommige collations sorteren eerst de gebruikelijke 26 letters van het alfabet en pas daarna de letters met accenten.

Dit is beter:

select Familienaam, Titel from Boeken where Familienaam < 'C'

Hoe weet je wat er met accenten en hoofdletters gebeurt? Dat hangt ervan af of de gebruikte collation hoofdlettergevoelig (case sensitive) en/of accentgevoelig (accent sensitive) is.

Probeer dit eens uit (hoeft niet in een script):

insert into Boeken (
   Voornaam,
   Familienaam,
   Titel,
   Stad,
   Uitgeverij,
   Verschijningsdatum,
   Herdruk,
   Commentaar,
   Categorie
)
values
(
   'Emile',
   'Bréhier',
   'Cours de Philosophie',
   'Paris',
   'Gallimard',
   '1935',
   '1960',
   'Goed boek',
   'Filosofie'
),
(
   'Andre',
   'Breton',
   'Nadja',
   'Paris',
   'NRF',
   '1928',
   '?',
   'Nog te lezen',
   'Roman'
);

select Voornaam, Familienaam, Titel from Boeken
   where Familienaam <= 'Bret';

Als de collation voor Familienaam accentgevoelig is, zal je alleen het boek van Breton zien. Anders zal je ook dat van Bréhier zien. Als je onder MySQL de collation van de kolommen van de tabel Boeken te weten wil komen, gebruik je volgende query:

SHOW FULL COLUMNS FROM Boeken;

Er zijn véél collations, maar onthoud vooral volgende vuistregels:

    als ze _bin bevat (al dan niet met hoofdletters geschreven), is ze zo streng mogelijk
    als ze _as bevat, is ze accentgevoelig
    als ze _ai bevat, is ze accentongevoelig
    als ze _cs bevat, is ze hoofdlettergevoelig
    als ze _ci bevat, is ze hoofdletterongevoelig

{% hint style="info" %}
Als je MySQL geïnstalleerd hebt zoals afgesproken, wordt standaard de tekenset `utf8mb4` en de collation `utf8mb4_0900_ai_ci` gebruikt. Dus met de standaardinstellingen maakt het niet uit of je `CHAR SET utf8mb4` toevoegt, maar het is beter expliciet te zijn dan te hopen dat jouw database nog volledig ingesteld is op standaardinstellingen.
{% endhint %}

## speciaal geval: `IS NULL`
Zoals eerder aangegeven heeft het geen zin een waarde rechtstreeks te vergelijken met `NULL` door middel van `=` of `<>`. Als je dit toch wil doen, gebruik je `IS NULL` of `IS NOT NULL`. Bijvoorbeeld:

TODO