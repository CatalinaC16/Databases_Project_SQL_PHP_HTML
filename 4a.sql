CREATE OR REPLACE PROCEDURE get_damaged_ships(IN Batalie Varchar(25))
BEGIN
  SELECT Consecinte.nava AS "Numele navei", Clase.deplasament AS "Deplasamentul", Clase.nr_arme AS "Numarul de arme"
  FROM Consecinte JOIN Nave ON (Consecinte.nava = Nave.nume) JOIN Clase ON (Nave.clasa = Clase.clasa)
  WHERE Consecinte.batalie = Batalie AND Consecinte.rezultat = 'avariat';
END