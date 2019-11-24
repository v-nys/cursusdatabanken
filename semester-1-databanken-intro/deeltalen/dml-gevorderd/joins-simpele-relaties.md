# JOINs bij simpele relaties
Om de integriteit van de database te bewaren, normaliseren we de gegevens in de database.
Door normalisering geraakt de informatie echter verspreid over meer dan één tabel.
De gebruiker heeft daar echter niet veel aan.
Primaire en vreemde sleutels zeggen de gebruiker niets.
Anders gesteld, een tabel vol getallen zoals onderaan op [de pagina over primary keys](../ddl-medium/sleutels-voor-identificatie.md) is op zich niet leesbaar.
We moeten dus een manier vinden om de informatie weer voor te stellen alsof die uit één tabel komt.

## CROSS JOIN
De "domste" manier om data uit meerdere tabellen te combineren tot data die uit één tabel lijkt te komen, is de "cross join". Deze "plakt" elke rij uit tabel A aan elke rij uit tabel B. Veronderstel bijvoorbeeld volgende tabellen voor taken en voor personen:

| omschrijving | Id |
|--------------|----|
| bestek voorzien | 1 |
| frisdrank meebrengen | 2 |
| aardappelsla maken | 3 |

| voornaam | Id | Taken_Id |
|----------|----|----------|
| Yannick | 1 | 2 |
| Bavo | 2 | 1 |
| Max | 3 | 3 |

Deze kunnen we op deze manier combineren en tonen:

```sql
SELECT *
FROM Taken
CROSS JOIN Personen;
```

Dit levert dan een resultaat dat er als volgt uitziet:

| omschrijving | Taken.Id | voornaam | Personen.Id | Taken_Id |
|--------------|----------|----------|-------------|----------|
| bestek voorzien | 1 | Yannick | 1 | 2 |
| bestek voorzien | 1 | Bavo | 2 | 1 |
| bestek voorzien | 1 | Max | 3 | 3 |
| frisdrank meebrengen | 2 | Yannick | 1 | 2 |
| frisdrank meebrengen | 2 | Bavo | 2 | 1 |
| frisdrank meebrengen | 2 | Max | 3 | 3 |
| aardappelsla maken | 3 | Yannick | 1 | 2 |
| aardappelsla maken | 3 | Bavo | 2 | 1 |
| aardappelsla maken | 3 | Max | 3 | 3 |

Dit bevat nuttige informatie, maar ook rijen waar we niets aan hebben. De interessante rijen zijn die, die een persoon koppelen aan een taak. Om deze te krijgen, gebruiken we normaal `INNER JOIN`.

{% hint style="info" %}
In MySQL is er eigenlijk [geen verschil](https://dev.mysql.com/doc/refman/8.0/en/join.html) tussen een `CROSS JOIN` met een `WHERE` clause en een `INNER JOIN` met een `ON` clause, die we dadelijk zullen bekijken. We kiezen voor de ene of de andere vorm om uit te drukken wat we bedoelen, maar het resultaat zal hetzelfde zijn.
{% endhint %}

## INNER JOIN
Met een `INNER JOIN` worden rijen opgevraagd uit twee tabellen en worden deze verbonden door middel van overlappende sleutels.

Om 1-op-1 relaties te demonstreren, maakten we gebruik van een takenverdeling in een sportclub. Door de tabel Taken en de tabel Leden op te vragen, konden we via de primaire en vreemde sleutels aflezen wie welke taak moest uitvoeren. Het kan ook als volgt, via dit script, dat je 0084__SelectLedenTaken noemt:

```sql
SELECT Leden.Voornaam, Taken.Omschrijving 
FROM Leden
INNER JOIN Taken ON Leden.Id = Taken.Leden_Id
```

Hoe werkt het?
syntax

We denken voorlopig alleen nog maar na over 1-op-1-relaties en 1-op-max-1-relaties. Dit is pseudosyntax, dus je moet zelf overal de juiste namen invullen!

```sql
SELECT <select_list> 
FROM Table_A
INNER JOIN Table_B ON Table_A.Key = Table_B.ForeignKey
```

werking

Voorlopig kan je INNER JOIN als volgt zien:

* de rijen van tabel B worden op alle mogelijke manieren aan rijen van tabel A geplakt (zoals bij `CROSS JOIN`)
* de resulterende rijen die voldoen aan de voorwaarde na ON worden overgehouden
* de geselecteerde kolommen worden overgehouden

Bijvoorbeeld, als we de tabellen (met vier leden en drie taken) gebruiken van eerder, levert de eerste stap ons volgende combinaties van rijen uit de twee tabellen:
Leden.Voornaam	Leden.Id	Taken.Omschrijving	Taken.Id	Taken.Leden_Id
Yannick	1	bestek voorzien 	1	2
Yannick	1	frisdrank meebrengen	2	1
Yannick	1	aardappelsla maken 	3	3
Bavo 	2	bestek voorzien 	1	2
Bavo 	2	frisdrank meebrengen	2	1
Bavo 	2	aardappelsla maken 	3	3
Max 	3	bestek voorzien 	1	2
Max 	3	frisdrank meebrengen	2	1
Max 	3	aardappelsla maken 	3	3
Herve 	4	bestek voorzien 	1	2
Herve 	4	frisdrank meebrengen	2	1
Herve 	4	aardappelsla maken 	3	3

Als we enkel de rijen overhouden die voldoen aan de voorwaarden (d.w.z. Leden.Id en Taken.Leden_Id zijn gelijk), krijgen we volgend resultaat:
Leden.Voornaam	Leden.Id	Taken.Omschrijving	Taken.Id	Taken.Leden_Id
Yannick	1	frisdrank meebrengen	2	1
Bavo 	2	bestek voorzien 	1	2
Max 	3	aardappelsla maken 	3	3

Als we dan enkel de kolommen Leden.Voornaam en Taken.Omschrijving overhouden, kunnen we meteen aflezen wie welke taak moet uitvoeren.
