-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2025 at 01:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `publish_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `author_id`, `category_id`, `image_url`, `publish_date`, `created_at`, `updated_at`) VALUES
(1, 'New iPhone Released', 'Apple announces the latest iPhone with groundbreaking features...', 1, 1, 'https://www.apple.com/hr/iphone-16/images/meta/iphone-16_overview__fcivqu9d5t6q_og.png', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 10:40:20'),
(2, 'Champions League Final', 'Exciting match ends in dramatic penalty shootout...', 1, 2, 'https://ichef.bbci.co.uk/ace/standard/1024/cpsprodpb/c27e/live/c3a39390-66d1-11ef-a065-11da863b60a9.jpg', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 12:55:54'),
(3, 'Oscar Nominations Announced', 'This year\'s Oscar nominations are full of surprises...', 1, 3, 'https://www.oscars.org/sites/oscars/files/96_telecast_0549.jpg', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 12:56:21'),
(4, 'Global Tech Summit', 'Industry leaders gather to discuss future of technology...', 1, 1, 'https://dublintechsummit.tech/wp-content/uploads/sites/7/2023/01/52176591231_5ecf159b19_k-1.jpg', '2024-12-11 10:37:09', '2024-12-24 10:37:09', '2025-01-08 21:47:11'),
(5, 'Major Scientific Discovery', 'Scientists announce breakthrough in quantum computing...', 1, 6, 'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iTSnZUHkS5wo/v1/-1x-1.webp', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 12:57:18'),
(6, 'Healthcare Reform', 'New healthcare policies announced for coming year...', 1, 7, 'https://www.eiu.com/n/wp-content/uploads/2024/07/GettyImages-1329632070-scaled-1.jpg', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 12:57:50'),
(7, 'Stock Market Update', 'Markets reach new high amid economic recovery...', 1, 5, 'https://slavic401k.com/wp-content/uploads/2024/03/stock-market.jpg', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 12:58:09'),
(8, 'Education System Changes', 'Major reforms announced in education sector...', 1, 8, 'https://edifice.io/app/uploads/2023/08/educative-scaled.webp', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 12:58:26'),
(9, 'Travel Industry Recovery', 'Tourism showing strong signs of post-pandemic recovery...', 1, 9, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Delphi_BW_2017-10-08_11-38-38.jpg/640px-Delphi_BW_2017-10-08_11-38-38.jpg', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 12:59:05'),
(10, 'Renewable Energy Progress', 'New solar power plant opens in desert region...', 1, 1, 'https://www.nationalgrid.com/sites/default/files/images/EnergyExplained_DifferentTypesRenewableEnergy_640x360.jpg', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 12:59:20'),
(11, 'Sports Tournament Results', 'National championships conclude with unexpected winners...', 1, 2, 'https://media.nbcwashington.com/2022/01/web-220103-cfp-championship-trophy.jpg?quality=85&strip=all&resize=1200%2C675', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 13:00:03'),
(12, 'Movie Industry News', 'Summer blockbuster breaks box office records...', 1, 3, 'https://media.cnn.com/api/v1/images/stellar/prod/231202122816-movie-theater-hollywood-1123.jpg?c=16x9&q=h_833,w_1480,c_fill', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 13:00:21'),
(13, 'Political Summit', 'World leaders meet to discuss climate change...', 1, 4, 'https://goodcountry.org/images/_page/All-leaders.jpg', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 13:00:42'),
(14, 'Tech Startup Success', 'Local startup receives major investment...', 1, 1, 'https://www.gravitywell.co.uk/static/6a5d234a00f18392ef275cbe7a2143c2/c85f0/start-scale-1.jpg', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 13:00:59'),
(15, 'Medical Breakthrough', 'New treatment method shows promising results...', 1, 7, 'https://magazine.medlineplus.gov/images/uploads/main_images/breakthrough-technology.jpg', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 13:01:39'),
(16, 'Economic Forecast', 'Experts predict economic trends for next year...', 1, 5, 'https://www.citigroup.com/rcs/v1/siteIds/citigpa/asset/66bf5454a227d37073909de4.jpg', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 13:02:08'),
(17, 'Educational Technology', 'Schools adopt new learning platforms...', 1, 8, 'https://mdreducation.com/wp-content/uploads/2024/03/Number-of-Schools-in-US.jpg', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 13:02:22'),
(18, 'Tourism Trends', 'Popular travel destinations for the season...', 1, 9, 'https://image.sggp.org.vn/w1000/Uploaded/2024/negesfjozly/2022_05_10/dulichxanh21632732498_uelg_edcs.jpg', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 13:02:39'),
(19, 'Food Industry News', 'New restaurant trends emerging post-pandemic...', 1, 10, 'https://qul.imgix.net/ca169046-430e-4b8d-b218-3f0f73c446be/625936_sld.jpg', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 13:03:07'),
(20, 'Scientific Research', 'Latest findings in climate science research...', 1, 6, 'https://www.guideir.com/Public/Uploads/uploadfile/images/20220609/18ScientificResearch2.jpg', '2024-12-24 10:37:09', '2024-12-24 10:37:09', '2024-12-27 13:03:43'),
(22, 'LG’s new lamp puts a mini garden inside your home', 'Now you can light up your house and grow plants at the same time.', 1, 1, 'https://duet-cdn.vox-cdn.com/thumbor/0x0:2700x1765/640x427/filters:focal(1350x883:1351x884):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/25805815/lg_lamp_garden.jpg', '2024-12-27 11:22:40', '2024-12-27 12:23:30', '2025-01-08 21:53:34'),
(24, 'Liverpool will \'stay humble\' - but lead at top \'feels different\'.', 'At first it was just a small section of fans singing it.\n\n\'Liverpool, Liverpool, top of the league... Liverpool, top of the league\' they chanted after Curtis Jones marked his 100th Premier League appearance by sweeping his side into a 2-1 lead against struggling Leicester.\n\nIt was much louder after Mohamed Salah scored his 19th club goal of the season in the 82nd minute to seal a 3-1 win.\n\nHaving fallen behind in the fifth minute, Liverpool were well on their way to a win that propelled them seven points clear at the top with one game in hand on their nearest rivals.\n\nOf course, Liverpool have been here before.\n\nIn the 2018-19 season, they led by 10 points only for Manchester City to win the title.\n\n\"It feels different,\" Salah, who is out of contract in the summer, told Amazon Prime about Liverpool\'s advantage at the top after overcoming Leicester.\n\n\"But the most important thing is we need to stay humble.\n\n\"This one is very special, hopefully we win the Premier League and for this club it is something I dream of.\n\n\"The most important thing is the team winning - hopefully we win the Premier League.\n\n\"It is great, but we focus on each game and hopefully we carry on like that.\"', 1, 2, 'https://d3j2s6hdd6a7rg.cloudfront.net/v2/uploads/media/default/0002/34/thumb_133455_default_news_size_5.jpeg', '2024-12-27 11:40:31', '2024-12-27 12:40:51', '2024-12-27 13:04:03'),
(26, 'The Game Awards 2024 winners announced ', 'ASTRO BOT takes Game of the Year.', 1, 1, 'https://www.gematsu.com/wp-content/uploads/2024/12/TGA-2024-Winners_12-12-24-768x432.jpg', '2024-12-12 21:01:07', '2025-01-08 22:02:08', '2025-01-08 22:02:34');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Technology', 'Latest technology news and updates', '2024-12-24 10:37:09'),
(2, 'Sports', 'Sports coverage and analysis', '2024-12-24 10:37:09'),
(3, 'Entertainment', 'Entertainment and celebrity news', '2024-12-24 10:37:09'),
(4, 'Politics', 'Political news and analysis', '2024-12-24 10:37:09'),
(5, 'Business', 'Business and financial news', '2024-12-24 10:37:09'),
(6, 'Science', 'Scientific discoveries and research', '2024-12-24 10:37:09'),
(7, 'Health', 'Health and wellness news', '2024-12-24 10:37:09'),
(8, 'Education', 'Educational news and updates', '2024-12-24 10:37:09'),
(9, 'Travel', 'Travel news and destinations', '2024-12-24 10:37:09'),
(10, 'Food', 'Food and culinary news', '2024-12-24 10:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Admin', 'User', 'admin', 'admin@example.com', '$2y$10$mtIXOKwd2kZ.Dl/7XL/Bzuzy2n7GvPPtMrQvQrlLPt0U0zs7H0l0y', 'admin', '2024-12-24 10:37:09'),
(2, 'test', 'test', 'test', 'test@mail.com', '$2y$10$mtIXOKwd2kZ.Dl/7XL/Bzuzy2n7GvPPtMrQvQrlLPt0U0zs7H0l0y', 'user', '2024-12-25 16:52:24'),
(3, 'user', 'user', 'user', 'user@mail', '$2y$10$MNOALEl7vAQt3Rp2on.HHuQyYdB1ohPT76wNAVbyAWKJQWPO.ukkq', 'user', '2024-12-25 16:59:03'),
(5, 'Admin', 'Admin', 'admin2', 'admin@mail', '$2y$10$7luM5yByhAoQ0wB5u6CYeuYboBJO.2AKlnWtpdyricZ41dITcqPOC', 'user', '2024-12-25 17:16:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
