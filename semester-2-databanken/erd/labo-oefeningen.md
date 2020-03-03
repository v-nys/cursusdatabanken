# Labo oefeningen

## Oefening 1 \(deel 1\)

We maken een entity-relationshipmodel voor iets als [Trakt](https://trakt.tv/). Dit is een website waarmee je kan bijhouden welke films en series je hebt bekeken of aan het bekijken bent. Teken zelf een voorstel voor een ERD uit, op basis van volgende informatie:

* We willen zowel films als series kunnen opvolgen. Beide hebben titels.
* Zowel films als series kunnen behoren tot één of meer genres.
* Series bestaan uit afleveringen, met individuele releasedatums. We hoeven geen info over seizoenen te kunnen opzoeken.
* Films hebben één releasedatum.
* In elke film en elke aflevering spelen acteurs mee. We willen ook details \(naam, geboortedatum, leeftijd\) over een bepaalde acteur kunnen opzoeken.
* Gebruikers kunnen een rating van 1 tot 5 geven aan films of afleveringen die ze gezien hebben.
* Gebruikers kunnen bijhouden wanneer ze een film of aflevering gezien hebben. Ze kunnen een film of aflevering meermaals bekeken hebben.

### Omzetting naar tabellen

Het ERM houdt zich iets minder bezig met de implementatiedetails. We hebben alle nodige technische achtergrond om deze concepten te vertalen naar tabellen:

* entiteiten worden tabellen
* relaties worden tabellen als de cardinaliteit langs minstens één kant niet exact 1 is
* gewone attributen worden kolommen
* multivalued attributen worden voorgesteld met tabellen met een vreemde sleutel voor de entiteit
* derived attributen worden zelden bijgehouden en worden berekend waar nodig om inconsistentie te vermijden

## Oefening 1 \(deel 2\)

Zet je schema om naar SQL-code. 

