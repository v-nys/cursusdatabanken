# OUTER JOIN

{% hint style="success" %}
[Kennisclip](https://youtu.be/UcFgBdSn844)
{% endhint %}

De `OUTER JOIN` ziet er als volgt uit:

![Venn diagram outer join](<../../.gitbook/assets/venn diagram outer join.png>)

MySQL ondersteunt deze constructie niet, in tegenstelling tot sommige andere databanken. Maar je kan ze wel nabootsen door een (gewone) left join boven een excluding right join te plaatsen met behulp van `UNION ALL`, dat resultaten samen neemt:

```sql
-- net als tevoren kan de code wat variëren
-- de foreign key staat hier in de rechtertabel
-- hij kan (mits aanpassingen) ook in de linkertabel
SELECT <kolommen uit A of uit B>
FROM A 
LEFT JOIN B 
ON A.Id = B.A_Id

UNION ALL -- plaats de resultaten onder elkaar -> maak de kolommen expliciet! geen *

SELECT <select_list>
FROM A
RIGHT JOIN B
ON A.B_Id = B.Id
WHERE A.B_Id IS NULL
```

{% hint style="danger" %}
Selecteer dezelfde kolommen uit beide joins! Het is mogelijk om dat niet te doen, maar dan krijg je mogelijk onzinnige resultaten.
{% endhint %}

Je kan ook een left excluding join combineren met een gewone right join.

## Opmerking

Er wordt ook wel gesproken over `FULL OUTER JOIN`.
