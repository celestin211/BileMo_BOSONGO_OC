-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 23 avr. 2022 à 10:09
-- Version du serveur : 5.7.36
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bilemo`
--

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20220410130931', '2022-04-10 13:09:43');

-- --------------------------------------------------------

--
-- Structure de la table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_client_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_34DCD176190BE4C5` (`user_client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `person`
--

INSERT INTO `person` (`id`, `user_client_id`, `email`, `firstname`, `lastname`) VALUES
(2, 1, 'exemple_bosongocelestin@exemple.com', 'Bososngo', 'Celestin'),
(3, 2, 'celestin@exemple.com', 'Bososngo', 'Celestin'),
(4, 17, 'bosongocelestin8@exemple.com', 'Bososngo', 'Celestin'),
(5, 19, 'bosongocelestinp@exemple.com', 'Bososngo', 'Celestin'),
(6, NULL, 'ibrahim211@yahoo.com', 'Bososngo', 'Celestin');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `release_year` int(11) NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `screen_size` double NOT NULL,
  `storage_gb` int(11) NOT NULL,
  `memory_gb` int(11) NOT NULL,
  `megapixels` int(11) NOT NULL,
  `price` double NOT NULL,
  `user_client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD190BE4C5` (`user_client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `brand`, `model`, `release_year`, `color`, `screen_size`, `storage_gb`, `memory_gb`, `megapixels`, `price`, `user_client_id`) VALUES
(1, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 15, 15, 456.45, 1),
(2, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, 2),
(3, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(9, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 5, 15, 456.45, NULL),
(10, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(11, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 3, 2015, 15, 456.45, 17),
(13, 'Motorola 6S', 'Apple', 2015, 'Space Gray', 3.5, 3, 2015, 15, 456.45, 17),
(14, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456, 17),
(15, 'iPhone 7S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456, 17),
(16, 'iPhone 7S', 'Samsung', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456, 17),
(18, 'SAMSUNG 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(19, 'MOTOR R', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(20, 'Motorola 45', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(21, 'Motorola \'4565', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(22, 'Motorola 8', 'Apple', 2015, 'Space Gray', 3.5, 32, 20, 15, 456.45, 19);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `roles`, `password`) VALUES
(1, 'celestin.mombela@yahoo.fr', 'bosongo', '[\"ROLE_ADMIN\"]', 'BOUCHE'),
(2, 'celestin.mombela@yahoo.fr', 'bosongo', '[\"ROLE_ADMIN\"]', 'BOUCHE'),
(7, 'bon.mol@yahoo.fr', 'bounce', '[\"ROLE_ADMIN\"]', '$2y$13$sQaG.BkGEzqSly/R3G44/eBguIrw5m8dJmW4A5XI6WRw2eW2FOV9y'),
(8, 'bon.mol@yahoo.fr', 'bounce', '[\"ROLE_ADMIN\"]', '$2y$13$Byj99MbthW9FC4cr3iXwrucVlY8l1wnR/5o3/LWe2uWOY4m2eHkAq'),
(15, 'api.mol@yahoo.fr', 'api', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$VzA2SnpxQkk4N1ZMb2dYbQ$qLN5lJ18aYWyGUhuH5amiXMVCbIoXrnIJPoqSxByPqE'),
(16, 'api.mol@yahoo.fr', 'api', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$RDkxWng3dXVVVHBwVWs0VA$bv5u4L3ZhbZmc3jAfemKV666c9TUJyxKCABDx8p3JeI'),
(17, 'soniachoytun@yahoo.fr', 'soniachoytun', '[\"ROLE_USER\"]', '$argon2i$v=19$m=65536,t=4,p=1$VjUvRDhXYnFDcmZrTVNuTQ$hIBrcwzdOycB+kK/nnukJaMWC6v1UbzpTkZ6akZMIaA'),
(19, 'celestin.bosongo@yahoo.fr', 'celestin', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$ZjVDRUhWNEp5Y09oWUlDMQ$AjQ3H+nCDN1mY/xgrxBJ9KfAii4u7auCs88AhrOvrTE'),
(20, 'BABA.mol@yahoo.fr', 'babaro', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$eGtITFNQZmltOUpodERzZg$zWuTZmxjLpEUUPM7izVRj9Rw9ix9f2DXM8RMgM5ZNMc'),
(21, 'mol@yahoo.fr', 'balaka', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$d3FiNU9raG04YTRzT3IzUQ$b0gPqsOgrN7/2WmaxGtb833SFrpBuhkzacpVDScXNOg'),
(22, 'tromolayputh@yahoo.fr', 'tromolayputh', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$UHB0aml6NXpiZlhlQ0g3Lw$xyyTOyhlMLrKjgB8F+GSfWt16s7pGj1pajQAgWazoIw'),
(23, 'soutenance@yahoo.fr', 'souten7', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$MEttdXJBQlNNZ3FmZzl1VQ$H2kz2wbNl3Q0UlqBLla84IbA5ZOQsSnI3TjLwC9R2BE'),
(24, 'toto@yahoo.fr', 'toto', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$cmhORlBxMHllTTBUNUQydg$L/Q4/gYnLKivy8A9DQMeD5lZJ7BQfLIBxv8zVH1whis');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `FK_34DCD176190BE4C5` FOREIGN KEY (`user_client_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD190BE4C5` FOREIGN KEY (`user_client_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
