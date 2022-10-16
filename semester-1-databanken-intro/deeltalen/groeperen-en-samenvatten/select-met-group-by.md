# SELECT met GROUP BY

{% hint style="success" %}
[Kennisclip](https://youtu.be/KT9GinlTHM0) (ondertiteling beschikbaar)
{% endhint %}

Eerst hebben we een relationele databank vooral gebruikt om individuele records bij te houden en op te vragen. Via aggregaatfuncties hebben we informatie over alle records gebundeld. Soms zoeken we iets dat in het midden ligt: informatie die niet handelt over individuele records, maar over groepen records. Typisch zijn dit records met dezelfde waarde in bepaalde velden. De oplossing schuilt in een `GROUP BY` clausule.

## basisidee

Met de GROUP BY operator kan je rijen "samenpersen" en de gewenste informatie uit de samengeperste rijen halen. Dit "samenpersen" gebeurt eerst, voor de gewenste informatie wordt geselecteerd. Beeld je in dat er een tussenliggende tabel wordt aangemaakt op basis van de tabel waarin je wenst te zoeken.

Veronderstel dat je onderstaande tabel `Honden` hebt:

{% hint style="warning" %}
In het eerdere calibratiescript staat veel meer data, maar voor een voorbeeld is het handiger minder data te tonen:
{% endhint %}

| naam    | leeftijd | geslacht   |
| ------- | -------- | ---------- |
| Ming    | 10       | mannelijk  |
| Swieber | 14       | mannelijk  |
| Misty   | 7        | vrouwelijk |

Informatie die over groepen records gaat kan dan zijn: "hoeveel mannelijke honden zijn er in het systeem?" of "wat is de gemiddelde leeftijd per geslacht?" Deze vragen kan je niet meteen beantwoorden met de eerdere DML-commando's, maar wel met behulp van `GROUP BY`. `Honden GROUP BY Honden.Geslacht` moet je zien als een tijdelijke tabel die er als volgt uitziet:

| namen per geslacht | leeftijd per geslacht | geslacht   |
| ------------------ | --------------------- | ---------- |
| \[Ming,Swieber]    | \[10,14]              | mannelijk  |
| \[Misty]           | \[7]                  | vrouwelijk |

{% hint style="warning" %}
Je moet dit enkel zien als een hulpmiddel om over `GROUP BY` na te denken! Je kan deze tussenliggende tabel niet zomaar produceren. Meer uitleg volgt verderop.
{% endhint %}

De kolom na `GROUP BY` neemt geen nieuwe vorm aan, maar komt in de resultaten nog één keer voor per waarde. Er is dus precies één rij met de waarde `"mannelijk"` en één rij met de waarde `"vrouwelijk"`. De andere kolommen veranderen eigenlijk van datatype: de kolom voor de naam bevat een sequentie van `VARCHAR(50)` per rij in plaats van een `VARCHAR(50)` per rij. De kolom voor de leeftijd bevat een sequentie van `TINYINT` in plaats een `TINYINT` per rij, wat hier aangegeven is door de verschillende waarden tussen rechte haakjes te zetten. Er is gekozen voor deze notatie omdat dit lijkt op het gebruik van lijsten in de meeste programmeertalen. De kolom voor het geslacht bevat nog steeds waarden uit een `ENUM`, omdat `GROUP BY` nu juist zo werkt dat er precies één waarde is voor elke rij.

Je kan bij gebruik van `GROUP BY` de data **die in het voorbeeld tussen rechte haakjes staat** (onder default omstandigheden) niet rechtstreeks tonen. Je kan er wel een aggregatiefunctie op toepassen. Als je wil weten wat de gemiddelde leeftijd per geslacht is, schrijf je dit (`0046__SelectHonden.sql`):

```sql
USE ApDB;
SELECT AVG(Leeftijd), Geslacht
FROM Honden
GROUP BY Geslacht;
```

Als je `GROUP BY` gebruikt, wordt een aggregatiefunctie dus **niet meer over heel de kolom** toegepast, maar per groep. `Geslacht` mag je wel tonen want daar heb je op gegroepeerd, dus die data staan niet tussen rechte haakjes.

Een speciaal geval is `COUNT(*)`. Dit vertelt je hoe veel elementen er gegroepeerd zijn.

```sql
USE ApDB;
SELECT COUNT(*), Geslacht
FROM Honden
GROUP BY Geslacht;
```

De tussenliggende tabel is een hulpmiddel om hierover na te denken; volgende code zou niet werken:

```sql
USE ApDB;
SELECT Leeftijd
FROM Honden
GROUP BY Geslacht;
```

Ze levert: "Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'ApDB.Honden.Leeftijd' which is not functionally dependent on columns in GROUP BY clause". Het probleem is dus dat je data groepeert en dan geen aggregaat toepast op de data die in het voorbeeld hierboven tussen rechte haakjes wordt getoond.

## uitbreiding naar meerdere kolommen

`GROUP BY` hoeft niet gevolgd te worden door één kolom, maar kan door meerdere kolommen gevolgd worden. In dat geval groepeer je records **per unieke combinatie** van kolomwaarden. Je kan bijvoorbeeld dit doen (`0047__SelectHonden.sql`):

```sql
USE ApDB;
SELECT COUNT(*), Geslacht, Leeftijd
FROM Honden
GROUP BY Geslacht, Leeftijd
ORDER BY Leeftijd, Geslacht;
```

Dit toont je hoeveel mannelijke en hoeveel vrouwelijke honden er zijn van elke leeftijd die in het systeem voorkomt. Er zijn na uitvoering van het calibratiescript bijvoorbeeld 6 vrouwelijke honden van 1 jaar oud en 4 mannelijke honden van 1 jaar oud. We kunnen ter controle ook dit even doen (`0048__SelectHonden.sql`):

```sql
USE ApDB;
SELECT COUNT(*), Leeftijd
FROM Honden
GROUP BY Leeftijd;
```

Dit toont ons dat er 10 (dus 6 vrouwelijke en 4 mannelijke) honden zijn van 1 jaar oud. Anders gezegd: hoe meer kolommen je vermeldt na `GROUP BY`, hoe meer onderverdelingen je zal zien.

## handige aggregaatfunctie: group\_concat



Eerder zeiden we: "`Honden GROUP BY Honden.geslacht` moet je zien als een tijdelijke tabel die er als volgt uitziet:"

| namen per geslacht | leeftijd per geslacht | geslacht   |
| ------------------ | --------------------- | ---------- |
| \[Ming,Swieber]    | \[10,14]              | mannelijk  |
| \[Misty]           | \[7]                  | vrouwelijk |

Je kan deze tabel niet echt op deze manier tonen, maar je kan ze wel bijna verkrijgen door middel van de group\_concat (aggregaat)functie. Deze aggregeert alle waarden in één groep door middel van concatentie (met andere woorden: ze plakt ze allemaal achter elkaar).

Probeer maar eens volgende query: `select group_concat(Naam), group_concat(Leeftijd), Geslacht from Honden group by Honden.Geslacht`
