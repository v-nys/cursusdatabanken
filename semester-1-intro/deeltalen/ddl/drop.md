# DROP

## `DROP DATABASE`

Om een database te verwijderen, gebruik je een statement van de vorm `DROP DATABASE`, gevolgd door de naam van de databank.

### uitproberen

Schrijf een script, 0006\_\_DropModernWays.sql, dat je databank volledig verwijdert. Schrijf daarna een script, 0007\_\_CreateModernWays.sql, dat je databank terug herstelt, exact zoals ze was voor je ze gewist hebt.

## `DROP TABLE`

Hier is de syntax gelijkaardig, maar je moet de database kiezen waaruit je een tabel laat vallen. Bijvoorbeeld:

```sql
USE ModernWays;
DROP TABLE Boeken;
```

### uitproberen

Schrijf eerst een script, 0008\_\_CreateMovies.sql, dat een tabel aanmaakt met precies één verplichte kolom, van type `VARCHAR(50)` (met ondersteuning voor internationale karakters) en met naam `Titel`. Schrijf daarna een script, 0009\_\_DropMovies.sql, dat deze tabel weer verwijdert.

