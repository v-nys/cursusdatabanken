# VARIABELEN

Een variabele heeft als bedoeling data tijdelijk te bewaren.

Binnen een stored procedure is het mogelijk om variabelen te declareren die dan binnen deze stored procedure kunnen gebruikt worden.

## DECLARE

Een variabele declareer je als volgt.

```sql
DECLARE naam_variabele datatype(grootte) [DEFAULT default_waarde];
```

De verschillende datatypes kan je vinden op:

{% embed url="https://dev.mysql.com/doc/refman/8.0/en/data-types.html" caption="" %}

Dit zijn dezelfde types die je koppelt aan een kolom, bv. `INT`, `DATE`, enz.

{% hint style="warning" %}
Je kan een variabele **alleen** declareren vlak na een `BEGIN` \(of na declaratie van een andere variabele\). Dat is geen probleem, want je kan hem wel nog van waarde veranderen na andere statements.
{% endhint %}

## SCOPE

Zoals ook het geval bij programmeertalen heeft een variabele een bepaalde "scope", d.w.z. een bereik of levensduur. Als je een variabele binnen een stored procedure declareert, dan zal deze niet meer bruikbaar zijn wanneer het `END` statement van deze stored procedure wordt bereikt. Dit stemt overeen met een lokale variabele in een algemene programmeertaal.

Je kan uiteraard meerdere variabelen tegelijk declareren.

Een variabele die met het @-symbool begint is een zgn. sessie-variabele. Deze is beschikbaar zolang de sessie niet is beëindigd. Dit stemt **ruwweg** overeen met een globale variabele in een algemene programmeertaal. Daarom gebruiken we variabelen zonder `@` waar we kunnen en enkel variabelen met `@` wanneer lokale scope te begrensd is.

## VOORBEELD

```sql
USE `aptunes`;
DROP procedure IF EXISTS `GetAantalLidmaatschappen`;

DELIMITER $$
USE `aptunes`$$
CREATE PROCEDURE `GetAantalLidmaatschappen` ()
BEGIN
    DECLARE totalLidmaatschap INT DEFAULT 0;
    SELECT COUNT(*)
    INTO totalLidmaatschap
    FROM lidmaatschappen;
    SELECT totalLidmaatschap;
END$$

DELIMITER ;
```

Hierbij declareren we een \(lokale\) INT variabele totalLidmaatschap, dewelke we dan een waarde geven met het uitvoeren van het SQL-statement, waarna de inhoud van deze variabele via de tweede `SELECT` wordt geselecteerd. Je hebt de variabele niet nodig voor deze taak, maar het voorbeeld toont de syntax.

