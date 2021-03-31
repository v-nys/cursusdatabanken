# BETWEEN

Vaak zijn we geïnteresseerd in een specifieke deel data. Bijvoorbeeld alle personen in een bepaalde leeftijdscategorie. We kunnen dit al schrijven als volgt \(in dit geval voor grote puppy's in plaats van personen\):

```sql
USE ApDB;
SELECT *
FROM Honden
WHERE Leeftijd >= 1 AND Leeftijd <= 2;
```

Een beetje zoals bij de syntax die we hebben ingekort met `IN` zitten we hier met overbodig schrijfwerk. We kunnen dit oplossen met `BETWEEN ... AND ...` \(`0055__SelectHonden.sql`\):

```sql
USE ApDB;
SELECT *
FROM Honden
WHERE Leeftijd BETWEEN 1 AND 2;
```

Let op: hier is `AND` op zich geen booleaanse operator, maar `BETWEEN ... AND ...` is wel een tweedelige booleaanse operator. Met andere woorden, `1 AND 2` hierboven levert je **geen** booleaanse waarde op, terwijl de meeste voorkomens van `AND` dat wel doen. Omdat `BETWEEN ... AND ...` een booleaanse operator is, kan je ook dit doen:

```sql
SELECT 'c' BETWEEN 'a' AND 'e';
```

En je kan \(zoals overal waar je een string gebruikt\) de gebruikte collation wijzigen:

```sql
SELECT 'C' COLLATE utf8mb4_0900_bin BETWEEN 'a' AND 'e';
```

