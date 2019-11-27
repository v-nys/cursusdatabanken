# Primaire sleutel toevoegen/verwijderen

## Primaire sleutel toevoegen/verwijderen voor een bestaande tabel

We vertrekken hier van volgend script, 0055\_\_CalibrateDB.sql:

```sql
CREATE DATABASE  IF NOT EXISTS `ModernWays` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ModernWays`;
-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: ModernWays
-- ------------------------------------------------------
-- Server version    8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `Boeken` VALUES ('Aurelius','Augustinus',NULL,NULL,NULL,NULL,NULL,NULL,'Metafysica',NULL),('Diderik','Batens','Logicaboek','','1999','','','','Metafysica',''),('Stephen','Hawking','The Nature of Space and Time',NULL,NULL,NULL,NULL,NULL,'Wiskunde',NULL),('Stephen','Hawking','Antwoorden op de grote vragen',NULL,NULL,NULL,NULL,NULL,'Filosofie',NULL),('William','Dunham','Journey through Genius: The Great Theorems of Mathematics',NULL,NULL,NULL,NULL,NULL,'Wiskunde',NULL),('William','Dunham','Euler: The Master of Us All',NULL,NULL,NULL,NULL,NULL,'Geschiedenis',NULL),('Evert Willem','Beth','Mathematical Thought',NULL,NULL,NULL,NULL,NULL,'Filosofie',NULL),('Jef','B','Het Boek',NULL,NULL,NULL,NULL,NULL,'Filosofie',NULL),('Mathijs','Degrote','Leren werken met SQL',NULL,NULL,NULL,NULL,NULL,'Informatica',NULL);
/*!40000 ALTER TABLE `Boeken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Honden`
--

DROP TABLE IF EXISTS `Honden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Honden` (
  `Naam` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Leeftijd` tinyint(4) NOT NULL,
  `Geslacht` enum('mannelijk','vrouwelijk') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Honden`
--

LOCK TABLES `Honden` WRITE;
/*!40000 ALTER TABLE `Honden` DISABLE KEYS */;
INSERT INTO `Honden` VALUES ('Rose',1,'vrouwelijk'),('Lacy',7,'vrouwelijk'),('Phoebe',4,'vrouwelijk'),('Camilla',14,'vrouwelijk'),('Betsy',7,'vrouwelijk'),('Lena',8,'vrouwelijk'),('Ella',8,'vrouwelijk'),('Samantha',15,'vrouwelijk'),('Sophia',7,'vrouwelijk'),('Abby',4,'vrouwelijk'),('Lily',10,'vrouwelijk'),('Biscuit',11,'vrouwelijk'),('Nori',8,'vrouwelijk'),('Sam',5,'vrouwelijk'),('Mika',9,'vrouwelijk'),('Baby',10,'vrouwelijk'),('Blondie',14,'vrouwelijk'),('Leia',10,'vrouwelijk'),('Mackenzie',10,'vrouwelijk'),('Trixie',11,'vrouwelijk'),('Hannah',9,'vrouwelijk'),('Kallie',5,'vrouwelijk'),('Maya',14,'vrouwelijk'),('Inez',15,'vrouwelijk'),('Gemma',8,'vrouwelijk'),('Priscilla',9,'vrouwelijk'),('Zoe',8,'vrouwelijk'),('Camilla',1,'vrouwelijk'),('Fiona',9,'vrouwelijk'),('Marley',11,'vrouwelijk'),('Betsy',12,'vrouwelijk'),('Bailey',8,'vrouwelijk'),('Gia',5,'vrouwelijk'),('Peanut',4,'vrouwelijk'),('Fern',4,'vrouwelijk'),('Tootsie',13,'vrouwelijk'),('Summer',11,'vrouwelijk'),('Gidget',3,'vrouwelijk'),('Brandy',1,'vrouwelijk'),('Peaches',1,'vrouwelijk'),('Sophie',11,'vrouwelijk'),('Cookie',14,'vrouwelijk'),('Ivy',1,'vrouwelijk'),('Mackenzie',10,'vrouwelijk'),('Sammie',9,'vrouwelijk'),('Sandy',8,'vrouwelijk'),('Callie',12,'vrouwelijk'),('Samantha',10,'vrouwelijk'),('Lola',2,'vrouwelijk'),('Angel',14,'vrouwelijk'),('Edie',12,'vrouwelijk'),('Diamond',5,'vrouwelijk'),('Bonnie',1,'vrouwelijk'),('Cinnamon',8,'vrouwelijk'),('Ella',12,'vrouwelijk'),('Brooklyn',14,'vrouwelijk'),('Miley',7,'vrouwelijk'),('Pebbles',5,'vrouwelijk'),('Hazel',3,'vrouwelijk'),('Peaches',7,'vrouwelijk'),('Bean',6,'vrouwelijk'),('Bianca',10,'vrouwelijk'),('Brandy',9,'vrouwelijk'),('Cleo',8,'vrouwelijk'),('Sam',9,'vrouwelijk'),('Precious',2,'vrouwelijk'),('Star',13,'vrouwelijk'),('Tessa',15,'vrouwelijk'),('Callie',6,'vrouwelijk'),('Daisy',15,'vrouwelijk'),('Darlene',9,'vrouwelijk'),('Madison',5,'vrouwelijk'),('Biscuit',4,'vrouwelijk'),('Lacy',8,'vrouwelijk'),('Destiny',4,'vrouwelijk'),('Olivia',6,'vrouwelijk'),('Allie',15,'vrouwelijk'),('Khloe',13,'vrouwelijk'),('Dolly',14,'vrouwelijk'),('Bonnie',6,'vrouwelijk'),('Blossom',7,'vrouwelijk'),('Jenna',14,'vrouwelijk'),('Violet',12,'vrouwelijk'),('Bean',13,'vrouwelijk'),('Anna',12,'vrouwelijk'),('Betty',12,'vrouwelijk'),('Destiny',3,'vrouwelijk'),('Nina',3,'vrouwelijk'),('Tilly',14,'vrouwelijk'),('Dana',10,'vrouwelijk'),('Ruby',14,'vrouwelijk'),('Fiona',3,'vrouwelijk'),('Brutus',8,'mannelijk'),('Nero',5,'mannelijk'),('Otto',13,'mannelijk'),('Rascal',9,'mannelijk'),('Kane',1,'mannelijk'),('Odie',9,'mannelijk'),('Ralph',9,'mannelijk'),('Tank',14,'mannelijk'),('Taz',2,'mannelijk'),('Kobe',5,'mannelijk'),('Dodge',4,'mannelijk'),('Aries',11,'mannelijk'),('Ned',11,'mannelijk'),('Alex',9,'mannelijk'),('Bo',10,'mannelijk'),('Eli',5,'mannelijk'),('Porter',2,'mannelijk'),('Duke',6,'mannelijk'),('Carter',13,'mannelijk'),('Casper',14,'mannelijk'),('Brutus',2,'mannelijk'),('Buddy',12,'mannelijk'),('Barkley',9,'mannelijk'),('Theo',5,'mannelijk'),('Maverick',12,'mannelijk'),('Buddy',9,'mannelijk'),('Taz',5,'mannelijk'),('Harvey',11,'mannelijk'),('Scout',5,'mannelijk'),('Rudy',13,'mannelijk'),('Trapper',15,'mannelijk'),('Buster',10,'mannelijk'),('Rocco',4,'mannelijk'),('Vinnie',1,'mannelijk'),('Murphy',13,'mannelijk'),('George',9,'mannelijk'),('Milo',11,'mannelijk'),('Kobe',2,'mannelijk'),('AJ',3,'mannelijk'),('Cash',11,'mannelijk'),('Eli',6,'mannelijk'),('Dane',9,'mannelijk'),('Theo',13,'mannelijk'),('Cash',7,'mannelijk'),('Nelson',3,'mannelijk'),('Luke',10,'mannelijk'),('Harvey',4,'mannelijk'),('Riley',6,'mannelijk'),('Tyson',9,'mannelijk'),('Gage',5,'mannelijk'),('Iggy',2,'mannelijk'),('Marley',7,'mannelijk'),('Fritz',15,'mannelijk'),('Bailey',14,'mannelijk'),('Porter',3,'mannelijk'),('King',10,'mannelijk'),('Snoopy',10,'mannelijk'),('Lewis',15,'mannelijk'),('Levi',1,'mannelijk'),('Leo',10,'mannelijk'),('Vince',2,'mannelijk'),('Trapper',13,'mannelijk'),('Kobe',11,'mannelijk'),('Simba',11,'mannelijk'),('Zeus',3,'mannelijk'),('Flash',15,'mannelijk'),('Watson',6,'mannelijk'),('Benji',3,'mannelijk'),('Frankie',15,'mannelijk'),('Dane',3,'mannelijk'),('Finn',1,'mannelijk'),('Coco',8,'mannelijk'),('Bailey',11,'mannelijk'),('Storm',11,'mannelijk'),('Griffin',2,'mannelijk'),('Zeus',13,'mannelijk'),('Boomer',15,'mannelijk');
/*!40000 ALTER TABLE `Honden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kledingstukken`
--

DROP TABLE IF EXISTS `Kledingstukken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Kledingstukken` (
  `Nummer` int(11) NOT NULL,
  `Type` enum('polo','broek','trui') DEFAULT NULL,
  `Formaat` enum('small','medium','large') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kledingstukken`
--

LOCK TABLES `Kledingstukken` WRITE;
/*!40000 ALTER TABLE `Kledingstukken` DISABLE KEYS */;
INSERT INTO `Kledingstukken` VALUES (1,'polo','small'),(2,'polo','medium'),(3,'polo','large'),(4,'broek','small'),(5,'broek','medium'),(6,'broek','large'),(7,'trui','small'),(8,'trui','medium'),(9,'trui','large');
/*!40000 ALTER TABLE `Kledingstukken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-26  9:41:44
```

### de basis

We voegen een `Id` kolom toe aan de tabel `Boeken` die we als primaire sleutel gaan gebruiken.

Om een primaire sleutel toe te voegen aan een reeds bestaande tabel, gebruik je de DDL `ALTER TABLE` instructie in combinatie met een DDL `ADD` instructie:

```sql
ALTER TABLE Boeken ADD Id INT auto_increment PRIMARY KEY;
```

Sla die instructie op in 0056\_\_AlterBoeken.sql.

Je kan ook nagaan of de primaire sleutel is toegevoegd door het volgende statement uit te voeren:

```sql
SHOW COLUMNS FROM Boeken;
```

Het feit dat een kolom een primaire sleutel is, is een **constraint**. Men spreekt van een constraint als iets een beperking is. Als je een rij zou toevoegen met een `Id` waarvan de waarde reeds in een andere rij bestaat, krijg je een foutmelding. Een ander \(en reeds gekend\) voorbeeld van een constraint is `NOT NULL`. Deze constraint is zwakker dan de `PRIMARY KEY` constraint \(omdat NULL niet geschikt is om een rij te identificeren\), dus je hoeft ze nooit toe te voegen aan een kolom die dient als primaire sleutel.

## `AUTO_INCREMENT`

Het is beter om de `Id` door SQL zelf te laten toekennen. Zo hoef je niet telkens na te kijken welke waarde beschikbaar is voor `Id`. Om dat te doen, gebruik je de eigenschap `AUTO_INCREMENT`. Als je een nieuwe tabel maakt voeg je de eigenschap toe na de declaratie van de kolom. Zorg ervoor dat je op die kolom een primary key constraint hebt staan:

```sql
USE ModernWays;
CREATE TABLE Personen (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Voornaam varchar(255) char set utf8mb4 NOT NULL,
    Familienaam varchar(255) char set utf8mb4,
    Leeftijd int
);
```

Sla op als 0057\_\_CreatePersonen.sql.

Je kan de beginwaarde zelf bepalen. Bijvoorbeeld, als je de boeken wil nummeren vanaf 5 in plaats van 1 \(de default\):

```sql
ALTER TABLE Boeken AUTO_INCREMENT = 5;
```

Dit kan van pas komen als je al wat data hebt en SQL alleen voor de nieuwe data zelf de nummers wil laten genereren.

{% hint style="info" %}
Eerder hebben we `AUTO_INCREMENT` al gebruikt voor boeken. Bekijk eens wat er gebeurd was als je `AUTO_INCREMENT` in dat script achterwege had gelaten.
{% endhint %}

## Primary key constraints verwijderen

Een constraint behoort tot de definitie van de tabel, dus moet je DROP gebruiken:

```sql
USE ModernWays;
ALTER TABLE Boeken DROP PRIMARY KEY;
```

