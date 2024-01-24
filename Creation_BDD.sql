CREATE DATABASE IF NOT EXISTS Hopital;
USE Hopital;

CREATE TABLE IF NOT EXISTS Persona (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    naissance DATE,
    tel VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Patient (
	id INT PRIMARY KEY,
	genre VARCHAR(255),
    taille FLOAT,
    poids FLOAT,
    antecedent VARCHAR(255),
    CONSTRAINT fk_patient FOREIGN KEY (id) REFERENCES Persona(id)
);

CREATE TABLE IF NOT EXISTS Dossier_Medical (
	id INT PRIMARY KEY AUTO_INCREMENT,
    resultat VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Medecin (
	id INT PRIMARY KEY,
	specialisation VARCHAR(255),
    annee_pratique INT,
    diplome VARCHAR(255),
    CONSTRAINT fk_medecin FOREIGN KEY (id) REFERENCES Persona(id)
);

CREATE TABLE IF NOT EXISTS Salle (
	numero INT PRIMARY KEY,
    type VARCHAR(255),
    superficie INT
);

CREATE TABLE IF NOT EXISTS Examen (
	id INT PRIMARY KEY AUTO_INCREMENT,
    duree INT,
    date DATE,
    type VARCHAR(255),
    numero INT,
    FOREIGN KEY (numero) REFERENCES Salle(numero),
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(id),
    medecin_id INT,
    FOREIGN KEY (medecin_id) REFERENCES Medecin(id)
);

ALTER TABLE Dossier_Medical
ADD COLUMN patient_id INT,
ADD FOREIGN KEY (patient_id) REFERENCES Patient(id);

-- Insertion de données dans la table PERSONA
INSERT INTO PERSONA (Id, Nom, Prenom, Email, Naissance, Tel) VALUES
(1, 'Dupont', 'Jean', 'jean.dupont@example.com', '1990-01-01', '1234567890'),
(2, 'Martin', 'Sophie', 'sophie.martin@example.com', '1985-05-15', '9876543210');
-- Insertion de données dans la table MEDECIN
INSERT INTO MEDECIN (Id, Specialisation, Annee_Pratique, Diplome) VALUES
(1, 'Cardiologue', 10, 'Docteur en médecine'),
(2, 'Dermatologue', 8, 'Docteur en médecine');
-- Insertion de données dans la table PATIENT
INSERT INTO PATIENT (Id, Genre, Taille, Poids, Antecedent) VALUES
(1, 'Homme', 175, 75, 'Aucun antécédent'),
(2, 'Femme', 160, 60, 'Allergie aux noix');
-- Insertion de données dans la table SALLE 
INSERT INTO SALLE (Numero, type, Superficie) VALUES
(101, 'Consultation', 30),
(201, 'Radiologie', 50);

-- Insertion de données dans la table EXAMEN
INSERT INTO EXAMEN (Id, Duree, Date, Type, Numero, Patient_Id) VALUES
(1, 60, '2024-01-01', 'IRM', 201, 1),
(2, 30, '2024-02-01', 'Électrocardiogramme', 101, 2);

-- Insertion de données dans la table DOSSIER_MEDICAL 
INSERT INTO DOSSIER_MEDICAL (Id, Resultat, Patient_Id) VALUES
(1, 'Résultat normal', 1),
(2, 'Réaction allergique mineure', 2);