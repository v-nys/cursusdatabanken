# GROUP BY: resultaten groeperen
Soms willen we informatie die iets vertelt over alle rijen met eenzelfde waarde in een veld.
De oplossing schuilt in een `GROUP BY` clausule.
Met de GROUP BY operator kan je rijen "samenpersen" en de gewenste informatie uit de samengeperste rijen halen.
Dit "samenpersen" gebeurt eerst, voor de gewenste informatie wordt geselecteerd.
Beeld je in dat er een tussenliggende tabel wordt aangemaakt op basis van de tabel waarin je wenst te zoeken.

Veronderstel dat je onderstaande tabel `Honden` hebt, waarin de leeftijd opgeslagen is als `TINYINT` en de andere twee velden als `varchar(50)`:

| naam | leeftijd | geslacht |
|------|----------|----------|
| Ming | 9        | mannelijk|
| Swieber | 14 |mannelijk|
| Misty | 6 | vrouwelijk |

Informatie die over de rijen gaat kan dan zijn: "hoe veel mannelijke honden zijn er in het systeem?" of "wat is de gemiddelde leeftijd per geslacht?" Deze vragen kan je voor een grotere database niet meteen beantwoorden zonder GROUP BY. GROUP BY Honden.geslacht moet je zien als een tussenliggende tabel die er als volgt uitziet:
namen per geslacht	leeftijd per geslacht	geslacht
[Ming,Swieber]	[8,14]	mannelijk
[Misty]	[5]	vrouwelijk

Merk op: het veld (of de combinatie van velden) na GROUP BY neemt geen nieuwe waarden aan, maar komt nog één keer voor per waarde. Er is dus precies één rij met de waarde man en één rij met de waarde vrouwelijk. De andere kolommen veranderen van datatype: de kolom voor de naam bevat een verzameling van varchar(50) per rij in plaats van een varchar(50) per rij. De kolom voor de leeftijd bevat een verzameling van tinyint in plaats een tinyint per rij, wat hier aangegeven is door de verschillende waarden tussen rechte haakjes te zetten. Ik heb gekozen voor deze notatie omdat dit lijkt op het gebruik van arrays in de meeste programmeertalen. De kolom voor het geslacht bevat nog steeds een gewone varchar(50), omdat GROUP BY nu juist zo werkt dat er precies één waarde is voor elke rij.

Nu kan je iets zeggen over de kolommen met een verzameling met behulp van aggregaatfuncties. Dit zijn functies (en gewone functies heb je al eerder gezien), maar ze werken specifiek op verzamelingen van de normale datatypes. De belangrijkste zijn:

    count
    min
    max
    avg

Met deze code kan je bijvoorbeeld de gemiddelde leeftijd per geslacht in de tabel tonen:

USE ModernWays;

SELECT avg(Honden.Leeftijd)
FROM Honden
GROUP BY Honden.Geslacht;

Met deze code, de hoogste leeftijd per geslacht:

USE ModernWays;
        
SELECT max(Honden.Leeftijd)
FROM Honden
GROUP BY Honden.Geslacht;

En met deze query moet je oppassen:

USE ModernWays;
SELECT Honden.Naam
FROM Honden
GROUP BY Honden.Geslacht;

Op mijn machine geeft dit twee rijen (met telkens één kolom): één met "Ming" en één met "Misty". Onder MySQL wordt er in het algemeen gewoon een naam uit de verzameling mogelijke namen gehaald. In andere SQL-omgevingen werkt dit mogelijk niet en ben je verplicht een aggregaatfunctie toe te passen op de verzamelde waarden.

Je kan ook aggregaatfuncties toepassen wanneer je géén gebruik aan het maken bent van GROUP BY, omdat SELECT niet gewoon data toont, maar eigenlijk een verzameling van rijen teruggeeft en aggregaatfuncties nu net op verzamelingen werken. Dus dit gaat ook:

USE ModernWays;
SELECT count(*)
FROM Honden;

Dit laatste is zou hetzelfde resultaat opleveren als je count(*) zou vervangen door count(Honden.Naam) of count(Honden.Leeftijd) of count(Honden.Geslacht). Dat komt omdat count gewoon het aantal rijen telt. Dat aantal is (zonder bijkomende operatoren zoals DISTINCT, zie later) altijd hetzelfde, ongeacht welke kolom je selecteert.
