# Inleiding

## Voordelen van MySQL stored procedures:

* **Verminder het netwerkverkeer:** Stored procedures helpen het netwerkverkeer tussen applicaties en de database te verminderen. In plaats van meerdere lange sql statements vanuit een applicatie over het netwerk te versturen, hoeven deze applicaties ingeval van stored procedures alleen de naam en parameters van de opgeslagen procedures aan te roepen.
* **Centraliseer zakelijke logica in de database zelf:** De stored procedures kunnen gebruikt worden om de business logica te implementeren en dus maar één keer te moeten aanmaken en onderhouden, die op hun beurt door meerdere applicaties kunnen worden (her)gebruikt.&#x20;
* **Consistentere database:** De stored procedures helpen de inspanningen om dezelfde logica telkens te moeten herschrijven voor verschillende applicaties te verminderen en maken daardoor de database consistenter.
* **Database is veiliger:** De databasebeheerder kan passende rechten toekennen aan applicaties die alleen toegang hebben tot specifieke stored procedures zonder dat er rechten op de onderliggende tabellen moeten worden gegeven.

## Debugging

Helaas biedt MySQL Workbench geen ingebouwde faciliteiten om stored procedures te debuggen. Dit is wel mogelijk met externe tools, zoals MyDebugger, maar we zullen deze niet gebruiken.

## De voorbeelddatabase

![](../../.gitbook/assets/aptunes\_erd.png)

Hieronder kan je het calibratiescript downloaden.

{% file src="../../.gitbook/assets/aptunes2020.sql" %}
Calibratiescript
{% endfile %}
