# SELECT

## Inspecteren van je data

Je kan in MySQL Workbench wel rechtstreeks naar je tabellen kijken, maar om gerichter te zoeken, moet je het commando kennen dat achter de schermen wordt uitgevoerd. Dat is het `SELECT`-commando.

### de basis

De simpelste vorm van het `SELECT` commando toont gewoon alle data in een bepaalde tabel, bijvoorbeeld:

```sql
USE ModernWays;
SELECT * FROM Boeken;
```

De asterisk is een "wildcard" of "joker". Ze geeft aan dat we **alle** kolommen willen zien. We kunnen ook kijken naar specifieke kolommen:

```sql
USE ModernWays;
SELECT Voornaam, Familienaam FROM Boeken;
```

Tip: als je de namen van de kolommen niet uit het hoofd kent, typ dan eerst de naam van de tabel, gevolgd door een punt. Dan kan Workbench slim aanvullen:

```sql
SELECT Boeken.Voornaam, Boeken.Familienaam FROM Boeken;
```

### data ordenen

Er zijn veel manieren om geselecteerde data te groeperen, maar de simpelste is `ORDER BY`. Als je dit toevoegt aan een `SELECT`-statement, kan je de rijen in een andere volgorde weergeven. Bijvoorbeeld:

```sql
USE ModernWays;
SELECT * FROM Boeken ORDER BY Familienaam;
```

Je kan ook een tweede \(en derde,...\) kolom gebruiken om knopen door te hakken:

```sql
USE ModernWays;
SELECT * FROM Boeken ORDER BY Familienaam, Voornaam, Titel;
```

Let op: je moet weten welke sorteermethode gebruikt wordt. Zeker bij strings is dit niet zo evident, want je moet rekening houden met de collation. Zo zal `'5'` normaal gesorteerd worden **na** `'0006'`, omdat er niet naar de betekenis van een getal gekeken wordt maar wel naar de gebruikte tekens.

### data verwerken met functies

Je hoeft niet altijd een kolom te tonen in je uitvoer. Je kan ook een afgeleid resultaat tonen met behulp van **functies**. Concatenatie van strings of het bepalen van substrings vallen hieronder.

```sql
USE ModernWays;
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
USE ModernWays;
SELECT Titel, concat(substring(Voornaam, 1, 1),'.',substring(Familienaam, 1, 1),'.') AS Initialen FROM Boeken ORDER BY Titel, Voornaam;
```

Als er spaties voorkomen in de hoofding, zet ze dan tussen enkele aanhalingstekens.

