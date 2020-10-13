# INSERT

Aanmaken van je eerste concrete data

Aan alleen structuur heb je niets. We willen ook data bijhouden in ons systeem. Met andere woorden: rijen, niet alleen tabellen.

Er is een vaste syntax om data in je databank te plaatsen, waar je even aan zal moeten wennen. Het is een goed idee om met een stub te beginnen, een skelet statement. Dit zorgt er voor dat je fouten in de syntax snel opmerkt. Voor een tabel Boeken ziet dit er zo uit, voor een enkel nieuw record:

```sql
INSERT INTO Boeken (
-- hier moet je gebruikte kolomnamen invullen
)
VALUES (
-- hier moet je waarden voor de gebruikte invullen
);
```

Probeer het eens uit. Maak eerst een tabel Boeken met een kolom Voornaam van type `VARCHAR(100)`, een kolom Titel van een **verplicht** type `VARCHAR(100)` en doe dan:`INSERT INTO Boeken ( Voornaam ) VALUES ( 'Aurelius' );`

Omdat we hebben vereist in een eerder script dat de titel van een boek altijd aanwezig moet zijn, moeten we deze aanduiden als gebruikte kolom: `INSERT INTO Boeken ( Voornaam, Titel) VALUES ( 'Aurelius', 'Filosofie' );`

Dit zou moeten werken. Merk op: de volgorde van de vernoemde kolommen moet overeenstemmen met de volgorde van de waarden! Meer data in een keer

Je hoeft geen INSERT statement te schrijven per stukje data. Je kan meerdere rijen tegelijk invoegen door ze te scheiden met komma's:

```sql
INSERT INTO Boeken ( Voornaam, Titel )
VALUES
('Gerard', 'Heideggers vraag naar de techniek'),
('Diderik', 'Logicaboek');
```

## Opdracht

Schrijf een script dat een eventueel bestaande tabel `Boeken` verwijdert, de gevraagde tabel `Boeken` aanmaakt en dan de drie boeken hierboven in één instructie toevoegt. Noem het 0005\_\_InsertData.sql.

