-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Gép: localhost:3306
-- Létrehozás ideje: 2026. Jún 26. 10:52
-- Kiszolgáló verziója: 10.11.14-MariaDB-0ubuntu0.24.04.1
-- PHP verzió: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `car_repair_shop`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `problem_description` text NOT NULL,
  `status` enum('scheduled','in_progress','completed','cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `vehicle_id`, `appointment_date`, `problem_description`, `status`) VALUES
(1, 11, '2026-06-20 10:00:00', 'Engine noise', 'in_progress'),
(2, 5, '2026-06-22 10:00:00', 'Gearbox', 'scheduled'),
(3, 11, '2026-06-22 10:00:00', 'Suspension failure', 'in_progress'),
(4, 14, '2026-06-23 11:00:00', 'Gearbox change', 'in_progress'),
(5, 5, '2026-07-17 13:13:01', 'Veritatis incidunt amet velit ipsa magni.', 'scheduled'),
(6, 16, '2026-06-10 12:41:35', 'Eos itaque perferendis ut iusto commodi facilis dolor soluta.', 'scheduled'),
(7, 32, '2026-07-08 07:00:19', 'Beatae eius aperiam fugit.', 'cancelled'),
(8, 48, '2026-05-28 06:16:16', 'Asperiores dolor nesciunt necessitatibus nihil.', 'cancelled'),
(9, 64, '2026-07-07 00:02:42', 'Earum eos omnis magni sequi ullam accusantium.', 'scheduled'),
(10, 8, '2026-07-07 01:44:42', 'Amet accusantium qui enim itaque facilis at.', 'completed'),
(11, 17, '2026-07-11 00:49:43', 'Porro rem et in architecto deleniti.', 'cancelled'),
(12, 33, '2026-07-01 13:58:19', 'Hic quia autem ea fugiat et.', 'in_progress'),
(13, 49, '2026-07-08 21:33:31', 'Similique aut eos id ullam dolorem eum.', 'completed'),
(14, 65, '2026-05-26 01:03:02', 'Eum voluptatem voluptatem exercitationem est minus molestiae voluptate.', 'cancelled'),
(15, 10, '2026-06-13 15:43:51', 'Dignissimos aspernatur recusandae culpa voluptate quibusdam.', 'cancelled'),
(16, 11, '2026-06-08 20:11:54', 'Optio est sit voluptas.', 'in_progress'),
(17, 18, '2026-06-29 02:53:29', 'Ad atque neque est id.', 'completed'),
(18, 34, '2026-06-04 18:37:01', 'Soluta dolores dolores repellendus qui.', 'cancelled'),
(19, 50, '2026-07-23 00:15:19', 'Facilis aut neque tempore deleniti qui saepe sunt ut.', 'in_progress'),
(20, 66, '2026-06-29 09:41:52', 'Et libero repudiandae ad quis.', 'cancelled'),
(21, 19, '2026-07-10 20:46:16', 'Quasi consectetur laborum nihil.', 'cancelled'),
(22, 35, '2026-06-29 05:05:49', 'Ut architecto quo sunt nostrum.', 'scheduled'),
(23, 51, '2026-06-27 10:21:14', 'Sed consectetur aut maiores maiores et quo expedita at.', 'cancelled'),
(24, 67, '2026-07-11 16:31:22', 'Nobis quod quam soluta ut omnis accusamus minima.', 'completed'),
(25, 25, '2026-06-18 20:48:57', 'Nulla dicta necessitatibus nesciunt dignissimos ea consectetur tenetur id.', 'completed'),
(26, 41, '2026-05-30 15:53:43', 'Architecto sapiente maxime molestiae dolor quis nostrum et.', 'cancelled'),
(27, 57, '2026-07-03 06:49:41', 'Recusandae repudiandae necessitatibus laboriosam quo.', 'scheduled'),
(28, 73, '2026-07-21 21:30:16', 'Dolorum et occaecati distinctio voluptas eos voluptas occaecati qui.', 'completed'),
(29, 26, '2026-06-25 09:53:23', 'Cum est consequatur in hic laboriosam.', 'cancelled'),
(30, 42, '2026-06-26 18:20:15', 'Suscipit autem non hic consequatur qui accusamus quasi.', 'in_progress'),
(31, 58, '2026-05-30 05:30:43', 'Sit corporis atque omnis vel dolor aut.', 'cancelled'),
(32, 74, '2026-07-02 02:18:03', 'Ratione rem exercitationem possimus cumque.', 'scheduled'),
(33, 27, '2026-06-13 05:28:54', 'Cupiditate et autem dolor magni.', 'scheduled'),
(34, 43, '2026-06-08 22:17:21', 'Amet expedita aut pariatur laudantium porro.', 'in_progress'),
(35, 59, '2026-05-26 05:01:46', 'Qui ipsam repellendus quo ab.', 'completed'),
(36, 75, '2026-06-15 22:23:15', 'Iste fuga enim atque enim.', 'scheduled'),
(37, 14, '2026-05-23 15:49:56', 'Sequi omnis aperiam fugit.', 'cancelled'),
(38, 29, '2026-06-03 08:47:11', 'Sit hic aut id atque ut.', 'in_progress'),
(39, 45, '2026-06-29 17:11:05', 'Quia quod magnam aut voluptas.', 'scheduled'),
(40, 61, '2026-06-27 01:25:34', 'Perferendis adipisci fugiat cum sed sequi atque harum.', 'cancelled'),
(41, 77, '2026-07-15 07:50:51', 'Eum blanditiis labore laudantium reprehenderit possimus.', 'cancelled'),
(42, 21, '2026-06-03 19:18:35', 'Aliquid aut ut perspiciatis.', 'completed'),
(43, 37, '2026-05-26 08:14:50', 'Et nisi alias ratione.', 'in_progress'),
(44, 53, '2026-07-01 18:39:24', 'Est similique consequatur odit inventore nihil ut animi.', 'cancelled'),
(45, 69, '2026-07-14 04:03:29', 'Et maxime voluptas temporibus magni natus tempore quis.', 'scheduled'),
(46, 22, '2026-07-01 08:41:08', 'Eum nesciunt vel ullam deleniti.', 'in_progress'),
(47, 38, '2026-07-19 14:22:16', 'Soluta eum ut saepe ipsam et incidunt.', 'in_progress'),
(48, 54, '2026-07-08 07:26:25', 'Voluptas pariatur perferendis dolorem non officia.', 'in_progress'),
(49, 70, '2026-07-06 00:16:52', 'Eligendi aut aliquam cupiditate quia nam.', 'cancelled'),
(50, 23, '2026-07-13 11:10:38', 'Et voluptatem quae odio.', 'completed'),
(51, 39, '2026-05-26 03:57:01', 'Doloribus necessitatibus architecto rem ipsam voluptatem.', 'completed'),
(52, 55, '2026-07-15 20:46:24', 'Et dolor voluptatem harum.', 'in_progress'),
(53, 71, '2026-06-30 10:32:46', 'In qui unde dolores necessitatibus cum sint provident illo.', 'in_progress'),
(54, 15, '2026-06-18 23:17:11', 'Asperiores soluta quae laborum accusantium adipisci.', 'in_progress'),
(55, 31, '2026-05-25 04:05:17', 'Accusamus consectetur eveniet est qui eius quia.', 'completed'),
(56, 47, '2026-06-07 13:06:43', 'Est reprehenderit praesentium et expedita et ducimus.', 'cancelled'),
(57, 63, '2026-06-22 22:56:20', 'Debitis reprehenderit laborum quis id ut culpa.', 'in_progress'),
(58, 20, '2026-07-07 08:02:45', 'Velit amet et aut consequatur tempora dolorem.', 'cancelled'),
(59, 36, '2026-06-14 16:37:45', 'Itaque voluptas debitis voluptatum aut laborum eum nemo.', 'in_progress'),
(60, 52, '2026-07-22 12:10:17', 'Et officiis sed quibusdam et dignissimos odio.', 'scheduled'),
(61, 68, '2026-06-02 01:33:25', 'Est nihil cupiditate et recusandae et quod et eaque.', 'scheduled'),
(62, 24, '2026-06-22 08:15:55', 'Et et sit cumque pariatur sint culpa architecto.', 'in_progress'),
(63, 40, '2026-07-04 15:18:59', 'Eos odio aut a adipisci iusto.', 'scheduled'),
(64, 56, '2026-06-14 04:16:34', 'Veritatis nam et qui assumenda impedit.', 'cancelled'),
(65, 72, '2026-06-19 12:04:30', 'Non ducimus quia repudiandae aperiam quaerat est error voluptas.', 'scheduled'),
(66, 28, '2026-07-13 11:33:36', 'Perspiciatis pariatur enim laudantium.', 'in_progress'),
(67, 44, '2026-06-27 03:18:12', 'Eum ab doloribus perferendis voluptatibus.', 'completed'),
(68, 60, '2026-06-09 10:32:54', 'Dolorem corporis fuga eum amet eius perferendis quisquam.', 'cancelled'),
(69, 76, '2026-07-06 15:28:58', 'Voluptas aut blanditiis eligendi veniam.', 'cancelled'),
(70, 30, '2026-06-19 20:38:42', 'Qui incidunt ipsum ut quis dolorum eum sint quo.', 'completed'),
(71, 46, '2026-07-21 12:03:57', 'Voluptatem minus libero ratione doloremque sit sapiente.', 'scheduled'),
(72, 62, '2026-07-09 12:11:47', 'Commodi dolor eaque omnis quam omnis a consequatur voluptates.', 'completed'),
(73, 78, '2026-07-09 21:58:36', 'Adipisci fugiat odit vel ab sit.', 'cancelled'),
(74, 5, '2026-06-01 22:08:20', 'In aperiam totam ratione qui reiciendis vel.', 'in_progress'),
(75, 16, '2026-06-15 10:50:24', 'Qui eos molestiae aut sapiente sit.', 'in_progress'),
(76, 32, '2026-05-31 11:52:51', 'Vel a officia quis at molestiae nam nam.', 'in_progress'),
(77, 48, '2026-06-03 15:14:08', 'Sunt eligendi beatae ut quisquam autem excepturi quia voluptatem.', 'scheduled'),
(78, 64, '2026-06-15 14:40:05', 'Nobis sunt consequuntur eum autem aut quod omnis.', 'scheduled'),
(79, 80, '2026-06-20 03:05:19', 'Dolor itaque itaque debitis voluptate.', 'in_progress'),
(80, 8, '2026-06-24 20:43:57', 'Magnam iusto reprehenderit eligendi cum consequatur provident aspernatur delectus.', 'completed'),
(81, 17, '2026-05-28 13:37:19', 'Omnis accusamus recusandae dolores.', 'cancelled'),
(82, 33, '2026-06-17 19:05:31', 'Et unde autem molestias quam necessitatibus.', 'cancelled'),
(83, 49, '2026-07-05 15:46:01', 'Atque voluptatum in amet dolores odio iste.', 'in_progress'),
(84, 65, '2026-06-26 18:24:23', 'Aliquam facere quos magnam ut quasi porro.', 'in_progress'),
(85, 81, '2026-07-03 19:46:57', 'Dolore quis ipsam suscipit delectus ducimus occaecati.', 'completed'),
(86, 10, '2026-07-16 16:01:19', 'Esse est aut omnis eos voluptate voluptates.', 'completed'),
(87, 11, '2026-06-23 23:52:28', 'Ex quam sit exercitationem ipsam aut.', 'cancelled'),
(88, 18, '2026-07-09 05:18:14', 'Sed ducimus et dolorum ab sit.', 'completed'),
(89, 34, '2026-06-11 10:08:14', 'Accusantium aut quaerat dolorem architecto autem.', 'in_progress'),
(90, 50, '2026-06-04 17:25:51', 'Error labore voluptatem debitis est accusamus ipsa ut deserunt.', 'scheduled'),
(91, 66, '2026-05-24 07:30:05', 'Ea non delectus eum sint quasi et omnis.', 'scheduled'),
(92, 82, '2026-06-03 20:33:15', 'Necessitatibus voluptatem harum quaerat corporis ullam minima ea iusto.', 'completed'),
(93, 19, '2026-07-17 09:57:23', 'Debitis sit doloremque repellat est ipsum nesciunt.', 'scheduled'),
(94, 35, '2026-06-25 07:12:40', 'Aliquam dolorum alias amet consequatur.', 'scheduled'),
(95, 51, '2026-06-27 16:18:42', 'At labore sit aspernatur.', 'cancelled'),
(96, 67, '2026-06-03 16:36:13', 'Tempora et at et recusandae non atque voluptatibus.', 'cancelled'),
(97, 83, '2026-05-25 07:06:39', 'Asperiores rem sint facilis maiores placeat vel cum.', 'scheduled'),
(98, 25, '2026-06-20 09:43:41', 'Omnis hic vel possimus aliquam velit est voluptatem.', 'in_progress'),
(99, 41, '2026-06-17 17:09:42', 'Molestias aut odio assumenda sit quia nesciunt tempore.', 'completed'),
(100, 57, '2026-05-29 10:54:36', 'Sit velit quia natus doloremque ipsum.', 'scheduled'),
(101, 73, '2026-06-01 22:54:58', 'Ut deserunt aspernatur reprehenderit assumenda id asperiores.', 'completed'),
(102, 89, '2026-05-31 21:48:13', 'Est aliquid eos non nisi.', 'scheduled'),
(103, 26, '2026-06-09 01:52:16', 'Explicabo quam molestiae nobis.', 'cancelled'),
(104, 42, '2026-06-26 05:37:40', 'Facilis sint laborum alias accusantium odio vitae repellat.', 'in_progress'),
(105, 58, '2026-06-09 08:29:47', 'Ducimus nesciunt non illo nemo.', 'completed'),
(106, 74, '2026-06-24 10:26:21', 'Fugit vero a veritatis.', 'in_progress'),
(107, 90, '2026-07-11 20:01:48', 'Recusandae possimus in laborum nostrum at.', 'scheduled'),
(108, 27, '2026-06-27 04:16:01', 'Sint tenetur quia maxime beatae velit omnis consequatur cum.', 'cancelled'),
(109, 43, '2026-06-02 08:19:33', 'Nemo laboriosam assumenda ea exercitationem iure.', 'scheduled'),
(110, 59, '2026-07-16 09:08:02', 'Ullam sapiente quas quae sapiente omnis quisquam.', 'in_progress'),
(111, 75, '2026-07-15 22:48:56', 'In qui quia culpa suscipit voluptate blanditiis.', 'cancelled'),
(112, 91, '2026-06-11 20:18:56', 'Eos dolores nulla id.', 'scheduled'),
(113, 14, '2026-06-24 04:36:43', 'Enim est est doloremque voluptatem maiores sunt.', 'in_progress'),
(114, 29, '2026-06-01 12:54:52', 'Quidem ex corporis autem est.', 'cancelled'),
(115, 45, '2026-06-29 07:35:18', 'Modi nesciunt eos nihil qui corporis nam voluptates.', 'completed'),
(116, 61, '2026-06-12 21:34:59', 'Voluptatem in reprehenderit id eos occaecati fugiat.', 'completed'),
(117, 77, '2026-06-11 12:52:05', 'Aperiam sint est voluptas consequatur.', 'cancelled'),
(118, 93, '2026-06-11 04:57:00', 'Sequi in quis earum id molestias.', 'in_progress'),
(119, 21, '2026-06-06 16:03:44', 'Suscipit nihil nobis occaecati debitis aut molestiae adipisci voluptate.', 'in_progress'),
(120, 37, '2026-07-15 03:34:36', 'Laboriosam voluptatem cum libero minima unde repellendus magni.', 'scheduled'),
(121, 53, '2026-07-12 05:24:08', 'Laudantium qui ab quae quasi dolorem corrupti.', 'scheduled'),
(122, 69, '2026-07-09 09:23:45', 'Architecto eius magnam et velit rem modi et.', 'in_progress'),
(123, 85, '2026-06-27 12:31:13', 'Atque at unde ducimus sunt mollitia atque quia.', 'scheduled'),
(124, 22, '2026-06-09 22:59:33', 'Illo consectetur laboriosam iste consequatur sunt et.', 'scheduled'),
(125, 38, '2026-06-12 02:53:52', 'Nulla repudiandae nesciunt rerum nulla et nostrum.', 'cancelled'),
(126, 54, '2026-06-07 14:58:18', 'Est sed qui sit aut accusamus.', 'cancelled'),
(127, 70, '2026-05-23 22:15:22', 'Fugit incidunt non in quos nihil quas quia.', 'cancelled'),
(128, 86, '2026-07-16 16:49:11', 'Provident nihil autem veritatis consequatur est ratione.', 'cancelled'),
(129, 23, '2026-06-08 11:53:42', 'Et consequatur expedita asperiores eos amet excepturi.', 'scheduled'),
(130, 39, '2026-07-08 18:40:58', 'Eveniet et ut quis eligendi modi aut a.', 'in_progress'),
(131, 55, '2026-06-16 15:52:10', 'Culpa nulla quod ad magni.', 'scheduled'),
(132, 71, '2026-06-25 13:03:37', 'Molestiae quisquam ut consequatur.', 'scheduled'),
(133, 87, '2026-07-11 18:15:38', 'Rem quo officia doloribus qui.', 'cancelled'),
(134, 15, '2026-06-05 09:42:38', 'Cum natus labore eaque labore.', 'cancelled'),
(135, 31, '2026-07-21 00:40:55', 'Et veniam tempore placeat expedita dolores.', 'completed'),
(136, 47, '2026-06-15 18:43:50', 'Odio blanditiis quibusdam impedit saepe.', 'scheduled'),
(137, 63, '2026-05-28 08:16:27', 'Quia ut exercitationem modi officia est nobis.', 'in_progress'),
(138, 79, '2026-05-26 19:20:39', 'Eveniet impedit ex perspiciatis.', 'scheduled'),
(139, 20, '2026-06-29 03:51:27', 'Numquam provident fugiat consequatur ut aut molestiae.', 'scheduled'),
(140, 36, '2026-06-18 18:58:15', 'Praesentium ratione sunt est.', 'in_progress'),
(141, 52, '2026-05-29 06:24:30', 'Quod sapiente culpa ducimus ut aut laboriosam suscipit.', 'in_progress'),
(142, 68, '2026-06-15 05:16:15', 'Aspernatur molestiae ab aut eligendi neque sit quis ratione.', 'completed'),
(143, 84, '2026-06-15 19:03:26', 'Nobis nemo possimus sint harum.', 'in_progress'),
(144, 24, '2026-07-04 23:07:53', 'Voluptas inventore quis dolorum laboriosam voluptatem maxime.', 'cancelled'),
(145, 40, '2026-07-20 15:17:46', 'Autem aut asperiores non explicabo rem a.', 'scheduled'),
(146, 56, '2026-05-29 11:54:59', 'Ex qui fugiat non doloremque laboriosam eum.', 'completed'),
(147, 72, '2026-07-16 06:52:33', 'Inventore perspiciatis magnam cum soluta non.', 'cancelled'),
(148, 88, '2026-06-20 11:49:37', 'Tempore nam alias culpa et dolor porro cumque voluptas.', 'completed'),
(149, 28, '2026-07-01 19:32:38', 'Consequatur facere aut vitae ducimus voluptatem.', 'scheduled'),
(150, 44, '2026-07-14 17:25:21', 'Reiciendis consequatur nemo quas quis.', 'scheduled'),
(151, 60, '2026-06-30 15:37:51', 'Rerum non et a sed.', 'in_progress'),
(152, 76, '2026-05-24 23:09:14', 'Et laboriosam aut eius sequi.', 'scheduled'),
(153, 92, '2026-06-20 20:07:06', 'Voluptatem enim tempora quia aut voluptatem.', 'scheduled'),
(154, 30, '2026-06-25 08:53:29', 'Modi incidunt enim hic quia iure vero consectetur.', 'scheduled'),
(155, 46, '2026-06-07 10:14:45', 'Odit ducimus et delectus qui.', 'cancelled'),
(156, 62, '2026-06-04 15:18:08', 'Omnis adipisci modi cum quos nulla nobis quia.', 'scheduled'),
(157, 78, '2026-05-23 20:10:37', 'Saepe quasi exercitationem consectetur vel earum explicabo natus ut.', 'in_progress'),
(158, 94, '2026-07-16 14:12:54', 'Architecto optio praesentium molestiae distinctio eaque aut rerum.', 'cancelled'),
(159, 5, '2026-06-07 06:44:08', 'Molestiae illum maxime molestias quo.', 'completed'),
(160, 16, '2026-07-16 03:19:47', 'Eveniet eos asperiores inventore dolorem.', 'in_progress'),
(161, 32, '2026-06-17 19:27:43', 'Labore enim dolore culpa nisi omnis voluptatem.', 'scheduled'),
(162, 48, '2026-07-16 15:41:42', 'Et vel est omnis dignissimos.', 'scheduled'),
(163, 64, '2026-06-30 22:06:49', 'Dignissimos quibusdam alias qui ut accusamus dolor voluptatem possimus.', 'in_progress'),
(164, 80, '2026-06-27 02:08:58', 'Eveniet qui culpa atque ducimus ipsam neque ullam.', 'completed'),
(165, 96, '2026-07-17 21:23:25', 'Dolor tempora non quis sequi enim ducimus.', 'completed'),
(166, 8, '2026-07-14 09:21:30', 'Sapiente minus velit amet iusto.', 'in_progress'),
(167, 17, '2026-06-10 10:17:08', 'Dolorum qui reprehenderit eos enim quo est nisi.', 'scheduled'),
(168, 33, '2026-06-19 11:59:58', 'Ea dignissimos quibusdam quia harum expedita non aut.', 'completed'),
(169, 49, '2026-07-15 03:55:23', 'Non dolorum doloribus fugiat et explicabo ut perspiciatis.', 'cancelled'),
(170, 65, '2026-06-27 22:24:19', 'Velit veniam sapiente aut aperiam quasi eum et.', 'in_progress'),
(171, 81, '2026-06-11 05:20:15', 'Quia in voluptas voluptas voluptas.', 'completed'),
(172, 97, '2026-07-19 03:24:50', 'Omnis nulla dignissimos et consequuntur minima qui.', 'scheduled'),
(173, 10, '2026-07-03 01:16:39', 'Ipsa facilis sunt dolorem ipsa.', 'completed'),
(174, 11, '2026-07-24 17:25:39', 'Rerum aut libero amet quasi laborum.', 'scheduled'),
(175, 18, '2026-05-31 14:26:46', 'Nulla voluptates enim sit consequuntur alias qui.', 'completed'),
(176, 34, '2026-06-17 09:56:28', 'Explicabo placeat accusamus ducimus laborum eum nihil dolor eveniet.', 'cancelled'),
(177, 50, '2026-05-29 00:16:42', 'Dolores corporis earum repellat dolores aut illum aperiam.', 'completed'),
(178, 66, '2026-07-03 22:05:01', 'Voluptatem blanditiis qui delectus in sed voluptatem autem.', 'completed'),
(179, 82, '2026-06-28 15:01:08', 'Aut necessitatibus sit est perspiciatis.', 'in_progress'),
(180, 98, '2026-06-13 19:41:09', 'Et maxime maxime aut sed.', 'completed'),
(181, 19, '2026-07-06 06:13:12', 'Temporibus voluptatum earum est.', 'in_progress'),
(182, 35, '2026-07-18 06:37:10', 'Sit consectetur suscipit repudiandae ducimus sit.', 'completed'),
(183, 51, '2026-06-24 17:58:21', 'Et voluptates sint quasi similique iste.', 'scheduled'),
(184, 67, '2026-07-02 04:14:39', 'Itaque harum est sed praesentium ullam omnis itaque voluptate.', 'completed'),
(185, 83, '2026-06-21 00:21:25', 'Recusandae ea placeat incidunt non.', 'completed'),
(186, 99, '2026-07-09 11:19:10', 'Autem facilis voluptatem deserunt explicabo non modi necessitatibus.', 'cancelled'),
(187, 25, '2026-05-29 01:43:47', 'Ullam suscipit voluptas excepturi perferendis alias praesentium.', 'scheduled'),
(188, 41, '2026-06-23 09:43:35', 'Id dolor itaque aut dolores quisquam a.', 'cancelled'),
(189, 57, '2026-06-04 13:28:22', 'Rerum impedit odio facere occaecati enim aliquam itaque.', 'in_progress'),
(190, 73, '2026-06-14 08:04:13', 'Voluptates ab voluptas et.', 'completed'),
(191, 89, '2026-06-24 14:11:26', 'Porro temporibus recusandae praesentium sunt.', 'scheduled'),
(192, 105, '2026-07-14 17:48:10', 'Delectus est nemo est.', 'completed'),
(193, 26, '2026-06-05 04:55:25', 'Occaecati quasi rerum aliquid dolorem nihil qui.', 'scheduled'),
(194, 42, '2026-07-04 15:48:27', 'Molestiae sit voluptate sit porro rerum eveniet itaque aut.', 'scheduled'),
(195, 58, '2026-06-27 12:03:51', 'Qui id consequuntur vel quas.', 'in_progress'),
(196, 74, '2026-06-27 11:26:43', 'Et voluptas consequatur corrupti maiores.', 'scheduled'),
(197, 90, '2026-07-09 13:10:13', 'Non perferendis atque et enim enim quia et dolores.', 'scheduled'),
(198, 106, '2026-06-01 12:21:27', 'Cum occaecati commodi rerum deleniti deserunt.', 'scheduled'),
(199, 27, '2026-06-06 00:28:26', 'Eos labore aliquid pariatur voluptatem qui autem.', 'in_progress'),
(200, 43, '2026-07-12 11:00:00', 'Quod inventore ex sed commodi.', 'cancelled'),
(201, 59, '2026-07-10 23:33:43', 'Nobis fugiat commodi ducimus adipisci itaque voluptates.', 'scheduled'),
(202, 75, '2026-06-27 03:12:39', 'Totam quod harum aut ea deleniti.', 'cancelled'),
(203, 91, '2026-07-11 01:50:56', 'Occaecati officia voluptatibus consequuntur qui.', 'scheduled'),
(204, 107, '2026-06-01 18:50:16', 'Architecto harum natus sint earum qui.', 'scheduled'),
(205, 14, '2026-06-24 21:42:10', 'Quo minima at sit.', 'completed'),
(206, 29, '2026-07-11 17:29:34', 'Sit voluptas et numquam dolor et ut neque.', 'scheduled'),
(207, 45, '2026-07-20 07:19:57', 'Optio neque dolorum suscipit.', 'scheduled'),
(208, 61, '2026-06-10 04:11:45', 'Ad ex asperiores placeat odit tempora animi.', 'scheduled'),
(209, 77, '2026-06-25 13:33:20', 'Consectetur ut sint laudantium quia quia.', 'in_progress'),
(210, 93, '2026-07-11 07:34:21', 'Rerum est voluptate consequatur quis totam labore.', 'in_progress'),
(211, 109, '2026-06-15 18:18:14', 'Voluptatem sequi placeat voluptates ut consequatur quasi quia.', 'cancelled'),
(212, 21, '2026-06-23 15:25:12', 'Aut laudantium rerum quia.', 'cancelled'),
(213, 37, '2026-07-25 17:11:46', 'Minima a velit voluptatem vel.', 'scheduled'),
(214, 53, '2026-06-24 21:36:44', 'Autem asperiores et et deleniti beatae veritatis nobis.', 'scheduled'),
(215, 69, '2026-07-19 15:56:13', 'Quis hic ut omnis eos.', 'scheduled'),
(216, 85, '2026-07-19 17:58:14', 'Unde aperiam aut corrupti deserunt.', 'cancelled'),
(217, 101, '2026-05-28 12:19:19', 'Et sequi quaerat odit dolores minus rerum et.', 'cancelled'),
(218, 22, '2026-07-17 01:23:07', 'Nisi ut nemo officiis quisquam sint officia expedita incidunt.', 'completed'),
(219, 38, '2026-06-22 05:14:06', 'Impedit sed et repellendus et occaecati qui aut dolorem.', 'completed'),
(220, 54, '2026-06-30 10:48:05', 'Rem ad velit eos minima.', 'scheduled'),
(221, 70, '2026-06-27 00:02:53', 'Iure recusandae reprehenderit doloribus voluptas incidunt et.', 'cancelled'),
(222, 86, '2026-07-15 23:28:56', 'Ea officiis cupiditate et temporibus perferendis tempore.', 'completed'),
(223, 102, '2026-07-04 04:29:07', 'Rerum deleniti laboriosam fugit pariatur nemo error.', 'scheduled'),
(224, 23, '2026-07-15 04:41:01', 'Consequatur distinctio non quia fugiat ullam.', 'completed'),
(225, 39, '2026-07-21 20:51:26', 'Aut earum earum nihil atque provident perferendis modi.', 'cancelled'),
(226, 55, '2026-06-19 19:05:45', 'Dolorum corrupti vel nostrum est delectus voluptatem.', 'cancelled'),
(227, 71, '2026-07-15 03:11:37', 'Sequi voluptatem laboriosam aut.', 'completed'),
(228, 87, '2026-06-28 17:23:16', 'Libero consequatur maiores autem fugit.', 'in_progress'),
(229, 103, '2026-07-06 06:01:26', 'Est ullam ullam numquam eos eius.', 'cancelled'),
(230, 15, '2026-06-25 01:03:45', 'Et reprehenderit maxime ut ex et quod animi delectus.', 'completed'),
(231, 31, '2026-06-29 22:36:56', 'Voluptatum qui aspernatur consequatur debitis mollitia.', 'scheduled'),
(232, 47, '2026-07-16 03:49:21', 'Ducimus doloremque impedit sed architecto.', 'completed'),
(233, 63, '2026-06-22 04:58:44', 'Voluptatem totam optio facilis.', 'completed'),
(234, 79, '2026-05-30 11:03:15', 'Qui eveniet quia id aut praesentium perferendis rerum ut.', 'completed'),
(235, 95, '2026-07-03 11:54:28', 'Autem repellendus minus dolorem dolores voluptatum aut.', 'scheduled'),
(236, 20, '2026-06-03 09:47:58', 'Praesentium distinctio sequi et voluptates corrupti molestiae autem sed.', 'scheduled'),
(237, 36, '2026-05-26 18:56:15', 'Unde quam autem vel ut ut alias.', 'in_progress'),
(238, 52, '2026-07-05 19:45:36', 'Possimus ut aliquam voluptas sunt enim et.', 'completed'),
(239, 68, '2026-06-13 21:18:21', 'Omnis sapiente voluptas minus et.', 'scheduled'),
(240, 84, '2026-07-22 18:51:23', 'Rem explicabo inventore quia aut.', 'cancelled'),
(241, 100, '2026-06-10 18:31:50', 'Et qui id qui magnam necessitatibus in non.', 'completed'),
(242, 24, '2026-07-16 20:41:05', 'Et aperiam occaecati fuga tempora.', 'completed'),
(243, 40, '2026-06-13 14:10:21', 'Enim et rem ab perspiciatis dolorem.', 'scheduled'),
(244, 56, '2026-06-18 15:07:07', 'Eum provident nisi praesentium eius tempore delectus.', 'cancelled'),
(245, 72, '2026-07-17 07:46:10', 'Ipsa maxime veniam enim ex expedita.', 'in_progress'),
(246, 88, '2026-07-07 13:05:17', 'Ducimus dignissimos dignissimos placeat molestias nostrum minus.', 'completed'),
(247, 104, '2026-06-06 09:58:32', 'Accusamus voluptate et veritatis earum consequatur maxime vero.', 'completed'),
(248, 28, '2026-06-13 21:37:08', 'Voluptates voluptatem sunt aliquid expedita quia itaque voluptatem.', 'cancelled'),
(249, 44, '2026-07-07 06:49:24', 'Reiciendis sed consequatur sit cum eos ab rem.', 'in_progress'),
(250, 60, '2026-07-06 15:23:07', 'Voluptates ut ea minima quasi sapiente.', 'completed'),
(251, 76, '2026-06-17 03:42:57', 'Harum at est illum magnam explicabo atque.', 'scheduled'),
(252, 92, '2026-06-17 23:37:06', 'Eos animi est et exercitationem.', 'in_progress'),
(253, 108, '2026-07-15 19:53:46', 'Dignissimos velit enim neque sit aut consequuntur.', 'in_progress'),
(254, 30, '2026-07-03 03:16:41', 'Nesciunt aut unde dolores illum explicabo nihil.', 'in_progress'),
(255, 46, '2026-06-01 06:10:17', 'Deleniti harum et eius omnis fuga.', 'in_progress'),
(256, 62, '2026-06-06 23:33:39', 'Repellat consequatur esse nihil voluptate iusto incidunt.', 'completed'),
(257, 78, '2026-07-25 19:52:49', 'Cupiditate sint tempore ut incidunt.', 'scheduled'),
(258, 94, '2026-06-14 04:09:43', 'Deleniti aspernatur sint vel.', 'in_progress'),
(259, 110, '2026-06-24 04:28:48', 'Veritatis omnis quia voluptas libero ad sequi.', 'scheduled');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `customers`
--

INSERT INTO `customers` (`customer_id`, `user_id`, `first_name`, `last_name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(2, 2, 'Test', 'User', '123456', 'test@test.com', 'Street 1', '2026-06-15 17:08:08', '2026-06-15 17:08:08'),
(3, 3, 'Andor', 'Salamon', '+381605781202', 'salamon.andor@yahoo.com', 'Čantavir', '2026-06-15 17:27:03', '2026-06-15 17:27:03'),
(4, 4, 'Andor', 'Kovacs', '+38160123456', 'andor@example.com', 'Senta', '2026-06-16 14:25:34', '2026-06-16 14:25:34'),
(5, 5, 'Zoltan', 'Szabo', '+381635267178', 'zoli.szabo@gmail.com', 'Tavankut', '2026-06-16 17:00:50', '2026-06-16 17:00:50'),
(6, 12, 'Zsolti', 'Nagy', '+381635267178', 'zsolti.nagy@gmail.com', 'Tavankut', '2026-06-19 14:46:48', '2026-06-19 14:46:48'),
(7, 13, 'Laci', 'Test', '+381635267178', 'test.laci@gmail.com', 'Budapest', '2026-06-19 18:04:05', '2026-06-19 18:04:05'),
(8, 14, 'Adrianna', 'Takacs', '+36702578452', 'adrianna.takacs@gmail.com', 'Makó', '2026-06-22 13:17:46', '2026-06-22 13:17:46'),
(9, 16, 'Amalia', 'Nemeth', '+36702578452', 'amalia@gmail.com', 'Makó', '2026-06-22 17:50:39', '2026-06-22 17:50:39'),
(10, 7, 'Andreanne', 'Kautzer', '757-919-4307', NULL, '434 Marielle Club\nLake Emily, AK 11926', '2026-06-23 14:06:17', '2026-06-23 14:06:17'),
(13, 9, 'Annette', 'Dare', '+1-347-947-5718', NULL, '59940 Ulises Springs Suite 657\nEast Jaymeburgh, NC 72555-3607', '2026-06-23 14:10:41', '2026-06-23 14:10:41'),
(15, 10, 'Meaghan', 'O\'Reilly', '1-301-833-6404', NULL, '3405 Wolf Summit\nWest Cordie, ND 76893', '2026-06-23 14:17:47', '2026-06-23 14:17:47'),
(16, 1, 'Theron', 'Jacobson', '+1.941.837.0732', NULL, '718 Jayne Crest\nWest Angieside, NM 63577-4025', '2026-06-23 14:17:47', '2026-06-23 14:17:47'),
(17, 6, 'Cleta', 'Deckow', '+1.781.817.4688', NULL, '703 Michelle Greens Apt. 231\nJenniferport, VT 14865', '2026-06-23 14:17:47', '2026-06-23 14:17:47'),
(18, 11, 'Briana', 'Harber', '(567) 232-8357', NULL, '7159 Vandervort Greens Apt. 919\nNorth Kody, MI 40444', '2026-06-23 14:17:47', '2026-06-23 14:17:47'),
(19, 15, 'Lucile', 'Kling', '352-841-2223', NULL, '65972 Vada Harbor\nPort Jeanietown, NH 89713', '2026-06-23 14:17:47', '2026-06-23 14:17:47'),
(20, 17, 'Stella', 'Christiansen', '(775) 629-3111', NULL, '18537 Zboncak Spurs\nNew Gracieland, SD 20076', '2026-06-23 14:17:47', '2026-06-23 14:17:47');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `employees`
--

INSERT INTO `employees` (`employee_id`, `user_id`, `first_name`, `last_name`, `phone`, `email`) VALUES
(1, 6, 'Peter', 'Kovacs', '+381601234567', 'peter123@example.com'),
(2, 7, 'Peter', 'Nagy', '+381601234567', 'mechanic2@example.com'),
(3, 9, 'Peter', 'Magyar', '+381601234567', 'mechanic3@example.com'),
(4, 11, 'Andor', 'Molnar', '+381635784521', 'andor@yahoo.com'),
(5, 15, 'Tamas', 'Molnar', '+36305784526', 'tamas@ygmail.com'),
(6, 17, 'Zsuzsi', 'Mate', '+381638452147', 'zsuzsi@gmail.com'),
(7, 1, 'Lucio', 'Bins', '947-844-6606', 'rosetta55@blanda.org'),
(8, 2, 'Devan', 'Gislason', '360-867-2976', 'jared.carroll@yahoo.com'),
(9, 3, 'Luz', 'Murray', '1-314-730-6893', 'brendan.mckenzie@gmail.com'),
(10, 6, 'Daniella', 'Hoppe', '+1-531-347-4728', 'hhermann@hotmail.com'),
(11, 7, 'Lenora', 'Kuphal', '+1-678-809-6882', 'bartoletti.cecil@feil.com'),
(12, 9, 'Raymundo', 'McGlynn', '+1-541-816-1660', 'barton.mohammad@gmail.com'),
(13, 11, 'Camren', 'Stamm', '+1.308.357.9995', 'mcglynn.jordyn@hotmail.com'),
(14, 15, 'Mohammad', 'Bradtke', '+19092655611', 'gwuckert@barton.com'),
(15, 17, 'Andreanne', 'Daniel', '(815) 817-6861', 'heaney.darren@grant.org'),
(16, 1, 'Hassie', 'Mayer', '1-804-902-2790', 'qkunde@king.com'),
(17, 2, 'Wilfredo', 'Bartell', '(331) 202-2183', 'yblock@yahoo.com'),
(18, 3, 'Lucious', 'Will', '231-671-8703', 'jennie50@gmail.com'),
(19, 6, 'Joey', 'Mills', '310.378.8136', 'phartmann@anderson.com'),
(20, 7, 'Miles', 'Ledner', '408.473.0112', 'pschiller@hotmail.com'),
(21, 9, 'Max', 'DuBuque', '+1 (808) 980-1388', 'schmidt.lester@yahoo.com'),
(22, 11, 'Jerrold', 'Farrell', '1-351-357-2877', 'johnson.suzanne@smith.com'),
(23, 15, 'Carolanne', 'Spencer', '+14143794860', 'mosciski.efrain@gmail.com'),
(24, 17, 'Lauren', 'Mante', '380-553-0661', 'jonathan97@pouros.com'),
(25, 1, 'Alberta', 'Parisian', '832.294.0789', 'metz.felicity@hotmail.com'),
(26, 2, 'Jamarcus', 'Gerlach', '1-986-575-0158', 'donnelly.kory@kemmer.com'),
(27, 3, 'Shanelle', 'Littel', '424-791-4656', 'vandervort.alivia@oreilly.com'),
(28, 6, 'Marc', 'Schiller', '1-563-379-8052', 'eweber@yahoo.com'),
(29, 7, 'Eriberto', 'Homenick', '+1-754-959-6722', 'stoltenberg.lorenza@gmail.com'),
(30, 9, 'Reanna', 'Mayert', '+1-864-223-2081', 'joanne.hettinger@kovacek.net'),
(31, 11, 'Jamar', 'Williamson', '+1-469-930-1877', 'wunsch.jamarcus@gmail.com'),
(32, 15, 'Rubye', 'Marvin', '+1.458.959.3779', 'fdicki@mraz.info'),
(33, 17, 'Orpha', 'Erdman', '615.255.1899', 'johnpaul03@gmail.com'),
(34, 1, 'Frances', 'Flatley', '(228) 493-8057', 'hudson.steuber@hotmail.com'),
(35, 2, 'Nicola', 'Hintz', '(253) 692-1970', 'esperanza43@yahoo.com'),
(36, 3, 'Trenton', 'Gottlieb', '607.602.6433', 'adrain07@yahoo.com'),
(37, 6, 'Laisha', 'Connelly', '(234) 297-4714', 'justus86@hotmail.com'),
(38, 7, 'Natalie', 'Weimann', '+1.870.868.2365', 'madelynn.mueller@nicolas.com'),
(39, 9, 'Dominique', 'Langworth', '361-723-5110', 'reichel.rosalia@hotmail.com'),
(40, 11, 'Jeramy', 'Sipes', '909-203-4590', 'nicolas.rasheed@romaguera.com'),
(41, 15, 'Chaz', 'Gutmann', '830.334.8053', 'psawayn@hotmail.com'),
(42, 17, 'Edwina', 'Schumm', '930.409.1955', 'fweimann@franecki.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_logins`
--

CREATE TABLE `failed_logins` (
  `failed_login_id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(50) NOT NULL,
  `attempted_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `repair_order_id` int(11) NOT NULL,
  `invoice_date` datetime NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` enum('cash','credit card') NOT NULL,
  `status` enum('pending','paid','cancelled') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `repair_order_id`, `invoice_date`, `total_amount`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, '2026-06-19 09:41:41', 297.96, 'cash', 'pending', '2026-06-19 09:41:41', '2026-06-19 09:41:41'),
(2, 3, '2026-06-19 09:43:32', 100.00, 'credit card', 'paid', '2026-06-19 09:43:32', '2026-06-19 09:54:06'),
(3, 4, '2026-06-22 16:22:30', 305.98, 'cash', 'paid', '2026-06-22 16:22:30', '2026-06-22 16:25:57'),
(4, 5, '2026-06-23 12:10:53', 705.88, 'credit card', 'paid', '2026-06-23 12:10:53', '2026-06-23 12:19:02');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ip_locations`
--

CREATE TABLE `ip_locations` (
  `location_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `isp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `ip_locations`
--

INSERT INTO `ip_locations` (`location_id`, `session_id`, `country`, `city`, `isp`) VALUES
(1, 1, '', '', ''),
(2, 2, '', '', ''),
(3, 3, '', '', ''),
(4, 5, 'Australia', 'South Brisbane', 'Cloudflare, Inc'),
(5, 6, 'Australia', 'South Brisbane', 'Cloudflare, Inc'),
(6, 7, 'United States', 'Ashburn', 'Google LLC'),
(7, 8, 'United States', 'Ashburn', 'Google LLC'),
(8, 9, 'United States', 'Ashburn', 'Google LLC'),
(9, 10, 'United States', 'Ashburn', 'Google LLC'),
(10, 11, 'United States', 'Ashburn', 'Google LLC'),
(11, 12, 'United States', 'Ashburn', 'Google LLC'),
(12, 13, 'United States', 'Ashburn', 'Google LLC'),
(13, 14, 'United States', 'Ashburn', 'Google LLC'),
(14, 15, 'United States', 'Ashburn', 'Google LLC'),
(15, 16, 'United States', 'Ashburn', 'Google LLC'),
(16, 17, 'United States', 'Ashburn', 'Google LLC'),
(17, 18, 'United States', 'Ashburn', 'Google LLC'),
(18, 19, 'United States', 'Ashburn', 'Google LLC'),
(19, 20, 'United States', 'Ashburn', 'Google LLC'),
(20, 21, 'United States', 'Ashburn', 'Google LLC'),
(21, 22, 'United States', 'Ashburn', 'Google LLC'),
(22, 23, 'United States', 'Ashburn', 'Google LLC'),
(23, 24, 'United States', 'Ashburn', 'Google LLC'),
(24, 25, 'United States', 'Ashburn', 'Google LLC'),
(25, 26, 'United States', 'Ashburn', 'Google LLC'),
(26, 27, 'United States', 'Ashburn', 'Google LLC'),
(27, 28, 'United States', 'Ashburn', 'Google LLC'),
(28, 29, 'United States', 'Ashburn', 'Google LLC'),
(29, 30, 'United States', 'Ashburn', 'Google LLC'),
(30, 31, 'United States', 'Ashburn', 'Google LLC'),
(31, 32, 'United States', 'Ashburn', 'Google LLC'),
(32, 33, 'United States', 'Ashburn', 'Google LLC'),
(33, 34, 'United States', 'Ashburn', 'Google LLC'),
(34, 35, 'United States', 'Ashburn', 'Google LLC'),
(35, 36, 'United States', 'Ashburn', 'Google LLC'),
(36, 37, 'United States', 'Ashburn', 'Google LLC'),
(37, 38, 'United States', 'Ashburn', 'Google LLC'),
(38, 39, 'United States', 'Ashburn', 'Google LLC'),
(39, 40, 'United States', 'Ashburn', 'Google LLC'),
(40, 41, 'United States', 'Ashburn', 'Google LLC'),
(41, 42, 'United States', 'Ashburn', 'Google LLC'),
(42, 43, 'United States', 'Ashburn', 'Google LLC'),
(43, 44, 'United States', 'Ashburn', 'Google LLC'),
(44, 45, 'United States', 'Ashburn', 'Google LLC'),
(45, 46, 'United States', 'Ashburn', 'Google LLC'),
(46, 47, 'United States', 'Ashburn', 'Google LLC'),
(47, 48, 'United States', 'Ashburn', 'Google LLC'),
(48, 49, 'United States', 'Ashburn', 'Google LLC'),
(49, 50, 'United States', 'Ashburn', 'Google LLC'),
(50, 51, 'United States', 'Ashburn', 'Google LLC'),
(51, 52, 'United States', 'Ashburn', 'Google LLC'),
(52, 53, 'United States', 'Ashburn', 'Google LLC'),
(53, 54, 'United States', 'Ashburn', 'Google LLC'),
(54, 55, 'United States', 'Ashburn', 'Google LLC'),
(55, 56, 'United States', 'Ashburn', 'Google LLC'),
(56, 57, 'United States', 'Ashburn', 'Google LLC'),
(57, 58, 'United States', 'Ashburn', 'Google LLC'),
(58, 59, 'United States', 'Ashburn', 'Google LLC'),
(59, 60, 'United States', 'Ashburn', 'Google LLC'),
(60, 61, 'United States', 'Ashburn', 'Google LLC'),
(61, 62, 'United States', 'Ashburn', 'Google LLC'),
(62, 63, 'United States', 'Ashburn', 'Google LLC'),
(63, 64, 'United States', 'Ashburn', 'Google LLC'),
(64, 65, 'United States', 'Ashburn', 'Google LLC'),
(65, 66, 'United States', 'Ashburn', 'Google LLC'),
(66, 67, 'United States', 'Ashburn', 'Google LLC'),
(67, 68, 'United States', 'Ashburn', 'Google LLC'),
(68, 69, 'United States', 'Ashburn', 'Google LLC'),
(69, 70, 'United States', 'Ashburn', 'Google LLC'),
(70, 71, 'United States', 'Ashburn', 'Google LLC'),
(71, 72, 'United States', 'Ashburn', 'Google LLC');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `parts`
--

CREATE TABLE `parts` (
  `part_id` int(11) NOT NULL,
  `part_name` varchar(150) NOT NULL,
  `part_number` varchar(100) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `parts`
--

INSERT INTO `parts` (`part_id`, `part_name`, `part_number`, `stock_quantity`, `unit_price`) VALUES
(1, 'Premium Oil Filter', 'OF-001', 43, 18.99),
(3, 'Exhaust', 'EX-001', 49, 25.99),
(6, 'Michelin Tire', 'MH-001', 74, 30.99);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_resets`
--

CREATE TABLE `password_resets` (
  `reset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `password_resets`
--

INSERT INTO `password_resets` (`reset_id`, `user_id`, `token`, `expires_at`, `used`, `created_at`) VALUES
(1, 1, 'd0d84b236d6b5a07463be7c891f56545c394b9fcb884f4e52f38c987206c437b', '2026-06-15 13:48:00', 0, '2026-06-15 14:48:00'),
(2, 1, 'aa3e41ece0105035b904e373939aa4c7751c9b278201a54662282795f5cde8cd', '2026-06-15 13:54:22', 0, '2026-06-15 14:54:22'),
(3, 1, 'f9b13884dba7aa7a0e7fbfe6f74a091f163b895794c18d3f8197822d4427ba91', '2026-06-15 16:06:45', 1, '2026-06-15 15:06:45'),
(4, 3, '0777aa111860b2d869052136cd79186a57ca1d0f894055e01a11362c84b22956', '2026-06-15 18:31:07', 1, '2026-06-15 17:31:07'),
(5, 2, 'a4d9417e052610fc8ad259dcaa102f06e14ace313e185abb1e90cd6f3eb04f4d', '2026-06-18 11:29:51', 1, '2026-06-18 10:29:51'),
(6, 4, 'a380f91219f69e6aa2c775a9528ad02ba6431a4dd88997654b0e0250a355eb95', '2026-06-18 15:12:57', 1, '2026-06-18 14:12:57'),
(7, 1, '6c05881600c633d098694703231f87385e98dccfc4b57b0a41bac5522c3a32f2', '2026-06-19 15:48:00', 1, '2026-06-19 14:48:00'),
(8, 1, 'd8cae908f11a5f85aded4c52dd8ae1ecd3c362a295c881730268e69ebcdfd725', '2026-06-19 15:53:59', 0, '2026-06-19 14:53:59'),
(9, 1, 'b8087aa1088f56201824d1680e71fec112c8cbb22674d72accb2a06b3e9a45cd', '2026-06-19 16:00:41', 1, '2026-06-19 15:00:41'),
(10, 1, 'aa069a496e78a0135fceaf6d51962762f0dbf24d8b93147366a745c5d5ea1cab', '2026-06-19 16:15:23', 1, '2026-06-19 15:15:23'),
(11, 2, 'c50592b6b78b9a9639e452e3a0041bb398cf0883d5bd0a50d97eeb43ae158641', '2026-06-19 17:08:59', 1, '2026-06-19 16:08:59'),
(12, 4, 'ea3bd41ebdf918e21791e69d1b79cf7e5cda682e0e06d56fe0ce7603361e9ae6', '2026-06-22 14:22:38', 1, '2026-06-22 13:22:38'),
(13, 16, '89b235fd974068a679be32e50f646ee34419f191a266cb69d584c81e7392e2a7', '2026-06-22 18:55:01', 1, '2026-06-22 17:55:01'),
(14, 16, '24a3fb5756965c7e20ce0a0096802270222095f20ea25af0e784eaaf418d6f51', '2026-06-23 11:28:41', 1, '2026-06-23 10:28:41'),
(15, 16, '00906123b26ffa3154a872df1d6691d91983878a46a51679c4eae18b51f1402e', '2026-06-24 16:51:35', 0, '2026-06-24 15:51:35'),
(16, 1, '3f338c2b4766f9912179d31c667af8e9f8acfcf617ab825aed78d7f6105afc88', '2026-06-24 16:52:31', 0, '2026-06-24 15:52:31'),
(17, 1, 'bae566a5361e947d8126e47e102e1d9035c9eaa288cc032abfbb803b4716ea5f', '2026-06-26 10:49:45', 0, '2026-06-26 09:49:45'),
(18, 1, '93fbd4353aef8181dfd675b6a77b134369e09602fc770001b7b84e4f56b271b9', '2026-06-26 10:51:15', 0, '2026-06-26 09:51:15'),
(19, 1, '2dcae07505ec2c622b210a1371ba7eac345c29fabe77ac987c0255447894ebf0', '2026-06-26 13:06:14', 1, '2026-06-26 12:06:14'),
(20, 1, '248d5e79e6c1d0798fe795df9ed814165968269d519cf140162b270747816c04', '2026-06-26 13:11:31', 1, '2026-06-26 12:11:31');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `repair_orders`
--

CREATE TABLE `repair_orders` (
  `repair_order_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` enum('reported','in progress','completed') NOT NULL,
  `total_labor_cost` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `repair_orders`
--

INSERT INTO `repair_orders` (`repair_order_id`, `appointment_id`, `employee_id`, `start_date`, `end_date`, `status`, `total_labor_cost`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '2026-06-17 09:00:00', NULL, 'in progress', 120.00, '2026-06-17 14:58:11', '2026-06-17 15:01:07'),
(3, 1, 2, '2026-06-18 10:30:00', NULL, 'reported', 100.00, '2026-06-18 10:22:50', '2026-06-18 10:22:50'),
(4, 3, 3, '2026-06-22 14:30:00', NULL, 'in progress', 150.00, '2026-06-22 14:51:43', '2026-06-22 14:54:51'),
(5, 4, 5, '2026-06-23 12:00:00', NULL, 'in progress', 100.00, '2026-06-23 10:43:41', '2026-06-23 10:44:53'),
(6, 6, 1, '2026-02-05 01:54:16', NULL, 'in progress', 274.40, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(7, 49, 4, '2026-01-17 08:53:28', NULL, 'completed', 429.96, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(8, 47, 21, '2026-03-02 22:48:48', NULL, 'completed', 432.02, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(9, 31, 14, '2026-01-02 18:42:11', NULL, 'reported', 71.30, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(10, 42, 3, '2026-05-13 20:17:08', NULL, 'completed', 64.06, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(11, 46, 21, '2026-04-23 14:54:51', NULL, 'reported', 122.83, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(12, 61, 4, '2026-01-19 20:05:44', NULL, 'in progress', 466.47, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(13, 24, 21, '2026-01-20 16:20:51', NULL, 'in progress', 452.68, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(14, 35, 6, '2026-02-01 17:51:05', NULL, 'completed', 277.82, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(15, 18, 12, '2026-02-01 06:46:42', NULL, 'reported', 390.46, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(16, 4, 2, '2026-01-04 16:10:54', NULL, 'completed', 397.93, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(17, 32, 19, '2026-05-16 04:14:06', NULL, 'reported', 443.85, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(18, 35, 13, '2026-02-12 06:44:42', NULL, 'reported', 420.60, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(19, 28, 20, '2026-05-14 03:02:53', NULL, 'completed', 483.95, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(20, 67, 22, '2026-04-25 19:32:47', NULL, 'reported', 420.08, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(21, 64, 12, '2026-06-05 00:21:19', NULL, 'reported', 375.47, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(22, 26, 22, '2026-02-08 20:07:23', NULL, 'in progress', 148.13, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(23, 34, 8, '2026-01-23 16:37:06', NULL, 'completed', 66.93, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(24, 26, 3, '2026-02-18 09:28:32', NULL, 'reported', 227.52, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(25, 70, 7, '2026-03-05 13:29:30', NULL, 'in progress', 315.54, '2026-06-23 14:39:33', '2026-06-23 14:39:33'),
(26, 47, 7, '2026-01-30 15:27:46', NULL, 'in progress', 210.50, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(27, 33, 12, '2026-02-15 04:48:37', NULL, 'completed', 217.44, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(28, 57, 22, '2026-01-28 18:38:53', NULL, 'completed', 431.63, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(29, 63, 21, '2026-06-06 14:51:12', NULL, 'completed', 495.68, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(30, 65, 18, '2026-05-15 10:03:55', NULL, 'reported', 235.10, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(31, 44, 2, '2026-06-17 06:43:17', NULL, 'in progress', 225.06, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(32, 56, 21, '2026-06-02 08:53:29', NULL, 'completed', 341.69, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(33, 59, 2, '2026-01-05 04:43:47', NULL, 'reported', 363.92, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(34, 21, 13, '2026-05-10 23:48:49', NULL, 'completed', 446.23, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(35, 5, 8, '2026-03-07 21:01:59', NULL, 'reported', 186.78, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(36, 51, 15, '2026-04-22 07:40:35', NULL, 'in progress', 97.17, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(37, 52, 12, '2026-03-03 01:40:50', NULL, 'reported', 492.58, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(38, 60, 9, '2026-05-11 07:53:43', NULL, 'in progress', 489.05, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(39, 65, 2, '2026-01-17 23:39:41', NULL, 'completed', 485.80, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(40, 28, 2, '2026-06-15 07:53:47', NULL, 'completed', 275.12, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(41, 13, 3, '2026-06-19 10:49:31', NULL, 'reported', 483.07, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(42, 24, 3, '2026-04-27 12:23:20', NULL, 'in progress', 326.32, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(43, 1, 1, '2026-06-07 05:45:48', NULL, 'completed', 482.60, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(44, 45, 16, '2026-01-27 07:19:15', NULL, 'reported', 123.05, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(45, 38, 3, '2026-06-13 05:21:09', NULL, 'reported', 310.71, '2026-06-23 14:39:38', '2026-06-23 14:39:38'),
(46, 5, 31, '2026-06-11 08:56:07', NULL, 'completed', 463.63, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(47, 96, 23, '2026-02-03 20:04:23', NULL, 'reported', 345.69, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(48, 74, 23, '2026-06-09 09:44:50', NULL, 'completed', 190.78, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(49, 147, 15, '2026-02-19 06:25:26', NULL, 'reported', 205.57, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(50, 117, 28, '2026-06-13 03:21:29', NULL, 'reported', 247.38, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(51, 123, 19, '2026-05-09 09:30:04', NULL, 'completed', 167.28, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(52, 93, 7, '2026-01-07 00:59:47', NULL, 'reported', 360.01, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(53, 144, 16, '2026-05-04 20:47:08', NULL, 'completed', 359.42, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(54, 17, 19, '2026-02-20 07:43:22', NULL, 'in progress', 300.02, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(55, 93, 30, '2026-01-10 19:54:57', NULL, 'reported', 317.50, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(56, 110, 3, '2026-05-16 01:53:05', NULL, 'in progress', 200.30, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(57, 126, 14, '2026-04-12 18:58:38', NULL, 'in progress', 59.34, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(58, 154, 32, '2026-01-05 23:06:40', NULL, 'completed', 199.74, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(59, 148, 29, '2026-04-03 03:03:50', NULL, 'reported', 375.87, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(60, 30, 26, '2026-05-25 07:29:34', NULL, 'completed', 482.45, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(61, 10, 28, '2026-04-19 17:00:11', NULL, 'in progress', 136.46, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(62, 138, 3, '2026-04-22 08:25:16', NULL, 'completed', 424.32, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(63, 15, 31, '2026-01-05 15:45:49', NULL, 'completed', 356.85, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(64, 84, 5, '2026-02-11 06:14:11', NULL, 'completed', 182.88, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(65, 157, 31, '2026-03-03 11:07:07', NULL, 'reported', 139.65, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(66, 10, 10, '2026-06-25 13:00:00', NULL, 'reported', 100.00, '2026-06-25 12:38:22', '2026-06-25 12:38:22'),
(67, 80, 32, '2026-02-04 21:48:44', NULL, 'completed', 332.89, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(68, 46, 15, '2026-03-16 08:08:59', NULL, 'in progress', 125.60, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(69, 95, 29, '2026-03-18 23:18:35', NULL, 'reported', 446.04, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(70, 25, 6, '2026-05-12 15:00:32', NULL, 'reported', 439.02, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(71, 91, 30, '2026-03-01 21:57:51', NULL, 'reported', 157.17, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(72, 4, 6, '2026-04-20 20:27:34', NULL, 'in progress', 252.09, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(73, 51, 11, '2026-04-17 17:46:41', NULL, 'reported', 335.58, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(74, 216, 14, '2026-05-10 13:20:27', NULL, 'in progress', 204.91, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(75, 157, 7, '2026-06-15 07:55:26', NULL, 'completed', 87.21, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(76, 199, 31, '2026-05-18 21:16:28', NULL, 'reported', 252.47, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(77, 147, 14, '2026-01-19 16:42:44', NULL, 'reported', 219.19, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(78, 181, 1, '2026-01-31 06:48:37', NULL, 'completed', 53.61, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(79, 232, 35, '2026-03-10 12:26:39', NULL, 'completed', 356.93, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(80, 139, 39, '2026-02-07 04:22:04', NULL, 'reported', 410.43, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(81, 194, 24, '2026-05-16 14:09:43', NULL, 'in progress', 306.79, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(82, 86, 7, '2026-02-12 12:07:42', NULL, 'in progress', 472.78, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(83, 209, 40, '2026-01-27 14:40:39', NULL, 'reported', 343.00, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(84, 113, 42, '2026-04-02 01:28:38', NULL, 'reported', 335.71, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(85, 231, 42, '2026-02-24 05:46:24', NULL, 'in progress', 51.84, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(86, 214, 38, '2026-02-21 10:17:05', NULL, 'reported', 193.26, '2026-06-26 12:50:25', '2026-06-26 12:50:25');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `repair_order_parts`
--

CREATE TABLE `repair_order_parts` (
  `repair_order_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `repair_order_parts`
--

INSERT INTO `repair_order_parts` (`repair_order_id`, `part_id`, `quantity`, `unit_price`) VALUES
(2, 1, 2, 18.99),
(4, 3, 1, 25.99),
(5, 6, 6, 30.99);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `repair_order_services`
--

CREATE TABLE `repair_order_services` (
  `repair_order_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `repair_order_services`
--

INSERT INTO `repair_order_services` (`repair_order_id`, `service_id`, `quantity`, `price`) VALUES
(2, 1, 2, 69.99),
(4, 3, 1, 129.99),
(5, 6, 6, 69.99);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'admin'),
(5, 'customer'),
(4, 'manager'),
(3, 'mechanic'),
(2, 'receptionist');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(150) NOT NULL,
  `base_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `base_price`) VALUES
(1, 'Premium Oil Change', 69.99),
(3, 'Gearbox Change', 129.99),
(6, 'Tire Change', 69.99);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `role_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'andor123', 'salamon.andor@gmail.com', '$2y$10$7085r9k25s8X6jj.mAQQquYZptfVzYX8xVGeDEiTKbQMMyZlxrS0u', 2, 1, '2026-06-15 12:41:10', '2026-06-26 12:12:02'),
(2, 'test', 'test@test.com', '$2y$10$Mm2Mf1ZEBrVvT58b5jJ6RuItHq8MDOmzJ96lK6tN4sa7Z7nnq8Hje', 2, 1, '2026-06-15 12:49:01', '2026-06-19 16:10:24'),
(3, 'andor127', 'salamon.andor@yahoo.com', '$2y$10$VStymvDMTm.eKEsAbFy2v.W9cIXsexAhIw3eODUV929vLdLYCH7rm', 2, 1, '2026-06-15 17:27:03', '2026-06-15 17:31:35'),
(4, 'andor', 'andor@example.com', '$2y$10$9L1B4HiY13D6zFBXJa.vFuhvHLhm1bHwzjU4.btuztU98HJu763rq', 5, 1, '2026-06-16 14:25:34', '2026-06-22 13:25:14'),
(5, 'zoli528', 'zoli.szabo@gmail.com', '$2y$10$KvpP46uK5G1dMw8MldErHucf55jwnkMYF8eRhopW2TeKvbVNBCMH6', 5, 1, '2026-06-16 17:00:50', '2026-06-16 17:00:50'),
(6, 'mechanic1', 'mechanic1@example.com', '$2y$10$abcdefghijklmnopqrstuv', 3, 1, '2026-06-17 14:57:05', '2026-06-17 14:57:05'),
(7, 'mechanic2', 'mechanic2@example.com', '$2y$10$xxVRNdHyuS.m.7Nu8ix9O.My5i0hHTc8GaR6eI7e5.vyKjHNnqbku', 3, 0, '2026-06-17 16:38:27', '2026-06-17 17:10:13'),
(9, 'mechanic3', 'mechanic3@example.com', '$2y$10$E8zkuD6Kk6iN3W3BwSsE5uU6tzmW8dYH3SclbleoHz6w2O4OGgcbC', 3, 1, '2026-06-17 16:51:47', '2026-06-17 16:51:47'),
(10, 'admin', 'admin@gmail.com', '$2y$10$332x9AJWjX0xJBOpHbkStOe8dHBXjnYbk/JQ3aV.iXgbijo9p0t2G', 1, 1, '2026-06-18 10:02:20', '2026-06-18 10:02:20'),
(11, 'andor777', 'andor@yahoo.com', '$2y$10$Fj7qduR/qHpcjnktfOoI2OiItadFyaloF/iTEYYehGQvWzb5oM5wK', 3, 1, '2026-06-18 10:06:06', '2026-06-18 10:06:06'),
(12, 'zsolti322', 'zsolti.nagy@gmail.com', '$2y$10$1tWuvDWGdJPR1ut4unbg.uzLWDUGhJEMheBhfV533gS2c9pMBb9ju', 5, 1, '2026-06-19 14:46:48', '2026-06-19 14:46:48'),
(13, 'test2', 'test.laci@gmail.com', '$2y$10$LM3fmLL7bXOxUwvYu.D4KuBrgwA8Q.B0QZw2HrLkeFneegWvTt1OO', 5, 1, '2026-06-19 18:04:05', '2026-06-19 18:04:05'),
(14, 'adrianna12', 'adrianna.takacs@gmail.com', '$2y$10$OR12fzfIwedUrQAw2D4.l.eF1VCUj1BTCvY15LIBfEQKWoepn5nrC', 5, 1, '2026-06-22 13:17:46', '2026-06-22 13:17:46'),
(15, 'tamas444', 'tamas@yahoo.com', '$2y$10$GLJMHcbNUqb60Xo7hdYPUejRxnqW8a6pUVjR1JqgZfMDxOYgr38Gi', 3, 0, '2026-06-22 15:09:54', '2026-06-22 15:13:13'),
(16, 'amalia1', 'amalia@gmail.com', '$2y$10$Bv/SgiD5zwU7iwbBKEroVeu7cUZl9YmAvY0X2nb4gm28yT6fNf9Ue', 5, 1, '2026-06-22 17:50:39', '2026-06-23 10:29:06'),
(17, 'zsuzsi158', 'zsuzsi@gmail.com', '$2y$10$G5jaYV.lidQgfvdIJUfiD.t3Y2Y58RPd.QdZtxDhlvn1cpwglBwKK', 3, 0, '2026-06-23 11:02:39', '2026-06-23 11:23:19');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_sessions`
--

CREATE TABLE `user_sessions` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_time` datetime NOT NULL,
  `logout_time` datetime DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `device_type` varchar(20) NOT NULL,
  `browser` varchar(100) NOT NULL,
  `os` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `user_sessions`
--

INSERT INTO `user_sessions` (`session_id`, `user_id`, `login_time`, `logout_time`, `ip_address`, `device_type`, `browser`, `os`) VALUES
(1, 10, '2026-06-19 12:55:06', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(2, 10, '2026-06-19 12:58:29', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(3, 10, '2026-06-19 13:07:40', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(4, 10, '2026-06-19 13:09:28', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(5, 10, '2026-06-19 13:11:18', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(6, 10, '2026-06-19 13:12:28', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(7, 10, '2026-06-19 13:18:07', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(8, 10, '2026-06-19 13:46:56', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(9, 10, '2026-06-19 13:54:53', '2026-06-19 13:55:13', '::1', 'desktop', 'Unknown', 'Unknown'),
(10, 10, '2026-06-19 13:58:32', '2026-06-19 13:58:46', '::1', 'desktop', 'Unknown', 'Unknown'),
(11, 10, '2026-06-19 14:47:06', '2026-06-19 14:47:34', '::1', 'desktop', 'Unknown', 'Unknown'),
(12, 10, '2026-06-19 14:52:23', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(13, 10, '2026-06-19 15:47:11', '2026-06-19 15:51:54', '::1', 'desktop', 'Unknown', 'Unknown'),
(14, 10, '2026-06-19 15:58:42', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(15, 2, '2026-06-19 16:11:20', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(16, 10, '2026-06-19 16:49:52', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(17, 10, '2026-06-19 17:23:40', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(18, 10, '2026-06-22 12:44:03', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(19, 10, '2026-06-22 12:56:19', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(20, 10, '2026-06-22 13:12:37', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(21, 10, '2026-06-22 13:13:07', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(22, 10, '2026-06-22 13:16:13', '2026-06-22 13:20:48', '::1', 'desktop', 'Unknown', 'Unknown'),
(23, 10, '2026-06-22 13:35:26', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(24, 4, '2026-06-22 13:36:52', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(25, 4, '2026-06-22 14:04:45', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(26, 4, '2026-06-22 14:12:46', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(27, 10, '2026-06-22 14:55:10', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(28, 10, '2026-06-22 14:55:33', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(29, 10, '2026-06-22 16:00:03', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(30, 10, '2026-06-22 16:27:46', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(31, 10, '2026-06-22 16:48:12', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(32, 10, '2026-06-22 16:53:10', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(33, 10, '2026-06-22 16:55:09', '2026-06-22 16:55:32', '::1', 'desktop', 'Unknown', 'Unknown'),
(34, 10, '2026-06-22 17:13:43', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(35, 16, '2026-06-22 17:53:14', '2026-06-22 17:53:48', '::1', 'desktop', 'Unknown', 'Unknown'),
(36, 16, '2026-06-23 10:29:38', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(37, 10, '2026-06-23 11:00:24', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(38, 10, '2026-06-23 12:03:34', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(39, 10, '2026-06-24 15:08:36', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(40, 10, '2026-06-24 15:09:01', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(41, 10, '2026-06-24 15:09:15', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(42, 10, '2026-06-24 15:48:12', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(43, 10, '2026-06-24 15:53:56', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(44, 10, '2026-06-24 16:02:58', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(45, 10, '2026-06-24 16:05:14', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(46, 10, '2026-06-24 16:05:29', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(47, 10, '2026-06-24 16:08:02', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(48, 10, '2026-06-24 16:19:41', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(49, 10, '2026-06-24 16:21:29', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(50, 10, '2026-06-24 16:28:43', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(51, 10, '2026-06-24 16:29:15', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(52, 10, '2026-06-24 17:31:28', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(53, 10, '2026-06-24 17:35:25', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(54, 10, '2026-06-24 17:39:23', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(55, 10, '2026-06-24 17:46:59', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(56, 10, '2026-06-24 17:51:55', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(57, 10, '2026-06-24 17:52:34', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(58, 10, '2026-06-24 17:54:12', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(59, 10, '2026-06-24 18:03:52', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(60, 10, '2026-06-24 18:04:52', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(61, 10, '2026-06-25 11:17:49', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(62, 10, '2026-06-25 12:06:27', NULL, '::1', 'desktop', 'Unknown', 'Unknown'),
(63, 10, '2026-06-25 12:32:01', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(64, 10, '2026-06-25 12:37:34', '2026-06-25 12:39:45', '::1', 'desktop', 'Unknown', 'Unknown'),
(65, 10, '2026-06-25 12:40:08', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(66, 10, '2026-06-25 16:26:16', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(67, 10, '2026-06-25 17:27:12', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(68, 10, '2026-06-25 17:34:25', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(69, 10, '2026-06-26 09:48:04', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(70, 10, '2026-06-26 12:07:57', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(71, 10, '2026-06-26 12:08:45', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux'),
(72, 10, '2026-06-26 12:36:46', NULL, '127.0.0.1', 'desktop', 'Firefox', 'Linux');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vehicles`
--

CREATE TABLE `vehicles` (
  `vehicle_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `license_plate` varchar(20) NOT NULL,
  `vin` varchar(50) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `year` year(4) NOT NULL,
  `engine_type` varchar(100) NOT NULL,
  `mileage` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `vehicles`
--

INSERT INTO `vehicles` (`vehicle_id`, `customer_id`, `license_plate`, `vin`, `brand`, `model`, `year`, `engine_type`, `mileage`, `created_at`, `updated_at`) VALUES
(5, 2, 'SU117-EL', '1HGCM82633A123456', 'Mercedes-Benz', 'A140', '2003', 'petrol', 120000, '2026-06-15 17:11:35', '2026-06-15 17:11:35'),
(8, 3, 'SU078-BN', 'W168ABCD1234', 'Citroen', 'C5', '2004', 'petrol', 120000, '2026-06-15 17:34:00', '2026-06-15 17:34:00'),
(10, 4, 'ROH-101', '2MG456ABC123', 'Toyota', 'Corolla', '2015', 'petrol', 100000, '2026-06-16 15:12:32', '2026-06-16 15:12:32'),
(11, 4, 'SU152-CD', 'W170HBC586', 'Mercedes-Benz', 'C200', '2010', 'diesel', 150000, '2026-06-16 16:52:47', '2026-06-22 14:27:31'),
(14, 9, 'SU085-HF', 'OGPISK4842454', 'Opel', 'Meriva', '2009', 'petrol', 100000, '2026-06-23 10:36:27', '2026-06-23 10:36:27'),
(15, 16, 'SC-911-SF', 'UDFUHGIWXIJDIZCXC', 'Audi', 'molestiae', '2007', 'Diesel', 257042, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(16, 2, 'JT-231-VZ', 'YNGSTILYKODYKWCCZ', 'Ford', 'deserunt', '2018', 'Hybrid', 239614, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(17, 3, 'LN-274-ZW', 'FTXCOSGZFZMKDVONQ', 'Ford', 'vel', '2011', 'Diesel', 15164, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(18, 4, 'GS-905-OT', 'QMTLUUWLPHWDOAOJH', 'Toyota', 'esse', '2020', 'Electric', 226356, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(19, 5, 'YL-598-IN', 'CPAGIOEPNBXNGCAMN', 'Ford', 'saepe', '2009', 'Electric', 32963, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(20, 17, 'OR-460-JW', 'XVEMCQGUNYXYFRXQI', 'Volkswagen', 'est', '2010', 'Petrol', 124040, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(21, 10, 'ZI-170-RF', 'GEEOYSHKVTNSHUAMN', 'Audi', 'nostrum', '2024', 'Hybrid', 44510, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(22, 13, 'XT-495-ME', 'ZDOGXYQQFLDPOBFGG', 'Volkswagen', 'nobis', '2024', 'Hybrid', 184588, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(23, 15, 'VG-889-VI', 'LTTSMXHMDYSJIXLQI', 'Toyota', 'quisquam', '2025', 'Electric', 172926, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(24, 18, 'VR-888-ZZ', 'ZNCSYJSDKSERVKZEB', 'Toyota', 'porro', '2007', 'Electric', 218282, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(25, 6, 'HX-234-WV', 'XPTEEQSEITDDLZPEA', 'Volkswagen', 'dolores', '2025', 'Petrol', 243724, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(26, 7, 'XW-896-FE', 'VQBOXLZIAZZEOEVZI', 'BMW', 'porro', '2008', 'Hybrid', 239364, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(27, 8, 'AC-100-YC', 'ZTTVLPXKCTRPBKANS', 'Volkswagen', 'modi', '2020', 'Petrol', 282058, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(28, 19, 'MF-460-PU', 'FQYNGSRDAPLLSEZWL', 'Ford', 'molestiae', '2020', 'Electric', 18599, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(29, 9, 'WA-284-BX', 'YEDGDDIZIOEXEYLRV', 'Ford', 'quod', '2012', 'Hybrid', 263045, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(30, 20, 'JG-396-FK', 'VFOXSFIOYUICIDBTV', 'Ford', 'porro', '2016', 'Hybrid', 136737, '2026-06-23 14:21:34', '2026-06-23 14:21:34'),
(31, 16, 'UL-144-LP', 'OBIBXGOTHDUDLGQDB', 'Volkswagen', 'adipisci', '2017', 'Petrol', 53232, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(32, 2, 'JG-991-EW', 'MCGQLMEDAIZYKORKE', 'Toyota', 'odit', '2013', 'Hybrid', 200566, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(33, 3, 'EW-426-WF', 'CIPMMYOBPSPFDTWGI', 'Toyota', 'quaerat', '2006', 'Electric', 221001, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(34, 4, 'GK-963-GO', 'CGAZDKIULQYJEEMXO', 'Ford', 'sunt', '2017', 'Hybrid', 19487, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(35, 5, 'CA-202-KM', 'CVHOYCTCNIMJENHNB', 'BMW', 'quod', '2018', 'Hybrid', 101102, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(36, 17, 'NP-721-YM', 'SKNCMRHZQCOAVEBHB', 'Toyota', 'totam', '2013', 'Electric', 284290, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(37, 10, 'LH-599-VM', 'GQZMGNKZFUSRUKVSE', 'Volkswagen', 'dicta', '2016', 'Diesel', 200034, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(38, 13, 'JW-007-WZ', 'HXWFMEBJEJVOOSUXR', 'Audi', 'doloribus', '2009', 'Petrol', 125617, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(39, 15, 'NW-978-QE', 'PWLWSCMSPRAZDXUAQ', 'Audi', 'et', '2017', 'Diesel', 60021, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(40, 18, 'KV-842-LV', 'VOIPEWXXUFBMSNJDU', 'Ford', 'sapiente', '2006', 'Hybrid', 39543, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(41, 6, 'DD-194-NG', 'MYWDPZQVEIERNIRGE', 'Ford', 'totam', '2024', 'Hybrid', 276121, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(42, 7, 'DW-812-KZ', 'DQMAQGAPSETPDUOJR', 'Audi', 'earum', '2022', 'Electric', 198634, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(43, 8, 'XB-513-YG', 'XRYXPMYXOUZAIKMPB', 'Audi', 'et', '2006', 'Hybrid', 59275, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(44, 19, 'UJ-563-TG', 'HVNTOMCYLARIFCWKY', 'Audi', 'inventore', '2024', 'Hybrid', 102817, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(45, 9, 'CP-141-BJ', 'DROTFAGFZJJOLTXFX', 'Toyota', 'nemo', '2008', 'Diesel', 203979, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(46, 20, 'VT-409-SV', 'PCGBSLGIQBAGUNEGD', 'Ford', 'architecto', '2014', 'Electric', 226389, '2026-06-23 14:22:35', '2026-06-23 14:22:35'),
(47, 16, 'KN-125-SK', 'KXVNEGVYAXUEGVOND', 'BMW', 'nostrum', '2008', 'Electric', 10345, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(48, 2, 'CI-939-PO', 'UWINSRBQPBHJDVXIM', 'Ford', 'assumenda', '2023', 'Petrol', 241531, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(49, 3, 'NI-005-XE', 'TXMVRRUQYPDCGMMSR', 'Ford', 'minus', '2018', 'Petrol', 75892, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(50, 4, 'GZ-262-NR', 'HMFOZORMPUJICLPYG', 'Audi', 'voluptas', '2019', 'Diesel', 133353, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(51, 5, 'TP-381-RP', 'DYMNMLHDYLMZIKIWD', 'BMW', 'et', '2022', 'Electric', 222955, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(52, 17, 'ZX-343-LX', 'GCXLWBVWYMVOLDYXM', 'Ford', 'quasi', '2019', 'Electric', 116250, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(53, 10, 'XG-047-GF', 'RGXCQPFOVSBXELAHP', 'Ford', 'neque', '2019', 'Hybrid', 175236, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(54, 13, 'JM-660-IS', 'OEISJJEPFIAFLMBEH', 'Ford', 'quia', '2011', 'Electric', 146361, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(55, 15, 'YR-679-SF', 'JFNCRUKTNPAXZRNXK', 'BMW', 'vel', '2021', 'Petrol', 59315, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(56, 18, 'CV-608-FM', 'HUKSWVBSFNPWCXMCT', 'BMW', 'deleniti', '2013', 'Petrol', 171884, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(57, 6, 'MV-164-JA', 'ZFMEGXYMAMZMNQPCJ', 'Volkswagen', 'eveniet', '2024', 'Petrol', 184559, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(58, 7, 'MD-723-OR', 'DGGGKDFUNQHIAJLLG', 'Volkswagen', 'eligendi', '2015', 'Electric', 17298, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(59, 8, 'IB-397-RD', 'RARXJFHLKNJLLRXVE', 'Toyota', 'omnis', '2016', 'Diesel', 87854, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(60, 19, 'PH-724-AE', 'EFFFITQPXGKLIDASA', 'Volkswagen', 'itaque', '2009', 'Hybrid', 68455, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(61, 9, 'XT-237-FL', 'TBZGEKVQOPBBRCRTM', 'Audi', 'sit', '2006', 'Hybrid', 26876, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(62, 20, 'OJ-181-MZ', 'UONNAHMVEDDGAJLET', 'BMW', 'enim', '2022', 'Electric', 248158, '2026-06-23 14:23:10', '2026-06-23 14:23:10'),
(63, 16, 'WC-468-OG', 'EUDOBCITFCTIRYVXC', 'Ford', 'aut', '2016', 'Electric', 265894, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(64, 2, 'BQ-251-KW', 'BMZHPVMXHNJZEUFWZ', 'BMW', 'eligendi', '2007', 'Diesel', 99809, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(65, 3, 'SQ-718-ZE', 'LTVVTBDXUGONDOMLV', 'Toyota', 'rerum', '2009', 'Diesel', 84612, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(66, 4, 'BJ-664-LK', 'FEKEWELLVWDOHLOCH', 'BMW', 'et', '2018', 'Petrol', 285599, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(67, 5, 'YZ-795-HC', 'QSXPMLMICZNDOSLNB', 'Audi', 'sit', '2023', 'Diesel', 223892, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(68, 17, 'OU-572-UD', 'LLBNMAGQNPCGDLLYI', 'Toyota', 'officiis', '2022', 'Petrol', 281932, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(69, 10, 'MS-996-GV', 'KRJZBVHFKTBEKOBJQ', 'Audi', 'voluptatem', '2005', 'Diesel', 185641, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(70, 13, 'YG-599-HD', 'DOEITXQRCXPCKHNEM', 'Ford', 'voluptatum', '2016', 'Petrol', 120903, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(71, 15, 'PY-137-VM', 'MPOGFSRQKFQPWVQCU', 'Audi', 'recusandae', '2024', 'Petrol', 143384, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(72, 18, 'DS-904-TD', 'MQMNOTTQBDKBYXUEU', 'Ford', 'velit', '2005', 'Electric', 108003, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(73, 6, 'BE-079-ZC', 'BHJNADXCQRYRWQJZM', 'Toyota', 'sed', '2010', 'Petrol', 100267, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(74, 7, 'VK-846-AL', 'SFQTDHIFTARCXMLFJ', 'BMW', 'nihil', '2025', 'Electric', 140459, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(75, 8, 'HK-462-PW', 'SKGFLDVWAEWSMZVKZ', 'Volkswagen', 'occaecati', '2015', 'Hybrid', 199687, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(76, 19, 'YD-443-ZG', 'BLSLQBSZFVPXPHPLN', 'Toyota', 'delectus', '2011', 'Diesel', 40947, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(77, 9, 'PZ-493-ZG', 'KPDPTVIRTVNBBXDSG', 'Volkswagen', 'et', '2023', 'Diesel', 117164, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(78, 20, 'UE-304-FX', 'LIERCOTSAJZEYZVJQ', 'BMW', 'earum', '2007', 'Hybrid', 279078, '2026-06-23 14:24:27', '2026-06-23 14:24:27'),
(79, 16, 'AN-303-AE', 'PDKUGVJUMZZRDRLEL', 'Toyota', 'id', '2017', 'Electric', 68895, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(80, 2, 'TK-981-ZU', 'PMYUVIGBMAJLGMCCF', 'Audi', 'quasi', '2015', 'Hybrid', 182839, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(81, 3, 'GY-118-ZJ', 'ONRSFFXCZWKIGFIHT', 'Audi', 'delectus', '2015', 'Hybrid', 97785, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(82, 4, 'YH-883-PY', 'HYOERMASABVVUSPUJ', 'BMW', 'et', '2009', 'Electric', 223928, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(83, 5, 'FF-763-SX', 'XNQYOEGFERDIBFXSI', 'Toyota', 'voluptate', '2025', 'Petrol', 24704, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(84, 17, 'JM-769-UI', 'LBZPHICGBZFEVJYOG', 'Toyota', 'vitae', '2014', 'Diesel', 166843, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(85, 10, 'KR-759-LV', 'FYJPDPWHIPVNYPRHQ', 'BMW', 'adipisci', '2010', 'Electric', 296334, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(86, 13, 'BV-537-XD', 'UKHFVLWBUSCUYLNCG', 'Volkswagen', 'aut', '2010', 'Electric', 57038, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(87, 15, 'ML-715-TR', 'AATYQNQWOOTJCBWMC', 'Audi', 'iusto', '2005', 'Petrol', 238977, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(88, 18, 'VV-384-GV', 'VMLLHGFWOXMUTMIIO', 'Audi', 'debitis', '2021', 'Electric', 146100, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(89, 6, 'EX-596-KX', 'KGANNQHRYQYSOXGEJ', 'Volkswagen', 'dolorem', '2017', 'Petrol', 266205, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(90, 7, 'WX-489-FF', 'WDUFZEWMJUHKRNFKZ', 'Volkswagen', 'pariatur', '2011', 'Electric', 228910, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(91, 8, 'ZZ-594-WB', 'KPDJEUBYXIVQFXTAI', 'Audi', 'vel', '2010', 'Hybrid', 246951, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(92, 19, 'VN-011-SS', 'BZSEMDHFFHPZEDBHD', 'Toyota', 'illum', '2010', 'Petrol', 65331, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(93, 9, 'QX-661-ZW', 'JCHVSQLVIBZETBJAV', 'Volkswagen', 'maxime', '2015', 'Petrol', 112680, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(94, 20, 'HK-875-DW', 'QXIRKDPZDLASHBOVX', 'BMW', 'accusantium', '2021', 'Diesel', 179694, '2026-06-23 14:39:52', '2026-06-23 14:39:52'),
(95, 16, 'FV-616-AS', 'ISWRRDKDJVGIRFORR', 'BMW', 'assumenda', '2008', 'Hybrid', 197612, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(96, 2, 'DA-131-SX', 'PWVTTCCTKFUMOIVLG', 'Ford', 'aperiam', '2008', 'Electric', 43369, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(97, 3, 'QD-596-ZE', 'LGQZJZUTTXGFAYOAG', 'Volkswagen', 'dolorem', '2016', 'Hybrid', 178721, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(98, 4, 'SN-616-VE', 'CFSTIFDPVSKBEKAAH', 'BMW', 'quo', '2017', 'Hybrid', 140643, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(99, 5, 'SN-966-RQ', 'JHIQWLJGZMIYMNRPY', 'BMW', 'atque', '2024', 'Hybrid', 89871, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(100, 17, 'WJ-901-CX', 'XCPZFNLWLWQPHXOOA', 'BMW', 'omnis', '2018', 'Diesel', 118126, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(101, 10, 'SQ-566-JP', 'RUIPMAPJHOAIRNOOQ', 'Audi', 'iusto', '2015', 'Diesel', 231695, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(102, 13, 'TL-576-DZ', 'HCPGUJIXURCOUIXNC', 'Audi', 'optio', '2008', 'Hybrid', 289539, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(103, 15, 'YV-627-YW', 'TGLJLXCWJZNPYNSAJ', 'Toyota', 'nihil', '2022', 'Electric', 15218, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(104, 18, 'SX-091-MV', 'NVQSOCCPGFLONMSIJ', 'Volkswagen', 'aliquid', '2012', 'Petrol', 79122, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(105, 6, 'HH-306-KW', 'KJDRQXZTZTHURYNIS', 'Ford', 'magni', '2012', 'Diesel', 40965, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(106, 7, 'WN-044-CL', 'AVPWZSGGHFWMQCFDR', 'Audi', 'corrupti', '2010', 'Hybrid', 222288, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(107, 8, 'MF-511-SV', 'QSXQKFHECJFEESYPQ', 'Ford', 'distinctio', '2021', 'Hybrid', 196544, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(108, 19, 'FK-877-XB', 'DMFQNQTYULPKCNFXG', 'Volkswagen', 'quia', '2005', 'Electric', 46008, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(109, 9, 'KI-823-SV', 'EGRUHXUFXTMTPDGWV', 'BMW', 'illo', '2018', 'Petrol', 131915, '2026-06-26 12:50:25', '2026-06-26 12:50:25'),
(110, 20, 'SA-753-QB', 'YBFNNIFFBMZZEQAGW', 'Audi', 'architecto', '2017', 'Electric', 80088, '2026-06-26 12:50:25', '2026-06-26 12:50:25');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- A tábla indexei `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- A tábla indexei `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `failed_logins`
--
ALTER TABLE `failed_logins`
  ADD PRIMARY KEY (`failed_login_id`);

--
-- A tábla indexei `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD UNIQUE KEY `repair_order_id_2` (`repair_order_id`),
  ADD KEY `repair_order_id` (`repair_order_id`);

--
-- A tábla indexei `ip_locations`
--
ALTER TABLE `ip_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `session_id` (`session_id`);

--
-- A tábla indexei `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`part_id`),
  ADD UNIQUE KEY `part_number` (`part_number`);

--
-- A tábla indexei `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`reset_id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `repair_orders`
--
ALTER TABLE `repair_orders`
  ADD PRIMARY KEY (`repair_order_id`),
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- A tábla indexei `repair_order_parts`
--
ALTER TABLE `repair_order_parts`
  ADD PRIMARY KEY (`repair_order_id`,`part_id`),
  ADD KEY `repair_order_id` (`repair_order_id`),
  ADD KEY `part_id` (`part_id`);

--
-- A tábla indexei `repair_order_services`
--
ALTER TABLE `repair_order_services`
  ADD PRIMARY KEY (`repair_order_id`,`service_id`),
  ADD KEY `repair_order_id` (`repair_order_id`),
  ADD KEY `service_id` (`service_id`);

--
-- A tábla indexei `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- A tábla indexei `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`),
  ADD UNIQUE KEY `service_name` (`service_name`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- A tábla indexei `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD UNIQUE KEY `license_plate` (`license_plate`),
  ADD UNIQUE KEY `vin` (`vin`),
  ADD KEY `customer_id` (`customer_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT a táblához `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT a táblához `failed_logins`
--
ALTER TABLE `failed_logins`
  MODIFY `failed_login_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `ip_locations`
--
ALTER TABLE `ip_locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT a táblához `parts`
--
ALTER TABLE `parts`
  MODIFY `part_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `reset_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `repair_orders`
--
ALTER TABLE `repair_orders`
  MODIFY `repair_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT a táblához `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT a táblához `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT a táblához `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`repair_order_id`) REFERENCES `repair_orders` (`repair_order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `ip_locations`
--
ALTER TABLE `ip_locations`
  ADD CONSTRAINT `ip_locations_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `user_sessions` (`session_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `repair_orders`
--
ALTER TABLE `repair_orders`
  ADD CONSTRAINT `repair_orders_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `repair_orders_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `repair_order_parts`
--
ALTER TABLE `repair_order_parts`
  ADD CONSTRAINT `repair_order_parts_ibfk_1` FOREIGN KEY (`repair_order_id`) REFERENCES `repair_orders` (`repair_order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `repair_order_parts_ibfk_2` FOREIGN KEY (`part_id`) REFERENCES `parts` (`part_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `repair_order_services`
--
ALTER TABLE `repair_order_services`
  ADD CONSTRAINT `repair_order_services_ibfk_1` FOREIGN KEY (`repair_order_id`) REFERENCES `repair_orders` (`repair_order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `repair_order_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
