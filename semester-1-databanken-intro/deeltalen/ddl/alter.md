# ALTER

Hier zien we iets meer in verband met het aanmaken van structuren voor je data. We starten onze database met behulp van onderstaand calibratiescript, dat je 0013\_\_Calibratie.sql mag noemen:

{% file src="../../../.gitbook/assets/calibratie.sql" %}
Calibratiescript DDL medium
{% endfile %}

## `ALTER TABLE`

`ALTER TABLE` verandert de structuur van een tabel, zonder bestaande data te beschadigen. Je kan het gebruiken om kolommen toe te voegen of te verwijderen. Je kan het ook gebruiken om het soort data in een kolom aan te passen, specifieker of juist breder te maken. Voor deze taken heb je binnenin een `ALTER TABLE` statement extra clausules nodig.&#x20;

{% hint style="info" %}
Maak voor jezelf een cheat sheet van de verschillende clausules die je in `ALTER TABLE` kan gebruiken!

Voorbeeld: [https://www.sqltutorial.org/sql-cheat-sheet/](https://www.sqltutorial.org/sql-cheat-sheet/)
{% endhint %}

### een kolom schrappen

```sql
USE ApDB;
ALTER TABLE Boeken DROP COLUMN Voornaam;
```

#### Script bijhouden

{% hint style="info" %}
Voer eerst het calibratiescript van dit deel uit. Pas het script eerst aan om je persoonlijke database te gebruiken in plaats van `ApDB`.
{% endhint %}

Sla het script om de voornaam te verwijderen op wanneer je klaar bent. Geef het de naam 0014\_\_AlterBoeken.sql.

### een kolom toevoegen

Om een kolom toe te voegen maak je gebruik van de `ADD` clausule bij het ALTER statement. Je zou hier misschien het woordje `CREATE` verwachten. Zoals je ondertussen weet, gebruik je in sql namelijk het keyword `CREATE` om een structuur aan te maken. Maar binnenin `ALTER` is het dus `ADD`! Je moet m.a.w. aangeven dat je iets, in dit geval een kolom, wil toevoegen aan de tabel.

```sql
-- herstel de kolom
-- deze mag tot 150 (mogelijk internationale) karakters bevatten
USE ApDB;
ALTER TABLE Boeken ADD COLUMN Commentaar VARCHAR(150) CHAR SET utf8mb4;
```

Je merkt in bovenstaand script dat er opgave wordt gegeven van een `CHAR SET`. Standaard is `utf8mb4` van toepassing voor MySql, maar we vermelden ze hier uitdrukkelijk, omdat er soms ook andere karaktersets worden gebruikt.

#### Script bijhouden

Pas dit script aan om naast de kolom `Commentaar` ook de kolom `Voornaam` terug toe te voegen en een kolom Familienaam toe te voegen, beide `VARCHAR(100)` en niet verplicht. Sla je script opnieuw op wanneer je klaar bent. Geef het de naam 0015\_\_AlterBoeken.sql.

### beperkingen toevoegen

Het is goed om van meet af aan de integriteit van de database te denken. We gaan ervan uit dat de familienaam moet ingevuld worden. Zelfs al is de auteur onbekend, moet dan zoiets als "onbekend" worden ingevuld. Om een kolom verplicht te maken voegen we een constraint toe. In volgende code zijn `OldColumnName`, `NewColumnName` en `NewColumnType` **placeholders voor de namen van twee kolommen en een datatype met de nodige constraints**:

```sql
ALTER TABLE TableName CHANGE OldColumnName NewColumnName NewColumnType;
```

Via de `NOT NULL` constraint kunnen we zorgen dat een kolom een waarde moet bevatten, maar die regel mogen we enkel opleggen als er momenteel geen rijen zonder waarde in die kolom zijn.

Eerst moeten we ervoor zorgen dat de nieuw toegevoegde kolom voor iedere rij een waarde krijgt, tot nu is deze waarde `NULL`.

![](<../../../.gitbook/assets/image (7).png>)

{% hint style="info" %}
Het UPDATE-commando, hieronder, hebben we tot nu nog niet gezien en je kan dit gewoon copy/pasten om vervolgens uit te voeren.
{% endhint %}

```sql
USE ApDB;
set sql_safe_updates = 0;
UPDATE Boeken SET Familienaam = "Niet gekend";
set sql_safe_updates = 1;
```

Vervolgens gaan we de kolom Familienaam qua structuur wijzigen en een beperking opleggen.&#x20;

```sql
USE ApDB;
ALTER TABLE Boeken CHANGE Familienaam Familienaam VARCHAR(200) CHAR SET utf8mb4 NOT NULL;
```

#### Script bijhouden

Sla een script met bovenstaande `UPDATE` en `ALTER` achter elkaar opnieuw op wanneer je klaar bent. Geef het de naam 0016\_\_AlterBoeken.sql.

### tabelnamen wijzigen

Het zou misschien te gemakkelijk geweest zijn als het wijzigen van tabelnamen in MySQL met het ALTER statement kon worden uitgevoerd. Om de naam van een tabel te wijzigen kunnen we het `ALTER` statement niet gebruiken. Er bestaat daarvoor een apart `RENAME` statement. De generieke vorm is als volgt. Let op het gebruik van backticks rond de naam van de tabellen. Die zijn verplicht in het geval dat de naam van de tabel overeenkomt met een gereserveerd woord van MySQL:

```sql
RENAME TABLE `OldTableName` TO `NewTableName`;
```

In ons voorbeeld:

```sql
USE ApDB;
RENAME TABLE `Boeken` TO `MijnBoeken`;
```

{% hint style="info" %}
Deze wijziging hoef je niet op te slaan. Het is maar een voorbeeld.
{% endhint %}
