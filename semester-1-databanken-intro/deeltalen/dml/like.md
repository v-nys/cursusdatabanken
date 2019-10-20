# `WHERE` omschrijven met `LIKE`
In veel gevallen weten we maar half wat we willen zoeken. We kennen een deel van de naam, het begin of het einde of iets tussenin.
Met de `LIKE` operator kan je in SQL naar patronen zoeken (pattern matching).
Je kan met de `LIKE` operator naar patronen in tekst zoeken.
Je combineert de `LIKE` operator met jokers (**wildcards**) om een booleaanse expressie te vormen.
De set van jokers bestaat uit symbolen die één of meer ontbrekende tekens voorstellen.

De LIKE operator vergelijkt een tekstuitdrukking in het linkerlid, dat eventueel een wildcard bevat, met een patroon tussen aanhalingstekens in het rechterlid.
Een patroon is een veralgemeende tekstuitdrukking. d.w.z. een tekst waarin nog enige vrijheid bestaat.

De betekenis van de wildcards in SQL is als volgt:

* `%`: nul, één of meer willekeurige tekens
* `_`: exact één willekeurig teken

Om alle boeken te selecteren waarvan de familienaam van de auteur begint met A als de collation niet hoofdlettergevoelig is:

```sql
use ModernWays;
select Voornaam, Familienaam, Titel
   from Boeken
   where Familienaam like 'a%';
```

Wanneer de collation niet hoofdlettergevoelig is, geeft dit statement hetzelfde resultaat:

```sql
select Voornaam, Familienaam, Titel
   from Boeken
   where Familienaam like 'A%';
```

Om alle boeken te selecteren waarvan de familenaam van de auteur eindigt op een s:

```sql
select Voornaam, Familienaam, Titel
   from Boeken
   where Familienaam like '%s';
```

Om boeken waarvoor in de titel het woord economie voorkomt, te selecteren:

```sql
use ModernWays;
select Voornaam, Familienaam, Titel, Verschijningsjaar
   from Boeken
   where Titel like '%economie%';
```

Het is belangrijk dat je toepassing van de LIKE operator en de wildcard ziet. Bijvoorbeeld:

```sql
use ModernWays;
-- eerst wordt een boek ingevoegd
insert into Boeken (
   Voornaam,
   Familienaam,
   Titel)
values (
   'Mathijs',
   'Degrote',
   'Leren werken met SQL')
-- er gaat wat tijd voorbij en ik weet niet meer of het "Mathijs" of "Matijs" is
-- ik los dit op met LIKE
select Voornaam from Boeken
   where Voornaam like 'ma%ijs'
```

{% hint style="warning" %}
De `LIKE` wordt door beginners vaak vergeten. Je komt soms dingen tegen als `WHERE Voornaam = 'ma%ijs'`. Dat zal geen resultaten opleveren, want niemand heeft letterlijk de voornaam "Ma%ijs".
{% endhint %}
