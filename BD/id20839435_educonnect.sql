-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 24-02-2024 a las 02:33:56
-- Versión del servidor: 10.5.20-MariaDB
-- Versión de PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id20839435_educonnect`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`id20839435_miguel`@`%` PROCEDURE `ObtenerCursosPorUsuario` (IN `id_usuario` INT)   BEGIN
    SELECT c.id,
        c.curso_codigo AS cursoCodigo,
        c.nombre AS cursoNombre, 
        g.nombre AS grado, 
        s.nombre AS seccion,
        c.url_imagen
    FROM curso c
    INNER JOIN curso_alumno ca ON c.id = ca.curso_id
    JOIN grado g ON c.grado_id = g.id
    JOIN seccion s ON c.seccion_id = s.id
    WHERE ca.usuario_id = id_usuario;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alternativa`
--

CREATE TABLE `alternativa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pregunta_id` int(11) DEFAULT NULL,
  `es_correcta` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alternativa`
--

INSERT INTO `alternativa` (`id`, `nombre`, `pregunta_id`, `es_correcta`) VALUES
(1, 'ello', 1, 1),
(2, 'ella', 1, 0),
(3, 'eso', 1, 0),
(4, 'él', 1, 0),
(5, 'vuestro', 2, 1),
(6, 'suya', 2, 0),
(7, 'nuestro', 2, 0),
(8, 'nuestra', 2, 0),
(9, 'lo cual', 3, 1),
(10, 'cuyo', 3, 0),
(11, 'cual', 3, 0),
(12, 'quien', 3, 0),
(13, 'nos', 4, 1),
(14, 'nosotros', 4, 0),
(15, 'nosotras', 4, 0),
(16, 'nuestro', 4, 0),
(17, 'eso', 5, 1),
(18, 'este', 5, 0),
(19, 'aquello', 5, 0),
(20, 'aquel', 5, 0),
(21, 'tú', 6, 1),
(22, 'te', 6, 0),
(23, 'ti', 6, 0),
(24, 'usted', 6, 0),
(25, 'suyo', 7, 1),
(26, 'su', 7, 0),
(27, 'vuestro', 7, 0),
(28, 'nuestros', 7, 0),
(29, 'quién', 8, 1),
(30, 'cuál', 8, 0),
(31, 'qué', 8, 0),
(32, 'cómo', 8, 0),
(33, 'te', 9, 1),
(34, 'tú', 9, 0),
(35, 'ti', 9, 0),
(36, 'contigo', 9, 0),
(37, 'quien', 10, 1),
(38, 'que', 10, 0),
(39, 'cuyo', 10, 0),
(40, 'cual', 10, 0),
(41, 'corre', 11, 1),
(42, 'Juan', 11, 0),
(43, 'todos', 11, 0),
(44, 'días', 11, 0),
(45, 'estudiaré', 12, 1),
(46, 'mañana', 12, 0),
(47, 'para', 12, 0),
(48, 'examen', 12, 0),
(49, 'ladra', 13, 1),
(50, 'perro', 13, 0),
(51, 'fuerte', 13, 0),
(52, 'noche', 13, 0),
(53, 'baila', 14, 1),
(54, 'ella', 14, 0),
(55, 'con', 14, 0),
(56, 'gracia', 14, 0),
(57, 'caminamos', 15, 1),
(58, 'nosotros', 15, 0),
(59, 'por', 15, 0),
(60, 'todos', 15, 0),
(61, 'sopla', 16, 1),
(62, 'viento', 16, 0),
(63, 'suavemente', 16, 0),
(64, 'árboles', 16, 0),
(65, 'juega', 17, 1),
(66, 'niño', 17, 0),
(67, 'felizmente', 17, 0),
(68, 'parque', 17, 0),
(69, 'explica', 18, 1),
(70, 'profesor', 18, 0),
(71, 'lección', 18, 0),
(72, 'detalladamente', 18, 0),
(73, 'ganó', 19, 1),
(74, 'equipo', 19, 0),
(75, 'partido', 19, 0),
(76, 'facilidad', 19, 0),
(77, 'canta', 20, 1),
(78, 'ella', 20, 0),
(79, 'hermosamente', 20, 0),
(80, 'escenario', 20, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`id`, `usuario_id`, `curso_id`, `fecha`, `estado`) VALUES
(1, 2, 1, '2023-06-19', 'Tarde'),
(2, 3, 1, '2023-06-19', 'Temprano'),
(3, 4, 1, '2023-06-19', 'Temprano'),
(4, 5, 1, '2023-06-19', 'Temprano'),
(5, 6, 1, '2023-06-19', 'Temprano'),
(6, 7, 1, '2023-06-19', 'Temprano'),
(7, 8, 1, '2023-06-19', 'Tarde'),
(8, 9, 1, '2023-06-19', 'Temprano'),
(9, 10, 1, '2023-06-19', 'Temprano'),
(10, 11, 1, '2023-06-19', 'Temprano'),
(11, 12, 1, '2023-06-19', 'Temprano'),
(12, 13, 1, '2023-06-19', 'Temprano'),
(13, 14, 1, '2023-06-19', 'Temprano'),
(14, 15, 1, '2023-06-19', 'Falta'),
(15, 16, 1, '2023-06-19', 'Temprano'),
(16, 17, 1, '2023-06-19', 'Temprano'),
(17, 18, 1, '2023-06-19', 'Temprano'),
(18, 19, 1, '2023-06-19', 'Temprano'),
(19, 20, 1, '2023-06-19', 'Temprano'),
(20, 21, 1, '2023-06-19', 'Temprano'),
(27, 2, 1, '2023-06-21', 'Temprano'),
(28, 3, 1, '2023-06-21', 'Temprano'),
(29, 4, 1, '2023-06-21', 'Temprano'),
(30, 5, 1, '2023-06-21', 'Temprano'),
(31, 6, 1, '2023-06-21', 'Temprano'),
(32, 7, 1, '2023-06-21', 'Temprano'),
(33, 8, 1, '2023-06-21', 'Temprano'),
(34, 9, 1, '2023-06-21', 'Temprano'),
(35, 10, 1, '2023-06-21', 'Temprano'),
(36, 11, 1, '2023-06-21', 'Temprano'),
(37, 12, 1, '2023-06-21', 'Temprano'),
(38, 13, 1, '2023-06-21', 'Temprano'),
(39, 14, 1, '2023-06-21', 'Temprano'),
(40, 15, 1, '2023-06-21', 'Temprano'),
(41, 16, 1, '2023-06-21', 'Temprano'),
(42, 17, 1, '2023-06-21', 'Temprano'),
(43, 18, 1, '2023-06-21', 'Temprano'),
(44, 19, 1, '2023-06-21', 'Temprano'),
(45, 20, 1, '2023-06-21', 'Temprano'),
(46, 21, 1, '2023-06-21', 'Temprano'),
(53, 2, 1, '2023-06-23', 'Temprano'),
(54, 3, 1, '2023-06-23', 'Tarde'),
(55, 4, 1, '2023-06-23', 'Temprano'),
(56, 5, 1, '2023-06-23', 'Temprano'),
(57, 6, 1, '2023-06-23', 'Temprano'),
(58, 7, 1, '2023-06-23', 'Temprano'),
(59, 8, 1, '2023-06-23', 'Temprano'),
(60, 9, 1, '2023-06-23', 'Temprano'),
(61, 10, 1, '2023-06-23', 'Temprano'),
(62, 11, 1, '2023-06-23', 'Temprano'),
(63, 12, 1, '2023-06-23', 'Temprano'),
(64, 13, 1, '2023-06-23', 'Temprano'),
(65, 14, 1, '2023-06-23', 'Temprano'),
(66, 15, 1, '2023-06-23', 'Temprano'),
(67, 16, 1, '2023-06-23', 'Temprano'),
(68, 17, 1, '2023-06-23', 'Temprano'),
(69, 18, 1, '2023-06-23', 'Temprano'),
(70, 19, 1, '2023-06-23', 'Temprano'),
(71, 20, 1, '2023-06-23', 'Temprano'),
(72, 21, 1, '2023-06-23', 'Temprano'),
(79, 2, 1, '2023-06-26', 'Temprano'),
(80, 3, 1, '2023-06-26', 'Temprano'),
(81, 4, 1, '2023-06-26', 'Temprano'),
(82, 5, 1, '2023-06-26', 'Temprano'),
(83, 6, 1, '2023-06-26', 'Temprano'),
(84, 7, 1, '2023-06-26', 'Temprano'),
(85, 8, 1, '2023-06-26', 'Temprano'),
(86, 9, 1, '2023-06-26', 'Temprano'),
(87, 10, 1, '2023-06-26', 'Temprano'),
(88, 11, 1, '2023-06-26', 'Temprano'),
(89, 12, 1, '2023-06-26', 'Temprano'),
(90, 13, 1, '2023-06-26', 'Temprano'),
(91, 14, 1, '2023-06-26', 'Temprano'),
(92, 15, 1, '2023-06-26', 'Temprano'),
(93, 16, 1, '2023-06-26', 'Temprano'),
(94, 17, 1, '2023-06-26', 'Temprano'),
(95, 18, 1, '2023-06-26', 'Temprano'),
(96, 19, 1, '2023-06-26', 'Temprano'),
(97, 20, 1, '2023-06-26', 'Temprano'),
(98, 21, 1, '2023-06-26', 'Temprano'),
(105, 2, 1, '2023-06-28', 'Temprano'),
(106, 3, 1, '2023-06-28', 'Temprano'),
(107, 4, 1, '2023-06-28', 'Tarde'),
(108, 5, 1, '2023-06-28', 'Temprano'),
(109, 6, 1, '2023-06-28', 'Tarde'),
(110, 7, 1, '2023-06-28', 'Temprano'),
(111, 8, 1, '2023-06-28', 'Temprano'),
(112, 9, 1, '2023-06-28', 'Temprano'),
(113, 10, 1, '2023-06-28', 'Temprano'),
(114, 11, 1, '2023-06-28', 'Temprano'),
(115, 12, 1, '2023-06-28', 'Tarde'),
(116, 13, 1, '2023-06-28', 'Temprano'),
(117, 14, 1, '2023-06-28', 'Temprano'),
(118, 15, 1, '2023-06-28', 'Falta'),
(119, 16, 1, '2023-06-28', 'Temprano'),
(120, 17, 1, '2023-06-28', 'Tarde'),
(121, 18, 1, '2023-06-28', 'Temprano'),
(122, 19, 1, '2023-06-28', 'Temprano'),
(123, 20, 1, '2023-06-28', 'Temprano'),
(124, 21, 1, '2023-06-28', 'Temprano'),
(131, 2, 1, '2023-06-30', 'Temprano'),
(132, 3, 1, '2023-06-30', 'Temprano'),
(133, 4, 1, '2023-06-30', 'Temprano'),
(134, 5, 1, '2023-06-30', 'Temprano'),
(135, 6, 1, '2023-06-30', 'Tarde'),
(136, 7, 1, '2023-06-30', 'Temprano'),
(137, 8, 1, '2023-06-30', 'Temprano'),
(138, 9, 1, '2023-06-30', 'Temprano'),
(139, 10, 1, '2023-06-30', 'Temprano'),
(140, 11, 1, '2023-06-30', 'Temprano'),
(141, 12, 1, '2023-06-30', 'Temprano'),
(142, 13, 1, '2023-06-30', 'Tarde'),
(143, 14, 1, '2023-06-30', 'Tarde'),
(144, 15, 1, '2023-06-30', 'Temprano'),
(145, 16, 1, '2023-06-30', 'Temprano'),
(146, 17, 1, '2023-06-30', 'Temprano'),
(147, 18, 1, '2023-06-30', 'Temprano'),
(148, 19, 1, '2023-06-30', 'Tarde'),
(149, 20, 1, '2023-06-30', 'Temprano'),
(150, 21, 1, '2023-06-30', 'Temprano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id` int(11) NOT NULL,
  `curso_codigo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `usuario_encargado` int(11) DEFAULT NULL,
  `grado_id` int(11) DEFAULT NULL,
  `seccion_id` int(11) DEFAULT NULL,
  `url_imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id`, `curso_codigo`, `nombre`, `usuario_encargado`, `grado_id`, `seccion_id`, `url_imagen`) VALUES
(1, 'COM001', 'COMUNICACIÓN', 1, 5, 1, 'https://img.freepik.com/foto-gratis/discutir-aplicacion-movil_1098-18640.jpg?w=900&t=st=1688087191~exp=1688087791~hmac=871ab80a0da81c588f21c1803e5c82ff1b5e25046939a14cc3e24b2cfa506639');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_alumno`
--

CREATE TABLE `curso_alumno` (
  `id` int(11) NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso_alumno`
--

INSERT INTO `curso_alumno` (`id`, `curso_id`, `usuario_id`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 4),
(4, 1, 5),
(5, 1, 6),
(6, 1, 7),
(7, 1, 8),
(8, 1, 9),
(9, 1, 10),
(10, 1, 11),
(11, 1, 12),
(12, 1, 13),
(13, 1, 14),
(14, 1, 15),
(15, 1, 16),
(16, 1, 17),
(17, 1, 18),
(18, 1, 19),
(19, 1, 20),
(20, 1, 21),
(21, 1, 22),
(22, 1, 23),
(23, 1, 24),
(24, 1, 25),
(25, 1, 26),
(26, 1, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega_tarea`
--

CREATE TABLE `entrega_tarea` (
  `id` int(11) NOT NULL,
  `retroalimentacion` text DEFAULT NULL,
  `url_trabajo` varchar(255) DEFAULT NULL,
  `nota` int(11) DEFAULT NULL,
  `id_tarea` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrega_tarea`
--

INSERT INTO `entrega_tarea` (`id`, `retroalimentacion`, `url_trabajo`, `nota`, `id_tarea`, `id_usuario`) VALUES
(1, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '20.pdf', 20, 1, 21),
(2, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '1.png', 18, 1, 2),
(3, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '2.png', 18, 1, 3),
(4, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '13.pdf', 20, 1, 4),
(5, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '10.png', 15, 1, 5),
(6, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '14.pdf', 18, 1, 6),
(7, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '15.pdf', 16, 1, 7),
(8, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '9.png', 18, 1, 8),
(9, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '16.pdf', 16, 1, 9),
(10, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '8.png', 20, 1, 10),
(11, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '17.pdf', 15, 1, 11),
(12, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '7.png', 18, 1, 12),
(13, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '18.pdf', 16, 1, 13),
(14, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '4.png', 19, 1, 14),
(15, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '19.pdf', 20, 1, 15),
(16, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '6.png', 16, 1, 16),
(17, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '5.png', 17, 1, 17),
(18, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '11.png', 19, 1, 18),
(19, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '12.png', 19, 1, 19),
(20, '¡Excelente trabajo en la tarea de pronombres personales! Tus oraciones demuestran un buen dominio de los diferentes tipos de pronombres.', '3.png', 18, 1, 20),
(21, '¡Excelente trabajo en la tarea de verbos! Idenficaste correctamente todos los verbos la lectura.', '1_t2.pdf', 18, 2, 2),
(22, '¡Excelente trabajo en la tarea de verbos! Idenficaste correctamente todos los verbos la lectura.', '10_t2.pdf', 15, 2, 3),
(23, '¡Excelente trabajo en la tarea de verbos! Idenficaste correctamente todos los verbos la lectura.', '11_t2.pdf', 19, 2, 4),
(24, '¡Excelente trabajo en la tarea de verbos! Idenficaste correctamente todos los verbos la lectura.', '9_t2.pdf', 16, 2, 5),
(25, '¡Excelente trabajo en la tarea de verbos! Idenficaste correctamente todos los verbos la lectura.', '12_t2.pdf', 13, 2, 21),
(26, '¡Excelente trabajo en la tarea de verbos! Idenficaste correctamente todos los verbos la lectura.', '8_t2.pdf', 20, 2, 6),
(27, '¡Excelente trabajo en la tarea de verbos! Idenficaste correctamente todos los verbos la lectura.', '13_t2.pdf', 20, 2, 7),
(28, '¡Excelente trabajo en la tarea de verbos! Idenficaste correctamente todos los verbos la lectura.', '7_t2.pdf', 15, 2, 8),
(29, '¡Excelente trabajo en la tarea de verbos! Idenficaste correctamente todos los verbos la lectura.', '14_t2.pdf', 18, 2, 9),
(30, '¡Excelente trabajo en la tarea de verbos! Idenficaste correctamente todos los verbos la lectura.', '6_t2.pdf', 12, 2, 10),
(31, '¡Excelente trabajo en la tarea de verbos! Idenficaste correctamente todos los verbos la lectura.', '15_t2.pdf', 19, 2, 11),
(32, '¡Excelente trabajo en la tarea de verbos! Idenficaste correctamente todos los verbos la lectura.', '5_t2.pdf', 18, 2, 12),
(33, '¡Excelente trabajo en la tarea de verbos! Idenficaste correctamente todos los verbos la lectura.', '16_t2.pdf', 16, 2, 13),
(34, '¡Excelente trabajo en la tarea de verbos! Idenficaste correctamente todos los verbos la lectura.', '17_t2.pdf', 19, 2, 14),
(35, '¡Excelente trabajo en la tarea de verbos! Idenficaste correctamente todos los verbos la lectura.', '4_t2.pdf', 16, 2, 15),
(36, NULL, '18_t2.pdf', NULL, 2, 16),
(37, NULL, '3_t2.pdf', NULL, 2, 17),
(38, NULL, '19_t2.pdf', NULL, 2, 18),
(39, NULL, '20_t2.pdf', NULL, 2, 19),
(40, NULL, '2_t2.pdf', NULL, 2, 20),
(41, NULL, '1_t3.png', NULL, 3, 5),
(42, NULL, '2_t3.png', NULL, 3, 16),
(43, NULL, '3_t3.png', NULL, 3, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `nombre`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE `examen` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `examen`
--

INSERT INTO `examen` (`id`, `nombre`, `descripcion`, `estado_id`) VALUES
(1, 'Pronombres', 'Exámen de refuerzo sobre los pronombres', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen_pregunta`
--

CREATE TABLE `examen_pregunta` (
  `id` int(11) NOT NULL,
  `examen_id` int(11) DEFAULT NULL,
  `pregunta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`id`, `nombre`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `retroalimentacion` text DEFAULT NULL,
  `puntaje` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `nombre`, `retroalimentacion`, `puntaje`) VALUES
(1, '¿Cuál es el pronombre personal en tercera persona del singular, neutro y sujeto?', 'El pronombre personal en tercera persona del singular, neutro y sujeto es \"ello\".', 1),
(2, '¿Cuál es el pronombre posesivo en segunda persona del plural?', 'el pronombre posesivo en segunda persona del plural es \"vuestro\".', 1),
(3, '¿Cuál es el pronombre relativo que se refiere a una cosa o situación?', 'El pronombre relativo que se refiere a una cosa o situación es \"lo cual\".', 1),
(4, '¿Cuál es el pronombre personal en primera persona del plural y complemento indirecto?', 'El pronombre personal en primera persona del plural y complemento indirecto es \"nos\".', 1),
(5, '¿Cuál es el pronombre demostrativo en tercera persona del singular y neutro?', 'El pronombre demostrativo en tercera persona del singular y neutro es \"eso\".', 1),
(6, '¿Cuál es el pronombre personal en segunda persona del singular y sujeto?', 'El pronombre personal en segunda persona del singular y sujeto es \"tú\".', 1),
(7, '¿Cuál es el pronombre posesivo en tercera persona del plural?', 'El pronombre posesivo en tercera persona del plural es \"suyo\".', 1),
(8, '¿Cuál es el pronombre interrogativo que se utiliza para preguntar por el sujeto de la oración?', 'El pronombre interrogativo que se utiliza para preguntar por el sujeto de la oración es \"quién\".', 1),
(9, '¿Cuál es el pronombre personal en segunda persona del singular y objeto directo?', 'El pronombre personal en segunda persona del singular y objeto directo es \"te\".', 1),
(10, '¿Cuál es el pronombre relativo que se utiliza para referirse a personas y puede funcionar como sujeto u objeto?', 'El pronombre relativo que se utiliza para referirse a personas y puede funcionar como sujeto u objeto es \"quien\".', 1),
(11, '¿Cuál es el verbo en la siguiente oración: \"Juan corre todos los días en el parque\"?', '\"Corre\" es el verbo en esta oración, ya que expresa la acción que realiza Juan.', 1),
(12, '¿Cuál es el tiempo verbal del verbo en la oración: \"Mañana estudiaré para el examen\"?', '\"Estudiaré\" es el verbo en futuro en esta oración, indicando una acción que ocurrirá en el futuro.', 1),
(13, '¿Cuál es el verbo en la oración: \"El perro ladra fuerte en la noche\"?', '\"Ladra\" es el verbo en esta oración, ya que expresa la acción que realiza el perro.', 1),
(14, '¿Cuál es el verbo en la oración: \"Ella baila con gracia en el escenario\"?', '\"Baila\" es el verbo en esta oración, ya que expresa la acción que realiza ella.', 1),
(15, '¿Cuál es el verbo en la oración: \"Nosotros caminamos por el parque todos los días\"?', '\"Caminamos\" es el verbo en esta oración, ya que expresa la acción que realizamos nosotros.', 1),
(16, '¿Cuál es el verbo en la oración: \"El viento sopla suavemente entre los árboles\"?', '\"Sopla\" es el verbo en esta oración, ya que expresa la acción que realiza el viento.', 1),
(17, '¿Cuál es el verbo en la oración: \"El niño juega felizmente en el parque\"?', '\"Juega\" es el verbo en esta oración, ya que expresa la acción que realiza el niño.', 1),
(18, '¿Cuál es el verbo en la oración: \"El profesor explica la lección detalladamente\"?', '\"Explica\" es el verbo en esta oración, ya que expresa la acción que realiza el profesor.', 1),
(19, '¿Cuál es el verbo en la oración: \"El equipo ganó el partido con facilidad\"?', '\"Ganó\" es el verbo en esta oración, ya que expresa la acción que realizó el equipo.', 1),
(20, '¿Cuál es el verbo en la oración: \"Ella canta hermosamente en el escenario\"?', '\"Canta\" es el verbo en esta oración, ya que expresa la acción que realiza ella.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_actividad`
--

CREATE TABLE `registro_actividad` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `id_aplicacion` varchar(255) DEFAULT NULL,
  `tiempo_inicio` datetime DEFAULT NULL,
  `tiempo_fin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado_examen`
--

CREATE TABLE `resultado_examen` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `examen_id` int(11) DEFAULT NULL,
  `nota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `resultado_examen`
--

INSERT INTO `resultado_examen` (`id`, `usuario_id`, `examen_id`, `nota`) VALUES
(1, 2, 1, 16),
(2, 3, 1, 10),
(3, 4, 1, 12),
(4, 5, 1, 10),
(5, 6, 1, 12),
(6, 7, 1, 12),
(7, 8, 1, 10),
(8, 9, 1, 12),
(9, 10, 1, 12),
(10, 11, 1, 16),
(11, 12, 1, 14),
(12, 13, 1, 10),
(13, 14, 1, 10),
(14, 15, 1, 14),
(15, 16, 1, 12),
(16, 17, 1, 12),
(17, 18, 1, 10),
(18, 19, 1, 14),
(19, 20, 1, 10),
(20, 21, 1, 6),
(21, 2, 1, 20),
(22, 3, 1, 18),
(23, 4, 1, 16),
(24, 5, 1, 16),
(25, 6, 1, 18),
(26, 7, 1, 18),
(27, 8, 1, 16),
(28, 9, 1, 16),
(29, 10, 1, 18),
(30, 11, 1, 20),
(31, 12, 1, 18),
(32, 13, 1, 16),
(33, 14, 1, 18),
(34, 15, 1, 18),
(35, 16, 1, 18),
(36, 17, 1, 18),
(37, 18, 1, 18),
(38, 19, 1, 20),
(39, 20, 1, 16),
(40, 21, 1, 14),
(41, 2, 1, 20),
(42, 3, 1, 20),
(43, 4, 1, 18),
(44, 5, 1, 18),
(45, 6, 1, 20),
(46, 7, 1, 20),
(47, 8, 1, 18),
(48, 9, 1, 18),
(49, 10, 1, 20),
(50, 11, 1, 20),
(51, 12, 1, 18),
(52, 13, 1, 20),
(53, 14, 1, 20),
(54, 15, 1, 18),
(55, 16, 1, 20),
(56, 17, 1, 18),
(57, 18, 1, 20),
(58, 19, 1, 20),
(59, 20, 1, 20),
(60, 21, 1, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'Docente'),
(2, 'Estudiante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id`, `nombre`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE `tarea` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_limite` date DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarea`
--

INSERT INTO `tarea` (`id`, `titulo`, `descripcion`, `fecha_limite`, `estado_id`, `curso_id`) VALUES
(1, 'El Pronombre', 'Elabora una construcción sintáctica para cada tipo de pronombre (Personal - Posesivo - Demostrativo - Relativo - Numeral)', '2023-06-21', 1, 1),
(2, 'El Verbo', 'Identificar todos los verbos en la lectura ¨El desaliento de Arjuna¨ del Libro de Actividades de Literatura – página 6 . Clasificas los verbos por su tipo.', '2023-06-28', 1, 1),
(3, 'El Adverbio', 'Del libro. Pag60 idenfique los adverbios y su clasificación.', '2023-07-07', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombres`, `apellidos`, `dni`, `password`, `rol`) VALUES
(1, 'DANIEL ANTHONY', 'POMA CHIHUAN', '48575353', '$2y$10$URZgI/Q0Vym73lPpWEZwPeK6eMCxgSW.yYMqVokvsd7xv5dHlkKZu', 1),
(2, 'Yandel Piero', 'ORELLANA GOMEZ', '60933009', '$2y$10$5nENopV87nmNZPyq7ek.9.scXtT0IdTuR1EV1.raB69dlGIPXebii', 2),
(3, 'Jhim', 'HILARION LAZO', '60302366', '$2y$10$YRyYLOqxL4Z3tebBspnG0OadVJ94iQ2iCiBphPqBfC28fQCj8LY5i', 2),
(4, 'Patrick', 'CONTRERAS BEJARANO', '70595278', '$2y$10$vcyIyCY0PVqDkZdyULEKRuA92bI2s4ZdpIuiiW1klwTjNy7kUAeAu', 2),
(5, 'Leonel Fernando', 'GARCIA ESTRELLA', '60933006', '$2y$10$98kfaSrKTsGHQhAptKeFqudg9Hf8zKEMMR/rtkfu9J5QI6p8KG6qC', 2),
(6, 'Brighit Andrea', 'HUAMAN CELESTINO', '60761571', '$2y$10$W0Kc0u02UorRBkZPRPwVQ.oREfj3Gx8nHCGXOeokUqa0XTlNP.fq2', 2),
(7, 'Bruno Dayel', 'LOBATO BELTRAN', '76575445', '$2y$10$L1urpXifChwYGZenpCdr7eLb1gv7mnHVWUW3RauK2nEyptfe1SS8W', 2),
(8, 'Ariana Carolina', 'PAUCAR RAMIREZ', '60982169', '$2y$10$ca21xL9SVN9OGv5krvJGkuOEzEv/iV/mEF6G1ma5D9IdwQRj7Kqji', 2),
(9, 'Juan Diego', 'RAMIREZ QUILLATUPA', '60829685', '$2y$10$yeS1q32I1CPadyPTw81XmefsVjqLUSUvV7SMr3iAWyeVaLIrC.Rgu', 2),
(10, 'Eduardo Sebastian', 'ROJAS RIVAS', '60829379', '$2y$10$.xcQgo6RCFuLFcVk6qaFP.LO2BfGUxeGehJM/nL0HUgI3O2j0whmy', 2),
(11, 'Samira Tracy Abigaild', 'SARAVIA CHUCOS', '75190388', '$2y$10$5hf9NSg15I2xAHvzbJJvyOGNUQTB4XsC1UrXCOnBqy6vGrtZ1Zr5a', 2),
(12, 'Harol Jeanpier', 'SULCA SANTANA', '60981390', '$2y$10$DN7BXgxwW28Ojle/I9pMLOBIUv9/v7zLPTYQebr3FFqZERmlBgeHO', 2),
(13, 'Sebastian Antonio', 'TRUJILLO MARTINEZ', '61012334', '$2y$10$9JQyNqmwiyHjcIXR8cnrhuX5TbcUhWcQSGMRJPPeQmrSzLOxY9M16', 2),
(14, 'Tamara Samanta', 'CERNA RODRIGUEZ', '71837987', '$2y$10$z7VCm7ckQkV48p6UrfOUDeDRjVriAdbaFFThRdzxZd8EJ5VCw9f0O', 2),
(15, 'Estefano Paolo', 'CHAVEZ ALVARADO', '73892520', '$2y$10$2s3QetW0U5eH9Hrpnw7OPuG9obYRMfjnfl2fIOh.bv4QL.z/VBMZi', 2),
(16, 'Deysi Shaline', 'GAMARRA OLIVEIRA', '61121021', '$2y$10$2PfH3oAMkhwo.CEMdSZ77.ItB/EkD7hJtXPh8Bz37kZSt/TX2wQlq', 2),
(17, 'Sayuri Akeni', 'HUAROC ALIAGA', '74206427', '$2y$10$NL8GRT1nBHo80bbTtNY9pOAdVpG7VG7sz5LZo5K.2i3Zm6Wd0isdq', 2),
(18, 'Camila Nicole', 'PAUCAR RAMIREZ', '77214915', '$2y$10$O0s0adotw9ZBfgXHNSdQK.DsSAQV2hPBi91tdiyBEHAtKRUQFIidi', 2),
(19, 'Hugo Sebastian', 'RONCHI BUSTAMANTE', '72721126', '$2y$10$Y5tIiKX6tSL7vlR1NUGf.e5X3ZH29NbGoqU.yhX6U4gDbH96pd6dq', 2),
(20, 'Tai Aida', 'TAIPE QUILCA', '77353860', '$2y$10$eOM2UddkaFr/bnTC5aXyVuY8g5dynI9Ab19jPGSRcvW4iMrznaz66', 2),
(21, 'Adrian Salvador Antonio', 'MENDOZA MEZA', '72497062', '$2y$10$tlhbSdDkV0CgoTHB17vLAOAhYtC.UxQTLoRyge2gYwLiHjV4aFNwC', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alternativa`
--
ALTER TABLE `alternativa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pregunta_id` (`pregunta_id`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `curso_id` (`curso_id`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_encargado` (`usuario_encargado`),
  ADD KEY `grado_id` (`grado_id`),
  ADD KEY `seccion_id` (`seccion_id`);

--
-- Indices de la tabla `curso_alumno`
--
ALTER TABLE `curso_alumno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `curso_id` (`curso_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `entrega_tarea`
--
ALTER TABLE `entrega_tarea`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tarea` (`id_tarea`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estado_id` (`estado_id`);

--
-- Indices de la tabla `examen_pregunta`
--
ALTER TABLE `examen_pregunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examen_id` (`examen_id`),
  ADD KEY `pregunta_id` (`pregunta_id`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registro_actividad`
--
ALTER TABLE `registro_actividad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `resultado_examen`
--
ALTER TABLE `resultado_examen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `examen_id` (`examen_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`id`),
  ADD KEY `curso_id` (`curso_id`),
  ADD KEY `estado_id` (`estado_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rol` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alternativa`
--
ALTER TABLE `alternativa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `curso_alumno`
--
ALTER TABLE `curso_alumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `entrega_tarea`
--
ALTER TABLE `entrega_tarea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `examen_pregunta`
--
ALTER TABLE `examen_pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `registro_actividad`
--
ALTER TABLE `registro_actividad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resultado_examen`
--
ALTER TABLE `resultado_examen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `seccion`
--
ALTER TABLE `seccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tarea`
--
ALTER TABLE `tarea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alternativa`
--
ALTER TABLE `alternativa`
  ADD CONSTRAINT `alternativa_ibfk_1` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`);

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `asistencia_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`);

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`usuario_encargado`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `curso_ibfk_2` FOREIGN KEY (`grado_id`) REFERENCES `grado` (`id`),
  ADD CONSTRAINT `curso_ibfk_3` FOREIGN KEY (`seccion_id`) REFERENCES `seccion` (`id`);

--
-- Filtros para la tabla `curso_alumno`
--
ALTER TABLE `curso_alumno`
  ADD CONSTRAINT `curso_alumno_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`),
  ADD CONSTRAINT `curso_alumno_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `entrega_tarea`
--
ALTER TABLE `entrega_tarea`
  ADD CONSTRAINT `entrega_tarea_ibfk_1` FOREIGN KEY (`id_tarea`) REFERENCES `tarea` (`id`),
  ADD CONSTRAINT `entrega_tarea_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `examen`
--
ALTER TABLE `examen`
  ADD CONSTRAINT `examen_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`);

--
-- Filtros para la tabla `examen_pregunta`
--
ALTER TABLE `examen_pregunta`
  ADD CONSTRAINT `examen_pregunta_ibfk_1` FOREIGN KEY (`examen_id`) REFERENCES `examen` (`id`),
  ADD CONSTRAINT `examen_pregunta_ibfk_2` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`);

--
-- Filtros para la tabla `registro_actividad`
--
ALTER TABLE `registro_actividad`
  ADD CONSTRAINT `registro_actividad_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `resultado_examen`
--
ALTER TABLE `resultado_examen`
  ADD CONSTRAINT `resultado_examen_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `resultado_examen_ibfk_2` FOREIGN KEY (`examen_id`) REFERENCES `examen` (`id`);

--
-- Filtros para la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD CONSTRAINT `tarea_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`),
  ADD CONSTRAINT `tarea_ibfk_2` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
