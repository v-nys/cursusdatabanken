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

Je kan ook een tweede (en derde,...) kolom gebruiken om knopen door te hakken:

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
