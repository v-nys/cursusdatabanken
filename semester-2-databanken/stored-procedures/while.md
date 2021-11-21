# WHILE

`WHILE `is ook een herhalingsstructuur die zorgt dat code of statements achter elkaar kunnen uitgevoerd worden zolang de conditie waar (`TRUE`) is.

**Syntax**

```sql
WHILE [conditie] DO
    statement(s)
END WHILE 
```

De `WHILE`-lus is controleert de conditie voordat het statement wordt uitgevoerd.

Onderstaand schema illustreert dit principe.

![](../../.gitbook/assets/sp\_while.JPG)

Om het principe van de `WHILE`-lus te tonen, maken we eerst een nieuwe tabel `KalenderMomenten` aan.

```sql
CREATE TABLE KalenderMomenten(
    id INT AUTO_INCREMENT PRIMARY KEY,
    datum DATE UNIQUE,
    dag TINYINT NOT NULL,
    maand TINYINT NOT NULL,
    jaar INT NOT NULL
);
```

Via onderstaande stored procedure gaan we de mogelijkheid voorzien om de tabel kalender van data te voorzien.

```sql
USE `aptunes`;
DROP procedure IF EXISTS `KalenderToevoegen`;

DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `KalenderToevoegen`(dd DATE)
BEGIN
INSERT INTO KalenderMomenten(
        datum,
        dag,
        maand,
        jaar
    )
    VALUES(
        dd, 
        day(dd),
        month(dd),
        year(dd)
    );
END$$

DELIMITER ;
```

Vervolgens zorgen we via een nieuwe stored procedure `KalenderMeerdereToevoegen` dat de zojuist gecreëerde tabel wordt gevuld met data beginnende vanaf een datum.

```sql
USE `aptunes`;
DROP procedure IF EXISTS `KalenderMeerdereToevoegen`;

DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `KalenderMeerdereToevoegen`(
	datumStart DATE,
    aantalDagen INT)
BEGIN
	DECLARE teller INT DEFAULT 1;
    DECLARE dd DATE DEFAULT datumStart;

    WHILE teller <= aantalDagen DO
        CALL KalenderToevoegen(dd);
        SET teller = teller + 1;
        -- dit betekent: voeg één dag toe aan de datum
        SET dd = DATE_ADD(dd, INTERVAL 1 day);
    END WHILE;
END$$

DELIMITER ;
```

In bovenstaande stored procedure gebruiken we de `WHILE`-lus.

Zolang de teller kleiner of gelijk is aan het opgegeven aantal dagen, dan zullen data worden toegevoegd aan de gecreëerde tabel `KalenderMomenten`. Dit door in de `WHILE`-lus de stored procedure `KalenderToevoegen` met als parameter een datum aan te roepen.

```sql
CALL KalenderMeerdereToevoegen('2020-04-19', 90);
```

Deze uitvoering van de stored procedure `KalenderMeerdereToevoegen `geeft volgend resultaat.

![](../../.gitbook/assets/storedp\_while\_result.JPG)
