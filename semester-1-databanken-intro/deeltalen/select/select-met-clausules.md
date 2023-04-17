# SELECT met clausules

{% hint style="success" %}
[Kennisclip](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=3e0ba6f3-fc38-4dec-950e-adc5007c0443)
{% endhint %}

Het is niet voldoende om rijen te kunnen opvragen. Je moet ook in staat zijn om specifieke informatie op te vragen, statistische gegevens te genereren, enz. Dit kan door uitdrukkingen en extra clausules te gebruiken in `SELECT` statements.

### Vorm

De algemene vorm van een `SELECT` statement is:

```
SELECT expressie(s) waarin sleutelwoorden, namen en constanten zitten FROM Tabel
```

Hierbij heb je al redelijk wat flexibiliteit: je kan gewoon kolomnamen gebruiken als expressies; je kan functies toepassen op kolomnamen; je kan vaste tekst of getallen mee opnemen in de resultaten. Maar er zijn nog meer mogelijkheden. In het algemeen ziet het `SELECT` statement er zo uit:

```
SELECT expression(s) waarin sleutelwoorden, namen en constanten zitten
[FROM Tabel]
[WHERE clause]
[GROUP BY clause]
[HAVING clause]
[ORDER BY clause]
```

Deze volgorde is vast: `FROM` komt altijd voor `WHERE`, enzovoort.

Hiermee kan je:

* enkel bepaalde rijen weergeven
* rijen met eenzelfde waarde voor een bepaalde eigenschap groeperen
* statistische eigenschappen van de getoonde data afdwingen
* de uitvoer sorteren

In de loop van deze cursus komen al deze clausules aan bod.

### Verwerking

Hoewel bovenstaande volgorde bepaalt hoe je een query moet uitschrijven, is dat niet hoe een query wordt uitgevoerd. De verschillende onderdelen worden verwerkt als volgt:

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. ORDER BY
6. SELECT

Waarschijnlijk ken je al deze clausules nog niet, maar dat is niet erg. Je kan terug kijken naar deze uitleg telkens je een nieuwe clausule leert. Het idee is als volgt:

* eerst geef je aan waar je data vandaag komt
* dan bepaal je, per record, of dat record mee verwerkt zal worden of niet
* de behouden records kan je groeperen om informatie over een bepaald groepje te tonen
* per groepje kan je opnieuw bepalen of dat groepje verwerkt zal worden
* je legt een volgorde vast
* je toont het eindresultaat
