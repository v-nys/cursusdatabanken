# LEFT JOIN

**Syntax**

```sql
SELECT <select_list>
FROM Table_A 
LEFT JOIN Table_B 
ON Table_A.Key = Table_B.Key
```

![venn diagram left join](https://modernways.be/myap/it/image/sql/venn%20diagram%20left%20join.png)

venn diagram left join

Als je alle personen wilt tonen ongeacht of ze een boek hebben geschreven of niet kan je een left join gebruiken. De 'linkse' tabel is de master tabel. Dus met een `left join` worden alle rijen uit de linkse tabel `Personen` geselecteerd ongeacht of ze een boek hebben geschreven of niet.

```sql
SELECT Personen.Voornaam, Personen.Familienaam,
       Boeken.Titel 
FROM Personen
LEFT JOIN Boeken ON Boeken.Personen_Id = Personen.Id
ORDER BY Personen.Familienaam, Personen.Voornaam, Boeken.Titel;
```

Simone is nu wel geselecteerd. Maar er is geen boek van haar aanwezig in de tabel `Boeken`, dus staat de `Titel` op `null`.left join Boeken Personen Simone De Beauvoir

![left join Boeken Personen Simone De Beauvoir](https://modernways.be/myap/it/image/sql/left%20join%20Boeken%20Personen%20Simone%20De%20Beauvoir.png)

