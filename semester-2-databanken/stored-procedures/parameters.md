# PARAMETERS

Het gebruik van parameters is niet weg te denken bij het gebruik van stored procedures.

Juist door het gebruik van parameters wordt het gebruik van stored procedures heel flexibel.

Er zijn drie mogelijkheden, nl. `IN`, `OUT` en `INOUT`.

### IN parameters

Dit is de standaard.

Net zoals bij methoden binnen een programmeertaal dient een argument worden meegegeven wanneer een stored procedure wordt aangeroepen die één of meerdere parameters verwacht. 

IN betekent dat de waarde die als argument via een andere variabele wordt doorgegeven, niet wijzigt buiten de stored procedure. Enkel binnen de stored procedure kan de waarde van de parameter worden aangepast, zonder dat dit er buiten zijn weerslag.

### OUT paramters

Zoals al doet vermoeden kan de waarde van een OUT-parameter wel binnen de opgeslagen procedure worden gewijzigd. Deze waarde kan dan worden doorgegeven aan het programma dat de stored procedure heeft opgeroepen. 

In tegenstelling tot de `IN parameter`, kan de `OUT parameter` niet worden beïnvloed bij de start.

### INOUT parameters

Dit betreft de cominatie van de `IN parameter` en de `OUT parameter`.

Dus zowel bij de start kan de inhoud worden bepaald en de stored procedure kan deze bij uitvoering ook aanpassen.

## VOORBEELDEN

### IN

```sql
USE `aptunes`;
DROP procedure IF EXISTS `GetAlbums`;

DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAlbums`(IN nameAlbum VARCHAR(100))
BEGIN
	SELECT *
    FROM albums
    WHERE Titel LIKE CONCAT(nameAlbum, '%');
END$$

DELIMITER ;
```

![](../../.gitbook/assets/in.JPG)

### OUT

```sql
USE `aptunes`;
DROP procedure IF EXISTS `GetAlbumsCount`;

DELIMITER $$
USE `aptunes`$$
CREATE PROCEDURE `GetAlbumsCount` (IN nameAlbum VARCHAR(100), OUT total INT)
BEGIN
	SELECT COUNT(*)
    INTO total
    FROM albums
    WHERE Titel LIKE CONCAT(nameAlbum, '%');
END$$

DELIMITER ;
```

![](../../.gitbook/assets/out.JPG)

### INOUT

```sql
USE `aptunes`;
DROP procedure IF EXISTS `SetCounter`;

DELIMITER $$
USE `aptunes`$$
CREATE PROCEDURE `SetCounter` (INOUT counter INT, IN startNumber INT)
BEGIN
	SET counter = counter + startNumber;
END$$

DELIMITER ;
```

![](../../.gitbook/assets/inout.JPG)

