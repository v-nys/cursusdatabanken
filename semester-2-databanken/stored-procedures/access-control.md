---
description: (security)
---

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

Een stored procedure een `SECURITY` clausule bevatten met een waarde voor de `DEFINER` of de `INVOKER`.

**Syntax:**

```sql
CREATE [DEFINER=gebruiker] PROCEDURE StoredProcedureName(parameter(s)
SQL SECURITY [DEFINER | INVOKER]
```

#### SQL SECURITY DEFINER

Met de `DEFINER` zal de stored procedure in de beveiligingscontext worden uitgevoerd bepaald door het `DEFINER`-attribuut.

Hierdoor kan een stored procedure worden uitgevoerd met meer rechten dan de gebruiker zelf heeft.

#### SQL SECURITY INVOKER

Indien je gebruik maakt van het `INVOKER`-attribuut zal het `DEFINER`-attribuut geen effect meer hebben.









