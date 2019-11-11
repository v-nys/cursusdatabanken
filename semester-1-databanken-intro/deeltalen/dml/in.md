# Snel vergelijken met meerdere waarden: IN

## `IN` voor verkorte notatie
Soms wordt de SQL-basissyntax wat langdradig. Een voorbeeld daarvan is als je verschillende waarden tegelijk wil onderzoeken. Het kan bijvoorbeeld zijn dat je enkel in bepaalde honden geïnteresseerd bent, waarvan je de naam al kent. Bijvoorbeeld Bailey, Cookie, Lola, Iggy, Snoopy en Leo.

Een logge manier om hun gegevens op te vragen is deze, die je al kent:

```sql
USE ModernWays;
SELECT *
FROM Honden
WHERE Naam = 'Bailey'
OR    Naam = 'Cookie'
OR    Naam = 'Lola'
OR    Naam = 'Iggy'
OR    Naam = 'Snoopy'
OR    Naam = 'Leo'
```

We moeten steeds het gedeelte `Naam = ` herhalen. Dit komt omdat de `WHERE`-clausule een booleaanse expressie moet bevatten.

Gelukkig is er een andere manier om sneller de gewenste booleaanse expressie te vormen (0049\_\_SelectHonden.sql):

```sql
USE ModernWays;
SELECT * FROM Honden
WHERE Naam IN ('Bailey','Cookie','Lola','Iggy','Snoopy','Leo')
```

Je schrijft dus een lijst van alle mogelijkheden met ronde haakjes en met elementen die gescheiden worden door komma's. De `IN`-operator wil dan zeggen dat de gevraagde waarde voorkomt in de lijst. Dit doet hetzelfde als de eerdere code, maar kost veel minder typwerk.

Als we uitdrukkelijk rekening willen houden met hoofdletters en accenten, kunnen we ook hier de gebruikte collation aanpassen (0050\_\_SelectHonden.sql):

```sql
USE ModernWays;
SELECT * FROM Honden
WHERE Naam COLLATE utf8mb4_as_cs IN ('Bailey','Cookie','Lola','Iggy','Snoopy','Leo')
```

De `IN` is niet specifiek gelinkt aan `WHERE`, maar is gewoon een andere operator om een booleaanse expressie te bekomen. Je kan dus ook dit doen (0051\_\_SelectHonden.sql), met `HAVING` in plaats van `WHERE`:

```sql
USE ModernWays;
SELECT MAX(Leeftijd)
FROM Honden
GROUP BY Geslacht
HAVING MAX(Leeftijd) IN (13,15);
```

Je kan zelfs gewoon dit doen:

```sql
SELECT 5 in (3,7,9);
```

{% hint style="info" %}
Misschien vraag je je af of er ook een kortere notatie is voor pattern matching met `LIKE`. Min of meer, maar dit behandelen we pas in een latere cursus. Het concept hierachter is een "reguliere expressie".
{% endhint %}

## geneste queries
Je kan met `IN` ook controleren of het waarde in het resultaat van een "kleinere" query voorkomt. Dit noemen we een **geneste query**. Een voorbeeld hiervan is dit (0052\_\_SelectHonden.sql):

```sql
USE ModernWays;
SELECT Naam
FROM Honden
WHERE Geslacht = "mannelijk"
AND Naam IN
  (SELECT Naam
   FROM Honden
   WHERE Geslacht = "vrouwelijk");
```

Probeer zelf te achterhalen wat dit doet en hoe het werkt!
