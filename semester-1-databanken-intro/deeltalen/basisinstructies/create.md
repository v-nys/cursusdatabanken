# CREATE

## Opgelet!

{% hint style="danger" %}
Onder Unix \(macOS en Linux\) zijn databasenamen hoofdlettergevoelig \(in tegenstelling tot SQL trefwoorden\). Dit geldt overigens ook voor de tabelnamen. Onder Windows is deze beperking standaard niet van toepassing, maar het is een goede gewoonte te doen alsof het wel zo is. Volg daarom de gemaakte afspraken wat betreft naamgeving heel nauwkeurig. Als de code op jouw Windowsmachine werkt maar niet op onze server omdat de code de afspraken niet volgt, bevat ze een fout!
{% endhint %}

## Aanmaken van je eerste database

{% hint style="info" %}
Je kan geen nieuwe databases aanmaken als je verbindt met de gedeelde server. Je kan het wel doen als je MySQL installeert op je eigen systeem of in een virtuele machine.
{% endhint %}

Je zou het volgende SQL statement gebruiken om een database te maken:

```sql
CREATE DATABASE ApDB;
```

Het creëren van een database volstaat niet om die vervolgens te kunnen gebruiken. Je moet in een script expliciet opgeven dat je een bepaalde database wilt gebruiken met de instructie `USE`:

```sql
USE ApDB;
```

Een database moet slechts één keer gemaakt worden, maar je moet vooraleer die te gebruiken ze telkens weer selecteren. Dat doe je met de `USE` instructie zoals in het voorgaande voorbeeld.

## Aanmaken van je eerste tabellen

Het niveau onder dat van de databank is het niveau van de tabel. Een tabel bevat typisch informatie over één entiteit, d.w.z. één soort interessante data. Dat is bijvoorbeeld bijvoorbeeld een tabel `Boeken` in een bibliotheeksysteem. We vertrekken van een voorstelling voor boeken en personen.

We willen volgende gegevens in het systeem bijhouden:

![](../../../.gitbook/assets/lievelingsboek.png)

Gebruik eerst `USE` om je database te activeren. Eerst leggen we vast we welke tabellen en welke datatypes we nodig hebben:

![](../../../.gitbook/assets/eerste-erd.png)

Negeer de "1 more" onder "Geboortejaar". Negeer ook het gele sleuteltje. Die zaken komen later. Om de tabel "Personen" aan te maken, schrijven we:

```sql
CREATE TABLE Personen(Voornaam VARCHAR(50), Familienaam VARCHAR(50), Geboortejaar INT);
```

Schrijf nu zelf de code om de tabel `Boeken` aan te maken. Sla beide instructies \(die voor personen en voor boeken\) onder elkaar op in een script met naam 0001\_\_CreateTables.sql.

### Commentaar toevoegen

Schrijf bovenaan in je script, in commentaar, de tekst "dit is mijn eerste tabel". Dit doe je met behulp van `--`.

### Database selecteren

Zoals eerder aangegeven, moet je eerst een database selecteren waar de nieuwe tabel onderdeel van zal worden. Dit doe je met de USE-instructie.

### Verplichte kolommen

Soms kunnen we met ontbrekende waarden leven, soms niet. Indien we bijvoorbeeld kunstwerken uit de oudheid bijhouden in een tabel Kunstwerken met een kolom Artiest, zullen we niet in elke rij een artiest kunnen invullen, want we zullen het niet altijd weten. Langs de andere kant is het soms verplicht een waarde in te vullen. In de database van een bibliotheek zal elk boek een identificatiecode moeten krijgen, bijvoorbeeld. Dit geven we aan door in het `CREATE`-statement het datatype \(d.w.z. het soort gegevens in de kolom\) te laten volgen door `NOT NULL`. Als we dit schrijven, is het onmogelijk een boek zonder identificatiecode in het systeem te plaatsen.

#### Voorbeeld

```sql
-- de titel en voornaam van de auteur zijn verplicht
-- het nummer van de druk is niet verplicht
CREATE TABLE Boeken (Titel VARCHAR(100) NOT NULL, Voornaam VARCHAR(100) NOT NULL, Druk TINYINT UNSIGNED);
```

Schrijf nu zelf code om een tabel `Kunstwerken` aan te maken, met een niet-verplichte kolom `Artiest` en een verplichte kolom `Titel`, beide van het datatype `VARCHAR(100)`. Noem je script 0002\_\_CreateTable.sql

### Enkel aanmaken wat niet bestaat

Via het `CREATE`-commando maak je een nieuwe structuur aan met een bepaalde naam. Als die naam al bestaat, levert dat een foutmelding. Daarom moeten we voorzichtig omspringen met het `CREATE` commando. We doen dit door onze `CREATE` enkel uit te voeren als de naam die we willen gebruiken \(voor een database of een tabel of een andere structuur\) nog niet gebruikt wordt. Hiervoor vervangen we bijvoorbeeld `CREATE TABLE MyTable (Column VARCHAR(100));` door `CREATE TABLE IF NOT EXISTS MyTable (Column VARCHAR(100));`. Dit vermijdt dat we op een foutmelding botsen. Het kan wel een waarschuwing opleveren, maar dat is op zich niet erg.

Maak een variatie op script 0002\_\_CreateTable om een tabel met kunstwerken aan te maken, maar zorg dat er geen foutmelding verschijnt als deze tabel al bestaat. Noem je script 0003\_\_CreateTable.sql.

