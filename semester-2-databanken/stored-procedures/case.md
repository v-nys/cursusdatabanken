# CASE

Het CASE-statement kennen we ook in veel programmeeromgevingen. Soms heet het daar ook een "switch" statement. Het maakt lange reeksen van "ifs" en "elseifs" overzichtelijker.

{% hint style="info" %}
De werking is niet 100% identiek aan de switch die je misschien kent uit C\#, maar het idee is gelijkaardig. Je merkt misschien dat je hier de case niet toepast op een bepaalde waarde, wat je bij een switch wel doet.
{% endhint %}

Behalve het [`IF-THEN-ELSE-ELSEIF`](if-then.md) statement, kunnen we ook conditionele stored procedures creëren met behulp van het CASE-statement.

Het CASE-statement zorgt voor meer overzicht van de conditionele code.

**Syntax:**

```sql
CASE
    WHEN conditie1 THEN 
        statement(s);
    WHEN conditie2 THEN 
        statement(s);
    ...
    [ELSE else-statement(s);]
END CASE;
```

Als we het voorbeeld beschreven bij IF-THEN-ELSE-ELSEIF met een CASE-constructie zouden schrijven, dan komen we tot onderstaand resultaat.

Merk hierbij op dat er twee elementen extra zijn toegevoegd, ingeval het resultaat 0 is dan verschijnt de boodschap geen duurtijd en ingeval geen enkele conditie waar is dan zal de boodschap bij de else-component worden weergeven, nl. geen informatie beschikbaar.

```sql
USE `aptunes`;
DROP procedure IF EXISTS `case_`;

DELIMITER $$
USE `aptunes`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `case_`(
    IN pLiedjesId INT,
    OUT pResult VARCHAR(30))
BEGIN
    DECLARE song_length INT DEFAULT 0;

    SELECT Lengte 
    INTO song_length
    FROM Liedjes
    WHERE Id = pLiedjesId;

  CASE 
    WHEN song_length = 0 THEN 
      SET pResult = 'Geen duurtijd';
    WHEN song_length >= 1 AND song_length < 70 THEN
      SET pResult = 'Korte duurtijd';
        WHEN song_length >= 70 AND song_length < 80 THEN
      SET pResult = 'Normale duurtijd';
        WHEN song_length >= 80 THEN
            SET pResult = 'Lange duurtijd';
    ELSE
      SET pResult = 'Geen informatie beschikbaar';
  END CASE;    
END$$

DELIMITER ;
```

## VERSCHIL TUSSEN [`IF`](if-then.md) EN [`CASE`](case.md)\`\`

Zowel de `IF`- als `CASE`-statements laten u toe om een blok code uit te voeren op basis van een specifieke conditie.

De keuze tussen `IF` of `CASE` is een kwestie van persoonlijke voorkeur.

* Een eenvoudig CASE-statement is meestal beter leesbaarder dan een IF-statement.
* Het IF-statement is beter geschikt wanneer complexe constructies op basis van meerdere waarden worden opgezet. 
* Bij het CASE-statement is het van belang dat ten minste één van de condities de waarde TRUE oplevert, anders moet je foutafhandeling gaan toepassen.  Bij het IF-statement is dit niet nodig.

