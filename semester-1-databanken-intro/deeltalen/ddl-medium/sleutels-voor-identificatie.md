# Sleutels in MySQL: motivatie
De tabellen die je tot hiertoe gemaakt hebt in MySQL, groeperen heel veel informatie in één record.
Informatie groeperen is een belangrijk doel van databanken, maar het gebeurt beter pas wanneer de groepering zelf nodig is.
Anders krijg je databanken die meer plaats innemen dan nodig, die makkelijker fouten zullen bevatten en die moeilijker te navigeren zijn.
Het belangrijkste principe om de data pas te groeperen wanneer dat nodig is, is dat van een sleutel.
Dit principe is eerder aan bod gekomen in [de uitleg rond normalisatie](../../normaliseren/README.md).
Hier bekijken we het binnen MySQL.

Met een sleutel kan je elke rij in een tabel aanduiden zonder te verwijzen naar de eigenlijke informatie in die rij.
We wijzen eerst op enkele problemen met de aanpak die we tot hier gehanteerd hebben en leggen dan uit hoe sleutels deze problemen kunnen oplossen.

# Een eerste problematische tabel
Soms hebben twee rijen dezelfde waarden in bepaalde velden, maar gaat het toch over verschillende data.
Dit is een eerste probleem dat we kunnen oplossen met attributen die we aanduiden als sleutels.

Een quizvraag voor de gamers: wat hebben de games God of War, Doom en Tomb Raider met elkaar gemeen?
Antwoord: het zijn allemaal remakes van oude games met dezelfde titel en dezelfde ontwikkelaar.

Als je een tabel van (oude en nieuwe) games aanmaakt, met als kolommen hun titel en ontwikkelaar, zou een stukje van de tabel er dus als volgt kunnen uitzien:

| Titel | Ontwikkelaar |
|-------|--------------|
| Doom | ID Software |
| Doom | ID Software |
| Tomb Raider | Crystal Dynamics |
| Tomb Raider | Crystal Dynamics |
| God of War | SCE Santa Monica |
| God of War | SCE Santa Monica |

Voor SQL is er geen verschil tussen de oude en de nieuwe versies van deze games, maar het gaat in werkelijkheid wel om verschillende zaken.
Je zou het jaar van uitgave als kolom kunnen toevoegen om elke rij uit elkaar te houden.
Of de spelconsole waarop het spel uitkwam.
Of misschien is de uitgever steeds veranderd.
Dan kan je elke rij uniek maken door die toe te voegen.
Maar niets verhindert een ontwikkelaar om twee gelijknamige games meteen na elkaar uit te geven bij eenzelfde uitgever.

Het idee om elke rij uniek te maken is goed, maar je volgt best een voorzichtige aanpak.
Dit kan door een speciale kolom aan de tabel toe te voegen, een primaire sleutel of primary key.
Deze kolom bevat geen informatie over de rij in kwestie, maar dient alleen om een specifieke rij aan te duiden.
Vaak is het gewoon een getal, zoals in dit voorbeeld, waarin de kolom Id een primaire sleutel is:

| Titel | Ontwikkelaar | Id |
|-------|--------------|----|
| Doom | ID Software | 1 |
| Doom | ID Software | 2 |
| Tomb Raider | Crystal Dynamics | 3 |
| Tomb Raider | Crystal Dynamics | 4 |
| God of War | SCE Santa Monica | 5 |
| God of War | SCE Santa Monica | 6 |

Je kan in SQL uitdrukken dat een bepaalde kolom wordt gebruikt als primaire sleutel, zodat je nooit per ongeluk twee rijen kan aanmaken met eenzelfde waarde in deze kolom.
