# Herleiden van ERD's tot tabellen

Elk E-R Diagram kan steeds herleid worden tot een aantal tabellen. Deze herleiding kan de basis vormen van het ontwerp voor een relationele database.

## Strong \(sterke\) entity sets

* De namen van de enkelvoudige attributen vormen de titels voor de kolommen in een tabel.
* Elke rij is de voorstelling van een entity uit de entity set, met in elke kolom de waarde voor het betreffende attribuut.
* Berekenbare attributen schrappen we.
* Samengestelde attributen splitsen we eerst op in enkelvoudige attributen.
* Herhalende attributen plaatsen we in een aparte tabel. We zullen deze tabel van een vreemde sleutel voorzien om naar de tabel voor het entiteittype te verwijzen.
* De attributen die de sleutel van de entity set vormen, worden ook de sleutel voor de tabel. 

{% hint style="warning" %}
Wanneer we SQL schrijven, zullen we typisch een eenvoudig sleutelattribuut `Id` voorzien omdat dat makkelijker werkt, maar wanneer we met ERD's bezig zijn, proberen we eerst een sleutel te vormen aan de hand van een verzameling attributen.
{% endhint %}

## Weak \(zwakke\) entity sets

* Als kolomtitels nemen we de attributen van de zwakke entity set, aangevuld met \(de attributen van\) de primaire sleutel van de bijhorende sterke entity set.
* Samengestelde en herhalende attributen handelen we af zoals eerder.

## Relationship set

* Als kolomtitels nemen we de attributen van de sleutels van de participerende entity sets, aangevuld met de attributen van de relationship zelf.
* Om botsingen te vermijden gebruiken we de naam van de participerende entitye set als prefix, bijvoorbeeld `Klant_Nummer` en `Bank_Nummer` in een relatie `KlantBij`.

## Overbodige tabellen

De tabel die de relatie voorstelt tussen een sterke en een zwakke entity set, is reeds vervat in de tabel die de zwakke entity set voorstelt. We kunnen die tabel weglaten.

## Tabellen combineren

* Als de cardinaliteit van een relationship set 1 op n is, kunnen we de tabel die de relationship set voorstelt weglaten, door de sleutel van de tabel aan de 1-kant op te nemen als foreign key in de tabel aan de n-kant.
* Als de cardinaliteit van een relationship set 1 op 1 is, kunnen we kiezen in welke tabel we een foreign key opnemen.
* Eventuele attributen van de relationship set zelf moeten mee opgenomen worden in de tabel waar de foreign key geplaatst wordt.
* Als de relatie recursief was \(d.w.z. tussen entiteiten van hetzelfde type, bijvoorbeeld om uit te drukken dat een persoon baas is over een andere persoon\), moet de titel van de foreign key-kolom verwijzen naar de rolnaam.
* Totale participatie: dan mag de foreign key niet onbepaald \(`NULL`\) zijn.

## Berekenbare attributen

Berekenbare attributen moeten we schrappen.

## Samengestelde attributen

Samengestelde attributen moeten we opsplitsen in enkelvoudige.

## Herhalende attributen

Voor een herhalend attribuut maken we een nieuwe tabel aan, bestaande uit de primaire sleutel van de oorspronkelijke entity set en het herhalende attribuut.

## Specialisatie/generalisatie

Er is geen "beste", algemene oplossing. Men kan wel verschillende strategieën volgen:

* Eén tabel voor de algemene entity set, met enkel de algemene attributen; per gespecialiseerde entity set een nieuwe tabel bestaande uit de sleutel van de algemene entity set, en de gespecialiseerde attributen.
  * Op deze manier kan men niet garanderen dat de specialisatie gescheiden of totaal is.
* Eén tabel met kolommen voor alle attributen die voorkomen; praktisch zal dit veronderstellen dat er een bepaald attribuut bestaat dat aanduidt tot welke gespecialiseerde entity set een entiteit behoort.
  * Nadeel: er kunnen veel onbepaalde waarden zijn, en men moet hun aanwezigheid programmatorisch afdwingen.
* Eén tabel voor elk van de gespecialiseerde entity sets, zonder tabel voor de algemene entity set; de tabellen van de gespecialiseerde entity sets bevatten naast de gespecialiseerde attributen, alle algemene attributen.
  * Dit kan alleen als de specialisatie totaal is.
  * Wanneer de specialisatie niet gescheiden is, treedt redundantie op van de gegevens uit de algemene entity set.
  * Voordeel: alle gegevens over een entiteit zitten samen in één tabel.

