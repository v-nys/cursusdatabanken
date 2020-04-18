# ERROR HANDLING

Indien binnen een stored procedure zich een onverwachte fout zou voordoen is het belangrijk hierop gepast te reageren. 

Dit gepast reageren kan zijn van verder te gaan of het huidige blok code niet meer uit te voeren of een boodschap te geven.

Hieronder wordt het gebruik van handlers summier uitgelegd.

### Declare handler

**Syntax**

```sql
DECLARE actie [CONTINUE of EXIT] HANDLER FOR statement(s);
```



