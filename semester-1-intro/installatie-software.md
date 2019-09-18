---
description: Installatiehandleiding
---

# Installatie van alle software

Deze procedure geeft duidelijk weer hoe je aan de slag gaat met MySQL en je scripts deelt met de lectoren.

Volg daarom onderstaande stappen nauwkeurig.

{% embed url="https://www.youtube.com/watch?v=araZ9AAP1cs" %}

{% embed url="https://www.youtube.com/watch?v=hf3H6rIGXQA" %}

{% embed url="https://www.youtube.com/watch?v=B35N7-\_2mW8" %}

{% embed url="https://www.youtube.com/watch?v=P6wrQ0hJAEo" %}

{% embed url="https://www.youtube.com/watch?v=C7IuKm496pU" %}

{% hint style="info" %}
Voor bovenstaande stap moet je enkele commando's intypen. Je kan deze gewoon kopiëren en plakken.
{% endhint %}

```text
docker volume create mijn-mysql-volume
```

```text
docker run --name mijn-mysql-container -v mijn-mysql-volume:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=in-het-echt-geheim -d mysql:8.0.17
```

{% embed url="https://youtu.be/oIfpnNvtEvA" %}

Het laatste filmpje vermeldt enkele commando's. Hier zijn ze, om typfouten te vermijden:

```text
docker container start mijn-mysql-container
```

```text
git add --all
git commit -m "Dit is mijn script."
git push
```

