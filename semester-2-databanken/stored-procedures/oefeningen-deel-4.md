# Oefeningen transacties en access control

We werken verder met de `aptunes`-database. **Activeer deze database in elk script.** Schrijf je stored procedures ook zoals je ze zou schrijven in het algemene venster van Workbench, dus met gebruik van `DELIMITER $$`, enzoverder. Maak je parametertypes zo specifiek mogelijk, dus gebruik geen `INOUT` wanneer `IN` of `OUT` voldoende is.

## Vraag 1

Schrijf een stored procedure, `DangerousInsertAlbumreleases`. Deze stored procedure voegt drie willekeurige albumreleases in, maar signaleert ook met een kans van 1 op 3 een SQL state '45000' na het invoegen van de tweede albumrelease.

Om een willekeurige albumrelease te maken, kan je volgende procedure gebruiken:

```sql
USE `aptunes`;
DROP procedure IF EXISTS `MockAlbumReleaseBeter`;

DELIMITER $$
USE `aptunes`$$
CREATE PROCEDURE `MockAlbumReleaseBeter` ()
SQL SECURITY INVOKER
BEGIN
declare Albums_Id int;
declare Bands_Id int;
select Id from Albums order by rand() limit 1 into Albums_Id;
select Id from Bands order by rand() limit 1 into Bands_Id;
insert into Albumreleases (Bands_Id, Albums_Id)
values
(Bands_Id, Albums_Id);
END$$

DELIMITER ;


```

Schrijf in deze stored procedure een handler zodat het niet mogelijk is dat er slechts één of twee albumreleases worden ingevoegd. Als er iets mis loopt, mag er geen enkele nieuwe release zijn toegevoegd. In plaats daarvan wordt deze foutboodschap getoond: "Nieuwe releases konden niet worden toegevoegd." Let op: SQL state '45000' is niet het enige foutsignaal dat je hier kan krijgen, want het kan bijvoorbeeld ook zijn dat een willekeurige albumrelease al in het systeem zit. Schrijf je handler zo dat **alle** fouten worden tegengehouden: via `SQLEXCEPTION` dus.

Lees voor je deze oefening maakt zeker de instructies rond het correct uitvoeren van een `ROLLBACK` na.

Schrijf je stored procedure als een script, `0653__Oefening.sql`.

## Vraag 2

Schrijf een script, `0654__Oefening.sql`. Dit script doet volgende zaken:

* Het maakt een gebruiker `student` met wachtwoord `'ikbeneenstudent'`.
* Het geeft `student` de rechten om `DangerousInsertAlbumreleases` uit te voeren (uit de vorige vraag), maar geen andere stored procedures.

Test of het script gewerkt heeft door in te loggen als `student` en te kijken dat die stored procedure (en enkel die stored procedure) kan worden uitgevoerd.

## Vraag 3

Maak een kopie van je script `0653__Oefening.sql` en noem ze `0655__Oefening.sql`. Hernoem daarin de stored procedure naar `DangerousInsertAlbumreleases2`. Pas verder de definitie aan zodat de gebruikers van deze stored procedure ook de rechten moeten hebben om de stappen die plaatsvinden in de stored procedure op zich uit te voeren.

Tip: je moet alleen het symbool "2" toevoegen en drie woordjes. Maak het dus niet te moeilijk.
