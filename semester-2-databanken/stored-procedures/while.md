# WHILE

`WHILE` is ook een herhalingsstructuur die zorgt dat code of statements achter elkaar kunnen uitgevoerd worden zolang de conditie waar (`TRUE`) is.

**Syntax**

```sql
WHILE [conditie] DO
    statement(s)
END WHILE 
```

De `WHILE`-lus is controleert de conditie voordat het statement wordt uitgevoerd.

Onderstaand schema illustreert dit principe.

![](../../.gitbook/assets/sp\_while.JPG)

Om het principe van de `WHILE`-lus te tonen, maken we eerst een nieuwe tabel `TimeSlots` aan. Deze stelt alle tijdstippen op een kalender voor.

```sql
CREATE TABLE TimeSlots(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    SlotDate DATE UNIQUE
);
```

Vervolgens zorgen we via een nieuwe stored procedure `AddTimeSlots` dat de zojuist gecreëerde tabel wordt gevuld met data beginnende vanaf een datum.

```sql
USE `aptunes`;
DROP procedure IF EXISTS `AddTimeSlots`;

DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddTimeSlots`(
    startDate DATE,
    numberOfDays INT
)
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE currentDate DATE DEFAULT startDate;
    WHILE counter <= numberOfDays DO
        INSERT INTO TimeSlots (SlotDate)
        VALUES
        (currentDate);
        SET counter = counter + 1;
        -- deze functie telt een aantal dagen bij een datum
        SET currentDate = DATE_ADD(currentDate, INTERVAL 1 day);
    END WHILE;
END$$

DELIMITER ;
```

In bovenstaande stored procedure gebruiken we de `WHILE`-lus.

Zolang de teller kleiner of gelijk is aan het opgegeven aantal dagen, dan zullen data worden toegevoegd aan de gecreëerde tabel `TimeSlots`.

```sql
CALL AddTimeSlots('2020-04-19', 90);
```

Deze uitvoering van de stored procedure `AddTimeSlots` geeft volgend resultaat:

<figure><img src="../../.gitbook/assets/Screenshot from 2023-02-23 14-30-50.png" alt=""><figcaption></figcaption></figure>
