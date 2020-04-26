DROP DATABASE IF EXISTS `ModernWays`;
CREATE DATABASE `ModernWays`;
USE `ModernWays`;

CREATE TABLE `Boeken` (
  `Id` int NOT NULL AUTO_INCREMENT primary key,
  `Voornaam` varchar(25) DEFAULT NULL,
  `Familienaam` varchar(50) NOT NULL,
  `Titel` varchar(255) NOT NULL,
  `Stad` varchar(100) DEFAULT NULL,
  `Uitgeverij` varchar(100) DEFAULT NULL,
  `Verschijningsdatum` char(4) DEFAULT NULL,
  `Herdruk` char(4) DEFAULT NULL,
  `Commentaar` varchar(500) DEFAULT NULL,
  `Categorie` varchar(40) DEFAULT NULL
);

--
-- Dumping data for table `Boeken`
--

INSERT INTO `Boeken` VALUES (1,'Samuel','Ijsseling','Heidegger. Denken en Zijn. Geven en Danken','Amsterdam','','2014','','Nog te lezen','Filosofie'),(2,'Jacob','Van Sluis','Lees wijzer bij Zijn en Tijd','','Budel','1998','','Goed boek','Filosofie');
insert into `Boeken` (Voornaam,Familienaam,Titel,Stad,Uitgeverij,Verschijningsdatum,Herdruk,Commentaar,Categorie)
values
('Emile','Benveniste','Le vocabulaire des institutions Indo-Européennes','Paris?','Les éditions de minuit',1969,'?','Een goed geschiedenis boek','Linguistiek'),
('Evert W.','Beth','De Wijsbegeerte der Wiskunde. Van Parmenides tot Bolzano','Antwerpen','Philosophische Biliotheek Uitgeversmij. N.V. Standaard-Boekhandel',1944,'?','Een goed boek','Filosofie'),
('Evert W.','Beth','Wijsbegeerte der Wiskunde','Antwerpen','Philosophische Biliotheek Uitgeversmij. N.V. Standaard-Boekhandel',1948,'?','Een goed boek','Wiskunde'),
('Rémy','Bernard','Antonin le Pieux. Le siècle d''or de Rome 138-161','?','Librairie Arthme Fayard',2005,'?','Een goed boek','Geschiedenis'),
('Marc','Bloch','Rois et serfs et autres écrits sur le servage','Paris','La boutique de l''histoire',1996,'?','Een goed boek','Geschiedenis'),
('Pierre','Bonte en Michel Izard','Dictionnaire de l''etnologie et de l''anthropologie','?','PUF',1991,'?','Een goed boek','Anthropologie'),
('Robert','Bly','The sibling society','Londen','Persus',1996,'?','Een interessant boek','Antropologie'),
('Fernand','Braudel','De middellandse zee. Het landschap en de mens','Amsterdam/Antwerpen','Uitgeverij Contanct',1992,'?','Uit het Frans vertaald: La méditerranée. La part du milieu. Parijs: Librairie Armand Colin, 1966','Geschiedenis'),
('Timothy','Gowers','Wiskunde, de kortste introductie','Utrecht','Uitgeverij Het Spectrum B.V.',2003,'?','Oorpronkelijke titel: Mathematics a very schort introduction. Oxford University Press, 2002','Wiskunde'),
('Timothy','Gowers','Wiskunde, de nog kortere introductie','Utrecht','Uitgeverij Het Spectrum B.V.',2004,'?','Oorpronkelijke titel: Mathematics a very schort introduction. Oxford University Press, 2002','Wiskunde'),
('Timothy','Gowers','Wiskunde voor krankzinnigen!','Utrecht','Uitgeverij Het Spectrum B.V.',2005,'?','Oorpronkelijke titel: Mathematics a very schort introduction. Oxford University Press, 2003','Wiskunde');
