-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 30 mai 2025 à 13:12
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `eduaccess`
--
CREATE DATABASE IF NOT EXISTS `eduaccess` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `eduaccess`;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `role` enum('ADMIN','STUDENT','PARENT','MANAGER','TEACHER') NOT NULL DEFAULT 'STUDENT',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'Samir', 'samir@example.com', '$2b$10$aQ71eUXxIiTuqqwCxyZM/eFwlZh0GEJHHVgWXrZc.xnkk8DbTKx.i', 'STUDENT', '2025-04-09 15:51:15.843', '2025-04-09 15:51:15.843'),
(2, 'AdminSam', 'admin@gmail.com', '$2b$10$yi3FMDMucZ2fV1NkpM5dYuQdpfPwtrmCSHTwYUlp.Wha9FnDGGICS', 'ADMIN', '2025-04-09 23:02:47.995', '2025-04-09 23:02:47.995'),
(3, 'TestUser', 'test@gmail.com', '$2b$10$qHLE96sF4PUJHS/iBp6FWe458ECMPNGfHSIFGgiiKV8D.rBX7Js4C', 'STUDENT', '2025-05-19 18:06:06.679', '2025-05-19 18:06:06.679'),
(4, 'SamirTest', 'samir@test.com', '$2b$10$1JId67ZJUask8d4Mxfj2H.gh9GNlotyiZBUox5iDSx3piddBidNlK', 'STUDENT', '2025-05-19 21:46:39.377', '2025-05-19 21:46:39.377');

-- --------------------------------------------------------

--
-- Structure de la table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('89960afd-8436-45ec-ba55-98e69bddc2b3', 'a83283f977c292e9dcd4189d662753f4e435bf351f71a099342f74b2926f6a9a', '2025-04-09 15:25:35.614', '20250409152535_init', NULL, NULL, '2025-04-09 15:25:35.577', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_email_key` (`email`);

--
-- Index pour la table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
