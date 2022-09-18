# Voorbeeld

## **Voorbeeld 1**

Een klassiek voorbeeld daarvan is een lijst met de namen en adressen. Die lijst kan er als volgt uitzien:

| Naam     | Voornaam | Adres            | Postcode | Gemeente   | Telefoon     | Verdieping |
| -------- | -------- | ---------------- | -------- | ---------- | ------------ | ---------- |
| PIETERS  | PIeter   | Tralalastraat 25 | 2660     | Hoboken    | 03 333 33 33 | 1          |
| JANSSENS | Jan      | Jasstraat 2      | 2000     | Antwerpen  | 03 222 22 22 | 1          |
| DEBONDT  | Ron      | Jopstraat 5      | 2100     | Deurne     | 03 111 11 11 | 3          |
| JORIS    | Joost    | Boedreef 25      | 2600     | Berchem    | 03 444 44 44 | 2          |
| VOET     | Bart     | Plopstraat 9     | 2630     | Aartselaar | 03 888 88 88 | 3          |

In bovenstaand voorbeeld is de eerste rij de aanduiding van de kolommen (veldnamen).

Bovenstaand voorbeeld bevat dus vijf rijen (records) die telkens bepaalde waarden bevatten, hier gaat het over de "Naam", "Voornaam", "Adres", "Postcode", "Gemeente", "Telefoon" en "Verdieping".

## **Voorbeeld 2**

Een bedrijf in de productiesector zal onder andere volgende gegevens willen bijhouden, nl.:

* Personeelsgegevens&#x20;
* De zgn. productiegegevens. Hierbij kunnen we denken aan bv. de productsamenstelling
* De gegevens betreffende de noodzakelijke bestellingen
* De gegevens van de bestaande klanten&#x20;
* De gegevens van de leveranciers
* De gegevens m.b.t. de goederen die nog in stock zijn en/of de goederen die besteld moeten worden

In dit geval is het best om voor elk bullet point een aparte tabel te voorzien. Groepjes gegevens die sterk aan elkaar gelinkt zijn (bijvoorbeeld "voornaam werknemer" en "familienaam werknemer" komen in dezelfde tabel). Groepjes gegevens die losser gelinkt zijn komen in verschillende tabellen. Er zijn nog andere redenen om verschillende tabellen te gebruiken. Die komen later.

## **Voorbeeld 3**

Een bank houdt per rekening van een bepaalde klant geen box bij met daarin het geld van een klant. Het bedrag op de rekening van die klant is een cijfer dat wordt bijgehouden in een database. Er zou bijvoorbeeld een tabel `Rekeningen` kunnen zijn, die je je zo kan voorstellen:

| Klantnummer | Bedrag    | Type          |
| ----------- | --------- | ------------- |
| 123456789   | 15.000    | spaarrekening |
| 456789123   | 2.124.000 | belegging     |
| 789123456   | 11.000    | spaarrekening |

Daarnaast heeft de bank nog allerlei informatie, bijvoorbeeld over hypotheken,... Die zullen vermoedelijk in andere tabellen staan. De volledige verzameling tabellen vormt de database van de bank.
