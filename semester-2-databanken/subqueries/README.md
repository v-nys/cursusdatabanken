# Subqueries

## Situatie

Stel: Je wil alle personen selecteren die ouder zijn dan de gemiddelde persoon in je tabel `Personen` (met een kolom `Leeftijd`). Hoe zou je zoiets aanpakken? Je kan eerst `AVG(Leeftijd)` opvragen, noteren en dan een `SELECT` met een `WHERE` uitvoeren. Het nadeel hiervan is dat hier twee queries moeten plaatsvinden en dat jij als programmeur het resultaat van die eerste query moet verwerken in de tweede. In dit onderdeel bekijken we een oplossing voor dit probleem en gelijkaardige problemen: **geneste** queries (ook wel **subqueries**) genoemd.

## Oplossing

Een subquery is een query die wordt uitgevoerd als onderdeel van een grotere query. Deze kleinere query zal geen zichtbare uitvoer produceren, maar zal wel informatie leveren die je anders met de hand had moeten intypen in de grotere query. Dat laatste is vaak niet eens haalbaar!
