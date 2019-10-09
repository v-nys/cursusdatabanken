# ALTER

## `ALTER TABLE`

`ALTER TABLE` verandert de structuur van een tabel, zonder bestaande data te beschadigen. Je kan het gebruiken om kolommen toe te voegen of te verwijderen. Je kan het ook gebruiken om het soort data in een kolom aan te passen, specifieker of juist breder te maken. Voor deze taken heb je binnenin een `ALTER TABLE` statement extra clausules nodig.

{% hint style="info" %}
Maak voor jezelf een cheat sheet van de verschillende clausules die je in `ALTER TABLE` kan gebruiken!
{% endhint %}

### een kolom schrappen

```sql
USE ModernWays;
ALTER TABLE Boeken DROP COLUMN Commentaar;
```

#### Script bijhouden

Sla je script opnieuw op wanneer je klaar bent. Geef het de naam 0003\_\_AlterBoeken.sql.

### een kolom toevoegen

Om een kolom toe te voegen maak je gebruik van de `ADD` clausule bij het ALTER statement. Je zou hier misschien het woordje `CREATE` verwachten. In SQL gebruik je namelijk het keyword `CREATE` om een structuur aan te maken. Maar binnenin `ALTER` is het dus `ADD`!

```sql
-- herstel de kolom
-- deze mag tot 150 (mogelijk internationale) karakters bevatten
USE ModernWays;
ALTER TABLE Boeken ADD COLUMN Commentaar VARCHAR(150) CHAR SET utf8mb4;
```

#### Script bijhouden

Sla je script opnieuw op wanneer je klaar bent. Geef het de naam 0004\_\_AlterBoeken.sql.

### beperkingen toevoegen

Het is goed om van meet af aan de integriteit van de database te denken. We gaan ervan uit dat de familienaam moet ingevuld worden. Zelfs al is de auteur onbekend, moet dan zoiets als "onbekend" worden ingevuld. Om een kolom verplicht te maken voegen we een constraint toe. In **pseudocode**:

```sql
ALTER TABLE TableName CHANGE OldColumnName NewColumnName NewColumnType;
```

In ons voorbeeld wordt het:

```sql
USE ModernWays;
ALTER TABLE Boeken CHANGE Familienaam Familienaam VARCHAR(200) CHAR SET utf8mb4 NOT NULL;
```

#### Script bijhouden

Sla je script opnieuw op wanneer je klaar bent. Geef het de naam 0005\_\_AlterBoeken.sql.

### tabelnamen wijzigen

Het zou misschien te gemakkelijk geweest zijn als het wijzigigen van tabelnamen in MySQL met het ALTER statement kon worden uitgevoerd. Om de naam van een tabel te wijzigen kunnen we het `ALTER` statement niet gebruiken. Er bestaat daarvoor een apart `RENAME` statement. De generieke vorm is als volgt. Let op het gebruik van backticks rond de naam van de tabellen. Die zijn verplicht in het geval dat de naam van de tabel overeenkomt met een gereserveerd woord van MySQL:

```sql
RENAME TABLE `OldTableName` TO `NewTableName`;
```

In ons voorbeeld:

```sql
USE ModernWays;
RENAME TABLE `Boeken` TO `MijnBoeken`;
```

{% hint style="info" %}
Deze wijziging hoef je niet op te slaan.
{% endhint %}

