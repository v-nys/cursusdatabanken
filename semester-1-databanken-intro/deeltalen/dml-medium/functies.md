# Functies

Functies in SQL staan je toe een waarde te berekenen in plaats van een vaste waarde of de waarde in een of andere kolom.

## SUBSTRING

Deze functie gebruik je om een deel van een stuk tekst over te houden. Je kan bijvoorbeeld dit doen om de eerste twee letters van de familienaam van een auteur te tonen:

```sql
SELECT SUBSTRING(Familienaam,1,2) FROM Boeken;
```

Je bent ook niet beperkt tot kolomwaarden, je mag ook gewone constanten gebruiken:

```sql
SELECT SUBSTRING('Hallo',1,2);
```

Je kan wel net zo goed dit doen:

```sql
SELECT 'Ha';
```

## CONCAT

Deze functie gebruik je om stukken tekst aan elkaar te hangen. Je kan dus dit doen om de volledige naam van auteurs te tonen:

```sql
SELECT CONCAT(Voornaam,' ',Familienaam) FROM Boeken;
```

Je kan dit ook duidelijker laten weergeven in Workbench met:

```sql
SELECT CONCAT(Voornaam,' ',Familienaam) AS Naam FROM Boeken;
```

## LENGTH

Hiermee bereken je de lengte van een stuk tekst. Je kan bijvoorbeeld dit doen:

```sql
SELECT Length(Familienaam) FROM Boeken;
```

Dit zal je niet de familienaam van elke auteur tonen, maar wel het aantal letters in hun familienaam.

Net zo kan je dit doen:

```sql
SELECT Length('abc');
```

Dan zal je als resultaat `3` krijgen.

