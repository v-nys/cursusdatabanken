# INNER JOIN

{% hint style="success" %}
[Kennisclip diagramnotatie](https://youtu.be/bqNvWc0AXjw)
{% endhint %}

{% hint style="success" %}
[Kennisclip demo](https://youtu.be/XyhEl8Gt8Rg)
{% endhint %}

Deze is in het eerste semester al aan bod gekomen. We herhalen hem hier en we introduceren een Venn diagram als visueel geheugensteuntje. **Let op: het Venn diagram mag je niet lezen als twee verzamelingen records en hun doorsnede. Het heeft hier een andere betekenis!**

{% hint style="danger" %}
Lees ook de commentaar in elk gegeven stukje code! Deze bevat zeer belangrijke informatie.
{% endhint %}

## Syntax

```sql
-- dit is niet de enige mogelijkheid
SELECT <kolommen uit A of uit B>
FROM A
INNER JOIN B ON A.Id = B.A_Id
-- alternatief waarbij je de volgorde wisselt
-- dit mag, want = betekent gewoon "is gelijk aan"
-- 2+2 = 4 betekent hetzelfde als 4 = 2+2
-- INNER JOIN B ON B.A_Id = A.Id
-- alternatief, als A de foreign key bevat:
-- INNER JOIN B ON A.B_Id = B.Id
-- ook hier kan je de volgorde nog eens omwisselen
```

![Venn diagram inner join](https://modernways.be/myap/it/image/sql/venn%20diagram%20inner%20join.png)

### Betekenis

We combineren informatie uit twee tabellen: de linkertabel \(`A`\) en de rechtertabel \(`B`\). We zeggen dat er overlapping is tussen de tabellen als de gebruikte sleutelkolommen dezelfde waarde bevatten. Het stuk van `A` dat we bekijken \(`A.Id`\) matcht met het stuk van `B` dat we bekijken \(`B.A_Id`\) en dat tekenen we als een overlappend gedeelte.

{% hint style="info" %}
Als je dat begrepen hebt, zou het je niet mogen verbazen dat je net zo goed `B INNER JOIN A` kan schrijven als `A INNER JOIN B`. Enkel bij `SELECT *` maakt dit een \(klein\) verschil, namelijk dat de kolommen in een andere volgorde zullen staan.
{% endhint %}

## Voorbeeld

Het diagram met de naam `A` staat voor de tabel `Boeken` en met de naam B voor `Personen`. We veronderstellen dat één auteur meerdere boeken kan hebben maar niet omgekeerd, dus de vreemde sleutel moet wel in `Boeken` staan. Bij elk boek staat dus een nummer dat uitdrukt: "dit boek is geschreven door persoon nummer ..."

Selecteer alle boeken en toon de voornaam en de familienaam van de auteur.

```sql
SELECT Personen.Voornaam, Personen.Familienaam,
       Boeken.Titel 
FROM Boeken
INNER JOIN Personen ON Boeken.Personen_Id = Personen.Id;
```

Elke rij uit de tabel `Boeken` wordt gecombineerd met elke rij uit de tabel `Personen` en de combinaties waarin een match wordt gevonden tussen `Personen_Id` en `Personen.Id` worden overgehouden. Indien er geen match is wordt de gecombineerde rij genegeerd.

Het resultaat is een nieuwe tabel, dus je kan er verder mee werken zoals je altijd gedaan hebt. We ordenen de lijst op `Familienaam`, `Voornaam`, `Titel`.

```sql
SELECT Personen.Voornaam, Personen.Familienaam,
       Boeken.Titel 
FROM Personen
INNER JOIN Boeken ON Boeken.Personen_Id = Personen.Id
ORDER BY Personen.Voornaam, Personen.Familienaam, Boeken.Titel;
```

Je mag trouwens na `FROM` een haakje openen en voor `ORDER BY` het haakje weer sluiten als je dat makkelijker vindt.

We voegen een nieuwe persoon toe in de tabel `Personen`:

```sql
INSERT INTO Personen (
   Voornaam, 
   Familienaam,
   AanspreekTitel,
   Straat, 
   Huisnummer,
   Stad, 
   Commentaar,
   Biografie
)
VALUES
(
   'Simone', 
   'De Beauvoir', 
   'Mevrouw',
   'Rue Charles De Gaulle', 
   '38', 
   'Paris', 
   'Feministe',
   'Compagnon van Jean-Paul Sartre'
);
```

We selecteren alle personen geordend op `Familienaam` en `Voornaam`:

```sql
SELECT * FROM Personen
ORDER BY Familienaam, Voornaam;
```

En we zien dat Simone De Beauvoir is toegevoegd.

Alle auteurs en hun boeken te selecteren, maar ordenen de lijst nu op `Familienaam`, `Voornaam` en `Titel`:

```sql
SELECT Personen.Voornaam, Personen.Familienaam,
       Boeken.Titel 
FROM Personen
INNER JOIN Boeken ON Boeken.Personen_Id = Personen.Id
ORDER BY Personen.Familienaam, Personen.Voornaam, Boeken.Titel;
```

Nu merken we dat Simone De Beauvoir niet meer in de lijst voorkomt. Dat komt doordat er voor Simone de Beauvoir geen boeken in de boekentabel zijn opgenomen.

Een `INNER JOIN` gaat alleen die personen tonen waarvoor een match in de tabel Boeken wordt gevonden.

![INNER JOIN Boeken Personen Simone De Beauvoir](https://modernways.be/myap/it/image/sql/inner%20join%20Boeken%20Personen%20Simone%20De%20Beauvoir.png)

