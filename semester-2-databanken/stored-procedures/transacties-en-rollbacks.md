# Transacties en rollbacks

{% hint style="success" %}
[Kennisclip](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=63f094e8-a235-4ad9-b4ff-ad2501041c5e)
{% endhint %}

## Transacties

### Wat is een transactie?

Bij het woord "transactie" denk je waarschijnlijk aan een uitwisseling van geld en/of goederen. Belangrijk bij zo'n uitwisseling is dat ze volledig wordt afgewerkt, of volledig wordt geannuleerd. Soms is dit ook van belang in een SQL-script.

Een voorbeeld: Je gaat naar de dokter en betaalt met Bancontact. Op dat moment gaat het bedrag op jouw rekening naar beneden **en** gaat het bedrag op de rekening van de dokter naar omhoog. Dit kan misschien voorgesteld zijn met `UPDATE`-statements. Bijvoorbeeld iets als dit:

```sql
update Rekeningen set Totaal = Totaal - Bedrag where Rekeningen.Eigenaars_Id = <id-patient>;
update Rekeningen set Totaal = Totaal + Bedrag where Rekeningen.Eigenaars_Id = <id-arts>;
```

Het is absoluut ontoelaatbaar dat slechts één van deze instructies uitvoert en de andere niet. Dat zou betekenen dat iemands geld zomaar verdwijnt of zomaar aangroeit. Maar, als je deze instructies zomaar in een script plakt en de tweede loopt fout \(bijvoorbeeld omwille van een storing, of omdat de rekening van de dokter niet meer actief is, of tal van andere mogelijke redenen\), is dat wel wat gebeurt: als een instructie fout loopt, is het effect van de voorgaande instructies nog steeds zichtbaar.

Om dit te vermijden, geven we aan dat de instructies "alles of niets" zijn. De technische term hiervoor is **atomair**, omdat men vroeger dacht dat atomen ondeelbaar waren. Dat aangeven doen we door de instructies aan te duiden als een transactie met de tekst `START TRANSACTION`. Na de laatste instructie zetten we dan `COMMIT` om het einde van de transactie aan te geven. Via de instructie `ROLLBACK` kan je voorlopige wijzigingen ongedaan maken. Deze instructie voer je normaal uit in een handler.

{% hint style="warning" %}
We behandelen in deze cursus niet het "isolation level" van transacties. Dit geeft aan hoe je moet omspringen met transacties die tegelijkertijd lopen en dezelfde data gebruiken. Dit is complexer dan gewoon "alles of niets doen". Als je denkt dat dit mogelijk is in jouw systeem,  moet je het juiste isolatieniveau instellen. Meer uitleg over wat fout kan lopen en welk niveau je best kiest, vind je [hier](https://www.youtube.com/watch?v=-gxyut1VLcs&t=229s). Dit is geen vereiste leerstof.
{% endhint %}

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

