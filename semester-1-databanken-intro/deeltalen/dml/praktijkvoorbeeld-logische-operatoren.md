# Werken met samengestelde logische operatoren
## alleen `OR`
Waarschijnlijk zal je nergens méér gebruik maken van booleaanse expressies dan in de `WHERE`-clausule. Een voorbeeldje (0022\_\_SelectBoeken.sql) toont hoe dit werkt:

```sql
USE ModernWays;
SELECT Familienaam, Titel FROM Boeken
WHERE Familienaam = 'Augustinus' OR Familienaam = 'Visser';
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
WHERE Familienaam = 'Augustinus' OR 'Visser';
```

**Dit is verkeerd!** Wat aan de linkerkant van `OR` staat is inderdaad een booleaanse expressie, maar `'Visser'` is tekst. Dit zal je dus een fout opleveren. Later zie je hoe je wel wat schrijfwerk kan besparen met de `IN`-operator.

## combinatie `AND` en `OR`
Je wil alle wiskunde boeken van Aveni en Hawkins. Welke expressie moet je hiervoor gebruiken?

"Alle wiskundeboeken" wil zeggen alle boeken waarvan in de kolom `Categorie` de waarde `'Wiskunde'` staat:

```sql
Categorie = 'Wiskunde'
```

Alle boeken van Aveni dat schrijf je als:

```sql
Familienaam = 'Aveni'
```

Alle boeken van De Roover, dat schrijf je als:

```sql
Familienaam ='De Roover'
```

Dus alle wiskunde boeken van Aveni en van De Roover zou je kunnen schrijven als:

```sql
USE ModernWays;
SELECT Familienaam, Titel FROM Boeken
WHERE Categorie = 'Wiskunde' AND Familienaam = 'Aveni' OR Familienaam = 'De Roover';
```

Sla op als (0024\_\_SelectBoeken.sql) en probeer uit. Wat blijkt? We krijgen boeken van De Roover die niet over wiskunde gaan. Dit komt omdat, net als de typische rekenkundige operatoren (`+`, `*`, e.d.) de logische operatoren een zekere voorrang krijgen. Meerbepaald: `AND` heeft voorrang op `OR`, dus bovenstaand script is hetzelfde als:

```sql
USE ModernWays;
SELECT Familienaam, Titel FROM Boeken
WHERE (Categorie = 'Wiskunde' AND Familienaam = 'Aveni') OR Familienaam = 'De Roover';
```

Er zijn twee mogelijkheden om dit op te lossen (sla op als 0025\_\_SelectBoeken.sql en 0026\_\_SelectBoeken.sql):


```sql
USE ModernWays;
SELECT Familienaam, Titel FROM Boeken
    WHERE Categorie = 'Wiskunde' AND Familienaam = 'Aveni'
       OR Categorie = 'Wiskunde' AND Familienaam = 'Hawking';
```
```sql
USE ModernWays
SELECT Familienaam, Titel FROM Boeken
    WHERE Categorie = 'Wiskunde'
      AND (Familienaam = 'Aveni' OR Familienaam = 'Hawking');
```
