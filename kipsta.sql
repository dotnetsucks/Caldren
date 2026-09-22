
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;




CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `item_type` varchar(50) NOT NULL,
  `color_hex` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT '3d_render'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `catalog` (`id`, `title`, `price`, `item_type`, `color_hex`, `description`, `image_url`) VALUES
(1, 'Classic Red Shirt', 10, 'Shirt', '#FF0000', 'A vibrant classic red shirt for your 3D sandbox player.', '3d_render'),
(2, 'Blue Cap Hat', 15, 'Hat', '#0000FF', 'Cool blue baseball hat that mounts directly on your avatar.', '3d_render'),
(3, 'Golden Sparkle Sword', 100, 'Gear', '#FFD700', 'Legendary gold sword held in hand in 3D views.', '3d_render'),
(4, 'Black Denim Pants', 25, 'Pants', '#222222', 'Sleek black pants for any outfit combo.', '3d_render'),
(5, 'Neon Purple Shirt', 30, 'Shirt', '#8A2BE2', 'Stylish bright purple shirt.', '3d_render'),
(6, 'Crimson Knight Helm', 150, 'Hat', '#DC143C', 'Heavy crimson helmet accessory.', '3d_render');



CREATE TABLE `friendships` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `status` enum('pending','accepted') DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `friendships` (`id`, `user_id`, `friend_id`, `status`, `created_at`) VALUES
(1, 2, 3, 'pending', '2026-09-12 23:07:46'),
(3, 2, 9, 'pending', '2026-09-12 23:10:34');



CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `host_id` int(11) NOT NULL,
  `map_data` longtext DEFAULT NULL,
  `max_players` int(11) DEFAULT 10,
  `status` enum('waiting','playing','closed') DEFAULT 'waiting',
  `created_at` datetime DEFAULT current_timestamp(),
  `genre` varchar(50) DEFAULT 'Sandbox',
  `description` text DEFAULT NULL,
  `visits` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `games` (`id`, `title`, `host_id`, `map_data`, `max_players`, `status`, `created_at`, `genre`, `description`, `visits`) VALUES
(1, 'Test', 0, NULL, 10, 'waiting', '2026-09-12 23:35:20', 'Sandbox', 'test but good', 8),
(2, 'THE BEST GAME EVER', 0, NULL, 10, 'waiting', '2026-09-12 23:36:29', 'Sandbox', '', 6),
(3, 'ye', 0, NULL, 10, 'waiting', '2026-09-12 23:40:35', 'Sandbox', 'ye', 10);



CREATE TABLE `presence` (
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `pos_x` float DEFAULT 0,
  `pos_y` float DEFAULT 2.6,
  `pos_z` float DEFAULT 0,
  `rot_y` float DEFAULT 0,
  `is_moving` tinyint(1) DEFAULT 0,
  `is_grounded` tinyint(1) DEFAULT 1,
  `last_chat` varchar(255) DEFAULT NULL,
  `chat_time` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `presence` (`user_id`, `game_id`, `pos_x`, `pos_y`, `pos_z`, `rot_y`, `is_moving`, `is_grounded`, `last_chat`, `chat_time`, `updated_at`) VALUES
(2, 1, -4.46, 2.6, 15.74, 1.57, 0, 1, 'hello', '2026-09-12 23:16:40', '2026-09-12 23:17:37'),
(9, 1, 0, 2.6, 15, 0, 0, 1, 'Hi', '2026-09-12 23:11:07', '2026-09-12 23:17:18');



CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `skin_color` varchar(20) DEFAULT '#ffdfbd',
  `shirt_color` varchar(20) DEFAULT '#00ff00',
  `pants_color` varchar(20) DEFAULT '#333333',
  `equipped_hat` varchar(20) DEFAULT NULL,
  `equipped_gear` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `users` (`id`, `username`, `password`, `created_at`, `skin_color`, `shirt_color`, `pants_color`, `equipped_hat`, `equipped_gear`) VALUES
(2, 'Kipsta', '$2y$10$8yfrp48gcV585npvrk4NkucIre4x.6g2jrqBQmfV9GnGma/U5QhQW', '2026-09-12 14:29:13', '#ffdfbd', '#000000', '#ffffff', '#DC143C', NULL),
(3, 'hydroxy', '$2y$10$lcteSGSzHOYKOFAP6Ua35e4V5gD9ewGEjO04FN7i570qXDETGqfPu', '2026-09-12 19:58:47', '#ffffff', '#000000', '#333333', '#0000FF', '#FFD700'),
(4, 'Cambii', '$2y$10$vFPWJctx.deL8DhqIp.E3OKL3NWBar01nQW/dB95VFbkJ8317F03G', '2026-09-12 20:02:36', '#ffdfbd', '#00ff00', '#333333', '#DC143C', NULL),
(5, 'Admin', '$2y$10$JXhvqnsb6oGP2lts8qmm8.XbMRyPIpdFnnTpoaogHjj0GuSPnSkGC', '2026-09-12 20:04:25', '#ffdfbd', '#00ff00', '#333333', NULL, NULL),
(6, 'x', '$2y$10$8ifk3UQj/.eCWDwgdktzyeHao7QM7ygr4x8tAnwixAlerplCErjp6', '2026-09-12 20:05:30', '#ffdfbd', '#00ff00', '#333333', NULL, NULL),
(7, 'Builderman', '$2y$10$gjYvfIqo4cwPkQQZMrlS3ujBc4HFwyMjAWC7zYaaEXrOUQnTm1ve6', '2026-09-12 20:29:01', '#ffdfbd', '#00ff00', '#333333', NULL, NULL),
(8, 'Roblox', '$2y$10$7dbq/WU4plfQgtTxl0ZmAe46oyWeWa0q/E6/jYTJC2pXc.TmW8ZAq', '2026-09-12 20:29:55', '#ffdfbd', '#00ff00', '#333333', NULL, NULL),
(9, 'Yousuf', '$2y$10$JXvs9Er.P5zSA5s3exaW8etnX3TmXpSdZR1YulOUMqn62PjXoPwPW', '2026-09-12 23:10:22', '#FFFF00', '#ADD8E6', '#FFFF00', NULL, NULL),
(10, 'santy', '$2y$10$R4KvRbMCUerwUvg2ucMSYeTV0NiVBE6Ml8udq5MosfEAzZp5MfFVu', '2026-09-12 23:39:20', '#FFFF00', '#ADD8E6', '#FFFF00', NULL, NULL),
(12, 'santy1', '$2y$10$aTQbulUXJ4Id.YwqO4ZBBep0VO/TnxRStf/H4icjk.rUrWGg8RujG', '2026-09-12 23:39:34', '#FFFF00', '#ADD8E6', '#FFFF00', NULL, NULL),
(14, 'Louckitten', '$2y$10$BxIfVRFHPCUyXZzt3rWmAuQufNiSjb1VJPiglysvuhdwK0oqeFdNK', '2026-09-12 23:43:13', '#FFFF00', '#ADD8E6', '#FFFF00', NULL, NULL);


ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `friendships`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_friend_unique` (`user_id`,`friend_id`);

ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `presence`
  ADD PRIMARY KEY (`user_id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);


ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `friendships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
