# LEAVE

Met dit commando kunnen we stored procedure verlaten.

Als we een label aan een herhalingsstructuur geven, kunnen we ook enkel de lus verlaten \(zie verder\).

**Syntax**

```sql
LEAVE label;
```

Met het gebruik van het `LEAVE` commando moeten we zorgen dat we op de gewenste plaats een label voorzien.

In volgend voorbeeld werd een label voorzien voor wat de gehele stored procedure betreft, nl. spLabel dat voor het keyword BEGIN werd geplaatst.

```sql
CREATE PROCEDURE spNaam()
spLabel: BEGIN
    IF conditie THEN
        LEAVE spLabel;
    END IF;
    -- vervolg van de sp...
END$$
```







