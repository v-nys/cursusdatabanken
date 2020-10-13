# Vreemde sleutels

## Concept

In [het voorbeeld met games](sleutels-voor-identificatie.md) heb je gezien dat er verschillende redenen zijn om rijen uniek te identificeren. Dit is alleen zinvol als we de primaire sleutelattributen ook ergens anders vermelden. Met andere woorden, als we in kolom A van tabel B een primaire sleutel plaatsen, is het logisch dat we in kolom C van tabel D over deze sleutel spreken.

We hebben dat ook gedaan in het tweede voorbeeld op [de eerder genoemde pagina](sleutels-voor-identificatie.md) \(het voorbeeld met games\), door een tabel te maken die de dubbele voorkomens van lange stukken tekst vervangt door hun identificatienummers.

Wanneer we in één record via een bepaalde kolom verwijzen naar \(de sleutel van\) een ander record, spreken we over een **vreemde sleutel** of **foreign key**. Hij is "vreemd" omdat hij verwijst naar een **ander** record, mogelijk \(maar niet noodzakelijk\) in een andere tabel.

## Gebruik \(nieuwe tabel\)

Als de primary key van een tabel waar je naar verwijst een `INT` is, definieer je een kolom met een foreign key ook als `INT`. Na de oplijsting van de kolommen voeg je dan een constraint toe. Hierbij spelen drie zaken mee:

1. de naam van de constraint
2. de kolom die moet dienen als foreign key
3. de kolom die dienst doet als primary key in de tabel waarnaar verwezen wordt

Dat ziet er bijvoorbeeld zo uit, als je een tabel met boeken koppelt aan hun auteur \(veronderstel even dat een boek één auteur heeft\):

```sql
CREATE TABLE Boeken (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  Personen_Id INT,
  CONSTRAINT fk_Boeken_Personen FOREIGN KEY (Personen_Id)
  REFERENCES Personen(Id)
);
```

Deze hoef je niet uit te voeren.

Dit wil zeggen: "maak een tabel voor boeken met een uniek identificatienummer \(de primary key\); boeken kunnen ook verwijzen naar specifieke records in de tabel die personen voorstelt; deze verwijzingen worden voorgesteld met de kolom `Personen_Id` **in de tabel voor boeken**"

Hierbij gebruiken we enkele **afspraken**:

* De naam van de kolom die dienst doet als foreign key is de naam van de tabel waarnaar verwezen wordt, gevolgd door `_Id`.
* De naam van een foreign key constraint is altijd `fk_`, gevolgd door de naam van de tabel waarop de constraint toegepast is, gevolgd door de naam van de tabel waarnaar verwezen wordt.

## Gebruik \(bestaande tabel\)

Als je al een tabel hebt en deze wil uitbreiden met een foreign key, doe je dat via de DDL `ALTER`-instructie. Als je bijvoorbeeld al een tabel voor boeken had zoals hierboven, maar zonder de kolom `Personen_Id`, zou je dit schrijven:

```sql
ALTER TABLE Boeken
ADD COLUMN Personen_Id INT,
ADD CONSTRAINT fk_Boeken_Personen
  FOREIGN KEY (Personen_Id)
  REFERENCES Personen(Id);
```

Sla op als 0058\_\_AlterBoeken.sql en voer uit.

