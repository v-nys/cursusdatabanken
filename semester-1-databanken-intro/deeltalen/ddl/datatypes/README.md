# Datatypes

## Soorten datatypes

MySQL ondersteunt drie brede soorten datatypes, met per soort verschillende concretere vormen. Deze drie soorten zijn:

1. string types \(ofwel "tekst"\)
2. numerieke types \(ofwel "getallen"\)
3. temporele types \(datums en/of tijdstippen\)

In een databank is het belangrijk dat je de juiste types kiest om optimaal gebruik te maken van ruimte en om een goede performantie te verkrijgen.

Dit is een vereenvoudigde weergave, bedoeld om je op weg te helpen met de courante scenario's. Je kan alle details terugvinden in de \(uitstekende\) officiële MySQL documentatie.

## String types

### sleutelbegrippen

{% hint style="success" %}
[Kennisclip over CHAR, VARCHAR en strings schrijven](https://youtu.be/iMVUZCQkXvc)
{% endhint %}

### `CHAR` en `VARCHAR`

`CHAR` stelt een stukje tekst voor. Het heeft ook een vaste lengte. Je schrijft bijvoorbeeld `CHAR(50)` voor een stukje tekst van 50 karakters. Dan hebben alle waarden van dat type precies 50 tekens nodig aan opslagruimte. Als je niet op voorhand weet hoe veel lettertekens een gegeven waarde zal bevatten, gebruik je beter `VARCHAR`. Ook hier moet je een lengte voorzien, maar dit is een maximum. Zo is een kolom met type `VARCHAR(50)` beperkt tot _maximum_ 50 karakters.

Gebruik `CHAR` voor stukken tekst van gelijke lengte \(bijvoorbeeld serienummers van producten\). Gebruik `VARCHAR` voor zaken als namen.

### strings schrijven

Als je data van een van deze types hebt, zet je deze tussen enkele aanhalingstekens. Bijvoorbeeld `'Do,Re,Mi,Fa,Sol,La,Si'`. Als je data zelf enkele aanhalingstekens bevat, moet je ze ontdubbelen. Bijvoorbeeld `'do''s en don''ts'`.

{% hint style="warning" %}
Let op! Alles wat tussen aanhalingstekens staat is tekst. Zelfs cijfers. Met andere woorden: '42' is tekst en 42 is een getal. Met tekst kan je niet rekenen, met een getal wel. MySQL probeert wel te raden wat je bedoelt als je bijvoorbeeld '42' + '1' schrijft, maar niet elke taal doet dit. Daarom spreken we af dat je MySQL niet laat raden, maar altijd het juiste datatype gebruikt.
{% endhint %}

#### karakterset

Computers werken met bytes, niet met tekst. Om bytes te interpreteren, wordt een karakterset gebruikt. Een karakterset is een systeem om letters voor te stellen. Ze koppelt bepaalde lettertekens aan een achterliggende voorstelling. Er zijn enorm veel tekensets en ze zijn niet allemaal evenwaardig. Sommige tekensets kunnen maar een klein aantal karakters voorstellen, sommige kunnen er bijna eindeloos veel voorstellen. Standaard gebruikt MySQL de karakterset `utf8mb4`, die voor zowat alle talen volstaat.

#### collation

Een collation is een set regels om stukken tekst met dezelfde karakterset te vergelijken. Een collation kan bijvoorbeeld bepalen of hoofdletters en kleine letters beschouwd worden als onderling verschillend. Ze kan ook bepalen of accenten op letters genegeerd worden.

### een karakterset koppelen

Als je voor een bepaalde kolom een andere tekenset dan de default voor jouw databank wil gebruiken, kan je dat aangeven door je datatype te laten volgen door `CHAR SET`, gevolgd door de naam van de tekenset in kwestie, bijvoorbeeld `utf8mb4` om op een efficiënte manier een heleboel niet-westerse tekens te kunnen voorstellen.

Soms kom je online misschien ook `NVARCHAR` tegen. Dit is een wat achterhaalde manier om niet-westerse tekens voor te stellen. Onthoud gewoon dat je voor niet-westerse tekens best de tekenset `utf8mb4` specifieert voor je kolom.

## numerieke types

### Boolean

Dit is het simpelste type. Het kent twee waarden: `TRUE` en `FALSE`, vaak voorgesteld als `1` en `0`. Je kan beide schrijfwijzen hanteren.

### `INT` en varianten

{% hint style="success" %}
[Kennisclip voor deze inhoud](https://youtu.be/qsqh8IJRJ1c)
{% endhint %}

`INT` dient \(net als enkele varianten van diverse groottes, hieronder opgelijst\) voor de opslag van gehele getallen. Standaard kan een `INT` positieve en negatieve gehele getallen voorstellen. We zeggen dat hij dan `SIGNED` is, dus dat hij vergezeld is van een teken. Als je alleen positieve getallen wil, laat je je datatype volgen door `UNSIGNED`, bijvoorbeeld `Leeftijd TINYINT UNSIGNED`.

| Type | Gebruikt aantal bytes | Minimum signed | Minimum unsigned | Maximum signed | Maximum unsigned |
| :--- | :--- | :--- | :--- | :--- | :--- |
| TINYINT | 1 | -128 | 0 | 127 | 255 |
| SMALLINT | 2 | -32768 | 0 | 32767 | 65535 |
| MEDIUMINT | 3 | -8388608 | 0 | 8388607 | 16777215 |
| INT | 4 | -2147483648 | 0 | 2147483647 | 4294967295 |
| BIGINT | 8 | -2^63 | 0 | 2^63-1 | 2^64-1 |

### `FLOAT` en `DOUBLE`

Deze twee types dienen om getallen bij benadering op te slaan. Ze werken op dezelfde manier, maar `DOUBLE` heeft een groter bereik. Je geeft een kolom niet gewoon het type `FLOAT` of `DOUBLE`, maar `FLOAT(M,D)` of `DOUBLE(M,D)`. Dit betekent dat je tot `M` cijfers wil bijhouden, waarvan `D` na de komma kunnen komen. Als je een waarde opslaat die meer precisie vereist, wordt ze afgerond! Bovendien is het soms lastig om benaderde getallen te vergelijken.

{% hint style="warning" %}
In de toekomst zal de werking van `FLOAT` en `DOUBLE` veranderen zodat je een andere syntax moet gebruiken. Wij houden het op deze, omdat dit nog even zal duren en omdat deze syntax verstaanbaarder is dan het nieuwe alternatief.
{% endhint %}

### `DECIMAL`

Dit type dienst voor het bijhouden van exacte getallen. Je specifieert net als bij `FLOAT` en `DOUBLE` het aantal cijfers en het \(maximaal even grote\) aantal cijfers na de komma.

Een gelijkaardig onderscheid tussen numerieke types ken je misschien uit de cursus C♯.

### getallen schrijven

Deze data hoeft niet tussen enkele quotes. Je gebruikt een punt in plaats van een komma.

## temporele types

Temporele types worden gebruikt om tijdstippen voor te stellen. Hierbij wordt volgende notatie gebruikt om een formaat voor te stellen:

* Y: cijfer van een jaar
* M: cijfer van een maand
* D: cijfer van een dag
* H: cijfer van een uur
* m: cijfer van een minuut
* S: cijfer van een seconde

### `DATE`

Dit type dient voor het bijhouden van datums in de vorm `'YYYY-MM-DD'`. Je kan alleen jaartallen van 1000 tot 9999 bijhouden.

### `TIME`

Dit type dient voor het bijhouden van ofwel een tijdstip ofwel een zekere periode, zoals je die zou kunnen meten met een chronometer. Het formaat is `HHH:MM:SS`. Meerbepaald kan je tot 838 uur gaan. Je kan ook negatieve tijdstippen voorstellen.

### `DATETIME`

Een `DATETIME` is een waarde die een specifiek ogenblik in de tijd voorstelt. Met andere woorden ongeveer een combinatie van `DATE` en `TIME` in één datatype. Het formaat is dan ook `YYYY-MM-DD HH:MM:SS` en het bereik ligt tussen het jaar 1000 en 9999. `DATETIME` is flexibeler dan het gelijkaardige type `TIMESTAMP`, omdat een timestamp steeds tussen 1970 en begin 2038 moet zijn.

### `YEAR`

Voor wanneer een volledige datum meer is dan je nodig hebt. Je kan wel minder jaartallen bijhouden: van 1901 tot 2155.

### datums schrijven

Je schrijft datums alsof het strings waren in een afgesproken formaat, dus ook tussen enkele aanhalingstekens.

