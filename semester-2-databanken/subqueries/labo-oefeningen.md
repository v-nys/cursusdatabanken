# Labo oefeningen
Start vanaf het gegeven calibratiescript. Dit vult de database `ModernWays` in met onderstaande structuren:

{% hint style="warning" %}
De database die je hier krijgt is niet elegant ontworpen, maar ze maakt de subqueries die we hier zoeken makkelijker uit te schrijven dan een beter opgesplitste database.
{% endhint %}

## Scalaire subqueries

### Oefening 1
Schrijf een script, `0626__Oefening.sql`, dat je alle voornamen van studenten toont die korter zijn dan gemiddeld.

Het formaat is:

| Voornaam |
|---|
| korte voornaam 1 |
| korte voornaam 2 |
| korte voornaam 3 |
| ... |

{% hint style="info" %}
Reminder: in de cursus is een functie terug te vinden om de lengte van een stuk tekst te bepalen. Gebruik het vergrootglas op Gitbook.
{% endhint %}

### Oefening 2
Schrijf een script, `0627__Oefening.sql`, dat je al de recentste evaluaties toont. Dat wil zeggen: alle evaluaties die hebben plaatsgevonden op de laatste dag dat er nog evaluaties waren.

| Studenten\_Id| Vakken\_Id | Cijfer |
|---|---|
| Id 1 | Id 4 |Cijfer 1 |
| Id 2 | Id 5 |Cijfer 2 |
| Id 3 | Id 6 |Cijfer 3 |

### Oefening 3
Schrijf een script, `0628__Oefening.sql`, dat je alle studenten (enkel de `Id`'s) toont die een hoger persoonlijk puntengemiddelde hebben dan het algemene gemiddelde. Het persoonlijk gemiddelde is dus het gemiddelde over alle evaluaties van enkel die student en het algemene gemiddelde is het gemiddelde over alle evaluaties in het algemeen.

| Id |
|---|
| Id 1 |
| Id 2 |
| Id 3 |
| ... | ... |

Tips:
- studenten koppel je eerst aan hun evaluaties via een `inner join` van studenten en evaluaties
- evaluaties van één student neem je dan samen met `group by Studenten.Id`
- gebruik daarna `having` om het gemiddelde van één student te vergelijken met het algemene gemiddelde
  - het algemene gemiddelde vraag je me een scalaire query

## Subqueries die een kolom produceren

### Oefening 4
Schrijf een script, `0629__Oefening.sql`, dat je de voornamen en familienamen toont van alle studenten die aangesloten zijn bij de studentenvereniging. Doe dit **zonder gebruik te maken van JOIN**. (Tip: een student is aangesloten bij de vereniging als er een rol bestaat die naar die student verwijst...)

Het formaat:

| Voornaam | Familienaam |
|---|---|
| Voornaam 1 | Familienaam 1 |
| Voornaam 2 | Familienaam 2 |
| Voornaam 3 | Familienaam 3 |

### Oefening 5
Schrijf een script, `0630__Oefening.sql`, dat je de voornamen toont die voorkomen bij studenten **en** personeel **en** directie.

| Voornaam |
|---|
| Voornaam 1 |
| Voornaam 2 |
| Voornaam 3 |

### Oefening 6
Toon in een script `0631__Oefening.sql` de namen van directieleden die meer verdienen dan om het even welke werknemer, zonder gebruik te maken van `max`.

Het formaat:

| Voornaam | Familienaam |
|---|---|
| Voornaam 1 | Familienaam 1 |
| Voornaam 2 | Familienaam 2 |
| Voornaam 3 | Familienaam 3 |


### Oefening 7
Toon in een script `0632__Oefening.sql` de namen van directieleden die minder verdienen dan minstens één werknemer, zonder gebruik te maken van `max`.

Het formaat:

| Voornaam | Familienaam |
|---|---|
| Voornaam 1 | Familienaam 1 |
| Voornaam 2 | Familienaam 2 |
| Voornaam 3 | Familienaam 3 |

## Derived tables / afgeleide tabellen

### Oefening 8
Toon in een script `0633__Oefening.sql` het laagste puntengemiddelde van alle studenten. Je hoeft de naam van de student er niet bij te tonen.

Het formaat:

| Gemiddelde |
|---|
| Een cijfer | (Hier staat maar één rij!)

### Oefening 9
Toon in een script `0634__Oefening.sql` het gemiddelde loon van personeelsleden per leeftijdscategorie. Dit is een iets lastigere, maar wel realistische query, dus lees aandachtig volgende tips:

- schrijf eerst een query die personen toont met een leeftijdscategorie
  - leeftijdscategorieën zijn per tien jaar, dus iemand van 7 behoort tot de leeftijdscategorie 0, iemand van 12 behoort tot de leeftijdscategorie 10, iemand van 15 ook, iemand van 37 behoort tot de leeftijdscategorie 30, enzovoort
  - start vanaf een query om personen te tonen met hun leeftijd
  - zet de leeftijd om naar een categorie door hem te delen door 10, af te ronden naar beneden (met de functie `floor`) en dan terug te vermenigvuldigen met 10. Zo is floor(15 / 10) * 10 bijvoorbeeld 10.
- gebruik deze query als derived table en zorg dat deze een kolom `Leeftijdscategorie` heeft
- (inner) join deze derived table met de tabel met lonen
- achter de inner join kan je `group by Leeftijdscategorie` schrijven
- en na een group by kan je een gemiddelde nemen met `avg`

Het formaat:

| Leeftijdscategorie | Gemiddeld loon |
|---|---|
| 20 | (een getal) |
| 30 | (een getal) |
| 40 | (een getal) |
| ... | ... |
