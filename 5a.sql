CREATE OR REPLACE PROCEDURE get_ships_with_min_arms()
BEGIN
  SELECT nave.nume AS "NUME",nave.clasa AS "CLASA",nave.anul_lansarii AS "ANUL_LANSARII",clase.tip AS "TIP", clase.tara AS "TARA",clase.nr_arme AS "NR_ARME",clase.diametru_tun AS "DIAMETRU_TUN",clase.deplasament AS "DEPLASAMENT"
  FROM nave JOIN clase ON (nave.clasa = clase.clasa)
  WHERE nave.clasa IN (SELECT clasa FROM Clase WHERE nr_arme = (SELECT MIN(nr_arme) FROM Clase));
END