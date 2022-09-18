# Datatypes

## Soorten datatypes

MySQL ondersteunt drie brede soorten datatypes, met per soort verschillende concretere vormen. Deze drie soorten zijn:

1. string types (ofwel "tekst")
2. numerieke types (ofwel "getallen")
3. temporele types (datums en/of tijdstippen)

In deze cursus beperken we ons tot vier brede types: `varchar`, `int`, `float` en `datetime`. Dit is een vereenvoudigde weergave, bedoeld om de concepten aan te leren. Er zijn nog andere basistypes en je kan ook bepaalde extra beperkingen opleggen. Je kan alle details terugvinden in de (uitstekende) officiële MySQL documentatie.

## String types

### `VARCHAR`

`VARCHAR` stelt een stuk tekst met een bepaalde maximumlengte voor. Zo is een kolom met type `VARCHAR(50)` beperkt tot _maximum_ 50 karakters.

### strings schrijven

Als je data van dit type hebt, zet je het tussen enkele of dubbele aanhalingstekens. Bijvoorbeeld `'Do,Re,Mi,Fa,Sol,La,Si'`. Als je data zelf aanhalingstekens bevat, gebruik dan het andere type voor de gehele string.

{% hint style="warning" %}
Let op! Alles wat tussen aanhalingstekens staat is tekst. Zelfs cijfers. Met andere woorden: '42' is tekst en 42 is een getal. Met tekst kan je niet rekenen, met een getal wel. MySQL probeert wel te raden wat je bedoelt als je bijvoorbeeld '42' + '1' schrijft, maar niet elke taal doet dit. Daarom spreken we af dat je MySQL niet laat raden, maar altijd het juiste datatype gebruikt.
{% endhint %}

## numerieke types

### `INT` en varianten

`INT` dient voor de opslag van gehele getallen. Standaard kan een `INT` positieve en negatieve gehele getallen voorstellen. Je kan met `INT` geen kleiner getal opslaan dan `-2147483648` en geen groter getal dan 2147483647`.`

### `FLOAT`

Dit type dient om kommagetallen **bij benadering** op te slaan. Dit wil zeggen dat (vaak héél kleine) afrondingen toegestaan zijn wanneer je data in het systeem plaatst.

### getallen schrijven

Deze data zet je niet tussen quotes. **Je gebruikt een punt in plaats van een komma.**

## temporele types

Temporele types worden gebruikt om tijdstippen voor te stellen. Hierbij wordt volgende notatie gebruikt om een formaat voor te stellen:

* Y: cijfer van een jaar
* M: cijfer van een maand
* D: cijfer van een dag
* H: cijfer van een uur
* m: cijfer van een minuut
* S: cijfer van een seconde

### `DATETIME`

Een `DATETIME` is een waarde die een specifiek ogenblik in de tijd voorstelt. Met andere woorden ongeveer een combinatie van een dag en een moment van de dag. Het formaat is `YYYY-MM-DD HH:MM:SS` en het bereik ligt tussen het jaar 1000 en 9999.

### datums schrijven

Je schrijft datums alsof het strings waren in een afgesproken formaat, dus wel tussen quotes.

## defaultwaarden

Je kan er bij het aanmaken of wijzigen van een kolom voor zorgen dat je een kolom niet uitdrukkelijk hoeft in te vullen. Dat doe je door, na de naam van de kolom, het woordje `default` noteren, gevolgd door een waarde van dat type. Bijvoorbeeld:

```
ALTER TABLE Boeken ADD COLUMN ISBN VARCHAR(25) DEFAULT ("ABC123");
```

Dit voegt een nieuwe kolom toe voor het ISBN-nummer aan een bestaande tabel boeken. Dit is een tekstkolom van maximum 25 symbolen. Als de gebruiker géén ISBN invult, krijgt een boek automatisch de waarde `ABC123` in die kolom.
