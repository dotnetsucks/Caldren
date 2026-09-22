
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;




CREATE TABLE `admin_assets` (
  `id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `asset_type` enum('tshirt','shirt','pants','hat') NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `admin_assets` (`id`, `creator_id`, `name`, `description`, `asset_type`, `file_name`, `file_path`, `created_at`) VALUES
(1, 1, 'test', '', 'tshirt', 'test_6F30EC427D9D559D.png', '/assets/tshirt/test_6F30EC427D9D559D.png', '2026-09-17 18:12:17'),
(2, 1, 'test', 'still broken', 'shirt', 'test_92921AD409C05FA8.png', '/assets/shirt/test_92921AD409C05FA8.png', '2026-09-17 20:36:50'),
(3, 1, 'test', '', 'tshirt', 'test_6D9FC557AC912532.gif', '/assets/tshirt/test_6D9FC557AC912532.gif', '2026-09-18 16:43:30'),
(4, 1, 'tet', '', 'shirt', 'tet_2710354D42CF2EC9.png', '/assets/shirt/tet_2710354D42CF2EC9.png', '2026-09-18 16:43:52');



CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL,
  `link` varchar(500) NOT NULL DEFAULT '#',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ad_type` varchar(20) NOT NULL DEFAULT 'box',
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `ads` (`id`, `title`, `image`, `link`, `active`, `created_at`, `ad_type`, `group_id`) VALUES
(10, 'Caldren group', '/uploads/ads/3f7cf87e78bf349ce5d7052938c38ef7.png', 'My/groups.php?id=1', 1, '2026-09-20 12:55:43', 'box', 1),
(13, 'Caldren group', '/uploads/ads/d8cfe4c8ade96a15818cb4f7bff526a3.png', '', 1, '2026-09-20 15:50:39', 'banner', 1),
(14, 'Join today', '/uploads/ads/a454ebea9162eb6e81b2bc4aec8807b3.png', '', 1, '2026-09-21 08:47:38', 'banner', 1),
(15, 'Boots', '/uploads/ads/5bead407ff05f9bbd4f260755939c3d1.png', '', 1, '2026-09-21 09:39:53', 'box', 1);



CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `type` varchar(191) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



CREATE TABLE `forum` (
  `id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `reply_to` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `content` varchar(8192) NOT NULL,
  `time_posted` bigint(20) NOT NULL,
  `category` int(11) NOT NULL,
  `is_pinned` int(11) NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `is_important` tinyint(1) NOT NULL DEFAULT 0,
  `is_anmadcement` tinyint(1) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `bump` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `forumgroups` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `best_friend` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(1337) NOT NULL,
  `creatorid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO `games` (`id`, `name`, `description`, `creatorid`) VALUES
(1, 'Caldren First Game', 'asd', 1);



CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `groups` (`id`, `name`, `description`, `owner_id`, `created_at`) VALUES
(1, 'Caldren', 'Offical Group of Caldren', 1, '2026-09-20 11:12:59'),
(3, 'Second groups', '', 25, '2026-09-20 11:40:53');



CREATE TABLE `group_members` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'Member',
  `joined_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `group_members` (`id`, `group_id`, `user_id`, `role`, `joined_at`) VALUES
(1, 2, 1, 'Owner', '2026-09-20 14:12:59'),
(2, 1, 1, 'Owner', '2026-09-20 14:20:43'),
(13, 3, 25, 'Owner', '2026-09-20 14:40:53'),
(19, 3, 1, 'Member', '2026-09-20 14:52:26'),
(30, 1, 25, 'Member', '2026-09-20 15:51:31'),
(38, 3, 17, 'Member', '2026-09-21 10:47:00');



CREATE TABLE `group_requests` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('pending','accepted','declined') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `group_wall_posts` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `group_wall_posts` (`id`, `group_id`, `user_id`, `body`, `created_at`) VALUES
(1, 1, 1, 'Hey', '2026-09-20 14:12:17'),
(2, 1, 1, 'hello', '2026-09-20 14:15:37');



CREATE TABLE `homepage_facts` (
  `id` int(11) NOT NULL,
  `fact` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `asset_source` varchar(20) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `inventory` (`id`, `user_id`, `asset_id`, `asset_source`, `created_at`) VALUES
(1, 1, 1, 'admin', '2026-09-17 19:15:13'),
(2, 1, 2, 'admin', '2026-09-17 20:36:59');



CREATE TABLE `invite_keys` (
  `id` int(11) NOT NULL,
  `key` varchar(50) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO `invite_keys` (`id`, `key`, `used`) VALUES
(1, 'CALDREN-2009-001', 1),
(2, 'CALDREN-2009-002', 1),
(3, 'CALDREN-2009-003', 1),
(4, 'CALDREN-2009-004', 1),
(5, 'CALDREN-2009-005', 1),
(6, 'CALDREN-2009-006', 1),
(7, 'CALDREN-2009-007', 1),
(8, 'CALDREN-00603533CC6D', 1),
(9, 'CALDREN-9333-3BAE-7016', 1),
(14, 'CALDREN-9333-3BAE-7017', 1),
(15, 'CALDREN-7F21-A94C-3D82', 1),
(16, 'CALDREN-B618-52E7-9A04', 0),
(17, 'CALDREN-4C93-D781-6E25', 0);



CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `creatorid` int(11) NOT NULL,
  `asset` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `pricerobux` decimal(10,0) NOT NULL,
  `pricefree` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` text NOT NULL,
  `moderation` enum('declined','accepted','','') DEFAULT 'declined'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO `items` (`id`, `name`, `creatorid`, `asset`, `price`, `pricerobux`, `pricefree`, `description`, `created_at`, `type`, `moderation`) VALUES
(14, 'My First Hat', 1, 'D:/XXAMP/htdocs/Assets/Hats/14.rbxmx', 0, 0, 1, 'My first custom hat', '2026-09-18 16:47:39', 'hat', 'accepted'),
(15, 'doombringers doombringer', 1, 'D:/XXAMP/htdocs/Assets/Hats/15.rbxm', 0, 0, 1, 'doombringers doombringer', '2026-09-18 18:12:45', 'hat', 'accepted'),
(17, 'test', 1, 'D:/XXAMP/htdocs/Assets/Hats/17.rbxm', 0, 0, 1, '', '2026-09-18 18:18:56', 'hat', 'accepted'),
(18, 'test', 1, 'D:/XXAMP/htdocs/Assets/Hats/18.rbxm', 0, 0, 1, '', '2026-09-18 18:19:05', 'hat', 'accepted'),
(19, 'FTL 26', 1, 'D:/XXAMP/htdocs/Assets/Hats/19.rbxm', 0, 0, 1, '', '2026-09-18 18:26:55', 'hat', 'accepted'),
(20, 'FTL', 1, 'D:/XXAMP/htdocs/Assets/Hats/20.rbxm', 0, 0, 1, '', '2026-09-18 18:29:19', 'hat', 'accepted'),
(21, 'item', 1, 'D:/XXAMP/htdocs/Assets/Hats/21.rbxm', 0, 0, 1, '', '2026-09-18 18:33:14', 'hat', 'accepted'),
(22, 'item', 1, 'D:/XXAMP/htdocs/Assets/Hats/22.rbxm', 0, 0, 1, '', '2026-09-18 18:33:34', 'hat', 'accepted'),
(23, 'ggg', 1, 'D:/XXAMP/htdocs/Assets/Hats/23.rbxm', 0, 0, 1, '', '2026-09-18 18:33:43', 'hat', 'accepted'),
(24, 'lv_0_20260918190444', 1, 'D:/XXAMP/htdocs/Assets/TShirts/24.gif', 0, 0, 0, NULL, '2026-09-18 19:56:02', '11', 'declined'),
(25, 'test', 1, 'http://calr.cc.cd/images/Tickets.png\r\n', 5, 5, 0, NULL, '2026-09-19 07:58:10', 'tshirt', 'accepted'),
(26, 'd9wbo45-8c14b850-9629-460e-9a98-5e2cd0bec19c', 1, 'D:/XXAMP/htdocs/Assets/TShirts/26.jpg', 0, 0, 0, NULL, '2026-09-21 16:04:22', '11', 'declined'),
(27, 'Caldren Classic T-Shirt', 1, '/Thumbs/Catalog/9.png', 10, 10, 0, 'A classic Caldren T-shirt.', '2026-09-21 16:11:42', 'tshirt', 'accepted'),
(28, 'test shirt', 1, '/Thumbs/Catalog/catalog_20260922130909_4e57cf48.png', 0, 10, 0, '', '2026-09-22 11:09:09', 'shirt', 'accepted'),
(29, 'FTL 26', 1, '/Thumbs/Catalog/catalog_20260922131638_43cd1018.png', 0, 0, 1, '', '2026-09-22 11:16:38', 'tshirt', 'accepted'),
(30, 'teapoto', 1, '/Thumbs/Catalog/catalog_20260922135453_bf5a7b44.jpg', 0, 0, 1, 'simple test of teapot', '2026-09-22 11:54:53', 'tshirt', 'accepted');



CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_from` int(11) NOT NULL,
  `user_to` int(11) NOT NULL,
  `subject` varchar(64) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `datesent` int(11) NOT NULL,
  `readfrom` tinyint(1) NOT NULL DEFAULT 0,
  `readto` tinyint(1) NOT NULL DEFAULT 0,
  `deletefrom` tinyint(1) NOT NULL DEFAULT 0,
  `deleteto` tinyint(1) NOT NULL DEFAULT 0,
  `isrequest` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `owned_items` (
  `id` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `type` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO `owned_items` (`id`, `itemid`, `ownerid`, `type`) VALUES
(1, 12, 2, 'shirt'),
(2, 12, 3, 'shirt'),
(3, 12, 1, 'shirt'),
(4, 9, 4, 'tshirt'),
(5, 9, 5, 'tshirt'),
(6, 9, 6, 'tshirt'),
(7, 9, 7, 'tshirt'),
(8, 9, 8, 'tshirt'),
(9, 9, 9, 'tshirt'),
(10, 9, 10, 'tshirt'),
(11, 9, 11, 'tshirt'),
(12, 9, 12, 'tshirt'),
(13, 9, 13, 'tshirt'),
(14, 12, 13, 'shirt'),
(15, 9, 14, 'tshirt'),
(16, 9, 15, 'tshirt'),
(17, 12, 15, 'shirt'),
(18, 9, 16, 'tshirt'),
(19, 9, 17, 'tshirt'),
(20, 9, 18, 'tshirt'),
(21, 9, 19, 'tshirt'),
(22, 9, 20, 'tshirt'),
(23, 9, 21, 'tshirt'),
(24, 9, 22, 'tshirt'),
(25, 9, 23, 'tshirt'),
(26, 9, 24, 'tshirt'),
(27, 9, 25, 'tshirt'),
(28, 9, 25, 'tshirt'),
(29, 14, 1, 'hat'),
(30, 15, 1, 'hat'),
(31, 17, 1, 'hat'),
(32, 19, 1, 'hat'),
(33, 20, 1, 'hat'),
(34, 23, 1, 'hat'),
(35, 25, 1, 'tshirt'),
(36, 26, 1, '11'),
(37, 9, 26, 'tshirt'),
(38, 27, 1, 'tshirt'),
(39, 9, 27, 'tshirt'),
(40, 9, 28, 'tshirt'),
(41, 9, 29, 'tshirt'),
(42, 14, 17, 'hat'),
(43, 28, 1, 'shirt'),
(44, 29, 1, 'tshirt'),
(45, 9, 30, 'tshirt');



CREATE TABLE `places` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `place_file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `places` (`id`, `user_id`, `name`, `description`, `place_file`, `created_at`) VALUES
(1, 1, 'test', 'tet', 'places/place_1.rbxl', '2026-09-21 10:02:45');



CREATE TABLE `profileviews` (
  `id` int(11) NOT NULL,
  `profile` int(11) NOT NULL DEFAULT 0,
  `viewer` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



CREATE TABLE `reports` (
  `userid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `content` text NOT NULL,
  `timeout` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



CREATE TABLE `servers` (
  `id` int(11) NOT NULL,
  `version` varchar(1337) NOT NULL DEFAULT '2008',
  `gameId` int(11) NOT NULL,
  `pending` varchar(1337) NOT NULL DEFAULT 'pending',
  `port` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO `servers` (`id`, `version`, `gameId`, `pending`, `port`, `creator`, `date_created`) VALUES
(1, '2008', 0, 'opened', 2944, 4, '2025-08-07 01:35:34'),
(2, '2008', 1, 'opened', 4871, 2, '2025-08-09 01:05:48');



CREATE TABLE `tmp_file` (
  `id` int(11) NOT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `tmp_file` (`id`, `content`) VALUES
(1, '<?php\n\ninclude __DIR__ . \"/Config/includes.php\";\n\n$error = \"\";\n\nfunction grandom($length) {\n    $characters = \'0123456789abcdefghijklmnopqrstuvwxyz\';\n    $charactersLength = strlen($characters);\n    $randomString = \'\';\n\n    for ($i = 0; $i < $length; $i++) {\n        $randomIndex = random_int(0, $charactersLength - 1);\n        $randomString .= $characters[$randomIndex];\n    }\n\n    return $randomString;\n}\n\n\n/*\n * LOGIN\n */\nif ($_SERVER[\'REQUEST_METHOD\'] === \'POST\') {\n\n    $usernamefield = trim($_POST[\'usernamefield\'] ?? \'\');\n    $passwordfield = $_POST[\'passwordfield\'] ?? \'\';\n\n    if ($usernamefield === \'\' || $passwordfield === \'\') {\n\n        $error = \"<p style=\'color:red;\'>Please fill in all fields.</p>\";\n\n    } else {\n\n        $q = $db->prepare(\"\n            SELECT *\n            FROM users\n            WHERE name = :username\n            LIMIT 1\n        \");\n\n        $q->execute([\n            \'username\' => $usernamefield\n        ]);\n\n        $result = $q->fetch(PDO::FETCH_ASSOC);\n\n        if (!$result) {\n\n            $error = \"<p style=\'color:red;\'>Invalid login credentials.</p>\";\n\n        } elseif (\n            !isset($result[\'passwd\']) ||\n            !password_verify($passwordfield, $result[\'passwd\'])\n        ) {\n\n            $error = \"<p style=\'color:red;\'>Invalid login credentials.</p>\";\n\n        } else {\n\n            session_regenerate_id(true);\n\n            $_SESSION[\'loggedin\'] = true;\n            $_SESSION[\'name\'] = $result[\'name\'];\n            $_SESSION[\'id\'] = (int)$result[\'id\'];\n\n            if (!empty($result[\'authentication\'])) {\n\n                $newToken = $result[\'authentication\'];\n\n            } else {\n\n                $newToken = grandom(36);\n\n                $a = $db->prepare(\"\n                    UPDATE users\n                    SET authentication = :token\n                    WHERE id = :id\n                \");\n\n                $a->execute([\n                    \'token\' => $newToken,\n                    \'id\' => $result[\'id\']\n                ]);\n            }\n\n            $cookieSecure = isset($_SERVER[\'HTTPS\']) &&\n                            $_SERVER[\'HTTPS\'] !== \'off\';\n\n            setcookie(\n                \"_ROBLOSECURITY\",\n                $newToken,\n                [\n                    \'expires\' => 0,\n                    \'path\' => \'/\',\n                    \'secure\' => $cookieSecure,\n                    \'httponly\' => true,\n                    \'samesite\' => \'Lax\'\n                ]\n            );\n\n            $_COOKIE[\"_ROBLOSECURITY\"] = $newToken;\n\n            header(\"Location: /Default.php\");\n            exit;\n        }\n    }\n}\n\n\n/*\n|--------------------------------------------------------------------------\n| DATABASE HOME PAGE DATA\n|--------------------------------------------------------------------------\n*/\n\n\n/*\n * ROBLOX FACTS\n */\n$robloxFacts = [];\n\ntry {\n\n    $factQuery = $db->query(\"\n        SELECT fact\n        FROM homepage_facts\n        WHERE active = 1\n        ORDER BY sort_order ASC, id ASC\n    \");\n\n    $robloxFacts = $factQuery->fetchAll(PDO::FETCH_COLUMN);\n\n} catch (PDOException $e) {\n\n    $robloxFacts = [];\n}\n\n\n/*\n * ONLINE USERS\n */\n$onlineUsers = 0;\n\ntry {\n\n    $onlineQuery = $db->query(\"\n        SELECT COUNT(*)\n        FROM users\n        WHERE lastseen >= (NOW() - INTERVAL 5 MINUTE)\n    \");\n\n    $onlineUsers = (int)$onlineQuery->fetchColumn();\n\n} catch (PDOException $e) {\n\n    $onlineUsers = 0;\n}\n\n\n/*\n * ONLINE STAFF\n */\n$onlineStaff = 0;\n\ntry {\n\n    $staffQuery = $db->query(\"\n        SELECT COUNT(*)\n        FROM users\n        WHERE admin > 0\n        AND lastseen >= (NOW() - INTERVAL 5 MINUTE)\n    \");\n\n    $onlineStaff = (int)$staffQuery->fetchColumn();\n\n} catch (PDOException $e) {\n\n    $onlineStaff = 0;\n}\n\n\n/*\n * TOTAL USERS\n */\n$totalUsers = 0;\n\ntry {\n\n    $totalQuery = $db->query(\"\n        SELECT COUNT(*)\n        FROM users\n    \");\n\n    $totalUsers = (int)$totalQuery->fetchColumn();\n\n} catch (PDOException $e) {\n\n    $totalUsers = 0;\n}\n\n\n/*\n|--------------------------------------------------------------------------\n| ACTIVE ADVERTISEMENT\n|--------------------------------------------------------------------------\n*/\n\n$activeAdBox = null;\n$activeAdBanner = null;\n\ntry {\n    /*\n     * Ads are selected randomly on every page load.\n     * Older ads without an ad_type are treated as box ads.\n     */\n    $adColumnCheck = $db->query(\"\n        SELECT COLUMN_NAME\n        FROM information_schema.columns\n        WHERE table_schema = DATABASE()\n          AND table_name = \'ads\'\n    \");\n    $adColumns = $adColumnCheck->fetchAll(PDO::FETCH_COLUMN);\n\n    if (!in_array(\'ad_type\', $adColumns, true)) {\n        $db->exec(\"ALTER TABLE ads ADD COLUMN ad_type VARCHAR(20) NOT NULL DEFAULT \'box\'\");\n        $adColumns[] = \'ad_type\';\n    }\n\n    if (!in_array(\'group_id\', $adColumns, true)) {\n        $db->exec(\"ALTER TABLE ads ADD COLUMN group_id INT NULL DEFAULT NULL\");\n        $adColumns[] = \'group_id\';\n    }\n\n    $activeAdBoxQuery = $db->query(\"\n        SELECT id, title, image, link, group_id\n        FROM ads\n        WHERE active = 1\n          AND (ad_type = \'box\' OR ad_type IS NULL OR ad_type = \'\')\n        ORDER BY RAND()\n        LIMIT 1\n    \");\n    $activeAdBox = $activeAdBoxQuery->fetch(PDO::FETCH_ASSOC);\n\n    $activeAdBannerQuery = $db->query(\"\n        SELECT id, title, image, link, group_id\n        FROM ads\n        WHERE active = 1\n          AND ad_type = \'banner\'\n        ORDER BY RAND()\n        LIMIT 1\n    \");\n    $activeAdBanner = $activeAdBannerQuery->fetch(PDO::FETCH_ASSOC);\n\n} catch (PDOException $e) {\n    $activeAdBox = null;\n    $activeAdBanner = null;\n}\n\n\n/*\n|--------------------------------------------------------------------------\n| FEATURED GAME\n|--------------------------------------------------------------------------\n*/\n\n$featuredGame = null;\n\ntry {\n\n    $tableQuery = $db->query(\"\n        SELECT COUNT(*)\n        FROM information_schema.tables\n        WHERE table_schema = DATABASE()\n        AND table_name = \'games\'\n    \");\n\n    $gamesTableExists = ((int)$tableQuery->fetchColumn() > 0);\n\n    if ($gamesTableExists) {\n\n        $columnQuery = $db->query(\"\n            SELECT COLUMN_NAME\n            FROM information_schema.columns\n            WHERE table_schema = DATABASE()\n            AND table_name = \'games\'\n        \");\n\n        $gameColumns = $columnQuery->fetchAll(PDO::FETCH_COLUMN);\n\n        $gameIdColumn = null;\n        $gameNameColumn = null;\n        $gameCreatorColumn = null;\n\n        foreach ($gameColumns as $column) {\n\n            $lowerColumn = strtolower($column);\n\n            if ($gameIdColumn === null) {\n\n                if (\n                    $lowerColumn === \'id\' ||\n                    $lowerColumn === \'gameid\' ||\n                    $lowerColumn === \'placeid\'\n                ) {\n                    $gameIdColumn = $column;\n                }\n            }\n\n            if ($gameNameColumn === null) {\n\n                if (\n                    $lowerColumn === \'name\' ||\n                    $lowerColumn === \'title\' ||\n                    $lowerColumn === \'gamename\'\n                ) {\n                    $gameNameColumn = $column;\n                }\n            }\n\n            if ($gameCreatorColumn === null) {\n\n                if (\n                    $lowerColumn === \'creator\' ||\n                    $lowerColumn === \'creatorname\' ||\n                    $lowerColumn === \'owner\' ||\n                    $lowerColumn === \'ownername\'\n                ) {\n                    $gameCreatorColumn = $column;\n                }\n            }\n        }\n\n        if (\n            $gameIdColumn !== null &&\n            $gameNameColumn !== null\n        ) {\n\n            $safeIdColumn =\n                \'`\' . str_replace(\'`\', \'``\', $gameIdColumn) . \'`\';\n\n            $safeNameColumn =\n                \'`\' . str_replace(\'`\', \'``\', $gameNameColumn) . \'`\';\n\n            if ($gameCreatorColumn !== null) {\n\n                $safeCreatorColumn =\n                    \'`\' . str_replace(\'`\', \'``\', $gameCreatorColumn) . \'`\';\n\n                $creatorSQL =\n                    $safeCreatorColumn . \" AS creator\";\n\n            } else {\n\n                $creatorSQL =\n                    \"\'\' AS creator\";\n            }\n\n            $gameSQL = \"\n                SELECT\n                    $safeIdColumn AS game_id,\n                    $safeNameColumn AS game_name,\n                    $creatorSQL\n                FROM games\n                ORDER BY $safeIdColumn DESC\n                LIMIT 1\n            \";\n\n            $gameQuery = $db->query($gameSQL);\n\n            $featuredGame = $gameQuery->fetch(PDO::FETCH_ASSOC);\n        }\n    }\n\n} catch (PDOException $e) {\n\n    $featuredGame = null;\n}\n\n\ninclude __DIR__ . \"/Config/header.php\";\n\n?>\n\n<div id=\"Body\">\n\n<?php if (isset($auth) && $auth == true) { ?>\n\n    <div class=\"FrontPagePanel\" id=\"SignInPane\">\n\n        <div id=\"LoginViewContainer\">\n\n            <div id=\"LoginView\">\n\n                <h5>Logged in</h5>\n\n                <div class=\"AspNet-Login\">\n\n                    <a\n                        title=\"<?php echo htmlspecialchars($_USER[\'name\'] ?? $_SESSION[\'name\'] ?? \'User\'); ?>\"\n                        href=\"/User.aspx\"\n                        style=\"display:inline-block;height:190px;width:152px;cursor:pointer;\"\n                    >\n\n                        <img\n                            src=\"/avatar.php?ID=<?php echo (int)($_USER[\'id\'] ?? $_SESSION[\'id\'] ?? 0); ?>&c=<?php echo rand(0, 1000000); ?>\"\n                            style=\"display:inline-block;margin-top:15px;\"\n                            border=\"0\"\n                            id=\"img\"\n                            height=\"150\"\n                            alt=\"<?php echo htmlspecialchars($_USER[\'name\'] ?? $_SESSION[\'name\'] ?? \'User\'); ?>\"\n                        >\n\n                    </a>\n\n                </div>\n\n            </div>\n\n        </div>\n\n    </div>\n\n<?php } else { ?>\n\n    <div class=\"FrontPagePanel\" id=\"SignInPane\">\n\n        <div id=\"LoginViewContainer\">\n\n            <div id=\"LoginView\">\n\n                <h5>Member Login</h5>\n\n                <div class=\"AspNet-Login\">\n\n                    <form method=\"post\">\n\n                        <div class=\"AspNet-Login\">\n\n                            <div class=\"AspNet-Login-UserPanel\">\n\n                                <label\n                                    for=\"usernamefield\"\n                                    class=\"Label\"\n                                >\n                                    Character Name\n                                </label>\n\n                                <input\n                                    name=\"usernamefield\"\n                                    type=\"text\"\n                                    id=\"usernamefield\"\n                                    tabindex=\"1\"\n                                    class=\"Text\"\n                                    value=\"<?php echo htmlspecialchars($_POST[\'usernamefield\'] ?? \'\', ENT_QUOTES, \'UTF-8\'); ?>\"\n                                />\n\n                            </div>\n\n                            <div class=\"AspNet-Login-PasswordPanel\">\n\n                                <label\n                                    for=\"passwordfield\"\n                                    class=\"Label\"\n                                >\n                                    Password\n                                </label>\n\n                                <input\n                                    name=\"passwordfield\"\n                                    type=\"password\"\n                                    id=\"passwordfield\"\n                                    tabindex=\"2\"\n                                    class=\"Text\"\n                                />\n\n                            </div>\n\n                            <?php echo $error; ?>\n\n                            <div class=\"AspNet-Login-SubmitPanel\">\n\n                                <button\n                                    class=\"Button\"\n                                    type=\"submit\"\n                                    name=\"Login\"\n                                    id=\"Login\"\n                                >\n                                    Login\n                                </button>\n\n                            </div>\n\n                            <div class=\"AspNet-Login-PasswordRecoveryPanel\">\n\n                                <a\n                                    tabindex=\"5\"\n                                    href=\"Login/ResetPasswordRequest.aspx\"\n                                >\n                                    Forgot your password?\n                                </a>\n\n                            </div>\n\n                        </div>\n\n                    </form>\n\n                </div>\n\n            </div>\n\n        </div>\n\n    </div>\n\n<?php } ?>\n\n\n    <div class=\"FrontPagePanel\" id=\"Movie\">\n\n        <object width=\"424\" height=\"250\">\n\n            <param\n                name=\"movie\"\n                value=\"https://www.youtube.com/embed/JYnMb_a0Kqg?si=j-9Ek-QRTQ313rG8\"\n            >\n\n            <param\n                name=\"allowFullScreen\"\n                value=\"true\"\n            >\n\n            <param\n                name=\"allowscriptaccess\"\n                value=\"always\"\n            >\n\n            <embed\n                src=\"https://www.youtube.com/embed/JYnMb_a0Kqg?si=j-9Ek-QRTQ313rG8\"\n                type=\"application/x-shockwave-flash\"\n                allowscriptaccess=\"always\"\n                allowfullscreen=\"true\"\n                width=\"424\"\n                height=\"250\"\n            >\n\n        </object>\n\n    </div>\n\n\n    <!--\n    ============================================================\n    ADVERTISEMENT BESIDE VIDEO\n    ============================================================\n    -->\n\n    <div class=\"FrontPagePanel\" id=\"FrontPageRectangleAd\">\n\n        <div style=\"overflow:hidden;\">\n\n            <?php if ($activeAdBox) { ?>\n\n                <a\n                    href=\"<?php echo htmlspecialchars($activeAdBox[\'link\'], ENT_QUOTES, \'UTF-8\'); ?>\"\n                    target=\"_blank\"\n                >\n\n                    <img\n                        src=\"<?php echo htmlspecialchars($activeAdBox[\'image\'], ENT_QUOTES, \'UTF-8\'); ?>\"\n                        title=\"<?php echo htmlspecialchars($activeAdBox[\'title\'], ENT_QUOTES, \'UTF-8\'); ?>\"\n                        alt=\"<?php echo htmlspecialchars($activeAdBox[\'title\'], ENT_QUOTES, \'UTF-8\'); ?>\"\n                        border=\"0\"\n                        width=\"300\"\n                        height=\"250\"\n                        style=\"display:block;\"\n                    />\n\n                </a>\n\n            <?php } else { ?>\n\n                <div\n                    style=\"\n                        width:300px;\n                        height:250px;\n                        text-align:center;\n                    \"\n                >\n                    No advertisement available.\n                </div>\n\n            <?php } ?>\n\n\n            <a\n                id=\"ctl00_cphRoblox_LargeRectAd_ReportAdButton\"\n                title=\"click to give feedback on an ad\"\n                class=\"BadAdButton\"\n                href=\"/ads.php\"\n            >\n                [ feedback ]\n            </a>\n\n        </div>\n\n    </div>\n\n\n    <div class=\"FrontPagePanel\" id=\"SalesPitch\">\n\n        <a\n            id=\"ctl00_cphRoblox_MoneyMachine_PlayNowButton\"\n            href=\"Games.aspx\"\n        >\n\n            <img\n                src=\"2009 theme/images/PlayNow3.png\"\n                border=\"0\"\n            />\n\n        </a>\n\n    </div>\n\n\n    <div class=\"FrontPagePanel\" id=\"RandomFacts\">\n\n        <div id=\"ctl00_cphRoblox_RandomFacts_pRandomFacts\">\n\n            <h3 style=\"text-align:center;\">\n                CALDREN Facts\n            </h3>\n\n            <div\n                id=\"marqueecontainer\"\n                onmouseover=\"copyspeed=pausespeed\"\n                onmouseout=\"copyspeed=marqueespeed\"\n            >\n\n                <div\n                    id=\"vmarquee\"\n                    style=\"position:absolute;\"\n                >\n\n                    <?php if (!empty($robloxFacts)) { ?>\n\n                        <?php foreach ($robloxFacts as $fact) { ?>\n\n                            <div class=\"RandomFactoid\">\n\n                                <img src=\"images/House.png\"/>\n\n                                <?php echo htmlspecialchars($fact, ENT_QUOTES, \'UTF-8\'); ?>\n\n                            </div>\n\n                        <?php } ?>\n\n                    <?php } ?>\n\n\n                    <div class=\"RandomFactoid\">\n\n                        <img src=\"/images/House.png\"/>\n\n                        <b><?php echo number_format($onlineUsers); ?></b>\n                        players are currently online\n\n                    </div>\n\n\n                    <div class=\"RandomFactoid\">\n\n                        <img src=\"images/Admin.png\"/>\n\n                        <b><?php echo number_format($onlineStaff); ?></b>\n                        staff members are currently online\n\n                    </div>\n\n\n                    <div class=\"RandomFactoid\">\n\n                        <img src=\"/images/Shirt.png\"/>\n\n                        Caldren has\n                        <b><?php echo number_format($totalUsers); ?></b>\n                        registered users\n\n                    </div>\n\n                </div>\n\n            </div>\n\n        </div>\n\n    </div>\n\n\n    <div class=\"FrontPagePanel\" id=\"WhatsNew\">\n\n        <div>\n\n            <div style=\"text-align:center;\">\n\n                <h3>\n\n                    Featured Free Game:\n\n                    <span id=\"ctl00_cphRoblox_FeaturedGames_GameName\">\n\n                        <?php\n\n                        if ($featuredGame) {\n\n                            echo htmlspecialchars(\n                                $featuredGame[\'game_name\'],\n                                ENT_QUOTES,\n                                \'UTF-8\'\n                            );\n\n                        } else {\n\n                            echo \"No games available\";\n\n                        }\n\n                        ?>\n\n                    </span>\n\n                </h3>\n\n            </div>\n\n\n            <?php if ($featuredGame) { ?>\n\n                <div style=\"float:left;\">\n\n                    <div style=\"margin:0px 5px 5px 5px;\">\n\n                        <a\n                            id=\"ctl00_cphRoblox_FeaturedGames_AssetThumbnailImage\"\n                            title=\"<?php echo htmlspecialchars($featuredGame[\'game_name\'], ENT_QUOTES, \'UTF-8\'); ?>\"\n                            href=\"Item.aspx?ID=<?php echo urlencode($featuredGame[\'game_id\']); ?>\"\n                            style=\"display:inline-block;\"\n                        >\n\n                            <img\n                                src=\"\"\n                                border=\"0\"\n                                alt=\"<?php echo htmlspecialchars($featuredGame[\'game_name\'], ENT_QUOTES, \'UTF-8\'); ?>\"\n                            />\n\n                        </a>\n\n                    </div>\n\n                </div>\n\n\n                <div style=\"float:right;\">\n\n                    <div style=\"margin:0px 5px 5px 2px;text-align:center;\">\n\n                        <a\n                            id=\"ctl00_cphRoblox_FeaturedGames_PlayThis\"\n                            title=\"Play this free game!\"\n                            href=\"Item.aspx?ID=<?php echo urlencode($featuredGame[\'game_id\']); ?>\"\n                        >\n\n                            <img\n                                title=\"Play this free game!\"\n                                src=\"/images/PlayThis.png\"\n                                border=\"0\"\n                            />\n\n                        </a>\n\n                        <div id=\"LastUpdate\">\n                            Updated: Recently\n                        </div>\n\n                        <div id=\"Favorited\">\n                            Featured game from database\n                        </div>\n\n                        <div\n                            id=\"ctl00_cphRoblox_FeaturedGames_VisitedPanel\"\n                            class=\"Visited\"\n                        >\n                            Game ID:\n                            <?php echo htmlspecialchars(\n                                $featuredGame[\'game_id\'],\n                                ENT_QUOTES,\n                                \'UTF-8\'\n                            ); ?>\n                        </div>\n\n                        <div id=\"Creator\" class=\"Creator\">\n\n                            <div class=\"Avatar\">\n\n                                <a\n                                    title=\"<?php echo htmlspecialchars(\n                                        $featuredGame[\'creator\'] ?: \'Unknown\',\n                                        ENT_QUOTES,\n                                        \'UTF-8\'\n                                    ); ?>\"\n                                    href=\"#\"\n                                    onclick=\"return false;\"\n                                    style=\"display:inline-block;cursor:pointer;\"\n                                >\n\n                                    <img\n                                        src=\"\"\n                                        border=\"0\"\n                                        alt=\"<?php echo htmlspecialchars(\n                                            $featuredGame[\'creator\'] ?: \'Unknown\',\n                                            ENT_QUOTES,\n                                            \'UTF-8\'\n                                        ); ?>\"\n                                    />\n\n                                </a>\n\n                            </div>\n\n                            Creator:\n\n                            <a href=\"#\">\n\n                                <?php echo htmlspecialchars(\n                                    $featuredGame[\'creator\'] ?: \'Unknown\',\n                                    ENT_QUOTES,\n                                    \'UTF-8\'\n                                ); ?>\n\n                            </a>\n\n                        </div>\n\n                    </div>\n\n                </div>\n\n            <?php } else { ?>\n\n                <div style=\"text-align:center;padding:20px;\">\n\n                    No games are currently available in the database.\n\n                </div>\n\n            <?php } ?>\n\n        </div>\n\n    </div>\n\n\n    <div class=\"FrontPagePanel\" id=\"ParentsCorner\">\n\n        <div id=\"Inside\">\n\n            <img\n                id=\"ctl00_cphRoblox_ShieldImg\"\n                class=\"ShieldImage\"\n                src=\"images/SuperSafe32.png\"\n                border=\"0\"\n            />\n\n            <div\n                style=\"float:left;font-size:x-large;height:42px;width:220px;text-align:center;\"\n            >\n                Parents\' Corner\n            </div>\n\n            <div style=\"clear:left;\"></div>\n\n            <p>\n                We do not allow Kids under age of 13 or ur Account will be terminated so if u are under age of 13 then leave ur not welcome\n            </p>\n\n            <a\n                class=\"Button\"\n                href=\"#\"\n                onclick=\"return false;\"\n            >\n                Learn More\n            </a>\n\n            <a\n                class=\"Button\"\n                href=\"#\"\n                onclick=\"return false;\"\n            >\n                Access Parent Account\n            </a>\n\n            <a href=\"info/Privacy.aspx\">\n\n                <div\n                    style=\"width:120px;float:left;padding:5px;font-size:medium;\"\n                >\n                    Privacy Policy\n                </div>\n\n            </a>\n\n            <a\n                class=\"TrusteeSeal\"\n                href=\"https://web.archive.org/web/20090604133254/http://www.truste.org/ivalidate.php?url=www.roblox.com&amp;sealid=105\"\n            >\n\n                <img\n                    src=\"images/truste_seal_kids.gif\"\n                    border=\"0\"\n                />\n\n            </a>\n\n        </div>\n\n    </div>\n\n\n    <!--\n    ============================================================\n    ADVERTISEMENT UNDER THE GAMES SECTION\n    ============================================================\n    -->\n\n    <div class=\"FrontPagePanel\" id=\"FrontPageBannerAd\">\n\n        <div style=\"overflow:hidden;\">\n\n            <?php if ($activeAdBanner) { ?>\n\n                <a\n                    href=\"<?php echo htmlspecialchars($activeAdBanner[\'link\'], ENT_QUOTES, \'UTF-8\'); ?>\"\n                    target=\"_blank\"\n                >\n\n                    <img\n                        src=\"<?php echo htmlspecialchars($activeAdBanner[\'image\'], ENT_QUOTES, \'UTF-8\'); ?>\"\n                        title=\"<?php echo htmlspecialchars($activeAdBanner[\'title\'], ENT_QUOTES, \'UTF-8\'); ?>\"\n                        alt=\"<?php echo htmlspecialchars($activeAdBanner[\'title\'], ENT_QUOTES, \'UTF-8\'); ?>\"\n                        border=\"0\"\n                        width=\"728\"\n                        height=\"90\"\n                        style=\"display:block;\"\n                    />\n\n                </a>\n\n            <?php } else { ?>\n\n                <div\n                    style=\"\n                        width:728px;\n                        height:90px;\n                        text-align:center;\n                    \"\n                >\n                    No advertisement available.\n                </div>\n\n            <?php } ?>\n\n\n            <a\n                class=\"BadAdButton\"\n                href=\"/ads.php\"\n            >\n                [ feedback ]\n            </a>\n\n        </div>\n\n    </div>\n\n\n    <div class=\"FrontPagePanel\" id=\"NewsFeeder\">\n\n        <div\n            id=\"ctl00_cphRoblox_NewsFeed_pRobloxNews\"\n            class=\"RobloxNews\"\n        >\n\n            <div id=\"RobloxNews\">\n\n                <h4\n                    style=\"text-align:center;height:16px;margin:0px 0px 2px 0px;\"\n                >\n\n                    <a\n                        href=\"https://web.archive.org/web/20090604133254/http://blog.roblox.com/\"\n                    >\n\n                        <font color=\"graytext\">\n                            ROBLOX News\n                        </font>\n\n                    </a>\n\n                </h4>\n\n                <table\n                    id=\"ctl00_cphRoblox_NewsFeed_dlNews\"\n                    cellspacing=\"0\"\n                    cellpadding=\"1\"\n                    border=\"0\"\n                    width=\"158\"\n                >\n\n                    <tr>\n                        <td align=\"left\">\n                            <li style=\"margin-left:1px;\">\n                                <a href=\"https://web.archive.org/web/20090604133254/http://blog.roblox.com/?p=987\">\n                                    Getting it in Gear\n                                </a>\n                            </li>\n                        </td>\n                    </tr>\n\n                    <tr>\n                        <td align=\"left\">\n                            <li style=\"margin-left:1px;\">\n                                <a href=\"https://web.archive.org/web/20090604133254/http://blog.roblox.com/?p=967\">\n                                    Ninja Vs. Gladiator\n                                </a>\n                            </li>\n                        </td>\n                    </tr>\n\n                    <tr>\n                        <td align=\"left\">\n                            <li style=\"margin-left:1px;\">\n                                <a href=\"https://web.archive.org/web/20090604133254/http://blog.roblox.com/?p=961\">\n                                    ROBLOX Trailer Video Contest\n                                </a>\n                            </li>\n                        </td>\n                    </tr>\n\n                    <tr>\n                        <td align=\"left\">\n                            <li style=\"margin-left:1px;\">\n                                <a href=\"https://web.archive.org/web/20090604133254/http://blog.roblox.com/?p=955\">\n                                    Get to the Choppa!\n                                </a>\n                            </li>\n                        </td>\n                    </tr>\n\n                </table>\n\n            </div>\n\n        </div>\n\n    </div>\n\n</div>\n\n\n<?php include __DIR__ . \"/Config/Footer.php\"; ?>'),
(2, '<?php\n\nif (session_status() === PHP_SESSION_NONE) {\n    session_start();\n}\n\ninclude __DIR__ . \"/maintenance.php\";\ninclude __DIR__ . \"/database.php\";\n\n$useridd = isset($_SESSION[\'id\']) ? $_SESSION[\'id\'] : null;\n\n$_USER = null;\n$tix = 0;\n$auth = false;\n\nif ($useridd !== null && isset($db)) {\n    $sql = \"SELECT * FROM users WHERE id = :id\";\n    $stupid = $db->prepare($sql);\n    $stupid->execute([\':id\' => $useridd]);\n    $_USER = $stupid->fetch();\n\n    if ($_USER) {\n        $tix = $_USER[\'tix\'] ?? 0;\n        $auth = true;\n    }\n}\n?>'),
(3, NULL),
(4, NULL);
INSERT INTO `tmp_file` (`id`, `content`) VALUES
(5, '<?php\nrequire_once \'config/includes.php\';\ninclude \'config/header.php\';\n    $id = intval($_GET[\'ID\']);\n if (!$id) {\n        header(\'HTTP/1.1 404 Not Found\');\n        include(\"error.php\");\n        exit;\n    }\n    \n$sql = \"SELECT * FROM games WHERE id = :id\";\n$q = $db->prepare($sql);\n$q->execute([\':id\' => $id]);\n$game = $q->fetch();\n\nif(!$game) {\n    header(\'HTTP/1.1 404 Not Found\');\n    include(\"error.php\");\n    exit();\n}\n\n$gameid = $game[\'id\'];\n\n$sql = \"SELECT * FROM users WHERE id = :id\";\n$q = $db->prepare($sql);\n$q->execute([\':id\' => $game[\'creatorid\']]);\n$creator = $q->fetch();\n\nif(!$creator) {\n    exit(\"user don exist.\");\n}\n?>\n<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js\"></script>\n<script>\nlet isRunning = false;\nlet polling = false;\nlet serverId = null;\n\nfunction runScript() {\n    isRunning = true;\n    console.log(\"Script started!\");\n    for (let i = 0; i < 100; i++) {\n        if (!isRunning) {\n            console.log(\"Script stopped mid-execution.\");\n            return;\n        }\n    }\n}\n\nfunction sleep(ms) {\n    return new Promise(resolve => setTimeout(resolve, ms));\n}\n\nfunction closeModal() {\n    $(\"#ctl00_cphRoblox_VisitButtons_rbxPlaceLauncher_Panel1\").hide();\n    $(\"#Spinner\").hide();\n    $(\"#Requesting\").html(\"\");\n}\n\nfunction CancelJoin() {\n    isRunning = false;\n    polling = false;\n    closeModal();\n    console.log(\"Join cancelled by user.\");\n}\n\nasync function JoinGame() {\n    if (polling) return;\n    polling = true;\n\n    const url = \"/api/gameserver/joingame.php\";\n    const data = {\n        gameId: \"<?php echo $id; ?>\"\n    };\n\n    $(\"#ctl00_cphRoblox_VisitButtons_rbxPlaceLauncher_Panel1\").show();\n    $(\"#Spinner\").show();\n    $(\"#Requesting\").show();\n    $(\"#Requesting\").html(\"Requesting a server\");\n\n    let startedServer = false;\n    let attempts = 0;\n    const maxAttempts = 30;\n\n    while (polling && attempts < maxAttempts) {\n        try {\n            const response = await $.post(url, data);\n            console.log(\"JoinGame raw response:\", response);\n\n            const cleanedResponse = typeof response === \"string\" ? response.trim().toLowerCase() : \"\";\n\n            if (cleanedResponse.startsWith(\"opened\")) {\n                const parts = response.trim().split(\":\");\n                if (parts.length > 1) {\n                    serverId = parts[1];\n                    console.log(\"serverId from joingame.php:\", serverId);\n                } else {\n                    console.warn(\"No server ID returned with \'opened\'\");\n                }\n\n                isRunning = true;\n                runScript();\n                await runJoinSequence();\n                polling = false;\n                return;\n            } else {\n                if (!startedServer) {\n                    await StartServer();\n                    startedServer = true;\n                }\n            }\n        } catch (err) {\n            console.error(\"Failed to ping joingame.php\", err);\n        }\n\n        await sleep(2000);\n        attempts++;\n    }\n\n    if (polling) {\n        $(\"#Requesting\").html(\"Failed to join a server.\");\n    }\n\n    polling = false;\n}\n\nasync function runJoinSequence() {\n    $(\"#ctl00_cphRoblox_VisitButtons_rbxPlaceLauncher_Panel1\").show();\n    $(\"#Spinner\").show();\n    $(\"#Requesting\").show();\n\n    await sleep(600);\n    if (!isRunning) return;\n\n    $(\"#Requesting\").html(\"Waiting for a server\");\n\n    await sleep(900);\n    if (!isRunning) return;\n\n    $(\"#Requesting\").html(\"A server is loading the game\");\n\n    await sleep(200);\n    if (!isRunning) return;\n\n    $(\"#Requesting\").html(\"The server is ready. Joining the game...\");\n\n    await sleep(300);\n    if (!isRunning) return;\n\n    console.log(\"launching client launcher\");\n\n    await sleep(200);\n    if (!isRunning) return;\n\n    if (!serverId) {\n        console.error(\"Error: serverId is NULL before redirect\");\n        return;\n    }\n\n    location.href = \"/api/joingame.php?serverId=\" + serverId;\n\n    await sleep(1500);\n    if (!isRunning) return;\n\n    closeModal();\n}\n\nfunction StartServer() {\n    const url1 = \"/api/gameserver/startserver.php\";\n    const data1 = {\n        id: \"<?php echo $gameid; ?>\"\n    };\n\n    return new Promise((resolve, reject) => {\n        $.post(url1, data1, function(response, status) {\n            if (status === \'success\') {\n                serverId = response.trim();\n                console.log(\"Server started with ID:\", serverId);\n                resolve();\n            } else {\n                console.error(\"Failed to start server\");\n                reject();\n            }\n        });\n    });\n}\n</script>\n\n\n\n        <div id=\"Body\">\n<div id=\"ctl00_cphRoblox_VisitButtons_rbxPlaceLauncher_Panel1\" style=\"display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(100,100,100,0.25);\">\n<div id=\"ctl00_cphRoblox_VisitButtons_rbxPlaceLauncher_Panel1\" class=\"modalPopup\" style=\"width: 27em; position: absolute; top: 50%; left: 50%; transform: translateX(-50%) translateY(-50%); \">\n  \n    <div style=\"margin: 1.5em\">\n        <div id=\"Spinner\" style=\"float:left;margin:0 1em 1em 0\">\n            <img id=\"ctl00_cphRoblox_VisitButtons_rbxPlaceLauncher_Image1\" src=\"/images/ProgressIndicator2.gif\" alt=\"Progress\" border=\"0\"/></div>\n        <div id=\"Requesting\" style=\"display: inline\">\n            Requesting a server</div>\n        <div id=\"Waiting\" style=\"display: none\">\n            Waiting for a server</div>\n        <div id=\"Loading\" style=\"display: none\">\n            A server is loading the game</div>\n        <div id=\"Joining\" style=\"display: none\">\n            The server is ready. Joining the game...</div>\n        <div id=\"Error\" style=\"display: none\">\n            An error occured. Please try again later</div>\n        <div id=\"Expired\" style=\"display: none\">\n            There are no game servers available at this time. Please try again later</div>\n        <div id=\"GameEnded\" style=\"display: none\">\n            The game you requested has ended</div>\n        <div id=\"GameFull\" style=\"display: none\">\n            The game you requested is full. Please try again later</div>\n        <div id=\"RateLimit\" style=\"display: none\">\n            You have been rate limited.</div>\n        <div style=\"text-align: center; margin-top: 1em\">\n            <input id=\"Cancel\" type=\"button\" class=\"Button\" value=\"Cancel\" onclick=\"CancelJoin()\"/></div>\n    </div>\n\n</div>\n</div>\n    \n	<div id=\"ItemContainer\">\n\n		<div id=\"Item\">\n		    <h2><?php echo htmlspecialchars($game[\'name\']); ?></h2>\n		    <div id=\"Details\">\n		    \n		    			    <div id=\"Summary\">\n				    <h3><?=$sitename?> Place</h3>\n				    \n			        \n				    \n				    <div id=\"Creator\" class=\"Creator\">\n                        <div class=\"Avatar\">\n                            <a id=\"ctl00_cphRoblox_AvatarImage\" title=\"<?php echo htmlspecialchars($creator[\'name\']); ?>\" href=\"/User.aspx?ID=<?php echo $creator[\'id\']; ?>\" style=\"display:inline-block;cursor:pointer;\"><img src=\"/Avatar.ashx?ID=<?php echo $creator[\'id\']; ?>\" width=\"100\" height=\"100\" border=\"0\" alt=\"<?php echo htmlspecialchars($creator[\'name\']); ?>\" blankurl=\"http://t6-cf.roblox.com/blank-100x100.gif\"/></a>\n                        </div>\n                        Creator: <a id=\"ctl00_cphRoblox_CreatorHyperLink\" href=\"/User.aspx?ID=<?php echo $creator[\'id\']; ?>\"><?php echo htmlspecialchars($creator[\'name\']); ?></a>\n                    </div>\n				    <div id=\"LastUpdate\">Updated: 3 hours ago</div>\n				    <div id=\"Favorited\">Favorited: 10,096 times</div>\n				    <div id=\"ctl00_cphRoblox_VisitedPanel\" class=\"Visited\">Visited: 105,995 times</div>\n				    <div id=\"ctl00_cphRoblox_DescriptionPanel\">\n	\n					    <div id=\"DescriptionLabel\">Description:</div>\n					    <div id=\"Description\"><?php echo htmlspecialchars($game[\'description\']); ?></div>\n				    \n</div>\n	                <div id=\"ReportAbuse\"><div id=\"ctl00_cphRoblox_AbuseReportButton1_AbuseReportPanel\" class=\"ReportAbusePanel\">\n	\n    <span class=\"AbuseIcon\"><a id=\"ctl00_cphRoblox_AbuseReportButton1_ReportAbuseIconHyperLink\" href=\"AbuseReport/AssetVersion.aspx?ID=17267342&amp;RedirectUrl=http%3a%2f%2fwww.roblox.com%2fItem.aspx%3fID%3d192800\"><img src=\"/images/abuse.png\" alt=\"Report Abuse\" border=\"0\"/></a></span>\n    <span class=\"AbuseButton\"><a id=\"ctl00_cphRoblox_AbuseReportButton1_ReportAbuseTextHyperLink\" href=\"AbuseReport/AssetVersion.aspx?ID=17267342&amp;RedirectUrl=http%3a%2f%2fwww.roblox.com%2fItem.aspx%3fID%3d192800\">Report Abuse</a></span>\n\n</div></div>\n			    </div>\n		        \n		                <div id=\"Thumbnail_Place\">\n				            <a id=\"ctl00_cphRoblox_AssetThumbnailImage_Place\" title=\"<?php echo htmlspecialchars($game[\'name\']); ?>\" style=\"display:inline-block;cursor:pointer;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t4-cf.roblox.com/f5daa00f35315d63c6f6f3fe4733e9ec\" border=\"0\" alt=\"<?php echo htmlspecialchars($game[\'name\']); ?>\"/></a>\n			            </div>\n			            <div id=\"Actions_Place\">\n			            </div>\n		                <div id=\"ctl00_cphRoblox_PlayGames\" class=\"PlayGames\">\n		                    <div style=\"text-align: center; margin: 1em 5px;\">\n                                <span id=\"ctl00_cphRoblox_PlaceAccessIndicator_FriendsOnlyLocked\" style=\"display: none\"><img id=\"ctl00_cphRoblox_PlaceAccessIndicator_iFriendsOnly_Locked\" src=\"/images/locked.png\" alt=\"Locked\" border=\"0\"/>&nbsp;Friends-only</span>\n<span id=\"ctl00_cphRoblox_PlaceAccessIndicator_FriendsOnlyUnlocked\" style=\"display: none\"><img id=\"ctl00_cphRoblox_PlaceAccessIndicator_iFriendsOnly_Unlocked\" src=\"/images/unlocked.png\" alt=\"Unlocked\" border=\"0\"/>&nbsp;Friends-only: You have access</span>\n<span id=\"ctl00_cphRoblox_PlaceAccessIndicator_Public\" style=\"display:inline;\"><img id=\"ctl00_cphRoblox_PlaceAccessIndicator_iPublic\" src=\"images/public.png\" alt=\"Public\" border=\"0\"/>&nbsp;Public</span>\n\n                                <img id=\"ctl00_cphRoblox_CopyLockedIcon\" src=\"/images/CopyLocked.png\" alt=\"CopyLocked\" border=\"0\"/>\n                                Copy Protection: CopyLocked\n                            </div>\n                            \n		                    \n\n		                    \n		                  \n<input type=\"hidden\" name=\"ctl00$cphRoblox$VisitButtons$rbxPlaceLauncher$HiddenField1\" id=\"ctl00_cphRoblox_VisitButtons_rbxPlaceLauncher_HiddenField1\"/>\n\n\n\n<div id=\"ctl00_cphRoblox_VisitButtons_ClientInstaller_Panel1\" class=\"modalPopup\" style=\"display: none\">\n	\n    <div style=\"padding: 0 0 1em 0\">\n        <h3>\n            Running Roblox</h3>\n        <p>\n            A window will open asking what you want to do with a file called \"Roblox.exe\".</p>\n        \n        <input type=\"submit\" name=\"ctl00$cphRoblox$VisitButtons$ClientInstaller$InstallAgainButton\" value=\"Install Again\" id=\"ctl00_cphRoblox_VisitButtons_ClientInstaller_InstallAgainButton\" class=\"Button\"/>\n        <input type=\"submit\" name=\"ctl00$cphRoblox$VisitButtons$ClientInstaller$CancelButton\" value=\"Cancel\" id=\"ctl00_cphRoblox_VisitButtons_ClientInstaller_CancelButton\" class=\"Button\"/>\n        <div id=\"ctl00_cphRoblox_VisitButtons_ClientInstaller_launcherDiv\"></div>\n    </div>\n\n</div>\n<input type=\"hidden\" name=\"ctl00$cphRoblox$VisitButtons$ClientInstaller$HiddenField1\" id=\"ctl00_cphRoblox_VisitButtons_ClientInstaller_HiddenField1\"/>\n\n\n\n\n\n<div id=\"ctl00_cphRoblox_VisitButtons_FancyButtons\">\n	\n    <div id=\"ctl00_cphRoblox_VisitButtons_VisitMPButton\" style=\"display: inline; width: 10px;\">\n        <input type=\"image\" name=\"ctl00$cphRoblox$VisitButtons$MultiplayerVisitButton\" id=\"ctl00_cphRoblox_VisitButtons_MultiplayerVisitButton\" class=\"ImageButton\" src=\"/images/Play.png\" alt=\"Visit Online\" onclick=\"JoinGame();\"/>\n    </div>\n    \n    \n    \n\n</div>\n\n\n\n<div id=\"ctl00_cphRoblox_VisitButtons_GuestModePrompt\" class=\"modalPopup\" style=\"display: none\">\n	\n    <div id=\"GuestDialog\" style=\"margin: 1.5em\">\n        <div style=\"text-align: center; margin-top: 1em\">\n            You are not currently logged in. What would you like to do?\n            <p>\n			    <input type=\"submit\" name=\"ctl00$cphRoblox$VisitButtons$PlayAsGuestMPButton\" value=\"Play as Guest\" onclick=\"$find(\'ctl00_cphRoblox_VisitButtons_ModalPopupExtender1\').hide(); return Roblox.Client.WaitForRoblox(function() { Roblox.Launch.RequestGame(\'ctl00_cphRoblox_VisitButtons_rbxPlaceLauncher_ModalPopupExtender1\', 192800) });\" id=\"ctl00_cphRoblox_VisitButtons_PlayAsGuestMPButton\" class=\"MediumButton\"/>\n			</p>\n			<p>\n			    <input type=\"submit\" name=\"ctl00$cphRoblox$VisitButtons$PlayAsGuestSoloButton\" value=\"Play as Guest\" onclick=\"$find(\'ctl00_cphRoblox_VisitButtons_ModalPopupExtender1\').hide(); return Roblox.Client.WaitForRoblox(function() { Roblox.Launch.StartGame(\'https://web.archive.org/web/20090116105250/http://www.roblox.com//Game/visit.ashx?PlaceID=192800\', \'visit.ashx\', \'https://web.archive.org/web/20090116105250/http://www.roblox.com//Login/Negotiate.ashx\', \'Guest:-3539917\') });\" id=\"ctl00_cphRoblox_VisitButtons_PlayAsGuestSoloButton\" class=\"MediumButton\"/>\n			</p>\n			<p>\n			    <input type=\"submit\" name=\"ctl00$cphRoblox$VisitButtons$CreateAccountButton\" value=\"Create an Account\" id=\"ctl00_cphRoblox_VisitButtons_CreateAccountButton\" class=\"MediumButton\"/>\n			</p>\n			<p>\n			    <input type=\"submit\" name=\"ctl00$cphRoblox$VisitButtons$LoginButton\" value=\"Log in\" id=\"ctl00_cphRoblox_VisitButtons_LoginButton\" class=\"MediumButton\"/>\n			</p>\n            <p>\n			    <input type=\"submit\" name=\"ctl00$cphRoblox$VisitButtons$CancelPlayButton\" value=\"Cancel\" id=\"ctl00_cphRoblox_VisitButtons_CancelPlayButton\" class=\"MediumButton\"/>\n			</p>\n        </div>\n    </div>\n\n</div>\n\n\n\n<input type=\"hidden\" name=\"ctl00$cphRoblox$VisitButtons$TheGrue\" id=\"ctl00_cphRoblox_VisitButtons_TheGrue\"/>\n\n\n\n		                </div>\n			    \n			    \n			    <div style=\"clear: both;\"></div>\n			</div>\n			<div style=\"margin: 10px; width: 703px;\">\n			    <div class=\"ajax__tab_xp\" id=\"ctl00_cphRoblox_TabbedInfo\">\n	<div id=\"ctl00_cphRoblox_TabbedInfo_header\">\n		<span id=\"__tab_ctl00_cphRoblox_TabbedInfo_GamesTab\">\n			                <h3>Games</h3>\n			            </span><span id=\"__tab_ctl00_cphRoblox_TabbedInfo_CommentaryTab\">\n			                <h3>Commentary</h3>\n			            </span>\n	</div><div id=\"ctl00_cphRoblox_TabbedInfo_body\">\n		<div id=\"ctl00_cphRoblox_TabbedInfo_GamesTab\">\n			\n			                <div id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesUpdatePanel\">\n				\n                                    \n                                    \n                                            <table>\n                                                \n                                            <tr>\n                                                \n                                            <td valign=\"top\" width=\"150px\">\n                                                <p>\n                                                    8 of 8 players max<br/>\n                                                    <br/>\n                                                    &nbsp;\n                                                    \n                                                </p>\n                                                <br/>\n                                            </td>\n                                            <td valign=\"top\">\n                                                \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl0_ctl00_PlayersRepeater_ctl00_PlayerImage1\" disabled=\"disabled\" title=\"TheSquirrel\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=910998\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t4-cf.roblox.com/e4fe6beb51aa7e168ef510b932bd265a\" border=\"0\" alt=\"TheSquirrel\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl0_ctl00_PlayersRepeater_ctl01_PlayerImage1\" disabled=\"disabled\" title=\"supahemo\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=326878\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t3-cf.roblox.com/4d4fc38efc0b5bf009816f343e269cfd\" border=\"0\" alt=\"supahemo\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl0_ctl00_PlayersRepeater_ctl02_PlayerImage1\" disabled=\"disabled\" title=\"Hamilah2\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1766818\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t5-cf.roblox.com/fc17c00152ae899782447525a38dff24\" border=\"0\" alt=\"Hamilah2\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl0_ctl00_PlayersRepeater_ctl03_PlayerImage1\" disabled=\"disabled\" title=\"normalman\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=746137\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t3-cf.roblox.com/2f926a49bf8746cccefaaf1cdff7df58\" border=\"0\" alt=\"normalman\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl0_ctl00_PlayersRepeater_ctl04_PlayerImage1\" disabled=\"disabled\" title=\"benjaminkentaSISTER\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1169424\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t2-cf.roblox.com/cb44b98870b51400307d6b6ea6c0dc24\" border=\"0\" alt=\"benjaminkentaSISTER\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl0_ctl00_PlayersRepeater_ctl05_PlayerImage1\" disabled=\"disabled\" title=\"xXx777\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=796276\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t7-cf.roblox.com/bf608c4ec94d7eec4ffc06b639cb170f\" border=\"0\" alt=\"xXx777\"/></a>\n                                                        \n                                                        \n                                                    \n                                                <br/>\n                                            </td>\n                                        \n                                            </tr>\n                                        \n                                            <tr>\n                                                \n                                            <td valign=\"top\" width=\"150px\">\n                                                <p>\n                                                    8 of 8 players max<br/>\n                                                    <br/>\n                                                    &nbsp;\n                                                    \n                                                </p>\n                                                <br/>\n                                            </td>\n                                            <td valign=\"top\">\n                                                \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl1_ctl00_PlayersRepeater_ctl00_PlayerImage1\" disabled=\"disabled\" title=\"mlgchiefgunner\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1745138\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t5-cf.roblox.com/da3fb48285b9175aa2d842068cca21af\" border=\"0\" alt=\"mlgchiefgunner\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl1_ctl00_PlayersRepeater_ctl01_PlayerImage1\" disabled=\"disabled\" title=\"Sadaw\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1012863\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t0-cf.roblox.com/328b9139b3ac5c1510ddd1d2d7401982\" border=\"0\" alt=\"Sadaw\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl1_ctl00_PlayersRepeater_ctl02_PlayerImage2\" disabled=\"disabled\" title=\"A friendly guest\" onclick=\"return false\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t5-cf.roblox.com/e53a04e20be191af1a831269ebaf66fc\" border=\"0\" alt=\"A friendly guest\"/></a>\n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl1_ctl00_PlayersRepeater_ctl03_PlayerImage1\" disabled=\"disabled\" title=\"NoobKillerz\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=810457\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t5-cf.roblox.com/b2faa1a2faf3157d61ebcacd9f0a99a9\" border=\"0\" alt=\"NoobKillerz\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl1_ctl00_PlayersRepeater_ctl04_PlayerImage1\" disabled=\"disabled\" title=\"xorcx4\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1796149\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t7-cf.roblox.com/3ab26364418ea566e56f103d77338935\" border=\"0\" alt=\"xorcx4\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl1_ctl00_PlayersRepeater_ctl05_PlayerImage1\" disabled=\"disabled\" title=\"Johanna1010\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1896242\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t6-cf.roblox.com/5c2afd9cb81be07cb4a855f7f74c5d4a\" border=\"0\" alt=\"Johanna1010\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl1_ctl00_PlayersRepeater_ctl06_PlayerImage2\" disabled=\"disabled\" title=\"A friendly guest\" onclick=\"return false\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t5-cf.roblox.com/e53a04e20be191af1a831269ebaf66fc\" border=\"0\" alt=\"A friendly guest\"/></a>\n                                                        \n                                                    \n                                                <br/>\n                                            </td>\n                                        \n                                            </tr>\n                                        \n                                            <tr>\n                                                \n                                            <td valign=\"top\" width=\"150px\">\n                                                <p>\n                                                    7 of 8 players max<br/>\n                                                    <br/>\n                                                    &nbsp;\n                                                    \n                                                </p>\n                                                <br/>\n                                            </td>\n                                            <td valign=\"top\">\n                                                \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl2_ctl00_PlayersRepeater_ctl00_PlayerImage1\" disabled=\"disabled\" title=\"mrking808\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=549891\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t5-cf.roblox.com/4eac57f64bb7ca5919d744ee29cab52a\" border=\"0\" alt=\"mrking808\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl2_ctl00_PlayersRepeater_ctl01_PlayerImage1\" disabled=\"disabled\" title=\"Sapphiresin\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=126296\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t4-cf.roblox.com/b0c6d5ab33625e8ae80495760cd71413\" border=\"0\" alt=\"Sapphiresin\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl2_ctl00_PlayersRepeater_ctl02_PlayerImage1\" disabled=\"disabled\" title=\"malamute11\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1086502\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t3-cf.roblox.com/c3b1ecbe0b7b269e5a918362731c2521\" border=\"0\" alt=\"malamute11\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl2_ctl00_PlayersRepeater_ctl03_PlayerImage1\" disabled=\"disabled\" title=\"gtpower3\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1204120\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t6-cf.roblox.com/ee2967b1f7e71c2e82fd80d554278ea7\" border=\"0\" alt=\"gtpower3\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl2_ctl00_PlayersRepeater_ctl04_PlayerImage1\" disabled=\"disabled\" title=\"cayrax1\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1995426\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t6-cf.roblox.com/7139e4cd0c9f7eec763eea5f72b81e19\" border=\"0\" alt=\"cayrax1\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl2_ctl00_PlayersRepeater_ctl05_PlayerImage1\" disabled=\"disabled\" title=\"matidk\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1995217\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t6-cf.roblox.com/0895346fdc1bee7777c14b4bb0ccd86d\" border=\"0\" alt=\"matidk\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl2_ctl00_PlayersRepeater_ctl06_PlayerImage1\" disabled=\"disabled\" title=\"SAMsamSAM1\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1303774\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t6-cf.roblox.com/8326db935261d356d6b361d2f970da98\" border=\"0\" alt=\"SAMsamSAM1\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl2_ctl00_PlayersRepeater_ctl07_PlayerImage1\" disabled=\"disabled\" title=\"SwagMan\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=428843\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t0-cf.roblox.com/17ba147aa4ffaee5d34d43c936d9676e\" border=\"0\" alt=\"SwagMan\"/></a>\n                                                        \n                                                        \n                                                    \n                                                <br/>\n                                            </td>\n                                        \n                                            </tr>\n                                        \n                                            <tr>\n                                                \n                                            <td valign=\"top\" width=\"150px\">\n                                                <p>\n                                                    4 of 8 players max<br/>\n                                                    <br/>\n                                                    &nbsp;\n                                                    \n                                                </p>\n                                                <br/>\n                                            </td>\n                                            <td valign=\"top\">\n                                                \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl3_ctl00_PlayersRepeater_ctl00_PlayerImage1\" disabled=\"disabled\" title=\"ROBLOX5669\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1892055\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t0-cf.roblox.com/db4c5463fd91c15e47d2f6fbf94fc702\" border=\"0\" alt=\"ROBLOX5669\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl3_ctl00_PlayersRepeater_ctl01_PlayerImage1\" disabled=\"disabled\" title=\"toonlink1000\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=723866\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t3-cf.roblox.com/1ff48601fa46ebc84670086a04e9645b\" border=\"0\" alt=\"toonlink1000\"/></a>\n                                                        \n                                                        \n                                                    \n                                                        <a id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesListView_ctrl3_ctl00_PlayersRepeater_ctl02_PlayerImage1\" disabled=\"disabled\" title=\"darkercic\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1893367\" style=\"display:inline-block;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t5-cf.roblox.com/f9a992b440c4a4e1ab447c45152e6bb9\" border=\"0\" alt=\"darkercic\"/></a>\n                                                        \n                                                        \n                                                    \n                                                <br/>\n                                            </td>\n                                        \n                                            </tr>\n                                        \n                                            </table>\n                                        \n                                    <div class=\"FooterPager\" style=\"text-align: center;\">\n                                        <span id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesDataPager_Footer\"><a disabled=\"disabled\">First</a>&nbsp;<a disabled=\"disabled\">Previous</a>&nbsp;<span>1</span>&nbsp;<a disabled=\"disabled\">Next</a>&nbsp;<a disabled=\"disabled\">Last</a>&nbsp;</span>\n                                    </div>\n                                    <div class=\"RefreshRunningGames\">\n                                        <input type=\"submit\" name=\"ctl00$cphRoblox$TabbedInfo$GamesTab$RefreshRunningGamesButton\" value=\"Refresh\" id=\"ctl00_cphRoblox_TabbedInfo_GamesTab_RefreshRunningGamesButton\" class=\"Button\"/>\n                                    </div>\n                                \n			</div>\n                        \n		</div><div id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab\" style=\"display:none;\">\n			\n			                <div id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsUpdatePanel\">\n				\n        <div class=\"CommentsContainer\">\n            \n                    <h3>Comments (3526)</h3>\n                    <div id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl00_HeaderPagerPanel\" class=\"HeaderPager\">\n			            \n			            <span id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl00_HeaderPagerLabel\">Page 1 of 353</span>\n			            <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl00_HeaderPageSelector_Next\" href=\"javascript:__doPostBack(\'ctl00$cphRoblox$TabbedInfo$CommentaryTab$CommentsPane$CommentsRepeater$ctl00$HeaderPageSelector_Next\',\'\')\">Next <span class=\"NavigationIndicators\">&gt;&gt;</span></a>\n		            </div>\n		            <div class=\"Comments\">\n                \n                    <div class=\"Comment\">\n                        <div class=\"Commenter\">\n                            <div class=\"Avatar\">\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl01_AvatarImage\" title=\"Kluskas\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=824497\" style=\"display:inline-block;cursor:pointer;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t1-cf.roblox.com/15d99157a2449d7e43dcb8fb40f1bfa9\" border=\"0\" alt=\"Kluskas\" blankurl=\"http://t6-cf.roblox.com/blank-100x100.gif\"/></a></div>\n                        </div>\n                        <div class=\"Post\">\n                            <div class=\"Audit\">\n                                Posted\n                                35 minutes ago\n                                by\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl01_UsernameHyperLink\" href=\"User.aspx?ID=824497\">Kluskas</a>\n                            </div>\n                            <div class=\"Content\">better make anti-guest script.</div>\n                            \n                        </div>\n                        <div style=\"clear: both;\"></div>\n                    </div>\n                \n                    <div class=\"AlternateComment\">\n                        <div class=\"Commenter\">\n                            <div class=\"Avatar\">\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl02_AvatarImage\" title=\"Hamilah2\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1766818\" style=\"display:inline-block;cursor:pointer;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t1-cf.roblox.com/4f0e8ba55996151f45ffd6d93e464f70\" border=\"0\" alt=\"Hamilah2\" blankurl=\"http://t6-cf.roblox.com/blank-100x100.gif\"/></a></div>\n                        </div>\n                        <div class=\"Post\">\n                            <div class=\"Audit\">\n                                Posted\n                                47 minutes ago\n                                by\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl02_UsernameHyperLink\" href=\"User.aspx?ID=1766818\">Hamilah2</a>\n                            </div>\n                            <div class=\"Content\">How do you own a house? Just wondering, I\'ve never tried it.</div>\n                            \n                        </div>\n                        <div style=\"clear: both;\"></div>\n                    </div>\n                \n                    <div class=\"Comment\">\n                        <div class=\"Commenter\">\n                            <div class=\"Avatar\">\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl03_AvatarImage\" title=\"minilynny\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1217536\" style=\"display:inline-block;cursor:pointer;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t0-cf.roblox.com/d3bda2b20a7816bba0cab4760a35adb0\" border=\"0\" alt=\"minilynny\" blankurl=\"http://t6-cf.roblox.com/blank-100x100.gif\"/></a></div>\n                        </div>\n                        <div class=\"Post\">\n                            <div class=\"Audit\">\n                                Posted\n                                3 hours ago\n                                by\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl03_UsernameHyperLink\" href=\"User.aspx?ID=1217536\">minilynny</a>\n                            </div>\n                            <div class=\"Content\">the cook tool not working but its still good plz fix\n<br/></div>\n                            \n                        </div>\n                        <div style=\"clear: both;\"></div>\n                    </div>\n                \n                    <div class=\"AlternateComment\">\n                        <div class=\"Commenter\">\n                            <div class=\"Avatar\">\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl04_AvatarImage\" title=\"cheesepuff2\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1361940\" style=\"display:inline-block;cursor:pointer;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t1-cf.roblox.com/f280eff57b3135548aa73bd8e5e5c8d7\" border=\"0\" alt=\"cheesepuff2\" blankurl=\"http://t6-cf.roblox.com/blank-100x100.gif\"/></a></div>\n                        </div>\n                        <div class=\"Post\">\n                            <div class=\"Audit\">\n                                Posted\n                                3 hours ago\n                                by\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl04_UsernameHyperLink\" href=\"User.aspx?ID=1361940\">cheesepuff2</a>\n                            </div>\n                            <div class=\"Content\">AWSOME</div>\n                            \n                        </div>\n                        <div style=\"clear: both;\"></div>\n                    </div>\n                \n                    <div class=\"Comment\">\n                        <div class=\"Commenter\">\n                            <div class=\"Avatar\">\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl05_AvatarImage\" title=\"rezzone\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1541214\" style=\"display:inline-block;cursor:pointer;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t4-cf.roblox.com/53b6b82ec125f011dd3b00f4e353d01a\" border=\"0\" alt=\"rezzone\" blankurl=\"http://t6-cf.roblox.com/blank-100x100.gif\"/></a></div>\n                        </div>\n                        <div class=\"Post\">\n                            <div class=\"Audit\">\n                                Posted\n                                3 hours ago\n                                by\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl05_UsernameHyperLink\" href=\"User.aspx?ID=1541214\">rezzone</a>\n                            </div>\n                            <div class=\"Content\"> calzzone</div>\n                            \n                        </div>\n                        <div style=\"clear: both;\"></div>\n                    </div>\n                \n                    <div class=\"AlternateComment\">\n                        <div class=\"Commenter\">\n                            <div class=\"Avatar\">\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl06_AvatarImage\" title=\"04christian\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1195352\" style=\"display:inline-block;cursor:pointer;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t3-cf.roblox.com/b3cba92596cf3d5c0237f2b53e4e271f\" border=\"0\" alt=\"04christian\" blankurl=\"http://t6-cf.roblox.com/blank-100x100.gif\"/></a></div>\n                        </div>\n                        <div class=\"Post\">\n                            <div class=\"Audit\">\n                                Posted\n                                3 hours ago\n                                by\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl06_UsernameHyperLink\" href=\"User.aspx?ID=1195352\">04christian</a>\n                            </div>\n                            <div class=\"Content\">this game rules</div>\n                            \n                        </div>\n                        <div style=\"clear: both;\"></div>\n                    </div>\n                \n                    <div class=\"Comment\">\n                        <div class=\"Commenter\">\n                            <div class=\"Avatar\">\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl07_AvatarImage\" title=\"dogloverboy\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=1332089\" style=\"display:inline-block;cursor:pointer;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t4-cf.roblox.com/66b48244c82a116ea6a13a87e54744c6\" border=\"0\" alt=\"dogloverboy\" blankurl=\"http://t6-cf.roblox.com/blank-100x100.gif\"/></a></div>\n                        </div>\n                        <div class=\"Post\">\n                            <div class=\"Audit\">\n                                Posted\n                                4 hours ago\n                                by\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl07_UsernameHyperLink\" href=\"User.aspx?ID=1332089\">dogloverboy</a>\n                            </div>\n                            <div class=\"Content\">how do u script please message me on how u script please and thank you</div>\n                            \n                        </div>\n                        <div style=\"clear: both;\"></div>\n                    </div>\n                \n                    <div class=\"AlternateComment\">\n                        <div class=\"Commenter\">\n                            <div class=\"Avatar\">\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl08_AvatarImage\" title=\"legeyer\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=864069\" style=\"display:inline-block;cursor:pointer;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t6-cf.roblox.com/3ffd8f57f0dc6bf96a9c3925589143c1\" border=\"0\" alt=\"legeyer\" blankurl=\"http://t6-cf.roblox.com/blank-100x100.gif\"/></a></div>\n                        </div>\n                        <div class=\"Post\">\n                            <div class=\"Audit\">\n                                Posted\n                                4 hours ago\n                                by\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl08_UsernameHyperLink\" href=\"User.aspx?ID=864069\">legeyer</a>\n                            </div>\n                            <div class=\"Content\">this game sucks boo -_- make something more fun like a tycoon not like this this is way beyoned tycoons</div>\n                            \n                        </div>\n                        <div style=\"clear: both;\"></div>\n                    </div>\n                \n                    <div class=\"Comment\">\n                        <div class=\"Commenter\">\n                            <div class=\"Avatar\">\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl09_AvatarImage\" title=\"Bzimmer00010\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=545527\" style=\"display:inline-block;cursor:pointer;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t2-cf.roblox.com/b0a43a7e643b9b2f994ebeb167188f8e\" border=\"0\" alt=\"Bzimmer00010\" blankurl=\"http://t6-cf.roblox.com/blank-100x100.gif\"/></a></div>\n                        </div>\n                        <div class=\"Post\">\n                            <div class=\"Audit\">\n                                Posted\n                                5 hours ago\n                                by\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl09_UsernameHyperLink\" href=\"User.aspx?ID=545527\">Bzimmer00010</a>\n                            </div>\n                            <div class=\"Content\">hey everybody go to my rotris everything works nothing does not work i swear!!</div>\n                            \n                        </div>\n                        <div style=\"clear: both;\"></div>\n                    </div>\n                \n                    <div class=\"AlternateComment\">\n                        <div class=\"Commenter\">\n                            <div class=\"Avatar\">\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl10_AvatarImage\" title=\"husky2017\" href=\"/web/20090116105250/http://www.roblox.com/User.aspx?ID=417805\" style=\"display:inline-block;cursor:pointer;\"><img src=\"https://web.archive.org/web/20090116105250im_/http://t4-cf.roblox.com/3fd8bf93a4f1c0219af1a37268e4bf9d\" border=\"0\" alt=\"husky2017\" blankurl=\"http://t6-cf.roblox.com/blank-100x100.gif\"/></a></div>\n                        </div>\n                        <div class=\"Post\">\n                            <div class=\"Audit\">\n                                Posted\n                                5 hours ago\n                                by\n                                <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl10_UsernameHyperLink\" href=\"User.aspx?ID=417805\">husky2017</a>\n                            </div>\n                            <div class=\"Content\">OMg me 2 paul</div>\n                            \n                        </div>\n                        <div style=\"clear: both;\"></div>\n                    </div>\n                \n                    </div>\n                    <div id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl11_FooterPagerPanel\" class=\"FooterPager\">\n			            \n			            <span id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl11_FooterPagerLabel\">Page 1 of 353</span>\n			            <a id=\"ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsRepeater_ctl11_FooterPageSelector_Next\" href=\"javascript:__doPostBack(\'ctl00$cphRoblox$TabbedInfo$CommentaryTab$CommentsPane$CommentsRepeater$ctl11$FooterPageSelector_Next\',\'\')\">Next <span class=\"NavigationIndicators\">&gt;&gt;</span></a>\n		            </div>\n                \n            \n            \n        </div>\n    \n			</div>\n\n			                \n			            \n		</div>\n	</div>\n</div>\n            </div>\n		</div>\n		\n	    <div style=\"clear: both;\"/>\n	</div>\n	\n	<div id=\"ctl00_cphRoblox_ItemPurchasePopupPanel\" class=\"modalPopup\" style=\"display: none\">\n	\n		<div id=\"ctl00_cphRoblox_ItemPurchasePopupUpdatePanel\">\n		\n				\n			\n	</div>\n	\n</div>\n	\n	<input type=\"hidden\" name=\"ctl00$cphRoblox$HiddenField1\" id=\"ctl00_cphRoblox_HiddenField1\"/>\n	<input type=\"hidden\" name=\"ctl00$cphRoblox$HiddenField2\" id=\"ctl00_cphRoblox_HiddenField2\"/>\n	<input type=\"hidden\" name=\"ctl00$cphRoblox$HiddenField3\" id=\"ctl00_cphRoblox_HiddenField3\"/>\n	\n\n        </div>\n\n<?php  \nrequire_once (\"config/footer.php\"); \n?>');
INSERT INTO `tmp_file` (`id`, `content`) VALUES
(6, '<?php\nrequire_once \"../config/includes.php\";\nrequire_once \"../Assemblies/Roblox/Grid/Rcc/RCCServiceSoap.php\";\n\n$id = filter_input(INPUT_GET, \'ID\', FILTER_VALIDATE_INT) \n    ?? filter_input(INPUT_GET, \'id\', FILTER_VALIDATE_INT) \n    ?? ($_USER[\'id\'] ?? 1);\n\ntry {\n    $sql = $db->prepare(\"SELECT * FROM users WHERE id = :id\");\n    $sql->bindParam(\':id\', $id, PDO::PARAM_INT);\n    $sql->execute();\n    $user = $sql->fetch();\n\n    if (!$user) {\n        header(\"Location: /\");\n        exit;\n    }\n\n    $avatarFilePath = $_SERVER[\'DOCUMENT_ROOT\'] . \"/Thumbs/\" . $id . \".png\";\n    $RCCServiceSoap = new RCCServiceSoap();\n\n    // Face\n    if ($user[\'face\']) {\n        $gladys = $db->prepare(\"SELECT * FROM items WHERE id = :id AND `type` = \'face\'\");\n        $gladys->execute([\":id\" => $user[\'face\']]);\n        $face = $gladys->fetch();\n        $faceGraph = $face ? $face[\'asset\'] : \"rbxasset://textures/face.png\";\n    } else {\n       \n        $face = \'\"rbxasset://textures/face.png\"\';\n\n    }\n\n    // Shirt\n    if ($user[\'shirt\']) {\n        $gladys2 = $db->prepare(\"SELECT * FROM items WHERE id = :id AND `type` = \'shirt\'\");\n        $gladys2->execute([\":id\" => $user[\'shirt\']]);\n        $shirt = $gladys2->fetch();\n        $shirtGraph = $shirt ? htmlspecialchars($shirt[\'asset\']) : \"\";\n    } else {\n        $shirtGraph = \"\";\n    }\n\n    // Pants\n    if ($user[\'pant\']) {\n        $gladys3 = $db->prepare(\"SELECT * FROM items WHERE id = :id AND `type` = \'pant\'\");\n        $gladys3->execute([\":id\" => $user[\'pant\']]);\n        $pant = $gladys3->fetch();\n        $pantGraph = $pant ? htmlspecialchars($pant[\'asset\']) : \"\";\n    } else {\n        $pantGraph = \"\";\n    }\n\n    // T-Shirt\n    if ($user[\'tshirt\']) {\n        $gladys4 = $db->prepare(\"SELECT * FROM items WHERE id = :id AND `type` = \'tshirt\'\");\n        $gladys4->execute([\":id\" => $user[\'tshirt\']]);\n        $tshirtt = $gladys4->fetch();\n        $tshirtGraph = $tshirtt ? htmlspecialchars($tshirtt[\'asset\']) : \"\";\n    } else {\n        $tshirtGraph = \"\";\n    }\n\n    $headColor = \'\"\' . $user[\'HeadColor\'] . \'\"\';\n    $leftArmColor = \'\"\' . $user[\'LeftArmColor\'] . \'\"\';\n    $rightArmColor = \'\"\' . $user[\'RightArmColor\'] . \'\"\';\n    $leftLegColor = \'\"\' . $user[\'LeftLegColor\'] . \'\"\';\n    $rightLegColor = \'\"\' . $user[\'RightLegColor\'] . \'\"\';\n    $torsoColor = \'\"\' . $user[\'TorsoColor\'] . \'\"\';\n    $face = \'\"\' . $faceGraph . \'\"\';\n    $shirt = \'\"\' . $shirtGraph . \'\"\';\n    $pants = \'\"\' . $pantGraph . \'\"\';\n    $tShirt = \'\"\' . $tshirtGraph . \'\"\';\n\n    $hat1 = $user[\'hat1\'];\n    $hat2 = $user[\'hat2\'];\n    $hat3 = $user[\'hat3\'];\n    $hat1scr = $hat2scr = $hat3scr = \"\";\n\n    if ($hat1 != 0) {\n        $hat1sql = $db->prepare(\"SELECT asset FROM items WHERE id = :id AND `type` = \'hat\'\");\n        $hat1sql->execute([\"id\" => $hat1]);\n        $hat1aid = $hat1sql->fetch();\n        if ($hat1aid && isset($hat1aid[\'asset\'])) {\n            $hat1asset = $hat1aid[\'asset\'];\n            $hat1scr = \"\nlocal Hat1 = game:GetObjects(\'\" . $hat1asset . \"\')[1]\nHat1.Parent = game.Players.LocalPlayer.Character\n\";\n        }\n    }\n\n    if ($hat2 != 0) {\n        $hat2sql = $db->prepare(\"SELECT asset FROM items WHERE id = :id AND `type` = \'hat\'\");\n        $hat2sql->execute([\"id\" => $hat2]);\n        $hat2aid = $hat2sql->fetch();\n        if ($hat2aid && isset($hat2aid[\'asset\'])) {\n            $hat2asset = $hat2aid[\'asset\'];\n            $hat2scr = \"\nlocal Hat2 = game:GetObjects(\'\" . $hat2asset . \"\')[1]\nHat2.Parent = game.Players.LocalPlayer.Character\n\";\n        }\n    }\n\n    if ($hat3 != 0) {\n        $hat3sql = $db->prepare(\"SELECT asset FROM items WHERE id = :id AND `type` = \'hat\'\");\n        $hat3sql->execute([\"id\" => $hat3]);\n        $hat3aid = $hat3sql->fetch();\n        if ($hat3aid && isset($hat3aid[\'asset\'])) {\n            $hat3asset = $hat3aid[\'asset\'];\n            $hat3scr = \"\nlocal Hat3 = game:GetObjects(\'\" . $hat3asset . \"\')[1]\nHat3.Parent = game.Players.LocalPlayer.Character\n\";\n        }\n    }\n\n    $thumbnailScript = <<<LUA\nplayer = game:GetService(\"Players\"):CreateLocalPlayer(0)\nplayer:LoadCharacter(0)\n\nlocal char = player.Character or player.CharacterAdded:Wait()\nlocal head = char.Head\n\nif head then\n    local face = head.face\n    if not face then\n        face = Instance.new(\"Decal\")\n        face.Name = \"face\"\n        face.Parent = head\n    end\n    face.Texture = $face\nend\n\nshirt = Instance.new(\"Shirt\", player.Character)\nshirt.ShirtTemplate = $shirt\n\ntShirt = Instance.new(\"ShirtGraphic\", player.Character)\ntShirt.Graphic = $tShirt\n\npants = Instance.new(\"Pants\", player.Character)\npants.PantsTemplate = $pants\n\nbodyColors = Instance.new(\"BodyColors\", player.Character)\nbodyColors.HeadColor = BrickColor.new($headColor)\nbodyColors.LeftArmColor = BrickColor.new($leftArmColor)\nbodyColors.RightArmColor = BrickColor.new($rightArmColor)\nbodyColors.LeftLegColor = BrickColor.new($leftLegColor)\nbodyColors.RightLegColor = BrickColor.new($rightLegColor)\nbodyColors.TorsoColor = BrickColor.new($torsoColor)\n\n$hat1scr\n$hat2scr\n$hat3scr\n\nreturn game:GetService(\"ThumbnailGenerator\"):Click(\"PNG\", 400, 400, true)\nLUA;\n\n    $render = $RCCServiceSoap->execScript($thumbnailScript, rand(1, getrandmax()), 120);\n    $fallbackUrl = $_SERVER[\'DOCUMENT_ROOT\'] . \'/images/noob2stips.png\';\n\n    if (empty($render)) {\n        $render = file_get_contents($fallbackUrl);\n        $render = base64_encode($render);\n    }\n\n    file_put_contents($avatarFilePath, base64_decode($render));\n\n    header(\"Location: /My/Character.aspx\");\n    exit;\n\n} catch (PDOException $e) {\n    error_log(\"Database Error: \" . $e->getMessage());\n    header(\"Location: /My/Character.aspx\");\n    exit;\n} catch (Exception $e) {\n    error_log(\"General Error: \" . $e->getMessage());\n    header(\"Location: /My/Character.aspx\");\n    exit;\n}\n?>');



CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `description` longtext NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `passwd` varchar(191) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  `robux` int(11) NOT NULL,
  `tix` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `BC` int(11) NOT NULL DEFAULT 0,
  `bcdate` date DEFAULT NULL,
  `HeadColor` int(11) NOT NULL DEFAULT 0,
  `TorsoColor` int(11) NOT NULL DEFAULT 0,
  `LeftLegColor` int(11) NOT NULL DEFAULT 0,
  `RightArmColor` int(11) NOT NULL DEFAULT 0,
  `LeftArmColor` int(11) NOT NULL DEFAULT 0,
  `RightLegColor` int(11) NOT NULL DEFAULT 0,
  `face` bigint(20) NOT NULL DEFAULT 0,
  `pant` int(11) NOT NULL DEFAULT 0,
  `shirt` int(11) NOT NULL DEFAULT 0,
  `hat1` bigint(20) NOT NULL DEFAULT 0,
  `hat2` bigint(20) NOT NULL DEFAULT 0,
  `hat3` bigint(20) NOT NULL DEFAULT 0,
  `tshirt` bigint(20) NOT NULL DEFAULT 0,
  `authentication` varchar(1337) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO `users` (`id`, `name`, `passwd`, `admin`, `banned`, `robux`, `tix`, `description`, `BC`, `bcdate`, `HeadColor`, `TorsoColor`, `LeftLegColor`, `RightArmColor`, `LeftArmColor`, `RightLegColor`, `face`, `pant`, `shirt`, `hat1`, `hat2`, `hat3`, `tshirt`, `authentication`) VALUES
(1, 'Caldren', '', 1, 0, 100, 115, NULL, 0, '2000-02-26', 106, 45, 45, 12, 12, 45, 0, 0, 0, 0, 0, 0, 0, 'hwd48s7p2zzobox2vdvsr8brmzqcihbj2isl'),
(17, 'Yousuf', '$2y$10$J88ExgITxV/t2CVtszLGU.GPgdmc8zfpZ3aso/IPzGBCUeTijNDG6', 0, 0, 0, 0, NULL, 0, '2000-02-26', 1, 26, 26, 1, 1, 26, 0, 0, 0, 0, 0, 0, 9, 'opm4h4zj9kd8fs9rov94hwhaejyeu3ffkayy'),
(18, 'Account', '$2y$10$QI1mJKFNYb6xxmLKbkfnTubrALtyxpjxJn8ItqxWDX3EQ9P30otGe', 0, 0, 0, 0, NULL, 0, '2000-02-26', 0, 24, 102, 226, 226, 102, 0, 0, 0, 0, 0, 0, 9, ''),
(20, 'Roblox', '$2y$10$DQDmXzLbeWg2oo9NzcPZZOhU08jCfB1Qtq.guJ/V9MzzkjHGO/f9a', 0, 0, 0, 0, NULL, 0, '2000-02-26', 24, 102, 28, 24, 24, 28, 0, 0, 0, 0, 0, 0, 9, '0lln5vql9smwop00lzo71u7hw09wl9jf38s5'),
(21, 'god', '$2y$10$D.JMXphu8lnUtGQr9x.NSeM6CN7IlOmbMxfZMg0BwbwN1IS.oEkmm', 0, 0, 0, 0, NULL, 0, '2000-02-26', 226, 102, 102, 226, 24, 9, 0, 0, 0, 0, 0, 0, 9, ''),
(22, 'Rag', '$2y$10$sw/YU49wxvtw5R6XkOhBY.R.1DRZob6OnFQDNrqyCjQzyA1J2cHkW', 0, 0, 0, 0, NULL, 0, '2000-02-26', 226, 102, 102, 226, 24, 9, 0, 0, 0, 0, 0, 0, 9, 'ygh5mz46f4tby1jk3s4g18gim256wyupzd86'),
(23, 'Safe', '$2y$10$O2rfzPonoaaKzMBhaIGWauI63IdceEscrHT7N6K7lJSVRzBmI0YdS', 0, 0, 0, 0, NULL, 0, '2000-02-26', 226, 102, 102, 226, 24, 9, 0, 0, 0, 0, 0, 0, 9, ''),
(24, 'stupid', '$2y$10$dB7gc.C0W70aiqlVaGZBKu1TLpbbOs6G1WD2jZ8IcV8PYW0M.FlvG', 1, 0, 0, 0, NULL, 0, '2000-02-26', 226, 102, 102, 226, 24, 9, 0, 0, 0, 0, 0, 0, 9, '4r96m7n9rbof1r14a54dx6t8m7csko0wduoo'),
(25, 'test3', '$2y$10$GvIzHs2UzKjzMsnQW1DgP.6yoaXA1JRxpWK1IyAwx.B0xc9tfpPq2', 1, 0, 0, 0, NULL, 0, '2000-02-26', 24, 106, 37, 24, 24, 37, 0, 0, 0, 0, 0, 0, 9, 'cfhl4i173a7nomvqiljp34qn9elkn2imfuma'),
(26, 'defaultuser0', '$2y$10$LvfdGgu9w.ABawjKn0Xlruw.1b9QqnC30GHxMXsVOdg77sDAOOeJG', 1, 0, 0, 0, NULL, 0, '2000-02-26', 42, 102, 102, 226, 24, 9, 0, 0, 0, 0, 0, 0, 9, ''),
(27, 'muser', '$2y$10$zt6eyjVolBjnYrxhqHl94OkROjeRt01gH01WF1PkaZueeoyxYabqq', 1, 0, 2147483647, 2147483647, 'подарочек от гастера', 0, '2000-02-26', 226, 102, 102, 226, 24, 9, 0, 0, 0, 0, 0, 0, 9, ''),
(28, 'bobos', '$2y$10$R8FyABPN95BzpmoA/AipvOW8Wh0f9wXma/wGGEh3t1niffIt4E4Hy', 1, 1, 0, 0, NULL, 0, '2000-02-26', 1, 102, 102, 226, 24, 9, 0, 0, 0, 0, 0, 0, 9, 'hwm4h589mjx343hemw9dfwxl6gpic9rb4pb1'),
(29, 'BookVor', '$2y$10$WSspD2iOh7JAL.9zM9v0m.hcVF.RikJ1zt7NT8HoINUkhgIr/2EIy', 1, 0, 0, 0, NULL, 0, '2000-02-26', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 9, ''),
(30, 'T1mmy_Playz2009', '$2y$10$qEA85SZQZiE23HU/AKexqeHL3Mt.eDMIyP4mz0HHMnep0mppdFJ3m', 1, 0, 0, 0, NULL, 0, '2000-02-26', 24, 21, 23, 24, 24, 23, 0, 0, 0, 0, 0, 0, 9, '');


ALTER TABLE `admin_assets`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `forum`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `forumgroups`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_friendship` (`user_id`,`friend_id`),
  ADD KEY `user_index` (`user_id`),
  ADD KEY `friend_index` (`friend_id`);

ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_friend_request` (`sender_id`,`receiver_id`),
  ADD KEY `sender_index` (`sender_id`),
  ADD KEY `receiver_index` (`receiver_id`);

ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_groups_owner_id` (`owner_id`);

ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_group_user` (`group_id`,`user_id`);

ALTER TABLE `group_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_group_request` (`group_id`,`user_id`),
  ADD KEY `idx_group_requests_group` (`group_id`),
  ADD KEY `idx_group_requests_user` (`user_id`);

ALTER TABLE `group_wall_posts`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `homepage_facts`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_owned_asset` (`user_id`,`asset_id`,`asset_source`);

ALTER TABLE `invite_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creatorid` (`creatorid`);

ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `owned_items`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_places_user_id` (`user_id`);

ALTER TABLE `profileviews`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tmp_file`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `admin_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `friend_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `group_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

ALTER TABLE `group_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `group_wall_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `homepage_facts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `invite_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

ALTER TABLE `owned_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

ALTER TABLE `places`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `tmp_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;


ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`creatorid`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
