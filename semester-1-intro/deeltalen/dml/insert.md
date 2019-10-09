# INSERT

## Aanmaken van je eerste concrete data

Er is een vaste syntax om data in je databank te plaatsen, waar je even aan zal moeten wennen. Het is een goed idee om met een 'stub' te beginnen, een 'skelet' statement. Voor een tabel `Boeken` ziet dit er zo uit, voor een enkel nieuw record:

```sql
INSERT INTO Boeken (
-- hier moet je gebruikte kolomnamen invullen
)
VALUES (
-- hier moet je waarden voor de gebruikte invullen
);
```

Probeer het eens uit:

```sql
USE ModernWays;
INSERT INTO Boeken (
Voornaam
)
VALUES (
'Aurelius'
);
```

Dit zou... fout moeten lopen! Je krijgt een foutmelding ongeveer zoals deze: "Cannot insert the value NULL into column 'Familienaam', table 'ModernWays.dbo.Boeken'; column does not allow nulls. INSERT fails."

Omdat we hebben vereist in een eerder script dat de achternaam van een auteur en de categorie altijd aanwezig zijn, moeten we deze aanduiden als gebruikte kolommen:

```sql
USE ModernWays;
INSERT INTO Boeken (
Voornaam,
Familienaam,
Categorie
)
VALUES (
'Aurelius',
'Augustinus',
'Filosofie'
);
```

Dit zou moeten werken. Sla dit op als 0013\_\_InsertBoek.sql. Merk op: de volgorde van de vernoemde kolommen moet overeenstemmen met de volgorde van de waarden!

## Meer data in één keer

Je hoeft geen `INSERT` statement te schrijven per stukje data. Je kan meerdere rijen tegelijk invoegen door ze te scheiden met komma's:

```sql
USE ModernWays;
INSERT INTO Boeken (
   Voornaam,
   Familienaam,
   Titel,
   Stad,
   Verschijningsjaar,
   Uitgeverij,
   Herdruk,
   Commentaar,
   Categorie,
   IngevoegdDoor
)
VALUES
('Gerard', 'Visser', 'Heideggers vraag naar de techniek', 'Nijwegen', '2014', '', '', '', '', ''),
('Diderik', 'Batens', 'Logicaboek', '', '1999', '', '', '', '', '')
```

Sla dit op als 0014\_\_InsertBoeken.sql. Merk op dat de komma's **binnen** de haakjes onderdelen van één rij scheiden, terwijl die **buiten** de haakjes de verschillende rijen scheiden.
