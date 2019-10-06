# Datatypes in MySQL

TODO: overal demo's!

## Soorten datatypes
MySQL ondersteunt drie brede soorten datatypes, met per soort verschillende concretere vormen. Deze drie soorten zijn:

1. string types (ofwel "tekst")
2. numerieke types (ofwel "getallen")
3. temporele types (datums en/of tijdstippen)

In een databank is het belangrijk dat je de juiste types kiest om optimaal gebruik te maken van ruimte en om een goede performantie te verkrijgen.

Dit is een vereenvoudigde weergave, bedoeld om je op weg te helpen met de courante scenario's. Je kan alle details terugvinden in de (uitstekende) officiële MySQL documentatie.

## String types

### sleutelbegrippen

### CHAR en VARCHAR
`CHAR` stelt een stukje tekst voor. Dat stukje tekst heeft een bepaalde tekenset en een collation. Het heeft ook een vaste lengte. Je schrijft bijvoorbeeld `CHAR(50)` voor een stukje tekst van 50 karakters. Dan hebben alle waarden van dat type precies 50 tekens nodig aan opslagruimte. Als je niet op voorhand weet hoe veel lettertekens een gegeven waarde zal bevatten, gebruik je beter `VARCHAR`. Ook hier moet je een lengte voorzien, maar dit is een maximum.

Gebruik `CHAR` voor stukken tekst van gelijke lengte (bijvoorbeeld serienummers van producten). Gebruik `VARCHAR` voor zaken als namen.

### BINARY en VARBINARY
We gaan dit soort data niet gebruiken in de cursus, maar het zijn (vrij korte) sequenties van bytes, zonder een geassocieerde karakterset of collation. Deze datatypes zijn wel nog steeds bedoeld voor string data: hun lengte is begrensd, net als die van `CHAR`. Als je binaire code wil opslaan die een bestand, is er `BLOB` (zie verder).


