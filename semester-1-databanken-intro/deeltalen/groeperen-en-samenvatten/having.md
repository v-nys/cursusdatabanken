# SELECT met HAVING

{% hint style="success" %}
[Kennisclip](https://youtu.be/HY33DT72jpo) \(ondertiteling beschikbaar\)
{% endhint %}

Met de `WHERE`-clausule kon je voorwaarden uitdrukken voor het selecteren \(of updaten of wissen\) van records. Je kan met `WHERE` echter **geen** voorwaarden uitdrukken op kolommen die vermeld zijn in de `GROUP BY`-clause of op geaggregeerde waarden. Met andere woorden, dit gaat niet:

```sql
USE ApDB;
SELECT Geslacht
FROM Honden
GROUP BY Geslacht
WHERE AVG(Leeftijd) > 4;
```

Ook dit zal niet werken:

```sql
USE ApDB;
SELECT AVG(Leeftijd)
FROM Honden
GROUP BY Geslacht
WHERE Geslacht = 'mannelijk';
```

Dat komt omdat `WHERE` rij per rij bekijkt en beslist of die rij behouden of verworpen wordt.

Als je voorwaarden op gegroepeerde data wil uitdrukken, maak je gebruik van `HAVING` \(`0050__SelectHonden.sql`\) en \(`0051__SelectHonden.sql`\):

```sql
-- een voorbeeld met een gegroepeerde kolom
USE ApDB;
SELECT AVG(Leeftijd)
FROM Honden
GROUP BY Geslacht
HAVING Geslacht = 'mannelijk';
```

```sql
-- een voorbeeld met een geaggregeerde waarde
USE ApDB;
SELECT Geslacht
FROM Honden
GROUP BY Geslacht
HAVING AVG(Leeftijd) > 4;
```

**In het kort: voor voorwaarden op kolommen in een `GROUP BY` of op geaggregeerde waarden gebruik je `HAVING`, voor andere voorwaarden gebruik je `WHERE`.**

{% hint style="info" %}
In MySQL kan je in een `HAVING`-clausule ook verwijzen naar bepaalde andere kolommen, maar [volgens de MySQL-documentatie zelf](https://dev.mysql.com/doc/refman/8.0/en/select.html) wordt dit afgeraden.
{% endhint %}

{% hint style="warning" %}
Er bestaan queries die je hetzelfde resultaat opleveren, of je nu `WHERE` of `HAVING` gebruikt. Dat betekent **niet** dat ze inwisselbaar zijn. Wat achter de schermen gebeurt, is wel degelijk verschillend. Soms zijn er gewoon verschillende werkwijzen die tot hetzelfde resultaat leiden.
{% endhint %}

