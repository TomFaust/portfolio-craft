-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 09 dec 2024 om 22:47
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfolio`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assetindexingsessions`
--

CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT 0,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `processIfRootEmpty` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `assets`
--

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES
(22, 1, 4, 1, 'help_book_cool-4.png', 'image', NULL, 48, 48, 591, NULL, NULL, NULL, '2024-12-08 15:18:19', '2024-12-08 15:18:19', '2024-12-08 15:18:19'),
(23, 1, 4, 1, 'contact.png', 'image', NULL, 32, 32, 493, NULL, NULL, NULL, '2024-12-08 15:18:48', '2024-12-08 15:18:48', '2024-12-08 15:18:48'),
(24, 1, 4, 1, 'cv.png', 'image', NULL, 35, 35, 1219, NULL, NULL, NULL, '2024-12-08 15:18:49', '2024-12-08 15:18:49', '2024-12-08 15:18:49'),
(25, 1, 4, 1, 'i_wont_forget_hue.png', 'image', NULL, 597, 597, 11685, NULL, NULL, NULL, '2024-12-08 15:18:51', '2024-12-08 15:18:51', '2024-12-08 15:18:51'),
(26, 1, 4, 1, 'ohbees.png', 'image', NULL, 480, 480, 20780, NULL, NULL, NULL, '2024-12-08 15:18:51', '2024-12-08 15:18:51', '2024-12-08 15:18:51'),
(27, 1, 4, 1, 'past_work.png', 'image', NULL, 35, 35, 1387, NULL, NULL, NULL, '2024-12-08 15:18:52', '2024-12-08 15:18:52', '2024-12-08 15:18:52'),
(28, 1, 4, 1, 'social_media.png', 'image', NULL, 48, 48, 1555, NULL, NULL, NULL, '2024-12-08 15:18:54', '2024-12-08 15:18:54', '2024-12-08 15:18:54'),
(47, 1, 4, 1, 'windows-0.png', 'image', NULL, 32, 32, 475, NULL, NULL, NULL, '2024-12-09 20:12:28', '2024-12-09 20:12:28', '2024-12-09 20:12:28');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assets_sites`
--

CREATE TABLE `assets_sites` (
  `assetId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `alt` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `assets_sites`
--

INSERT INTO `assets_sites` (`assetId`, `siteId`, `alt`) VALUES
(22, 1, NULL),
(22, 2, NULL),
(23, 1, NULL),
(23, 2, NULL),
(24, 1, NULL),
(24, 2, NULL),
(25, 1, NULL),
(25, 2, NULL),
(26, 1, NULL),
(26, 2, NULL),
(27, 1, NULL),
(27, 2, NULL),
(28, 1, NULL),
(28, 2, NULL),
(47, 1, NULL),
(47, 2, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `authenticator`
--

CREATE TABLE `authenticator` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int(11) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `changedattributes`
--

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 'postDate', '2024-12-08 14:21:16', 0, 1),
(2, 1, 'slug', '2024-12-08 14:21:08', 0, 1),
(2, 1, 'title', '2024-12-08 14:21:08', 0, 1),
(2, 2, 'postDate', '2024-12-08 14:21:16', 1, 1),
(2, 2, 'slug', '2024-12-08 14:21:07', 1, 1),
(2, 2, 'title', '2024-12-08 14:21:07', 1, 1),
(31, 1, 'postDate', '2024-12-08 19:02:10', 0, 1),
(31, 1, 'slug', '2024-12-08 19:01:44', 0, 1),
(31, 1, 'title', '2024-12-08 19:01:44', 0, 1),
(31, 2, 'postDate', '2024-12-08 19:02:10', 1, 1),
(31, 2, 'title', '2024-12-08 19:02:08', 1, 1),
(33, 1, 'postDate', '2024-12-08 19:00:08', 0, 1),
(33, 1, 'slug', '2024-12-08 18:59:32', 0, 1),
(33, 1, 'title', '2024-12-08 18:59:32', 0, 1),
(33, 2, 'postDate', '2024-12-08 19:00:08', 1, 1),
(33, 2, 'slug', '2024-12-08 18:59:32', 1, 1),
(33, 2, 'title', '2024-12-08 18:59:32', 1, 1),
(36, 1, 'postDate', '2024-12-08 19:03:16', 0, 1),
(36, 1, 'slug', '2024-12-08 19:02:37', 0, 1),
(36, 1, 'title', '2024-12-08 19:02:37', 0, 1),
(36, 2, 'postDate', '2024-12-08 19:03:16', 1, 1),
(36, 2, 'slug', '2024-12-08 19:02:36', 1, 1),
(36, 2, 'title', '2024-12-08 19:02:36', 1, 1),
(40, 1, 'postDate', '2024-12-08 19:04:37', 0, 1),
(40, 1, 'slug', '2024-12-08 19:04:01', 0, 1),
(40, 1, 'title', '2024-12-08 19:04:01', 0, 1),
(40, 2, 'postDate', '2024-12-08 19:04:37', 1, 1),
(40, 2, 'slug', '2024-12-08 19:04:01', 1, 1),
(40, 2, 'title', '2024-12-08 19:04:01', 1, 1),
(42, 1, 'postDate', '2024-12-08 19:05:33', 0, 1),
(42, 1, 'slug', '2024-12-08 19:04:56', 0, 1),
(42, 1, 'title', '2024-12-08 19:04:56', 0, 1),
(42, 2, 'postDate', '2024-12-08 19:05:33', 1, 1),
(42, 2, 'slug', '2024-12-08 19:04:55', 1, 1),
(42, 2, 'title', '2024-12-08 19:04:55', 1, 1),
(44, 1, 'postDate', '2024-12-08 19:06:36', 0, 1),
(44, 1, 'slug', '2024-12-08 19:06:03', 0, 1),
(44, 1, 'title', '2024-12-08 19:06:03', 0, 1),
(44, 2, 'postDate', '2024-12-08 19:06:36', 1, 1),
(44, 2, 'slug', '2024-12-08 19:06:03', 1, 1),
(44, 2, 'title', '2024-12-08 19:06:03', 1, 1),
(46, 1, 'postDate', '2024-12-09 20:13:10', 0, 1),
(46, 1, 'slug', '2024-12-09 20:09:15', 0, 1),
(46, 1, 'title', '2024-12-09 20:09:15', 0, 1),
(46, 2, 'postDate', '2024-12-09 20:13:10', 1, 1),
(46, 2, 'slug', '2024-12-09 20:09:15', 1, 1),
(46, 2, 'title', '2024-12-09 20:09:15', 1, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `changedfields`
--

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `layoutElementUid`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-08 15:22:37', 0, 1),
(2, 1, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-08 15:22:37', 0, 1),
(2, 1, 4, '5c5080f1-6906-4871-85fa-7a39b23011e8', '2024-12-09 20:37:28', 0, 1),
(2, 1, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-08 17:15:46', 0, 1),
(2, 2, 1, 'c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd', '2024-12-08 14:21:16', 1, 1),
(2, 2, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-08 15:22:38', 0, 1),
(2, 2, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-08 15:22:38', 0, 1),
(2, 2, 4, '5c5080f1-6906-4871-85fa-7a39b23011e8', '2024-12-09 20:37:27', 1, 1),
(2, 2, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-08 17:15:45', 1, 1),
(31, 1, 1, 'c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd', '2024-12-08 19:03:31', 0, 1),
(31, 1, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-08 19:02:10', 0, 1),
(31, 1, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-08 19:02:10', 0, 1),
(31, 1, 4, '5c5080f1-6906-4871-85fa-7a39b23011e8', '2024-12-08 19:02:10', 0, 1),
(31, 1, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-08 19:02:10', 0, 1),
(31, 2, 1, 'c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd', '2024-12-08 19:03:31', 1, 1),
(31, 2, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-08 19:02:10', 1, 1),
(31, 2, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-08 19:02:10', 1, 1),
(31, 2, 4, '5c5080f1-6906-4871-85fa-7a39b23011e8', '2024-12-08 19:02:10', 1, 1),
(31, 2, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-08 19:02:10', 1, 1),
(33, 1, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-08 19:00:08', 0, 1),
(33, 1, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-08 19:00:08', 0, 1),
(33, 1, 4, '5c5080f1-6906-4871-85fa-7a39b23011e8', '2024-12-08 19:00:08', 0, 1),
(33, 1, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-08 19:00:08', 0, 1),
(33, 2, 1, 'c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd', '2024-12-08 19:00:08', 1, 1),
(33, 2, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-08 19:00:08', 1, 1),
(33, 2, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-08 19:00:08', 1, 1),
(33, 2, 4, '5c5080f1-6906-4871-85fa-7a39b23011e8', '2024-12-08 19:00:08', 1, 1),
(33, 2, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-08 19:00:08', 1, 1),
(36, 1, 1, 'c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd', '2024-12-08 19:03:16', 0, 1),
(36, 1, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-08 19:03:16', 0, 1),
(36, 1, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-08 19:03:16', 0, 1),
(36, 1, 4, '5c5080f1-6906-4871-85fa-7a39b23011e8', '2024-12-08 19:03:16', 0, 1),
(36, 1, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-08 19:03:16', 0, 1),
(36, 2, 1, 'c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd', '2024-12-08 19:03:16', 1, 1),
(36, 2, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-08 19:03:16', 1, 1),
(36, 2, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-08 19:03:16', 1, 1),
(36, 2, 4, '5c5080f1-6906-4871-85fa-7a39b23011e8', '2024-12-08 19:03:16', 1, 1),
(36, 2, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-08 19:03:16', 1, 1),
(40, 1, 1, 'c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd', '2024-12-08 19:04:37', 0, 1),
(40, 1, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-08 19:04:37', 0, 1),
(40, 1, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-08 19:04:37', 0, 1),
(40, 1, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-08 19:04:37', 0, 1),
(40, 2, 1, 'c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd', '2024-12-08 19:04:37', 1, 1),
(40, 2, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-08 19:04:37', 1, 1),
(40, 2, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-08 19:04:37', 1, 1),
(40, 2, 4, '5c5080f1-6906-4871-85fa-7a39b23011e8', '2024-12-08 19:04:37', 1, 1),
(40, 2, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-08 19:04:37', 1, 1),
(42, 1, 1, 'c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd', '2024-12-08 19:05:33', 0, 1),
(42, 1, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-08 19:05:33', 0, 1),
(42, 1, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-08 19:05:33', 0, 1),
(42, 1, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-08 19:05:33', 0, 1),
(42, 2, 1, 'c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd', '2024-12-08 19:05:33', 1, 1),
(42, 2, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-08 19:05:33', 1, 1),
(42, 2, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-08 19:05:33', 1, 1),
(42, 2, 4, '5c5080f1-6906-4871-85fa-7a39b23011e8', '2024-12-08 19:05:33', 1, 1),
(42, 2, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-08 19:05:33', 1, 1),
(44, 1, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-08 19:06:36', 0, 1),
(44, 1, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-08 19:06:36', 0, 1),
(44, 1, 4, '5c5080f1-6906-4871-85fa-7a39b23011e8', '2024-12-08 19:06:36', 0, 1),
(44, 1, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-08 19:06:36', 0, 1),
(44, 2, 1, 'c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd', '2024-12-08 19:06:36', 1, 1),
(44, 2, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-08 19:06:36', 1, 1),
(44, 2, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-08 19:06:36', 1, 1),
(44, 2, 4, '5c5080f1-6906-4871-85fa-7a39b23011e8', '2024-12-08 19:06:36', 1, 1),
(44, 2, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-08 19:06:36', 1, 1),
(46, 1, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-09 20:13:10', 0, 1),
(46, 1, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-09 20:13:10', 0, 1),
(46, 1, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-09 20:15:14', 0, 1),
(46, 1, 6, '7316b69e-e587-4793-934e-eda2b2384384', '2024-12-09 21:16:03', 0, 1),
(46, 2, 1, 'c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd', '2024-12-09 20:13:10', 1, 1),
(46, 2, 2, 'f055562b-558e-4ebb-a058-b49bf98727c5', '2024-12-09 20:13:10', 1, 1),
(46, 2, 3, '72bc741c-eecb-448e-bf54-010e82c8ad7c', '2024-12-09 20:13:10', 1, 1),
(46, 2, 4, '5c5080f1-6906-4871-85fa-7a39b23011e8', '2024-12-09 20:13:10', 1, 1),
(46, 2, 5, '5183f172-cc08-4984-ba5d-0d4ff93f9618', '2024-12-09 20:15:14', 1, 1),
(46, 2, 6, '7316b69e-e587-4793-934e-eda2b2384384', '2024-12-09 21:16:03', 1, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`traces`)),
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elementactivity`
--

CREATE TABLE `elementactivity` (
  `elementId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `elementactivity`
--

INSERT INTO `elementactivity` (`elementId`, `userId`, `siteId`, `draftId`, `type`, `timestamp`) VALUES
(2, 1, 1, NULL, 'edit', '2024-12-09 20:37:26'),
(2, 1, 1, NULL, 'save', '2024-12-09 20:37:55'),
(31, 1, 1, NULL, 'edit', '2024-12-08 19:03:29'),
(31, 1, 1, NULL, 'save', '2024-12-08 19:03:31'),
(33, 1, 1, NULL, 'save', '2024-12-08 19:00:08'),
(36, 1, 1, NULL, 'save', '2024-12-08 19:03:16'),
(40, 1, 1, NULL, 'save', '2024-12-08 19:04:37'),
(42, 1, 1, NULL, 'save', '2024-12-08 19:05:34'),
(44, 1, 1, NULL, 'save', '2024-12-08 19:06:37'),
(46, 1, 1, NULL, 'edit', '2024-12-09 21:16:01'),
(46, 1, 1, NULL, 'save', '2024-12-09 21:16:03');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `elements`
--

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `deletedWithOwner`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2024-07-20 14:59:30', '2024-07-20 14:59:30', NULL, NULL, NULL, 'e627112a-954e-495b-9de6-0e1f87681022'),
(2, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 14:20:14', '2024-12-09 20:37:55', NULL, NULL, NULL, '739ce81e-9288-4b5a-9e1d-a9c1a8b57f2b'),
(3, 2, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 14:21:16', '2024-12-08 14:21:16', NULL, NULL, NULL, '7a826a38-1f13-4bb7-9e45-6800669c5bd8'),
(22, NULL, NULL, NULL, 2, 'craft\\elements\\Asset', 1, 0, '2024-12-08 15:18:19', '2024-12-08 15:18:19', NULL, NULL, NULL, '6e744867-1465-4920-ac38-10e20ea63f4a'),
(23, NULL, NULL, NULL, 2, 'craft\\elements\\Asset', 1, 0, '2024-12-08 15:18:48', '2024-12-08 15:18:48', NULL, NULL, NULL, 'e8b58f93-575d-442e-9b3f-441fc6360e6f'),
(24, NULL, NULL, NULL, 2, 'craft\\elements\\Asset', 1, 0, '2024-12-08 15:18:49', '2024-12-08 15:18:49', NULL, NULL, NULL, '80ea3817-4488-4257-ba34-186a40c1dac3'),
(25, NULL, NULL, NULL, 2, 'craft\\elements\\Asset', 1, 0, '2024-12-08 15:18:50', '2024-12-08 15:18:50', NULL, NULL, NULL, '7313d77c-3930-45ed-bf37-1b56ee83a1f0'),
(26, NULL, NULL, NULL, 2, 'craft\\elements\\Asset', 1, 0, '2024-12-08 15:18:51', '2024-12-08 15:18:51', NULL, NULL, NULL, 'b4d35685-8432-44b2-ba6a-0b07f3b4f814'),
(27, NULL, NULL, NULL, 2, 'craft\\elements\\Asset', 1, 0, '2024-12-08 15:18:52', '2024-12-08 15:18:52', NULL, NULL, NULL, 'f53e3349-b9b2-45b6-96a0-dbef5713b40e'),
(28, NULL, NULL, NULL, 2, 'craft\\elements\\Asset', 1, 0, '2024-12-08 15:18:54', '2024-12-08 15:18:54', NULL, NULL, NULL, '7f3bffbe-6529-4249-b1f7-70951e89e880'),
(30, 2, NULL, 2, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 15:22:37', '2024-12-08 15:22:38', NULL, NULL, NULL, 'a6ee5c46-5225-4d8f-9207-f695ba2b523e'),
(31, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 15:29:15', '2024-12-08 19:03:31', NULL, NULL, NULL, '9e9358fb-c953-40d0-b9d3-d15ff04d6e6b'),
(32, 2, NULL, 3, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 17:15:45', '2024-12-08 17:15:45', NULL, NULL, NULL, '11a58dd6-f873-4924-aef6-79d01d55d3d0'),
(33, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 18:58:45', '2024-12-08 19:00:08', NULL, NULL, NULL, 'cccfcd6e-4f8f-481c-8dcb-d866e4a81b7b'),
(34, 33, NULL, 4, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 19:00:08', '2024-12-08 19:00:08', NULL, NULL, NULL, 'ee6ed70b-2de3-4a3e-873b-f509db5ff456'),
(35, 31, NULL, 5, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 19:02:10', '2024-12-08 19:02:10', NULL, NULL, NULL, '7759f2c5-1acb-4c27-b636-e49ba78a5116'),
(36, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 19:02:27', '2024-12-08 19:03:16', NULL, NULL, NULL, 'b1ffa6b5-ebc4-44c6-8423-a13cfee44d44'),
(37, 36, NULL, 6, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 19:03:16', '2024-12-08 19:03:16', NULL, NULL, NULL, '215cc59d-d059-4352-9556-0f63a24ccd59'),
(39, 31, NULL, 7, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 19:03:31', '2024-12-08 19:03:31', NULL, NULL, NULL, 'e7c797b7-ef67-4b2c-9393-0705cd9f2aa5'),
(40, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 19:03:37', '2024-12-08 19:04:37', NULL, NULL, NULL, 'ef1aa16b-7b79-4176-a8cc-995930216bda'),
(41, 40, NULL, 8, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 19:04:37', '2024-12-08 19:04:37', NULL, NULL, NULL, '3ef83ee0-5ade-4389-a561-d746eb4d5a74'),
(42, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 19:04:44', '2024-12-08 19:05:33', NULL, NULL, NULL, '50a051b3-2dfa-479b-b532-9137e6b34035'),
(43, 42, NULL, 9, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 19:05:33', '2024-12-08 19:05:33', NULL, NULL, NULL, '1b7e4a2b-0614-4b3b-b01c-ff020d3d3a45'),
(44, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 19:05:54', '2024-12-08 19:06:36', NULL, NULL, NULL, '61b5fdfb-b300-4098-982a-0c72f400b48a'),
(45, 44, NULL, 10, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-08 19:06:36', '2024-12-08 19:06:36', NULL, NULL, NULL, 'ce40ee26-394f-4ed4-aca2-3fb0e42088e3'),
(46, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-09 20:09:06', '2024-12-09 21:16:03', NULL, NULL, NULL, 'be4bb6c1-da94-484b-adec-543b0b8dbc33'),
(47, NULL, NULL, NULL, 2, 'craft\\elements\\Asset', 1, 0, '2024-12-09 20:12:28', '2024-12-09 20:12:28', NULL, NULL, NULL, 'e85d4b4b-47d1-42af-b17a-c9e8bc73d253'),
(48, 46, NULL, 11, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-09 20:13:10', '2024-12-09 20:13:10', NULL, NULL, NULL, '9b30f951-a70f-466f-b156-8dcbf5b6d217'),
(50, 46, NULL, 12, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-09 20:15:14', '2024-12-09 20:15:14', NULL, NULL, NULL, '4acc32d1-afb0-4926-b6e0-5713636dbd33'),
(52, 2, NULL, 13, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-09 20:37:27', '2024-12-09 20:37:27', NULL, NULL, NULL, 'de9f1d35-7836-46c4-9354-b776a9700549'),
(53, 2, NULL, 14, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-09 20:37:55', '2024-12-09 20:37:55', NULL, NULL, NULL, 'dbfadbed-4b9c-4e78-8c4f-3a3ab9285b78'),
(55, 46, NULL, 15, 1, 'craft\\elements\\Entry', 1, 0, '2024-12-09 21:16:03', '2024-12-09 21:16:03', NULL, NULL, NULL, '29530979-85d4-4c72-97bc-184c8ff513cc');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elements_bulkops`
--

CREATE TABLE `elements_bulkops` (
  `elementId` int(11) NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elements_owners`
--

CREATE TABLE `elements_owners` (
  `elementId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content`)),
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `title`, `slug`, `uri`, `content`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, 1, '2024-07-20 14:59:30', '2024-07-20 14:59:30', 'a153c768-e4ab-4f6d-a181-879048e15e9e'),
(2, 2, 1, 'About me', 'about-me', NULL, '{\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"about_me\",\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[22],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[22],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"about_me\"}', 1, '2024-12-08 14:20:14', '2024-12-09 20:37:27', '3ac1e6a0-ef1c-42d7-b372-cc044d46b17e'),
(3, 2, 2, 'About me', 'about-me', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[22],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[22],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"about_me\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"about_me\"}', 1, '2024-12-08 14:20:14', '2024-12-09 20:37:27', '2520f23b-179a-48bd-8892-db86600d0e84'),
(4, 3, 1, 'About me', 'about-me', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[]}', 1, '2024-12-08 14:21:16', '2024-12-08 19:01:15', '64ba365a-f363-4afe-96d9-311ff6d7fb8d'),
(5, 3, 2, 'About me', 'about-me', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[]}', 1, '2024-12-08 14:21:16', '2024-12-08 19:01:15', '7f812083-df69-4e08-934c-a6a93c272270'),
(33, 22, 1, 'Help book cool 4', NULL, NULL, NULL, 1, '2024-12-08 15:18:19', '2024-12-08 15:18:19', '8222dcb7-6319-4641-ae17-4d3e13e38fa4'),
(34, 22, 2, 'Help book cool 4', NULL, NULL, NULL, 1, '2024-12-08 15:18:19', '2024-12-08 15:18:19', 'a67041b2-7683-4821-a6ce-7a9855d3fd2e'),
(35, 23, 1, 'Contact', NULL, NULL, NULL, 1, '2024-12-08 15:18:48', '2024-12-08 15:18:48', '5cf54754-56e3-4ac6-9066-c71a10216216'),
(36, 23, 2, 'Contact', NULL, NULL, NULL, 1, '2024-12-08 15:18:48', '2024-12-08 15:18:48', '92b910f8-da39-4a96-a298-639fcddcb860'),
(37, 24, 1, 'Cv', NULL, NULL, NULL, 1, '2024-12-08 15:18:49', '2024-12-08 15:18:49', 'e7bf2fa0-0f47-49b1-b785-b400e7ee9872'),
(38, 24, 2, 'Cv', NULL, NULL, NULL, 1, '2024-12-08 15:18:49', '2024-12-08 15:18:49', '45915460-7eba-4086-8eb4-eb24e35871bb'),
(39, 25, 1, 'I wont forget hue', NULL, NULL, NULL, 1, '2024-12-08 15:18:50', '2024-12-08 15:18:50', 'fb1b2b6a-b3b5-4dbe-84ae-fe9faa2e30b5'),
(40, 25, 2, 'I wont forget hue', NULL, NULL, NULL, 1, '2024-12-08 15:18:51', '2024-12-08 15:18:51', 'f122e432-c2f6-4b05-aed1-8760afc03cb5'),
(41, 26, 1, 'Ohbees', NULL, NULL, NULL, 1, '2024-12-08 15:18:51', '2024-12-08 15:18:51', '5145aea8-3874-4a71-a3bd-39c336606315'),
(42, 26, 2, 'Ohbees', NULL, NULL, NULL, 1, '2024-12-08 15:18:51', '2024-12-08 15:18:51', '828c4622-b62b-470d-9395-3cdf0737a3c3'),
(43, 27, 1, 'Past work', NULL, NULL, NULL, 1, '2024-12-08 15:18:52', '2024-12-08 15:18:52', 'b0fe3079-a228-491c-ad2a-406e8054e3b1'),
(44, 27, 2, 'Past work', NULL, NULL, NULL, 1, '2024-12-08 15:18:53', '2024-12-08 15:18:53', '6ee8a8ad-a00c-457f-a283-b4d95fe05e31'),
(45, 28, 1, 'Social media', NULL, NULL, NULL, 1, '2024-12-08 15:18:54', '2024-12-08 15:18:54', 'e11e52a7-b933-49ba-b570-5daadc436640'),
(46, 28, 2, 'Social media', NULL, NULL, NULL, 1, '2024-12-08 15:18:54', '2024-12-08 15:18:54', '0d913c3f-92ac-403d-9644-bf8997e17732'),
(49, 30, 1, 'About me', 'about-me', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[22],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[22]}', 1, '2024-12-08 15:22:38', '2024-12-08 19:01:16', '2b7c8d5d-005a-4069-8888-8dee53a38c66'),
(50, 30, 2, 'About me', 'about-me', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[22],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[22]}', 1, '2024-12-08 15:22:38', '2024-12-08 19:01:16', '831f777b-df0c-4955-a6a7-f488f6499368'),
(51, 31, 1, 'Past work', 'past-work', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[27],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[27],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"past_work\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"file_explorer\"}', 1, '2024-12-08 15:29:15', '2024-12-08 19:03:31', '2561df8a-98bd-4658-9411-ff78c4cf018a'),
(52, 31, 2, NULL, '__temp_deroeckyeybgsvyayjysiunlehmqswalridb', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[27],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[27],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"past_work\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"file_explorer\"}', 1, '2024-12-08 15:29:15', '2024-12-08 19:03:31', '333fe6f2-4e9b-4633-9505-54006d68a1c2'),
(53, 32, 1, 'About me', 'about-me', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[22],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[22],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"about_me\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-08 17:15:45', '2024-12-08 17:15:45', '26fc64f6-c427-4770-a199-d88e6ebcfb5b'),
(54, 32, 2, 'About me', 'about-me', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[22],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[22],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"about_me\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-08 17:15:46', '2024-12-08 17:15:46', 'f0579cc3-94fb-462d-9609-1352fda7aee8'),
(55, 33, 1, 'CV', 'cv', NULL, '{\"f055562b-558e-4ebb-a058-b49bf98727c5\":[24],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[24],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"cv\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"notepad\",\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false}', 1, '2024-12-08 18:58:45', '2024-12-08 19:00:05', 'f915f190-2009-46d6-b106-ff6cd10d1fc9'),
(56, 33, 2, 'CV', 'cv', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[24],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[24],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"cv\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"notepad\"}', 1, '2024-12-08 18:58:45', '2024-12-08 19:00:06', '9aa917b8-ec42-4dd7-8802-1649e0b78641'),
(57, 34, 1, 'CV', 'cv', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[24],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[24],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"cv\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"notepad\"}', 1, '2024-12-08 19:00:08', '2024-12-08 19:00:08', '143defef-d3bf-4430-a566-fbd72072ef88'),
(58, 34, 2, 'CV', 'cv', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[24],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[24],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"cv\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"notepad\"}', 1, '2024-12-08 19:00:08', '2024-12-08 19:00:08', 'f7596964-f93a-407f-9a7b-8d9b7943646e'),
(59, 35, 1, 'Past work', 'past-work', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[27],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[27],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"past_work\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"file_explorer\"}', 1, '2024-12-08 19:02:11', '2024-12-08 19:02:11', '1d113e09-2ea1-4212-8609-42a62f070994'),
(60, 35, 2, 'Invoer 35', '__temp_deroeckyeybgsvyayjysiunlehmqswalridb', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[27],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[27],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"past_work\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"file_explorer\"}', 1, '2024-12-08 19:02:11', '2024-12-08 19:02:11', '02d196be-8dbe-4628-9932-209b95123942'),
(61, 36, 1, 'Social media', 'social-media', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[28],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[28],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"social_media\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"internet_explorer\"}', 1, '2024-12-08 19:02:27', '2024-12-08 19:03:14', '0e9d75bc-9f1f-41d1-986f-c468bf7768ed'),
(62, 36, 2, 'Social media', 'social-media', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[28],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[28],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"social_media\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"internet_explorer\"}', 1, '2024-12-08 19:02:27', '2024-12-08 19:03:14', 'fc2f7694-c2c0-4860-87fd-2bfbb710d670'),
(63, 37, 1, 'Social media', 'social-media', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[28],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[28],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"social_media\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"internet_explorer\"}', 1, '2024-12-08 19:03:16', '2024-12-08 19:03:16', 'f3ae7526-6392-4f2e-a3f4-3395c0f3424f'),
(64, 37, 2, 'Social media', 'social-media', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[28],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[28],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"social_media\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"internet_explorer\"}', 1, '2024-12-08 19:03:16', '2024-12-08 19:03:16', '0f4abcbb-e0d7-409d-95a1-f6dbe49725ea'),
(67, 39, 1, 'Past work', 'past-work', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[27],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[27],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"past_work\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"file_explorer\"}', 1, '2024-12-08 19:03:31', '2024-12-08 19:03:31', 'f771e2ef-a5f0-4caa-bc77-363d6b016814'),
(68, 39, 2, 'Invoer 39', '__temp_deroeckyeybgsvyayjysiunlehmqswalridb', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[27],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[27],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"past_work\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"file_explorer\"}', 1, '2024-12-08 19:03:31', '2024-12-08 19:03:31', '4010bc1b-5718-4f9c-a3f9-508f5414daed'),
(69, 40, 1, 'I Won\'t Forget Hue', 'i-wont-forget-hue', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[25],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[25],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"i_wont_forget_hue\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-08 19:03:37', '2024-12-08 19:04:34', 'efe94c2c-cb15-4e8e-8e56-c8ca852cbdff'),
(70, 40, 2, 'I Won\'t Forget Hue', 'i-wont-forget-hue', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[25],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[25],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"i_wont_forget_hue\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-08 19:03:37', '2024-12-08 19:04:34', '3065b298-5bba-43a8-87b3-c7235081d28d'),
(71, 41, 1, 'I Won\'t Forget Hue', 'i-wont-forget-hue', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[25],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[25],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"i_wont_forget_hue\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-08 19:04:37', '2024-12-08 19:04:37', '1e34ecb3-a398-4b1a-beda-427a9fdecb82'),
(72, 41, 2, 'I Won\'t Forget Hue', 'i-wont-forget-hue', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[25],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[25],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"i_wont_forget_hue\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-08 19:04:37', '2024-12-08 19:04:37', '81f32064-0600-4f8a-8fa4-b8c020eb510a'),
(73, 42, 1, 'Oh Bees', 'oh-bees', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[26],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[26],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"oh_bees\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-08 19:04:44', '2024-12-08 19:05:31', 'ee20e3c1-79e3-4f19-a02d-08a8b5b93c75'),
(74, 42, 2, 'Oh Bees', 'oh-bees', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[26],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[26],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"oh_bees\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-08 19:04:44', '2024-12-08 19:05:31', 'e6c253de-27e7-4210-adbd-40ed28683c29'),
(75, 43, 1, 'Oh Bees', 'oh-bees', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[26],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[26],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"oh_bees\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-08 19:05:33', '2024-12-08 19:05:33', '72e735cb-3072-42bb-ae1d-9135047a7ebd'),
(76, 43, 2, 'Oh Bees', 'oh-bees', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":true,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[26],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[26],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"oh_bees\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-08 19:05:33', '2024-12-08 19:05:33', 'a93419fd-1565-4dae-90e6-bedde01f1f40'),
(77, 44, 1, 'Contact', 'contact', NULL, '{\"f055562b-558e-4ebb-a058-b49bf98727c5\":[23],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[23],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"contact\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"contact\",\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false}', 1, '2024-12-08 19:05:54', '2024-12-08 19:06:34', 'b4806537-fd81-485a-9d3b-fc4565b74f9e'),
(78, 44, 2, 'Contact', 'contact', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[23],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[23],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"contact\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"contact\"}', 1, '2024-12-08 19:05:54', '2024-12-08 19:06:34', '77e76462-1293-4ce1-8e84-0999fcc2101d'),
(79, 45, 1, 'Contact', 'contact', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[23],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[23],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"contact\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"contact\"}', 1, '2024-12-08 19:06:36', '2024-12-08 19:06:36', '0d6f0184-641e-44bc-981d-89954ee26c3f'),
(80, 45, 2, 'Contact', 'contact', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[23],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[23],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"contact\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"contact\"}', 1, '2024-12-08 19:06:37', '2024-12-08 19:06:37', 'e6f0cb68-3b32-4eb6-ab0c-07e4a63096aa'),
(81, 46, 1, 'Welcome', 'welcome', NULL, '{\"7316b69e-e587-4793-934e-eda2b2384384\":false,\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"welcome\",\"f055562b-558e-4ebb-a058-b49bf98727c5\":[47],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[47],\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-09 20:09:06', '2024-12-09 21:16:03', 'ea0c2f4f-195d-4790-9917-73e5d9728d19'),
(82, 46, 2, 'Welcome', 'welcome', NULL, '{\"7316b69e-e587-4793-934e-eda2b2384384\":false,\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[47],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[47],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"welcome\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-09 20:09:06', '2024-12-09 21:16:03', 'f0ba90a9-531e-432b-9693-3e1edd05914b'),
(83, 47, 1, 'Windows 0', NULL, NULL, NULL, 1, '2024-12-09 20:12:28', '2024-12-09 20:12:28', 'f9ef6f37-bcd5-43b2-b55d-d6fe66b34b81'),
(84, 47, 2, 'Windows 0', NULL, NULL, NULL, 1, '2024-12-09 20:12:28', '2024-12-09 20:12:28', '8debb82f-aa8e-460e-a8e7-c70a1a2ba30d'),
(85, 48, 1, 'Welcome', 'welcome', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[47],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[47],\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-09 20:13:10', '2024-12-09 20:13:10', '63c67054-9dcd-4a2f-ad3d-1f48aceb186b'),
(86, 48, 2, 'Welcome', 'welcome', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[47],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[47],\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-09 20:13:11', '2024-12-09 20:13:11', '160a65ec-9b7d-403c-9292-6b8afcf15a9f'),
(89, 50, 1, 'Welcome', 'welcome', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[47],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[47],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"welcome\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-09 20:15:14', '2024-12-09 20:15:14', 'a5f3b814-33cf-40b4-b71e-3e4fea4fdfd3'),
(90, 50, 2, 'Welcome', 'welcome', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[47],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[47],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"welcome\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-09 20:15:14', '2024-12-09 20:15:14', 'ea36c197-68b9-434f-89a0-9fb0abdfd721'),
(93, 52, 1, 'About me', 'about-me', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[22],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[22],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"about_me\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"about_me\"}', 1, '2024-12-09 20:37:27', '2024-12-09 20:37:27', '4776be0f-d15e-4a13-935c-347713218de3'),
(94, 52, 2, 'About me', 'about-me', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[22],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[22],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"about_me\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"about_me\"}', 1, '2024-12-09 20:37:27', '2024-12-09 20:37:27', 'd7a7a5c8-bd65-4345-94f2-edd3e70a7f7a'),
(95, 53, 1, 'About me', 'about-me', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[22],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[22],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"about_me\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"about_me\"}', 1, '2024-12-09 20:37:55', '2024-12-09 20:37:55', '248e19e1-bb3e-4ae5-a198-ce4536f04007'),
(96, 53, 2, 'About me', 'about-me', NULL, '{\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[22],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[22],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"about_me\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"about_me\"}', 1, '2024-12-09 20:37:55', '2024-12-09 20:37:55', '055c32ad-0f33-46a1-8354-1c2b95c218d8'),
(99, 55, 1, 'Welcome', 'welcome', NULL, '{\"7316b69e-e587-4793-934e-eda2b2384384\":false,\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[47],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[47],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"welcome\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-09 21:16:03', '2024-12-09 21:16:03', 'f16a093a-a4e4-486a-a05d-0e7596e696f4'),
(100, 55, 2, 'Welcome', 'welcome', NULL, '{\"7316b69e-e587-4793-934e-eda2b2384384\":false,\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\":false,\"f055562b-558e-4ebb-a058-b49bf98727c5\":[47],\"72bc741c-eecb-448e-bf54-010e82c8ad7c\":[47],\"5183f172-cc08-4984-ba5d-0d4ff93f9618\":\"welcome\",\"5c5080f1-6906-4871-85fa-7a39b23011e8\":\"default\"}', 1, '2024-12-09 21:16:03', '2024-12-09 21:16:03', '1bc898cc-2e86-44e7-add8-f603b9eafde1');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `primaryOwnerId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `primaryOwnerId`, `fieldId`, `typeId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `deletedWithSection`, `dateCreated`, `dateUpdated`) VALUES
(2, 1, NULL, NULL, NULL, 1, '2024-12-08 14:21:00', NULL, NULL, NULL, '2024-12-08 14:20:14', '2024-12-08 14:21:16'),
(3, 1, NULL, NULL, NULL, 1, '2024-12-08 14:21:00', NULL, NULL, NULL, '2024-12-08 14:21:16', '2024-12-08 14:21:16'),
(30, 1, NULL, NULL, NULL, 1, '2024-12-08 14:21:00', NULL, NULL, NULL, '2024-12-08 15:22:38', '2024-12-08 15:22:38'),
(31, 1, NULL, NULL, NULL, 1, '2024-12-08 19:02:00', NULL, NULL, NULL, '2024-12-08 15:29:15', '2024-12-08 19:02:10'),
(32, 1, NULL, NULL, NULL, 1, '2024-12-08 14:21:00', NULL, NULL, NULL, '2024-12-08 17:15:45', '2024-12-08 17:15:45'),
(33, 1, NULL, NULL, NULL, 1, '2024-12-08 19:00:00', NULL, NULL, NULL, '2024-12-08 18:58:45', '2024-12-08 19:00:08'),
(34, 1, NULL, NULL, NULL, 1, '2024-12-08 19:00:00', NULL, NULL, NULL, '2024-12-08 19:00:08', '2024-12-08 19:00:08'),
(35, 1, NULL, NULL, NULL, 1, '2024-12-08 19:02:00', NULL, NULL, NULL, '2024-12-08 19:02:11', '2024-12-08 19:02:11'),
(36, 1, NULL, NULL, NULL, 1, '2024-12-08 19:03:00', NULL, NULL, NULL, '2024-12-08 19:02:27', '2024-12-08 19:03:15'),
(37, 1, NULL, NULL, NULL, 1, '2024-12-08 19:03:00', NULL, NULL, NULL, '2024-12-08 19:03:16', '2024-12-08 19:03:16'),
(39, 1, NULL, NULL, NULL, 1, '2024-12-08 19:02:00', NULL, NULL, NULL, '2024-12-08 19:03:31', '2024-12-08 19:03:31'),
(40, 1, NULL, NULL, NULL, 1, '2024-12-08 19:04:00', NULL, NULL, NULL, '2024-12-08 19:03:37', '2024-12-08 19:04:37'),
(41, 1, NULL, NULL, NULL, 1, '2024-12-08 19:04:00', NULL, NULL, NULL, '2024-12-08 19:04:37', '2024-12-08 19:04:37'),
(42, 1, NULL, NULL, NULL, 1, '2024-12-08 19:05:00', NULL, NULL, NULL, '2024-12-08 19:04:44', '2024-12-08 19:05:33'),
(43, 1, NULL, NULL, NULL, 1, '2024-12-08 19:05:00', NULL, NULL, NULL, '2024-12-08 19:05:33', '2024-12-08 19:05:33'),
(44, 1, NULL, NULL, NULL, 1, '2024-12-08 19:06:00', NULL, NULL, NULL, '2024-12-08 19:05:54', '2024-12-08 19:06:36'),
(45, 1, NULL, NULL, NULL, 1, '2024-12-08 19:06:00', NULL, NULL, NULL, '2024-12-08 19:06:37', '2024-12-08 19:06:37'),
(46, 1, NULL, NULL, NULL, 1, '2024-12-09 20:13:00', NULL, NULL, NULL, '2024-12-09 20:09:06', '2024-12-09 20:13:10'),
(48, 1, NULL, NULL, NULL, 1, '2024-12-09 20:13:00', NULL, NULL, NULL, '2024-12-09 20:13:10', '2024-12-09 20:13:10'),
(50, 1, NULL, NULL, NULL, 1, '2024-12-09 20:13:00', NULL, NULL, NULL, '2024-12-09 20:15:14', '2024-12-09 20:15:14'),
(52, 1, NULL, NULL, NULL, 1, '2024-12-08 14:21:00', NULL, NULL, NULL, '2024-12-09 20:37:27', '2024-12-09 20:37:27'),
(53, 1, NULL, NULL, NULL, 1, '2024-12-08 14:21:00', NULL, NULL, NULL, '2024-12-09 20:37:55', '2024-12-09 20:37:55'),
(55, 1, NULL, NULL, NULL, 1, '2024-12-09 20:13:00', NULL, NULL, NULL, '2024-12-09 21:16:03', '2024-12-09 21:16:03');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `entries_authors`
--

CREATE TABLE `entries_authors` (
  `entryId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `entries_authors`
--

INSERT INTO `entries_authors` (`entryId`, `authorId`, `sortOrder`) VALUES
(2, 1, 1),
(3, 1, 1),
(30, 1, 1),
(31, 1, 1),
(32, 1, 1),
(33, 1, 1),
(34, 1, 1),
(35, 1, 1),
(36, 1, 1),
(37, 1, 1),
(39, 1, 1),
(40, 1, 1),
(41, 1, 1),
(42, 1, 1),
(43, 1, 1),
(44, 1, 1),
(45, 1, 1),
(46, 1, 1),
(48, 1, 1),
(50, 1, 1),
(52, 1, 1),
(53, 1, 1),
(55, 1, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT 1,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text DEFAULT NULL,
  `showStatusField` tinyint(1) DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `fieldLayoutId`, `name`, `handle`, `icon`, `color`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `showSlugField`, `slugTranslationMethod`, `slugTranslationKeyFormat`, `showStatusField`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 'Program', 'program', 'calculator', NULL, 1, 'site', '', '', 1, 'site', '', 1, '2024-07-20 14:59:28', '2024-07-20 14:59:28', NULL, '91df1c71-2eec-4714-9dbf-8bca03578466');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config`)),
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `config`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '{\"tabs\":[{\"name\":\"Content\",\"uid\":\"ae272aee-50f0-4d6b-95b8-8ea6b8310e9e\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2024-12-08T16:25:08+00:00\",\"uid\":\"48c22ca0-9f33-4c1b-b5f2-5cd2e8f937cc\",\"userCondition\":null,\"elementCondition\":null,\"required\":true},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2024-12-09T21:15:31+00:00\",\"uid\":\"7316b69e-e587-4793-934e-eda2b2384384\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"357a9117-f4c9-48f2-a5d4-d379e8bc0106\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2024-12-08T16:25:08+00:00\",\"uid\":\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"da878ded-8b92-4d04-bf6e-78fe822b5b8e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2024-12-08T16:25:08+00:00\",\"uid\":\"f055562b-558e-4ebb-a058-b49bf98727c5\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"643e2a1b-c91c-4e6a-9202-c9d35696ec1b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2024-12-08T16:25:08+00:00\",\"uid\":\"72bc741c-eecb-448e-bf54-010e82c8ad7c\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"a9f99a5f-a049-46a8-bd54-4d21598bee37\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2024-12-08T16:26:18+00:00\",\"uid\":\"5183f172-cc08-4984-ba5d-0d4ff93f9618\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"5cbbc156-a371-4496-b3ac-59ef92544ad4\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2024-12-08T16:26:18+00:00\",\"uid\":\"5c5080f1-6906-4871-85fa-7a39b23011e8\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"686f9f04-92ac-4891-aed9-17766b5ca11c\"}]}],\"cardView\":[]}', '2024-07-20 14:59:27', '2024-12-09 21:15:31', NULL, '66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0'),
(2, 'craft\\elements\\Asset', '{\"tabs\":[{\"name\":\"Content\",\"uid\":\"cc44e9ce-0227-4cb2-82a0-45b1cfac578b\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"e89a370c-ad2e-41c0-bbc6-0edda9d4d989\",\"userCondition\":null,\"elementCondition\":null}]}]}', '2024-07-20 14:59:29', '2024-07-20 14:59:29', NULL, 'a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `fields`
--

INSERT INTO `fields` (`id`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Can be duplicated?', 'canBeDuplicated', 'global', NULL, NULL, 0, 'none', NULL, 'craft\\fields\\Lightswitch', '{\"default\":false,\"offLabel\":null,\"onLabel\":null}', '2024-07-20 14:59:27', '2024-07-20 14:59:27', NULL, 'da878ded-8b92-4d04-bf6e-78fe822b5b8e'),
(2, 'Icon', 'icon', 'global', NULL, NULL, 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:1ef4c050-d814-47c6-9dbb-2449c83d9fa7\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:1ef4c050-d814-47c6-9dbb-2449c83d9fa7\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2024-07-20 14:59:27', '2024-12-08 15:23:14', NULL, '643e2a1b-c91c-4e6a-9202-c9d35696ec1b'),
(3, 'Window icon', 'windowIcon', 'global', NULL, NULL, 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:1ef4c050-d814-47c6-9dbb-2449c83d9fa7\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:1ef4c050-d814-47c6-9dbb-2449c83d9fa7\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2024-07-20 14:59:27', '2024-12-08 15:23:10', NULL, 'a9f99a5f-a049-46a8-bd54-4d21598bee37'),
(4, 'Window Type', 'windowType', 'global', NULL, NULL, 0, 'none', NULL, 'craft\\fields\\Dropdown', '{\"customOptions\":false,\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"About me\",\"value\":\"about_me\",\"default\":\"\"},{\"label\":\"Contact\",\"value\":\"contact\",\"default\":\"\"},{\"label\":\"File explorer\",\"value\":\"file_explorer\",\"default\":\"\"},{\"label\":\"Internet explorer\",\"value\":\"internet_explorer\",\"default\":\"\"},{\"label\":\"Notepad\",\"value\":\"notepad\",\"default\":\"\"}]}', '2024-07-20 14:59:27', '2024-12-08 16:25:35', NULL, '686f9f04-92ac-4891-aed9-17766b5ca11c'),
(5, 'Content ID', 'contentId', 'global', NULL, NULL, 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-12-08 16:25:54', '2024-12-08 16:25:54', NULL, '5cbbc156-a371-4496-b3ac-59ef92544ad4'),
(6, 'Display', 'display', 'global', NULL, NULL, 0, 'none', NULL, 'craft\\fields\\Lightswitch', '{\"default\":true,\"offLabel\":null,\"onLabel\":null}', '2024-12-09 21:15:12', '2024-12-09 21:15:12', NULL, '357a9117-f4c9-48f2-a5d4-d379e8bc0106');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`scope`)),
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `gqlschemas`
--

INSERT INTO `gqlschemas` (`id`, `name`, `scope`, `isPublic`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Public Schema', '[]', 1, '2024-07-20 14:59:30', '2024-07-20 14:59:30', '42c395fa-2f2c-472c-a879-7dc4a5a674b4');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `imagetransformindex`
--

CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `imagetransformindex`
--

INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(43, 22, 'craft\\imagetransforms\\ImageTransformer', 'help_book_cool-4.png', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:20', '2024-12-08 15:18:20', '2024-12-08 15:18:21', '84f36fb3-fbc3-427b-93a8-570d81718824'),
(44, 22, 'craft\\imagetransforms\\ImageTransformer', 'help_book_cool-4.png', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:20', '2024-12-08 15:18:20', '2024-12-08 15:18:22', '1ae28696-7c8d-4195-8a85-fdb6001c1427'),
(45, 22, 'craft\\imagetransforms\\ImageTransformer', 'help_book_cool-4.png', NULL, '_190x190_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:22', '2024-12-08 15:18:22', '2024-12-08 15:18:24', 'e4ccaefe-b2b0-4d2d-be31-2d01139a9fb3'),
(46, 22, 'craft\\imagetransforms\\ImageTransformer', 'help_book_cool-4.png', NULL, '_380x380_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:22', '2024-12-08 15:18:22', '2024-12-08 15:18:24', 'cbfccae7-eebd-4103-9e58-bb22a35539b6'),
(47, 28, 'craft\\imagetransforms\\ImageTransformer', 'social_media.png', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:54', '2024-12-08 15:18:54', '2024-12-08 15:18:56', 'b484e05a-0d45-4761-aa1d-bd39faa0fdac'),
(48, 28, 'craft\\imagetransforms\\ImageTransformer', 'social_media.png', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:54', '2024-12-08 15:18:54', '2024-12-08 15:18:57', 'f2614ef5-d816-4971-8900-1ea79995d3af'),
(49, 27, 'craft\\imagetransforms\\ImageTransformer', 'past_work.png', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:54', '2024-12-08 15:18:54', '2024-12-08 15:18:57', '3296bfe7-adc8-43a6-a986-a6e72b2f134d'),
(50, 27, 'craft\\imagetransforms\\ImageTransformer', 'past_work.png', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:54', '2024-12-08 15:18:54', '2024-12-08 15:18:57', '39d5f4bf-b9ca-4827-9432-1efac7f86349'),
(51, 26, 'craft\\imagetransforms\\ImageTransformer', 'ohbees.png', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:54', '2024-12-08 15:18:54', '2024-12-08 15:18:57', '14989016-33ea-445a-9685-fd54fd42d624'),
(52, 26, 'craft\\imagetransforms\\ImageTransformer', 'ohbees.png', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:54', '2024-12-08 15:18:54', '2024-12-08 15:18:57', 'e3683ceb-3317-4112-a16a-285859653986'),
(53, 25, 'craft\\imagetransforms\\ImageTransformer', 'i_wont_forget_hue.png', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:54', '2024-12-08 15:18:54', '2024-12-08 15:18:57', 'c3c5f803-c0f9-4741-af3d-fe6ef4c490db'),
(54, 25, 'craft\\imagetransforms\\ImageTransformer', 'i_wont_forget_hue.png', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:54', '2024-12-08 15:18:54', '2024-12-08 15:18:58', 'be49a1f3-f258-418a-9948-319bea999d24'),
(55, 24, 'craft\\imagetransforms\\ImageTransformer', 'cv.png', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:55', '2024-12-08 15:18:55', '2024-12-08 15:18:58', '01813e2a-b868-469f-bab9-367e1e73fed2'),
(56, 24, 'craft\\imagetransforms\\ImageTransformer', 'cv.png', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:55', '2024-12-08 15:18:55', '2024-12-08 15:18:58', '97e1aba1-a676-487a-9298-2bc05ae81d31'),
(57, 23, 'craft\\imagetransforms\\ImageTransformer', 'contact.png', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:55', '2024-12-08 15:18:55', '2024-12-08 15:18:58', 'eb6d3e61-bbe6-4533-b480-66e0d67a9606'),
(58, 23, 'craft\\imagetransforms\\ImageTransformer', 'contact.png', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-12-08 15:18:55', '2024-12-08 15:18:55', '2024-12-08 15:18:58', 'd25bea8d-ab26-4b97-b52a-3475c043863f'),
(59, 47, 'craft\\imagetransforms\\ImageTransformer', 'windows-0.png', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-12-09 20:12:30', '2024-12-09 20:12:30', '2024-12-09 20:12:31', '9bba5904-b9fc-4d12-9557-b7eeebfbbc22'),
(60, 47, 'craft\\imagetransforms\\ImageTransformer', 'windows-0.png', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-12-09 20:12:30', '2024-12-09 20:12:30', '2024-12-09 20:13:16', '86e94723-1598-4b04-8500-7d1af5c354f8');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `imagetransforms`
--

CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT 1,
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '5.5.5', '5.5.0.0', 0, 'yycsrobcfhfn', '3@dwxxuzjuyk', '2024-07-20 14:59:26', '2024-12-09 21:15:31', 'f56b3441-b30a-4606-aa37-b0d7ad1bdc82');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '21beabb8-7c15-4eb4-8762-ec1199e4f2ac'),
(2, 'craft', 'm221101_115859_create_entries_authors_table', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', 'dac0b42a-9330-4e11-835b-7a05179b2343'),
(3, 'craft', 'm221107_112121_add_max_authors_to_sections', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '44b45af0-681e-48c0-913f-1977a16a6687'),
(4, 'craft', 'm221205_082005_translatable_asset_alt_text', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', 'f83f2959-7e14-459b-bf29-d61f5bd475b4'),
(5, 'craft', 'm230314_110309_add_authenticator_table', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', 'c92e373e-99a0-479b-b630-c501307ea890'),
(6, 'craft', 'm230314_111234_add_webauthn_table', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2f673933-5871-4448-8706-4be6727d557b'),
(7, 'craft', 'm230503_120303_add_recoverycodes_table', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '50639f16-0212-4e05-a348-e2a45e665eba'),
(8, 'craft', 'm230511_000000_field_layout_configs', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '15214b57-e75c-4809-afb6-8f18013b1c90'),
(9, 'craft', 'm230511_215903_content_refactor', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', 'd29c55b7-f566-43cb-a9f7-9d682b7d2c6f'),
(10, 'craft', 'm230524_000000_add_entry_type_show_slug_field', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2456741e-3e70-4dc0-b0d0-e99d8758215e'),
(11, 'craft', 'm230524_000001_entry_type_icons', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', 'fb3264bf-6da6-43f7-9b65-39dd16d45ec2'),
(12, 'craft', 'm230524_000002_entry_type_colors', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '8fd1beb0-4e5e-4c09-b9f6-778df3c26104'),
(13, 'craft', 'm230524_220029_global_entry_types', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '340341a6-f823-4f64-a7b3-e675d86c4f81'),
(14, 'craft', 'm230531_123004_add_entry_type_show_status_field', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', 'aae25237-ff72-4d28-b889-3326d33eab44'),
(15, 'craft', 'm230607_102049_add_entrytype_slug_translation_columns', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '0e4e79ea-5179-44e7-959c-84fe2a2a6577'),
(16, 'craft', 'm230616_173810_kill_field_groups', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', 'c095d8f0-28dd-44d4-91f6-c4664dd9771a'),
(17, 'craft', 'm230616_183820_remove_field_name_limit', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-07-20 14:59:31', '6ba97c38-7c2e-4d7e-b3f9-f6bc7cde1c6f'),
(18, 'craft', 'm230617_070415_entrify_matrix_blocks', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '2024-07-20 14:59:32', 'a03c8999-0e2c-487f-9fea-0e152b68d4ae'),
(19, 'craft', 'm230710_162700_element_activity', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '92978f2a-f5f8-4ffa-976a-9ea75a563870'),
(20, 'craft', 'm230820_162023_fix_cache_id_type', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '2024-07-20 14:59:32', 'b5ac0dc0-f9ad-45b2-9831-719cc6ac1345'),
(21, 'craft', 'm230826_094050_fix_session_id_type', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '31333ca4-73e3-460a-9a06-9b62633a2fad'),
(22, 'craft', 'm230904_190356_address_fields', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '2024-07-20 14:59:32', 'd375da7c-c668-4d2e-9335-cae38384cac6'),
(23, 'craft', 'm230928_144045_add_subpath_to_volumes', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '2024-07-20 14:59:32', 'bf8160a8-e741-4d39-8dd7-b6064e26a247'),
(24, 'craft', 'm231013_185640_changedfields_amend_primary_key', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '2024-07-20 14:59:32', 'bdacba6e-dbd5-4b21-9312-3023c0d9b6a1'),
(25, 'craft', 'm231213_030600_element_bulk_ops', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '2024-07-20 14:59:32', 'a0ba8843-91fb-484e-a22a-6a07b593019e'),
(26, 'craft', 'm240129_150719_sites_language_amend_length', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '9092c045-5e2f-45d7-9721-fbdbfd02b26b'),
(27, 'craft', 'm240206_035135_convert_json_columns', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '2024-07-20 14:59:32', 'c4a7b75b-fa56-4834-8043-270951292d98'),
(28, 'craft', 'm240207_182452_address_line_3', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '7cd17166-2238-430e-9e9e-0e3f19de81e1'),
(29, 'craft', 'm240302_212719_solo_preview_targets', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '2024-07-20 14:59:32', 'b9f4e209-6adc-4f50-b758-9e389e5a0cdf'),
(30, 'craft', 'm240619_091352_add_auth_2fa_timestamp', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '2024-07-20 14:59:32', '67c73a88-5d19-46d9-ba56-097c8d148307'),
(31, 'craft', 'm240723_214330_drop_bulkop_fk', '2024-12-08 15:57:47', '2024-12-08 15:57:47', '2024-12-08 15:57:47', 'b4d377db-a803-4be5-b9e7-13308887503c'),
(32, 'craft', 'm240731_053543_soft_delete_fields', '2024-12-08 15:57:48', '2024-12-08 15:57:48', '2024-12-08 15:57:48', '9c02c8e3-0f88-43d6-9fae-02dcc16f616d'),
(33, 'craft', 'm240805_154041_sso_identities', '2024-12-08 15:57:48', '2024-12-08 15:57:48', '2024-12-08 15:57:48', '2ee71087-b8fc-42e1-9e8c-f1e5bb174ddb'),
(34, 'craft', 'm240926_202248_track_entries_deleted_with_section', '2024-12-08 15:57:48', '2024-12-08 15:57:48', '2024-12-08 15:57:48', '86ffe323-cc19-467e-96c8-c40c05a8010f');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'vite', '5.0.1', '1.0.0', '2024-12-08 15:58:16', '2024-12-08 15:58:16', '2024-12-08 15:58:16', '696a3755-0b2e-48a8-89f5-e7a0084a9080'),
(4, '_portfolio-core', 'dev-main', '1.0.0', '2024-12-09 19:23:18', '2024-12-09 19:23:18', '2024-12-09 19:23:18', '8efe0480-c2e4-4ffd-8e06-6a263c63e979'),
(6, 'portfolio-core', 'dev-main', '1.0.0', '2024-12-09 19:43:12', '2024-12-09 19:43:12', '2024-12-09 19:43:12', 'ca3f47f9-95ec-4cf5-ab32-534064aa382f');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('dateModified', '1733778931'),
('email.fromEmail', '\"tom.faust@hotmail.com\"'),
('email.fromName', '\"portfolio-craft\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.color', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elementCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.class', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.dateAdded', '\"2024-12-08T16:25:08+00:00\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.disabled', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.id', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.inputType', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.instructions', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.label', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.max', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.min', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.name', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.orientation', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.readonly', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.required', 'true'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.size', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.step', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.tip', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.title', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.uid', '\"48c22ca0-9f33-4c1b-b5f2-5cd2e8f937cc\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.warning', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.0.width', '100'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.1.dateAdded', '\"2024-12-09T21:15:31+00:00\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.1.fieldUid', '\"357a9117-f4c9-48f2-a5d4-d379e8bc0106\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.1.handle', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.1.includeInCards', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.1.instructions', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.1.label', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.1.providesThumbs', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.1.required', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.1.tip', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.1.uid', '\"7316b69e-e587-4793-934e-eda2b2384384\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.1.warning', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.1.width', '100'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.2.dateAdded', '\"2024-12-08T16:25:08+00:00\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.2.elementCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.2.fieldUid', '\"da878ded-8b92-4d04-bf6e-78fe822b5b8e\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.2.handle', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.2.includeInCards', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.2.instructions', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.2.label', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.2.providesThumbs', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.2.required', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.2.tip', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.2.uid', '\"c3460f4e-f4b7-443a-ac13-1fb1af4dcdbd\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.2.userCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.2.warning', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.2.width', '100'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.3.dateAdded', '\"2024-12-08T16:25:08+00:00\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.3.elementCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.3.fieldUid', '\"643e2a1b-c91c-4e6a-9202-c9d35696ec1b\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.3.handle', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.3.includeInCards', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.3.instructions', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.3.label', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.3.providesThumbs', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.3.required', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.3.tip', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.3.uid', '\"f055562b-558e-4ebb-a058-b49bf98727c5\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.3.userCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.3.warning', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.3.width', '100'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.4.dateAdded', '\"2024-12-08T16:25:08+00:00\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.4.elementCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.4.fieldUid', '\"a9f99a5f-a049-46a8-bd54-4d21598bee37\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.4.handle', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.4.includeInCards', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.4.instructions', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.4.label', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.4.providesThumbs', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.4.required', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.4.tip', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.4.uid', '\"72bc741c-eecb-448e-bf54-010e82c8ad7c\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.4.userCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.4.warning', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.4.width', '100'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.5.dateAdded', '\"2024-12-08T16:26:18+00:00\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.5.elementCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.5.fieldUid', '\"5cbbc156-a371-4496-b3ac-59ef92544ad4\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.5.handle', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.5.includeInCards', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.5.instructions', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.5.label', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.5.providesThumbs', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.5.required', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.5.tip', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.5.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.5.uid', '\"5183f172-cc08-4984-ba5d-0d4ff93f9618\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.5.userCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.5.warning', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.5.width', '100'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.6.dateAdded', '\"2024-12-08T16:26:18+00:00\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.6.elementCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.6.fieldUid', '\"686f9f04-92ac-4891-aed9-17766b5ca11c\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.6.handle', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.6.includeInCards', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.6.instructions', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.6.label', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.6.providesThumbs', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.6.required', 'false'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.6.tip', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.6.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.6.uid', '\"5c5080f1-6906-4871-85fa-7a39b23011e8\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.6.userCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.6.warning', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.elements.6.width', '100'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.name', '\"Content\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.uid', '\"ae272aee-50f0-4d6b-95b8-8ea6b8310e9e\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.fieldLayouts.66f4954d-cc23-4c9c-abf2-9b4ea81bc8c0.tabs.0.userCondition', 'null'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.handle', '\"program\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.hasTitleField', 'true'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.icon', '\"calculator\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.name', '\"Program\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.showSlugField', 'true'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.showStatusField', 'true'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.slugTranslationKeyFormat', '\"\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.slugTranslationMethod', '\"site\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.titleFormat', '\"\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.titleTranslationKeyFormat', '\"\"'),
('entryTypes.91df1c71-2eec-4714-9dbf-8bca03578466.titleTranslationMethod', '\"site\"'),
('fields.357a9117-f4c9-48f2-a5d4-d379e8bc0106.columnSuffix', 'null'),
('fields.357a9117-f4c9-48f2-a5d4-d379e8bc0106.handle', '\"display\"'),
('fields.357a9117-f4c9-48f2-a5d4-d379e8bc0106.instructions', 'null'),
('fields.357a9117-f4c9-48f2-a5d4-d379e8bc0106.name', '\"Display\"'),
('fields.357a9117-f4c9-48f2-a5d4-d379e8bc0106.searchable', 'false'),
('fields.357a9117-f4c9-48f2-a5d4-d379e8bc0106.settings.default', 'true'),
('fields.357a9117-f4c9-48f2-a5d4-d379e8bc0106.settings.offLabel', 'null'),
('fields.357a9117-f4c9-48f2-a5d4-d379e8bc0106.settings.onLabel', 'null'),
('fields.357a9117-f4c9-48f2-a5d4-d379e8bc0106.translationKeyFormat', 'null'),
('fields.357a9117-f4c9-48f2-a5d4-d379e8bc0106.translationMethod', '\"none\"'),
('fields.357a9117-f4c9-48f2-a5d4-d379e8bc0106.type', '\"craft\\\\fields\\\\Lightswitch\"'),
('fields.5cbbc156-a371-4496-b3ac-59ef92544ad4.columnSuffix', 'null'),
('fields.5cbbc156-a371-4496-b3ac-59ef92544ad4.handle', '\"contentId\"'),
('fields.5cbbc156-a371-4496-b3ac-59ef92544ad4.instructions', 'null'),
('fields.5cbbc156-a371-4496-b3ac-59ef92544ad4.name', '\"Content ID\"'),
('fields.5cbbc156-a371-4496-b3ac-59ef92544ad4.searchable', 'false'),
('fields.5cbbc156-a371-4496-b3ac-59ef92544ad4.settings.byteLimit', 'null'),
('fields.5cbbc156-a371-4496-b3ac-59ef92544ad4.settings.charLimit', 'null'),
('fields.5cbbc156-a371-4496-b3ac-59ef92544ad4.settings.code', 'false'),
('fields.5cbbc156-a371-4496-b3ac-59ef92544ad4.settings.initialRows', '4'),
('fields.5cbbc156-a371-4496-b3ac-59ef92544ad4.settings.multiline', 'false'),
('fields.5cbbc156-a371-4496-b3ac-59ef92544ad4.settings.placeholder', 'null'),
('fields.5cbbc156-a371-4496-b3ac-59ef92544ad4.settings.uiMode', '\"normal\"'),
('fields.5cbbc156-a371-4496-b3ac-59ef92544ad4.translationKeyFormat', 'null'),
('fields.5cbbc156-a371-4496-b3ac-59ef92544ad4.translationMethod', '\"none\"'),
('fields.5cbbc156-a371-4496-b3ac-59ef92544ad4.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.columnSuffix', 'null'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.handle', '\"icon\"'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.instructions', 'null'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.name', '\"Icon\"'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.searchable', 'false'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.allowedKinds', 'null'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.allowSelfRelations', 'false'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.allowSubfolders', 'false'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.allowUploads', 'true'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.branchLimit', 'null'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.defaultUploadLocationSource', '\"volume:1ef4c050-d814-47c6-9dbb-2449c83d9fa7\"'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.defaultUploadLocationSubpath', 'null'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.localizeRelations', 'false'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.maintainHierarchy', 'false'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.maxRelations', '1'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.minRelations', 'null'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.previewMode', '\"full\"'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.restrictedDefaultUploadSubpath', 'null'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.restrictedLocationSource', '\"volume:1ef4c050-d814-47c6-9dbb-2449c83d9fa7\"'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.restrictedLocationSubpath', 'null'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.restrictFiles', 'false'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.restrictLocation', 'false'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.selectionLabel', 'null'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.showCardsInGrid', 'false'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.showSiteMenu', 'false'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.showUnpermittedFiles', 'false'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.showUnpermittedVolumes', 'false'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.sources', '\"*\"'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.targetSiteId', 'null'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.validateRelatedElements', 'false'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.settings.viewMode', '\"list\"'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.translationKeyFormat', 'null'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.translationMethod', '\"site\"'),
('fields.643e2a1b-c91c-4e6a-9202-c9d35696ec1b.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.columnSuffix', 'null'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.handle', '\"windowType\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.instructions', 'null'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.name', '\"Window Type\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.searchable', 'false'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.customOptions', 'false'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.0.__assoc__.0.0', '\"label\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.0.__assoc__.0.1', '\"Default\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.0.__assoc__.1.0', '\"value\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.0.__assoc__.1.1', '\"default\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.0.__assoc__.2.0', '\"default\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.0.__assoc__.2.1', '\"1\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.1.__assoc__.0.0', '\"label\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.1.__assoc__.0.1', '\"About me\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.1.__assoc__.1.0', '\"value\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.1.__assoc__.1.1', '\"about_me\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.1.__assoc__.2.0', '\"default\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.1.__assoc__.2.1', '\"\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.2.__assoc__.0.0', '\"label\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.2.__assoc__.0.1', '\"Contact\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.2.__assoc__.1.0', '\"value\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.2.__assoc__.1.1', '\"contact\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.2.__assoc__.2.0', '\"default\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.2.__assoc__.2.1', '\"\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.3.__assoc__.0.0', '\"label\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.3.__assoc__.0.1', '\"File explorer\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.3.__assoc__.1.0', '\"value\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.3.__assoc__.1.1', '\"file_explorer\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.3.__assoc__.2.0', '\"default\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.3.__assoc__.2.1', '\"\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.4.__assoc__.0.0', '\"label\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.4.__assoc__.0.1', '\"Internet explorer\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.4.__assoc__.1.0', '\"value\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.4.__assoc__.1.1', '\"internet_explorer\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.4.__assoc__.2.0', '\"default\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.4.__assoc__.2.1', '\"\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.5.__assoc__.0.0', '\"label\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.5.__assoc__.0.1', '\"Notepad\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.5.__assoc__.1.0', '\"value\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.5.__assoc__.1.1', '\"notepad\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.5.__assoc__.2.0', '\"default\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.settings.options.5.__assoc__.2.1', '\"\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.translationKeyFormat', 'null'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.translationMethod', '\"none\"'),
('fields.686f9f04-92ac-4891-aed9-17766b5ca11c.type', '\"craft\\\\fields\\\\Dropdown\"'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.columnSuffix', 'null'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.handle', '\"windowIcon\"'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.instructions', 'null'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.name', '\"Window icon\"'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.searchable', 'false'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.allowedKinds', 'null'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.allowSelfRelations', 'false'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.allowSubfolders', 'false'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.allowUploads', 'true'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.branchLimit', 'null'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.defaultUploadLocationSource', '\"volume:1ef4c050-d814-47c6-9dbb-2449c83d9fa7\"'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.defaultUploadLocationSubpath', 'null'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.localizeRelations', 'false'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.maintainHierarchy', 'false'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.maxRelations', '1'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.minRelations', 'null'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.previewMode', '\"full\"'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.restrictedDefaultUploadSubpath', 'null'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.restrictedLocationSource', '\"volume:1ef4c050-d814-47c6-9dbb-2449c83d9fa7\"'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.restrictedLocationSubpath', 'null'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.restrictFiles', 'false'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.restrictLocation', 'false'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.selectionLabel', 'null'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.showCardsInGrid', 'false'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.showSiteMenu', 'false'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.showUnpermittedFiles', 'false'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.showUnpermittedVolumes', 'false'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.sources', '\"*\"'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.targetSiteId', 'null'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.validateRelatedElements', 'false'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.settings.viewMode', '\"list\"'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.translationKeyFormat', 'null'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.translationMethod', '\"site\"'),
('fields.a9f99a5f-a049-46a8-bd54-4d21598bee37.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.da878ded-8b92-4d04-bf6e-78fe822b5b8e.columnSuffix', 'null'),
('fields.da878ded-8b92-4d04-bf6e-78fe822b5b8e.handle', '\"canBeDuplicated\"'),
('fields.da878ded-8b92-4d04-bf6e-78fe822b5b8e.instructions', 'null'),
('fields.da878ded-8b92-4d04-bf6e-78fe822b5b8e.name', '\"Can be duplicated?\"'),
('fields.da878ded-8b92-4d04-bf6e-78fe822b5b8e.searchable', 'false'),
('fields.da878ded-8b92-4d04-bf6e-78fe822b5b8e.settings.default', 'false'),
('fields.da878ded-8b92-4d04-bf6e-78fe822b5b8e.settings.offLabel', 'null'),
('fields.da878ded-8b92-4d04-bf6e-78fe822b5b8e.settings.onLabel', 'null'),
('fields.da878ded-8b92-4d04-bf6e-78fe822b5b8e.translationKeyFormat', 'null'),
('fields.da878ded-8b92-4d04-bf6e-78fe822b5b8e.translationMethod', '\"none\"'),
('fields.da878ded-8b92-4d04-bf6e-78fe822b5b8e.type', '\"craft\\\\fields\\\\Lightswitch\"'),
('fs.files.hasUrls', 'true'),
('fs.files.name', '\"Files\"'),
('fs.files.settings.path', '\"$ASSET_BASE_PATH\"'),
('fs.files.type', '\"craft\\\\fs\\\\Local\"'),
('fs.files.url', '\"$ASSET_BASE_URL\"'),
('graphql.schemas.42c395fa-2f2c-472c-a879-7dc4a5a674b4.isPublic', 'true'),
('graphql.schemas.42c395fa-2f2c-472c-a879-7dc4a5a674b4.name', '\"Public Schema\"'),
('meta.__names__.1ef4c050-d814-47c6-9dbb-2449c83d9fa7', '\"Files\"'),
('meta.__names__.357a9117-f4c9-48f2-a5d4-d379e8bc0106', '\"Display\"'),
('meta.__names__.42c395fa-2f2c-472c-a879-7dc4a5a674b4', '\"Public Schema\"'),
('meta.__names__.5cbbc156-a371-4496-b3ac-59ef92544ad4', '\"Content ID\"'),
('meta.__names__.5dbfae60-be3c-4927-8d3a-f96448c7d460', '\"portfolio-craft EN\"'),
('meta.__names__.643e2a1b-c91c-4e6a-9202-c9d35696ec1b', '\"Icon\"'),
('meta.__names__.686f9f04-92ac-4891-aed9-17766b5ca11c', '\"Window Type\"'),
('meta.__names__.6a3d40f8-2fc0-4970-83ff-d661ac632f5a', '\"portfolio-craft\"'),
('meta.__names__.91df1c71-2eec-4714-9dbf-8bca03578466', '\"Program\"'),
('meta.__names__.941efea7-0adc-4d0b-bc23-0852610418fe', '\"Programs\"'),
('meta.__names__.a9f99a5f-a049-46a8-bd54-4d21598bee37', '\"Window icon\"'),
('meta.__names__.da878ded-8b92-4d04-bf6e-78fe822b5b8e', '\"Can be duplicated?\"'),
('meta.__names__.ecbaba17-c1a7-4e70-8a37-06a312e4de04', '\"portfolio-craft\"'),
('plugins._portfolio-core.edition', '\"standard\"'),
('plugins._portfolio-core.enabled', 'true'),
('plugins._portfolio-core.schemaVersion', '\"1.0.0\"'),
('plugins.portfolio-core.edition', '\"standard\"'),
('plugins.portfolio-core.enabled', 'true'),
('plugins.portfolio-core.schemaVersion', '\"1.0.0\"'),
('plugins.vite.edition', '\"standard\"'),
('plugins.vite.enabled', 'true'),
('plugins.vite.schemaVersion', '\"1.0.0\"'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.defaultPlacement', '\"end\"'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.enableVersioning', 'true'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.entryTypes.0', '\"91df1c71-2eec-4714-9dbf-8bca03578466\"'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.handle', '\"programs\"'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.maxAuthors', '1'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.name', '\"Programs\"'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.previewTargets.0.__assoc__.0.1', '\"Primary entry page\"'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.propagationMethod', '\"all\"'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.siteSettings.5dbfae60-be3c-4927-8d3a-f96448c7d460.enabledByDefault', 'true'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.siteSettings.5dbfae60-be3c-4927-8d3a-f96448c7d460.hasUrls', 'false'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.siteSettings.5dbfae60-be3c-4927-8d3a-f96448c7d460.template', 'null'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.siteSettings.5dbfae60-be3c-4927-8d3a-f96448c7d460.uriFormat', 'null'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.siteSettings.6a3d40f8-2fc0-4970-83ff-d661ac632f5a.enabledByDefault', 'true'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.siteSettings.6a3d40f8-2fc0-4970-83ff-d661ac632f5a.hasUrls', 'false'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.siteSettings.6a3d40f8-2fc0-4970-83ff-d661ac632f5a.template', 'null'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.siteSettings.6a3d40f8-2fc0-4970-83ff-d661ac632f5a.uriFormat', 'null'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.structure.maxLevels', 'null'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.structure.uid', '\"4aeae5c9-9902-4e7d-af5f-b9c97c57d088\"'),
('sections.941efea7-0adc-4d0b-bc23-0852610418fe.type', '\"structure\"'),
('siteGroups.ecbaba17-c1a7-4e70-8a37-06a312e4de04.name', '\"portfolio-craft\"'),
('sites.5dbfae60-be3c-4927-8d3a-f96448c7d460.baseUrl', '\"$PRIMARY_SITE_URL_EN\"'),
('sites.5dbfae60-be3c-4927-8d3a-f96448c7d460.enabled', '\"1\"'),
('sites.5dbfae60-be3c-4927-8d3a-f96448c7d460.handle', '\"portfolioCraftEn\"'),
('sites.5dbfae60-be3c-4927-8d3a-f96448c7d460.hasUrls', 'true'),
('sites.5dbfae60-be3c-4927-8d3a-f96448c7d460.language', '\"en-US\"'),
('sites.5dbfae60-be3c-4927-8d3a-f96448c7d460.name', '\"portfolio-craft EN\"'),
('sites.5dbfae60-be3c-4927-8d3a-f96448c7d460.primary', 'false'),
('sites.5dbfae60-be3c-4927-8d3a-f96448c7d460.siteGroup', '\"ecbaba17-c1a7-4e70-8a37-06a312e4de04\"'),
('sites.5dbfae60-be3c-4927-8d3a-f96448c7d460.sortOrder', '2'),
('sites.6a3d40f8-2fc0-4970-83ff-d661ac632f5a.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.6a3d40f8-2fc0-4970-83ff-d661ac632f5a.enabled', 'true'),
('sites.6a3d40f8-2fc0-4970-83ff-d661ac632f5a.handle', '\"default\"'),
('sites.6a3d40f8-2fc0-4970-83ff-d661ac632f5a.hasUrls', 'true'),
('sites.6a3d40f8-2fc0-4970-83ff-d661ac632f5a.language', '\"nl\"'),
('sites.6a3d40f8-2fc0-4970-83ff-d661ac632f5a.name', '\"portfolio-craft\"'),
('sites.6a3d40f8-2fc0-4970-83ff-d661ac632f5a.primary', 'true'),
('sites.6a3d40f8-2fc0-4970-83ff-d661ac632f5a.siteGroup', '\"ecbaba17-c1a7-4e70-8a37-06a312e4de04\"'),
('sites.6a3d40f8-2fc0-4970-83ff-d661ac632f5a.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"portfolio-craft\"'),
('system.schemaVersion', '\"5.5.0.0\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.require2fa', 'false'),
('users.requireEmailVerification', 'true'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.altTranslationKeyFormat', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.altTranslationMethod', '\"none\"'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elementCondition', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.autocomplete', 'false'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.autocorrect', 'true'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.class', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.disabled', 'false'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.elementCondition', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.id', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.includeInCards', 'false'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.inputType', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.instructions', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.label', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.max', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.min', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.name', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.orientation', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.placeholder', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.providesThumbs', 'false'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.readonly', 'false'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.requirable', 'false'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.size', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.step', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.tip', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.title', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.uid', '\"e89a370c-ad2e-41c0-bbc6-0edda9d4d989\"'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.userCondition', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.warning', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.elements.0.width', '100'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.name', '\"Content\"'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.uid', '\"cc44e9ce-0227-4cb2-82a0-45b1cfac578b\"'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fieldLayouts.a7209dc5-a7ad-4b84-8fd3-7d54d3d5ec0d.tabs.0.userCondition', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.fs', '\"files\"'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.handle', '\"files\"'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.name', '\"Files\"'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.sortOrder', '1'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.subpath', '\"\"'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.titleTranslationKeyFormat', 'null'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.titleTranslationMethod', '\"site\"'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.transformFs', '\"\"'),
('volumes.1ef4c050-d814-47c6-9dbb-2449c83d9fa7.transformSubpath', '\"$ASSET_TRANSFORMED_URL\"');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `recoverycodes`
--

CREATE TABLE `recoverycodes` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `recoveryCodes` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `relations`
--

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 2, 2, NULL, 22, 1, '2024-12-08 15:22:37', '2024-12-08 15:22:37', 'c056dddf-22ec-4ce1-99e5-1ab215a51438'),
(4, 3, 2, NULL, 22, 1, '2024-12-08 15:22:37', '2024-12-08 15:22:37', '4a043e07-0e07-42fc-b0e8-4ba7ebc38c1a'),
(5, 2, 30, NULL, 22, 1, '2024-12-08 15:22:38', '2024-12-08 15:22:38', '5d5cf7fd-41a7-46fd-94e1-0182b4964035'),
(6, 3, 30, NULL, 22, 1, '2024-12-08 15:22:38', '2024-12-08 15:22:38', '7e73866f-d8bd-4137-ae92-1676d74d4354'),
(7, 2, 32, NULL, 22, 1, '2024-12-08 17:15:46', '2024-12-08 17:15:46', '059049fb-ae1d-410a-985d-75233d822719'),
(8, 3, 32, NULL, 22, 1, '2024-12-08 17:15:46', '2024-12-08 17:15:46', '365377aa-bdbe-469e-b79a-19153fb15341'),
(9, 2, 33, NULL, 24, 1, '2024-12-08 18:59:57', '2024-12-08 18:59:57', 'f4cdf93a-779e-4f73-a251-d1d718eef1fd'),
(10, 3, 33, NULL, 24, 1, '2024-12-08 19:00:05', '2024-12-08 19:00:05', 'f2892afe-ae74-4940-8062-2ab486954f99'),
(11, 2, 34, NULL, 24, 1, '2024-12-08 19:00:08', '2024-12-08 19:00:08', 'b4581afa-9443-4646-a827-8ebd30d671b1'),
(12, 3, 34, NULL, 24, 1, '2024-12-08 19:00:08', '2024-12-08 19:00:08', '9462b90e-fa0e-4c15-b037-63fa96e77d7c'),
(13, 2, 31, NULL, 27, 1, '2024-12-08 19:01:59', '2024-12-08 19:01:59', 'a49af2b7-2c63-4056-af21-a3df2f089c7b'),
(14, 3, 31, NULL, 27, 1, '2024-12-08 19:02:08', '2024-12-08 19:02:08', '7a3b9733-b6ac-4ddb-a2a9-767936d26c19'),
(15, 2, 35, NULL, 27, 1, '2024-12-08 19:02:11', '2024-12-08 19:02:11', 'e840752b-5b4c-493a-b331-667d3671f910'),
(16, 3, 35, NULL, 27, 1, '2024-12-08 19:02:11', '2024-12-08 19:02:11', 'b4a78dc5-ce23-4ae7-a66a-766091f125e6'),
(17, 2, 36, NULL, 28, 1, '2024-12-08 19:03:05', '2024-12-08 19:03:05', '1228a244-8f9c-49a9-8808-7bc79708a939'),
(18, 3, 36, NULL, 28, 1, '2024-12-08 19:03:14', '2024-12-08 19:03:14', '4934f80e-fc9b-4b80-bcc3-dcf971638fd8'),
(19, 2, 37, NULL, 28, 1, '2024-12-08 19:03:16', '2024-12-08 19:03:16', 'e58565ad-017b-4de3-a981-749d8b44d16d'),
(20, 3, 37, NULL, 28, 1, '2024-12-08 19:03:16', '2024-12-08 19:03:16', 'e032ae5a-b068-4b68-9862-4274bedba34f'),
(23, 2, 39, NULL, 27, 1, '2024-12-08 19:03:31', '2024-12-08 19:03:31', '05356281-9c60-4b1f-a0d3-457554d04b77'),
(24, 3, 39, NULL, 27, 1, '2024-12-08 19:03:31', '2024-12-08 19:03:31', 'cce8259c-e64f-45f9-af22-e3359e2b9db7'),
(25, 2, 40, NULL, 25, 1, '2024-12-08 19:04:12', '2024-12-08 19:04:12', '746e8fa4-867e-4887-b480-96fadf922db7'),
(26, 3, 40, NULL, 25, 1, '2024-12-08 19:04:22', '2024-12-08 19:04:22', '00d13324-3374-44a7-891d-ae5890ee9c69'),
(27, 2, 41, NULL, 25, 1, '2024-12-08 19:04:37', '2024-12-08 19:04:37', 'ca04a0fb-593a-4b66-a1b3-f8ccd7d13c84'),
(28, 3, 41, NULL, 25, 1, '2024-12-08 19:04:37', '2024-12-08 19:04:37', '9a901013-fc32-41f3-b3fd-d38f757a4591'),
(29, 2, 42, NULL, 26, 1, '2024-12-08 19:05:15', '2024-12-08 19:05:15', '91ad5b10-a8cf-4b36-b5f1-69edceda1b54'),
(30, 3, 42, NULL, 26, 1, '2024-12-08 19:05:24', '2024-12-08 19:05:24', '7e8e7e2c-499a-44bf-be56-4fb31746b72f'),
(31, 2, 43, NULL, 26, 1, '2024-12-08 19:05:33', '2024-12-08 19:05:33', 'ff30dade-adb7-46df-8d32-55def0901a16'),
(32, 3, 43, NULL, 26, 1, '2024-12-08 19:05:33', '2024-12-08 19:05:33', '6801d459-2123-40e8-94da-2329dcc92274'),
(33, 2, 44, NULL, 23, 1, '2024-12-08 19:06:15', '2024-12-08 19:06:15', '3af096a7-a979-4a21-83b9-f56b22054660'),
(34, 3, 44, NULL, 23, 1, '2024-12-08 19:06:26', '2024-12-08 19:06:26', '9d92104b-4662-418a-8fcb-a40711c280fc'),
(35, 2, 45, NULL, 23, 1, '2024-12-08 19:06:37', '2024-12-08 19:06:37', '04a96ed3-f1d0-4796-9dbe-651ad78b110a'),
(36, 3, 45, NULL, 23, 1, '2024-12-08 19:06:37', '2024-12-08 19:06:37', '82252c4d-8b14-4deb-a242-9aa730c2fc94'),
(37, 3, 46, NULL, 47, 1, '2024-12-09 20:12:35', '2024-12-09 20:12:35', '165a8f9f-e583-4af8-b35c-5222af055e6e'),
(38, 2, 46, NULL, 47, 1, '2024-12-09 20:13:05', '2024-12-09 20:13:05', '8617a114-19f1-4cc9-b95d-7c091c3a61f8'),
(39, 2, 48, NULL, 47, 1, '2024-12-09 20:13:10', '2024-12-09 20:13:10', '006c03b4-d5de-4369-a828-977a523f4b3a'),
(40, 3, 48, NULL, 47, 1, '2024-12-09 20:13:10', '2024-12-09 20:13:10', 'b5f6d0c8-5a0d-4786-897a-389836eddb4f'),
(43, 2, 50, NULL, 47, 1, '2024-12-09 20:15:14', '2024-12-09 20:15:14', 'd64341a4-bf6b-49cc-96ee-a7e09e8ab0f7'),
(44, 3, 50, NULL, 47, 1, '2024-12-09 20:15:14', '2024-12-09 20:15:14', '4690a56a-9b7b-4166-99de-f048340bd470'),
(47, 2, 52, NULL, 22, 1, '2024-12-09 20:37:27', '2024-12-09 20:37:27', 'ec0f5b54-1e8c-458a-acaf-a52014722e27'),
(48, 3, 52, NULL, 22, 1, '2024-12-09 20:37:27', '2024-12-09 20:37:27', '826a89bd-f416-4200-9f86-0ac55330dc9f'),
(49, 2, 53, NULL, 22, 1, '2024-12-09 20:37:55', '2024-12-09 20:37:55', 'd8724468-f4c3-411c-8e36-d840c17d1513'),
(50, 3, 53, NULL, 22, 1, '2024-12-09 20:37:55', '2024-12-09 20:37:55', 'a2d39130-c6bc-4c55-ab30-3f560e9c63b8'),
(53, 2, 55, NULL, 47, 1, '2024-12-09 21:16:03', '2024-12-09 21:16:03', 'ec9b66a4-0aff-4a7b-88c4-4170d8f075d9'),
(54, 3, 55, NULL, 47, 1, '2024-12-09 21:16:03', '2024-12-09 21:16:03', '391c5390-b652-4a68-a51c-3673394200cf');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('10aab888', '@craft/web/assets/selectize/dist'),
('15992abd', '@craft/web/assets/pluginstore/dist'),
('17bf02aa', '@craft/web/assets/tailwindreset/dist'),
('17d94b2f', '@craft/web/assets/garnish/dist'),
('1ce21ac0', '@craft/web/assets/cp/dist'),
('20d31466', '@craft/web/assets/axios/dist'),
('2d7a5b13', '@craft/web/assets/admintable/dist'),
('2f41ea06', '@craft/web/assets/utilities/dist'),
('31e5c760', '@craft/web/assets/updater/dist'),
('3826813f', '@craft/web/assets/recententries/dist'),
('3ba1e96b', '@craft/web/assets/conditionbuilder/dist'),
('3ee7694', '@craft/web/assets/focalpoint/dist'),
('3f6b7c38', '@craft/web/assets/fabric/dist'),
('4610220a', '@craft/web/assets/utilities/dist'),
('51774933', '@craft/web/assets/recententries/dist'),
('563ab434', '@craft/web/assets/fabric/dist'),
('58b40f6c', '@craft/web/assets/updater/dist'),
('58c8b029', '@craft/web/assets/sites/dist'),
('5e9e810f', '@craft/web/assets/cp/dist'),
('628e2804', '@craft/web/assets/fieldsettings/dist'),
('62af8fa9', '@craft/web/assets/axios/dist'),
('64e7fd32', '@craft/web/assets/iframeresizer/dist'),
('69cc351', '@craft/web/assets/updateswidget/dist'),
('6abfbe98', '@craft/web/assets/focalpoint/dist'),
('6d73c89', '@craft/web/assets/d3/dist'),
('6f06c0dc', '@craft/web/assets/admintable/dist'),
('6f86f485', '@craft/web/assets/d3/dist'),
('6fcd0b5d', '@craft/web/assets/updateswidget/dist'),
('79fb7084', '@craft/web/assets/selectize/dist'),
('7cc8e2b1', '@craft/web/assets/pluginstore/dist'),
('7e888323', '@craft/web/assets/garnish/dist'),
('7eeecaa6', '@craft/web/assets/tailwindreset/dist'),
('8381f3e3', '@craft/web/assets/plugins/dist'),
('85005fae', '@craft/web/assets/vue/dist'),
('8558aff1', '@craft/web/assets/editsection/dist'),
('8e37e6db', '@craft/web/assets/dashboard/dist'),
('912087f5', '@craft/web/assets/velocity/dist'),
('94b78542', '@craft/web/assets/jquerypayment/dist'),
('94e45a20', '@craft/web/assets/jquerytouchevents/dist'),
('9abc0c85', '@craft/web/assets/datepickeri18n/dist'),
('9e25081c', '@craft/web/assets/feed/dist'),
('a1303558', '@craft/web/assets/craftsupport/dist'),
('a1af7690', '@craft/web/assets/jqueryui/dist'),
('a354e29c', '@craft/web/assets/xregexp/dist'),
('a79eaf20', '@craft/web/assets/timepicker/dist'),
('a8ec5f9c', '@craft/web/assets/picturefill/dist'),
('ab48e686', '@bower/jquery/dist'),
('b45c8352', '@craft/web/assets/prismjs/dist'),
('bdfe008', '@craft/web/assets/fieldsettings/dist'),
('bfd4a03b', '@craft/web/assets/fileupload/dist'),
('c1bd9790', '@craft/web/assets/picturefill/dist'),
('c2192e8a', '@bower/jquery/dist'),
('c2f6da58', '@craft/web/assets/dbbackup/dist'),
('c7f93162', '@craft/web/assets/elementresizedetector/dist'),
('c8febe9c', '@craft/web/assets/jqueryui/dist'),
('ca052a90', '@craft/web/assets/xregexp/dist'),
('cecf672c', '@craft/web/assets/timepicker/dist'),
('d6856837', '@craft/web/assets/fileupload/dist'),
('db6353e', '@craft/web/assets/iframeresizer/dist'),
('dd0d4b5e', '@craft/web/assets/prismjs/dist'),
('e34cae97', '@craft/web/assets/craftsupport/dist'),
('e7662ed7', '@craft/web/assets/dashboard/dist'),
('ead03bef', '@craft/web/assets/plugins/dist'),
('ec0967fd', '@craft/web/assets/editsection/dist'),
('ec5197a2', '@craft/web/assets/vue/dist'),
('f3b0ac58', '@craft/web/assets/htmx/dist'),
('f3edc489', '@craft/web/assets/datepickeri18n/dist'),
('f774c010', '@craft/web/assets/feed/dist'),
('f8714ff9', '@craft/web/assets/velocity/dist'),
('fdb5922c', '@craft/web/assets/jquerytouchevents/dist'),
('fde64d4e', '@craft/web/assets/jquerypayment/dist');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `revisions`
--

INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, ''),
(2, 2, 1, 2, '“Concept 1” toegepast'),
(3, 2, 1, 3, ''),
(4, 33, 1, 1, ''),
(5, 31, 1, 1, ''),
(6, 36, 1, 1, ''),
(7, 31, 1, 2, ''),
(8, 40, 1, 1, ''),
(9, 42, 1, 1, ''),
(10, 44, 1, 1, ''),
(11, 46, 1, 1, ''),
(12, 46, 1, 2, ''),
(13, 2, 1, 4, ''),
(14, 2, 1, 5, ''),
(15, 46, 1, 3, '');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'email', 0, 1, ' tom faust hotmail com '),
(1, 'firstname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'slug', 0, 1, ''),
(1, 'username', 0, 1, ' tom '),
(2, 'slug', 0, 1, ' about me '),
(2, 'slug', 0, 2, ' about me '),
(2, 'title', 0, 1, ' about me '),
(2, 'title', 0, 2, ' about me '),
(22, 'alt', 0, 1, ''),
(22, 'alt', 0, 2, ''),
(22, 'extension', 0, 1, ' png '),
(22, 'extension', 0, 2, ' png '),
(22, 'filename', 0, 1, ' help book cool 4 png '),
(22, 'filename', 0, 2, ' help book cool 4 png '),
(22, 'kind', 0, 1, ' image '),
(22, 'kind', 0, 2, ' image '),
(22, 'slug', 0, 1, ''),
(22, 'slug', 0, 2, ''),
(22, 'title', 0, 1, ' help book cool 4 '),
(22, 'title', 0, 2, ' help book cool 4 '),
(23, 'alt', 0, 1, ''),
(23, 'alt', 0, 2, ''),
(23, 'extension', 0, 1, ' png '),
(23, 'extension', 0, 2, ' png '),
(23, 'filename', 0, 1, ' contact png '),
(23, 'filename', 0, 2, ' contact png '),
(23, 'kind', 0, 1, ' image '),
(23, 'kind', 0, 2, ' image '),
(23, 'slug', 0, 1, ''),
(23, 'slug', 0, 2, ''),
(23, 'title', 0, 1, ' contact '),
(23, 'title', 0, 2, ' contact '),
(24, 'alt', 0, 1, ''),
(24, 'alt', 0, 2, ''),
(24, 'extension', 0, 1, ' png '),
(24, 'extension', 0, 2, ' png '),
(24, 'filename', 0, 1, ' cv png '),
(24, 'filename', 0, 2, ' cv png '),
(24, 'kind', 0, 1, ' image '),
(24, 'kind', 0, 2, ' image '),
(24, 'slug', 0, 1, ''),
(24, 'slug', 0, 2, ''),
(24, 'title', 0, 1, ' cv '),
(24, 'title', 0, 2, ' cv '),
(25, 'alt', 0, 1, ''),
(25, 'alt', 0, 2, ''),
(25, 'extension', 0, 1, ' png '),
(25, 'extension', 0, 2, ' png '),
(25, 'filename', 0, 1, ' i wont forget hue png '),
(25, 'filename', 0, 2, ' i wont forget hue png '),
(25, 'kind', 0, 1, ' image '),
(25, 'kind', 0, 2, ' image '),
(25, 'slug', 0, 1, ''),
(25, 'slug', 0, 2, ''),
(25, 'title', 0, 1, ' i wont forget hue '),
(25, 'title', 0, 2, ' i wont forget hue '),
(26, 'alt', 0, 1, ''),
(26, 'alt', 0, 2, ''),
(26, 'extension', 0, 1, ' png '),
(26, 'extension', 0, 2, ' png '),
(26, 'filename', 0, 1, ' ohbees png '),
(26, 'filename', 0, 2, ' ohbees png '),
(26, 'kind', 0, 1, ' image '),
(26, 'kind', 0, 2, ' image '),
(26, 'slug', 0, 1, ''),
(26, 'slug', 0, 2, ''),
(26, 'title', 0, 1, ' ohbees '),
(26, 'title', 0, 2, ' ohbees '),
(27, 'alt', 0, 1, ''),
(27, 'alt', 0, 2, ''),
(27, 'extension', 0, 1, ' png '),
(27, 'extension', 0, 2, ' png '),
(27, 'filename', 0, 1, ' past work png '),
(27, 'filename', 0, 2, ' past work png '),
(27, 'kind', 0, 1, ' image '),
(27, 'kind', 0, 2, ' image '),
(27, 'slug', 0, 1, ''),
(27, 'slug', 0, 2, ''),
(27, 'title', 0, 1, ' past work '),
(27, 'title', 0, 2, ' past work '),
(28, 'alt', 0, 1, ''),
(28, 'alt', 0, 2, ''),
(28, 'extension', 0, 1, ' png '),
(28, 'extension', 0, 2, ' png '),
(28, 'filename', 0, 1, ' social media png '),
(28, 'filename', 0, 2, ' social media png '),
(28, 'kind', 0, 1, ' image '),
(28, 'kind', 0, 2, ' image '),
(28, 'slug', 0, 1, ''),
(28, 'slug', 0, 2, ''),
(28, 'title', 0, 1, ' social media '),
(28, 'title', 0, 2, ' social media '),
(31, 'slug', 0, 1, ' past work '),
(31, 'slug', 0, 2, ' temp deroeckyeybgsvyayjysiunlehmqswalridb '),
(31, 'title', 0, 1, ' past work '),
(31, 'title', 0, 2, ''),
(33, 'slug', 0, 1, ' cv '),
(33, 'slug', 0, 2, ' cv '),
(33, 'title', 0, 1, ' cv '),
(33, 'title', 0, 2, ' cv '),
(36, 'slug', 0, 1, ' social media '),
(36, 'slug', 0, 2, ' social media '),
(36, 'title', 0, 1, ' social media '),
(36, 'title', 0, 2, ' social media '),
(40, 'slug', 0, 1, ' i wont forget hue '),
(40, 'slug', 0, 2, ' i wont forget hue '),
(40, 'title', 0, 1, ' i wont forget hue '),
(40, 'title', 0, 2, ' i wont forget hue '),
(42, 'slug', 0, 1, ' oh bees '),
(42, 'slug', 0, 2, ' oh bees '),
(42, 'title', 0, 1, ' oh bees '),
(42, 'title', 0, 2, ' oh bees '),
(44, 'slug', 0, 1, ' contact '),
(44, 'slug', 0, 2, ' contact '),
(44, 'title', 0, 1, ' contact '),
(44, 'title', 0, 2, ' contact '),
(46, 'slug', 0, 1, ' welcome '),
(46, 'slug', 0, 2, ' welcome '),
(46, 'title', 0, 1, ' welcome '),
(46, 'title', 0, 2, ' welcome '),
(47, 'alt', 0, 1, ''),
(47, 'alt', 0, 2, ''),
(47, 'extension', 0, 1, ' png '),
(47, 'extension', 0, 2, ' png '),
(47, 'filename', 0, 1, ' windows 0 png '),
(47, 'filename', 0, 2, ' windows 0 png '),
(47, 'kind', 0, 1, ' image '),
(47, 'kind', 0, 2, ' image '),
(47, 'slug', 0, 1, ''),
(47, 'slug', 0, 2, ''),
(47, 'title', 0, 1, ' windows 0 '),
(47, 'title', 0, 2, ' windows 0 ');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `maxAuthors` smallint(6) UNSIGNED NOT NULL DEFAULT 1,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`previewTargets`)),
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `maxAuthors`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 'Programs', 'programs', 'structure', 1, 1, 'all', 'end', '[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]', '2024-07-20 14:59:29', '2024-12-08 19:01:12', NULL, '941efea7-0adc-4d0b-bc23-0852610418fe');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sections_entrytypes`
--

CREATE TABLE `sections_entrytypes` (
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sections_entrytypes`
--

INSERT INTO `sections_entrytypes` (`sectionId`, `typeId`, `sortOrder`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 2, 0, NULL, NULL, 1, '2024-07-20 14:59:29', '2024-07-20 14:59:29', '77332c36-eab6-4533-8929-d1be95894f0b'),
(2, 1, 1, 0, NULL, NULL, 1, '2024-07-20 14:59:30', '2024-07-20 14:59:30', 'e307ecfa-85fe-448d-8beb-51a48ef97464');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'iiuFDhjHGG7JNodzOA3Zr2-3-Stij1Pej5la5-unoPUawVXBfTfh5t21jv1PSH5In_slOiwCHnTa2Xi69z_pADgZxHO49aZ2yO0u', '2024-07-20 14:59:31', '2024-07-20 15:00:34', 'c8223763-5803-488a-a223-6c26955a8087'),
(2, 1, 'EYqzDfW5EZ-musQ_DVMyol_COMdBE2rgnRv5T81kAx5gu4BTgvmjAvu3MHvZTrgN2S8ikOa2b1m1Nfgt41lnpMSSwGstuGnPYMd_', '2024-08-27 19:25:40', '2024-08-27 20:10:06', '28abfa49-d3d3-4852-82c2-ad720bef6aec'),
(4, 1, 'umxTfQiHO76eMYOEZ6MuBWDniBb6Jaxx_NNXlnvhVizZ_LeXu51hNo0IEIOguvGchwuTTB-dB8jPVHvcRcPvMF94akP0cQBabMtR', '2024-12-08 15:15:53', '2024-12-08 15:54:03', 'ec8a6a64-d805-45bb-9bb5-7146a86e1e24'),
(5, 1, 'RdRvH6KIv8XeNy5_334oTrucUjHE3Op2L7BuERDxKgX-C82fPy1dmmsX9feGMAoNgdWI8PMo9pbBuYAFEPAn40dn6x4AcESnKpo5', '2024-12-08 15:57:56', '2024-12-08 16:36:36', '24c48f14-cc40-4bea-94d8-6ab79326f08b'),
(7, 1, 'vOXV3IiqnsTU0K7NFazIU0utcgnYtydnGPwRs6lnkDcMPzm1kJTF9CsZW45D7MLG0N7efFaAI7D6cwnRTsFGI7hjN3VhjixP4U3-', '2024-12-09 19:09:09', '2024-12-09 21:46:54', 'fb8a12bc-e82a-4b5e-9666-423c8c83a402');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'portfolio-craft', '2024-07-20 14:59:26', '2024-07-20 14:59:26', NULL, 'ecbaba17-c1a7-4e70-8a37-06a312e4de04');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, '1', 'portfolio-craft', 'default', 'nl', 1, '$PRIMARY_SITE_URL', 1, '2024-07-20 14:59:26', '2024-07-20 14:59:30', NULL, '6a3d40f8-2fc0-4970-83ff-d661ac632f5a'),
(2, 1, 0, '1', 'portfolio-craft EN', 'portfolioCraftEn', 'en-US', 1, '$PRIMARY_SITE_URL_EN', 2, '2024-07-20 14:59:26', '2024-07-20 14:59:26', NULL, '5dbfae60-be3c-4927-8d3a-f96448c7d460');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sso_identities`
--

CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `structureelements`
--

INSERT INTO `structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, NULL, 1, 1, 18, 0, '2024-12-08 19:01:12', '2024-12-09 20:09:07', 'ee7079f3-2b58-410d-97d7-23eb9c530b8a'),
(2, 1, 2, 1, 2, 3, 1, '2024-12-08 19:01:12', '2024-12-08 19:01:12', '256f5e90-e948-46a1-960a-0570d7fe8104'),
(3, 1, 31, 1, 6, 7, 1, '2024-12-08 19:01:12', '2024-12-08 19:02:26', '54d328ec-8f32-4792-80de-7a09d2268358'),
(4, 1, 33, 1, 4, 5, 1, '2024-12-08 19:01:12', '2024-12-08 19:02:26', '665adeab-aee9-4ee2-be2a-9b2c2325ca18'),
(5, 1, 36, 1, 8, 9, 1, '2024-12-08 19:02:27', '2024-12-08 19:02:27', '435d5a83-1d4a-4445-9b9e-1d39bac76833'),
(6, 1, 40, 1, 10, 11, 1, '2024-12-08 19:03:37', '2024-12-08 19:03:37', 'f2e844f9-fa6c-4df0-a81a-818e0483da44'),
(7, 1, 42, 1, 12, 13, 1, '2024-12-08 19:04:44', '2024-12-08 19:04:44', '03de0a4b-a099-4a0d-92a6-d9f62411bfd7'),
(8, 1, 44, 1, 14, 15, 1, '2024-12-08 19:05:54', '2024-12-08 19:05:54', 'c8dd51e0-803d-4c7d-abff-3bead1c9e391'),
(9, 1, 46, 1, 16, 17, 1, '2024-12-09 20:09:06', '2024-12-09 20:09:06', '31ef3753-bba0-44b5-bc9d-05f6805e87e9');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `structures`
--

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, '2024-12-08 19:01:12', '2024-12-08 19:01:12', NULL, '4aeae5c9-9902-4e7d-af5f-b9c97c57d088');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`preferences`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"nl\"}');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `photoId`, `active`, `pending`, `locked`, `suspended`, `admin`, `username`, `fullName`, `firstName`, `lastName`, `email`, `password`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`) VALUES
(1, NULL, 1, 0, 0, 0, 1, 'Tom', NULL, NULL, NULL, 'tom.faust@hotmail.com', '$2y$13$H.RDCJt87zDP9JKs1Wpt3ujm3ukCZAvmwhQH.py6caSDH0oDFhJeq', '2024-12-09 19:09:09', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2024-07-20 14:59:31', '2024-07-20 14:59:31', '2024-12-09 19:09:09');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `volumefolders`
--

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Files', NULL, '2024-07-20 14:59:29', '2024-07-20 14:59:29', '2d4f8a58-fce6-4b19-ac75-b5d089db6489'),
(2, NULL, NULL, 'Tijdelijke uploads', NULL, '2024-12-08 14:20:16', '2024-12-08 14:20:16', 'c5aeb65e-fdc2-4301-9371-b445c4b62200'),
(3, 2, NULL, 'user_1', 'user_1/', '2024-12-08 14:20:16', '2024-12-08 14:20:16', 'a7bd13d7-f2d2-44ee-a504-788a64ff64de'),
(4, 1, 1, 'Desktop-icons', 'Desktop-icons/', '2024-12-08 14:23:55', '2024-12-08 14:23:55', 'a5c3ce6a-2d64-45b2-aa72-70e5467f3515');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `volumes`
--

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `fs`, `subpath`, `transformFs`, `transformSubpath`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `altTranslationMethod`, `altTranslationKeyFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 2, 'Files', 'files', 'files', '', '', '$ASSET_TRANSFORMED_URL', 'site', NULL, 'none', NULL, 1, '2024-07-20 14:59:29', '2024-07-20 14:59:29', NULL, '1ef4c050-d814-47c6-9dbb-2449c83d9fa7');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `webauthn`
--

CREATE TABLE `webauthn` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text DEFAULT NULL,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2024-07-20 14:59:35', '2024-07-20 14:59:35', '772afd8c-2f88-42f2-808b-149a057a4f14'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2024-07-20 14:59:35', '2024-07-20 14:59:35', 'bf29d082-6b86-417d-9d55-b6976e6a6656'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2024-07-20 14:59:35', '2024-07-20 14:59:35', '1a167364-cc3e-4201-946d-07415aa14842'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2024-07-20 14:59:35', '2024-07-20 14:59:35', '1383969b-feb8-40a1-b080-37f73504c1ac');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_edvuuybzuhxvdplqctqxgbzaemrmoildokbc` (`primaryOwnerId`);

--
-- Indexen voor tabel `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wymjndhatwxoutuifpwnwfzrampfrzilabdc` (`userId`,`unread`,`dateRead`,`dateCreated`),
  ADD KEY `idx_tqngtccvsrhqvczufirazqmxjmddxizsfjdv` (`dateRead`),
  ADD KEY `fk_edurkgsaovkwlmewvjbeddzapfklghjslult` (`pluginId`);

--
-- Indexen voor tabel `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_klhjkzhxsfthyfdxuvjvpqsuitqrhttxvmqn` (`sessionId`,`volumeId`),
  ADD KEY `idx_mhuosdexftgrmrcscmqrrintmwpmftggflnu` (`volumeId`);

--
-- Indexen voor tabel `assetindexingsessions`
--
ALTER TABLE `assetindexingsessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ugxejpeqbbydifwizudnwqvuanabosfpcjth` (`filename`,`folderId`),
  ADD KEY `idx_eiptokdcgvtfdigybliyhbdvgskmdiszxpwg` (`folderId`),
  ADD KEY `idx_oxyxayuhiahmauljkhikgxmiegalbtgipept` (`volumeId`),
  ADD KEY `fk_zycxrrorfirukvznbxgnxhsrezwdhitjpbpi` (`uploaderId`);

--
-- Indexen voor tabel `assets_sites`
--
ALTER TABLE `assets_sites`
  ADD PRIMARY KEY (`assetId`,`siteId`),
  ADD KEY `fk_daehlxrrnjizdvfwoscwzzczsnbmqsypmeqm` (`siteId`);

--
-- Indexen voor tabel `authenticator`
--
ALTER TABLE `authenticator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_zvhzdesklcryzezzlvrjmwtxkgxhfcjxjfax` (`userId`);

--
-- Indexen voor tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mypzjlvsdbtxzhybcxbkuxlqsaftccvtodth` (`groupId`),
  ADD KEY `fk_nijcicluohmqafepdhbohcweiwtbfyqmxunk` (`parentId`);

--
-- Indexen voor tabel `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_luiegexmbtscptddjneibkjzaudjtbmmfitf` (`name`),
  ADD KEY `idx_zfaxaezfwndgsyqquhwkrwnlprpftmixmatc` (`handle`),
  ADD KEY `idx_vxcvkidqwriuoikjfystehnxaruvsdfucahv` (`structureId`),
  ADD KEY `idx_mtjqhtopnldxcwbssrftthdapilvscixjcpn` (`fieldLayoutId`),
  ADD KEY `idx_fgrduhfyrgpgoolzvbstzkbsdqohpselgtyg` (`dateDeleted`);

--
-- Indexen voor tabel `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_vmiehvredeqxzpfppqbcaynwpnnzuqssutfp` (`groupId`,`siteId`),
  ADD KEY `idx_fnzbufebmtzbcvjqvhmgdpdmhrjzrynficsh` (`siteId`);

--
-- Indexen voor tabel `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `idx_paigzzehpuseuhfjrlwcstluvbggqmabugtt` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_stzuaniqqtptknyifzezkwcwquaxrrzywtpm` (`siteId`),
  ADD KEY `fk_zabprojyyhwybtmfazxjzwtjmuqlwsshrwub` (`userId`);

--
-- Indexen voor tabel `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  ADD KEY `idx_cjdykvqdornwzhleumflvbxqrykyrlzseypl` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_zrkigkudlaplyjnbyendzndlvgpfpuoswnyi` (`siteId`),
  ADD KEY `fk_sjruelowsacxkngzwbthyowpchpmsqlarbjs` (`fieldId`),
  ADD KEY `fk_okhzjugcuqbjmxbacivvjdohhyswmlcxjjnv` (`userId`);

--
-- Indexen voor tabel `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ucajbfgzqbqktucqbpsvttvxblvtupyxocsg` (`userId`);

--
-- Indexen voor tabel `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_koytnicfsgundcdujdotekfwktuynljeewnk` (`key`,`fingerprint`);

--
-- Indexen voor tabel `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cmsjligfgukbhdhgkmzmoeycbrohtkrikhrg` (`creatorId`,`provisional`),
  ADD KEY `idx_htscncnivfwmokrxsnroyojlosazbcpzbtza` (`saved`),
  ADD KEY `fk_entoicjccagrzwxnrxadgfkgeqtaogvraiig` (`canonicalId`);

--
-- Indexen voor tabel `elementactivity`
--
ALTER TABLE `elementactivity`
  ADD PRIMARY KEY (`elementId`,`userId`,`type`),
  ADD KEY `idx_pcztaimbgkiykkctijiuftfpbsjeuvqrsmoc` (`elementId`,`timestamp`,`userId`),
  ADD KEY `fk_pmcmfoevgpzvjtcwaqxlrajnkwfkaqpklpwr` (`userId`),
  ADD KEY `fk_mxrokfpplheorcmryudxxhbrikzykqsjgxwi` (`siteId`),
  ADD KEY `fk_xsghpmxavatszykcpurtnxkvxyxgtymhluij` (`draftId`);

--
-- Indexen voor tabel `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_eofzknnzocmmaxyrtafcdvvzflggbyeyxfvt` (`dateDeleted`),
  ADD KEY `idx_devheosxjlhuhqdbmrirhozxwmpzjnrvgwht` (`fieldLayoutId`),
  ADD KEY `idx_nurctwrrxsvgeyflgnfgxdirlpzwyowprdcp` (`type`),
  ADD KEY `idx_gwgbgrvryqazqcjylaihmdtyzlhnuehqnzhd` (`enabled`),
  ADD KEY `idx_vtqmexezfrkxpbqwyrnqawlhxdjpbdpedkoh` (`canonicalId`),
  ADD KEY `idx_hxbflmeelyebiddujqshnzgrhfuaxoczfvsp` (`archived`,`dateCreated`),
  ADD KEY `idx_zvrlsvysbanibehizyxxixgxqgyjhevokvwv` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  ADD KEY `idx_djqvleznqgbsxzrrhmkhqjesxzzxvajzzxtv` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  ADD KEY `fk_umvwyzfkfzewhoyqzyccjldnjztmtdwaktng` (`draftId`),
  ADD KEY `fk_lidkcbdyyjdjkfgegjyynvoxkpbodjndkgif` (`revisionId`);

--
-- Indexen voor tabel `elements_bulkops`
--
ALTER TABLE `elements_bulkops`
  ADD PRIMARY KEY (`elementId`,`key`),
  ADD KEY `idx_oswwffokmlnkiwqubcoloxluebjkdstsftyt` (`timestamp`);

--
-- Indexen voor tabel `elements_owners`
--
ALTER TABLE `elements_owners`
  ADD PRIMARY KEY (`elementId`,`ownerId`),
  ADD KEY `fk_ovifojnsnhmmupmgdranjqzfanzshsejwqlx` (`ownerId`);

--
-- Indexen voor tabel `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_bhyzssrhqjfgfcgmgzlbdcjbudonsxysqdby` (`elementId`,`siteId`),
  ADD KEY `idx_nvnmavahwrtmjeudcovnqyycskwihzxxdcww` (`siteId`),
  ADD KEY `idx_btyznbekskrrfcecullerwqjifcfskkxnegr` (`title`,`siteId`),
  ADD KEY `idx_irjreoqppfxehtjicglnukmbatoqczebpqma` (`slug`,`siteId`),
  ADD KEY `idx_kchhiiiqravuvfczhbwsamlpvgyyuogvehkz` (`enabled`),
  ADD KEY `idx_jahutgiqjxugvfkvirlzwwemdumzdboqexlf` (`uri`,`siteId`);

--
-- Indexen voor tabel `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vrawerjzujoqdxyaiuporhnhtsfbcmyywgju` (`postDate`),
  ADD KEY `idx_agxuzdgjtmxxibcjcqjejiiwjxjutktvskdt` (`expiryDate`),
  ADD KEY `idx_ljnksrzdenfcsrbcjdhjqrhqaaxzxwhspfep` (`sectionId`),
  ADD KEY `idx_gucwewzksaixkzyjdgaxqbydupvdqbflghnx` (`typeId`),
  ADD KEY `idx_zfhsaftyqcbpaqhldhlxyazknnljgpnegkzi` (`primaryOwnerId`),
  ADD KEY `idx_qjailhfjfrfsvldbfftosszcremzvpiudokm` (`fieldId`),
  ADD KEY `fk_gmzxoggmpdeusedmmfskngldfkrnhldfndvs` (`parentId`);

--
-- Indexen voor tabel `entries_authors`
--
ALTER TABLE `entries_authors`
  ADD PRIMARY KEY (`entryId`,`authorId`),
  ADD KEY `idx_eaniobjcmsbulnwimmobpbenkaejadylaxfc` (`authorId`),
  ADD KEY `idx_hpjsjyxkjnxovehqxyvljpydngcvdejdvwok` (`entryId`,`sortOrder`);

--
-- Indexen voor tabel `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zpheqjyxtdfmgtgcjrrwkwngdodjuoysddfw` (`fieldLayoutId`),
  ADD KEY `idx_uhsccijxxigwfdxkkxmbpvzymwktkagvfcgu` (`dateDeleted`);

--
-- Indexen voor tabel `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uoapjejekrepvrwpifazcyfqgkfvwerbqokt` (`dateDeleted`),
  ADD KEY `idx_laxkflptuyqdukvznwnzhbhsfomyndmhpxxr` (`type`);

--
-- Indexen voor tabel `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zajyahwdawoituwdlbqqjgiqocsgfhnbhrit` (`handle`,`context`),
  ADD KEY `idx_wrohtwuekceiizvhhjzeliszgbdbzmykdfsl` (`context`),
  ADD KEY `idx_dwzhmetqthbjjvcqgaxrabwjjiafmdklzdtf` (`dateDeleted`);

--
-- Indexen voor tabel `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_igyqfofjwzuhxnnoixhfgjabzmuyvbzqzlzh` (`name`),
  ADD KEY `idx_upyaqzuwrrinficihqdctqrlyvtbhqsyyvho` (`handle`),
  ADD KEY `idx_xscxigpqjjumuylebuvgtumdfnsfmnqnygmp` (`fieldLayoutId`),
  ADD KEY `idx_dehwstwzrtpzqrvukjcoxeuxtxtqrjbgibnx` (`sortOrder`);

--
-- Indexen voor tabel `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_gkdugpkjvprmzixmlybyvpmygypiecyilhug` (`accessToken`),
  ADD UNIQUE KEY `idx_tqawbrdfsjclnfefhiqxuclbkmnalnlizvuk` (`name`),
  ADD KEY `fk_npmuufwrtafwpdrrxjrqhjjrswqilgsxjpmo` (`schemaId`);

--
-- Indexen voor tabel `imagetransformindex`
--
ALTER TABLE `imagetransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_negbfuqmyrzasxqeojfnwiwiuwxabjmyzfhw` (`assetId`,`transformString`);

--
-- Indexen voor tabel `imagetransforms`
--
ALTER TABLE `imagetransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_chfzpxzwfrhbpcmtpyhvqfdweisrtfzsbjbs` (`name`),
  ADD KEY `idx_uqwwvokflbiqpkzpadritzzkkqdnhghrhqno` (`handle`);

--
-- Indexen voor tabel `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_grlbtljmlyhngdtoxmsfpymfquyqnalbyaqo` (`track`,`name`);

--
-- Indexen voor tabel `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_lkvpypjoqhmytpqcbwrlvroxwfaaxouinizg` (`handle`);

--
-- Indexen voor tabel `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexen voor tabel `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hbanmjkgsesrncandslculpkmxykbhrcwjbv` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `idx_fghrgknmlcqmrtijlniamlstyyqlnkxvapkp` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexen voor tabel `recoverycodes`
--
ALTER TABLE `recoverycodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ezpppzmosexvpofrmidoxrljqbhnlxjfvkrn` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `idx_plqqeplmqjeuwmghwitqdrcjclnseklyanlc` (`sourceId`),
  ADD KEY `idx_onbshrzyxfejdbliwfiymydujpbjvghaaxzc` (`targetId`),
  ADD KEY `idx_fimkmqgofcgwybtbvkykjfngtghozrxnnejd` (`sourceSiteId`);

--
-- Indexen voor tabel `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexen voor tabel `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_tzvbjzdbedauiawxwcxsgihpwxpkgtdzvpeh` (`canonicalId`,`num`),
  ADD KEY `fk_iezkbhkgmuoszlgsxszjqnvgyahvfmgxbrcv` (`creatorId`);

--
-- Indexen voor tabel `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `idx_sjxtqrreqpthqzayxjpujqumtyrxgzbjcquo` (`keywords`);

--
-- Indexen voor tabel `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zxinuowcdgganjwqfglvnbabfpltjmaqunnw` (`handle`),
  ADD KEY `idx_bfchcxueuybdbcsfyqfrcetlkjbcbhxomwuq` (`name`),
  ADD KEY `idx_pfffvjshxlouynlfniqfnukmjoorhmrmxzyc` (`structureId`),
  ADD KEY `idx_uwmirwntqpeieytokhembvkxvfctlqdobkmo` (`dateDeleted`);

--
-- Indexen voor tabel `sections_entrytypes`
--
ALTER TABLE `sections_entrytypes`
  ADD PRIMARY KEY (`sectionId`,`typeId`),
  ADD KEY `fk_dzspdirbmgbpzxbexolftjzmwgkazzujlhrj` (`typeId`);

--
-- Indexen voor tabel `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_goiswbrklybwjkivnaizzaupdivdfkfnrbcq` (`sectionId`,`siteId`),
  ADD KEY `idx_ikzlexqckmxrzbcpsdybckvjukmxfiifuntl` (`siteId`);

--
-- Indexen voor tabel `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexen voor tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jwutksbfwukufhoycuclbdhqpsyalugglwid` (`uid`),
  ADD KEY `idx_sjjkfhntxuwkrsenigbgmwxodynujqyxdzte` (`token`),
  ADD KEY `idx_gkyxphreeftohtsiujuofjrrsfvjuqydqqat` (`dateUpdated`),
  ADD KEY `idx_tmllnhnwnkpmlemcxwkefeqzwycdlihcjzko` (`userId`);

--
-- Indexen voor tabel `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_jyphllhrqnvkfqmvwyfiajybjkglclwkorha` (`userId`,`message`);

--
-- Indexen voor tabel `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_yfhhtithcxdljbkogzwvqxxsuhhzefkizmni` (`name`);

--
-- Indexen voor tabel `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_htpyvlutowqaujungseeqkjuruqzumcklsqp` (`dateDeleted`),
  ADD KEY `idx_iieyiclccuoerwalgdhwtauidmslbgcezxro` (`handle`),
  ADD KEY `idx_plswhmyqhgukpoqvfiwbpirfjcfwdujxvlsc` (`sortOrder`),
  ADD KEY `fk_odovdvxtlycukjcribtpjxhwodihnmyhceme` (`groupId`);

--
-- Indexen voor tabel `sso_identities`
--
ALTER TABLE `sso_identities`
  ADD PRIMARY KEY (`provider`,`identityId`,`userId`),
  ADD KEY `fk_kivgjxmirzqfokjjeycwfujilksypzqktxzo` (`userId`);

--
-- Indexen voor tabel `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_gfzffsxquligenooxmooduwajkkhktujmung` (`structureId`,`elementId`),
  ADD KEY `idx_bxqjodwsgqcytswdcnrlwdcshfbqguqegzho` (`root`),
  ADD KEY `idx_sngaafwikplqgiysrxkhyysrtxvajyhdoxuu` (`lft`),
  ADD KEY `idx_fxwkvyxilszkxlcbhophqocbbqxxcdcqnopj` (`rgt`),
  ADD KEY `idx_tzqfaxqclrfhzdfejsmczltalnlxzwccwjsv` (`level`),
  ADD KEY `idx_deiyuxkacipisvvyikxrcahamnelmejfspqg` (`elementId`);

--
-- Indexen voor tabel `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_xmsavddatjgvtgmejcrwjiujztoxiipumtxt` (`dateDeleted`);

--
-- Indexen voor tabel `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_gmsplnefuysudxmzxcmehxknagdwfditknje` (`key`,`language`),
  ADD KEY `idx_awrfsashctkhravguyayrfseclstpubybmdj` (`language`);

--
-- Indexen voor tabel `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jlusjypddgycryljvybpkewjhsekjhvzlhly` (`name`),
  ADD KEY `idx_hozlmitpfpafpjnbeifoybyesrrepmxbenfc` (`handle`),
  ADD KEY `idx_bufcstscvbqdrrlfnsrvagpivkpvkatwnecr` (`dateDeleted`),
  ADD KEY `fk_ybptvgawtcftvytgipstbyvzrfswkwepuisd` (`fieldLayoutId`);

--
-- Indexen voor tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wfknmtnwfpewaaqisgjhwbsnkpycgxruuzqa` (`groupId`);

--
-- Indexen voor tabel `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_mxwktrbbbzncxsjxuxdzziopgfgmkzqgekmp` (`token`),
  ADD KEY `idx_zudputmfnocesufcvpnowrqhpfvifymnzrqk` (`expiryDate`);

--
-- Indexen voor tabel `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zjzdgjczrwqglgvuaqksdzbmipxbvxkuewwe` (`handle`),
  ADD KEY `idx_oxnhioffdyftneotfkpdqxeekxgjxkwkymxl` (`name`);

--
-- Indexen voor tabel `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_jwxhehcrgwvmlpldhhkjenzjqmlovjbhrwql` (`groupId`,`userId`),
  ADD KEY `idx_xwmoeytdehwoedqfictxhfikjcirrdlzbuof` (`userId`);

--
-- Indexen voor tabel `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_gwxogtixomtfrreyspxnoglztgoibmrsitsb` (`name`);

--
-- Indexen voor tabel `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_uqvilixdjyozxcoxooornpngpnuzuswcqkoo` (`permissionId`,`groupId`),
  ADD KEY `idx_ysrmygogfyrivqnnhkingngltgdibkyuxzio` (`groupId`);

--
-- Indexen voor tabel `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_edfpvabkioufbnmeyfopxytufcjkbekkgryu` (`permissionId`,`userId`),
  ADD KEY `idx_dlsohfnlyivjhoukxftnjgnkdvnnimwrhejw` (`userId`);

--
-- Indexen voor tabel `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jbbygedsjbjkqlerqzwjxbqwyptjqdslavqa` (`active`),
  ADD KEY `idx_sfgkfqcotnusyyoyywilcgthmrakvzosnkoi` (`locked`),
  ADD KEY `idx_uzrxlespiuuybufwoytrptdlhxrujqlbdstj` (`pending`),
  ADD KEY `idx_fdedfvbxgifklukajijtpxecfgugdxslvprs` (`suspended`),
  ADD KEY `idx_yvvesayjbixhhrnskerxqqfauaayfeclvdkr` (`verificationCode`),
  ADD KEY `idx_moruxufhfqxaldyuloatcqehaonmwbspirxa` (`email`),
  ADD KEY `idx_bluqogfatkrwzspiyxyqsmwunwwtnhsfkowg` (`username`),
  ADD KEY `fk_cispedwebwkktbjbpadxqcqhhnxzytrebuwv` (`photoId`);

--
-- Indexen voor tabel `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_xgtwxdghghlyrigigypeiioethlelxyoayls` (`name`,`parentId`,`volumeId`),
  ADD KEY `idx_askbzgrglucfmkvzmkcbzlpwjavqlwierfae` (`parentId`),
  ADD KEY `idx_oyemzpqbevdllcubwdoukrsxmgarhxyzsakq` (`volumeId`);

--
-- Indexen voor tabel `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_yrdyvnnznctqiokhzyrrrwllruhwlpbpzqek` (`name`),
  ADD KEY `idx_srsykyhvvxnvzdmnobadvtdgifkrpdfcjqae` (`handle`),
  ADD KEY `idx_hiydjhkljcudhfdvbwicdgwhlckbsgsuzlhd` (`fieldLayoutId`),
  ADD KEY `idx_muzyvryzemzwlqarndtcsehmbxyufvfyeurp` (`dateDeleted`);

--
-- Indexen voor tabel `webauthn`
--
ALTER TABLE `webauthn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cljmwkeydoyhxpuyzfzdgbphqisqdursmblj` (`userId`);

--
-- Indexen voor tabel `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ueqtmsjhxczffmsrymcncwjseeviyysqqjgc` (`userId`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `assetindexingsessions`
--
ALTER TABLE `assetindexingsessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `authenticator`
--
ALTER TABLE `authenticator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT voor een tabel `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT voor een tabel `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT voor een tabel `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `imagetransformindex`
--
ALTER TABLE `imagetransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT voor een tabel `imagetransforms`
--
ALTER TABLE `imagetransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT voor een tabel `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT voor een tabel `recoverycodes`
--
ALTER TABLE `recoverycodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT voor een tabel `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT voor een tabel `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT voor een tabel `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `webauthn`
--
ALTER TABLE `webauthn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_edvuuybzuhxvdplqctqxgbzaemrmoildokbc` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jrglepzxzzztgzszzmcpdazeiqseuemocrzg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_edurkgsaovkwlmewvjbeddzapfklghjslult` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mpskbrqaeywuhyfelhuurgzshbythpcubvoz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `fk_hltkuxmzgqmnqgajlixujxkgbvorsjrvcgnx` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_owcruuqrwxbimmldyfoxqozolhqehpvstjoi` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_csbycznsejwlqipgwjihbuxlnkkywxgxbntn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gzrtbqwdzaabjxciwppjihvgnmdonrkwlxvt` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_qazfqxcxzgtswrokxmsbswkfgszaxmqmilmy` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zycxrrorfirukvznbxgnxhsrezwdhitjpbpi` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `assets_sites`
--
ALTER TABLE `assets_sites`
  ADD CONSTRAINT `fk_daehlxrrnjizdvfwoscwzzczsnbmqsypmeqm` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ljzpizgsitveanjtrlfuwnteanjmbqbobebm` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `authenticator`
--
ALTER TABLE `authenticator`
  ADD CONSTRAINT `fk_zvhzdesklcryzezzlvrjmwtxkgxhfcjxjfax` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_nijcicluohmqafepdhbohcweiwtbfyqmxunk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_otoabbkvgwfsejcpxejtprdnmdickmizxhcc` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tklfmtrfoldoagjhvyionprymjclptyehnby` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `fk_jqorytsmkxzprfdrmltcptdnzxqrlshrwbnc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_vfxxgkexsbxsqkhlihbchppiyfdkwbctoeyq` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `fk_ulrjeuibekexuzicsvatufedpzeflpdmofpk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zlnmuuazlddlloppaxxrbpcbbiwrfxdtnzxs` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `fk_gwrxbnoedjrsncyfbmpacjcvjneonadruqon` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_stzuaniqqtptknyifzezkwcwquaxrrzywtpm` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zabprojyyhwybtmfazxjzwtjmuqlwsshrwub` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `fk_okhzjugcuqbjmxbacivvjdohhyswmlcxjjnv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sjruelowsacxkngzwbthyowpchpmsqlarbjs` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vokmvwwagjlscnrsvgediywqaeidsgpfpmme` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zrkigkudlaplyjnbyendzndlvgpfpuoswnyi` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `fk_ucajbfgzqbqktucqbpsvttvxblvtupyxocsg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `fk_entoicjccagrzwxnrxadgfkgeqtaogvraiig` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gomudxbzgyddujzqdwfdgpfaovrauttmavhg` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `elementactivity`
--
ALTER TABLE `elementactivity`
  ADD CONSTRAINT `fk_mxrokfpplheorcmryudxxhbrikzykqsjgxwi` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pmcmfoevgpzvjtcwaqxlrajnkwfkaqpklpwr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vnjdmtqnprufkysxitswsxxjxkhqqjokbiry` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xsghpmxavatszykcpurtnxkvxyxgtymhluij` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `fk_lidkcbdyyjdjkfgegjyynvoxkpbodjndkgif` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_umvwyzfkfzewhoyqzyccjldnjztmtdwaktng` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wwasnumwgpqftpiixamjaiszohyzekfpzmni` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_ykmcrhawqebudecwfxtfzcbzkotpmcsxmljv` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `elements_owners`
--
ALTER TABLE `elements_owners`
  ADD CONSTRAINT `fk_ovifojnsnhmmupmgdranjqzfanzshsejwqlx` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tihbkvkswfytpcxquuaukenpwbncqpsjfogc` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `fk_jaggdkgznqmsdtmztagsugksgznnkztuwaqd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_npxwbboruktwqernpfozfopayndivfialpua` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `fk_esqizlthovantrsfoviunotkxxxfcujpgpkl` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_frfuxtylmhwyintcctpljbytihtpxxfysupz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ghkvytiehdfavxuviedczbawwyihftuhotvg` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gmzxoggmpdeusedmmfskngldfkrnhldfndvs` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_ltezjcbcnxswmnvzopskvfajqgwqoqkwcszi` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_lwkdcjylmztwhqkzilqdohnfzotnhaitytiw` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `entries_authors`
--
ALTER TABLE `entries_authors`
  ADD CONSTRAINT `fk_hudlzxwsbnvfrahbihxsrfjnbjiagronuskd` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_marqicqsofdmoxwfulbcjuadvjpavzmlgzdh` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `fk_lxnpoimltnproxhiiahxrmoyrpcmwphxobwi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `fk_kmnechjmrqotpabduqunyahtppcegkswblhr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tbhbmahagpwtgxosneelktawgvupkziskmmd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `fk_npmuufwrtafwpdrrxjrqhjjrswqilgsxjpmo` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `fk_igrcrpnyjerdyomnuzpvcjegjhuyvjnldzfo` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jdlwxikmrxgzszrwmnmywkosnhsphhjtkkfc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jhqjovzmjebbhrizgzusykivrhgzladrwwbt` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `fk_iezkbhkgmuoszlgsxszjqnvgyahvfmgxbrcv` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_jombxfahcoyusjpjnjsnwwxruwwfstubbvhl` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_tzfzpedqyztokkzrormmsorhftdqaogtlqrv` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `sections_entrytypes`
--
ALTER TABLE `sections_entrytypes`
  ADD CONSTRAINT `fk_dzspdirbmgbpzxbexolftjzmwgkazzujlhrj` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jrbpjaprqinqadzabkxifcpusyizcsgchfpl` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `fk_eztsbdcwnwyltvrzuwutxiqwvjfwlahyrdfz` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hsxnyfdflgwozhycocmcfszjhgxbpnylsyrt` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_gjhpdlxkdwjpzqdgvpibbryjjoaeiotsosjf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `fk_jhkeasflaslourecnbdvsoyrikeltwqcficz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `fk_odovdvxtlycukjcribtpjxhwodihnmyhceme` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `sso_identities`
--
ALTER TABLE `sso_identities`
  ADD CONSTRAINT `fk_kivgjxmirzqfokjjeycwfujilksypzqktxzo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `fk_ruukcsxolzibrovilonkwppkvnhmaaxqbput` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `fk_ybptvgawtcftvytgipstbyvzrfswkwepuisd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_jqfmlegaqbejolnzbekpjrujysshsofyjkue` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pgyrxcqsxbqtiwsmtdhpgmvhfpvqjgemauut` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `fk_cairoihyukeaeyauaorenjnsoggdwnlnuuzg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_njhplrvxmyylxjcfgupurkdftrwhwknzmdzp` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `fk_cmngdebobbftcmxifpacsipuoncwdjdkfzlz` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_euxnokxvwkgwjfigfjzdywcabndcqfmsgnta` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `fk_ifamghlupleciigprnelaebypgehrgeoeihd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_iionjjgvkljcafniyqfqneguxlwmjtuydcam` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `fk_ozgclofahqlrwmgrxiwrkhjvppgykktkuqiv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_cispedwebwkktbjbpadxqcqhhnxzytrebuwv` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_llehhyvnljsiffojxpaaaweosbeucfmrccuk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `fk_dqfaymvfspsdnefokvyvfyuhekhsvqrlwkaj` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nabhwcbhegtehudvoqgbeqomnampetytihju` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `fk_xiuhcbdsodesovbgmxcoxpwajdmukvfkdzgt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `webauthn`
--
ALTER TABLE `webauthn`
  ADD CONSTRAINT `fk_cljmwkeydoyhxpuyzfzdgbphqisqdursmblj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `fk_iiwugjoguhtcxicuzxtdlwnvybllkpbymdgu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
