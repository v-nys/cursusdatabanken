# Primaire sleutel toevoegen/verwijderen voor een bestaande tabel
{% hint style="info" %}
We vertrekken hier van 0055\_\_CalibrateDB.sql.
{% endhint %}
## de basis
We voegen een `Id` kolom toe aan de tabel `Boeken` die we als primaire sleutel gaan gebruiken.

Om een primaire sleutel toe te voegen aan een reeds bestaande tabel, gebruik je de DDL `ALTER TABLE` instructie in combinatie met een DDL `ADD` instructie:

```sql
ALTER TABLE Boeken ADD Id INT auto_increment PRIMARY KEY;
```

Sla die instructie op in 0056\_\_AlterBoeken.sql.

Je kan ook nagaan of de primaire sleutel is toegevoegd door het volgende statement uit te voeren:

```sql
SHOW COLUMNS FROM Boeken;
```

Het feit dat een kolom een primaire sleutel is, is een **constraint**.
Men spreekt van een constraint als iets een beperking is.
Als je een rij zou toevoegen met een `Id` waarvan de waarde reeds in een andere rij bestaat, krijg je een foutmelding.
Een ander (en reeds gekend) voorbeeld van een constraint is `NOT NULL`.
Deze constraint is zwakker dan de `PRIMARY KEY` constraint (omdat NULL niet geschikt is om een rij te identificeren), dus je hoeft ze nooit toe te voegen aan een kolom die dient als primaire sleutel.

# `AUTO_INCREMENT`

Het is beter om de `Id` door SQL zelf te laten toekennen. Zo hoef je niet telkens na te kijken welke waarde beschikbaar is voor `Id`.
Om dat te doen, gebruik je de eigenschap `AUTO_INCREMENT`.
Als je een nieuwe tabel maakt voeg je de eigenschap toe na de declaratie van de kolom.
Zorg ervoor dat je op die kolom een primary key constraint hebt staan:

```sql
USE ModernWays;
CREATE TABLE Personen (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Voornaam varchar(255) char set utf8mb4 NOT NULL,
    Familienaam varchar(255) char set utf8mb4,
    Leeftijd int
);
```

Sla op als 0057\_\_CreatePersonen.sql.

Je kan de beginwaarde zelf bepalen.
Bijvoorbeeld, als je de boeken wil nummeren vanaf 5 in plaats van 1 (de default):

```sql
ALTER TABLE Boeken AUTO_INCREMENT = 5;
```

Dit kan van pas komen als je al wat data hebt en SQL alleen voor de nieuwe data zelf de nummers wil laten genereren.

{% hint style="info" %}
Eerder hebben we `AUTO_INCREMENT` al gebruikt voor boeken. Bekijk eens wat er gebeurd was als je `AUTO_INCREMENT` in dat script achterwege had gelaten.
{% endhint %}

# Primary key constraints verwijderen

Een constraint behoort tot de definitie van de tabel, dus moet je DROP gebruiken:

```sql
USE ModernWays;
ALTER TABLE Boeken DROP PRIMARY KEY;
```

Je kan dus geen kolom verwijderen waarop een (primary) key constraint ligt. Je moet eerst de constraint verwijderen:

```sql
alter table Boeken drop primary key;
alter table Boeken drop column Id;
```

Dan kan je eventueel de kolom weer toevoegen:

```sql
use ModernWays;
ALTER TABLE Boeken ADD Id INT auto_increment PRIMARY KEY;
```

