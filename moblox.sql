
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;




CREATE TABLE `auth_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(190) NOT NULL DEFAULT '',
  `password_hash` varchar(255) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `bux` bigint(20) NOT NULL DEFAULT 0,
  `tickets` bigint(20) NOT NULL DEFAULT 0,
  `headcolor` int(11) NOT NULL DEFAULT 194,
  `torsocolor` int(11) NOT NULL DEFAULT 194,
  `leftarmcolor` int(11) NOT NULL DEFAULT 194,
  `rightarmcolor` int(11) NOT NULL DEFAULT 194,
  `leftlegcolor` int(11) NOT NULL DEFAULT 194,
  `rightlegcolor` int(11) NOT NULL DEFAULT 194,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `tshirt` int(11) NOT NULL DEFAULT 0,
  `shirt` int(11) NOT NULL DEFAULT 0,
  `pants` int(11) NOT NULL DEFAULT 0,
  `hat1` int(11) NOT NULL DEFAULT 0,
  `hat2` int(11) NOT NULL DEFAULT 0,
  `hat3` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `auth_users` (`id`, `username`, `email`, `password_hash`, `user_id`, `created_at`, `bux`, `tickets`, `headcolor`, `torsocolor`, `leftarmcolor`, `rightarmcolor`, `leftlegcolor`, `rightlegcolor`, `is_admin`, `tshirt`, `shirt`, `pants`, `hat1`, `hat2`, `hat3`) VALUES
(1, 'Caldren', 'mohamedviscabarca@outlook.com', '$2y$10$sPhDlEBw.kcgwpbCCwXCUuOZRlYiH/FR6qLZXvqYs9gNGSvuuP88q', NULL, '2026-09-13 13:51:37', 6, 101, 125, 28, 125, 125, 45, 45, 1, 0, 0, 0, 0, 0, 0),
(9, 'Roblox', 'robloxstarcreator001@gmail.com', '$2y$10$UDsDE8EsIucBt81SFeYZROLL6k3o49f8fD8NIITWNjmDpn1vC4TgS', 2, '2026-09-13 23:40:41', 0, 0, 24, 21, 24, 24, 23, 23, 0, 0, 0, 0, 0, 0, 0),
(10, 'Aw3s0m3', 'gunjeo55@gmail.com', '$2y$10$LXW.eYg8AN5Fzg6gzN4.jOtRrPnCsSWZHZ3bWAyoH1gGS7Qd1l2vW', 3, '2026-09-14 15:08:46', 0, 0, 194, 194, 194, 194, 194, 194, 0, 0, 0, 0, 0, 0, 0),
(11, 'god', 'tranduonggiahungbt@gmail.com', '$2y$10$qXxAxxpd0pGCJgskYCNbHeJn6mS5MV/Bj/IwC0YlkVFap2.wEFIFO', 4, '2026-09-14 15:13:20', 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0),
(12, 'Yousuf', 'mohamedviscabarca@outlook.com', '$2y$10$YSjb47GN1c5h.7mBt1S54ebzwxD5MHrrpTXAP7Us5cwcohVS.Ml1u', 5, '2026-09-14 15:19:11', 1000, 1000, 125, 106, 125, 125, 106, 106, 1, 0, 0, 0, 0, 0, 0),
(13, 'test', 'hereis71@outlook.com', '$2y$10$yhkww/Xi4r9ou47V8hwQCONFBT8WYd.5Z0FqWQdR1Be3mHByxwmYO', 6, '2026-09-14 15:41:53', 0, 0, 194, 194, 194, 194, 194, 194, 0, 0, 0, 0, 0, 0, 0),
(14, 'CheckPointTest129', 'nyancat1131@gmail.com', '$2y$10$GjJBjcwbV1VFdFBg8FNB0u.ksaZqZ05wJLFbeJggTKuFmV.Y9KGmO', 7, '2026-09-14 16:31:21', 0, 0, 1, 194, 194, 194, 23, 23, 0, 0, 0, 0, 0, 0, 0),
(15, 'halibutthecanadian', 'halibutgames@mailo.com', '$2y$10$q9I.Vh2qP2SBMB88YwUO1Ol1cPeRQb7r56BPZsc0q5wbOcjUCoP3S', 8, '2026-09-15 14:26:27', 0, 0, 194, 194, 194, 194, 194, 194, 0, 0, 0, 0, 0, 0, 0),
(16, 'defaultuser0', 'xylengd@gmail.com', '$2y$10$x2H/SpD/qoYcD7i4S6BDMOUkUH2d6lLhfdUoaeoDVgssgs7hDHy22', 9, '2026-09-15 14:45:38', 100000000, 100000000, 106, 45, 24, 194, 45, 101, 0, 0, 0, 0, 0, 0, 0),
(18, 'Erikcassel', 'poyrazsoyadiyok@gmail.com', '$2y$10$lARfzlbmDLhzKEiJwIRspu4V2Gnem2U6ta4z26tkwY/g8/RzX639O', 11, '2026-09-15 16:23:06', 0, 0, 24, 23, 24, 24, 37, 37, 0, 0, 0, 0, 0, 0, 0),
(19, 'bob', 'vanillahead04@Gmail.com', '$2y$10$bAwctrDbbEhr8OdFfza4ruU8nPgnPF2KbnsWH9WwGV4GPFh9fcFYm', 12, '2026-09-15 17:29:41', 0, 0, 194, 194, 194, 194, 194, 194, 0, 0, 0, 0, 0, 0, 0),
(20, '911', 'datrosesquad@gmail.com', '$2y$10$ex7q2cCO2lVm3ao6BwF46Oedpn.iShrkiYjUZ5IOWqsocDzbcNXwS', 13, '2026-09-16 12:56:34', 0, 0, 194, 194, 194, 194, 194, 194, 0, 0, 0, 0, 0, 0, 0),
(21, 'Builderman', 'poyrazsoyadiyok@gmail.com', '$2y$10$oGe/J4WpX81AaLFJG8yTouut7wIN9jWrof8hJXxEJ5gOkMujutwM2', NULL, '2026-09-16 19:38:29', 0, 0, 24, 23, 24, 24, 37, 37, 0, 0, 0, 0, 0, 0, 0),
(22, 'stupid', 'no@gmail.com', '$2y$10$yVLkhk96bxMLiiTmuSFdzO5Lzuqi4Hs7jbL5R.dgZ4ab49cF4UYRG', 15, '2026-09-17 08:52:28', 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0);



CREATE TABLE `avatar_settings` (
  `auth_user_id` int(10) UNSIGNED NOT NULL,
  `head_color` int(11) NOT NULL DEFAULT 24,
  `torso_color` int(11) NOT NULL DEFAULT 23,
  `left_arm_color` int(11) NOT NULL DEFAULT 24,
  `right_arm_color` int(11) NOT NULL DEFAULT 24,
  `left_leg_color` int(11) NOT NULL DEFAULT 141,
  `right_leg_color` int(11) NOT NULL DEFAULT 141,
  `thumbnail_path` varchar(255) NOT NULL DEFAULT '',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `avatar_settings` (`auth_user_id`, `head_color`, `torso_color`, `left_arm_color`, `right_arm_color`, `left_leg_color`, `right_leg_color`, `thumbnail_path`, `updated_at`) VALUES
(1, 21, 23, 24, 226, 141, 141, '', '2026-09-14 13:33:15');



CREATE TABLE `caldren_ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `link_url` varchar(1000) NOT NULL DEFAULT '',
  `image_path` varchar(1000) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `caldren_ads` (`id`, `title`, `body`, `link_url`, `image_path`, `active`, `created_at`, `updated_at`) VALUES
(4, 'Hi', '', 'https://agreement-lifting-rural.ngrok-free.dev/home.php', 'uploads/ads/93174438d38fc01f7f3e7a0d.png', 1, '2026-09-16 10:39:30', '2026-09-16 20:56:47'),
(5, '', '', '', 'uploads/ads/b7749cd27bd1945e4b0e919a.webp', 0, '2026-09-16 15:26:49', '2026-09-16 16:54:25');



CREATE TABLE `caldren_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `caldren_statuses` (`id`, `user_id`, `status`, `created_at`) VALUES
(1, 1, 'HIII', '2026-09-16 12:33:34'),
(2, 12, 'Hi', '2026-09-16 12:52:27'),
(3, 11, 'hi', '2026-09-16 12:54:09'),
(4, 1, 'HOME PAGE IS HERE', '2026-09-16 12:56:16'),
(5, 12, 'WOW', '2026-09-16 14:01:57'),
(6, 1, 'Client....', '2026-09-16 18:41:46'),
(7, 21, 'wowowo', '2026-09-16 20:04:15'),
(8, 12, 'WOW', '2026-09-17 00:43:07'),
(9, 22, 'pluh', '2026-09-17 08:53:29'),
(10, 1, 'hi stupid', '2026-09-17 09:19:25');



CREATE TABLE `catalog_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `item_type` enum('hat','shirt','tshirt','pants') NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `asset_url` varchar(500) DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `currency` enum('meows','cats') NOT NULL DEFAULT 'meows',
  `creator_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image_path` varchar(255) DEFAULT NULL,
  `mesh_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `friends` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `friends` (`id`, `user_id`, `friend_id`, `created_at`) VALUES
(3, 1, 2, '2026-09-14 15:45:27'),
(5, 6, 2, '2026-09-14 15:59:38'),
(6, 4, 2, '2026-09-14 16:00:52'),
(7, 1, 4, '2026-09-14 16:04:03'),
(8, 5, 2, '2026-09-14 16:17:43'),
(9, 1, 7, '2026-09-14 17:11:40'),
(10, 9, 1, '2026-09-15 14:46:28'),
(12, 1, 5, '2026-09-17 00:39:09');



CREATE TABLE `friend_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `friend_requests` (`id`, `sender_id`, `receiver_id`, `created_at`) VALUES
(8, 1, 13, '2026-09-14 15:42:21'),
(14, 7, 6, '2026-09-14 16:58:32'),
(15, 7, 4, '2026-09-14 16:58:43'),
(16, 7, 2, '2026-09-14 16:58:50'),
(18, 7, 3, '2026-09-14 16:59:06'),
(19, 4, 8, '2026-09-15 14:30:47'),
(20, 1, 11, '2026-09-16 09:17:47'),
(22, 9, 2, '2026-09-16 14:19:33'),
(23, 1, 15, '2026-09-17 09:06:30');



CREATE TABLE `games` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `owner_username` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `place_file` varchar(255) DEFAULT NULL,
  `place_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `games` (`id`, `name`, `description`, `owner_id`, `owner_username`, `created_at`, `updated_at`, `place_file`, `place_id`) VALUES
(1, 'test', '', 1, 'Mohamed', '2026-09-13 16:19:13', '2026-09-13 16:19:13', NULL, NULL),
(2, 'Rocket Arena', 'This map goes back to the basics: rockets, jetboots, and blowing up bridges. Out-maneuver your foes using your jetboots, cut off their escape by nuking the bridges, and rain doom down upon them using a rapid-fire rocket launcher. But don\'t fall in the lava - ouch!', 2, 'Roblox', '2026-09-14 14:47:19', '2026-09-14 14:47:19', NULL, NULL),
(3, 'hello', '', 7, 'CheckPointTest129', '2026-09-14 15:34:29', '2026-09-14 15:34:29', NULL, NULL),
(4, 'place', '', 1, 'TimeBlox', '2026-09-16 08:30:50', '2026-09-16 09:30:50', '4.rbxl', 4);



CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `members` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `groups` (`id`, `name`, `description`, `icon`, `owner_id`, `members`, `created_at`) VALUES
(1, 'Caldren', 'Offical Group', 'uploads/groups/group_ba5891c2304646cd8ae685d765ccd852.webp', 1, 1, '2026-09-17 01:10:37');



CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `subject` varchar(200) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `subject`, `body`, `is_read`, `created_at`) VALUES
(1, 1, 6, 'HII', 'hello', 0, '2026-09-14 14:59:24'),
(4, 1, 12, 'thanks', 'you', 0, '2026-09-14 15:46:01');



CREATE TABLE `owned_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `equipped` tinyint(1) NOT NULL DEFAULT 0,
  `purchased_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `owned_items` (`id`, `user_id`, `item_id`, `equipped`, `purchased_at`) VALUES
(2, 1, 1163672, 0, '2026-09-15 11:13:11');



CREATE TABLE `promo_codes` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(100) NOT NULL,
  `reward` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `reward_amount` bigint(20) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `promo_codes` (`id`, `code`, `reward`, `active`, `created_at`, `reward_amount`) VALUES
(1, 'CATBLOX-0A2216BCA6', '10 Renbux', 1, '2026-09-16 23:11:38', 10),
(2, 'CATBLOX-BA8B8859AC', '10 Renbux', 1, '2026-09-16 23:17:47', 10),
(3, 'CATBLOX-92B203A32B', '10 Renbux', 1, '2026-09-16 23:22:45', 10);



CREATE TABLE `promo_code_redemptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `promo_code_id` int(10) UNSIGNED NOT NULL,
  `redeemed_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `promo_code_redemptions` (`id`, `user_id`, `promo_code_id`, `redeemed_at`) VALUES
(1, 1, 1, '2026-09-16 23:11:49'),
(2, 1, 2, '2026-09-16 23:17:58'),
(3, 1, 3, '2026-09-16 23:22:55');



CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sessKey` char(64) NOT NULL,
  `userId` int(10) UNSIGNED DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `sessions` (`id`, `sessKey`, `userId`, `created`) VALUES
(1, '51b2f729d5105776aa98851704a17dd619f5ad1b0553b8ce07b506397869c591', 1, '2026-09-13 13:51:37'),
(2, '38c058b457dc16632fb7458cc8cb0c709a4e7335cef49fdb9f7a0131e3d4f96e', 2, '2026-09-13 13:52:07'),
(3, '25d03eba6810f46dd5ceb1d462595439368a3b295d043f3e0e8245b1b4081b68', 1, '2026-09-13 13:54:19'),
(4, '147eb591c7123da7b9aecde96f1c8dbd33625ee58beb1f98dbf17e0c91c46413', 1, '2026-09-13 13:56:32'),
(5, 'dfd8a2d52505ce1514594fd00d5c21b41611b8c78750cda50672ec4034f7e865', 1, '2026-09-13 14:00:41'),
(6, 'e2c8b31f4ed6267b5002f6faf0633478e71f0f851f237eb72945b7dd90878cb2', 1, '2026-09-13 14:07:39'),
(7, '981dce00373ab8ee3cae444d6a501600a22b2369e62385842a520b4943e597f5', 1, '2026-09-13 16:42:09'),
(8, '72ca0d69be32795faed59a39db2e19f850b65f52ce91b46ea5e5257ca1658374', 3, '2026-09-13 16:43:15'),
(9, '476cba6ca78a2f570a34d4ec949c0dfcd0a40155596ac406af721fd795ebdd60', 1, '2026-09-13 16:44:27'),
(10, 'ef6c6943ed9b5a7ad34b1ebebea0b0aefecc533c5dc15a2578aff5c9e980292f', 4, '2026-09-13 16:44:55'),
(11, 'cfebfece510ff567df8b855bb496814d2256b1b92eac9bb823bde24db8e4f05b', 5, '2026-09-13 16:44:58'),
(12, 'd330d885a6ea5dacba46842cab9e457de87fb84fca1688f787ada0833b72e6d7', 6, '2026-09-13 16:46:02'),
(13, '2df5d2c947429df69e16c95ca62333887b3cb358496fe8d4e84d0773b88cbcf7', 7, '2026-09-13 16:51:42'),
(14, '0008dbe41de7f709466680cc736f235ba5088e56c9c433dcc2c423a1e4d4b0ee', 8, '2026-09-13 17:05:04'),
(15, 'c9d517246eadd620bbb12ee5a9740e8c82aecd04c0999538f61148c99efb1ac3', 1, '2026-09-13 21:27:57'),
(16, '627f89196a05141a4b6d851a8cfca22ff16efca8b7645087167fc1c707eaf68b', 1, '2026-09-13 22:49:55'),
(17, 'ab02eedb61aadd20ba06a72ed028ed84f9a95e24b239bb42b7627f33e56f9ee3', 1, '2026-09-13 22:53:28'),
(18, '811915129026c963f8a0ebf6500b011f60c5e8d9df7ef37b00124b46cc9f189e', 1, '2026-09-13 23:04:39'),
(19, 'f10d0ad410957d3d51f29da423456cc94f13fca579f0322ff6a34c6f6236edd3', 2, '2026-09-13 23:40:41'),
(20, 'aae21767c2effecc35856e642023dcdb9ef63bf0e2a3e62dde0a63da4d372b49', 1, '2026-09-14 13:12:21'),
(21, '9a13cf6c1bb713cd1f8ddbc708012071bfc8240e0b25a6a0886f18fa09ebc07d', 1, '2026-09-14 14:17:37'),
(22, 'af7029efbcb1c99769bd7341a095aa44df923e945a2999e944cf0c702de63bf6', 3, '2026-09-14 15:08:46'),
(23, 'ee33b5cfef1300802187543e40bfef71a2a3f18bac4658ccdf2a5e52904e5723', 4, '2026-09-14 15:13:20'),
(24, '99482af169ae9e1ced44a2d82697ac177c802f6765a0522b497c8fb507b058d8', 5, '2026-09-14 15:19:11'),
(25, '7876a3b9997ebe1eb3206dc530033f5ba83e7ddc2571ceda1c3b129295072127', 2, '2026-09-14 15:33:05'),
(26, 'fa7222a5895f44e72369b1cd00555f3742c2321cc312d39809abe412dadc4890', 1, '2026-09-14 15:33:47'),
(27, 'fcd2102514ea110da1d27180c3e2bb2f06638a5deb10cfb656ef5fcf42cb4e73', 5, '2026-09-14 15:34:58'),
(28, '02954ab76d511db203449af44a70cc249d5b00164428ef359e37d78afe107274', 6, '2026-09-14 15:41:53'),
(29, '8c24945e819450cd08653030f984129567d4b8cc00605afd7c85ee60434323ab', 1, '2026-09-14 16:14:08'),
(30, '8f902b5004b72a92214f15f6c2594a807b27e177a3cd652bdfae39bf9015b457', 5, '2026-09-14 16:16:59'),
(31, 'a705c52d4f66f60dcafbcb4d06fd3891359d79fca09b1ac370837f79eaa7ed85', 5, '2026-09-14 16:17:11'),
(32, '11eed135dc04e651cf51f28f102a5b07d16a123dade6fb8282aecbbc27f01982', 2, '2026-09-14 16:17:19'),
(33, '80387a53b5ec6e7e6356f718e93c022c227c1213fc00979c1e1f2bb3e88ff804', 2, '2026-09-14 16:18:45'),
(34, 'dfbe05391da88ff20b59efb8b24363b87b2777774ca08351972f27cb36c91496', 1, '2026-09-14 16:20:03'),
(35, 'dc68d83e4c3606f3ed59094bdd20772fd009c5d3a1fc7ed060d27668b990e76d', 7, '2026-09-14 16:31:21'),
(36, '09a68e33cb5cc9b733836cd491fc22a8805ad3812314abf5aad53c379e00bb95', 5, '2026-09-14 16:37:52'),
(37, '22f71d177734340dedb1f781149740685855bdb8a13d88e80157442406f9b5e3', 1, '2026-09-14 18:18:26'),
(38, '941bfc992d150d71de83aa06d49e3a34eaf6af2358e8ca9ffeac99d4de629d57', 1, '2026-09-15 13:39:32'),
(39, '74dcfe699bcedda8c2129c525db8e90fdd29fce35c56fdb52e167a174486ced2', 1, '2026-09-15 14:00:18'),
(40, '35fa206827de46232ea9c49725368cf0fdfeecffd8137c088672fa7e78526a05', 4, '2026-09-15 14:25:00'),
(41, '9221f1f45703e28e84e5fcfba2ed27ee8ff0e35c4bef5b49da0ae1ed9f8c7fc4', 8, '2026-09-15 14:26:27'),
(42, '1f0d5c5eb4cb8eabfb9cd1f13d879f6d1cd22567a9368a7f7a3789f519f4c165', 5, '2026-09-15 14:28:59'),
(43, '1db61c0fda6b1160ba3cadc103bc56c90177b023bd6cfb3c63e195c2394ba6ca', 1, '2026-09-15 14:42:15'),
(44, '462da277ce1eb11a50c609d3181e6f88782148b87325941b21685ceaf6bc2097', 9, '2026-09-15 14:45:38'),
(45, '188e2cfbff5ee1ef855503ffae9de69e2887c8056c9267cd3e5095e5f623074e', 8, '2026-09-15 15:04:13'),
(46, 'c283d29e4fee1f0421a31601dc2bdab7c93fe19c989c9d9e67064595d2d8685c', 1, '2026-09-15 15:21:09'),
(47, 'a24928e75aeb227881ab5e1d7fcd9c8a4154eb813f6b07e3ce3e04dd3a5a5c60', 10, '2026-09-15 16:20:19'),
(48, 'b414330b39e75a330595fb3c5258640cbf68051114249c801d2f87d65aaa357b', 11, '2026-09-15 16:23:06'),
(49, '00515f5e48b159bfbcb6dba17fc9f92f365b39b9b830d107870fee5bdfe25245', 1, '2026-09-15 16:51:31'),
(50, '0c422b0279e0f02b6899325e3b6d58f6ff1f70465754e7ff188e3f0a75c28016', 9, '2026-09-15 17:09:45'),
(51, '701ee48f29412406206812c17f01402db8d890305a46f819bb4cfbe38c37b588', 5, '2026-09-15 17:26:43'),
(52, 'e1055511ae0dad38f1bb90c8fff2e3a4c4c344eec4775eff03198bafd53d2143', 12, '2026-09-15 17:29:41'),
(53, '02ab8db6ae386120162e545c7e9e2f86cbe673a6af42f08d80eb8e1ff70c3293', 1, '2026-09-16 08:06:35'),
(54, '516df8d1b517163e78098ddb7d39a73daedc777f14ab0d30a7a02fe7dc651570', 1, '2026-09-16 08:17:25'),
(55, '5e8d8864421029a9ed6b1d01d1e2e89c28f6d342f58e7045023e4559df63c4b7', 1, '2026-09-16 08:18:35'),
(56, 'bb475339373255d27ad3b081c01a2693d9fcd6eeea4eb4f22cc5a90b086ca520', 1, '2026-09-16 08:19:36'),
(57, '82caac100a8133644b906ad7c020d247e104ebcb550db1fc590d0b422771dcee', 1, '2026-09-16 08:29:29'),
(58, '23df8d421e5ad73782f95da6034b62641c11d6c85649b1b12c5344d9c0d971d3', 1, '2026-09-16 08:30:13'),
(59, '82389cf67ad292ff48449c4b2315071592a0b9a5d13cda7060c7749e034a4fea', 1, '2026-09-16 08:31:14'),
(60, '65b0d5d78dee3ff661ac93843db69561e63e15fcd183edbce2901b577b002fcc', 1, '2026-09-16 08:55:33'),
(61, '664115dc67541edce9520b40f7829076a1eb2438b051e078fbf614151cab571b', 1, '2026-09-16 09:36:08'),
(62, 'bcf29a7bd2aebd8a718fa7df13fa7bfd4e12f49e8f9480facc8af4597ce784de', 1, '2026-09-16 11:05:45'),
(63, '543a316d1a20dd0eec2e81e78545f07e09057b386d4dcc9fd348e4d97d9d34b4', 5, '2026-09-16 11:06:03'),
(64, '56ade22f5fb71260513df5d3b4b2ae0fc962fa884182693334273e75acd078e7', 5, '2026-09-16 11:07:27'),
(65, '6f756a19d6d928be58338f1e86531fbba9d326de76fc1b6139c41179a235d325', 5, '2026-09-16 11:07:30'),
(66, 'fc4c98bf4d13a91fcabffc514c482d9f0d062c02a1ebe2567d0e4a1a3df6bb6c', 5, '2026-09-16 11:13:25'),
(67, '2d2ab158fc5edeaaf2e494d3c9bc6fb2cceb04bd6147dd227d28abb4da6a32db', 5, '2026-09-16 11:13:44'),
(68, 'e74e9d7dcb847fb6a05b9a5a664c4490dbfd501859ce76b099ab21a266d1a62b', 1, '2026-09-16 12:38:40'),
(69, '7e7a933a71cd081b6b44a6317d2b8e2498957f6833ce1b517757115cf59da574', 5, '2026-09-16 12:52:14'),
(70, 'ab2d23ce46e35d43cfdf83b2f4ebccfa7c69cb30eb2e0567d01b9c5007c041cd', 13, '2026-09-16 12:56:34'),
(71, '8a0f354ae39e19c72c0614fc8bc901dfccb1d4c7439b2e82ba0934dda299b58b', 1, '2026-09-16 13:33:24'),
(72, '145ea1866c07b2c76941444542cfc905fb70eff07920fc45299eb9e9d6558f92', 5, '2026-09-16 13:36:15'),
(73, '4ea8453df250c028ec39779176b164f00013ffbc3ba8a2544029ca224d0fa819', 1, '2026-09-16 13:37:57'),
(74, 'f26e6fa05473d5c57ce5166f9eabb3a9660729a9063df75b3981f0a02607c5a2', 5, '2026-09-16 14:01:44'),
(75, '03e72405e187b8d3b3e18525a1c7f3aaf683c64f23c2e24a03970241fff18cff', 1, '2026-09-16 14:09:41'),
(76, '790bdfec9622175ca2c44c12507876e1073a706c3ab828af855e043ed85f819a', 9, '2026-09-16 14:19:13'),
(77, 'b4375d3d21ebe3d2775084f445e56a500b4bed0b7e0060b904489d1b66f17e3c', 1, '2026-09-16 14:19:30'),
(78, '7164d7ec6874e3ba438fd92c30ea9d8f84a97e126bc78e925d3394d51901c1b6', 1, '2026-09-16 14:34:10'),
(79, '389e634fbe894909deb94b7e988d4bb056fd277663d6356576c303c732713872', 1, '2026-09-16 18:06:38'),
(80, 'd5ffb1b796b7912139fbce17aec243d05171606052f3027579dc0faf079044af', 1, '2026-09-16 18:56:58'),
(81, '08100d1d9d641bc41088753343aea8eec356883d82d0b79eeb0b3d0a4ddb8a6e', 1, '2026-09-16 19:05:50'),
(82, '0bf3600250855ae9f00cabfb88650ab883b935bd0e65fb797275a2172900c641', 1, '2026-09-16 19:06:49'),
(83, '2e236480088cc74084a6eb77e610e0d5989eee4d50fe9914917f9bd12c885fe0', 21, '2026-09-16 19:38:29'),
(84, '21a552e7e91fce5c7e41796d471b1fe1dd88c6efe3e04c2f9e62ba00e4519d01', 5, '2026-09-16 20:16:11'),
(85, 'aaecfbbf7aaa4afbc614ec8a34ff34ea5bdeadefe3b0d35e97f06db99bfbce7b', 5, '2026-09-16 20:16:12'),
(86, '2f691f8604c9c5d72030aced1270228bb1c97de38863e799cbeefc1b06a4a22f', 5, '2026-09-16 20:16:22'),
(87, 'e7cc225d2e534245b0736b818aec62d15a838a371a29af4d5a67869e669ddb43', 1, '2026-09-16 20:44:04'),
(88, '557037286895737f3a68c3856dcdba1a001db82b30adfcd8c654704d00cf90cd', 1, '2026-09-16 21:24:06'),
(89, 'd0331bfe90fa28211760ccc32e92aa98ad7343ec5873c8f536c1c957982879b7', 1, '2026-09-16 22:10:39'),
(90, 'f7d11cc7f79f5950e8850d78a2771424c9a600eaec7436466296cfa78bb4053c', 5, '2026-09-16 22:29:58'),
(91, '5d7eb867418c5bd3a5354736e676db2d88d1162198da1817cd71f5a93459a130', 1, '2026-09-16 23:26:04'),
(92, 'f41563ba350caf6fff181b504e11eebc52d0a77799ed34102203e07d91bf44cb', 1, '2026-09-16 23:48:39'),
(93, '2100dde86d9c143be60adc59b07cdd3251568ca981eb17a986c5280dada64994', 1, '2026-09-16 23:52:33'),
(94, 'fc598d9cad4ea331341eb4ca579c88883fda21baaeb34633f6983a7e2aeae4b3', 1, '2026-09-16 23:53:11'),
(95, '5d942ad59a441f3b8596de52210c805f94c2e3a3ee4a06e59bebac2cb0457e4e', 1, '2026-09-16 23:54:02'),
(96, 'f365bf4d8475f1cb4fd09e5be0e5691607d7d75312ff449464f25b89af75c5f2', 5, '2026-09-17 00:42:54'),
(97, '5978493507aa31d4e0c82b2eb96263761c58f8fd007a583c73599c6bde424287', 1, '2026-09-17 01:07:36'),
(98, '336329073d106a9d3ceb7fcdfbf98ba4cc4ce86c00725655396d66534fedcfe4', 1, '2026-09-17 08:45:37'),
(99, 'e9d7124705b99e43f818a7dca7f3aea5f0f8558711d0b0c4f93dbb142aabcbb4', 1, '2026-09-17 08:50:23'),
(100, 'e994b0a226eee1c151c0d340437fb8a078fb2a5f5cef050e518cc069d26f6086', 15, '2026-09-17 08:52:29'),
(101, '9b31aca98dc64662d9188f82bd25e4df68f6e808284496e613a98d013660dd49', 1, '2026-09-17 09:22:58'),
(102, 'e76bb03a11da6a520b42613cb6486bd78c2be8f2acd57649fd462673b0f9a943', 1, '2026-09-17 09:28:21'),
(103, '262981f6380b194f8fd3290a797425ba5053b801bd318661c5fa53d6fa711664', 1, '2026-09-17 12:02:09');



CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `bux` bigint(20) NOT NULL DEFAULT 0,
  `tickets` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `users` (`id`, `username`, `password`, `bux`, `tickets`, `created_at`) VALUES
(1, 'CatBlox', 'CHANGE_THIS_PASSWORD', 20, 22, '2026-09-13 20:28:50'),
(2, 'Roblox', '$2y$10$UDsDE8EsIucBt81SFeYZROLL6k3o49f8fD8NIITWNjmDpn1vC4TgS', 0, 0, '2026-09-13 20:40:41'),
(3, 'Aw3s0m3', '$2y$10$LXW.eYg8AN5Fzg6gzN4.jOtRrPnCsSWZHZ3bWAyoH1gGS7Qd1l2vW', 0, 0, '2026-09-14 12:08:46'),
(4, 'god', '$2y$10$qXxAxxpd0pGCJgskYCNbHeJn6mS5MV/Bj/IwC0YlkVFap2.wEFIFO', 0, 0, '2026-09-14 12:13:20'),
(5, 'Yousuf', '$2y$10$YSjb47GN1c5h.7mBt1S54ebzwxD5MHrrpTXAP7Us5cwcohVS.Ml1u', 0, 0, '2026-09-14 12:19:11'),
(6, 'test', '$2y$10$yhkww/Xi4r9ou47V8hwQCONFBT8WYd.5Z0FqWQdR1Be3mHByxwmYO', 0, 0, '2026-09-14 12:41:53'),
(7, 'CheckPointTest129', '$2y$10$GjJBjcwbV1VFdFBg8FNB0u.ksaZqZ05wJLFbeJggTKuFmV.Y9KGmO', 0, 0, '2026-09-14 13:31:21'),
(8, 'halibutthecanadian', '$2y$10$q9I.Vh2qP2SBMB88YwUO1Ol1cPeRQb7r56BPZsc0q5wbOcjUCoP3S', 0, 0, '2026-09-15 11:26:27'),
(9, 'defaultuser0', '$2y$10$x2H/SpD/qoYcD7i4S6BDMOUkUH2d6lLhfdUoaeoDVgssgs7hDHy22', 0, 0, '2026-09-15 11:45:38'),
(10, 'Builderman', '$2y$10$RTeVRqI30jeZDL5i92Sw4udJ1bezp9V1gvrsTCdE7.V.LJXDUrAHi', 0, 0, '2026-09-15 13:20:19'),
(11, 'Erikcassel', '$2y$10$lARfzlbmDLhzKEiJwIRspu4V2Gnem2U6ta4z26tkwY/g8/RzX639O', 0, 0, '2026-09-15 13:23:06'),
(12, 'bob', '$2y$10$bAwctrDbbEhr8OdFfza4ruU8nPgnPF2KbnsWH9WwGV4GPFh9fcFYm', 0, 0, '2026-09-15 14:29:41'),
(13, '911', '$2y$10$ex7q2cCO2lVm3ao6BwF46Oedpn.iShrkiYjUZ5IOWqsocDzbcNXwS', 0, 0, '2026-09-16 09:56:34'),
(15, 'stupid', '$2y$10$yVLkhk96bxMLiiTmuSFdzO5Lzuqi4Hs7jbL5R.dgZ4ab49cF4UYRG', 0, 0, '2026-09-17 05:52:28');


ALTER TABLE `auth_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `avatar_settings`
  ADD PRIMARY KEY (`auth_user_id`);

ALTER TABLE `caldren_ads`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `caldren_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `created_at` (`created_at`);

ALTER TABLE `catalog_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_id` (`creator_id`),
  ADD KEY `item_type` (`item_type`);

ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_friendship` (`user_id`,`friend_id`),
  ADD KEY `idx_friends_user_id` (`user_id`),
  ADD KEY `idx_friends_friend_id` (`friend_id`);

ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_friend_request` (`sender_id`,`receiver_id`),
  ADD KEY `idx_friend_requests_sender` (`sender_id`),
  ADD KEY `idx_friend_requests_receiver` (`receiver_id`);

ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_games_owner_id` (`owner_id`),
  ADD KEY `idx_games_name` (`name`);

ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_group_name` (`name`);

ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_messages_sender` (`sender_id`),
  ADD KEY `idx_messages_receiver` (`receiver_id`),
  ADD KEY `idx_messages_read` (`is_read`),
  ADD KEY `idx_messages_created` (`created_at`);

ALTER TABLE `owned_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_item` (`user_id`,`item_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `item_id` (`item_id`);

ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `promo_code` (`code`);

ALTER TABLE `promo_code_redemptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_promo` (`user_id`,`promo_code_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `promo_code_id` (`promo_code_id`);

ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sessKey` (`sessKey`),
  ADD KEY `userId` (`userId`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);


ALTER TABLE `auth_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

ALTER TABLE `caldren_ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `caldren_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `catalog_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `friends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `friend_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

ALTER TABLE `games`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `owned_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `promo_codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `promo_code_redemptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
