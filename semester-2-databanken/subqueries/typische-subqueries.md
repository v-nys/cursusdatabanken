# Typische subqueries

## Subqueries om met een waarde te vergelijken

### scalars
Subqueries komen vaak van pas om één waarde te berekenen die dan gebruikt wordt in een grotere query. Wanneer we een query gebruiken om precies één waarde te produceren, noemen we die waarde een **scalar**.

Volgende query produceert een scalar:

```sql
select avg(Leeftijd) from Personen;
```

Hier is geen `group` by aanwezig, dus het gemiddelde wordt over alle personen beschouwd. We zijn ook alleen geïnteresseerd in de leeftijd. Bijgevolg hebben we uiteindelijk maar één rij en één kolom, dus één uiteindelijk waarde. Met andere woorden: een scalar.

Scalars zijn belangrijk omdat een belangrijke groep subqueries specifiek bedoeld is om één resultaat te produceren. We spreken dan over **scalaire subqueries**. In oude databasesystemen konden subqueries zelfs **alleen** gebruikt worden om te vergelijken met een scalar!

#### vergelijkingen met behulp van scalaire subqueries

We kunnen een subquery gebruiken om de oudste personen in onze database te tonen, zonder dat we op voorhand weten over welke leeftijdsgroep we het dan hebben.
TODO: query testen

```sql
select Voornaam, Familienaam
from Personen
where Leeftijd >= (select max(Leeftijd) from Personen) - 10;
```

Als de oudste persoon in onze database 91 jaar oud is, krijgen we info over iedereen die 81 jaar of ouder is. We kunnen ook kijken naar iedereen die "ongeveer de gemiddelde leeftijd" heeft:

TODO: query testen
TODO: between wordt niet vermeld in docs mysql
TODO: kan herhaling vermeden worden via max?

```sql
select Voornaam, Familienaam
from Personen
where Leeftijd between (select avg(Leeftijd) from Personen) - 5 AND (select avg(Leeftijd) from Personen) + 5;
```

Er is hier niets speciaals aan `max` of `avg`. Je kan ook andere functies gebruiken die je al kent. Je kan ook andere vergelijkingen gebruiken: `=`, `>`, `<`, `>=`, `<=`, `<>`, `!=`, `<=>` en zelfs `LIKE` zijn mogelijk.

Nog enkele voorbeeldjes:

"Studenten die minder hbben behaald dan het gemiddelde" gaat zo, bij een tabel `Studenten` met onder andere een kolom `Cijfer`:

```sql
select Naam
from Studenten
where Cijfer < (select avg(Cijfer) from Studenten)
```

Dit is geen ontwerp dat we zouden aanraden. In een goed opgesteld (genormaliseerd) schema staan de cijfers in een aparte tabel met een vreemde sleutel die toestaat te linken aan studenten.

```sql
select Naam
from Studenten
where Cijfer < (select avg(Cijfer) from Studenten inner join Cijfers on Cijfers.Studenten_Id = Studenten.Id)
```

Subqueries kunnen dus ook simpel of complex zijn. Ze kunnen zelfs op meerdere niveaus genest zijn:

"Iedereen met de vaakst voorkomende familienaam" kunnen we als volgt opvragen:
TODO: kan dit misschien met een ORDER BY in plaats van dubbel geneste query?

```sql
select Voornaam, Familienaam
from Personen
where Familienaam = (select Familienaam from Personen group by Familienaam where count(*) = (select max(count(*)) from Personen group by Familienaam));
```

Misschien zijn we op zoek naar variaties op deze familienaam. Dan zouden we dit kunnen schrijven:

```sql
select Voornaam, Familienaam
from Personen
where Familienaam LIKE CONCAT(LEFT((select Familienaam from Personen group by Familienaam where count(*) = (select max(count(*)) from Personen group by Familienaam)),50),'%');
```

{% hint style="info" %}
We zullen geen subqueries met meerdere niveaus van nesting vragen, maar nu weet je dus dat ze bestaan.
{% endhint %}

Je kan trouwens gebruik maken van subqueries in om het even welke `WHERE`, niet alleen in een `WHERE` die hoort bij een `SELECT`. Je zou bijvoorbeeld ook de deelnemer met het laagste aantal stemmen kunnen verwijderen uit een tabel als volgt:

TODO

## Subqueries voor vergelijkingen met lijsten resultaten
(`ANY`, `IN` en `SOME`)

Scalaire subqueries zijn niet de enige subqueries die we hebben. Als je subquery één kolom als resultaat produceert, kan je deze kolom gebruiken als een lijst waarden waarmee je wil vergelijken. De meest gebruikte manier om een waarde en een lijst te vergelijken is door na te gaan of de waarde gewoonweg voorkomt in die lijst. Dat is ook wat we eerder deden met het sleutelwoordje `IN`, dus het zal niet verbazen dat `IN` gevolgd mag worden door een subquery die een kolom produceert.

"Iedereen met een van de vijf populairste achternamen" kunnen we zo schrijven:

```
select Voornaam, Familienaam
from Personen
where Familienaam in (select Familienaam from Personen group by Familienaam order by count(*) limit 5);
```

Maar je kan meer doen. Je kan ook vergelijken met de waarden in een lijst door middel van `ANY` en `ALL`.

Als je een tabel hebt met atletiektijden, kan je bijvoorbeeld de records van elke atleet als volgt opvragen: TODO met ALL

Of als je een hebt met studieresultaten, kan je nagaan wie deelneemt aan tweede zit door na te gaan wie minstens een resultaat onder de 10 heeft: TODO met ANY

## Subqueries om uit een tijdelijke tabel te selecteren
(Zie derived tables? ook "MySQL subquery in the FROM clause" op MySQLTutorial.)
Misschien is het niet de moeite om een view uit te schrijven.

Je hebt dus het sleutelwoordje `AS` nodig om je tijdelijke tabel een naam te geven.
