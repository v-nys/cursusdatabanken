use ApDB;
set sql_safe_updates = 0;
update Nummers inner join Albums
on Albums.Titel = Nummers.Album
set Nummers.Albums_Id = Albums.Id;
set sql_safe_updates = 1;