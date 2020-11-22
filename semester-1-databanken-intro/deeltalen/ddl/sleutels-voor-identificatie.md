# Sleutels voor identificatie

{% hint style="success" %}
[Kennisclip](https://youtu.be/As96me65U7A)
{% endhint %}

## Sleutels in MySQL: motivatie

De tabellen die je tot hiertoe gemaakt hebt in MySQL, groeperen heel veel informatie in één record. Informatie groeperen is een belangrijk doel van databanken, maar het gebeurt beter pas wanneer de groepering zelf nodig is. Anders krijg je databanken die meer plaats innemen dan nodig, die makkelijker fouten zullen bevatten en die moeilijker te navigeren zijn. Het belangrijkste principe om de data pas te groeperen wanneer dat nodig is, is dat van een sleutel. Hier bekijken we het binnen MySQL.

Met een sleutel kan je elke rij in een tabel aanduiden zonder te verwijzen naar de eigenlijke informatie in die rij. We wijzen eerst op enkele problemen met de aanpak die we tot hier gehanteerd hebben en leggen dan uit hoe sleutels deze problemen kunnen oplossen.

## Een eerste problematische tabel

Soms hebben twee rijen dezelfde waarden in bepaalde velden, maar gaat het toch over verschillende data. Dit is een eerste probleem dat we kunnen oplossen met attributen die we aanduiden als sleutels.

Een quizvraag voor de gamers: wat hebben de games God of War, Doom en Tomb Raider met elkaar gemeen? Antwoord: het zijn allemaal remakes van oude games met dezelfde titel en dezelfde ontwikkelaar.

Als je een tabel van \(oude en nieuwe\) games aanmaakt, met als kolommen hun titel en ontwikkelaar, zou een stukje van de tabel er dus als volgt kunnen uitzien:

| Titel | Ontwikkelaar |
| :--- | :--- |
| Doom | ID Software |
| Doom | ID Software |
| Tomb Raider | Crystal Dynamics |
| Tomb Raider | Crystal Dynamics |
| God of War | SCE Santa Monica |
| God of War | SCE Santa Monica |

Voor SQL is er geen verschil tussen de oude en de nieuwe versies van deze games, maar het gaat in werkelijkheid wel om verschillende zaken. Je zou het jaar van uitgave als kolom kunnen toevoegen om elke rij uit elkaar te houden. Of de spelconsole waarop het spel uitkwam. Of misschien is de uitgever steeds veranderd. Dan kan je elke rij uniek maken door die toe te voegen. Maar niets verhindert een ontwikkelaar om twee gelijknamige games meteen na elkaar uit te geven bij eenzelfde uitgever.

Het idee om elke rij uniek te maken is goed, maar je volgt best een voorzichtige aanpak. Dit kan door kolommen toe te voegen die een rij uniek kunnen identificeren. Een stel kolommen waarmee je een rij uniek kan identificeren, kan dan aangeduid worden als **primaire sleutel of primary key**. Deze verzameling kolommen \(of ene kolom\) hoeft niet noodzakelijk "leesbare" informatie te bevatten. Vaak is het gewoon een getal, zoals in dit voorbeeld, waarin de kolom `Id` een primaire sleutel is:

| Titel | Ontwikkelaar | Id |
| :--- | :--- | :--- |
| Doom | ID Software | 1 |
| Doom | ID Software | 2 |
| Tomb Raider | Crystal Dynamics | 3 |
| Tomb Raider | Crystal Dynamics | 4 |
| God of War | SCE Santa Monica | 5 |
| God of War | SCE Santa Monica | 6 |

Je kan in SQL uitdrukken dat een bepaalde kolom wordt gebruikt als primaire sleutel, zodat je nooit per ongeluk twee rijen kan aanmaken met eenzelfde waarde in deze kolom.

## Sleutels voor efficiënt gebruik van ruimte

Tabellen zoals we ze eerder soms hebben gezien, zijn ook niet bruikbaar voor \(middel\)grote systemen omwille van een efficiëntieprobleem. Sleutels zullen je ook toestaan op grotere schaal te werken.

Veronderstel dat je, in opdracht van Game Mania, een databank met videogames moet opstellen. Ze hebben momenteel volgende producten in hun inventaris en willen deze in hun nieuwe databank opslaan:

| Titel | Platform |
| :--- | :--- |
| Anthem | PS4 |
| Anthem | XBox One |
| Anthem | Windows |
| Sekiro: Shadows Die Twice | PS4 |
| Sekiro: Shadows Die Twice | XBox One |
| Sekiro: Shadows Die Twice | Windows |
| Devil May Cry 5 | PS4 |
| Devil May Cry 5 | XBox One |
| Mega Man 11 | PS4 |
| Mega Man 11 | XBox One |
| Mega Man 11 | Nintendo Switch |
| Mega Man 11 | Windows |
| Mass Effect: Andromeda | PS4 |
| Mass Effect: Andromeda | XBox One |
| Mass Effect: Andromeda | Windows |
| Dark Souls 3 | PS4 |
| Dark Souls 3 | XBox One |
| Dark Souls 3 | Windows |

Hier is elke rij wel verschillend, maar toch is er een probleem. Denk eraan dat we in onze definities zo precies mogelijk uitdrukken of iets CHAR, VARCHAR,... is, hoe veel karakters er in passen,... Dat is omdat een databank zuinig moet zijn voor goede performantie. Bovenstaande tabel is dat niet: er zijn heel veel stukken lange tekst die regelmatig terugkomen en die nemen elke keer heel wat bytes in.

Zuinig zijn is bovendien niet alleen belangrijk voor performantie, maar helpt ook fouten te voorkomen. Hoe vaker we een waarde volledig moeten uitschrijven, hoe groter de kans dat we eens een fout maken.

Het zou al zuiniger zijn elke game en elk platform aan te duiden met een uniek identificatienummer. Dat bespaart heel veel ruimte tegenover wanneer we telkens de volledige tekst uit te schrijven. We kunnen bijvoorbeeld het volgende afspreken voor de titels:

* Anthem: 1
* Sekiro: Shadows Die Twice: 2
* Devil May Cry 5: 3
* Mega Man 11: 4
* Mass Effect: Andromeda: 5
* Dark Souls 3: 6

Voor de platformen:

* PS4: 1
* XBox One: 2
* Windows: 3
* Nintendo Switch: 4

Dan krijgen we voor de hele tabel:

| Titel | Platform |
| :--- | :--- |
| 1 | 1 |
| 1 | 2 |
| 1 | 3 |
| 2 | 1 |
| 2 | 2 |
| 2 | 3 |
| 3 | 1 |
| 3 | 2 |
| 4 | 1 |
| 4 | 2 |
| 4 | 4 |
| 4 | 3 |
| 5 | 1 |
| 5 | 2 |
| 5 | 3 |
| 6 | 1 |
| 6 | 2 |
| 6 | 3 |

Merk op dat we onze mappings van games / platformen op getallen ook in twee tabelvoorstellingen met telkens 2 kolommen \(de game/het platform en het volgnummer\) kunnen gieten. Dat is dan ook wat we zullen doen. We zullen de volgnummers aanduiden als primary keys die automatisch ophogen. Eens we dat gedaan hebben, kunnen we bijna op een heel efficiënte wijze data gaan combineren \(met behulp van `JOIN`-operaties\). We zullen tabellen gelijkaardig aan die hierboven gebruiken om te verwijzen naar primaire sleutels in andere tabellen. Zo'n verwijzing zal een vreemde sleutel \(foreign key\) heten.

