# Aggregaatfuncties

{% hint style="success" %}
[Kennisclip](https://youtu.be/VhBOMD5jc9g) (ondertiteling beschikbaar)
{% endhint %}

Aggregaatfuncties lijken op de functies die je al kent (`substring`, `concat`, `length`, `round`). Het verschil is dat, als je een kolomnaam invult, de aggregaatfunctie op **heel de kolom** wordt toegepast. Anders gezegd, aggregaatfuncties worden niet binnen een rij toegepast, maar over meerdere rijen heen. Voor elke rij wordt er een waarde geproduceerd en een aggregaatfunctie gebruikt al deze waarden samen als invoer.

Op deze pagina geven we een overzicht van de belangrijkste aggregatiefuncties, maar er bestaan er nog.

## calibratie

Voor deze voorbeelden gebruiken we volgende calibratiestap, die je moet opslaan als `0041__CreateHonden.sql`:

```sql
USE ApDB;
CREATE TABLE Honden (
Naam VARCHAR(50) NOT NULL,
Leeftijd INT NOT NULL,
Geslacht ENUM('mannelijk','vrouwelijk') -- "er zijn maar twee mogelijkheden"
);
INSERT INTO Honden (Naam,Leeftijd,Geslacht)
VALUES
("Rose",1,"vrouwelijk"),
("Lacy",7,"vrouwelijk"),
("Phoebe",4,"vrouwelijk"),
("Camilla",14,"vrouwelijk"),
("Betsy",7,"vrouwelijk"),
("Lena",8,"vrouwelijk"),
("Ella",8,"vrouwelijk"),
("Samantha",15,"vrouwelijk"),
("Sophia",7,"vrouwelijk"),
("Abby",4,"vrouwelijk"),
("Lily",10,"vrouwelijk"),
("Biscuit",11,"vrouwelijk"),
("Nori",8,"vrouwelijk"),
("Sam",5,"vrouwelijk"),
("Mika",9,"vrouwelijk"),
("Baby",10,"vrouwelijk"),
("Blondie",14,"vrouwelijk"),
("Leia",10,"vrouwelijk"),
("Mackenzie",10,"vrouwelijk"),
("Trixie",11,"vrouwelijk"),
("Hannah",9,"vrouwelijk"),
("Kallie",5,"vrouwelijk"),
("Maya",14,"vrouwelijk"),
("Inez",15,"vrouwelijk"),
("Gemma",8,"vrouwelijk"),
("Priscilla",9,"vrouwelijk"),
("Zoe",8,"vrouwelijk"),
("Camilla",1,"vrouwelijk"),
("Fiona",9,"vrouwelijk"),
("Marley",11,"vrouwelijk"),
("Betsy",12,"vrouwelijk"),
("Bailey",8,"vrouwelijk"),
("Gia",5,"vrouwelijk"),
("Peanut",4,"vrouwelijk"),
("Fern",4,"vrouwelijk"),
("Tootsie",13,"vrouwelijk"),
("Summer",11,"vrouwelijk"),
("Gidget",3,"vrouwelijk"),
("Brandy",1,"vrouwelijk"),
("Peaches",1,"vrouwelijk"),
("Sophie",11,"vrouwelijk"),
("Cookie",14,"vrouwelijk"),
("Ivy",1,"vrouwelijk"),
("Mackenzie",10,"vrouwelijk"),
("Sammie",9,"vrouwelijk"),
("Sandy",8,"vrouwelijk"),
("Callie",12,"vrouwelijk"),
("Samantha",10,"vrouwelijk"),
("Lola",2,"vrouwelijk"),
("Angel",14,"vrouwelijk"),
("Edie",12,"vrouwelijk"),
("Diamond",5,"vrouwelijk"),
("Bonnie",1,"vrouwelijk"),
("Cinnamon",8,"vrouwelijk"),
("Ella",12,"vrouwelijk"),
("Brooklyn",14,"vrouwelijk"),
("Miley",7,"vrouwelijk"),
("Pebbles",5,"vrouwelijk"),
("Hazel",3,"vrouwelijk"),
("Peaches",7,"vrouwelijk"),
("Bean",6,"vrouwelijk"),
("Bianca",10,"vrouwelijk"),
("Brandy",9,"vrouwelijk"),
("Cleo",8,"vrouwelijk"),
("Sam",9,"vrouwelijk"),
("Precious",2,"vrouwelijk"),
("Star",13,"vrouwelijk"),
("Tessa",15,"vrouwelijk"),
("Callie",6,"vrouwelijk"),
("Daisy",15,"vrouwelijk"),
("Darlene",9,"vrouwelijk"),
("Madison",5,"vrouwelijk"),
("Biscuit",4,"vrouwelijk"),
("Lacy",8,"vrouwelijk"),
("Destiny",4,"vrouwelijk"),
("Olivia",6,"vrouwelijk"),
("Allie",15,"vrouwelijk"),
("Khloe",13,"vrouwelijk"),
("Dolly",14,"vrouwelijk"),
("Bonnie",6,"vrouwelijk"),
("Blossom",7,"vrouwelijk"),
("Jenna",14,"vrouwelijk"),
("Violet",12,"vrouwelijk"),
("Bean",13,"vrouwelijk"),
("Anna",12,"vrouwelijk"),
("Betty",12,"vrouwelijk"),
("Destiny",3,"vrouwelijk"),
("Nina",3,"vrouwelijk"),
("Tilly",14,"vrouwelijk"),
("Dana",10,"vrouwelijk"),
("Ruby",14,"vrouwelijk"),
("Fiona",3,"vrouwelijk"),
("Brutus",8,"mannelijk"),
("Nero",5,"mannelijk"),
("Otto",13,"mannelijk"),
("Rascal",9,"mannelijk"),
("Kane",1,"mannelijk"),
("Odie",9,"mannelijk"),
("Ralph",9,"mannelijk"),
("Tank",14,"mannelijk"),
("Taz",2,"mannelijk"),
("Kobe",5,"mannelijk"),
("Dodge",4,"mannelijk"),
("Aries",11,"mannelijk"),
("Ned",11,"mannelijk"),
("Alex",9,"mannelijk"),
("Bo",10,"mannelijk"),
("Eli",5,"mannelijk"),
("Porter",2,"mannelijk"),
("Duke",6,"mannelijk"),
("Carter",13,"mannelijk"),
("Casper",14,"mannelijk"),
("Brutus",2,"mannelijk"),
("Buddy",12,"mannelijk"),
("Barkley",9,"mannelijk"),
("Theo",5,"mannelijk"),
("Maverick",12,"mannelijk"),
("Buddy",9,"mannelijk"),
("Taz",5,"mannelijk"),
("Harvey",11,"mannelijk"),
("Scout",5,"mannelijk"),
("Rudy",13,"mannelijk"),
("Trapper",15,"mannelijk"),
("Buster",10,"mannelijk"),
("Rocco",4,"mannelijk"),
("Vinnie",1,"mannelijk"),
("Murphy",13,"mannelijk"),
("George",9,"mannelijk"),
("Milo",11,"mannelijk"),
("Kobe",2,"mannelijk"),
("AJ",3,"mannelijk"),
("Cash",11,"mannelijk"),
("Eli",6,"mannelijk"),
("Dane",9,"mannelijk"),
("Theo",13,"mannelijk"),
("Cash",7,"mannelijk"),
("Nelson",3,"mannelijk"),
("Luke",10,"mannelijk"),
("Harvey",4,"mannelijk"),
("Riley",6,"mannelijk"),
("Tyson",9,"mannelijk"),
("Gage",5,"mannelijk"),
("Iggy",2,"mannelijk"),
("Marley",7,"mannelijk"),
("Fritz",15,"mannelijk"),
("Bailey",14,"mannelijk"),
("Porter",3,"mannelijk"),
("King",10,"mannelijk"),
("Snoopy",10,"mannelijk"),
("Lewis",15,"mannelijk"),
("Levi",1,"mannelijk"),
("Leo",10,"mannelijk"),
("Vince",2,"mannelijk"),
("Trapper",13,"mannelijk"),
("Kobe",11,"mannelijk"),
("Simba",11,"mannelijk"),
("Zeus",3,"mannelijk"),
("Flash",15,"mannelijk"),
("Watson",6,"mannelijk"),
("Benji",3,"mannelijk"),
("Frankie",15,"mannelijk"),
("Dane",3,"mannelijk"),
("Finn",1,"mannelijk"),
("Coco",8,"mannelijk"),
("Bailey",11,"mannelijk"),
("Storm",11,"mannelijk"),
("Griffin",2,"mannelijk"),
("Zeus",13,"mannelijk"),
("Boomer",15,"mannelijk");
```

## aggregaatfunctie: `COUNT`

`COUNT` krijgt als invoer een lijst rijen en zegt hoeveel niet-`NULL` elementen er in deze lijst zitten.

De simpelste toepassing is het tellen van al je records, zoals hier in `0042__SelectHonden.sql`:

```sql
USE ApDB;
SELECT COUNT(Naam)
FROM Honden;
```

Dit levert slechts één resultaat, ongeacht hoe veel honden er in de database staan. Dit is anders dan bijvoorbeeld `LENGTH(Naam)`. Die laatste zou één resultaat per hond geven. De reden is dat `COUNT` een aggregaatfunctie is. Ze verzamelt alle waarden in de gegeven kolom `Naam`, telt hoe veel dat er zijn en toont dat resultaat. Namen die twee keer voorkomen, worden twee keer geteld. Let op: `COUNT` telt geen `NULL`-waarden.

Soms wil je gewoon weten hoe veel rijen er in een tabel zijn. Dan gebruik je `COUNT(*)`. Bijvoorbeeld:

```sql
USE ApDB;
SELECT COUNT(*)
FROM Honden;
```

Dit geeft hetzelfde resultaat, want `Naam` was toch een verplichte kolom.

## aggregaatfunctie: `SUM`

Deze aggregaatfunctie krijgt een expressie en berekent voor de som van het toepassen van deze expressie voor elk record. Een eenvoudig voorbeeld van een expressie is hier (in `0043__SelectHonden.sql`) een kolomnaam:

```sql
USE ApDB;
SELECT SUM(Leeftijd)
FROM Honden;
```

Merk op: hier zal je niet zomaar `*` in plaats van `Leeftijd` kunnen invullen. Je kan de som nemen van getallen, maar niet van om het even welk soort data. `SUM` werkt alleen met getallen.

Je kan wel iets algemener een expressie die een getal oplevert invullen, niet gewoon een kolomnaam. Dus je kan ook dit doen:

```sql
USE ApDB;
SELECT SUM(Leeftijd+1)
FROM Honden;
```

{% hint style="info" %}
Wat levert dit dan? De gezamenlijke leeftijd van alle honden, verhoogd met het aantal honden. Niet het meest praktische voorbeeld, maar je moet kunnen zien waarom dit zo is.
{% endhint %}

## aggregaatfuncties: `MIN` en `MAX`

Deze aggregaatfuncties krijgen een expressie en berekenen het minimum of het maximum voor het toepassen van deze expressie voor elk record. Een eenvoudig voorbeeld van een expressie is hier (in `0044__SelectHonden.sql`) een kolomnaam:

```sql
USE ApDB;
SELECT MAX(Leeftijd)
FROM Honden;
```

Dit vertelt je wat de leeftijd van de oudste hond in het systeem is.

## aggregaatfunctie: `AVG`

Deze aggregaatfunctie krijgt een expressie en berekent het gemiddelde voor het toepassen van deze expressie voor elk record. Een eenvoudig voorbeeld van een expressie is hier (in `0045__SelectHonden.sql`) een kolomnaam:

```sql
USE ApDB;
SELECT AVG(Leeftijd)
FROM Honden;
```

## combineren van aggregaatfuncties en niet-geaggregeerde expressies

Onder normale omstandigheden kan je geen combinatie maken van geaggregeerde resultaten en niet-geaggregeerde resultaten. Iets als het volgende gaat dus niet:

```sql
USE ApDB;
SELECT COUNT(*), Naam
FROM Honden;
```

Dit komt omdat je uitvoer nog steeds een tabel is, bestaande uit één aantal rijen en één aantal kolommen. Als je `COUNT(*)` zou toepassen, zou je één rij overhouden en als je `Naam` zou opvragen, zou je even veel rijen overhouden als er honden zijn. Dus als deze query zou werken, zou je op basis van de eerste kolom maar één rij mogen hebben en op basis van de tweede kolom zou je er meerdere hebben. Dat gaat niet. Beide kolommen moeten leiden tot hetzelfde aantal rijen.
