-- Création de la base de données et choix de l'encodage
CREATE DATABASE IF NOT EXISTS films 
CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE films;


-- Création des différentes tables et de leur relation

-- creéation de la table cinéma
CREATE TABLE cinéma (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    localisation VARCHAR(100) NOT NULL,
    paiement_en_ligne BOOLEAN NOT NULL
);

ALTER TABLE cinéma ENGINE = InnoDB;

-- ajout de valeur dans la colone cinéma
INSERT INTO cinéma (`nom`, `localisation`, `paiement_en_ligne`)
VALUES
('cinéma central', '14 rue de Jaures, Paris', TRUE),
('cinéma simpa', '20 rue de la Martinique, Paris', TRUE),
('cinéma cool', '34 rue du MontBlanc, Paris', FALSE);


-- création de la table salle et de sa relation avec cinema 
CREATE TABLE salle (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
     nombre_de_place INT NOT NULL,
    id_cinéma INT NOT NULL,
    CONSTRAINT fk_salle_cinéma
    FOREIGN KEY (id_cinéma) REFERENCES cinéma (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

ALTER TABLE salle ENGINE = InnoDB;
 
 -- ajout de valeur dans la colone salle
INSERT INTO salle (`nom`, `nombre_de_place`, `id_cinéma`)
VALUES
('salle Louis', 200, 2),
('salle Jaune', 200, 3),
('salle Molière', 200, 2),
('salle Ricardo', 200, 2),
('salle n°4', 200, 1),
('salle Pokémon', 200, 2),
('salle bleue', 200, 3),
('salle n°5', 200, 1),
('salle n°3', 200, 1),
('salle n°2', 200, 1),
('salle n°1', 200, 1);


-- création de la table séance
CREATE TABLE séance (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titre_film VARCHAR(50) NOT NULL,
    horaire DATETIME NOT NULL,
    durée TIME
);

 ALTER TABLE séance ENGINE = InnoDB;

-- ajout des données à table
INSERT INTO séance (titre_film, horaire) VALUES ('My Cousin Rachel', '2021-12-05 18:02:46' );
INSERT INTO séance (titre_film, horaire) VALUES ('Firaaq', '2021-04-01 09:27:31');
INSERT INTO séance (titre_film, horaire) VALUES ('Lamerica', '2021-02-22 16:29:01' );
INSERT INTO séance (titre_film, horaire) VALUES ('Ex-Girlfriends', '2021-07-30 20:43:29' );
INSERT INTO séance (titre_film, horaire) VALUES ('The Last Five Years', '2021-12-12 17:42:53');
INSERT INTO séance (titre_film, horaire) VALUES ('In Vanda''s Room (No Quarto da Vanda)', '2021-07-06 07:39:04');
INSERT INTO séance (titre_film, horaire) VALUES ('Throw Momma from the Train', '2021-05-15 21:25:32' );
INSERT INTO séance (titre_film, horaire) VALUES ('Thy Womb (Sinapupunan)', '2021-11-13 17:31:03');
INSERT INTO séance (titre_film, horaire) VALUES ('Diario de un skin', '2021-09-07 20:37:59' );
INSERT INTO séance (titre_film, horaire) VALUES ('Epitaph', '2021-10-06 06:49:47');
INSERT INTO séance (titre_film, horaire) VALUES ('Hole in the Soul, A (Rupa u dusi)', '2021-05-05 14:33:27');
INSERT INTO séance (titre_film, horaire) VALUES ('Vengeance: The Story of Tony Cimo', '2021-11-15 13:22:31');
INSERT INTO séance (titre_film, horaire) VALUES ('Awakening, The', '2021-11-07 17:18:56');
INSERT INTO séance (titre_film, horaire) VALUES ('Kim', '2021-11-18 12:53:21');
INSERT INTO séance (titre_film, horaire) VALUES ('Laugh, Clown, Laugh', '2021-11-17 01:14:06');
INSERT INTO séance (titre_film, horaire) VALUES ('Killer Elite, The', '2021-09-22 17:29:24');
INSERT INTO séance (titre_film, horaire) VALUES ('Gorgeous Hussy, The', '2021-03-05 19:37:48' );
INSERT INTO séance (titre_film, horaire) VALUES ('Spy Next Door, The', '2021-03-02 01:01:41');
INSERT INTO séance (titre_film, horaire) VALUES ('Brother''s Kiss, A', '2021-08-25 01:48:11' );
INSERT INTO séance (titre_film, horaire) VALUES ('Lake, A (Un lac)', '2021-02-22 16:25:29');
 

--  création de la table de liaison salle séance
CREATE TABLE salle_séance ( 
    id_séance INT NOT NULL,  id_salle INT NOT NULL,
    CONSTRAINT fk_salle_salle_séance
    FOREIGN KEY (id_salle) REFERENCES salle (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_séance_salle_séance
    FOREIGN KEY (id_séance) REFERENCES séance (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (id_séance, id_salle)
 );

ALTER TABLE salle_séance ENGINE = InnoDB;

-- Ajout des valeurs à la table d
INSERT INTO salle_séance (id_salle, id_séance) VALUES (10, 16);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (5, 11);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (2, 8);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (1, 5);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (3, 7);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (6, 2);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (9, 12);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (9, 6);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (4, 17);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (5, 3);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (2, 18);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (7, 7);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (10, 11);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (9, 20);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (4, 19);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (9, 13);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (2, 5);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (6, 14);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (7, 12);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (2, 4);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (2, 2);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (6, 12);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (9, 15);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (11, 19);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (7, 19);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (8, 11);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (1, 10);
INSERT INTO salle_séance (id_salle, id_séance) VALUES (3, 6);
 
--  création de la table tarif
CREATE TABLE tarif (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    valeur FLOAT
);

ALTER TABLE tarif ENGINE = InnoDB;

-- Ajout des valeurs à tarif
INSERT INTO tarif (`nom`, `valeur`)
VALUES
('Plein tarif', 9.20),
('Etudiant', 7.60),
('Moins de 14 ans', 5.90);


-- Création de la table rôle
CREATE TABLE rôle (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    description_du_rôle TEXT 
);

ALTER TABLE rôle ENGINE = InnoDB;

-- Ajout des valeurs dans rôle
INSERT INTO rôle (`nom`, `description_du_rôle`)
VALUES
('adminstrateur', 'Il posséde une vision sur la totalité des cinémas et peut ajouter, ou enlever des séances la ou il le souhaitent'),
('utilisateur particulier', 'Il peut modifier, ajouter et retirer les séances de son complexe uniquement');


-- création de la table utilisateur et de sa relation avec cinema et rôle 
CREATE TABLE utilisateur (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    mot_de_passe VARCHAR(100) NOT NULL,
    id_cinéma INT NOT NULL,
    id_rôle INT NOT NULL,
    CONSTRAINT fk_utilisateur_cinéma
    FOREIGN KEY (id_cinéma) REFERENCES cinéma (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_utilisateur_rôle
    FOREIGN KEY (id_rôle) REFERENCES utilisateur (id) ON DELETE RESTRICT ON UPDATE CASCADE
 );

ALTER TABLE utilisateur ENGINE = InnoDB;

-- Ajout des valeurs dans rôle
INSERT INTO utilisateur (`email`, `mot_de_passe`, `id_cinéma`, `id_rôle`)
VALUES
('markBLUES@whynot.com', '$2y$10$WoiM8poPoYb2rpmPgS5HZeKDxkGmFfzuIfduc/6/UzcALMHmD879K', 1, 1),
('PierreMon@whynot.com', '$2y$10$a1Kbjy8OlG1nOBAvzyeYAefzP3hAKsWD37/Ruzi/oGQLsVwvEaEa2', 2, 2),
('lucasUES@whynot.com', '$2y$10$mDbhOszHUqVlj.vL5RCtgOnyKJ8Tz9Tee772F74h7R9OTaJyzXM2m', 1, 1),
('DavisJob5@whynot.com', '$2y$10$k6NIziiV6QByrq09m0wl8OG/D6I9actxmDX3hIVpxvHP/UH/kuadG', 3, 2);



