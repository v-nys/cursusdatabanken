# SELECT DISTINCT

Met `GROUP BY` kan je er voor zorgen dat bepaalde waarden worden samengenomen. Op die manier kan je bijvoorbeeld \(voor de dataset met honden\) elk geslacht één keer tonen. Dat is nuttig, want vaak zijn we niet geïnteresseerd in dubbels. We hebben echter gezien dat na groepering enkel gegroepeerde of geaggregeerde waarden kunnen tonen.

Er is een andere \(en meer expliciete\) manier om dubbels te vermijden: `SELECT` laten volgen door het sleutelwoordje `DISTINCT`. Hierdoor worden alle dubbele resultaten verwijderd.

Volgende query geeft je alle hondennamen \(0053\_\_SelectHonden.sql\) precies één keer:

```sql
USE ModernWays;
SELECT DISTINCT Naam
FROM Honden;
```

Na `DISTINCT` kan je schrijven wat je bij een gewone `SELECT` zou kunnen schrijven, dus dit gaat ook:

```sql
USE ModernWays;
SELECT DISTINCT Naam, Geslacht
FROM Honden;
```

{% hint style="info" %}
Als je ergens heel expliciet dubbele rijen wel wil weergeven, schrijf je `ALL` in plaats van `DISTINCT`. Dit is het standaardgedrag van MySQL, maar het kan nuttig zijn dit te schrijven om je collega-programmeurs duidelijk te maken dat je de dubbels **echt** wil bijhouden. Commentaar wordt niet zo aandachtig gelezen als code.
{% endhint %}
