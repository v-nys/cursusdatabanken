# Trage queries opvolgen

## Stap 1: bijhouden
Met de juiste instellingen kan je MySQL queries laten onthouden die langer duren dan een zekere drempelwaarde. Als het gaat om queries die regelmatig terugkomen, is het de moeite waard indexen aan te maken die deze queries kunnen versnellen.

Je kan de trage queries opslaan door in het bestand `my.cnf` in je MySQL-installatie de variabele `slow_query_log` op `On` te zetten, `long_query_time` op het aantal seconden dat "te veel" is in te stellen (bv. 0.2 voor 200 milliseconden) en `slow_query_log_file` in te vullen met de locatie van het gewenste logbestand. Alle queries die je vanaf dan uitvoert zullen in het logbestand worden bijgehouden.

## Stap 2: uitpluizen
Je voert de queries in kwestie opnieuw uit, maar je laat ze voorafgaan door het sleutelwoordje `EXPLAIN`. Je krijgt dan één rij per doorzochte tabel in een uitgebreide versie van volgend formaat:

| table | key | rows |
|---|---|---|
| naam van een doorzochte tabel | eventueel gebruikte index | aantal rijen doorzocht |
| naam van een andere doorzochte tabel | eventueel gebruikte index | aantal rijen doorzocht |

Als er voor een index `NULL` staat, betekent dat dat alle rijen van de eerste tot de laatste zijn beschouwd, wat typisch erg inefficiënt is (zeker als het aantal rijen groot is). Door een index toe te voegen aan een kolom met een gezochte waarde (bv. een kolom vermeld in een `WHERE`), kan je de `NULL` wegwerken en het aantal doorzochte rijen drastisch verlagen.
