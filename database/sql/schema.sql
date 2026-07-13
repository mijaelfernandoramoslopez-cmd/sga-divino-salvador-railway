-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-07-2026 a las 01:19:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jhelen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academic_documents`
--

CREATE TABLE `academic_documents` (
  `idacademic_document` int(10) UNSIGNED NOT NULL,
  `document_code` varchar(50) NOT NULL,
  `document_type` varchar(50) NOT NULL,
  `source_table` varchar(80) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `idstudent` int(11) DEFAULT NULL,
  `issued_by` int(11) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `validation_count` int(11) NOT NULL DEFAULT 0,
  `last_validated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `academic_documents`
--

INSERT INTO `academic_documents` (`idacademic_document`, `document_code`, `document_type`, `source_table`, `source_id`, `idstudent`, `issued_by`, `issue_date`, `status`, `validation_count`, `last_validated_at`, `created_at`, `updated_at`) VALUES
(1, 'CE-2026-0001', 'CONSTANCIA_ESTUDIOS', 'certificates', 1, 1, 15, '2026-07-04', 1, 1, '2026-07-07 07:25:24', '2026-07-07 07:25:24', '2026-07-07 07:25:24'),
(2, 'CN-2026-0001', 'CONSTANCIA_NOTAS', 'grade_certificates', 1, 1, 15, '2026-07-04', 1, 1, '2026-07-07 07:40:12', '2026-07-07 07:40:12', '2026-07-07 07:40:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attendance`
--

CREATE TABLE `attendance` (
  `idattendance` int(11) NOT NULL,
  `idstudent` int(11) NOT NULL,
  `idsection` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('PRESENTE','AUSENTE','TARDANZA') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `attendance`
--

INSERT INTO `attendance` (`idattendance`, `idstudent`, `idsection`, `attendance_date`, `status`, `created_at`) VALUES
(1, 2, 2, '2026-05-25', 'TARDANZA', '2026-05-27 07:40:08'),
(2, 1, 2, '2026-05-25', 'AUSENTE', '2026-05-27 07:40:08'),
(3, 4, 2, '2026-05-25', 'AUSENTE', '2026-05-27 07:40:08'),
(4, 3, 2, '2026-05-25', 'PRESENTE', '2026-05-27 07:40:08'),
(5, 2, 2, '2026-05-26', 'PRESENTE', '2026-05-27 07:40:21'),
(6, 1, 2, '2026-05-26', 'AUSENTE', '2026-05-27 07:40:21'),
(7, 4, 2, '2026-05-26', 'TARDANZA', '2026-05-27 07:40:21'),
(8, 3, 2, '2026-05-26', 'PRESENTE', '2026-05-27 07:40:21'),
(9, 3, 1, '2026-05-25', 'PRESENTE', '2026-05-25 23:03:14'),
(10, 4, 1, '2026-05-25', 'PRESENTE', '2026-05-25 23:03:14'),
(11, 3, 1, '2026-05-27', 'AUSENTE', '2026-05-27 21:35:21'),
(12, 4, 1, '2026-05-27', 'PRESENTE', '2026-05-27 21:35:21'),
(13, 2, 2, '2026-06-11', 'AUSENTE', '2026-06-12 03:28:17'),
(14, 1, 2, '2026-06-11', 'PRESENTE', '2026-06-12 03:28:17'),
(15, 4, 2, '2026-06-11', 'PRESENTE', '2026-06-12 03:28:17'),
(16, 3, 2, '2026-06-11', 'PRESENTE', '2026-06-12 03:28:17'),
(17, 2, 2, '2026-06-12', 'PRESENTE', '2026-06-12 03:29:36'),
(18, 1, 2, '2026-06-12', 'PRESENTE', '2026-06-12 03:29:36'),
(19, 4, 2, '2026-06-12', 'PRESENTE', '2026-06-12 03:29:36'),
(20, 3, 2, '2026-06-12', 'PRESENTE', '2026-06-12 03:29:36'),
(21, 1, 2, '2026-06-14', 'PRESENTE', '2026-06-14 08:54:01'),
(22, 2, 2, '2026-06-14', 'PRESENTE', '2026-06-14 08:54:01'),
(23, 3, 2, '2026-06-14', 'PRESENTE', '2026-06-14 08:54:01'),
(24, 4, 2, '2026-06-14', 'PRESENTE', '2026-06-14 08:54:01'),
(25, 5, 2, '2026-06-14', 'AUSENTE', '2026-06-14 08:54:01'),
(26, 1, 2, '2026-06-15', 'PRESENTE', '2026-06-14 09:03:32'),
(27, 2, 2, '2026-06-15', 'PRESENTE', '2026-06-14 09:03:32'),
(28, 3, 2, '2026-06-15', 'PRESENTE', '2026-06-14 09:03:32'),
(29, 4, 2, '2026-06-15', 'PRESENTE', '2026-06-14 09:03:32'),
(30, 5, 2, '2026-06-15', 'TARDANZA', '2026-06-14 09:03:32'),
(31, 3, 1, '2026-06-16', 'PRESENTE', '2026-06-15 20:27:58'),
(32, 4, 1, '2026-06-16', 'PRESENTE', '2026-06-15 20:27:58'),
(33, 2, 2, '2026-06-16', 'PRESENTE', '2026-06-15 20:26:03'),
(34, 5, 2, '2026-06-16', 'PRESENTE', '2026-06-15 20:26:03'),
(35, 3, 2, '2026-06-16', 'PRESENTE', '2026-06-15 20:26:03'),
(36, 1, 2, '2026-06-16', 'PRESENTE', '2026-06-15 20:26:03'),
(37, 4, 2, '2026-06-16', 'PRESENTE', '2026-06-15 20:26:03'),
(38, 3, 1, '2026-06-17', 'AUSENTE', '2026-06-15 20:29:54'),
(39, 4, 1, '2026-06-17', 'PRESENTE', '2026-06-15 20:29:54'),
(40, 3, 1, '2026-06-18', 'PRESENTE', '2026-06-15 20:30:46'),
(41, 4, 1, '2026-06-18', 'PRESENTE', '2026-06-15 20:30:46'),
(42, 3, 1, '2026-06-15', 'PRESENTE', '2026-06-15 20:59:53'),
(43, 4, 1, '2026-06-15', 'PRESENTE', '2026-06-15 20:59:53'),
(44, 3, 1, '2026-06-24', 'PRESENTE', '2026-06-15 20:43:55'),
(45, 4, 1, '2026-06-24', 'PRESENTE', '2026-06-15 20:43:55'),
(46, 3, 1, '2026-06-25', 'PRESENTE', '2026-06-15 20:44:47'),
(47, 4, 1, '2026-06-25', 'PRESENTE', '2026-06-15 20:44:47'),
(48, 3, 1, '2026-06-30', 'PRESENTE', '2026-07-03 09:07:33'),
(49, 4, 1, '2026-06-30', 'PRESENTE', '2026-07-03 09:07:33'),
(50, 3, 1, '2026-07-08', 'TARDANZA', '2026-07-03 09:08:03'),
(51, 4, 1, '2026-07-08', 'TARDANZA', '2026-07-03 09:08:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificates`
--

CREATE TABLE `certificates` (
  `idcertificate` int(11) NOT NULL,
  `certificate_code` varchar(30) NOT NULL,
  `idstudent` int(11) NOT NULL,
  `idenrollment` int(11) DEFAULT NULL,
  `purpose` varchar(255) NOT NULL,
  `observations` text DEFAULT NULL,
  `issue_date` date NOT NULL,
  `issued_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `certificates`
--

INSERT INTO `certificates` (`idcertificate`, `certificate_code`, `idstudent`, `idenrollment`, `purpose`, `observations`, `issue_date`, `issued_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'CE-2026-0001', 1, 7, 'Presentación ante entidad pública', 'Ningunna', '2026-07-04', 15, 1, '2026-07-05 04:17:46', '2026-07-05 04:17:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `idcourse` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `iddegree` int(11) NOT NULL,
  `idsubgrade` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `idsemester` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`idcourse`, `course_name`, `iddegree`, `idsubgrade`, `photo`, `status`, `idsemester`) VALUES
(1, 'Matematicas', 1, 1, '1779643906_738375.png', 1, 1),
(2, 'Comunicacion', 1, 1, '1779649732_course_300301.png', 0, 1),
(3, 'Ciencia y Tecnologia', 1, 1, '1779658088_641620.png', 1, 1),
(4, 'Personal Social', 1, 3, '1782948913_course_373872.png', 1, 1),
(5, 'Arte y Cultura', 1, 3, '1782948932_course_300301.png', 1, 1),
(6, 'Matemática', 1, 1, '1782942218_738375.png', 0, 1),
(7, 'Educación Física', 2, 2, '1782948971_710324.png', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_teacher`
--

CREATE TABLE `course_teacher` (
  `idcourse_teacher` int(11) NOT NULL,
  `idcourse` int(11) NOT NULL,
  `idteacher` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `course_teacher`
--

INSERT INTO `course_teacher` (`idcourse_teacher`, `idcourse`, `idteacher`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2),
(4, 4, 5),
(5, 5, 4),
(6, 6, 2),
(7, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `degrees`
--

CREATE TABLE `degrees` (
  `iddegree` int(11) NOT NULL,
  `degree_name` varchar(50) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `idsemester` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `degrees`
--

INSERT INTO `degrees` (`iddegree`, `degree_name`, `status`, `idsemester`) VALUES
(1, 'Nivel Primaria', 1, 1),
(2, 'Nivel Secundaria', 1, 1),
(3, '..', 1, 3),
(4, 'Nivel Primaria ll', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enrollments`
--

CREATE TABLE `enrollments` (
  `idenrollment` int(11) NOT NULL,
  `idstudent` int(11) NOT NULL,
  `idsection` int(11) NOT NULL,
  `enrollment_date` date NOT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `enrollments`
--

INSERT INTO `enrollments` (`idenrollment`, `idstudent`, `idsection`, `enrollment_date`, `status`) VALUES
(7, 1, 2, '2026-05-25', 1),
(8, 3, 1, '2026-05-25', 1),
(9, 4, 1, '2026-05-25', 1),
(11, 3, 2, '2026-05-25', 1),
(12, 5, 2, '2026-06-14', 1),
(13, 7, 1, '2026-07-07', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluation_types`
--

CREATE TABLE `evaluation_types` (
  `idevaluation_type` int(11) NOT NULL,
  `evaluation_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evaluation_types`
--

INSERT INTO `evaluation_types` (`idevaluation_type`, `evaluation_name`) VALUES
(1, 'PRACTICA'),
(2, 'EXAMEN'),
(3, 'TRABAJO'),
(4, 'FINAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fathers`
--

CREATE TABLE `fathers` (
  `idfather` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `dni` char(8) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `phone` char(9) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fathers`
--

INSERT INTO `fathers` (`idfather`, `iduser`, `dni`, `full_name`, `profession`, `phone`, `address`, `created_at`) VALUES
(1, 7, '45678912', 'Roberto Pérez Vargas', 'Ingeniero Civil', '998877665', 'Av. España 321', '2026-05-11 22:03:03'),
(2, 8, '47896521', 'Patricia Soto Ramírez', 'Contadora', '977665544', 'Jr. San Martín 654', '2026-05-11 22:03:03'),
(3, 12, '72129456', 'milton ventura', 'arquitecto', '942243079', '12', '2026-05-26 01:56:41'),
(4, 27, '27653872', 'Rocio - Mori', 'Ingeniera de sistemas', '987654176', 'JR Pakamuros', '2026-06-15 05:45:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `father_student`
--

CREATE TABLE `father_student` (
  `idfather_student` int(11) NOT NULL,
  `idfather` int(11) NOT NULL,
  `idstudent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `father_student`
--

INSERT INTO `father_student` (`idfather_student`, `idfather`, `idstudent`) VALUES
(1, 1, 4),
(2, 3, 5),
(3, 3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grades`
--

CREATE TABLE `grades` (
  `idgrade` int(11) NOT NULL,
  `idstudent` int(11) NOT NULL,
  `idcourse` int(11) NOT NULL,
  `idevaluation_type` int(11) NOT NULL,
  `grade` decimal(5,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `idsection` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grades`
--

INSERT INTO `grades` (`idgrade`, `idstudent`, `idcourse`, `idevaluation_type`, `grade`, `created_at`, `idsection`) VALUES
(13, 3, 1, 1, 14.00, '2026-05-25 21:56:44', 1),
(14, 4, 1, 1, 11.00, '2026-05-25 21:56:44', 1),
(15, 3, 1, 4, 19.20, '2026-05-25 22:03:05', 1),
(16, 4, 1, 4, 11.00, '2026-05-25 22:03:05', 1),
(17, 2, 1, 2, 5.00, '2026-05-25 22:03:39', 2),
(18, 1, 1, 2, 12.30, '2026-07-13 04:03:37', 2),
(19, 4, 1, 2, 14.60, '2026-05-25 22:03:39', 2),
(20, 3, 1, 2, 5.00, '2026-07-13 04:03:37', 2),
(21, 1, 1, 1, 11.00, '2026-06-16 02:12:59', 2),
(22, 2, 1, 1, 20.00, '2026-06-16 02:12:59', 2),
(23, 3, 1, 1, 12.00, '2026-06-16 02:12:59', 2),
(24, 4, 1, 1, 11.00, '2026-06-16 02:12:59', 2),
(25, 3, 1, 2, 19.00, '2026-05-26 00:56:16', 1),
(26, 4, 1, 2, 20.00, '2026-05-26 00:56:16', 1),
(27, 3, 1, 3, 12.00, '2026-05-26 02:04:27', 1),
(28, 4, 1, 3, 11.00, '2026-05-26 02:04:27', 1),
(29, 2, 1, 3, 2.00, '2026-05-26 02:20:10', 2),
(30, 3, 1, 3, 2.00, '2026-07-13 04:08:19', 2),
(31, 1, 1, 3, 2.00, '2026-07-13 04:08:19', 2),
(32, 4, 1, 3, 2.00, '2026-05-26 02:20:10', 2),
(33, 5, 1, 1, 15.00, '2026-06-16 02:12:59', 2),
(34, 7, 1, 2, 12.00, '2026-07-12 19:19:39', 1),
(35, 7, 1, 4, 2.00, '2026-07-12 19:19:54', 1),
(37, 5, 1, 3, 18.00, '2026-07-13 04:08:19', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grade_certificates`
--

CREATE TABLE `grade_certificates` (
  `idgradecertificate` int(11) NOT NULL,
  `certificate_code` varchar(30) NOT NULL,
  `idstudent` int(11) NOT NULL,
  `idenrollment` int(11) DEFAULT NULL,
  `idperiod` int(11) DEFAULT NULL,
  `purpose` varchar(255) NOT NULL,
  `observations` text DEFAULT NULL,
  `issue_date` date NOT NULL,
  `issued_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grade_certificates`
--

INSERT INTO `grade_certificates` (`idgradecertificate`, `certificate_code`, `idstudent`, `idenrollment`, `idperiod`, `purpose`, `observations`, `issue_date`, `issued_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'CN-2026-0001', 1, 7, 1, 'Postulación a beca de estudios', 'Ninguna', '2026-07-04', 15, 1, '2026-07-05 04:24:41', '2026-07-05 04:24:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE `messages` (
  `idmessage` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `sender_deleted` tinyint(1) DEFAULT 0,
  `receiver_deleted` tinyint(1) DEFAULT 0,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `messages`
--

INSERT INTO `messages` (`idmessage`, `sender_id`, `receiver_id`, `subject`, `message`, `is_read`, `sender_deleted`, `receiver_deleted`, `sent_at`) VALUES
(1, 9, 7, 'INGLÉS', 'prueba no mas', 1, 0, 0, '2026-06-14 01:59:05'),
(2, 7, 9, 'recibido', 'ahi estare', 1, 0, 0, '2026-06-14 02:36:08'),
(3, 15, 9, 'Holaaa', 'Holaaa', 1, 0, 0, '2026-07-02 07:05:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_07_07_000001_create_academic_documents_table', 2),
(5, '2026_07_07_000002_create_transfer_requests_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `idnotification` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('MESSAGE','GRADE','ATTENDANCE','ENROLLMENT','SYSTEM') NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`idnotification`, `iduser`, `title`, `description`, `type`, `is_read`, `created_at`) VALUES
(1, 4, 'Registro de asistencia', 'Tu asistencia del día 2026-06-14 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-14 08:54:01'),
(2, 5, 'Registro de asistencia', 'Tu asistencia del día 2026-06-14 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-14 08:54:01'),
(3, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-14 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-14 08:54:01'),
(4, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-14 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-14 08:54:01'),
(5, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-14 fue registrada como: PRESENTE', 'ATTENDANCE', 1, '2026-06-14 08:54:01'),
(6, 9, 'Registro de asistencia', 'Tu asistencia del día 2026-06-14 fue registrada como: AUSENTE', 'ATTENDANCE', 1, '2026-06-14 08:54:01'),
(7, 4, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-14 09:03:32'),
(8, 5, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-14 09:03:32'),
(9, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-14 09:03:32'),
(10, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-14 09:03:32'),
(11, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 1, '2026-06-14 09:03:32'),
(12, 9, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: TARDANZA', 'ATTENDANCE', 1, '2026-06-14 09:03:32'),
(13, 12, 'Asistencia de Frans Silva Avellaneda', 'La asistencia de Frans Silva Avellaneda del día 2026-06-15 fue registrada como: TARDANZA', 'ATTENDANCE', 1, '2026-06-14 09:03:32'),
(14, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-16 fue registrada como: AUSENTE', 'ATTENDANCE', 0, '2026-06-15 20:23:24'),
(15, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-16 fue registrada como: AUSENTE', 'ATTENDANCE', 0, '2026-06-15 20:23:24'),
(16, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-16 fue registrada como: AUSENTE', 'ATTENDANCE', 0, '2026-06-15 20:23:24'),
(17, 5, 'Registro de asistencia', 'Tu asistencia del día 2026-06-16 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:26:03'),
(18, 9, 'Registro de asistencia', 'Tu asistencia del día 2026-06-16 fue registrada como: PRESENTE', 'ATTENDANCE', 1, '2026-06-15 20:26:03'),
(19, 12, 'Asistencia de Frans Silva Avellaneda', 'La asistencia de Frans Silva Avellaneda del día 2026-06-16 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:26:03'),
(20, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-16 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:26:03'),
(21, 4, 'Registro de asistencia', 'Tu asistencia del día 2026-06-16 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:26:03'),
(22, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-16 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:26:03'),
(23, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-16 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:26:03'),
(24, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-16 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:27:58'),
(25, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-16 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:27:58'),
(26, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-16 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:27:58'),
(27, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-17 fue registrada como: AUSENTE', 'ATTENDANCE', 0, '2026-06-15 20:29:54'),
(28, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-17 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:29:54'),
(29, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-17 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:29:54'),
(30, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-18 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:30:46'),
(31, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-18 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:30:46'),
(32, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-18 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:30:46'),
(33, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:34:33'),
(34, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:34:33'),
(35, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:34:33'),
(36, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-24 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:43:55'),
(37, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-24 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:43:55'),
(38, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-24 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:43:55'),
(39, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-25 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:44:47'),
(40, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-25 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:44:47'),
(41, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-25 fue registrada como: PRESENTE', 'ATTENDANCE', 1, '2026-06-15 20:44:47'),
(42, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-30 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:50:01'),
(43, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-30 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:50:01'),
(44, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-30 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:50:01'),
(45, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:50:40'),
(46, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:50:40'),
(47, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:50:40'),
(48, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:50:47'),
(49, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:50:47'),
(50, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:50:47'),
(51, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:51:16'),
(52, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:51:16'),
(53, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:51:16'),
(54, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:51:26'),
(55, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:51:26'),
(56, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:51:26'),
(57, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:54:29'),
(58, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:54:29'),
(59, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:54:29'),
(60, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:54:35'),
(61, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:54:35'),
(62, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:54:35'),
(63, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:55:13'),
(64, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:55:13'),
(65, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:55:13'),
(66, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:59:53'),
(67, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 0, '2026-06-15 20:59:53'),
(68, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-06-15 fue registrada como: PRESENTE', 'ATTENDANCE', 1, '2026-06-15 20:59:53'),
(69, 6, 'Registro de asistencia', 'Tu asistencia del día 2026-07-08 fue registrada como: TARDANZA', 'ATTENDANCE', 0, '2026-07-03 09:08:03'),
(70, 10, 'Registro de asistencia', 'Tu asistencia del día 2026-07-08 fue registrada como: TARDANZA', 'ATTENDANCE', 0, '2026-07-03 09:08:03'),
(71, 7, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-07-08 fue registrada como: TARDANZA', 'ATTENDANCE', 0, '2026-07-03 09:08:03'),
(72, 12, 'Asistencia de Marcus Sanchez', 'La asistencia de Marcus Sanchez del día 2026-07-08 fue registrada como: TARDANZA', 'ATTENDANCE', 0, '2026-07-03 09:08:03'),
(73, 9, 'Nota modificada', 'Una de tus calificaciones ha sido actualizada. Nueva calificación: 15.00', 'GRADE', 1, '2026-07-13 03:53:33'),
(74, 12, 'Nota modificada de Frans Silva Avellaneda', 'La calificación de Frans Silva Avellaneda ha sido actualizada. Nueva calificación: 15.00', 'GRADE', 0, '2026-07-13 03:53:33'),
(75, 6, 'Nota modificada', 'Una de tus calificaciones ha sido actualizada. Nueva calificación: 12.00', 'GRADE', 0, '2026-07-13 03:53:33'),
(76, 4, 'Nota modificada', 'Una de tus calificaciones ha sido actualizada. Nueva calificación: 11.00', 'GRADE', 0, '2026-07-13 03:53:33'),
(77, 9, 'Nueva nota registrada - Matematicas', 'Se ha publicado una nueva nota para ti en el curso de Matematicas. Calificación: 18', 'GRADE', 1, '2026-07-13 04:08:19'),
(78, 12, 'Nueva nota de Frans Silva Avellaneda', 'Se ha registrado una nueva calificación para Frans Silva Avellaneda en el curso de Matematicas. Calificación: 18', 'GRADE', 0, '2026-07-13 04:08:19'),
(79, 6, 'Nota modificada - Matematicas', 'Tu calificación en el curso de Matematicas ha sido actualizada. Nueva nota: 2.00', 'GRADE', 0, '2026-07-13 04:08:19'),
(80, 4, 'Nota modificada - Matematicas', 'Tu calificación en el curso de Matematicas ha sido actualizada. Nueva nota: 2.00', 'GRADE', 0, '2026-07-13 04:08:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periods`
--

CREATE TABLE `periods` (
  `idperiod` int(11) NOT NULL,
  `period_name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `periods`
--

INSERT INTO `periods` (`idperiod`, `period_name`, `start_date`, `end_date`, `status`, `created_at`) VALUES
(1, 'Periodo 2026 - I', '2026-07-01', '2026-12-14', 1, '2026-05-18 00:49:08'),
(2, 'Periodo 2026 - II', '2026-07-03', '2026-12-31', 0, '2026-05-18 00:49:08'),
(7, '2028', '2026-07-09', '2026-07-15', 0, '2026-07-02 06:11:37'),
(8, '2027', '2026-07-08', '2026-08-04', 0, '2026-07-02 06:11:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idrole` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idrole`, `role_name`) VALUES
(1, 'ADMIN'),
(4, 'FATHER'),
(3, 'STUDENT'),
(2, 'TEACHER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedules`
--

CREATE TABLE `schedules` (
  `idschedule` int(11) NOT NULL,
  `idsection` int(11) NOT NULL,
  `day_week` enum('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES') NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sections`
--

CREATE TABLE `sections` (
  `idsection` int(11) NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `idcourse` int(11) NOT NULL,
  `capacity` int(11) DEFAULT 30,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sections`
--

INSERT INTO `sections` (`idsection`, `section_name`, `idcourse`, `capacity`, `status`) VALUES
(1, 'A', 1, 30, 1),
(2, 'B', 1, 30, 1),
(3, 'C', 1, 25, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semesters`
--

CREATE TABLE `semesters` (
  `idsemester` bigint(20) UNSIGNED NOT NULL,
  `semester_name` varchar(50) NOT NULL,
  `idperiod` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `semesters`
--

INSERT INTO `semesters` (`idsemester`, `semester_name`, `idperiod`, `status`) VALUES
(1, 'Primer Semestre', 1, 1),
(2, 'Segundo Semestre', 1, 1),
(3, 'Prueba de Semestre', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('aH904oyTeTIZ0hYEEG0oUaqilMqDPGPsxfpHLOhm', 15, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiREJlVkxzc1hJSFVSWFRGdkZsaE9GTnlvZlJIWjAyR1Qxc3g5R0NBbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ncmFkZXMiO3M6NToicm91dGUiO3M6MTI6ImdyYWRlcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE1O30=', 1783897768),
('DCa47Ukh2nfLQCOBEZW6IIHnUWY1rbcEQ5RDN3KQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.128.0 Chrome/148.0.7778.271 Electron/42.5.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2RTM004UU01UlRPRkhKbWRkcENYZ0c5d0xZZTBjRDdzaHZlT2hqcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ncmFkZXMiO3M6NToicm91dGUiO3M6MTI6ImdyYWRlcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783896213),
('iGOnKDyhIXoJ9aZNcUOIdJhwym3n0FKI5feYf4F9', 9, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVElabHF5bGI1OEhqM09YTTBKRmFnVE5Wc3pUdk5oU1N1dVl5azk5dCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ub3RpZmljYXRpb25zIjtzOjU6InJvdXRlIjtzOjE5OiJub3RpZmljYXRpb25zLmluZGV4Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6OTt9', 1783897988);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `idstudent` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `dni` char(8) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`idstudent`, `iduser`, `dni`, `full_name`, `gender`, `birth_date`, `address`, `created_at`) VALUES
(1, 4, '78451236', 'Luis Fernando Pérez Gómez', 'M', '2010-05-12', 'Av. Perú 123', '2026-05-11 22:03:03'),
(2, 5, '74125896', 'Ana Lucía Ramírez Soto', 'F', '2011-08-25', 'Jr. Libertad 456', '2026-05-11 22:03:03'),
(3, 6, '78965412', 'José Miguel Castillo Vega', 'M', '2010-11-03', 'Calle Los Laureles 789', '2026-05-11 22:03:03'),
(4, 10, '72667375', 'Marcus Sanchez', 'M', '2005-04-07', 'Av Las Flores', '2026-05-12 21:14:12'),
(5, 9, '72667379', 'Frans Silva Avellaneda', 'M', '2005-04-07', 'Jr. Julio Muñoz', '2026-06-14 08:49:10'),
(6, 26, '72667376', 'FRANS SILVA', 'M', '2026-06-14', 'Av Pakamuros', '2026-06-15 05:31:39'),
(7, 28, '72667443', 'ff', 'M', '2005-04-07', 'fff', '2026-07-07 07:29:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subgrades`
--

CREATE TABLE `subgrades` (
  `idsubgrade` int(11) NOT NULL,
  `subgrade_name` varchar(50) NOT NULL,
  `iddegree` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subgrades`
--

INSERT INTO `subgrades` (`idsubgrade`, `subgrade_name`, `iddegree`, `status`) VALUES
(1, '1° Grado', 1, 1),
(2, '1° Grado', 2, 1),
(3, '2° Grado', 1, 1),
(4, '3° Grado', 1, 0),
(5, '4° Grado', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teachers`
--

CREATE TABLE `teachers` (
  `idteacher` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `dni` char(8) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `phone` char(9) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `teachers`
--

INSERT INTO `teachers` (`idteacher`, `iduser`, `dni`, `full_name`, `gender`, `phone`, `created_at`) VALUES
(1, 2, '74859632', 'Carlos Alberto Mendoza Ruiz', 'M', '987654321', '2026-05-11 22:03:03'),
(2, 3, '71548963', 'María Elena Torres Díaz', 'F', '912345678', '2026-05-11 22:03:03'),
(4, 18, '72667379', 'JUAN PEREZ', 'M', '123456789', '2026-06-15 04:42:39'),
(5, 24, '72667375', 'LESLI LIZET SILVA AVELLANEDA', 'F', '901492837', '2026-06-15 04:58:56'),
(6, 25, '72667371', 'LESLI LIZET SILVA AVELLANEDA', 'F', '901492837', '2026-06-15 05:06:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transfer_requests`
--

CREATE TABLE `transfer_requests` (
  `idtransfer_request` int(10) UNSIGNED NOT NULL,
  `request_code` varchar(30) NOT NULL,
  `dni` char(8) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `previous_school` varchar(150) NOT NULL,
  `previous_school_code` varchar(30) DEFAULT NULL,
  `origin_grade` varchar(80) DEFAULT NULL,
  `requested_idsection` int(11) DEFAULT NULL,
  `request_date` date NOT NULL,
  `documents_presented` text NOT NULL,
  `observations` text DEFAULT NULL,
  `status` enum('PENDIENTE','OBSERVADO','APROBADO','RECHAZADO') NOT NULL DEFAULT 'PENDIENTE',
  `decision_notes` text DEFAULT NULL,
  `reviewed_by` int(11) DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `idstudent` int(11) DEFAULT NULL,
  `idenrollment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `transfer_requests`
--

INSERT INTO `transfer_requests` (`idtransfer_request`, `request_code`, `dni`, `full_name`, `gender`, `birth_date`, `address`, `previous_school`, `previous_school_code`, `origin_grade`, `requested_idsection`, `request_date`, `documents_presented`, `observations`, `status`, `decision_notes`, `reviewed_by`, `reviewed_at`, `idstudent`, `idenrollment`, `created_at`, `updated_at`) VALUES
(1, 'TR-2026-0001', '72667443', 'ff', 'M', '2005-04-07', 'fff', 'fgfg', '1234', '2', 3, '2026-07-07', 'Ficha de matricula', 'Ninguna', 'APROBADO', NULL, 15, '2026-07-07 07:29:19', 7, 13, '2026-07-07 07:27:27', '2026-07-07 07:29:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `iduser` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idrole` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `login_attempts` int(11) DEFAULT 0,
  `locked_until` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`iduser`, `username`, `email`, `password`, `idrole`, `photo`, `status`, `created_at`, `updated_at`, `login_attempts`, `locked_until`) VALUES
(1, 'admin01', 'admin@school.com', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 1, '1778542880_190711.png', 0, '2026-05-11 22:01:39', '2026-05-19 07:25:14', 0, NULL),
(2, 'teacher01', 'teacher01@school.com', '$2y$12$5B7DEs3cRgqXjd9YsgLqGOIct0F.R7mvEIlf6CSDQzuuTGLWz3cY2', 2, '1778734553_190711.png', 1, '2026-05-11 22:01:39', '2026-06-15 08:41:36', 0, NULL),
(3, 'teacher02', 'teacher02@school.com', 'cde383eee8ee7a4400adf7a15f716f179a2eb97646b37e089eb8d6d04e663416', 2, '1778734562_34552.png', 1, '2026-05-11 22:01:39', '2026-05-14 09:56:02', 0, NULL),
(4, 'student01', 'student01@school.com', '703b0a3d6ad75b649a28adde7d83c6251da457549263bc7ff45ec709b0a8448b', 3, '1778733483_37712.jpg', 1, '2026-05-11 22:01:39', '2026-05-14 09:38:03', 0, NULL),
(5, 'student02', 'student02@school.com', '703b0a3d6ad75b649a28adde7d83c6251da457549263bc7ff45ec709b0a8448b', 3, '1778733496_37712.jpg', 1, '2026-05-11 22:01:39', '2026-05-14 09:38:16', 0, NULL),
(6, 'student03', 'student03@school.com', '703b0a3d6ad75b649a28adde7d83c6251da457549263bc7ff45ec709b0a8448b', 3, '1778733513_37712.jpg', 0, '2026-05-11 22:01:39', '2026-06-15 06:48:32', 0, NULL),
(7, 'father01', 'father01@school.com', '$2y$12$5939EVg6jBMXmSttRaOd2ejjKEM/WKMFjaYAnDl/lpK8jD52qwYtu', 4, '1778731329_192873.png', 1, '2026-05-11 22:01:39', '2026-07-02 10:30:19', 0, NULL),
(8, 'father02', 'father02@school.com', '40c65b6bbb8286e14be06abff423b01071eea6e7fc0933e22b757f228feac211', 4, '1778731304_47289.png', 0, '2026-05-11 22:01:39', '2026-05-14 09:01:44', 0, NULL),
(9, 'frans', 'nfransa19@gmail.com', '$2y$12$upsW7V8Za.Hzsf57DvbaJuM5ZJV3pDUtEyQ4vVl0dQoAFDzfzwS2a', 3, '1778545340_37712.jpg', 1, '2026-05-12 05:21:17', '2026-07-13 03:51:22', 0, NULL),
(10, 'pruebaES', 'nfransa18@gmail.com', '$2y$12$ykE3O.VlZZUSOLOqKUGowOfA829BrRfut/XmeWUzS.lG5XgVfW0xq', 3, '1778734526_37712.jpg', 1, '2026-05-12 05:45:44', '2026-05-14 09:55:26', 0, NULL),
(11, 'pruebaTEA', 'nfransa17@gmail.com', '$2y$12$frPr461rKZflI2S8rDhWruIKE8Dh.AE7Fr58BfBEkDL0OP2jRPhnq', 2, '1781108898_WhatsApp Image 2026-06-10 at 9.32.00 AM.jpeg', 1, '2026-05-12 05:47:58', '2026-06-10 21:28:18', 0, NULL),
(12, 'pruebaFaT', 'nfransa16@gmail.com', '$2y$12$D6FYux5Bl67Fv9Ys1ZYvAuNXPPy9zZMO6g7eVlHz1EHVE5MP7O5oG', 4, '1779905216_192873.png', 1, '2026-05-12 05:48:52', '2026-06-15 07:48:48', 0, NULL),
(13, 'jorge123', 'nfransa15@gmail.com', '$2y$12$zBsoLM2imFd9r9HJbgKzseZViA187alkgrYVHdpEvtUmRtsOeLH5m', 3, '1781108912_WhatsApp Image 2026-06-10 at 9.32.00 AM.jpeg', 0, '2026-05-13 05:45:44', '2026-06-10 21:28:32', 0, NULL),
(14, 'Jorgito tu terror', 'juju@gmil.com', '$2y$12$A2Hf7Mw9oQ2W5IoIA9XEL.li/Ld3wTzbQJHEQF5z/Vtztu.pWfali', 3, '1781108944_WhatsApp Image 2026-06-10 at 9.32.00 AM.jpeg', 1, '2026-05-13 21:29:40', '2026-06-10 21:29:04', 0, NULL),
(15, 'FARIES', 'faries@gmail.com', '$2y$12$Hlr.D5ra9QJWjdVh6R55VOat/QjgUeS3AGKzshIt1HpKj4xfVmlr.', 1, '1779905170_824389.jpeg', 1, '2026-05-27 23:04:44', '2026-07-02 10:49:50', 0, NULL),
(16, 'norbert', 'nfransa12@gmail.com', '$2y$12$dT7Kc2KqqPCLXgWiV95ToODny49Mg9eUVxwPkWdU/Duyf53cVdRby', 1, NULL, 1, '2026-06-15 03:34:02', '2026-06-15 23:55:11', 0, NULL),
(17, 'pp', 'usuario@gmail.com', '$2y$12$xQkrtr9np8ChABAmLBkeZOGDARvFxyo5DGr7ZfZ1tg72x1Xw447pu', 1, '1781477196_bet (5).png', 1, '2026-06-15 03:46:36', '2026-06-15 03:46:36', 0, NULL),
(18, 'dddd', 'usuario1@gmail.com', '$2y$12$4SxKaZsvkb3bWpPeZVXuwuCk29y46m52MV8zxB8sSBCNZOCBsASz.', 2, '1782921613_1779905216_192873.png', 1, '2026-06-15 03:49:30', '2026-07-01 21:00:13', 0, NULL),
(24, 'LES', 'faries22@gmail.com', '$2y$12$1v4IHMKHAjoIDyX23knLpeUpAU1fv/3LKbGkIJBT9kjbgpXOt6kyq', 2, '1782921583_47289.png', 1, '2026-06-15 04:58:56', '2026-07-01 20:59:43', 0, NULL),
(25, 'LES2', 'faries23@gmail.com', '$2y$12$xpJjU2UNPIsFUtobC4/5UeWJVjn4DgMvAAUC2uvZslzUodYkwPjrW', 2, '1782921563_227851.png', 1, '2026-06-15 05:06:19', '2026-07-01 20:59:23', 0, NULL),
(26, 'estudianteee', 'estudiante@gmail.com', '$2y$12$g3dEhd5mCvc5gDO/ifoYguDXzhSZQ.h68W7S4Pkb4WEN71XnBaAf.', 3, '1782921642_37712.jpg', 1, '2026-06-15 05:31:39', '2026-07-01 21:00:42', 0, NULL),
(27, 'padre', 'padre@gmail.com', '$2y$12$zuXzspmpjkcD.1V7kT0sGOxGd.aL/V7CS9gCRzW5pa8zQUUpibfAO', 4, '1782921685_618742.jpg', 1, '2026-06-15 05:45:54', '2026-07-01 21:01:25', 0, NULL),
(28, 'joseluis', 'joseluis@gmail.com', '$2y$12$SSKLTTtLgBGdNA8..bZ85.9LQnUwDB6dSDWJxKei5eviZzq0..vzW', 3, '1783395532_767730.jpg', 1, '2026-07-07 07:29:19', '2026-07-07 08:38:52', 0, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `academic_documents`
--
ALTER TABLE `academic_documents`
  ADD PRIMARY KEY (`idacademic_document`),
  ADD UNIQUE KEY `academic_documents_document_code_unique` (`document_code`),
  ADD KEY `academic_documents_document_code_index` (`document_code`),
  ADD KEY `academic_documents_document_type_index` (`document_type`),
  ADD KEY `academic_documents_idstudent_index` (`idstudent`),
  ADD KEY `academic_documents_status_index` (`status`);

--
-- Indices de la tabla `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`idattendance`),
  ADD UNIQUE KEY `unique_attendance` (`idstudent`,`idsection`,`attendance_date`),
  ADD KEY `fk_attendance_student` (`idstudent`),
  ADD KEY `fk_attendance_section` (`idsection`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indices de la tabla `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`idcertificate`),
  ADD UNIQUE KEY `certificate_code` (`certificate_code`),
  ADD KEY `idx_certificates_student` (`idstudent`),
  ADD KEY `idx_certificates_issue_date` (`issue_date`),
  ADD KEY `fk_certificates_issuer` (`issued_by`);

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`idcourse`),
  ADD KEY `fk_course_degree` (`iddegree`),
  ADD KEY `fk_course_subgrade` (`idsubgrade`),
  ADD KEY `fk_course_semester` (`idsemester`);

--
-- Indices de la tabla `course_teacher`
--
ALTER TABLE `course_teacher`
  ADD PRIMARY KEY (`idcourse_teacher`),
  ADD UNIQUE KEY `unique_course_teacher` (`idcourse`,`idteacher`),
  ADD KEY `fk_ct_course` (`idcourse`),
  ADD KEY `fk_ct_teacher` (`idteacher`);

--
-- Indices de la tabla `degrees`
--
ALTER TABLE `degrees`
  ADD PRIMARY KEY (`iddegree`),
  ADD KEY `fk_degree_semester` (`idsemester`);

--
-- Indices de la tabla `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`idenrollment`),
  ADD UNIQUE KEY `unique_enrollment` (`idstudent`,`idsection`),
  ADD KEY `fk_enrollment_student` (`idstudent`),
  ADD KEY `fk_enrollment_section` (`idsection`);

--
-- Indices de la tabla `evaluation_types`
--
ALTER TABLE `evaluation_types`
  ADD PRIMARY KEY (`idevaluation_type`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `fathers`
--
ALTER TABLE `fathers`
  ADD PRIMARY KEY (`idfather`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `fk_father_user` (`iduser`);

--
-- Indices de la tabla `father_student`
--
ALTER TABLE `father_student`
  ADD PRIMARY KEY (`idfather_student`),
  ADD KEY `fk_fs_father` (`idfather`),
  ADD KEY `fk_fs_student` (`idstudent`);

--
-- Indices de la tabla `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`idgrade`),
  ADD KEY `fk_grade_student` (`idstudent`),
  ADD KEY `fk_grade_course` (`idcourse`),
  ADD KEY `fk_grade_eval` (`idevaluation_type`),
  ADD KEY `fk_grade_section` (`idsection`);

--
-- Indices de la tabla `grade_certificates`
--
ALTER TABLE `grade_certificates`
  ADD PRIMARY KEY (`idgradecertificate`),
  ADD UNIQUE KEY `certificate_code` (`certificate_code`),
  ADD KEY `idx_grade_certificates_student` (`idstudent`),
  ADD KEY `idx_grade_certificates_issue_date` (`issue_date`),
  ADD KEY `fk_gcert_period` (`idperiod`),
  ADD KEY `fk_gcert_issuer` (`issued_by`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`idmessage`),
  ADD KEY `fk_message_sender` (`sender_id`),
  ADD KEY `fk_message_receiver` (`receiver_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`idnotification`),
  ADD KEY `fk_notification_user` (`iduser`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `periods`
--
ALTER TABLE `periods`
  ADD PRIMARY KEY (`idperiod`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idrole`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indices de la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`idschedule`),
  ADD KEY `fk_schedule_section` (`idsection`);

--
-- Indices de la tabla `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`idsection`),
  ADD KEY `fk_section_course` (`idcourse`);

--
-- Indices de la tabla `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`idsemester`),
  ADD KEY `fk_semester_period` (`idperiod`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`idstudent`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `fk_student_user` (`iduser`);

--
-- Indices de la tabla `subgrades`
--
ALTER TABLE `subgrades`
  ADD PRIMARY KEY (`idsubgrade`),
  ADD KEY `fk_subgrade_degree` (`iddegree`);

--
-- Indices de la tabla `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`idteacher`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `fk_teacher_user` (`iduser`);

--
-- Indices de la tabla `transfer_requests`
--
ALTER TABLE `transfer_requests`
  ADD PRIMARY KEY (`idtransfer_request`),
  ADD UNIQUE KEY `transfer_requests_request_code_unique` (`request_code`),
  ADD KEY `transfer_requests_dni_index` (`dni`),
  ADD KEY `transfer_requests_status_index` (`status`),
  ADD KEY `transfer_requests_requested_idsection_index` (`requested_idsection`),
  ADD KEY `transfer_requests_idstudent_index` (`idstudent`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_users_roles` (`idrole`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `academic_documents`
--
ALTER TABLE `academic_documents`
  MODIFY `idacademic_document` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `attendance`
--
ALTER TABLE `attendance`
  MODIFY `idattendance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `certificates`
--
ALTER TABLE `certificates`
  MODIFY `idcertificate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `idcourse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `course_teacher`
--
ALTER TABLE `course_teacher`
  MODIFY `idcourse_teacher` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `degrees`
--
ALTER TABLE `degrees`
  MODIFY `iddegree` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `idenrollment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `evaluation_types`
--
ALTER TABLE `evaluation_types`
  MODIFY `idevaluation_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fathers`
--
ALTER TABLE `fathers`
  MODIFY `idfather` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `father_student`
--
ALTER TABLE `father_student`
  MODIFY `idfather_student` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `grades`
--
ALTER TABLE `grades`
  MODIFY `idgrade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `grade_certificates`
--
ALTER TABLE `grade_certificates`
  MODIFY `idgradecertificate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `messages`
--
ALTER TABLE `messages`
  MODIFY `idmessage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `idnotification` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `periods`
--
ALTER TABLE `periods`
  MODIFY `idperiod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `sections`
--
ALTER TABLE `sections`
  MODIFY `idsection` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `semesters`
--
ALTER TABLE `semesters`
  MODIFY `idsemester` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `idstudent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `subgrades`
--
ALTER TABLE `subgrades`
  MODIFY `idsubgrade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `teachers`
--
ALTER TABLE `teachers`
  MODIFY `idteacher` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `transfer_requests`
--
ALTER TABLE `transfer_requests`
  MODIFY `idtransfer_request` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `fk_attendance_section` FOREIGN KEY (`idsection`) REFERENCES `sections` (`idsection`),
  ADD CONSTRAINT `fk_attendance_section_fk` FOREIGN KEY (`idsection`) REFERENCES `sections` (`idsection`),
  ADD CONSTRAINT `fk_attendance_student` FOREIGN KEY (`idstudent`) REFERENCES `students` (`idstudent`),
  ADD CONSTRAINT `fk_attendance_student_fk` FOREIGN KEY (`idstudent`) REFERENCES `students` (`idstudent`);

--
-- Filtros para la tabla `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `fk_certificates_issuer` FOREIGN KEY (`issued_by`) REFERENCES `users` (`iduser`),
  ADD CONSTRAINT `fk_certificates_student` FOREIGN KEY (`idstudent`) REFERENCES `students` (`idstudent`);

--
-- Filtros para la tabla `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk_course_degree` FOREIGN KEY (`iddegree`) REFERENCES `degrees` (`iddegree`),
  ADD CONSTRAINT `fk_course_degree_fk` FOREIGN KEY (`iddegree`) REFERENCES `degrees` (`iddegree`),
  ADD CONSTRAINT `fk_course_semester` FOREIGN KEY (`idsemester`) REFERENCES `semesters` (`idsemester`),
  ADD CONSTRAINT `fk_course_semester_fk` FOREIGN KEY (`idsemester`) REFERENCES `semesters` (`idsemester`),
  ADD CONSTRAINT `fk_course_subgrade` FOREIGN KEY (`idsubgrade`) REFERENCES `subgrades` (`idsubgrade`),
  ADD CONSTRAINT `fk_course_subgrade_fk` FOREIGN KEY (`idsubgrade`) REFERENCES `subgrades` (`idsubgrade`);

--
-- Filtros para la tabla `course_teacher`
--
ALTER TABLE `course_teacher`
  ADD CONSTRAINT `fk_ct_course` FOREIGN KEY (`idcourse`) REFERENCES `courses` (`idcourse`),
  ADD CONSTRAINT `fk_ct_course_fk` FOREIGN KEY (`idcourse`) REFERENCES `courses` (`idcourse`),
  ADD CONSTRAINT `fk_ct_teacher` FOREIGN KEY (`idteacher`) REFERENCES `teachers` (`idteacher`),
  ADD CONSTRAINT `fk_ct_teacher_fk` FOREIGN KEY (`idteacher`) REFERENCES `teachers` (`idteacher`);

--
-- Filtros para la tabla `degrees`
--
ALTER TABLE `degrees`
  ADD CONSTRAINT `fk_degree_semester` FOREIGN KEY (`idsemester`) REFERENCES `semesters` (`idsemester`);

--
-- Filtros para la tabla `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `fk_enrollment_section` FOREIGN KEY (`idsection`) REFERENCES `sections` (`idsection`),
  ADD CONSTRAINT `fk_enrollment_section_fk` FOREIGN KEY (`idsection`) REFERENCES `sections` (`idsection`),
  ADD CONSTRAINT `fk_enrollment_student` FOREIGN KEY (`idstudent`) REFERENCES `students` (`idstudent`),
  ADD CONSTRAINT `fk_enrollment_student_fk` FOREIGN KEY (`idstudent`) REFERENCES `students` (`idstudent`);

--
-- Filtros para la tabla `fathers`
--
ALTER TABLE `fathers`
  ADD CONSTRAINT `fk_father_user` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`),
  ADD CONSTRAINT `fk_father_user_fk` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`);

--
-- Filtros para la tabla `father_student`
--
ALTER TABLE `father_student`
  ADD CONSTRAINT `fk_fs_father_fk` FOREIGN KEY (`idfather`) REFERENCES `fathers` (`idfather`),
  ADD CONSTRAINT `fk_fs_student_fk` FOREIGN KEY (`idstudent`) REFERENCES `students` (`idstudent`);

--
-- Filtros para la tabla `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `fk_grade_course_fk` FOREIGN KEY (`idcourse`) REFERENCES `courses` (`idcourse`),
  ADD CONSTRAINT `fk_grade_eval_fk` FOREIGN KEY (`idevaluation_type`) REFERENCES `evaluation_types` (`idevaluation_type`),
  ADD CONSTRAINT `fk_grade_section` FOREIGN KEY (`idsection`) REFERENCES `sections` (`idsection`),
  ADD CONSTRAINT `fk_grade_section_fk` FOREIGN KEY (`idsection`) REFERENCES `sections` (`idsection`),
  ADD CONSTRAINT `fk_grade_student_fk` FOREIGN KEY (`idstudent`) REFERENCES `students` (`idstudent`),
  ADD CONSTRAINT `fk_grades_section` FOREIGN KEY (`idsection`) REFERENCES `sections` (`idsection`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grade_certificates`
--
ALTER TABLE `grade_certificates`
  ADD CONSTRAINT `fk_gcert_issuer` FOREIGN KEY (`issued_by`) REFERENCES `users` (`iduser`),
  ADD CONSTRAINT `fk_gcert_period` FOREIGN KEY (`idperiod`) REFERENCES `periods` (`idperiod`),
  ADD CONSTRAINT `fk_gcert_student` FOREIGN KEY (`idstudent`) REFERENCES `students` (`idstudent`);

--
-- Filtros para la tabla `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_message_receiver` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`iduser`),
  ADD CONSTRAINT `fk_message_sender` FOREIGN KEY (`sender_id`) REFERENCES `users` (`iduser`);

--
-- Filtros para la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notification_user` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`);

--
-- Filtros para la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `fk_schedule_section_fk` FOREIGN KEY (`idsection`) REFERENCES `sections` (`idsection`);

--
-- Filtros para la tabla `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_section_course` FOREIGN KEY (`idcourse`) REFERENCES `courses` (`idcourse`),
  ADD CONSTRAINT `fk_section_course_fk` FOREIGN KEY (`idcourse`) REFERENCES `courses` (`idcourse`);

--
-- Filtros para la tabla `semesters`
--
ALTER TABLE `semesters`
  ADD CONSTRAINT `fk_semester_period` FOREIGN KEY (`idperiod`) REFERENCES `periods` (`idperiod`),
  ADD CONSTRAINT `fk_semester_period_fk` FOREIGN KEY (`idperiod`) REFERENCES `periods` (`idperiod`);

--
-- Filtros para la tabla `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_student_user` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`),
  ADD CONSTRAINT `fk_student_user_fk` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`);

--
-- Filtros para la tabla `subgrades`
--
ALTER TABLE `subgrades`
  ADD CONSTRAINT `fk_subgrade_degree` FOREIGN KEY (`iddegree`) REFERENCES `degrees` (`iddegree`);

--
-- Filtros para la tabla `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `fk_teacher_user` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`),
  ADD CONSTRAINT `fk_teacher_user_fk` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_roles` FOREIGN KEY (`idrole`) REFERENCES `roles` (`idrole`),
  ADD CONSTRAINT `fk_users_roles_fk` FOREIGN KEY (`idrole`) REFERENCES `roles` (`idrole`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
