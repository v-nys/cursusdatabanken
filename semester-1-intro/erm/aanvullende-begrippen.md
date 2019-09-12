# Aanvullende begrippen

## Specialisatie en generalisatie; overerving van attributen

* Voorbeeld: zichtrekening en spaarrekening. Deze hebben de gemeenschappelijke attributen van elke rekening \(rekeningnummer, saldo, datum laatste verrichting\) maar ook een specifiek attribuut: krediet en interestvoet. Dit noemen we "specialisatie". Het omgekeerde proces is generalisatie.
* De entity sets zichtrekening en spaarrekening "erven" de attributen van de entity set rekeningen.

![](../../.gitbook/assets/image%20%2812%29.png)

## Design constraints

* attribuut-bepaald: een entity kan tot een specialisatie behoren op basis van een attribuut in de veralgemeende entity set, bv. het attribuut "rekeningstype", dat de waarde "zicht" of "spaar" kan hebben.
* user-bepaald: de gebruiker kan zelf een entity indelen in de specialisatie naar keuze.
* gescheiden of overlappend.
* totaal of partieel.

## Aggregatie 

Aggregatie wordt oa. gebruikt om relaties tussen relaties te leggen.

![](../../.gitbook/assets/image%20%2817%29.png)

Dit is een n op n relatie, het attribuut filiaal hoort dus bij de relationship set, en kan niet verplaatst worden naar een van de entity sets. 

Door aggregatie kunnen we het attribuut filiaal verzelfstandigen tot entity set.

![](../../.gitbook/assets/image%20%2829%29.png)

