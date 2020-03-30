# Een onafhankelijke subquery

Onafhankelijke subqueries zijn subqueries die je op zich kan uitschrijven en uitvoeren. Dat is handig, want het maakt onafhankelijke subqueries makkelijk te testen. Dit zijn de enige soorten die wij in deze cursus zullen behandelen.

## Eenvoudig voorbeeld

Veronderstel je hebt een tabel `Werknemers` van volgende vorm:

| Id | Voornaam | Familienaam | Kantoornummer |
| :--- | :--- | :--- | :--- |
| 1 | Peter | Spaas | 04.04 |
| 2 | Vincent | Nys | 03.128 |
| 3 | Jef | Inghelbrecht | 04.03 |

Stel dat je ook een tabel `Kantoorruimtes` hebt van deze vorm. `Beamer` geeft aan of er een beamer geïnstalleerd is in het kantoor:

| Id | Kantoornummer | Beamer |
| :--- | :--- | :--- |
| 1 | 04.04 | 0 |
| 2 | 03.128 | 1 |
| 3 | 04.03 | 1 |

Wat als je nu wil weten wie er in een kantoor zit waarin een beamer beschikbaar is? Dan is een geneste query een optie:

```sql
select Voornaam, Familienaam
from Werknemers
where Kantoornummer in (select Kantoornummer from Kantoorruimtes where Beamer);
```

Start van binnen \(de haakjes\) en kijk dan naar buiten: `select Kantoornummer from Kantoorruimtes where Beamer` toont je alle nummers van kantoren met een beamer. Het sleutelwoordje `in` ken je: het zegt of een waarde aanwezig is in een lijst met waarden. In dit geval is die lijst het resultaat van de geneste query. Op deze manier krijgen we te zien wie in een kantoor met beamer zit. We noemen `select Kantoornummer from Kantoorruimtes where Beamer` een **geneste query** of **subquery** omdat het op zich een SQL-query is, maar wel een die ingebed is in een grotere query. Meerbepaald gaat het om een **onafhankelijke subquery**: een subquery die je zo kan uitvoeren. Inderdaad, als je een tabel `Kantoorruimtes` hebt, kan je `select Kantoornummer from Kantoorruimtes where Beamer` op zich schrijven.

> Wat je hier ziet is trouwens een algemene regel: subqueries zetten we tussen haakjes!

{% hint style="info" %}
Toegegeven, deze query had je kunnen vervangen door een query met een `JOIN`, zonder geneste query. Maar dat zou niet werken als je de werknemers niet wou selecteren, maar wel wou deleten.
{% endhint %}

