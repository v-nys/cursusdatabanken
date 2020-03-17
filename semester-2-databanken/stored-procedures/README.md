# Stored procedures

Een procedure is net hetzelfde als een functie. Maar in tegenstelling tot een functie, retourneert een procedure geen waarde. Een procedure is in het algemeen een reeks instructies die na elkaar moeten worden uitgevoerd. Stored procedures zijn - zoals de naam het zegt - in de database opgeslagen procedures. Deze procedures bestaan uit SQL statements. Bijvoorbeeld een taak waarin wordt geselecteerd uit een tabel met orders die verwerkt moeten worden tot een tabel met verzendingen.

* Een voordeel van stored procedures is de snelle verwerking van de data doordat het programma in de database zelf draait en daarmee bovenop de data zit. De verwerking gaat, vooral door het ontbreken van netwerk overhead, sneller dan verwerking door een programma dat op een andere machine draait.
* Een tweede voordeel bestaat erin dat je SQL statements kan schrijven en testen in een aparte omgeving. Pas als de stored procedures getest zijn en goed bevonden ga ze aanroepen of gebruiken in .NET, Jave, PHP of een andere programmeertaal.

