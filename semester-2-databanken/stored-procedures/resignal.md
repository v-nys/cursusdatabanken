# RESIGNAL

Met dit statement kan je een fout (gedeeltelijk) afhandelen, maar toch de omringende omgeving op de hoogte brengen van wat zich heeft voorgedaan.

Dit statement is gelijkaardig aan het `SIGNAL`-statement, behalve:

* `RESIGNAL` kan je enkel gebruiken binnen een error of warning handler \(`SIGNAL` daarentegen kan je eender waar gebruiken\)
* Je kan alle attributen weglaten, zelfs de `SQLSTATE`

Hieronder een voorbeeld.

```sql
USE `aptunes`;
DROP procedure IF EXISTS `VoorbeeldResignal`;

DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `VoorbeeldResignal`(
	IN inBands_Id INT,
    IN inAlbums_Id INT)
BEGIN
DECLARE DubbeleWaarde CONDITION FOR 1062;
    
    DECLARE EXIT HANDLER FOR DubbeleWaarde 
    BEGIN
		SELECT CONCAT('Dubbele waarde (',inBands_Id,',',inAlbums_Id,') niet toegestaan') AS message;
        RESIGNAL SET MESSAGE_TEXT = 'RESIGNAL voorbeeld: Dubbele waarde niet toegestaan';
    END;

	INSERT INTO albumreleases(Bands_Id,Albums_Id)
    VALUES(inBands_id,inAlbums_Id);
    
    SELECT COUNT(*)
    FROM albumreleases
    WHERE Bands_Id = inBands_Id;
END$$

DELIMITER ;
```

Wanneer we deze stored procedure aanroepen met een waarde die reeds voorkomt, dan krijgen we niet enkel een gepaste boodschap in het resultatenscherm, maar ook een boodschap in het output-venster.

![](../../.gitbook/assets/sp_resignal1.JPG)
