# LEFT EXCLUDING JOIN

Deze query retourneert alle records in de linkertabel \(tabel A\) die niet overeenkomen met records in de rechtse tabel \(tabel B\). Deze join wordt als volgt geschreven:

```sql
SELECT <select_list>
FROM Table_A
LEFT JOIN Table_B
ON Table_A.Key = Table_B.Key
WHERE Table_B.Key IS NULL
```

![venn diagram left excluding join](https://modernways.be/myap/it/image/sql/venn%20diagram%20left%20excluding%20join.png)

venn diagram left excluding join

