# SELECT met clausules

Het is niet voldoende om rijen te kunnen opvragen. Je moet ook in staat zijn om specifieke informatie op te vragen, statistische gegevens te genereren, enz. Dit kan door uitdrukkingen en extra clausules te gebruiken in `SELECT` statements.

De algemene vorm van een `SELECT` statement is:

```text
SELECT expressie(s) waarin sleutelwoorden, namen en constanten zitten FROM Tabel
```

Hierbij heb je al redelijk wat flexibiliteit: je kan gewoon kolomnamen gebruiken als expressies; je kan functies toepassen op kolomnamen; je kan vaste tekst of getallen mee opnemen in de resultaten. Maar er zijn nog meer mogelijkheden. In het algemeen ziet het `SELECT` statement er zo uit:

```text
SELECT expression(s) waarin sleutelwoorden, namen en constanten zitten FROM Tabel
[WHERE clause]
[GROUP BY clause]
[HAVING clause]
[ORDER BY clause]
```

Hiermee kan je:

* enkel bepaalde rijen weergeven
* rijen met eenzelfde waarde voor een bepaalde eigenschap groeperen
* statistische eigenschappen van de getoonde data afdwingen
* de uitvoer sorteren

In de loop van deze cursus komen al deze clausules aan bod.
