# UNIQUE

De primary key is een unieke index bij creatie.

Er kan echter slechts één primary key per tabel worden gedefinieerd en indien je toch op een andere kolom ook een unieke index wil leggen kan je dit door een index te bepalen die uniek is. Je kan meerdere unieke indexen binnen één tabel hebben, maar slechts één primary key.

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

Als je de index achteraf wil bepalen doe je dit door het alter commando te gebruiken.

```sql
ALTER TABLE table_name
ADD CONSTRAINT constraint_name UNIQUE KEY(index_column_1,index_column_2,...);
```

## Voorbeeld

We creëren een tabel met een primary key en een unieke index.

```sql
CREATE TABLE IF NOT EXISTS people (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    mail VARCHAR(50) NOT NULL,
    UNIQUE KEY index_unique_mail (mail)
);
```

Met het commando `SHOW INDEXES FROM table_name`kan je zien dat de unieke index werd aangemaakt.

```sql
SHOW INDEXES FROM people;
```

![](../../.gitbook/assets/image%20%2845%29.png)

Vervolgens voegen wat data toe aan de tabel `people`.

```sql
INSERT INTO people(first_name,last_name,mail)
VALUES
('John','Doe','john.doe@modernways.be'),
('Jane','Doe','jane.doe@modernways.be'),
('John','Roe','john.roe@modernways.be'),
('Jane','Roe','jane.roe@modernways.be')
;
```

Omdat we op mail een unieke index hebben gelegd is het niet meer mogelijk personen toe te voegen met opgave van een mailadres dat al bestaat. Concreet, wanneer we Jef Doe met als mailadres john.doe@modernways.be zouden willen toevoegen, zal dit resulteren in een fout, want het opgegeven mailadres komt reeds voor.

```sql
INSERT INTO people(first_name,last_name,mail)
VALUES ('Jef','Doe','john.doe@modernways.be');
```

![](../../.gitbook/assets/image%20%2827%29.png)

![](../../.gitbook/assets/image%20%2865%29.png)

### Opgave

Schrijf het sql-statement dat ervoor zorgt indien je bovenop de unieke mailindex ook nog zou willen bepalen dat de combinatie van voornaam en achternaam uniek moet zijn.

