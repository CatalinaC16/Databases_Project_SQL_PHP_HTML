CREATE OR REPLACE PROCEDURE get_distinct_non_kongo_ships(IN Cls Varchar(25))
 SELECT DISTINCT nume AS "NUME"
           FROM Nave n JOIN Consecinte c ON (n.nume = c.nava)
           WHERE c.batalie IN (SELECT batalie
                              FROM Consecinte c JOIN Nave n ON (n.nume = c.nava)
                              WHERE n.clasa = Cls) AND n.clasa <> Cls;
END