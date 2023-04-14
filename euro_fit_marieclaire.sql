-- Création de la base de données si elle n'existe pas
CREATE SCHEMA IF NOT EXISTS euro_fit_marieclaire
-- on défini le codage des caractères
DEFAULT CHARACTER SET utf8mb4;

-- on utilise la base de données créée
USE euro_fit_marieclaire;

-- on commence par les feuilles tel que les tables les plus éloignées

-- Si elle n'existe pas on crée la table admnistrateur
CREATE TABLE IF NOT EXISTS admnistrateur
(
-- id_admin en auto increment et non nulle c'est un int
id_admin INT NOT NULL AUTO_INCREMENT, 

-- id_admin est non nulle c'est un text de 25 caractères
login VARCHAR(25) NOT NULL,
password VARCHAR(256) NOT NULL,

-- la clé primaire est id_admin
PRIMARY KEY (id_admin)
);

-- Si elle n'existe pas on crée la table 
CREATE TABLE IF NOT EXISTS type_abonnement
(
id_type_abo INT NOT NULL AUTO_INCREMENT, 
type_abo  VARCHAR(50) NOT NULL,
PRIMARY KEY (id_type_abo)
);

CREATE TABLE IF NOT EXISTS abonnement
(
abonnement_id INT NOT NULL AUTO_INCREMENT, 
id_type_abo  INT,
acces_tous_clubs boolean,
acces_toutes_salles boolean,
activites_collectives boolean,
coach boolean,
facture_abonnement float,
PRIMARY KEY (abonnement_id),

-- on défini la clé étrangère avec le nom fk_id_type_abonnement
-- elle fait le lien en id_type_abo de notre table et
-- id_type_abo de la table type_abonnement
CONSTRAINT `fk_id_type_abonnement` FOREIGN KEY (id_type_abo) REFERENCES type_abonnement (id_type_abo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS medecin
(
medecin_id INT NOT NULL AUTO_INCREMENT, 
certificat_medical VARCHAR(50) NOT NULL,
nom_medecin VARCHAR(50) NOT NULL,
PRIMARY KEY (medecin_id)
);

CREATE TABLE IF NOT EXISTS assurance
(
numero_assure INT NOT NULL, 
membre_id INT NOT NULL,
nom_assurance VARCHAR(50) NOT NULL,
PRIMARY KEY (numero_assure)
);



CREATE TABLE IF NOT EXISTS membres
(
membre_id INT NOT NULL AUTO_INCREMENT, 
nom VARCHAR(50) NOT NULL,
prenom VARCHAR(50) NOT NULL,		
medecin_id INT,
abonnement_id INT,
numero_assure INT,	
PRIMARY KEY (membre_id),
 CONSTRAINT `fk_id_medecin2` FOREIGN KEY (medecin_id) REFERENCES medecin (medecin_id) ON DELETE SET NULL ON UPDATE CASCADE,
 CONSTRAINT `fk_id_abonnement` FOREIGN KEY (abonnement_id) REFERENCES abonnement (abonnement_id) ON DELETE SET NULL ON UPDATE CASCADE,
 CONSTRAINT `fk_id_numero_assure2` FOREIGN KEY (numero_assure) REFERENCES assurance (numero_assure) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS salles_activites
(
type_activites INT NOT NULL AUTO_INCREMENT,
typ_e varchar(50), 
PRIMARY KEY (type_activites)
);


CREATE TABLE IF NOT EXISTS salles
(
salle_id INT NOT NULL AUTO_INCREMENT,
type_activites INT NOT NULL, 
reserve boolean,
PRIMARY KEY (salle_id),
 CONSTRAINT `fk_id_type_activites` FOREIGN KEY (type_activites) REFERENCES salles_activites(type_activites)  
);


CREATE TABLE IF NOT EXISTS clubs
(
club_id INT NOT NULL AUTO_INCREMENT,
superficie INT, 
nom_club VARCHAR(50) NOT NULL,
membre_id INT not null,
salle_id int not null,
PRIMARY KEY (club_id),
  CONSTRAINT `fk_id_membre3` FOREIGN KEY (membre_id) REFERENCES membres (membre_id)  ON UPDATE CASCADE,
  CONSTRAINT `fk_id_salles` FOREIGN KEY (salle_id) REFERENCES salles (salle_id)  ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS caisses
(
caisse_id INT NOT NULL AUTO_INCREMENT, 
facture_magasin FLOAT NOT NULL,
facture_abonnement FLOAT NOT NULL,
montant_total FLOAT NOT NULL,
membre_id INT,
PRIMARY KEY (caisse_id),
 CONSTRAINT `fk_id_membre5` FOREIGN KEY (membre_id) REFERENCES membres (membre_id)  ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS magasin
(
magasin_id INT NOT NULL AUTO_INCREMENT, 
nrj_drinks INT,
antalgiques INT,
facture_magasin FLOAT,
outfit INT,
membre_id INT NOT NULL,
PRIMARY KEY (magasin_id),
 CONSTRAINT `fk_id_membre6` FOREIGN KEY (membre_id) REFERENCES membres (membre_id)  ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS coordonnees
(
coordonnees_id INT NOT NULL AUTO_INCREMENT, 
adresse_complete VARCHAR(256) NOT NULL,
telephone VARCHAR(15) NOT NULL,
mail_sportif VARCHAR(50) NOT NULL,
membre_id INT, 		
medecin_id INT,
club_id INT,
numero_assure INT,	
PRIMARY KEY (coordonnees_id),
-- on peut avoir plusieurs clés étrangère
 CONSTRAINT `fk_id_membre` FOREIGN KEY (membre_id) REFERENCES membres (membre_id) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT `fk_id_medecin` FOREIGN KEY (medecin_id) REFERENCES medecin (medecin_id) ON DELETE SET NULL ON UPDATE CASCADE,
 CONSTRAINT `fk_id_club` FOREIGN KEY (club_id) REFERENCES clubs (club_id) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT `fk_id_numero_assure` FOREIGN KEY (numero_assure) REFERENCES assurance (numero_assure) ON DELETE SET NULL ON UPDATE CASCADE
);

