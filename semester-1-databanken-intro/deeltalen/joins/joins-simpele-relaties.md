# JOINs bij simpele relaties

{% hint style="success" %}
[Kennisclip](https://youtu.be/O6rJEnv65qs)
{% endhint %}

Om de integriteit van de database te bewaren, normaliseren we de gegevens in de database. Door normalisering geraakt de informatie echter verspreid over meer dan één tabel. De gebruiker heeft daar echter niet veel aan. Primaire en vreemde sleutels zeggen de gebruiker niets. Anders gesteld, een tabel vol getallen zoals onderaan op [de pagina over primary keys](../ddl/sleutels-voor-identificatie.md) is op zich niet leesbaar. We moeten dus een manier vinden om de informatie weer voor te stellen alsof die uit één tabel komt.

## CROSS JOIN

De "domste" manier om data uit meerdere tabellen te combineren tot data die uit één tabel lijkt te komen, is de "cross join". Deze "plakt" elke rij uit tabel A aan elke rij uit tabel B. Veronderstel bijvoorbeeld volgende tabellen voor taken en voor personen:

| omschrijving         | Id |
| -------------------- | -- |
| bestek voorzien      | 1  |
| frisdrank meebrengen | 2  |
| aardappelsla maken   | 3  |

| voornaam | Id | Taken\_Id |
| -------- | -- | --------- |
| Yannick  | 1  | 2         |
| Bavo     | 2  | 1         |
| Max      | 3  | 3         |

Deze kunnen we op deze manier combineren en tonen:

```sql
SELECT *
FROM Taken
CROSS JOIN Leden
ORDER BY Taken.Id, Leden.Id;
```

Dit levert dan een resultaat dat er als volgt uitziet:

| omschrijving         | Taken.Id | voornaam | Leden.Id | Taken\_Id |
| -------------------- | -------- | -------- | -------- | --------- |
| bestek voorzien      | 1        | Yannick  | 1        | 2         |
| bestek voorzien      | 1        | Bavo     | 2        | 1         |
| bestek voorzien      | 1        | Max      | 3        | 3         |
| frisdrank meebrengen | 2        | Yannick  | 1        | 2         |
| frisdrank meebrengen | 2        | Bavo     | 2        | 1         |
| frisdrank meebrengen | 2        | Max      | 3        | 3         |
| aardappelsla maken   | 3        | Yannick  | 1        | 2         |
| aardappelsla maken   | 3        | Bavo     | 2        | 1         |
| aardappelsla maken   | 3        | Max      | 3        | 3         |

Dit bevat nuttige informatie, maar ook rijen waar we niets aan hebben. De interessante rijen zijn die, die een persoon koppelen aan een taak. Dat zijn de rijen waarin `Taken.Id` gelijk is aan `Taken_Id` (afkomstig uit `Leden`).

Je kan dus personen koppelen aan hun taak via:

```sql
SELECT *
FROM Taken
CROSS JOIN Leden
WHERE Taken.Id = Taken_Id;
```

Hier moet je `Taken.Id` schrijven omdat zowel `Taken` als `Leden` een kolom `Id` hebben. Door de tabelnaam toe te voegen, maak je duidelijk over welke kolom het precies gaat.

{% hint style="info" %}
In MySQL is er eigenlijk [geen verschil](https://dev.mysql.com/doc/refman/8.0/en/join.html) tussen een `CROSS JOIN` met een `WHERE` clause en een `INNER JOIN` met een `ON` clause, die we dadelijk zullen bekijken. We kiezen voor de ene of de andere vorm om uit te drukken wat we bedoelen, maar het resultaat zal hetzelfde zijn.
{% endhint %}

## INNER JOIN

Dit laatste voorbeeld werkt in MySQL, maar het wordt typisch anders geschreven. Meestal zal `CROSS JOIN` vervangen worden door `INNER JOIN`, terwijl `WHERE` vervangen wordt door `ON`. **Wanneer we twee tabellen willen koppelen zodat samenhorende rijen uit tabel A en tabel B één nieuwe rij opleveren, zullen we deze conventie volgen.**

Het resultaat zal er dus zo uitzien:

```sql
SELECT *
FROM Taken
INNER JOIN Leden
ON Taken.Id = Taken_Id;
```

Het resultaat is hetzelfde, maar in dit scenario wordt `INNER JOIN` verkozen. `ON` is ook geen synoniem voor `WHERE`, want het kan alleen gebruikt worden in een `JOIN`-statement.

{% hint style="info" %}
Om precies te zijn: `ON` kan gebruikt worden in een `JOIN`-statement die geen `CROSS JOIN`-statement is. Er bestaan nog andere soorten `JOIN`s dan `CROSS` en `INNER`, maar die zijn voor een latere cursus.
{% endhint %}
