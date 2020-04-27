# OBJECT ACCESS CONTROL

## Definer

Hiermee kan je bepalen met welke MySQL account-privileges de stored procedure zal worden uitgevoerd.

Zonder `DEFINER` is de default de actuele gebruiker zijn rechten.

Enkel ingeval je `SYSTEM` rechten hebt, kan je een `DEFINER` bepalen voor de uitvoering van de stored procedure.

**Syntax**:

```sql
CREATE [DEFINER=gebruiker] PROCEDURE StoredProcedureName(parameter(s))
```

## Sql Security





