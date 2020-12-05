use ApDB;
set sql_safe_updates = 0;
update (Nummers inner join Albums
on Albums.Titel = Nummers.Album) inner join Artiesten
on Nummers.Artiesten_Id = Artiesten.Id
set Albums.Artiesten_Id = Nummers.Artiesten_Id;
set sql_safe_updates = 1;