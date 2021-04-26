# ERROR HANDLING

Indien binnen een stored procedure zich een onverwachte fout zou voordoen is het belangrijk hierop gepast te reageren. Een fout wordt aangegeven door middel van een signaal. We kunnen MySQL dus instructies geven over hoe elk signaal moet worden afgehandeld. Dit gepast reageren kan zijn van verder te gaan of het huidige blok code niet meer uit te voeren of een boodschap te geven.

## Voorbeeld uit het echte leven

In de uitleg rond signalen werd omschreven hoe je best reageert wanneer het brandalarm afgaat. Er stond een reeks stappen \(maak iedereen wakker, probeer kort te blussen, loop naar buiten met de huisdieren,...\). Deze reeks stappen stemt overeen met het idee van een "handler". Of, in het Nederlands, een "afhandelaar". Een manier om een probleem op te lossen of toch om de impact ervan te beperken.

## Declare handler

**Syntax**

```sql
DECLARE (CONTINUE or EXIT) HANDLER FOR statement(s);
```

Zoals reeds blijkt uit bovenstaande syntax moet je voor actie ofwel `CONTINUE` of `EXIT` gebruiken.

Het onderdeel statement\(s\) kan één van onderstaande elementen zijn.

* MySQL-foutcode
  * Dit is bijna hetzelfde als een SQL state, zoals die bij signals aan bod is gekomen. Een verschil is dat MySQL-foutcodes specifiek zijn voor MySQL. SQL states zijn meer compatibel met andere databases. Het tweede verschil is dat MySQL-foutcodes getallen zijn, terwijl SQL states codes van 5 tekens zijn, dus strings.
* Een SQLSTATE-waarde, m.n. een SQLWARNING, NOTFOUND of SQLEXCEPTION-voorwaarde 
  * SQLWARNING, NOTFOUND of SQLEXCEPTION zijn eigenlijk groepen van SQL states. SQLEXCEPTION dekt bijvoorbeeld alle SQL states die niet beginnen met `'00'`, `'01'` of `'02'`.
    * een warning is er voor zaken die niet noodzakelijk een probleem zijn, maar waarmee je wel moet opletten
    * een notfound is er voor wanneer je data zoekt die niet gevonden kan worden
    * een exception is voor situaties die wel zeker een probleem vormen
* Een conditie gekoppeld aan een MySQL-foutcode of SQLSTATE-waarde.
  * Dit verhoogt de leesbaarheid, zie beneden bij "named handlers".

**Hieronder enkele voorbeelden.**

De hieronder voorgestelde `handler` gaat verder wanneer zich een `error` voordoet en zet tevens de variabele `heeftError` op 1.

```sql
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
SET heeftError = 1;
```

Op deze manier kunnen we er voor zorgen dat onze code niet volledig blokkeert, maar dat we wel nog steeds zien dat er iets is misgelopen.

Hierbij is het wel belangrijk om de handler binnen de `BEGIN` en `END` van de stored procedure te schrijven. Meerbepaald: handlers mogen **alleen in stored procedures** voorkomen en **alleen na declaraties van variabelen** \(of condities, die worden verder op deze pagina gebruikt voor named handlers\).

Je kan ook handlers voor specifieke statements of error-codes schrijven, hieronder enkele voorbeelden.

Deze voorbeelden zijn allemaal met de `CONTINUE` optie, maar kan evengoed met de `EXIT` mogelijkheid worden geschreven als je wil dat je stored procedure wordt stopgezet.

```sql
-- voor een specifieke MySQL error code (een getal)
DECLARE CONTINUE HANDLER FOR 1051
```

```sql
-- voor een SQL state (een code van 5 symbolen)
DECLARE CONTINUE HANDLER FOR SQLSTATE '12345'
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

We werken voor dit voorbeeld met de tabel `Albumreleases` binnen onze voorbeelddatabase `aptunes`. We hebben de foutcodes opgezocht [in de officiële documentatie](https://dev.mysql.com/doc/refman/8.0/en/server-error-reference.html).

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

    INSERT INTO Albumreleases(Bands_Id,Albums_Id)
  VALUES(inBands_id,inAlbums_Id);

  SELECT COUNT(*)
  FROM Albumreleases
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

    INSERT INTO Albumreleases(Bands_Id,Albums_Id)
  VALUES(inBands_id,inAlbums_Id);

  SELECT COUNT(*)
  FROM Albumreleases
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

    INSERT INTO Albumreleases(Bands_Id,Albums_Id)
  VALUES(inBands_id,inAlbums_Id);

  SELECT COUNT(*)
  FROM Albumreleases
  WHERE Bands_Id = inBands_Id;
END$$

DELIMITER ;
```

Zoals we zien, hebben we een `CONDITIE` gedeclareerd voor error code 1062.

Nadien gebruiken we voor de `EXIT HANDLER` de verwijzing naar deze `CONDITIE`.

