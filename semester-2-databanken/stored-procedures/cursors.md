# Cursors

Het resultaat van een stored procedure kunnen we een set van rijen die door de query binnen de stored procedure werd gegenereerd rij per rij verwerken. **Lees eerst onderstaand voorbeeld zonder je zorgen te maken over de zaken die je nog niet hebt gezien. Lees daarna de de opmerkingen en zoek de onderdeeltjes waarover gesproken op in de code.**

```sql
USE `aptunes`;
DROP procedure IF EXISTS `VoorbeeldCursors`;

DELIMITER $$
USE `aptunes`$$
CREATE PROCEDURE `VoorbeeldCursors` (
    INOUT inoutGenresList VARCHAR(1000))
BEGIN
  DECLARE ok INTEGER DEFAULT 0;
  DECLARE genre VARCHAR(50) DEFAULT "";

  DECLARE currentGenre
  CURSOR FOR SELECT Naam FROM Genres;

  DECLARE CONTINUE HANDLER
  FOR NOT FOUND SET ok = 1;

  OPEN currentGenre;

  getGenre: LOOP
        FETCH currentGenre INTO genre;
    IF ok = 1
    THEN
            LEAVE getGenre;
        END IF;
    SET inoutGenresList = CONCAT(genre,";",inoutGenresList);
    END LOOP getGenre;

  CLOSE currentGenre;
END$$

DELIMITER ;
```

Deze stored procedure roepen we als volgt aan.

```sql
SET @inoutGenresList = "";
CALL VoorbeeldCursors(@inoutGenresList);
SELECT @inoutGenresList;
```

Als resultaat krijgen we dan.

![](../../.gitbook/assets/sp\_cursors1.JPG)

We hebben dus eerst een `CURSOR` gedeclareerd om de verschillende genres te doorlopen. Daarbij hebben we ook een `NOT FOUND HANDLER` gedeclareerd.

![](../../.gitbook/assets/sp\_cursors2.JPG)

Hierna openen we de `CURSOR` door het `OPEN`-statement. Dit voert de query uit die de resultaten produceert, in dit geval `SELECT Naam FROM Genres`.

![](../../.gitbook/assets/sp\_cursors3.JPG)

Hierna behandelen we de lijst met genres en concateneren we deze met als tussenvoegsel een puntkomma (;). De `FETCH` instructie haalt telkens de volgende rij op uit de resultaten.

![](../../.gitbook/assets/sp\_cursors4.JPG)

In deze lus gebruiken we de `ok`-variabele om na te gaan of er nog een naam van een genre voorkomt in de lijst en indien niet de lus te beëindigen. We sluiten hier ook de cursor via `CLOSE`. Hier maakt dat niet veel uit, want een cursor sluit vanzelf wanneer de `END` bereikt wordt voor de `BEGIN`.&#x20;

{% hint style="info" %}
Schrijf deze code als oefening voor jezelf eens met een exit handler. Dat gaat ook.
{% endhint %}

In bovenstaand voorbeeld werd telkens één waarde in een variabele gelezen. Je kan ook meerdere waarden (uit hetzelfde record) toekennen als volgt:

```sql
DECLARE Voornaam VARCHAR(100); -- variabele MAG zelfde naam hebben als kolom, hoeft niet
DECLARE Achternaam VARCHAR(100);
-- eventueel nog wat code...
DECLARE personenCursor CURSOR FOR
SELECT Voornaam, Familienaam FROM PERSONEN;
/* eventueel nog wat code,
   inclusief het openen van de cursor en het starten van een loop */
FETCH personenCursor INTO Voornaam, Achternaam;
```
