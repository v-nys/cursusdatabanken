# Enumeraties
Vaak kan je in een bepaalde kolom maar een beperkt aantal mogelijke waarden invullen. Een datatype zoals `INT` of `VARCHAR` is dan niet op zijn plaats, omdat die heel veel mogelijke waarden toelaten. Dat zorgt voor inefficiëntie en een grotere kans op foute invoer.

Voor dergelijke kolommen is het beter enumeraties te gebruiken, of `ENUM`s, om het met de woordenschat van MySQL te zeggen. Een `ENUM` is een stuk tekst met een waarde uit een op voorhand aangegeven stel mogelijkheden.

Veronderstel dat je een database met stukken kledij bijhoudt, bijvoorbeeld deze:

| artikelnummer | type kledij | formaat |
|---------------|-------------|---------|
| 1             | polo        | small   |
| 2             | polo        | medium  |
| 3             | polo        | large   |
| 4             | broek       | small   |
| 5             | broek       | medium  |
| 6             | broek       | large   |
| 7             | trui        | small   |
| 8             | trui        | medium  |
| 9             | trui        | large   |

Als de winkel alleen polo's, broeken en truien verkoopt en als er maar drie formaten bestaan, stel je de tweede en derde kolom best voor met een enumeratie.

Dat gaat als volgt:

```sql
CREATE TABLE Kledij (
-- later zullen we zien dat je hier best een primary key van maakt
Nummer INT NOT NULL,
Type ENUM('polo','broek','trui'),
Formaat ENUM('small','medium','large')
)
```

Noem die code 0033__CreateKledij.sql.

Vervolgens kan je data aanmaken alsof de tweede en derde kolom tekst bevatten, met 0034__InsertKledij.sql:

```sql
USE ModernWays;
INSERT INTO Kledij
VALUES
(1, 'polo', 'small'),
(2, 'polo', 'medium'),
(3, 'polo', 'large'),
(4, 'broek', 'small'),
(5, 'broek', 'medium'),
(6, 'broek', 'large'),
(7, 'trui', 'small'),
(8, 'trui', 'medium'),
(9, 'trui', 'large');
```

Wat **niet** gaat, is dit (hoef je niet op te slaan):
```sql
USE ModernWays;
INSERT INTO Kledij
VALUES
(10,'hemd','extra large');
```

Dat komt omdat we alle mogelijke waarden al hebben vastgelegd.

Enumeraties hebben verschillende voordelen:
* Ze zijn zuiniger in gebruik van opslagruimte dan strings die dezelfde tekst voorstellen.
* Ze zorgen voor meer leesbare invoer en uitvoer dan getallen.

{% hint style="warning" %}
Let op! Enumeraties lijken op strings, maar ze worden anders gesorteerd. De volgorde waarin waarden van een enum gesorteerd worden, is de volgorde waarin de elementen gedeclareerd zijn.
{% endhint %}
