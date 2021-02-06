# OUTER EXCLUDING JOIN

Deze query retourneert alle records in de linkertabel \(tabel A\) en alle records in de rechtertabel \(tabel B\) die niet overeenkomen. Net als de gewone full outer join is deze standaard niet beschikbaar in MySQL, maar je kan hem krijgen door een left excluding join en een right excluding join te combineren. De code daarvan zou je intussen zelf moeten kunnen schrijven op basis van die voor de gewone outer join.

![Venn diagram outer excluding join](https://modernways.be/myap/it/image/sql/venn%20diagram%20outer%20excluding%20join.png)

