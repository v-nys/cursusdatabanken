# Oefeningen error handling

We werken verder met de `aptunes`-database. **Activeer deze database in elk script.** Schrijf je stored procedures ook zoals je ze zou schrijven in het algemene venster van Workbench, dus met gebruik van `DELIMITER $$`, enzoverder.

## Extra info

In de uitleg rond [`SIGNAL`](signal.md) vind je een link naar de officiële MySQL documentatie. Deze kan je gebruiken om de gepaste MySQL codes en SQL states op te zoeken.

## Vraag 1

Schrijf een stored procedure, `DemonstrateHandlerOrder`, zonder parameters. In deze stored procedure wordt eerst een willekeurig getal tussen 1 en 3 berekend met behulp van `RAND` (zie vorige reeks oefeningen). Voeg dan een `IF ... ELSE IF ... ELSE ...` toe. Als het berekende getal 1 is, wordt er een signaal met SQL state '45001' gegeven. Als het getal 2 is, wordt een signaal met SQL state '45002' gegeven en als het getal 3 is, wordt een signaal met state '45003' gegeven.

Voeg daarna in je procedure **exact twee** handlers toe. Eén is specifiek voor SQL state '45002', de andere houdt alle SQL exceptions tegen. De eerste handler handelt de fout af door volgende tekst te `SELECT`-eren: "State 45002 opgevangen. Geen probleem." De tweede handler toont op dezelfde manier volgende bericht: "Een algemene fout opgevangen."

Schrijf hiervoor een script, `0648__Oefening.sql`. Je script moet alleen de definitie van deze stored procedure bevatten. Test achteraf wel (niet in je script, maar in een apart venster) of je functie het juiste doet door ze een tiental keer uit te voeren. Je zou beide foutboodschappen te zien moeten krijgen, maar de algemenere zou vaker moeten voorkomen.

{% hint style="info" %}
Na het lezen van de theorie zou duidelijk moeten zijn waarom de tweede handler niet alle fouten afhandelt. Als dat niet zo is, herlees dan het stukje "Handler volgorde" op de pagina "ERROR HANDLING".
{% endhint %}

## Vraag 2

Pas je handler voor de fouten '45001' en '45003' aan zodat er geen `SELECT` meer plaatsvindt. In de plaats daarvan wordt het `MESSAGE_TEXT` attribuut van het signaal aangepast naar `'Ik heb mijn best gedaan!'` en wordt de fout verder niet afgehandeld. Zie hiervoor [`RESIGNAL`](resignal.md).

Schrijf hiervoor een script, `0649__Oefening.sql`.

## Vraag 3

Pas de procedure [VoorbeeldCursors](cursors.md) aan zodat de genres gescheiden worden door een komma en zodat er géén komma na het laatste genre staat. Hierbij mag je de volgorde waarin de genres getoond worden wijzigen indien nodig, maar ze moeten er allemaal wel blijven staan.

**Tip:** gebruik een hulpvariabele om te onthouden dat je het eerste genre al hebt verwerkt.

Noem het script dat deze procedure aanmaakt `0650__Oefening.sql`.

## Vraag 4

Schrijf een stored procedure, `Welcome` die een promotiebericht toont dat je aan toekomstige gebruikers van je systeem zou kunnen tonen. Dit bericht lijst alle genres in het systeem op in volgende vorm: "Welkom bij APTunes! Wij hebben Blues, Classical, Country, Electronic, Folk, Hip-hop, Jazz, New age, Reggae, Rock" Je mag ook veronderstellen dat er niet zo veel genres zijn dat je meer dan 1000 karakters nodig hebt voor het bericht.

![](<../../.gitbook/assets/Screenshot from 2021-05-04 16-17-58.png>)

Noem het script dat deze procedure(s) aanmaakt `0651__Oefening.sql`.

## Vraag 5

Schrijf een stored procedure, `AltWelcome`, die een tweede promotiebericht aan de gebruikers van je systeem zou kunnen tonen. Dit bericht toont automatisch de namen van de drie meest bekende bands in het systeem. Voor ons betekent dit: de drie bands met het hoogste aantal nummers. Dit bericht ziet er bijvoorbeeld zo uit: "Welkom bij APTunes! Wij hebben de nieuwste nummers van matrix innovative portals, engage end-to-end-schemas, integrate front-end functionalities".

**Tip 1**: gebruik een LIMIT clausule om enkel de 3 populairste bands te krijgen.

**Tip 2**: start vanaf een query om alle bands aan hun nummers te koppelen. Breid uit vanaf daar.

![Voorbeelduitvoer van een call van de procedure](<../../.gitbook/assets/Screenshot from 2021-05-04 16-28-54.png>)

Noem het script `0652__Oefening.sql`.
