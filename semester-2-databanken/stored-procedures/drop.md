# DROP

Met dit statement verwijder je de stored procedure uit de database.

```sql
DROP PROCEDURE [IF EXISTS] storedprocedure_name;
```

Het is aan te raden om het `IF EXISTS` onderdeel in te bouwen, gezien indien de stored procedure niet zou bestaan, er een error wordt gegenereerd.

Verwijzende naar de aangemaakte stored procedure binnen het onderdeel CREATE, hieronder voor de volledigheid dit statement opnieuw.

```sql
DELIMITER $$
USE `aptunes`$$
CREATE PROCEDURE `ToonMuzikanten` ()
BEGIN
    SELECT 
        Voornaam,
        Familienaam,
        Geboortedatum
    FROM 
        Muzikanten
    ORDER BY 1,2,3;
END$$

DELIMITER ;
```

Om deze stored procedure te verwijderen is het voldoende volgend statement uit te voeren.

```sql
DROP PROCEDURE ToonMuzikanten;
```

Indien we de `DROP PROCEDURE` gebruiken zonder de `IF EXISTS` clausule, dan zou dit kunnen resulteren in volgende.

```sql
DROP PROCEDURE eenonbestaandesp;
```

![](../../.gitbook/assets/sp_ifexists.JPG)

Als we ditzelfde statement met de IF EXIST clausule uitvoeren krijgen we volgend resulaat.

```sql
DROP PROCEDURE IF EXISTS eenonbestaandesp;
```

![](../../.gitbook/assets/sp_ifexists2.JPG)

Uiteraard kan je de stored procedure ook verwijderen door de mogelijkheden van MySQL Workbench te benutten.

![](../../.gitbook/assets/drop3.jpg)

Om te bekijken wat er juist zal uitgevoerd worden kies je de optie "review sql".

![](../../.gitbook/assets/drop4.jpg)

Volgend resultaat verkrijg je.

![](../../.gitbook/assets/drop5.jpg)

Door op de knop "execute" te klikken verwijder je permanent de stored procedure.

