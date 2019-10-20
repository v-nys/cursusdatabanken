# `SELECT` met `WHERE`

In de meeste gevallen zijn we niet geïnterresseerd om alle rijen uit een tabel te selecteren. We willen over de mogelijkheid beschikken om alleen de rijen, die aan een bepaalde voorwaarde voldoen, te kunnen selecteren.

De oplossing bestaat erin de `WHERE`-clausule te gebruiken. De `WHERE`-clausule bevat een **booleaanse expressie**. Dit is een expressie die als resultaat voor een bepaalde rij in principe `TRUE` of `FALSE` moet opleveren. In tegenstelling tot de meeste programmeertalen gebruikt SQL ook een derde mogelijke waarde: `NULL`. Deze waarde komt voor wanneer we niet kunnen bepalen of iets waar of niet waar is.

Om de `WHERE` te gebruiken, zet je hem na de `FROM Tabel`.

Bijvoorbeeld (sla op als 0018\_\_SelectBoeken.sql):

```sql
USE ModernWays;
SELECT Voornaam, Familienaam, Titel 
FROM Boeken
-- deze vergelijking levert TRUE of FALSE of NULL op
WHERE Familienaam = 'Augustinus';
```

Ofwel (sla op als 0019\_\_SelectBoeken.sql):

```sql
USE ModernWays;
SELECT Voornaam, Familienaam, Titel 
FROM Boeken
WHERE Voornaam = 'Gerard';
```

Je krijgt `NULL` wanneer je bijvoorbeeld vergelijkt met een niet-ingevulde waarde, ook geschreven als `NULL`. Zelfs `NULL` is niet gelijk aan `NULL`. Probeer maar eens alle boeken zonder titel op te vragen met een vergelijking (0020\_\_SelectBoeken.sql):

```sql
USE ModernWays;
SELECT Voornaam, Familienaam, Titel 
FROM Boeken
WHERE Titel = NULL;
```

Maar probeer ook deze eens (0021\_\_SelectBoeken.sql):

```sql
USE ModernWays;
SELECT Voornaam, Familienaam, Titel 
FROM Boeken
-- <> betekent het omgekeerde van =
WHERE Titel <> NULL;
```

**Het ligt niet aan de data! Vergelijkingen met `NULL` via `=` en `<>` zijn zinloos!**

{% hint style="info" %}
Wat je hier leert over `WHERE` is overdraagbaar naar andere DML-statements. Je kan bijvoorbeeld enkel specifieke rijen updaten of wissen.
{% endhint %}
