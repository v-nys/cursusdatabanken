# DROP

Indexen belasten het systeem als deze niet nodig zijn, daarom is het raadzaam om indexen die niet \(meer\) nodig zijn te verwijderen. De reden van deze belasting kun je vinden in het feit dat indexen moeten worden bijgewerkt zodra de data in een tabel worden aangepast. Bovendien kun je indexen niet aanpassen of wijzigen, hiervoor moet je de index verwijderen en opnieuw aanmaken volgens de nieuwe ingevingen.

## Drop index

Om een bestaande index te verwijderen van een tabel gebruik je het `drop index` statement.

```sql
DROP INDEX index_name ON table_name;
```

## Drop primary key

De primary key is een index en door middel van dit commando kan je deze index verwijderen.

```sql
DROP INDEX `PRIMARY` ON table_name;
```

