# Constraints \(voorwaarden, beperkingen\)

## Cardinaliteit Er zijn vier soorten:

* één op één
* één op n
* n op één
* n op n

Attributen die horen bij een één op n-, of bij een n op één-relatie, kunnen, indien gewenst, verschoven worden naar de entity set aan de n-kant van de relationship set.  
Bij een n op n-relatie kan een attribuut dat bij de relatie hoort, niet verschoven worden naar één van de entity-sets.  
Bij een één op één relatie kan men een attribuut verschuiven naar keuze verschuiven naar een deelnemende entity set.

## Existence dependency

De "ondergeschikte" entiteit moet steeds horen bij een "dominante" entiteit.

* Voorbeeld: de entity set lening en de entity set afbetalingen. Elke afbetaling moet bij een concrete lening horen.
* Gevolg: als we een lening uit de database verwijderen, moeten we alle afbetalingen voor die lening mee verwijderen. Het is wel mogelijk om een bepaalde afbetaling te verwijderen, zonder de lening waarvoor ze bedoeld was, mee te verwijderen.
* Gevolg: de deelname van de entity set afbetalingen aan de relatie leningen-afbetalingen, is "totaal". De deelname van de entity set leningen aan de relatie leningen-afbetalingen is "partieel": het is mogelijk een lening te hebben waarvoor \(nog\) geen afbetalingen gebeurd zijn.

![](../../.gitbook/assets/image%20%2821%29.png)

![](../../.gitbook/assets/image%20%2822%29.png)

