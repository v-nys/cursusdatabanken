# DELETE

Net zoals het DROP statement verwijdert het DELETE statement objecten uit de database. Het DROP statement verwijdert een tabel uit de database, het DELETE statement verwijdert hele rijen uit de tabel. Als je zonder `SQL_SAFE_UPDATES` geen WHERE clausule gebruikt, worden alle rijen uit de tabel verwijderd en blijft alleen de structuur van de tabel over. Wees daar dus voorzittig mee want als de rijen gedeletet zijn kan je ze niet meer terughalen. Net als bij `UPDATE` verbiedt MySQL standaard bepaalde "onveilige" operaties. Ook hier gebruik je `SET SQL_SAFE_UPDATES = 0` en `SET SQL_SAFE_UPDATES = 1` waar nodig.

De syntax van `DELETE` lijkt erg op die van `SELECT`, maar in plaats van bepaalde rijen te tonen, zal MySQL ze gewoon wissen. Je kan ook geen specifieke kolommen wissen, dus je schrijft `DELETE FROM Boeken` en niet `DELETE * FROM Boeken` of `DELETE Voornaam FROM Boeken`.

Schrijf een script 0016\_\_DeleteBoeken.sql dat alle boeken van een auteur met voornaam "Gerard" wist.

