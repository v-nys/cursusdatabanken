# Transacties en rollbacks

Via de instructie `ROLLBACK` kan je voorlopige wijzigingen ongedaan maken. Dit kwam eerder al even aan bod. We bekijken het hier wat meer in detail.

Voer zelf de voorbeelden mee uit om te zien wat er gebeurt.

### Voorbeeld 1 \(hoe het moet\)

Onderstaande code start uitdrukkelijk een transactie en de handler bevat een `ROLLBACK`. Tijdens de transactie doet zich een fout voor die afgehandeld kan worden door de handler:

```sql
use aptunes;
delimiter $$
CREATE PROCEDURE RollbackDemo1()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: stored procdure is beëindigd en alle wijzigingen zijn ongedaan gemaakt.';
    END;
    start transaction;
    insert into Genres (Naam)
    values
    ('Metal');
    signal sqlstate '45000';
    commit;
END$$
```

Voer de code uit om de procedure te creëren. Kijk welke genres momenteel in je database zitten. Voer vervolgens een `CALL` van deze procedure uit. Het resultaat? Er is geen nieuwe genre toegevoegd aan het systeem. De `INSERT` is wel uitgevoerd, maar alleen op een voorlopige wijze. De `COMMIT` is niet bereikt en er heeft zich een `ROLLBACK` voorgedaan, dus de wijziging is niet definitief gemaakt.

### Voorbeeld 2 \(hoe het niet moet\)

```sql
use aptunes;
delimiter $$
CREATE PROCEDURE RollbackDemo2()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: stored procdure is beëindigd en alle wijzigingen zijn ongedaan gemaakt.';
    END;
    insert into Genres (Naam)
    values
    ('Metal');
    signal sqlstate '45000';
END$$
```

Als je deze procedure definieert en oproept, zie je dat het nieuwe genre **wel** is toegevoegd. Dat komt omdat je geen transactie hebt gestart. Als je dat niet doet, is **elk statement** standaard definitief. **Stored procedures vormen niet vanzelf een transactie**.

### Voorbeeld 3 \(hoe het niet moet\)

Verwijder eerst even zelf het nieuwe genre en gebruik dan volgende procedure:

```sql
use aptunes;
delimiter $$
CREATE PROCEDURE RollbackDemo3()
BEGIN
    insert into Genres (Naam)
    values
    ('Metal');
    signal sqlstate '45000';
END$$
```

Hier hebben we de handler weggelaten ten opzichte van het vorige voorbeeld. Omdat in het vorige voorbeeld de `INSERT` niet ongedaan werd gemaakt, gebeurt dat hier zeker niet. Er is niet eens een rollback \(die in het vorige voorbeeld dus al niets deed\). Wat wel anders is: hier is geen handler. Dus de fout wordt niet afgehandeld binnen de stored procedure en levert een "klassieke" fout in je MySQL Workbench.

### Voorbeeld 4 \(om voor op te letten\)

Volgend voorbeeld is **geen** stored procedure:

```sql
use aptunes;
start transaction;
insert into Genres(Naam) values ('Chanson');
signal sqlstate '45000';
commit;
```

In MySQL hangt het effect hier af van de omgeving \(bv. command line client, Workbench, nog andere omgevingen waarin je SQL-commando's kan intypen en uitvoeren\). **In sommige omgevingen zorgen fouten in transacties vanzelf voor een `ROLLBACK` en in sommige niet.** Als je zeker wil zijn van het gewenste gedrag, programmeer het dan met behulp van een handler. Op mijn systeem blijft dit nieuwe genre in het systeem staan, maar bij jou zou het afwezig kunnen zijn! Meer informatie vind je [hier](https://stackoverflow.com/questions/6121917/automatic-rollback-if-commit-transaction-is-not-reached).

{% hint style="info" %}
Let wel op: hier kan je eigenlijk geen handler zetten want er is geen stored procedure. Maar voor een stored procedure gelden dezelfde regels.
{% endhint %}

{% hint style="danger" %}
We herhalen het nogmaals: in MySQL is de body van een stored procedure geen transactie. Als je een rollback wil kunnen doen, moet je dus `START TRANSACTION` schrijven en eindigen met een `COMMIT`.
{% endhint %}

