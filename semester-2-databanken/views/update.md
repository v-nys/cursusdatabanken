# UPDATE

Views kunnen eveneens worden aangepast, ttz. de inhoud van de view kan op dezelfde wijze worden benaderd als een gewone tabel.

M.a.w. de [DML-commando's](../../semester-1-databanken-intro/deeltalen/dml-medium/) zijn ook hier te gebruiken.

Er zijn hierbij wel enkele uitzonderingen in die zin dat bij de creatie van de view de query o.a. geen van volgende statements mag bevatten.

* MIN, MAX, SUM, AVG en COUNT
* DISTINCT
* GROUP BY
* HAVING
* UNION
* JOINS

### UPDATE VIEW

We baseren ons op de view die we onder de rubriek [CREATE ](create.md#voorbeeld)hebben aangemaakt.

```sql
USE modernways;
UPDATE takenLeden
SET omschrijving = 'frisdrank voorzien'
WHERE voornaam = 'Yannick';
```

![](../../.gitbook/assets/image%20%2834%29.png)

### UPDATE VIEW INFORMATIE

Je kan nagaan of een view werd aangepast.

```sql
SELECT table_name, is_updatable
FROM information_schema.views
WHERE table_schema = 'modernways';
```

![](../../.gitbook/assets/image%20%2854%29.png)



