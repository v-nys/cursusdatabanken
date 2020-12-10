# JOINs via tussenliggende tabel

{% hint style="success" %}
[Kennisclip](https://youtu.be/3bTAcpAzVKk)
{% endhint %}

We weten wel hoe we leden aan taken kunnen koppelen door middel van INNER JOIN, maar die aanpak werkt niet wanneer er meer dan twee tabellen nodig zijn om de data terug te combineren, zoals in het geval van releases van games op platformen.

Om entiteiten gekoppeld via een M-op-N-relatie aan elkaar te koppelen, moet je eerst de informatie langs de M-kant koppelen met de tabel die de relatie voorstelt en vervolgens de informatie langs de N-kant koppelen.

Onze tabel met info over releases van games was:

| Games\_Id | Platformen\_Id |
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

We kunnen deze tonen met informatie over de game als volgt:

```sql
SELECT Games_Id, Platformen_Id, Titel
FROM Releases
INNER JOIN Games
ON Games_Id = Games.Id;
```

Dit voegt langs de rechterkant gewoon de details over de uitgebrachte game. Het is dus een meer uitgebreide versie van de tabel Releases. Daarom kunnen we dezelfde techniek herhalen en enkel de interessante info tonen:

```sql
SELECT Titel, Naam
FROM Releases
INNER JOIN Games
ON Games_Id = Games.Id
INNER JOIN Platformen
ON Platformen_Id = Platformen.Id;
```



