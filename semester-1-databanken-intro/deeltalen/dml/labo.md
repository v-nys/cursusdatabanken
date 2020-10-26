# Labo

## Oefeningen

**Voor je deze oefeningen maakt, gebruik je onderstaand script om zeker te zijn dat je databank in de gewenste toestand is.**

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
-- Table structure for table `Huisdieren`
--

DROP TABLE IF EXISTS `Huisdieren`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Huisdieren` (
  `Naam` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Leeftijd` smallint(5) unsigned NOT NULL,
  `Soort` varchar(50) NOT NULL,
  `Baasje` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Huisdieren`
--

LOCK TABLES `Huisdieren` WRITE;
/*!40000 ALTER TABLE `Huisdieren` DISABLE KEYS */;
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
  `Album` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Liedjes`
--

LOCK TABLES `Liedjes` WRITE;
/*!40000 ALTER TABLE `Liedjes` DISABLE KEYS */;
INSERT INTO `Liedjes` VALUES ('John the Revelator','Larkin Poe','2017','Peach'),('Missionary Man','Ghost','2016','Popestar');
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

-- Dump completed on 2019-10-13 16:32:53
```

Sla dit op als 0509\_\_CalibrateDB.sql in je map met scripts.

## Deel 1

### nummers

Schrijf een script dat volgende nummers toevoegt aan je tabel, `Liedjes`. Ze worden gegeven in het formaat "titel / artiest / album / jaar":

* Stairway to Heaven / Led Zeppelin / Led Zeppelin IV / 1971
* Good Enough / Molly Tuttle / Rise / 2017
* Outrage for the Execution of Willie McGee / Goodnight, Texas / Conductor / 2018
* They Lie / Layla Zoe / The Lily / 2013
* It Ain't You / Danielle Nicole / Wolf Den / 2015
* Unchained / Van Halen / Fair Warning / 1981

Sla op als 0510\_\_Oefening.sql.

### huisdieren

Doe hetzelfde voor een tabel `Huisdieren`, met volgende gegevens. Ze worden gegeven in het formaat "baasje / naam / leeftijd / soort":

* Vincent / Misty / 6 / hond
* Christiane / Ming / 8 / hond
* Esther / Bientje / 6 / kat
* Jommeke / Flip / 75 / papegaai
* Villads / Berto / 1 / papegaai
* Bert / Ming / 7 / kat
* Thaïs / Suerta / 2 / hond
* Lyssa / Фёдор / 1 / hond

Sla op als 0511\_\_Oefening.sql.

### nummers tonen

Schrijf een script, 0512\_\_Oefening.sql, dat alle info over liedjes toont.

### huisdieren tonen

Schrijf een script, 0513\_\_Oefening.sql, dat de naam en soort van elk dier toont, maar niet de leeftijd of het baasje.

### sorteren

Schrijf een script, 0514\_\_Oefening.sql, dat \(alleen!\) de titels van liedjes toont, gaande van het oudste nummer tot het recentste nummer.

### gedetailleerd sorteren

Schrijf een script, 0515\_\_Oefening.sql, dat alle info over huisdieren toont, maar de huisdieren alfabetisch ordent volgens naam en, indien de naam dezelfde is, alfabetisch sorteert volgens soort.

### omschrijvingen tonen

Schrijf een script, 0516\_\_Oefening.sql, dat per dier een tabel met één kolom, een omschrijving, toont. Deze heeft volgende vorm, inclusief de juiste hoofding:

| Omschrijving |
| :--- |
| Misty de hond |
| Ming de hond |
| Bientje de kat |
| Flip de papegaai |
| Berto de papegaai |
| Ming de kat |
| Suerta de hond |
| Фёдор de hond |

### afronden

Wanneer je klaar bent, voer dan de gewoonlijke commando's uit om je scripts te delen:

```text
git add --all
git commit -m "Scripts DML"
git push
```

Ze hierna je database terug zoals ze was na de theorieles met het script van het einde van vorige labosessie.

## Deel 2

### gedetailleerd filteren

Schrijf een script, 0517\_\_Oefening.sql, dat alle nummers \(alle kolommen\) toont die uitgekomen zijn in een jaar dat eindigt op `1`. Tip: gebruik `WHERE` in combinatie met een functie.

### informatie toevoegen

Schrijf een script, 0518\_\_Oefening.sql, dat volgende zaken doet:

* een niet-verplichte kolom `Geluid` toevoegen aan de tabel met huisdieren, die tekst \(tot 20 karakters uit het Engels\) kan bevatten
  * tip: dit is een DDL-statement, dus kijk terug naar de DDL indien nodig
* het geluid van alle honden aanpast naar `"WAF!"`
* het geluid van alle katten aanpast naar `"miauwww..."`

### nog informatie toevoegen

Schrijf een script, 0519\_\_Oefening.sql, dat volgende zaken doet:

* de niet-verplichte kolom `Genre` terug toevoegt aan de tabel met nummers \(tot 20 karakters uit het Engels\)
* met **maximum één** `UPDATE`-operatie alle nummers van Led Zeppelin en Van Halen aanduidt als `Hard Rock`

### wissen

Schrijf een script, 0520\_\_Oefening.sql, dat alle nummers wist \(maar de tabelstructuur bewaart\).

### meer wissen

Schrijf een script, 0521\_\_Oefening.sql, dat alle papegaaien wist.

### afronden

Wanneer je klaar bent, voer dan de gewoonlijke commando's uit om je scripts te delen:

```text
git add --all
git commit -m "Scripts DML"
git push
```

Ze hierna je database terug zoals ze was na de theorieles met het script van het einde van vorige labosessie.

