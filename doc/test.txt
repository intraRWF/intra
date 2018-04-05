#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: promotion
#------------------------------------------------------------

CREATE TABLE promotion(
        id_promo        int (11) Auto_increment  NOT NULL ,
        annee           Year NOT NULL ,
        intitule        Varchar (25) NOT NULL ,
        specialite      Varchar (50) ,
        lieu            Varchar (50) NOT NULL ,
        id_enseignement Int NOT NULL ,
        PRIMARY KEY (id_promo )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: apprenants
#------------------------------------------------------------

CREATE TABLE apprenants(
        id_app                int (11) Auto_increment  NOT NULL ,
        nom_app               Varchar (50) ,
        prenom_app            Varchar (50) NOT NULL ,
        date_de_naissance_app Date NOT NULL ,
        adresse_app           Varchar (80) NOT NULL ,
        ville_app             Varchar (50) ,
        photo_app             Varchar (255) ,
        tel_app               Varchar (12) ,
        mail_app              Varchar (80) ,
        status                Varchar (25) NOT NULL ,
        pass                  Varchar (25) NOT NULL ,
        auth                  Bool NOT NULL ,
        id_promo              Int NOT NULL ,
        PRIMARY KEY (id_app )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: formateurs
#------------------------------------------------------------

CREATE TABLE formateurs(
        id_formateur      int (11) Auto_increment  NOT NULL ,
        nom               Varchar (50) NOT NULL ,
        prenom            Varchar (50) NOT NULL ,
        date_de_naissance Date NOT NULL ,
        adresse           Varchar (80) NOT NULL ,
        ville             Varchar (80) NOT NULL ,
        telephone         Varchar (12) ,
        email             Varchar (50) ,
        photo             Varchar (255) ,
        PRIMARY KEY (id_formateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: enseignements
#------------------------------------------------------------

CREATE TABLE enseignements(
        id_enseignement                int (11) Auto_increment  NOT NULL ,
        maquetter_appli                Varchar (25) NOT NULL ,
        concevoir_bdd                  Varchar (25) NOT NULL ,
        mettre_en_place_bdd            Varchar (25) NOT NULL ,
        dvp_interface_utilisateur      Varchar (25) NOT NULL ,
        dvp_componsants_acces_donnees  Varchar (25) NOT NULL ,
        dvp_page_web_dynamique         Varchar (25) NOT NULL ,
        solution_de_gestion_de_contenu Varchar (25) NOT NULL ,
        utiliser_anglais               Varchar (25) NOT NULL ,
        dev_responsive                 Varchar (25) NOT NULL ,
        PRIMARY KEY (id_enseignement )
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
        id_app            Int NOT NULL ,
        PRIMARY KEY (id_stage )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: evaluation
#------------------------------------------------------------

CREATE TABLE evaluation(
        note1           Varchar (25) NOT NULL ,
        note2           Varchar (25) NOT NULL ,
        note3           Varchar (25) NOT NULL ,
        id_app          Int NOT NULL ,
        id_formateur    Int NOT NULL ,
        id_enseignement Int NOT NULL ,
        PRIMARY KEY (id_app ,id_formateur ,id_enseignement )
)ENGINE=InnoDB;

ALTER TABLE promotion ADD CONSTRAINT FK_promotion_id_enseignement FOREIGN KEY (id_enseignement) REFERENCES enseignements(id_enseignement);
ALTER TABLE apprenants ADD CONSTRAINT FK_apprenants_id_promo FOREIGN KEY (id_promo) REFERENCES promotion(id_promo);
ALTER TABLE stage ADD CONSTRAINT FK_stage_id_app FOREIGN KEY (id_app) REFERENCES apprenants(id_app);
ALTER TABLE evaluation ADD CONSTRAINT FK_evaluation_id_app FOREIGN KEY (id_app) REFERENCES apprenants(id_app);
ALTER TABLE evaluation ADD CONSTRAINT FK_evaluation_id_formateur FOREIGN KEY (id_formateur) REFERENCES formateurs(id_formateur);
ALTER TABLE evaluation ADD CONSTRAINT FK_evaluation_id_enseignement FOREIGN KEY (id_enseignement) REFERENCES enseignements(id_enseignement);
