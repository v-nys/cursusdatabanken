# Constraints (voorwaarden, beperkingen)

## Cardinaliteit Er zijn vier soorten:

* één op één
* één op n
* n op één
* n op n

Attributen die horen bij een één op n-, of bij een n op één-relatie, kunnen, indien gewenst, verschoven worden naar de entity set aan de n-kant van de relationship set.\
Bij een n op n-relatie kan een attribuut dat bij de relatie hoort, niet verschoven worden naar één van de entity-sets.\
Bij een één op één relatie kan men een attribuut verschuiven naar keuze verschuiven naar een deelnemende entity set.

## Existence dependency

De "ondergeschikte" entiteit moet steeds horen bij een "dominante" entiteit.

* Voorbeeld: de entity set lening en de entity set afbetalingen. Elke afbetaling moet bij een concrete lening horen.
* Gevolg: als we een lening uit de database verwijderen, moeten we alle afbetalingen voor die lening mee verwijderen. Het is wel mogelijk om een bepaalde afbetaling te verwijderen, zonder de lening waarvoor ze bedoeld was, mee te verwijderen.
* Gevolg: de deelname van de entity set afbetalingen aan de relatie leningen-afbetalingen, is "totaal". De deelname van de entity set leningen aan de relatie leningen-afbetalingen is "partieel": het is mogelijk een lening te hebben waarvoor (nog) geen afbetalingen gebeurd zijn.

![](<../../../.gitbook/assets/image (40).png>)

![](<../../../.gitbook/assets/image (21).png>)

## Vormen van integriteit

Constraints dwingen verschillende vormen van "integriteit" af.

Cardinaliteit en existence dependencies worden in de eerste plaats gelinkt aan "referentiële integriteit". Dit wil zeggen dat entiteiten op een correcte manier naar elkaar verwijzen. Het is om referentiële integriteit te bewaren dat een database management systeem niet toestaat dat je een vreemde sleutelwaarde ingeeft die verwijst naar een niet-bestaande entiteit. **Let op: het is vaak wel mogelijk om een vreemde sleutelwaarde `NULL` te gebruiken.**

Breder dan alleen referentiële integriteit is data-integriteit. Dit wil zeggen dat de data geen ongeldige waarden bevat. Niets kan je volledig beschermen tegen foutieve invoer, maar (onder andere) volgende types checks bieden een betere data-integriteit:

* checks op `NULL`
* checks op toegelaten waarden

Er zijn nog specifieke vormen van data-integriteit naast referentiële integriteit. Deze worden behandeld in de cursus Databanken.
