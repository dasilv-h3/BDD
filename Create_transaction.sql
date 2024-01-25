
BEGIN TRANSACTION

INSERT INTO `s_occupe` (`medecin_id`, `examen_id`) VALUES
(1, 1), 
(2, 2), 
(4, 3),
(16, 4), 
(17, 5),

SELECT * FROM Mavue 
    
WHERE (SELECT COUNT(*) FROM mavue) > 5
ROLLBACK
OR 
WHERE (SELECT COUNT(*) FROM mavue) < 5
COMMIT
   