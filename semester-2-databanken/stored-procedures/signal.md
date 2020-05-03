# SIGNAL/RESIGNAL

Met deze statements kan je een error of waarschuwing geven wanneer de stored procedure wordt uitgevoerd.

## SIGNAL

Een `SIGNAL` statement moet altijd een specifieke `SQLSTATE` waarde beschrijven \(hieronder 45000\).

```sql
USE `aptunes`;
DROP procedure IF EXISTS `CheckLiedjes`;

DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckLiedjes`(
	IN inAlbums_Id INT)
BEGIN
	DECLARE Teller INT;
    
  SELECT COUNT(Albums_Id) INTO Teller
  FROM liedjes
  WHERE Albums_Id = inAlbums_id;
    
  IF(Teller < 1)
  THEN
		SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Geen liedjes voor gekozen album gevonden!';
	END IF;
    
  -- andere code van de stored procedure
    
END$$

DELIMITER ;
```

In bovenstaand voorbeeld hebben we gebruik gemaakt van `MESSAGE_TEXT`, maar dit kan ook `MYSQL_ERRORNO`, `CURSOR_NAME`, edm. zijn.

Wanneer we bovenstaande stored procedure aanroepen met een albums\_id dat niet bestaat, krijgen we onderstaand resultaat.

![](../../.gitbook/assets/sp_signal1.JPG)

## RESIGNAL

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

