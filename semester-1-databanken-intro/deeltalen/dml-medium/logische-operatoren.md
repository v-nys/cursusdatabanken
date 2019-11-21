# Logische operatoren

We willen niet alleen rijen kunnen selecteren gebaseerd op één kolom die gelijk is aan een bepaalde waarde. We moeten ook complexere voorwaarden kunnen opstellen. Daarom beschikken over we een hele reeks operatoren die we bovendien kunnen combineren.

## wat zijn booleaanse expressies?

Een **expressie** is een waarde of iets dat je kan uitrekenen om een waarde te krijgen. Een **booleaanse expressie** is een expressie met een uiteindelijke waarde `TRUE`, `FALSE` of \(in SQL\) `NULL`.

## hoe booleaanse expressies opbouwen?

De bouwstenen zijn:

* `TRUE`, `FALSE` en `NULL`
* haakjes \(voor groepering\)
* de logische operatoren `AND`, `OR` en `NOT` \(en `XOR`\)
* en andere constructies die een voorwaarde uitdrukken \(deze komen later aan bod\)

Het gebruik van de ronde haakjes dient om de volgorde van de evaluatie van de operatoren te bepalen. Wat tussen haakjes staat, werk je eerst uit als één geheel, vooraleer je de onderdelen buiten deze haakjes uitrekent.

Voor de logische operatoren gebruiken we waarheidstabellen:

| AND | TRUE | FALSE | NULL |
| :--- | :--- | :--- | :--- |
| TRUE | TRUE | FALSE | NULL |
| FALSE | FALSE | FALSE | FALSE |
| NULL | NULL | FALSE | NULL |

| OR | TRUE | FALSE | NULL |
| :--- | :--- | :--- | :--- |
| TRUE | TRUE | TRUE | TRUE |
| FALSE | TRUE | FALSE | NULL |
| NULL | TRUE | NULL | NULL |

| NOT | TRUE | FALSE | NULL |
| :--- | :--- | :--- | :--- |
|  | FALSE | TRUE | NULL |

| XOR | TRUE | FALSE | NULL |
| :--- | :--- | :--- | :--- |
| TRUE | FALSE | TRUE | NULL |
| FALSE | TRUE | FALSE | NULL |
| NULL | NULL | NULL | NULL |

{% hint style="info" %}
Om deze te onthouden, doe je er best aan `NULL` te zien als een onbekend resultaat. Als je niet zeker bent wat de uitkomst is omwille van de aanwezigheid van `NULL`, zal de uitkomst zelf ook `NULL` zijn.
{% endhint %}

Je kan de waarheidstabellen ook nabouwen in Workbench, bv.:

```sql
SELECT TRUE OR NULL;
```

