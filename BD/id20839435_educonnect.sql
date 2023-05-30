-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 30-05-2023 a las 22:24:27
-- Versión del servidor: 10.5.20-MariaDB
-- Versión de PHP: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id20839435_educonnect`
--

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
(1, 'Una profesión que se dedica a informar sobre noticias y eventos', 1, 1),
(2, 'Una forma de contar historias', 1, 0),
(3, 'Una forma de entretenimiento', 1, 0),
(4, 'Una herramienta de marketing', 1, 0),
(5, '1', 2, 1),
(6, '2', 2, 0),
(7, '3', 2, 0),
(8, '4', 2, 0),
(9, 'a', 3, 1),
(10, 'b', 3, 0),
(11, 'c', 3, 0),
(12, 'd', 3, 0);

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
(1, 3, 1, '2023-05-28', 'Temprano'),
(2, 3, 2, '2023-06-02', 'Tarde'),
(3, 4, 2, '2023-06-02', 'Falta'),
(4, 4, 3, '2023-06-07', 'Temprano');

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
(1, 'C001', 'Matemáticas', 1, 1, 1, 'https://img.freepik.com/vector-gratis/diseno-dibujado-mano-patrones-regreso-escuela_23-2148596322.jpg?w=900&t=st=1684894438~exp=1684895038~hmac=e3be34978b8a9cb8941f6e29f28698fabc2a1c38116f74cfd0b1db328f7c7426'),
(2, 'C002', 'Ciencias', 1, 2, 2, 'https://img.freepik.com/vector-gratis/dibujado-mano-colorido-fondo-educacion-cientifica_23-2148489231.jpg?w=900&t=st=1684894462~exp=1684895062~hmac=4d852774d930c6879d5644174b2b5491f3daf977b44e4db62060eff11331ac0e'),
(3, 'C003', 'Historia', 2, 3, 3, 'https://img.freepik.com/foto-gratis/antiguo-estante-biblico-madera-lleno-sabiduria-generada-ia_188544-28030.jpg?w=996&t=st=1684894503~exp=1684895103~hmac=a94899e2d46a663fcff9d411d15f48659a3fb055cd4765c6cebd407dea8e1775');

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
(1, 1, 3),
(2, 1, 4),
(3, 2, 3),
(4, 3, 4),
(5, 1, 5);

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
(1, '123123123123123123Buena presentación, falta un ejercicio', 'https://venngage-wordpress-es.s3.amazonaws.com/uploads/2022/05/Como-hacer-una-infografia-en-5-pasos-Guia-Infografia.png', 14, 1, 3),
(2, 'Muy bien investigado', 'https://blog.hubspot.es/hubfs/media/comohacerunainfografiaejemplodesplieguedeconceptos.jpeg', 20, 2, 3),
(3, NULL, 'https://eu-central-1.linodeobjects.com/cuadernosdeseguridad/2022/12/analisis-de-riesgo-infografia.jpg', NULL, 1, 4),
(4, 'ya es tarde ya para decir perdón si nuestro amor murió yo no sé por qué', 'https://www.eapn.es/ARCHIVO/fotografias/documentos/1643804141_infografia_ss_v4-002-page-1-snapshot.jpg', 20, 1, 5),
(5, 'estamos mandando una retroalimentación para esta tarea con la finalidad de poder visualizar la retroalimentación en Sí en la aplicación del estudiante', 'https://c9n8c2u8.rocketcdn.me/wp-content/uploads/2020/03/Free-Night-Club-Flyer-81.jpg', 16, 19, 5),
(6, NULL, 'https://cuaieed.unam.mx/campus-virtual/descargas/Manual-Google-Classroom.pdf', NULL, 12, 5);

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
(1, 'Examen 1', 'Examen de Matemáticas', 1),
(2, 'Examen 2', 'Examen de Ciencias', 1),
(3, 'Examen 3', 'Examen de Historia', 1);

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
(3, '3');

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
(1, '¿Qué es el periodismo?', 'El periodismo es una profesión que se enfoca en recolectar, investigar y presentar información objetiva', 1),
(2, '¿Cuál es la función principal de los medios de comunicación?', 'retro', 1),
(3, 'Cuál es el medio de comunicación más antiguo', 'retro2', 1);

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

--
-- Volcado de datos para la tabla `registro_actividad`
--

INSERT INTO `registro_actividad` (`id`, `usuario_id`, `id_aplicacion`, `tiempo_inicio`, `tiempo_fin`) VALUES
(1, 3, 'App1', '2023-05-30 09:00:00', '2023-05-30 10:30:00'),
(2, 3, 'App2', '2023-05-31 14:00:00', '2023-05-31 16:00:00'),
(3, 4, 'App1', '2023-06-01 10:00:00', '2023-06-01 11:30:00'),
(4, 4, 'App3', '2023-06-03 15:00:00', '2023-06-03 17:30:00');

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
(1, 3, 1, 7),
(2, 3, 2, 8),
(3, 4, 2, 6),
(4, 4, 3, 9);

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
(1, 'Tarea 1', 'Realizar ejercicios del capítulo 3', '2023-05-30', 2, 1),
(2, 'Tarea 2', 'Investigar sobre el sistema solar', '2023-06-05', 2, 2),
(3, 'Tarea 3', 'Leer el capítulo 5 del libro de historia', '2023-06-10', 1, 3),
(4, 'Investigación de medios de comunicación', 'Estimados estudiantes la tarea para esta sema es investigar un medio de comunicación en particular, como una revista, un periódico o un canal de televisión, y escribir un informe sobre su historia, objetivos y audiencia.', '2023-05-31', 1, 1),
(10, 'prueba', 'prueba descripcion', '2023-05-26', 2, 1),
(11, 'agregando título nuevo', 'agregando descripción para la tarea nueva', '2023-05-31', 2, 2),
(12, '123', '123', '2023-05-27', 1, 1),
(13, '123asasdasd', 'asdasdasdasdasd', '2023-05-01', 2, 2),
(14, 'Viña del Mar', 'recorriendo el mar', '2023-06-07', 2, 2),
(15, 'aldbdhdjakaka\nandbxjsbsjakqksksa', 'jajsyshzusbsisbsisbakanabqjqbsvdvxjckxndkejeuwiwjwjsbzbxbxnxkdbekwbwlqowurjxndnsksjs', '2023-07-31', 2, 2),
(16, 'pruebaasdasdasd', 'prueba descripcionasdasdasdasd', '2023-05-26', 2, 2),
(18, 'hoy es sabado', 'vamos a termina la aplicación', '2023-05-31', 1, 2),
(19, '123456789', 'escríbeme una carta mi amor', '2023-05-01', 1, 1);

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
(1, 'Juan', 'Perez', '12345678', '$2y$10$oD9A8vWC6BVGSNLa4YXWq.xdUZGSOIRTRy3Y0OCJeGzBMQeVSdJJy', 1),
(2, 'Maria', 'Gomez', '98765432', '$2y$10$oD9A8vWC6BVGSNLa4YXWq.xdUZGSOIRTRy3Y0OCJeGzBMQeVSdJJy', 1),
(3, 'Pedro', 'Lopez', '56789012', '$2y$10$oD9A8vWC6BVGSNLa4YXWq.xdUZGSOIRTRy3Y0OCJeGzBMQeVSdJJy', 2),
(4, 'Ana', 'Torres', '34567890', '$2y$10$oD9A8vWC6BVGSNLa4YXWq.xdUZGSOIRTRy3Y0OCJeGzBMQeVSdJJy', 2),
(5, 'Miguel Angel', 'Acevedo Ponce', '73122365', '$2y$10$oD9A8vWC6BVGSNLa4YXWq.xdUZGSOIRTRy3Y0OCJeGzBMQeVSdJJy', 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `curso_alumno`
--
ALTER TABLE `curso_alumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `entrega_tarea`
--
ALTER TABLE `entrega_tarea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `examen_pregunta`
--
ALTER TABLE `examen_pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `registro_actividad`
--
ALTER TABLE `registro_actividad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `resultado_examen`
--
ALTER TABLE `resultado_examen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
