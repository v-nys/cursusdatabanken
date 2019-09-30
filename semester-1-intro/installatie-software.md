---
description: Installatiehandleiding
---

# Installatie van alle software

Deze procedure geeft duidelijk weer hoe je aan de slag gaat met MySQL en je scripts deelt met de lectoren.

## 1. stopzetten eventueel bestaande databank in Docker
Als je eerdere filmpjes hebt gevolgd en Docker hebt geïnstalleerd, moet je eerst garanderen dat je Dockergebaseerde databank gestopt is:
```text
docker container stop mijn-mysql-container
docker container rm mijn-mysql-container
```

Als deze commando's niet werken, is dat niet erg. Dan had je nog geen MySQL via Docker.

## 2. instructiefilmpjes Git, MySQL, Bitbucket
{% embed url="https://www.youtube.com/watch?v=hf3H6rIGXQA" caption="installatie Git for Windows" %}

{% embed url="https://www.youtube.com/watch?v=x173pwJA9d4" caption="installatie MySQL" %}

{% embed url="https://youtu.be/oIfpnNvtEvA" caption="je scripts delen via Bitbucket" %}

{% hint style="warning" %}
In het laatste filmpje mag je het opstarten van een Docker container negeren. We gebruiken nu een lokale installatie van MySQL, dus van 4:50 tot 5:06 mag je overslaan.
{% endhint %}

Het laatste filmpje vermeldt enkele commando's. Hier zijn ze, om typfouten te vermijden:

```text
git add --all
git commit -m "Dit is mijn script."
git push
```

