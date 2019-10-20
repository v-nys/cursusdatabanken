# Werken met samengestelde logische operatoren
## alleen `OR`
Waarschijnlijk zal je nergens méér gebruik maken van booleaanse expressies dan in de `WHERE`-clausule. Een voorbeeldje (0022\_\_SelectBoeken.sql) toont hoe dit werkt:

```sql
USE ModernWays;
SELECT Familienaam, Titel FROM Boeken
WHERE Familienaam = 'Augustinus' OR Familienaam = 'Batens';
```

Als je een auteur ingeeft die niet in de databank aanwezig is, wordt er geen fout gemeld, maar zijn er gewoon geen resultaten (0023\_\_SelectBoeken.sql):

```sql
USE ModernWays;
SELECT Familienaam, Titel FROM Boeken
WHERE Familienaam = 'De Bel';
```

Merk op: de `OR` vormt een grote booleaanse expressie door zelf twee booleaanse expressies te verbinden. Beginners proberen vaak volgende "kortere" versie:

```sql
USE ModernWays;
SELECT Familienaam, Titel FROM Boeken
WHERE Familienaam = 'Augustinus' OR 'Batens';
```

**Dit is verkeerd!** Wat aan de linkerkant van `OR` staat is inderdaad een booleaanse expressie, maar `'Batens'` is tekst. Dit zal je dus een fout opleveren. Later zie je hoe je wel wat schrijfwerk kan besparen met de `IN`-operator.

## combinatie `AND` en `OR`
Voer eerst volgend script (0024\_\_InsertBoeken.sql) uit:

```sql
USE ModernWays;
INSERT INTO Boeken(Voornaam,Familienaam,Titel,Categorie)
VALUES
('Stephen','Hawking','The Nature of Space and Time','Wiskunde'),
('Stephen','Hawking','Antwoorden op de grote vragen','Filosofie'),
('William','Dunham','Journey through Genius: The Great Theorems of Mathematics','Wiskunde'),
('William','Dunham','Euler: The Master of Us All','Geschiedenis');
```

Je wil alle wiskunde boeken van Dunham en Hawking. Welke expressie moet je hiervoor gebruiken?

"Alle wiskundeboeken" wil zeggen alle boeken waarvan in de kolom `Categorie` de waarde `'Wiskunde'` staat:

```sql
Categorie = 'Wiskunde'
```

Alle boeken van Dunham dat schrijf je als:

```sql
Familienaam = 'Dunham'
```

Alle boeken van Hawking, dat schrijf je als:

```sql
Familienaam ='Hawking'
```

Dus alle wiskunde boeken van Dunham en van Hawking zou je kunnen schrijven als:

```sql
USE ModernWays;
SELECT Familienaam, Titel, Categorie FROM Boeken
WHERE Categorie = 'Wiskunde' AND Familienaam = 'Dunham' OR Familienaam = 'Hawking';
```

Sla op als (0025\_\_SelectBoeken.sql) en probeer uit. Wat blijkt? We krijgen boeken van Hawking die niet over wiskunde gaan. Dit komt omdat, net als de typische rekenkundige operatoren (`+`, `*`, e.d.) de logische operatoren een zekere voorrang krijgen. Meerbepaald: `AND` heeft voorrang op `OR`, dus bovenstaand script is hetzelfde als:

```sql
USE ModernWays;
SELECT Familienaam, Titel FROM Boeken
WHERE (Categorie = 'Wiskunde' AND Familienaam = 'Dunham') OR Familienaam = 'Hawking';
```

Er zijn twee mogelijkheden om dit op te lossen (sla op als 0026\_\_SelectBoeken.sql en 0027\_\_SelectBoeken.sql):


```sql
USE ModernWays;
SELECT Familienaam, Titel FROM Boeken
    WHERE Categorie = 'Wiskunde' AND Familienaam = 'Dunham'
       OR Categorie = 'Wiskunde' AND Familienaam = 'Hawking';
```
```sql
USE ModernWays
SELECT Familienaam, Titel FROM Boeken
    WHERE Categorie = 'Wiskunde'
      AND (Familienaam = 'Dunham' OR Familienaam = 'Hawking');
```
