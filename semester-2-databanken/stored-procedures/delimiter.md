# DELIMITER

Sql statements worden afgesloten door een puntkomma \(;\). 

M.a.w. worden alle sql statements die door een puntkomma van elkaar worden gescheiden afzonderlijk uitgevoerd.

Bij een stored procedure is de situatie lichtjes verschillend, m.n. een stored procedure die een puntkomma bevat zal dit dus niet als één geheel beschouwen, maar wel als verschillende afzonderlijke statements. 

Dat is de reden waarom de zgn. delimiter bij stored procedures opnieuw wordt bepaald. Dit zorgt er dan voor dat de stored procedure als één geheel aan de server kan doorgegeven worden.

Daarvoor gebruiken we het keyword `DELIMITER`.  
Het gebruikte karakter mag bestaan uit één karakter of meerdere, bv. // $$.

Een stored procedure bevat meestal meerdere statements die door puntkomma's van elkaar gescheiden worden. Om de volledige stored procedure uit te voeren als een enkele samengesteld statement, moet de delimiter tijdelijk wijzigen van de puntkomma \(;\) naar andere begrenzers zoals $$ of //.

```sql
DELIMITER $$
 
CREATE PROCEDURE storedprocedure_name()
BEGIN
  -- statements
END $$
 
DELIMITER ;
```

Zoals je merkt uit bovenstaand voorbeeld wijzig je de delimiter bij aanvang naar $$ om deze op het einde opnieuw te wijzigen in puntkomma \(;\).

