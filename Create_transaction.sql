
BEGIN TRANSACTION

INSERT INTO `s_occupe` (`medecin_id`, `examen_id`) VALUES
(1, 1), 
(2, 2), 
(4, 3),
(16, 4), 
(17, 5),

SELECT * FROM Mavue 
    
CASE
    WHEN (SELECT COUNT(*) FROM mavue) > 5 THEN ROLLBACK
    WHEN (SELECT COUNT(*) FROM mavue) < 5 THEN COMMIT
END