# CREATE

## Syntax

```sql
CREATE VIEW viewnaam
AS
SELECT kolomnaam
FROM tabelnaam
INNER JOIN tabelnaam ON kolomnaam = kolomnaam;
```

## Voorbeeld

We baseren ons voorbeeld op onderstaand tabellen taken en leden.

**Taken**

| omschrijving | Id |
| :--- | :--- |
| bestek voorzien | 1 |
| frisdrank meebrengen | 2 |
| aardappelsla maken | 3 |

**Leden**

| voornaam | Id | Taken\_Id |
| :--- | :--- | :--- |
| Yannick | 1 | 2 |
| Bavo | 2 | 1 |
| Max | 3 | 3 |

Het uitganspunt van een view is bepaalde data die afkomstig is uit verschillende tabellen samen te brengen en te benaderen als één nieuwe virtuele tabel.

Onderstaande query haalt bepaalde data op uit de tabellen taken en leden.

```sql
SELECT Leden.voornaam, Taken.omschrijving
FROM Taken
INNER JOIN Leden
ON Taken.Id = Taken_Id;
```

Als we het resultaat van bovenstaande query willen opslaan in een view, doen we dit op volgende manier:

```sql
CREATE VIEW takenLeden
AS
SELECT Leden.voornaam, Taken.omschrijving
FROM Taken
INNER JOIN Leden ON Taken.Id = Taken_Id;
```

Eens je bovenstaande query `CREATE VIEW` hebt uitgevoerd wordt de view bewaard in de database.

Nu kan je deze view bevragen zoals een gewone tabel.

```sql
SELECT *
FROM takenLeden;
```

Wel belangrijk te weten dat een view de data niet fysisch bevat, maar telkens de query zal uitvoeren.

