# SELECT met GROUP BY

Tot nu toe hebben we een relationele databank vooral gebruikt om individuele records bij te houden en op te vragen. Soms willen we echter informatie die niet handelt over individuele records, maar over groepen records. Typisch zijn dit records met dezelfde waarde in bepaalde velden. De oplossing schuilt in een `GROUP BY` clausule.

## basisidee

Met de GROUP BY operator kan je rijen "samenpersen" en de gewenste informatie uit de samengeperste rijen halen. Dit "samenpersen" gebeurt eerst, voor de gewenste informatie wordt geselecteerd. Beeld je in dat er een tussenliggende tabel wordt aangemaakt op basis van de tabel waarin je wenst te zoeken.

Veronderstel dat je onderstaande tabel `Honden` hebt, waarin de leeftijd opgeslagen is als `TINYINT`, de naam als `VARCHAR(50)` en het geslacht als een `ENUM` met waarden `"mannelijk"` en `"vrouwelijk"`:

| naam | leeftijd | geslacht |
| :--- | :--- | :--- |
| Ming | 9 | mannelijk |
| Swieber | 14 | mannelijk |
| Misty | 6 | vrouwelijk |

Informatie die over de rijen gaat kan dan zijn: "hoeveel mannelijke honden zijn er in het systeem?" of "wat is de gemiddelde leeftijd per geslacht?" Deze vragen kan je niet meteen beantwoorden met de eerdere DML-commando's, maar wel met behulp van `GROUP BY`. `Honden GROUP BY Honden.geslacht` moet je zien als een tijdelijke tabel die er als volgt uitziet:

| namen per geslacht | leeftijd per geslacht | geslacht |
| :--- | :--- | :--- |
| \[Ming,Swieber\] | \[8,14\] | mannelijk |
| \[Misty\] | \[5\] | vrouwelijk |

{% hint style="warning" %}
Je moet dit enkel zien als een hulpmiddel om over `GROUP BY` na te denken! Je kan deze tussenliggende tabel niet zomaar produceren. Meer uitleg volgt verderop.
{% endhint %}

De kolom vermeld na `GROUP BY` neemt geen nieuwe vorm aan, maar komt nog één keer voor per waarde. Er is dus precies één rij met de waarde `"mannelijk"` en één rij met de waarde `"vrouwelijk"`. De andere kolommen veranderen eigenlijk van datatype: de kolom voor de naam bevat een sequentie van `VARCHAR(50)` per rij in plaats van een `VARCHAR(50)` per rij. De kolom voor de leeftijd bevat een sequentie van `TINYINT` in plaats een `TINYINT` per rij, wat hier aangegeven is door de verschillende waarden tussen rechte haakjes te zetten. Er is gekozen voor deze notatie omdat dit lijkt op het gebruik van lijsten in de meeste programmeertalen. De kolom voor het geslacht bevat nog steeds waarden uit een `ENUM`, omdat GROUP BY nu juist zo werkt dat er precies één waarde is voor elke rij.

Ter illustratie maken we gebruik van volgend script \(0036\_\_CreateHonden.sql\):

```sql
USE ModernWays;
CREATE TABLE Honden (
Naam VARCHAR(50) CHAR SET utf8mb4 NOT NULL,
Leeftijd TINYINT NOT NULL,
Geslacht ENUM('mannelijk','vrouwelijk')
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

Als je wil weten hoeveel honden van elk geslacht er zijn, schrijf je dit \(0037\_\_SelectHonden.sql\):

```sql
USE ModernWays;
SELECT COUNT(*), Geslacht
FROM Honden
GROUP BY Geslacht;
```

{% hint style="info" %}
Voorlopig onthoud je maar dat `COUNT(*)` vertelt hoeveel resultaten er per groep zijn. Verderop leggen we aggregaatfuncties uit voor de details.
{% endhint %}

Met bovenstaande query zie je per geslacht hoeveel honden er zijn. De tussenliggende tabel is een hulpmiddel om hierover na te denken; volgende code zou niet werken:

```sql
USE ModernWays;
SELECT *
FROM Honden
GROUP BY Geslacht;
```

Dit geeft je een foutmelding, waarvan we de precieze betekenis verderop toelichten.

{% hint style="danger" %}
Dit gedrag is systeemafhankelijk. Het kan zijn dat je wel een resultaat te zien krijgt, maar we beschouwen queries zoals de bovenstaande als ongeldig. Op systemen waarop je wel een resultaat krijgt, is het resultaat ook niet erg betekenisvol.
{% endhint %}

## uitbreiding naar meerdere kolommen

`GROUP BY` hoeft niet gevolgd te worden door één kolom, maar kan door meerdere kolommen gevolgd worden. In dat geval groepeer je records **per unieke combinatie** van kolomwaarden. Je kan bijvoorbeeld dit doen \(0038\_\_SelectHonden.sql\):

```sql
USE ModernWays;
SELECT COUNT(*), Geslacht, Leeftijd
FROM Honden
GROUP BY Geslacht, Leeftijd;
```

Dit toont je hoeveel mannelijke en hoeveel vrouwelijke honden er zijn van elke leeftijd die in het systeem voorkomt. Er zijn bijvoorbeeld 6 vrouwelijke honden van 1 jaar oud en 4 mannelijke honden van 1 jaar oud. We kunnen ter controle ook dit even doen \(0039\_\_SelectHonden.sql\):

```sql
USE ModernWays;
SELECT COUNT(*), Leeftijd
FROM Honden
GROUP BY Leeftijd;
```

Dit toont ons dat er 10 \(dus 6 vrouwelijke en 4 mannelijke\) honden zijn van 1 jaar oud. Anders gezegd: hoe meer kolommen je vermeldt na `GROUP BY`, hoe meer onderverdelingen je zal zien.

