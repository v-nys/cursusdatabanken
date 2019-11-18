# Labo-oefeningen groeperen en samenvatten

## Calibreren
Voor gebruik je onderstaand script om te garanderen dat je database in de gewenste toestand is en noem je het 0536\_\_CalibrateDB.sql:

TODO invoegen

## Groeperen en tellen

### Oefening 1
Schrijf een script, 0537\_\_Oefening.sql, dat toont hoe veel boeken elke auteur heeft geschreven. Je mag ervan uitgaan dat er geen twee auteurs zijn met dezelfde combinatie van voornaam en achternaam.

Het formaat is (met de juiste hoofding per kolom en een berekende `waarde`, maar met meer rijen):

| voornaam   | familienaam | aantal boeken |
|------------|-------------|---------------|
| waarde     | waarde      | waarde        |

### Oefening 2
Schrijf een script, 0538\_\_Oefening.sql, dat toont hoe veel liedjes van Layla Zoe er in het systeem zitten.

Het formaat is:

| artiest   | totaal aantal liedjes |
|-----------|-----------------------|
| Layla Zoe | waarde                |

## Groeperen en berekenen
### Oefening 1
Schrijf een script, 0539\_\_Oefening.sql, dat je toont:

* hoe oud een huisdier *gemiddeld* is
* hoe oud het oudste huisdier is
* hoe veel huisdieren er zijn

Als je het script uitvoert, moet je de resultaten in volgend formaat te zien krijgen (met de juiste hoofding per kolom en een berekende `waarde`, maar met meer rijen):

| gemiddelde leeftijd | hoogste leeftijd | totaal aantal |
|---------------------|------------------|---------------|
| waarde              | waarde           | waarde        |

### Oefening 2
Schrijf een script, 0540\_\_Oefening.sql, dat per artiest toont hoe veel liedjes van deze artiest in het systeem zitten.

Als je het script uitvoert, moet je de resultaten in volgend formaat te zien krijgen (met de juiste hoofding, maar met meer rijen):

| artiest | aantal liedjes |
|---------|----------------|
| waarde  | waarde         |

### Oefening 3
Schrijf een script, 0541\_\_Oefening.sql, dat je toont hoe alle nummers samen van één artiest zijn beluisterd. Dus als bijvoorbeeld "Stairway to Heaven" 10 keer beluisterd is en "Rock and Roll" 7 keer, dan zijn alle nummers van Led Zeppelin samen 17 keer beluisterd. Jouw script moet dit voor *alle* artiesten uitrekenen.

TODO: gecalibreerde data uitbreiden met kolom voor aantal beluisteringen

| artiest | aantal beluisteringen |
|---------|-----------------------|
| waarde  | waarde                |

### Oefening 4
Schrijf een script, 0542\_\_Oefening.sql, dat alle artiesten toont waar al meer dan 100 keer naar geluisterd is. Het formaat is als volgt:

| artiest | aantal beluisteringen |
|---------|-----------------------|
| waarde  | waarde                |

### Oefening 5
Schrijf een script, 0543\_\_Oefening.sql, dat je de populairste artiesten in het systeem toont. Dit zijn de artiest met het hoogste aantal totale beluisteringen en alle andere artiesten die hooguit tien beluisteringen minder hebben gehaald.

Het formaat is:

| artiest | aantal beluisteringen |
|---------|-----------------------|
| waarde  | waarde                |

### Oefening 6
Schrijf een script, 0544\_\_Oefening.sql, dat je het gemiddeld aantal beluisteringen van nummers van Layla Zoe toont. Het formaat is (met in dit geval exact één rij):

| artiest    | gemiddeld aantal beluisteringen |
|------------|---------------------------------|
| Layla Zoe  | waarde                          |

Doe dit met behulp van `HAVING` (ook als je het anders kan).

### Oefening 7
Schrijf een script, 0545\_\_Oefening.sql, dat je het totaal beluisteringen toont voor elke artiest met minstens 10 karakters in de naam.
**Tip: Hiervoor moet je al wat meer combineren. Je moet ook weten dat `GROUP BY` pas wordt toegepast na `WHERE`.**

Het formaat is (met opnieuw meerdere rijen mogelijk):

| artiest    | totaal aantal beluisteringen |
|------------|------------------------------|
| waarde     | waarde                       |

### Oefening 8
Schrijf een script, 0546\_\_Oefening.sql, dat je het totaal aantal beluisteringen toont voor elke artiest met minstens 10 karakters in de naam, maar enkel als dat aantal groter is dan 100.
**Tip: Hiervoor moet je nog meer combineren. Je moet ook weten dat `HAVING` perfect in combinatie gebruikt kan worden met `WHERE`. Je moet dus het verschil tussen de twee goed zien!**

| artiest    | totaal aantal beluisteringen |
|------------|------------------------------|
| waarde     | waarde                       |

## Korte notaties
### Oefening 1
Schrijf een script, 0547\_\_Oefening.sql, dat nagaat of het totaal aantal beluisteringen van een artiest ofwel 17, ofwel 50, ofwel 100 is. Het formaat is:

| artiest    | specifiek aantal beluisteringen |
|------------|---------------------------------|
| waarde     | 0 of 1                          |

Hier betekent 0 dat het aantal beluisteringen verschilt van 17, 50 en 100 en betekent 1 dat het aantal beluisteringen ofwel 17, ofwel 50, ofwel 100 is.

### Oefening 2
Schrijf een script, 0548\_\_Oefening.sql, dat alle artiesten toont waarvan de naam alfabetisch tussen de 'i' en de 'p' ligt. Zorg ervoor dat elke artiestennaam slechts één keer wordt getoond. Dit moet hoofdletterongevoelig en accentongevoelig zijn en los dit op zonder gebruik te maken van `GROUP BY`.

Het formaat is:

| artiest    |
|------------|
| waarde     |

