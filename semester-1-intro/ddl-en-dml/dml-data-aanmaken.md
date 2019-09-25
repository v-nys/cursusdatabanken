# Basis DML
De DML (Data Manipulation Language) is het deel van SQL waarmee je de data zelf aanpast. Het eerste DML-statement dat je kan gebruiken, is het `INSERT`-statement. Met een `INSERT` statement kan je één of meerdere records toevoegen aan een tabel.

## vorm
Het is een goed idee om met een 'stub' te beginnen, een 'skelet' statement. Voor een tabel `Boek` ziet dit er zo uit:

```sql
insert into Boek (
-- TODO: invullen
)
values (
-- TODO: invullen
);
```

## in te vullen data
Je moet waarden plaatsen in alle kolommen die niet gemarkeerd zijn als verplicht. Eerder hebben we de familienaam verplicht gemaakt. Je kan dus het volgende niet uitvoeren:

```sql
USE ModernWays;

INSERT INTO Boek(
   Voornaam
)
VALUES (
   'Aurelius'
);
```

Als je het toch probeert, krijg je een melding als deze: "Cannot insert the value NULL into column 'Familienaam', table 'A88586ModernWays.dbo.Boek'; column does not allow nulls. INSERT fails." Lees de fout aandachtig. Het systeem vertelt ons dat we een familienaam *moeten* invullen.

Een tweede poging:

```sql
USE ModernWays;

INSERT INTO Boek(
   Voornaam,
   Familienaam
)
VALUES (
   'Aurelius',
   'Augustinus'
);
```

Je kan nakijken of de rij wel degelijk is toegevoegd met het `SELECT` statement. Selecteer alle kolommen (*) van de tabel Boek:

```sql
SELECT * FROM Boek;
```
