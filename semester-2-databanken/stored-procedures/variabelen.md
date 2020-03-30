# VARIABELEN

Een variabele heeft als bedoeling data tijdelijk te bewaren. 

Binnen een stored procedure is het mogelijk om variabelen te declareren die dan binnen deze stored procedure kunnen gebruikt worden.

## DECLARE

Een variabele declareer je als volg.

```sql
DECLARE naam_variabele datatype(grootte) [DEFAULT default_waarde];
```

De verschillende datatypes kan je vinden op:

{% embed url="https://dev.mysql.com/doc/refman/8.0/en/data-types.html" %}

## SCOPE

Zoals ook het geval bij programmeertalen heeft een variabele een bepaald bereid. Als je een variabele binnen een stored procedure declareert, dan zal deze niet meer bruikbaar zijn wanneer het `END` statement van deze stored procedure wordt bereikt.

Je kan uiteraard meerdere variabelen tegelijk declareren.

Een variabele die met het @-symbool begint is een zgn. sessie-variabele. Deze is beschikbaar zolang de sessie niet is beëindigd.

## VOORBEELD

```sql
USE `aptunes`;
DROP procedure IF EXISTS `GetAantalLidmaatschappen`;

DELIMITER $$
USE `aptunes`$$
CREATE PROCEDURE `GetAantalLidmaatschappen` ()
BEGIN
	DECLARE totalLidmaatschap INT DEFAULT 0;
	
    SELECT COUNT(*)
    INTO totalLidmaatschap
    FROM lidmaatschappen;
    
    SELECT totalLidmaatschap;
END$$

DELIMITER ;
```

Hierbij declareren we een INT variabele totalLidmaatschap, dewelke we dan een waarde geven met het uitvoeren van het SQL-statement, waarna de inhoud van deze variabele via de tweede `SELECT` wordt geselecteerd.

