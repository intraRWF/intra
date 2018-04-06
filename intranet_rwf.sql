-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 06 avr. 2018 à 08:41
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `intranet_rwf`
--

-- --------------------------------------------------------

--
-- Structure de la table `apprenants`
--

DROP TABLE IF EXISTS `apprenants`;
CREATE TABLE IF NOT EXISTS `apprenants` (
  `id_app` int(11) NOT NULL AUTO_INCREMENT,
  `nom_app` varchar(50) DEFAULT NULL,
  `prenom_app` varchar(50) NOT NULL,
  `date_de_naissance_app` date NOT NULL,
  `adresse_app` varchar(80) NOT NULL,
  `ville_app` varchar(50) DEFAULT NULL,
  `photo_app` varchar(255) DEFAULT NULL,
  `tel_app` varchar(12) DEFAULT NULL,
  `mail_app` varchar(80) DEFAULT NULL,
  `status` varchar(25) NOT NULL,
  `pass` varchar(25) NOT NULL,
  `auth` tinyint(1) NOT NULL DEFAULT '0',
  `id_promo` int(11) NOT NULL,
  PRIMARY KEY (`id_app`),
  KEY `FK_apprenants_id_promo` (`id_promo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `enseignements`
--

DROP TABLE IF EXISTS `enseignements`;
CREATE TABLE IF NOT EXISTS `enseignements` (
  `id_enseignement` int(11) NOT NULL AUTO_INCREMENT,
  `maquetter_appli` varchar(25) NOT NULL,
  `concevoir_bdd` varchar(25) NOT NULL,
  `mettre_en_place_bdd` varchar(25) NOT NULL,
  `dvp_interface_utilisateur` varchar(25) NOT NULL,
  `dvp_componsants_acces_donnees` varchar(25) NOT NULL,
  `dvp_page_web_dynamique` varchar(25) NOT NULL,
  `solution_de_gestion_de_contenu` varchar(25) NOT NULL,
  `utiliser_anglais` varchar(25) NOT NULL,
  `dev_responsive` varchar(25) NOT NULL,
  PRIMARY KEY (`id_enseignement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `note1` varchar(25) NOT NULL,
  `note2` varchar(25) NOT NULL,
  `note3` varchar(25) NOT NULL,
  `id_app` int(11) NOT NULL,
  `id_formateur` int(11) NOT NULL,
  `id_enseignement` int(11) NOT NULL,
  PRIMARY KEY (`id_app`,`id_formateur`,`id_enseignement`),
  KEY `FK_evaluation_id_formateur` (`id_formateur`),
  KEY `FK_evaluation_id_enseignement` (`id_enseignement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `formateurs`
--

DROP TABLE IF EXISTS `formateurs`;
CREATE TABLE IF NOT EXISTS `formateurs` (
  `id_formateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `adresse` varchar(80) NOT NULL,
  `ville` varchar(80) NOT NULL,
  `telephone` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `pass` varchar(25) NOT NULL,
  `auth` tinyint(1) NOT NULL DEFAULT '0',
  `id_promo` int(11) NOT NULL,
  PRIMARY KEY (`id_formateur`),
  KEY `FK_formateurs_id_promo` (`id_promo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `id_promo` int(11) NOT NULL AUTO_INCREMENT,
  `annee` year(4) NOT NULL,
  `intitule` varchar(25) NOT NULL,
  `specialite` varchar(50) DEFAULT NULL,
  `lieu` varchar(50) NOT NULL,
  `id_enseignement` int(11) NOT NULL,
  PRIMARY KEY (`id_promo`),
  KEY `FK_promotion_id_enseignement` (`id_enseignement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

DROP TABLE IF EXISTS `stage`;
CREATE TABLE IF NOT EXISTS `stage` (
  `id_stage` int(11) NOT NULL AUTO_INCREMENT,
  `entreprise` varchar(50) NOT NULL,
  `date_stage` date NOT NULL,
  `tuteur` varchar(25) NOT NULL,
  `lieu` varchar(50) NOT NULL,
  `etat_d_avancement` varchar(25) NOT NULL,
  `id_app` int(11) NOT NULL,
  PRIMARY KEY (`id_stage`),
  KEY `FK_stage_id_app` (`id_app`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `apprenants`
--
ALTER TABLE `apprenants`
  ADD CONSTRAINT `FK_apprenants_id_promo` FOREIGN KEY (`id_promo`) REFERENCES `promotion` (`id_promo`);

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `FK_evaluation_id_app` FOREIGN KEY (`id_app`) REFERENCES `apprenants` (`id_app`),
  ADD CONSTRAINT `FK_evaluation_id_enseignement` FOREIGN KEY (`id_enseignement`) REFERENCES `enseignements` (`id_enseignement`),
  ADD CONSTRAINT `FK_evaluation_id_formateur` FOREIGN KEY (`id_formateur`) REFERENCES `formateurs` (`id_formateur`);

--
-- Contraintes pour la table `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `FK_promotion_id_enseignement` FOREIGN KEY (`id_enseignement`) REFERENCES `enseignements` (`id_enseignement`);

--
-- Contraintes pour la table `stage`
--
ALTER TABLE `stage`
  ADD CONSTRAINT `FK_stage_id_app` FOREIGN KEY (`id_app`) REFERENCES `apprenants` (`id_app`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
