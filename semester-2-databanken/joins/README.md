# Join

{% hint style="success" %}
[Kennisclip](https://youtu.be/172HJlga2M4)
{% endhint %}

## Situatie

Om de integriteit van een database te bewaren, normaliseren we de gegevens in de database. Ruwweg betekent dit dat we tabellen splitsen in kleinere, zinvollere tabellen om ontdubbeling te vermijden. Door de normalisering geraakt de informatie echter verspreid over meer dan één tabel. De gebruiker heeft daar echter niet veel aan. Primaire - en vreemde sleutels zeggen de gebruiker niets. We moeten dus een manier vinden om de informatie weer voor te stellen _alsof_ die uit één tabel komt.

## Oplossing

1. `INNER JOIN`: wanneer we gebruik gaan maken van de INNER JOIN zullen de records uit beide tabellen worden gehaald welke aan elkaar zijn verbonden.
2. `LEFT [OUTER] JOIN`: met deze clausule kunnen we alle records ophalen uit de tabel die aan de linkerkant van de JOIN staat gespecificeerd, dus ook de rijen uit de linkse tabel die niet aan de join voorwaarde voldoen worden ook in het resultaat weergegeven.
3. `RIGHT [OUTER] JOIN`: met deze clausule kunnen we alle records ophalen uit de tabel die aan de rechterkant van de JOIN staat gespecificeerd, dus ook de rijen uit de rechtse tabel die niet aan de join voorwaarde voldoen worden ook in het resultaat weergegeven.
4. `FULL [OUTER] JOIN`: met deze clausule kunnen we alle records ophalen uit de tabel die zowel aan de linkerkant en aan de rechterkant van de JOIN staan gespecificeerd, dus ook de rijen uit de linkse en rechtse tabel die niet aan de join voorwaarde voldoen worden ook in het resultaat weergegeven

## Startpunt

Als je wil mee volgen, gebruik dan onderstaand calibratiescript. **Let op: dit maakt dezelfde tabelstructuur aan als de voorbeelden, maar gebruikt andere data.**

```sql
drop database if exists `ApDB`;
CREATE DATABASE  IF NOT EXISTS `ApDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ApDB`;
-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
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
  `Titel` varchar(200) DEFAULT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Personen_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Boeken_Personen` (`Personen_Id`),
  CONSTRAINT `fk_Boeken_Personen` FOREIGN KEY (`Personen_Id`) REFERENCES `Personen` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Boeken`
--

LOCK TABLES `Boeken` WRITE;
/*!40000 ALTER TABLE `Boeken` DISABLE KEYS */;
INSERT INTO `Boeken` VALUES ('Norwegian Wood',1,10),('Kafka on the Shore',2,10),('American Gods',3,16),('The Ocean at the End of the Lane',4,16),('Pet Sematary',5,17),('Good Omens',6,18),('The Talisman',7,17);
/*!40000 ALTER TABLE `Boeken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Personen`
--

DROP TABLE IF EXISTS `Personen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Personen` (
  `Voornaam` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Familienaam` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AanspreekTitel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Straat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Huisnummer` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Stad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Commentaar` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Biografie` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personen`
--

LOCK TABLES `Personen` WRITE;
/*!40000 ALTER TABLE `Personen` DISABLE KEYS */;
INSERT INTO `Personen` VALUES ('Samuel','Ijsseling',1,NULL,NULL,NULL,NULL,NULL,NULL),('Jacob','Van Sluis',2,NULL,NULL,NULL,NULL,NULL,NULL),('Emile','Benveniste',3,NULL,NULL,NULL,NULL,NULL,NULL),('Evert W.','Beth',4,NULL,NULL,NULL,NULL,NULL,NULL),('Rémy','Bernard',5,NULL,NULL,NULL,NULL,NULL,NULL),('Robert','Bly',6,NULL,NULL,NULL,NULL,NULL,NULL),('timothy','gowers',7,NULL,NULL,NULL,NULL,NULL,NULL),(NULL,'?',8,NULL,NULL,NULL,NULL,NULL,NULL),(NULL,'Ovidius',9,NULL,NULL,NULL,NULL,NULL,NULL),('Haruki','Murakami',10,NULL,NULL,NULL,NULL,NULL,NULL),('David','Mitchell',11,NULL,NULL,NULL,NULL,NULL,NULL),('Nick','Harkaway',12,NULL,NULL,NULL,NULL,NULL,NULL),('Thomas','Ligotti',13,NULL,NULL,NULL,NULL,NULL,NULL),('Neil','Gaiman',16,NULL,NULL,NULL,NULL,NULL,NULL),('Stephen','King',17,NULL,NULL,NULL,NULL,NULL,NULL),('Terry','Pratchett',18,NULL,NULL,NULL,NULL,NULL,NULL),('Peter','Straub',19,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Personen` ENABLE KEYS */;
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

