# LEAVE

Met dit commando kunnen we stored procedure verlaten.

Als we een label \(d.w.z. een benaming\) aan een herhalingsstructuur geven, kunnen we met `LEAVE` ook enkel die lus verlaten.

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

## Het gebruik van LEAVE commando in combinatie met herhalingsstructuren

Je kan LEAVE gebruiken met alle herhalingsstructuren. Toch wordt aangeraden dat je er niet te veel gebruik van gemaakt: `WHILE` en `REPEAT` drukken in de eerste plaats via hun voorwaarde uit wanneer de lust verlaten wordt. 

`LEAVE` in combinatie met `LOOP`

```sql
    IF conditie THEN
        LEAVE [label];
    END IF;
    -- vervolg
END LOOP [label];
```

`LEAVE` in combinatie met `REPEAT`

```sql
[label:] REPEAT
    IF conditie THEN
        LEAVE [label];
    END IF;
    -- vervolg
UNTIL conditie
END REPEAT [label];
```

`LEAVE` in combinatie met `WHILE`

```sql
[label:] WHILE conditie DO
    IF conditie THEN
        LEAVE [label];
    END IF;
    -- vervolg
END WHILE [label];
```

