# RIGHT EXCLUDING JOIN

Deze query retourneert alle records in de rechtse tabel \(tabel B\) die niet overeenkomen met records in de linkertabel \(tabel A\). Deze join wordt als volgt geschreven:

```sql
SELECT <select_list>
FROM Table_A 
RIGHT JOIN Table_B 
ON Table_A.Key = Table_B.Key
WHERE Table_A.Key IS NULL
```

![venn diagram right excluding join](https://modernways.be/myap/it/image/sql/venn%20diagram%20right%20excluding%20join.png)

venn diagram right excluding join

