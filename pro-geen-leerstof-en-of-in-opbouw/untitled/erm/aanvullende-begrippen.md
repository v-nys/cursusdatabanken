# Aanvullende begrippen

## Specialisatie en generalisatie; overerving van attributen

* Voorbeeld: zichtrekening en spaarrekening. Deze hebben de gemeenschappelijke attributen van elke rekening (rekeningnummer, saldo, datum laatste verrichting) maar ook een specifiek attribuut: krediet en interestvoet. Dit noemen we "specialisatie". Het omgekeerde proces is generalisatie.
* De entity sets zichtrekening en spaarrekening "erven" de attributen van de entity set rekeningen.

![](<../../../.gitbook/assets/image (52).png>)

{% hint style="info" %}
Voorlopig moet je specialisatie en generalisatie enkel op het conceptuele niveau kennen. Dat wil zeggen dat je deze zaken in een ERD moet kunnen noteren, maar je moet ze niet kunnen voorstellen in een tabelstructuur. In het algemeen spring je ook best spaarzaam om met overerving.
{% endhint %}

## Design constraints

* attribuut-bepaald: een entity kan tot een specialisatie behoren op basis van een attribuut in de veralgemeende entity set, bv. het attribuut "rekeningstype", dat de waarde "zicht" of "spaar" kan hebben.
* user-bepaald: de gebruiker kan zelf een entity indelen in de specialisatie naar keuze.
* gescheiden of overlappend: het kan zijn dat een entiteit slechts tot één gespecialiseerde entity set mag behoren, of tot meerdere tegelijk. Het is bijvoorbeeld niet mogelijk dat een rekening tegelijkertijd een spaarrekening én een zichtrekening is, maar dat wil niet zeggen dat dit voor andere entiteittypes ook altijd zo is.
* totaal of partieel: het kan zijn dat een entiteit _moet_ behoren tot een gespecialiseerde set, maar het kan ook zijn dat dit niet hoeft.

## Aggregatie

Aggregatie in een ERM houdt in dat een relatie tussen twee entiteittypes wordt behandeld als een entiteit op zich. Aggregatie wordt oa. gebruikt om relaties tussen relaties te leggen.

![](<../../../.gitbook/assets/image (72).png>)

Dit is een n op n relatie, het attribuut filiaal hoort dus bij de relationship set, en kan niet verplaatst worden naar een van de entity sets.

Door aggregatie kunnen we het attribuut filiaal verzelfstandigen tot entity set.

![](<../../../.gitbook/assets/image (55).png>)

In deze laatste afbeelding is er een associatieve entiteit `Lening` aanwezig.
