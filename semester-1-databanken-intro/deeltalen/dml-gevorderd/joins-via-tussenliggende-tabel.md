# JOINs via tussenliggende tabel

We weten wel hoe we leden aan taken kunnen koppelen door middel van INNER JOIN, maar die aanpak werkt niet wanneer er meer dan twee tabellen nodig zijn om de data terug te combineren, zoals in het geval van releases van games op platformen.

Om entiteiten gekoppeld via een M-op-N-relatie aan elkaar te koppelen, moet je eerst de informatie langs de M-kant koppelen met de tabel die de relatie voorstelt en vervolgens de informatie langs de N-kant koppelen.

Bijvoorbeeld, als je een tabel `Publicaties` hebt die auteurs linkt aan boeken:

| Personen.Id | Boeken.Id |
| :--- | :--- |
| 1 | 1 |
| 1 | 2 |
| 1 | 3 |
| 2 | 1 |
| 2 | 2 |
| 2 | 3 |
| 3 | 1 |
| 3 | 2 |
| 4 | 1 |
| 4 | 2 |
| 4 | 3 |
| 4 | 4 |

We kunnen hieruit een tabel met twee kolommen afleiden die elke auteur koppelt aan elk van zijn boeken. Het idee hierachter:

* je combineert de tabel met auteurs, de tabel met boeken en de tabel met de vreemde sleutels
* je controleert dat de vreemde sleutel uit de combinatietabel verwijst naar de juiste auteur
* je controleert dat de vreemde sleutel uit de combinatietabel verwijst naar het juiste boek

Dit zou er zo uitzien:

```sql
SELECT Personen.Voornaam, Personen.Familienaam, Boeken.Titel
FROM Publicaties
     INNER JOIN Personen ON Publicaties.Personen_Id = Personen.Id
     INNER JOIN Boeken ON Publicaties.Boeken_Id = Boeken.Id
```

Probeer het uit! Gebruik hiervoor onderstaand calibratiescript \(0101\_\_CalibrateDB.sql\):

```text
-- MySQL dump 10.13  Distrib 8.0.16, for Linux (x86_64)
--
-- Host: localhost    Database: ModernWays
-- ------------------------------------------------------
-- Server version    8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Personen`
--
DROP DATABASE IF EXISTS ModernWays;
CREATE DATABASE ModernWays;
USE ModernWays;

DROP TABLE IF EXISTS `Personen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Personen` (
  `Voornaam` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Familienaam` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personen`
--

LOCK TABLES `Personen` WRITE;
/*!40000 ALTER TABLE `Personen` DISABLE KEYS */;
INSERT INTO `Personen` VALUES ('Samuel','Ijsseling',1),('Jacob','Van Sluis',2),('Emile','Benveniste',3),('Evert W.','Beth',4),('Rémy','Bernard',5),('Robert','Bly',6),('timothy','gowers',7),(NULL,'?',8),(NULL,'Ovidius',9),('Haruki','Murakami',10),('David','Mitchell',11),('Nick','Harkaway',12),('Thomas','Ligotti',13),('Neil','Gaiman',16),('Stephen','King',17),('Terry','Pratchett',18),('Peter','Straub',19);
/*!40000 ALTER TABLE `Personen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Boeken`
--

DROP TABLE IF EXISTS `Boeken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Boeken` (
  `Titel` varchar(200) DEFAULT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Boeken`
--

LOCK TABLES `Boeken` WRITE;
/*!40000 ALTER TABLE `Boeken` DISABLE KEYS */;
INSERT INTO `Boeken` VALUES ('Norwegian Wood',1),('Kafka on the Shore',2),('American Gods',3),('The Ocean at the End of the Lane',4),('Pet Sematary',5),('Good Omens',6),('The Talisman',7);
/*!40000 ALTER TABLE `Boeken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publicaties`
--

DROP TABLE IF EXISTS `Publicaties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Publicaties` (
  `Boeken_Id` int(11) NOT NULL,
  `Personen_Id` int(11) NOT NULL,
  KEY `fk_Publicaties_Boeken` (`Boeken_Id`),
  KEY `fk_Publicaties_Personen` (`Personen_Id`),
  CONSTRAINT `fk_Publicaties_Personen` FOREIGN KEY (`Personen_Id`) REFERENCES `Personen` (`Id`),
  CONSTRAINT `fk_Publicaties_Boeken` FOREIGN KEY (`Boeken_Id`) REFERENCES `Boeken` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publicaties`
--

LOCK TABLES `Publicaties` WRITE;
/*!40000 ALTER TABLE `Publicaties` DISABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Games`
--

DROP TABLE IF EXISTS `Games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Games` (
  `Titel` varchar(100) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Games`
--

LOCK TABLES `Games` WRITE;
/*!40000 ALTER TABLE `Games` DISABLE KEYS */;
INSERT INTO `Games` VALUES ('Anthem',1),('Sekiro: Shadows Die Twice',2),('Devil May Cry 5',3),('Mega Man 11',4),('Oregon Trail',5);
/*!40000 ALTER TABLE `Games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Leden`
--

DROP TABLE IF EXISTS `Leden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Leden` (
  `Voornaam` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Leden`
--

LOCK TABLES `Leden` WRITE;
/*!40000 ALTER TABLE `Leden` DISABLE KEYS */;
INSERT INTO `Leden` VALUES ('Yannick',1),('Bavo',2),('Max',3),('Herve',4);
/*!40000 ALTER TABLE `Leden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Platformen`
--

DROP TABLE IF EXISTS `Platformen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Platformen` (
  `Naam` varchar(20) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Platformen`
--

LOCK TABLES `Platformen` WRITE;
/*!40000 ALTER TABLE `Platformen` DISABLE KEYS */;
INSERT INTO `Platformen` VALUES ('PS4',1),('Xbox One',2),('Windows',3),('Nintendo Switch',4),('Master System',5);
/*!40000 ALTER TABLE `Platformen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Postcodes`
--

DROP TABLE IF EXISTS `Postcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Postcodes` (
  `Code` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Plaats` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Localite` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Provincie` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Province` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Postcodes`
--

LOCK TABLES `Postcodes` WRITE;
/*!40000 ALTER TABLE `Postcodes` DISABLE KEYS */;
INSERT INTO `Postcodes` VALUES ('2800','Mechelen','Malines','Antwerpen','Anvers'),('3000','Leuven','Louvain','Vlaams Brabant','Brabant Flamand');
/*!40000 ALTER TABLE `Postcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Releases`
--

DROP TABLE IF EXISTS `Releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Releases` (
  `Games_Id` int(11) NOT NULL,
  `Platformen_Id` int(11) NOT NULL,
  KEY `fk_Releases_Games` (`Games_Id`),
  KEY `fk_Releases_Platformen` (`Platformen_Id`),
  CONSTRAINT `fk_Releases_Games` FOREIGN KEY (`Games_Id`) REFERENCES `Games` (`Id`),
  CONSTRAINT `fk_Releases_Platformen` FOREIGN KEY (`Platformen_Id`) REFERENCES `Platformen` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Releases`
--

LOCK TABLES `Releases` WRITE;
/*!40000 ALTER TABLE `Releases` DISABLE KEYS */;
INSERT INTO `Releases` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(4,1),(4,2),(4,3),(4,4);
/*!40000 ALTER TABLE `Releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Taken`
--

DROP TABLE IF EXISTS `Taken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Taken` (
  `Omschrijving` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Leden_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Taken_Leden` (`Leden_Id`),
  CONSTRAINT `fk_Taken_Leden` FOREIGN KEY (`Leden_Id`) REFERENCES `Leden` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taken`
--

LOCK TABLES `Taken` WRITE;
/*!40000 ALTER TABLE `Taken` DISABLE KEYS */;
INSERT INTO `Taken` VALUES ('bestek voorzien',1,2),('frisdrank meebrengen',2,1),('aardappelsla maken',3,3);
/*!40000 ALTER TABLE `Taken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tweets`
--

DROP TABLE IF EXISTS `Tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Tweets` (
  `Bericht` varchar(144) DEFAULT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Users_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Tweets_Users` (`Users_Id`),
  CONSTRAINT `fk_Tweets_Users` FOREIGN KEY (`Users_Id`) REFERENCES `Users` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tweets`
--

LOCK TABLES `Tweets` WRITE;
/*!40000 ALTER TABLE `Tweets` DISABLE KEYS */;
INSERT INTO `Tweets` VALUES ('Don\'t forget -- Nintendo Labo: VR Kit launches 12/04!',1,1),('Splat it out in the #Splatoon2 EU Community Cup 5 this Sunday!',2,1),('Crikey! Keep an eye out for cardboard crocs and other crafty wildlife on this jungle train ride! #Yoshi',3,1),('You had a lot to say about #MetroExodus. Check out our favorite 5-word reviews.',4,2),('It\'s a perfect day for some mayhem.',5,2),('Drift all over N. Sanity Beach and beyond in Crash Team Racing Nitro-Fueled.',6,2);
/*!40000 ALTER TABLE `Tweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Users` (
  `Handle` varchar(144) DEFAULT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('NintendoEurope',1),('Xbox',2);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

insert into Publicaties(Personen_Id, Boeken_Id)
select  Personen.Id, Boeken.Id
from Personen inner join Boeken
where (Personen.Familienaam = 'Murakami' and Personen.Voornaam = 'Haruki' and Boeken.Titel = ('Norwegian Wood')) 
or (Personen.Familienaam = 'Murakami' and Personen.Voornaam = 'Haruki' and Boeken.Titel = ('Kafka on the Shore'))   
or (Personen.Familienaam = "Gaiman" and Personen.Voornaam = "Neil" and Boeken.Titel = "American Gods")
or (Personen.Familienaam = "Gaiman" and Personen.Voornaam = "Neil" and Boeken.Titel = "The Ocean at the End of the Lane")
or (Personen.Familienaam = "King" and Personen.Voornaam = "Stephen" and Boeken.Titel = "Pet Sematary") 
or (Personen.Familienaam = ("Pratchett") and Personen.Voornaam = ("Terry") and Boeken.Titel = "Good Omens")
or (Personen.Familienaam = ("Gaiman") and Personen.Voornaam = ("Neil") and Boeken.Titel = "Good Omens")
or (Personen.Familienaam = "King" and Personen.Voornaam = "Stephen" and Boeken.Titel = "The Talisman") 
or (Personen.Familienaam = "Straub" and Personen.Voornaam = "Peter" and Boeken.Titel = "The Talisman");
/*!40000 ALTER TABLE `Publicaties` ENABLE KEYS */;
```

