# Labo-oefeningen groeperen en samenvatten

## Calibreren

Voor gebruik je onderstaand script om te garanderen dat je database in de gewenste toestand is en noem je het 0536\_\_CalibrateDB.sql:

```sql
DROP DATABASE IF EXISTS `ModernWays`;
CREATE DATABASE  IF NOT EXISTS `ModernWays` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ModernWays`;
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
INSERT INTO `Boeken` VALUES ('Aurelius','Augustinus',NULL,NULL,NULL,NULL,NULL,NULL,'Metafysica',NULL),('Stephen','Hawking','Antwoorden op de grote vragen',NULL,NULL,NULL,NULL,NULL,'Filosofie',NULL),('William','Dunham','Journey through Genius: The Great Theorems of Mathematics',NULL,NULL,NULL,NULL,NULL,'Wiskunde',NULL),('Evert Willem','Beth','Mathematical Thought',NULL,'2010',NULL,NULL,NULL,'Filosofie',NULL),('Jef','B','Het Boek',NULL,'2015',NULL,NULL,NULL,'Filosofie',NULL),('Mathijs','Degrote','Leren werken met SQL',NULL,NULL,NULL,NULL,'Kan nooit kwaad','Informatica',NULL),('Mathijs','Degrote','Leren werken met HTML en CSS',NULL,NULL,NULL,NULL,'Kan nooit kwaad','Informatica',NULL),('Mathijs','Degrote','Leren werken met Javascript',NULL,NULL,NULL,NULL,'Kan nooit kwaad','Informatica',NULL),('Tom','Van Wommel','Auteursrecht',NULL,NULL,NULL,NULL,'Nuttig om te weten','Recht',NULL),('Kris','Van Laer','Schaken',NULL,NULL,NULL,NULL,'Veel goede tips','Entertainment',NULL),('Ellen','Reynaert','Het criminele brein',NULL,NULL,NULL,NULL,NULL,'Psychologie',NULL),('Céline','Claus','De verwondering','Antwerpen','1970','Manteau',NULL,NULL,'Filosofie',NULL),('Celine','Raes','Jagen en gejaagd worden','Antwerpen','1954','De Bezige Bij',NULL,NULL,'Filosofie',NULL),('CELINE','Sarthe','Het zijn en het niets','Parijs','1943','Gallimard',NULL,NULL,'Filosofie',NULL),(NULL,'?','Beowulf',NULL,'0975',NULL,NULL,NULL,'Mythologie',NULL),(NULL,'Ovidius','Metamorfosen',NULL,'8',NULL,NULL,NULL,'Mythologie',NULL);
/*!40000 ALTER TABLE `Boeken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Huisdieren`
--

DROP TABLE IF EXISTS `Huisdieren`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Huisdieren` (
  `Naam` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Leeftijd` smallint(5) unsigned NOT NULL,
  `Soort` varchar(50) NOT NULL,
  `Baasje` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Geluid` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Huisdieren`
--

LOCK TABLES `Huisdieren` WRITE;
/*!40000 ALTER TABLE `Huisdieren` DISABLE KEYS */;
INSERT INTO `Huisdieren` VALUES ('Misty',6,'hond','Vincent','WAF!'),('Ming',9,'hond','Christiane','WAF!'),('Bientje',6,'kat','Esther','miauwww...'),('Ming',9,'kat','Bert','miauwww...'),('Фёдор',1,'hond','Lyssa','WAF!');
/*!40000 ALTER TABLE `Huisdieren` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Liedjes`
--

DROP TABLE IF EXISTS `Liedjes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Liedjes` (
  `Titel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Artiest` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Jaar` char(4) DEFAULT NULL,
  `Album` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Aantalbeluisteringen` INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Liedjes`
--

LOCK TABLES `Liedjes` WRITE;
/*!40000 ALTER TABLE `Liedjes` DISABLE KEYS */;
INSERT INTO `Liedjes` VALUES ('Stairway to Heaven','Led Zeppelin','1971','Led Zeppelin IV',60),('Rock and Roll','Led Zeppelin','1971','Led Zeppelin IV',49),('Riders on the Storm','The Doors','1971','L.A. Woman',30),('Good Enough','Molly Tuttle','2017','Rise',25),('Outrage for the Execution of Willie McGee','Goodnight, Texas','2018','Conductor',20),('They Lie','Layla Zoe','2013','The Lily',40),('Green Eyed Lover','Layla Zoe','2013','The Lily',40),('Why You So Afraid','Layla Zoe','2013','The Lily',38),('It Ain\'t You','Danielle Nicole','2015','Wolf Den',50),('Unchained','Van Halen','1981','Fair Warning',17);
/*!40000 ALTER TABLE `Liedjes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Metingen`
--

DROP TABLE IF EXISTS `Metingen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Metingen` (
  `Tijdstip` datetime NOT NULL,
  `Grootte` smallint(5) unsigned NOT NULL,
  `Marge` float(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Metingen`
--

LOCK TABLES `Metingen` WRITE;
/*!40000 ALTER TABLE `Metingen` DISABLE KEYS */;
/*!40000 ALTER TABLE `Metingen` ENABLE KEYS */;
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

## Groeperen en tellen

### Oefening 1

Schrijf een script, 0537\_\_Oefening.sql, dat toont hoeveel boeken elke auteur heeft geschreven. Je mag ervan uitgaan dat er geen twee auteurs zijn met dezelfde combinatie van voornaam en achternaam.

Het formaat is \(met de juiste hoofding per kolom en een berekende `waarde`, maar met meer rijen\):

| Voornaam | Familienaam | Aantal boeken |
| :--- | :--- | :--- |
| waarde | waarde | waarde |

### Oefening 2

Schrijf een script, 0538\_\_Oefening.sql, dat toont hoeveel liedjes van Layla Zoe er in het systeem zitten.

Het formaat is:

| Artiest | Totaal aantal liedjes |
| :--- | :--- |
| Layla Zoe | waarde |

## Groeperen en berekenen

### Oefening 1

Schrijf een script, 0539\_\_Oefening.sql, dat je toont:

* hoe oud een huisdier _gemiddeld_ is
* hoe oud het oudste huisdier is
* hoeveel huisdieren er zijn

Als je het script uitvoert, moet je de resultaten in volgend formaat te zien krijgen \(met de juiste hoofding per kolom en een berekende `waarde`, maar met meer rijen\):

| Gemiddelde leeftijd | Hoogste leeftijd | Totaal aantal |
| :--- | :--- | :--- |
| waarde | waarde | waarde |

### Oefening 2

Schrijf een script, 0540\_\_Oefening.sql, dat per artiest toont hoeveel liedjes van deze artiest in het systeem zitten.

Als je het script uitvoert, moet je de resultaten in volgend formaat te zien krijgen \(met de juiste hoofding, maar met meer rijen\):

| Artiest | Aantal liedjes |
| :--- | :--- |
| waarde | waarde |

### Oefening 3

Schrijf een script, 0541\_\_Oefening.sql, dat je toont hoe alle nummers samen van één artiest zijn beluisterd. Dus als bijvoorbeeld "Stairway to Heaven" 10 keer beluisterd is en "Rock and Roll" 7 keer, dan zijn alle nummers van Led Zeppelin samen 17 keer beluisterd. Jouw script moet dit voor _alle_ artiesten uitrekenen.

| artiest | aantal beluisteringen |
| :--- | :--- |
| waarde | waarde |

### Oefening 4

Schrijf een script, 0542\_\_Oefening.sql, dat alle artiesten toont waar al meer dan 100 keer naar geluisterd is. Het formaat is als volgt:

| Artiest | Aantal beluisteringen |
| :--- | :--- |
| waarde | waarde |

### Oefening 5

Schrijf een script, 0543\_\_Oefening.sql, dat je het gemiddeld aantal beluisteringen van nummers van Layla Zoe toont. Het formaat is \(met in dit geval exact één rij\):

| Artiest | Gemiddeld aantal beluisteringen |
| :--- | :--- |
| Layla Zoe | waarde |

### Oefening 6

Schrijf een script, 0544\_\_Oefening.sql, dat je het totaal beluisteringen toont voor elke artiest met minstens 10 karakters in de naam.

Het formaat is \(met opnieuw meerdere rijen mogelijk\):

| Artiest | Totaal aantal beluisteringen |
| :--- | :--- |
| waarde | waarde |

**Tip: Hiervoor moet je al wat meer combineren. Je moet ook weten dat `GROUP BY` pas wordt toegepast na `WHERE`.**

### Oefening 7

Schrijf een script, 0545\_\_Oefening.sql, dat je het totaal aantal beluisteringen toont voor elke artiest met minstens 10 karakters in de naam, maar enkel als dat aantal minstens 100 is.

**Tip: Hiervoor moet je nog meer combineren. Je moet ook weten dat `HAVING` perfect in combinatie gebruikt kan worden met `WHERE`. Je moet dus het verschil tussen de twee goed zien!**

| artiest | totaal aantal beluisteringen |
| :--- | :--- |
| waarde | waarde |

## Korte notaties

### Oefening 1

Schrijf een script, 0546\_\_Oefening.sql, dat nagaat of het totaal aantal beluisteringen van een artiest ofwel 17, ofwel 50, ofwel 100 is. Het formaat is:

| Artiest | Specifiek aantal beluisteringen |
| :--- | :--- |
| waarde | 0 of 1 |

Hier betekent 0 dat het aantal beluisteringen verschilt van 17, 50 en 100 en betekent 1 dat het aantal beluisteringen ofwel 17, ofwel 50, ofwel 100 is. Voor elke artiest wordt een rij getoond.

### Oefening 2

Schrijf een script, 0547\_\_Oefening.sql, dat alle artiesten toont waarvan de naam alfabetisch tussen de 'i' en de 'p' ligt. Zorg ervoor dat elke artiestennaam slechts één keer wordt getoond. Dit moet hoofdletterongevoelig en accentongevoelig zijn en los dit op zonder gebruik te maken van `GROUP BY`.

Het formaat is:

| Artiest |
| :--- |
| waarde |

