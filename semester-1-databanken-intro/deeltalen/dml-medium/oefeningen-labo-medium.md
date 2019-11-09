# Labo-oefeningen medium

## Oefeningen

Voor je deze oefeningen maakt, gebruik je onderstaand script om te garanderen dat je database in de gewenste toestand is en noem je het 0522\_\_CalibrateDB.sql:

```sql
DROP DATABASE IF EXISTS ModernWays;
CREATE DATABASE IF NOT EXISTS `ModernWays` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
INSERT INTO `Huisdieren` VALUES
('Misty',6,'hond','Vincent','WAF!'),
('Ming',8,'hond','Christiane','WAF!'),
('Bientje',6,'kat','Esther','miauwww...'),
('Ming',7,'kat','Bert','miauwww...'),
('Suerta',2,'hond','Thaïs','WAF!'),
('Aran',6,'hond','Thaïs','WAF!'),
('Mojo',12,'hond','Thaïs','WAF!'),
('Bollie',14,'kat','Truus','miauwww...'),
('Фёдор',1,'hond','Lyssa','WAF!');
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
  `Genre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Liedjes`
--

LOCK TABLES `Liedjes` WRITE;
/*!40000 ALTER TABLE `Liedjes` DISABLE KEYS */;
INSERT INTO Liedjes(Titel, Artiest, Album, Jaar)
VALUES
('Stairway to Heaven','Led Zeppelin','Led Zeppelin IV','1971'),
('Rock and Roll','Led Zeppelin','Led Zeppelin IV','1971'),
('Riders on the Storm','The Doors','L.A. Woman','1971'),
('Good Enough','Molly Tuttle','Rise','2017'),
('Outrage for the Execution of Willie McGee','Goodnight, Texas','Conductor','2018'),
('They Lie','Layla Zoe','The Lily','2013'),
('Green Eyed Lover','Layla Zoe','The Lily','2013'),
('Why You So Afraid','Layla Zoe','The Lily','2013'),
('It Ain''t You','Danielle Nicole','Wolf Den','2015'),
('Unchained','Van Halen','Fair Warning','1981');
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
INSERT INTO `Boeken` VALUES
('Aurelius','Augustinus',NULL,NULL,NULL,NULL,NULL,NULL,'Metafysica',NULL),
('Diderik','Batens','Logicaboek','','1999','','','','Metafysica',''),
('Stephen','Hawking','The Nature of Space and Time',NULL,'1996',NULL,NULL,NULL,'Wiskunde',NULL),
('Stephen','Hawking','Antwoorden op de grote vragen',NULL,NULL,NULL,NULL,NULL,'Filosofie',NULL),
('William','Dunham','Journey through Genius: The Great Theorems of Mathematics',NULL,NULL,NULL,NULL,NULL,'Wiskunde',NULL),
('William','Dunham','Euler: The Master of Us All',NULL,'1999',NULL,NULL,'Te lezen','Geschiedenis',NULL),
('Evert Willem','Beth','Mathematical Thought',NULL,'2010',NULL,NULL,NULL,'Filosofie',NULL),
('Jef','B','Het Boek',NULL,'2015',NULL,NULL,NULL,'Filosofie',NULL),
('Mathijs','Degrote','Leren werken met SQL',NULL,NULL,NULL,NULL,'Kan nooit kwaad','Informatica',NULL),
('Tom','Van Wommel','Auteursrecht',NULL,NULL,NULL,NULL,'Nuttig om te weten','Recht',NULL),
('Kris','Van Laer','Schaken',NULL,NULL,NULL,NULL,'Veel goede tips','Entertainment',NULL),
('Ellen','Reynaert','Het criminele brein',NULL,NULL,NULL,NULL,NULL,'Psychologie',NULL);
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

## Booleaanse expressies

### Oefening 1

Schrijf een script, 0523\_\_Oefening.sql, dat de hond van Christiane en de kat van Bert allebei 9 jaar oud maakt.

### Oefening 2

Schrijf een script, 0524\_\_Oefening.sql, dat alle honden van Thaïs en katten van Truus wist.

### Oefening 3

Schrijf een script, 0525\_\_Oefening.sql, dat de zin "X is de naam van een hond" produceert voor elke hond in de database. De resultaten van je opdracht worden weergegeven in een tabel met één kolom, met als hoofding "Bewering".

## vergelijkingen

### Oefening 1

Door de naam van een te controleren kolom te laten volgen door `COLLATE (een-of-andere-collation)` behandel je vergelijkingen alsof de kolom een andere collation heeft. Zo levert `'hello' COLLATE utf8mb4_0900_ai_ci = 'HélLô'` het resultaat `TRUE`

Voorspel wat volgende code zal doen bij collation utf8mb4\_0900\_as\_ci:

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
select * from Boeken where Voornaam = 'Celine';
```

Pas vervolgens de code aan zodat je enkel en alleen het boek van Raes te zien krijgt. Sla op als 0526\_\_Oefening.sql.

### Oefening 2

Schrijf een script, 0527\_\_Oefening.sql, dat alle auteurs selecteert waarvan de familienaam begint met 'B', maar niet met iets anders, **zonder gebruik te maken van `LIKE`**.

### Oefening 3

Schrijf een script, 0528\_\_Oefening.sql, dat alle boeken selecteert die ten laatste zijn uitgekomen in 1999, **zonder gebruik te maken van `LIKE`**.

### Oefening 4

Voeg met een script 0529\_\_Oefening.sql volgende twee boeken toe, exact zoals gegeven \(laat andere kolommen weg\):

| Familienaam | Titel | Verschijningsjaar | Categorie |
| :--- | :--- | :--- | :--- |
| ? | Beowulf | 0975 | Mythologie |
| Ovidius | Metamorfosen | 8 | Mythologie |

Vraag dan alle boeken op die verschenen zijn voor '0976' in 0530\_\_Oefening.sql. Probeer uit en vraag uitleg \(eventueel via het discussieforum\) als het resultaat niet is wat je verwacht!

### Oefening 5

Toon met een script, 0531\_\_Oefening.sql, alle boeken zonder commentaar waarvan de auteur een achternaam heeft die met een letter vanaf "D" begint.

## Sorteren

Toon met script 0532\_\_Oefening.sql een overzicht van alle muzieknummers, geordend volgens releasejaar \(van nieuw naar oud\), artiest \(van A tot Z\) en lengte van de titel \(van lang naar kort\). Dit laatste kan je bereiken met de `LENGTH`-functie, die vergelijkbaar is met `CONCAT` en `SUBSTRING` maar slechts één invoer heeft.

## Like

### Oefening 1

Schrijf een script, 0533\_\_Oefening.sql, waarmee alle kolommen van alle boeken gezocht worden waarvoor 'van' voorkomt in de familienaam van de auteur. Dit kan met een kleine letter of een hoofdletter zijn.

### Oefening 2

Schrijf een script, 0534\_\_Oefening.sql, waarmee alle kolommen van alle boeken gezocht worden waarvan de familienaam van de auteur begint met een A, R of C.

### Oefening 3

Schrijf een script, 0535\_\_Oefening.sql, waarmee alle boeken gewist worden die verschenen zijn in de jaren 90 van de vorige eeuw.

