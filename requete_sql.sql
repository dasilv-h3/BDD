/*Requête SQL*/

/*Contexte : Lorsqu’un patient se présente pour avoir un RDV, 
on essaye de trouver des disponibilités pour les médecin qui ont fait moins de 7H de travail 
(pour éviter au maximum les heures sup)*/

SELECT persona.Nom, persona.Prenom, medecin.Specialisation, 
COUNT(examen.Id) AS nombre_rdv
FROM medecin
JOIN persona ON medecin.Id = persona.Id
JOIN s_occupe ON medecin.Id = s_occupe.Medecin_Id
JOIN examen ON s_occupe.examen_id = examen.id
GROUP BY medecin.Id, persona.Nom, persona.Prenom, medecin.Specialisation
HAVING (SUM(examen.Duree)/60) < 7;

/*Contexte : On souhaite obtenir les salles avec les plus grandes 
superficies pour les réaménager en salle d’opération ou de radiologie */

SELECT *
FROM salle
ORDER BY Superficie DESC
LIMIT 3;

/*Contexte : On souhaite afficher sur le site de l’établissement les soins et examens pratiquées*/

SELECT DISTINCT type 
FROM examen;

/*Contexte : A la demande du conseil des hôpitaux de Paris, le groupe sanguin du patient doit être enregistré dans la base de donnée*/

ALTER TABLE PATIENT
ADD COLUMN group_sanguin VARCHAR(3);


/*Contexte : Aucun contexte adapté à notre BDD. Nous souhaitons avoir le nom prénom 
et l’id de toutes les personnes de la boite employé comme administrateur dans une seule table. 
Comme les attributs dans les deux tables sont les mêmes on peut les unir.*/

SELECT nom, prenom, id
FROM EMPLOYE
UNION 
SELECT nom, prenom, id 
FROM ADMIN;


/*Contexte : On souhaite répertorier sur un mois, les différentes opérations pratiquées dans l’établissement*/

SELECT type, date 
FROM examen
WHERE type LIKE '%opération%' 
AND 
date BETWEEN '2024-01-01' AND '2024-01-31';

/*Contexte : On souhaite chaque année, 
classée les dossier médicaux dans un fichier Excel, 
vider la table et remettre à zéro les ID pour plus de visibilité*/

TRUNCATE TABLE dossier_medical;


/*Contexte : Déterminer les différents type de salle*/

SELECT Numero, Type, Superficie,
  CASE
    WHEN Superficie > 100 THEN 'Salle pour chirurgie'
    WHEN Superficie <= 100 THEN 'Salle de consultation'
  END AS Taille_de_piece
FROM SALLE;


/*Contexte : Changement de corps mdédical*/
DROP TABLE MEDECIN;

/*Contexte : explication de la requête propriété*/
EXPLAIN  SELECT Numero, Type, Superficie,
  CASE
    WHEN Superficie > 100 THEN 'Salle pour chirurgie'
    WHEN Superficie <= 100 THEN 'Salle de consultation'
  END AS Taille_de_piece
FROM SALLE;


/* Contexte : après analyse sanguine, on se rend compte que le patient n'était pas à jeun 
donc on set le résultat comme "invalide"*/
UPDATE dossier_medical
SET resultat = "INVALIDE"
WHERE id IN (1, 2);

