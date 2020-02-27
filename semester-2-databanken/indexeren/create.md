# CREATE

## Prefix index

Wanneer je een secundaire index voor een kolom maakt, slaat MySQL de waarden van de kolommen op in een afzonderlijke gegevensstructuur, bijvoorbeeld B-Tree en Hash.

In het geval dat de kolommen de tekenreekskolommen zijn, zal de index veel schijfruimte in beslag nemen en mogelijk de INSERT-bewerkingen vertragen.

Om dit probleem aan te pakken, kan je met MySQL een index maken voor het leidende deel van de kolomwaarden van de tekenreekskolommen met behulp van de volgende syntax: 

```sql
column_name(length)
```

Je kan een index op twee manieren creëren.

**1. bij creatie van de tabel zelf**

```sql
CREATE TABLE Table_name(
column_list,
INDEX(column_name(length))
);
```

**2. nadien toevoegen aan een bestaande tabel**

```sql
CREATE INDEX index_name
ON table_name(column_name(length));
```

In bovenstaande voorbeelden is de lengte het aantal tekens voor de datatypes zoals CHAR, VARCHAR en TEXT \(en het aantal bytes voor binaire datatypes\).

## Voorbeeld

**Taken**

| omschrijving | Id |
| :--- | :--- |
| bestek voorzien | 1 |
| frisdrank meebrengen | 2 |
| aardappelsla maken | 3 |
| ... | ... |
| pasta koken | 4000 |

Als we onderstaande query uitvoeren, dan zal heel de tabel worden doorlopen omdat er geen index is bepaald op het veld waarop het zoekcriterium werd ingesteld.

```sql
USE modernways;
SELECT *
FROM taken
WHERE omschrijving LIKE 'aardappel%';
```

Als we deze query met het `EXPLAIN` statement uitvoeren, krijgen we volgende resultaat.

```sql
USE modernways;
EXPLAIN SELECT *
FROM taken
WHERE omschrijving LIKE 'aardappel%';
```

![](../../.gitbook/assets/image%20%2822%29.png)

Als je de tabel taken veel bevraagd waarbij je filtert op de omschrijving is het zinvol om voor deze kolom een index te creëren waardoor de uitvoering een heel stuk sneller zal verlopen.

De grootte van de kolom omschrijving is bij design ingesteld op 50 karakters.

![](../../.gitbook/assets/image%20%2850%29.png)

Voor de index moet je de lengte van het zgn. voorvoegsel bepalen. Soms wordt er gezegd dat je dit zo efficiënt mogelijk dient te doen door de prefex zo kort mogelijk te houden. Hier schuilt wel een gevaar in wanneer de tabel nieuwe data bevat, mogelijk is de index niet meer zo uniek. 

Hoe zoek je nu de ideale lengte van de prefix op?

**Stap 1**: zoek het aantal rijen in de tabel op

```sql
USE modernways;
SELECT COUNT(*)
FROM taken;
```

**Stap 2**: zoek volgens verschillende lengtes de meest unieke prefix

```sql
USE modernways;
SELECT COUNT(DISTINCT LEFT(omschrijving, 20)) uniek
FROM taken;
```

Indien 20 de perfecte lengte van de prefix is, dan gaan we de index weldegenlijk opbouwen.

```sql
USE modernways;
CREATE INDEX idx_omschrijving 
ON taken(omschrijving(20));
```

Binnen de schema navigation kan je nu de index zien.

![](../../.gitbook/assets/image%20%2836%29.png)

Als je nu bovenstaande select-query opnieuw uitvoert zal deze efficiënter en sneller verlopen.

{% hint style="info" %}
[https://www.mysqltutorial.org/mysql-index/mysql-prefix-index/](https://www.mysqltutorial.org/mysql-index/mysql-prefix-index/)
{% endhint %}

