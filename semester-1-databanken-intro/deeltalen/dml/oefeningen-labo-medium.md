# Labo-oefeningen medium
## Oefeningen
Voor je deze oefeningen maakt, gebruik je onderstaand script om te garanderen dat je database in de gewenste toestand is:

```sql
TODO
```

## Booleaanse expressies
### Oefening 1
Schrijf een script, 0523\_\_Oefening.sql, dat de hond van Christiane en de kat van Bert allebei 9 jaar oud maakt.

### Oefening 2
Schrijf een script, 0524\_\_Oefening.sql, dat alle honden van Thaïs en katten van Truus wist.

### Oefening 3
Schrijf een script, 0525\_\_Oefening.sql, dat de zin "X is de naam van een hond" produceert voor elke hond in de database. De resultaten van je opdracht worden weergegeven in een tabel met één kolom, met als hoofding "Bewering".

## vergelijkingen
### Oefening 1
Door de naam van een te controleren kolom te laten volgen door `COLLATE (een-of-andere-collation)` behandel je vergelijkingen alsof de kolom een andere collation heeft. 

Voorspel wat volgende code zal doen bij collation utf8mb4_0900_ci_as:

```sql
USE ModernWays;
insert into Boeken (
   Voornaam,
   Familienaam,
   Titel,
   Stad,
   Uitgeverij,
   Verschijningsjaar,
   Categorie)
values
  ('Céline', 'Claus', 'De verwondering', 'Antwerpen', 'Manteau', '1970','Filosofie'),
  ('Celine' ,'Raes', 'Jagen en gejaagd worden', 'Antwerpen', 'De Bezige Bij', '1954','Filosofie'),
  ('CELINE', 'Sarthe', 'Het zijn en het niets', 'Parijs', 'Gallimard', '1943','Filosofie');
select * from Boeken where voornaam = 'Celine';
```

Pas vervolgens de code aan zodat je enkel en alleen het boek van Raes te zien krijgt. Sla op als 0526\_\_Oefening.sql.

### Oefening 2
Schrijf een script, 0527\_\_Oefening.sql, dat alle auteurs selecteert waarvan de familienaam begint met 'B', maar niet met iets anders, **zonder gebruik te maken van `LIKE`**.

### Oefening 3
Schrijf een script, 0528\_\_Oefening.sql, dat alle boeken selecteert die ten laatste zijn uitgekomen in 1999, **zonder gebruik te maken van `LIKE`**.

### Oefening 4
Voeg met een script 0529\_\_Oefening.sql volgende twee boeken toe, exact zoals gegeven (laat andere kolommen weg):
| Familienaam | Titel | Verschijningsjaar | Categorie |
|-------------|-------|-------------------|-----------|
| ? | Beowulf | 0975 | Mythologie |
| Ovidius | Metamorfosen | 8 | Mythologie |

Vraag dan alle boeken op die verschenen zijn voor '0976' in 0530\_\_Oefening.sql. Probeer uit en vraag uitleg (eventueel via het discussieforum) als het resultaat niet is wat je verwacht! 

### Oefening 5
Toon met een script, 0531\_\_Oefening.sql, alle boeken zonder commentaar waarvan de auteur een achternaam heeft die met een letter vanaf "D" begint.

## Sorteren
Toon met script 0532\_\_Oefening.sql een overzicht van alle muzieknummers, geordend volgens releasejaar (van nieuw naar oud), artiest (van A tot Z) en lengte van de titel (van lang naar kort). Dit laatste kan je bereiken met de `LENGTH`-functie, die vergelijkbaar is met `CONCAT` en `SUBSTRING` maar slechts één invoer heeft.

## Like
### Oefening 1
Schrijf een script, 0533\_\_Oefening.sql, waarmee alle kolommen van alle boeken gezocht worden waarvoor 'van' voorkomt in de familienaam van de auteur. Dit kan met een kleine letter of een hoofdletter zijn.

### Oefening 2
Schrijf een script, 0534\_\_Oefening.sql, waarmee alle kolommen van alle boeken gezocht worden waarvan de familienaam van de auteur begint met een A, R of C.

### Oefening 3
Schrijf een script, 0535\_\_Oefening.sql, waarmee alle boeken gewist worden die verschenen zijn in de jaren 90 van de vorige eeuw.
