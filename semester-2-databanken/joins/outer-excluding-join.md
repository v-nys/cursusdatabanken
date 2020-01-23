# OUTER EXCLUDING JOIN

Deze query retourneert alle records in de linkertabel \(tabel A\) en alle records in de rechtertabel \(tabel B\) die niet overeenkomen. Deze join wordt als volgt geschreven:

```sql
SELECT <select_list>
FROM Table_A 
FULL OUTER JOIN Table_B 
ON Table_A.Key = Table_B.Key
WHERE Table_A.Key IS NULL OR Table_B.Key IS NULL
```

![venn diagram outer excluding join](https://modernways.be/myap/it/image/sql/venn%20diagram%20outer%20excluding%20join.png)

venn diagram outer excluding join

