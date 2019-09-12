# Architectuur van een databank

Hieronder begrijpen we de wijze en de verschillende stappen die normaal gesproken doorlopen worden voordat een database kan opgesteld worden.

![](../../.gitbook/assets/databanken-intro-afbeelding-1.JPG)

## **Extern schema** 

Het extern schema staat het dichtst bij de eindgebruiker \(of werknemer\).   
Het gaat er hier over hoe een individuele eindgebruiker bepaalde gegevens benadert. 

Voor elk onderscheiden onderdeel wordt een extern schema opgesteld met die gegevens die hiervoor noodzakelijk zijn. 

Uiteraard zijn er een aantal aandachtspunten die men niet uit het oog mag verliezen, nl. 

* Welke definities worden aan bepaalde gegevens toegekend?
* Welke gebruiker heeft toegang tot welke gegevens?

Het is duidelijk dat hier de constraints \(beperkingen\) worden bepaald.

## **Conceptueel schema**

Het conceptueel schema houdt in dat de afzonderlijke \(genormaliseerde\) externe schema”s worden samengebracht. Dit gaat dan de zgn. basisstructuur vormen voor het opzetten van de database. 

Ook wordt er getracht om bij het opstellen van het conceptuele schema de volgende regels in acht te nemen, nl. 

* uniciteitsregel 
* integriteitsregel 
* veiligheid 

Wel dient nog gespecifieerd dat in het stadium nog niet wordt bepaald welk type van database zal opgesteld worden \(zie verder\). 

## **Intern schema**

Het intern schema houdt in dat het conceptuele schema wordt geïmplementeerd. 

Er dienen uiteraard weerom een aantal punten nauwgezet in het oog worden gehouden, nl.

* wat zijn de gewenste datastructuren en welke zijn de betreffende beperkingen m.b.t. het conceptuele schema?
* wat zijn de mogelijkheden van het gekozen model?

Het interne schema bevat twee onderdelen, nl. 

* de logische implementatie
* de fysieke implementatie

