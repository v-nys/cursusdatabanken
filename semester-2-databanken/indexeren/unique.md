# UNIQUE

De primary key is een unieke index bij creatie. Er kan echter slechts één primary key per tabel worden gedefinieerd en indien je toch op een andere kolom ook een unieke index wil leggen kan je dit door een index te bepalen die uniek is. Je kan meerdere unieke indexen binnen één tabel hebben, maar slechts één primary key. De data zullen dan niet fysiek opgeslagen zijn in volgorde van deze unieke index, maar er zal wel een hulpstructuur bijgehouden worden die voor elke unieke waarde zegt waar je ze kan terugvinden.

```sql
CREATE UNIQUE INDEX index_name
ON table_name(index_column_1,index_column_2,...);
```

Er zijn twee manieren om een unieke index te creëren, de eerste bij creatie van de tabel of in het tweede geval nadien.

Bij creatie van de tabel doe je dit als volgt.

```sql
CREATE TABLE table_name(
//...
UNIQUE KEY(index_column_1,index_column_2,...) 
);
```

Deze syntax is algemeen en zegt dat een **combinatie** van waarden uniek moet zijn. Als je index maar één kolom gebruikt, kan je dit doen met een `UNIQUE` constraint op die kolom, bijvoorbeeld:

```sql
CREATE TABLE table_name(
//...
ColName VARCHAR(100) UNIQUE
);
```

## Voorbeeld

We creëren een tabel met een primary key en een unieke index.

```sql
CREATE TABLE IF NOT EXISTS People (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    mail VARCHAR(50) NOT NULL,
    UNIQUE KEY index_unique_mail (mail)
);
```

Met het commando `SHOW INDEXES FROM table_name`kan je zien dat de unieke index werd aangemaakt.

```sql
SHOW INDEXES FROM People;
```

![](<../../.gitbook/assets/image (23).png>)

Vervolgens voegen wat data toe aan de tabel `People`.

```sql
INSERT INTO People(first_name,last_name,mail)
VALUES
('John','Doe','john.doe@modernways.be'),
('Jane','Doe','jane.doe@modernways.be'),
('John','Roe','john.roe@modernways.be'),
('Jane','Roe','jane.roe@modernways.be')
;
```

Omdat we op mail een unieke index hebben gelegd is het niet meer mogelijk personen toe te voegen met opgave van een mailadres dat al bestaat. Concreet, wanneer we Jef Doe met als mailadres john.doe@modernways.be zouden willen toevoegen, zal dit resulteren in een fout, want het opgegeven mailadres komt reeds voor.

```sql
INSERT INTO People(first_name,last_name,mail)
VALUES ('Jef','Doe','john.doe@modernways.be');
```

![](<../../.gitbook/assets/image (44).png>)

![](<../../.gitbook/assets/image (60).png>)

### Opgave

Schrijf het sql-statement dat ervoor zorgt indien je bovenop de unieke mailindex ook nog zou willen bepalen dat de combinatie van voornaam en achternaam uniek moet zijn.

{% hint style="warning" %}
Wat met `NULL`-waarden in combinatie met unieke indexen? Zie [de officiële documentatie](https://dev.mysql.com/doc/refman/8.0/en/create-index.html#create-index-unique). De waarden zijn dus niet noodzakelijk 100% uniek, dit in tegenstelling tot sommige andere databasesystemen.
{% endhint %}
