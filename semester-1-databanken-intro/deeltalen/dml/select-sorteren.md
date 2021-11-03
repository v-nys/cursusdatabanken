# SELECT sorteren

{% hint style="success" %}
[Kennisclip](https://youtu.be/sIxtTy2hPFI)
{% endhint %}

Het is niet genoeg gegevens uit een tabel te kunnen opvragen, je moet ze ook kunnen sorteren of ordenen. We willen lijsten in alfanumerieke volgorde weergeven omdat het gemakkelijker is in een geordende lijst te zoeken.

Om te sorteren gebruiken we de clausule `ORDER BY`. Het sorteren kan op 2 manieren:

* oplopend
* aflopend

In het Engels is dat _ascending_ en _descending_. In SQL wordt dat afgekort naar `ASC` en `DESC`. Stel dat je de namen uit de tabel boeken wil opvragen gesorteerd op de voornaam, de familienaam en titel van de boeken. De query ziet er dan zo uit:

```sql
USE ApDB;
-- oplopend sorteren volgens familienaam
-- ascending
SELECT Voornaam, Familienaam, Titel FROM Boeken
   ORDER BY Familienaam ASC, Voornaam, Titel;
-- aflopend sorteren volgens familienaam
-- descending
SELECT Voornaam, Familienaam, Titel FROM Boeken
   ORDER BY Familienaam DESC, Voornaam, Titel
```

Het eerste veld in de `ORDER BY` clause wordt dan eerst bekeken, dan het tweede, enzovoort. Als niet aangegeven is of de sortering voor een bepaald veld oplopend of aflopend is, is ze standaard oplopend. Dat wil zeggen dat als je `ASC` en `DESC` niet vermeldt na een kolom, de code zich gedraagt alsof er `ASC` staat.

De eerste bovenstaande `SELECT` clausule toont dus eerst boeken in alfabetische volgorde van de familienamen van de auteurs. Als twee auteurs dezelfde familienaam hebben (althans volgens de gebruikte collation!), wordt hun voornaam gebruikt om de knoop door te hakken. Dan komt het boek met de voornaam die alfabetisch eerst komt ook eerst in de lijst. Als twee auteurs dezelfde naam hebben, of als het gewoon om twee boeken van dezelfde auteur gaat, wordt de titel gebruikt om de knoop door te hakken.

Voor de tweede query komen de familienamen met een 'Z' voor die met een 'A'. Let op: de voornamen met een 'A' komen wel voor de voornamen met een 'Z'!

Merk op uit bovenstaand voorbeeld: de volgorde van de kolommen in de `ORDER BY` clausule hoeft niet dezelfde te zijn als de volgorde van de weergave in de `SELECT `clausule. Het kan perfect zijn dat je wil sorteren op familienaam, maar wel eerst de voornaam wil tonen en dan pas de achternaam. Sterker nog: je kan zelfs ordenen op kolommen die je niet toont in de uitvoer.
