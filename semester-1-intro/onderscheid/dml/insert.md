# `INSERT`

## Aanmaken van je eerste concrete data

Er is een vaste syntax om data in je databank te plaatsen, waar je even aan zal moeten wennen. Het is een goed idee om met een 'stub' te beginnen, een 'skelet' statement. Voor een tabel `Boeken` ziet dit er zo uit, voor een enkel nieuw record:

```sql
insert into Boeken (
-- hier moet je gebruikte kolomnamen invullen
)
values (
-- hier moet je waarden voor de gebruikte invullen
);
```

