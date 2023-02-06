# LEFT EXCLUDING JOIN

{% hint style="success" %}
[Kennisclip](https://youtu.be/GLuxqI8LZXQ)
{% endhint %}

Deze query retourneert alle records in de linkertabel (tabel A) die **niet overeenkomen** met records in de rechtse tabel (tabel B). Eventuele kolommen uit de tabel B die vermeld worden in de select list bevatten sowieso de waarde `NULL`. Deze join wordt als volgt geschreven:

```sql
SELECT <select_list>
FROM A
LEFT JOIN B
-- ook hier kan het zijn dat de linkertabel de primary key bevat
ON A.B_Id = B.Id
WHERE A.B_Id IS NULL
-- LET OP:
-- hier moet je altijd de foreign key kolom gebruiken
-- een primary key kan immers nooit NULL zijn
```

![Venn diagram left excluding join](<../../.gitbook/assets/venn diagram left excluding join.png>)
