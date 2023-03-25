# Keys (Sleutels)

## Sleutel van een entity set

* Elke entity set moet een verzameling attributen hebben die toelaat om een entity uit de entity set uniek te onderscheiden.
* De kleinste verzameling van attributen waarmee dit kan, noemen we de "sleutel".
* Er kunnen meerdere sleutels mogelijk zijn, we noemen die dan "kandidaat-sleutels".
* We kiezen dan een "primaire sleutel" uit deze kandidaat-sleutels.

![](<../../../.gitbook/assets/image (53) (1).png>)

{% hint style="info" %}
In SQL-databanken wordt typisch een eenvoudig numeriek sleutelattribuut `Id` toegevoegd. Dit neemt weinig ruimte in beslag, is makkelijk automatisch toe te kennen en uit te schrijven.
{% endhint %}

## Sleutel van een relationship set

* Een relatie tussen twee entity sets wordt uniek bepaald door de sleutels van elk van de twee entiteiten waartussen de relatie ligt. Voorbeeld: (klantnummer, rekeningnr) is een sleutel voor de relatie "houder van" tussen klanten en rekeningen.
* Indien we een één op n-relatie hebben, volstaat de sleutel van de entity set aan de n-kant
* Als we een één op één-relatie hebben, volstaat de sleutel van een van beide entity sets naar keuze.
* De sleutel van een relationship set wordt niet aangeduid in het diagram.

## Weak (zwakke) entity sets

* Als een entity set onvoldoende attributen heeft om een sleutel te vormen, noemen we de entity set "zwak".
* Dit kan alleen als de zwakke entity set ondergeschikt is aan een dominante sterke entity set.
* De kleinste verzameling attributen die toelaat om onderscheid te maken tussen de verschillende ondergeschikte entiteiten van dezelfde dominante entiteit, noemen we de "discriminator".
* De sleutel van de zwakke entity set kan dan gevormd worden door de primaire sleutel van de sterke entity set, en de "discriminator" van de zwakke entity set.
* Opmerking:existence dependency leidt niet automatisch tot een zwakke entity set.

Een voorbeeld is een entity type `Hotelkamer` met een kolom `Nummer`. `Nummer` op zich kan niet als sleutel dienen. Een entiteit van dit type kan enkel uniek geïdentificeerd worden wanneer ze gelinkt wordt aan een hotel.
