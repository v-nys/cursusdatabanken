# DROP

Een view kan je eenvoudig verwijderen.

Het verwijderen van een view resulteert niet in het verwijderen van de data in de bron. De data in de view wordt opgebouwd door een query die data uit andere tabellen haalt.

## Syntax

```sql
DROP VIEW IF EXISTS viewnaam;
```

## Voorbeeld

Toegepast op het voorbeeld vermeld bij `CREATE`.

```sql
DROP VIEW IF EXISTS TakenLeden;
```



