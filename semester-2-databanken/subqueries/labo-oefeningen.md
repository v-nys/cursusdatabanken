# Labo oefeningen
Start vanaf het gegeven calibratiescript.

(diagram)

{% hint style="warning" %}
De database die je hier krijgt is niet elegant ontworpen, maar ze maakt de subqueries die we hier zoeken makkelijker uit te schrijven dan een beter opgesplitste database.
{% endhint %}

## Scalaire subqueries

### Oefening 1
Schrijf een script, , dat je alle voornamen toont die korter zijn dan gemiddeld.

Het formaat is:

| Voornaam |
|---|
| korte voornaam 1 |
| korte voornaam 2 |
| korte voornaam 3 |
| ... |

### Oefening 2
Schrijf een script, , dat je alle studenten toont die een hoger persoonlijk puntengemiddelde hebben dan het algemene gemiddelde. Het persoonlijk gemiddelde is dus het gemiddelde over alle evaluaties van enkel die student en het algemene gemiddelde is het gemiddelde over alle evaluaties in het algemeen.

| Voornaam | Familienaam |
|---|---|
| voornaam 1 | familienaam 1 |
| voornaam 2 | familienaam 2 |
| voornaam 3 | familienaam 3 |
| ... | ... |

### Oefening 3
Schrijf een script, , dat je al de recentste evaluaties toont. Dat wil zeggen: alle evaluaties die hebben plaatsgevonden op de laatste dag dat er nog evaluaties waren.

| Id | Cijfer |
|---|---|
| Id 1 | Cijfer 1 |
| Id 2 | Cijfer 2 |
| Id 3 | Cijfer 3 |

## Subqueries die een kolom produceren

### Oefening 4
Schrijf een script, , dat je de voornamen en familienamen toont van alle studenten die aangesloten zijn bij de studentenvereniging. Doe dit **zonder gebruik te maken van JOIN**.

### Oefening 5
Schrijf een script, , dat je de voornamen toont die voorkomen bij studenten **en** personeel **en** directie.

### Oefening 6
Toon de namen van directieleden die meer verdienen dan om het even welke werknemer, zonder gebruik te maken van `max`.

### Oefening 7
Toon de namen van directieleden die minder verdienen dan minstens één werknemer, zonder gebruik te maken van `max`.

## Derived tables / afgeleide tabellen

### Oefening 8
Toon het laagste puntengemiddelde van alle studenten. Je hoeft de naam van de student er niet bij te tonen.

### Oefening 9
Toon het gemiddelde loon per leeftijdscategorie. Dit is een iets lastigere, maar wel realistische query, dus lees aandachtig volgende tips:

- schrijf eerst een query die personen koppelt aan een leeftijdscategorie
  - leeftijdscategorieën zijn per tien jaar, dus iemand van 7 behoort tot de leeftijdscategorie 0, iemand van 12 behoort tot de leeftijdscategorie 10, iemand van 15 ook, iemand van 37 behoort tot de leeftijdscategorie 30, enzovoort
  - start vanaf een query om personen te tonen met hun leeftijd
  - zet de leeftijd om naar een categorie door hem te delen door 10, af te ronden naar beneden (met de functie `floor`) en dan terug te vermenigvuldigen met 10. Zo is floor(15 / 10) * 10 bijvoorbeeld 10.
- gebruik deze query als derived table en zorg dat deze een kolom `Leeftijdscategorie` heeft
- (inner) join deze derived table met de tabel met lonen
- achter de inner join kan je `group by Leeftijdscategorie` schrijven
- en na een group by kan je een gemiddelde nemen met `avg`
