# GERELATEERDE DATA INSERTEN

Stored procedures komen erg van pas als we werken met verschillende records tegelijk die op een bepaalde manier verwant zijn. Bijvoorbeeld als we een nieuwe band toevoegen aan ons databasesysteem. Elke band heeft namelijk leden, dus we gaan minstens één lidmaatschap moeten toevoegen.

Omdat we bijna altijd `AUTO_INCREMENT` toepassen op onze primaire sleutelkolommen, kunnen we dit als volgt doen:

```sql
delimiter $$

use `aptunes`$$
CREATE PROCEDURE `InsertBandAndFounder` (IN bandName VARCHAR(50), IN founderId INT, IN foundingDate DATE, IN founderExitDate DATE)
BEGIN
  insert into Bands (Naam) values (bandName);
  -- let op de volgende regel: last_insert_id
  insert into Lidmaatschappen (Bands_Id, Muzikanten_Id, StartDatum, Einddatum) values (LAST_INSERT_ID(),founderId,foundingDate,founderExitDate);
END$$

delimiter ;
```

Via `CALL InsertBandAndFounder(<naam van de band>, <ID van de stichter>, <datum 1>, <datum 2>)` kunnen we meteen een lidmaatschap aanmaken dat hoort bij deze band. Dat komt omdat `LAST_INSERT_ID()` ons het meest recent automatisch gegenereerde ID oplevert, dus het ID van de nieuwe band.

Het meest recent gegenereerde ID wordt per databaseconnectie bijgehouden. Er is dus geen risico dat het tussen de twee insert statements in verandert omdat een andere gebruiker net op dat moment ook een insert uitvoert.

