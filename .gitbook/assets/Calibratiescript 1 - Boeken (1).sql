-- Calibratiescript 1 - Boeken
USE ApDB;
SET SQL_SAFE_UPDATES = 0;
UPDATE Boeken
SET Voornaam = "Niet gekend"
WHERE Voornaam IS NULL;
SET SQL_SAFE_UPDATES = 1;