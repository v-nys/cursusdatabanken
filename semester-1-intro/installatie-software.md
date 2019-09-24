---
description: Installatiehandleiding
---

# Installatie van alle software

Deze procedure geeft duidelijk weer hoe je aan de slag gaat met MySQL en je scripts deelt met de lectoren.

Volg daarom onderstaande stappen nauwkeurig.

{% hint style="danger" %}
Alleen de commando's plakken is niet genoeg! Je moet de filmpjes volledig mee volgen.
{% endhint %}

{% embed url="https://www.youtube.com/watch?v=araZ9AAP1cs" caption="" %}

{% embed url="https://www.youtube.com/watch?v=hf3H6rIGXQA" caption="" %}

{% embed url="https://www.youtube.com/watch?v=B35N7-\_2mW8" caption="" %}

{% embed url="https://www.youtube.com/watch?v=P6wrQ0hJAEo" caption="" %}

{% hint style="warning" %}
In onderstaand filmpje bevat MySQL Workbench al een geregistreerde verbinding. Als het de eerste keer is dat je deze software uitvoert, zal die verbinding er nog niet zijn. Klik daarom op het plusteken om een nieuwe verbinding te maken, geef ze een naam naar keuze, klik op "store in vault" om een wachtwoord toe te voegen. Gebruik het wachtwoord in-het-echt-geheim. Klik op "Test Connection" en de verbinding zou moeten ontstaan.
{% endhint %}

{% embed url="https://www.youtube.com/watch?v=C7IuKm496pU" caption="" %}

{% hint style="info" %}
Voor bovenstaande stap moet je enkele commando's intypen. Je kan deze gewoon kopiëren en plakken door op het icoontje actheraan in onderstaande vakjes te klikken. Dat werkt beter dan het commando met de hand te selecteren.
{% endhint %}

```text
docker volume create mijn-mysql-volume
```

```text
docker run --name mijn-mysql-container -v mijn-mysql-volume:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=in-het-echt-geheim -d mysql:8.0.17
```

{% embed url="https://youtu.be/oIfpnNvtEvA" caption="" %}

Het laatste filmpje vermeldt enkele commando's. Hier zijn ze, om typfouten te vermijden:

```text
docker container start mijn-mysql-container
```

```text
git add --all
git commit -m "Dit is mijn script."
git push
```

