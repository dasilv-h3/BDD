CREATE VIEW Vue_Medecin_RDV AS
SELECT
    Persona.nom,
    Persona.prenom,
    Medecin.specialisation,
    COUNT(Examen.id) AS nombre_rdv
FROM
    Medecin
JOIN
    Persona ON Medecin.id = Persona.id
JOIN
    S_Occupe ON Medecin.id = S_Occupe.medecin_id
JOIN
    Examen ON S_Occupe.examen_id = Examen.id
GROUP BY
    Medecin.id, Persona.nom, Persona.prenom, Medecin.specialisation
HAVING
    (SUM(Examen.duree) / 60) < 7;