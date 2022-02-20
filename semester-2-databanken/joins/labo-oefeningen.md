# Labo oefeningen

## Calibratie

Start vanaf onderstaand script, 0500\_\_CalibrateDB.sql:

```sql
-- MySQL dump 10.13  Distrib 8.0.16, for Linux (x86_64)
--
-- Host: localhost    Database: ApDB
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
-- Table structure for table `Auteurs`
--
DROP DATABASE if exists ApDB;
CREATE DATABASE ApDB;
USE ApDB;

DROP TABLE IF EXISTS `Auteurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Auteurs` (
  `Voornaam` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Familienaam` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auteurs`
--

LOCK TABLES `Auteurs` WRITE;
/*!40000 ALTER TABLE `Auteurs` DISABLE KEYS */;
INSERT INTO `Auteurs` VALUES ('Samuel','Ijsseling',1),('Jacob','Van Sluis',2),('Emile','Benveniste',3),('Evert W.','Beth',4),('R├®my','Bernard',5),('Robert','Bly',6),('timothy','gowers',7),(NULL,'?',8),(NULL,'Ovidius',9),('Haruki','Murakami',10),('David','Mitchell',11),('Nick','Harkaway',12),('Thomas','Ligotti',13),('Neil','Gaiman',16),('Stephen','King',17),('Terry','Pratchett',18),('Peter','Straub',19);
/*!40000 ALTER TABLE `Auteurs` ENABLE KEYS */;
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
-- Table structure for table `BoekenNaarAuteurs`
--

DROP TABLE IF EXISTS `BoekenNaarAuteurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `BoekenNaarAuteurs` (
  `Boeken_Id` int(11) NOT NULL,
  `Auteurs_Id` int(11) NOT NULL,
  KEY `fk_BoekenNaarAuteurs_Boeken` (`Boeken_Id`),
  KEY `fk_BoekenNaarAuteurs_Auteurs` (`Auteurs_Id`),
  CONSTRAINT `fk_BoekenNaarAuteurs_Auteurs` FOREIGN KEY (`Auteurs_Id`) REFERENCES `Auteurs` (`Id`),
  CONSTRAINT `fk_BoekenNaarAuteurs_Boeken` FOREIGN KEY (`Boeken_Id`) REFERENCES `Boeken` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BoekenNaarAuteurs`
--

LOCK TABLES `BoekenNaarAuteurs` WRITE;
/*!40000 ALTER TABLE `BoekenNaarAuteurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `BoekenNaarAuteurs` ENABLE KEYS */;
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
  `Leden_Id` int(11),
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
INSERT INTO `Taken` VALUES ('bestek voorzien',1,2),('frisdrank meebrengen',2,1),('aardappelsla maken',3,3),('papieren bordjes meebrengen',4,null);
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
```

## Veel-op-veel-relaties

### Oefening 1

Merk op dat er tabellen zijn met de namen `Boeken` en tabel `Auteurs`. Gebruik volgende informatie om de tabel `BoekenNaarAuteurs` in te vullen met 0501\_\_Oefening.sql:

* Haruki Murakami schreef Norwegian Wood en Kafka on the Shore
* Neil Gaiman schreef American Gods en The Ocean at the End of the Lane
* Terry Pratchett en Neil Gaiman schreven **samen** Good Omens

{% hint style="info" %}
Tip: zoek eerst de primary key van de auteur en van het boek in `Auteurs` en in `Boeken`. Maak dan in `BoekenNaarAuteurs` een rij aan die de twee aan elkaar linkt.
{% endhint %}

### Tussenstappen

Noem volgend script 0502\_\_Oefening.sql en voer uit:

```sql
USE ApDB;

ALTER TABLE Releases
add Datum DATE;
```

Noem volgend script het 0503\_\_Oefening.sql en voer uit. Je hoeft het niet helemaal te begrijpen.:

```sql
USE ApDB;

UPDATE Releases, Games
SET Datum = '2019-02-22'
WHERE Games.Titel = 'Anthem' AND Releases.Games_Id = Games.Id;

UPDATE Releases, Games
SET Datum = '2019-03-22'
WHERE Games.Titel = 'Sekiro: Shadows Die Twice' AND Releases.Games_Id = Games.Id;

UPDATE Releases, Games
SET Datum = '2019-03-08'
WHERE Games.Titel = 'Devil May Cry 5' AND Releases.Games_Id = Games.Id;

UPDATE Releases, Games
SET Datum = '2018-10-02'
WHERE Games.Titel = 'Mega Man 11' AND Releases.Games_Id = Games.Id;
```

### Oefening 2

Schrijf zelf een tabel, `Uitleningen`, die leden koppelt aan boeken die ze hebben uitgeleend in de bibliotheek. Een uitlening heeft een verplichte startdatum en **eventueel** (dus niet verplicht) een einddatum. Deze datums stel je voor met het `DATE`-datatype. Noem het script dat deze tabel aanmaakt 0504\_\_Oefening.sql.

### Oefening 3

Schrijf een script, 0505\_\_Oefening.sql, dat volgende informatie in de databank plaatst:

* Max heeft Norwegian Wood geleend van 1 februari 2019 tot 15 februari 2019.
* Bavo heeft Norwegian Wood geleend van 16 februari 2019 tot 2 maart 2019.
* Bavo heeft Pet Sematary geleend van 16 februari 2019 tot 2 maart 2019.
* Yannick heeft Pet Sematary geleend van 1 mei 2019 en heeft het boek nog niet teruggebracht.

## Tabellen samenvoegen bij veel-op-veel relaties

### Opfrissing eerste semester

We hebben een tabel die bijhoudt wanneer een bepaalde videogame is uitgebracht op een bepaald platform. Die ziet er zo uit:

| Games.Id | Platformen.Id | Releasedatum     |
| -------- | ------------- | ---------------- |
| 1        | 1             | 22 februari 2019 |
| 1        | 2             | 22 februari 2019 |
| 1        | 3             | 22 februari 2019 |
| 2        | 1             | 22 maart 2019    |
| 2        | 2             | 22 maart 2019    |
| 2        | 3             | 22 maart 2019    |
| 3        | 1             | 8 maart 2019     |
| 3        | 2             | 8 maart 2019     |
| 4        | 1             | 2 oktober 2018   |
| 4        | 2             | 2 oktober 2018   |
| 4        | 3             | 2 oktober 2018   |
| 4        | 4             | 2 oktober 2018   |

Als we deze tabel willen ontcijferen, d.w.z. als we de namen van de games en de platformen willen zien, combineren we deze tabel `Releases` eerst met de tabel `Platformen` en vervolgens met de tabel `games`. Dat ziet er zo uit:

```sql
SELECT Games.Titel, Platformen.Naam
FROM Releases
     INNER JOIN Platformen ON Releases.Platformen_Id = Platformen.Id
     INNER JOIN Games ON Releases.Games_Id = Games.Id
```

### Oefening 4

Toon nu zelf het overzicht van wie welk boek heeft uitgeleend en in welke periode. Doe dit in script 0506\_\_Oefening.sql. Gebruik `coalesce` om duidelijk aan te geven wanneer een boek nog niet is teruggebracht en zorg dat de kolomtitel leesbaar is met `as`.

| Persoon | Boek           | Startdatum      | Einddatum              |
| ------- | -------------- | --------------- | ---------------------- |
| Max     | Norwegian Wood | 1 februari 2019 | 15 februari 2019       |
| ...     | ...            | ...             | ...                    |
| Yannick | Pet Sematary   | 1 mei 2019      | nog niet teruggebracht |

## Andere soorten JOINs

### Oefening 5

Toon alle taken, met het lid dat de taak uitvoert. Als de taak door niemand wordt uitgevoerd, staat er "taak niet toegewezen". **Maak voor jezelf eerst de tekening met overlappende cirkels zodat je weet hoe je dit kan uitschrijven, zoals in de theorie.** Gebruik `COALESCE` en `AS om` je output leesbaar te maken, zoals in de voorbeeldoutput hieronder:

| Voornaam             | Omschrijving                |
| -------------------- | --------------------------- |
| Yannick              | frisdrank meebrengen        |
| Bavo                 | bestek voorzien             |
| Max                  | aardappelsla maken          |
| Taak niet toegewezen | papieren bordjes meebrengen |

Noem het script 0507\_\_Oefening.sql.

### Oefening 6

Toon alle titels van games met hun bijbehorend platform, als er een is. Toon ook games waarvoor het platform niet meer ondersteund wordt (d.w.z. waarvoor geen info in `Releases` staat). Gebruik hiervoor een samenstelling van twee JOINs. Gebruik opnieuw `COALESCE` en `AS` voor mooiere output. Noem het script 0508\_\_Oefening.sql.

Voorbeeldoutput:

| Titel        | Naam                           |
| ------------ | ------------------------------ |
| Anthem       | PS4                            |
| Anthem       | XBox one                       |
| Anthem       | Windows                        |
| ...          | ...                            |
| Mega Man 11  | Switch                         |
| Oregon Trail | Platform niet meer ondersteund |

{% hint style="info" %}
Tip: **Probeer dit niet in één keer.** Koppel eerst releases aan platformen. Controleer je output. Plaats het deel van de query dat deze koppeling doet tussen haakjes. Dit deel kan je nu ook zien als een cirkel in de tekening voor de verschillende soorten joins. Denk dan na over de tekening om ook games te betrekken en schrijf daarna pas de volledige query.
{% endhint %}

### Oefening 7

Er is een tabel `Taken` en een tabel `Leden`. Bij taken staat (door middel van een verwijzing) welk lid een bepaalde taak uitvoert. Toon nu alle taken die niet aan iemand zijn toegewezen. Noem je script 0509\_\_Oefening.sql. (Doe dit met stof die tot hiertoe aan bod is gekomen, niet met constructies die we nog niet gezien hebben.)

### Oefening 8

Toon alle platformen waarvoor games beschikbaar zijn. Een platform wordt dus niet getoond als er geen games beschikbaar voor zijn, maar verschijnt zodra er minstens één game voor is. Noem je script 0510\_\_Oefening.sql. (Doe dit met stof die tot hiertoe aan bod is gekomen, niet met constructies die we nog niet gezien hebben.)

### Oefening 9

Toon alle games waarvoor het platform onbekend is, samen met alle platformen waarvoor geen games beschikbaar zijn. Het resultaat ziet er als volgt uit:

| Titel             | Naam                   |
| ----------------- | ---------------------- |
| Oregon Trail      | Geen platformen gekend |
| Geen games gekend | Master System          |

Noem je script 0511\_\_Oefening.sql. (Doe dit met stof die tot hiertoe aan bod is gekomen, niet met constructies die we nog niet gezien hebben.)
