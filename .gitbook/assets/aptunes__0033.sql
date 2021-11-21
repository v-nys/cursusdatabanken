use ApDB;
set sql_safe_updates = 0;
alter table Gebruikers
add column Id int auto_increment primary key;
set sql_safe_updates = 1;
insert into Gebruikers (Gebruikers.Gebruikersnaam, Gebruikers.HashVanWachtwoord)
values
('musicfan111','jfdsiojqfsiodsiofjdsiopfj'),
('tuneBoY5','vninezijiodzecnxi'),
('drbeatz','jifosjqiofpezrezareza'),
('trebletrouble','ippizajriozrioezjo'),
('neverloudenough','isqfpjiownjnvcxinie');