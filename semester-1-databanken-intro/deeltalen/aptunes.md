# apTunes project

Relationele databases vormen regelmatig de ruggegraat van \(web\)applicaties. We zullen dat in de verdere labo-oefeningen demonstreren. Voor de verdere oefeningen zullen we voornamelijk werken met een database genaamd `apTunes`. Dit is een database die je zou kunnen gebruiken om een streamingdienst \(vergelijkbaar met Spotify, Deezer,...\) te ondersteunen.

`apTunes` moet allerlei functionaliteit ondersteunen die je gewend bent van echte streamingdiensten, onder meer:

* voor de eindgebruiker:
  * zoeken op titel, artiest, genre, etc. van een nummer
  * bijhouden van een persoonlijke collectie nummers, albums, playlists
  * nummers opslaan als favorieten
  * enzovoort
* voor de eigenaar:
  * de populairste nummers binnen een bepaalde periode opvragen
  * per artiest het aantal afgespeelde nummers in een bepaalde periode opvragen
  * enzovoort

Tegen het einde van de cursus ken je genoeg MySQL om de databasekant van een prototype van een dergelijke streamingdienst te schrijven.

{% hint style="warning" %}
We zeggen uitdrukkelijk "prototype". Je zal de nodige data kunnen bijhouden en opzoeken, maar in een echte applicatie moet je ook rekening houden met performantie, beveiliging en stabiliteit. Die zaken laten we voor later.
{% endhint %}

