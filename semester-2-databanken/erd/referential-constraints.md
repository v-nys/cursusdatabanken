# Referentiële beperkingen
Als twee entiteiten gelinkt zijn, kan een aanpassing van de ene soms een aanpassing van de andere noodzakelijk maken.

Een voorbeeld: een gebruiker van een webshop schrijft zich uit en vraagt (zoals dat ook kan onder GDPR) dat al zijn/haar persoonlijke informatie uit de webshop verwijderd wordt. Dit omvat mogelijk rijen in een tabel `Bezorgadressen` (want één gebruiker kan meerdere geregistreerde adressen hebben), `Bestellingen`,... Meerbepaald: alle rijen die via een foreign key verwijzen naar de te wissen gebruiker.

Probeer volgende code:

```sql
create table Customers (
  Id int auto_increment primary key,
  Name varchar(100) not null
);
create table DeliveryAddresses (
  Id int auto_increment primary key,
  Street varchar(100) not null,
  HouseNumber int not null,
  Customers_Id int not null,
  constraint fk_DeliveryAddresses_Customers
  foreign key (Customers_Id)
  references Customers(Id)
);
insert into Customers (Name)
values
('Edelgard'),
('Dimitri'),
('Claude');
insert into DeliveryAddresses (Street, HouseNumber, Customers_Id)
values
('Adrestia street', 1, 1),
('Faerghus avenue', 100, 2);
```

Het lukt om Claude te wissen, maar niet om Edelgard of Dimitri te wissen. Dit komt omdat er (in andere tabellen) nog data met deze records geassocieerd is. Er is hier een **referentiële beperking**, dit wil zeggen een beperking die opgelegd wordt omdat er een verwijzing tussen data is. Die verhindert dat Edelgard en Dimitri gewist worden. Voor Claude is er geen verwijzende data, dus hij kan gewist worden.

# Gedrag bij een aanpassing instellen
Er zijn in MySQL verschillende veelgebruikte referentiële beperkingen. Deze worden allemaal genoteerd na de defnitie van een foreign key. Ze drukken dus uit **wat er moet gebeuren wanneer de waarde waarnaar verwezen wordt wijzigt**.

Ze worden allemaal met volgende syntax genoteerd:

```sql
-- eerdere code
REFERENCES SomeTable(Column1) -- vaak 1 kolom, kan in principe wel meer zijn
[ON DELETE action]
```

of 

```sql
-- eerdere code
REFERENCES SomeTable(Column1) -- vaak 1 kolom, kan in principe wel meer zijn
[ON UPDATE action]
```

## `ON UPDATE RESTRICT` / `ON DELETE RESTRICT`
Dit is de defaultoptie in MySQL. Ze betekent dat deze instructies gewoonweg niet toegelaten zijn als er een verwijzing bestaat. Dit is de reden dat het in bovenstaand voorbeeld wel mogelijk is Claude te wissen, maar niet Edelgard of Dimitri. Om dezelfde reden kan men het `Id` van Edelgard en Dimitri niet aanpassen.

## `ON DELETE CASCADE`
Dit is geschikt als het geen zin heeft om de gekoppelde data te bewaren. Met deze constraint zou (in het voorbeeld hierboven) een `DELETE` van "Edelgard" ook inhouden dat "Adrestia street 1" gewist wordt.

## `ON UPDATE CASCADE`
Dit zorgt ervoor dat een verwijzing mee wijzigt met de brondata. Een aanpassing van het `Id` van "Edelgard" van 1 naar 4 zou dan automatisch inhouden dat de kolom `Customers_Id` van "Adrestia street 1" mee gewijzigd zou worden naar 4.


## `ON DELETE SET NULL`
Dit kan zinvol zijn als een verwijzing niet noodzakelijk is. Zo zou het adres van een klant bewaard kunnen worden wanneer de klant zelf verwijderd wordt. Merk op dat dit in bovenstaand voorbeeld niet kan werken, omdat `Customers_Id` nooit `NULL` mag zijn.

## `ON UPDATE SET NULL`
Dit gedraagt zich hetzelfde als `ON DELETE SET NULL`, maar dan bij een `UPDATE`. Dit is technisch mogelijk, maar zelden zinvol. Ook hier wordt verondersteld dat de foreign key `NULL` mag bevatten.

{% hint style="info" %}
Het is mogelijk een verschillende actie in te stellen voor beide types wijzigingen, i.e. `DELETE` en `UPDATE`. Het is niet mogelijk meerdere acties in te stellen voor dezelfde wijziging.
{% endhint %}
