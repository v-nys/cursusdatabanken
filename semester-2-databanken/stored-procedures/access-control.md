---
description: (security)
---

# OBJECT ACCESS CONTROL

## Definer

Hiermee kan je bepalen met welke MySQL account-privileges de stored procedure zal worden uitgevoerd.

Zonder `DEFINER` is de default de actuele gebruiker zijn rechten.

Enkel ingeval je `SYSTEM` rechten hebt, kan je een `DEFINER` bepalen voor de uitvoering van de stored procedure.

**Syntax**:

```sql
CREATE [DEFINER=gebruiker] PROCEDURE StoredProcedureName(parameter(s))
```

## Sql Security

Een stored procedure een `SECURITY` clausule bevatten met een waarde voor de `DEFINER` of de `INVOKER`.

**Syntax:**

```sql
CREATE [DEFINER=gebruiker] PROCEDURE StoredProcedureName(parameter(s)
SQL SECURITY [DEFINER | INVOKER]
```

#### SQL SECURITY DEFINER

Met de `DEFINER` zal de stored procedure in de beveiligingscontext worden uitgevoerd bepaald door het `DEFINER`-attribuut.

Hierdoor kan een stored procedure worden uitgevoerd met meer rechten dan de gebruiker zelf heeft.

#### SQL SECURITY INVOKER

Indien je gebruik maakt van het `INVOKER`-attribuut zal het `DEFINER`-attribuut geen effect meer hebben.

#### Voorbeeld

In onderstaande stored procedure hebben we via het DEFINER-object bepaald dat de gebruiker alle rechten van "root" heeft.

Dit wil dus zeggen dat iedere gebruiker, ongeacht zijn security level, deze stored procedure kan uitvoeren met root-rechten.

```sql
USE `aptunes`;
DROP procedure IF EXISTS `VoorbeeldSecurity`;

DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=root@localhost PROCEDURE `VoorbeeldSecurity` (
	titel VARCHAR(50))
SQL SECURITY DEFINER
BEGIN
	INSERT INTO Albums(Titel)
    VALUES(titel);
END$$

DELIMITER ;
```

We gaan een beetje verder en creëren een gebruiker ap@localhost.

```sql
CREATE USER ap@localhost 
IDENTIFIED BY 'abcde';
```

Wat is belangrijk als volgende stap om te doen is deze gebruiker rechten geven om stored procedures uit te voeren.

```sql
GRANT EXECUTE ON aptunes.*
TO ap@localhost;
```

Hier staat de `*` voor *alle* stored procedures. Je kan ook specifieke stored procedures toegankelijk maken. Je kan ook rechten op bepaalde databases, tabellen,... geven. We kunnen hier geen volledige lijst geven, maar de mogelijkheden vind je terug in [de officiële documentatie](https://dev.mysql.com/doc/refman/8.0/en/grant.html).

Vervolgens gaan we met deze gebruiker binnen MySQL inloggen. Doe dit als volgt.

![](../../.gitbook/assets/sp_security1.JPG)

Kijk even na op welke databases je enige rechten hebt.

![](../../.gitbook/assets/sp_signal2.JPG)

Geef vervolgens aan welke db je wilt gebruiken.

```sql
USE aptunes;
```

Zoals je merkt, uit het schema-venster heb je enkel rechten op de stored procedures.

![](../../.gitbook/assets/sp_signal3.JPG)

Om een stored procedure uit te voeren geef je volgende opdracht.

```sql
CALL VoorbeeldSecurity("Test vanuit ap user");
```

