CREATE OR REPLACE PROCEDURE get_num_distinct_classes_by_battle_result()
BEGIN
    SELECT c.batalie AS "BATALIE", c.rezultat AS "REZULTAT", COUNT(DISTINCT clasa) AS "NUMAR"
           FROM Consecinte c JOIN Nave n ON (n.nume = c.nava)
           GROUP BY c.batalie, c.rezultat
           ORDER BY batalie;
END
