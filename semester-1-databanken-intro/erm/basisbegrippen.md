# Basisbegrippen

## Entity, Entity Set, Extension

* Entity \(entiteit\): een reëel "ding" of "object", dat we kunnen onderscheiden van alle andere dingen of objecten.
* Entiteiten kunnen concreet zijn \(personeelslid, klant, product,...\) of abstract \(lening, afspraak, op te nemen verlofdag,...\)
* Een "entity set" \(letterlijk vertaald: verzameling van entiteiten, misschien beter: "entiteitstype"\) beschrijft alle mogelijke entiteiten van dezelfde soort.
* De concrete samenstelling van een entity set zal regelmatig wijzigen \(personeelsleden bij of weg, klanten
* Voorstelling: 

![](../../.gitbook/assets/image%20%2827%29.png)

## Attributes, Values, Domain

* Een entiteit wordt voorgesteld door een verzameling "attributes", beschrijvende eigenschappen, die gedeeld worden door alle entiteiten uit de gegeven entity set.
* Het feit dat alle entiteiten een zelfde attribuut hebben, wijst op informatie van hetzelfde type \(gewicht, kleur, personeelsnummer,...\). Maar elke entiteit kan wel een andere "value" \(waarde\) hebben voor dit attribuut \(65Kg, groen, INF7089,...\).
* De toegelaten values voor een gegeven attribuut uit een entity set, vormen het "domain" \(domein\).
* Attributen kunnen samengesteld zijn. Bv. adres kan als een samengesteld attribuut gezien worden.
* Attributen kunnen herhalend zijn. Bv. telefoonnummer, persoon ten laste,...
* Null value. Dit is een speciale waarde, gebruikt voor "onbekend" of "niet toepasbaar". De null is verschillend van een 0 \(nul\) of een lege string \(""\).
* Berekenbaar attribuut: bv. als het attribuut geboortedatum bestaat, kan het attribuut leeftijd berekend worden uit geboortedatum en huidige datum.
* Voorstelling:

![](../../.gitbook/assets/image%20%2832%29.png)

## Relation, Relationship set

* Een relation is een verband tussen verschillende entiteiten. bv. de relatie "ontlener" tussen de entiteit "Janssens" uit de entity set klanten en de entiteit lening nr 0001 uit de entity set leningen.
* Een relationship set \(relatie\) is de verzameling van alle gelijkaardige relaties tussen entiteiten uit dezelfde entity sets.

![](../../.gitbook/assets/image%20%2856%29.png)

* In bovenstaande relatie speelt Janssens de rol van "lener" en 0001 de rol van "lening". Rollen zijn alleen echt van belang bij relaties van een entity set naar zichzelf, "recursieve" relaties.
* Voorbeeld: de relatie "is manager van" van de entity set "personeel" naar zichzelf.
* We moeten hier een onderscheid kunnen maken tussen de entiteit die de rol van manager heeft, en de entiteit\(en\) die de rol van "gemanaged personeelslid" hebben. Ander voorbeeld: de relatie "is een onderdeel van" in de entity set "wisselstukken".
* Een relatie kan eveneens attributen hebben.
* Voorbeeld: de relatie "houder" tussen "klanten" en "rekening" kan het attribuut "laatste verwerking" hebben, met de datum van de laatste opname of storting.
* Relaties hoeven niet steeds binair te zijn, dwz. tussen twee entity sets. Er zijn ook relaties mogelijk tussen drie, vier,... entity sets. Dit noemt men de "graad" van een relationship set.
* Voorstelling:

![](../../.gitbook/assets/image%20%2810%29.png)

