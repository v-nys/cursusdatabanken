# Oefeningen deel 3

We werken verder met de `aptunes`-database. **Activeer deze database in elk script.** Schrijf je stored procedures ook zoals je ze zou schrijven in het algemene venster van Workbench, dus met gebruik van `DELIMITER $$`, enzoverder.

## Extra info

In de uitleg rond `SIGNAL` vind je een link naar de officiële MySQL documentatie. Deze kan je gebruiken om de gepaste MySQL codes en SQL states op te zoeken.

## Vraag 1

Schrijf een stored procedure, `DemonstrateHandlerOrder`, zonder parameters. In deze stored procedure wordt eerst een willekeurig getal tussen 1 en 3 berekend met behulp van `RAND` \(zie vorige reeks oefeningen\). Voeg dan een `IF ... ELSE IF ... ELSE ...` toe. Als het berekende getal 1 is, wordt er een signaal met SQL state '45001' gegeven. Als het getal 2 is, wordt een signaal met SQL state '45002' gegeven en als het getal 3 is, wordt een signaal met state '45003' gegeven.

Voeg daarna in je procedure **exact twee** handlers toe. Eén is specifiek voor SQL state '45002', de andere houdt alle SQL exceptions tegen. De eerste handler handelt de fout af door volgende tekst te `SELECT`-eren: "State 45002 opgevangen. Geen probleem." De tweede handler toont op dezelfde manier volgende bericht: "Een algemene fout opgevangen."

Schrijf hiervoor een script, `0648__Oefening.sql`. Je script moet alleen de definitie van deze stored procedure bevatten. Test achteraf wel \(niet in je script, maar in een apart venster\) of je functie het juiste doet door ze een tiental keer uit te voeren. Je zou beide foutboodschappen te zien moeten krijgen, maar de algemenere zou vaker moeten voorkomen.

{% hint style="info" %}
Na het lezen van de theorie zou duidelijk moeten zijn waarom de tweede handler niet alle fouten afhandelt. Als dat niet zo is, herlees dan het stukje "Handler volgorde" op de pagina "ERROR HANDLING".
{% endhint %}

## Vraag 2

Pas je handler voor de fouten '45001' en '45003' aan zodat er geen `SELECT` meer plaatsvindt. In de plaats daarvan wordt het `MESSAGE_TEXT` attribuut van het signaal aangepast naar `'Ik heb mijn best gedaan!'` en wordt de fout verder niet afgehandeld. Zie hiervoor `RESIGNAL`.

Schrijf hiervoor een script, `0649__Oefening.sql`.

## Vraag 3

Schrijf een stored procedure, `DangerousInsertAlbumreleases`. Deze stored procedure voegt drie willekeurige albumreleases in \(zoals in vorige reeks oefeningen: een combinatie van een willekeurig album en een willekeurige band, maar **niet via de stored procedure die je in de vorige reeks oefeningen hebt geschreven**\), maar signaleert ook met een kans van 1 op 3 een SQL state '45000' na het invoegen van de tweede albumrelease.

Schrijf in deze stored procedure een handler zodat het niet mogelijk is dat er slechts één of twee albumreleases worden ingevoegd. Als er iets mis loopt, mag er geen enkele nieuwe release zijn toegevoegd. In plaats daarvan wordt deze foutboodschap getoond: "Nieuwe releases konden niet worden toegevoegd." Let op: SQL state '45000' is niet het enige foutsignaal dat je hier kan krijgen, want het kan bijvoorbeeld ook zijn dat een willekeurige albumrelease al in het systeem zit. Schrijf je handler zo dat **alle** fouten worden tegengehouden: via `SQLEXCEPTION` uds.

Lees voor je deze oefening maakt zeker de instructies rond het correct uitvoeren van een `ROLLBACK` na.

Schrijf je stored procedure als een script, `0650__Oefening.sql`.

