# Oefeningen
**Voor je deze oefeningen maakt, gebruik je onderstaand script om zeker te zijn dat je databank in de gewenste toestand is:**

```sql
DROP DATABASE IF EXISTS ModernWays;
CREATE DATABASE ModernWays;
```

Sla dit op als 0500\_\_CalibrateDB.sql in je map met scripts.

## nummers
Schrijf een script dat een tabel `Nummers` voor muzieknummers toevoegt aan je databank met volgende karakteristieken:

| Kolomnaam | Type | Maximale lengte | Variabele lengte | Internationale tekens | Verplicht |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Titel | CHAR | 100 | JA | JA | JA |
| Artiest | CHAR | 100 | JA | JA | JA |
| Genre | CHAR | 50 | JA | NEE | NEE |
| Jaar | CHAR | 4 | NEE | NEE | NEE |

Sla op als 0501\_\_Oefening.sql.

## huisdieren
Doe hetzelfde voor een tabel `Huisdieren` met huisdieren, met volgende kenmerken:
| Kolomnaam | Type | Maximale lengte | Variabele lengte | Internationale tekens | Verplicht |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Naam | CHAR | 100 | JA | JA | JA |
| Leeftijd | een geheel positief getal | tot 300 jaar | NVT | NVT | JA |
| Soort | CHAR | 50 | JA | NEE | JA |

Sla op als 0502\_\_Oefening.sql.

## hernoemen
Hernoem je tabel `Nummers` naar `Liedjes`. Sla op als 0503\_\_Oefening.sql.

## uitbreiden
Voeg een extra kolom, `Album`, toe aan `Liedjes`. Deze is niet verplicht, telt tot 100 internationale tekens. Sla op als 0504\_\_Oefening.sql.

## verwijderen
Verwijder de kolom `Genre` voor `Liedjes`. Sla op als 0505\_\_Oefening.sql.

## verder uitbreiden
Voeg een extra kolom, `Baasje`, toe aan `Huisdieren`. Deze is verplicht, telt tot 100 internationale tekens. Sla op als 0506\_\_Oefening.sql.

## complexere data
Maak een tabel `Metingen` aan met volgende kolommen:
1. `Tijdstip` (een verplicht tijdstip dat een datum en het uur van de dag voorstelt)
2. `Grootte` (een verplicht positief geheel getal dat tot 20000 kan oplopen, maar niet hoger)
3. `Marge` (een benaderd kommagetal van 3 cijfers, waarvan 2 na de komma)

Sla op als 0507\_\_Oefening.sql.

## data invoegen
Plaats volgende data in je tabel met muzieknummers:
1. het nummer "John the Revelator" van de groep "Larkin Poe". Het genre is "Blues" en het verschijningsjaar is 2017.
2. het nummer "Missionary Man" van de groep "Ghost". Het genre is "Metal" en het verschijningsjaar is 2016.

## afronden
Wanneer je klaar bent, van in je map met SQL scripts:
```text
git add *.sql
git commit -m "Eerste scripts labo"
git push
```

Herstel ook je databank naar de toestand zodat ze weer gelijk loopt met de theorie met volgend script en sla op als 0017\_\_CalibrateDB.sql:
```sql
CREATE DATABASE  IF NOT EXISTS `ModernWays` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ModernWays`;
-- MySQL dump 10.13  Distrib 8.0.17, for Linux (x86_64)
--
-- Host: localhost    Database: ModernWays
-- ------------------------------------------------------
-- Server version	8.0.17

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

-- Dump completed on 2019-10-09 11:47:25
```

Vul op Digitap ook de link in naar je Bitbucket repository.

# Opdracht: In orde brengen scripts les
Zorg er tegen volgend labo voor dat (naast de scripts uit dit labo) alle scripts die al aan bod gekomen zijn over de DDL hebt en dat ze juist genummerd zijn.
