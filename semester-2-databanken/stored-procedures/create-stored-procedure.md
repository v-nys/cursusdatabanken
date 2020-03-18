# CREATE stored procedure

We baseren ons op de voorbeelddatabase vermeld binnen de rubriek [inleiding](inleiding.md).

Wanneer we onderstaand sql-statement uitvoeren, krijgen we de inhoud van de tabel muzikanten te zien.

```sql
SELECT 
	  Voornaam,
    Familienaam,
    Geboortedatum
FROM 
	  muzikanten
ORDER BY 1,2,3;
```

Resultaat:

![](../../.gitbook/assets/image%20%2835%29.png)

## CREATE PROCEDURE

Als we van bovenstaand sql-statement een stored procedure maken die we ten alle tijde kunnen aanroepen, doen we dit als volgt.

Binnen MySQL kiezen we binnen de sectie "Stored Procedures" via de rechtermuisknop voor "Create Stored Procedure".

![](../../.gitbook/assets/image%20%283%29.png)

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

U voert bovenstaande sql-code toe en kiest vervolgens voor "Apply"

![](../../.gitbook/assets/image%20%2853%29.png)

Wat we nu hebben gedaan is louter een stored procedure gecreëerd onder de naam `GetMuzikanten`.

Om deze stored procedure aan te roepen gebruiken we het `CALL` statement.

```sql
CALL GetMuzikanten();
```

U zal zien dat hetzelfde resultaat wordt weergegeven als bij het gewone sql-statement hierboven.

Als u dezelfde stored procedure in dezelfde sessie opnieuw aanroept, voert MySQL de stored procedure gewoon uit vanuit de cache zonder deze opnieuw te hoeven compileren.

Een stored procedure kan parameters hebben, zodat u er waarden aan kunt doorgeven.U kunt bijvoorbeeld een stored procedure hebben die muzikanten per geboortedatum weergeeft. In dit geval is de geboortedatum dan de parameters van de stored procedure.

Tevens kan een stored procedure controlemechanismen bevatten, zoals IF, CASE en LOOP. Dit komt verder nog aan bod.

