# Object access control



{% hint style="success" %}
[Kennisclip](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=59d37d66-b071-4afd-9a73-ad2501048f8c)
{% endhint %}

## Gebruiksrechten

Het is meestal niet de bedoeling dat elke gebruiker van een database alle data kan opvragen, alle stored procedures kan uitvoeren, enzovoort. Iedere gebruiker heeft bepaalde **rechten**. Denk maar aan een onderneming met een centrale database en veel rollen binnen de onderneming. Beeld je bijvoorbeeld een ziekenhuis in:

* de boekhoudkundige dienst moet aan financiële gegevens kunnen, maar niet aan medische gegevens
* de artsen moeten aan medische gegevens kunnen, maar niet aan financiële gegevens
* de IT-dienst moet de werking van de database zelf kunnen aanpassen
* ...

Om dit niet aan de verantwoordelijkheidszin van de gebruikers over te laten, creëren we gebruikers met beperkte rechten.

### Een gebruiker creëren

We demonstreren dit door een gebruiker `'ap'@'%'` aan te maken. Het percentteken betekent dat het niet uitmaakt of de user op dezelfde machine werkt als die waarop de MySQL-server draait. Als je dat wel wil afdwingen **en** je werkt op een UNIX-systeem, gebruik je localhost in plaats van %.

{% hint style="warning" %}
Als je de cursus mee hebt gevolgd zoals bedoeld, dus met een virtuele machine waarin je server draait, is localhost geen optie. Je virtuele machine (die inderdaad UNIX-gebaseerd is) wordt niet beschouwd als dezelfde machine als je fysieke machine.
{% endhint %}

```sql
CREATE USER 'ap'@'%' -- dit is de gebruikersnaam en de machine waarop hij kan inloggen
IDENTIFIED BY 'abcde'; -- dit is het wachtwoord
```

Standaard heeft deze nieuwe gebruiker geen rechten. We verlenen het recht om stored procedures uit te voeren als volgt:

```sql
GRANT EXECUTE ON aptunes.*
TO 'ap'@'%';
```

Hier staat de `*` voor _alle_ stored procedures. Je kan ook specifieke stored procedures toegankelijk maken. Je kan ook rechten op bepaalde databases, tabellen,... geven. We kunnen hier geen volledige lijst geven, maar de mogelijkheden vind je terug in [de officiële documentatie](https://dev.mysql.com/doc/refman/8.0/en/grant.html).

Andere manieren om toegang te geven:

```sql
GRANT EXECUTE ON PROCEDURE ZegHallo TO 'ap'@'%'; -- voor EEN procedure schrijf je PROCEDURE
GRANT SELECT ON TabelNaam TO 'ap'@'%'; -- om data te selecteren
GRANT INSERT ON TabelNaam TO 'ap'@'%'; -- om data te inserten
```

Maar wat betekent het om een _stored procedure_ te mogen uitvoeren als je niet alle instructies in die stored procedure mag uitvoeren? Als je bijvoorbeeld `DoeBetaling` mag uitvoeren maar niet het recht hebt om een tabel `Rekeningen` aan te passen, terwijl `DoeBetaling` dat achter de schermen wel doet? Het hangt ervan af. Om daar een antwoord op te geven, moeten we weten of de stored procedure uitvoert als definer (de user die deze stored procedure gedefinieerd heeft) of als invoker (de user die nu de stored procedure wil uitvoeren).

## Definer

**Syntax**:

```sql
CREATE [DEFINER=gebruiker] PROCEDURE StoredProcedureName(parameter(s))
```

Als je zelf geen definer invult, is de definer van een stored procedure sowieso de account waarmee de stored procedure is aangemaakt.

## Sql Security

Een stored procedure een `SECURITY` clausule bevatten met een waarde voor de `DEFINER` of de `INVOKER`. Dit bepaalt hoe de procedure zich gedraagt wanneer ze wordt uitgevoerd door een user met beperkte rechten.

**Syntax:**

```sql
CREATE [DEFINER=gebruiker] PROCEDURE StoredProcedureName(parameter(s)
SQL SECURITY [DEFINER | INVOKER]
```

### SQL SECURITY DEFINER

Met de `DEFINER` zal de stored procedure in de beveiligingscontext worden uitgevoerd bepaald door het `DEFINER`-attribuut.

Hierdoor kan een stored procedure worden uitgevoerd met meer rechten dan de gebruiker zelf heeft.

### SQL SECURITY INVOKER

Indien je gebruik maakt van het `INVOKER`-attribuut zal het `DEFINER`-attribuut geen effect meer hebben.

### Voorbeeld

In onderstaande stored procedure hebben we via het DEFINER-object bepaald dat de gebruiker alle rechten heeft die we zelf altijd hebben gebruikt.

Dit wil dus zeggen dat iedere gebruiker, ongeacht zijn security level, deze stored procedure kan uitvoeren met volledige rechten, omdat er `SQL SECURITY DEFINER` staat.

{% hint style="danger" %}
Let op! `DEFINER` is de defaultwaarde. Als je niet aandachtig bent, kan het dus zijn dat je users meer rechten geeft dan bedoeld.
{% endhint %}

```sql
USE `aptunes`;
DROP procedure IF EXISTS `VoorbeeldSecurity`;

DELIMITER $$
USE `aptunes`$$
CREATE DEFINER=databanken@'%' PROCEDURE `VoorbeeldSecurity` (
    titel VARCHAR(50))
SQL SECURITY DEFINER
BEGIN
    INSERT INTO Albums(Titel)
    VALUES(titel);
END$$

DELIMITER ;
```

Vervolgens gaan we met de voorbeeldgebruiker inloggen. Doe dit als volgt.

![](../../.gitbook/assets/sp\_security2.JPG)

Kijk even na op welke databases je enige rechten hebt.

![](../../.gitbook/assets/sp\_signal2.JPG)

Geef vervolgens aan welke db je wilt gebruiken.

```sql
USE aptunes;
```

Zoals je merkt, uit het schema-venster heb je enkel rechten op de stored procedures.

![](../../.gitbook/assets/sp\_signal3.JPG)

Om een stored procedure uit te voeren geef je volgende opdracht.

```sql
CALL VoorbeeldSecurity("Test vanuit ap user");
```
