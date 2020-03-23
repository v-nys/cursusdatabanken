# DROP

Met dit statement verwijder je de stored procedure uit de database.

```sql
DROP PROCEDURE [IF EXISTS] storedprocedure_name;
```

Het is aan te raden om het `IF EXIST` onderdeel in te bouwen, gezien indien de stored procedure niet zou bestaan, er een error wordt gegenereerd. 

Verwijzende naar de aangemaakte stored procedure binnen het onderdeel CREATE, hieronder voor de volledigheid dit statement opnieuw.

```sql
DELIMITER $$
USE `aptunes`$$
CREATE PROCEDURE `GetMuzikanten` ()
BEGIN
	SELECT 
		  Voornaam,
		Familienaam,
		Geboortedatum
	FROM 
		  muzikanten
	ORDER BY 1,2,3;
END$$

DELIMITER ;
```

Om deze stored procedure te verwijderen is het voldoende volgend statement uit te voeren.

```sql
DROP PROCEDURE GetMuzikanten;
```

Indien we de `DROP PROCEDURE` gebruiken zonder de `IF EXIST` clausule, dan zou dit kunnen resulteren in volgende.

```sql
DROP PROCEDURE eenonbestaandesp;
```

![](../../.gitbook/assets/sp_ifexists.JPG)

