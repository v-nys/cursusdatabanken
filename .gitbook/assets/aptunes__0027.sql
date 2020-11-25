use ApDB;
set sql_safe_updates = 0;
update Nummers inner join Artiesten
on Artiesten.Naam = Nummers.Artiest
set Nummers.Artiesten_Id = Artiesten.Id;
set sql_safe_updates = 1;