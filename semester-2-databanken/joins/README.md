# Join

#### **Situatie**

Om de integriteit van een database te bewaren normaliseren we de gegevens in de database. Ruwweg betekent dit dat we tabellen splitsen in kleinere, zinvollere tabellen om ontdubbeling te vermijden. Door de normalisering geraakt de informatie echter verspreid over meer dan één tabel. De gebruiker heeft daar echter niet veel aan. Primaire - en vreemde sleutels zeggen de gebruiker niets. We moeten dus een manier vinden om de informatie weer voor te stellen _alsof_ die uit één tabel komt.

#### **Oplossing**

1. `INNER JOIN`: wanneer we gebruik gaan maken van de INNER JOIN zullen de records uit beide tabellen worden gehaald welke aan elkaar zijn verbonden.
2. `LEFT [OUTER] JOIN`: met deze clausule kunnen we alle records ophalen uit de tabel die aan de linkerkant van de JOIN staat gespecificeerd, dus ook de rijen uit de linkse tabel die niet aan de join voorwaarde voldoen worden ook in het resultaat weergegeven.
3. `RIGHT [OUTER] JOIN`: met deze clausule kunnen we alle records ophalen uit de tabel die aan de rechterkant van de JOIN staat gespecificeerd, dus ook de rijen uit de rechtse tabel die niet aan de join voorwaarde voldoen worden ook in het resultaat weergegeven.
4. `FULL [OUTER] JOIN`: met deze clausule kunnen we alle records ophalen uit de tabel die zowel aan de linkerkant en aan de rechterkant van de JOIN staan gespecificeerd, dus ook de rijen uit de linkse en rechtse tabel die niet aan de join voorwaarde voldoen worden ook in het resultaat weergegeven

