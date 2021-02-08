# RIGHT JOIN

{% hint style="success" %}
[Kennisclip](https://youtu.be/X5EvIazPais)
{% endhint %}

**Syntax**

```sql
SELECT <kolommen uit A of uit B>
FROM A
RIGHT JOIN B
-- opnieuw: schrijfwijze hangt af van waar foreign key staat
ON A.B_Id = B.Id
```

![Venn diagram right join](https://modernways.be/myap/it/image/sql/venn%20diagram%20right%20join.png)

Als ik de tabellen in de select statement switch en `Boeken` links en `Personen` rechts zet, gaat Simone de Beauvoir getoond worden?

```sql
SELECT Personen.Voornaam, Personen.Familienaam,
       COALESCE (Boeken.Titel, 'Geen boek opgenomen in Boeken') 
FROM Boeken
LEFT JOIN Personen on Boeken.Personen_Id = Personen.Id
ORDER BY Personen.Familienaam, Personen.Voornaam, Boeken.Titel;
```

Geen Simone de Beauvoir te zien. Hoe kan ik Simone tonen \(zonder de volgorde opnieuw te switchen naar het origineel\):

Door een `RIGHT JOIN`:

```sql
SELECT Personen.Voornaam, Personen.Familienaam,
       COALESCE (Boeken.Titel, 'Geen boek opgenomen in Boeken') 
FROM Boeken
RIGHT JOIN Personen ON Boeken.Personen_Id = Personen.Id
ORDER BY Personen.Familienaam, Personen.Voornaam, Boeken.Titel;
```

Simone De Beauvoir wordt getoond en de coalesce functie doet haar werk:

![right join met coalesce Boeken Personen Simone De Beauvoir](https://modernways.be/myap/it/image/sql/right%20join%20met%20coalesce%20Boeken%20Personen%20Simone%20De%20Beauvoir.png)

Hier merk je wel dat de derde kolomhoofding niet elegant is. Je kan die zelf opgeven in het select statement door een alias mee te geven:

```sql
SELECT Personen.Voornaam, Personen.Familienaam,
       COALESCE (Boeken.Titel, 'Geen boek opgenomen in Boeken')
       AS 'Titel van het boek'
FROM Boeken
RIGHT JOIN Personen ON Boeken.Personen_Id = Personen.Id
ORDER BY Personen.Familienaam, Personen.Voornaam, Boeken.Titel;
```

![right join met coalesce en kolomtitel Boeken Personen Simone De Beauvoir](https://modernways.be/myap/it/image/sql/right%20join%20met%20coalesce%20en%20kolomtitel%20%20Boeken%20Personen%20Simone%20De%20Beauvoir.png)

