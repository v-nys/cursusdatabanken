# De juiste database selecteren

{% hint style="info" %}
[Kennisclip voor deze inhoud](https://youtu.be/uvEkdDLHe8w)
{% endhint %}

Eén instantie van een DBMS kan verantwoordelijk zijn voor meerdere databanken. Daarom is het belangrijk dat we uitdrukkelijk aangeven welke databank we precies willen gebruiken. Dit doen we in MySQL door het USE statement.

USE behoort tot de utility statements van MySQL. Het definieert geen structuur, dus het is geen element van de DDL. Het past geen data aan, dus het is geen element van de DML.

Op de screenshot zie je dat de gebruiker verbonden is met een database server met meerdere schema's. De instructie CREATE hoeft je nog niet helemaal te begrijpen, maar je kan wel raden dat ze een tabel aanmaakt.

Screenshot from 2020-09-18 17-48-07.png

Na het uitvoeren van de instructie kan je onderstaande foutmelding krijgen.

Screenshot from 2020-09-18 17-50-31.png

"No database selected" betekent dat het niet duidelijk is of de tabel een onderdeel zal worden van de database S0170681 of de database sys. Om de foutmelding op te lossen, moet je de database kiezen die de tabel met de naam na FROM bevat. Dit doe je met de instructie USE S0170681. Tot je er voor kiest een ander schema te gebruiken, gaan alle instructies dus uitvoeren met het schema S0170681. Dit kan verwarrend zijn, dus we spreken af dat we in al onze scripts altijd een geschikt USE-statement voorzien. Als je dit niet doet, rekent xchk je inzendingen fout.
