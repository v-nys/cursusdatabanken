# UPDATE

Het `UPDATE` DML statement gelijkt op het `ALTER` DDL statement. Beide brengen één of meerdere wijzigingen aan in de database. Daar waar `ALTER` de structuur van een tabel wijzigt, wijzigt `UPDATE` de gegevens die in een tabel zitten.

## basisprincipe

We hebben eerder de kolom `Categorie` toegevoegd aan de tabel `Boeken`. Maar deze kolom is voor de eerste boeken nog niet ingevuld. We kunnen het `UPDATE` statement gebruiken om de categorieën voor de eerste boeken in te vullen.

MySQL staat dit om veiligheidsredenen niet zomaar toe, maar voorlopig zijn we aan het verkennen. Om dit dus toch mogelijk te maken, moet je `SET SQL_SAFE_UPDATES = 0` toevoegen voor een "onveilig" commando en achteraf `SET SQL_SAFE_UPDATES = 1` toevoegen.

```sql
USE ModernWays;
SET SQL_SAFE_UPDATES = 0;
UPDATE Boeken SET Categorie = 'Metafysica';
SET SQL_SAFE_UPDATES = 1;
```

Pas toe en sla op als 0015\_\_UpdateBoeken.sql.

Inspecteer je data. Zie je het effect?

Je kan ook de inhoud van meer dan één kolom aanpassen. Dat zou je als volgt doen \(maar hoef je niet uit te voeren\):

```sql
USE ModernWays;
UPDATE Boeken SET Categorie = 'Wetenschap', Titel = 'Een boek';
```

Zonder verdere specificatie zet het eerste stukje code de kolom `Categorie` van alle rijen op 'Metafysica'.

## verfijnd aanpassen

Het zou kunnen dat alle boeken in de categorie Metafysica thuishoren. En in dat geval doet het statement precies wat je er van verwacht. De boeken in ons voorbeeld behoren tot verschillende categorieën. We moeten dus in het UPDATE statement specifiëren in welke rij we de kolom `Categorie` willen updaten. We moeten één bepaalde rij eruit filteren. Dat doen we met de `WHERE` clausule. We beperken de update tot de boeken waarvan de titel gelijk is aan 'Logicaboek'. Dat zou er zo uitzien:

```sql
UPDATE Boeken
SET Categorie = 'Wiskundige logica. Mathematische logica'
WHERE Titel = 'Logicaboek';
```

De `WHERE` clausule bepaalt een voorwaarde die door de database als waar of vals geëvalueerd wordt. De voorwaarde `Titel = 'Logicaboek'` wordt voor elke rij in de tabel geëvalueerd. Als de evaluatie van de logische expressie voor een bepaalde rij waar oplevert wordt die rij geüpdatet.

{% hint style="info" %}
Het gebruik van `WHERE` is niet beperkt tot `UPDATE`. Je kan ook specifieke rijen selecteren of wissen door een `WHERE` clausule toe te voegen.
{% endhint %}

{% hint style="danger" %}
De vergelijking van strings in MySQL is standaard niet hoofdlettergevoelig! Je zou dus wel eens rijen kunnen aanpassen zonder dat dat je bedoeling is. Dat komt omdat de standaard collation van MySQL uft8mb4\_0900\_ai\_ci is. Het deeltje "\_ci" betekent "case insensitive" of "hoofdletterongevoelig". Soms zie je ook "ai" en dat betekent accentongevoelig.
{% endhint %}

Je kan het een specifieke collation gebruiken door `COLLATE`, gevolgd door een op je systeem aanwezige collation na een kolomnaam te gebruiken. Bijvoorbeeld:

```sql
SELECT Voornaam, Familienaam, Titel
FROM Boeken
WHERE Titel COLLATE utf8mb4_0900_as_cs = 'logicaboek';
```

## samengestelde constructies

Je kan ook meerdere rijen in één keer updaten. Dat doe je door bijvoorbeeld de logische operator `OR` te gebruiken:

```sql
update Boeken
set Categorie = 'Geschiedenis'
where Familienaam = 'Braudel' or
      Familienaam = 'Bernard' or
      Familienaam = 'Bloch';
```

Verder leer je meer over logische operatoren. Meerdere kolommen tegelijk kunnen ook gewijzigd worden.

```sql
UPDATE Boeken
   SET Voornaam = 'Geert',
   Familienaam = 'Hoste',
   Uitgeverij = 'De Bezige Olifant'
WHERE Titel = 'De stad van God';
```

Waar je een nieuwe waarde instelt, mag je ook weer een expressie gebruiken die een waarde oplevert. Net als in programmeren. Je kan bijvoorbeeld een waarde instellen die berekend wordt door strings aan elkaar te hangen of een substring te bepalen:

```sql
UPDATE Boeken SET Categorie = concat('[1]', Categorie)
WHERE Categorie = 'Wiskunde';
```

```sql
-- Hier heb je '[1]' gezet voor de tekst als er 'Wiskunde' staat.
-- nu halen we dat weer weg
-- left(X,Y) is zoals substring(X,1,Y)
UPDATE Boeken SET Categorie = substring(Categorie, 4, length(Categorie) -3)
WHERE left(Categorie, 3) = '[1]';
```

