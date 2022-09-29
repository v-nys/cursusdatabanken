# UPDATE

## basisprincipe

Soms maken we fouten bij het ingeven van data. Soms verouderen gegevens. In beide situaties willen we bestaande rijen wel bewaren, maar bepaalde kolomwaarden aanpassen. We kunnen het `UPDATE` statement hier voor gebruiken.

MySQL staat dit om veiligheidsredenen niet zomaar toe, maar voorlopig zijn we aan het verkennen. Om dit dus toch mogelijk te maken, moet je `SET SQL_SAFE_UPDATES = 0` toevoegen voor een "onveilig" commando en achteraf `SET SQL_SAFE_UPDATES = 1` toevoegen.

Bijvoorbeeld:

```sql
USE ApDB;
SET SQL_SAFE_UPDATES = 0;
UPDATE Boeken SET Categorie = 'Metafysica';
SET SQL_SAFE_UPDATES = 1;
```

Dit zet de kolom Categorie van **alle** boeken op "Metafysica".

Je kan ook de inhoud van meer dan één kolom aanpassen. Dat zou je als volgt doen (maar hoef je **niet** uit te voeren of op te slaan):

```sql
USE ApDB;
UPDATE Boeken 
SET Categorie = 'Wetenschap', 
    Titel = 'Een boek';
```

Zonder verdere specificatie zet het eerste stukje code de kolom `Categorie` van alle rijen op 'Metafysica'.

## verfijnd aanpassen

Het zou kunnen dat alle boeken in de categorie Metafysica thuishoren. En in dat geval doet het statement precies wat je er van verwacht. Maar meestal willen wie niet alle rijen op dezelfde manier aanpassen. We moeten dus in het UPDATE statement specifiëren in welke rij we de kolom `Categorie` willen updaten. We moeten één bepaalde rij eruit filteren. Dat doen we met de `WHERE` clausule. We beperken de update tot de records die we met een SELECT zouden laten zien:

```sql
UPDATE Boeken
SET Categorie = 'Wiskundige logica'
WHERE Titel = 'Logicaboek';
```

De `WHERE` clausule bepaalt een voorwaarde die door de database als waar of vals geëvalueerd wordt. De voorwaarde `Titel = 'Logicaboek'` wordt voor elke rij in de tabel geëvalueerd. Als de evaluatie van de logische expressie voor een bepaalde rij waar oplevert wordt die rij geüpdatet.

{% hint style="danger" %}
De vergelijking van strings in MySQL is standaard **niet hoofdlettergevoelig**! Je zou dus wel eens rijen kunnen aanpassen zonder dat dat je bedoeling is.
{% endhint %}

## samengestelde constructies

Je kan ook meerdere rijen in één keer updaten. Dat doe je door bijvoorbeeld de logische operator `OR` te gebruiken:

```sql
UPDATE Boeken
SET Categorie = 'Geschiedenis'
WHERE Familienaam = 'Braudel' or
      Familienaam = 'Bernard' or
      Familienaam = 'Bloch';
```

Waar je een nieuwe waarde instelt, mag je ook weer een expressie gebruiken die een waarde oplevert. Net als in programmeren. Je kan bijvoorbeeld een waarde instellen die berekend wordt door strings aan elkaar te hangen of een substring te bepalen:

```sql
UPDATE Boeken SET Categorie = concat('CATEGORIE: ', Categorie);
```
