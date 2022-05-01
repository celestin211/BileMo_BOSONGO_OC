-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 01 mai 2022 à 18:23
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `person`
--

INSERT INTO `person` (`id`, `user_client_id`, `email`, `firstname`, `lastname`) VALUES
(3, 2, 'celestin@exemple.com', 'Bososngo', 'Celestin'),
(4, 17, 'bosongocelestin8@exemple.com', 'Bososngo', 'Celestin'),
(8, 19, 'stin@exemple.com', 'Bo', 'Celestin'),
(9, 19, 'exemple@exemple.com', 'Bososngo', 'Celestin'),
(11, 19, 'exemple_bosongocelestin@exemple.com', 'Bososngo', 'Celestin');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `brand`, `model`, `release_year`, `color`, `screen_size`, `storage_gb`, `memory_gb`, `megapixels`, `price`, `user_client_id`) VALUES
(5, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(8, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 5, 15, 456.45, NULL),
(9, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 5, 15, 456.45, NULL),
(10, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(11, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 3, 2015, 15, 456.45, 17),
(12, 'Samsung 6S', 'Apple', 2015, 'Space Gray', 3.5, 3, 2015, 15, 456.45, 17),
(14, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456, 17),
(16, 'iPhone 7S', 'Samsung', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456, 17),
(18, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(19, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(20, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(21, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(22, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(23, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(24, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(25, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(29, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(30, 'iPhone 6S', 'Apple', 2015, 'Space Gray', 3.5, 32, 2015, 15, 456.45, NULL),
(35, 'Sony 6S', 'Sony', 2015, 'Space Gray', 3.3, 32, 20, 3, 456.45, 19),
(36, 'Sony 56 P', 'Sony', 2015, 'Space Gray', 3.5, 32, 15, 15, 456.45, 19);

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `roles`, `password`) VALUES
(1, 'celestin.mombela@yahoo.fr', 'bosongo', '[\"ROLE_ADMIN\"]', 'BOUCHE'),
(2, 'celestin.mombela@yahoo.fr', 'bosongo', '[\"ROLE_ADMIN\"]', 'BOUCHE'),
(7, 'bon.mol@yahoo.fr', 'bounce', '[\"ROLE_ADMIN\"]', '$2y$13$sQaG.BkGEzqSly/R3G44/eBguIrw5m8dJmW4A5XI6WRw2eW2FOV9y'),
(8, 'bon.mol@yahoo.fr', 'bounce', '[\"ROLE_ADMIN\"]', '$2y$13$Byj99MbthW9FC4cr3iXwrucVlY8l1wnR/5o3/LWe2uWOY4m2eHkAq'),
(9, 'bonN.mol@yahoo.fr', 'bounceyr', '[\"ROLE_USER\"]', '$2y$13$hh0iyRZDlHcF4dBEZaICCumgnKIx.qKUm/BPZEEDELrKjTB75ou.K'),
(10, 'bonN.mol@yahoo.fr', 'bounceyr', '[\"ROLE_USER\"]', '$2y$13$ncm4Hzot/WbKvOhXG3PPl.QmZiQVfFgwRHzV0E0eA.Ckf0chtXpSW'),
(12, 'BABA.mol@yahoo.fr', 'booki', '[\"ROLE_ADMIN\"]', '$2y$13$YiH/Ytyr.K2JWjwKomMTc.pk4oKrHDFgWN.JjIBtU0a1OUxC8RH1O'),
(13, 'BABA.mol@yahoo.fr', 'booki', '[\"ROLE_ADMIN\"]', '$2y$13$wtesb7izt5bWksCXmkxkMO6L/6sVhjGhw.wLE6cCfbsOPFNFgaaeO'),
(14, 'BABA.mol@yahoo.fr', 'booki', '[\"ROLE_ADMIN\"]', '$2y$13$KHuImKurJByEevA9la2rn.fNARmSK4HtdnAKouB6cE4JVei3sdl3e'),
(15, 'api.mol@yahoo.fr', 'api', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$VzA2SnpxQkk4N1ZMb2dYbQ$qLN5lJ18aYWyGUhuH5amiXMVCbIoXrnIJPoqSxByPqE'),
(16, 'api.mol@yahoo.fr', 'api', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$RDkxWng3dXVVVHBwVWs0VA$bv5u4L3ZhbZmc3jAfemKV666c9TUJyxKCABDx8p3JeI'),
(17, 'soniachoytun@yahoo.fr', 'soniachoytun', '[\"ROLE_ADMIN\"]', '$argon2i$v=19$m=65536,t=4,p=1$VjUvRDhXYnFDcmZrTVNuTQ$hIBrcwzdOycB+kK/nnukJaMWC6v1UbzpTkZ6akZMIaA'),
(18, 'toto@exemple.com', 'totoexemple', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$uQV9xBU9Ay9chIBX/DzDLg$Koz6W1A9TtO+10lDhn80Svn2q1BA+Ob0Wn3xUicaIj8'),
(19, 'toto@yahoo.fr', 'toto', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$bimmXp/XrDdh/l5xx/h/jg$svglmEl72aQfe51iNRqJWv+HfDUke2m0vM5KvdhucOo'),
(20, 'burkmol@yahoo.fr', 'burkmol', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$MLqBkPECQ+XIUvcaP2Aihg$p7SsrADN7Q+2xflmCjM456VRQokE4/2Ku10IWbuOonU'),
(21, 'balouki@yahoo.fr', 'balouki', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$oOkTIL2PlZZRmPdIpb7gzg$jtXNfd0v8N1wtqXGJf+3jdYuzgNPkOV2712SiE/2RAs'),
(23, 'celestin.bosongo@yahoo.fr', 'celestin', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$n76bSdsb9+UDi3rETt0RfA$OAM4menh+fUmDzcR1Z3E+pR4jGsYvJ0hpArelDxMen4');

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
