#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: promotion
#------------------------------------------------------------

CREATE TABLE promotion(
        session               Int NOT NULL ,
        annee                 Year NOT NULL ,
        intitule              Varchar (25) NOT NULL ,
        specialite            Varchar (50) ,
        lieu                  Varchar (50) NOT NULL ,
        session_enseignements Int NOT NULL ,
        PRIMARY KEY (session )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: suivi_appr
#------------------------------------------------------------

CREATE TABLE suivi_appr(
        num_inscription        Int NOT NULL ,
        evaluation             Varchar (25) NOT NULL ,
        feuille_presence       Varchar (25) NOT NULL ,
        situation_professionel Varchar (80) NOT NULL ,
        PRIMARY KEY (num_inscription )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: apprenants
#------------------------------------------------------------

CREATE TABLE apprenants(
        num_inscription   Int NOT NULL ,
        nom               Varchar (50) ,
        prenom            Varchar (50) NOT NULL ,
        date_de_naissance Date NOT NULL ,
        adresse           Varchar (80) NOT NULL ,
        ville             Varchar (50) ,
        photo             Varchar (255) ,
        telephone         Varchar (12) ,
        mail              Varchar (80) ,
        PRIMARY KEY (num_inscription )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: formateurs
#------------------------------------------------------------

CREATE TABLE formateurs(
        num_inscription   Int NOT NULL ,
        nom               Varchar (50) NOT NULL ,
        prenom            Varchar (50) NOT NULL ,
        date_de_naissance Date NOT NULL ,
        adresse           Varchar (80) NOT NULL ,
        ville             Varchar (80) NOT NULL ,
        telephone         Varchar (12) ,
        email             Varchar (50) ,
        photo             Varchar (255) ,
        PRIMARY KEY (num_inscription )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: enseignements
#------------------------------------------------------------

CREATE TABLE enseignements(
        session                        Int NOT NULL ,
        maquetter_appli                Varchar (25) NOT NULL ,
        concevoir_bdd                  Varchar (25) NOT NULL ,
        mettre_en_place_bdd            Varchar (25) NOT NULL ,
        dvp_interface_utilisateur      Varchar (25) NOT NULL ,
        dvp_componsants_acces_donnees  Varchar (25) NOT NULL ,
        dvp_page_web_dynamique         Varchar (25) NOT NULL ,
        solution_de_gestion_de_contenu Varchar (25) NOT NULL ,
        utiliser_anglais               Varchar (25) NOT NULL ,
        dvp_rwd                        Varchar (25) NOT NULL ,
        session_promotion              Int NOT NULL ,
        num_inscription                Int NOT NULL ,
        PRIMARY KEY (session )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: stage
#------------------------------------------------------------

CREATE TABLE stage(
        id_stage          int (11) Auto_increment  NOT NULL ,
        entreprise        Varchar (50) NOT NULL ,
        date_stage        Date NOT NULL ,
        tuteur            Varchar (25) NOT NULL ,
        lieu              Varchar (50) NOT NULL ,
        etat_d_avancement Varchar (25) NOT NULL ,
        num_inscription   Int NOT NULL ,
        PRIMARY KEY (id_stage )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: enseigne
#------------------------------------------------------------

CREATE TABLE enseigne(
        num_inscription            Int NOT NULL ,
        num_inscription_formateurs Int NOT NULL ,
        PRIMARY KEY (num_inscription ,num_inscription_formateurs )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: renseigne
#------------------------------------------------------------

CREATE TABLE renseigne(
        num_inscription            Int NOT NULL ,
        num_inscription_suivi_appr Int NOT NULL ,
        PRIMARY KEY (num_inscription ,num_inscription_suivi_appr )
)ENGINE=InnoDB;

ALTER TABLE promotion ADD CONSTRAINT FK_promotion_session_enseignements FOREIGN KEY (session_enseignements) REFERENCES enseignements(session);
ALTER TABLE enseignements ADD CONSTRAINT FK_enseignements_session_promotion FOREIGN KEY (session_promotion) REFERENCES promotion(session);
ALTER TABLE enseignements ADD CONSTRAINT FK_enseignements_num_inscription FOREIGN KEY (num_inscription) REFERENCES formateurs(num_inscription);
ALTER TABLE stage ADD CONSTRAINT FK_stage_num_inscription FOREIGN KEY (num_inscription) REFERENCES apprenants(num_inscription);
ALTER TABLE enseigne ADD CONSTRAINT FK_enseigne_num_inscription FOREIGN KEY (num_inscription) REFERENCES apprenants(num_inscription);
ALTER TABLE enseigne ADD CONSTRAINT FK_enseigne_num_inscription_formateurs FOREIGN KEY (num_inscription_formateurs) REFERENCES formateurs(num_inscription);
ALTER TABLE renseigne ADD CONSTRAINT FK_renseigne_num_inscription FOREIGN KEY (num_inscription) REFERENCES formateurs(num_inscription);
ALTER TABLE renseigne ADD CONSTRAINT FK_renseigne_num_inscription_suivi_appr FOREIGN KEY (num_inscription_suivi_appr) REFERENCES suivi_appr(num_inscription);
