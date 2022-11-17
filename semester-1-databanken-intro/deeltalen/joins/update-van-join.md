# UPDATE van JOIN

`JOIN` is niet alleen handig om informatie samen te tonen. Deze operatie kan ook gebruikt worden om aanpassingen door te voeren waarvoor we informatie uit een andere tabel nodig hebben.

Volgend script werd in de oefeningen gebruikt om nummers via een ID te linken aan een artiest, nadat artiesten in een aparte tabel waren geplaatst. De liedjes hebben dus nog géén ID, maar bevatten wel nog de naam van de artiest:

```sql
use ApDB;
set sql_safe_updates = 0;
-- "Nummers" betekent hier "Liedjes"
update Nummers inner join Artiesten
on Artiesten.Naam = Nummers.Artiest
set Nummers.Artiesten_Id = Artiesten.Id;
set sql_safe_updates = 1;
```

Eerst moet je dus kijken naar wat een gewone `SELECT` van deze samengevoegde tabel zou opleveren. Hij zou informatie over een nummer plaatsen naast informatie over een artiest met dezelfde **naam**.

{% hint style="warning" %}
Onthoud heel goed: het is niet omdat we vaak schrijven `ON X.Id = X_Id` dat dat **de** manier is om JOIN te gebruiken. **Dit is niet meer of niet minder dan een vergelijking van de waarden in twee kolommen.**
{% endhint %}

Voor uitvoering zien rijen uit de tabel met liedjes er dus zou uit:

<figure><img src="../../../.gitbook/assets/Screenshot from 2022-11-17 12-45-04.png" alt=""><figcaption></figcaption></figure>

Rijen uit de tabel met artiesten zien er zo uit:

<figure><img src="../../../.gitbook/assets/Screenshot from 2022-11-17 12-46-15.png" alt=""><figcaption></figcaption></figure>



Een combinatie van de twee tabellen kan je bekijken via (dus zoals in de update hierboven, maar de informatie wordt alleen getoond):

```sql
select * from Nummers inner join Artiesten
on Artiesten.Naam = Nummers.Artiest; -- niet op ID!
```

Deze ziet er zo uit:

<figure><img src="../../../.gitbook/assets/Screenshot from 2022-11-17 12-48-33.png" alt=""><figcaption></figcaption></figure>

Dus de kolom `Artiesten_Id` is nog leeg, maar we kunnen het volgende zeggen:

* ze is afkomstig uit `Nummers`
* de waarde die we wensen in te vullen is wel zichtbaar in deze `JOIN`, want ze staat in de kolom `Id` afkomstig uit `Artiesten`

We weten dus wat we zouden moeten invullen voor al deze `NULL`-waarden en we weten waar die info dan zou moeten worden opgeslagen. De `UPDATE` is dan ook toegelaten en werkt zoals gewenst.
