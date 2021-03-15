use ApDB;
-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: xchk.be    Database: ApDB
-- ------------------------------------------------------
-- Server version	8.0.19

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
  `Titel` varchar(100) NOT NULL,
  `Commentaar` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Voornaam` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Familienaam` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Categorie` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT (_utf8mb4'niet gecategoriseerd'),
  `IngevoegdDoor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Boeken`
--

LOCK TABLES `Boeken` WRITE;
/*!40000 ALTER TABLE `Boeken` DISABLE KEYS */;
INSERT INTO `Boeken` VALUES ('Filosofie',NULL,NULL,'Niet gekend','Niet gecategoriseerd',NULL),('Heideggers vraag naar de techniek',NULL,NULL,'Niet gekend','Niet gecategoriseerd',NULL),('Logicaboek',NULL,NULL,'Niet gekend','Niet gecategoriseerd',NULL);
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
  `Leeftijd` smallint unsigned NOT NULL,
  `Soort` varchar(50) NOT NULL,
  `Baasje` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Huisdieren`
--

LOCK TABLES `Huisdieren` WRITE;
/*!40000 ALTER TABLE `Huisdieren` DISABLE KEYS */;
INSERT INTO `Huisdieren` VALUES ('Ming',9,'hond','Christiane'),('Bientje',12,'kat','Esther'),('Misty',7,'hond','Vincent');
/*!40000 ALTER TABLE `Huisdieren` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kunstwerken`
--

DROP TABLE IF EXISTS `Kunstwerken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Kunstwerken` (
  `Artiest` varchar(100) DEFAULT NULL,
  `Titel` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kunstwerken`
--

LOCK TABLES `Kunstwerken` WRITE;
/*!40000 ALTER TABLE `Kunstwerken` DISABLE KEYS */;
/*!40000 ALTER TABLE `Kunstwerken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nummers`
--

DROP TABLE IF EXISTS `Nummers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Nummers` (
  `Titel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Artiest` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `Jaar` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nummers`
--

LOCK TABLES `Nummers` WRITE;
/*!40000 ALTER TABLE `Nummers` DISABLE KEYS */;
INSERT INTO `Nummers` VALUES ('John the Revelator','Larkin Poe','Blues','2017'),('Missionary Man','Ghost','Metal','2016');
/*!40000 ALTER TABLE `Nummers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-18  8:24:40
set sql_safe_updates = 0;
update Boeken
set Familienaam = 'Augustinus' where Titel = 'Filosofie';
update Boeken
set Voornaam = 'Gerard' where Titel like '%degger%';
update Boeken
set Voornaam = 'Diderik' where Titel like 'Logica%';
set sql_safe_updates = 1;
insert into Boeken (Titel, Commentaar, Voornaam, Familienaam, Categorie)
values 
('Blochs blog','internetarchief','Cornelius','Bloch','Knipsels'),
('Leren rekenen','didactisch boek',NULL,'Bernard','Wiskunde'),
('De stad van God',NULL,NULL,'Haste','Fictie');