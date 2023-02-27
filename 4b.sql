CREATE OR REPLACE PROCEDURE get_country_pairs()
BEGIN
  SELECT DISTINCT n.tara AS "Tara1", p.tara AS "Tara2"
	FROM Clase n CROSS JOIN Clase p
	WHERE (n.deplasament = p.deplasament AND n.tip = p.tip AND n.tara != p.tara AND n.tara<p.tara);
END