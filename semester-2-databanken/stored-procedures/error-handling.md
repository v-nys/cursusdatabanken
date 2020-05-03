# ERROR HANDLING
Indien binnen een stored procedure zich een onverwachte fout zou voordoen is het belangrijk hierop gepast te reageren. Een fout wordt aangegeven door middel van een signaal. We kunnen MySQL dus instructies geven over hoe elk signaal moet worden afgehandeld. Dit gepast reageren kan zijn van verder te gaan of het huidige blok code niet meer uit te voeren of een boodschap te geven.

## Voorbeeld uit het echte leven
In de uitleg rond signalen werd omschreven hoe je best reageert wanneer het brandalarm afgaat. Er stond een reeks stappen (maak iedereen wakker, probeer kort te blussen, loop naar buiten met de huisdieren,...). Deze reeks stappen stemt overeen met het idee van een "handler". Of, in het Nederlands, een "afhandelaar". Een manier om een probleem op te lossen of toch om de impact ervan te beperken.

## Declare handler

**Syntax**

```sql
DECLARE actie [CONTINUE of EXIT] HANDLER FOR statement(s);
```

Zoals reeds blijkt uit bovenstaande syntax moet je voor actie ofwel `CONTINUE` of `EXIT` gebruiken.

Het onderdeel statement\(s\) kan één van onderstaande elementen zijn.

* MySQL-foutcode
  * Dit is bijna hetzelfde als een SQL state, zoals die bij signals aan bod is gekomen. Een verschil is dat MySQL-foutcodes specifiek zijn voor MySQL. SQL states zijn meer compatibel met andere databases. Het tweede verschil is dat MySQL-foutcodes getallen zijn, terwijl SQL states codes van 5 tekens zijn, dus strings.
* Een SQLSTATE-waarde, m.n. een SQLWARNING, NOTFOUND of SQLEXCEPTION-voorwaarde 
  * SQLWARNING, NOTFOUND of SQLEXCEPTION zijn eigenlijk groepen van SQL states. SQLEXCEPTION dekt bijvoorbeeld alle SQL states die niet beginnen met `'00'`, `'01'` of `'02'`.
* Een conditie gekoppeld aan een MySQL-foutcode of SQLSTATE-waarde.
  * Dit verhoogt de leesbaarheid, zie beneden bij "named handlers".

**Hieronder enkele voorbeelden.**

De hieronder voorgestelde `handler` gaat verder wanneer zich een `error` voordoet en zet tevens de variabele `heeftError` op 1.

```sql
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
SET heeftError = 1;
```

Op deze manier kunnen we er voor zorgen dat onze code niet volledig blokkeert, maar dat we wel nog steeds zien dat er iets is misgelopen.

Als we een boodschap willen weergeven wanneer er zich een error voordoet dan kan dit met onderstaand voorbeeld waarbij tevens een `ROLLBACK` wordt uitgevoerd, waardoor alle mogelijke wijzigingen die de huidige transactie zou hebben uitgevoerd teniet worden gedaan.

Hierbij is het wel belangrijk om de handler binnen de `BEGIN` en `END` van de stored procedure te schrijven. Meerbepaald: handlers mogen **alleen in stored procedures** voorkomen en **alleen na declaraties van variabelen** (of condities, die worden verder op deze pagina gebruikt voor named handlers).

{% hint style="warning" %}
Dit is wat verschillend van general purpose programmeertalen. In pakweg C♯, Java, C++, Python,... kan je op elk niveau van je programma fouten opvangen met een zeer gelijkaardig mechanisme.
{% endhint %}

```sql
CREATE PROCEDURE spNaam()
spLabel: BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: stored procedure is beëindigd en alle wijzigingen zijn ongedaan gemaakt.';
    END;
    -- START TRANSACTION is geen verplichte syntax, maar anders heeft de rollback geen zin
    -- dan is elke instructie op zich een mini-transactie
    START TRANSACTION;
    -- instructies, bv. INSERT, UPDATE,...
    -- COMMIT hoort bij START TRANSACITON
    COMMIT;
END$$
```

Je kan ook handlers voor specifieke statements of error-codes schrijven, hieronder enkele voorbeelden.

Deze voorbeelden zijn allemaal met de `CONTINUE` optie, maar kan evengoed met de `EXIT` mogelijkheid worden geschreven als je wil dat je stored procedure wordt stopgezet.

```sql
-- voor een specifieke MySQL error code (een getal)
DECLARE CONTINUE HANDLER FOR 1051
```

```sql
-- voor een SQL state (een code van 5 symbolen)
DECLARE CONTINUE HANDLER FOR SQLSTATE '123AB'
```

```sql
-- alle waarschuwingen (een groep codes)
DECLARE CONTINUE HANDLER FOR SQLWARNING
```

```sql
-- onbeschikbare data (een groep codes)
DECLARE CONTINUE HANDLER FOR NOT FOUND
```

```sql
-- alle foutmeldingen (een groep codes)
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
```

Enzovoort...

## Uitgewerkt voorbeeld 1

We werken voor dit voorbeeld met de tabel `Albumreleases` binnen onze voorbeelddatabase `aptunes`.  We hebben de foutcodes opgezocht [in de officiële documentatie](https://dev.mysql.com/doc/refman/8.0/en/server-error-reference.html).

![](../../.gitbook/assets/sp_errorhandling1.JPG)

```sql
USE `aptunes`;
DROP procedure IF EXISTS `InsertAlbumReleases`;

DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAlbumReleases`(
	IN inBands_Id INT,
  IN inAlbums_Id INT)
BEGIN
	DECLARE EXIT HANDLER FOR 1062
  BEGIN
		SELECT CONCAT('Dubbele waarde (',inBands_Id,',',inAlbums_Id,') niet toegestaan') AS message;
  END;

	INSERT INTO albumreleases(Bands_Id,Albums_Id)
  VALUES(inBands_id,inAlbums_Id);
    
  SELECT COUNT(*)
  FROM albumreleases
  WHERE Bands_Id = inBands_Id;
END$$

DELIMITER ;
```

Bovenstaande stored procedure zal ingeval een dubbele waarde zou worden ingegeven, ttz. hetzelfde `Bands_Id` en `Albums_Id`, de boodschap geven dat dit niet is toegestaan.

In het andere geval zal het aantal albums voor een `Bands_Id` worden weergegeven.

**Uitvoering**

We voeren onderstaande `CALL` uit.

```sql
CALL InsertAlbumReleases(1,1);
```

En krijgen als resultaat het cijfer 1 van de `COUNT(*)` terug.

We voeren dezelfde `CALL` opnieuw uit en krijgen dan:

![](../../.gitbook/assets/sp_errorhandling2.JPG)

## Handler volgorde

Ingeval er verschillende `HANDLERS` zijn gedefinieerd die dezelfde `ERROR` afhandelen, dan zal MySQL de `HANDLER` uitvoeren die het meest aansluit bij de error op basis van onderstaande volgorde:

1. Je hebt gebruik gemaakt van een `ERROR`-code \(zie voorbeeld hierboven\);
2. Je maakt gebruik van een `SQLSTATE`, maar dit kan resulteren in meerdere error codes waardoor deze manier minder specifiek is;
3. Je gebruikt `SQLEXCEPTION` of `SQLWARNING` voor de `SQLSTATE` waarde. Dit is de meest generieke manier.

Als we dit toepassen op het gegeven voorbeeld, dan krijgen we hetvolgende.

```sql
USE `aptunes`;
DROP procedure IF EXISTS `InsertAlbumReleases`;

DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAlbumReleases`(
	IN inBands_Id INT,
  IN inAlbums_Id INT)
BEGIN
  DECLARE EXIT HANDLER FOR 1062 SELECT '1. Dubbele waarde niet toegestaan' Message; 
  DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT '2. SQLException' Message; 
  DECLARE EXIT HANDLER FOR SQLSTATE '23000' SELECT '3. SQLSTATE 23000' ErrorCode;
	
	INSERT INTO albumreleases(Bands_Id,Albums_Id)
  VALUES(inBands_id,inAlbums_Id);
    
  SELECT COUNT(*)
  FROM albumreleases
  WHERE Bands_Id = inBands_Id;
END$$

DELIMITER ;
```

Als we dan volgende CALL uitvoeren, krijgen we onderliggend resultaat.

```sql
CALL InsertAlbumReleases(1,1);
```

![](../../.gitbook/assets/sp_errorhandling3.JPG)

Je merkt op dat de eerste handler werd uitgevoerd en dit omdat de error 1062 exact aansluit bij de exception.

## Named handler

Zoals we in bovenstaande voorbeelden hebben gezien, gebruiken we error code 1062. Dit staat voor een "duplicate entry for key".

Het is waarschijnlijk minder goed verstaanbaar om een error-nummer te gebruiken en daardoor kunnen we de handler best een meer beschrijvende naam geven.

```sql
USE `aptunes`;
DROP procedure IF EXISTS `InsertAlbumReleases`;

DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAlbumReleases`(
	IN inBands_Id INT,
  IN inAlbums_Id INT)
BEGIN
	DECLARE DubbeleWaarde CONDITION FOR 1062;
    
  DECLARE EXIT HANDLER FOR DubbeleWaarde
  BEGIN
		SELECT CONCAT('Dubbele waarde (',inBands_Id,',',inAlbums_Id,') niet toegestaan') AS message;
  END;

	INSERT INTO albumreleases(Bands_Id,Albums_Id)
  VALUES(inBands_id,inAlbums_Id);
    
  SELECT COUNT(*)
  FROM albumreleases
  WHERE Bands_Id = inBands_Id;
END$$

DELIMITER ;
```

Zoals we zien, hebben we een `CONDITIE` gedeclareerd voor error code 1062. 

Nadien gebruiken we voor de `EXIT HANDLER` de verwijzing naar deze `CONDITIE`.

## Correct uitvoeren van `ROLLBACK`
Via de instructie `ROLLBACK` kan je voorlopige wijzigingen ongedaan maken. Dit kwam eerder al even aan bod. We bekijken het hier wat meer in detail.

Voer zelf de voorbeelden mee uit om te zien wat er gebeurt.

### Voorbeeld 1 (hoe het moet)

Onderstaande code start uitdrukkelijk een transactie en de handler bevat een `ROLLBACK`. Tijdens de transactie doet zich een fout voor die afgehandeld kan worden door de handler:

```sql
use aptunes;
delimiter $$
CREATE PROCEDURE RollbackDemo1()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: stored procdure is beëindigd en alle wijzigingen zijn ongedaan gemaakt.';
    END;
    start transaction;
    insert into Genres (Naam)
    values
    ('Metal');
    signal sqlstate '45000';
    commit;
END$$
```

Voer de code uit om de procedure te creëren. Kijk welke genres momenteel in je database zitten. Voer vervolgens een `CALL` van deze procedure uit. Het resultaat? Er is geen nieuwe genre toegevoegd aan het systeem. De `INSERT` is wel uitgevoerd, maar alleen op een voorlopige wijze. De `COMMIT` is niet bereikt en er heeft zich een `ROLLBACK` voorgedaan, dus de wijziging is niet definitief gemaakt.

### Voorbeeld 2 (hoe het niet moet)

```sql
use aptunes;
delimiter $$
CREATE PROCEDURE RollbackDemo2()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: stored procdure is beëindigd en alle wijzigingen zijn ongedaan gemaakt.';
    END;
    insert into Genres (Naam)
    values
    ('Metal');
    signal sqlstate '45000';
END$$
```

Als je deze procedure definieert en oproept, zie je dat het nieuwe genre **wel** is toegevoegd. Dat komt omdat je geen transactie hebt gestart. Als je dat niet doet, is **elk statement** standaard definitief. **Stored procedures vormen niet vanzelf een transactie**.

### Voorbeeld 3 (hoe het niet moet)
Verwijder eerst even zelf het nieuwe genre en gebruik dan volgende procedure:

```sql
use aptunes;
delimiter $$
CREATE PROCEDURE RollbackDemo3()
BEGIN
    insert into Genres (Naam)
    values
    ('Metal');
    signal sqlstate '45000';
END$$
```

Hier hebben we de handler weggelaten ten opzichte van het vorige voorbeeld. Omdat in het vorige voorbeeld de `INSERT` niet ongedaan werd gemaakt, gebeurt dat hier zeker niet. Er is niet eens een rollback (die in het vorige voorbeeld dus al niets deed). Wat wel anders is: hier is geen handler. Dus de fout wordt niet afgehandeld binnen de stored procedure en levert een "klassieke" fout in je MySQL Workbench.

### Voorbeeld 4 (om voor op te letten)
Volgend voorbeeld is **geen** stored procedure:

```sql
use aptunes;
start transaction;
insert into Genres(Naam) values ('Chanson');
signal sqlstate '45000';
commit;
```

In MySQL hangt het effect hier af van de omgeving (bv. command line client, Workbench, nog andere omgevingen waarin je SQL-commando's kan intypen en uitvoeren). **In sommige omgevingen zorgen fouten in transacties vanzelf voor een `ROLLBACK` en in sommige niet.** Als je zeker wil zijn van het gewenste gedrag, programmeer het dan met behulp van een handler. Op mijn systeem blijft dit nieuwe genre in het systeem staan, maar bij jou zou het afwezig kunnen zijn! Meer informatie vind je [hier](https://stackoverflow.com/questions/6121917/automatic-rollback-if-commit-transaction-is-not-reached).

{% hint style="info" %}
Let wel op: hier kan je eigenlijk geen handler zetten want er is geen stored procedure. Maar voor een stored procedure gelden dezelfde regels.
{% endhint %}

{% hint style="danger" %}
We herhalen het nogmaals: in MySQL is de body van een stored procedure geen transactie. Als je een rollback wil kunnen doen, moet je dus `START TRANSACTION` schrijven en eindigen met een `COMMIT`.
{% endhint %}
