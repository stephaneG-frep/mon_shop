-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 29 sep. 2024 à 11:16
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
-- Base de données : `mon_shop`
--

-- --------------------------------------------------------

--
-- Structure de la table `adress`
--

CREATE TABLE `adress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `postal` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
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
(7, 10, 'stephane', 'gaillet', '9rue du template', '95000', 'Maville', 'FR', '0908080808'),
(8, 11, 'Stéphane', 'Gaillet', '9 rue de la vieille fontaine, 9', '95740', 'Frépillon', 'FR', '0651093032');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

CREATE TABLE `carrier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
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

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`) VALUES
(1, 'Sacs', 'sacs'),
(2, 'Bijoux', 'bijoux'),
(3, 'Casquettes-Chapeaux', 'casquettes'),
(4, 'Ceintures', 'ceintures'),
(5, 'Chaussures', 'chaussures'),
(6, 'Lunettes', 'lunettes');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
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

CREATE TABLE `header` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `button_title` varchar(255) NOT NULL,
  `button_link` varchar(255) NOT NULL,
  `illustration` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `header`
--

INSERT INTO `header` (`id`, `title`, `content`, `button_title`, `button_link`, `illustration`) VALUES
(1, 'Promotion de l\'été', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor \r\nincididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis \r\nnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Découvrir la collection', '/categorie/sacs', '2024-06-08-bfddc749760bbc9025c3f1fa7044c47b09998369.jpg'),
(2, 'Nouvel arrivage', 'Quo neque error repudiandae fuga? Ipsa laudantium molestias eos \r\nsapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam\r\nrecusandae alias error harum maxime adipisci amet laborum.', 'Voir la nouveautée', '/categorie/sacs', '2024-06-08-6121b45c72c1d98948b5d294364b7cfb835fbb1c.jpg'),
(3, 'Promo sur les casquettes', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum!', 'Promotions  casquettes', '/categorie/casquettes', '2024-09-27-e2193b20d7d66820555614f3dc1d8d3d736736d0.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `state` int(11) NOT NULL,
  `carrier_name` varchar(255) NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `stripe_session_id` longtext DEFAULT NULL
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
(20, '2024-06-07 23:57:32', 5, 'Chronopost', 6.7, 'stephane gaillet</br>9rue du template</br>95000 Maville</br>FR</br>0908080808', 10, 'cs_test_b1r9fNNojctCLBcZp3XStrW0C7BGHEGEnzgaylcMJ5dVt3RSbokkaOfNKu'),
(21, '2024-09-27 10:41:47', 2, 'Colissimo', 4.9, 'Stéphane Gaillet</br>9 rue de la vieille fontaine, 9</br>95740 Frépillon</br>FR</br>0651093032', 11, 'cs_test_b1lix0rUNq14gUTvS6Nr6v5MOIoAEtNQPtYfFXsowFFuT4XihPQjPbJa8v'),
(22, '2024-09-27 11:11:27', 3, 'Chronopost', 6.7, 'stephane gaillet</br>9rue du template</br>95000 Maville</br>FR</br>0908080808', 10, 'cs_test_b1mEMTGbGqMDPEbAviNtcbsgiC4XDRMebg31t0NTRy1o0GHmmM8Eev1ZL9');

-- --------------------------------------------------------

--
-- Structure de la table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `my_order_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_illustration` varchar(255) NOT NULL,
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
(39, 20, 'Sac noir', '2024-05-30-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 22, 10),
(40, 21, 'casquette sept', '2024-09-27-7678dd677583a2b3f7111cf6255bacfda59c5210.jpg', 1, 37.99, 10),
(41, 21, 'Bague one', '2024-09-27-c890257e3a39a732234c7ec0e7161d02486d80d4.jpg', 1, 122, 20),
(42, 22, 'casquette dix', '2024-09-27-51fddc51e8bd570ab943a4dc5c9fa2a7035ec3ef.jpg', 1, 78.5, 10),
(43, 22, 'Bague deux', '2024-09-27-19d92badd2797c052e1cacc7ed8734daace2fcb2.jpg', 1, 110.9, 10);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `illustration` varchar(255) NOT NULL,
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
(4, 1, 'Sac crème', 'sac-creme', '<div>&nbsp;<em>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim.&nbsp;</em></div>', '2024-05-30-4b7ce8c3471247e7f4e10fc9e35a1883539233ea.jpg', 43.5, 10, 1),
(5, 1, 'Sac noir nuit', 'sac-noir-nuit', '<div>&nbsp;<em>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim.&nbsp;</em></div>', '2024-05-30-08a3353127957ecce6ef9be661a1f3023ec32875.jpg', 55, 10, 1),
(6, 3, 'Casquette  Asphacm', 'casquette-asphacm', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum! Provident similique accusantium nemo autem.</div>', '2024-06-12-2c2437240af247c156aede65854b587b2b8505ac.jpg', 45.5, 10, 0),
(7, 3, 'Casquette simpel', 'casquette-simpel', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum! Provident similique accusantium nemo autem.</div>', '2024-06-12-1b61dfa82a6cd2d941d767654063e25630a44251.jpg', 44.9, 10, 1),
(8, 3, 'Casquette crise anchor', 'Casquette-crise-anchor', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum! Provident similique accusantium nemo autem.</div>', '2024-06-12-75dd244ed3515c2abdb79f3eaeb9a760ad87565b.jpg', 79.99, 5.5, 0),
(9, 3, 'casquette sept', 'casquette-sept', '<div>orem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum! Provident similique accusantium nemo autem</div>', '2024-09-27-7678dd677583a2b3f7111cf6255bacfda59c5210.jpg', 37.99, 10, 0),
(10, 3, 'casquette dix', 'casquette-dix', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-27-51fddc51e8bd570ab943a4dc5c9fa2a7035ec3ef.jpg', 78.5, 10, 1),
(11, 2, 'Bague one', 'bague-one', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-27-c890257e3a39a732234c7ec0e7161d02486d80d4.jpg', 122, 20, 0),
(12, 2, 'Bague deux', 'bague-deux', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-27-19d92badd2797c052e1cacc7ed8734daace2fcb2.jpg', 110.9, 10, 1),
(13, 1, 'Sac quatre', 'sac-quatre', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-27-0ed3e4a964c3a06dadde0680e95c780b24940376.jpg', 59.99, 10, 1),
(14, 1, 'Sac_5', 'sac5', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-27-0b5bc30350a9cefc0f211e9ba9a6c92c836befe4.jpg', 110.9, 10, 1),
(15, 4, 'ceinture one', 'ceinture-one', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-fde101df91b9bfd3a60cd0e0bf16439909a33e81.jpg', 54.9, 20, 1),
(16, 4, 'Ceinture deux', 'ceinture-deux', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-65b2cb9988282684254e91c5946a96ce5be81b42.jpg', 65.9, 20, 0),
(17, 4, 'Ceinture 3', 'ceinture-3', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-7263dc399f193df83c6b1ed7def292f5ddb9b2a7.jpg', 56.6, 20, 0),
(18, 4, 'Ceinture quatre', 'ceinture-quatre', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-89272523f7758e33f66c2669136b93b480b0ff14.jpg', 55.9, 10, 0),
(19, 4, 'Ceinture six', 'ceinture-six', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-66d1f49389c56d37a1e4cf6ffb337ed628c2907e.jpg', 66.99, 10, 1),
(20, 4, 'Ceinture 5', 'ceinture-5', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-dfdfce4b3ac1c9735e07dc32d7d17b07b19dd121.jpg', 75, 10, 1),
(21, 4, 'Ceinture sept', 'ceinture-sept', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-46eda5bded082832c4f3e735fb41b717824544a4.jpg', 110.5, 10, 0),
(22, 2, 'Bague trois', 'bague-trois', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-c246f77a275d2546c51fca8b14f9591911b8e0b2.jpg', 223.8, 10, 1),
(23, 2, 'Bague 4', 'bague-4', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-ad9c3a8ee5ef6d497c2413e6757788557a173e30.jpg', 189.99, 20, 0),
(24, 2, 'Bague cinq', 'bague-cinq', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-cb0b2b2dc0509a8bd3cf026a721570a72d7a95cf.jpg', 145.9, 10, 0),
(25, 2, 'Bague six', 'bague-six', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-78d858fa89cf1432d1b86c9c0bbd866c042026eb.jpg', 238.79, 10, 0),
(26, 2, 'Bracelet one', 'bracelet-one', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-bbda8e87cd53323912c710aba99f9998ee651bf7.jpg', 230, 5.5, 1),
(27, 2, 'Bracelet 2', 'bracelet-2', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-d6a4087893162eee63fb0459beb6babb17519089.jpg', 155.9, 10, 1),
(28, 2, 'Bracelet 3', 'bracelet-3', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-ac56de8bfcac786e05dac98d80e4a94b265bfb69.jpg', 123.89, 5.5, 0),
(29, 2, 'Bracelet quatre', 'bracelet-quatre', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-e9ea7d2044c9976cb7e405c9b11e176e51620035.jpg', 100, 10, 1),
(30, 5, 'Chaussure 1', 'chaussure-1', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-ac7bfd96cb96e5bd268fe6bf3dffd4acec410a37.jpg', 34.5, 5.5, 1),
(31, 5, 'Chaussure deux', 'chaussure-deux', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-75e32acdb7111448487d690797dd8ad8c4f31782.jpg', 43.69, 5.5, 1),
(32, 5, 'Chaussures 3', 'chaussures-3', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-62e9998167b6d636adfde20080c068a34d328188.jpg', 55.9, 5.5, 0),
(33, 5, 'Chaussures quatre', 'chaussures-quatre', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-6f5bc3908d12f3b3914a9af2611404debffdb587.jpg', 44.89, 5.5, 0),
(34, 5, 'Chaussures 5', 'chaussures-5', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-575f4a808d96a49462452e886e2f8432457965ba.jpg', 65.9, 5.5, 1),
(35, 5, 'Chaussures 6', 'chaussures-6', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-a0068f3a658729e20be64582db6a665fb6f5e9b1.jpg', 66.5, 5.5, 0),
(36, 5, 'Chaussures 7', 'chaussures-7', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-d87ea20fda070925adfed325fe1413bb3feb803d.jpg', 70.8, 5.5, 0),
(37, 5, 'Chaussures 8', 'chaussures-8', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-e8717dffce1004a1ee9740d91579e5dc6ee539c1.jpg', 120, 5.5, 1),
(38, 5, 'Chaussures 9', 'chaussures-9', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-668789926eb544d442e3685f49f7662272cf9e01.jpg', 111.9, 5.5, 1),
(39, 5, 'Chaussures 10', 'chaussures-10', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-843ca5711bf2076ea8d85e5b3fd57018d0c79b74.jpg', 127.5, 5.5, 1),
(40, 6, 'Lunettes one', 'lunettes-one', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-762d0493916dc2ce80791fc6d85e84aff6cc5e5b.jpg', 68.5, 10, 1),
(41, 6, 'Lunettes 2', 'lunettes-2', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-0aacd01a72471f7f171840166c003a3fad1cac43.jpg', 44.8, 5.5, 0),
(42, 6, 'Lunettes 3', 'lunettes-3', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-14cd9f20cfa975bdfa29a02539bf050a0393f921.jpg', 34.5, 10, 0),
(43, 6, 'Lunettes 4', 'lunettes-4', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-27fed98124800fc19d2c67595909cb77d070f409.jpg', 37.9, 10, 1),
(44, 6, 'Lunettes cinq', 'lunettes-cinq', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-98be48e0edfbc72ae77ca4a1ee0c87c459fd72e7.jpg', 65.9, 10, 1),
(45, 6, 'Lunettes 6', 'lunettes-6', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-8fd847a30e741e66d40753a59b86c0bc7b65ff7f.jpg', 45.55, 5.5, 0),
(46, 3, 'Chapeau 1', 'chapeau-1', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-35c7b5d31a0af57590973eff3db9a710ef5b1069.jpg', 65.9, 5.5, 1),
(47, 3, 'Chapeau 2', 'chapeau-2', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-fc1dc439d4b56858ea8c56a75f6a35a300414a8d.jpg', 110.9, 5.5, 1),
(48, 3, 'Chapeau trois', 'chapeau-trois', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-ec0e10d33d602526d09eeea1fad8b4959efafc5a.jpg', 99.9, 10, 1),
(49, 3, 'Chapeau 4', 'chapeau-4', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,<br>molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum<br>numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium<br>optio, eaque rerum!</div>', '2024-09-28-7dea6ed48bedb4304e7722170a67e93a573adc19.jpg', 145.9, 5.5, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
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
(10, 'weshsteff@yahoo.fr', '[\"ROLE_USER\", \"ROLE_ADMIN\"]', '$2y$13$LKQucdUQqw7RiccDQwUnW.IuZ9IG3xhyIXz6UD0IHZXy/BmLy2Rea', 'stephane', 'gaillet', NULL, NULL, '2024-09-27 11:10:21'),
(11, 'homer@simpson.com', '[\"ROLE_USER\", \"ROLE_ADMIN\"]', '$2y$13$E5GNSlyUAjeXYjBBCTofSuRy6JAqBnE.TPXQ1cjSYPbif2cax2AH2', 'homer', 'simpson', NULL, NULL, '2024-09-26 11:38:47');

-- --------------------------------------------------------

--
-- Structure de la table `user_product`
--

CREATE TABLE `user_product` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_product`
--

INSERT INTO `user_product` (`user_id`, `product_id`) VALUES
(8, 3),
(10, 8),
(10, 13),
(10, 38),
(11, 8);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `header`
--
ALTER TABLE `header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

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
