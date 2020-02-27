# DROP

Indexen belasten het systeem als deze niet nodig zijn, daarom is het raadzaam om indexen die niet \(meer\) nodig zijn te verwijderen. De reden van deze belasting kun je vinden in het feit dat indexen moeten worden bijgewerkt zodra de data in een tabel worden aangepast. Bovendien kun je indexen niet aanpassen of wijzigen, hiervoor moet je de index verwijderen en opnieuw aanmaken volgens de nieuwe ingevingen.

## Drop index

Om een bestaande index te verwijderen van een tabel gebruik je het `drop index` statement.

```sql
DROP INDEX index_name ON table_name
[algorithm [lock]];
```

### Algorithm \(optie\)

```sql
ALGORITHM = {DEFAULT|INPLACE|COPY}
```

Je hebt twee opties, die je niet noodzakelijkerwijze hoeft te gebruiken.

**COPY**: De tabel wordt hierbij gekopieerd, waarna de drop index op deze gekopieerde tabel wordt uitgevoerd.

**INPLACE**: Hierbij wordt de tabel opnieuw opgebouwd in plaats van te worden gekopieerd.

### Lock \(optie\)

```sql
LOCK = {DEFAULT|NONE|SHARED|EXCLUSIVE}
```

Deze optie zorgt ervoor dat het gelijktijdig lezen en schrijven van data in de tabel wordt gecontroleerd.

**DEFAULT**: dit biedt het maximale level van gelijktijdig lezen en schrijven.

**NONE**: indien ondersteund laat dit gelijktijdig lezen en schrijven toe, anders zal er een error worden gegeven.

**SHARED**: indien ondersteund, laat dit gelijktijdig lezen toe, maar niet schrijven.

**EXCLUSIVE**: zoals het woordt zegt, dit zorgt voor exclusieve toegang.

## Drop primary key

De primary key is een index en door middel van dit commando kan je deze index verwijderen.

```sql
DROP INDEX `PRIMARY` ON table_name;
```

