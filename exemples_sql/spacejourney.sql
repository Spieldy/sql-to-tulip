-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Host: 127.2.120.130:3306
-- Generation Time: Jun 01, 2015 at 06:06 PM
-- Server version: 5.5.41
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `spacejourney`
--

-- --------------------------------------------------------

--
-- Table structure for table `COOKIE`
--

CREATE TABLE IF NOT EXISTS `COOKIE` (
  `ID_COOKIE` varchar(255) NOT NULL,
  `ID_USR` int(11) NOT NULL,
  PRIMARY KEY (`ID_COOKIE`),
  KEY `ID_USR` (`ID_USR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `COOKIE`
--

INSERT INTO `COOKIE` (`ID_COOKIE`, `ID_USR`) VALUES
('8859bf12a2cc2eff971dd335a14a181c', 4),
('55df5f4d73f6a6d374be9874dd7fd1ee', 5),
('dcd5ced376c410d9364567d2cc8b68a2', 6),
('0a8bf1506953db028f80f5346d605607', 7),
('e0a30af5b3769bda3cf1363f999acdc1', 8),
('4bbb74bc31ba728476b07962890ef23f', 9);

-- --------------------------------------------------------

--
-- Table structure for table `LIEU`
--

CREATE TABLE IF NOT EXISTS `LIEU` (
  `ID_LIEU` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_LIEU` varchar(20) NOT NULL,
  `IMG_LIEU` tinytext NOT NULL,
  `ID_SYST` int(11) NOT NULL,
  `ID_TL` int(11) NOT NULL,
  `COOR_X` int(3) NOT NULL,
  `COOR_Y` int(3) NOT NULL,
  `COOR_Z` int(3) NOT NULL,
  PRIMARY KEY (`ID_LIEU`),
  UNIQUE KEY `NOM_LIEU` (`NOM_LIEU`),
  KEY `ID_SYST` (`ID_SYST`,`ID_TL`),
  KEY `ID_TL` (`ID_TL`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=203 ;

--
-- Dumping data for table `LIEU`
--

INSERT INTO `LIEU` (`ID_LIEU`, `NOM_LIEU`, `IMG_LIEU`, `ID_SYST`, `ID_TL`, `COOR_X`, `COOR_Y`, `COOR_Z`) VALUES
(101, 'Mercure', 'view/images/lieux/mercure.jpg', 1, 1, 9, 16, 0),
(102, 'Vénus', 'view/images/lieux/venus.jpg', 1, 1, 12, 18, 0),
(103, 'Terre', 'view/images/lieux/terre.jpg', 1, 1, 7, 14, 0),
(104, 'Mars', 'view/images/lieux/mars.jpg', 1, 1, 14, 14, 0),
(105, 'Jupiter', 'view/images/lieux/jupiter.jpg', 1, 1, 5, 15, 0),
(106, 'Saturne', 'view/images/lieux/saturne.jpg', 1, 1, 16, 13, 0),
(107, 'Uranus', 'view/images/lieux/uranus.jpg', 1, 1, 3, 20, 0),
(108, 'Neptune', 'view/images/lieux/neptune.jpg', 1, 1, 15, 21, 0),
(109, 'Roue Gaia', 'view/images/lieux/roue_gaia.jpg', 1, 3, 1, 16, 0),
(201, 'Proxima Centauri', 'view/images/lieux/proxima_centauri.jpg', 2, 4, 627, 18, 0),
(202, 'Station XC-3000', 'view/images/lieux/xc-3000.jpg', 2, 3, 624, 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `RESERVATION`
--

CREATE TABLE IF NOT EXISTS `RESERVATION` (
  `ID_RES` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USR` int(11) NOT NULL,
  `ID_VOL_ALLER` int(11) DEFAULT NULL,
  `ID_VOL_RETOUR` int(11) DEFAULT NULL,
  `ID_VAC` int(11) NOT NULL,
  `RESERVE` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_RES`),
  KEY `ID_CLI` (`ID_USR`,`ID_VOL_ALLER`,`ID_VOL_RETOUR`),
  KEY `ID_VOL_ALLER` (`ID_VOL_ALLER`),
  KEY `ID_VOL_RETOUR` (`ID_VOL_RETOUR`),
  KEY `ID_VAC` (`ID_VAC`),
  KEY `RESERVE` (`RESERVE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `RESERVATION`
--

INSERT INTO `RESERVATION` (`ID_RES`, `ID_USR`, `ID_VOL_ALLER`, `ID_VOL_RETOUR`, `ID_VAC`, `RESERVE`) VALUES
(8, 3, 1031020001, 1021030001, 1020401, 1),
(9, 9, 1031020004, 1021030002, 1020401, 1),
(10, 3, 1031020001, 1021030001, 1020401, 1),
(11, 3, 1031020001, 1021030001, 1020401, 1),
(12, 3, 1031020001, 1021030001, 1020401, 1),
(13, 3, 1031020001, 1021030001, 1020401, 1),
(14, 3, 1031020001, 1021030001, 1020401, 1),
(15, 3, 1031020001, 1021030001, 1020401, 1),
(18, 3, NULL, NULL, 1030301, 0),
(19, 3, NULL, NULL, 1030601, 0),
(20, 3, 1031020001, 1021030001, 1020401, 1),
(21, 3, NULL, NULL, 1060101, 0),
(22, 3, 1031020001, 1021030001, 1020401, 1),
(23, 3, 1031020001, 1021030001, 1020401, 1),
(24, 3, 1031020001, 1021030001, 1020401, 1),
(25, 3, 1031020001, 1021030001, 1020401, 1),
(26, 3, 1031020001, 1021030001, 1020401, 1),
(27, 3, 1031020001, 1021030001, 1020401, 1),
(28, 3, 1031020001, 1021030001, 1020401, 1),
(29, 3, 1031020001, 1021030001, 1020401, 1),
(30, 3, 1031020001, 1021030001, 1020401, 1),
(31, 3, 1031020001, 1021030001, 1020401, 1),
(32, 3, 1031020001, 1021030001, 1020401, 1),
(33, 3, 1031020001, 1021030001, 1020401, 1),
(34, 3, 1031020001, 1021030001, 1020401, 1),
(35, 3, 1031020001, 1021030001, 1020401, 1),
(36, 3, 1031020001, 1021030001, 1020401, 1),
(37, 3, 1031020001, 1021030001, 1020401, 1),
(38, 3, 1031020001, 1021030001, 1020401, 1),
(39, 3, 1031020001, 1021030001, 1020401, 1),
(40, 3, 1031020001, 1021030001, 1020401, 1),
(41, 3, 1031020001, 1021030001, 1020401, 1),
(42, 3, NULL, NULL, 1020401, 0);

--
-- Triggers `RESERVATION`
--
DROP TRIGGER IF EXISTS `before_update_reservation`;
DELIMITER //
CREATE TRIGGER `before_update_reservation` BEFORE UPDATE ON `RESERVATION`
 FOR EACH ROW BEGIN

	DECLARE NbPlacesAller INT;
	DECLARE NbPlacesRetour INT;

	DECLARE IdLieuDepAller INT;
	DECLARE IdLieuArrAller INT;
	DECLARE IdLieuDepRetour INT;
	DECLARE IdLieuArrRetour INT;

	SELECT ID_LIEU_DEP INTO IdLieuDepAller FROM VOL
	WHERE VOL.ID_VOL=NEW.ID_VOL_ALLER;
	SELECT ID_LIEU_ARR INTO IdLieuArrAller FROM VOL
	WHERE VOL.ID_VOL=NEW.ID_VOL_ALLER;
	SELECT ID_LIEU_DEP INTO IdLieuDepRetour FROM VOL
	WHERE VOL.ID_VOL=NEW.ID_VOL_RETOUR;
	SELECT ID_LIEU_ARR INTO IdLieuArrRetour FROM VOL
	WHERE VOL.ID_VOL=NEW.ID_VOL_RETOUR;

	IF IdLieuDepAller = IdLieuArrRetour
	AND IdLieuArrAller = IdLieuDepRetour THEN

		SELECT NB_PLACES INTO NbPlacesAller FROM VOL
		WHERE VOL.ID_VOL=NEW.ID_VOL_ALLER;
		IF NbPlacesAller <=0 THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'VOL INDISPONIBLE';
		ELSE
			UPDATE VOL SET NB_PLACES=NbPlacesAller-1
			WHERE ID_VOL=NEW.ID_VOL_ALLER;

			SELECT NB_PLACES INTO NbPlacesRetour FROM VOL
			WHERE VOL.ID_VOL = NEW.ID_VOL_RETOUR;
			IF NbPlacesAller <=0 THEN
				SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT =  'VOL INDISPONIBLE';
			ELSE
				UPDATE VOL SET NB_PLACES = NbPlacesRetour-1
				WHERE ID_VOL=NEW.ID_VOL_RETOUR;

				SET NEW.RESERVE=1;
			END IF ;

		END IF;

	ELSE
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'LES LIEUX DE DEPART ET D ARRIVEE DES VOLS NE CORRESPONDENT PAS';

	END IF;

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `SYSTEME`
--

CREATE TABLE IF NOT EXISTS `SYSTEME` (
  `ID_SYST` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_SYST` varchar(30) NOT NULL,
  `IMG_SYST` tinytext NOT NULL,
  PRIMARY KEY (`ID_SYST`),
  UNIQUE KEY `NOM_SYST` (`NOM_SYST`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `SYSTEME`
--

INSERT INTO `SYSTEME` (`ID_SYST`, `NOM_SYST`, `IMG_SYST`) VALUES
(1, 'Système Solaire', 'view/images/systeme/soleil.jpg'),
(2, 'Alpha Centauri', 'view/images/systeme/alpha_centauri.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `TYPE_LIEU`
--

CREATE TABLE IF NOT EXISTS `TYPE_LIEU` (
  `ID_TL` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE_TL` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_TL`),
  UNIQUE KEY `LIBELLE_TL` (`LIBELLE_TL`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `TYPE_LIEU`
--

INSERT INTO `TYPE_LIEU` (`ID_TL`, `LIBELLE_TL`) VALUES
(2, 'Astéroïde'),
(4, 'Étoile'),
(1, 'Planète'),
(3, 'Station');

-- --------------------------------------------------------

--
-- Table structure for table `TYPE_VAC`
--

CREATE TABLE IF NOT EXISTS `TYPE_VAC` (
  `ID_TV` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE_TV` varchar(20) NOT NULL,
  `IMG_TV` tinytext NOT NULL,
  `PRIX_TV` decimal(10,0) NOT NULL COMMENT '/jour',
  PRIMARY KEY (`ID_TV`),
  UNIQUE KEY `LIBELLE_TV` (`LIBELLE_TV`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `TYPE_VAC`
--

INSERT INTO `TYPE_VAC` (`ID_TV`, `LIBELLE_TV`, `IMG_TV`, `PRIX_TV`) VALUES
(1, 'Croisière', 'view/images/type_vac/croisiere.jpg', '250'),
(2, 'Camping', 'view/images/type_vac/camping.jpg', '105'),
(3, 'Hôtel', 'view/images/type_vac/hotel.jpg', '125'),
(4, 'Expédition', 'view/images/type_vac/expedition.jpg', '75'),
(5, 'Pèlerinage', 'view/images/type_vac/pelerinage.jpg', '765'),
(6, 'Visite culturelle', 'view/images/type_vac/visite_culturelle.jpg', '100'),
(7, 'Ski', 'view/images/type_vac/ski.jpg', '110'),
(8, 'Compétition', 'view/images/type_vac/challenge.jpg', '10');

-- --------------------------------------------------------

--
-- Table structure for table `UTILISATEUR`
--

CREATE TABLE IF NOT EXISTS `UTILISATEUR` (
  `ID_USR` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_USR` varchar(30) NOT NULL,
  `EMAIL_USR` varchar(255) NOT NULL,
  `MDP_USR` varchar(255) NOT NULL,
  `ID_LIEU_HAB` int(11) NOT NULL,
  PRIMARY KEY (`ID_USR`),
  UNIQUE KEY `NOM_CLI` (`NOM_USR`),
  KEY `ID_LIEU_HAB` (`ID_LIEU_HAB`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `UTILISATEUR`
--

INSERT INTO `UTILISATEUR` (`ID_USR`, `NOM_USR`, `EMAIL_USR`, `MDP_USR`, `ID_LIEU_HAB`) VALUES
(3, 'Admin', 'plouis.faure@gmail.com', '0475f5e34af702e9cb6c568e3c089d071b683541', 103),
(4, 'Judy', 'julie_faure@orange.fr', '327bea5d67f7c7c3c7320bcc644e6030065d55d6', 102),
(5, 'fofokilleuz', 'geoffray.faustine@hotmail.fr', 'cb1b004c292dc7ce9fb7d1b3b44361bea9df9d4e', 103),
(6, 'Marine', 'marine@mail.com', 'aafe1034f3988707d77923d6c40ff4d589fd313f', 103),
(7, 'Mukary', 'mukary@gmail.com', '563e2ff7f272457f1055a59c0dc619a9fec1ac65', 201),
(8, 'marcodu93', 'marco@gmail.com', 'e96f1432d47f3e70ca874ab23e00dde5a5174d8c', 107),
(9, 'Clement', 'Tata@yopmail.com', 'faab916082d7ffc77b1daf7791bb732d040c45db', 103),
(10, 'Jacky', 'jacky@michel.fr', '5f4dbd18d9e13546d8874705b32ba9eeccd63f99', 101),
(11, 'Indiacha', 'indiacha.com@hotmail.fr', '17ee1c19b2238b9c489658f772fa883b4d91be10', 102),
(12, 'gryfenfer34', 'a.faure34@orange.fr', '2bce8ab8556a2de0e6d34c1d46dc997dd785d4e6', 202);

-- --------------------------------------------------------

--
-- Table structure for table `VACANCE`
--

CREATE TABLE IF NOT EXISTS `VACANCE` (
  `ID_VAC` int(11) NOT NULL AUTO_INCREMENT,
  `TITRE_VAC` tinytext NOT NULL,
  `DESCR_VAC` longtext NOT NULL,
  `IMG_VAC` tinytext NOT NULL,
  `ID_TV` int(11) NOT NULL,
  `ID_LIEU` int(11) NOT NULL,
  `MARGE_PRIX_VAC` int(3) NOT NULL,
  PRIMARY KEY (`ID_VAC`),
  KEY `ID_TV` (`ID_TV`,`ID_LIEU`),
  KEY `ID_LIEU` (`ID_LIEU`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2020802 ;

--
-- Dumping data for table `VACANCE`
--

INSERT INTO `VACANCE` (`ID_VAC`, `TITRE_VAC`, `DESCR_VAC`, `IMG_VAC`, `ID_TV`, `ID_LIEU`, `MARGE_PRIX_VAC`) VALUES
(1010601, 'Visite du Secteur F', 'Venez visiter le Secteur F de Mercure, la plus grande cité minière du Système Solaire. \r\nLa visite sera assurée par des guides qualifiés, et les repas et le logis sont compris.', 'view/images/vacances/1010601.jpg', 6, 101, 0),
(1020401, 'Expédition sur Vénus', '', 'view/images/vacances/1020401.jpg', 4, 102, 0),
(1030301, 'Hôtel Selena', 'Hôtel trois étoiles sur la Lune, c''est le lieux idéal pour se reposer et pouvoir admirer le berceau de l''humanité. ', 'view/images/vacances/1030301.jpg', 3, 103, 0),
(1030601, 'Visite des vestiges de Paris', 'Autrefois une des plus grandes villes de la planète Terre, Paris est aujourd''hui un lieu culturel très prisé.', 'view/images/vacances/1030601.jpg', 6, 103, 0),
(1040201, 'Camping sur Mars', '', 'view/images/vacances/1040201.jpg', 2, 104, 0),
(1050201, 'Camping à la mer sur Ganymède', 'Quoi de mieux que Ganymède, la lune la plus tranquille de Jupiter pour un repos sous les cocotiers ?', 'view/images/vacances/1050201.jpg', 2, 105, 0),
(1050501, 'Pèlerinage sur Europe', '', 'view/images/vacances/1050501.jpg', 5, 105, 0),
(1050801, 'Course de hovercrafts sur Io', '', 'view/images/vacances/1050801.jpg', 8, 105, 0),
(1060101, 'Croisière dans les anneaux de Saturne', '', 'view/images/vacances/1060101.jpg', 1, 106, 0),
(1070701, 'Ski sur Uranus', '', 'view/images/vacances/1070701.jpg', 7, 107, 0),
(1080301, 'Hôtel Neptunia', 'Hôtel de luxe sur Neptune', 'view/images/vacances/1080301.jpg', 3, 108, 0),
(1090301, 'Hôtel Gaia-Z', 'Hôtel de la Roue Gaia', 'view/images/vacances/1090301.jpg', 3, 109, 0),
(2010301, 'Hôtel Proxima', 'Venez passer quelques nuits dans l''hôtel Proxima, et profitez d''un confort incomparable !\r\nCet hôtel orbite autour de la Proxima du Centaure, vous offrant ainsi une vue exceptionnelle sur l''étoile.', 'view/images/vacances/2010301.jpg', 3, 201, 0),
(2020801, 'Concours de burgers au Retro69', 'Venez voir s''affronter les plus grands mangeurs de burgers de la galaxie au Retro69, le restaurant rétro de la stration XC-3000 !', 'view/images/vacances/2020801.jpg', 8, 202, 0);

-- --------------------------------------------------------

--
-- Table structure for table `VOL`
--

CREATE TABLE IF NOT EXISTS `VOL` (
  `ID_VOL` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_VOL` datetime NOT NULL,
  `NB_PLACES` int(3) NOT NULL,
  `ID_LIEU_DEP` int(11) NOT NULL,
  `ID_LIEU_ARR` int(11) NOT NULL,
  `PRIX_VOL` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_VOL`),
  KEY `ID_LIEU` (`ID_LIEU_DEP`),
  KEY `ID_LIEU_ARRIVEE` (`ID_LIEU_ARR`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1031020007 ;

--
-- Dumping data for table `VOL`
--

INSERT INTO `VOL` (`ID_VOL`, `DATE_VOL`, `NB_PLACES`, `ID_LIEU_DEP`, `ID_LIEU_ARR`, `PRIX_VOL`) VALUES
(1021030001, '2515-08-22 00:00:00', 12, 102, 103, 1281),
(1021030002, '2515-08-16 00:00:00', 47, 102, 103, 1281),
(1031020001, '2515-06-14 00:00:00', 22, 103, 102, 1281),
(1031020002, '2515-06-15 00:00:00', 0, 103, 102, 1281),
(1031020003, '2515-06-20 00:00:00', 160, 103, 102, 1281),
(1031020004, '2515-06-28 00:00:00', 44, 103, 102, 1281),
(1031020005, '2515-06-28 00:00:05', 56, 103, 102, 1281),
(1031020006, '2515-09-10 00:00:05', 56, 103, 102, 1281);

--
-- Triggers `VOL`
--
DROP TRIGGER IF EXISTS `before_insert_vol`;
DELIMITER //
CREATE TRIGGER `before_insert_vol` BEFORE INSERT ON `VOL`
 FOR EACH ROW BEGIN

	DECLARE XDep INT;
	DECLARE YDep INT;
	DECLARE ZDep INT;
	DECLARE XArr INT;
	DECLARE YArr INT;
	DECLARE ZArr INT;
	DECLARE PrixVol INT;

	SELECT COOR_X
	INTO XDep
	FROM LIEU
	WHERE LIEU.ID_LIEU = NEW.ID_LIEU_DEP;
	SELECT COOR_Y
	INTO YDep
	FROM LIEU
	WHERE LIEU.ID_LIEU = NEW.ID_LIEU_DEP;
	SELECT COOR_Z
	INTO ZDep
	FROM LIEU
	WHERE LIEU.ID_LIEU = NEW.ID_LIEU_DEP;

	SELECT COOR_X
	INTO XArr
	FROM LIEU
	WHERE LIEU.ID_LIEU = NEW.ID_LIEU_ARR;
	SELECT COOR_Y
	INTO YArr
	FROM LIEU
	WHERE LIEU.ID_LIEU = NEW.ID_LIEU_ARR;
	SELECT COOR_Z
	INTO ZArr
	FROM LIEU
	WHERE LIEU.ID_LIEU = NEW.ID_LIEU_ARR;

	SET NEW.PRIX_VOL= 200*SQRT((XArr-XDep)*(XArr-XDep)+(YArr-YDep)*(YArr-YDep)+(ZArr-ZDep)*(ZArr-ZDep));
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_vol`;
DELIMITER //
CREATE TRIGGER `before_update_vol` BEFORE UPDATE ON `VOL`
 FOR EACH ROW BEGIN

	DECLARE XDep INT;
	DECLARE YDep INT;
	DECLARE ZDep INT;
	DECLARE XArr INT;
	DECLARE YArr INT;
	DECLARE ZArr INT;
	DECLARE PrixVol INT;

	SELECT COOR_X
	INTO XDep
	FROM LIEU
	WHERE LIEU.ID_LIEU = NEW.ID_LIEU_DEP;
	SELECT COOR_Y
	INTO YDep
	FROM LIEU
	WHERE LIEU.ID_LIEU = NEW.ID_LIEU_DEP;
	SELECT COOR_Z
	INTO ZDep
	FROM LIEU
	WHERE LIEU.ID_LIEU = NEW.ID_LIEU_DEP;

	SELECT COOR_X
	INTO XArr
	FROM LIEU
	WHERE LIEU.ID_LIEU = NEW.ID_LIEU_ARR;
	SELECT COOR_Y
	INTO YArr
	FROM LIEU
	WHERE LIEU.ID_LIEU = NEW.ID_LIEU_ARR;
	SELECT COOR_Z
	INTO ZArr
	FROM LIEU
	WHERE LIEU.ID_LIEU = NEW.ID_LIEU_ARR;

	SET NEW.PRIX_VOL= 200*SQRT((XArr-XDep)*(XArr-XDep)+(YArr-YDep)*(YArr-YDep)+(ZArr-ZDep)*(ZArr-ZDep));
END
//
DELIMITER ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `COOKIE`
--
ALTER TABLE `COOKIE`
  ADD CONSTRAINT `COOKIE_ibfk_1` FOREIGN KEY (`ID_USR`) REFERENCES `UTILISATEUR` (`ID_USR`) ON UPDATE CASCADE;

--
-- Constraints for table `LIEU`
--
ALTER TABLE `LIEU`
  ADD CONSTRAINT `LIEU_ibfk_1` FOREIGN KEY (`ID_SYST`) REFERENCES `SYSTEME` (`ID_SYST`) ON UPDATE CASCADE,
  ADD CONSTRAINT `LIEU_ibfk_2` FOREIGN KEY (`ID_TL`) REFERENCES `TYPE_LIEU` (`ID_TL`) ON UPDATE CASCADE;

--
-- Constraints for table `RESERVATION`
--
ALTER TABLE `RESERVATION`
  ADD CONSTRAINT `RESERVATION_ibfk_1` FOREIGN KEY (`ID_USR`) REFERENCES `UTILISATEUR` (`ID_USR`) ON UPDATE CASCADE,
  ADD CONSTRAINT `RESERVATION_ibfk_3` FOREIGN KEY (`ID_VOL_ALLER`) REFERENCES `VOL` (`ID_VOL`) ON UPDATE CASCADE,
  ADD CONSTRAINT `RESERVATION_ibfk_4` FOREIGN KEY (`ID_VOL_RETOUR`) REFERENCES `VOL` (`ID_VOL`) ON UPDATE CASCADE,
  ADD CONSTRAINT `RESERVATION_ibfk_5` FOREIGN KEY (`ID_VAC`) REFERENCES `VACANCE` (`ID_VAC`) ON UPDATE CASCADE;

--
-- Constraints for table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  ADD CONSTRAINT `UTILISATEUR_ibfk_1` FOREIGN KEY (`ID_LIEU_HAB`) REFERENCES `LIEU` (`ID_LIEU`) ON UPDATE CASCADE;

--
-- Constraints for table `VACANCE`
--
ALTER TABLE `VACANCE`
  ADD CONSTRAINT `VACANCE_ibfk_1` FOREIGN KEY (`ID_TV`) REFERENCES `TYPE_VAC` (`ID_TV`) ON UPDATE CASCADE,
  ADD CONSTRAINT `VACANCE_ibfk_2` FOREIGN KEY (`ID_LIEU`) REFERENCES `LIEU` (`ID_LIEU`) ON UPDATE CASCADE;

--
-- Constraints for table `VOL`
--
ALTER TABLE `VOL`
  ADD CONSTRAINT `VOL_ibfk_1` FOREIGN KEY (`ID_LIEU_DEP`) REFERENCES `LIEU` (`ID_LIEU`) ON UPDATE CASCADE,
  ADD CONSTRAINT `VOL_ibfk_2` FOREIGN KEY (`ID_LIEU_ARR`) REFERENCES `LIEU` (`ID_LIEU`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
