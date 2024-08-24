-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 24 août 2024 à 19:26
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `project_management_intrepide`
--

-- --------------------------------------------------------

--
-- Structure de la table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `projects`
--

INSERT INTO `projects` (`id`, `name`, `status`, `description`) VALUES
(2, 'nestjs', 'en cours', 'Ce projet concerne le développement d\'une application en nestjs.');

-- --------------------------------------------------------

--
-- Structure de la table `projects_members_users`
--

DROP TABLE IF EXISTS `projects_members_users`;
CREATE TABLE IF NOT EXISTS `projects_members_users` (
  `projectsId` int NOT NULL,
  `usersId` int NOT NULL,
  PRIMARY KEY (`projectsId`,`usersId`),
  KEY `IDX_f12d2be7201e8079ff063745da` (`projectsId`),
  KEY `IDX_4e4776c9ce3de6c7aa5f7d09c3` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` enum('en attente','en cours','terminée') NOT NULL DEFAULT 'en cours',
  `project` int DEFAULT NULL,
  `assignedTo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_37722bbb22ce56128ca99a89000` (`project`),
  KEY `FK_3b34ce2db713f0be359768db816` (`assignedTo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `status`, `project`, `assignedTo`) VALUES
(3, 'en cours', 'Ceci est une description détaillée de la tâche.', 'en cours', 2, 3),
(6, 'Exemple de titre de tâche', 'Ceci est une description détaillée de la tâche.', 'en cours', 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_97672ac88f789774dd47f7c8be` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`) VALUES
(2, 'eleton sdb', 'ebleton@gmail.com', '$2b$10$w/o4b.fniJ/BV5zmZWcNR.sdXvT8hALuCxJnV/von83eGdsz0E4QC', 'user'),
(3, 'Admin Admin', 'admin@gmail.com', '$2b$10$gZ.AsNULKxo/8BOWuC1GQegtCGA.OsTWSuZxUGn.vdOD5wxiiWK7S', 'user'),
(4, 'Admin1 Admin1', 'admin1@gmail.com', '$2b$10$6S0ii77DgTm0soe6IOsZGuJXKyF6CZKdBGpIp1uqMuM0cX1r2ylgi', 'admin');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `projects_members_users`
--
ALTER TABLE `projects_members_users`
  ADD CONSTRAINT `FK_4e4776c9ce3de6c7aa5f7d09c39` FOREIGN KEY (`usersId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_f12d2be7201e8079ff063745da5` FOREIGN KEY (`projectsId`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `FK_37722bbb22ce56128ca99a89000` FOREIGN KEY (`project`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `FK_3b34ce2db713f0be359768db816` FOREIGN KEY (`assignedTo`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
