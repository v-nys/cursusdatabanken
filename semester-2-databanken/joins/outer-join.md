# OUTER JOIN

De `OUTER JOIN` ziet er als volgt uit: ![venn diagram outer join](https://modernways.be/myap/it/image/sql/venn%20diagram%20outer%20join.png)

MySQL ondersteunt deze constructie niet, in tegenstelling tot sommige andere databanken. Maar je kan ze wel nabootsen door een \(gewone\) left join boven een excluding right join te plaatsen met behulp van `UNION ALL`, dat resultaten samen neemt:

```sql
SELECT <select_list>
FROM
  Table_A LEFT JOIN Table_B
  ON Table_A.Key = Table_B.Key

UNION ALL -- plaats de resultaten onder elkaar -> maak de kolommen expliciet! geen *

SELECT <select_list>
FROM
  Table_A RIGHT JOIN Table_B
  ON Table_A.Key = Table_B.Key
WHERE
  Table_A.Key IS NULL
```

## Opmerking

Er wordt ook wel gesproken over `FULL OUTER JOIN`.

