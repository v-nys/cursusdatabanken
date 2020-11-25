# Primaire sleutel in een nieuwe tabel

Het is niet erg handig om telkens de primaire sleutel achteraf toe te voegen. Als je een nieuwe tabel maakt, kan je in één keer een kolom aanduiden als primaire sleutel:

```sql
USE ApDB;
DROP TABLE IF EXISTS Boeken;

CREATE TABLE Boeken(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Voornaam varchar(50) char set utf8mb4,
    Familienaam varchar(80) char set utf8mb4,
    Titel varchar(255) char set utf8mb4,
    Uitgeverij varchar(255) char set utf8mb4,
    Stad varchar(50) char set utf8mb4,
    Verschijningsdatum varchar(4),
    Herdruk varchar(4),
    Commentaar varchar(2000) char set utf8mb4,
    Categorie varchar(120) char set utf8mb4
);
```

Deze hoef je niet uit te voeren.

