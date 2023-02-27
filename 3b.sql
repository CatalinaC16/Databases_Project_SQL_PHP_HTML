CREATE OR REPLACE PROCEDURE get_ships_after_year(IN year DOUBLE)
BEGIN
  SELECT nume AS "Nume",anul_lansarii AS "Anul Lansarii"
  FROM Nave
  WHERE anul_lansarii > year
  ORDER BY anul_lansarii;
END
