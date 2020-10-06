# Oefeningen deel 4

We werken verder met de `aptunes`-database. **Activeer deze database in elk script.** Schrijf je stored procedures ook zoals je ze zou schrijven in het algemene venster van Workbench, dus met gebruik van `DELIMITER $$`, enzoverder. Maak je parametertypes zo specifiek mogelijk, dus gebruik geen `INOUT` wanneer `IN` of `OUT` voldoende is.

## Vraag 1

Schrijf een stored procedure, `GetAlbumDuration` die de totale lengte van een gegeven album bepaalt, **zonder gebruik te maken van `SUM`**. Doe dit met behulp van een cursor. Meerbepaald: doorloop alle liedjes op het album en tel hun lengtes op via een instructie `SET totalDuration = totalDuration + songDuration`.

Voorbeeld van hoe je deze stored procedure zou gebruiken:

```sql
CALL GetAlbumDuration(12,@totalDuration);
SELECT @albumduration;
```

De duur van één liedje kan uitgedrukt worden als `TINYINT UNSIGNED`, maar voor de totale duur van een album gebruik je een `SMALLINT UNSIGNED`.

Noem het script dat deze procedure aanmaakt `0651__Oefening.sql`.

Enkele resultaten om je eigen code te controleren:

* album 2945 duur 341 seconden
* album 2879 duurt 163 seconden
* album 1 duurt 0 seconden \(want bevat geen liedjes\)

## Vraag 2

Schrijf een script, `0652__Oefening.sql`. Dit script doet volgende zaken:

* Het maakt een gebruiker `student` met wachtwoord `'ikbeneenstudent'`.
* Het geeft `student` de rechten om `GetAlbumDuration` uit te voeren \(uit de vorige vraag\), maar geen andere stored procedures.

Test of het script gewerkt heeft door in te loggen als `student` en te kijken dat die stored procedure \(en enkel die stored procedure\) kan worden uitgevoerd.

## Vraag 3

Maak een kopie van je script `0651__Oefening.sql` en noem ze `0653__Oefening.sql`. Hernoem daarin de stored procedure naar `GetAlbumDuration2`. Pas verder de definitie aan zodat de gebruikers van deze stored procedure ook de rechten moeten hebben om de stappen die plaatsvinden in de stored procedure op zich uit te voeren.

Tip: je moet alleen het symbool "2" toevoegen en drie woordjes. Maak het dus niet te moeilijk.

