# Oefeningen
**Voor je deze oefeningen maakt, gebruik je onderstaand script om zeker te zijn dat je databank in de gewenste toestand is:**

```sql
DROP DATABASE IF EXISTS ModernWays;
CREATE DATABASE ModernWays;
```

Sla dit op als 0500\_\_CalibrateDB.sql in je map met scripts.

## nummers
Schrijf een script dat een tabel `Nummers` voor muzieknummers toevoegt aan je databank met volgende karakteristieken:

| Kolomnaam | Type | Maximale lengte | Variabele lengte | Internationale tekens | Verplicht |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Titel | CHAR | 100 | JA | JA | JA |
| Artiest | CHAR | 100 | JA | JA | JA |
| Genre | CHAR | 50 | JA | NEE | NEE |
| Jaar | CHAR | 4 | NEE | NEE | NEE |

Sla op als 0501\_\_Oefening.sql.

## huisdieren
Doe hetzelfde voor een tabel `Huisdieren` met huisdieren, met volgende kenmerken:
| Kolomnaam | Type | Maximale lengte | Variabele lengte | Internationale tekens | Verplicht |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Naam | CHAR | 100 | JA | JA | JA |
| Leeftijd | een geheel positief getal | tot 300 jaar | NVT | NVT | JA |
| Soort | CHAR | 50 | JA | NEE | JA |

Sla op als 0502\_\_Oefening.sql.

## hernoemen
Hernoem je tabel `Nummers` naar `Liedjes`. Sla op als 0503\_\_Oefening.sql.

## uitbreiden
Voeg een extra kolom, `Album`, toe aan `Liedjes`. Deze is niet verplicht, telt tot 100 internationale tekens. Sla op als 0504\_\_Oefening.sql.

## verwijderen
Verwijder de kolom `Genre` voor `Liedjes`. Sla op als 0505\_\_Oefening.sql.

## verder uitbreiden
Voeg een extra kolom, `Baasje`, toe aan `Huisdieren`. Deze is verplicht, telt tot 100 internationale tekens. Sla op als 0506\_\_Oefening.sql.

## complexere data
Maak een tabel `Metingen` aan met volgende kolommen:
1. `Tijdstip` (een verplicht tijdstip dat een datum en het uur van de dag voorstelt)
2. `Grootte` (een verplicht positief geheel getal dat tot 20000 kan oplopen, maar niet hoger)
3. `Marge` (een benaderd kommagetal van 3 cijfers, waarvan 2 na de komma)

Sla op als 0507\_\_Oefening.sql.

## data invoegen
Plaats volgende data in je tabel met muzieknummers:
1. het nummer "John the Revelator" van de groep "Larkin Poe". Het genre is "Blues" en het verschijningsjaar is 2017.
2. het nummer "Missionary Man" van de groep "Ghost". Het genre is "Metal" en het verschijningsjaar is 2016.

## scripts delen
Wanneer je klaar bent, van in je map met SQL scripts:
```text
git add *.sql
git commit -m "Eerste scripts labo"
git push
```
Vul op Digitap ook de link in naar je Bitbucket repository.

# Opdracht: In orde brengen scripts les
Zorg er tegen volgend labo voor dat (naast de scripts uit dit labo) alle scripts die al aan bod gekomen zijn over de DDL hebt en dat ze juist genummerd zijn.
