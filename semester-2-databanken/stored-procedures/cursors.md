# Cursors

In een stored procedure kunnen we resultatenset rij per rij verwerken. Dit lijkt op een `for`-lus of een `foreach`-lus is een typische programmeertaal. Volgende code toont bijvoorbeeld een manier om één stringvoorstelling van alle muziekgenres te bouwen. **Lees eerst onderstaand voorbeeld zonder je zorgen te maken over de zaken die je nog niet hebt gezien. Lees daarna de de opmerkingen en zoek de onderdeeltjes waarover gesproken op in de code.**

```sql
DROP procedure IF EXISTS `VoorbeeldCursors`;

DELIMITER $$
USE `aptunes`$$
CREATE PROCEDURE `VoorbeeldCursors` (INOUT inoutGenresList VARCHAR(1000))
BEGIN
  DECLARE done INTEGER DEFAULT 0;
  DECLARE currentGenre VARCHAR(50) DEFAULT "";
  DECLARE genreCursor CURSOR FOR SELECT Naam FROM Genres;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN genreCursor;
  getGenre: LOOP
    FETCH genreCursor INTO currentGenre;
    IF done = 1
    THEN
      LEAVE getGenre;
    END IF;
    SET inoutGenresList = CONCAT(currentGenre,";",inoutGenresList);
    END LOOP getGenre;
  CLOSE genreCursor;

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

We hebben dus eerst een cursor gedeclareerd om de verschillende genres te doorlopen. Dit moet je zien als een verwijzing naar een resultaat van de bijbehorende query. De query is op dit punt nog niet uitgevoerd.

We hebben ook een `NOT FOUND HANDLER` gedeclareerd. Dit is een soort error handler die zal activeren wanneer de cursor voorbij het laatste beschikbare resultaat gaat.

Hierna openen we de cursor door het `OPEN`-statement. Dit voert de query uit die de resultaten produceert, in dit geval `SELECT Naam FROM Genres`.

Dan behandelen we de lijst met genres en concateneren we deze met als tussenvoegsel een puntkomma (;). De `FETCH` instructie haalt telkens de volgende rij op uit de resultaten.

In deze lus gebruiken we de `done`-variabele om na te gaan of er nog een naam van een genre voorkomt in de lijst. Indien deze op `TRUE` staat, zijn we klaar. We sluiten hier dan ook de cursor via `CLOSE`. Hier maakt dat niet veel uit, want een cursor sluit vanzelf wanneer de `END` bereikt wordt voor de `BEGIN`.

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
