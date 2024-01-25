DELIMITER //

CREATE PROCEDURE checkSupHour()
BEGIN
    DECLARE nb_row INT;

    SELECT COUNT(*) INTO nb_row FROM vue_medecin_rdv;

    IF nb_row > 5 THEN
       
        ROLLBACK;
    ELSE

        INSERT INTO `s_occupe` (`medecin_id`, `examen_id`) VALUES
        (1, 1), 
        (2, 2),  
        (4, 3),
        (16, 4), 
        (17, 5);
        COMMIT;
    END IF;
END //

DELIMITER ;
