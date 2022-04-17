# Oefeningen triggers

## Vraag 1

Maak een tabel en een reeks triggers (`log_insert_liedjes` enz.) om alle aanpassingen aan de tabel `Liedjes` van aptunes te loggen. Meerbepaald: maak een tabel met daarin de naam van de persoon die de aanpassing gedaan heeft (een `VARCHAR(100)`), het ID van het liedje in kwestie, het type aanpassing (een enumeratie van `INSERT`, `UPDATE` en `DELETE`) en het tijdstip.

Gebruik hierbij de `USER()`-functie_._ Die geeft de naam van de verbonden gebruiker terug. Noem je script `0705__Oefening.sql`_._

## Vraag 2

Het is technisch mogelijk, maar sterk afgeraden identifiers van data aan te passen. Dit komt omdat bestaande verwijzingen hierdoor ongeldig kunnen worden.

Schrijf daarom een trigger `prevent_update_id` die er voor zorgt dat het ID van een liedje niet gewijzigd kan worden. Als iemand dit toch probeert, mag er een foutcode `'45000'` optreden.

Noem je script `0706__Oefening.sql`_._
