# Labo-oefeningen

## Oefeningen

**Voor je deze oefeningen maakt, gebruik je onderstaand script om zeker te zijn dat je databank in de gewenste toestand is:**

```sql

```

Sla dit op als 0509\_\_CalibrateDB.sql in je map met scripts.

### nummers

Schrijf een script dat volgende nummers toevoegt aan je tabel, `Liedjes`. Ze worden gegeven in het formaat "titel / artiest / album / releasejaar":

* Stairway to Heaven / Led Zeppelin / Led Zeppelin IV / 1971
* Good Enough / Molly Tuttle / Rise / 2017
* Outrage for the Execution of Willie McGee / Goodnight, Texas / Conductor / 2018
* They Lie / Layla Zoe / The Lily / 2013
* It Ain't You / Danielle Nicole / Wolf Den / 2015
* Unchained / Van Halen / Fair Warning / 1981

Sla op als 0510\_\_Oefening.sql.

### huisdieren

Doe hetzelfde voor een tabel `Huisdieren`, met volgende gegevens. Ze worden gegeven in het formaat "naam / leeftijd / soort":

* Misty / 6 / hond
* Ming / 8 / hond
* Bientje / 6 / kat
* Flip / 75 / papegaai
* Berto / 1 / papegaai
* Ming / 7 / kat
* Suerta / 2 / hond
* Фёдор / 1 / hond

Sla op als 0511\_\_Oefening.sql.

### nummers tonen
Schrijf een script, 0512\_\_Oefening.sql, dat alle info over liedjes toont.

### huisdieren tonen
Schrijf een script, 0513\_\_Oefening.sql, dat de naam en soort van elk dier toont, maar niet de leeftijd.

### sorteren
Schrijf een script, 0514\_\_Oefening.sql, dat (alleen!) de titels van liedjes toont, gaande van het oudste nummer tot het recentste nummer.

### gedetailleerd sorteren
Schrijf een script, 0515\_\_Oefening.sql, dat alle info over huisdieren toont, maar de huisdieren alfabetisch ordent volgens naam en, indien de naam dezelfde is, alfabetisch sorteert volgens soort.

### omschrijvingen tonen
Schrijf een script, 0515\_\_Oefening.sql, dat per dier een tabel met één kolom, een omschrijving, toont. Deze heeft volgende vorm, inclusief de juiste hoofding:

| Omschrijving |
| :----------- |
| Misty de hond |
| Ming de hond |
| Bientje de kat |
| Flip de papegaai |
| Berto de papegaai |
| Ming de kat |
| Suerta de hond |
| Фёдор de hond |

### gedetailleerd filteren
Schrijf een script, 0516\_\_Oefening.sql, dat alle nummers toont die uitgekomen zijn in een jaar dat eindigt op `1`. Tip: gebruik `WHERE` in combinatie met een functie.

### informatie toevoegen
Schrijf een script, 0517\_\_Oefening.sql, dat volgende zaken doet:

* een niet-verplichte kolom `Geluid` toevoegen aan de tabel met huisdieren, die tekst (tot 20 karakters uit het Engels) kan bevatten
  * tip: dit is een DDL-statement, dus kijk terug naar de DDL indien nodig
* het geluid van alle honden aanpast naar `"WAF!"`
* het geluid van alle katten aanpast naar `"miauwww..."`

### nog informatie toevoegen
Schrijf een script, 0518\_\_Oefening.sql, dat volgende zaken doet:

* de niet-verplichte kolom `Genre` terug toevoegt aan de tabel met nummers (tot 20 karakters uit het Engels)
* met **maximum één** `UPDATE`-operatie alle nummers van Led Zeppelin en Van Halen aanduidt als `Hard Rock`

### wissen
Schrijf een script, 0519\_\_Oefening.sql, dat alle nummers wist (maar de tabelstructuur bewaart).

### meer wissen
Schrijf een script, 0520\_\_Oefening.sql, dat alle papegaaien wist.

### afronden

Wanneer je klaar bent, voer dan de gewoonlijke commando's uit om je scripts te delen:

```text
git add --all
git commit -m "Scripts DML"
git push
```

Ze hierna je database terug zoals ze was na de theorieles met het script van het einde van vorige labosessie.

## Opdracht: In orde brengen scripts les
Zorg er tegen volgend labo voor dat je scripts in orde zijn.

