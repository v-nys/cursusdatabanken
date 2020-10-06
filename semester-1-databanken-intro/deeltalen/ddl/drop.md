# DROP

## `DROP DATABASE`

Om een database te verwijderen, gebruik je een statement van de vorm `DROP DATABASE`, gevolgd door de naam van de databank. Als je niet zeker bent dat deze database bestaat en je een foutmelding wil vermijden, gebruik dan `drop database if exists`.

## `DROP TABLE`

Hier is de syntax gelijkaardig, maar je moet de database kiezen waaruit je een tabel laat vallen. 

Bijvoorbeeld:

```sql
USE ApDB;
DROP TABLE IF EXISTS Boeken;
```

### uitproberen

Schrijf eerst een script, 0004\_\_DropTables.sql, dat de tabel `Kunstwerken` verwijdert op voorwaarde dat deze aanwezig is in de database.

