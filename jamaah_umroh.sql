-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2026 at 03:16 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jamaah_umroh`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `old_data` longtext COLLATE utf8mb4_unicode_ci,
  `new_data` longtext COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `module`, `action`, `description`, `old_data`, `new_data`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(1, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":31,\"nama\":\"coba garuda\",\"tanggal\":\"2026-05-14\",\"quota\":10,\"hotel_id\":3,\"maskapai_id\":2,\"created_at\":\"2026-05-13T07:23:03.000000Z\",\"updated_at\":\"2026-05-14T15:55:01.000000Z\"}', '{\"id\":31,\"nama\":\"coba garuda\",\"tanggal\":\"2026-05-14\",\"quota\":\"1000\",\"hotel_id\":\"2\",\"maskapai_id\":\"1\",\"created_at\":\"2026-05-13T07:23:03.000000Z\",\"updated_at\":\"2026-05-14T16:44:12.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 09:44:12', '2026-05-14 09:44:12'),
(2, 1, 'paket_umroh', 'DELETE', 'Menghapus paket umroh', '{\"id\":27,\"nama\":\"P\",\"tanggal\":\"2026-05-12\",\"quota\":100,\"hotel_id\":3,\"maskapai_id\":1,\"created_at\":\"2026-05-12T14:13:34.000000Z\",\"updated_at\":\"2026-05-12T16:58:49.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 09:46:13', '2026-05-14 09:46:13'),
(3, 1, 'paket_umroh', 'CREATE', 'Menambahkan paket umroh baru', NULL, '{\"nama\":\"paket honeymoon\",\"tanggal\":\"2026-05-15\",\"hotel_id\":\"2\",\"maskapai_id\":\"3\",\"quota\":\"1234\",\"updated_at\":\"2026-05-14T17:13:21.000000Z\",\"created_at\":\"2026-05-14T17:13:21.000000Z\",\"id\":32}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 10:13:21', '2026-05-14 10:13:21'),
(4, 2, 'paket_umroh', 'CREATE', 'Menambahkan paket umroh baru', NULL, '{\"nama\":\"rrrr\",\"tanggal\":\"2026-05-15\",\"hotel_id\":\"2\",\"maskapai_id\":\"3\",\"quota\":\"456\",\"updated_at\":\"2026-05-14T17:24:09.000000Z\",\"created_at\":\"2026-05-14T17:24:09.000000Z\",\"id\":33}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 10:24:09', '2026-05-14 10:24:09'),
(5, 2, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":31,\"nama\":\"coba garuda\",\"tanggal\":\"2026-05-14\",\"quota\":1000,\"hotel_id\":2,\"maskapai_id\":1,\"created_at\":\"2026-05-13T07:23:03.000000Z\",\"updated_at\":\"2026-05-14T16:44:12.000000Z\"}', '{\"id\":31,\"nama\":\"coba loggg\",\"tanggal\":\"2026-05-14\",\"quota\":\"1000\",\"hotel_id\":\"2\",\"maskapai_id\":null,\"created_at\":\"2026-05-13T07:23:03.000000Z\",\"updated_at\":\"2026-05-14T17:24:36.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 10:24:36', '2026-05-14 10:24:36'),
(6, 4, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":28,\"nama\":\"coba terbaru\",\"tanggal\":\"2026-05-15\",\"quota\":79,\"hotel_id\":2,\"maskapai_id\":1,\"created_at\":\"2026-05-12T15:17:42.000000Z\",\"updated_at\":\"2026-05-12T16:58:38.000000Z\"}', '{\"id\":28,\"nama\":\"coba terbaru\",\"tanggal\":\"2026-05-15\",\"quota\":\"790\",\"hotel_id\":\"2\",\"maskapai_id\":null,\"created_at\":\"2026-05-12T15:17:42.000000Z\",\"updated_at\":\"2026-05-14T17:28:53.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 10:28:53', '2026-05-14 10:28:53'),
(7, 4, 'paket_umroh', 'DELETE', 'Menghapus paket umroh', '{\"id\":31,\"nama\":\"coba loggg\",\"tanggal\":\"2026-05-14\",\"quota\":1000,\"hotel_id\":2,\"maskapai_id\":null,\"created_at\":\"2026-05-13T07:23:03.000000Z\",\"updated_at\":\"2026-05-14T17:24:36.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 10:29:07', '2026-05-14 10:29:07'),
(8, 4, 'paket_umroh', 'CREATE', 'Menambahkan paket umroh baru', NULL, '{\"nama\":\"io\",\"tanggal\":\"2026-04-26\",\"hotel_id\":\"2\",\"maskapai_id\":\"3\",\"quota\":\"9999\",\"updated_at\":\"2026-05-14T17:29:29.000000Z\",\"created_at\":\"2026-05-14T17:29:29.000000Z\",\"id\":34}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 10:29:29', '2026-05-14 10:29:29'),
(9, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":7,\"nama_agen\":\"t\",\"kontak\":\"456\",\"alamat\":\"fggg\",\"status\":1,\"created_at\":\"2026-05-14T17:04:04.000000Z\",\"updated_at\":\"2026-05-14T17:04:04.000000Z\"}', '{\"id\":7,\"nama_agen\":\"t\",\"kontak\":\"456\",\"alamat\":\"fggg\",\"status\":\"0\",\"created_at\":\"2026-05-14T17:04:04.000000Z\",\"updated_at\":\"2026-05-14T17:41:14.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 10:41:15', '2026-05-14 10:41:15'),
(10, 1, 'agen', 'CREATE', 'Menambahkan agen umroh baru', NULL, '{\"nama_agen\":\"h\",\"kontak\":\"9999\",\"status\":\"1\",\"alamat\":\"mijiiii\",\"updated_at\":\"2026-05-14T17:41:46.000000Z\",\"created_at\":\"2026-05-14T17:41:46.000000Z\",\"id\":8}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 10:41:46', '2026-05-14 10:41:46'),
(11, 1, 'paket_umroh', 'CREATE', 'Menambahkan paket umroh baru', NULL, '{\"nama\":\"dude1\",\"tanggal\":\"2026-05-15\",\"hotel_id\":\"2\",\"maskapai_id\":\"3\",\"quota\":\"34\",\"updated_at\":\"2026-05-14T18:00:13.000000Z\",\"created_at\":\"2026-05-14T18:00:13.000000Z\",\"id\":35}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 11:00:13', '2026-05-14 11:00:13'),
(12, 1, 'paket_umroh', 'CREATE', 'Menambahkan paket umroh baru', NULL, '{\"nama\":\"t\",\"tanggal\":\"2026-05-15\",\"hotel_id\":\"2\",\"maskapai_id\":\"3\",\"quota\":\"345\",\"updated_at\":\"2026-05-14T18:00:32.000000Z\",\"created_at\":\"2026-05-14T18:00:32.000000Z\",\"id\":36}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 11:00:32', '2026-05-14 11:00:32'),
(13, 1, 'maskapai', 'CREATE', 'Menambahkan maskapai baru', NULL, '{\"nama_maskapai\":\"f\",\"kode_maskapai\":\"3444\",\"jumlah_seat\":\"4\",\"status\":\"1\",\"updated_at\":\"2026-05-14T18:34:37.000000Z\",\"created_at\":\"2026-05-14T18:34:37.000000Z\",\"id\":4}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 11:34:37', '2026-05-14 11:34:37'),
(14, 1, 'paket_umroh', 'UPDATE', 'Mengubah data maskapai', '{\"id\":3,\"nama_maskapai\":\"fg\",\"kode_maskapai\":\"222\",\"jumlah_seat\":123,\"status\":1,\"created_at\":\"2026-05-14T17:04:38.000000Z\",\"updated_at\":\"2026-05-14T17:04:38.000000Z\"}', '{\"id\":3,\"nama_maskapai\":\"fg\",\"kode_maskapai\":\"222\",\"jumlah_seat\":\"123\",\"status\":\"0\",\"created_at\":\"2026-05-14T17:04:38.000000Z\",\"updated_at\":\"2026-05-14T18:34:44.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 11:34:44', '2026-05-14 11:34:44'),
(15, 1, 'hotel', 'UPDATE', 'Mengubah data hotel', '{\"id\":3,\"nama_hotel\":\"faisal\",\"lokasi\":\"Madinah\",\"jumlah_seat\":40,\"status\":false,\"created_at\":\"2026-05-12T13:01:15.000000Z\",\"updated_at\":\"2026-05-14T15:55:30.000000Z\"}', '{\"id\":3,\"nama_hotel\":\"faisal\",\"lokasi\":\"Madinah\",\"jumlah_seat\":405,\"status\":false,\"created_at\":\"2026-05-12T13:01:15.000000Z\",\"updated_at\":\"2026-05-14T18:34:59.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 11:34:59', '2026-05-14 11:34:59'),
(16, 1, 'hotel', 'CREATE', 'Menambahkan hotel baru', NULL, '{\"nama_hotel\":\"rty\",\"lokasi\":\"Madinah\",\"jumlah_seat\":4,\"status\":true,\"updated_at\":\"2026-05-14T18:35:14.000000Z\",\"created_at\":\"2026-05-14T18:35:14.000000Z\",\"id\":4}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 11:35:14', '2026-05-14 11:35:14'),
(17, 1, 'paket_umroh', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":30,\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal_lahir\":\"2005-05-07\",\"umur\":21,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1771206289_Proposal Magang PT An Namiroh.pdf\",\"paket_id\":26,\"created_at\":\"2026-02-16T01:44:49.000000Z\",\"updated_at\":\"2026-05-14T15:53:52.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 11:35:48', '2026-05-14 11:35:48'),
(18, 1, 'paket_umroh', 'UPDATE', 'Mengubah jamaah mandiri', '{\"id\":31,\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal_lahir\":\"2005-05-07\",\"umur\":20,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1771206290_Proposal Magang PT An Namiroh.pdf\",\"paket_id\":18,\"created_at\":\"2026-02-16T01:44:50.000000Z\",\"updated_at\":\"2026-02-16T01:44:50.000000Z\"}', '{\"id\":31,\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal_lahir\":\"2005-05-07\",\"umur\":21,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1771206290_Proposal Magang PT An Namiroh.pdf\",\"paket_id\":\"30\",\"created_at\":\"2026-02-16T01:44:50.000000Z\",\"updated_at\":\"2026-05-14T18:36:03.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 11:36:03', '2026-05-14 11:36:03'),
(19, 1, 'agen', 'CREATE', 'Menambahkan jamaah mandiri baru', NULL, '{\"nama\":\"f\",\"tanggal_lahir\":\"2026-05-03\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"456\",\"scan_passport\":\"1778783788_WIN_20231108_12_00_48_Pro.jpg\",\"paket_id\":\"32\",\"updated_at\":\"2026-05-14T18:36:28.000000Z\",\"created_at\":\"2026-05-14T18:36:28.000000Z\",\"id\":50}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 11:36:28', '2026-05-14 11:36:28'),
(20, 1, 'paket_umroh', 'DELETE', 'Menghapus paket umroh', '{\"id\":36,\"nama\":\"t\",\"tanggal\":\"2026-05-15\",\"quota\":345,\"hotel_id\":2,\"maskapai_id\":3,\"created_at\":\"2026-05-14T18:00:32.000000Z\",\"updated_at\":\"2026-05-14T18:00:32.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:20:06', '2026-05-14 12:20:06'),
(21, 1, 'paket_umroh', 'DELETE', 'Menghapus paket umroh', '{\"id\":35,\"nama\":\"dude1\",\"tanggal\":\"2026-05-15\",\"quota\":34,\"hotel_id\":2,\"maskapai_id\":3,\"created_at\":\"2026-05-14T18:00:13.000000Z\",\"updated_at\":\"2026-05-14T18:00:13.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:20:22', '2026-05-14 12:20:22'),
(22, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":34,\"nama\":\"io\",\"tanggal\":\"2026-04-26\",\"quota\":9999,\"hotel_id\":2,\"maskapai_id\":3,\"created_at\":\"2026-05-14T17:29:29.000000Z\",\"updated_at\":\"2026-05-14T17:29:29.000000Z\"}', '{\"id\":34,\"nama\":\"oi\",\"tanggal\":\"2026-04-26\",\"quota\":\"9999\",\"hotel_id\":\"2\",\"maskapai_id\":null,\"created_at\":\"2026-05-14T17:29:29.000000Z\",\"updated_at\":\"2026-05-14T19:20:46.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:20:46', '2026-05-14 12:20:46'),
(23, 1, 'paket_umroh', 'CREATE', 'Menambahkan paket umroh baru', NULL, '{\"nama\":\"er\",\"tanggal\":\"2026-05-16\",\"hotel_id\":\"2\",\"maskapai_id\":\"4\",\"quota\":\"9999\",\"updated_at\":\"2026-05-14T19:21:10.000000Z\",\"created_at\":\"2026-05-14T19:21:10.000000Z\",\"id\":37}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:21:10', '2026-05-14 12:21:10'),
(24, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":8,\"nama_agen\":\"h\",\"kontak\":\"9999\",\"alamat\":\"mijiiii\",\"status\":1,\"created_at\":\"2026-05-14T17:41:46.000000Z\",\"updated_at\":\"2026-05-14T17:41:46.000000Z\"}', '{\"id\":8,\"nama_agen\":\"h\",\"kontak\":\"9999\",\"alamat\":\"mijiiii\",\"status\":\"0\",\"created_at\":\"2026-05-14T17:41:46.000000Z\",\"updated_at\":\"2026-05-14T19:21:39.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:21:39', '2026-05-14 12:21:39'),
(25, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":8,\"nama_agen\":\"h\",\"kontak\":\"9999\",\"alamat\":\"mijiiii\",\"status\":0,\"created_at\":\"2026-05-14T17:41:46.000000Z\",\"updated_at\":\"2026-05-14T19:21:39.000000Z\"}', '{\"id\":8,\"nama_agen\":\"h\",\"kontak\":\"123\",\"alamat\":\"mij\",\"status\":\"0\",\"created_at\":\"2026-05-14T17:41:46.000000Z\",\"updated_at\":\"2026-05-14T19:21:56.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:21:56', '2026-05-14 12:21:56'),
(26, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":8,\"nama_agen\":\"h\",\"kontak\":\"123\",\"alamat\":\"mij\",\"status\":0,\"created_at\":\"2026-05-14T17:41:46.000000Z\",\"updated_at\":\"2026-05-14T19:21:56.000000Z\"}', '{\"id\":8,\"nama_agen\":\"h\",\"kontak\":\"123\",\"alamat\":\"moker to\",\"status\":\"0\",\"created_at\":\"2026-05-14T17:41:46.000000Z\",\"updated_at\":\"2026-05-14T19:22:11.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:22:11', '2026-05-14 12:22:11'),
(27, 1, 'agen', 'CREATE', 'Menambahkan agen umroh baru', NULL, '{\"nama_agen\":\"uiuuiui\",\"kontak\":\"234444\",\"status\":\"1\",\"alamat\":\"tuyr\",\"updated_at\":\"2026-05-14T19:22:57.000000Z\",\"created_at\":\"2026-05-14T19:22:57.000000Z\",\"id\":9}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:22:57', '2026-05-14 12:22:57'),
(28, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":9,\"nama_agen\":\"uiuuiui\",\"kontak\":\"234444\",\"alamat\":\"tuyr\",\"status\":1,\"created_at\":\"2026-05-14T19:22:57.000000Z\",\"updated_at\":\"2026-05-14T19:22:57.000000Z\"}', '{\"id\":9,\"nama_agen\":\"uiuuiui\",\"kontak\":\"234444\",\"alamat\":\"tuyr\",\"status\":\"0\",\"created_at\":\"2026-05-14T19:22:57.000000Z\",\"updated_at\":\"2026-05-14T19:23:08.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:23:08', '2026-05-14 12:23:08'),
(29, 1, 'paket_umroh', 'UPDATE', 'Mengubah data maskapai', '{\"id\":4,\"nama_maskapai\":\"f\",\"kode_maskapai\":\"3444\",\"jumlah_seat\":4,\"status\":1,\"created_at\":\"2026-05-14T18:34:37.000000Z\",\"updated_at\":\"2026-05-14T18:34:37.000000Z\"}', '{\"id\":4,\"nama_maskapai\":\"f\",\"kode_maskapai\":\"3444\",\"jumlah_seat\":\"4\",\"status\":\"0\",\"created_at\":\"2026-05-14T18:34:37.000000Z\",\"updated_at\":\"2026-05-14T19:23:21.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:23:21', '2026-05-14 12:23:21'),
(30, 1, 'paket_umroh', 'UPDATE', 'Mengubah data maskapai', '{\"id\":4,\"nama_maskapai\":\"f\",\"kode_maskapai\":\"3444\",\"jumlah_seat\":4,\"status\":0,\"created_at\":\"2026-05-14T18:34:37.000000Z\",\"updated_at\":\"2026-05-14T19:23:21.000000Z\"}', '{\"id\":4,\"nama_maskapai\":\"fisa\",\"kode_maskapai\":\"3444\",\"jumlah_seat\":\"4\",\"status\":\"0\",\"created_at\":\"2026-05-14T18:34:37.000000Z\",\"updated_at\":\"2026-05-14T19:23:29.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:23:29', '2026-05-14 12:23:29'),
(31, 1, 'maskapai', 'CREATE', 'Menambahkan maskapai baru', NULL, '{\"nama_maskapai\":\"fg\",\"kode_maskapai\":\"222\",\"jumlah_seat\":\"12\",\"status\":\"1\",\"updated_at\":\"2026-05-14T19:23:51.000000Z\",\"created_at\":\"2026-05-14T19:23:51.000000Z\",\"id\":5}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:23:51', '2026-05-14 12:23:51'),
(32, 1, 'hotel', 'CREATE', 'Menambahkan hotel baru', NULL, '{\"nama_hotel\":\"er\",\"lokasi\":\"Makkah\",\"jumlah_seat\":123,\"status\":true,\"updated_at\":\"2026-05-14T19:24:39.000000Z\",\"created_at\":\"2026-05-14T19:24:39.000000Z\",\"id\":5}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:24:39', '2026-05-14 12:24:39'),
(33, 1, 'hotel', 'UPDATE', 'Mengubah data hotel', '{\"id\":5,\"nama_hotel\":\"er\",\"lokasi\":\"Makkah\",\"jumlah_seat\":123,\"status\":true,\"created_at\":\"2026-05-14T19:24:39.000000Z\",\"updated_at\":\"2026-05-14T19:24:39.000000Z\"}', '{\"id\":5,\"nama_hotel\":\"er\",\"lokasi\":\"Madinah\",\"jumlah_seat\":123,\"status\":false,\"created_at\":\"2026-05-14T19:24:39.000000Z\",\"updated_at\":\"2026-05-14T19:24:50.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:24:50', '2026-05-14 12:24:50'),
(34, 1, 'paket_umroh', 'UPDATE', 'Mengubah jamaah mandiri', '{\"id\":31,\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal_lahir\":\"2005-05-07\",\"umur\":21,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1771206290_Proposal Magang PT An Namiroh.pdf\",\"paket_id\":30,\"created_at\":\"2026-02-16T01:44:50.000000Z\",\"updated_at\":\"2026-05-14T18:36:03.000000Z\"}', '{\"id\":31,\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal_lahir\":\"2005-05-07\",\"umur\":21,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1771206290_Proposal Magang PT An Namiroh.pdf\",\"paket_id\":\"18\",\"created_at\":\"2026-02-16T01:44:50.000000Z\",\"updated_at\":\"2026-05-14T19:26:05.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:26:05', '2026-05-14 12:26:05'),
(35, 1, 'paket_umroh', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":31,\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal_lahir\":\"2005-05-07\",\"umur\":21,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1771206290_Proposal Magang PT An Namiroh.pdf\",\"paket_id\":18,\"created_at\":\"2026-02-16T01:44:50.000000Z\",\"updated_at\":\"2026-05-14T19:26:05.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:26:13', '2026-05-14 12:26:13'),
(36, 1, 'paket_umroh', 'UPDATE', 'Mengubah jamaah mandiri', '{\"id\":38,\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"1998-04-11\",\"umur\":27,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1771210683_cover fix.pdf\",\"paket_id\":17,\"created_at\":\"2026-02-16T02:58:03.000000Z\",\"updated_at\":\"2026-02-16T02:58:03.000000Z\"}', '{\"id\":38,\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"1998-04-11\",\"umur\":28,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778786865_WIN_20240113_08_46_27_Pro.jpg\",\"paket_id\":\"30\",\"created_at\":\"2026-02-16T02:58:03.000000Z\",\"updated_at\":\"2026-05-14T19:27:45.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:27:45', '2026-05-14 12:27:45'),
(37, 1, 'paket_umroh', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":50,\"nama\":\"f\",\"tanggal_lahir\":\"2026-05-03\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"456\",\"scan_passport\":\"1778783788_WIN_20231108_12_00_48_Pro.jpg\",\"paket_id\":32,\"created_at\":\"2026-05-14T18:36:28.000000Z\",\"updated_at\":\"2026-05-14T18:36:28.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-14 12:27:57', '2026-05-14 12:27:57'),
(38, 1, 'paket_umroh', 'DELETE', 'Menghapus paket umroh', '{\"id\":37,\"nama\":\"er\",\"tanggal\":\"2026-05-16\",\"quota\":9999,\"hotel_id\":2,\"maskapai_id\":4,\"created_at\":\"2026-05-14T19:21:10.000000Z\",\"updated_at\":\"2026-05-14T19:21:10.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 12:44:28', '2026-05-14 12:44:28'),
(39, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":34,\"nama\":\"oi\",\"tanggal\":\"2026-04-26\",\"quota\":9999,\"hotel_id\":null,\"maskapai_id\":null,\"created_at\":\"2026-05-14T17:29:29.000000Z\",\"updated_at\":\"2026-05-14T19:20:46.000000Z\"}', '{\"id\":34,\"nama\":\"oi\",\"tanggal\":\"2026-04-26\",\"quota\":\"999\",\"hotel_id\":null,\"maskapai_id\":null,\"created_at\":\"2026-05-14T17:29:29.000000Z\",\"updated_at\":\"2026-05-14T19:46:06.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 12:46:06', '2026-05-14 12:46:06'),
(40, 1, 'agen', 'DELETE', 'Menghapus data agen', '{\"id\":7,\"nama_agen\":\"t\",\"kontak\":\"456\",\"alamat\":\"fggg\",\"status\":0,\"created_at\":\"2026-05-14T17:04:04.000000Z\",\"updated_at\":\"2026-05-14T17:41:14.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 12:54:21', '2026-05-14 12:54:21'),
(41, 1, 'maskapai', 'DELETE', 'Menghapus maskapai', '{\"id\":5,\"nama_maskapai\":\"fg\",\"kode_maskapai\":\"222\",\"jumlah_seat\":12,\"status\":1,\"created_at\":\"2026-05-14T19:23:51.000000Z\",\"updated_at\":\"2026-05-14T19:23:51.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 12:58:55', '2026-05-14 12:58:55'),
(42, 1, 'hotel', 'CREATE', 'Menambahkan hotel baru', NULL, '{\"nama_hotel\":\"faisal\",\"lokasi\":\"Madinah\",\"jumlah_seat\":88,\"status\":true,\"updated_at\":\"2026-05-14T20:03:01.000000Z\",\"created_at\":\"2026-05-14T20:03:01.000000Z\",\"id\":6}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 13:03:01', '2026-05-14 13:03:01'),
(43, 1, 'hotel', 'UPDATE', 'Mengubah data hotel', '{\"id\":6,\"nama_hotel\":\"faisal\",\"lokasi\":\"Madinah\",\"jumlah_seat\":88,\"status\":true,\"created_at\":\"2026-05-14T20:03:01.000000Z\",\"updated_at\":\"2026-05-14T20:03:01.000000Z\"}', '{\"id\":6,\"nama_hotel\":\"faisal\",\"lokasi\":\"Madinah\",\"jumlah_seat\":88,\"status\":false,\"created_at\":\"2026-05-14T20:03:01.000000Z\",\"updated_at\":\"2026-05-14T20:03:07.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 13:03:07', '2026-05-14 13:03:07'),
(44, 1, 'hotel', 'DELETE', 'Menghapus hotel', '{\"id\":6,\"nama_hotel\":\"faisal\",\"lokasi\":\"Madinah\",\"jumlah_seat\":88,\"status\":false,\"created_at\":\"2026-05-14T20:03:01.000000Z\",\"updated_at\":\"2026-05-14T20:03:07.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 13:03:11', '2026-05-14 13:03:11'),
(45, 1, 'agen', 'CREATE', 'Menambahkan jamaah mandiri baru', NULL, '{\"nama\":\"P\",\"tanggal_lahir\":\"2026-05-15\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"44444444444\",\"scan_passport\":\"1778789094_Cuplikan layar 2023-11-17 105439.png\",\"paket_id\":\"32\",\"updated_at\":\"2026-05-14T20:04:55.000000Z\",\"created_at\":\"2026-05-14T20:04:55.000000Z\",\"id\":51}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 13:04:55', '2026-05-14 13:04:55'),
(46, 1, 'role_menu', 'UPDATE', 'Mengubah akses menu role', '[{\"id\":24,\"role_id\":3,\"menu_id\":7,\"status\":\"active\",\"created_at\":null,\"updated_at\":null,\"menu\":{\"id\":7,\"group_id\":4,\"name\":\"manifest\",\"route\":\"manifest.index\",\"created_at\":null,\"updated_at\":null}},{\"id\":25,\"role_id\":3,\"menu_id\":6,\"status\":\"active\",\"created_at\":null,\"updated_at\":null,\"menu\":{\"id\":6,\"group_id\":3,\"name\":\"jamaah_agen\",\"route\":\"jamaah.agen\",\"created_at\":null,\"updated_at\":null}},{\"id\":26,\"role_id\":3,\"menu_id\":5,\"status\":\"active\",\"created_at\":null,\"updated_at\":null,\"menu\":{\"id\":5,\"group_id\":3,\"name\":\"jamaah_kantor\",\"route\":\"jamaah.mandiri\",\"created_at\":null,\"updated_at\":null}},{\"id\":39,\"role_id\":3,\"menu_id\":2,\"status\":\"active\",\"created_at\":null,\"updated_at\":null,\"menu\":{\"id\":2,\"group_id\":2,\"name\":\"data_agen\",\"route\":\"agen.index\",\"created_at\":null,\"updated_at\":null}},{\"id\":40,\"role_id\":3,\"menu_id\":1,\"status\":\"active\",\"created_at\":null,\"updated_at\":null,\"menu\":{\"id\":1,\"group_id\":2,\"name\":\"data_paket\",\"route\":\"paket-umroh.index\",\"created_at\":null,\"updated_at\":null}}]', '[{\"id\":78,\"role_id\":3,\"menu_id\":1,\"status\":\"active\",\"created_at\":\"2026-05-14T20:08:22.000000Z\",\"updated_at\":\"2026-05-14T20:08:22.000000Z\",\"menu\":{\"id\":1,\"group_id\":2,\"name\":\"data_paket\",\"route\":\"paket-umroh.index\",\"created_at\":null,\"updated_at\":null}},{\"id\":79,\"role_id\":3,\"menu_id\":2,\"status\":\"active\",\"created_at\":\"2026-05-14T20:08:22.000000Z\",\"updated_at\":\"2026-05-14T20:08:22.000000Z\",\"menu\":{\"id\":2,\"group_id\":2,\"name\":\"data_agen\",\"route\":\"agen.index\",\"created_at\":null,\"updated_at\":null}},{\"id\":80,\"role_id\":3,\"menu_id\":3,\"status\":\"active\",\"created_at\":\"2026-05-14T20:08:22.000000Z\",\"updated_at\":\"2026-05-14T20:08:22.000000Z\",\"menu\":{\"id\":3,\"group_id\":2,\"name\":\"data_maskapai\",\"route\":\"maskapai.index\",\"created_at\":null,\"updated_at\":null}},{\"id\":81,\"role_id\":3,\"menu_id\":5,\"status\":\"active\",\"created_at\":\"2026-05-14T20:08:22.000000Z\",\"updated_at\":\"2026-05-14T20:08:22.000000Z\",\"menu\":{\"id\":5,\"group_id\":3,\"name\":\"jamaah_kantor\",\"route\":\"jamaah.mandiri\",\"created_at\":null,\"updated_at\":null}},{\"id\":82,\"role_id\":3,\"menu_id\":6,\"status\":\"active\",\"created_at\":\"2026-05-14T20:08:22.000000Z\",\"updated_at\":\"2026-05-14T20:08:22.000000Z\",\"menu\":{\"id\":6,\"group_id\":3,\"name\":\"jamaah_agen\",\"route\":\"jamaah.agen\",\"created_at\":null,\"updated_at\":null}},{\"id\":83,\"role_id\":3,\"menu_id\":7,\"status\":\"active\",\"created_at\":\"2026-05-14T20:08:22.000000Z\",\"updated_at\":\"2026-05-14T20:08:22.000000Z\",\"menu\":{\"id\":7,\"group_id\":4,\"name\":\"manifest\",\"route\":\"manifest.index\",\"created_at\":null,\"updated_at\":null}}]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 13:08:22', '2026-05-14 13:08:22'),
(47, 1, 'user', 'CREATE', 'Menambahkan user baru: Faisal Hafis Saputra', NULL, '{\"name\":\"Faisal Hafis Saputra\",\"email\":\"faisalhafissaputra@gmail.com\",\"role_id\":\"1\",\"updated_at\":\"2026-05-14T20:13:01.000000Z\",\"created_at\":\"2026-05-14T20:13:01.000000Z\",\"id\":5}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 13:13:01', '2026-05-14 13:13:01'),
(48, 1, 'user', 'UPDATE', 'Mengupdate data user: Faisal Hafis Saputra', '{\"id\":5,\"name\":\"Faisal Hafis Saputra\",\"email\":\"faisalhafissaputra@gmail.com\",\"role_id\":1,\"email_verified_at\":null,\"created_at\":\"2026-05-14T20:13:01.000000Z\",\"updated_at\":\"2026-05-14T20:13:01.000000Z\"}', '{\"id\":5,\"name\":\"Faisal Hafis Saputra\",\"email\":\"faisalhafissaputra@gmail.com\",\"role_id\":4,\"email_verified_at\":null,\"created_at\":\"2026-05-14T20:13:01.000000Z\",\"updated_at\":\"2026-05-14T20:13:25.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 13:13:25', '2026-05-14 13:13:25'),
(49, 1, 'user', 'UPDATE', 'Mengupdate data user: Faisal Hafis Saputra', '{\"id\":5,\"name\":\"Faisal Hafis Saputra\",\"email\":\"faisalhafissaputra@gmail.com\",\"role_id\":4,\"email_verified_at\":null,\"created_at\":\"2026-05-14T20:13:01.000000Z\",\"updated_at\":\"2026-05-14T20:13:25.000000Z\"}', '{\"id\":5,\"name\":\"Faisal Hafis Saputra\",\"email\":\"faisalhafissaputra@gmail.com\",\"role_id\":2,\"email_verified_at\":null,\"created_at\":\"2026-05-14T20:13:01.000000Z\",\"updated_at\":\"2026-05-14T20:19:09.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 13:19:09', '2026-05-14 13:19:09'),
(50, 1, 'user', 'DELETE', 'Menghapus user: Faisal Hafis Saputra', '{\"id\":5,\"name\":\"Faisal Hafis Saputra\",\"email\":\"faisalhafissaputra@gmail.com\",\"role_id\":2,\"email_verified_at\":null,\"created_at\":\"2026-05-14T20:13:01.000000Z\",\"updated_at\":\"2026-05-14T20:19:09.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 13:20:53', '2026-05-14 13:20:53'),
(51, 1, 'paket_umroh', 'UPDATE', 'Mengubah jamaah mandiri', '{\"id\":38,\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"1998-04-11\",\"umur\":28,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778786865_WIN_20240113_08_46_27_Pro.jpg\",\"paket_id\":30,\"created_at\":\"2026-02-16T02:58:03.000000Z\",\"updated_at\":\"2026-05-14T19:27:45.000000Z\"}', '{\"id\":38,\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"1998-04-11\",\"umur\":28,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778786865_WIN_20240113_08_46_27_Pro.jpg\",\"paket_id\":\"17\",\"created_at\":\"2026-02-16T02:58:03.000000Z\",\"updated_at\":\"2026-05-14T20:32:09.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 13:32:09', '2026-05-14 13:32:09'),
(52, 1, 'paket_umroh', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":39,\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"1998-04-11\",\"umur\":27,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1771210683_cover fix.pdf\",\"paket_id\":17,\"created_at\":\"2026-02-16T02:58:03.000000Z\",\"updated_at\":\"2026-02-16T02:58:03.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 13:32:51', '2026-05-14 13:32:51'),
(53, 1, 'paket_umroh', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":51,\"nama\":\"P\",\"tanggal_lahir\":\"2026-05-15\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"44444444444\",\"scan_passport\":\"1778789094_Cuplikan layar 2023-11-17 105439.png\",\"paket_id\":32,\"created_at\":\"2026-05-14T20:04:55.000000Z\",\"updated_at\":\"2026-05-14T20:04:55.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 13:33:05', '2026-05-14 13:33:05'),
(54, 1, 'paket_umroh', 'UPDATE', 'Mengubah data maskapai', '{\"id\":1,\"nama_maskapai\":\"lion\",\"kode_maskapai\":\"001\",\"jumlah_seat\":40,\"status\":0,\"created_at\":\"2026-05-12T15:17:14.000000Z\",\"updated_at\":\"2026-05-14T17:04:26.000000Z\"}', '{\"id\":1,\"nama_maskapai\":\"lion\",\"kode_maskapai\":\"001\",\"jumlah_seat\":\"40\",\"status\":\"1\",\"created_at\":\"2026-05-12T15:17:14.000000Z\",\"updated_at\":\"2026-05-14T21:39:50.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 14:39:50', '2026-05-14 14:39:50'),
(55, 1, 'maskapai', 'DELETE', 'Menghapus maskapai', '{\"id\":1,\"nama_maskapai\":\"lion\",\"kode_maskapai\":\"001\",\"jumlah_seat\":40,\"status\":1,\"created_at\":\"2026-05-12T15:17:14.000000Z\",\"updated_at\":\"2026-05-14T21:39:50.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 14:39:57', '2026-05-14 14:39:57'),
(56, 1, 'maskapai', 'CREATE', 'Menambahkan maskapai baru', NULL, '{\"nama_maskapai\":\"ulil albab\",\"kode_maskapai\":\"002\",\"jumlah_seat\":\"100\",\"status\":\"1\",\"updated_at\":\"2026-05-14T21:40:15.000000Z\",\"created_at\":\"2026-05-14T21:40:15.000000Z\",\"id\":6}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 14:40:15', '2026-05-14 14:40:15'),
(57, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":34,\"nama\":\"oi\",\"tanggal\":\"2026-04-26\",\"quota\":999,\"hotel_id\":null,\"maskapai_id\":null,\"created_at\":\"2026-05-14T17:29:29.000000Z\",\"updated_at\":\"2026-05-14T19:46:06.000000Z\"}', '{\"id\":34,\"nama\":\"oi\",\"tanggal\":\"2026-04-26\",\"quota\":\"999\",\"hotel_id\":null,\"maskapai_id\":\"6\",\"created_at\":\"2026-05-14T17:29:29.000000Z\",\"updated_at\":\"2026-05-14T21:40:43.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 14:40:43', '2026-05-14 14:40:43'),
(58, 1, 'paket_umroh', 'UPDATE', 'Mengubah data maskapai', '{\"id\":6,\"nama_maskapai\":\"ulil albab\",\"kode_maskapai\":\"002\",\"jumlah_seat\":100,\"status\":1,\"created_at\":\"2026-05-14T21:40:15.000000Z\",\"updated_at\":\"2026-05-14T21:40:15.000000Z\"}', '{\"id\":6,\"nama_maskapai\":\"ulil albab\",\"kode_maskapai\":\"002\",\"jumlah_seat\":\"100\",\"status\":\"0\",\"created_at\":\"2026-05-14T21:40:15.000000Z\",\"updated_at\":\"2026-05-14T21:41:12.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 14:41:12', '2026-05-14 14:41:12'),
(59, 1, 'paket_umroh', 'UPDATE', 'Mengubah data maskapai', '{\"id\":6,\"nama_maskapai\":\"ulil albab\",\"kode_maskapai\":\"002\",\"jumlah_seat\":100,\"status\":0,\"created_at\":\"2026-05-14T21:40:15.000000Z\",\"updated_at\":\"2026-05-14T21:41:12.000000Z\"}', '{\"id\":6,\"nama_maskapai\":\"ulil albab\",\"kode_maskapai\":\"002\",\"jumlah_seat\":\"100\",\"status\":\"1\",\"created_at\":\"2026-05-14T21:40:15.000000Z\",\"updated_at\":\"2026-05-14T21:45:15.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 14:45:15', '2026-05-14 14:45:15'),
(60, 1, 'paket_umroh', 'UPDATE', 'Mengubah data maskapai', '{\"id\":6,\"nama_maskapai\":\"ulil albab\",\"kode_maskapai\":\"002\",\"jumlah_seat\":100,\"status\":1,\"created_at\":\"2026-05-14T21:40:15.000000Z\",\"updated_at\":\"2026-05-14T21:45:15.000000Z\"}', '{\"id\":6,\"nama_maskapai\":\"ulil albab\",\"kode_maskapai\":\"002\",\"jumlah_seat\":\"100\",\"status\":\"1\",\"created_at\":\"2026-05-14T21:40:15.000000Z\",\"updated_at\":\"2026-05-14T21:45:15.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 14:45:22', '2026-05-14 14:45:22'),
(61, 1, 'paket_umroh', 'CREATE', 'Menambahkan paket umroh baru', NULL, '{\"nama\":\"mpruy\",\"tanggal\":\"2026-05-15\",\"hotel_id\":null,\"maskapai_id\":\"6\",\"quota\":\"22\",\"updated_at\":\"2026-05-14T21:56:53.000000Z\",\"created_at\":\"2026-05-14T21:56:53.000000Z\",\"id\":38}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 14:56:53', '2026-05-14 14:56:53'),
(62, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":34,\"nama\":\"oi\",\"tanggal\":\"2026-04-26\",\"quota\":999,\"hotel_id\":null,\"maskapai_id\":6,\"created_at\":\"2026-05-14T17:29:29.000000Z\",\"updated_at\":\"2026-05-14T21:40:43.000000Z\"}', '{\"id\":34,\"nama\":\"oi\",\"tanggal\":\"2026-04-26\",\"quota\":\"12\",\"hotel_id\":null,\"maskapai_id\":\"6\",\"created_at\":\"2026-05-14T17:29:29.000000Z\",\"updated_at\":\"2026-05-14T21:57:04.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 14:57:04', '2026-05-14 14:57:04'),
(63, 1, 'paket_umroh', 'DELETE', 'Menghapus paket umroh', '{\"id\":38,\"nama\":\"mpruy\",\"tanggal\":\"2026-05-15\",\"quota\":22,\"hotel_id\":null,\"maskapai_id\":6,\"created_at\":\"2026-05-14T21:56:53.000000Z\",\"updated_at\":\"2026-05-14T21:56:53.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 14:57:10', '2026-05-14 14:57:10'),
(64, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":34,\"nama\":\"oi\",\"tanggal\":\"2026-04-26\",\"quota\":12,\"hotel_id\":null,\"maskapai_id\":6,\"created_at\":\"2026-05-14T17:29:29.000000Z\",\"updated_at\":\"2026-05-14T21:57:04.000000Z\"}', '{\"id\":34,\"nama\":\"oi\",\"tanggal\":\"2026-04-26\",\"quota\":\"12\",\"hotel_id\":null,\"maskapai_id\":\"6\",\"created_at\":\"2026-05-14T17:29:29.000000Z\",\"updated_at\":\"2026-05-14T21:57:04.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-14 15:01:28', '2026-05-14 15:01:28'),
(65, 1, 'paket_umroh', 'CREATE', 'Menambahkan paket umroh baru', NULL, '{\"nama\":\"faisal anjay banget\",\"tanggal\":\"2026-05-15\",\"hotel_id\":null,\"maskapai_id\":\"6\",\"quota\":\"122\",\"updated_at\":\"2026-05-15T12:04:46.000000Z\",\"created_at\":\"2026-05-15T12:04:46.000000Z\",\"id\":39}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-15 05:04:46', '2026-05-15 05:04:46'),
(66, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":39,\"nama\":\"faisal anjay banget\",\"tanggal\":\"2026-05-15\",\"quota\":122,\"hotel_id\":null,\"maskapai_id\":6,\"created_at\":\"2026-05-15T12:04:46.000000Z\",\"updated_at\":\"2026-05-15T12:04:46.000000Z\"}', '{\"id\":39,\"nama\":\"faisal anjay banget\",\"tanggal\":\"2026-05-15\",\"quota\":\"1220\",\"hotel_id\":null,\"maskapai_id\":\"6\",\"created_at\":\"2026-05-15T12:04:46.000000Z\",\"updated_at\":\"2026-05-15T12:05:04.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-15 05:05:04', '2026-05-15 05:05:04'),
(67, 1, 'paket_umroh', 'DELETE', 'Menghapus paket umroh', '{\"id\":39,\"nama\":\"faisal anjay banget\",\"tanggal\":\"2026-05-15\",\"quota\":1220,\"hotel_id\":null,\"maskapai_id\":6,\"created_at\":\"2026-05-15T12:04:46.000000Z\",\"updated_at\":\"2026-05-15T12:05:04.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-15 05:05:09', '2026-05-15 05:05:09'),
(68, 1, 'hotel', 'CREATE', 'Menambahkan hotel baru', NULL, '{\"nama_hotel\":\"Al Karomah\",\"lokasi\":\"Madinah\",\"jumlah_seat\":100,\"status\":true,\"updated_at\":\"2026-05-15T12:05:50.000000Z\",\"created_at\":\"2026-05-15T12:05:50.000000Z\",\"id\":7}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-15 05:05:50', '2026-05-15 05:05:50'),
(69, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":34,\"nama\":\"oi\",\"tanggal\":\"2026-04-26\",\"quota\":12,\"hotel_id\":null,\"maskapai_id\":6,\"created_at\":\"2026-05-14T17:29:29.000000Z\",\"updated_at\":\"2026-05-14T21:57:04.000000Z\"}', '{\"id\":34,\"nama\":\"oi\",\"tanggal\":\"2026-04-26\",\"quota\":\"12\",\"hotel_id\":\"7\",\"maskapai_id\":\"6\",\"created_at\":\"2026-05-14T17:29:29.000000Z\",\"updated_at\":\"2026-05-15T12:06:03.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-15 05:06:03', '2026-05-15 05:06:03'),
(70, 1, 'agen', 'CREATE', 'Menambahkan agen umroh baru', NULL, '{\"nama_agen\":\"agen load\",\"kontak\":\"09999999\",\"status\":\"1\",\"alamat\":\"mojokerto\",\"updated_at\":\"2026-05-15T12:12:46.000000Z\",\"created_at\":\"2026-05-15T12:12:46.000000Z\",\"id\":10}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 05:12:46', '2026-05-15 05:12:46'),
(71, 1, 'paket_umroh', 'UPDATE', 'Mengubah data agen', '{\"id\":10,\"nama_agen\":\"agen load\",\"kontak\":\"09999999\",\"alamat\":\"mojokerto\",\"status\":1,\"created_at\":\"2026-05-15T12:12:46.000000Z\",\"updated_at\":\"2026-05-15T12:12:46.000000Z\"}', '{\"id\":10,\"nama_agen\":\"agen load\",\"kontak\":\"09999999\",\"alamat\":\"mojokerto\",\"status\":\"0\",\"created_at\":\"2026-05-15T12:12:46.000000Z\",\"updated_at\":\"2026-05-15T12:12:54.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 05:12:54', '2026-05-15 05:12:54'),
(72, 1, 'agen', 'DELETE', 'Menghapus data agen', '{\"id\":10,\"nama_agen\":\"agen load\",\"kontak\":\"09999999\",\"alamat\":\"mojokerto\",\"status\":0,\"created_at\":\"2026-05-15T12:12:46.000000Z\",\"updated_at\":\"2026-05-15T12:12:54.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 05:12:59', '2026-05-15 05:12:59'),
(73, 1, 'agen', 'CREATE', 'Menambahkan jamaah mandiri baru', NULL, '{\"nama\":\"faisal uyeee\",\"tanggal_lahir\":\"2026-05-15\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"44444444444\",\"scan_passport\":\"1778848308_Cuplikan layar 2023-11-17 105439.png\",\"paket_id\":\"18\",\"updated_at\":\"2026-05-15T12:31:48.000000Z\",\"created_at\":\"2026-05-15T12:31:48.000000Z\",\"id\":52}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 05:31:48', '2026-05-15 05:31:48'),
(74, 1, 'paket_umroh', 'UPDATE', 'Mengubah jamaah mandiri', '{\"id\":38,\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"1998-04-11\",\"umur\":28,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778786865_WIN_20240113_08_46_27_Pro.jpg\",\"paket_id\":17,\"created_at\":\"2026-02-16T02:58:03.000000Z\",\"updated_at\":\"2026-05-14T20:32:09.000000Z\"}', '{\"id\":38,\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"1998-04-11\",\"umur\":28,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778848323_Cuplikan layar 2023-11-17 105439.png\",\"paket_id\":\"18\",\"created_at\":\"2026-02-16T02:58:03.000000Z\",\"updated_at\":\"2026-05-15T12:32:03.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 05:32:03', '2026-05-15 05:32:03'),
(75, 1, 'paket_umroh', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":52,\"nama\":\"faisal uyeee\",\"tanggal_lahir\":\"2026-05-15\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"44444444444\",\"scan_passport\":\"1778848308_Cuplikan layar 2023-11-17 105439.png\",\"paket_id\":18,\"created_at\":\"2026-05-15T12:31:48.000000Z\",\"updated_at\":\"2026-05-15T12:31:48.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 05:32:13', '2026-05-15 05:32:13'),
(76, 1, 'role_menu', 'UPDATE', 'Mengubah akses menu role', '[{\"id\":78,\"role_id\":3,\"menu_id\":1,\"status\":\"active\",\"created_at\":\"2026-05-14T20:08:22.000000Z\",\"updated_at\":\"2026-05-14T20:08:22.000000Z\",\"menu\":{\"id\":1,\"group_id\":2,\"name\":\"data_paket\",\"route\":\"paket-umroh.index\",\"created_at\":null,\"updated_at\":null}},{\"id\":79,\"role_id\":3,\"menu_id\":2,\"status\":\"active\",\"created_at\":\"2026-05-14T20:08:22.000000Z\",\"updated_at\":\"2026-05-14T20:08:22.000000Z\",\"menu\":{\"id\":2,\"group_id\":2,\"name\":\"data_agen\",\"route\":\"agen.index\",\"created_at\":null,\"updated_at\":null}},{\"id\":80,\"role_id\":3,\"menu_id\":3,\"status\":\"active\",\"created_at\":\"2026-05-14T20:08:22.000000Z\",\"updated_at\":\"2026-05-14T20:08:22.000000Z\",\"menu\":{\"id\":3,\"group_id\":2,\"name\":\"data_maskapai\",\"route\":\"maskapai.index\",\"created_at\":null,\"updated_at\":null}},{\"id\":81,\"role_id\":3,\"menu_id\":5,\"status\":\"active\",\"created_at\":\"2026-05-14T20:08:22.000000Z\",\"updated_at\":\"2026-05-14T20:08:22.000000Z\",\"menu\":{\"id\":5,\"group_id\":3,\"name\":\"jamaah_kantor\",\"route\":\"jamaah.mandiri\",\"created_at\":null,\"updated_at\":null}},{\"id\":82,\"role_id\":3,\"menu_id\":6,\"status\":\"active\",\"created_at\":\"2026-05-14T20:08:22.000000Z\",\"updated_at\":\"2026-05-14T20:08:22.000000Z\",\"menu\":{\"id\":6,\"group_id\":3,\"name\":\"jamaah_agen\",\"route\":\"jamaah.agen\",\"created_at\":null,\"updated_at\":null}},{\"id\":83,\"role_id\":3,\"menu_id\":7,\"status\":\"active\",\"created_at\":\"2026-05-14T20:08:22.000000Z\",\"updated_at\":\"2026-05-14T20:08:22.000000Z\",\"menu\":{\"id\":7,\"group_id\":4,\"name\":\"manifest\",\"route\":\"manifest.index\",\"created_at\":null,\"updated_at\":null}}]', '[{\"id\":84,\"role_id\":3,\"menu_id\":1,\"status\":\"active\",\"created_at\":\"2026-05-15T12:36:14.000000Z\",\"updated_at\":\"2026-05-15T12:36:14.000000Z\",\"menu\":{\"id\":1,\"group_id\":2,\"name\":\"data_paket\",\"route\":\"paket-umroh.index\",\"created_at\":null,\"updated_at\":null}},{\"id\":85,\"role_id\":3,\"menu_id\":2,\"status\":\"active\",\"created_at\":\"2026-05-15T12:36:14.000000Z\",\"updated_at\":\"2026-05-15T12:36:14.000000Z\",\"menu\":{\"id\":2,\"group_id\":2,\"name\":\"data_agen\",\"route\":\"agen.index\",\"created_at\":null,\"updated_at\":null}},{\"id\":86,\"role_id\":3,\"menu_id\":5,\"status\":\"active\",\"created_at\":\"2026-05-15T12:36:14.000000Z\",\"updated_at\":\"2026-05-15T12:36:14.000000Z\",\"menu\":{\"id\":5,\"group_id\":3,\"name\":\"jamaah_kantor\",\"route\":\"jamaah.mandiri\",\"created_at\":null,\"updated_at\":null}},{\"id\":87,\"role_id\":3,\"menu_id\":6,\"status\":\"active\",\"created_at\":\"2026-05-15T12:36:14.000000Z\",\"updated_at\":\"2026-05-15T12:36:14.000000Z\",\"menu\":{\"id\":6,\"group_id\":3,\"name\":\"jamaah_agen\",\"route\":\"jamaah.agen\",\"created_at\":null,\"updated_at\":null}},{\"id\":88,\"role_id\":3,\"menu_id\":7,\"status\":\"active\",\"created_at\":\"2026-05-15T12:36:14.000000Z\",\"updated_at\":\"2026-05-15T12:36:14.000000Z\",\"menu\":{\"id\":7,\"group_id\":4,\"name\":\"manifest\",\"route\":\"manifest.index\",\"created_at\":null,\"updated_at\":null}}]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 05:36:14', '2026-05-15 05:36:14'),
(77, 1, 'user', 'CREATE', 'Menambahkan user baru: try', NULL, '{\"name\":\"try\",\"email\":\"faisalhafissaputra@gmail.com\",\"role_id\":\"1\",\"updated_at\":\"2026-05-15T12:41:05.000000Z\",\"created_at\":\"2026-05-15T12:41:05.000000Z\",\"id\":6}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 05:41:05', '2026-05-15 05:41:05');
INSERT INTO `activity_logs` (`id`, `user_id`, `module`, `action`, `description`, `old_data`, `new_data`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(78, 1, 'user', 'UPDATE', 'Mengupdate data user: try', '{\"id\":6,\"name\":\"try\",\"email\":\"faisalhafissaputra@gmail.com\",\"role_id\":1,\"email_verified_at\":null,\"created_at\":\"2026-05-15T12:41:05.000000Z\",\"updated_at\":\"2026-05-15T12:41:05.000000Z\"}', '{\"id\":6,\"name\":\"try\",\"email\":\"faisalhafissaputra@gmail.com\",\"role_id\":2,\"email_verified_at\":null,\"created_at\":\"2026-05-15T12:41:05.000000Z\",\"updated_at\":\"2026-05-15T12:42:17.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 05:42:17', '2026-05-15 05:42:17'),
(79, 1, 'user', 'DELETE', 'Menghapus user: try', '{\"id\":6,\"name\":\"try\",\"email\":\"faisalhafissaputra@gmail.com\",\"role_id\":2,\"email_verified_at\":null,\"created_at\":\"2026-05-15T12:41:05.000000Z\",\"updated_at\":\"2026-05-15T12:42:17.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 05:42:24', '2026-05-15 05:42:24'),
(80, 1, 'paket_umroh', 'CREATE', 'Menambahkan paket umroh baru', NULL, '{\"nama\":\"P\",\"tanggal\":\"2026-05-16\",\"hotel_id\":\"7\",\"maskapai_id\":\"6\",\"quota\":\"7\",\"updated_at\":\"2026-05-15T13:12:50.000000Z\",\"created_at\":\"2026-05-15T13:12:50.000000Z\",\"id\":40}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 06:12:50', '2026-05-15 06:12:50'),
(81, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":40,\"nama\":\"P\",\"tanggal\":\"2026-05-16\",\"quota\":7,\"hotel_id\":7,\"maskapai_id\":6,\"created_at\":\"2026-05-15T13:12:50.000000Z\",\"updated_at\":\"2026-05-15T13:12:50.000000Z\"}', '{\"id\":40,\"nama\":\"P\",\"tanggal\":\"2026-05-16\",\"quota\":\"79\",\"hotel_id\":\"7\",\"maskapai_id\":\"6\",\"created_at\":\"2026-05-15T13:12:50.000000Z\",\"updated_at\":\"2026-05-15T13:13:01.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 06:13:01', '2026-05-15 06:13:01'),
(82, 1, 'paket_umroh', 'DELETE', 'Menghapus paket umroh', '{\"id\":40,\"nama\":\"P\",\"tanggal\":\"2026-05-16\",\"quota\":79,\"hotel_id\":7,\"maskapai_id\":6,\"created_at\":\"2026-05-15T13:12:50.000000Z\",\"updated_at\":\"2026-05-15T13:13:01.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 06:13:07', '2026-05-15 06:13:07'),
(83, 1, 'agen', 'CREATE', 'Menambahkan jamaah mandiri baru', NULL, '{\"nama\":\"coba terbaru\",\"tanggal_lahir\":\"2026-05-15\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"8999999\",\"scan_passport\":\"1778851742_Screenshot (11).png\",\"paket_id\":\"17\",\"updated_at\":\"2026-05-15T13:29:03.000000Z\",\"created_at\":\"2026-05-15T13:29:03.000000Z\",\"id\":53}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 06:29:03', '2026-05-15 06:29:03'),
(84, 1, 'jamaah_agen', 'CREATE', 'Menambahkan jamaah agen baru', NULL, '{\"agen_id\":\"4\",\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal_lahir\":\"2026-06-06\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"8999999\",\"scan_passport\":\"1778852218_Screenshot (14).png\",\"paket_id\":\"26\",\"updated_at\":\"2026-05-15T13:36:59.000000Z\",\"created_at\":\"2026-05-15T13:36:59.000000Z\",\"id\":4}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 06:36:59', '2026-05-15 06:36:59'),
(85, 2, 'agen', 'CREATE', 'Menambahkan agen umroh baru', NULL, '{\"nama_agen\":\"y\",\"kontak\":\"99999999\",\"status\":\"1\",\"alamat\":\"surabaya\",\"updated_at\":\"2026-05-15T14:01:43.000000Z\",\"created_at\":\"2026-05-15T14:01:43.000000Z\",\"id\":11}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 07:01:43', '2026-05-15 07:01:43'),
(86, 2, 'paket_umroh', 'UPDATE', 'Mengubah data agen', '{\"id\":11,\"nama_agen\":\"y\",\"kontak\":\"99999999\",\"alamat\":\"surabaya\",\"status\":1,\"created_at\":\"2026-05-15T14:01:43.000000Z\",\"updated_at\":\"2026-05-15T14:01:43.000000Z\"}', '{\"id\":11,\"nama_agen\":\"y\",\"kontak\":\"99999999\",\"alamat\":\"surabaya\",\"status\":\"0\",\"created_at\":\"2026-05-15T14:01:43.000000Z\",\"updated_at\":\"2026-05-15T14:01:50.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 07:01:50', '2026-05-15 07:01:50'),
(87, 2, 'agen', 'DELETE', 'Menghapus data agen', '{\"id\":11,\"nama_agen\":\"y\",\"kontak\":\"99999999\",\"alamat\":\"surabaya\",\"status\":0,\"created_at\":\"2026-05-15T14:01:43.000000Z\",\"updated_at\":\"2026-05-15T14:01:50.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 07:01:55', '2026-05-15 07:01:55'),
(88, 1, 'user', 'UPDATE', 'Mengupdate data user: Hotel dan Maskapai', '{\"id\":3,\"name\":\"Hotel dan Tiket\",\"email\":\"ht@umroh.test\",\"role_id\":4,\"email_verified_at\":null,\"created_at\":\"2026-05-13T21:24:05.000000Z\",\"updated_at\":\"2026-05-14T15:18:58.000000Z\"}', '{\"id\":3,\"name\":\"Hotel dan Maskapai\",\"email\":\"ht@umroh.test\",\"role_id\":4,\"email_verified_at\":null,\"created_at\":\"2026-05-13T21:24:05.000000Z\",\"updated_at\":\"2026-05-15T14:12:17.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 07:12:17', '2026-05-15 07:12:17'),
(89, 1, 'user', 'UPDATE', 'Mengupdate data user: Manifest', '{\"id\":4,\"name\":\"Manifest\",\"email\":\"manifest@umroh.test\",\"role_id\":3,\"email_verified_at\":null,\"created_at\":\"2026-05-13T21:37:52.000000Z\",\"updated_at\":\"2026-05-14T15:19:24.000000Z\"}', '{\"id\":4,\"name\":\"Manifest\",\"email\":\"manifest@umroh.test\",\"role_id\":3,\"email_verified_at\":null,\"created_at\":\"2026-05-13T21:37:52.000000Z\",\"updated_at\":\"2026-05-14T15:19:24.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 07:13:01', '2026-05-15 07:13:01'),
(90, 1, 'jamaah_agen', 'DELETE', 'Menghapus jamaah agen', '{\"id\":4,\"agen_id\":4,\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal_lahir\":\"2026-06-06\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"8999999\",\"scan_passport\":\"1778852218_Screenshot (14).png\",\"paket_id\":26,\"created_at\":\"2026-05-15T13:36:59.000000Z\",\"updated_at\":\"2026-05-15T13:36:59.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 07:18:17', '2026-05-15 07:18:17'),
(91, 1, 'jamaah_agen', 'CREATE', 'Menambahkan jamaah agen baru', NULL, '{\"agen_id\":\"6\",\"nama\":\"coba terbaru\",\"tanggal_lahir\":\"2026-05-16\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"8999999\",\"scan_passport\":\"1778865750_namiroh.png\",\"paket_id\":\"18\",\"updated_at\":\"2026-05-15T17:22:30.000000Z\",\"created_at\":\"2026-05-15T17:22:30.000000Z\",\"id\":5}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 10:22:30', '2026-05-15 10:22:30'),
(92, 1, 'role_menu', 'UPDATE', 'Mengubah akses menu role', '[{\"id\":84,\"role_id\":3,\"menu_id\":1,\"status\":\"active\",\"created_at\":\"2026-05-15T12:36:14.000000Z\",\"updated_at\":\"2026-05-15T12:36:14.000000Z\",\"menu\":{\"id\":1,\"group_id\":2,\"name\":\"Data Paket\",\"route\":\"paket-umroh.index\",\"created_at\":null,\"updated_at\":null}},{\"id\":85,\"role_id\":3,\"menu_id\":2,\"status\":\"active\",\"created_at\":\"2026-05-15T12:36:14.000000Z\",\"updated_at\":\"2026-05-15T12:36:14.000000Z\",\"menu\":{\"id\":2,\"group_id\":2,\"name\":\"Data Agen\",\"route\":\"agen.index\",\"created_at\":null,\"updated_at\":null}},{\"id\":86,\"role_id\":3,\"menu_id\":5,\"status\":\"active\",\"created_at\":\"2026-05-15T12:36:14.000000Z\",\"updated_at\":\"2026-05-15T12:36:14.000000Z\",\"menu\":{\"id\":5,\"group_id\":3,\"name\":\"Jamaah Kantor\",\"route\":\"jamaah.mandiri\",\"created_at\":null,\"updated_at\":null}},{\"id\":87,\"role_id\":3,\"menu_id\":6,\"status\":\"active\",\"created_at\":\"2026-05-15T12:36:14.000000Z\",\"updated_at\":\"2026-05-15T12:36:14.000000Z\",\"menu\":{\"id\":6,\"group_id\":3,\"name\":\"Jamaah Agen\",\"route\":\"jamaah.agen\",\"created_at\":null,\"updated_at\":null}},{\"id\":88,\"role_id\":3,\"menu_id\":7,\"status\":\"active\",\"created_at\":\"2026-05-15T12:36:14.000000Z\",\"updated_at\":\"2026-05-15T12:36:14.000000Z\",\"menu\":{\"id\":7,\"group_id\":4,\"name\":\"Manifest\",\"route\":\"manifest.index\",\"created_at\":null,\"updated_at\":null}}]', '[{\"id\":89,\"role_id\":3,\"menu_id\":1,\"status\":\"active\",\"created_at\":\"2026-05-15T17:55:01.000000Z\",\"updated_at\":\"2026-05-15T17:55:01.000000Z\",\"menu\":{\"id\":1,\"group_id\":2,\"name\":\"Data Paket\",\"route\":\"paket-umroh.index\",\"created_at\":null,\"updated_at\":null}},{\"id\":90,\"role_id\":3,\"menu_id\":2,\"status\":\"active\",\"created_at\":\"2026-05-15T17:55:01.000000Z\",\"updated_at\":\"2026-05-15T17:55:01.000000Z\",\"menu\":{\"id\":2,\"group_id\":2,\"name\":\"Data Agen\",\"route\":\"agen.index\",\"created_at\":null,\"updated_at\":null}},{\"id\":91,\"role_id\":3,\"menu_id\":5,\"status\":\"active\",\"created_at\":\"2026-05-15T17:55:01.000000Z\",\"updated_at\":\"2026-05-15T17:55:01.000000Z\",\"menu\":{\"id\":5,\"group_id\":3,\"name\":\"Jamaah Kantor\",\"route\":\"jamaah.mandiri\",\"created_at\":null,\"updated_at\":null}},{\"id\":92,\"role_id\":3,\"menu_id\":6,\"status\":\"active\",\"created_at\":\"2026-05-15T17:55:01.000000Z\",\"updated_at\":\"2026-05-15T17:55:01.000000Z\",\"menu\":{\"id\":6,\"group_id\":3,\"name\":\"Jamaah Agen\",\"route\":\"jamaah.agen\",\"created_at\":null,\"updated_at\":null}},{\"id\":93,\"role_id\":3,\"menu_id\":7,\"status\":\"active\",\"created_at\":\"2026-05-15T17:55:01.000000Z\",\"updated_at\":\"2026-05-15T17:55:01.000000Z\",\"menu\":{\"id\":7,\"group_id\":4,\"name\":\"Manifest\",\"route\":\"manifest.index\",\"created_at\":null,\"updated_at\":null}}]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 10:55:01', '2026-05-15 10:55:01'),
(93, 1, 'user', 'UPDATE', 'Mengupdate data user: Admin', '{\"id\":1,\"name\":\"Admin\",\"email\":\"admin@umroh.test\",\"role_id\":1,\"email_verified_at\":null,\"created_at\":\"2026-02-11T03:25:42.000000Z\",\"updated_at\":\"2026-05-14T15:29:57.000000Z\"}', '{\"id\":1,\"name\":\"Admin\",\"email\":\"admin@namiroh.test\",\"role_id\":1,\"email_verified_at\":null,\"created_at\":\"2026-02-11T03:25:42.000000Z\",\"updated_at\":\"2026-05-15T17:56:35.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 10:56:35', '2026-05-15 10:56:35'),
(94, 1, 'user', 'UPDATE', 'Mengupdate data user: Customer Support', '{\"id\":2,\"name\":\"Customer Support\",\"email\":\"cs@umroh.test\",\"role_id\":2,\"email_verified_at\":null,\"created_at\":\"2026-05-13T20:38:45.000000Z\",\"updated_at\":\"2026-05-14T15:18:22.000000Z\"}', '{\"id\":2,\"name\":\"Customer Support\",\"email\":\"cs@namiroh.test\",\"role_id\":2,\"email_verified_at\":null,\"created_at\":\"2026-05-13T20:38:45.000000Z\",\"updated_at\":\"2026-05-15T17:56:48.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 10:56:48', '2026-05-15 10:56:48'),
(95, 1, 'user', 'UPDATE', 'Mengupdate data user: Hotel dan Maskapai', '{\"id\":3,\"name\":\"Hotel dan Maskapai\",\"email\":\"ht@umroh.test\",\"role_id\":4,\"email_verified_at\":null,\"created_at\":\"2026-05-13T21:24:05.000000Z\",\"updated_at\":\"2026-05-15T14:12:17.000000Z\"}', '{\"id\":3,\"name\":\"Hotel dan Maskapai\",\"email\":\"ht@namiroh.test\",\"role_id\":4,\"email_verified_at\":null,\"created_at\":\"2026-05-13T21:24:05.000000Z\",\"updated_at\":\"2026-05-15T17:56:58.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 10:56:58', '2026-05-15 10:56:58'),
(96, 1, 'user', 'UPDATE', 'Mengupdate data user: Manifest', '{\"id\":4,\"name\":\"Manifest\",\"email\":\"manifest@umroh.test\",\"role_id\":3,\"email_verified_at\":null,\"created_at\":\"2026-05-13T21:37:52.000000Z\",\"updated_at\":\"2026-05-14T15:19:24.000000Z\"}', '{\"id\":4,\"name\":\"Manifest\",\"email\":\"manifest@namiroh.test\",\"role_id\":3,\"email_verified_at\":null,\"created_at\":\"2026-05-13T21:37:52.000000Z\",\"updated_at\":\"2026-05-15T17:57:10.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 10:57:10', '2026-05-15 10:57:10'),
(97, 1, 'user', 'UPDATE', 'Mengupdate data user: Faisal Hafis Saputra', '{\"id\":1,\"name\":\"Admin\",\"email\":\"admin@namiroh.test\",\"role_id\":1,\"email_verified_at\":null,\"created_at\":\"2026-02-11T03:25:42.000000Z\",\"updated_at\":\"2026-05-15T17:56:35.000000Z\"}', '{\"id\":1,\"name\":\"Faisal Hafis Saputra\",\"email\":\"admin@namiroh.test\",\"role_id\":1,\"email_verified_at\":null,\"created_at\":\"2026-02-11T03:25:42.000000Z\",\"updated_at\":\"2026-05-15T18:20:48.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-15 11:20:48', '2026-05-15 11:20:48'),
(98, 1, 'user', 'CREATE', 'Menambahkan user baru: Cesha Luvena', NULL, '{\"name\":\"Cesha Luvena\",\"email\":\"admin1@namiroh.test\",\"role_id\":\"1\",\"updated_at\":\"2026-05-15T18:22:50.000000Z\",\"created_at\":\"2026-05-15T18:22:50.000000Z\",\"id\":7}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-15 11:22:50', '2026-05-15 11:22:50'),
(99, NULL, 'user', 'UPDATE', 'Mengupdate data user: Cesha Luvena Cantik Sekali wkwkwkwk', '{\"id\":7,\"name\":\"Cesha Luvena\",\"email\":\"admin1@namiroh.test\",\"role_id\":1,\"email_verified_at\":null,\"created_at\":\"2026-05-15T18:22:50.000000Z\",\"updated_at\":\"2026-05-15T18:22:50.000000Z\"}', '{\"id\":7,\"name\":\"Cesha Luvena Cantik Sekali wkwkwkwk\",\"email\":\"admin1@namiroh.test\",\"role_id\":1,\"email_verified_at\":null,\"created_at\":\"2026-05-15T18:22:50.000000Z\",\"updated_at\":\"2026-05-15T18:23:52.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-15 11:23:52', '2026-05-15 11:23:52'),
(100, NULL, 'user', 'UPDATE', 'Mengupdate data user: Agung Bagas Laksana', '{\"id\":7,\"name\":\"Cesha Luvena Cantik Sekali wkwkwkwk\",\"email\":\"admin1@namiroh.test\",\"role_id\":1,\"email_verified_at\":null,\"created_at\":\"2026-05-15T18:22:50.000000Z\",\"updated_at\":\"2026-05-15T18:23:52.000000Z\"}', '{\"id\":7,\"name\":\"Agung Bagas Laksana\",\"email\":\"admin1@namiroh.test\",\"role_id\":1,\"email_verified_at\":null,\"created_at\":\"2026-05-15T18:22:50.000000Z\",\"updated_at\":\"2026-05-15T18:27:13.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-15 11:27:13', '2026-05-15 11:27:13'),
(101, NULL, 'user', 'UPDATE', 'Mengupdate data user: Agung Bagas Laksana', '{\"id\":7,\"name\":\"Agung Bagas Laksana\",\"email\":\"admin1@namiroh.test\",\"role_id\":1,\"email_verified_at\":null,\"created_at\":\"2026-05-15T18:22:50.000000Z\",\"updated_at\":\"2026-05-15T18:27:13.000000Z\"}', '{\"id\":7,\"name\":\"Agung Bagas Laksana\",\"email\":\"admin1@namiroh.test\",\"role_id\":4,\"email_verified_at\":null,\"created_at\":\"2026-05-15T18:22:50.000000Z\",\"updated_at\":\"2026-05-15T18:30:43.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-15 11:30:43', '2026-05-15 11:30:43'),
(102, 1, 'user', 'UPDATE', 'Mengupdate data user: Agung Bagas Laksana', '{\"id\":7,\"name\":\"Agung Bagas Laksana\",\"email\":\"admin1@namiroh.test\",\"role_id\":4,\"email_verified_at\":null,\"created_at\":\"2026-05-15T18:22:50.000000Z\",\"updated_at\":\"2026-05-15T18:30:43.000000Z\"}', '{\"id\":7,\"name\":\"Agung Bagas Laksana\",\"email\":\"admin1@namiroh.test\",\"role_id\":2,\"email_verified_at\":null,\"created_at\":\"2026-05-15T18:22:50.000000Z\",\"updated_at\":\"2026-05-15T18:34:49.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-15 11:34:49', '2026-05-15 11:34:49'),
(103, 1, 'user', 'DELETE', 'Menghapus user: Agung Bagas Laksana', '{\"id\":7,\"name\":\"Agung Bagas Laksana\",\"email\":\"admin1@namiroh.test\",\"role_id\":2,\"email_verified_at\":null,\"created_at\":\"2026-05-15T18:22:50.000000Z\",\"updated_at\":\"2026-05-15T18:34:49.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-15 11:45:17', '2026-05-15 11:45:17'),
(104, 1, 'hotel', 'CREATE', 'Menambahkan hotel baru', NULL, '{\"nama_hotel\":\"faisal\",\"lokasi\":\"Makkah\",\"jumlah_seat\":30,\"status\":true,\"updated_at\":\"2026-05-15T19:20:58.000000Z\",\"created_at\":\"2026-05-15T19:20:58.000000Z\",\"id\":8}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 12:20:58', '2026-05-15 12:20:58'),
(105, 1, 'jamaah_agen', 'DELETE', 'Menghapus jamaah agen', '{\"id\":5,\"agen_id\":6,\"nama\":\"coba terbaru\",\"tanggal_lahir\":\"2026-05-16\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"8999999\",\"scan_passport\":\"1778865750_namiroh.png\",\"paket_id\":18,\"created_at\":\"2026-05-15T17:22:30.000000Z\",\"updated_at\":\"2026-05-15T17:22:30.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 12:21:34', '2026-05-15 12:21:34'),
(106, 1, 'paket_umroh', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":53,\"nama\":\"coba terbaru\",\"tanggal_lahir\":\"2026-05-15\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"8999999\",\"scan_passport\":\"1778851742_Screenshot (11).png\",\"paket_id\":17,\"created_at\":\"2026-05-15T13:29:03.000000Z\",\"updated_at\":\"2026-05-15T13:29:03.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 12:22:53', '2026-05-15 12:22:53'),
(107, 1, 'paket_umroh', 'UPDATE', 'Mengubah jamaah mandiri', '{\"id\":49,\"nama\":\"induksi\",\"tanggal_lahir\":\"2026-05-14\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"89\",\"scan_passport\":\"1778774169_WIN_20231108_12_00_57_Pro.jpg\",\"paket_id\":18,\"created_at\":\"2026-05-14T15:56:09.000000Z\",\"updated_at\":\"2026-05-14T15:56:09.000000Z\"}', '{\"id\":49,\"nama\":\"induksi\",\"tanggal_lahir\":\"2026-05-14\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"89\",\"scan_passport\":\"1778774169_WIN_20231108_12_00_57_Pro.jpg\",\"paket_id\":\"17\",\"created_at\":\"2026-05-14T15:56:09.000000Z\",\"updated_at\":\"2026-05-15T19:23:15.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 12:23:15', '2026-05-15 12:23:15'),
(108, 1, 'paket_umroh', 'UPDATE', 'Mengubah jamaah mandiri', '{\"id\":38,\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"1998-04-11\",\"umur\":28,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778848323_Cuplikan layar 2023-11-17 105439.png\",\"paket_id\":18,\"created_at\":\"2026-02-16T02:58:03.000000Z\",\"updated_at\":\"2026-05-15T12:32:03.000000Z\"}', '{\"id\":38,\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"1998-04-11\",\"umur\":28,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778848323_Cuplikan layar 2023-11-17 105439.png\",\"paket_id\":\"17\",\"created_at\":\"2026-02-16T02:58:03.000000Z\",\"updated_at\":\"2026-05-15T19:38:05.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 12:38:05', '2026-05-15 12:38:05'),
(109, 1, 'paket_umroh', 'UPDATE', 'Mengubah jamaah mandiri', '{\"id\":38,\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"1998-04-11\",\"umur\":28,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778848323_Cuplikan layar 2023-11-17 105439.png\",\"paket_id\":17,\"created_at\":\"2026-02-16T02:58:03.000000Z\",\"updated_at\":\"2026-05-15T19:38:05.000000Z\"}', '{\"id\":38,\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"1998-04-11\",\"umur\":28,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778848323_Cuplikan layar 2023-11-17 105439.png\",\"paket_id\":\"17\",\"created_at\":\"2026-02-16T02:58:03.000000Z\",\"updated_at\":\"2026-05-15T19:38:23.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 12:38:23', '2026-05-15 12:38:23'),
(110, 1, 'paket_umroh', 'UPDATE', 'Mengubah jamaah mandiri', '{\"id\":43,\"nama\":\"d\",\"tanggal_lahir\":\"2026-05-06\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778595281_Screenshot (5).png\",\"paket_id\":26,\"created_at\":\"2026-05-12T14:14:41.000000Z\",\"updated_at\":\"2026-05-12T14:14:41.000000Z\"}', '{\"id\":43,\"nama\":\"d\",\"tanggal_lahir\":\"2026-05-06\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778595281_Screenshot (5).png\",\"paket_id\":\"17\",\"created_at\":\"2026-05-12T14:14:41.000000Z\",\"updated_at\":\"2026-05-15T19:38:36.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 12:38:36', '2026-05-15 12:38:36'),
(111, 1, 'paket_umroh', 'UPDATE', 'Mengubah jamaah mandiri', '{\"id\":47,\"nama\":\"Faisal Hafis\",\"tanggal_lahir\":\"2026-05-13\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778605833_Screenshot (14).png\",\"paket_id\":30,\"created_at\":\"2026-05-12T17:10:33.000000Z\",\"updated_at\":\"2026-05-12T17:10:33.000000Z\"}', '{\"id\":47,\"nama\":\"Faisal Hafis\",\"tanggal_lahir\":\"2026-05-13\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778605833_Screenshot (14).png\",\"paket_id\":\"17\",\"created_at\":\"2026-05-12T17:10:33.000000Z\",\"updated_at\":\"2026-05-15T19:38:47.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 12:38:47', '2026-05-15 12:38:47'),
(112, 1, 'jamaah_agen', 'CREATE', 'Menambahkan jamaah agen baru', NULL, '{\"agen_id\":\"3\",\"nama\":\"coba agen test\",\"tanggal_lahir\":\"2026-05-16\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"8999999\",\"scan_passport\":\"1778874688_namiroh.png\",\"paket_id\":\"32\",\"updated_at\":\"2026-05-15T19:51:28.000000Z\",\"created_at\":\"2026-05-15T19:51:28.000000Z\",\"id\":6}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 12:51:28', '2026-05-15 12:51:28'),
(113, 1, 'jamaah_agen', 'CREATE', 'Menambahkan jamaah agen baru', NULL, '{\"agen_id\":\"6\",\"nama\":\"coba terbaru\",\"tanggal_lahir\":\"2026-05-16\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"7777777\",\"scan_passport\":\"1778876216_namiroh.png\",\"paket_id\":\"19\",\"updated_at\":\"2026-05-15T20:16:56.000000Z\",\"created_at\":\"2026-05-15T20:16:56.000000Z\",\"id\":7}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 13:16:56', '2026-05-15 13:16:56'),
(114, 1, 'jamaah_agen', 'CREATE', 'Menambahkan jamaah agen baru', NULL, '{\"agen_id\":\"3\",\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"2026-05-16\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"44444444444\",\"scan_passport\":\"1778876948_Diagram Tanpa Judul.drawio (2).png\",\"paket_id\":\"19\",\"updated_at\":\"2026-05-15T20:29:08.000000Z\",\"created_at\":\"2026-05-15T20:29:08.000000Z\",\"id\":8}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 13:29:08', '2026-05-15 13:29:08'),
(115, 1, 'paket_umroh', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":38,\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"1998-04-11\",\"umur\":28,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778848323_Cuplikan layar 2023-11-17 105439.png\",\"paket_id\":17,\"created_at\":\"2026-02-16T02:58:03.000000Z\",\"updated_at\":\"2026-05-15T19:38:23.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 13:48:34', '2026-05-15 13:48:34'),
(116, 1, 'paket_umroh', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":49,\"nama\":\"induksi\",\"tanggal_lahir\":\"2026-05-14\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"89\",\"scan_passport\":\"1778774169_WIN_20231108_12_00_57_Pro.jpg\",\"paket_id\":17,\"created_at\":\"2026-05-14T15:56:09.000000Z\",\"updated_at\":\"2026-05-15T19:23:15.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 13:49:10', '2026-05-15 13:49:10'),
(117, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":33,\"nama\":\"rrrr\",\"tanggal\":\"2026-05-15\",\"quota\":456,\"hotel_id\":null,\"maskapai_id\":3,\"created_at\":\"2026-05-14T17:24:09.000000Z\",\"updated_at\":\"2026-05-14T17:24:09.000000Z\"}', '{\"id\":33,\"nama\":\"rrrr\",\"tanggal\":\"2026-05-15\",\"quota\":\"456\",\"hotel_id\":\"8\",\"maskapai_id\":null,\"created_at\":\"2026-05-14T17:24:09.000000Z\",\"updated_at\":\"2026-05-17T05:17:11.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-16 22:17:11', '2026-05-16 22:17:11'),
(118, 1, 'agen', 'CREATE', 'Menambahkan jamaah mandiri baru', NULL, '{\"nama\":\"isal\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"4\",\"scan_passport\":\"1778995779_4ec1dc8fe806ed71c7cbc36641f8cab7.jpg\",\"paket_id\":\"18\",\"updated_at\":\"2026-05-17T05:29:40.000000Z\",\"created_at\":\"2026-05-17T05:29:40.000000Z\",\"id\":54}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-16 22:29:40', '2026-05-16 22:29:40'),
(119, 1, 'agen', 'CREATE', 'Menambahkan jamaah mandiri baru', NULL, '{\"nama\":\"isla cobak\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"333\",\"scan_passport\":\"1778995929_6a0952d9c3084.jpg\",\"paket_id\":\"17\",\"updated_at\":\"2026-05-17T05:32:09.000000Z\",\"created_at\":\"2026-05-17T05:32:09.000000Z\",\"id\":55}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-16 22:32:09', '2026-05-16 22:32:09'),
(120, 1, 'agen', 'CREATE', 'Menambahkan jamaah mandiri baru', NULL, '{\"nama\":\"isal fix sayang\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"r09999\",\"scan_passport\":\"1778996513_6a09552103bd3.jpg\",\"paket_id\":\"17\",\"updated_at\":\"2026-05-17T05:41:53.000000Z\",\"created_at\":\"2026-05-17T05:41:53.000000Z\",\"id\":56}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-16 22:41:53', '2026-05-16 22:41:53'),
(121, 1, 'agen', 'CREATE', 'Menambahkan jamaah mandiri baru', NULL, '{\"nama\":\"isalfixganteng sekali\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"3444\",\"scan_passport\":\"1778996761_6a095619330bf.jpg\",\"paket_id\":\"30\",\"updated_at\":\"2026-05-17T05:46:01.000000Z\",\"created_at\":\"2026-05-17T05:46:01.000000Z\",\"id\":57}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-16 22:46:01', '2026-05-16 22:46:01'),
(122, 1, 'agen', 'CREATE', 'Menambahkan jamaah mandiri baru', NULL, '{\"nama\":\"coba terbaru 1\",\"tanggal_lahir\":\"2026-04-26\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"89\",\"scan_passport\":\"1778997203_6a0957d30c634.jpeg\",\"paket_id\":\"17\",\"updated_at\":\"2026-05-17T05:53:23.000000Z\",\"created_at\":\"2026-05-17T05:53:23.000000Z\",\"id\":58}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-16 22:53:23', '2026-05-16 22:53:23'),
(123, 1, 'agen', 'CREATE', 'Menambahkan manifest baru', NULL, '{\"jamaah_id\":57,\"tipe\":\"mandiri\",\"paket_id\":30,\"nama\":\"isalfixganteng sekali\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"3444\",\"agen_id\":null,\"updated_at\":\"2026-05-17T06:18:01.000000Z\",\"created_at\":\"2026-05-17T06:18:01.000000Z\",\"id\":12}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-16 23:18:01', '2026-05-16 23:18:01'),
(124, 1, 'agen', 'CREATE', 'Menambahkan manifest baru', NULL, '{\"jamaah_id\":58,\"tipe\":\"mandiri\",\"paket_id\":17,\"nama\":\"coba terbaru 1\",\"tanggal_lahir\":\"2026-04-26\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"89\",\"agen_id\":null,\"updated_at\":\"2026-05-17T06:21:28.000000Z\",\"created_at\":\"2026-05-17T06:21:28.000000Z\",\"id\":13}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-16 23:21:28', '2026-05-16 23:21:28'),
(125, 1, 'manifest', 'CREATE', 'Menambahkan manifest mandiri', NULL, '{\"jamaah_id\":54,\"tipe\":\"mandiri\",\"paket_id\":18,\"nama\":\"isal\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"4\",\"agen_id\":null,\"updated_at\":\"2026-05-17T06:51:32.000000Z\",\"created_at\":\"2026-05-17T06:51:32.000000Z\",\"id\":16}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-16 23:51:32', '2026-05-16 23:51:32'),
(126, 1, 'jamaah_mandiri', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":43,\"nama\":\"d\",\"tanggal_lahir\":\"2026-05-06\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778595281_Screenshot (5).png\",\"paket_id\":17,\"created_at\":\"2026-05-12T14:14:41.000000Z\",\"updated_at\":\"2026-05-15T19:38:36.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-16 23:57:26', '2026-05-16 23:57:26'),
(127, 1, 'jamaah_agen', 'DELETE', 'Menghapus jamaah agen', '{\"id\":8,\"agen_id\":3,\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"2026-05-16\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"44444444444\",\"scan_passport\":\"1778876948_Diagram Tanpa Judul.drawio (2).png\",\"paket_id\":19,\"created_at\":\"2026-05-15T20:29:08.000000Z\",\"updated_at\":\"2026-05-15T20:29:08.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-16 23:58:14', '2026-05-16 23:58:14'),
(128, 1, 'manifest', 'CREATE', 'Menambahkan manifest agen', NULL, '{\"jamaah_id\":7,\"tipe\":\"agen\",\"paket_id\":19,\"agen_id\":6,\"nama\":\"coba terbaru\",\"tanggal_lahir\":\"2026-05-16\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"7777777\",\"updated_at\":\"2026-05-17T07:01:40.000000Z\",\"created_at\":\"2026-05-17T07:01:40.000000Z\",\"id\":17}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 00:01:40', '2026-05-17 00:01:40'),
(129, 1, 'jamaah_agen', 'CREATE', 'Menambahkan jamaah agen baru', NULL, '{\"agen_id\":\"3\",\"nama\":\"Faisal Hafis 1\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"891\",\"scan_passport\":\"1779002121_6a096b09b9bdb.jpg\",\"paket_id\":\"17\",\"updated_at\":\"2026-05-17T07:15:21.000000Z\",\"created_at\":\"2026-05-17T07:15:21.000000Z\",\"id\":9}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 00:15:21', '2026-05-17 00:15:21'),
(130, 1, 'manifest', 'CREATE', 'Menambahkan manifest agen', NULL, '{\"jamaah_id\":9,\"tipe\":\"agen\",\"paket_id\":17,\"agen_id\":3,\"nama\":\"Faisal Hafis 1\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"891\",\"updated_at\":\"2026-05-17T07:15:28.000000Z\",\"created_at\":\"2026-05-17T07:15:28.000000Z\",\"id\":18}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 00:15:28', '2026-05-17 00:15:28'),
(131, 1, 'jamaah_mandiri', 'CREATE', 'Menambahkan jamaah mandiri baru', NULL, '{\"nama\":\"hhhh\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"hhhh\",\"scan_passport\":\"1779002337_6a096be132eae.jpg\",\"paket_id\":\"18\",\"updated_at\":\"2026-05-17T07:18:57.000000Z\",\"created_at\":\"2026-05-17T07:18:57.000000Z\",\"id\":59}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-17 00:18:57', '2026-05-17 00:18:57'),
(132, 1, 'manifest', 'CREATE', 'Menambahkan manifest mandiri', NULL, '{\"jamaah_id\":59,\"tipe\":\"mandiri\",\"paket_id\":18,\"nama\":\"hhhh\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"hhhh\",\"agen_id\":null,\"updated_at\":\"2026-05-17T07:19:03.000000Z\",\"created_at\":\"2026-05-17T07:19:03.000000Z\",\"id\":19}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-17 00:19:03', '2026-05-17 00:19:03'),
(133, 1, 'jamaah_mandiri', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":46,\"nama\":\"coba ya\",\"tanggal_lahir\":\"2026-04-26\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"8999999\",\"scan_passport\":\"1778605287_Screenshot (13).png\",\"paket_id\":30,\"created_at\":\"2026-05-12T17:01:27.000000Z\",\"updated_at\":\"2026-05-12T17:01:27.000000Z\",\"is_manifest\":0}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-17 00:22:20', '2026-05-17 00:22:20'),
(134, 1, 'jamaah_mandiri', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":47,\"nama\":\"Faisal Hafis\",\"tanggal_lahir\":\"2026-05-13\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"12345654321\",\"scan_passport\":\"1778605833_Screenshot (14).png\",\"paket_id\":17,\"created_at\":\"2026-05-12T17:10:33.000000Z\",\"updated_at\":\"2026-05-15T19:38:47.000000Z\",\"is_manifest\":0}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-17 00:22:26', '2026-05-17 00:22:26'),
(135, 1, 'jamaah_mandiri', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":48,\"nama\":\"coba jamaah garuda\",\"tanggal_lahir\":\"2026-05-29\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"8999999\",\"scan_passport\":\"1778657106_Screenshot (1).png\",\"paket_id\":18,\"created_at\":\"2026-05-13T07:25:07.000000Z\",\"updated_at\":\"2026-05-13T15:09:44.000000Z\",\"is_manifest\":0}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-17 00:22:31', '2026-05-17 00:22:31'),
(136, 1, 'jamaah_mandiri', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":54,\"nama\":\"isal\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"4\",\"scan_passport\":\"1778995779_4ec1dc8fe806ed71c7cbc36641f8cab7.jpg\",\"paket_id\":18,\"created_at\":\"2026-05-17T05:29:40.000000Z\",\"updated_at\":\"2026-05-17T05:29:40.000000Z\",\"is_manifest\":0}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-17 00:22:36', '2026-05-17 00:22:36'),
(137, 1, 'jamaah_mandiri', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":55,\"nama\":\"isla cobak\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"333\",\"scan_passport\":\"1778995929_6a0952d9c3084.jpg\",\"paket_id\":17,\"created_at\":\"2026-05-17T05:32:09.000000Z\",\"updated_at\":\"2026-05-17T05:32:09.000000Z\",\"is_manifest\":0}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-17 00:22:42', '2026-05-17 00:22:42'),
(138, 1, 'jamaah_mandiri', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":56,\"nama\":\"isal fix sayang\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"r09999\",\"scan_passport\":\"1778996513_6a09552103bd3.jpg\",\"paket_id\":17,\"created_at\":\"2026-05-17T05:41:53.000000Z\",\"updated_at\":\"2026-05-17T05:41:53.000000Z\",\"is_manifest\":0}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-17 00:22:48', '2026-05-17 00:22:48'),
(139, 1, 'jamaah_mandiri', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":58,\"nama\":\"coba terbaru 1\",\"tanggal_lahir\":\"2026-04-26\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"89\",\"scan_passport\":\"1778997203_6a0957d30c634.jpeg\",\"paket_id\":17,\"created_at\":\"2026-05-17T05:53:23.000000Z\",\"updated_at\":\"2026-05-17T05:53:23.000000Z\",\"is_manifest\":0}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-17 00:22:53', '2026-05-17 00:22:53'),
(140, 1, 'jamaah_mandiri', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":57,\"nama\":\"isalfixganteng sekali\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"3444\",\"scan_passport\":\"1778996761_6a095619330bf.jpg\",\"paket_id\":30,\"created_at\":\"2026-05-17T05:46:01.000000Z\",\"updated_at\":\"2026-05-17T05:46:01.000000Z\",\"is_manifest\":0}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-17 00:22:58', '2026-05-17 00:22:58'),
(141, 1, 'jamaah_agen', 'DELETE', 'Menghapus jamaah agen', '{\"id\":9,\"agen_id\":3,\"nama\":\"Faisal Hafis 1\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"891\",\"scan_passport\":\"1779002121_6a096b09b9bdb.jpg\",\"paket_id\":17,\"created_at\":\"2026-05-17T07:15:21.000000Z\",\"updated_at\":\"2026-05-17T07:15:21.000000Z\",\"is_manifest\":0}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-17 00:23:12', '2026-05-17 00:23:12'),
(142, 1, 'jamaah_agen', 'DELETE', 'Menghapus jamaah agen', '{\"id\":6,\"agen_id\":3,\"nama\":\"coba agen test\",\"tanggal_lahir\":\"2026-05-16\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"8999999\",\"scan_passport\":\"1778874688_namiroh.png\",\"paket_id\":32,\"created_at\":\"2026-05-15T19:51:28.000000Z\",\"updated_at\":\"2026-05-15T19:51:28.000000Z\",\"is_manifest\":0}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-17 00:23:17', '2026-05-17 00:23:17'),
(143, 1, 'jamaah_agen', 'DELETE', 'Menghapus jamaah agen', '{\"id\":7,\"agen_id\":6,\"nama\":\"coba terbaru\",\"tanggal_lahir\":\"2026-05-16\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"7777777\",\"scan_passport\":\"1778876216_namiroh.png\",\"paket_id\":19,\"created_at\":\"2026-05-15T20:16:56.000000Z\",\"updated_at\":\"2026-05-15T20:16:56.000000Z\",\"is_manifest\":0}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-17 00:23:23', '2026-05-17 00:23:23'),
(144, 1, 'jamaah_mandiri', 'CREATE', 'Menambahkan jamaah mandiri baru', NULL, '{\"nama\":\"hhhh 1\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"hh444\",\"scan_passport\":\"1779002649_6a096d1937e19.jpg\",\"paket_id\":\"17\",\"updated_at\":\"2026-05-17T07:24:09.000000Z\",\"created_at\":\"2026-05-17T07:24:09.000000Z\",\"id\":60}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-17 00:24:09', '2026-05-17 00:24:09'),
(145, 1, 'manifest', 'CREATE', 'Menambahkan manifest mandiri', NULL, '{\"jamaah_id\":60,\"tipe\":\"mandiri\",\"paket_id\":17,\"nama\":\"hhhh 1\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"hh444\",\"agen_id\":null,\"updated_at\":\"2026-05-17T07:24:14.000000Z\",\"created_at\":\"2026-05-17T07:24:14.000000Z\",\"id\":20}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', '2026-05-17 00:24:14', '2026-05-17 00:24:14'),
(146, 1, 'paket_umroh', 'DELETE', 'Menghapus paket umroh', '{\"id\":34,\"nama\":\"oi\",\"tanggal\":\"2026-04-26\",\"quota\":12,\"hotel_id\":null,\"maskapai_id\":6,\"created_at\":\"2026-05-14T17:29:29.000000Z\",\"updated_at\":\"2026-05-15T12:06:03.000000Z\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 00:27:00', '2026-05-17 00:27:00'),
(147, 1, 'maskapai', 'CREATE', 'Menambahkan maskapai baru', NULL, '{\"nama_maskapai\":\"Garuda Indonesia\",\"kode_maskapai\":\"001\",\"jumlah_seat\":\"1\",\"status\":\"1\",\"updated_at\":\"2026-05-17T07:33:20.000000Z\",\"created_at\":\"2026-05-17T07:33:20.000000Z\",\"id\":7}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 00:33:20', '2026-05-17 00:33:20'),
(148, 1, 'hotel', 'CREATE', 'Menambahkan hotel baru', NULL, '{\"nama_hotel\":\"Al Mukarom\",\"lokasi\":\"Makkah\",\"jumlah_seat\":1,\"status\":true,\"updated_at\":\"2026-05-17T07:33:43.000000Z\",\"created_at\":\"2026-05-17T07:33:43.000000Z\",\"id\":9}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 00:33:43', '2026-05-17 00:33:43'),
(149, 1, 'paket_umroh', 'CREATE', 'Menambahkan paket umroh baru', NULL, '{\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal\":\"2026-05-17\",\"hotel_id\":\"9\",\"maskapai_id\":\"7\",\"quota\":\"1\",\"updated_at\":\"2026-05-17T07:34:05.000000Z\",\"created_at\":\"2026-05-17T07:34:05.000000Z\",\"id\":41}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 00:34:06', '2026-05-17 00:34:06'),
(150, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":41,\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal\":\"2026-05-17\",\"quota\":1,\"hotel_id\":9,\"maskapai_id\":7,\"created_at\":\"2026-05-17T07:34:05.000000Z\",\"updated_at\":\"2026-05-17T07:34:05.000000Z\"}', '{\"id\":41,\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal\":\"2026-05-17\",\"quota\":\"2\",\"hotel_id\":\"9\",\"maskapai_id\":\"7\",\"created_at\":\"2026-05-17T07:34:05.000000Z\",\"updated_at\":\"2026-05-17T07:34:15.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 00:34:15', '2026-05-17 00:34:15'),
(151, 1, 'jamaah_mandiri', 'CREATE', 'Menambahkan jamaah mandiri baru', NULL, '{\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"1998-11-04\",\"umur\":27,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"1\",\"scan_passport\":\"1779003297_6a096fa14a674.jpg\",\"paket_id\":\"41\",\"updated_at\":\"2026-05-17T07:34:57.000000Z\",\"created_at\":\"2026-05-17T07:34:57.000000Z\",\"id\":61}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 00:34:57', '2026-05-17 00:34:57'),
(152, 1, 'agen', 'CREATE', 'Menambahkan agen umroh baru', NULL, '{\"nama_agen\":\"Faisal\",\"kontak\":\"234\",\"status\":\"1\",\"alamat\":\"Mojokerto\",\"updated_at\":\"2026-05-17T07:36:05.000000Z\",\"created_at\":\"2026-05-17T07:36:05.000000Z\",\"id\":12}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 00:36:05', '2026-05-17 00:36:05'),
(153, 1, 'jamaah_agen', 'CREATE', 'Menambahkan jamaah agen baru', NULL, '{\"agen_id\":\"12\",\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"1\",\"scan_passport\":\"1779003400_6a09700873659.jpg\",\"paket_id\":\"41\",\"updated_at\":\"2026-05-17T07:36:40.000000Z\",\"created_at\":\"2026-05-17T07:36:40.000000Z\",\"id\":10}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 00:36:40', '2026-05-17 00:36:40'),
(154, 1, 'manifest', 'CREATE', 'Menambahkan manifest mandiri', NULL, '{\"jamaah_id\":61,\"tipe\":\"mandiri\",\"paket_id\":41,\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"1998-11-04\",\"umur\":27,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"1\",\"agen_id\":null,\"updated_at\":\"2026-05-17T07:39:55.000000Z\",\"created_at\":\"2026-05-17T07:39:55.000000Z\",\"id\":21}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 00:39:55', '2026-05-17 00:39:55'),
(155, 1, 'manifest', 'CREATE', 'Menambahkan manifest agen', NULL, '{\"jamaah_id\":10,\"tipe\":\"agen\",\"paket_id\":41,\"agen_id\":12,\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"1\",\"updated_at\":\"2026-05-17T07:40:05.000000Z\",\"created_at\":\"2026-05-17T07:40:05.000000Z\",\"id\":22}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 00:40:05', '2026-05-17 00:40:05'),
(156, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":41,\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal\":\"2026-05-17\",\"quota\":2,\"hotel_id\":9,\"maskapai_id\":7,\"created_at\":\"2026-05-17T07:34:05.000000Z\",\"updated_at\":\"2026-05-17T07:34:15.000000Z\"}', '{\"id\":41,\"nama\":\"Paket 1\",\"tanggal\":\"2026-05-17\",\"quota\":\"2\",\"hotel_id\":null,\"maskapai_id\":null,\"created_at\":\"2026-05-17T07:34:05.000000Z\",\"updated_at\":\"2026-05-17T07:40:59.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 00:40:59', '2026-05-17 00:40:59');
INSERT INTO `activity_logs` (`id`, `user_id`, `module`, `action`, `description`, `old_data`, `new_data`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(157, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":41,\"nama\":\"Paket 1\",\"tanggal\":\"2026-05-17\",\"quota\":2,\"hotel_id\":null,\"maskapai_id\":null,\"created_at\":\"2026-05-17T07:34:05.000000Z\",\"updated_at\":\"2026-05-17T07:40:59.000000Z\"}', '{\"id\":41,\"nama\":\"Paket 1\",\"tanggal\":\"2026-05-17\",\"quota\":\"2\",\"hotel_id\":\"9\",\"maskapai_id\":\"7\",\"created_at\":\"2026-05-17T07:34:05.000000Z\",\"updated_at\":\"2026-05-17T07:42:23.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 00:42:23', '2026-05-17 00:42:23'),
(158, 1, 'paket_umroh', 'CREATE', 'Menambahkan paket umroh baru', NULL, '{\"nama\":\"Paket 2\",\"tanggal\":\"2026-05-17\",\"hotel_id\":\"9\",\"maskapai_id\":\"7\",\"quota\":\"1\",\"updated_at\":\"2026-05-17T08:14:30.000000Z\",\"created_at\":\"2026-05-17T08:14:30.000000Z\",\"id\":42}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 01:14:30', '2026-05-17 01:14:30'),
(159, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":42,\"nama\":\"Paket 2\",\"tanggal\":\"2026-05-17\",\"quota\":1,\"hotel_id\":9,\"maskapai_id\":7,\"created_at\":\"2026-05-17T08:14:30.000000Z\",\"updated_at\":\"2026-05-17T08:14:30.000000Z\"}', '{\"id\":42,\"nama\":\"Paket 2\",\"tanggal\":\"2026-05-17\",\"quota\":\"2\",\"hotel_id\":null,\"maskapai_id\":null,\"created_at\":\"2026-05-17T08:14:30.000000Z\",\"updated_at\":\"2026-05-17T08:15:01.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 01:15:01', '2026-05-17 01:15:01'),
(160, 1, 'paket_umroh', 'UPDATE', 'Mengubah data paket umroh', '{\"id\":42,\"nama\":\"Paket 2\",\"tanggal\":\"2026-05-17\",\"quota\":2,\"hotel_id\":null,\"maskapai_id\":null,\"created_at\":\"2026-05-17T08:14:30.000000Z\",\"updated_at\":\"2026-05-17T08:15:01.000000Z\"}', '{\"id\":42,\"nama\":\"Paket 2\",\"tanggal\":\"2026-05-17\",\"quota\":\"2\",\"hotel_id\":\"9\",\"maskapai_id\":\"7\",\"created_at\":\"2026-05-17T08:14:30.000000Z\",\"updated_at\":\"2026-05-17T08:15:13.000000Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 01:15:13', '2026-05-17 01:15:13'),
(161, 1, 'jamaah_mandiri', 'CREATE', 'Menambahkan jamaah mandiri baru', NULL, '{\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"8999999\",\"scan_passport\":\"1779005738_6a09792af3d17.jpg\",\"paket_id\":\"42\",\"updated_at\":\"2026-05-17T08:15:39.000000Z\",\"created_at\":\"2026-05-17T08:15:39.000000Z\",\"id\":62}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 01:15:39', '2026-05-17 01:15:39'),
(162, 1, 'jamaah_mandiri', 'CREATE', 'Menambahkan jamaah mandiri baru', NULL, '{\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"89\",\"scan_passport\":\"1779005761_6a09794165c9b.jpg\",\"paket_id\":\"42\",\"updated_at\":\"2026-05-17T08:16:01.000000Z\",\"created_at\":\"2026-05-17T08:16:01.000000Z\",\"id\":63}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 01:16:01', '2026-05-17 01:16:01'),
(163, 1, 'jamaah_mandiri', 'DELETE', 'Menghapus jamaah mandiri', '{\"id\":62,\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"8999999\",\"scan_passport\":\"1779005738_6a09792af3d17.jpg\",\"paket_id\":42,\"created_at\":\"2026-05-17T08:15:39.000000Z\",\"updated_at\":\"2026-05-17T08:15:39.000000Z\",\"is_manifest\":0}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 01:16:17', '2026-05-17 01:16:17'),
(164, 1, 'manifest', 'CREATE', 'Menambahkan manifest mandiri', NULL, '{\"jamaah_id\":63,\"tipe\":\"mandiri\",\"paket_id\":42,\"nama\":\"M. HADI JAYA HABIBILLAH\",\"tanggal_lahir\":\"2026-05-17\",\"umur\":0,\"jenis_kelamin\":\"L\",\"nomor_passport\":\"89\",\"agen_id\":null,\"updated_at\":\"2026-05-17T08:16:35.000000Z\",\"created_at\":\"2026-05-17T08:16:35.000000Z\",\"id\":23}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-17 01:16:35', '2026-05-17 01:16:35'),
(165, 1, 'manifest', 'EXPORT', 'Export data manifest', NULL, '{\"paket_id\":\"42\",\"tipe\":\"mandiri\",\"tanggal_export\":\"2026-05-18T08:25:22.671757Z\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-18 01:25:22', '2026-05-18 01:25:22'),
(166, 1, 'jamaah_mandiri', 'CREATE', 'Menambahkan jamaah mandiri baru', NULL, '{\"nama\":\"FAISAL HAFIS SAPUTRA\",\"tanggal_lahir\":\"2026-05-18\",\"umur\":0,\"jenis_kelamin\":\"P\",\"nomor_passport\":\"8999999\",\"scan_passport\":\"1779093018_6a0ace1ae4202.jpg\",\"paket_id\":\"42\",\"updated_at\":\"2026-05-18T08:30:20.000000Z\",\"created_at\":\"2026-05-18T08:30:20.000000Z\",\"id\":64}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-18 01:30:20', '2026-05-18 01:30:20');

-- --------------------------------------------------------

--
-- Table structure for table `agen`
--

CREATE TABLE `agen` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_agen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kontak` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agen`
--

INSERT INTO `agen` (`id`, `nama_agen`, `kontak`, `alamat`, `status`, `created_at`, `updated_at`) VALUES
(12, 'Faisal', '234', 'Mojokerto', 1, '2026-05-17 00:36:05', '2026-05-17 00:36:05');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_hotel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_seat` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `nama_hotel`, `lokasi`, `jumlah_seat`, `status`, `created_at`, `updated_at`) VALUES
(9, 'Al Mukarom', 'Makkah', 1, 1, '2026-05-17 00:33:43', '2026-05-17 00:33:43');

-- --------------------------------------------------------

--
-- Table structure for table `jamaah_agen`
--

CREATE TABLE `jamaah_agen` (
  `id` bigint UNSIGNED NOT NULL,
  `agen_id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `umur` int NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_passport` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scan_passport` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paket_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_manifest` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jamaah_agen`
--

INSERT INTO `jamaah_agen` (`id`, `agen_id`, `nama`, `tanggal_lahir`, `umur`, `jenis_kelamin`, `nomor_passport`, `scan_passport`, `paket_id`, `created_at`, `updated_at`, `is_manifest`) VALUES
(10, 12, 'FAISAL HAFIS SAPUTRA', '2026-05-17', 0, 'L', '1', '1779003400_6a09700873659.jpg', 41, '2026-05-17 00:36:40', '2026-05-17 00:40:05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jamaah_mandiri`
--

CREATE TABLE `jamaah_mandiri` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `umur` int NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_passport` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scan_passport` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paket_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_manifest` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jamaah_mandiri`
--

INSERT INTO `jamaah_mandiri` (`id`, `nama`, `tanggal_lahir`, `umur`, `jenis_kelamin`, `nomor_passport`, `scan_passport`, `paket_id`, `created_at`, `updated_at`, `is_manifest`) VALUES
(61, 'M. HADI JAYA HABIBILLAH', '1998-11-04', 27, 'L', '1', '1779003297_6a096fa14a674.jpg', 41, '2026-05-17 00:34:57', '2026-05-17 00:39:55', 1),
(63, 'M. HADI JAYA HABIBILLAH', '2026-05-17', 0, 'L', '89', '1779005761_6a09794165c9b.jpg', 42, '2026-05-17 01:16:01', '2026-05-17 01:16:35', 1),
(64, 'FAISAL HAFIS SAPUTRA', '2026-05-18', 0, 'P', '8999999', '1779093018_6a0ace1ae4202.jpg', 42, '2026-05-18 01:30:20', '2026-05-18 01:30:20', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manifest1s`
--

CREATE TABLE `manifest1s` (
  `id` bigint UNSIGNED NOT NULL,
  `tipe` enum('mandiri','agen') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jamaah_id` bigint UNSIGNED NOT NULL,
  `paket_id` bigint UNSIGNED DEFAULT NULL,
  `tanggal_export` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `umur` int DEFAULT NULL,
  `jenis_kelamin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_passport` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agen_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manifest1s`
--

INSERT INTO `manifest1s` (`id`, `tipe`, `jamaah_id`, `paket_id`, `tanggal_export`, `created_at`, `updated_at`, `nama`, `tanggal_lahir`, `umur`, `jenis_kelamin`, `nomor_passport`, `agen_id`) VALUES
(21, 'mandiri', 61, 41, '2026-05-18 01:15:33', '2026-05-17 00:39:55', '2026-05-18 01:15:33', 'M. HADI JAYA HABIBILLAH', '1998-11-04', 27, 'L', '1', NULL),
(22, 'agen', 10, 41, NULL, '2026-05-17 00:40:05', '2026-05-17 00:40:05', 'FAISAL HAFIS SAPUTRA', '2026-05-17', 0, 'L', '1', 12),
(23, 'mandiri', 63, 42, '2026-05-18 01:25:22', '2026-05-17 01:16:35', '2026-05-18 01:25:22', 'M. HADI JAYA HABIBILLAH', '2026-05-17', 0, 'L', '89', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maskapai`
--

CREATE TABLE `maskapai` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_maskapai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_maskapai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_seat` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maskapai`
--

INSERT INTO `maskapai` (`id`, `nama_maskapai`, `kode_maskapai`, `jumlah_seat`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Garuda Indonesia', '001', 1, 1, '2026-05-17 00:33:20', '2026-05-17 00:33:20');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `group_id`, `name`, `route`, `created_at`, `updated_at`) VALUES
(1, 2, 'Data Paket', 'paket-umroh.index', NULL, NULL),
(2, 2, 'Data Agen', 'agen.index', NULL, NULL),
(3, 2, 'Data Maskapai', 'maskapai.index', NULL, NULL),
(4, 2, 'Data Hotel', 'hotel.index', NULL, NULL),
(5, 3, 'Jamaah Kantor', 'jamaah.mandiri', NULL, NULL),
(6, 3, 'Jamaah Agen', 'jamaah.agen', NULL, NULL),
(7, 4, 'Manifest', 'manifest.index', NULL, NULL),
(8, 5, 'Rekap Jamaah', 'laporan.jamaah', NULL, NULL),
(9, 5, 'Rekap Manifest', 'laporan.manifest', NULL, NULL),
(10, 5, 'Rekap Agen', 'laporan.agen', NULL, NULL),
(11, 5, 'Rekap Paket', 'laporan.paket', NULL, NULL),
(12, 5, 'Rekap Maskapai', 'laporan.maskapai', NULL, NULL),
(13, 5, 'Rekap Hotel', 'laporan.hotel', NULL, NULL),
(14, 6, 'Role User', 'role-user.index', NULL, NULL),
(15, 6, 'Role Menu', 'role-menu.index', NULL, NULL),
(16, 7, 'Log Histori', 'activity-log.index', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_groups`
--

CREATE TABLE `menu_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_groups`
--

INSERT INTO `menu_groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', NULL, NULL),
(2, 'master_data', NULL, NULL),
(3, 'master_jamaah', NULL, NULL),
(4, 'manifest', NULL, NULL),
(5, 'laporan_rekap', NULL, NULL),
(6, 'pengaturan', NULL, NULL),
(7, 'log_histori', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_02_08_000000_create_paket_umrohs_table', 1),
(5, '2026_02_09_043702_create_agen_table', 1),
(6, '2026_02_09_043721_create_jamaah_mandiri_table', 1),
(7, '2026_02_09_043728_create_jamaah_agen_table', 1),
(8, '2026_02_09_043737_create_xero_tokens_table', 1),
(9, '2026_02_09_062326_create_manifest_table', 1),
(10, '2026_05_10_213332_create_manifest1s_table', 2),
(11, '2026_05_11_052639_add_detail_jamaah_to_manifest1s_table', 3),
(12, '2026_05_12_123717_create_hotels_table', 4),
(13, '2026_05_12_124421_create_hotels_table', 5),
(15, '2026_05_12_130245_create_maskapai_table', 6),
(16, '2026_05_12_162532_add_quota_to_paket_umroh_table', 7),
(17, '2026_05_12_172409_add_status_to_agen_table', 8),
(18, '2026_05_12_175205_add_alamat_to_agen_table', 9),
(19, '2026_05_13_121617_create_roles_table', 10),
(20, '2026_05_13_121625_create_menu_groups_table', 10),
(21, '2026_05_13_121626_create_menus_table', 10),
(22, '2026_05_13_121627_create_role_menu_table', 10),
(24, '2026_05_13_123827_add_role_id_to_users_table', 11),
(25, '2026_05_13_174320_fix_role_menu_structure', 12),
(26, '2026_05_14_162653_create_activity_logs_table', 12),
(27, '2026_05_17_070555_add_is_manifest_to_jamaah_tables', 13),
(28, '2026_05_18_080809_add_tanggal_export_to_manifest1s_table', 14);

-- --------------------------------------------------------

--
-- Table structure for table `paket_umrohs`
--

CREATE TABLE `paket_umrohs` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `quota` int NOT NULL DEFAULT '0',
  `hotel_id` bigint UNSIGNED DEFAULT NULL,
  `maskapai_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paket_umrohs`
--

INSERT INTO `paket_umrohs` (`id`, `nama`, `tanggal`, `quota`, `hotel_id`, `maskapai_id`, `created_at`, `updated_at`) VALUES
(41, 'Paket 1', '2026-05-17', 2, 9, 7, '2026-05-17 00:34:05', '2026-05-17 00:42:23'),
(42, 'Paket 2', '2026-05-17', 2, 9, 7, '2026-05-17 01:14:30', '2026-05-17 01:15:13');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'Customer Support', NULL, NULL),
(3, 'Manifest', NULL, NULL),
(4, 'Hotel dan Maskapai', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_menu`
--

CREATE TABLE `role_menu` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_menu`
--

INSERT INTO `role_menu` (`id`, `role_id`, `menu_id`, `status`, `created_at`, `updated_at`) VALUES
(56, 1, 1, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(57, 1, 2, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(58, 1, 3, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(59, 1, 4, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(60, 1, 5, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(61, 1, 6, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(62, 1, 7, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(63, 1, 8, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(64, 1, 9, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(65, 1, 10, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(66, 1, 11, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(67, 1, 12, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(68, 1, 13, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(69, 1, 14, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(70, 1, 15, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(71, 1, 16, 'active', '2026-05-13 13:04:26', '2026-05-13 13:04:26'),
(72, 2, 1, 'active', '2026-05-13 14:42:20', '2026-05-13 14:42:20'),
(73, 2, 2, 'active', '2026-05-13 14:42:20', '2026-05-13 14:42:20'),
(74, 2, 5, 'active', '2026-05-13 14:42:20', '2026-05-13 14:42:20'),
(75, 2, 6, 'active', '2026-05-13 14:42:20', '2026-05-13 14:42:20'),
(76, 4, 3, 'active', '2026-05-14 08:15:51', '2026-05-14 08:15:51'),
(77, 4, 4, 'active', '2026-05-14 08:15:51', '2026-05-14 08:15:51'),
(89, 3, 1, 'active', '2026-05-15 10:55:01', '2026-05-15 10:55:01'),
(90, 3, 2, 'active', '2026-05-15 10:55:01', '2026-05-15 10:55:01'),
(91, 3, 5, 'active', '2026-05-15 10:55:01', '2026-05-15 10:55:01'),
(92, 3, 6, 'active', '2026-05-15 10:55:01', '2026-05-15 10:55:01'),
(93, 3, 7, 'active', '2026-05-15 10:55:01', '2026-05-15 10:55:01');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0BjdhUV81TXORcHcLHTcvFyQhAq8mPZ6OZSxlNny', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2ZKUURwSnVsYjRQYmludHZMaVBsTnR6M0ZpcTdhcEEybmtGeW9JWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778679247),
('13If32pRCH4SUwQHvXlqXRo0xhpDIeeVWcq1eoVG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.119.1 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkpWTGNPN3pUcUdxYkZIemI2cjdxMDkwcmVxMzJSeHlzMmI3WDcxNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778680020),
('1N9Jx9jeMXmXyv3COXK4aT8yFgsfM2SMhC96DX7l', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicTRBalkxYmhtNGpUSllOd08zV0NOMnhzRXdCbWlqWXk4SXFGdVB4RCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvaG90ZWwiO3M6NToicm91dGUiO3M6MTE6ImhvdGVsLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1778682861),
('1Xbdfj3DnvLrvCgHSR2etBJFpHrDM1PexJql1Yo4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMW84MmlEQWJRZFREZmtBdTRscHZSbTRnWmJJQU1OTW45R1JDdzRoMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678301),
('2jb6gE9k0PT81ikK6wUi7Iuq8MhvMYnH8VTbVLtF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVk2dndSOUZTYkpmUm5YS21hT0pYTUNyblRVVjhGNHlsVmF2bjVRRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZ2VuIjtzOjU6InJvdXRlIjtzOjEwOiJhZ2VuLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1778677284),
('2tP4NG7FeVetopeKdUyF4yBa6ffSf1xJUOWFxGzi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3hKMmQ1TDVBN2lRdEN4YnFPN2tlam1aUFJjc3oxa2JWenZCc3AxNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778680053),
('3gEocgEP3oBPT2RHkHUfXe0vKkhYbBOLEZb0MqZi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUluOFRMNkN6V3R3emU0UkJlRk1OckEzR2dSNHBBUU8wZ3ByejdObSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9tYXNrYXBhaSI7czo1OiJyb3V0ZSI7czoxNDoibWFza2FwYWkuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678576),
('3waCbKVfQLcdFdQpohRvEjmWXvhQuT9UAFDhPz1w', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFpNMkVEakZMWjVxQldRdk9VR3AzTVFhd29XNWJwQU9jbzRyeDMzVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778679247),
('4g1O6oDtWNyycXzcwtssLLHnO56mUiYyXO9ZV3XS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0lOZU1nOW45NnhCdTFHUFlRdHByQThZaEx5NVp4TGhBSlV2T1NNeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678563),
('4jSLKWChgvbkAERSIacZK90ISyG3aYKRpYZ3PhfQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRW5WY25MOFpMYlljQ2I4U0NsNnNlWkVYd25ENWJBR05hcDVQWUtZNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdjEvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778680999),
('5gwv9m0A4Gcjf7eRBnrgJl81BT8PZp7EFkkXxH0C', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkdBbkhybWRWTFZpR1FNNXh0ZHhtRlZybVVYRzNUUnNBVGVram1pViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678907),
('5tf5khr9F63roRrTixebnds4ftz05bEXuQ403wAY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidG85TVlnSDNDdVBneEZadnM0aktEa1VYeW9hVXkzZ1hWenpmZDhXTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZ2VuIjtzOjU6InJvdXRlIjtzOjEwOiJhZ2VuLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1778680176),
('628JZlDv9O5C4r0kL7qV9lH0HpOZ9XwPqJMQvCXN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUNYM1k1ZXA1SHFsazNYcFc1d1ByME8zcnFSWndkdWFzaUk3TkRreSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678142),
('69m2JGXA3Bu1WRSm4QZjymnB4Xvt82iZO8bdkf4b', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnFWVlVabjk1V01zUHZVZVhaOHF4TjJTN3NEN2o4OGloVnZsRUIyWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778680173),
('6Dc0dIX6l6gmbIVjob1OXFQx0s96E1lLNUQrzgwC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakNvVE5VQ3VCRW9BcHdBeWhBM0Q0bHFrN3VXaFQ1d2xOMnplTFpnZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678163),
('7oArTzkhdJjvjnA3QOIkmkPIbUs8cXZhNvr1QgVm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiellJWkgzVGUzR3htbGdsVHlXYjRZczdtRmd3VHNGUlhCak40UDZwaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678254),
('8N2KSE0BARcgBw04lppjs4QAhkQZFr48Ige0EoyD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXhMWHpWdmhLRUFnMEQ1a3l4RHA1RlFES0NBTE5LbFJLMnZ5NHdoMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678142),
('9M63ISTKkKBV6NCohySDLKw8vOyiGqT3BdSamcvX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFV6bmh2TDR6VFljQU1BWE00aVZOZ1ZsT3lxRFZ3OUlxeFJRWjVCVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778677758),
('a2Hmb3REwEcqkP1hdoxyOSKTjz4hYSifYoP2SeEg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0RhWHRncWEwU2ZpN0JZMUU3VHNaNlFXYnJCa2NoTkU0NjBnQjdNdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778677757),
('a8bW5BF3AaNuMpfnFppaDZ44b2IRlWCICHYOoOL3', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNGl2eWw1WVFqa1Q2UWxqbWp4dmpPRlN5Z2x6TDZyVnpCOFJyQjJXcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZ2VuIjtzOjU6InJvdXRlIjtzOjEwOiJhZ2VuLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1778679244),
('A8q4XWHgN68KIhI6sUZZkGbJlibUQtOJZjZjUEUP', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGpGRHdSUDhNQTNPTHRlam94RXNwNUFRUDJYM2Z5OHIxSTc2MDl6WSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZ2VuIjtzOjU6InJvdXRlIjtzOjEwOiJhZ2VuLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1778678144),
('aHNplnCtFEQusLJVXKZJwfO6U4iRNffKZzW8jl2o', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicEM4RmRGQUJCcHE3SjliVWtaaEdLYjE1WWYwTVlYVGxCS3BTSmFQZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778679246),
('aizFj9L7wTgp8bXz75d9aTWOPTn9ChIgHUpHVKgo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXVmNkdxT1hzQ0FzVnBvOGg3dmdlT1I4Z3hLSFlIZlJJVG8zaGg2YiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkiO3M6NToicm91dGUiO3M6MTg6ImFwaS5tYXNrYXBhaS5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678576),
('asHnQA7nqt4UAXhZxP2u4URfeX5hab80bDe96V7U', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWl4YkNPZUtUZVlQNVlYbTVBU0RYSExUWUhjN0hFaHVUWE10STlybCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYWdlbiI7czo1OiJyb3V0ZSI7czoxNDoiYXBpLmFnZW4uaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678145),
('B2aFhjr7nOtxSUPVYiLGcsQYTcDNHqc2nDxheie5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnBtS1JBMW5YRXh4U2kwemF3ajA1RzdSa0F1TWlEWEJVSlBiWnVWcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtldC11bXJvaCI7czo1OiJyb3V0ZSI7czoxNzoicGFrZXQtdW1yb2guaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678253),
('BH4NeuClvTCbRzxJ1eRFoXxCYgVIDoEfy25m7eSR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia21oc2JMSjNoOWlTVE95TDNySnBIaWQ5MjhKSFRFU3JONEtBQWczdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvamFtYWFoLWFnZW4iO3M6NToicm91dGUiO3M6MjE6ImFwaS5qYW1hYWgtYWdlbi5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678585),
('brGMijtPLOIjdo5PS4mtFzouWSI56tJyjG0ZUgWZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGl6WmRJbnhvcFVKaGNhNXh6Wk56bEx2bzhmMWhxQlQ0VlBSdEZoNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678563),
('buuTzbd9ZvkUerNiDAxsnoAQfr1cfySuLPLpBhfc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmQxMzdOMWJxTkNoWU1VVlc0V25sNEQ2T0tIRTVTeHdqQ3lhVW12RCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678301),
('C9w3ovLluiMIIzBOUD7Fz68ZaTlKuCfV2Qj4puSC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicHhrdDRzdHJnZDNEQVF4Q2Z1eFF6Vjk5TFE5SGRSYXZZOE9YU1hxZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778677757),
('cADhrtW3QYfV9bBwEQ50tQ0JqARKrLtAtf5xmKiZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekh1Q0pyWHR0MU96WFVkajZjZUNrVGNzRmdJUlM1T2tMTzNyU3NHNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778677758),
('chcfZb09S0IbBnD4VgIViJ4aq9F0xt3o9pv7setX', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWmVKbzJ4akhpWmpjVHYxeUlZY2VTaFphblQybXdSUWl5dlJ4RTFqcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtldC11bXJvaCI7czo1OiJyb3V0ZSI7czoxNzoicGFrZXQtdW1yb2guaW5kZXgiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1778678563),
('cJ6F4COkUuxbKbfcYN8yfF0Eu0wrJq8yM9L2s5h2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXROdEVjQUhZUGFraEM5S1FadU93WThiVUttdVZPTU5JUGVHZXdubCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778680174),
('cleXN4MSkATpBMOI4F8j7uySqkTJzdXs9d35Azo0', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoid1IzUnp2c0x0M3RIenBxZUxYVW9mWVUybkJIVFBsUGdqYnpVWmhsVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtldC11bXJvaCI7czo1OiJyb3V0ZSI7czoxNzoicGFrZXQtdW1yb2guaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1778680052),
('co5WFvdR4A36mLP1JbgP4OfVXf26jjcLJb7jSGIL', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSnpOM1BFTW12ajJBNkNlVGNLRnpmRHdCaW5wWmpISzBQTEdzS3ZCUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtldC11bXJvaCI7czo1OiJyb3V0ZSI7czoxNzoicGFrZXQtdW1yb2guaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1778680716),
('cVNxutREcYx3nCiW2KvqrGQ4VqfMxearF09KyoNF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1lOYkMwdDBNbmZ4b1FkNlJMRHBEa3JWb09MMzd0MklYTkhoV3lDWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678254),
('CWany44q2ruc04OdxocFx3IUxTU4v1kQbZrr55s4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidURkdXgwcWI1VmZNMXhSY280SkF4Uk5HQVAwcGhoVENRNmpaVUN2biI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778680174),
('cXDRky6fE20tsLZaF8Hdvq9tgLwmOGqj523v35nN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnAzVVM2TTU4TkFBSGRaWm1ETkxrRVUyZkxNTEUyclMwOTU1ZWhyZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678143),
('DdXCAjZDQFB0ZM6uuc2akwbSkAMZGPU0MzgegDdo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGFNeXdHUjNOblBXaktpSG5oTlk4SmZnbkFxWDM5dmRERms2QlVIaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdjEvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778681377),
('dLxicIxQPMXgFFV1B14KhntVHe9KtCcNUNBYjDK2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialdiMkFSWVlTOEY1NlFUSXIwV1hoT05lWmhlRDY4ZzVQSTdud3JONiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdjEvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778680717),
('dRtuwUg1VOrXCQcyHUPPQ9k3Am0ROnNrah6N7IYG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjgwZXNabW1tU3E2bEVscjBDWE9GUXl0dFZuU0I5S3J6QlNZWlZiYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYWdlbiI7czo1OiJyb3V0ZSI7czoxNDoiYXBpLmFnZW4uaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778677751),
('dYc6PZjcUBKBcJYDa8QhHyMlgMWLr6MyNanqCifs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGJWNTVFUFc3bDMyWTBYM085cTY1bzBlclhXUjFaY1NCVW01WjZoayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZ2VuIjtzOjU6InJvdXRlIjtzOjEwOiJhZ2VuLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1778678302),
('E9TsOoHlWoldMfpJtJfshUHUXabI85Wep6TWSBZA', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRk43TzBmb0RXR3NsRU9QM052TnFkS012cjZFckM0SHRuRUxidFV2UyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtldC11bXJvaCI7czo1OiJyb3V0ZSI7czoxNzoicGFrZXQtdW1yb2guaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1778680173),
('Ee3ZaX9WL2T1gNZ0Dfma6N0M0Jjkdd83azCfySos', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVB0bWxqSlJsV2gyamVpNXFjWW1NaTJzSExLYzRCNTRBMVBFMVpmciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYWdlbiI7czo1OiJyb3V0ZSI7czoxNDoiYXBpLmFnZW4uaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678908),
('eJFN1MIIj5XoJwaICGg2Y3QsljqrWBnSo6MKZQod', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY21lZ3ZsOXlDektuSWc2cDUzcVRpYlhDYlVNNmNiQUt1bDZqUHE4RiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYWdlbiI7czo1OiJyb3V0ZSI7czoxNDoiYXBpLmFnZW4uaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778680177),
('EMSCLyqJxxdHaEaPSq8jp21j1fLAn2x9MZUYSwvb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDJHM1cyWGJsMWN6TGlXU1FvYm53NUZ2dk05RHpJV1BsZU1wbUkxNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZ2VuIjtzOjU6InJvdXRlIjtzOjEwOiJhZ2VuLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1778677286),
('eoyTG27z437XMGFu9yZEVsiS1NvVNAW8sFgETeCr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVdZSU84RGp6Skc4SjBoNkZJT0pkS1pyOGprZkdRSTh2dG55bEFHMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778679867),
('eVwrorClCWGBHgiQ7GPfdUmiwUCYO0Cop55FP5P8', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSlhSckZWT1NNVTdNOWcwSGVCRXFXVEp1dGdhNXNkRFk5VkF6djJORCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FnZW4iO31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3Bha2V0LXVtcm9oIjtzOjU6InJvdXRlIjtzOjE3OiJwYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1778680999),
('EZkDd8y78WQWx8xUBPPp13uOgWU9y4cXCAd5wbLg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREE4T2dhZUdkM3dhdmlKeEVsN1NyUllkbWlzRmVtMnpxQ1NpekxoNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778680174),
('f1PXm51jGWHCoRNUgEr6zPm78EtHLTLBmUjJFavA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXI0a1JUaHFxazhWQjNDc0dhQnpWaktiNDBVVm9iWk5UR2RCMzNtNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwiO3M6NToicm91dGUiO3M6MTU6ImFwaS5ob3RlbC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778677742),
('fcunHshmpILEFad1ByGV4qkCcFjyqYA55akVoQ58', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUkl0dWh1bFQzVURzOVFPUEpBbzl2R2g3UkdsR3JkTzZ5UzNUZDJTNyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FnZW4iO31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3Bha2V0LXVtcm9oIjtzOjU6InJvdXRlIjtzOjE3OiJwYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1778681327),
('ffrC0pzIsHMgm3yG5vhDCUFG9CSZ7WDKyLRagMPi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYldFeHhaeHM3R3kxYjFlTG15cTVDbjB1dU9Ed0o2U2JiWHpIOVMwcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678564),
('fp9meTOUUo1Vs8x511mTgSjyegOl2EjTw9dGDDRT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGV3T0JwWDRIZGJJTVFGSFF0R2QxR1pGTG5BMlVRbGtzSmZIZjJYQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778679247),
('FVxAvOQU0i2OSl8W8JAZHrTc2H1RCxnXqjzpacaF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlBIeXM2bHB4TkdqczhsQmtvNGlJSEkwN2Q3c0lKbG9kb2ZGemhrMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdjEvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778681179),
('G1iChpGozUVHKiIgoqADvi2zRGstApjk4LWtEDx3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY203anVNMVVSbVFYUlBsN3g4NFdGZWdxTGRHUDFNb1R0emg2WXdvRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778679868),
('H1IxAbkJHygejuzZGrCrZrgbQj9qDRMLLJir43cq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHBrbGYxSlRPWjBlQ2JHTmQzUUE0RmtUWHdGam1jYU9pNlBOalZxUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdjEvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778680716),
('HMu7lggIbVorVaML5rLTbS4KESlaGTtEJnMDRKZO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGtUZU9vNWd2cVpCZFFPSmhYZHZ5U09nNjFvVGIzb1JOUGl6d1EzeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZ2VuIjtzOjU6InJvdXRlIjtzOjEwOiJhZ2VuLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1778677751),
('hNka0RLYyFqo1tEvN9t7JcatjctNvdIZCud8E2ZY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTdIV0d5enAwa09FM0hqZG8wUTJydFl3dUNxYWlFUkxuS21INFYyeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZ2VuIjtzOjU6InJvdXRlIjtzOjEwOiJhZ2VuLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1778677147),
('HnuGluCeXAu2BXBq27nocvvL81aSigXOUdrOEYdd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2hKbXJPRXhPUWxpZDlrOVZJVzZ4Tkg3TVNGRkR5ZW12QkhVODZvVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778680053),
('I3yYX4mjtqhftd81YTNbB499py3PCc5wpi6VkqvS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXZYck5Pd3Q1VVh0QU9jd003U2FHOURKMnlZUWJZbVQyaW1lYm1NayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778677735),
('IA5IfvoQlf4DwRUPXDAHlX0gwyLfktVvorL8TgY4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZktIWVd3UWpYb0RXdDlSd2hwTUttMVRtZVhIRVIwTXJFenNUM0RlNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778679867),
('IhhlDv3AljrqwIFbGvnO7pqy5vsYfgCcy3hmST9a', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2lmOHpQZTEyNzVtTGpTc3M2SEI1MllhdUptU09lWEFwZkRhQVhYNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdjEvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778680999),
('ITAHHi30rzI2oAxFilZ3nnGy8InvDTIuwPj8Qvxo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWh6b29QQ0VIZmt3Z1RnZHg4N0RCTEc1MnFUbEhmRTZhWENJeWUyVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678162),
('iTBfIRXc2uOMUVokqyaL3pO3WemvdUh7iXUFZ0Ef', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamhtM3h0aUtoNDJIVGhaZ1ZTZ29mbno3VzZ6VEk4aEdYa1NLb1NiaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZ2VuIjtzOjU6InJvdXRlIjtzOjEwOiJhZ2VuLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1778678564),
('iVzZnuL6OjqKNfXp9WiERaMEVMBcAhtmDfS26vVf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmowZnVCbWx6Yk5JMDc2dVpydE0zZlR4Nk1admgzaEJ4UjFDSlNiVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778677734),
('jcaZUT609CdtucsmvmS5g7bkIBcQJ9S9VTXp0m6x', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUNBRmJyeWtUbXp1amR0NWpwRkRLRVozck1ycWZMNFVYdkxBYUkzWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvamFtYWFoLWFnZW4iO3M6NToicm91dGUiO3M6MjE6ImFwaS5qYW1hYWgtYWdlbi5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678155),
('jjDbIUX2H3Rr5LStz9L3ZjXMBp6ouQhMyf4teEbX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUllQjN1MEg5RzYzR3dnMU9hTVFtN0V0c2dZRkhVenFLV2ZCblNaVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678142),
('JmAjBoYwM2lzYbPDAREPgPZc3HB0Y6JI0FO2Ly1k', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkZMNHdFaGR5ZENxVWI0NUJNVWoyTGNpdnU0REdYRnlrY296Qm9WRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYWdlbiI7czo1OiJyb3V0ZSI7czoxNDoiYXBpLmFnZW4uaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778680057),
('jQV1qn69TamEIXbRDW2XUFOaUsYuuD7MyBVDyFhz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmpWa1ZNSHh0a3lCQ3QxWlNMSXZ0eFM3cXA2UFNzeFNpMUpMNTh1ayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678301),
('jUy6BzumjTtZo0Cm2740hdud5U4NxJ8BIfTYsEoH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGN3cTM3bVVEZjd5ckVLNWl2dDZZSmRoZ2dWd0dObFRHc1RvWTJqeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778680174),
('KAsc5BC7rKfzGhCBKlBh2LIgKfI0xiNb3WM7VB3g', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTdONmFjb2F0b2d6WXltOU44Zk5IZ2hVeTZweFJUYU1QcEZ5VTd4RCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778680053),
('KfKLc3TZsiN6TjZuCgNvmmyLSZj5YSoWi9GXHtOn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXZmY0tod0R5Z1N4alBCY3llM2dnTkF4eTdJRDhneVlrSGI3RVNDZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYWdlbiI7czo1OiJyb3V0ZSI7czoxNDoiYXBpLmFnZW4uaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778677287),
('kg36Aj8ERKfbBU7tluNldlQde1eC42V2Sor8Fq6v', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjNGT0o3SlRuU2pEMElZSjhCQ1ZsMG1UYWJCUGpLUXFNTW84Y3RFVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtldC11bXJvaCI7czo1OiJyb3V0ZSI7czoxNzoicGFrZXQtdW1yb2guaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778679246),
('KU0FJzZ41R07cs06Bs8njq0PuGKkycvJXn6Nzudp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2ExREdpaUdKYmJ2T09vb2E0ZEJjSjVjSU1QOEc5TzQ5Yjg3Yjl4OCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678907),
('KW9whZqE8DQC3iKMMLzYstmHAyzexBHjK0E91fm8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUN1UE91WTVnRXRDWVBwZTRmczBUelN1TVdKTFE5dnVidVRUZ2lyWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZ2VuIjtzOjU6InJvdXRlIjtzOjEwOiJhZ2VuLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1778678908),
('Kx08sfhdp7NyyTHqGkX7O5CJhupEp5K5KJjtnapw', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaWN2Z1BaZVpZZjFXS01FaW1YOW5MTFFMUWVmTjlMVVl4dGhodEtkaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtldC11bXJvaCI7czo1OiJyb3V0ZSI7czoxNzoicGFrZXQtdW1yb2guaW5kZXgiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1778679867),
('L7FkpFK8i4CkYqraJOaC0lcne90hkZxWSEjK3ekr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2ZoVU92eEhJb3l5SUd1Z1hCN0hYd1JSNUZRWnI0cnQxYnc4VDBkMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778679868),
('LX4NOkBFOlL9LR9xOikhAzDkZ4uZfKcVegYRVG8W', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQllKbmpmUTg5ME9oMUpIQWdZUkxrSFNtVFpuS0tVTWJudjJ4cUxyTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678163),
('m093dgnkYTABGtGcK9irg4epdneBg6KHIqRuLCJx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHZrdzBWYTdRMWd2Q04zcEo1TlF2RHpHVFBDQVN0TUFWV2lRZkNQOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778679868),
('MadJ514ZXhH9zMcr44uV6vdYqUxh9rTQ005gGIJy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSW00OFg5N0VOT21qaVEyTE5qYmlFcm9keUhCaUp2UEtGa0lXb09ocSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO3M6NToicm91dGUiO3M6NToibG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778682871),
('mbO7Pz8XaIEsTbXRZ3RlSbJHfPUhGs1MVutGwFo4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWI2YnBnU0JIZm1oNHRrS0FRbTd1YWVYTUQ0QngyeXJBaXVSUFZacyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678564),
('mUYO7eUxkn1u7lIFKq7Nw1KtzlGor6ELGeKRqfFh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1B4YnJRbFprQ3BwTU1UdUthamFBbHdkN0k4QldVZ2wyVDZlaFZ2QSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678302),
('MvF7ouVJoi5NZAr28OFQIYuNPOTsCRNWUDMlb4iH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUVVRDhIMHhGZGtNYXdCVG94Zkk4RTRYRDlDMDc0akVheEtoeFJWUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678163),
('MX363OODgq5TMeatc9ixvJHzrXYohmI4aT3v9BIp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHJJQkJMbzhMUnNES0tXVUQwSDkycWRwYmJvMHQybUxNVTNmVU5XRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678301),
('naa05L1w3CEDaNjdjyMCSDZWuQxBEZ73otxrqoj7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMG9qTXJmVE5zYWZnWEU1cXlCaXduenowVGpZMGs3aG1vbWFHaWl4NCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678255),
('nBnhqlsEY9XxiZ5ZRj9SLpqdij4lDHDv3DAMrIj5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjY4azRPSDRoVk5xYUlLRVRRNG1aNG5LT1BSREF4ek93OXpJaTdDeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdjEvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778682321),
('Nh12pssXmCvbGkToOu5u2nW7Ybe1oqxQAcktfvwF', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNWFPOHBaWEdnZG5HQURhSVZVTWl1M25XV1JqaUdsek93SHYydDU0USI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtldC11bXJvaCI7czo1OiJyb3V0ZSI7czoxNzoicGFrZXQtdW1yb2guaW5kZXgiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1778678300),
('oCyireCXfJKuhnMiIilkHapS4vMx4yvlZe07y3kf', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaVNyanA0U2p0b0VneU5jdGxUNEVXSDNqbk5YY3kzdlA0dlVLUDh3RyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtldC11bXJvaCI7czo1OiJyb3V0ZSI7czoxNzoicGFrZXQtdW1yb2guaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1778678906),
('OLGT7BzIGosJu3TlkvJVmYswMzQmq4GXqKOxLNfp', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibmFOSndqbDRPV3k3MWtQTDcydGY0SEtNcVlIbElwdnoxTW8xcEpBYSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2phbWFhaC9tYW5kaXJpIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtldC11bXJvaCI7czo1OiJyb3V0ZSI7czoxNzoicGFrZXQtdW1yb2guaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1778681178),
('P4s60VE5iUAv5fpw1bnDTvR59QZvSusbr2gRIR25', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNERkTFZRYmY0T0pMUktxTFJYb1o3Q0o0bkRwMUI2dk44ZmVqUDJqciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778679247),
('P5mZYLIzbeMV72Ep0VF2YAb9ACZIbMjsXkouNw67', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlVaaVR0anpwd2dTMnZhbDJndzNtRWdJV1dFRjZ6TkQ5bFlCdnFNNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678254),
('PGvq7Mp3WtrRZUwNL5qcX4ouGlmohhgbb9VoP4RO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGowZG52UDh1MUsxa1BjUmt0TURMejhRM2hSaWlUajNLdnNVWmJ2WSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678162),
('po268Gx48Gb618kuLlZrxmTdPDmysaVrLoZ1D9nV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmhBQTNrZ3oxSDNmSWVCTmFoZFhaU3ZVRHQwWklESkk2MFpaZUhIbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778677734),
('PshUp2aq5RTTHUvFcCgaDgrDv965A2ItoPVjM0Qx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTBoQ20xVTQyTFgwSGVzR1BibzJwc0tGTHFJU05JbUxSQW1TQjJ0NiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZ2VuIjtzOjU6InJvdXRlIjtzOjEwOiJhZ2VuLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1778680056),
('PUS1KI7jKiRaFc9ldojlra5uMwsUJtQxWvT4Vkwp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiajVtYVhidWp5ZDE1RWhwcGx1V3U3cEdiMmI5TUMzY3ZnWGtHbGdXRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdjEvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778681328),
('PXAGgEKPQu0IaPY1WqNBJtwKb2b0XPTWLIT9S95c', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicEZxUWVvV3BKclF5STNPdnJGMU5Ga2tUU3o5MURBTGtSNmFmU20zciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778680053),
('pyDlOTbbsDhSW4k7OAurAH1GsGCro4OLL7WfXX3T', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmZudVdDZEN2bjB6MmdqV0x1MEJMeW5ZS3Q2cm9KaTVGS2w1elBCRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtldC11bXJvaCI7czo1OiJyb3V0ZSI7czoxNzoicGFrZXQtdW1yb2guaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778677757),
('PzHWS69JVqSMTknADzEZ76FiKEhaVcVXh76DiqIl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUERjNjE0VUIyTHROamJzQ3J4Ynh2ZmZRS3Jnako2c1M1OGM1elRoZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678254),
('qArMDUVVJcF0uxcnWcjRXeV6G7K8p22MfvcWNZA2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlYxc3hCUnZyUWNDYTVPd2RXQ1h0R2RhY2w5NXA5SkJxb0lzbFJiaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778677734);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('QeQQxiahLPRtFdtth0jVzkGEWL11TI2Uvr7kP6dG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlhNUjZoUjN1N1Z6aHRyb3U2TjdpNExyWVZxejJEbXZXTG03bjNNQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwiO3M6NToicm91dGUiO3M6MTU6ImFwaS5ob3RlbC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678580),
('R6ILECerue7gLdmrbHv5m81sipfit56YfPFHL9eI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWtnUzVPcGNuOEFrWmZtTkF0RkZjVjlmd1I0ODFLeGtnWnpRQ3BZViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYWdlbiI7czo1OiJyb3V0ZSI7czoxNDoiYXBpLmFnZW4uaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778677284),
('Rai3U0YzLNz4iVTT74jMUO3f6KHNohaSCzkif8KI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzRQZHlVWkhUeXJ1MGVoSmhUaDUwQ0M4NWszeDlibko0NG1IRkp6WSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678143),
('rdcu5oCxQVe5KUqDDgUml90QJ8JUcCV5NcPBITbm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTVVM2IyS2ljb2hTQW1iMnFtMXNndHE3MTBuamhFZjBWRFo2OTFwMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtldC11bXJvaCI7czo1OiJyb3V0ZSI7czoxNzoicGFrZXQtdW1yb2guaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678162),
('RedXua0YYKlCSORfqhQe0xPgvuTb4GFxwQVusdsM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXBxRG1iTDFoYlF3VHA0azl6VEVYUmxRMG9pRU1sNTl4WjJ3ZkFLNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778679868),
('rk5OfWmpHsotSGPo5NpAhxDtv5yqZmce7TTlThEZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXY2Z3B3MjNYR1l4RXJNYVJ6UzRybVh4MlBxbUFGTjI5T3BmT0h3MSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678563),
('rmmeAEwEYQtphoVbl9aeF6XQWNyYi67CVD90m1BH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmxicjJyT3Y5N3JPaDRtVmhrdDRwdEVQS3A5ZVZVWkNoRzZpQ2tUeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9ob3RlbCI7czo1OiJyb3V0ZSI7czoxMToiaG90ZWwuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678580),
('Rn3Qye9ndQU8RGv1Y7gmAISBDdYlM1L8lqbbnuku', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnNrMWRxWUFlTVp1ZlRmdzRhNVE2YlplTFpmMTRGdWdqY3pXVW83UiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYWdlbiI7czo1OiJyb3V0ZSI7czoxNDoiYXBpLmFnZW4uaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778679869),
('rntGThhYuQB7LQeNKu29YwQdGDG0OGchS8P62Wsx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkpPdndmVU9UZzNRQWN6Z0o5Q2ppbGJHVFY3ZXh1WmM5a3pSUloycCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678142),
('S2ghnt2ackiLfYKTuX1pBEEAgku0O5CpO0Mp0mIo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWladkxzdXlQSnhTUXpkcWNLUmhJRHNtR2lMTW9PZUF2ZTFiTTZiMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdjEvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778682320),
('sErB5gnq60CN6Bt6uN4cpaMN16gk5uos7DGiGqh4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnNXNlZvNlRmMnYwc1BxOFpDd0dnYmFWUFBiUmJNUXZUcFN4SkVqVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9qYW1hYWgvYWdlbiI7czo1OiJyb3V0ZSI7czoxMToiamFtYWFoLmFnZW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678155),
('SFYEgsX0nKTA6htegIWCNqprU0pBvF8pH4lvW9Qq', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRDlXRnJVejlYTFRSaFVBNDhnSlAxUzFHR08xT21EMmg5VkVodDRtQyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3Bha2V0LXVtcm9oIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtldC11bXJvaCI7czo1OiJyb3V0ZSI7czoxNzoicGFrZXQtdW1yb2guaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1778681377),
('SHItFExhvGXqVHy2wayVVzX0eY00DIzAQRfwHnkv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHBhUjhrckFrVEtsamduY3pSdk42a2tabTBJWXNtcFhLUUsyb242TiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778677757),
('sw1Pn6Uh75CBvr9PL5AeINHLOxJt5YYaZJaHSphv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFp5Q3p2bVBkQnY2bjdNbnNzM0szSk8zalU4cFQzdUg5S09FdUcyWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdjEvaG90ZWwiO3M6NToicm91dGUiO3M6MTU6ImFwaS5ob3RlbC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778682862),
('Ts4JWTVDNrua8C8optZf3PrjDaZqvc3UWaMPXcut', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHpIb055Ym9xR0hsaGVlZWRDWE9ER2Y2NnBpdlg0eFV6S0l0MUNzTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678254),
('uAiPV8RQ7LfVHUK5gmEURCm2l7rrpCzfXQiMhCy6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlVmSVVPQnVGOUJ1eGVpcmtVeUFwYlMzTURLQkc5UTRxRXBjTVVleSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYWdlbiI7czo1OiJyb3V0ZSI7czoxNDoiYXBpLmFnZW4uaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778677148),
('uBy01PWeboq5EFoxUmQyNmJoo5LTLSsi48g6UBpr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibU9VSGo3S1J0SElVTGgyazgzQTgxYndEeUpKTWJsQnZuVFlrVU56MSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778680052),
('UcnLZ16GcV1NXDcYuwgmrU47V1WRlvWn8P0mCQXg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3R5cklaYXRkRmx3cEJVcEdSTlg5NVlWeVRQRkNuNUt6RTdFUFdPTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYWdlbiI7czo1OiJyb3V0ZSI7czoxNDoiYXBpLmFnZW4uaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678564),
('udPgkON8OzRy2jdJyqBFmP5TKbBCZIWAj7H3GoCj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTklpT2U3djZkaE1NUFM5OG5hVzJDSE9KdEN2UGt2cUNiRGpGbzlsdSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678906),
('UJXE74rqNktxjiU0P90UzouLEYgNuJhmDH40IlOn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkU2ZTlrVnFkcTNQTU15SzJkVERTTDl4WGJmb1p0TFcxZFZWeGQxYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778680174),
('VDhBEIDX69HkLjRdeVT3qI0j2QoZ3v3WdDbZaiAt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVMyM1NsVWR3RGYwSFRHWmxHMnVBSWt1cmpZSzUwTXRHN29HWTFlaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdjEvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778681328),
('VYZP1PtCmqjUDtBFCmjcVUowi6CkGt82H9gviElC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUc3cjdNanlWamtUM0N2WVpYVlNaaW0zc05LeldkTVlEU0FjTlVJRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdjEvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778681378),
('vzMYHYoB71d1U5HOvzfOyESG9h4NiSNeABVZUZN9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0pQVDBnd1VRNjliWENOYk9tZjhIdHBzM2lJVjBJcThPa0VLSEFvTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYWdlbiI7czo1OiJyb3V0ZSI7czoxNDoiYXBpLmFnZW4uaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778679244),
('W6P5qX51l545rItZcwuh1vCuntYJKSDXpHB88Swd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2tZOGttdFcwU3RDNndFaTdidjF5Wnc1OEpPb29vRzdjdEk4dGlhUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYWdlbiI7czo1OiJyb3V0ZSI7czoxNDoiYXBpLmFnZW4uaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678302),
('wEAwz5B3wzxvBRaHpleKAmZQ1qbDWGnRvAo8L6Jl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWdTRkt6WFp3WjZqNmxnb29QbzFPZFhubE9wYWd1WWY4QWwxSTJDdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678162),
('wHMpLgmD3ezV9KmpEkKhAtsHZXkS5AdnADViEt32', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWVNVVJpSzhVd2V5S1hxSWpEc1lERTdqUzRBWW92dU1zU3B6UkdaSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778679246),
('wMdMMq9e6xGGrosswGim1dHR1r6FhQkJmSPzaLrC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1pIUG9FUk9iRnVuSnNQMEhpZDJFM3FRVWQ5eG9WdTVxb0tMcFdxaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778680053),
('wUcb5rRUlITvZNHipbHHf773NApz5QHsjmMYzdLY', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoib3ZURm9RekdmU1hpQ3psSTBrdnFIZFhOcFA2MDlueUNFQjdoVXZBdSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FnZW4iO31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3Bha2V0LXVtcm9oIjtzOjU6InJvdXRlIjtzOjE3OiJwYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1778682319),
('xeDmYQSJbPtEELh1nGvDjNnV4IPWW0CxaMck8wU9', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZWwxWHlmN2l2WnhQNUZ0dnd3czdOYUJ0UVM3eDdOYkR3TmQ4NTE2RyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtldC11bXJvaCI7czo1OiJyb3V0ZSI7czoxNzoicGFrZXQtdW1yb2guaW5kZXgiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1778678142),
('Xfsl9U7gek4BTXa3cuc6idf05pSvyoc7JymyuRSY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGJUYlhmeUR0ZVpRaDNRaE9pOXBTc1FFUHZYODFuNjIxZExvSzF4ayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9qYW1hYWgvYWdlbiI7czo1OiJyb3V0ZSI7czoxMToiamFtYWFoLmFnZW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678585),
('XIyeMV5ovR7JNoSCrYnZel9iH3U81XxVv02nHcfe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1pLOXcxNnU3NFA1THFVeEtkQ0JsN3BXVXkwRVB6NEl2TDVKSDlYQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678563),
('xJglkIqcjebRcfxIaoJejnp1dKhBwNIBsHcgIHRr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFBudnQ0OTE1b3gxVnRua0F3TjZPNmo2UTNQa05BeGFtSW9SeUhiaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678906),
('Xxgp1wsLy2obvIXT2NOPTAGAMXT8o3UtwGgwx5vX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1FMdTRZRGRNUndKNzFZcW9rQmdUZWV0NW5ZY2RqWGtQNnVYQ2FScyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778677735),
('XYTBzEVzRCuexW9gEAzWDkiw79xMrtDEksWVIZ4E', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNFhUTkZDV0N6UllaOGRYZFhtdnFlZmVTM2hKMUpKWVpjUG1ucUFzeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtldC11bXJvaCI7czo1OiJyb3V0ZSI7czoxNzoicGFrZXQtdW1yb2guaW5kZXgiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1778677734),
('YqKG6ar2gSRyMqTX8ZnAXFbXqJdLbwiJaGUJJnee', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTRMUEhQbm9Zc2JXSG1sbVBDVnBzU2NSajJuWHhrY3F1eGs3bTFPOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbWFza2FwYWkvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778677735),
('YQyyn6TXnEdNNp6YK7zlwgmPnRBvIn60Pnit3PK1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHBmdG56YmNnNFVWY0pmSFZOdUtNTGhLTnZ5b09FZTJUQnBZc250TyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90ZWwvYWN0aXZlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778678906),
('YUcXkPgdp3WLfQbCrsv7xZzjCvnbz0knXhOGW191', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVg4a3RFUVdZeFpPUmhDZ3Y2aEcxY21tUlpJSFZ2azBrU0wwS20yOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9ob3RlbCI7czo1OiJyb3V0ZSI7czoxMToiaG90ZWwuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1778677742),
('yzCIf12IGPgWZaBzlDVVwYU6V26Heqb9nocCZqCy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUppU3FOOUNyb1pLM2VmcGFUcUZSbWhNMlN2ZFFaUTJTY1gydG1SbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778677757),
('zBQpEgLVJAGkn1i9YR7Q8BH7Mu9u2KC93vDU5pil', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejBiZEdtaW94WjFYU29PcTQyRDJURlFFanRLMGdlUVFrNXNVNm91VyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678301),
('zcmQKdQkmwxfKKG7zkARcRquAaRu4aZ5GETV5A0T', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSU9CTjgxbkhjYURoVFYya3JtTzExWHd6V2x4T0s2cENLQWZqdjc4RCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZ2VuIjtzOjU6InJvdXRlIjtzOjEwOiJhZ2VuLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1778679869),
('zqKFRnh4Hkqb38nKCMZOfDgKEmwmJjE6rieKY4Hk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibldoNHFIb1hPUmVZcktYVkFPU2xOempRR3JFSW1aQjVNcHJ2c0dlSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdjEvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778681179),
('Zx34PdZmioHlQYDhm3rJsKzFYVPeDP2oJ6nr5yHZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWENabGRwdXFBVk5hQ3FYdUlPT0xqWXd1RW1aVFZvaGZqY1VOUURYUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGFrZXQtdW1yb2giO3M6NToicm91dGUiO3M6MjE6ImFwaS5wYWtldC11bXJvaC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778678906);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Faisal Hafis Saputra', 'admin@namiroh.test', 1, NULL, '$2y$12$lPozCa//LGO34vb3BOcHuum4vOTU6lbgMwxILe/eWzI.2G8/oNyB.', NULL, '2026-02-10 20:25:42', '2026-05-15 11:20:48'),
(2, 'Customer Support', 'cs@namiroh.test', 2, NULL, '$2y$12$rkkP7DxHaYcFfmWah1l40OHDS1Z8QZZ7XkaFIlxbIstT63IgFbSKS', NULL, '2026-05-13 13:38:45', '2026-05-15 10:56:48'),
(3, 'Hotel dan Maskapai', 'ht@namiroh.test', 4, NULL, '$2y$12$jX/.5r9rBi7EHp9z/U7Cous.DkbrZ5LubFCF2YV0l/JhzhCvcQ.Fi', NULL, '2026-05-13 14:24:05', '2026-05-15 10:56:58'),
(4, 'Manifest', 'manifest@namiroh.test', 3, NULL, '$2y$12$HWH3Xvm/oRdeQpmzrYRR4.WGcm2/BsoaWGem.Nc5uGzHNoMusDSyG', NULL, '2026-05-13 14:37:52', '2026-05-15 10:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `xero_connections`
--

CREATE TABLE `xero_connections` (
  `id` bigint UNSIGNED NOT NULL,
  `access_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`),
  ADD KEY `activity_logs_module_index` (`module`);

--
-- Indexes for table `agen`
--
ALTER TABLE `agen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jamaah_agen`
--
ALTER TABLE `jamaah_agen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jamaah_agen_agen_id_foreign` (`agen_id`),
  ADD KEY `jamaah_agen_paket_id_foreign` (`paket_id`);

--
-- Indexes for table `jamaah_mandiri`
--
ALTER TABLE `jamaah_mandiri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jamaah_mandiri_paket_id_foreign` (`paket_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manifest1s`
--
ALTER TABLE `manifest1s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maskapai`
--
ALTER TABLE `maskapai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_group_id_foreign` (`group_id`);

--
-- Indexes for table `menu_groups`
--
ALTER TABLE `menu_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paket_umrohs`
--
ALTER TABLE `paket_umrohs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paket_umrohs_hotel_id_foreign` (`hotel_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_menu`
--
ALTER TABLE `role_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_menu_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `xero_connections`
--
ALTER TABLE `xero_connections`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `agen`
--
ALTER TABLE `agen`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jamaah_agen`
--
ALTER TABLE `jamaah_agen`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jamaah_mandiri`
--
ALTER TABLE `jamaah_mandiri`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manifest1s`
--
ALTER TABLE `manifest1s`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `maskapai`
--
ALTER TABLE `maskapai`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `menu_groups`
--
ALTER TABLE `menu_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `paket_umrohs`
--
ALTER TABLE `paket_umrohs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_menu`
--
ALTER TABLE `role_menu`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `xero_connections`
--
ALTER TABLE `xero_connections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `jamaah_agen`
--
ALTER TABLE `jamaah_agen`
  ADD CONSTRAINT `jamaah_agen_agen_id_foreign` FOREIGN KEY (`agen_id`) REFERENCES `agen` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jamaah_agen_paket_id_foreign` FOREIGN KEY (`paket_id`) REFERENCES `paket_umrohs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jamaah_mandiri`
--
ALTER TABLE `jamaah_mandiri`
  ADD CONSTRAINT `jamaah_mandiri_paket_id_foreign` FOREIGN KEY (`paket_id`) REFERENCES `paket_umrohs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `menu_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `paket_umrohs`
--
ALTER TABLE `paket_umrohs`
  ADD CONSTRAINT `paket_umrohs_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `role_menu`
--
ALTER TABLE `role_menu`
  ADD CONSTRAINT `role_menu_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
