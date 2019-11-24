# `JOIN`s via een tussenliggende tabel
We weten wel hoe we leden aan taken kunnen koppelen door middel van INNER JOIN, maar die aanpak werkt niet wanneer er meer dan twee tabellen nodig zijn om de data terug te combineren, zoals in het geval van releases van games op platformen.

Om entiteiten gekoppeld via een M-op-N-relatie aan elkaar te koppelen, moet je eerst de informatie langs de M-kant koppelen met de tabel die de relatie voorstelt en vervolgens de informatie langs de N-kant koppelen.

Bijvoorbeeld, onze tabel voor releases van games op bepaalde platformen zag er zo uit:
Games.Id	Platformen.Id	Releasedatum
1	1	22 februari 2019
1	2	22 februari 2019
1	3	22 februari 2019
2	1	22 maart 2019
2	2	22 maart 2019
2	3	22 maart 2019
3	1	8 maart 2019
3	2	8 maart 2019
4	1	2 oktober 2018
4	2	2 oktober 2018
4	3	2 oktober 2018
4	4	2 oktober 2018

We kunnen hieruit een tabel met twee kolommen afleiden die elke titel koppelt aan elk platform waarop hij is verschenen. We doen dit als volgt (met script 0095__SelectGamesPlatformen.sql):

SELECT Games.Titel, Platformen.Naam
FROM Releases
     INNER JOIN Platformen ON Releases.Platformen_Id = Platformen.Id
     INNER JOIN Games ON Releases.Games_Id = Games.Id
