# Labo-oefeningen

## Oefeningen

### nummers

Schrijf een script dat een tabel `Nummers` voor muzieknummers toevoegt aan je databank met volgende karakteristieken:

{% hint style="warning" %}
"Variabele lengte" betekent dat de tekst niet altijd de maximale hoeveelheid ruimte in beslag neemt.
{% endhint %}

| Kolomnaam | Type | Maximale lengte | Variabele lengte | Internationale tekens | Verplicht |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Titel | tekst | 100 | JA | zeker nodig | JA |
| Artiest | tekst | 100 | JA | zeker nodig | JA |
| Genre | tekst | 50 | JA | niet zeker nodig | NEE |
| Jaar | tekst | 4 | NEE | niet zeker nodig | NEE |

Sla op als 0014\_\_Oefening.sql.

### huisdieren

Doe hetzelfde voor een tabel `Huisdieren` met huisdieren, met volgende kenmerken:

| Kolomnaam | Type | Maximale lengte | Variabele lengte | Internationale tekens | Verplicht |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Naam | tekst | 100 | JA | zeker nodig | JA |
| Leeftijd | een geheel positief getal | tot 300 jaar | NVT | NVT | JA |
| Soort | tekst | 50 | JA | niet zeker nodig | JA |

Sla op als 0015\_\_Oefening.sql.

### data nummers

Plaats volgende data in je tabel met muzieknummers:

1. het nummer "John the Revelator" van de groep "Larkin Poe". Het genre is "Blues" en het verschijningsjaar is 2017.

2. het nummer "Missionary Man" van de groep "Ghost". Het genre is "Metal" en het verschijningsjaar is 2016.

Sla op als 0016\_\_Oefening.sql.

### data huisdieren

Plaats volgende data in je tabel met huisdieren:

1. Ming, 9 jaar oud, is de hond van Christiane
2. Bientje, 12 jaar oud, is de kat van Esther
3. Misty, 7 jaar oud, is de hond van Vincent

Sla op als 0017\_\_Oefening.sql.

### zoekopdracht huisdieren

{% hint style="info" %}
Je hebt hier de `concat` functie nodig, uitgelegd op [de pagina over SELECT](../basisinstructies/select.md).
{% endhint %}

Toon met een `SELECT` de duo's met huisdieren en baasjes in het formaat `H+B`, gerangschikt volgens de leeftijd van het huisdier.

De juiste oplossing toont volgende rijen in MySQL Workbench, in exact deze volgorde:

| \(wat hier staat is niet belangrijk\) |
| :--- |
| M+V |
| M+C |
| B+E |

Sla op als 0018\_\_Oefening.sql.

{% hint style="danger" %}
Alle oefeningen hieronder zijn nog niet herwerkt voor 2020-2021!
{% endhint %}

### hernoemen

Hernoem je tabel `Nummers` naar `Liedjes`. Sla op als 0503\_\_Oefening.sql.

### uitbreiden

Voeg een extra kolom, `Album`, toe aan `Liedjes`. Deze is niet verplicht, telt tot 100 internationale tekens. Sla op als 0504\_\_Oefening.sql.

### verwijderen

Verwijder de kolom `Genre` voor `Liedjes`. Sla op als 0505\_\_Oefening.sql.

### verder uitbreiden

Voeg een extra kolom, `Baasje`, toe aan `Huisdieren`. Deze is verplicht, telt tot 100 internationale tekens. Sla op als 0506\_\_Oefening.sql.

### complexere data

Maak een tabel `Metingen` aan met volgende kolommen: 1. `Tijdstip` \(een verplicht tijdstip dat een datum en het uur van de dag voorstelt\) 2. `Grootte` \(een verplicht positief geheel getal dat het dichtst aansluit om getallen tot 20000 te bewaren\) 3. `Marge` \(een verplicht benaderd kommagetal met enkele precisie, van 3 cijfers, waarvan 2 na de komma\)

Sla op als 0507\_\_Oefening.sql.

### data invoegen

Plaats volgende data in je tabel met muzieknummers: 1. het nummer "John the Revelator" van de groep "Larkin Poe". Het album is "Peach" en het verschijningsjaar is 2017. 2. het nummer "Missionary Man" van de groep "Ghost". Het album is "Popestar" en het verschijningsjaar is 2016.

Sla op als script 0508\_\_Oefening.sql.

### afronden

Wanneer je klaar bent, van in je map met SQL scripts:

```text
git add *.sql
git commit -m "Eerste scripts labo"
git push
```

Herstel ook je databank naar de toestand zodat ze weer gelijk loopt met de theorie met volgend script en sla op als 0017\_\_CalibrateDB.sql:

{% hint style="info" %}
Zie lijn 1 van onderstaand script m.b.t. USE !!!
{% endhint %}

```sql
-- Gebruik i.p.v. ApDb de naam van jouw databank !!!
USE `ApDb`;
-- MySQL dump 10.13  Distrib 8.0.17, for Linux (x86_64)
--
-- Host: localhost    Database: ModernWays
-- ------------------------------------------------------
-- Server version    8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Boeken`
--

DROP TABLE IF EXISTS `Boeken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Boeken` (
  `Voornaam` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Familienaam` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Titel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Stad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Verschijningsjaar` varchar(4) DEFAULT NULL,
  `Uitgeverij` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Herdruk` varchar(4) DEFAULT NULL,
  `Commentaar` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Categorie` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IngevoegdDoor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Boeken`
--

LOCK TABLES `Boeken` WRITE;
/*!40000 ALTER TABLE `Boeken` DISABLE KEYS */;
INSERT INTO `Boeken` VALUES ('Aurelius','Augustinus',NULL,NULL,NULL,NULL,NULL,NULL,'Metafysica',NULL),('Diderik','Batens','Logicaboek','','1999','','','','Metafysica','');
/*!40000 ALTER TABLE `Boeken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
```

Vul op Digitap ook de link in naar je Bitbucket repository.

## Opdracht: In orde brengen scripts les

Zorg er tegen volgend labo voor dat \(naast de scripts uit dit labo\) alle scripts die al aan bod gekomen zijn over de DDL hebt en dat ze juist genummerd zijn.

