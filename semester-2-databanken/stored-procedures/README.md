---
description: >-
  MySQL beschikt over drie soorten "opgeslagen programma's": procedures,
  functies en triggers.
---

# Stored programs

Een procedure is vergelijkbaar met een methode in een typische programmeertaal. Je kan er een reeks stappen in formuleren die je later heel makkelijk terug kan uitvoeren. Maar in tegenstelling tot een methode, retourneert een procedure geen waarde. Stored procedures zijn - zoals de naam het zegt - in de database opgeslagen procedures. Deze procedures bestaan uit SQL statements. Bijvoorbeeld een taak waarin wordt geselecteerd uit een tabel met orders die verwerkt moeten worden tot een tabel met verzendingen.

Een voordeel van stored procedures is de snelle verwerking van de data doordat het programma in de database zelf draait en daarmee bovenop de data zit. De verwerking gaat, vooral door het ontbreken van netwerk overhead, sneller dan verwerking door een programma dat op een andere machine draait.

Stored functies zijn, net als stored procedures, stappenplannen om tot een bepaald resultaat te komen, maar hun doel is verschillend. Stored procedures zijn in de eerste plaats bedoeld om taken in een specifieke database makkelijker uitvoerbaar te maken. Functies zijn in de eerste plaats bedoeld om zuiver inputs in outputs te transformeren.

Triggers kunnen activeren voor of na een `INSERT`, `UPDATE` of `DELETE` in een tabel. Je gebruikt triggers om handelingen vast te leggen die moeten gebeuren in combinatie met deze statements, maar die misschien vergeten kunnen worden.
