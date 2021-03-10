# Labo oefeningen

Start vanaf het gegeven calibratiescript, `0526__CalibrateDB.sql`. Dit vult de database `ApDB` in met onderstaande structuren:

{% file src="../../.gitbook/assets/0526\_\_Calibratie.sql" caption="0526\_\_Calibratie.sql" %}

{% hint style="warning" %}
De database die je hier krijgt is niet elegant ontworpen, maar ze maakt de subqueries die we hier zoeken makkelijker uit te schrijven dan een beter opgesplitste database.
{% endhint %}

## Scalaire subqueries

### Oefening 1

Schrijf een script, `0527__Oefening.sql`, dat je alle voornamen van studenten toont die korter zijn dan gemiddeld.

Het formaat is:

| Voornaam |
| :--- |
| korte voornaam 1 |
| korte voornaam 2 |
| korte voornaam 3 |
| ... |

{% hint style="info" %}
Reminder: in de cursus is een functie terug te vinden om de lengte van een stuk tekst te bepalen. Gebruik het vergrootglas op Gitbook.
{% endhint %}

### Oefening 2

Schrijf een script, `0528__Oefening.sql`, dat je al de recentste evaluaties toont. Dat wil zeggen: alle evaluaties die hebben plaatsgevonden op de laatste dag dat er nog evaluaties waren.

| Studenten\_Id | Vakken\_Id | Cijfer |
| :--- | :--- | :--- |
| Id 1 | Id 4 | Cijfer 1 |
| Id 2 | Id 5 | Cijfer 2 |
| Id 3 | Id 6 | Cijfer 3 |

### Oefening 3

Schrijf een script, `0529__Oefening.sql`, dat je alle studenten \(enkel de `Id`'s\) toont die een hoger persoonlijk puntengemiddelde hebben dan het algemene gemiddelde. Het persoonlijk gemiddelde is dus het gemiddelde over alle evaluaties van enkel die student en het algemene gemiddelde is het gemiddelde over alle evaluaties in het algemeen.

| Id |  |
| :--- | :--- |
| Id 1 |  |
| Id 2 |  |
| Id 3 |  |
| ... | ... |

Tips:

* evaluaties van één student neem je samen door te groeperen op het ID van de student aan wie de evaluatie toebehoort
* gebruik daarna `having` om het gemiddelde van één student te vergelijken met het algemene gemiddelde
  * het algemene gemiddelde vraag je me een scalaire query

## Subqueries die een kolom produceren

### Oefening 4

Schrijf een script, `0530__Oefening.sql`, dat je de voornamen en familienamen toont van alle studenten die aangesloten zijn bij de studentenvereniging. Doe dit **zonder gebruik te maken van JOIN**. \(Tip: een student is aangesloten bij de vereniging als er een rol bestaat die naar die student verwijst...\)

Het formaat:

| Voornaam | Familienaam |
| :--- | :--- |
| Voornaam 1 | Familienaam 1 |
| Voornaam 2 | Familienaam 2 |
| Voornaam 3 | Familienaam 3 |

### Oefening 5

Schrijf een script, `0531__Oefening.sql`, dat je de voornamen toont die voorkomen bij studenten **en** personeel **en** directie.

| Voornaam |
| :--- |
| Voornaam 1 |
| Voornaam 2 |
| Voornaam 3 |

### Oefening 6

Toon in een script `0532__Oefening.sql` de namen van directieleden die meer verdienen dan om het even welke werknemer, zonder gebruik te maken van `max`.

Het formaat:

| Voornaam | Familienaam |
| :--- | :--- |
| Voornaam 1 | Familienaam 1 |
| Voornaam 2 | Familienaam 2 |
| Voornaam 3 | Familienaam 3 |

### Oefening 7

Toon in een script `0533__Oefening.sql` de namen van directieleden die minder verdienen dan minstens één werknemer, zonder gebruik te maken van `max`.

Het formaat:

| Voornaam | Familienaam |
| :--- | :--- |
| Voornaam 1 | Familienaam 1 |
| Voornaam 2 | Familienaam 2 |
| Voornaam 3 | Familienaam 3 |

## Derived tables / afgeleide tabellen

### Oefening 8

Toon in een script `0534__Oefening.sql` het laagste puntengemiddelde van alle studenten. Je hoeft de naam van de student er niet bij te tonen.

Het formaat:

| Gemiddelde |  |
| :--- | :--- |
| Een cijfer | \(Hier staat maar één rij!\) |

