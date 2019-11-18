# SELECT met HAVING

Met de `WHERE`-clausule kon je voorwaarden uitdrukken voor het selecteren \(of updaten of wissen\) van records. Je kan met `WHERE` echter **geen** voorwaarden uitdrukken op kolommen die vermeld zijn in de `GROUP BY`-clause of op geaggregeerde waarden. Met andere woorden, dit gaat niet:

```sql
USE ModernWays;
SELECT Geslacht
FROM Honden
GROUP BY Geslacht
WHERE AVG(Leeftijd) > 4;
```

Ook dit zal niet werken:

```sql
USE ModernWays;
SELECT AVG(Leeftijd)
FROM Honden
GROUP BY Geslacht
WHERE Geslacht = 'mannelijk';
```

Als je dit soort voorwaarden wil uitdrukken, maak je gebruik van `HAVING` \(0047\_\_SelectHonden.sql\) en \(0048\_\_SelectHonden.sql\):

```sql
-- een voorbeeld met een gegroepeerde kolom
USE ModernWays;
SELECT AVG(Leeftijd)
FROM Honden
GROUP BY Geslacht
HAVING Geslacht = 'mannelijk';
```

```sql
-- een voorbeeld met een geaggregeerde waarde
USE ModernWays;
SELECT Geslacht
FROM Honden
GROUP BY Geslacht
HAVING AVG(Leeftijd) > 4;
```

**In het kort: voor voorwaarden op kolommen in een `GROUP BY` of op geaggregeerde waarden gebruik je `HAVING`, voor andere voorwaarden gebruik je `WHERE`.**

{% hint style="info" %}
In MySQL kan je in een `HAVING`-clausule ook verwijzen naar bepaalde andere kolommen, maar [volgens de MySQL-documentatie zelf](https://dev.mysql.com/doc/refman/8.0/en/select.html) wordt dit afgeraden.
{% endhint %}

