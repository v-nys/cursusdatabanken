# LEFT JOIN

{% hint style="success" %}
[Kennisclip diagramnotatie](https://youtu.be/v42nKNbcHtQ)
{% endhint %}

{% hint style="success" %}
[Kennisclip demo](https://youtu.be/6lkC3AD8s1A)
{% endhint %}

## Syntax

```sql
SELECT <kolommen uit A of uit B>
FROM A 
LEFT JOIN B 
-- hier veronderstellen we dat de vreemde sleutel in B staat
ON A.Id = B.A_Id
-- alternatief met vreemde sleutel in A:
-- ON A.B_Id = B.Id
```

![venn diagram left join](https://modernways.be/myap/it/image/sql/venn%20diagram%20left%20join.png)

Als je alle personen wilt tonen ongeacht of ze een boek hebben geschreven of niet kan je een `LEFT JOIN` gebruiken. In tegenstelling tot bij `INNER JOIN` maakt het een groot verschil of je `A LEFT JOIN B` schrijft of `B LEFT JOIN A`. Met een `LEFT JOIN` worden alle rijen uit de linkse tabel geselecteerd, of er nu een match is of niet op basis van de sleutelkolommen.

Terug naar het voorbeeld, maar dan met LEFT JOIN:

```sql
SELECT Personen.Voornaam, Personen.Familienaam,
       Boeken.Titel 
FROM Personen
LEFT JOIN Boeken ON Boeken.Personen_Id = Personen.Id
ORDER BY Personen.Familienaam, Personen.Voornaam, Boeken.Titel;
```

Simone is nu wel geselecteerd. Maar er is geen boek van haar aanwezig in de tabel `Boeken`, dus staat `Titel` op `NULL`.

![left join Boeken Personen Simone De Beauvoir](https://modernways.be/myap/it/image/sql/left%20join%20Boeken%20Personen%20Simone%20De%20Beauvoir.png)

## Opmerking:

De `LEFT JOIN` wordt ook wel `LEFT OUTER JOIN` genoemd. Er is geen verschil.

