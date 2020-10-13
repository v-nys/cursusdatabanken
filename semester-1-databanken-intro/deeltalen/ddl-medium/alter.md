# ALTER

## `ALTER TABLE`

`ALTER TABLE` verandert de structuur van een tabel, zonder bestaande data te beschadigen. Je kan het gebruiken om kolommen toe te voegen of te verwijderen. Je kan het ook gebruiken om het soort data in een kolom aan te passen, specifieker of juist breder te maken. Voor deze taken heb je binnenin een `ALTER TABLE` statement extra clausules nodig.

{% hint style="info" %}
Maak voor jezelf een cheat sheet van de verschillende clausules die je in `ALTER TABLE` kan gebruiken!

Voorbeeld: [https://www.sqltutorial.org/sql-cheat-sheet/](https://www.sqltutorial.org/sql-cheat-sheet/)
{% endhint %}

### een kolom schrappen

```sql
USE ApDb;
ALTER TABLE Boeken DROP COLUMN Voornaam;
```

#### Script bijhouden

{% hint style="info" %}
Voer eerst het calibratiescript op de [indexpagina](./) van dit deel uit. Pas het script eerst aan om je persoonlijke database te gebruiken in plaats van `ApDB`.
{% endhint %}

Sla je script opnieuw op wanneer je klaar bent. Geef het de naam 0008\_\_AlterBoeken.sql.

### een kolom toevoegen

Om een kolom toe te voegen maak je gebruik van de `ADD` clausule bij het ALTER statement. Je zou hier misschien het woordje `CREATE` verwachten. Zoals je ondertussen weet, gebruik je in sql namelijk het keyword `CREATE` om een structuur aan te maken. Maar binnenin `ALTER` is het dus `ADD`! Je moet m.a.w. aangeven dat je iets, in dit geval een kolom, wil toevoegen aan de tabel.

```sql
-- herstel de kolom
-- deze mag tot 150 (mogelijk internationale) karakters bevatten
USE ApDb;
ALTER TABLE Boeken ADD COLUMN Commentaar VARCHAR(150) CHAR SET utf8mb4;
```

Je merkt in bovenstaand script dat er opgave wordt gegeven van een `CHAR SET`. Standaard is `utf8mb4` van toepassing voor MySql, maar om goed gebruik aan te leren is het toch nuttig deze expliciet te vermelden.

#### Script bijhouden

Pas dit script aan om naast de kolom `Commentaar` ook de kolom `Voornaam` terug toe te voegen en een kolom Familienaam toe te voegen, beide `VARCHAR(100)` en niet verplicht. Sla je script opnieuw op wanneer je klaar bent. Geef het de naam 0009\_\_AlterBoeken.sql.

### beperkingen toevoegen

Het is goed om van meet af aan de integriteit van de database te denken. We gaan ervan uit dat de familienaam moet ingevuld worden. Zelfs al is de auteur onbekend, moet dan zoiets als "onbekend" worden ingevuld. Om een kolom verplicht te maken voegen we een constraint toe. In **pseudocode**:

```sql
ALTER TABLE TableName CHANGE OldColumnName NewColumnName NewColumnType;
```

In ons voorbeeld wordt het:

```sql
USE ApDb;
ALTER TABLE Boeken CHANGE Familienaam Familienaam VARCHAR(200) CHAR SET utf8mb4 NOT NULL;
```

#### Script bijhouden

Sla je script opnieuw op wanneer je klaar bent. Geef het de naam 0010\_\_AlterBoeken.sql.

### tabelnamen wijzigen

Het zou misschien te gemakkelijk geweest zijn als het wijzigigen van tabelnamen in MySQL met het ALTER statement kon worden uitgevoerd. Om de naam van een tabel te wijzigen kunnen we het `ALTER` statement niet gebruiken. Er bestaat daarvoor een apart `RENAME` statement. De generieke vorm is als volgt. Let op het gebruik van backticks rond de naam van de tabellen. Die zijn verplicht in het geval dat de naam van de tabel overeenkomt met een gereserveerd woord van MySQL:

```sql
RENAME TABLE `OldTableName` TO `NewTableName`;
```

In ons voorbeeld:

```sql
USE ApDb;
RENAME TABLE `Boeken` TO `MijnBoeken`;
```

{% hint style="info" %}
Deze wijziging hoef je niet op te slaan. Het is maar een voorbeeld.
{% endhint %}

