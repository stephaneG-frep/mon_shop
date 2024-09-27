-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 26 sep. 2024 à 09:00
-- Version du serveur : 5.7.24
-- Version de PHP : 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mon_shop`
--
CREATE DATABASE IF NOT EXISTS `mon_shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mon_shop`;

-- --------------------------------------------------------

--
-- Structure de la table `adress`
--

DROP TABLE IF EXISTS `adress`;
CREATE TABLE `adress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `adress`
--

INSERT INTO `adress` (`id`, `user_id`, `firstname`, `lastname`, `adress`, `postal`, `city`, `country`, `phone`) VALUES
(1, 2, 'stephane', 'Macdev', '24 rue du mans', '72000', 'Le mans', 'FR', '0606060606'),
(2, 4, 'John', 'Doe', '18 rue du dev', '75000', 'Paris', 'FR', '0701020304'),
(3, 4, 'john', 'doe', '13 rue du panier', '13000', 'Marseille', 'FR', '0909090909'),
(4, 6, 'Johnny', 'Doe', '22 avenue de la gare', '24000', 'Sarlat', 'FR', '0908070605'),
(5, 7, 'Devid', 'Symfony', '12 rue du composeur', '99000', 'Doctrine', 'FR', '0606060606'),
(6, 8, 'Steff', 'Telliag', '22 rue des keufs', '95000', 'Toispont', 'FR', '010234567'),
(7, 10, 'stephane', 'gaillet', '9rue du template', '95000', 'Maville', 'FR', '0908080808');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

DROP TABLE IF EXISTS `carrier`;
CREATE TABLE `carrier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(1, 'Colissimo', 'lorem ipsum dolor sit amet...', 4.9),
(2, 'Chronopost', 'Lorem ipsum dolor amet sit a merde..', 6.7);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`) VALUES
(1, 'Sacs', 'sacs'),
(2, 'Bijoux', 'bijoux'),
(3, 'Casquettes', 'casquettes');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240527202356', '2024-05-27 22:28:21', 252),
('DoctrineMigrations\\Version20240527203946', '2024-05-27 22:41:55', 104),
('DoctrineMigrations\\Version20240530185256', '2024-05-30 20:54:26', 131),
('DoctrineMigrations\\Version20240530192929', '2024-05-30 21:30:10', 249),
('DoctrineMigrations\\Version20240602055216', '2024-06-02 07:53:43', 353),
('DoctrineMigrations\\Version20240602210120', '2024-06-02 23:02:32', 170),
('DoctrineMigrations\\Version20240603065955', '2024-06-03 09:00:36', 204),
('DoctrineMigrations\\Version20240605201001', '2024-06-05 22:16:14', 378),
('DoctrineMigrations\\Version20240608184157', '2024-06-08 20:42:29', 94),
('DoctrineMigrations\\Version20240608185221', '2024-06-08 20:52:48', 74),
('DoctrineMigrations\\Version20240608195847', '2024-06-08 21:59:12', 176),
('DoctrineMigrations\\Version20240610073543', '2024-06-10 09:36:18', 287),
('DoctrineMigrations\\Version20240612061634', '2024-06-12 08:17:01', 182),
('DoctrineMigrations\\Version20240612194155', '2024-06-12 21:42:15', 290);

-- --------------------------------------------------------

--
-- Structure de la table `header`
--

DROP TABLE IF EXISTS `header`;
CREATE TABLE `header` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `header`
--

INSERT INTO `header` (`id`, `title`, `content`, `button_title`, `button_link`, `illustration`) VALUES
(1, 'Promotion de l\'été', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor \r\nincididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis \r\nnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Découvrir la collection', '/categorie/sacs', '2024-06-08-bfddc749760bbc9025c3f1fa7044c47b09998369.jpg'),
(2, 'Nouvel arrivage', 'Quo neque error repudiandae fuga? Ipsa laudantium molestias eos \r\nsapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam\r\nrecusandae alias error harum maxime adipisci amet laborum.', 'Voir la nouveautée', '/categorie/sacs', '2024-06-08-6121b45c72c1d98948b5d294364b7cfb835fbb1c.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `state` int(11) NOT NULL,
  `carrier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `stripe_session_id` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `created_at`, `state`, `carrier_name`, `carrier_price`, `delivery`, `user_id`, `stripe_session_id`) VALUES
(1, '2024-06-04 11:20:03', 1, 'Colissimo', 4.9, 'john doe</br>13 rue du panier</br>13000 Marseille</br>FR</br>0909090909', 4, NULL),
(2, '2024-06-05 09:26:54', 1, 'Colissimo', 4.9, 'John Doe</br>18 rue du dev</br>75000 Paris</br>FR</br>0701020304', 4, NULL),
(3, '2024-06-05 10:58:19', 1, 'Colissimo', 4.9, 'Johnny Doe</br>22 avenue de la gare</br>24000 Sarlat</br>FR</br>0908070605', 6, NULL),
(4, '2024-06-05 10:59:26', 1, 'Colissimo', 4.9, 'Johnny Doe</br>22 avenue de la gare</br>24000 Sarlat</br>FR</br>0908070605', 6, NULL),
(5, '2024-06-05 11:20:20', 1, 'Colissimo', 4.9, 'Johnny Doe</br>22 avenue de la gare</br>24000 Sarlat</br>FR</br>0908070605', 6, NULL),
(6, '2024-06-05 11:49:25', 1, 'Chronopost', 6.7, 'Johnny Doe</br>22 avenue de la gare</br>24000 Sarlat</br>FR</br>0908070605', 6, NULL),
(7, '2024-06-05 21:49:47', 1, 'Colissimo', 4.9, 'stephane Macdev</br>24 rue du mans</br>72000 Le mans</br>FR</br>0606060606', 2, NULL),
(8, '2024-06-05 21:52:33', 1, 'Chronopost', 6.7, 'john doe</br>13 rue du panier</br>13000 Marseille</br>FR</br>0909090909', 4, NULL),
(9, '2024-06-05 22:01:02', 1, 'Colissimo', 4.9, 'John Doe</br>18 rue du dev</br>75000 Paris</br>FR</br>0701020304', 4, NULL),
(10, '2024-06-05 22:23:38', 1, 'Colissimo', 4.9, 'John Doe</br>18 rue du dev</br>75000 Paris</br>FR</br>0701020304', 4, 'cs_test_b18d5j2iUh5WIUzVA6JwJ00o0PCVPESQ2x0QFPnM7ngNRUCKQwDzj9gOdF'),
(11, '2024-06-05 22:41:32', 5, 'Colissimo', 4.9, 'john doe</br>13 rue du panier</br>13000 Marseille</br>FR</br>0909090909', 4, 'cs_test_b1rHVwe5I9APNUqeSKH1yPJ1HCErilDmThNXLhVe9KKBIZIdrdHz7H5sc7'),
(12, '2024-06-06 11:40:13', 4, 'Colissimo', 4.9, 'John Doe</br>18 rue du dev</br>75000 Paris</br>FR</br>0701020304', 4, 'cs_test_b1SHfZGZEHotRqaqHvjubBAgoIbWGv4RM8xOWkohVjI1pkZu4bnycVpCod'),
(13, '2024-06-06 21:42:56', 1, 'Colissimo', 4.9, 'Devid Symfony</br>12 rue du composeur</br>99000 Doctrine</br>FR</br>0606060606', 7, NULL),
(14, '2024-06-06 21:44:26', 1, 'Colissimo', 4.9, 'Devid Symfony</br>12 rue du composeur</br>99000 Doctrine</br>FR</br>0606060606', 7, 'cs_test_b1QmKT9Gxn4AZFmuYHFXKkHLGMcC7JnDyKkuLLeeqtswTsUS4mQxTg54rU'),
(15, '2024-06-06 21:45:44', 4, 'Colissimo', 4.9, 'Devid Symfony</br>12 rue du composeur</br>99000 Doctrine</br>FR</br>0606060606', 7, 'cs_test_b1KeB25ai25bjszFjfNXk5iGDuf1bvQFHMJY4fY1SgwD2KwxJaCnjcQ0cO'),
(16, '2024-06-07 22:55:38', 3, 'Chronopost', 6.7, 'Devid Symfony</br>12 rue du composeur</br>99000 Doctrine</br>FR</br>0606060606', 7, 'cs_test_b1ww8lBPzcYrf0IOCm0tDISLLi5c4JhEJkjNQEpK5nygJNoUNPDMPommGV'),
(17, '2024-06-07 23:08:26', 2, 'Colissimo', 4.9, 'Steff Telliag</br>22 rue des keufs</br>95000 Toispont</br>FR</br>010234567', 8, 'cs_test_b1fAIYZ4esBp6ynr2VwHfUWANZX8TKEkxTpWrhJe6zwWnWJMlZXJTpWmFH'),
(18, '2024-06-07 23:39:42', 3, 'Colissimo', 4.9, 'stephane gaillet</br>9rue du template</br>95000 Maville</br>FR</br>0908080808', 10, 'cs_test_b1eCuT2xd49MGQ0YUr9RbckIWUKtPhlII2VLbFVAPxjq04NXWeIyegORsh'),
(19, '2024-06-07 23:51:32', 2, 'Colissimo', 4.9, 'stephane gaillet</br>9rue du template</br>95000 Maville</br>FR</br>0908080808', 10, 'cs_test_b1VsBLIa3Vgr8HD0JZ9xbW7eQS3oHn93D3SiwvuM7Figtt9936esYh92qF'),
(20, '2024-06-07 23:57:32', 5, 'Chronopost', 6.7, 'stephane gaillet</br>9rue du template</br>95000 Maville</br>FR</br>0908080808', 10, 'cs_test_b1r9fNNojctCLBcZp3XStrW0C7BGHEGEnzgaylcMJ5dVt3RSbokkaOfNKu');

-- --------------------------------------------------------

--
-- Structure de la table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `my_order_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `product_tva` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_detail`
--

INSERT INTO `order_detail` (`id`, `my_order_id`, `product_name`, `product_illustration`, `product_quantity`, `product_price`, `product_tva`) VALUES
(1, 1, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 2, 37.9, 20),
(2, 1, 'Sac noir nuit', '2024-05-30-08a3353127957ecce6ef9be661a1f3023ec32875.jpg', 1, 55, 10),
(3, 1, 'Sac noir', '2024-05-30-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 22, 10),
(4, 2, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 2, 37.9, 20),
(5, 2, 'Sac noir nuit', '2024-05-30-08a3353127957ecce6ef9be661a1f3023ec32875.jpg', 1, 55, 10),
(6, 2, 'Sac noir', '2024-05-30-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 22, 10),
(7, 3, 'Sac crème', '2024-05-30-4b7ce8c3471247e7f4e10fc9e35a1883539233ea.jpg', 1, 43.5, 10),
(8, 3, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 1, 37.9, 20),
(9, 4, 'Sac crème', '2024-05-30-4b7ce8c3471247e7f4e10fc9e35a1883539233ea.jpg', 1, 43.5, 10),
(10, 4, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 1, 37.9, 20),
(11, 5, 'Sac crème', '2024-05-30-4b7ce8c3471247e7f4e10fc9e35a1883539233ea.jpg', 1, 43.5, 10),
(12, 5, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 1, 37.9, 20),
(13, 6, 'Sac crème', '2024-05-30-4b7ce8c3471247e7f4e10fc9e35a1883539233ea.jpg', 1, 43.5, 10),
(14, 6, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 1, 37.9, 20),
(15, 7, 'Sac noir', '2024-05-30-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 22, 10),
(16, 8, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 1, 37.9, 20),
(17, 9, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 1, 37.9, 20),
(18, 10, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 1, 37.9, 20),
(19, 11, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 1, 37.9, 20),
(20, 12, 'Sac noir', '2024-05-30-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 22, 10),
(21, 12, 'Sac noir nuit', '2024-05-30-08a3353127957ecce6ef9be661a1f3023ec32875.jpg', 1, 55, 10),
(22, 13, 'Sac noir', '2024-05-30-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 22, 10),
(23, 13, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 1, 37.9, 20),
(24, 13, 'Sac crème', '2024-05-30-4b7ce8c3471247e7f4e10fc9e35a1883539233ea.jpg', 1, 43.5, 10),
(25, 13, 'Sac noir nuit', '2024-05-30-08a3353127957ecce6ef9be661a1f3023ec32875.jpg', 1, 55, 10),
(26, 14, 'Sac noir', '2024-05-30-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 22, 10),
(27, 14, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 1, 37.9, 20),
(28, 14, 'Sac crème', '2024-05-30-4b7ce8c3471247e7f4e10fc9e35a1883539233ea.jpg', 1, 43.5, 10),
(29, 14, 'Sac noir nuit', '2024-05-30-08a3353127957ecce6ef9be661a1f3023ec32875.jpg', 1, 55, 10),
(30, 15, 'Sac noir', '2024-05-30-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 22, 10),
(31, 15, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 1, 37.9, 20),
(32, 15, 'Sac crème', '2024-05-30-4b7ce8c3471247e7f4e10fc9e35a1883539233ea.jpg', 1, 43.5, 10),
(33, 15, 'Sac noir nuit', '2024-05-30-08a3353127957ecce6ef9be661a1f3023ec32875.jpg', 1, 55, 10),
(34, 16, 'Sac noir', '2024-05-30-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 3, 22, 10),
(35, 17, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 1, 37.9, 20),
(36, 18, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 1, 37.9, 20),
(37, 19, 'Sac crème', '2024-05-30-4b7ce8c3471247e7f4e10fc9e35a1883539233ea.jpg', 1, 43.5, 10),
(38, 20, 'Sac beige', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 1, 37.9, 20),
(39, 20, 'Sac noir', '2024-05-30-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 22, 10);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `tva` double NOT NULL,
  `is_homepage` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `description`, `illustration`, `price`, `tva`, `is_homepage`) VALUES
(2, 1, 'Sac noir', 'sac-noir', '<div>L<strong><em>orem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium</em></strong></div><div><strong><em>optio, eaque rerum! Provident similique accusantium nemo autem.</em></strong></div>', '2024-05-30-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 22, 10, 1),
(3, 1, 'Sac beige', 'sac-beige', '<div>&nbsp;<em>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim.&nbsp;</em></div>', '2024-05-30-0eef65221307596acd822de6e7974df6a0748367.jpg', 37.9, 20, 1),
(4, 1, 'Sac crème', 'sac-creme', '<div>&nbsp;<em>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim.&nbsp;</em></div>', '2024-05-30-4b7ce8c3471247e7f4e10fc9e35a1883539233ea.jpg', 43.5, 10, NULL),
(5, 1, 'Sac noir nuit', 'sac-noir-nuit', '<div>&nbsp;<em>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim.&nbsp;</em></div>', '2024-05-30-08a3353127957ecce6ef9be661a1f3023ec32875.jpg', 55, 10, 1),
(6, 3, 'Casquette  Asphacm', 'casquette-asphacm', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum! Provident similique accusantium nemo autem.</div>', '2024-06-12-2c2437240af247c156aede65854b587b2b8505ac.jpg', 45.5, 10, 0),
(7, 3, 'Casquette simpel', 'casquette-simpel', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum! Provident similique accusantium nemo autem.</div>', '2024-06-12-1b61dfa82a6cd2d941d767654063e25630a44251.jpg', 44.9, 10, 0),
(8, 3, 'Casquette crise anchor', 'Casquette-crise-anchor', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum! Provident similique accusantium nemo autem.</div>', '2024-06-12-75dd244ed3515c2abdb79f3eaeb9a760ad87565b.jpg', 79.99, 5.5, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_expire_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`, `token`, `token_expire_at`, `last_login_at`) VALUES
(2, 'exemple@exemple', '[\"ROLE_USER\"]', '$2y$13$ej//1Rv/Xvl6pedIhRqU4u3GwgjVbRzHVjPRlE9GV91K26wcT/SDO', 'Stéphane', 'Gaillet', NULL, NULL, NULL),
(4, 'exemple@exemple.com', '[]', '$2y$13$ujXR9tFQZVZqG.rAe5ZiTOX6OqPAISRvHEX0yk0uFUC9fiYwbLcRe', 'john', 'doe', NULL, NULL, NULL),
(5, 'johndoe@test.com', '[]', '$2y$13$6X0S21rR7KR7vmfOrb3yFeCXUCEcZRMAknh341rC8vMVs7tuW.LqW', 'John', 'Doe', NULL, NULL, NULL),
(6, 'doejo@exemple.com', '[]', '$2y$13$Zv5MNYOSfVZ1t4vY7LT/yepoOJQDwffLrBgsoSfrLvtGdJIdhafmi', 'johnny', 'Doe', NULL, NULL, NULL),
(7, 'devsymfony@yopmail.com', '[]', '$2y$13$vPHT0/c3GGsOuJTEOtsQ0.x5BwL1SqIyY.7HLgOYXjCA2fEi0u7Mi', 'Devid', 'Symfony', NULL, NULL, NULL),
(8, 'admin@admin.com', '[]', '$2y$13$tpkoS.gnNGsz5nQeJAhFEuRY/y/PyCE/OPr/pd47CMD.7j9qHDF1q', 'Steff', 'Telliag', NULL, NULL, '2024-09-22 10:12:03'),
(10, 'weshsteff@yahoo.fr', '[\"ROLE_USER\", \"ROLE_ADMIN\"]', '$2y$13$LKQucdUQqw7RiccDQwUnW.IuZ9IG3xhyIXz6UD0IHZXy/BmLy2Rea', 'stephane', 'gaillet', NULL, NULL, '2024-09-23 10:35:38'),
(11, 'homer@simpson.com', '[\"ROLE_USER\", \"ROLE_ADMIN\"]', '$2y$13$E5GNSlyUAjeXYjBBCTofSuRy6JAqBnE.TPXQ1cjSYPbif2cax2AH2', 'homer', 'simpson', NULL, NULL, '2024-09-23 11:50:36');

-- --------------------------------------------------------

--
-- Structure de la table `user_product`
--

DROP TABLE IF EXISTS `user_product`;
CREATE TABLE `user_product` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_product`
--

INSERT INTO `user_product` (`user_id`, `product_id`) VALUES
(8, 3),
(10, 8);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5CECC7BEA76ED395` (`user_id`);

--
-- Index pour la table `carrier`
--
ALTER TABLE `carrier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Index pour la table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_ED896F46BFCDF877` (`my_order_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- Index pour la table `user_product`
--
ALTER TABLE `user_product`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `IDX_8B471AA7A76ED395` (`user_id`),
  ADD KEY `IDX_8B471AA74584665A` (`product_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adress`
--
ALTER TABLE `adress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `header`
--
ALTER TABLE `header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adress`
--
ALTER TABLE `adress`
  ADD CONSTRAINT `FK_5CECC7BEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK_ED896F46BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `user_product`
--
ALTER TABLE `user_product`
  ADD CONSTRAINT `FK_8B471AA74584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8B471AA7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
