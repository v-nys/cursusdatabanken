# Typische subqueries

## Subqueries om met een waarde te vergelijken

### scalars
Subqueries komen vaak van pas om één waarde te berekenen die dan gebruikt wordt in een grotere query. Wanneer we een query gebruiken om precies één waarde te produceren, noemen we die waarde een **scalar**.

Volgende query produceert een scalar:

```sql
select avg(Leeftijd) from Personen;
```

Hier is geen `group` by aanwezig, dus het gemiddelde wordt over alle personen beschouwd. We zijn ook alleen geïnteresseerd in de leeftijd. Bijgevolg hebben we uiteindelijk maar één rij en één kolom, dus één uiteindelijk waarde. Met andere woorden: een scalar.

Scalars zijn belangrijk omdat een belangrijke groep subqueries specifiek bedoeld is om één resultaat te produceren. We spreken dan over **scalaire subqueries**. In oude databasesystemen konden subqueries zelfs **alleen** gebruikt worden om te vergelijken met een scalar! In nieuwere systemen kan je een scalaire subquery gewoonweg gebruiken waar je een enkele waarde kan gebruiken.

#### vergelijkingen met behulp van scalaire subqueries

We kunnen een subquery gebruiken om de oudste personen in onze database te tonen, zonder dat we op voorhand weten over welke leeftijdsgroep we het dan hebben.

```sql
select Voornaam, Familienaam
from Personen
where Leeftijd >= (select max(Leeftijd) from Personen) - 10;
```

Als de oudste persoon in onze database 91 jaar oud is, krijgen we info over iedereen die 81 jaar of ouder is. We kunnen ook kijken naar iedereen die "ongeveer de gemiddelde leeftijd" heeft:

```sql
select Voornaam, Familienaam
from Personen
where Leeftijd between (select avg(Leeftijd) from Personen) - 5 AND (select avg(Leeftijd) from Personen) + 5;
```

Er is hier niets speciaals aan `max` of `avg`. Je kan ook andere functies gebruiken die je al kent. Je kan ook andere vergelijkingen gebruiken: `=`, `>`, `<`, `>=`, `<=`, `<>`, `!=`, `<=>` en zelfs `LIKE` zijn mogelijk.

Nog een voorbeeldje:

"Studenten die minder hbben behaald dan het gemiddelde" gaat zo, bij een tabel `Studenten` met onder andere een kolom `Cijfer`:

```sql
select Naam
from Studenten
where Cijfer < (select avg(Cijfer) from Studenten)
```

Je kan in principe gebruik maken van subqueries in om het even welke `WHERE`, niet alleen in een `WHERE` die hoort bij een `SELECT`. **Let op, in MySQL heb je hier een belangrijke beperking:** je kan de tabel niet aanpassen die je gebruikt voor de geneste `SELECT`. Iets als dit, waarbij we de jongste personen willen wissen, gaat dus niet:

```sql
delete from Personen
where Leeftijd = (select min(Leeftijd) from Personen);
```

## Subqueries voor vergelijkingen met lijsten resultaten
Scalaire subqueries zijn niet de enige subqueries die we hebben. Als je subquery één kolom als resultaat produceert, kan je deze kolom gebruiken als een lijst waarden waarmee je wil vergelijken. De meest gebruikte manier om een waarde en een lijst te vergelijken is door na te gaan of de waarde gewoonweg voorkomt in die lijst. Dat is ook wat we eerder deden met het sleutelwoordje `IN`, dus het zal niet verbazen dat `IN` gevolgd mag worden door een subquery die een kolom produceert.


```
select Voornaam, Familienaam
from Personen
where Voornaam in (select distinct Familienaam from Personen);
```

Maar je kan meer doen. Je kan ook vergelijken met de waarden in een lijst door middel van `ANY` en `ALL`. Met `ANY` kan je een vergelijking toepassen op een hele kolom. Ze moet maar één keer slagen en dan zal de `where` slagen.

Bijvoorbeeld:

```
select Voornaam, Familienaam, Leeftijd
from Personen
where Leeftijd = any (select Leeftijd + 50 from Personen);
```

Dit toont je iedereen die exact 50 jaar ouder is dan minstens één andere persoon. Als er bijvoorbeeld niemand 12 jaar oud is, zal je in het resultaat gegarandeerd niemand van 62 tegenkomen, want omgekeerd is niemand exact 50 jaar jonger dan 62.

{% hint style="info" %}
Je kan deze vergelijkingen luidop lezen. Lees hier bijvoorbeeld: "waarvoor de leeftijd exact 50 hoger is dan de leeftijd van **een of andere** persoon.
{% endhint %}

Met `ALL` kan je vergelijken met *alle* waarden. Op volgende manier kan je bijvoorbeeld de oudste personen in je database vinden zonder gebruik te maken van `max`:

```
select Voornaam, Familienaam, Leeftijd
from Personen
where (Leeftijd >= all (select Leeftijd from Personen));
```

{% hint style="info" %}
Lees hier bijvoorbeeld: "waarvoor de leeftijd groter of gelijk is dan de leeftijd van **elke** persoon.
{% endhint %}

## Je subquery "materializen": "afgeleide" tabellen
Een subquery kan naast één waarde of één kolom ook een volledige tabel produceren. Zo'n tabel noemen we een "afgeleide" tabel ("derived table", ook soms "materialized table"). Deze mogelijkheid komt van pas als je informatie in meerdere stappen moet verwerken.

Afgeleide tabellen zijn vooral nuttig als je operaties in stappen moet toepassen. Bijvoorbeeld als je data wil groeperen en daarna verder wil verwerken.

Een voorbeeld: We willen de leeftijd van de "jongste" voornaam in ons systeem bepalen. Zo zijn mensen met de voornaam "Maurice" misschien gemiddeld 64 jaar en mensen met de voornaam "An" misschien gemiddeld 57 jaar. Wat zou de jongst mogelijke leeftijd per naam zijn?

Dit gaat niet:

```sql
select min(avg(Leeftijd))
from Personen
group by Voornaam;
```

Dat komt omdat we met onze `group by` hebben aangegeven dat we onze functies willen toepassen over groepjes. `avg` kan je toepassen op een groepje leeftijden, maar dat levert dan één uitkomst. Daar kan je niet nog een keer `min` op toepassen. Je bedoelt dat `min` over heel de resulterende kolom moet worden toegepast, maar dat wordt zo niet geïnterpreteerd door MySQL.

Wat wel werkt, is dit:

```sql
select min(GemiddeldeLeeftijd)
from
(select avg(Leeftijd) as GemiddeldeLeeftijd
 from Personen
 group by Voornaam) as GemiddeldeLeeftijden
```

Dat komt omdat de `group by` hier enkel zegt dat je in de geneste query je functies per groepje wil bekijken. In de buitenste query gaan de functies weer over heel de geproduceerde kolom. Je hebt het sleutelwoordje `AS` trouwens altijd nodig om je derived table een naam te geven.

{% hint style="info" %}
De informatie die we hier opvragen lijkt misschien wat onzinnig, maar we kunnen er mee verder bouwen. We zouden onze query bijvoorbeeld kunnen uitbreiden om te weten te komen **welke voornaam** de "jongste" is. We doen dat hier niet omdat het afleidt van de essentie.
{% endhint %}

{% hint style="info" %}
Je kan problemen die je oplost met derived tables ook oplossen met views, maar een view is blijvend in je systeem.
{% endhint %}

## Oefening: ontleed volgende complexe subquery
Volgende subquery is een stuk complexer dan wat je moet kunnen schrijven, maar probeer hem eens te lezen en te zien of je de betekenis kan achterhalen.

```
select Voornaam,Familienaam
from Personen
where Familienaam = (select Familienaam
                     from Personen
                     group by Familienaam
                     having count(*) = (select max(Aantal) from (select count(*) as Aantal from Personen group by Familienaam) as Voorkomens));
```
