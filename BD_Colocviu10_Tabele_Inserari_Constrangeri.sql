DROP TABLE Consecinte;
DROP TABLE Batalii;
DROP TABLE Nave;
DROP TABLE Clase;

CREATE TABLE Clase(
	clasa varchar (20) NOT NULL,
	tip varchar (20) NOT NULL ,
	tara varchar (20) NOT NULL,
	nr_arme double NOT NULL,
	diametru_tun double NOT NULL,
	deplasament double NOT NULL);

CREATE TABLE Nave(
	nume varchar (20) NOT NULL ,
	clasa varchar (20) NOT NULL ,	
	anul_lansarii double NOT NULL);

CREATE TABLE Batalii(
	nume varchar (25) NOT NULL,
	data  datetime NOT NULL);

CREATE TABLE Consecinte(
	nava varchar (20) NOT NULL,	
	batalie varchar (25) NOT NULL,
	rezultat varchar (20) NOT NULL);


ALTER TABLE Clase ADD CONSTRAINT clase_clasa_pk PRIMARY KEY(clasa);
	
ALTER TABLE Clase ADD CONSTRAINT clase_tip_ck CHECK(tip IN('vas de linie', 'cuirasat','crucisator','distrugator'));	

ALTER TABLE Nave ADD CONSTRAINT nave_nume_pk PRIMARY KEY(nume);

ALTER TABLE Nave ADD CONSTRAINT nave_clasa_fk FOREIGN KEY(clasa) REFERENCES Clase(clasa);

ALTER TABLE Batalii ADD CONSTRAINT batalii_nume_pk PRIMARY KEY(nume);
		
ALTER TABLE Consecinte ADD CONSTRAINT consecinte_nava_fk FOREIGN KEY(nava) REFERENCES Nave(nume) ON DELETE CASCADE;
	
ALTER TABLE Consecinte ADD CONSTRAINT consecinte_batalie_fk FOREIGN KEY(batalie) REFERENCES Batalii(nume) ON DELETE CASCADE;
	
ALTER TABLE Consecinte ADD CONSTRAINT consecinte_nava_pk PRIMARY KEY(nava,batalie);
   
ALTER TABLE Consecinte ADD CONSTRAINT consecinte_rezultat_ck CHECK(rezultat IN('scufundat', 'avariat', 'nevatamat'));

ALTER TABLE Batalii ADD(locatie varchar (20) NOT NULL);
	
ALTER TABLE Clase ADD CONSTRAINT clase_diametru_tun_ck CHECK((nr_arme<20 AND diametru_tun<50) OR (nr_arme>=20));

	INSERT INTO Clase
	VALUES('La Galissonnière','crucisator','FRANTA',7,2,7500);
	INSERT INTO Clase
	VALUES('Le Garcon','crucisator','FRANTA',21,10,25000);
	INSERT INTO Clase
	VALUES('Fortareata','distrugator','SUA',12,8,3000);
	INSERT INTO Clase
	VALUES('ELisabet','crucisator','ROMANIA',10,6,3500);
	INSERT INTO Clase
	VALUES('Le Napoléon','cuirasat','GERMANIA',10,6,3500);
    INSERT INTO Clase
	VALUES('Le Dolce','cuirasat','FRANTA',10,6,3500);
	INSERT INTO Clase
	VALUES('SovereignOfTheSeas','vas de linie','ANGLIA',2,3,1500);
	INSERT INTO Clase
	VALUES('Kongo','cuirasat','JAPONIA',10,6,9500);
   	INSERT INTO Clase
	VALUES('Armada','vas de linie','SPANIA',10,6,3300);
    INSERT INTO Clase
	VALUES('Beth','crucisator','ROMANIA',2,6,3500);
	INSERT INTO Clase
	VALUES('Mergot','crucisator','ANGLIA',50,55,3500);
	INSERT INTO Clase
	VALUES('Philip','vas de linie','ANGLIA',50,20,3500);
	INSERT INTO Clase
	VALUES('AllAround','vas de linie','DANEMARCA',2,3,3500);
	INSERT INTO Clase
	VALUES('OVERTheSeas','vas de linie','DANEMARCA',2,3,2500);
	INSERT INTO Clase
	VALUES('SovereignOfTheSeas2','vas de linie','ANGLIA',2,3,2500);
	INSERT INTO Clase
	VALUES('Le Franchie','cuirasat','FRANTA',10,8,3500);
	
 
	INSERT INTO Nave
	VALUES('La Galissonnière','La Galissonnière',1814);
	INSERT INTO Nave
	VALUES('Le Garcon','Le Garcon',1815);
	INSERT INTO Nave
	VALUES('Fortareata','Fortareata',1816);
	INSERT INTO Nave
	VALUES('ELisabet','ELisabet',1817);
	INSERT INTO Nave
	VALUES('Le Napoléon','Le Napoléon',1818);
    INSERT INTO Nave
	VALUES('Le Dolce','Le Dolce',1819);
	INSERT INTO Nave
	VALUES('SovereignOfTheSeas','SovereignOfTheSeas',1820);
	INSERT INTO Nave
	VALUES('Kongo','Kongo',1821);
    INSERT INTO Nave
	VALUES('Armada','Armada',1848);
    INSERT INTO Nave
	VALUES('Beth','Beth',1847);
	INSERT INTO Nave
	VALUES('Mergot','Mergot',1845);
	INSERT INTO Nave
	VALUES('Philip','Philip',1882);
	INSERT INTO Nave
	VALUES('AllAround','AllAround',1876);
	INSERT INTO Nave
	VALUES('OVERTheSeas','OVERTheSeas',1833);
	INSERT INTO Nave
	VALUES('SovereignOfTheSeas2','SovereignOfTheSeas2',1853);
	INSERT INTO Nave
	VALUES('Le Franchie','Le Franchie',1844);
	INSERT INTO Nave
	VALUES('Fregata Marasesti','Fortareata',1976);
	INSERT INTO Nave
	VALUES('Beti','Fortareata',1922);
	INSERT INTO Nave
	VALUES('Roca','Fortareata',1999);
	INSERT INTO Nave
	VALUES('Piatra','Fortareata',1900);
	INSERT INTO Nave
	VALUES('Kira','Fortareata',1900);
	INSERT INTO Nave
	VALUES('Bismarck ','Le Napoléon',1939);
	INSERT INTO Nave
	VALUES('AEGISS','Kongo',2021);
	INSERT INTO Nave
	VALUES('AEGIS','Kongo',2021);
	INSERT INTO Nave
	VALUES('HIEI','Kongo',1912);
	INSERT INTO Nave
	VALUES('HMS Victory','SovereignOfTheSeas',1900);
	INSERT INTO Nave
	VALUES('Georges Leygues','La Galissonnière',1935);
	INSERT INTO Nave
	VALUES('Montcalm','La Galissonnière',1936);
    INSERT INTO Nave
	VALUES('La vie','La Galissonnière',1955);   
	INSERT INTO Nave
	VALUES('La vita','La Galissonnière',1900);
	INSERT INTO Nave
	VALUES('Jonson','AllAround',1989);

	INSERT INTO Batalii
	VALUES('Batalia de la Okinawa','1945-06-22','Ochinawa');
	INSERT INTO Batalii
	VALUES('Operatiunea Berlin','1941-01-22','Oceanul Atlantic');
	INSERT INTO Batalii
	VALUES('Al II RM','1945-09-2','Oceanul Pacific');
	INSERT INTO Batalii
	VALUES('Batalia Tsushima','1905-05-28','StramtoareaTsushima');
	INSERT INTO Batalii
	VALUES('Bat. de la Capul Sarici','1914-11-18','Crimeea');
    INSERT INTO Batalii
	VALUES('Bat. Navelor','2009-11-18','Crimeea');
   	INSERT INTO Batalii
	VALUES('Al II RM2','1945-09-1','Oceanul Atlantic');
	INSERT INTO Batalii
	VALUES('Bat de la Roca','1599-12-22','Roca');
    INSERT INTO Batalii
	VALUES('Bat de la Actium','1672-09-2','Actium');
    INSERT INTO Batalii
	VALUES('Bat de la Sinop','1853-11-30','Sinop');
    INSERT INTO Batalii
	VALUES('Bat de la Lisa','1811-03-13','Lisa');
    INSERT INTO Batalii
	VALUES('Incidentul Altmark','1940-02-16','Actium');

	INSERT INTO Consecinte
	Values('Fregata Marasesti','Al II RM','nevatamat');
	INSERT INTO Consecinte
	Values('Beti','Al II RM','nevatamat');
	INSERT INTO Consecinte
	Values('Kira','Al II RM','avariat');
	INSERT INTO Consecinte
	Values('La vita','Al II RM','avariat');
	
	INSERT INTO Consecinte
	Values('Georges Leygues','Operatiunea Berlin','nevatamat');
	INSERT INTO Consecinte
	Values('Bismarck ','Operatiunea Berlin','scufundat');
	INSERT INTO Consecinte
	Values('Kira','Operatiunea Berlin','nevatamat');
	
	INSERT INTO Consecinte
	Values('Montcalm','Batalia Tsushima','scufundat');
	INSERT INTO Consecinte
	Values('HIEI','Batalia Tsushima','avariat');
	INSERT INTO Consecinte
	Values('AEGIS','Batalia Tsushima','avariat');
	INSERT INTO Consecinte
	Values('Kira','Batalia Tsushima','nevatamat');

	INSERT INTO Consecinte
	Values('Piatra','Batalia Tsushima','nevatamat');

	
	INSERT INTO Consecinte
	Values('Piatra','Batalia de la Okinawa','avariat');

	
	INSERT INTO Consecinte
	Values('HIEI','Batalia de la Okinawa','avariat');
	INSERT INTO Consecinte
	Values('HMS Victory','Batalia de la Okinawa','scufundat');
	INSERT INTO Consecinte
	Values('Kira','Batalia de la Okinawa','nevatamat');

	INSERT INTO Consecinte
	Values('Georges Leygues','Bat. de la Capul Sarici','avariat');
	INSERT INTO Consecinte
	Values('Fregata Marasesti','Bat. de la Capul Sarici','avariat');
	INSERT INTO Consecinte
	Values('HIEI','Bat. de la Capul Sarici','nevatamat');
	
				