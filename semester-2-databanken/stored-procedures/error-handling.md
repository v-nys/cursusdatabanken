# Error handling

Indien binnen een stored procedure zich een onverwachte fout zou voordoen is het belangrijk hierop gepast te reageren. Een fout wordt aangegeven door middel van een signaal. We kunnen MySQL dus instructies geven over hoe elk signaal moet worden afgehandeld. Dit gepast reageren kan zijn van verder te gaan of het huidige blok code niet meer uit te voeren of een boodschap te geven.

## Voorbeeld uit het echte leven

In de uitleg rond signalen werd omschreven hoe je best reageert wanneer het brandalarm afgaat. Er stond een reeks stappen (maak iedereen wakker, probeer kort te blussen, loop naar buiten met de huisdieren,...). Deze reeks stappen stemt overeen met het idee van een "handler". Of, in het Nederlands, een "afhandelaar". Een manier om een probleem op te lossen of toch om de impact ervan te beperken.

## Declare handler

**Syntax**

```sql
DECLARE (CONTINUE or EXIT) HANDLER FOR statement(s);
```

Zoals reeds blijkt uit bovenstaande syntax moet je voor actie ofwel `CONTINUE` of `EXIT` gebruiken.

Het onderdeel statement(s) kan één van onderstaande elementen zijn.

* MySQL-foutcode
  * Dit is bijna hetzelfde als een SQL state, zoals die bij signals aan bod is gekomen. Een verschil is dat MySQL-foutcodes specifiek zijn voor MySQL. SQL states zijn meer compatibel met andere databases. Het tweede verschil is dat MySQL-foutcodes getallen zijn, terwijl SQL states codes van 5 tekens zijn, dus strings.
* Een SQLSTATE-waarde, m.n. een SQLWARNING, NOTFOUND of SQLEXCEPTION-voorwaarde&#x20;
  * SQLWARNING, NOTFOUND of SQLEXCEPTION zijn eigenlijk groepen van SQL states. SQLEXCEPTION dekt bijvoorbeeld alle SQL states die niet beginnen met `'00'`, `'01'` of `'02'`.
    * een warning is er voor zaken die niet noodzakelijk een probleem zijn, maar waarmee je wel moet opletten
    * een notfound is er voor wanneer je data zoekt die niet gevonden kan worden
    * een exception is voor situaties die wel zeker een probleem vormen
* Een conditie gekoppeld aan een MySQL-foutcode of SQLSTATE-waarde.
  * Dit verhoogt de leesbaarheid, zie beneden bij "named handlers".

**Hieronder enkele voorbeelden.**

De hieronder voorgestelde `handler` gaat verder wanneer zich een `error` voordoet en zet tevens de variabele `hasError` op 1.

```sql
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
SET hasError = 1;
```

Op deze manier kunnen we er voor zorgen dat onze code niet volledig blokkeert, maar dat we wel nog steeds zien dat er iets is misgelopen.

Hierbij is het wel belangrijk om de handler binnen de `BEGIN` en `END` van de stored procedure te schrijven. Meerbepaald: handlers mogen **alleen in stored programs** voorkomen en **alleen na declaraties van variabelen** (of condities, die worden verder op deze pagina gebruikt voor named handlers).

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

![](../../.gitbook/assets/sp\_errorhandling1.JPG)

```sql
USE `aptunes`;
DROP procedure IF EXISTS `InsertAlbumReleases`;

DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAlbumReleases`(
  IN releaseBand INT,
  IN releaseAlbum INT
)
BEGIN
  -- 1062 betekent "bij een dubbele primary key"
  DECLARE EXIT HANDLER FOR 1062
  SELECT CONCAT('Dubbele waarde (',releaseBand,',',releaseAlbum,') niet toegestaan') AS message;
  -- hieronder begint het "happy path" (wat gebeurt als niets misloopt)
  INSERT INTO Albumreleases(Bands_Id,Albums_Id)
  VALUES
  (releaseBand,releaseAlbum);
  SELECT COUNT(*)
  FROM Albumreleases
  WHERE Bands_Id = releaseBand;
END$$

DELIMITER ;
```

Bovenstaande stored procedure **zal geen fout produceren** in MySQL Workbench als we een dubbelen entry proberen toe te voegen. Ze zal alleen een bericht tonen. Dat bericht is niet hetzelfde als een fout, want de code heeft het probleem afgehandeld. Dat merk je aan het feit dat er alleen groene vinkjes verschijnen in Workbench.

In het andere geval we een nieuwe entry toevoegen die nog niet bestand, zal het aantal albums voor de band in kwestie worden weergegeven.

**Uitvoering**

We voeren onderstaande `CALL` uit.

```sql
CALL InsertAlbumReleases(1,1);
```

En krijgen als resultaat het cijfer 1 van de `COUNT(*)` terug.

We voeren dezelfde `CALL` opnieuw uit en krijgen dan:

![](../../.gitbook/assets/sp\_errorhandling2.JPG)

## Handler volgorde

Ingeval er verschillende `HANDLERS` zijn gedefinieerd die dezelfde `ERROR` afhandelen, dan zal MySQL de `HANDLER` uitvoeren die het meest aansluit bij de error op basis van onderstaande volgorde:

1. Je hebt gebruik gemaakt van een `ERROR`-code (zie voorbeeld hierboven);
2. Je maakt gebruik van een `SQLSTATE`, maar dit kan resulteren in meerdere error codes waardoor deze manier minder specifiek is;
3. Je gebruikt `SQLEXCEPTION` of `SQLWARNING` voor de `SQLSTATE` waarde. Dit is de meest generieke manier.

Als we dit toepassen op het gegeven voorbeeld, dan krijgen we hetvolgende.

```sql
USE `aptunes`;
DROP procedure IF EXISTS `InsertAlbumReleases`;

DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAlbumReleases`(
  IN releaseBand INT,
  IN releaseAlbum INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLSTATE '23000' SELECT '3. SQLSTATE 23000' as Message;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT '2. SQLException' as Message; 
  DECLARE EXIT HANDLER FOR 1062 SELECT '1. Dubbele waarde niet toegestaan' as Message; 
  INSERT INTO Albumreleases(Bands_Id,Albums_Id)
  VALUES
  (releaseBand,releaseAlbum);
  SELECT COUNT(*)
  FROM Albumreleases
  WHERE Bands_Id = releaseBand;
END$$

DELIMITER ;
```

Als we dan volgende CALL uitvoeren, krijgen we onderliggend resultaat.

```sql
CALL InsertAlbumReleases(1,1);
```

![](../../.gitbook/assets/sp\_errorhandling3.JPG)

Je merkt op dat de derde handler werd uitgevoerd en dit omdat de error `1062` exact aansluit bij de exception. In de meeste programmeertalen is dit anders en wordt de _eerste_ handler (bv. een `catch`-blok in C# of een `except`-blok in Python) gebruikt. In MySQL is het **de meest specifieke** handler.

## Named handler

Zoals we in bovenstaande voorbeelden hebben gezien, gebruiken we error code 1062. Dit staat voor een "duplicate entry for key".

Het is onredelijk te verwachten dat iedereen die naar onze SQL-code kijkt alle mogelijke foutcodes uit het hoofd kent (of tijd spendeert aan het opzoeken ervan). Daarom kunnen we de code "zelfbeschrijvend" maken door de foutcodes een naam te geven:

```sql
USE `aptunes`;
DROP procedure IF EXISTS `InsertAlbumReleases`;
DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAlbumReleases`(
  IN releaseBand INT,
  IN releaseAlbum INT
)
BEGIN
  DECLARE DuplicateValue CONDITION FOR 1062;
  DECLARE EXIT HANDLER FOR DuplicateValue
  SELECT CONCAT('Dubbele waarde (',releaseBand,',',releaseAlbum,') niet toegestaan') AS Message;
  INSERT INTO Albumreleases(Bands_Id,Albums_Id)
  VALUES(releaseBand,releaseAlbum);
  SELECT COUNT(*)
  FROM Albumreleases
  WHERE Bands_Id = releaseBand;
END$$
DELIMITER ;
```

Zoals we zien, hebben we een `CONDITION` gedeclareerd voor error code `1062`. Nadien gebruiken we voor de `EXIT HANDLER` de verwijzing naar deze `CONDITION`.
