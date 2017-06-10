-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost:3306
-- Généré le :  Dim 28 Mai 2017 à 15:59
-- Version du serveur :  5.5.42
-- Version de PHP :  5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `correctix`
--
CREATE DATABASE IF NOT EXISTS `correctix` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `correctix`;

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `correction`
--

DROP TABLE IF EXISTS `correction`;
CREATE TABLE `correction` (
  `id` int(11) NOT NULL,
  `idSheet` int(11) NOT NULL,
  `dateEdit` datetime NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `exam`
--

DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `mark` varchar(45) NOT NULL,
  `dateExam` datetime DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `idFatherGroup` int(11) DEFAULT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `link_exam_question`
--

DROP TABLE IF EXISTS `link_exam_question`;
CREATE TABLE `link_exam_question` (
  `idExam` int(11) NOT NULL,
  `idQuestion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `link_exam_sheet`
--

DROP TABLE IF EXISTS `link_exam_sheet`;
CREATE TABLE `link_exam_sheet` (
  `idExam` int(11) NOT NULL DEFAULT '0',
  `idSheet` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `link_group_student`
--

DROP TABLE IF EXISTS `link_group_student`;
CREATE TABLE `link_group_student` (
  `idStudent` int(11) NOT NULL DEFAULT '0',
  `idGroup` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `link_question_rule`
--

DROP TABLE IF EXISTS `link_question_rule`;
CREATE TABLE `link_question_rule` (
  `idQuestion` int(11) NOT NULL,
  `idRule` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `link_sheet_question`
--

DROP TABLE IF EXISTS `link_sheet_question`;
CREATE TABLE `link_sheet_question` (
  `idSheet` int(11) NOT NULL,
  `idQuestion` int(11) NOT NULL,
  `pointReceived` varchar(45) NOT NULL,
  `idComment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `link_sheet_question_rule`
--

DROP TABLE IF EXISTS `link_sheet_question_rule`;
CREATE TABLE `link_sheet_question_rule` (
  `idSheet` int(11) NOT NULL,
  `idRule` int(11) NOT NULL,
  `pointReceived` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `parameter`
--

DROP TABLE IF EXISTS `parameter`;
CREATE TABLE `parameter` (
  `idUser` int(11) NOT NULL DEFAULT '0',
  `show_arrow` int(1) NOT NULL DEFAULT '1',
  `step` varchar(45) NOT NULL DEFAULT '1',
  `default_mode` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `negative` tinyint(1) DEFAULT '0',
  `mark` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rule`
--

DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `mark` varchar(45) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sheet`
--

DROP TABLE IF EXISTS `sheet`;
CREATE TABLE `sheet` (
  `id` int(11) NOT NULL,
  `idStudent` int(11) DEFAULT NULL,
  `idComment` int(11) DEFAULT NULL,
  `pointReceived` varchar(45) NOT NULL,
  `finished` int(1) NOT NULL DEFAULT '0',
  `missing` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `state` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_COMMENT_USER_idx` (`idUser`);

--
-- Index pour la table `correction`
--
ALTER TABLE `correction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_CORRECTION_USER_idx` (`idUser`),
  ADD KEY `FK_CORRECTION_SHEET_idx` (`idSheet`);

--
-- Index pour la table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_EXAM_USER_idx` (`idUser`);

--
-- Index pour la table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_GROUP_USER_idx` (`idUser`);

--
-- Index pour la table `link_exam_question`
--
ALTER TABLE `link_exam_question`
  ADD PRIMARY KEY (`idExam`,`idQuestion`),
  ADD KEY `FK_LINK_QUESTION_idx` (`idQuestion`);

--
-- Index pour la table `link_exam_sheet`
--
ALTER TABLE `link_exam_sheet`
  ADD PRIMARY KEY (`idExam`,`idSheet`),
  ADD KEY `FK_LINK_EXAM_idx` (`idExam`),
  ADD KEY `FL_LINK_SHEET_idx` (`idSheet`);

--
-- Index pour la table `link_group_student`
--
ALTER TABLE `link_group_student`
  ADD PRIMARY KEY (`idStudent`,`idGroup`),
  ADD KEY `FK_LINK_STUDENT_idx` (`idStudent`),
  ADD KEY `FK_LINK_GROUP_idx` (`idGroup`);

--
-- Index pour la table `link_question_rule`
--
ALTER TABLE `link_question_rule`
  ADD PRIMARY KEY (`idQuestion`,`idRule`),
  ADD KEY `FK_LINK_RULE_idx` (`idRule`);

--
-- Index pour la table `link_sheet_question`
--
ALTER TABLE `link_sheet_question`
  ADD PRIMARY KEY (`idSheet`,`idQuestion`),
  ADD KEY `FK_LINK_QUESTION_idx` (`idQuestion`),
  ADD KEY `FK_LINK_COMMENT_idx` (`idComment`);

--
-- Index pour la table `link_sheet_question_rule`
--
ALTER TABLE `link_sheet_question_rule`
  ADD PRIMARY KEY (`idSheet`,`idRule`),
  ADD KEY `FK_LINK_RULE_idx` (`idRule`);

--
-- Index pour la table `parameter`
--
ALTER TABLE `parameter`
  ADD PRIMARY KEY (`idUser`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rule`
--
ALTER TABLE `rule`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sheet`
--
ALTER TABLE `sheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_SHEET_STUDENT_idx` (`idStudent`),
  ADD KEY `FK_SHEET_COMMENT_idx` (`idComment`);

--
-- Index pour la table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `correction`
--
ALTER TABLE `correction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `rule`
--
ALTER TABLE `rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `sheet`
--
ALTER TABLE `sheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `correction`
--
ALTER TABLE `correction`
  ADD CONSTRAINT `correction_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `correction_ibfk_2` FOREIGN KEY (`idSheet`) REFERENCES `sheet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `group`
--
ALTER TABLE `group`
  ADD CONSTRAINT `group_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `link_exam_question`
--
ALTER TABLE `link_exam_question`
  ADD CONSTRAINT `link_exam_question_ibfk_3` FOREIGN KEY (`idExam`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_exam_question_ibfk_4` FOREIGN KEY (`idQuestion`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `link_exam_sheet`
--
ALTER TABLE `link_exam_sheet`
  ADD CONSTRAINT `link_exam_sheet_ibfk_1` FOREIGN KEY (`idExam`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_exam_sheet_ibfk_2` FOREIGN KEY (`idSheet`) REFERENCES `sheet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `link_group_student`
--
ALTER TABLE `link_group_student`
  ADD CONSTRAINT `link_group_student_ibfk_2` FOREIGN KEY (`idStudent`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_group_student_ibfk_3` FOREIGN KEY (`idGroup`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `link_question_rule`
--
ALTER TABLE `link_question_rule`
  ADD CONSTRAINT `link_question_rule_ibfk_1` FOREIGN KEY (`idQuestion`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_question_rule_ibfk_2` FOREIGN KEY (`idRule`) REFERENCES `rule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `link_sheet_question`
--
ALTER TABLE `link_sheet_question`
  ADD CONSTRAINT `link_sheet_question_ibfk_1` FOREIGN KEY (`idSheet`) REFERENCES `sheet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_sheet_question_ibfk_2` FOREIGN KEY (`idQuestion`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_sheet_question_ibfk_3` FOREIGN KEY (`idComment`) REFERENCES `comment` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Contraintes pour la table `link_sheet_question_rule`
--
ALTER TABLE `link_sheet_question_rule`
  ADD CONSTRAINT `link_sheet_question_rule_ibfk_1` FOREIGN KEY (`idSheet`) REFERENCES `sheet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_sheet_question_rule_ibfk_2` FOREIGN KEY (`idRule`) REFERENCES `rule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `parameter`
--
ALTER TABLE `parameter`
  ADD CONSTRAINT `parameter_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `sheet`
--
ALTER TABLE `sheet`
  ADD CONSTRAINT `sheet_ibfk_1` FOREIGN KEY (`idStudent`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sheet_ibfk_2` FOREIGN KEY (`idComment`) REFERENCES `comment` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
