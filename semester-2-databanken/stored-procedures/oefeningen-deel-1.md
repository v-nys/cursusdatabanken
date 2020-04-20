# Oefeningen stored procedures: deel 1
We werken, net als in de theorie, met de `aptunes`-database. **Activeer deze database in elk script.**
Gebruik telkens het meest specifieke parametertype dat je kan toepassen. Gebruik dus geen `INOUT` parameters als het ook met een gewone `IN` of `OUT` parameter kan.

## Vraag 1
Schrijf een stored procedure `GetLiedjes` met één parameter (bepaal zelf de juiste "richting", het type is `VARCHAR(50)`). Deze toont je alle titels van liedjes waarin een meegegeven stuk tekst voorkomt.

Bijvoorbeeld: `CALL GetLiedjes('web')` toont je alle liedjes in het systeem die het woordje "web" in de titel bevatten (vooraan, achteraan, in het midden,...).

Het outputformaat is:

| Titel |
|-------|
|  ...  | (hier staan normaal meerdere rijen)

## Vraag 2
Schrijf een stored procedure, `NumberOfGenres`, die je vertelt hoe veel verschillende genres er zijn. Het aantal zal een `TINYINT` zijn.

Je moet ze als volgt kunnen oproepen: `CALL NumberOfGenres(@Aantal)`. De procedure toont niets, maar nadat ze is uitgevoerd, moet de gebruiker `SELECT @Aantal` kunnen uitvoeren.

## Vraag 3
Schrijf een stored procedure, `CleanupOldMemberships`. Deze doet twee dingen:

- Ze verwijdert alle lidmaatschappen van muzikanten die beëindigd zijn voor een gegeven datum.
  - Lidmaatschappen met einddatum `NULL` blijven sowieso staan.
- Ze vertelt ons via een parameter van type `INT` hoe veel lidmaatschappen tijdens de uitvoering zijn verwijderd.

Je moet ze als volgt kunnen oproepen: `CALL CleanupOldMemberships(someDate,@numberCleaned)`.

Er verschijnt niets op het scherm wanneer je de stored procedure oproept. Je zou `SELECT @numberCleaned` moeten doen om te weten hoe veel lidmaatschappen verwijderd zijn.

Tip: je kan niet meer zien hoe veel lidmaatschappen verwijderd zijn als ze al weg zijn, dus hou eerst de waarde bij en verwijder dan pas de lidmaatschappen...

## Vraag 4
Een handige toepassing van stored procedures is 
