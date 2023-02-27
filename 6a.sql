CREATE OR REPLACE PROCEDURE get_max_diameter_tara()
SELECT tara AS "TARA"
           FROM Clase
           WHERE clasa IN (SELECT clasa
                          FROM Clase
                          WHERE diametru_tun = (SELECT MAX(diametru_tun)
                                              FROM Clase
                                              WHERE tip = 'cuirasat') AND tip = 'cuirasat');
END