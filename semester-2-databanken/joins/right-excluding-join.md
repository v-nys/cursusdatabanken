# RIGHT EXCLUDING JOIN

Deze query retourneert alle records in de rechtse tabel (tabel B) die niet overeenkomen met records in de linkertabel (tabel A). Deze join wordt als volgt geschreven:

```sql
SELECT <select_list>
FROM A
RIGHT JOIN B
-- ook hier kan het zijn dat de linkertabel de primary key bevat
ON A.B_Id = B.Id
WHERE A.B_Id IS NULL
-- LET OP:
-- hier moet je altijd de foreign key kolom gebruiken
-- een primary key kan immers nooit NULL zijn
```

![Venn diagram right excluding join](<../../.gitbook/assets/venn diagram right excluding join.png>)
