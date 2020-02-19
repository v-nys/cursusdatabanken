# Labo oefeningen
# Oefening 1
Maak een view aan met naam `AuteursBoeken` waarmee je makkelijk een overzicht kan vragen van welke auteur welk(e) boek(en) heeft geschreven.

Je oplossing zou er exact zo moeten uitzien:

Noem het script om deze view aan te maken `0613\_\_Oefening.sql`.

# Oefening 2
Pas, niet rechtstreeks in de tabel `Boeken` maar wel via de view `AuteursBoeken`, de titel *Pet Sematary* aan naar *Pet Cemetery*.

Noem het script hiervoor `0614\_\_Oefening.sql`.

Wat gebeurt er als je de naam "Stephen King" via deze view in "Steven King" wil veranderen? Waarom, denk je?

# Oefening 3 (drie stappen)
We willen een complexere versie van de bestaande view `AuteursBoeken`. We zullen hierbij ook de gemiddelde rating van elk boek plaatsen in een uitgebreide versie van de view, namelijk `AuteursBoekenRatings`. We zullen dit in stappen doen. Lees eerst de stappen, bekijk dan de figuren, voer dan de stappen uit.

1. Gebruik een `ALTER VIEW` om je bestaande view `AuteursBoeken` te voorzien van het `Id` uit de kolom `Boeken`. Toon `Id` hier wel als `Boeken_Id`. Noem het script dat de view aanpast `0615\_\_Oefening.sql`.
2. Maak een view `GemiddeldeRatings` aan op basis van `Reviews`. Noem de kolom met het gemiddelde `Rating`. Noem het script dat de view maakt `0616\_\_Oefening.sql`.
3. Maak de tabel `AuteursBoekenRatings` aan door een nieuwe view te maken gebaseerd op `AuteursBoeken` en `GemiddeldeRatings`. Noem het script dat de view maakt `0617\_\_Oefening.sql`.

# Oefening 4
Vraag via de metadatabank op welke van je views updatable zijn en welke niet. Schrijf voor de meest complexe van de updatable views een `UPDATE` per kolom om te testen of je die kolom kan updaten. Je hoeft het script niet te bewaren, maar je moet in een gelijkaardige situatie (bv. op het examen) wel kunnen zeggen welke kolommen updatable zijn.

# Besluit
Uit de laatste oefening zie je dat er meerdere redenen zijn om een view op te bouwen uit andere views. Enerzijds om stap per stap het resultaat op te bouwen. Anderzijds omdat een view die niet-updatable views bevat zelf toch nog updatable kan zijn. Uiteraard zijn niet alle kolommen dan noodzakelijk updatable, maar het kan beter zijn dan het opbouwen van één grote niet-updatable view.

