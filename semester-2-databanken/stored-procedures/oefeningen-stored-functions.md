# Oefeningen stored functions

## Vraag 1

Schrijf een stored function `PercentageOf`. Hiermee kan je een bepaald percentage van een getal uitrekenen. Het percentage geef je eerst mee en is een geheel getal, het getal waarvan je dat percentage wil uitrekenen is het tweede argument. Dit is een `double`.

Als een van de twee getallen `NULL` is, signaleer je foutcode `'45000'`.

Noem je script `0701__Oefening.sql`.

## Vraag 2

Schrijf een stored function `RandUpTo`. Deze genereert een willekeurig geheel getal tussen 1 en het meegegeven getal (volgens de formule die we eerder al gebruikt hebben, maar netjes verpakt in een stored function). Als de bovengrens `NULL` is of kleiner is dan 1, signaleer je foutcode `'45000'`.

Noem je script `0702__Oefening.sql`.

## Vraag 3

Schrijf een stored function `RandBetween`. Deze genereert een willekeurig geheel getal tussen twee meegegeven getallen. Als het eerste getal groter dan het tweede is of als een van de twee `NULL` is, signaleer je foutcode `'45000'`.

Tip: Begin door het verschil tussen de twee getallen te berekenen. Maak daarna gebruik van `RandUpTo` uit de vorige vraag.

Noem je script `0703__Oefening.sql`.

## Vraag 4

Schrijf een stored procedure `ConvertFeetToMeters`. Deze verwacht twee gehele getallen: een aantal voet (_feet_) en een aantal duim (_inches_). Als uitvoer levert ze het aantal meter, afgerond tot op twee cijfers na de komma. Als een van de meegegeven getallen `NULL` is, signaleer je foutcode `'45000'`.

1 voet is 0.3048 meter. 1 duim is 0.0254 meter.

Noem je script `0704__Oefening.sql`.
