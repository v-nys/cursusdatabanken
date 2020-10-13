# Basisoefeningen

Als je tabellen maakt, zit het niet altijd meteen juist. Vaak probeer je een bepaalde structuur voor je data en verbeter je deze regelmatig. Om je de structuur van je data te bekijken, moet je in MySQL Workbench eerst je databanken refreshen. Daarna kan je je databank openklappen en via rechtermuisklik de structuur van je tabel controleren.

## een kolom voor klassificatie

Klassificatie van boeken is een wetenschap op zich. Er zijn veel systemen voor, maar ze gebruiken allemaal een code van een vrij klein aantal letters om aan te geven in welke cluster een bepaald boek thuishoort.

Schrijf zelf een script dat een verplichte kolom met naam `Categorie` toevoegt aan de bestaande tabel met boeken. De categorie van een boek wordt uitgedrukt in maximaal 40 lettertekens. Dit zijn "gewone" lettertekens die je zou aantreffen in een typische Engelstalige tekst.

Noem je script 0011\_\_Oefening.sql.

## een langere kolom

Blijkbaar hebben we ons vergist! Er bestaan ook systemen waarin langere codes gebruikt worden, met internationale lettertekens. Schrijf zelf een script dat de kolom `Categorie` aanpast zodat je tot 120 internationale lettertekens kan gaan.

Noem je script 0012\_\_Oefening.sql.

## een kolom voor de klasseur

Het is handig om bij te houden wie een boek in het systeem heeft geplaatst. Daarom willen we een extra kolom met de naam `IngevoegdDoor` die maximaal 255 karakters lang is en zeker internationale karakters moet kunnen bevatten. Deze kolom is niet verplicht.

Noem je script 0013\_\_Oefening.sql.

