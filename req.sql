-- Créer une base de données
CREATE DATABASE td_php_2_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
-- se mettre dans la db
use td_php_2_db;
-- Créer la table telephone
CREATE TABLE telephone(
id INT NOT NULL AUTO_INCREMENT,
indicatif INT(4) NOT NULL,
numero INT(10) NOT NULL,
is_mobile BOOLEAN NOT NULL,
CONSTRAINT pk_id_telephone PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE societe(
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR (255) NOT NULL,
id_telephone INT NULL,
CONSTRAINT pk_id_societe PRIMARY KEY(id),
CONSTRAINT fk_id_telephone FOREIGN KEY (id_telephone) REFERENCES telephone(id) ON DELETE SET NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DROP TABLE societe;

CREATE TABLE competence(
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR (255) NOT NULL,
CONSTRAINT pk_id_competence PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE developpeur(
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR (255) NOT NULL,
prenom VARCHAR (255) NOT NULL,
email VARCHAR (255) NOT NULL,
tarif_journee INT (4) NOT NULL,
CONSTRAINT pk_id_developpeur PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE developpeur_competence(
id_developpeur INT NOT NULL,
id_competence INT NOT NULL,
CONSTRAINT pk_developpeur_competence PRIMARY KEY(id_developpeur,id_competence),
CONSTRAINT fk_id_developpeur FOREIGN KEY(id_developpeur) REFERENCES developpeur(id) ON DELETE CASCADE,
CONSTRAINT fk_id_competence FOREIGN KEY(id_competence) REFERENCES competence(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE statut(
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR (255) NOT NULL,
CONSTRAINT pk_id_statut PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE projet(
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR (255) NOT NULL,
budget INT NOT NULL,
nb_jours INT NOT NULL,
id_telephone INT NULL,
id_chef_projet INT NULL,
id_statut INT NULL,
CONSTRAINT pk_id_projet PRIMARY KEY(id),
CONSTRAINT fk_id_projet_telephone FOREIGN KEY(id_telephone) REFERENCES telephone(id) ON DELETE SET NULL,
CONSTRAINT fk_id_chef_projet FOREIGN KEY(id_chef_projet) REFERENCES developpeur(id) ON DELETE SET NULL,
CONSTRAINT fk_id_statut FOREIGN KEY(id_statut) REFERENCES statut(id) ON DELETE SET NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE projet_developpeur(
id_projet INT NOT NULL,
id_developpeur INT NOT NULL,
CONSTRAINT pk_projet_developpeur PRIMARY KEY(id_projet,id_developpeur),
CONSTRAINT fk_id_projet_developpeur FOREIGN KEY (id_projet) REFERENCES projet(id) ON DELETE CASCADE,
CONSTRAINT fk_id_developpeur_projet FOREIGN KEY (id_developpeur) REFERENCES developpeur(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;