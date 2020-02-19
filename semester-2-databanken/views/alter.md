# ALTER

## Syntax

```sql
ALTER VIEW bestaandeviewnaam
AS
SELECT ??? -- alsof je de view opnieuw definieert
```

## Voorbeeld

```sql
ALTER VIEW TakenLeden
AS
SELECT Leden.Voornaam, Taken.Omschrijving, Taken.Id AS 'Taken_Id'
FROM Taken
INNER JOIN Leden ON Leden.Id = Taken.Leden_Id;
```

