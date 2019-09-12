---
description: E.F. Codd
---

# Normaliseren

E.F. Codd heeft een methode ontwikkeld die ervoor zorgt dat gegevens over verschillende tabellen kunnen worden verdeeld. Bijvoorbeeld, wanneer we gegevens willen gaan bijhouden over boeken dan maken we ofwel één grote tabel aan met daarin alle boeken met hun resp. naam en auteur. Of in het andere geval maken we twee tabellen aan met enderzijds een tabel met alle boeken en anderzijds een tabel met alle auteurs. Er moet dan wel een verband bestaan tussen deze onderscheiden tabellen. 

## **Normalisatiestappen** 

**0e normaalvorm**   
Verzamel alle gegevens \(waarbij uiteraard de groepssleutel wordt bepaald\) en verwijder alle afleidbare gegevens. 

**1e Normaalvorm**   
Plaats de herhalende \(verzameling\) van gegevens in een nieuwe deelgroep en bepaal de sleutel van deze deelgroep. 

**2e Normaalvorm**   
Plaats die gegevens in een nieuwe deelgroep die niet afhankelijk zijn van de groepsleutel. 

**3e Normaalvorm**   
Plaats die gegevens in een nieuwe deelgroep, die functioneel afhankelijk zijn van niet sleutelgegevens.

