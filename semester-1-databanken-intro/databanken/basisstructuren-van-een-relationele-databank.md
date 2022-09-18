# Basisstructuren van een relationele databank

De basiswoordenschat van relationele databanken is als volgt:

* **entiteittypes**: de **verzamelingen van** interessante gehelen waarover we informatie bijhouden. Op de figuur onderaan is dit bijvoorbeeld de hele verzameling met personen of de hele verzameling met boeken.
* **entiteiten**: de elementen van de verzameling. Elke persoon in de linkse verzameling, bijvoorbeeld William Shakespeare, is een entiteit. Elke persoon en elk boek is een entiteit.
* **relatietypes**: een soort verband **tussen verzamelingen**. Op de figuur is "heeft gelezen" een relatietype.
* **relaties**: een concreet verband tussen entiteiten. Op de figuur is bv. "Michiel heeft The Tempest gelezen" een relatie.
* **tabellen**: de structuur waarin een volledig entiteittype of een relatietype wordt opgeslagen. Deze tabel heeft steeds een naam, of tabelnaam.
* **records**: een tabel bestaat uit **rijen** of records. Eén record bevat alle gegevens van de rij en stelt dus één entiteit voor.
* **kolommen** (of "**velden**"): iedere kolom omvat één aanduiding van een gegeven binnen een tabel. Iedere kolom heeft een unieke naam.

![](../../.gitbook/assets/heeft-gelezen.png)

Ter herinnering, de verzameling met personen stelden we zo voor:

| Voornaam | Familienaam | Geboortejaar |
| -------- | ----------- | ------------ |
| Vincent  | Nys         | 1987         |
| Esther   | Nys         | 1990         |
| Michiel  | Nys         | 1984         |
| William  | Shakespeare | 1564         |
| Ted      | Chiang      | 1967         |
| Kazuo    | Ishiguro    | 1954         |
