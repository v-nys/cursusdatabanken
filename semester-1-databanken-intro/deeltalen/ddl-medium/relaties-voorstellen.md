# Relatietypes voorstellen
Afhankelijk van hoe entiteiten aan elkaar gekoppeld kunnen zijn, delen we de koppelingen tussen deze entiteiten op in categorieën:

* een-op-een-relaties
* een-op-veel-relaties
* veel-op-veel-relaties

## een-op-een relaties
De simpelste verbanden zijn één-op-één verbanden.
Dat wil zeggen: precies twee rijen nemen deel aan de relatie.
Normaal zijn dit rijen van verschillende entiteittypes.

Een voorbeeld: een sportclub organiseert een jaarlijks etentje en alle leden krijgen precies één taak.
Eén lid zorgt bijvoorbeeld voor bestek, een ander voor frisdrank, een ander voor onderleggers, enzovoort.
De club gebruikt een database om de taken en de leden bij te houden en de taken zijn elk jaar dezelfde. Bijvoorbeeld:

* taken:
  * bestek voorzien
  * frisdrank meebrengen
  * aardappelsla maken
* leden:
  * Yannick
  * Bavo
  * Max

Onderstaande figuur stelt deze indeling voor:

![](taak-persoon-1-1.svg)

In dit geval is het logisch om een aparte tabel (`Taken`) voor taken en een aparte tabel (`Leden`) voor leden te gebruiken.
Het is onhandig om uit te leggen dat één rij in de databank een lid en een taak voorstelt, omdat de tabellen best zo goed mogelijk overeenstemmen met duidelijke concepten.
Het is logischer de leden en de taken als aparte entiteiten te beschouwen en een relatie tussen beide vast te leggen.

### voorstelling van één-op-één relaties
Om een relaties tussen rijen van de tabellen vast te leggen, maken we de rijen eerst identificeerbaar met een primaire sleutel.
Bijvoorbeeld, voor de taken:

| omschrijving | Id |
|--------------|----|
| bestek voorzien | 1 |
| frisdrank meebrengen | 2 |
| aardappelsla maken | 3 |

Voor de personen:

| voornaam | Id |
|----------|----|
| Yannick | 1 |
| Bavo | 2 |
| Max | 3 |

Zet de structuur van de twee tabellen om in SQL-tabellen met een script ???CreateTakenLeden. Elke kolom bestaat uit een reeks van maximaal 50 karakters (zonder accenten e.d.).

Vul de twee tabellen, Taken en Leden in met een script ???InsertTakenLeden.

Als Bavo bestek voorziet, Yannick frisdrank meebrengt en Max aardappelsla maakt, kunnen we dat als volgt bijhouden in een aparte tabel die alleen vreemde sleutels bevat:

| Leden_Id | Taken_Id |
| 2 | 1 |
| 1 | 2 |
| 3 | 3 |

In de praktijk wordt er normaal niet voor gekozen om deze relatie in een aparte tabel vast te leggen.
Dat zou gaan, maar het is gewoon een beetje te veel van het goede.
Je hebt geen aparte tabel nodig.
Eén van de twee tabellen wordt uitgebreid met een foreign key.
Er zijn twee mogelijkheden:

| omschrijving | Id | Leden_Id |
|--------------|----|----------|
| bestek voorzien | 1 | 2 |
| frisdrank meebrengen | 2 | 1 |
| aardappelsla maken | 3 | 3 |

of

| voornaam | Id | Taken_Id |
|----------|----|----------|
| Yannick | 1 | 2 |
| Bavo | 2 | 1 |
| Max | 3 | 3 |

Beide zijn even goed.
Typisch wordt gekozen om de foreign key in de tabel te zetten met het kleinste aantal kolommen, om alles een beetje in evenwicht te houden.
Hier hebben beide even veel kolommen dus het maakt helemaal niet uit.

Pas je tabel Leden aan zodat ze de tweede mogelijkheid van hierboven implementeert in een script ???ModifyLeden.
Je mag niet verhinderen dat de vreemde sleutel de waarde NULL aanneemt.

## een-op-veel relaties

### speciaal geval: een-op-max-een-relaties

## veel-op-veel relaties

### speciaal geval: 0 of 1 in plaats van "veel"
