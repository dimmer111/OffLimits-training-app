-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 11, 2026 at 10:26 AM
-- Server version: 5.7.24
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fitness`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `muscle_group` varchar(50) NOT NULL,
  `description` text,
  `difficulty` enum('beginner','intermediate','advanced') NOT NULL DEFAULT 'beginner'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`id`, `name`, `muscle_group`, `description`, `difficulty`) VALUES
(1, 'Fekvotámasz', 'chest', 'Testsúlyos alapgyakorlat: kezek vállszélesen, test egyenes, mellkas a földig süllyed.', 'beginner'),
(2, 'Térdelő fekvőtámasz', 'chest', 'Fekvőtámasz könnyített változata térden támaszkodva.', 'beginner'),
(3, 'Szűk fekvőtámasz', 'chest', 'Kezek közel egymáshoz, a tricepsz és a mellkas belső része dolgozik.', 'intermediate'),
(4, 'Emelt lábú fekvőtámasz', 'chest', 'Lábak padon, a felső mellkas fokozottabb terhelése.', 'intermediate'),
(5, 'Egykezes fekvőtámasz', 'chest', 'Rendkívül nehéz testsúlyos mellgyakorlat egy kézen.', 'advanced'),
(6, 'Fekve nyomás rúddal', 'chest', 'Fekvő padon a rudat mellkasig engedjük, majd felnyomjuk.', 'intermediate'),
(7, 'Fekve nyomás kézisúlyzóval', 'chest', 'Nagyobb mozgástartomány, külön dolgozik mindkét oldal.', 'beginner'),
(8, 'Ferde pados nyomás rúddal', 'chest', 'Emelt háttámlás pad, a felső mellizom hangsúlyos.', 'intermediate'),
(9, 'Ferde pados nyomás kézisúlyzóval', 'chest', 'Felső mellizom edzése kézisúlyzókkal.', 'intermediate'),
(10, 'Fejjel lefelé pados nyomás', 'chest', 'Lejtő padon végzett nyomás az alsó mellizomra.', 'intermediate'),
(11, 'Kézisúlyzós keresztemelés', 'chest', 'Izolációs gyakorlat, könyök enyhén hajlított, a súlyzók ívben nyílnak.', 'intermediate'),
(12, 'Kábeles keresztezés', 'chest', 'Csigás gép két oldalról, a mellizom összehúzására.', 'intermediate'),
(13, 'Pec deck (mellgép)', 'chest', 'Gépes mellizom-izoláció vezetett mozgással.', 'beginner'),
(14, 'Mellnyomó gép', 'chest', 'Ülő, vezetett mellnyomás, kezdőknek biztonságos.', 'beginner'),
(15, 'Tolódzkodás mellre', 'chest', 'Előredőlve végzett tolódzkodás párhuzamos korláton.', 'advanced'),
(16, 'Pullover kézisúlyzóval', 'chest', 'Fekve a súlyzót a fej mögé engedjük, mellkas és hát is dolgozik.', 'intermediate'),
(17, 'Húzódzkodás nyújtott fogással', 'back', 'Rúdon függve a test felhúzása, a széles hátizom dolgozik.', 'advanced'),
(18, 'Húzódzkodás fordított fogással', 'back', 'Chin-up: a bicepsz is nagyobb szerepet kap.', 'intermediate'),
(19, 'Negatív húzódzkodás', 'back', 'Csak a lassú leengedési fázis, húzódzkodás előkészítése.', 'beginner'),
(20, 'Lehúzás csigán', 'back', 'Lat pulldown: a rudat a mellkashoz húzzuk ülve.', 'beginner'),
(21, 'Lehúzás szűk fogással', 'back', 'Szűk markolattal a hát középső része és bicepsz dolgozik.', 'beginner'),
(22, 'Evezés ülve csigán', 'back', 'Seated row: a lapockák összehúzása, hátizom-vastagítás.', 'beginner'),
(23, 'Rúdevezés előrehajolva', 'back', 'Barbell row: törzs vízszintes közelében, a rúd a hasig érkezik.', 'intermediate'),
(24, 'Egykezes súlyzós evezés', 'back', 'Pad mellett támaszkodva egy kézisúlyzó húzása a csípőig.', 'beginner'),
(25, 'T-rudas evezés', 'back', 'T-bar row: erőteljes hátközép-gyakorlat.', 'intermediate'),
(26, 'Gépes evezés', 'back', 'Vezetett evezőgép mellkastámasszal.', 'beginner'),
(27, 'Felhúzás', 'back', 'Deadlift: a padlóról emelt rúd, hát, farizom és combhajlító.', 'advanced'),
(28, 'Román felhúzás', 'back', 'Merev lábas, csípőből indított változat a combhajlítóra és hátra.', 'intermediate'),
(29, 'Hiperextenzió', 'back', 'Gerincfeszítők és farizom erősítése hiperextenzió padon.', 'beginner'),
(30, 'Szuperman', 'back', 'Hasonfekve kar és láb egyszerre emelése, testsúlyos hátgyakorlat.', 'beginner'),
(31, 'Face pull', 'back', 'Kötéllel az arc felé húzás: hátsó váll és felső hát.', 'beginner'),
(32, 'Vállvonás (shrug)', 'back', 'Súlyzóval a vállak felhúzása a csuklyásizomra.', 'beginner'),
(33, 'Inverted row', 'back', 'Fordított evezés rúd alatt fekve, testsúllyal.', 'beginner'),
(34, 'Vállnyomás rúddal', 'shoulders', 'Álló vagy ülő nyomás a fej fölé rúddal.', 'intermediate'),
(35, 'Vállnyomás kézisúlyzóval', 'shoulders', 'Ülve a súlyzók fej fölé nyomása.', 'beginner'),
(36, 'Arnold nyomás', 'shoulders', 'Forgatással kombinált vállnyomás, mindhárom fej dolgozik.', 'intermediate'),
(37, 'Oldalemelés', 'shoulders', 'Kézisúlyzók oldalra emelése a középső deltára.', 'beginner'),
(38, 'Előreemelés', 'shoulders', 'Súlyzó előre emelése vállmagasságig, elülső deltoid.', 'beginner'),
(39, 'Hátsó deltoid emelés', 'shoulders', 'Előrehajolva oldalra emelés a hátsó vállra.', 'beginner'),
(40, 'Reverse pec deck', 'shoulders', 'Gépen a hátsó váll izolációja.', 'beginner'),
(41, 'Felhúzás állig', 'shoulders', 'Upright row: rúd az álla felé húzása, váll és csuklyás.', 'intermediate'),
(42, 'Pike fekvőtámasz', 'shoulders', 'Csípő magasan, fej a föld felé, testsúlyos vállnyomás.', 'intermediate'),
(43, 'Kézen állás fekvőtámasz', 'shoulders', 'Falnak támasztott fejjel lefelé fekvőtámasz.', 'advanced'),
(44, 'Push press', 'shoulders', 'Lábmunkával segített vállnyomás, robbanékony erő.', 'advanced'),
(45, 'Bicepsz hajlítás rúddal', 'biceps', 'Álló bicepsz-karhajlítás egyenes vagy EZ rúddal.', 'beginner'),
(46, 'Bicepsz hajlítás kézisúlyzóval', 'biceps', 'Váltott vagy egyszerre végzett karhajlítás.', 'beginner'),
(47, 'Kalapács hajlítás', 'biceps', 'Semleges fogással, a brachialis és alkar is dolgozik.', 'beginner'),
(48, 'Koncentrált hajlítás', 'biceps', 'Ülve, könyök a combra támasztva, izolált bicepsz.', 'beginner'),
(49, 'Scott-pados hajlítás', 'biceps', 'Preacher curl: kar a támaszon, csalás nélkül.', 'intermediate'),
(50, 'Ferde pados hajlítás', 'biceps', 'Incline curl: a bicepsz hosszú feje nyúlik.', 'intermediate'),
(51, 'Kábeles bicepsz hajlítás', 'biceps', 'Állandó feszülés a csigával.', 'beginner'),
(52, 'Zottman hajlítás', 'biceps', 'Felfelé supinált, lefelé pronált fogás, bicepsz és alkar.', 'intermediate'),
(53, 'Tricepsz letolás csigán', 'triceps', 'Pushdown: könyök fix, a kar kinyújtása lefelé.', 'beginner'),
(54, 'Tricepsz letolás kötéllel', 'triceps', 'Kötéllel a végén kifelé fordítva a csuklót.', 'beginner'),
(55, 'Francia nyomás', 'triceps', 'Skull crusher: fekve a súly a homlok mögé engedése.', 'intermediate'),
(56, 'Fej mögötti tricepsz nyújtás', 'triceps', 'Kézisúlyzóval a fej mögött kinyújtás.', 'beginner'),
(57, 'Tolódzkodás padon', 'triceps', 'Bench dip: testsúlyos tricepsz-gyakorlat pad szélén.', 'beginner'),
(58, 'Tolódzkodás korláton', 'triceps', 'Egyenes törzzsel a tricepszre hangsúlyozva.', 'advanced'),
(59, 'Szűk fogású fekvenyomás', 'triceps', 'Close-grip bench press: tricepsz és mellkas.', 'intermediate'),
(60, 'Tricepsz kickback', 'triceps', 'Előrehajolva a kar hátra nyújtása.', 'beginner'),
(61, 'Gyémánt fekvőtámasz', 'triceps', 'Kezek gyémánt alakban, erős tricepsz-hangsúly.', 'intermediate'),
(62, 'Csuklóhajlítás', 'forearms', 'Wrist curl: alkar hajlítók erősítése.', 'beginner'),
(63, 'Fordított csuklóhajlítás', 'forearms', 'Alkar feszítők edzése.', 'beginner'),
(64, 'Farmer séta', 'forearms', 'Nehéz súlyzókkal séta, markolaterő.', 'beginner'),
(65, 'Fordított bicepsz hajlítás', 'forearms', 'Reverse curl: pronált fogás, alkar és brachioradialis.', 'intermediate'),
(66, 'Függés rúdon', 'forearms', 'Dead hang: markolat és alkar kitartás.', 'beginner'),
(67, 'Guggolás testsúllyal', 'quadriceps', 'Alapvető térdhajlítás, comb és far.', 'beginner'),
(68, 'Guggolás rúddal', 'quadriceps', 'Back squat: a rúd a hátsó vállon.', 'intermediate'),
(69, 'Elöl guggolás', 'quadriceps', 'Front squat: rúd elöl, hangsúly a combfeszítőn.', 'advanced'),
(70, 'Goblet guggolás', 'quadriceps', 'Súlyzó mellkas előtt, kezdőknek ideális.', 'beginner'),
(71, 'Bolgár split guggolás', 'quadriceps', 'Hátsó láb padon, egy lábas guggolás.', 'intermediate'),
(72, 'Kitörés', 'quadriceps', 'Lunge: előre lépés és térdhajlítás.', 'beginner'),
(73, 'Hátrafelé kitörés', 'quadriceps', 'Reverse lunge: kíméletesebb a térdnek.', 'beginner'),
(74, 'Sétáló kitörés', 'quadriceps', 'Walking lunge: haladás kitörésekben.', 'intermediate'),
(75, 'Lábtoló gép', 'quadriceps', 'Leg press: nagy terhelés kontrolláltan.', 'beginner'),
(76, 'Lábfeszítés gépen', 'quadriceps', 'Leg extension: combfeszítő izoláció.', 'beginner'),
(77, 'Hack guggolás', 'quadriceps', 'Hack squat gépen, combfeszítő-hangsúly.', 'intermediate'),
(78, 'Lépcsőzés padra', 'quadriceps', 'Step-up: egy lábas erősítés.', 'beginner'),
(79, 'Pisztoly guggolás', 'quadriceps', 'Egy lábas mély guggolás, erő és egyensúly.', 'advanced'),
(80, 'Ugrós guggolás', 'quadriceps', 'Robbanékony guggolás ugrással.', 'intermediate'),
(81, 'Fal melletti ülés', 'quadriceps', 'Wall sit: izometrikus combfeszítő-gyakorlat.', 'beginner'),
(82, 'Combhajlítás gépen fekve', 'hamstrings', 'Lying leg curl: combhajlító izoláció.', 'beginner'),
(83, 'Combhajlítás gépen ülve', 'hamstrings', 'Seated leg curl.', 'beginner'),
(84, 'Merevlábas felhúzás', 'hamstrings', 'Stiff-leg deadlift: hajlítók és far nyújtása terhelés alatt.', 'intermediate'),
(85, 'Good morning', 'hamstrings', 'Rúddal a vállon csípőből előrehajlás.', 'intermediate'),
(86, 'Nordic hamstring curl', 'hamstrings', 'Térdelve lassú előrezuhanás, nagyon erős combhajlító-gyakorlat.', 'advanced'),
(87, 'Stability ball combhajlítás', 'hamstrings', 'Hátfekvésben a labdát a fenékhez húzzuk.', 'intermediate'),
(88, 'Csípőemelés (glute bridge)', 'glutes', 'Hátfekvésben a csípő felemelése.', 'beginner'),
(89, 'Hip thrust', 'glutes', 'Háttal pad előtt, súllyal a csípőn, farizom-gyakorlat.', 'intermediate'),
(90, 'Egy lábas csípőemelés', 'glutes', 'Glute bridge egy lábbal.', 'intermediate'),
(91, 'Kábeles hátralendítés', 'glutes', 'Cable kickback: csigával a láb hátra nyújtása.', 'beginner'),
(92, 'Donkey kick', 'glutes', 'Négykézláb a láb felfelé rúgása.', 'beginner'),
(93, 'Fire hydrant', 'glutes', 'Négykézláb a térd oldalra emelése.', 'beginner'),
(94, 'Oldalirányú lépés gumiszalaggal', 'glutes', 'Lateral band walk: kisfarizom aktiválás.', 'beginner'),
(95, 'Sumo felhúzás', 'glutes', 'Széles terpesszel felhúzás, comb belső és far.', 'intermediate'),
(96, 'Combtávolító gép', 'glutes', 'Abductor gép, külső comb és far.', 'beginner'),
(97, 'Combközelítő gép', 'adductors', 'Adductor gép, belső comb.', 'beginner'),
(98, 'Vádliemelés állva', 'calves', 'Standing calf raise: lábujjhegyre emelkedés.', 'beginner'),
(99, 'Vádliemelés ülve', 'calves', 'Seated calf raise: a lúdtalp izom hangsúlyos.', 'beginner'),
(100, 'Egy lábas vádliemelés', 'calves', 'Lépcsőfokon egy lábon végzett vádliemelés.', 'intermediate'),
(101, 'Vádliemelés lábtolón', 'calves', 'Leg press gépen a talp nyomása.', 'beginner'),
(102, 'Szökdelés kötéllel', 'calves', 'Ugrókötelezés vádli és kardió.', 'beginner'),
(103, 'Plank', 'core', 'Alkartámasz, test egyenes, törzs stabilizálása.', 'beginner'),
(104, 'Oldalsó plank', 'core', 'Side plank: ferde hasizmok.', 'beginner'),
(105, 'Felüléses hasprés (crunch)', 'core', 'Rövid mozgású hasizom-gyakorlat.', 'beginner'),
(106, 'Sit-up', 'core', 'Teljes felülés a hasizomra és csípőhajlítóra.', 'beginner'),
(107, 'Fordított crunch', 'core', 'Térdek behúzása a mellkashoz, alsó has.', 'beginner'),
(108, 'Lábemelés fekve', 'core', 'Egyenes lábak felemelése hasonfekve vagy háton.', 'intermediate'),
(109, 'Lábemelés függve', 'core', 'Hanging leg raise: erős alsó hasi gyakorlat.', 'advanced'),
(110, 'Biciklis crunch', 'core', 'Váltott térd-könyök érintés, ferde has.', 'beginner'),
(111, 'Orosz csavarás', 'core', 'Russian twist: törzsforgatás ülve.', 'intermediate'),
(112, 'Hegymászó', 'core', 'Mountain climber: plank pozícióból váltott térdhúzás.', 'beginner'),
(113, 'Dead bug', 'core', 'Hátfekvésben ellentétes kar-láb nyújtása, törzsstabilitás.', 'beginner'),
(114, 'Bird dog', 'core', 'Négykézláb ellentétes kar-láb kinyújtása.', 'beginner'),
(115, 'Ab wheel (kerekes hasgyakorlat)', 'core', 'Térden gurulás előre-hátra a kerékkel.', 'advanced'),
(116, 'Kábeles favágás', 'core', 'Woodchopper: átlós törzsmozgás csigával.', 'intermediate'),
(117, 'Pallof press', 'core', 'Rotáció elleni core-gyakorlat csigával vagy gumival.', 'intermediate'),
(118, 'V-up', 'core', 'Egyszerre emelt kar és láb, V alakban.', 'advanced'),
(119, 'Dragon flag', 'core', 'Haladó törzsgyakorlat, test hosszú egyenesen a padon.', 'advanced'),
(120, 'Hollow body tartás', 'core', 'Hátfekvésben tartott \"banán\" pozíció.', 'intermediate'),
(121, 'Burpee', 'full_body', 'Guggolás, fekvőtámasz, felugrás egy mozdulatsorban.', 'intermediate'),
(122, 'Kettlebell swing', 'full_body', 'Csípőindítású lendítés, far, hát, kardió.', 'intermediate'),
(123, 'Thruster', 'full_body', 'Elöl guggolás és vállnyomás egyben.', 'advanced'),
(124, 'Clean and press', 'full_body', 'Rúd mellkasra emelése, majd fej fölé nyomása.', 'advanced'),
(125, 'Snatch', 'full_body', 'Súlyemelő gyakorlat: rúd a padlóról egy mozdulattal fej fölé.', 'advanced'),
(126, 'Medicinlabda dobás', 'full_body', 'Robbanékony dobás földhöz vagy falhoz.', 'intermediate'),
(127, 'Turkish get-up', 'full_body', 'Fekvésből állásba kézzel tartott súllyal.', 'advanced'),
(128, 'Kötélmászás', 'full_body', 'Teljes test, különösen hát, kar és markolat.', 'advanced'),
(129, 'Ugrálós terpesz (jumping jack)', 'full_body', 'Alap kardió-bemelegítő gyakorlat.', 'beginner'),
(130, 'Medve mászás', 'full_body', 'Négykézláb, térd a föld felett haladás.', 'intermediate'),
(131, 'Futás', 'cardio', 'Szabadtéri vagy futópadon végzett állóképesség-fejlesztés.', 'beginner'),
(132, 'Intervallumfutás (sprint)', 'cardio', 'Váltakozó nagy és alacsony intenzitású szakaszok.', 'advanced'),
(133, 'Gyaloglás', 'cardio', 'Alacsony terhelésű kardió, kezdőknek ajánlott.', 'beginner'),
(134, 'Kerékpározás', 'cardio', 'Szobabicikli vagy országúti, kíméletes az ízületeknek.', 'beginner'),
(135, 'Evezőgép', 'cardio', 'Teljes testes kardió, láb, hát és kar.', 'intermediate'),
(136, 'Elliptikus tréner', 'cardio', 'Ízületbarát kardió gép.', 'beginner'),
(137, 'Lépcsőzőgép', 'cardio', 'Stair climber: kardió és combfeszítő-terhelés.', 'intermediate'),
(138, 'Úszás', 'cardio', 'Teljes testes, ízületkímélő állóképesség-edzés.', 'intermediate'),
(139, 'Ugrókötél', 'cardio', 'Koordináció és kardió egyben.', 'beginner'),
(140, 'Boxzsákozás', 'cardio', 'Ütéskombinációk zsákon, kardió és vállerő.', 'intermediate'),
(141, 'Battle rope', 'cardio', 'Nehéz kötelek hullámoztatása, váll és kardió.', 'intermediate'),
(142, 'Box jump', 'cardio', 'Felugrás magas dobozra, robbanékonyság.', 'intermediate'),
(143, 'Macska-tehén nyújtás', 'mobility', 'Gerincmobilizálás négykézláb.', 'beginner'),
(144, 'Gyermekpóz', 'mobility', 'Pihentető nyújtás hát és csípő számára.', 'beginner'),
(145, 'Csípőhajlító nyújtás', 'mobility', 'Kitörés pozícióban csípő előre tolása.', 'beginner'),
(146, 'Combhajlító nyújtás', 'mobility', 'Ülve vagy állva előrehajlás nyújtott lábbal.', 'beginner'),
(147, 'Tekintet lefelé néző kutya', 'mobility', 'Jóga póz: hát, hamstring és váll nyújtása.', 'beginner'),
(148, 'Vállkör (shoulder dislocate)', 'mobility', 'Rúddal vagy gumival váll mobilizálás.', 'beginner'),
(149, 'Mély guggolás tartás', 'mobility', 'Csípő és boka mobilitás fejlesztése.', 'beginner'),
(150, 'Hídállás', 'mobility', 'Haladó gerinc- és vállmobilitás.', 'advanced');

-- --------------------------------------------------------

--
-- Table structure for table `exercise_logs`
--

CREATE TABLE `exercise_logs` (
  `id` bigint(20) NOT NULL,
  `workout_log_id` bigint(20) UNSIGNED NOT NULL,
  `exercise_id` bigint(20) UNSIGNED NOT NULL,
  `sets` smallint(5) UNSIGNED NOT NULL,
  `reps` smallint(5) UNSIGNED NOT NULL,
  `weight` decimal(6,2) DEFAULT NULL COMMENT 'kg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `weight` decimal(5,2) DEFAULT NULL COMMENT 'kg',
  `body_fat` decimal(4,2) DEFAULT NULL COMMENT '%',
  `recorded_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_fitness`
--

CREATE TABLE `user_fitness` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `height` decimal(5,2) DEFAULT NULL COMMENT 'cm',
  `weight` decimal(5,2) DEFAULT NULL COMMENT 'kg',
  `goal` varchar(50) DEFAULT NULL COMMENT 'pl. weight_loss, muscle_gain, endurance',
  `fitness_level` enum('beginner','intermediate','advanced') NOT NULL DEFAULT 'beginner',
  `workouts_per_week` tinyint(3) UNSIGNED DEFAULT NULL,
  `workout_duration` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'perc',
  `workout_location` enum('home','gym','outdoor') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `workout_logs`
--

CREATE TABLE `workout_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `workout_plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `started_at` datetime NOT NULL,
  `finished_at` datetime DEFAULT NULL,
  `duration` int(10) UNSIGNED DEFAULT NULL COMMENT 'másodperc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `workout_plans`
--

CREATE TABLE `workout_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `goal` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `workout_plan_exercises`
--

CREATE TABLE `workout_plan_exercises` (
  `id` bigint(20) NOT NULL,
  `workout_plan_id` bigint(20) UNSIGNED NOT NULL,
  `exercise_id` bigint(20) UNSIGNED NOT NULL,
  `sets` smallint(5) UNSIGNED NOT NULL,
  `reps` smallint(5) UNSIGNED NOT NULL,
  `rest_seconds` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_admins_username` (`username`),
  ADD UNIQUE KEY `uq_admins_email` (`email`);

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_exercises_name` (`name`),
  ADD KEY `idx_exercises_muscle_group` (`muscle_group`);

--
-- Indexes for table `exercise_logs`
--
ALTER TABLE `exercise_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_exercise_logs_workout` (`workout_log_id`),
  ADD KEY `idx_exercise_logs_exercise` (`exercise_id`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_progress_user_date` (`user_id`,`recorded_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_users_username` (`username`),
  ADD UNIQUE KEY `uq_users_email` (`email`);

--
-- Indexes for table `user_fitness`
--
ALTER TABLE `user_fitness`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_user_fitness_user` (`user_id`);

--
-- Indexes for table `workout_logs`
--
ALTER TABLE `workout_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_workout_logs_user` (`user_id`),
  ADD KEY `idx_workout_logs_plan` (`workout_plan_id`);

--
-- Indexes for table `workout_plans`
--
ALTER TABLE `workout_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_workout_plans_user` (`user_id`);

--
-- Indexes for table `workout_plan_exercises`
--
ALTER TABLE `workout_plan_exercises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wpe_plan` (`workout_plan_id`),
  ADD KEY `idx_wpe_exercise` (`exercise_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `exercise_logs`
--
ALTER TABLE `exercise_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_fitness`
--
ALTER TABLE `user_fitness`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workout_logs`
--
ALTER TABLE `workout_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workout_plans`
--
ALTER TABLE `workout_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workout_plan_exercises`
--
ALTER TABLE `workout_plan_exercises`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exercise_logs`
--
ALTER TABLE `exercise_logs`
  ADD CONSTRAINT `fk_exercise_logs_exercise` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`),
  ADD CONSTRAINT `fk_exercise_logs_workout` FOREIGN KEY (`workout_log_id`) REFERENCES `workout_logs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `fk_progress_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_fitness`
--
ALTER TABLE `user_fitness`
  ADD CONSTRAINT `fk_user_fitness_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workout_logs`
--
ALTER TABLE `workout_logs`
  ADD CONSTRAINT `fk_workout_logs_plan` FOREIGN KEY (`workout_plan_id`) REFERENCES `workout_plans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_workout_logs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workout_plans`
--
ALTER TABLE `workout_plans`
  ADD CONSTRAINT `fk_workout_plans_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workout_plan_exercises`
--
ALTER TABLE `workout_plan_exercises`
  ADD CONSTRAINT `fk_wpe_exercise` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`),
  ADD CONSTRAINT `fk_wpe_plan` FOREIGN KEY (`workout_plan_id`) REFERENCES `workout_plans` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
