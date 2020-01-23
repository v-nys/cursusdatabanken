# NoSQL

## Studiemateriaal \(essentieel\)

{% embed url="https://www.freecodecamp.org/news/nosql-databases-5f6639ed9574/" %}

## **Inleiding**

Soorten databanken

### **Hiërarchische databank**

* Hebben een boomstructuur
* Dit geeft redelijk wat beperkingen.
  * Een parent kan meerdere children hebben
  * Maar een child slechts 1 parent.
  * Dit leidt tot kopieën en problemen in integriteit
* Steeds minder gebruikt
* Vb: windows registry

### **Relationele databank**

* Bestaat uit tabellen die met elkaar gekoppeld worden dmv relaties
* Relaties worden gemaakt door ‘sleutels’\(keys\)  
  _Primary Key\(PK\)_

  Elke tabel heeft 1 PK \(deze identificeert een entry\)

  _Foreign Key\(FK\)_  
  Elke tabel kan 0 of meerdere FK hebben

* Deze legt een relatie naar een PK in een andere tabel
* Niet bepaald overzichtelijker, maar wel veel flexibeler en efficiënter
* Relationele databanken hebben enkele nadelen _Schaalbaarheid voor heel grote databanken_ Opsplitsen van DB in verschillende DB’s werkt moeilijk _Complexe SQL code omdat objecten in OO niet overeenkomen met tabellen in DB_ Bv. personeel\(object\) heeft adres en bedrijfswagen waarbij de data verspreid zijn over verschillende tabellen

### **NoSQLdatabank** 

Er zijn 4 soorten no-sql databanken:

* Document databank  Bv. MongoDB
* Key Value databank  Bv. Redis
* Graph databank  Bv. Neo4J
* Column databank  Bv. Google bigtable 

![](../.gitbook/assets/image%20%2832%29.png)



#### **NoSQL – Document databank**

![](../.gitbook/assets/image%20%281%29.png)

* Database bevat ‘documenten’ \(json objecten\) Bv.: { Id:1, Name: ‘Janssens’ FirstName:’Jan’}
* We kunnen queries schrijven, maar niet in SQL Query taal afhankelijk van databank Bv.: db.Klant.Find\(Name:’Janssens’\)
* Documenten zullen veel data bevatten Bv. in aankoop db zullen alle aankopen in klanten document zitten en niet in aparte tabellen
* Als server maximale capaciteit bereikt gewoon een extra server Geen schaal problemen omdat er geen relaties zijn over databanken

#### NoSQL – Key-value databank

![](../.gitbook/assets/image%20%2816%29.png)

* Vergelijkbaar met document databank Maar geen queries mogelijk Enkel informatie opvragen via de sleutel\(Key\) Dit gaat bijzonder snel
* Bv.: Twitter geschiedenis

#### NoSQL – Graph databank

![](../.gitbook/assets/image%20%283%29.png)

* Ontworpen om ‘sociale eigenschappen’ van personen op te slaan, bvb: persoon a is bevriend met persoon b Persoon a houd van product x
* Zeer handig voor sociale media

#### NoSQL – \(wide\) Column databank

![](../.gitbook/assets/image%20%2860%29.png)

* Gebruikt tabellen, rijen en kolommen, maar anders dan een relationele databank.
* De namen en formaat van de kolommen kan verschillen van rij tot rij in binnen dezelfde tabel.
* Er wordt ook wel eens gesproken over een twee dimenionale key-value store.

**NoSQL**   
Vaak worden combinaties gebruikt van meerdere soorten DB’s en dit afhankelijk van het doel.

Ter info, hieronder een lijstje met ranking van de meest populaire databases met bijzondere aandacht voor het database model \([https://db-engines.com/en/ranking](https://db-engines.com/en/ranking)\).

![](../.gitbook/assets/image%20%2826%29.png)

{% hint style="info" %}
_Extra info_  
Tweakers – NoSQL, maar wat is het dan wel?

Volgende pagina’s geven ook een inzicht over wat en waarom.

* [http://tweakers.net/reviews/2354/nosql-maar-wat-is-het-dan-wel.html](http://tweakers.net/reviews/2354/nosql-maar-wat-is-het-dan-wel.html)
* [http://tweakers.net/reviews/2354/2/nosql-maar-wat-is-het-dan-wel-relaties.html](http://tweakers.net/reviews/2354/2/nosql-maar-wat-is-het-dan-wel-relaties.html)
* [http://tweakers.net/reviews/2354/3/nosql-maar-wat-is-het-dan-wel-bigtable-en-cassandra.html](http://tweakers.net/reviews/2354/3/nosql-maar-wat-is-het-dan-wel-bigtable-en-cassandra.html)
* [http://tweakers.net/reviews/2354/6/nosql-maar-wat-is-het-dan-wel-tot-slot.html](http://tweakers.net/reviews/2354/6/nosql-maar-wat-is-het-dan-wel-tot-slot.html)

Verschil tussen een no sql / document database en een relationele database wordt heel duidelijk uitgelegd in volgend filmpje.  
[https://www.youtube.com/watch?v=Jt\_w2swkXAk](https://www.youtube.com/watch?v=Jt_w2swkXAk)
{% endhint %}

{% hint style="info" %}
_Verdiepend_  
Introduction to NoSQL \(Martin Fowler\)  
[https://www.youtube.com/watch?v=qI\_g07C\_Q5I](https://www.youtube.com/watch?v=qI_g07C_Q5I)
{% endhint %}

