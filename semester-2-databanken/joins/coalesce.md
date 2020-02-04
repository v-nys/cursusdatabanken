# COALESCE

De functie `COALESCE` in SQL retourneert de eerste niet-NULL expressie tussen de argumenten.

Met de functie `coalesce` kan je aangeven wat erin een `null` kolom moet worden getoond:

```sql
SELECT Personen.Voornaam, Personen.Familienaam,
       COALESCE (Boeken.Titel, 'Geen boek opgenomen in Boeken') 
FROM Personen
LEFT JOIN Boeken ON Boeken.Personen_Id = Personen.Id
ORDER BY Personen.Familienaam, Personen.Voornaam, Boeken.Titel;
```

![left join met coalesce Boeken Personen Simone De Beauvoir](https://modernways.be/myap/it/image/sql/left%20join%20met%20coalesce%20Boeken%20Personen%20Simone%20De%20Beauvoir.png)

