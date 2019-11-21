# Aggregaatfuncties als windowfuncties

## aggregaatfuncties als windowfuncties

Aggregaatfuncties worden vaak gecombineerd met `GROUP BY`. Het resultaat ervan lijkt intuïtief juist, maar eigenlijk is het niet vanzelfsprekend. De "missing link" tussen aggregaatfuncties en `GROUP BY` is het idee van een **windowfunctie**.

### `COUNT` als windowfunctie

Je kan met `COUNT` tellen per geslacht \(0044\_\_SelectHonden.sql\):

```sql
USE ModernWays;
SELECT COUNT(*), Geslacht
FROM Honden
GROUP BY Geslacht;
```

Dit produceert twee rijen: één voor alle mannelijke honden, één voor alle vrouwelijke honden. Het is niet vanzelfsprekend dat `COUNT(*)` ons dan iets anders dan `2` oplevert, want eerder zagen we dat `COUNT` een aantal rijen als invoer naam en zei hoeveel het er waren.

Hier komt een nieuw aspect bij. `COUNT(*)` geeft, in de aanwezigheid van een `GROUP BY`, het aantal resultaten **per groep**. Dit komt omdat `GROUP BY` de functie `COUNT` laat werken over elk resultaat van de "tussenliggende tabel" van eerder.

Hier zijn, ter herinnering, onze oorspronkelijke tabel en de "tussenliggende tabel" na groepering op leeftijd:

| naam | leeftijd | geslacht |
| :--- | :--- | :--- |
| Ming | 9 | mannelijk |
| Swieber | 14 | mannelijk |
| Misty | 6 | vrouwelijk |

| namen per geslacht | leeftijd per geslacht | geslacht |
| :--- | :--- | :--- |
| \[Ming,Swieber\] | \[8,14\] | mannelijk |
| \[Misty\] | \[5\] | vrouwelijk |

Met de onderste tabel \(die we verkregen hebben door een `GROUP BY` toe te passen\) wordt `COUNT` niet toegepast op alle rijen, maar wordt de aggregaatfunctie toegepast per groepering van data in één tussenliggende rij. Dit is het idee achter het toepassen van aggregaatfuncties als **windowfuncties**.

## Andere functies

Je kan hetzelfde idee toepassen voor de aggregaatfuncties van eerder, d.w.z.:

* `SUM`
* `MIN`
* `MAX`
* `AVG`

## Beperkingen

Wat niet gaat, is het combineren van een aggregatie met iets dat niet geaggregeerd is, zoals dit:

```sql
USE ModernWays;
SELECT COUNT(*), Geslacht
FROM Honden;
```

Dit komt omdat `Geslacht` per hond een waarde heeft, terwijl `COUNT` toegepast wordt over een reeks records. In de oorspronkelijke tabel hierboven kan je de leeftijd per record aflezen, maar heeft het geen zin om `COUNT` per record toe te passen \(want je hebt geen `GROUP BY` die toestaat `COUNT` als windowfunctie te gebruiken\). Hier kan je de leeftijd opvragen, maar kan je `COUNT` niet per groep toepassen.

**In het algemeen geldt dat je alleen velden die gebruikt zijn om te groeperen kan tonen in combinatie met resultaten van windowfuncties.**

{% hint style="warning" %}
Er is hier een uitzondering op, waardoor sommige schijnbaar onaanvaardbare queries toch kunnen uitvoeren. Je hoeft op dit punt niet te weten wat dat betekent, maar als je later teruggrijpt naar deze cursus: de uitzondering betreft waarden die functioneel afhankelijk zijn van de gegroepeerde kolommen.
{% endhint %}

Dit is dus wel geldig \(0045\_\_SelectHonden.sql\):

```sql
USE ModernWays;

SELECT AVG(Honden.Leeftijd), Geslacht
FROM Honden
GROUP BY Honden.Geslacht;
```

Of dit \(0046\_\_SelectHonden.sql\):

```sql
USE ModernWays;

SELECT max(Honden.Leeftijd)
FROM Honden
GROUP BY Honden.Geslacht;
```

En deze gaat normaal niet:

```sql
USE ModernWays;
SELECT Honden.Naam
FROM Honden
GROUP BY Honden.Geslacht;
```

