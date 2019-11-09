# vergelijkingen

## overzicht operatoren

Om waarden te vergelijken, maakt MySQL gebruik van enkele operatoren die erg lijken op wat je mogelijk kent uit andere programmeertalen:

| Symbool | Omschrijving |
| :--- | :--- |
| `=` | Gelijk aan |
| `<` | Kleiner dan |
| `>` | Groter dan |
| `<=` | Kleiner of gelijk |
| `>=` | Groter of gelijk |
| `<>` | Verschillend |

{% hint style="warning" %}
Voor "gelijk aan" heb je maar één `=` nodig, waar veel programmeertalen `==` gebruiken. Dat komt omdat `=` in die andere talen gebruikt wordt voor toekenning. In SQL is duidelijk uit de context dat je met `=` een vergelijking bedoelt.
{% endhint %}

## operatoren in combinatie met collations

Voor getallen betekenen bovenstaande operatoren precies wat je zou verwachten. Je moet in het achterhoofd houden dat `FLOAT` en `DOUBLE` niet helemaal precies zijn, maar voor de rest betekenen ze wat je verwacht uit de wiskunde.

Voor tekst is het wat complexer. Je kan wel degelijk iets als het volgende \(0028\_\_SelectBoeken.sql\) schrijven:

```sql
USE ModernWays;
SELECT Familienaam, Titel FROM Boeken WHERE Familienaam < 'B';
```

Dit `SELECT` statement retourneert alle rijen uit de tabel `Boeken` waarvan de `Familienaam` een waarde heeft die "kleiner" is dan `'B'`. Wanneer is een string "kleiner" dan een andere string? Om op die vraag te antwoorden moet je eerst weten dat de namen in een bepaalde, **gewoonlijk** alfabetische volgorde \(in het Engels **collation order**\) worden gerangschikt. "Alle namen kleiner dan 'B'" wil dan zeggen "alle namen die na het sorteren voor 'B' komen." De **collation** is dus een stel regels voor het vergelijken van tekens in een tekenset.

Als de familienaam Beth in je tabel voorkomt, wordt deze niet in de selectie opgenomen. Om ook die rij te selecteren, zou je kunnen denken om de expressie `Familienaam <= 'B'` te gebruiken:

```sql
USE ModernWays;
SELECT Familienaam, Titel FROM Boeken WHERE Familienaam <= 'B';
```

Dit zal niet werken. Dat komt omdat we de boeken opvragen waarvan de familienaam van de auteur kleiner of gelijk is aan 'B'. De tekst `'Beth'` is niet gelijk aan `'B'` en is zeker niet kleiner! In het algemeen mag je dit onthouden: als een string A een **prefix** is van een string B, d.w.z. als string B letterlijk begint met de inhoud van A en dan nog meer tekst bevat, dan zal A altijd voor B gesorteerd worden. Zo wordt 'schoen' gesorteerd voor 'schoenmaker', omdat 'schoen' een prefix is van 'schoenmaker'. Maar er wordt éérst naar de letters gekeken en dan pas naar de lengte van de tekst. Zo wordt 'schoeisel' voor 'schoen' gesorteerd, omdat 'i' voor 'n' komt.

Ter verduidelijking: als we `'B'` als familienaam toevoegen \(in script 0029\_\_InsertBoeken.sql\), wordt het resultaat wel geselecteerd:

```sql
USE ModernWays;
INSERT INTO Boeken (Familienaam,Titel,Voornaam,Categorie)
VALUES
('B','Het Boek','Jef','Filosofie');
SELECT Titel, Familienaam FROM Boeken
   where Familienaam <= 'B';
```

Stel dat je alle titels wilt van de auteurs wilt waarvan de familienaam begint met een' A' of een 'B'. Dan moet je de WHERE clausule verfijnen. Je zou dit kunnen proberen:

```sql
USE ModernWays;
SELECT Familienaam, Titel FROM Boeken where Familienaam <= 'Bz';
```

Maar hier zijn verschillende problemen mee. Als `'Bz'` een prefix is van de naam van een auteur \(niet erg waarschijnlijk, maar het zou kunnen\), zal dit niet werken. Nog lastiger: dit is erg afhankelijk van de collation. Het is niet in elke collation zo dat 'Bz' voor 'Bé' komt, bijvoorbeeld. Sommige collations sorteren eerst de gebruikelijke 26 letters van het alfabet en pas daarna de letters met accenten.

0030\_\_SelectBoeken.sql is beter \(je mag er in het algemeen wel vanuit gaan dat `'B'` voor `'C'` komt\):

```sql
USE ModernWays;
SELECT Familienaam, Titel FROM Boeken where Familienaam < 'C'
```

Hoe weet je precies wat er met accenten en hoofdletters gebeurt? Dat hangt ervan af of de gebruikte collation hoofdlettergevoelig \(case sensitive\) en/of accentgevoelig \(accent sensitive\) is voor de kolom die je aan het beschouwen bent.

Probeer dit eens uit \(hoeft niet in een script\):

```text
INSERT INTO Boeken (
   Voornaam,
   Familienaam,
   Titel,
   Stad,
   Uitgeverij,
   Verschijningsjaar,
   Herdruk,
   Commentaar,
   Categorie
)
VALUES
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

SELECT Voornaam, Familienaam, Titel FROM Boeken
   where Familienaam <= 'Breton';
```

Als de collation voor `Familienaam` accentongevoelig is, zal je beide nieuwe records zien. Anders worden de zaken complexer. Dan moet je kijken naar het gebruikte collation algoritme en de accentgevoeligheid. Dit kan vrij complex worden en we laten het verder zo, maar weet dat er een verschil mogelijk is. Als je onder MySQL de collation van de kolommen van de tabel Boeken te weten wil komen, gebruik je volgende speciale query:

```sql
SHOW FULL COLUMNS FROM Boeken;
```

Je kan in MySQL Workbench ook rechtsklikken op de tabel in kwestie en dan via "Table Inspector" naar "Columns" gaan om de collation te achterhalen. Er zijn véél collations, maar onthoud vooral volgende vuistregels:

* als ze `_bin` bevat \(al dan niet met hoofdletters geschreven\), worden de bytevoorstellingen van de karakters vergeleken
  * dit is zowat de strengste definitie van gelijkheid die je kan hebben
  * bijvoorbeeld bij `utf8mb4_bin` komt `'Breton`' **voor** `'Bréhier'`
* als ze `_as` bevat, is de collation accentgevoelig
  * dit betekent niet noodzakelijk dat `'Breton`' voor `'Bréhier`'komt, maar wel dat `'e`' en `'é`' verschillend zijn
* als ze `_ai` bevat, is de collation accentongevoelig
* als ze `_cs` bevat, is de collation hoofdlettergevoelig
* als ze `_ci` bevat, is de collation hoofdletterongevoelig

Als je dus bijvoorbeeld enkel een boek van Breton wil, zonder boeken van "Bréton" of "breton", schrijf je:

```sql
SELECT * FROM Boeken WHERE Familienaam COLLATE utf8mb4_as_cs = 'Breton';
```

{% hint style="info" %}
Als je MySQL geïnstalleerd hebt zoals afgesproken, wordt standaard de tekenset `utf8mb4` en de collation `utf8mb4_0900_ai_ci` gebruikt. Dus met de standaardinstellingen maakt het niet uit of je `CHAR SET utf8mb4` toevoegt, maar het is beter expliciet te zijn dan te hopen dat jouw database nog volledig ingesteld is op standaardinstellingen.
{% endhint %}

## speciaal geval: `IS NULL`

Zoals eerder aangegeven heeft het geen zin een waarde rechtstreeks te vergelijken met `NULL` door middel van `=` of `<>`. Als je dit toch wil doen, gebruik je `IS NULL` of `IS NOT NULL`. Bijvoorbeeld:

```sql
SELECT * FROM Boeken WHERE Categorie IS NULL;
```

