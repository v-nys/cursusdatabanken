# Discussiepunten bij ontwerp in ERM

## Keuze tussen entity set of attribuut

* voorbeeld: neem de entity set "employee" en het attribuut "telephonenumber". Men kan evengoed twee entity sets maken, "employee" en "telephone" met daartussen een relationship set.
* "Telephone" kan dan bovendien extra attributen krijgen (plaats, type, kleur,...).
* Voordeel van afzonderlijke entity set:
* aantal is niet naar onder of boven begrensd
* telefoon kan gemakkelijker toegewezen worden aan verschillende personen tegelijk
* eenvoudig toevoegen van extra attributen
* Voordelen van attribuut: eenvoud
* Opmerking: een zwakke entity set is steeds equivalent met een samengesteld, herhalend attribuut van de overeenkomstige sterke entity set.

## Keuze tussen entity set of relationship set

* Voorbeeld: een lening kunnen we zien als een entity set op zich, maar ook als een relationship set tussen klanten en filialen, met ln\_nr en bedrag als attributen van de relationship set.
* Nadelen: als de relationship set geen 1 op 1-relatie is, en attributen heeft, dan ontstaat duplicatie van gegevens.
* In het geval een begrip duidelijk twee entiteittypes verbindt, maar ook eigen attributen bezit, wordt gekozen voor een **"associatieve entiteit"**. Een voorbeeld hiervan kan bijvoorbeeld "lesmoment" zijn, wanneer er entiteittypes voor leerkrachten en voor vakken zijn. Een lesmoment verbindt een leerkracht en een vak, maar voegt toe op welk tijdstip de leerkracht in kwestie het vak geeft.

## Keuze tussen binaire of meervoudige relationship sets

Een relationship tussen meer dan twee entity sets kan steeds herleid worden tot meerdere relationship sets die binaire zijn (dwz. tussen twee entity sets).

![](<../../../.gitbook/assets/image (17).png>)
