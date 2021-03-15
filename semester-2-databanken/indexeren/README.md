# Indexeren

## Wat is een index?

Je kent het principe van een index waarschijnlijk uit alledaagse situaties.

* In studieboeken staat vaak achteraan een alfabetisch geordende woordenlijst met paginanummers. Hiermee raak je veel sneller aan de gewenste informatie dan wanneer je een boek woord per woord leest vanaf het begin.
* In het Engels wordt het woord "index" soms gebruikt om een telefoongids aan te duiden. Hiermee kan je heel snel iemand terugvinden als je de juiste plaatsnaam kent en een stukje informatie over de gezochte persoon kent \(vaak een achternaam of beroep\).

Indexen kunnen ook gebruikt worden om heel snel een databasetabel te doorlopen. Net zoals je zelf tijd verliest door altijd vanaf de eerste pagina te beginnen lezen, verliest een database engine tijd door altijd elk databaserecord te controleren.

We maken database indexen aan om deze inefficiëntie te vermijden. Net als woordenlijsten of telefoonboeken zijn ze gespecialiseerd in slechts een stukje van de aanwezige informatie, maar maken ze het wel mogelijk sneller informatie terug te vinden. Door op een verstandige manier om te springen met indexen kunnen we onze database veel efficiënter gebruiken zonder te investeren in sterkere hardware.

In eerste instantie is een tabel geïndexeerd op basis van zijn primaire sleutel, maar we kunnen ook indexeren op andere kolommen of zelfs op een combinatie van kolommen.

Indexeren verhoogt de snelheid waarmee gegevens worden geselecteerd, maar vertraagt de werking bij het opslaan van gegevens. Wanneer gegevens worden toegevoegd, wordt niet alleen de tabel bijgewerkt, maar moet ook de index worden bijgewerkt. Vergelijk met de registratie van een nieuwe persoon in een gemeente. Als deze persoon zich aanmeldt op het stadhuis en er wordt een telefoonboek bijgehouden, moeten de gegevens van de personendienst **en** de gegevens van het telefoonboek worden aangepast. Dat is meer werk dan alleen het aanpassen van de persoonsgegevens.

Een index kun je op elk willekeurig moment creëren/wijzigen/verwijderen, zonder dat dit invloed heeft op de opgeslagen data in de bijhorende tabellen. Anders gesteld: het is niet omdat het telefoonboek niet meer wordt uitgegeven, dat je plots geen telefoonnummer meer hebt.

