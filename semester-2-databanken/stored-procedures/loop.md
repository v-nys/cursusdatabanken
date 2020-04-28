# LOOP

Een herhaling dient, zoals het woord doet veronderstellen, dat code of statements een aantal keer achter elkaar kunnen uitgevoerd worden.

 **Syntax:**

```sql
[loop_benaming:] LOOP
    statement(s)
END LOOP
```

Merk op dat er geen loopconditie aanwezig is. Om de lus te verlaten, schirjf je `LEAVE`, gevolgd door de benaming van de lus die je wil verlaten.

Hieronder een simpel voorbeeld van een stored procedure dewelke als input parameter een aantal wil kennen en het resultaat is dan louter een opsomming van nummers + 1 tot aantal is bereikt.

```sql
USE `aptunes`;
DROP procedure IF EXISTS `loop_`;

DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loop_`(
	IN aantal INT)
BEGIN
	DECLARE i INT DEFAULT 0;
    DECLARE tekst VARCHAR(255) DEFAULT '';
        
    loop_demo:  LOOP
		SET  i = i + 1;
        IF  i >= aantal THEN
			SET  tekst = CONCAT(tekst,i);
            LEAVE  loop_demo;
		ELSE
			SET  tekst = CONCAT(tekst,i,',');
        END  IF;
    END LOOP;
    
    SELECT tekst; 
END$$

DELIMITER ;
```

Om deze stored procedure op te roepen, hanteren we volgend statement. Waarbij we in onderstaand geval vragen om 10 cijfers weer te geven.

```sql
CALL loop_(10);
```

Resultaat:

![](../../.gitbook/assets/loop.JPG)

