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

CREATE TABLE IF NOT EXISTS S_Occupe (
	id INT PRIMARY KEY AUTO_INCREMENT,
    medecin_id INT,
    FOREIGN KEY (medecin_id) REFERENCES Medecin(id),
    examen_id INT,
    FOREIGN KEY (examen_id) REFERENCES Examen(id)
);

ALTER TABLE Dossier_Medical
ADD COLUMN patient_id INT,
ADD FOREIGN KEY (patient_id) REFERENCES Patient(id);

-- Insertion de données dans la table PERSONA
INSERT INTO Persona (nom, prenom, email, naissance, tel) VALUES
('Martin', 'Sophie', 'sophie.martin@example.com', '1985-05-15', '0678901234'),
('Dubois', 'Pierre', 'pierre.dubois@example.com', '1992-03-22', '0612345678'),
('Lefevre', 'Emma', 'emma.lefevre@example.com', '1988-12-10', '0698765432'),
('Moreau', 'Luc', 'luc.moreau@example.com', '1975-08-05', '0654321098'),
('Leroy', 'Camille', 'camille.leroy@example.com', '1990-02-28', '0687654321'),
('Roux', 'Antoine', 'antoine.roux@example.com', '1982-07-17', '0601234567'),
('Durand', 'Alicia', 'alicia.durand@example.com', '1987-11-30', '0678901234'),
('Leclerc', 'Louis', 'louis.leclerc@example.com', '1995-09-03', '0612345678'),
('Girard', 'Chloé', 'chloe.girard@example.com', '1980-04-20', '0698765432'),
('Fournier', 'Paul', 'paul.fournier@example.com', '1978-06-12', '0654321098'),
('Lopez', 'Juliette', 'juliette.lopez@example.com', '1993-01-25', '0687654321'),
('Mercier', 'Martin', 'martin.mercier@example.com', '1983-10-08', '0601234567'),
('Robin', 'Elise', 'elise.robin@example.com', '1989-04-18', '0678901234'),
('Clement', 'Alexandre', 'alexandre.clement@example.com', '1986-08-01', '0612345678'),
('Lemoine', 'Charlotte', 'charlotte.lemoine@example.com', '1977-12-05', '0698765432'),
('Renard', 'Gabriel', 'gabriel.renard@example.com', '1991-02-14', '0654321098'),
('Philippe', 'Léa', 'lea.philippe@example.com', '1981-06-23', '0687654321'),
('Garnier', 'Hugo', 'hugo.garnier@example.com', '1994-09-16', '0601234567'),
('Marchand', 'Manon', 'manon.marchand@example.com', '1984-11-09', '0678901234'),
('Lamy', 'Nathan', 'nathan.lamy@example.com', '1979-03-28', '0612345678');

SELECT * FROM Persona;

-- Insertion de données dans la table MEDECIN
INSERT INTO MEDECIN (id, Specialisation, Annee_Pratique, Diplome) VALUES
(1, 'Cardiologue', 10, 'Docteur en médecine'),
(2, 'Dermatologue', 8, 'Docteur en médecine');

-- Insertion de données dans la table PATIENT
INSERT INTO PATIENT (id, Genre, Taille, Poids, Antecedent) VALUES
(3, 'Homme', 175, 75, 'Aucun antécédent'),
(4, 'Femme', 160, 60, 'Allergie aux noix'),
(5, 'Homme', 175, 80, 'Hypertension'),
(12, 'Femme', 160, 60, 'Asthme'),
(8, 'Homme', 170, 75, 'Aucun antécédent'),
(7, 'Homme', 170, 75, 'Aucun antécédent'),
(9, 'Femme', 163, 60, 'Aucun antécédent');

-- Insertion de données dans la table SALLE
INSERT INTO SALLE (Numero, Type, Superficie) VALUES
(101, 'Consultation', 30),
(102, 'Radiologie', 50),
(103, 'Chirurgie', 40),
(104, 'Consultation', 35),
(105, 'Radiologie', 55),
(106, 'Chirurgie', 45),
(107, 'Consultation', 32),
(108, 'Radiologie', 48),
(109, 'Chirurgie', 38),
(110, 'Consultation', 33),
(201, 'Radiologie', 50),
(202, 'Chirurgie', 40),
(203, 'Consultation', 35),
(204, 'Radiologie', 55),
(205, 'Chirurgie', 45),
(206, 'Consultation', 32),
(207, 'Radiologie', 48),
(208, 'Chirurgie', 38),
(209, 'Consultation', 33),
(210, 'Radiologie', 50),
(301, 'Chirurgie', 40),
(302, 'Consultation', 35),
(303, 'Radiologie', 55),
(304, 'Chirurgie', 45),
(305, 'Consultation', 32),
(306, 'Radiologie', 48),
(307, 'Chirurgie', 38),
(308, 'Consultation', 33),
(309, 'Radiologie', 50),
(310, 'Chirurgie', 40);

-- Insertion de données dans la table EXAMEN
INSERT INTO EXAMEN (Duree, Date, Type, Numero, Patient_Id) VALUES
(420, '2024-01-01', 'IRM', 201, 3),
(30, '2024-02-05', 'Électrocardiogramme', 101, 4),
(45, '2024-01-09', 'Radiographie', 205, 5),
(20, '2024-01-15', 'Échographie', 109, 12),
(40, '2024-01-12', 'Operation du coeur', 308, 8),
(25, '2024-01-15', 'IRM', 206, 7),
(35, '2024-01-04', 'Électrocardiogramme', 304, 9);

-- Insertion de données dans la table S_OCCUPE
INSERT INTO S_OCCUPE (Medecin_id, Examen_id) VALUES
(1, 1),
(2, 2);

-- Insertion de données dans la table DOSSIER_MEDICAL
INSERT INTO DOSSIER_MEDICAL (Resultat, Patient_id) VALUES
('Résultat normal', 3),
('Réaction allergique mineure', 4),
('Diagnostic en attente', 5),
('Aucune anomalie détectée', 12),
('Résultat normal', 8),
('En cours d\'analyse', 7),
('Résultat normal', 9);