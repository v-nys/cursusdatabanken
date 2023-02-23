# REPEAT

De `REPEAT` herhalingsstructuur voert code of statements achter elkaar uit tot de conditie waar (`TRUE`) is.

**Syntax**

```sql
REPEAT
    statement(s)
UNTIL [conditie]
END REPEAT
```

De `REPEAT` herhalingsstructuur controleert of de conditie waar (`TRUE`) is na de uitvoering van de statement(s). De gedefinieerde statement(s) worden dus in alle gevallen steeds minstens één keer uitgevoerd. Dit stemt overeen met het gedrag van een `do ... while` in typische programmeertalen. Let wel op: een `do ... while` blijft herhalen **zo lang** iets waar is, een `REPEAT ... UNTIL` herhaalt **tot** iets waar is. Ze zijn evenwaardig, maar de voorwaarde wordt op een omgekeerde manier aangegeven.

Het schema hieronder geeft dit duidelijk weer.

![](../../.gitbook/assets/storedp\_repeat.JPG)

Het principe van de `REPEAT` herhalingsstructuur wordt toegelicht aan de hand van onderstaande stored procedure waarbij nummers van 1 tot 25 worden geconcateneerd (aan elkaar geplakt).

```sql
USE `aptunes`;
DROP procedure IF EXISTS `ConcatenateNumbersViaRepeat`;

DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConcatenateNumbersViaRepeat`()
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE result VARCHAR(90) DEFAULT '';

    REPEAT
        SET result = CONCAT(result,counter,',');
        SET counter = counter + 1;
    UNTIL counter >= 25
    END REPEAT;
    set result = CONCAT(result, counter);

    -- toont het resultaat op het scherm
    SELECT result;
END$$

DELIMITER ;
```

Kort uitgelegd:

* Er worden twee variabelen gedeclareerd, nl. teller en resultaat.
* Zolang de teller niet groter of gelijk is aan 25 worden de statements waarbij de `CONCAT`-functie wordt gebruikt uitgevoerd.
