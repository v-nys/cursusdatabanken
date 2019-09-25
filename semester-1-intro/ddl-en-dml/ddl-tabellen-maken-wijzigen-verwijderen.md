# Basis statements DDL

## Het `CREATE` statement

### Opgelet!
Onder Unix, zijn databasenamen hoofdlettergevoelig (in tegenstelling tot SQL trefwoorden). Je moet dus je altijd verwijzen naar je database met de zelfde naam als de naam waaronder je database hebt aangemaakt. Dit geldt overigens ook voor de tabel namen. Onder Windows, is deze beperking niet van toepassing, maar je moet verwijzen naar databases en tabellen met dezelfde lettercase tijdens één en dezelfde query. Gebruik dus altijd dezelfde lettercase als die werd gebruikt bij het creëren van de database is gemaakt.

### Aanmaken van je eerste database
Gebruik het volgende SQL statement om een database te maken:

```sql
CREATE DATABASE ModernWays
```

We kunnen ook eerst nagaan als de database al bestaat:

```sql
-- If database does not exist, create the database
CREATE DATABASE IF NOT EXISTS ModernWays;
```

Het creëren van een database volstaat niet om die vervolgens te kunnen gebruiken. Je moet in een script expliciet opgeven dat je een bepaalde database wilt gebruiken met de instructie `USE`:

```sql
USE ModernWays;
```

Een database moet slechts één keer gemaakt worden, maar je moet vooraleer die te gebruiken ze telkens weer selecteren. Dat doe je met de `USE` instructie zoals in het voorgaande voorbeeld.

### Aanmaken van je eerste tabel
Het niveau onder dat van de databank is het niveau van de tabel. Een tabel bevat typisch informatie over één entiteit, bijvoorbeeld `Boek` in een bibliotheeksysteem. We vertrekken van een conceptueel model van een boek, d.w.z. welke groepering van eigenschappen één boek vormt.

TODO afbeelding invoegen

Hieronder krijg je een vereenvoudigd logisch model van een boek.

| Kolomnaam         | Type | Maximale lengte | Variabele lengte | Internationale tekens |
|-------------------|------|-----------------|------------------|-----------------------|
| Voornaam          | CHAR | 50              | JA               | JA                    |
| Familienaam       | CHAR | 80              | JA               | JA                    |
| Titel             | CHAR | 255             | JA               | JA                    |
| Stad              | CHAR | 50              | JA               | JA                    |
| Verschijningsjaar | CHAR | 4               | NEE              | NEE                   |
| Uitgeverij        | CHAR | 80              | JA               | JA                    |
| Herdruk           | CHAR | 4               | NEE              | NEE                   |
| Commentaar        | TEXT | NVT             | NA               | NA                    |

#### Benoemen van het script
TODO

#### Commentaar toevoegen


#### Database selecteren

#### Tabel aanmaken
```sql
CREATE TABLE Boeken(
    Voornaam NVARCHAR(50),
    Familienaam NVARCHAR(80),
    Titel NVARCHAR(255),
    Stad NVARCHAR(50),
    -- alleen het jaartal, geen datetime
    -- omdat de kleinste datum daarin 1753 is
    -- varchar omdat we ook jaartallen kleiner dan 1000 hebben
    Verschijningsjaar VARCHAR(4),
    Uitgeverij NVARCHAR(80),
    Herdruk CHAR(4),
    Commentaar TEXT
);
```

#### Script bijhouden
