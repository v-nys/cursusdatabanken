# Subqueries met tijdelijke opslag

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

Dit kan je wel oplossen door middel van sessievariabelen.

### sessievariabelen

Een sessievariabele is vergelijkbaar met een variabele uit een _general purpose_ programmeertaal zoals C# of TypeScript. Het is met andere woorden een koppeling tussen een naam en een waarde. Je kan een sessievariabele als volgt een waarde geven:

```sql
set @mySessionVariable = (select min(Leeftijd) from Personen);
```

Een sessievariabele begint **altijd** met `@`. Hiermee kan je bovenstaande beperking op subqueries dus ook omzeilen, want je kan het volgende doen:

```sql
set @minimumLeeftijd = (select min(Leeftijd) from Personen);
delete from Personen
where Leeftijd = @minimumLeeftijd;
```

Wanneer je verbinding met de MySQL-databank verbroken wordt, verdwijnen al je sessievariabelen.

## Subqueries voor vergelijkingen met lijsten resultaten

Scalaire subqueries zijn niet de enige subqueries die we hebben. Als je subquery één kolom als resultaat produceert, kan je deze kolom gebruiken als een lijst waarden waarmee je wil vergelijken. De meest gebruikte manier om een waarde en een lijst te vergelijken is door na te gaan of de waarde gewoonweg voorkomt in die lijst. Dat is ook wat we eerder deden met het sleutelwoordje `IN`, dus het zal niet verbazen dat `IN` gevolgd mag worden door een subquery die een kolom produceert.

```sql
select Voornaam, Familienaam
from Personen
where Voornaam in (select distinct Familienaam from Personen);
```

### Temporary tables

Subqueries van bovenstaande vorm kunnen nog meer doen, maar op het eerste gezicht zijn er veel beperkingen waar we hier niet dieper op in gaan. Om hier rond te werken, kan je gebruik maken van _temporary tables_ of tijdelijke tabellen. Deze lijken op sessievariabelen, maar ze dienen niet om een scalar op te slaan. Ze dienen om één of meerdere kolommen tijdelijk op te slaan. Ze verdwijnen ook wanneer je de connectie verbreekt.

Een tijdelijke tabel aanmaken doe je via `CREATE TEMPORARY TABLE`. De syntax is verder dezelfde als voor een gewone tabel. Een tijdelijke tabel is ook alleen maar zichtbaar binnen je eigen verbinding. Er is dus geen risico dat iemand anders tegelijk dezelfde naam voor een tijdelijke tabel gebruikt als jij.

Tijdelijke tabellen kunnen complexere queries behapbaar maken. Veronderstel bijvoorbeeld dat we voor een demografische analyse willen weten welke naam gemiddeld de "jongste" is. We willen dus per naam de gemiddelde leeftijd berekenen en daarvan willen we het minimum.

Dit gaat niet:

```sql
select min(avg(Leeftijd))
from Personen
group by Voornaam;
```

Dat komt omdat we met onze `group by` hebben aangegeven dat we onze functies willen toepassen over groepjes. `avg` kan je toepassen op een groepje leeftijden, maar dat levert dan één uitkomst. Daar kan je niet nog een keer `min` op toepassen. Je bedoelt dat `min` over heel de resulterende kolom moet worden toegepast, maar dat wordt zo niet geïnterpreteerd door MySQL.

Wat wel werkt, is dit:

```sql
-- tijdelijke tabel maken
drop temporary table if exists gemiddeldeLeeftijdPerNaam;
create temporary table gemiddeldeLeeftijdPerNaam (
Naam varchar(200) not null,
Leeftijd int not null
);
-- tijdelijke tabel invullen
insert into gemiddeldeLeeftijdPerNaam
(select Voornaam, avg(Leeftijd) from Personen group by Personen.Voornaam);
-- het resultaat aflezen
select min(Leeftijd) from gemiddeldeLeeftijdPerNaam;
```

{% hint style="warning" %}
Hier zijn kortere oplossingen voor, meerbepaald materialized subqueries, maar deze oplossing is makkelijker verstaanbaar en heeft minder beperkingen.
{% endhint %}
