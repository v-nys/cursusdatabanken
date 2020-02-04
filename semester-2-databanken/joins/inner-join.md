# INNER JOIN

Deze is in het eerste semester al aan bod gekomen. We herhalen hem hier en we introduceren een visueel geheugensteuntje.

## Syntax

```sql
-- de gebruikte kolommen hoeven niet Key te heten
-- ze mogen ook een verschillende naam hebben in tabel A dan in tabel B
SELECT <select_list> 
FROM Table_A
INNER JOIN Table_B ON Table_A.Key = Table_B.Key
```

![venn diagram inner join](https://modernways.be/myap/it/image/sql/venn%20diagram%20inner%20join.png)

### Betekenis
We combineren informatie uit twee tabellen: de linkertabel (`A`) en de rechtertabel (`B`). We zeggen dat er overlapping is tussen de tabellen als de gebruikte sleutelkolommen dezelfde waarde bevatten. Het stuk van `A` dat we bekijken (`Table_A.Key`) matcht met het stuk van `B` dat we bekijken (`Table_B.Key`) en dat tekenen we als een overlappend gedeelte.

## Voorbeeld
Het diagram met de naam A staat voor de tabel `Boeken` en met de naam B voor `Personen`.

Selecteer alle boeken en toon de voornaam en de familienaam van de `auteur`. De 'master' tabel is in dat geval `Boeken` en de 'slave' tabel `Personen`.

```sql
SELECT Personen.Voornaam, Personen.Familienaam,
       Boeken.Titel 
FROM Boeken
INNER JOIN Personen ON Boeken.Personen_Id = Personen.Id;
```

Voor elke rij uit de tabel `Boeken` wordt er opgezocht als er met de waarde die in de foreign key kolom `Personen_Id` van `Boeken` een waarde bestand in de primary key kolom `Id` van `Personen`. Als er een match in wordt de rij geselecteerd. Indien er geen match is wordt de rij in de tabel `Boeken` genegeerd.

We wijzigen de vraag lichtjes en willen nu alle auteurs zien en de boeken die ze geschreven hebben. We ordenen de lijst op `Familienaam`, `Voornaam`, `Titel`

```sql
SELECT Personen.Voornaam, Personen.Familienaam,
       Boeken.Titel 
FROM Personen
INNER JOIN Boeken ON Boeken.Personen_Id = Personen.Id
ORDER BY Personen.Voornaam, Personen.Familienaam, Boeken.Titel;
```

Dat resulteert in indentiek dezelfde lijst.

We voegen een nieuwe persoon toe in de tabel `Personen`:

```sql
INSERT INTO Personen (
   Voornaam, 
   Familienaam,
   AanspreekTitel,
   Straat, 
   Huisnummer,
   Stad, 
   Commentaar,
   Biografie
)
VALUES
(
   'Simone', 
   'De Beauvoir', 
   'Mevrouw',
   'Rue Charles De Gaulle', 
   '38', 
   'Paris', 
   'Feministe',
   'Compagnon van Jean-Paul Sartre'
);
```

We selecteren alle personen geordend op `Familienaam` en `Voornaam`:

```sql
SELECT * FROM Personen
ORDER BY Familienaam, Voornaam;
```

En we zien dat Simone De Beauvois is toegevoegd.

Alle auteurs en hun boeken te selecteren, maar ordenen de lijst nu op `Familienaam`, `Voornaam` en `Titel`:

```sql
SELECT Personen.Voornaam, Personen.Familienaam,
       Boeken.Titel 
FROM Personen
INNER JOIN Boeken ON Boeken.Personen_Id = Personen.Id
ORDER BY Personen.Familienaam, Personen.Voornaam, Boeken.Titel;
```

Nu merken we dat Simone De Beauvoir niet meer in de lijst voorkomt. Dat komt doordat er voor Simone de Beauvoir geen boeken in de boekentabel zijn opgenomen.

Een `inner join` gaat alleen die personen tonen waarvoor een match in de tabel Boeken wordt gevonden.inner join Boeken Personen Simone De Beauvoir

![inner join Boeken Personen Simone De Beauvoir](https://modernways.be/myap/it/image/sql/inner%20join%20Boeken%20Personen%20Simone%20De%20Beauvoir.png)

