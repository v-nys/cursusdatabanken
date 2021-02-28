# Labo

## Oefeningen

### Tip

Als je tabellen maakt, zit het niet altijd meteen juist. Vaak probeer je een bepaalde structuur voor je data en verbeter je deze regelmatig. Om je de structuur van je data te bekijken, moet je in MySQL Workbench eerst je databanken refreshen. Daarna kan je je databank openklappen en via rechtermuisklik de structuur van je tabel controleren.

### nummers

Schrijf een script dat een tabel `Nummers` voor muzieknummers toevoegt aan je databank met volgende karakteristieken:

{% hint style="warning" %}
"Variabele lengte" betekent dat de tekst niet altijd de maximale hoeveelheid ruimte in beslag neemt.
{% endhint %}

| Kolomnaam | Type | Maximale lengte | Variabele lengte | Internationale tekens | Verplicht |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Titel | tekst | 100 | JA | zeker nodig | JA |
| Artiest | tekst | 100 | JA | zeker nodig | JA |
| Genre | tekst | 50 | JA | niet zeker nodig | NEE |
| Jaar | tekst | 4 | NEE | niet zeker nodig | NEE |

Sla op als 0019\_\_Oefening.sql.

### huisdieren

Doe hetzelfde voor een tabel `Huisdieren` met huisdieren, met volgende kenmerken:

{% hint style="info" %}
Je hoeft niet in te stellen dat 300 de maximale leeftijd is. Je moet alleen zorgen dat 300 zeker past in de kolom in kwestie, zonder dat er daarbij opslagruimte verspild wordt. Kies dus het kleinste datatype dat groot genoeg of te groot is.
{% endhint %}

| Kolomnaam | Type | Maximale lengte | Variabele lengte | Internationale tekens | Verplicht |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Naam | tekst | 100 | JA | zeker nodig | JA |
| Leeftijd | een geheel positief getal | tot 300 jaar | NVT | NVT | JA |
| Soort | tekst | 50 | JA | niet zeker nodig | JA |
| Baasje | tekst | 100 | JA | zeker nodig | JA |

Sla op als 0020\_\_Oefening.sql.

### data nummers

Plaats volgende data in je tabel met muzieknummers:

1. het nummer "John the Revelator" van de groep "Larkin Poe". Het genre is "Blues" en het verschijningsjaar is 2017.

2. het nummer "Missionary Man" van de groep "Ghost". Het genre is "Metal" en het verschijningsjaar is 2016.

Sla op als 0021\_\_Oefening.sql.

### data huisdieren

Plaats volgende data in je tabel met huisdieren:

1. Ming, 9 jaar oud, is de hond van Christiane
2. Bientje, 12 jaar oud, is de kat van Esther
3. Misty, 7 jaar oud, is de hond van Vincent

Sla op als 0022\_\_Oefening.sql.

### zoekopdracht huisdieren

{% hint style="info" %}
Je hebt hier de `concat` functie nodig, uitgelegd op [de pagina over SELECT](../dml/select/).
{% endhint %}

Toon met een `SELECT` de duo's met huisdieren en baasjes in het formaat `H+B`, gerangschikt volgens de leeftijd van het huisdier.

De juiste oplossing toont volgende rijen in MySQL Workbench, in exact deze volgorde:

| \(wat hier staat is niet belangrijk\) |
| :--- |
| M+V |
| M+C |
| B+E |

Sla op als 0023\_\_Oefening.sql.

## een kolom voor klassificatie

Klassificatie van boeken is een wetenschap op zich. Er zijn veel systemen voor, maar ze gebruiken allemaal een code van een vrij klein aantal letters om aan te geven in welke cluster een bepaald boek thuishoort.

Schrijf zelf een script dat een verplichte kolom met naam `Categorie` toevoegt aan de bestaande tabel met boeken. De categorie van een boek wordt uitgedrukt in maximaal 40 lettertekens. Dit zijn "gewone" lettertekens die je zou aantreffen in een typische Engelstalige tekst.

Noem je script 0017\_\_Oefening.sql.

## een kolom voor de klasseur

Het is handig om bij te houden wie een boek in het systeem heeft geplaatst. Daarom willen we een extra kolom met de naam `IngevoegdDoor` die maximaal 255 karakters lang is en zeker internationale karakters moet kunnen bevatten. Deze kolom is niet verplicht.

Noem je script 0018\_\_Oefening.sql.

