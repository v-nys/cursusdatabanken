# JOINs via tussenliggende tabel

We weten wel hoe we leden aan taken kunnen koppelen door middel van INNER JOIN, maar die aanpak werkt niet wanneer er meer dan twee tabellen nodig zijn om de data terug te combineren, zoals in het geval van releases van games op platformen.

Om entiteiten gekoppeld via een M-op-N-relatie aan elkaar te koppelen, moet je eerst de informatie langs de M-kant koppelen met de tabel die de relatie voorstelt en vervolgens de informatie langs de N-kant koppelen.

Bijvoorbeeld, als je een tabel `Publicaties` hebt die auteurs linkt aan boeken:

| Auteurs.Id | Boeken.Id |
| :--- | :--- |
| 1 | 1 |
| 1 | 2 |
| 1 | 3 |
| 2 | 1 |
| 2 | 2 |
| 2 | 3 |
| 3 | 1 |
| 3 | 2 |
| 4 | 1 |
| 4 | 2 |
| 4 | 3 |
| 4 | 4 |

We kunnen hieruit een tabel met twee kolommen afleiden die elke auteur koppelt aan elk van zijn boeken. Het idee hierachter:

* je combineert de tabel met auteurs, de tabel met boeken en de tabel met de vreemde sleutels
* je controleert dat de vreemde sleutel uit de combinatietabel verwijst naar de juiste auteur
* je controleert dat de vreemde sleutel uit de combinatietabel verwijst naar het juiste boek

Dit zou er zo uitzien:

```sql
SELECT Auteurs.Naam, Boeken.Titel
FROM Publicaties
     INNER JOIN Auteurs ON Publicaties.Auteurs_Id = Auteurs.Id
     INNER JOIN Boeken ON Publicaties.Boeken_Id = Boeken.Id
```

