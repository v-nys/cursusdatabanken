# Labo

## Calibratie

Start vanaf onderstaand script, 0548\_\_CalibrateDB.sql:

```sql
DROP DATABASE IF EXISTS `ModernWays`;
CREATE DATABASE  IF NOT EXISTS `ModernWays` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ModernWays`;
-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: ModernWaysBL
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
INSERT INTO `Boeken` VALUES ('Aurelius','Augustinus',NULL,NULL,NULL,NULL,NULL,NULL,'Metafysica',NULL),('Stephen','Hawking','Antwoorden op de grote vragen',NULL,NULL,NULL,NULL,NULL,'Filosofie',NULL),('William','Dunham','Journey through Genius: The Great Theorems of Mathematics',NULL,NULL,NULL,NULL,NULL,'Wiskunde',NULL),('Evert Willem','Beth','Mathematical Thought',NULL,'2010',NULL,NULL,NULL,'Filosofie',NULL),('Jef','B','Het Boek',NULL,'2015',NULL,NULL,NULL,'Filosofie',NULL),('Mathijs','Degrote','Leren werken met SQL',NULL,NULL,NULL,NULL,'Kan nooit kwaad','Informatica',NULL),('Mathijs','Degrote','Leren werken met HTML en CSS',NULL,NULL,NULL,NULL,'Kan nooit kwaad','Informatica',NULL),('Mathijs','Degrote','Leren werken met Javascript',NULL,NULL,NULL,NULL,'Kan nooit kwaad','Informatica',NULL),('Tom','Van Wommel','Auteursrecht',NULL,NULL,NULL,NULL,'Nuttig om te weten','Recht',NULL),('Kris','Van Laer','Schaken',NULL,NULL,NULL,NULL,'Veel goede tips','Entertainment',NULL),('Ellen','Reynaert','Het criminele brein',NULL,NULL,NULL,NULL,NULL,'Psychologie',NULL),('Céline','Claus','De verwondering','Antwerpen','1970','Manteau',NULL,NULL,'Filosofie',NULL),('Celine','Raes','Jagen en gejaagd worden','Antwerpen','1954','De Bezige Bij',NULL,NULL,'Filosofie',NULL),('CELINE','Sarthe','Het zijn en het niets','Parijs','1943','Gallimard',NULL,NULL,'Filosofie',NULL),(NULL,'?','Beowulf',NULL,'0975',NULL,NULL,NULL,'Mythologie',NULL),(NULL,'Ovidius','Metamorfosen',NULL,'8',NULL,NULL,NULL,'Mythologie',NULL);
/*!40000 ALTER TABLE `Boeken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Huisdieren`
--

DROP TABLE IF EXISTS `Huisdieren`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Liedjes` (
  `Titel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Artiest` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Jaar` char(4) DEFAULT NULL,
  `Album` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Aantalbeluisteringen` int(11) DEFAULT '0'
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
/*!40101 SET character_set_client = utf8 */;
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

-- Dump completed on 2019-11-27 11:14:28
```

## primaire sleutels

### Oefening 1

Schrijf een script, 0549\_\_Oefening.sql, dat de tabel `Huisdieren` voorziet van een primaire sleutel. Deze begint vanaf 1 en is van het type `INT`.

### Oefening 2

Maak een nieuwe tabel, `Baasjes`, met één "gewone" kolom voor de naam van het baasje. Deze kolom heeft dezelfde eigenschappen als de bestaande kolom `Baasje` in de tabel `Huisdieren`. Om deze te achterhalen: rechterklik op `Huisdieren`, gebruik "table inspector" en lees het type af, check of `NULL` toegestaan is en let op de karakterset. Op andere zaken hoef je nu niet te letten. De tabel heeft ook een primaire sleutel die de gewoonlijke conventies voor primaire sleutelkolommen volgt. Noem het script om de tabel te maken 0550\_\_Oefening.sql.

### Oefening 3

Lees alle baasjes af uit de tabel met huisdieren en vul op basis hiervan de tabel `Baasjes` in, zodat de primaire sleutelwaarden automatisch bepaald worden door MySQL. Noem dit script 0551\_\_Oefening.sql.

## vreemde sleutels

We zullen hier de kolom `Baasje` wegwerken uit de tabel `Huisdieren` en in een eigen tabel plaatsen, die een één-op-één verband vertoont met `Huisdieren`. We zullen dit doen door meerdere stappen te doorlopen.

### Oefening 1

Voeg een kolom toe aan de tabel `Baasjes` die je zal gebruiken om naar de tabel `Huisdieren` te verwijzen. Volg hierbij de conventies rond vreemde sleutels. Voorlopig moet je een `NULL`-waarde toestaan. Noem dit 0552\_\_Oefening.sql.

### Oefening 2

Vul de juiste waarden in in de kolom die je net hebt toegevoegd. Je mag dit voorlopig doen zoals je zelf wil, als het juiste baasje maar naar het juiste dier verwijst. Noem dit 0553\_\_Oefening.sql.

### Oefening 3

Wis de kolom `Baasje` uit de tabel `Huisdieren`. Noem dit 0554\_\_Oefening.sql.

## combineren

### Oefening 1

Toon alle mogelijke combinaties gegevens over een huisdier en gegevens over een baasje. Het resultaat moet er zo uitzien:

| Naam | Leeftijd | Soort | Geluid | Id | Naam | Id | Huisdieren\_Id |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| waarde | waarde | waarde | waarde | waarde | waarde | waarde |  |

Dit resultaat bevat ook rijen waarin baasje en huisdier **niet** bij elkaar horen. Noem het script 0555\_\_Oefening.sql.

### Oefening 2

Toon nu de combinaties van namen van huisdieren en name van baasjes in volgend formaat:

| Naam huisdier | Naam baasje |
| :--- | :--- |
| waarde | waarde |

Noem je script 0556\_\_Oefening.sql.

Proficiat! Je hebt een 1-op-1 relatie gemaakt en gebruikt!

## vreemde sleutels, deel 2

Nu gaan we artiesten in een eigen tabel plaatsen, omdat het eigenlijk ook entiteiten zijn.

### Oefening 1

Schrijf een script, 0557\_\_Oefening.sql, dat een tabel `Artiesten` maakt. Artiesten hebben een naam met dezelfde eigenschappen als de kolom `Artiest` uit de tabel `Liedjes`. Ze hebben ook een primary key met de gebruikelijke conventies. Doe dit zoals je de tabel `Baasjes` hebt aangemaakt.

### Oefening 2

Schrijf een script, 0558\_\_Oefening.sql, dat alle artiesten uit de tabel `Liedjes` invoegt in de nieuwe tabel `Artiesten`.

### Oefening 3

Voeg met 0559\_\_Oefening.sql een vreemde sleutel toe aan de tabel `Liedjes`, zodat van een liedje naar een artiest kan worden verwezen. Voorlopig mag deze kolom de waarde `NULL` bevatten. Volg de afspraken rond vreemde sleutels.

### Oefening 4

Vul met 0560\_\_Oefening.sql de waarden voor de vreemde sleutelkolom van `Liedjes` in. Je mag dit doen op een manier naar eigen keuze.

### Oefening 5

Wis de kolom `Artiest` uit de tabel `Liedjes`. Noem je script 0561\_\_Oefening.sql.

### Oefening 6

Toon alle mogelijke combinaties gegevens over een liedje en gegevens over een artiest. Noem je script 0562\_\_Oefening.sql.

### Oefening 7

Toon nu de combinaties van artiesten en hun liedjes in volgend formaat:

| Artiest | Titel |
| :--- | :--- |
| waarde | waarde |

Noem je script 0563\_\_Oefening.sql.

Proficiat! Je hebt een 1-op-N relatie gemaakt en gebruikt!

