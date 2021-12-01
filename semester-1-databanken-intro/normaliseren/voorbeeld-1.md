---
description: Normaliseren
---

# Voorbeeld

## **Voorbeeld 1**

![](<../../.gitbook/assets/databanken-intro-afbeelding-6 (4) (2).JPG>)

**0e normaalvorm** (onderdeel 1/2)\
****Verzamel alle gegevens (waarbij uiteraard de groepssleutel wordt bepaald) \[...]

![](<../../.gitbook/assets/databanken-intro-afbeelding-7 (1).JPG>)

Hoofd(groeps)sleutel: elk factuur wordt aangeduid door een uniek factuurnummer. Door dit nummer kunnen we dus elke factuur op een eenvoudige wijze terugvinden.

**0e normaalvorm** (onderdeel 2/2)\
\[...] Verwijder alle afleidbare gegevens.

De totaalprijs per artikel kunnen we berekenen (aantal vermenigvuldigen met de eenheidsprijs). \
Ook het totaal bedrag te betalen kunnen we bereken (de verschillende totalen per artikel optellen). \
Het is dus duidelijk dat we de velden “TotaalPerArtikel” en “Totaal- TeBetalen” verwijderen. \
Onze gegevensverzameling ziet er desgevallend als volgt uit:

![](<../../.gitbook/assets/image (26).png>)

**1e normaalvorm**\
****Plaats de herhalende (verzameling) van gegevens in een nieuwe deelgroep en bepaal de sleutel van deze deelgroep.&#x20;

We kunnen de herhalende gegevens bekijken als zijnde die gegevens die verschillende keren voorkomen (tip: meestal staan deze gegevens vermeld in de vorm van een tabel). Hier betreffen de herhalende gegevens:

![](<../../.gitbook/assets/image (68).png>)

Deze velden plaatsen we dus in een afzonderlijke deelgroep.

![](<../../.gitbook/assets/image (64).png>)

De totale gegevensverzameling is nu opgesplitst in twee. \
Door deze opsplitsing van gegevens is er een gegevensverlies, ttz. we weten niet meer welk artikel of welke artikelen we moeten factureren aan welke klant, of welk artikel of welke artikelen onderwerp maken van welke factuur. \
Dit probleem is evenwel door een eenvoudige ingreep te verhelpen, nl. als de sleutel “Factuurnummer” uit tabel 1 ook wordt opgenomen in tabel 2. \
Vanaf dat moment is er geen gegevensverlies meer en kunnen we spreken van de eerste normaalvorm.

![](<../../.gitbook/assets/image (63) (2).png>)

**2e normaalvorm**\
Plaats die gegevens in een nieuwe deelgroep die niet afhankelijk zijn van de groepsleutel.&#x20;

Het is duidelijk dat de sleutel van deelgroep 2 wordt bepaald door “Factuurnummer” en “Artikelnummer”, terwijl de sleutel “Artikelnummer” niet afhankelijk is van de groepssleutel, ttz. van de hoofdsleutel “Factuurnummer”. \
Het is namelijk zo dat de omschrijving of eenheidsprijs van een artikel niet zal wijzigen bij een andere factuur. Dus artikelomschrijving en eenheidsprijs hangen niet af van artikelnummer en factuurnummer. Hierbij maken we dus weerom een nieuwe deelgroep aan.

![](<../../.gitbook/assets/image (2).png>)

**3e normaalvorm**\
Plaats die gegevens in een nieuwe deelgroep, die functioneel afhankelijk zijn van niet sleutelgegevens.

M.a.w. is het de bedoeling om die gegevens op te sporen die binnen een deelgroep niet van de groepsleutel afhankelijk zijn, maar die evenwel wel van een bepaald item binnen deze deelgroep.

Zo bemerken we in deelgroep 1 dat de gegevens betreffende de klant (“Klantnaam”, “Adres” en “Gemeente”) niet afhankelijk zijn van de factuurnummer. Als we ervoor zorgen dat het “Klantnummer” in de nieuw te creëren deelgroepen telkens aanwezig is om gegevensverlies tegen te gaan, kunnen we voormelde gegevens afsplitsen. Hieruit kunnen we dan concluderen dat de klantgegevens niet rechtstreeks afhankelijk zijn van de groepsleutel. Deze gegevens zijn echter wel afhankelijk van de sleutel “Klantnummer”.

![](<../../.gitbook/assets/image (6) (1).png>)

> Functionele afhankelijkheid: Een attribuut A is functioneel afhankelijk van een attribuut B als bij een bepaalde waarde van A slechts één waarde voor B hoort. Bijvoorbeeld de artikelnaam (cfr. voorbeeld 1) is volledig afhankelijk van het artikelnummer. Het is namelijk zo dat bij één artikelnummer slechts één omschrijving of artikelnaam hoort.

## Voorbeeld 2

De administratie van een school hebben o.a. behoefte aan informatie over:

* Wie studeert er in de school?
* Wanneer heeft welke student zich ingeschreven voor welke opleiding?
* In welk lokaal volgen de verschillende studenten welke vakken?

We kunnen dit voorstellen in de vorm van een fiche.&#x20;

Bijvoorbeeld:

![](<../../.gitbook/assets/image (7).png>)

Deze fiches zijn bijvoorbeeld alfabetisch gesorteerd. \
Uiteraard kunnen bestaande fiches worden uitgebreid met nieuwe opleidingen die een bepaalde student volgt, of evt. een verbetering die moet worden aangebracht. Indien een student bijvoorbeeld gedurende één jaar geen enkele opleiding meer heeft gevolgd in de school, dan wordt die fiche verwijderd uit het huidige studentenarchief en bv. ondergebracht in een ander archief.&#x20;

Er zijn met dit systeem van registratie enige problemen, nl.&#x20;

* Het niveau, de modulenaam en lokaal worden op vele verschillende fiches herhaald.
* Wanneer een bepaalde module evt. van naam zou veranderen, dan moet men alle fiches gaan doorlopen en daar waar nodig de wijziging aanbrengen. Het is duidelijk dat dit niet de meest efficiënte manier is en wanneer men op één fiche de wijziging niet zou aanbrengen, dan is de zgn. gegevensverzameling inconsistent.
* Geen nieuwe opleiding kan worden voorzien totdat er een student zich voor de betreffende opleiding heeft ingeschreven.

Al deze problemen kunnen we oplossen door de gegevens in verschillende tabellen onder te brengen, en dit met behulp van de normalisatietechnieken.

**0e normaalvorm** (onderdeel 1/2)\
Verzamel alle gegevens (waarbij uiteraard de groepssleutel wordt bepaald) \[...]

![](<../../.gitbook/assets/image (18).png>)

Hoofd(groeps)sleutel: Elke student kunnen we terugvinden door het nummer dat de student toegewezen krijgt.

**0e normaalvorm** (onderdeel 2/2)\
\[...] Verwijder alle afleidbare gegevens.

Hierbij is het duidelijk dat er geen gegevens afleidbaar zijn.

**1e normaalvorm**\
****Plaats de herhalende (verzameling) van gegevens in een nieuwe deelgroep en bepaal de sleutel van deze deelgroep.&#x20;

De groep student bezit herhalende gegevens. Deze zijn de gegevens betreffende de opleidingen die hij volgt. (Zoals hiervoor reeds aangehaald, staan herhalende gegevens in vele gevallen in tabelvorm.) Door deze gegevens af te splitsen van de gegevensverzameling bekomen we twee afzonderlijke deelgroepen, nl.

![](<../../.gitbook/assets/image (57).png>)

Door deze opsplitsing van gegevens gaat er veel informatie verloren, nl. we weten niet meer welke student zich voor welke opleiding(en) heeft ingeschreven.

Door deze opsplitsing van gegevens gaat er veel informatie verloren, nl. we weten niet meer welke student zich voor welke opleiding(en) heeft ingeschreven.

![](<../../.gitbook/assets/image (43).png>)

Als we de twee tabellen nader bekijken, bemerken we dat de overtolligheid van gegevens nog steeds aanwezig is en ook dat we geen nieuwe opleiding kunnen toevoegen zonder dat het noodzakelijk is dat een student zich voor die opleiding zou inschrijven.

**2e normaalvorm**\
Plaats die gegevens in een nieuwe deelgroep die niet afhankelijk zijn van de groepsleutel.&#x20;

We kunnen hier een afsplitsing doorvoeren. We kunnen concluderen dat een module uniek wordt aangeduid door middel van de modulecode. Dus, kunnen we deze gegevens afsplitsen.

![](<../../.gitbook/assets/image (59).png>)

De afsplitsing is geschied zonder dat er enig verlies van informatie is, door het gebruik van de sleutel modulecode.&#x20;

Het is duidelijk dat nu een nieuwe opleiding kan toegevoegd worden zonder dat voor deze nieuwe opleiding een inschrijving door een student moet zijn geschied.&#x20;

Het probleem van overtollige gegevens is evenwel nog niet volledig opgelost.

**3e normaalvorm**\
Plaats die gegevens in een nieuwe deelgroep, die functioneel afhankelijk zijn van niet sleutelgegevens.

De lokaalcode en lokaalomschrijving wordt telkens herhaald, terwijl deze gegevens functioneel afhankelijk zijn van niet sleutelgegevens.&#x20;

Hierdoor kunnen we nog een afsplitsing doorvoeren.

![](<../../.gitbook/assets/image (69) (1).png>)

Door deze bewerking, zijn alle problemen opgelost.&#x20;

Een nieuw lokaal kan nu ook worden toegevoegd zonder dat er een inschrijving waarbij betreffend lokaal zou moeten worden gebruikt, moest zijn geschied.

{% hint style="info" %}
Door de normalisatietechnieken kunnen gegevens opgesplitst worden zonder dat er zgn. informatieverlies is.

Normaal is er geen overtolligheid van gegevens meer.&#x20;

Wanneer mocht blijken dat er toch nog wijzigingen zouden moeten doorgevoerd worden aan de gegevensstructuur is dit eenvoudiger te verwezelijken wanneer de gegevens inderdaad genormaliseerd zijn dan in een oorspronkelijke algehele gegevensverzameling.
{% endhint %}
