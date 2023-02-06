-- Calibratiescript 2 - Boeken
USE ApDB;
SET SQL_SAFE_UPDATES = 0;
UPDATE Boeken
SET Auteurs_Id = (SELECT Id FROM Auteurs WHERE Boeken.Voornaam = Auteurs.Voornaam AND Boeken.Familienaam = Auteurs.Familienaam);
SET SQL_SAFE_UPDATES = 1;