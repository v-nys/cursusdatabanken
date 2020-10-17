# SELECT

## Inspecteren van je data

Je kan in MySQL Workbench wel rechtstreeks naar je tabellen kijken, maar om gerichter te zoeken, moet je het commando kennen dat achter de schermen wordt uitgevoerd. Dat is het `SELECT`-commando.

### de basis

De simpelste vorm van het `SELECT` commando toont gewoon alle data in een bepaalde tabel, bijvoorbeeld:

```sql
USE ApDB;
SELECT * FROM Boeken;
```

De asterisk is een "wildcard" of "joker". Ze geeft aan dat we **alle** kolommen willen zien. We kunnen ook kijken naar specifieke kolommen:

```sql
USE ApDB;
SELECT Voornaam, Titel FROM Boeken;
```

Tip: als je de namen van de kolommen niet uit het hoofd kent, typ dan eerst de naam van de tabel, gevolgd door een punt. Dan kan Workbench slim aanvullen:

```sql
SELECT Boeken.Voornaam, Boeken.Titel FROM Boeken;
```

### data ordenen

Er zijn veel manieren om geselecteerde data te groeperen, maar de simpelste is `ORDER BY`. Als je dit toevoegt aan een `SELECT`-statement, kan je de rijen in een andere volgorde weergeven. Bijvoorbeeld:

```sql
USE ApDB;
SELECT * FROM Boeken ORDER BY Titel;
```

Je kan ook een tweede \(en derde,...\) kolom gebruiken om knopen door te hakken:

```sql
USE ApDB;
SELECT * FROM Boeken ORDER BY Voornaam, Titel;
```

De kolomnamen die je op deze manier gebruikt, hoeven **niet** getoond te worden in je resultaat.

{% hint style="warning" %}
Let op: de sorteervolgorde zal niet altijd overeenstemmen met wat je intuïtief verwacht. Ze hangt af van de gebruikte methode om stukken tekst te vergelijken, de zogenaamde "collation".
{% endhint %}

Er is ook een kortere, maar beperktere manier om te sorteren:

```sql
USE ApDB;
SELECT * FROM Boeken ORDER BY 1, 2;
```

Dit sorteert eerst volgens de eerste kolom en dan volgens de tweede.

Schrijf een script dat de namen van auteurs toont die je in script met nummer 0005 hebt toegevoegd, gesorteerd volgens `Titel`. Noem het 0006\_\_Select.sql.

Schrijf ook een script dat alle kolommen toont die je in het script met nummer 0005 hebt toegevoegd, gesorteerd volgens de inhoud van de tweede kolom. Noem het 0007\_\_Select.sql.

### data verwerken met functies

Je hoeft niet altijd een kolom te tonen in je uitvoer. Je kan ook een afgeleid resultaat tonen met behulp van **functies**. Concatenatie van strings of het bepalen van substrings vallen hieronder.

```sql
USE ApDB;
-- om alleen de initalen te tonen, we starten
-- met het eerste karakter en we nemen 1 karakter.
-- begint niet met 0, maar bij 1!
-- dit is anders dan veel programmeertalen!
SELECT Titel, substring(Voornaam, 1, 1),
   substring(Familienaam, 1, 1)
   FROM Boeken ORDER BY Familienaam, Titel;

-- om de initialen en een punt erachter te tonen
-- daarvoor gebruiken we 'string concatenation',
-- het aan elkaar plakken van strings
SELECT Titel, concat(substring(Voornaam, 1, 1),'.',substring(Familienaam, 1, 1),'.') FROM Boeken ORDER BY Titel, Voornaam;
```

Dit is handig, maar de hoofdingen van de gegenereerde output kunnen beter. Je kan een afgeleide kolom ook een alternatieve hoofding geven met `AS`:

```sql
USE ApDB;
SELECT Titel, concat(substring(Voornaam, 1, 1),'.',substring(Familienaam, 1, 1),'.') AS Initialen FROM Boeken ORDER BY Titel, Voornaam;
```

Als er spaties voorkomen in de hoofding, zet ze dan tussen enkele aanhalingstekens.

