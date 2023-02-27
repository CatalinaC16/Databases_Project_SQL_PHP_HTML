CREATE OR REPLACE PROCEDURE get_ships(IN min_deplasament double, IN max_deplasament double)
        BEGIN
          SELECT clasa AS 'Clasa', tara AS 'Tara', deplasament AS 'Deplasamentul'
          FROM Clase
          WHERE tip = 'vas de linie' AND (deplasament > min_deplasament AND deplasament < max_deplasament)
          ORDER BY tara DESC, deplasament ASC;
END