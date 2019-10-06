# Datatypes in MySQL

## Soorten datatypes
MySQL ondersteunt drie brede soorten datatypes, met per soort verschillende concretere vormen. Deze drie soorten zijn:

1. string types (ofwel "tekst")
2. numerieke types (ofwel "getallen")
3. temporele types (datums en/of tijdstippen)

In een databank is het belangrijk dat je de juiste types kiest om optimaal gebruik te maken van ruimte en om een goede performantie te verkrijgen.

Dit is een vereenvoudigde weergave, bedoeld om je op weg te helpen met de courante scenario's. Je kan alle details terugvinden in de (uitstekende) officiële MySQL documentatie.

## String types

### sleutelbegrippen

#### karakterset
Een karakterset is een systeem om letters voor te stellen. Ze koppelt bepaalde lettertekens aan een achterliggende voorstelling. Er zijn enorm veel tekensets en ze zijn niet allemaal evenwaardig. Sommig tekensets kunnen maar een klein aantal karakters voorstellen, sommige kunnen er bijna eindeloos veel voorstellen. Standaard gebruikt MySQL de karakterset `latin1`, die beperkt is tot westerse tekens.

#### collation
Een collation is een set regels om stukken tekst met dezelfde karakterset te vergelijken. Een collation kan bijvoorbeeld bepalen of hoofdletters en kleine letters beschouwd worden als onderling verschillend. Ze kan ook bepalen of accenten op letters genegeerd worden.

### `CHAR` en `VARCHAR`
`CHAR` stelt een stukje tekst voor. Dat stukje tekst heeft een bepaalde tekenset en een collation. Het heeft ook een vaste lengte. Je schrijft bijvoorbeeld `CHAR(50)` voor een stukje tekst van 50 karakters. Dan hebben alle waarden van dat type precies 50 tekens nodig aan opslagruimte. Als je niet op voorhand weet hoe veel lettertekens een gegeven waarde zal bevatten, gebruik je beter `VARCHAR`. Ook hier moet je een lengte voorzien, maar dit is een maximum. Zo is een kolom met type `VARCHAR(50)` beperkt tot *maximum* 50 karakters.

Gebruik `CHAR` voor stukken tekst van gelijke lengte (bijvoorbeeld serienummers van producten). Gebruik `VARCHAR` voor zaken als namen.

### een karakterset koppelen
Als je voor een bepaalde kolom een andere tekenset dan de default voor jouw databank wil gebruiken, kan je dat aangeven door je datatype te laten volgen door `CHAR SET`, gevolgd door de naam van de tekenset in kwestie, bijvoorbeeld `utf8mb4` om op een efficiënte manier een heleboel niet-westerse tekens te kunnen voorstellen.

Soms kom je online misschien ook `NVARCHAR` tegen. Dit is een wat achterhaalde manier om niet-westerse tekens voor te stellen. Onthoud gewoon dat je voor niet-westerse tekens best de tekenset `utf8mb4` specifieert voor je kolom.

### strings schrijven
Als je data van een van deze types hebt, zet je deze tussen enkele aanhalingstekens. Bijvoorbeeld `'Do,Re,Mi,Fa,Sol,La,Si'`. Als je data zelf enkele aanhalingstekens bevat, moet je ze ontdubbelen. Bijvoorbeeld `'do''s en don''ts'`.

## numerieke types

### `INT` en varianten
`INT` dient (net als enkele varianten van diverse groottes, hieronder opgelijst) voor de opslag van gehele getallen. Standaard kan een `INT` positieve en negatieve gehele getallen voorstellen. We zeggen dat hij dan `SIGNED` is, dus dat hij vergezeld is van een teken. Als je alleen positieve getallen wil, laat je je datatype voorafgaan door `UNSIGNED`, bijvoorbeeld `Leeftijd UNSIGNED TINYINT`.

| Type      | Gebruikt aantal bytes | Minimum signed | Minimum unsigned | Maximum signed | Maximum unsigned |
|-----------|-----------------------|----------------|------------------|----------------|------------------|
| TINYINT   | 1                     | -128           | 0                | 127            | 255              |
| SMALLINT  | 2                     | -32768         | 0                | 32767          | 65535            |
| MEDIUMINT | 3                     | -8388608       | 0                | 8388607        | 16777215         |
| INT       | 4                     | -2147483648    | 0                | 2147483647     | 4294967295       |
| BIGINT    | 8                     | -2^63          | 0                | 2^63-1         | 2^64-1           |

### `FLOAT` en `DOUBLE`
Deze twee types dienen om getallen bij benadering op te slaan. Ze werken op dezelfde manier, maar `DOUBLE` heeft een groter bereik. Je geeft een kolom niet gewoon het type `FLOAT` of `DOUBLE`, maar `FLOAT(M,D)` of `DOUBLE(M,D)`. Dit betekent dat je tot `M` cijfers wil bijhouden, waarvan `D` na de komma kunnen komen. Als je een waarde opslaat die meer precisie vereist, wordt ze afgerond! Bovendien is het soms lastig om benaderde getallen te vergelijken.

### `DECIMAL`
Dit type dienst voor het bijhouden van exacte getallen. Je specifieert net als bij `FLOAT` en `DOUBLE` het aantal cijfers en het (maximaal even grote) aantal cijfers na de komma.

Een gelijkaardig onderscheid tussen numerieke types ken je misschien uit de cursus C♯. 

### getallen schrijven
Deze data hoeft niet tussen enkele quotes. Je gebruikt een punt in plaats van een komma.

## temporele types

### `DATE`
Dit type dient voor het bijhouden van datums in de vorm `YYYY-MM-DD`. Je kan alleen jaartallen van 1000 tot 9999 bijhouden.

### `TIME`
Dit type dient voor het bijhouden van ofwel een tijdstip ofwel een zekere periode, zoals je die zou kunnen meten met een chronometer. Het formaat is `HHH:MM:SS`. Meerbepaald kan je tot 838 uur gaan. Je kan ook negatieve tijdstippen voorstellen.

### `DATETIME`
Een `DATETIME` is een waarde die een specifiek ogenblik in de tijd voorstelt. Met andere woorden ongeveer een combinatie van `DATE` en `TIME` in één datatype. Het formaat is dan ook `YYYY-MM-DD HH:MM:SS` en het bereik ligt tussen het jaar 1000 en 9999. `DATETIME` is flexibeler dan het gelijkaardige type `TIMESTAMP`, omdat een timestamp steeds tussen 1970 en begin 2038 moet zijn.

### `YEAR`
Voor wanneer een volledige datum meer is dan je nodig hebt. Je kan wel minder jaartallen bijhouden: van 1901 tot 2155.

### datums schrijven
Je schrijft datums alsof het strings waren in een afgesproken formaat, dus ook tussen enkele aanhalingstekens.
