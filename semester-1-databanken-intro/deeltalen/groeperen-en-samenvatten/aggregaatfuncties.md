# aggregaatfuncties

We hebben `GROUP BY` geïllustreerd met een nieuw soort output, `COUNT(*)`. Dit is geen speciale syntax voor één toepassing, maar is een voorbeeld van een **aggregaatfunctie**. Je hebt al kennisgemaakt met gewone functies zoals `CONCAT`, `LENGTH` en `SUBSTRING`. Met dergelijke functies kon je waarden berekenen uit bestaande waarden. Aggregaatfuncties zijn gelijkaardig, maar ze berekenen waarden uit **groepen van records**. Op deze pagina bieden we een overzicht van aggregaatfuncties die je vaak zal tegenkomen, maar weet dat er nog bestaan.

## aggregaatfunctie: `COUNT`

`COUNT` krijgt als invoer een lijst rijen en zegt hoe veel niet-`NULL` elementen er in deze lijst zitten.

De simpelste toepassing is het tellen val al je records, zoals hier in 0040\_\_SelectHOnden.sql:

```sql
USE ModernWays;
SELECT COUNT(*)
FROM Honden;
```

We schrijven in deze toepassing meestal `COUNT(*)` voor het gemak, maar in principe kan je tussen de haakjes om het even welke naam van een kolom die geen `NULL` toestaat uit je lijst met resultaten zetten.

## aggregaatfunctie: `SUM`

Deze aggregaatfunctie krijgt een expressie en berekent voor de som van het toepassen van deze expressie voor elk record. Een eenvoudig voorbeeld van een expressie is hier \(in 0041\_\_SelectHonden.sql\) een kolomnaam:

```sql
USE ModernWays;
SELECT SUM(Leeftijd)
FROM Honden;
```

Merk op: hier zal je niet zomaar `*` in plaats van leeftijd kunnen invullen. Je kan de som nemen van getallen, maar niet van om het even welk soort data.

Je kan wel iets algemener een expressie \(iets dat je in de context van een bepaald record kan uitrekenen\) invullen, niet gewoon een kolomnaam. Dus je kan ook dit doen:

```sql
USE ModernWays;
SELECT SUM(Leeftijd+1)
FROM Honden;
```

## aggregaatfuncties: `MIN` en `MAX`

Deze aggregaatfuncties krijgen een expressie en berekenen het minimum of het maximum voor het toepassen van deze expressie voor elk record. Een eenvoudig voorbeeld van een expressie is hier \(in 0042\_\_SelectHonden.sql\) een kolomnaam:

```sql
USE ModernWays;
SELECT MAX(Leeftijd)
FROM Honden;
```

Dit vertelt je wat de leeftijd van de oudste hond in het systeem is.

## aggregaatfunctie: `AVG`

Deze aggregaatfunctie krijgt een expressie en berekent het gemiddelde voor het toepassen van deze expressie voor elk record. Een eenvoudig voorbeeld van een expressie is hier \(in 0043\_\_SelectHonden.sql\) een kolomnaam:

```sql
USE ModernWays;
SELECT AVG(Leeftijd)
FROM Honden;
```

## combineren van aggregaatfuncties en niet-geaggregeerde expressies

Onder normale omstandigheden kan je geen combinatie maken van geaggregeerde resultaten en niet-geaggregeerde resultaten. Iets als het volgende gaat dus niet:

```sql
USE ModernWays;
SELECT COUNT(*), Naam
FROM Honden;
```

De exacte logica hier achter zie je later. Voorlopig volstaat het om te weten dat je ofwel een resultaat per record, ofwel over een verzameling records toont.

