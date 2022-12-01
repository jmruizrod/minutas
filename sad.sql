-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-12-2018 a las 22:37:27
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.5.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id_actividad` int(11) NOT NULL,
  `actividades` longtext,
  `docente_dc_codigo` varchar(30) NOT NULL,
  `minutas_id_minutas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`id_actividad`, `actividades`, `docente_dc_codigo`, `minutas_id_minutas`) VALUES
(1, 'Hacer nada.', '1', 2),
(2, 'Hacer nada.', '1', 2),
(3, 'Nada.', '1', 3),
(9, '3', '1', 5),
(11, '2', '1', 5),
(12, 'Dar a conocer el total de recomendaciones atendida...', '8', 6),
(13, 'Presentar la plataforma colaborativa Trello para e...', '13', 6),
(14, 'Revisar las actividades que conformarán el plan de...', '8', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adicional`
--

CREATE TABLE `adicional` (
  `ad_cargo` varchar(280) NOT NULL,
  `ad_institucion` varchar(280) NOT NULL,
  `ad_inicio` date NOT NULL,
  `ad_fin` date NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativo`
--

CREATE TABLE `administrativo` (
  `a_cargo` varchar(140) NOT NULL,
  `a_funcion` text NOT NULL,
  `a_inicio` date NOT NULL,
  `a_fin` date NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesor`
--

CREATE TABLE `asesor` (
  `dc_codigo` varchar(30) NOT NULL,
  `idegresado` int(11) NOT NULL,
  `asesor` tinyint(1) NOT NULL DEFAULT '0',
  `fechaInicio` date NOT NULL,
  `fechaFin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carga_horaria`
--

CREATE TABLE `carga_horaria` (
  `cgh_periodo` varchar(40) NOT NULL,
  `cgh_dia` varchar(24) NOT NULL,
  `cgh_horario` varchar(20) NOT NULL,
  `grupo` varchar(20) NOT NULL,
  `cat_unid_apren_fk` int(10) UNSIGNED NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_actualizacion`
--

CREATE TABLE `cat_actualizacion` (
  `cta_id` int(10) UNSIGNED NOT NULL,
  `cta_nombre` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_area_aca`
--

CREATE TABLE `cat_area_aca` (
  `ctaa_id` int(10) UNSIGNED NOT NULL,
  `ctaa_nombre` varchar(160) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cat_area_aca`
--

INSERT INTO `cat_area_aca` (`ctaa_id`, `ctaa_nombre`, `created_at`, `updated_at`) VALUES
(8, 'Área A', '2018-10-24 06:00:00', '2018-10-24 06:00:00'),
(9, 'Área B', '2018-10-24 06:00:00', '2018-10-24 06:00:00'),
(10, 'Área C', '2018-10-24 06:00:00', '2018-10-24 06:00:00'),
(11, 'Área D', '2018-10-24 06:00:00', '2018-10-24 06:00:00'),
(12, 'Economico adminitrativo', '2018-12-06 07:00:00', '2018-12-06 07:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_comision`
--

CREATE TABLE `cat_comision` (
  `ctc_id` int(10) UNSIGNED NOT NULL,
  `ctc_nombre` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_direcciones`
--

CREATE TABLE `cat_direcciones` (
  `ctd_id` int(10) UNSIGNED NOT NULL,
  `ctd_nombre` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_grados`
--

CREATE TABLE `cat_grados` (
  `ctg_id` int(10) UNSIGNED NOT NULL,
  `ctg_nombre` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_impacto`
--

CREATE TABLE `cat_impacto` (
  `cti_id` int(10) UNSIGNED NOT NULL,
  `cti_nombre` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_mat_didac`
--

CREATE TABLE `cat_mat_didac` (
  `ctmd_id` int(10) UNSIGNED NOT NULL,
  `ctmd_nombre` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_productos`
--

CREATE TABLE `cat_productos` (
  `ctp_id` int(10) UNSIGNED NOT NULL,
  `ctp_nombre` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_prog_acad`
--

CREATE TABLE `cat_prog_acad` (
  `ctpa_id` int(10) UNSIGNED NOT NULL,
  `ctpa_nombre` varchar(120) NOT NULL,
  `cat_unid_acade_fk` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cat_prog_acad`
--

INSERT INTO `cat_prog_acad` (`ctpa_id`, `ctpa_nombre`, `cat_unid_acade_fk`, `created_at`, `updated_at`) VALUES
(56, 'Programa 1', 19, '2018-12-03 07:00:00', '2018-12-03 07:00:00'),
(57, 'Programa 2', 20, '2018-12-03 07:00:00', '2018-12-03 07:00:00'),
(58, 'Programa 3', 21, '2018-12-03 07:00:00', '2018-12-03 07:00:00'),
(59, 'Programa 4', 22, '2018-12-03 09:00:00', '2018-12-03 10:00:00'),
(60, 'Informática', 23, '2018-12-06 07:00:00', '2018-12-06 07:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_proy_tipo`
--

CREATE TABLE `cat_proy_tipo` (
  `ctpt_id` int(10) UNSIGNED NOT NULL,
  `ctpt_nombre` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_tipo_uap`
--

CREATE TABLE `cat_tipo_uap` (
  `cttua_id` int(10) UNSIGNED NOT NULL,
  `cttua_nombre` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_unid_acade`
--

CREATE TABLE `cat_unid_acade` (
  `ctua_id` int(10) UNSIGNED NOT NULL,
  `ctua_nombre` varchar(120) NOT NULL,
  `cat_area_fk` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cat_unid_acade`
--

INSERT INTO `cat_unid_acade` (`ctua_id`, `ctua_nombre`, `cat_area_fk`, `created_at`, `updated_at`) VALUES
(19, 'Unidad académica 1', 8, NULL, NULL),
(20, 'Unidad académica 2', 9, NULL, NULL),
(21, 'Unidad académica 3', 10, NULL, NULL),
(22, 'Unidad académica 4', 11, NULL, NULL),
(23, 'Economía', 12, '2018-12-06 07:00:00', '2018-12-06 07:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_unid_apren`
--

CREATE TABLE `cat_unid_apren` (
  `ctuap_id` int(10) UNSIGNED NOT NULL,
  `ctuap_nombre` varchar(280) NOT NULL,
  `cat_tipo_uap_fk` int(10) UNSIGNED NOT NULL,
  `cat_prog_acad_fk` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comision_cuerpos_colegiados`
--

CREATE TABLE `comision_cuerpos_colegiados` (
  `comision_id` int(11) NOT NULL,
  `c_nombre` varchar(280) NOT NULL,
  `c_funciones` text NOT NULL,
  `c_inicio` date NOT NULL,
  `c_fin` date NOT NULL,
  `cat_comision_fk` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cat_unid_acade_ctua_id` int(10) UNSIGNED NOT NULL,
  `cat_area_aca_ctaa_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comision_cuerpos_colegiados`
--

INSERT INTO `comision_cuerpos_colegiados` (`comision_id`, `c_nombre`, `c_funciones`, `c_inicio`, `c_fin`, `cat_comision_fk`, `created_at`, `updated_at`, `cat_unid_acade_ctua_id`, `cat_area_aca_ctaa_id`) VALUES
(3, 'Cuerpo colegiado A', 'Comer\r\nDormir\r\nTrabajar', '2018-11-22', '2018-11-22', NULL, NULL, '2018-12-03 23:48:17', 19, 8),
(4, 'Comisión de acreditación', 'Hacer cosas.', '2018-12-06', '2018-12-06', NULL, '2018-12-06 20:31:04', '2018-12-06 21:13:30', 23, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpo_acad`
--

CREATE TABLE `cuerpo_acad` (
  `ca_nombre` varchar(120) NOT NULL,
  `ca_clave` varchar(30) NOT NULL,
  `ca_integrantes` text NOT NULL,
  `ca_lgac` varchar(40) NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `dir_nombre` varchar(250) NOT NULL,
  `dir_alumno` varchar(250) NOT NULL,
  `dir_inicio` date NOT NULL,
  `dir_fin` date NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `cat_direcciones_fk` int(10) UNSIGNED NOT NULL,
  `cat_prog_acad_fk` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docencia`
--

CREATE TABLE `docencia` (
  `d_materia` varchar(140) NOT NULL,
  `d_inicio` date NOT NULL,
  `d_fin` date NOT NULL,
  `d_tics` tinyint(1) NOT NULL,
  `d_tecnologia` varchar(60) DEFAULT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `cat_grados_fk` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `dc_codigo` varchar(30) NOT NULL,
  `dc_paterno` varchar(30) NOT NULL,
  `dc_materno` varchar(30) NOT NULL,
  `dc_nombres` varchar(30) NOT NULL,
  `dc_nacimiento` date NOT NULL,
  `dc_nombramiento` varchar(30) NOT NULL,
  `dc_nivel` varchar(30) NOT NULL,
  `dc_categoria` varchar(30) NOT NULL,
  `dc_adscripcion` varchar(30) NOT NULL,
  `dc_foto` blob,
  `user` varchar(30) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `rol_user` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`dc_codigo`, `dc_paterno`, `dc_materno`, `dc_nombres`, `dc_nacimiento`, `dc_nombramiento`, `dc_nivel`, `dc_categoria`, `dc_adscripcion`, `dc_foto`, `user`, `password`, `created_at`, `updated_at`, `remember_token`, `rol_user`) VALUES
('1', 'Apellido paterno A', 'Apellido materno A', 'Norberto', '2018-10-24', 'Coordinador', 'Nivel A', 'Categoría A', 'Adscripión A', 0x89504e470d0a1a0a0000000d49484452000001000000010008060000005c72a866000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa864000077ba49444154785eedbd77bbec4691f87f5fd3ee77ffdbff7ecbb2b0b04b5c1b2792b3af73ce18130c0e38de9c73ce39e768fb3a471cc01830b6e125f4af3fdd2aa9ba55d2cc9c333367e672cff37c9ea3913a545757955aad9634cdffb9c9f2effffeefee1ffff8472b7ffffbdfcdfdc0b11c7d4ca7b5684bb375eb5677cf3df79872f783f9b367ba575f3c5d704a21fb2a0eefdfe3962f59e4962e5ae09678f80f2b962e763bb76e72678e1f31f3bd7a36fd2d75c7dfa7dc2b679bebec2bc811f07579a817527954dab0ade4f2fb4e1e3de40eeddde536ac59e5962e8c7a105d2c59383fec637bd58a65eec593c7aabc65595579e85eeaee37d80cb663d91488cd35d95ebe5fa717ac74f93eeb38e07396dc13c0dcd935dd387f37343594fd82753ca7ad9c410482d2383327d5867aeef449b769dd1a37d71bec9c992fb8d99e59339e77b367bce0e6ce9ce1e6f9fd0be6ce09c6bf6dd30677eeccc9aa9ca4dc58e6bffdebbfaabafdbe1000629a576a72f411cacea03e6441a698ae9225a429b669d341eff8bbb66d71cb162f0c6d9e336b46d001ba402f3077d64cb768c1bc22302e71470feeabca1354b9ba2ffa0136d266436dff85a6fcfda64f41c0dcd9356d5132c7529456a2f55bb6f33c7a5f13561ae4ed63f4f44688c12ba3cf3872606f38b3cd7ae13937e3b9679b79feb9e0008b7ddab5ab56b8974f9fc8caaaeab9eeea2bbdc3fd8b3aa6d3c4ed57fa4c5987727cd9461664aa6448f5f1cad9936effee9d6eab0f6e0be6cc0a6d35755080aee6cf9d5d8c0616badddbb726e545623d569f4c046cc2b265b1a1a6ffb26da18fe7e9f46f49d72bc86bb5a547cc9d5db16ddbb652986e1b9337be1bacbc79199246d376ac1f4180b35ee920ea2c0c678e1d711bd6ae0a4e6d19791333bd732c9a3fd78f18d6aaf2a4ecf89fa1ef75575f55ecb3d1cedb0f62b9851ccaf90159aa4ba1545638b477b75bbf7a8577ece7cd363781ee962c8897057b776e2fcb0b971ffe3fc8686832348d6273fbd2b6d4e9589ea61392b713797a7cd06a530f983b3ba29d5fe8d410117ea2e872f2ed3c9dded6e93493555edd09a3d133d45de6cf5c0c6f673c6f1b771b048185f3e686b3a676a8ca115bc0298b6d7192c99294af517509317d25f3c92307ddaa654b439bacb6b6e275870e09005c369c3d7154951da10facbee916cb8e35b90d69bbb26c4af64f06ab4cc13a3e493b3677b6c275522e0468e17241a571fdc2aaa7695b63ed9fe868404f0056ce722a0ce1b9de378dba4b7018260cab09be0239f316f5b621324d16abec1aa55c95ac2f9f39e1d6ae5c3631e757a04be604b884c8659ae844a075d6efc666dad2f493bc6c6b5b3389f92d7367235a7196304dfb0689ae47d79bd3767c220a8c4688b11706e91de0a553c783b14ed6e861deac99eec8fe3ddee095f34b5d1dd00edc0fac3a4c8a2080ccbbb76f096db0dad60be89279144601e99d81a87bab6fda683a8141aff63448acfadaf64df04466ee34e9366aea06c8f630c9e511f4312b6d2f138472fdaf0d11b8dee51a7e2243ff9cd9339e77db36ae2fcb2e034017812077e0c962d59190c986a32ef70e4b1bacb6f584d7253a25b01ed8c3651175449d235bb7f300f46d3ed197db416e131a493b4c74bd963cf9be09040173678d26e76f136eaa90fa7399843c6d4e374a4c67bd0be3f76c5ebf26cc60cfcc8cf885679f764f3ffe98fbedc3f7bb5fdc76937bf4a6e9eed777ddee9ef8c5cfdcb34f3de1d33c93a48799def0572c5d9494df8df343eec093c5aaa386926df7b62dfeda7d7e6843de2eda4a9b693b3a4017e804dda02374a5d3a3cb7057c007002656ab3aa3eee90bab8f349decb7c916408ee5e987892553d3b11e8380b9b386758b042c0164ff5463c994ef13f2639d2656ca09c030231d0d917bddcbfc75fb9c993312037ef6c9dfba5fdd759bbbe73bdf7677fc7fffe1eefb8fff74f77fe5abee9efff88abbfd2b5f71f75f7689fbed230fbae79f7e2ac9074c0696c3de26e7cff65b0edc0f741d9d6459bd6259903d6f0f6da4adb499b6a30374814ed00d3a4257e84ce743a704002657cf89ce8b3b2f9d2602f3893eddd7b9ad58362269a6925c2691cbdadfe3ed4173678256a0ae3417203f362ae4b2e5e874394dd134bd03100d91ebf5250b1724b7bb9e79e237ee67d75e1d8cfbb16ffc8f9bf9fd8bdcbc8b7ee0e65f7c49f8fffc77bfe77ef65f5f7377787e7ddf9d4910e0ccc7829923fbf7aaba0c67ccc81db75f587509faf8cba74e046745763d12a26db491b6d266daae75816ed011ba4267e84ef2a25374cb5cc0b183fb7d3d51e7d01400acb33eb4f5b746d28d025aa65c466bbb873b03e6ce927cc2241728478e8f1a96ac42db718e6ddebcb9a6976be512a0380bc1f6cd1bdde205f395c13fe97e7ed3f5c1a09ff9f677ddfc8b2e714b2eb9dc2dbde487258b7f70b99b7bd1c5eeb16f7ac3f74ef1db471ef079abcb01aea1f7efda51d6c199afd3d2dfdc71fb85555724ca2423a16387f6875b77e9f5ff33a16db491b6d266daae75816ed011ba4267e80e1d4a19e896207020dc1ef5f516baa72ff2fed9e2fbec1f0dfddaad4d8c2296ac601def7262dbdc59a20bec84167454d1b26ad9353afd175f7ce1fef8f147def8e6257ac1e8c41183537a562e5b1296f48ac13ef9cb47bcc1ff977bea5bdf760bfc594e1bbb66c925570487e0ac78ffa53f70cfa8e12fabe2583e2bf504a32f0c3f0601d98e588edb4f745d49fd855cc8c83a085634ead58fb489b6d146da4a9b2d5d00ba4267e80e1d4a19b25c7aef8e6da19ea0135f671e001825fce98f7f745ffabe0b41a0e84babaf411fd37d3faa68d93ba1f5d280b933d076bbc4c21276d4103973b9f5b620ceffd6ebafb8d75e3a93dc738e9380d10081452a4c7acd9d25d7ffcfb89fdf3cdd5fdffe673078cbd0358bfdd9ef85ef7ddfdde1af899f78f4e1d2e861abbe1390200e5838a1c772da7ed256b7b07ff70eb728bbfea74db48d36d2564b071a7486eed0a18c88d02d3a26208adea95f4f02d247f4d53b6fbc960401e953abcf35926e94b1e46ea28b5180b933601528e482e4428e3a5af61c8ee7ce2fc62d41400200fb381bf1d00a671e59facbf52e135dbffec637dda21f5c661a79ce7c7f1dcc84d82fefb8a5741cd8bc7ead3aebe7a44e68396d3f69aa574f0aeeddb9ad160068136da38d56db73d019ba4387322f1296067b1defd8b2c9cb22755701402fccb28280d5d7426e1fa34e2ebbfe9da37ddac0dcd9f1ec2f956aa1c611ab5d35e7c7b8958163683100c4df38c6e17d4c005601e0d9271f77f77cff7beec9fffd56eb7057b3e0e24bfd10f9ebee91e9d725cec39384a12e73e67d78ce2f5875977819f7edda5e0b00b489b6d146abed39e80cdda1437449191200766edd9cc8415f68e797fe4a82c0975f34f6f738236dc8dba5e9300a30779a0559e4028d23ba2d6dce1f869c0d67629ef5e7fa5402c0734f3de1eebbe822f7f8fffc6f4f01e0a1af7ecd3d7af38d95f33cffacdbb2a1e112a0904bc81d7550e83a73198049ba45f3e7258ba168136deb2500a03b74882e2903dda2635618e67506cacb02b6236910f8b2d6dfe38eb4a50dd2593e5e50df79c71db787882999adff02bfcf174ae77f2d1df68b7195065618997ef69e4b8010008a390016b33c7cd54fdc2fbefedf6e6197463fd70f8feffeffbee27ef3c03da5e3e044db366face4c8513258ce3a08acba3587f6ed0ecff4eb00409b681b6db4da9e83ced01d3a948541e896db8b5c62485d651fe8be29fa47d041e0ef4510385fc87d31ff0f7ffbec3377cbcd37d7fcbca0bef39dd75f757ffef44f6510d0e84aa5827142ce02097edfe75e497ff8f843effce7eace1f86ba957189a1c94c346978ea0de3ac26019f758f3d70b7bbeb3fbee2667fffa28ea300ae797ff7adefb83bbff10df7f4e3bf2ecbc089766cd95cc85160389ee5a88324af5fcbc47dfa3c00d026da461b3bcd89a02b7486eed0a194112601bd8ef572e0d007aa4f02aa5f04faf4ed375ef541e00f21d0d76c20309ec1a1cd37fff6d95fdd87bf7fdfbdf1ca4b353f2f4877f07287d75e3e5b050126508a423552c138f1f9dfbc937ff84138cbffc5b7ed2f7ffed4fdf94f9fb83f7cf4a17befed3783921a9d5f6830b2974ec78780640400dcfabaefe28bdca3fe4cc699af2908703f7ce6f7ffcfdded0dfee737dde0cf78bf2bcbc0896a2fc4c0d9b2206039e920d175e7f2f06ab3b01e420500da44db68236dcdd70008e8085da13374a76f89ca0880cbadaafea21f6afd225472d1b76fbd7ace7df4fe7bc1b63fffdbdf4230f8e2f3bf055bf8e40f1f071bb16c67d4b1fc533b3fedc7b7737ff7a43b6432e5b597cebab7fd75300e920781bcf2ce7c699f79870c6dc1005e7ff945f7e6ab2f7bceb9375f79d9ff3eeb5e2d1cbf66dc8176c312962d5e94040078fce70f85331fc3d939ff777172f6c3d8b926e6d6d803fff955f7c0e597ba679e782cc9cf4a3abd10a8449cae70bcdc41078d25830647cd9f87a06db491b6d266daae8322ba4147e80a9da13b9d1fddf2fec0e3870fd6eaeba68f446e6c9b91de7b6fbfe17effeedbee7d1ffcb1752efdb011cb7686ca047d45fbe7677fc5f9df2b9d1fe40e5646f5a37aaf1b9c89c326af984f3f296ea54c20007cf1f9e761d8f5878f3e0811d74ad32b9ffdf52f138ad49ce9717e6dc4b29d53e94168362c61cdcae5e19d76e999ef69f7f8230fb97bbef75d77ef7ffca7fbed37ffd73dffddefbb99dffb3ff7f477beeb7ef9dfdf7077fab3e2433ffdb1fbdd6f7e99187cc097c535b5559f60c93f0c2c598495cb96267a1068236da5cdb41d1da00b74826ed011ba4267c94341be2c744b6079f1e471b3ceb63e326527e80bfe3727024688bd3ae0175f7c1eecdc3ad62b94c308f5534ebc3dca9138fffbefba37ce55ce2f184f4e563f925b29052108f8c818af9d7a68a4179e21c8471fbc1fceb608f3911f8e7c3e4945fdf52f7f0e91fbfd77df2ae629ba5312f5fefe9db74367e7c6d044ae8b4ef0c28a79bcf34e197ce499700dfc8bdb6f71f75f727138bbddfeb5afb9bbbff5bfeec11fffd0fde6a17bdd73bf8bb7ba72789a8ef905ab3ec1927d1858b2089bd7ad6d7812f0d9d056da4cdbd101ba4027e8061dc53990fad391e8965196555f1b96ec16d8c6bb6fbd111cc8b2a11adef63819e16c1ff9b3ede7fe52c24cd7255c8e70a2c45f38f1fed19fb07a3b697e19fce3f7efbde35e3ff7a2a90b63141037d2b37f0a4180e132c27de69dbad9e9be0c8d40297ffcc347c151df50828420e003c244afb3b856fbc02b9b481d4727affa88fdfb505f5b20e018010cc52287d5f94d88ecddb06ff78eb05c351ffa563ce38dffc9705bebd9a71e0fd7b7fae11f0b96d3d65e109a0db92db9878196219769cf8e6dc952600bda8e0ed0053a413796e3033a45b76b562c4feae984257713a4c771c289aa83e37132fc931f19bfe70346b8a4f4436dcedcb2dea05718617fe2f3bfe92f4d0844d837c3774e5a8cc09127d878b0f3f89fdf805f7ce61dff93e0736fc64bdaa23d16d928206e5867ff0404f2ca79f7add78313d378264e029f7e1a7e33c4fec0479f77de7835383b8dc8154c195c7791afcd6973181a313c43d19413caf3e5d361efbcf9bafbf883dffbebb73f85514718927985a2b4cffee283d1c71f06997279ba25d1430b270e1f700be755cf02f4031e83b5ea122c7987892513f004635f5e06a240b76155a4519f85256f27c887e37df0debbe16c9a387470b6cfc3c893b33ef3496253e184548c947b0d028c4eb151e625f4081559289713178efde1fbef85933081e68ffe3f36cfc8e3fd77de0a2743f139ad038b6c141037ac8426be02ee12a024a21542333ae0b79c9925ad3444c37eb9cbf0b13f7ba3e4e6db321eaf749c9ac63261c7dc445e5e0804be4ce478e7cdd782420832efbdc5e44eaa189db717629bf26b4bfd9b5b5127c34343d6b5ef4459e2cbabd75561c93a4c2c99909557a3e95ba293c6eb74f1fc796e4fb82352e8228c3aec3eb164ed16f2071b7de3b5301ae0ee409cc7fa30d855bc551ccfb23a1f36c64422e9b8f71ecfd6864d177002c4fe716c9c9cfcba3c21b4cb1fe3387261ebd1d78ac96b90745d920480f4d9f6664cc10af2639d884efb627050460d44b53f7ffa495008676d20d2c65b74d5a584559650ca9329c54a3b116279b623c6fda7c2c72c3a0d7dbb8561ef9a15cb54dd524fdccee59b2a2ad92ad8cf6ac0e6cba1de40a7dc5a3c1c2644551f24971e93777e0d36141cce9f405e2f4e706257567ae038271cced85c0663c78c1a18e23332e07fbcedf8e7700224c8e0077d95bb0bd43b148a0060dccac9b12a9b2c944b640b67707f8667184550e03f513146ba76a50f13ad8f8ae8fcb071ed6a6facfd1bfa8627011bfac6926f2ab06443e6f5ab579a6d9a08f18520f3dd99137c3e4df45dafd7926fd82007364b20e0d293112967f9c8bbe56dc7e0f803b06dad0f13df374900d00792844ac956458340d76f1d1f05b48c11d1d329b76bdbe6be5efbc665af7563b7e49a4a72f980e1bad5a689804e79c9a8d6755e9f25d7541364f34e1e86ef058370fa9c4a2f999e948f8700103e31d57086d15895fc3363e90878165e1e089a2cbc0efbf8215e7f95d661c9330ae4721e3fbcdfcdecd3e5103a657495d72158f2fc3363e928c1fb7c5819580eff5b828055c1056c5d1d3db02f3e09671871af7007e0dc99f138d3412e272f495d3077b6d9b65e41a7bc0928af032c592e50d75349e1efe13220d959fe4f8dce2afc0211ad27e00dbeac560b9f05330cb96b9ee795e08b6be55b328c12b9bcbcc67bb27745c2e7c1bc4ee3cb40d3f22d192e104975e57d3af1f1481500f401f5df2af8021589fe0a70dcb01e60125f0762d67bfb968d651d79bda38ec8cc25d1a4ee8a781da24bbe0a947c365dd57181662c9fd6fa4b03808155e80552729d6ddfbc21cc584f6614307fee1c7760ef2eb3be71e2f8e103a12d561bbb011da2cb0d6b56d6f46cd57781945c67391702409fd03a3b79f4901fb22e8cf7c127300a98377b5678b9c8a96387cdbac689974ecb3702ac6724da4177e890fcbc664cebd8aaeb0275b4ce2c2e04803ea2f5b675d3faf0e8eac21e8300137fbcfb9e2f038f7b1f88fcab962f0d6dcabf98d4063a4377e89060aa3f0a6ad575011bd15913ad01c02af002ed88eece854f63af0886dfed4860ceac99213d67ff0d6baa6fe059f58c03223f6ff1a54d210874f1b56039f39f4fba984a4477161702409fd1fae3b9f575ab57064366196bd30a410c9e2132e938e3f1fdbb037b76256559758d325a76f4b07cf1a2d036da485b9b02223a922f00e1fc70ece0beb1d5c328a0fb22c70780fa7d66c12aec029d2975c85d94b3a7c272de78069c1f66b4190acf9af14298e09a3f6776787f5e18eafa340c974f946fbc897d63d5310ee836f02a6faee525c8d166da8e0ed0053a4137e828e80a7d78b66fda509463d77181ce88feea9c72d3f48b2df52d02aba00b7447a5e00a0cf9faebae72f367c76b7c86b872a6bbefee3bdc93bffd950f14ebcc5b5d60d533cae4f2d32ed604e0e0b49536d3767420c37d74838e16cc9d153eb396bf09c9aae702dd51eab1f4f1f842551f007c82b0b308044582bc800bf48e289d97643ef8f003eed1477fe687f7c559b080b3dddc99cfbbe937dee0766cdd14df6e5be655c1d963d5318ad4e58f6d089f4f5fbcc05d76d925eeb9df3d518c8a2a16cf9fe36ebee90677d3cdd3dda9a3878a32ec3a2ed01b4197cacff179f6677300e3676ca34cd0a557341fb278ecb15f8640c0db7d0eeedd1dee12f035e12307f606a7dfb165a3bbf5b65bdc9e1d5b5510a89c679cfa44e4d56da04db48d36d2561c9c33fc813d3bc3db83003d1df5fa4057e1e31f174e467d23ed8fea77190074a23cf3052686e81338fbd55eeda5e0f8367f998083c47bdeb6f3ebed514364139923b11db489b6d1c6a6cb1c4047f9f1bc9e0b4c0cad4fd936ef02e4192f30712abda691d7daffb2377c460677df7da73a5ec7aa6714b0640df833396da26db4d14c93500f7c17983ca98e231702c080b1f41bd1014105017f0664fdbc0c7fe3319d3662d5d5c4393ffc7ef1d47177faf851cf1177f2e8e11a1c3b7bf2587050ab8c4ee4f2452ab96953db08a809abae0b4c0c4bbfe74500c068276ab883a6a6dfd2b185e824651eefac610e8074612ea0eefc82aec702c7663d015f16cae1b65c60db96dab1bd3bb787ebf313470e76a5d79a6c3a78156d29db95a7d5d47453afeb021327d72d8c6d00c0308f1cd8574c1e89f16e09467beac82177f2f08130e9c65a742bff30b1745ca29c5c6666cbfd85f324e933f2ba8033f9fedd3b834e767907dfb47ead5bb37245784a9165b57ae65de0693bde67c8eac58debd6840f92921ffda2e7a64060c91440ee40d18e5a9a89b56d98603bd810b6146ccadb163ad9b76b47d0efe1fd7b4390658465e51f352c1d6701603c1ac2c3367b766e0b67b00d6b5687a5a22b97cc77f37ff90b37efa65bdceae9b7b955d7dfe2d6dc7297dbf4e8afdddee5cbdd699f279c858cf2064daae33a7cdfbe783f5bf57d06711a712495de3a934a5d27bca1e2b4e866edaa158d0edf0d2b962c0ec14302c1097458d493d71fc81d5a642fe4d5efa3a7cd495a03a96ba87859b1156c06dbc186b0256c6ae12db7071bc3d6783b11139a65903cb87f2c02413ea29c661ad80843d445e918f8726fa04b16cc77339f78cc3d72d145eec96f7fcfadf9f155eee46d77bb17efbc2ffcdfeb3b6eddd5d3ddba7b1e74fbd7ad9d921181d66d0a9d113b441c03926f34e4cece6f0c2decaf8e51cfb14307826eb66c5c1fcee896534f84957e64c07a7ecaa68eb44d224bf13bb7a7623bff224d3c9eb62147eb7018601bd808b682cd603b624b67eeb8d76df8e935dec6be1b6c0d9bc3f6f8041ab773d10d2383174760c4d944a2dfa29f62005007ac8ca300d195fbe789f37be3a4231efaf6b7dd53dffa8edb7ad5b5eed8cdb7bb77ee7fd87df8f0a381f71e78c4bd72f7fd6edf8db7bbd5d7dce8b6cf9ce5ce9e386ad63148b48e03a5d3c4b386760e60555ce91cd24745a7d58282e7ecf1a341371bd7aea996dcf6113ec925867ef644f5645ec4cb930701759cb6e4ed8b3a91f6d5dba375370cb0096c031bc156b0196c47ec088e7bdbc2c6b0356c2e0401af1b46595b36ac2b83c0a8ce4741a267df4f63330770705fddf9e7bef04c88c674c89a1ffec41d9c7e8b3b79cb9deeadfb1e4a3a0edef6418168bef6ea1bddd6a79e0ed776563d8322d531061f89c74f25cec1cb1ac328400589caf9a58c140c98cba1689091f0f04d5b30e8f2b89447106072b0f13e7e225b21bb6f036dc93f4d4d9ba35e2a5d5479ebfa1b24d80236816d6023d84a6e3f806d1db8e1e6606bd81cb6870da22b82805c121cdab7c7ac67aad1fa15c62200f039e8dcf917cf9be37e73e3f5e10bb3abaef891dbfc936bdc911bfd90ad2100c07b0f3ee2cedc7e8f1fdedde8b63df77c78c6dcaa6f1054faad0c3d3a41fc2def692fdfd22cce543a55912f1c1387a9e0161baf245fb36269b87617a76d24186de1e4c57627562d5be2fb618bdbbc61ad5bbd6259fc6681c8a0650efbd4efe2980481f0225abf5fb73fc9178e0d076c005bc026b00d6cc4b29d0f3cd8d6a1e9b7065bc3e6b03d6c105b448704486c145be576ab55df5452e9b9a21600ac8c5309c32926597679a572bd15ce4c9e198fffda3df8b5af876fca6ffac9d5a1538edd747be8a4b7efb32338d0c1a77c945fe33b7cf79225e16c66d53b08523d7be3f78e2cd7cfd77aa710c708688792ff89b39c0e67635e1c8273e6676b71f0f07f32e8b23cf988a0747e255740cbae8ed346dacab6b43f0d02a9ce06097d8f0d600bd84493f30bd81627196c0d9bc3f6b0416c51ec924fc41300b84b60d539d5683dc3c8070099d85abb2a3e570f8be6cf71bfbafa4af7c4ff7ecbadfbd14f4387c009df4174d2bb0ffcccec4081e3477cbad537dcea0eefdc6ed63b084a1d8be317ce6f228ea31d491d7ff9d4717fb6d9543a6549a1a38152d4b5cef7c9b143fbdd2bf9258196b96c43435b2508285d58ba1b04f43d36802d74b219387deb5de12423f686ed6183d8223629fad9b629ce959c1a8351c048078073de705894c2b59536c0d9cf3ee51ef4c3af45975c5676c6d69f5e1b9c1f3a457278f3de87dc4edff91b1ef9e5d026054bfd0663570e21c69f3942dca7b615c8cc9777e48523c38691078b8890817502968cb9ec49d04bda590401493704c29c89ef7b6c005bb06c24e7eced7787938cd81c6083d8223629ba59e547aa0480517ca96ba5f3c8b4d8116278b1134605aea350e4aae5cb12e37bf2aedbfdf5d737dd5a75f6df7ed5f56500f8e0a19f9b1da8e19aeea53bef736bae9aeef6ae5c61d6df6f2ac52b2708a8fdb22f496f83e3a11f869d5a3f83867998edc56d4138bc7f8f295f42d9aea26db43969abfcb775d76fe873fa1e1bc0162c1bc979e98e7b837d6dbdf2bad2eeb0416c119bd43a9209c1b3278f9bf54f15c1c7a51ffcff18003ca31800785476fbe64d896217ce9ded1ebdec52f7c2f7be5f5efbc3ceab6f089dc330cdea3c8b771f78c4edf743ba75773fe04e0fe10dbc62e0a2fcf2b77786fa6498fe5d47ca64c61943e30ec06416fd740b6f2c92892ea07ee6692c192b8cf6e8d141617bf25beb6c10d0d7f4397d8f0d58b661718eb525dec676795b13bbc306b1456c12db143dad5911e7028e1edc67ca3055a0e77224e619e900c03d55b9b525cc7dfe69f7e0d7ffdb2dbdf4f2b21360f735d343e79cbdfd1eb3f39a78c51b0233c07b570c7b1450208e50e8bf3a96ff8e58651e3db83f181bcb77f544693f21b86c58bbba747c2ecd589199cb92cb6bb623b495ff6a5f415ede20a0afe973fadeb289265ebdebfe6063fbaebf39b13d6c119bc436b5be0894d8b025c354415fd402003b462d00b02a0b43cb0dfab9471f763fffda7ffba1d74f924ed87bdd4da1735ebaf35eb3f39ae00cb06ffa6d6e83df1ec66dc1c4e04be797edcc5132acf28433278e05634367ac04ec5720c09099ecdbb1259ef5b923c3c45fdbb2574bf60a0ccfffd76d57c7adf2fa097d4c5fd3e7bd9cfde1d5bb6300905b8102b6884d629b5a772cca4267674f8dce658004000902d36463d40200d7ffdcfacb87b58fdf72937bfc7ffed76df8f1954927ec2f02c02b3e4a5b9dd7064b3d575d73a33b32843b02a5b16bc34f9cc00e0256593938250f437176c6f0b80e659290db755a87ddc0834118b00cf72913c7ef76959bd586a46d0dedb7caea27f4317d4d9f5bb6d0c6ebf73c106c4c6e050ad82236896d6a1d72b984ee58c762c932154800109f0f2f0565235e838e4e0038ee0d9921ad56e8e2f9f3dc2f7ffa13f7ec77be9b5cffc37e3f2ca3735ef39d64755e1b6fddf7b0db7addcd6efb8c99037fa0a366fc266910b0ca69430201cfe06380c05afecdebd785613c4181a703995c05ae57b9cdba7ecdaa9046d6fdc3fe3d3b435913d18b6e4353602b29746295d32f68037d4c5fd3e7962db4d11400b0456c12dbc446c55e3979f134e628ad0c8c3eee297c3e8c0084510a004c9eb0be5a070026591ef9c1c56ef6ff5d9c74001c280240b7b77434bf7fe8e7eee0cd77b875de287894d692a75f68638f343b8695bf579885e6cccd7b0118be8b6337411ad29e387ca06f0f4e596d8ba8b60f2100d0b7f4317d4d9f5bb6d0860480c35900006c12dbd41381c06a49464f963c5341f071e5f3233b09c8537f3c97ae95c943250f7fe73b6ee10f2ead75800480a675dc9de076d0ea6b6f72270e0c76d6b632fed81915f9313bff4490f2e963ee7f9f3c7ad01df74181db7740b0e52c1fd643043b8879acb226826e5385dd762b7fbfa06fe963fadab2814ebc76770c00f91c006093d8a6bcf65d60129bc0fad210579cb611fab5f07918d949409efc5bbf9af7c857ca9c37f339f7e037bee9965e7645ad03e412a09b155d166fdef7905b7ff58d6ebfbfeeb5e4e917a903e8df2956de89522bbbe8eb0ad2d5e5b1ca9a2879d92955dd56de7e41dfd2c7f4b565039d900070e0865b6af6874d629bd8a8b6d9d5c5ed4026692d99860dba2efddd93ad041c9d00c03094d967adcc79339e730f7cedeb6ec5e5f1e11f8ddc0578bf8b558016048e6dd7dde276cc9a6dcad34f529dd7b1f24c86a46c3a3f389c76baf83b0f0256599341976d61e5e927f42d7d3cd19384dc05c0d672fbc326b14d6c54db2c93a9048051f9d2b3ee7718d9a5c03c4c211fd714e6bdf0acbbffabff553efda7d955ac03986800e09a70cff4dbdc96c79f2a9cc496ab1fe43acfb1f24c867a1d6900c88d42b0ca9a0c561d1a2b4fdff07d4adfd2c713b9fe070900d85a6e7fd824b6898d6a9be50e0c0180373599720d995ce7631500e63ef73b77ff7f7ed5adbee2c7b50ed876e575a17326dab970e0a63bdc86477ee15e1af07ddb5ce71a2bfd64b1ea0994939179408858654d96bc0e8d95be5fd0a7f42d7d6cf57d379cbb2bae04c4d672fbc326b14d6c54db2c100046e55660aef32a007863b0324c15d625c0acdf3dee1ef04a5e63040098cc08008ede7257781dd45405002b6d3fa8d795393cd783430a0090d7235869fb057d4adfd2c756df77c3cb77c667012cdbc326b14d6c54db2c702bf0f8e1f82ab5a926e85add85aa8d00c0ca386c7803503e0938f3a9dfb807fd308b37b2589d40e74cf4fa0e4ef0c6a0dbef716706fc74a0a573b0d2f603abaed4e1ebce0f5659fdc0aa0bacb4fd823ea56fe963abefbbe1c53bee690e00de26b14d6c54db2c1000f40b55a70a4be7450048cf0056e661c36dc00d6bd3db80339fec1c00263ac30ba7efb8d7adf643c4414fd8543a976d3b5dbfd0f5f4825556bf48eb8abab0d2f50bfa94bea58fadbeef061e07ee1800bc8d6a9b6531509c049cfa7703a4fa8e3af70120cefe86db0245022bf3b0e1011756a56965ce7ceab71d03000f6c589dd70d2fde719f5b35fdb6f0e14a4ba67e5075828d9567b258f5748355d664b1ead15879fa017d4adfd2c756df77034f9a761e01fc36b1591e9d2600f065264bae6152eab8bce4d34b81472c003069b2357f11c8d3710ec09a04043ae7c51e9f06d4846702aebf654a030058f9268344fbdee8ff9d10bb9e142b5f3f0801c0f7ed449e0100de31817d3505006c12dbc446b5cdae5ebe2cacaeb4641a36a58e0b7fc7f7e352e06020a315001832f1208a56e6bc179e71f77ff5ab6e554b003875eb9d5dbfe0212704801b6e1d4e00489603d7b1f276a22daf2ebb1bdacab08e7542975d43e9c2cadb0f4200f07d3bd100c05ba6da020036896d62a3da6679f682f92c4ba66153e93cfa3cbe1f2e01841808ecccc38621134327fd34208b2c1efcfad7ddf2cb7f687642b7ef046c828f3facbef1f681ce01480784ff2d41c0cadb09ab9c8a2ac0376195d1b4af57f2324a4a1d0cd6f6c21c80ef5bfad8eafb4ef0f010b695bf124cc026b1cd7c21100fb48dd22dc0ea641f49e600e268a09e712ae0c92d864efa7560f3663eef1efa9fff714b2e495f06221c9e7e6be8a437ee7dd0ecc44e94770106f832c7d2f04307e8df2956de4ea465d4cb4fbe3d6810cae93032015d67b758e55454b25a79fb017d3a99bb003c658a6d616396ed6193d826362af6babc580434e807ccba25e8b7f0f3a8f38639804176442fb01888475445a10be7ce723ffbfef7dcfc8b7f6076c29e6b6f0c9d34917702006f87e569b141ae0308facd746d61e5ed0aa32ff36060e6f3e834750a3bf1db13c12e5351c86ce5ed07611d80ef5bfad8eafb4ebcec2f1db0ad3dc62a40c026b14d6c54ec95856ca376fd1f745cd808be1f5f08921948483402f0d2cbad1bab89c045f3e6b85f5c71797807dbe6ec7d0020ab01b95d6375621bac20dceb87889b7efd9b817eda29d773209c75e914d98e58f9dba8cacbfa343bab5b7941a7a95138285879dba8ca50bf3399843c6fbfa04fe95bfa7822ab454ffb9103b6c5dba773bbc316b1496c131b157bddbc61ddc8bc0ba0aeeb18048a3980ea809579aae0ba8d4514d53cc07cf7d8f5d7ba27bff56db7f1c757191d11bf0ec44460af9dfc4ef130d0f619b34c59fa85d675708282a6a1b755461ba163b33ecdb1f2419a2eb70b7e53763d5f1bba8cb22cd5ee803e3640e85bfa98beb66ca0095697b60dffb1456c12dbc446b1557919c8a83c0320685dd39f6121507a20767c9e712ae0196aaea178a452a2ead30fdc1b5ec3ac3f08a291cb805edf0bf07af822ec8deec0faf5a62cfda0d2714683f383554e1355bec279a5dc2e9d4ca72929f35601c1cadb44594e4e9fdadc0bf42d7d4c5f5b36d0042f9909c37f6f5b96cd618bd824b629762a8f014fc5d7a82da26ed33ee4ffb4ea603dc128c03c00432951ecaca79f700f7eed6b6e45c39d00f940084f6e599d6911befbe68778aba7dfee4e1e19dc8c6da5674f8b03048ae356394dd4cba8fa33127f5b7941d254db3679be36429e2edb2a58e5f403fa36f4b1efeb5e6e15f30c00b3ff5bcce13f8f02ff30d824b629768acd8ed21b812bfda63e1e02c028cf03f069b05ddbb6962fb65c306766fc3efbf72faabd1750e08d2d677a98ed65b4b0f37a3fbcfbed13e1239b961cfd20d76f9363e8cb01ab9c2674193a7fd3fe4e799bc8f3b651e6e91404145639fd80bea58fe9eb6e4788048a53b7de65be0404b0416c119bc436b151790498d5ac961cc3a6aee378fdcfb1f29560f5447661c3e6c553f1f5e0d5dd80f9ee89db6f75bffac637ddda8625c1f2919077bae8643a38dcffbfe6467768eb6653867e51ead63b43f23b204138ed8bbc8c4ee8bcba8cb81dcbcef3083a4f1356be36d2fccd6dd4c1302fa39fd0c7f4357ddecd2880674bb025eb1160c006b1456c52aeffe53560a3b0fc17b4ae235eff85dfc749c0243ac7ceb10a9a2af8c6daceadd564e09ce77ee71efce6ffb879175de236fec49e0ce4238e7ccac9ea540df777794bece6df3c31d00e139d967aae9d11d1bb26eecfcbe9445a661d4963e593ff818633769eaf13555ebb7d81c4f9e331abac7e401fd3d7f479376f90e609c0430d677f6c0f1bc416b1496c131b6505eba87d1db8d4b5104efac65d008d55d054c0dd0022aa7c2568f182793ee2dee27e1e5e0ff643f35240be14d4f6a9f037ee7d28dc165ae32f178e0df8764d4dbf18bd503885ccb407b2519955a64595a7ca6fa5eb86c99455e5f514c606691b395690e5b1caec17f4357d4edf6303966d0023486c88ef4ee6f685cd617bd820b6884d629bbc5e1d5be525ab56dd5341aedb8ae22e401356615305132afa96e0fc99cfbb472fbfcc3de6a3efca2b7e540b025b3c476fbc2d3cc195df127cdfffe6b350bba7dfe656fb3407376d2aaf890641aa578cbfd82e1d0067d014c70dacf2737a49db0d13a9bb468fed04abfcbee0eba6cfe97b6c005bc026b48d009f99e36dd3daae005bc3e6b03d6c105bc426b9f667a4ca6bc007fd7d895eb0742bb40600b00a9c0a4e1e8da3007d4b70ceb34fb99f5f7271b8065b7ce965e1768c0e04446e666f19c6f134d77b0f3ce2877dbc15e64eb7f19a9bdcdabbee0fd78483ee2c4bafa5f387edcc31f2b419561d9a6ed2f44a2ff58a9cb5df4ded6c0804baec7e439fd3f7d800b6804d601bd80873035c1e7019a967feb12d6c0c5bc3e6b03d6c50ec71d3bab5c14647eb4b4039a97d85a5c0e1c7147442aff0aa70bd3210e6bef08cfbf57557bb07fd508ccf33cdf9bf8bddd24baf084f67f188261db6fdeaebddceeb6e74bb6eb835bc167af5cd778637c49e1c4247593aad119c01a7308e1958f58c0296ac15dace686bd1de0e6db6eae927d800b6804d601bd8c85e7fcdbffd9a1bc2a7bfb1216c099bc2b6b0316c0d9bc3f6c40e572d8b9f01db37ead7fea27bbf8defc700200698270c894687974e9f0cc32b1eb1d44180e597339e78ccfd66fa75e176cc83dff8467841e3fd5ff94ff7c07f7dcdfdfcdbdf712f5c7b9ddbf8d8e3e1cbb0dc0f3e37a40f35880e53dde6d007c6bee4774a5e4f2ff4bb3cb0caac10fb2ada2441a096ae42cacceb1904d80236816dac7ef4976ec6b5d7bb5f7ce7bbc176b0216c099bc2b6b0316c4d2ff95dbe84a1ffe6b0ee7f5466fe85a8cf5cd7feb7f7f91000d20364521d157e0f974e75a26082000b2daa25c211266216ce99151ec9e4f5cc733d61db5fa3ad58bcd01d1df0577f7244879116832f227285fedd92cf63d5db2dfd284797d14ed68e5a9b9bb1ea1d143bb76e722b962c0c3683ed041b2aec08db92c93e81eb7ebea588f3f3415bab4c61d86d814a8f3201abf7f94b80ebaebeaafcd1b420a8777a2da339bdd5284602dc1ae493d5fa71e14e6cdfb2d12c6f5054ed10bd0aea589b23747012abce6ee85739425a5ebbcc09ba7d2d2320abce41d1cb67d5f9e8c70e7fe6e78474bae145b2699b343de829d06b7a0b1f0494cef1fd2200f89d0dce1f1ae28f9964694bfcb156817b19ee86b2d27da25c2606b93bc0bb0379f79ad5491a3ed72c79074d2ab3d207ed51ed9f366d5ac9bffdebbfbaf9b36756e98a3410cb54e514fb46814ace285fb28fb6166de1bb79b451b7394d576c67ed84bcce41d14d0060e4c9c2343e5f7f68ff9e72bdbf963750b3734dda3e496b9613c8d22b4cdf04236d28c71fe37f08007442350f90268e4a898545c3ade8bcb4b35e5e403aba637e6828c313658bb04e80ef08f031d1b640c03d5a9d6f90a4f2d20e053af4fbaf8d1d50438fca725d89dead3aa7122d5b40cbedff17c656031dc4345127b9aecab287046774cb7600db92557e470eee4baef7a3ec16d2ae7c9fda2fba127df54ac8ebcbd314c74cd9fcf170fd1ffb4045614568589130746c2898ff911014b23c7663152a7f2ca3d86f5234a4354d2167011dc2a7b09990e19b025c1e6c5abf360cd1e8309d7690587256ed414770ba7636d470ac53db35961c83c492c1c4b7a1633b8b74b97e722c39fa0d36b4db5fcf6ff7d7f5dcd3e7391466f6b19f53fe1a9fa5e93abd25674a537be2bee85b91723b4bd311f1938c285f1544738a3e9816879d642a0e04a75784fd79e12a7d9d4af0b2729dafc81b872ac5714913b66950d12839d68274c6a890ca57e9421b373a172768a22aa333961c83a4acbb8b3eb2daa6492e7b828eea658025c75462c95823e8a7eaf7da31a1f89d0681867c1dca12bf6af451bf5fd95f3ae48c8d2b9c3f1414b725634291a74e26b84f5b364cf2857d51d0a42c0c20a0f67541de3939dda4e907a95c4a07d9beb6b3225c77f59559bece58f20c02abee36688bd546a11a0514fa4afa3ed5a1254fbfe9a61e2d538ad1e7d83afba57dc5be04495750ee0be5e565a6bf834c9227e417bf8dc7745a415d92c54e608744e25018091321f47f8d259c954ee38f6b6578da95da19696c7b39f53afb892e3b62eba1abb37fa97be8a4cf0a4bae7e52afb34936b5dfb7c56aa3a61a051494e514a87d965c9321a9a785ce79baefa7eea1cc1c2b5d46e65f027acee663e2461985c12b5b4794b8afcb8a1321e376aab0788c0825fb4aa5aa4eae90f2aaf4f563f9feee91ba278b55b6c8178eabb6753afb43ed2c80be927dcde4b2f50babae8442b638622cfac5efa32d561b35c95c405946dc8efbd4ef70bc3f54e54f04d5ceaef6774f259f94d54379e25bb44b531ccfec2f6e9411b8200900650122449b305ad8f8bf5474725cd2e8c65ad4d3a7c7f27d39459aa41d3622c744b0ca2b75e63b44d27473f607f49f0661ca91ed7672d9fa8555571df45de95cda61b531476cb0eefc752cf9bac52a2f405d0df535a3644df659fbeb94f26427d854d6eecb0be90a9d97edc9da94d960ddf9cb0cfe7f79a60efbb4106d0271acd3f1ea77c78e692dab2234dad8df0b224b2f58e5942053387bc7ebb26ecefe208e53766428ef5458b67a74ff5eb765e37ab76dd34677f4e0beb43e8f25633fc8ebe193d787f7ef09ff5f3c712c3daee407ab8d39e8468f0cab766baae3968c9d48cbea15fad0da9f838cddd96c455b7a29af5399e9f1c47632b9cb20f0fffef55f8a043e739228161626136a85b409c2314d5b1aeb9845a7b2acfdd04b1d2996f158a4f98afa3265ebdfb9d13721f9b4ee5f3a75c2edddc9c75296baa5dc9b5e14ef4f6ff3c140ca47064bce7ea0f5b967fbd6787fdccb20b26c5ebf36bc7f5fdaab0dd06aa38594af755621f5577258725a5465f44a9b0d351d637f5bbe9cb6f472ac2d0dd48f55c14a1d0b7d127fe3fbd3d8512a281c2cb603316155d0f94532d434c88dc822cd437945995a97b25dfcfe7f5d8c024897d775f2c8a1b0ee5c2f4ec1f9967ae7e36196284324cf3b5974d967fdd97e9938be62d9e285eed0defa77f0c863b551834e741d89eef4feaccff2ba2c74fa7f3e94be940d06bdf8edf83050d8a98cd750b2fe2dfbc68dbc0dddd25b595a777e5b295dd3692e204f0fac78cc1f870602c0ee6d5b92b496cc934197cdd99f3a7339581ebb7ff78e24ad60b551a85d820aa2bbdc3e0d9d7692b917acb2461dab0de93eb1cb428f85feb2a7019592cbff91bcc27145b7a99db4fdd05b39852e33430d14fbacb5f1422d8fe7dc195e90baa5b6dc9933f1fad52bcd3c3951f67adbd8d74dbb18e2af58bab876f60746278c00ac7c561b693b3a0869723df13bec2bf4e8f7b5c927fd62a7b1da6ba3cb1967d27649fb2b5d0a6a0420ffeb89ac0ac611dd26ab9d29751de8fff9313e3d55ed53659b869dd6fd6f5c8b65ce91e45130e9c75267be3baf9d8fe1378fa4f29424694e1c3ee84efb1143fcce61da9688c8601d4b611e88576ab3cc7aedaa15b5b33f4fc56df323933d3be2bbf0ac32f3f6d1e6eab84f5f9b83f294bf2b39ebbaae68ee239147fee7c7aaf281fce703663b45a7c5ff30079026844a2156c1e348bd8dc059afea78d9276d6f8335e3470eec755b36ac736b572e776b3c9bd6ad717bbd13868f8b58064db999f30bf9c33276bff06e7b5e8ab22d3c90c219779d3ff3cb3713c2a420d7e6e07f0b1ce33f8e1a58b624049075de997168e041aa8d6bd7b80d7e18bf71ddead0960d6b578534ab972f0d2fbd90f2c5f1a9977cc8c265016de72e454d6edf16dd36bdf2b4a241373e2fba3ce403dbe6f56b823ce87aa3976dd7b6cdeea8ef03fa22c9632265ebf2ad7d11cb86c691b49d691b43bfc846ed608155e83862b52d108c4e6d3738a870fcf0fe701dbeca3bd19c9933dccce79f75339f7bd6cd28e0f7ec192f78879bef766cde18aedb635e29332fdf6f17fad7f302f9314d784bb23fdbe278c2960debbd63aca882c100a10edecac44b5a43fdc8e2c9272223b1add2aef27abfd62ead97f8ffc4d14321c02e9a3737ead9d2f50bcfbb8573e784c075fcd08122bf2e536f7ba48f93be069dcfb6a171246f5749a1ffda1b81345681e348d92633d06108febfa779a81c67be77fb33ceaae54bdc82b9b383f189215a0443f569e67983dfc18b48ceca9931ab438cb0904d82403ca6d2659c387c2009009a6d9b3684b33967769e6fcfdf9cd42bcc39f06425937c04bfbc3e86fec7fde58125a7603a7fad7d5137c7fc25cccaa58bddcc179e0b3ad44e6f21ba9e3b6b461825d057babc12afebd0c765bd6adb90c9b2a57144da63d11800ac82c619ab8d116524a1f3f99d1a0ece86f1cf9f3d2b185a30bae79f73b3fcd987b33d230198ed61df0c7fac34d0c2809779273ce5cf68badcb22e6574fc8e9363d6cc782adb391f54ce9e3ce64efa1101d7e77c8a9af722f09214e603b49372b6e69281e0c02222eed9f316dbc81ab5bd368c264847faf22cdfc0813d3bbdc31d55b255f209b4853625c70c5d33d4dfb261ad9b35e3f9d2a92b3d16fa2e741df4ed75cf3efa42eb9a4b2082485957a0a84b3b7a08be723cc5b2a171c66a239801c02a60dca9dac7c2a648e2789913caf641ef508be65743500c6d9637bc793e182cf043cf057e78bad0b368febcf09f7df3e7ccf667a399fe0ce683814f8f519277cecc17dc417f2d5bd5611b20d7c8d161d4fec461aabc565b8597cf9c0a6fabe11af98c77d2d3c78f86cb07dea424f00a6b56f209fa18f09e3bf209041cca63228e3aa27c995c9963d116fbba1f625acecc6b562c2bf52cba4687e8129da2db44d785bee90bfa44eb9a91175fe7a9ea50322541c0d72df6a0d2e4ba3c1f28dbaff8a70b00d1f185b4ddf96f86ee5c6386b311f8330d671e8c71f182f81db826384e3ace52216f619c9cb1b895170d2ead4f930e990b794b43aef25a6d1d2622872517ff934b9a06d00513a9c1790b5d01baeb46d7403afa46465f9443fe7dbbb6a7f5597d5ee857f749decef381a4dd05b50060653c5f886dac3ab90d96d786a1a59c89fc366722ce3c960136c1d92a8c06d4309520c08cb955afc019b33c6b0623d5c72b63b5da394c820c41165baf493b1ad8ea751df49ce91add593a6d82beb174cd28ceaab7ce68e87490e46d4e028095a115dff132141c75743b3bb16fe7766f44a94132ccecd520359ca13046314c2e078e1da83fc813289c5b4f0632440eed0881604403409033ca2701ab6a439437e7f0be3d5e2f55a04547e8cad26137d047f4950e0273fc48e0d8c1f649ca9cbc9da348f03daf57eb581bba9dd3b846ecb5c15c0732e9b47ff346b767ed1ab77fd30677c47724d78ba3f44d344dd5e8cc1033c37cf1e4513767d68c72282a67a36e86a19dd0970494bf64c1bc62022d93a7709e741ec07620abadc3c49249cb5ab6813665baa6ed0be7cf29752d437e4b77bd405fe99140d0f5c2f9f14125557f3d2855bfadb64e35f8163e86afe173c1f7bc0fe28bf8a495a709da88ef4f5bb97c4998c9ddebaf9576f96b535692b182ccfc728e178019f15d4b97ba7577dfef565e35ddadbaf206b7eaeae96ef54d77b8cd8f3dee0e78815eec5198415375b06075bcc7b76fcbfa75e5d988ebc97e393fd4e6057c3dccbabf1216cf14322472e5e8e3a3136873b9aa6d8bd84edacc5a02d1752fd7fbdd2041a0bc23e3ebd9b96573e1f4422e97fe6fb775aac0a7f02d7c0c5fc3e7f03d7c105fc427f14d6b44802fe3d3f8363e8eafe3f3f8feb44b2fbfd45df1a32bdca5575cea2eb9ec12f7c31f5fe1eebbff1e77685ffda9ae93470fb95d8b97b855d7dce8b65d7f8b3b76eb5deeccedf7b8d39ec337fb0070ed4d6eb5dfbf7bd9d230539ce79f2ad24ece3bbe3ac619294c24613085514e66d86f8161ea21ea5c5f5fbc33d02497456c87d5d6a940e4b165b5882bfb44d77289d52fe71798132883ad873b03d52d4b5b2e7dcc6aeb54802fe153f8163e86afe173f81e3e882fe293f8263e9ae7c797f1697c1b1fc7d783cf7bdf9fb664d17cb774c942f7dcb3bf73cf3df7b49be5af4d37ad5f53bbb6672df881ed5bddea9bef74dbaebbc5bd78c7bdeeadfb1e0e9fde7effc19fbb37ef7bc8bd74e77d6e2f9fdcf6021dd8b229c93f55a41d0ccdc6ba7df3066f8cd15830ca7e0c472db8752586497d2cb53d7dec8829531b567ba7024bb636682b2b2945d7e8029d58ba9a2cf4617929e0ebdbba615d268fd8826d13567b870dbe844fe15bf818be86cfe17bf820be884fe29bf828beaaf3e3cbf834be8d8fe3ebf83cbe3f8d2103d7165c1f91b1e91a9efbc7db67ce0ac38e93b7ddeddeb8f7a1daf7d4dff34221e0e66b6e729b7ffb64f9c594a9c2ead0923014ac7e33c4e2bb6fda28fb7df6176414c0f094fae6f9a16aedae40310fd086d5e6a9c092ad0ddaca2468d0f580cefe027da8832d8bb9e8eb44a6cc16241848dbf2f60e137c085fc2a7f02d7c2cf73b7c119fc437f1517cd52a0bdfc6c7f1f5e0e79e6956420bd6796ffac5636e0382f88843f4c9050122d2fe1b6f776bfdf0a449906191762a58519e7da7dc417f4dc40c344632c8b3bf207301a13e6f9c1bd6ac0c9d5397af19abcd5381255b13b4712d0b7e0a874407c3d0357d2abae62122e9f7ba8cf57d569b87053e842fe153f896e573f8223e896fe2a3e16134a32c8bae03008f796e7cf4576ea3afe4651f892c41e09dfb7fe68ef8a1c86a7f9dc26d2eabac61917664d1e1b568cf35d631b769ddea60209c29b8361dd4d95fa0fc3049852378b823c0f55b256b2aa385d5e6a9c092ad4e6c13cba1e7cf9915da4cdbd1c130745dcd373c1b9e33a0cf6b3206dba8ebde6af3b0c087f0257c0adfb27c0ef0497c131fc557adb22cba0e00678e1f715b9ff6d7ab57dde04edd768f1f8a3c620af2fa3d0fba0337dd11a2160f8858650d83bc1323be738d4e3e7be24878c55538430ce1ec2f508f8c3a583177608fbc4dc736448dd5e6a9c492b1a26a0f2bf3b8ef4f9b277bcfbf17f42860ce8ce7833dd7646c080060b57918e043f8123e856f593e872fe293f8263e4adbacb22cba0e00dc4ad8b7619d5b75c3ad6ee7f5b7868893070126265ebae3be3053b9e957bf09d1de2a6b58d099b527fcca1140b59f0747382b7186c0287b5ded3751a847ce4c38c5f64d1be2a29a164304abada380256b24b689b6f1e6229c9036d3f661ea9abe9551c0fe5dfad56585ae4bdb8844db99dabb2df810be844fe15bf898f6397c105fc427f14d7cd4bc85df405808c4a400b74704ae3bac42b8cfb86dc60cb7eaaae96e97afecacbfee78cd47258626f0f25df7bbddd36f75ab11c41bf354af120c9d57185ed5b16927c37e7f560a9352de380639f997239701723d8c7384db54a5cc95ac56fb46994abf455b3cb44d265a69f33086ff02f584399742d73c0d59c958a0265e2bbbf1fff93d45e043f8123e856fe163e26ff81e3e882fe293f866580b9095812fe3d3dac7f1f9b01068b637fc677ef7a47bf289dfb8dffce657ee17bf78c43df6d82fc3db6ef2825008efa46798b1d25f6facbffac6706b82eb13d87addcd41d03d2ba321d7f20f99d2f8d896ced5b3eb6175da69b743ddfee3ac34a819e99cf26e80af17562e5de44e942fb5a80280d5b671206f07c6c9f05bda3bc8d9ff1cea91d1162c5fbcb0ecff28a7da2efe8f4200007c099fc2b7f031f1377c0f1fc417b73ef36cf0cd10b8b2fcf8323e8d6fe3e3f83a3e8fef4ffbc1a53f70175f72b1e33fb040e08107ee0def95cb0b02a2094b0ff7ae5de336fff609b7ce4721861eabaebbc56dfcf92fdd814d1b47661150d2b15647176c5c5b4d007256b20c68504800a0fea58be6bba3e5f301d169c06adb6421faf328f089238706365213f9a52d0776ef8c67ff42d7b4ddd2c9a028275d7dfdbcd4a592cf93db87fa6db56dd8e053f8163e86afe173f81e3e882fe2934d437f7c199fc6b7c5cfc5e7a73dfcf083eee9df3de19ef05161ceec196ee3fa355dcd22b2f69874147e64ef6e7774dfee308bddcbf5c720493a53ff568e25b010478c72589352829e9c62787cd8ebb1922dca6ab56f32b09e5cbf3064efceed0359b3a1db003c5e2d01609893ad02f5490098ed4722225745661b231604f02d7c0c5f0b3ee77d0f1fece639807017cffb363e8eafe3f3f8feb4b074d00f1b380b342d021a57ba717ef6311c8c86f1dcc056a435417d3239b568de9cec8521959c56fb260a0ecfebc24486d52b96b983c6d2efc9a06597b670dd2d8196364f85aee9e350bf97a3c91e92dfde86acf68d2b6131102769ff1fdf9fa61b6c651867928e343b3b465502409c1c7a6e68b3d202f5c9e4142fbfe451e44abefef74d5857eecffacbd5cb43796720affeeae7a540d506e154083ae1ecefdb4a9ba742d761b41502c073a1efeb724659f56fab7de38c6e67f13e001a1c1b6d651867aaf6c9b66a2fd1f0d409b762c9a2291d01e00c3cadc625c0be9d2c0916792bb9adb64d0486ffe5e7c5d46bbe79d927af0db3f24c8454d7f13f238d3002f0d0e661eb1ac29c8baf9ff70ed2f7f1d65fa5e75c6eab6de34cdec66204902ac0ca38aee876256d2d2e0f5817be6ad968cc01f0eefe7dbbe49980b44fc06a5faf30ece355dba17e150036af5fd7b7a5dbb9dcd296d52ba29e23c39b0308df2f58bb3ab43b5e06c4bb3de53301e5a5a2b28f02ab7de38a6e97b435b904d058058c23559bec763224e663130c0b0900cc14f32a6dcb9006417917c0c348a4fab6de608cf1f89183e11d04a17e1500788d386f17b6f2f48a9659b7830f7a04e72f744ddbb76fdee4d6af5e35e95797e750deea15cbdd66eff4bbb6c5c94ee620707cea5f3877b6bd1c3850e9dd6adf3892b64f282f016cac82c60dab5dda28f9dede166f18182460205c0ff36aec15d937f8fa05c6c9177db8372db7a660b50f3cdccea964f4ff8bb393d5b689c06d3fcef64116150036ac591d2e0fac3cbd12e5af6497b66cddb8ae747ea0ede81ae7dce9ff4f3610f0f5a23538bd6f9f942bf09b8f8730f2a06e822d7d5fca2afaceb0da376e58ed12ea01a0ecb48855e0b851b5a772fceaf7696f205bc2ac3086c1b52933f14c88eddfb3cbf1e9ab7e7c6d07c3e6e31a9c69776e8dc61956a7158b53b82dc548e4c593bcb62aca95ca1ec9dbd62b0cf3f9b660ee680480b3be6e2b4f2f58f2c6ed53e12d34f21c4068b36f3bb2684745370cd7992f68d23bb2139ce5632504ebbc1c81ef24d097f4291f35a55eea2718885c95bca97de46d1b47aab679b46f17db5500608746f67bac82c709dd9640d2be53e1c594b214983304c346dea94f5eee9feed9b13d0c9b572e5b621a644e30d0a54bc2a7ba702cfd351dde558f5162b0b23e9d7a5998622e4fcdc8dbd62b2f9ee20bc35b8303689969b395be572c99051e52e1ac2f9701b45d74834ed08de849e0cc8dae7678f82fc1b313dcea94f52cf425f9c3179d8a00103fa7ae9c3fb379c8db366ee4ed49fcbb200600d9e1b743c630331a7f0b79e1e346d916d55681e7a7e5e31f9c21f870e6b143e99aeaf032c6037bdd9e9ddbdcd64d1b82b3ca9774701ebeb6b37df3c630c3ae0d91aff41cdebf377ce70ee7a32c3ec081e197f7a57dbd7cdd37bec3de382365f26ab92602f2e0589c11f9ec17812a6fef44d0322604f9e3b26c86e941cf0401df7602247a422794f1e2e9134157c888eeb42e3bb16ff78ed047f9a50c6de3d5e3d417828fffcf371e6b322a3debfce348d2368db4b3207e1d18748232431a08ac8ac605dd8e40d9ce537ed87dd40f25aba7d416fba1392be59aee8bb39882c9c3f8b59c232eff920eb7d3da56d6f1092f86ae72fdcfc74738239f38c273008c3c0abd277d516195d90bc88f0c380ded3c7ab03f8f6dd76415f97d7df2641d75b2065d74cd509e60843c5699802ee3978deabaa60fe88ba6456cf4216dd4c3ff450be6853e2feddbd0b355d6b890b74513fa81f6166d4e3f0f9e28a272febcd0bcc27140cbaf1520ede4c50bf27efa38345d6f3f10a5d8b67943edfd6bd0b634530c92cb0439fb73ff9f2f099ff343d552a6a42fea5865f70a4ed3e438bd92ca57d94ebe8fa7d0e46bbfb49d20c87708db022e583a45f7f441be5f431f527e7810c8d747bd2c49d632a5f610b1ca1a75b4fc15b4d1ea8f889a03d08974a6e6cc8225cc2812e46d712cbe4dc75902962c981fce566dcefcab5f3e5a5f3ce3f53867d60be93e05b3fc5c2a84c53fbe1e82cdda95cb8c4f5b7b82acba2f2aacb2a7925cbe526e43dff1a52051cfc0ed41748d6eacb221e8340b56e89e3ed0fb344c6a526e38fbe3fcbe2ede0c5c7b27a050c86a95358ad4e4af217653b7211965a67300466749e6b60a73c146154b760d6f5fe1de3486826172ab8e8929ab2cb8ebee3bdce92c0070467df4d147927d42321c2dae47972e9c1f0242de4181d01ff5fd9425ff47815cbe0a2fbb6153181f13aab41f989c43076da300749a8f56d03d7da0f769e83bcefe045bfa940fbef02d0253d70aabac51c492bd22fa6d6d7fe6eb3e0078a572f6cf0ea4a48559c28c0bd25e8c30b43becabf6333c943b027c7196093f99a04af069afbfe1badaea39d697df7ec7ad451d2abd87892d56a385997f6ff89c8db8f577e604afa72a749ce85fcb6793d7316c2c992a8a3619fbcf1c3fecdb1f17e5a00b465f9cad0fef37e602bc2ed169fea429baa70f2c5dd36794c71781a883dbac6c734950cae5751df38a2dd4cb1927b47e237a9f47f9b8b4775a1c0a78c20e95486594c2f30ac791d8c9b1c3a312e23e51d8c92387dcd60debdd827973c2f5298b75b8fdc444932e87b311c627b79a0426a6d85f3b5bf9fddbb76c720be7cf0da30b26c230fab8f2afa81f790295eebb41d7334c2c59448fddfce68c1fbebeec0300d7e89cad715a74a5eb115de7fbd1bda56bfa8ab209b604d9f97e84c1251d5f20ce752d76207ea0cb1957d0adfc2fd17e4ddb435b5909e877964120502452e4158c2bb13daad30bcab6160a62c10aaf8ec660b847cead2a6e49e5c3d33befbc3ddcb2d2fb586a7bddf5d7164615f7918f996e6eb971ef9f0540dc46e45ab87a1578a17fe4d13241e8bc6c5fa0daa7651806a91c19a6acd97edf26da1ed643cc9d132e0358824d00e01e7ea26b9f0f9da25b2d03baa70ff43ef2713b9072b9d45aba88751971ad43ed03a1bedcd40ea27cbabc7126696b496c67f079df07f5db80caa8c02a785cd16d8c0e2a1deff7291df094d8de9ddbdc1e6f8cdc0d60c519f7f7b9a6d48679f7dd77d62601394b4dbff186a2fc78f6dabd636bb9aa8d05423b7d59f1c51fb1332ab920ffed111913246f754ccb3148523920932fd894df57e894371ed78e87ed986fe7d64de14128f443d025581edcbbbb3ab3fbffe8341f01a07bfa407ed337b298a8747e5f26ffb76d5a5fd627a436501dd3758c3bbabd49fb431fe949c032518a55e8b812da133a9bedd8f1d5ef1456adedf18ecb32610c8a25c12ce3e5ec74e6c4b1606cd7dd70ad3b9acd5c934fce4a18ec267fa60fcb6ebd11ae5bbd221837238c57cecab3e8a9f1057c7f34c915913c318db44db60789ae276ea7b294143675ddd557854f84d782804a4f5b37ac8d2b1371d6654b1685c0bbcf3bb30458749abfee1addd307f405776bca854365c09d1fca639ee5dc69adefaadea8e7b84f74aeeb1877a4ad358afea96e031a58058e3365bb24e029038897413a0d9f623e1c4702dea0806125672886ef2c5dbd61fa75618d390b55cef9325972ca35fd8d37dde0768521685c3accbaf66d61969ba5c0fe5222ac1d28ea43169147d5ad7fe7c7a3c1666932acf64f06ab8e88c892cb13758bf343f84c78ad1dc229efc04783d373a6ce5753a26b741a74e7758caed139ba0f7de08f4b5ae92bbe3d88f3f35c41799925f5a35f4fd073a1ebd226d83ecf9076599801c02ae47c206f5ff85d1880468202b07005c3e37200c3c2c8787d37b708efbaeb76b765c3dad2f860f3fa35ee9ebbef084b5e49c7c45f304a3f92c0606b4fa005c3ab648846e9b79541d67e07a27cda702d74fb27425e96fe2d3268f905daa103400c02ff524ba7f3a31b7424ba167d330a43a7e856eb1addd307324a933ce89acb8a6ab9af9231d16bdc97b7557e9f6f94ed56fcd304006e19313b6cb5b7c21b4470403198c240fc6f5ec0c8ccb218d8566f7ceb572d0fb70d19720adbfdef154b16b84deb5645a3f41040f8c043bdbea24efdbb70f664442246dbc1d9bbc1d28dc6ca6393c9ad10e7cf03005497023e3f7a069dd7ef3f75ec501974716e74894ed1add635baa70fe88b10348a20c0875ece854b2c5db66cd7ebd4b048c8d2cbf980d5de5a00b0328e3b470eec0b06837170ad98b7b902c3d0a4c75f3a793ccc2433d1c4107f9b1fb24a00a06c1c9e67de572f5fe2591cf655f7f8d3b24c0ae7378f813ac6b261ee99f310d2aae54b83c3e07049fa92e6fad18fb5bf0d9c846fce13100feedb136489c72ac76f0a003108cc08696300f0f9f85fe41718d9a03b74882ed129bad5badeee2f17f8a8ea86d54c1c6e0e41ba7a9cba0926256718731211e6119209c8f38cbcbd4900b0329c0fe0b07276c069749b9ba90c2647ca65610a770c78b30c1354c072d6308c2de60eaadb7c5de08d9e72cd630a2e4b7879284188a708996790b906261879edd7693fe239533c2813be02e36114c4a3cf7c9e9bc94cd2028e135e317df8a01fa91c0edfef27fd59263b7dfb5e3a7d3c7caf806b73ee88487d4c6e72ddcefbfecb49cdc2f1a373db0100246d74fe2a7da573160bc500802ed129ba651f93ab4c0ef214e7d1037b439ff23f5de22b65e1c869d9d47fedd557856d0d1385a13e6f2b9c34a49fcf37749ba761286c5809995d25120a569a518736e8eb43268c6a67d9fc7761281aabec244d510641815568ac38abbf732ed25a8e45969f36c4e1f1d6f038b238a4c00c3813907cef80c9b0e5ea7eb8dc1603ee4ce8dfb5636a5f5e076b1a58be8b0c40d041b6d2d90a72c717b83b50b6a9481bf3c67d38ba4cc032ba419f04b03081ead3a26782005f1b22788520e0ff13b8a4dc1088425f42dc27772592fa0b5ef12319822375c6364dede7ed278af659ecdf4a437bf1fd694f3df5b85bb674915bbad877f492858185f3e7b8c50be7b9e79e7bda3dffecefdcac99cfbbf97367b9c58be6bbb5fe9a6b4b31143be0a3324ae7fa7654030446a20300d787a1c3c5a9829114db069421ff2df2f49db0ca10acf4915446f42d460a2c54ca1d749070c9c11d11a91f5895a7650c327bdde68e9f6339227d86f363637b77c5910a7686c186c7ac0bc3965100230302044180fe0d41200b9ae2f8b57a49a7d2528fe8b65f8f49f71b7c0d1b40567c1079f1497c131fc557f1597c171fc697f169f16f7c1d9fc7f7cb4f835dfc0305bf2f8dff2ffac145615b3e2974c96597b8cb7f78b9fbe9553f71575efd5377cd7557bbfbeebf2728de1276aa61f598182967cdf20c91188838583d185865e6e4799ab0f26a62baf680148fc70f6db29250dac6b2d79e5f5d669cd93bb176e58ab24e8133749c744b6504ed746d8843d22e9c3e38bf0f0294cd7c034e1e0280efbf70e9e50301691979f01017ce4000201090562ebd72c7cfebcb0300e55337eda22cab9fa61a7c0d9fc3f7f0417c119fc437c54ff1d9e0bbca97731f27ddb4179e7fc63df4f003ee96db6e7637de34dddd74f38deee19f3de81e7ae87e77ef7df7b8bbeebe333c89454459e0a3c88c179e75cb7c14d9b96d7358bcb16af992b8a4b561a831d510c5e94c9c9f33897474ec78ed6c75c7b3cab3c8f34526565e9ea77226bd1dc1e9b8369733168b8c78daadeb40d04300a04c163589d3077cbde8f4e5706bb39293a1bcb4c772be36aeb8ec5277f9a5fe24e361fb87975fe67e74c5e5ee273ffaa1bbea273f76d75cf95377ed5557ba6baefaa9bbfaa7fe24f4931fb99ffef887fef815eec73f84cbc3ff9ffaf456f9420c0051defc6440d0a17d6d2f29994af0357c0edfc307f1457c12dfc447f1557c16dfc587f1657c1adfc6c7f1757c1edf0f9f07278a123dc3a4901f5230bc60a28588cb751733e732c41fd5a17e133c8147671200ca61aa44fd10000a23c8b0ca6aa35e465aae95a7099d2fa2e594edaa7c66be99b916c72410f09a329eb30fab100d87966bfc4e4160e5528c6c4d786baf948fe38789327f264ae549e562db72be51a0bc0b50da82c81ce7586827230fab7f4615eda3f82cbe8b0fe3cbf834be8d8fe3ebf83cbe3f2d2fe47c83c6d2999c2599d5ae8c53a38dd62ea71b7419fd2d2b75aa5c5e816be2f0aaaf1dd5873f81c93a260bd7ad5e15de95cfb3f82c54e2d5d8c067c298d4e3611c5eabbd7e4dfc8886becee7961f06856c0c93cb4ba992422e826a08ac71bfe57cdbb66d73fff8c73fdcdffffef7f05fc87fb7415aa1ed988663f7dc738f5a9064eb512eadb09dbc5fce37fe69020067ad788fb8dee1395639dd60950556da4e58e5049473599097c8ce7570d34b3509861ab9e66d8272e4cd48555dc8a165f1db85f397b701fd7eedf8389fe5a87a5faf34e597b2ad3a3e78efdd4276a16a979e03605e41f7c9f9c83f4100a82e01180e95c69a75bc6095d10bfd2c2f2fab135619ac03e063208c0cb8f71f7421ce5fe8c50a00383d93600c1ff3cb3eabee40e6fc0cb3c5f9fffddfff3d71422177cefcb7854e6339b8eccb8fc9f6277ff8a894310f0447bcbd049d781826eb769f8f9cf70180284e67d2a93841dee11a2bff44e86779793952767edd9aa76b828769589f70fae8617f5d78d81d3f7c30ac5be0d97a99efe934a1abeb4ce5f03a359c1fc4092d2c276dc372ec3c9f9546b6430008b28b0d447be0ae82cc6f7019156e39fae3e733e77d00e09df07256e3ac47275bce0f56fe89d0cff2b47c7570b8eab795df222dc34ed3469937d4ad74d9e0fc72cdafc91db6695f139dd236393ffce1c30f829c61e151213b231766ffc32591b715468e56dbcf37a6f154db9a55cbddc675abddfab5abdcec592f845b0a9b37f2b18b756ee3fa35e156038b0c56af5ce6b66fdd14deb8c236e949b33fdc0a1acddb80447119fa12ddd9ae26b0d24060e59f6a5239f9efc1d1b2b33f58f92d269247a3f307c22820cac8711efd15e7d743ff36a76cdad70be417ace38204001dc09833111b61c27354ed19900d9fc3f7f0417c119fc437d9c657f1597c9734f8323e8d6f931e5fc7e7f1fd692c1eb8f48a4bc34202908503ecbfec8acbc2be2b7e7c85bbe24791abafbd2adc4bbcedf65bddf5d3af73d75c778d7bf699a7ca49a25104d9e854e96066796310281caa30022bef54130cd524ca5cfdb7f30f826619e27f4600acb5bf69fa0d35e7ebe49cda8175da7cbb2d8ddea791fd7ff8e8c342de283397447a32347fcfe3a8813de373f81e3e882fe293f8a6f8293e8befe2c3f8b22c06123fc7e7d93f8d4503440896071221e6ce99e9962f5de4366d58eb76f888c25356fce7a10ffef3782693434c90707dcd431a4c1459828e125ceb4a00e03f0fd3303aa80cc1ce37d568f92a392ba7aff60d977afd5ea66254a28f7ff6d7bfd41cd102e7b4b0d28295562369f27cf0f187bff7b2451d22eb417f3615db383826f7fef1397c0f1fc417f1497c53fbaaf82ebe8c4fe3dbf838be8ecfe3fbd38826a288f39d708f9c8e2e3a9ba704e3032395e18e1a229bcdd4c96ec92072e8ff1f7df07bd30935b9f35a58f9c04aabb1f2e800c023c7e5496157fdc5afe72bb41ddfffa7781c58e07616abbba4c319f6b18e5c82809567aad1fdd38695779058329464f3135f7ef965a33342eeb43992a6d77c429eef8fe112803e3f559c39e375ff285fc6f613dd37ff142f04c9e1314f797bec7e1ff52f0480dea9cb908e0440d211007227142c87b5984c5ed0f93efde40fa58c2c14c3f9c7e132b61f48bb857fca0020f0ccb95ed26aa5996aa26cf16c65391958f98681258b85763e8de5a86d4c267f9e577449f01fb7e75b2643de37b5000056c6f31169eb28b73bca365e01203f963ba0fcd60eda0dba8c89e697ff6fbff64a22ef3f03ba4fc4967c00182da31a26e3d0664bc6519455cba6f9e883f74ba79ba8e36afa911ffef051b116c093b7e57c44f749c5296b04500504aba0f389b4dd769aa966d4e5b3d0327ff4fbf74ba7132cc71c26c8c0bcc46b2f9f1d2bbd4e14dd1f39f1d360a5d3f35fb00b3b5fd04a10ac7453cda8cb6751c97cca7d6cdc06b49c7298881c1fbecf5381e3a5db89207da17d5bfeab1180df1166c32541c42af07c40b77194db3aeaf2594479e39381dc72d3ce0f96530e1be4f8e2f3cfc74eb7bd22ed933ea988fb8a00503cc6a90e0856a1e34ed9beec7eb59576aa1965d9da109947d1f94164f9fdbb6f8fad8ebb41da56510b00c58e1000f2c41556e1e38ad53eb0d24e35a32e9f85c8fbda4b6746360000f2fcf52f7f1e3bfd7683b429905ce6cb363e1fe600e4ec2f076da4d0bca271a36a53a104b5cf4a3fd58cba7c1622ef7b6fbd31928e2f886cefbef9dad8e9b8096983b4c7c43b3e3e0ff5bb00d9b038eeeb1c20c6930b01601044794fd56e01e60e380a20d75fff5c8d02c6994af79e469f2df6177e3e2dbe1db5938367c743e1791e6b9f6632c7aae3e195d345f4ea66e4d20bb9218f02a32c5b1bf4198fdd8eb2f383c8f7ceebaf96baee056d8ba93da6765b6732c7eac7e357a2f5fe8632e404ef652d5edc527ca72da748180a96c28bffa1b179faacc2fa719bd75e3aebde7cf565f7ce1baf7a5e736fbd76cebd7eee45f7aabf7eb4d2075074a1f0a6cf63775bbf468c77941875f92ca2bca7dcdffef6d9483b3f4800803f7efc6198b7d03a0ff6eeffeb7625c7837f883daafd3a9d2f139bc6b6b1716c1d9bc7f6abf4bd90c9e0a9eaae8e2501498e0779e376f1d216e3bbed2a71d9f0625f9bd355a402f2f82530d4d20ab7c83b46b6fff2e74fc33de577df7c3d961be4a82b027299bb453a7a941875f92c90f50d6ff0799f8e2a22a7c88a935a3a977d9ab0bfb0b377de7c2dd828b62a65e9b29bf669f011f197b42e6debb6dd57f6cef1e81f89dcca5ff0f9320040f5a9a4980827af397ae1744d8e074178af0471764bc9dda2f3e5db948fc22d199a3aab13d2d1a3c4a8cb6781ac7a0190d8c02813e4fcf24bf7f9e77f0b7706e248a0f005d5ae1c6c105b9432a4bdb2dd0f9a83429de8b331009481204b937d2eaddc08d704694119ec339cfff597cf7ac57d9e08ad15db0949ab91fdfabf059d952ba6adc3da907ca344942d35c4510759596527ef011807bef8e28b604b7ffae31fc2505d6c42eb5defc3e6486fd9245066fe3f47a76f234fcb02a6d75ff697c9994c90cb19a97c367f61ab27f951c28b1d8914bcdb8dff912bfdef2bab8243303815a2e53b7e689e0781267245342169f3fc4dfbe914be7083cc42257b4407b91ce9e851621c64d4889c38d1efdf792b8c04fefca74f82b3601fba7f870d4ece43401f7ff0be1fa6ff39c8f4e73ffd29dcad78efed37ddbb6fbd112e5d743b046c07dbc2c672bba3ec7c9fdeaf656823cf6f81f3bffbe61bd508459d90735bc75ff9af5fd26a60ee6ca474a0301a001504dea88280d5a0bcc1dd929793a3d36cddbad5945b4021a2b09cdc98478171905153c98a5dc409356c8351e2bb6f45fbc8fb57f3b7cf3e0bd7d0d6b15ec0513e7cff3df7c78f3f0a677526f8983f0a8ee3e14120644a26e25ed2f20bd1c170226ccbb2b9267299bac52a0b52e7f7b2e17be287feb77176ef0673a749e2fcf23f6c1741c0efd34140b01a39117499baec7c9f25bb30e800d0ef72fb5dde20e9242b86fbfb77de769fffedb35adf7ee9cfce9f7ef247f7f6ebafb8f7de7ab3fdf2a18b4b0b461ee2ec25993c39b9ece2fcc0d934b733eac9f7c9fe7ea0cbac393fb229e797ff130802e6ce1a35c7c92aae94551f09f40bad108d1c93ff77df7db7d906a01d7667db46d10b569960a5ed967e973748ba911547e4f280b3f3277ff8389c9d715656e37146260f6767ced85610f8ec2f7f71effb4b0b8e33a4cf8f7ff925c3fc0fc36db7bcee3652b9e3094def634e43ead0b66621e9fa01e589f34b102b65abf960041bb76cbf01736742ed362150a9461d7bcd0fa5186ed11956a3268328582b5cef631697fbac563b807901e9f07ca233378a5ed165452a23b2d277435a5e8595762ae955c690a6e5cc4c30c0d13ff101824b823f7f1aafd5df7ce5e5909e3321b7eb081e04913f7d1287f92c3fe6585e5e3788dcb9f3036f1022f8683bb4ec4f8ef70b7c88b9097c2a91a9c5ff40dde6eb84b9b3846b9fb2c2ac92567c27f03208ab51932557be28fef3bf45e7c7009aa22043b9a8b418e5f56d4dcb28baa5d67e032b5f27ac72042bfd5450976df2fa845096ef4b460472adde94a62d98744b282b717ed9f6ff7dd95c9efc9520e047264d36d86f087ad2aeae297cb5c3e49f60ee2c490aed32088842df7efdd5aeaed7268a563eabcea8afba462a573a25589732930d0049790dfb647faf58e5e458f98681258bc6ca33ca586d4802421904eaf7fd070523e976f932323fb57c20c3dc1988937e28c0d34500d0ca84410680c4f9fffad7d031daf991d56a532d002872f9bbc52a2bc7cad70d56591656de4162c910a91cc6ca37cad4db50d8be6a1341e02d7f39f0974fe39d8a810601ef3bf850b39c06a59f46b9bb98143477aaa1bfa18440fa3b1712de38f752704eb3719344144f34e6fa4c3b3f75f3dfba0c18440010fa558e46cbd72d5639fdc0aa2b22b650d984957f1c48db2464c7421038e73efde493d21673fbec077c56ad6932b392132abd57bf3dc5c87642eb00aa5b7e5290a02baa6812f2fdb73bdcd29928be4c267ede7af59c7d8de4a3e0b003c020b0e4ec05abcc5eb0cab4496dc42a6b1c48db22dbb23f85094916160dc2be2913dfa19e66392d0ad94bbfed786bb0beb33cfbebc2643b90566a09287066e6b54bcce4b2c8e3b3cffe1a5686715b85f7c54d54797ff5e5c96da336f2b6fdb3058026265f4f6107c990538ed5cb1f17741b4a42fb6cb041991398087ffae3c7ee8377df092b12f18fb010ead33f855594f88e25a3509747f96876d26e1905d477ce9f3d2364aa155a14a6b104cb211d8d09b3b9386d71c6661f4b88b98dc3ed3b4b4116dc17d54f6c25486715ff71f8723463c8afb164b790b413c9db2bba8ec9d3defe8e948e9e95933988d58e7141b7a36c6b71266d0a04dc7afce28bee973963ebd83cf9ca9398f705d6f7bfc61affc23f2cf972b41c11e91f21eec7a72d5ff7a43baab3bf1496172cbf6d817a2594e51bcc7cc1c71f7ed0386948948d6bb73f299dbfcc2fd0410d9d14642fa3a2753ca5262348d98d7544743e5dce44c8cbd5bf6d79dadad7de76ab4e8b46391452d6b891b723d119edccda2a79b0496c93c941cee0960dfffdef5f061b7fe3959782cde7754f142d4f9457f773b5dd300a4877d487c876619620938511c107efbd13eee78bd258edc57aee101d898c59742c65338c30eecfe517541a134963a4ede870f57dba9ddda0f3e5f9c33191c16c9f1c93fd061c4bf2a67594f518d8c7dbcb1a17741b6afa14945e937c857d7256c76659deaced9887903a0deb274a295b226f2abb3527e64977e80c6d5842f403ca6634c0d250ee81ca249f95566834f460e49077a2ff2dfbca34722cc2abc7e47fdc566518e935b5f4e5fecee4e91b7f87faa50eff3fb427ca1ad735d4eb2ff7b5ca9ed2764c8e57f555755a69c701913fd0a2278e59f9051c9d3b050cf379d2303c623c20e707534683dcdf3dd58fb609328d25c05462c9183a4f93384465b0e522a090263faef75918691a9dcfa6b50d3985ac75a44eedfc46daa48d75b44e73b9ac63a0f34b9d56ba71226953693f75acbc538925638e310aa87e58192caccaa7929a8cd2691a2b5dee28493ac381caf4722c6e379f71274a7b7912b4eae87c599a8ebaa8eb55683b06dd96332ea0bbfadbb0b2df1e2bef5492cbd784f6794fdc301ff831b02a9e6a1219718e00db05799a4632a711ca32382ee4fbe4778e71cc94a92d9d3f96e4f1065a6ef70065a872f232b44e356dc7a02a23b6c14a334e84b6e47d2476a5f65979a71a2d5f13d9834271a35af853cfa0b12a1d0512393bb44130f3768538a0e1b4e5feec5897329524e9f37a8cf23d136f4f44f2f74abfca1915aab6281d67fd67e51b05b48c358a36640b83e4d65fd15812350c31ad0a47054bde36bacedfc1715bf39b797b755e3b7d8ee46f2ea7337919dd52951103e3f940279d5b7946054bde72541c7e9fd2b7048dc9bf86206055362a5472f6ee2c8295b689c9e54f656c2f6700ed31029395bf1762395156ebf838a1db92eabfdab6f28d0a95bc0589f347d46460dbecff783418529975a7a558798534edc4cab1d2b6619521b4d65f74a8954f93e76bc2cadb2dfd2c6b14a8daa26d20b5072bdf2891b641ff8e2401c04aa0b12a18452cd9052bbd4595c72bce385382954f53cf532fcbcaa7d16953d20eb5f2e6e8f4317fdd28f23c2f9f39e94e1c39e80eeeddedf6eedcee4e1f3f524b23742a6bdc08ed08fd1575256b42c6ad7d5a668b2a003418bac6aa6094b064ceb1f25954793a3b4a13693e5f0e3a567ab6f2e4d4cac8b6ad3c16553ec95b6f1748fa53c70ebb3d3bb6b9dddbb7961004cef9a1a42e57682a675ca9da22baaaebcbca374ae4f2d6f0b618024039fc6f09025605a388eeacf8bbf736e83c3956fa26acfca2632b7d136919a9215ae99b682a439074674e1c75bb33e7171811e83285aa9cf36312b06a4b654ff17fc4ca338a54fd9251d861b80c48aeff1b828055f828123aa70f7730aa7c695956da367439fa779eae0d492fe54ca40c907c51165b470cfb39d38bc3ef51ce0ffb77efac955b2fbb7e7c1c89ba8eba0afb18fd04db1a9f36eabe2d513e1e024072b001abf05124748e1100acb46de4f9052b6d374ca60cc9a3cb9848399094a183bddf3e77e65470f0e0ec3bbcf37bf8af030010241acb0c4e93d6398e485be4b98a6053e74b00c84803803102b00a1e55a4d34af98bf658693b51965160a5e986aa8c893b475546c44ad30d6519412f859ed8f61cd8b32b387838eb170140b675206032506428cbcbc8eb1d37623b94f317fbe492c0ca33aa88ec25998fd7034096c02a7414d13297c65d60a5ef84ce3fd132a01fe5f4a30cc8cb09f8fec6c80fefdb139dde7378ff5ef7e2c963eea4bfe64f46017e9b7df5fceab7c7aa7b9ca8dae2ed4805008d956f1449e436fcbb080031b295095422abd05144e4b5b0d277c364f383966332654d363f547268a38e7dfff2e913eee0de5deec461efe0a1ff4f151382d1f109005c229cf5fb244f5ec6b80d919bd06d8ac8be0a2bdf2852ca9cf876d5aed63900abc051a692bdea342b5d2ff4ab8cc996d3cff64839b25da33801e0d004046e0b1220e4782daf4f2fc363d0f58d23b15d557b92b67aac3ca34c2ebfe6bc090035d9c588274159d624e94739fd96a58db6b45659795a9d6654c865cd8f6b62dae6000056be51c5925f38cf02c06846eb5194a589b6b4fa58539aa674534d2f72c6e3daf9fdffe28422fbac7ca34a94dbe63c1c01a441c04a3b6c4651168bb6f4d63148f347a7b1d24d255ac6ca91231dd397c4b6c96f2bdfa892b623c50700dfa8a01469dc68766227f2860956da6123bab58e0d9b543fdd197437c725cda8d98ec816c0ceb30000edf9a23f685d35e51965d236f8ff85cf4f2b1f15f4ffabfb9ee31e00a4a176da6123f258c7868dd68dc64a2b7473bcdbb2a6825c3e8b7a7a7c20fa82a5339d7e1c08ed11ff0ef87dfe7f11003242e3ed8246953cb2f76312b05f8c92c1681d69acb4ddd2eff2fa89255b4e7b1efc21df57cf33ea847618be5e5c021484c646ac424695b263b2200056fa61338ab2e45869bba59f65f59b5cb626dad36bdfa8f6eb7a469da40dcadfa755c39caa51e3d6409137908f044680519425c74adb2d6959a375f248656ba6d7f4a0eb1965b4bc95fcf45311006210d007eb858c32b9ec1a2bfdb091006b1d1b36b97e72b9da8eb531d17c832697ab895ed383ae67d4a9cb5e0480fc80c62a682a68924bb6f3e3f98866aa19ad00500ff65ab6a6fd6de479bacd370c2cd92c7a4d0f92be29afec9f6a72b9342319002c59523062db90850b938036228be8a913797e8d955eb0d24f05ddc8a2d3e836e4c4e396dd75b647903a868d258b100280750910f70f17a9b394c198d483286f267363daa96714658974365cab0cc14a2f58e9c701ab2d903cf1d8606ba2cba67264bfae6f18e4724419a2acd342c3cc060d6f32a75eb75037ce2a7d752cdedbf4db463bf2baa68251942552d76f85d26fc68ba74f84f7029c3d794ca5af93e71b07723b0afb268ae9571579dd83c2ec672f1bbedf7009d0dcf9fd42caaeea9c38baccbcb1726c2a193d59d0916114c631c977ce1bcb89a387dcbedd3bcaf703f0c2902307f67a63b2cbd2f58e03a5ec99e396c73a38b4a61a3134e93922656b39fa4955972d471200ac4b01abd0899097db37bca2d37ad236e86353c568c9827e844ab68afa7ecef6fb76558e9f73eae8e15a1eb0ea1f6512f971e040a12bf99da7b348d235e9b91d4bbe89502f3b95a70c0071097075a0dc3f41acb222524f978a6990aba45076b9cc31945be5b1641b36a3254b377a8f69d0e7e1fd7b4ca70f142f0b092f09319cc3aa7f94c9e5afda146daab231956612d4e7b264bb5e87256f37e4e544aaf26300686954a742ad7d9d69aeaf46e8847a7af56513df29453a65843204d3724f15a32207887e1a11bd9d39e50ef092d0e26d409a4debd6ba0d6b56bb6d9b36b843fb7627f93456fda34c2abbb7b9a44d5500b046cadd126dd5ca9fef6bafc396b98e3e9e12cb9f76edd557360854256a2f089452324348af85a49ea6ed76707af551c312cbf8845c2153c128cad209be0110de0cac1c7fe7d6cd6ed5b2a56ec9c2056ef992c56ed7b6cdeea553c77d7abbffacfaa7024b3630d3b5d812edec3c02683fde753dc57f5d5e7952eb2883aac790271cf365e0fbe97701127cc656217352613bd394de2ee35a2f27b2a65c19b0d20b34b689a6e3d6fe6ecad3e8b479de8996a3f73595d1a96cc9db4cd43f677f1d00366f58e7962d5e543affbe9ddb0be7aff25858320c8bba3c7539cdb4d87db07d9f3ef38176e76b3bd642839fe9ba9213a9c8561c6ba5252d3e640400120b7a5ff78dc73078cbecd1037bddb93327559a82a4c1922fab2fd425c87e4d963e399623c79bca6bdadf469ebedbb2ad7c7a3b3f2efbadedb67df97eb68d74f485ee0fbffdf29913b5b3ffca654bdcd2450bdcfad52bc3e8a01a35faff65fe7af9da21874d2e8b452f699be8267f6f75547d85cf69e7af5d7ee4fd97618ec08b7d61042d09e54074f20a7ed3e1bc1196db3e7c39e6f8e103453a95b780d749efddb9ad7ca7fcfe5d3b92174a5664f9f3f24a39d43e8b52015da44dd0e99bb615a52223dd06c3764897a6ad4f0c75c69645ca318e656dc979f1e471eff45b621f863edfe68eecdf5b7e13202d5386ab1e55ae38d65463b6bf204dd71d3a4fb7797bcd234e1ed3fa6dfad753d94681d87ea9777ddce7f5fb85f478fc5d0f0025312167ef83c5072312bc63733ff8a553a963e3e87b776daf9d3db885648e04a0142e2715b686ce1714c47691beb5cc62bb749a2caa966555540a048222fb549e9cb6632531b85675ebffecd7692b3a1b8fb5bf1b792a5e397bd21ddabbdb8fe27687e0dfd877adc43aa3114f1d4197a13fea3a48d3c5b4791a8d4eafb1d26aac3c60a7f532687bc3464a3b519026b3d384e278b0dd8458d6fcd933da0200191b9cbf0027dfe79dbdba0e3c1dde2b2f678d24ad87cf4cebf22b6850d3effc580ba1b1457a1a9a1f2f516596e9f23a05d9d72d7939ea987480fead8f27e47973597a97adc9e026d6cea6f2a4acaa4c6df0c326972567a2692dac3c60a5d52469e9e780daefb76bce5fec4f6da8d8efffc772e2f17a008062023009001c280b3b1daedff33339ecd8b2d9ad5cbac46ddeb0368e047c103877fa64580c12d21b79802070eae8a1a48efad94fc3be7cbffedd96d7269cb97dfaf48c6ed1544f5b5dd9b18e7534931b46249729fe96b44d4625341fafb7a9316dd1267dbc96262b2f4f3b4cb40c71db964defb390746d4c341fc4f49c99fd7f74acf1fbf49daf7ffbd77f0993773870357f57b52b39097acc00e08f8709c0da08a03878c65feb59cecf6d2066809909864debd604c766a878608f7dcf58c3cc712960cdf0f2df4dfbdaf637131551e4f3ffed20d0a9dc86e34d6595fbbb97b76e18cde8b4391349d794bed3f1344dbdad56fa4193cb10e54a65b3d34f5cfe89e481325fb0d102b59f3b5d1200fa8eae28567e2a4cdce50160d7b62d6126589c1f9815deba717d080256c0c821ddf143fb93c675422ba9f399bb4a9f2836c176469daf396f448e37a76faf23feeeced0d234dd1b67b7c773acb4d0ed710b2bfda069aadb924befb3d0f93b31993ca5e3d70240b5e8adefe88ae0a41fa60787568e0beb56ad4c9c3f04000ff786776cd994a46d63cfce6d0d934aa971b72aaaa4ca63a517eae9bbcf17ff77e778d5f17a3d60a7ad1fcbc9d36aacf4d0e938e8723aa5ef741caa726877773a9e6a2a9915ca01ad3c6d4c365f5577a5bf81068058795559be0004b66fdee8cff60b6b012004013f0a6075984edf06651feb300ac8959333d9f41a2b7d4e2fe9755a4da7b4d67141a7d35869359dd2f4525e37694097a7b1d20e1b4b8e5cce92c211f3f49d90fcd6b136749d15d12f073e02100198d1c741f300b066c572d3f98100c0ff8d6bd724799aa0ecbd3b641450051e4dae9c9cc9a6d758e935934d2f744a6b1dd7e8b4bda4b78e09babc4e69bb212f2f3041479a2c52a7c8916feb749a6a625a7ef7c664f3c5bcc850c931b44b8030fccf9c9f6bffa6b3bf8634dd5c0ac8a5057301b9b2c1524e4eafe941e799685eeb9885aea353be6ed2802eafdb3c9d186879387e7646b3f20c0a5daf4553ba7097a8b04b5dde30c8eb2708b05ddeb21b04d2703871f840edda9f35e096c35bac5adedda5004186db8755432b2cc5e4f49a1e749e89e6b58e59e83a3ae5eb260de8f2bacdd389819567383f58790645556fddc6204993c84afa485ee6a049ebaefe0fed2e004b7cbb99fc6b834745757e8b30c9e88340b5b4346229a589c9e419e5ba9ad0e50daa5ceb78af88f357b77bfb5b7eb754f536cb91ec2f8200728becbabc6190d65f318400102b62589e078055cb97998ede049702ac17d065e4c43ab684f5e5b1fea2f103669cebd2e5f5abdc7e9707b12c31deb47cb0f20c824e3258fbabc015f3e565768394651deb4499972050ca3ec52380156ae14fb7ac5eb13c2943b366e5f238cf505c06e8fa2da5f49371ae4b97d7af72fb5916e8f2a6320058f56a1ad3249702f5723ba1f34e2ebf04a1a8c3a10680dc61e519f05ed9b4debe1458be64915bbf66b5dbb036be51e6dc99ca502ca5f413dd56eb783fe9773d5af67e953d98f20ac3e54c5a3a54d5c7fda8a713baae9c4ec773f2b29b88e9753be3b695d6a2ca57e46534e2ffc3d026014f1e39585bce6b3977377029b07d73fdaec0fa35abc26421c779add44ba74f248ae81591bdd33ebddf3a3608fa599796bd5fe5f6bb3c28cbd367d31eceace77ce0c026ce9c3816e6884e1e3d1ce0a9444e503607cb74e4e171e6a62718a9c3da1f91a177e5c8b97c4da4e55458692dd23c22c39003c0e963c5033dca612de7ee96154b97246569080e2c30920997d8f08963e5cff7c5dfb13ebd7f105087601def155ddea896999715b633e717240fdf163876e84078b7208f92e776c2c367db366d745b36ae0fa34a26997906851164dc5e1bee54319acc6f43f3ee8a43fbf684e0f1b20f08b98c099c718bb36eaf012029c7c0ca9353a58f4e2fcbde3936b47500bccc43aecf51206b002cc7ee061608c9f5be86b265fbe8c1744560ae945eb1cae957d9bd22f54addfab7dedf2d4df9ad7dddd2946f226509bacc26e77ff1d47177e4c03e6f03db4a67c5d678ae8451210bcf987bea66fd490e79562c5d1c6c6fa30f149c64289fba0e1fd8eb5e3edde9dd065500b0da67919791efcbd33711d3ebfa0906430c000c9bf6f02698c251271a0078468000b07dcbc6d2d935bc6186a81f0c441949ae907ea3db6a1def27baae36acbc1656de36ac3272ac3cd6be5e28f332936d0400cec6d8004ec9dd22cee6724968d9523f20203062a03e9e48e569d75c2e0bab7d3956be1c2b9f453d6f0c04430b0054b87ff78ef23e3dc1004796e5bedd10d27ad6af5999383d33fef28699b6286c29a65f4c655d4d58792d62fa6810dd6295a3b1f25858799b48f286009fca8c0332545fbb72c5409dde22ce3badf2c1674b58f6aee58a27a242d6227059edcb49cad064c1cfca9b93e6abf436a4bb005478ca1d3bc8d08c11401c092c5d38bfeb20c0991fe767a6ffa82fe7ccf1a341d1fa3a3f275780fe3d488651976e671b565e8d95a75bacf2a04c93196a1356193956be9ccdebd7b965387e71a2b0ec6850881d3322e04467c9a7f561b55193e4d3c1d9d0a9953fa74c9fe51f6c00a0321c3438699c81d567eef002906e3b0b05fbff4cc8e8063411265dba54787ebcd7f4b24fc88ff51b5d57621c06567e4d9abebd2c8d559660a58fd8e55b65e458f97236af5f5b5e22767352e91ba1aee264e6ff73923a7998b71b17b2654e07561b853c6d3758e508567a9169b09700e15aad0a00c0ad15b90cd8b17593575a11b12dc50a1cf7ac5db5a278dcb7dd50e36aa76c5f07749a5ed3cb6f41ef1f04ba2ed16bbaafc2ca2f58e92b8a320de305ab3cb0d2a665d8b25a65094d69c36f5536c3ffe88485cde476340024d8c4802323daf96ed5b225ee655e6cdba03fd06d4cdad444f023637f81551e5869035eb6c1cf0188f38bf0feffd183f19d80c0b06d05ef8517a5161d57fef630ac62d2301deeab323df367cf0cd80d8f01a11392de3a66a1d35786dd5d5d9321d451b65deba48e955fb0d20782d1e6e5d2ae08bf75feeecacba19caa0e29c322cda3d3a7323211573a6361478346ea2b094160be3f36dfdbece644be5ca7cdedd4a47912127fa8e8aedcc840030085e394b1b25458664b0fecdd55deba237a3389b2c20f9f7430e025a1e1e5a0e533feaa1c14502881971bb2a8219efd85aabe5e99485e6b667ae03418411ba961d8f9d351146904f95da56d059dd4f4d243fe3674b95e5e26e07287cc1d560786e8b01571bf7760f53b94619503e4af41fef9fea4b5a8fab6614b7bbbb333237fd06bbe3ffd9df6b3a64ac78b404de7ed0fd50f1cb40a0695207cfd95b704337112eea97ab8ce5fbb7279781bd0b1703f5f04e6bf87862bc3a25ceae0135ff1da7f72cedf2bc3acaba2d085e8c34cd34007c301d161d53649d3655dda39bba2d736e8ed9877cff66da933168e9a3b7392867dde6163bae8bcf97141f29276f9e2456ea5b74fd604ac5bbdc26d5cbbda6df776cbc90a9b7d8513564ffdd29236d8ba3a1e7e17db254df9db65d03eda5fa6b9ff1f8ca8b2eca6cdad7d0000000049454e44ae426082, 'Norberto@gmail.com', 'pass1', '2018-12-04 00:20:11', '2018-12-04 00:20:11', NULL, 1);
INSERT INTO `docente` (`dc_codigo`, `dc_paterno`, `dc_materno`, `dc_nombres`, `dc_nacimiento`, `dc_nombramiento`, `dc_nivel`, `dc_categoria`, `dc_adscripcion`, `dc_foto`, `user`, `password`, `created_at`, `updated_at`, `remember_token`, `rol_user`) VALUES
('10', 'Olivares', 'Granados', 'Sergio Agustín', '1990-12-01', 'N', 'Ni', 'Ca', 'Ad', NULL, NULL, NULL, '2018-12-06 20:25:01', NULL, NULL, NULL),
('11', 'González', 'Reyes', 'Janoe Antonio', '1990-12-01', 'N', 'Ni', 'Ca', 'Ad', NULL, NULL, NULL, '2018-12-06 20:25:01', NULL, NULL, NULL),
('12', 'Tapia', 'Ponce', 'Sonia Yadira', '1990-12-01', 'N', 'Ni', 'Ca', 'Ad', NULL, NULL, NULL, '2018-12-06 20:25:01', NULL, NULL, NULL),
('13', 'Torres', 'Covarrubias', 'Isabel Dado', '1990-12-01', 'N', 'Ni', 'Ca', 'Ad', NULL, NULL, NULL, '2018-12-06 20:25:01', NULL, NULL, NULL),
('14', 'Borrayo', 'González', 'Nayely Yatemi', '1990-12-01', 'N', 'Ni', 'Ca', 'Ad', NULL, NULL, NULL, '2018-12-06 20:25:01', NULL, NULL, NULL);
INSERT INTO `docente` (`dc_codigo`, `dc_paterno`, `dc_materno`, `dc_nombres`, `dc_nacimiento`, `dc_nombramiento`, `dc_nivel`, `dc_categoria`, `dc_adscripcion`, `dc_foto`, `user`, `password`, `created_at`, `updated_at`, `remember_token`, `rol_user`) VALUES
('2', 'Apellido paterno B', 'Apellido materno B', 'Rorberto', '2018-10-24', 'Nombramiento B', 'Nivel B', 'Categoría B', 'Adscripión B', 0x89504e470d0a1a0a0000000d494844520000020c0000020c08060000009986f40f0000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000032669545874584d4c3a636f6d2e61646f62652e786d7000000000003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e362d633031342037392e3135363739372c20323031342f30382f32302d30393a35333a30322020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f702043432032303134202857696e646f7773292220786d704d4d3a496e7374616e636549443d22786d702e6969643a33353741394636374333353731314534393436383939314241454644383835422220786d704d4d3a446f63756d656e7449443d22786d702e6469643a3335374139463638433335373131453439343638393931424145464438383542223e203c786d704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22786d702e6969643a3335374139463635433335373131453439343638393931424145464438383542222073745265663a646f63756d656e7449443d22786d702e6469643a3335374139463636433335373131453439343638393931424145464438383542222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e203c3f787061636b657420656e643d2272223f3e3b4a64360000bc3b4944415478daec9d077c1445ffc66777afdf25b9f45ee85d2982288228c5820d1b2856ece06b417db1f75e10ac28f6f68a88afed8faf5d54ecd27b871012d2ebf5ddfdcfdced26474481bd92bbdcf3f533dc25c2dedeececccb3cffce6371cc77124148aff5b460000d165c7c47cf5c6e5b3ef7ed7a6cbeb9acf1bcd9984e76911ecf4f7a984e352395e48a1af76c2f129f47736fafff5f43585fe63037d6f2284b3d19f05ff91382ef9803e5c961b957722fda19948928bbe77d3d2408b4796e516fa5a4fff5e3dfdffb470b5fe578eafa3fd4d952c49559cdec03a8e165cc990db01fa6f10b5f6a3439501109b42c03ef906a365c4c9f99cd152c2194d059cce50440540211184bca205dbb339260e383e8b0ef4c6a89ee45ec2824b2502bff7ffdedf3f175a85071519f21e2a382ae94f15322165f477a5f4fd762a2c4a6549dcc9e98d6c44f3a26500d0f1403000d031a280153e7dfae3c9a67ec37b70266b77fad4ddade83f9bba5341d08d1374c5841772d9dfe9b415e1173a5c11151c45fb121ab40ed88b446469371515dba8a0d84cffce06faef36cbb2bc85feff4d702900806000a0730983ab1eb19b068ce8cb5992fa15beb5ae1f1507bde980d79b08ba7cd4d43fc2138e2fa0a2a28056e4c8bfb818b2bc930a8ab5f4752d1512aba9905843eb752dfd3fcda83a00201800885571c0dc005df63df3f375b95d8614beb17a20a7370e247ac3003a8815a29622e25214114e600ec5f1ed84c4762a2496d3d7a5f4ef2c23bcf027fd6d392a0c000806003a421c0819d73d956eec75d8702a0e0ea7e2602867301e4207a70cd452870b89122a244ae8bbd3489b88a8a42262297dfd95fef4331174ecb51e950500040300e114082c544f97f3c8a7fd0a5e59763467340fe30ca6c3389dbe2bd97f9c1f880d11914545c4f1aa1bc12404150f1ba988f885fe3f5af8efe8efd6a3a20088986090518ba01389830235ee403094f431a45ffdc4a08257961ec5992c2379a3f908c20ba968ff9d4742d0ff7a51a1d08bbebfd07f2d65b9860a88efa980f85696a41f3941b782b0c0cb4e0bda2f88a660407b03f12e124e2f501d047dd69d6ff73414f61ccf996d63789385098464b4f784d210e9841326d23713399ea75281e59120dfd10bff0515169fd3f75ba11700040300892510fc018a6997de9799ffec0f63f9a4b4319cc9329ad3e90b5043a04d3f702c09d669f44d201682055332f120d3c20b5f13c440000806003aa548d0292e421f4361cf93786bca099cd17c181d1404d4103840015142ffb89c70e472fa938f0a872554407c4c38fe13faf3265410806000203e05022b7a43b7434cb94f7c7e9490967d2a6f491ecfe90dc5a8211096fe93e38ea6cd8c16f204150f9ba978f88448d28744d05121c152670300c10040ac8a04ff548379e0d156fbf9b71cab4bcf9bc85b934fa01d782a6a0844d87de84effb89e08fcf5543c5453f1f001150fefd3b6f71d417a6b00c10040ec8804d32147d9522fbe6bbc2e2d878984e3fe12b00840f4c443867fea42e0d9d4451d91a50fa988789fb6c92f211e00040300d11509fee906de663766ddf6fa285d4ef164c1669f409fe6ec895e3fb2dbe9939ccd3ed9d9e2955cb4389bbdb2a329f0ea768ab2cf2b4a8e261ff1ba45c9e312e9dff3c9a257a6839c3f665e6e69f2c99218143f2f731cafe3388b4dd73a1c0a7a8e335bf59cc124703abd40059a8efe1d813359049efdde92ac67afbcd9a6e368f1bf1acd89dadfa4128ebf98b6d88bfdcb3689bc8048d2dbcab405d62900080600222412589b3564ddfada4043d7fe53f8a4b45339bd213711ea406a69f488f5554eb1a1da29d65638a57afada50e5126bf738c5ba4aa7af6a578bafaacc297b5cec0996e50e109522b52b72d0ab3a60b57f4f485b422a6e1feff9a0d7e02228856fff4ac5854e48cf35e9320b2c426a965148cb360b291946c19e6916d2724c823dc324a4661ba9f8307462e7219dfe712511f82bfdfb6010f93fb228be4945d71adce500820180d085021b700cc9a75e996d1b77ee39bab49cc9f4497640a77306bc1e910a0187afa6bc45acdad5ecabd8d1e4ddbdb59196266fd9e606d9e57093809ded538a571104be7625f8f7de20e1d05e3ca84179c1e2416e2718b8762281040981f622c19fcb42e95782dffb0b15323a5ff9368196e0dfeb835efdd9349913a1cfeb66d3e59658f5795d937439c5565d56a1950a0dbfb0a002b173ac6a61fb60106e26a7e36752f1f03badf65709c7bf43ff4f03ee7c00c100c0818b047f5c822e23df9271e3f3e3f43925e7f149f6e368871af74f9f74e0f7f92a4b9bbc15db1b7d655bea3d3bd7d779b6aeaef1966e640385e71f8a8b16f73e7eef6d2724f6e52e88ed9c05691f0221f83df90777a1bdc3c0b51311c12e43b03060c5d0ae18693105ff4e763b0d9e6dabfd45f99d3ea8085444d80c5dfaa7e88b7b27eb0b7a24f9854576b1958ac8f8edcf386e28fd8316328bc8120b967c9508ba6f48a7ce3209125030600a0e844b2814b64e39a49e7f6b91e5c80917d127ca29f489323f5edb9b585fedf4eede524fc5409d67cbaa6af7863ff6784b37d52903bf5a5c4a712ac515f4da5e18f8825e83dd05711fa2607fc240dec78dbc2fc110fcda5e38fc9d90682f268420f120ecc35d0816114c4098835ed5f7ac18bdbbb7fa0b59f2b131e8dfe8981b61ec35c46ee8dadf4ec544121313823dd31467b781898a877389209c4b85c3767a395ea022f915fafbca08c957743c000e03882b91a03e899ab3ef9d7facbea8d7254252da38da71eae3e9bb488e260f1506b57e61b07169856bcd2f7bc49af2fa7682a045796d565e1d41ff7f5fae81b79d6b20fd4d918b3f289563f81aef2bde21d891e0db3911fb1211ac58140161535eadaaa0a022821533f97681ea5ce885d42c8bb1f7d0342a24520ddd0fb11b8afb24f3d6e4f868578124510fd177f728aec3f344d07d8f5e03745c93e442db688f7652a845a07510f1c72658479f999172faf40b7599f917714673d7b8f802b24c7c7b76367ab6ada9a2e2608f6bf54f6554285406898016a5342ba545f9bdea28a8ee42b073e00b1205c1530a2456c54098db0321fb0e9cd4b573228ca46d2ac3a88808ab22226cca7b6b90b83007fd5d03130dc67ec3d3991b61a42242975362235c9c6c382acb6be91fcf128e7f9db5295a6fe8bf4128f71d040388f9818175fcc6d4a977f5b01c7efc55bab49c49f4c92929c63b6ad957b1bdc1bd79c51ef7badf773bfff86a87af7a775d903868a2a5b19d407006b907c1e240247b4f23489d5d1084d1890a9ede10da8908d58530b713102c1f47529088b0048b08e64298078dce34f61d9e66ec352895055c122ee615046b7b2fd2f20cad9b5de8bf010403e84c9dbd2a14cc59b7bf7eb4a1db215709c9e96cda818fd5f316ebab5adc1bfeac70adfa69a7e3a74fb7d19feb1431a08a83c62091e0207bc72078c85f572c4018444e48b45f99111c0b615644822a1e92834484ea48a87fcf48dba5c53c6c5cb6e9d051e9a63ec3d2d8f2cf18ae0291c8d2422249b3779cd5e567f4df20b605c3423438f0378df18cd6cedcc09b6dd6acdbde38455fdcfb1ade9274684c9a085eb7e8d9bc924d2f943a7eff7c8b67cbaa8a2071d0a09446e5772d4102a1fdd442c035580871d0c1ed2e38b8527521cc410e4492221c529412ec44585507425fd42bc572d8b82cd3a12333582c04a737c6e6b24e59fe898a8787082ffc1fad83036a7be8bf13fe5e81600031d161fbe313f405dd5332fe357b0a7dbd8a3359632e3e416ca876b8d7fdbecbf9e7d75b5b7efa748bec6aa9534441bd525491a0c624b45fdae89f568038889b362990bf2ee95405822a1eec4a519d88d67808ce6836590e1b9b6d1e3a3ed3346044464caec290e53554383c4285c37fe8f7f6a1ff06100c20963b65a379f0b119a917dc76892ea7f872fa44961d4be7e9abd851ef5af5e38e96259f6c70ad5ab2531105754125d84570ecc341807bd0795c88f60e84a59dfb901a54989850e322fc3110cc71b08e3839c7346874963ff621b6d84985c3e384e35fa2dfd789fe1b40308058120a26f3a1a332532fbce30a5d7eb7cb389d3e2d56ced15bb6b9d6b572c9b696c50bd7b9372d534542ad52eac95fa71a5407010221f10484ea40b49fba60ae439a52528204847ffac250dcc76e1d3531d73c644ca6beb0672c6d7c564185c3a35438cc6d2f1cd07f4330403000080536d2efd959effcf3eb2dcddfcc5fe5d9b66697e21ed4048904261ad4804575aac11fa4088180b64dda8228d5a90b35703225483ca407b90fc9cadf31ebf3bb27db8e392bcf7cf8f1392c3365ac0a07f4df100c51160c3b51eb09d7c88a5a8582b1d790f4f42b1eba2a5684025bd9e05afe3d1509efad72adf979ab220e6a94122c125a48db5483e222ec8448007fd7de83dd0723695bb6a98a8774a5a491b6f807ffea0b43f743536dc79e9d6f193a3e2b46565ca8c2e139e51e0089dbb6211840e485822ea7c49e71edec8b0c257dafe10ca6cc8e3c2fd9e3f2b956ffbcbdf9db052b1c3f2f5a4f3b435520542b82a1bd93a0062bca100940c33dd01ad4bb0fe78109868c2001d1261e38cec4f23dd8c64c2ea0af599cd1dcd1ab2d4a8924de4d78e10d453403080608061036a160e08c96a4acdb5e9d6cec7ee8f5f47d71479e9777c7faca969f17ad69fafc8d6552636d852210aac8de7109ead2477fc022040288c0bda1064eaa4b3683e31d328304842a1e2cbc25c96a1b3329cf3aeaf43cb6f745877e09596622fb0e2a1c16126c2e01c100c10042e80c9915ebb7603367ce3bced4ffc8db6967d7aba3ce497236bb9dbf7fb9bee9b3d797ba372edda208842a452ca82b1c5a2012400c880775a966aa221a329592aeb8112c98d2c28225934eb8b0c072e449791dbacf852cff4924f14622e8bec3d5846080600007d39078a5e3b3a55e78fb60eba8897708f6cc911de626ecdcb0a7e5870f57342e7aed0fd9d5b2870476ef0b7613d4cd9cd498044c37808e140ead3baf92b6cdb2825d872c4544a82b2e6c9cdec85c875c3665d1a1ae832c7f4c47869be8bb8db89a100c100c607f9d1d130a16da717549397ddacdbaece233684b89fa7cabec75fb9ccb166f6c5af4ea6fae554b36d05fed097214989ba02e8354573740248058150fea6a0b7599666a90e390ad888754c591b0187b0c4c4d9a30b5d072f8f1b99cc1d411b10e4c74b3a0c87b49201e084030403080bd3a36d63199755905e999ff9e77b5bea8d7959ca0b346fb5cc4869a16c74f9fae68f8ef733f8935e5a58a50d8d3ce4d680d5e84480071768fa9c192c1ae43b65298f3a04e59d8f8e4346bf2499716d98e3dbb4048cdea88ac92f54496ee231cff14416024040304033a31d216a7909479d3dc09e68147dfc599ac45d13e17efae4d95cddf2cf8a3e9ff5efe55f679772b22a152110a2c3641cdbac8e212245c3d10c7f79dba4c53cd2e99ac08872c4538e428ee43aadf911074162a1a72938e3bbfc8d0a55f4a079cf23a22fafe45cfe36b5c3d0806ed82e17d0886b86d2c67b6c529a49c3ebd7fd2f117de2da4e58c8eea49c832716f5abaa3f1d3977f64ae02616bc403459d7650974306122abd0f370174aa7b30384194ba3c539daec8514a16698b75309b0e1d999932717a89a9df119924dabb70cbf242fa9933084b3b0d3a43fb83600007d449b1a71b8ba1a45f56fad54fcc3014f59a4a78c110b5939044c9b96ac9a6c60f9f5fec5ab5644d905060ab1dd46987b6d8040805d0f9efc9e0580775ba22234838e4283ffba72b0cdd0e494d39fdea12cb616373e8937f34958393c8d28384e31f2348fc04c170708261076a3d6e1a4771f0f4434ac6b5734eb00c1d773767b21646eb1c64d1273afffc7a6dc3fb4f7de3d9ba9a4561ab530f4c28b0044b6a10a348db16440248d4fb54206d4192298a506053157964efe90aab2eb74b8afdcc6bba58469c9cc7e9f47c144f753d117d576119665cb7350806f0b79d107310acd691a775b34fbee11e5d76d10951130a5e8fcfb9fcbbb50defcefad2b3635db050a8518442d0b40384020041c2419dae60c2213d4838e492c074853fce41975598629f34a38be5c809b99cde18cd9515afd27213c16a0a0886fd5104c110d3ec6ceb74cc9cc164cfbce5d5a9c63e4367d02791a8eca6e7170abf7fb1b2fedd27bef4eddeba99feaa2c4828a8818cfebd1c8a201400f8bb7b580d9254032455e190af880735cec126a4e524a59c7d5d57ebd1a7e747513854fb933e05d24ce33e8e9fb605c1005a1b03afb80a4949275f7648f2a9573c2ad8330747e5c3459fe45cfaedaaba371f5c4485c29620a1c0a61e58fe047f2646da7eb0da018083bba7d54c922c9f43469070608e434e907048b64f99d9cd7ad4297944d04567aa4296bfa2a3ca25044191100c100c71e72a58e813465ad69d6ffdcbd873309b6b8cfc4e79b224bb56ffb2a1fe9d473ff56c5ab696ec1da3102c14f014024068f7f8be84439e221e72141722499fd735c57efe2dddcd878dcd261c1f8de0c826da0fdc4a3feb59b80d100c100cb1ff04e2cfa9903c71dae0a409973c2ad8330644e3b3dd1b976d6b78efc945aee58b97d11f7791c0aa0775eac105a10040c484034beaa44e5530b150a09456c7816db36d9f727377d38023a3b3bbac2c2fa623cc54fa6e2bae1404030443ec751c3ac55548f7bb0abd864c8bc652495ff9b63d0d0be62c6af9febfbf2842a19c04f228402800109d0ebfbd7060a22037483830f7810547da4c834667a69e7f4b0f7d51ef682480624b306f513245a20f8873c1a04395752e57c1366eca8094b3af7b5c48cd1a18e9cf951a6b9a9b3e7bfdcb86f79ffe9a760a6cce72779050704028001035d87dc652a57b1591cef29830776f8f22e0d9d269365591ed5af69db37cf9e21ada57e4a79c756df708a79c3653b1309bc8f2c9f4f1f44212886502710a0443fcbb0afe1510b4a465def2ca45a64347fd9bd3e92d11ed993c2e6fcb0f1ffe54ffc6031f4b2d8ddb944e80a570ae27086604201684834fb9171bf7211c0ae8009ed5fcc55bae96c50b2ba868e89274c245c59cd11cb9f180e3c6d03f5713499c4e78e11d5ca6f824f4298905db518b1d2116ce2a51f32a2499878ce9913af5ee877459854747b62b92896bcd2f6bea5eb96ba1b774230b6854e314d4cc8cfeac8cb44dc05500203afdc03ff6efa46daa42cd1ca9c637b0147f2c40924d5d240be9b9296953efe9611e3a2e370ae9a6dfa5651a09a47e07b1db7ee0307412a1c05c056623dad32e7b6082f5e8890f72464b5a243fd757595ad9307fd67f5bbeffef4f24b0644a0d686c569e682408050062ce6d501d0726ea1ded1c8722a5e48a35e5ceaac72e6f311d327257ead4bb7aebf3bb2745f0bc26d37214117d5388a0fb1e97297e8060883fb1c09e16ac7c526a4ed6adafdd6ce876c8f9848bdc2381ec6a71357f3dffebfa371ffc44167d2cc2954d3f542b1d8f3f8533840200312f1c44a204202bc2a141110e958a68605315b9ae953fb8ca671c57977ccae5c5c913a775e52d49fa089d5301150bdf2a5b67dfa79c1f88713025113f62a1750f08dbb19306a69c73e32cc19ed927929fe95af3cbeaba176f7dd7bb7b2bdb1c6a97f254c23a1a3637ea835000a0c3fb054dfdbef2b0c8629fd84a896c1298a628216d2b2a5284d4ace4b44befef691e363e37c25fe3075ace55fa1810c3ed070e437cb80a6a60637ac6b54f4d360f3fe1764ea7b746ea33c5bacaba86f7e7bcdffcc5db8b4960fa81ad7e60f38d6c63280f84020071ef3830a7810546ba95fbba4e711caa14c7a180f60319558f5dee301f36ae3c75eaddbd7599f9910aa61e49cb4a228917135ef8089727768160887db1c0021b6d424a465ee66dafdf69e8d2efcc887da0e8131d3f2f5a52fbd21df3a5960675df07d681a85b4d234e0180ce251cd415156cba826562ad55ee79261ed822fd5ce71f5fba5d2b7fa8b34f99d9d576dcf9c55c64d24ca752b1f0217d655b66dfaa9c13806000072816d42908bbe5a8530e4dbdf08e884e41f8cab7edae7beddeb79c4bbffd557115d8f483ba4c12710a00744294fb5aa4fd8d53110fea524c261c58ac52175a0a658f2babeed57bdc2d8b3fd89376d5a37d0c257d2295f489ed7a399c964924b00c14403080fdb80aad531069973d708af5e8d3efe38ce688ec2e298b3e5fcbe2855fd5bd78db7cfa7ebbe22ab0a70b4c3f009058c2c147fb1f75d513bbff1b828443092df99eadabdc15334f6a62b91b924fbdb22ba73744c26d605314cb88e83b9708ba6f70753a9560c078123eb1d0a575cd34a7d36767ddf1d68dc63e432f0eac82087f3d7b776f2da54f0dafb9967fffbbe22a542a9d8432fdb04dc6f505a03323b7130edb64da0f054f53300151a70807f65a4c2431a761fe2c8ff3d7cf2ad3ae7aa4afa1eb007b044e2c9b08c297f489e636c2f18f60a081c300fe2a16fcab200c257dbb65dcf0dc63ba9ce22323e62a7cbbe0f3da7977cca7373fcbd4b85be910d853852f2014000089e9366c53a629baf8b3b692c03445539070f04f5378b6af7357dc7c6a53ca19ffea9a7cfaf46e11701b782a161ea2af836899aaf44f008221e1c582a0888534db9849c3ec5366cee193520b22f159beaa5d7bea5ebe6b9ef3cf6f826315fc391568478174ce008060e1e0a5fd939a73a545e92bea95524c6439b7e1fda744e7d26faad3af79b27f84123e9d4d3fa72fe1b893e9fbedb832f12c18f02caa5d289cdd458d5760cb953252a7de73ba6dcce4bba952b786bd5e654976fcf6f9e29a676e7c4d763b3607b90a0ebfabf01eed1c702d01482c0ee09ea77d8344fb2a363d11bc9aa24e294c401478b6aef654dc7042b3fda23b7a248d3faf98707c9893c971fde9b9fe494471121184af70e1e03024a25860f5cf147976d6adaf5d673a74d46591c8da2835d6d6d7bffdc82bcddfbef72d694bebdce47715de83ab0000d8af6808b80d677761fd861a14d9a4380d2ceea958167db9752fdfe575fef64575fab4c7fb09e939e6309f461a150b9fd3879f195490ccc155893e3caaa0c3c402cbaf90ca27a576c9796cd16cd3c0a32f8f8458706f5cbab2e2e6936fa662812544611b46ed509e0c5c100b008083140e92e232d4297d09eb539611967889904dec61c4b56ac9eef21b8ffbc5f9e737151119b3d876d9843c8f075e380c892016d4fc0aa9c69e83fba45ff7f46c5d465eff707f8eecf5789bbf787361ddebf7bf4702f37e15ca9300731590b71d0010aadba0ee50ab0645b2fe854d5194482d8d59558f5cb222e9c48bebece7febb27673009613e8d2b892c77a70f59672a9f0b20183a9d58507799ccb01d73f6e1f6f36f99c3dbec39e1fe1c5ff5ee3d75f36e7fc6b9ecdb9f49600a82ada36616a257b9d901002054e120d23ecdbfaf0c695b82d9a894aeb4e4372d7ad5e75ef34b5dfaf5cf0cd0e7750d6f4024c78da57ffe42cb89b46cc315890bc180f167ff42a16b707063a6fd9c1b4f4a3ae992fb39bdd116eefa73ad5af24bf5ace9cf5185bf91049230d52937b354f4de56e455000084adff667d0aeddfbc8a48503345362b8e037b2df2ec58e7adb8e9c4dfd2ae7cb89775e4a9e15efdd59b96df88289e46046109ae271c86ce2216a8382039f4a699623bfa8c99b4718775db583605d1f4d96bffa97febe105243005a12e97f4048402000044c269d81ac8db70765707d97b432b55347491bdee9c9aa7af5fe3def04743ea05b7f50ef31445863fc993244e21bcf05f5c11088678160b4c18302b2e2ff3a6b9579b0f1b17f69510627d5575ddcb77ce71fcfaf98f243005a1a6761621160000d1120eb4cf632e439de2363814c1d0acbc2f68fee26d9f67f38aa68c1b9e1ba0cb2c08e78ebb662a16de27b2f42fc2f1cfe16a4030c4a358602b21523841579075f7bb77187b0d3e2ddc9f436fbe95d5b3a6cff255ef66d1ca6c0a822d7372d39b17818d00808e701b7cb4ff5303225dcac34bb3f25aecd9bada5771d30467fab573fa9a078dce0ee3c7b31514cfd2d74212d8f1120f4b6106cb2a232716fc2b218494f46e398f7e3a27ec624196e5961f3efaa8e2d689b751b1f0070904fd3067c109b10000e860e1c0fa20a7d227b1be69152dcb6959474ba9e468aaa97a68eaf2c60f9eddccfab2307ffccdb4bc4602ee2e882987011a6e6fb130a9abba6c324d9fd7b557e6cc979fd0e5140f0c673dc96ea7ab61e1d3731b3f9afb0909ac855657418845f3b722632300a0c3fb6fd617d1fe904d4dd407b90d0ea5af62eff3ebdf7d42f26c5bd39476d563fd79b3359c03fc055488a4138e3b5bf94c10138201b4170b6cd964baa1db21fd326f787e8e909edb339c9f21d65556d6cc9df9b06bf962b69ca894a84998e6c3550000c498d3305f99a298e49fa25003229dca20ce5e8b1cbffe4ff4966d7164def4e240fa7015beb8068e9b40ff5c44cba904b91ac202a624c22b16582ad44c53ff238764fe7bde0be1160b9e1deb56efb9e38c19542c7c477fdc424b15bbf120160000312e1c44452454297dd76a12c80eb9819672efae4d5515b79cf29b6bd592aa307ff4d1b47cc3fa655c85987018e07fef9cd44d50c4429665d8f86169973f34874fb26785b36e9ccb177f5df5c865b38924b29b8d2d99f4071515cddf82dc0a008098efbf595f45fb4a758a424df6e4545e3d92a349ac7ce082656997dedfcb36767271183f7a302d3fd0c2123dedc23587c3d0d162812564cab61e75eac8b42b1f793a2016c284244acd5fbcfd7ad543531fa4efd595108d6d62010000e2c569f0f7596aa227d697b120c8158ae3b083c8725dedbcdbd6d7bd7eff3a228ae1ecdf7ad1f21d0964a0041de73024b458d029ce428e75d4c451a953ef7982375b53c2a6fddd4e67c37bb3e7347efa120b6e64f10a2ce2d84d6f3a4c410000e25934f868ffd9a2380d6a40248b6f600e4461d3a257455fc50e67fa354f0ee0cdb670054376a3e57b5a46d3b21957020e43b4c582c52f16469e7674b8c582d4545f5bf3cc0db752b1b090049625b1b93d27c40200a093080775e96515695b7ab95219ccab9c4bbfd95d79d7e4dfc59a0a67183f365f711abae30a403044432870c162c136febce3d22ebdefc9708a05b1a67c57d52397dee0f8ed7316acc3964dd62ace02a62000009dcd6d702b7d1cebebd628a281ed8553e1d9b1aebae28e337ef7eedadc1866d1f0a3ecf31e822b00c11051b14002fb42b0a53fb9542c8c4f3dff96873993c516aecff0966d5eb7e7ae49d7b9372dfb9504a62158809007620100d08945831a0cc9fabc75a46d05c56eb1a6a276cfeda7ffe95eff7b4d183f369bd3e9bf866880608824ad62c17ad42947a74e99f9106730856dddb07be3b29f2b6e9938c35755c66e161610c4366ff1412c0000124034f8943eaf4c110bac1f5c4fcb2ec9d952bbe7de29cb1cbf2cda1dc68fcda0a2e10b82e98903260c991e13632cdb39b97b5bccc2885346a55e72ef639cd16c0bd7f7772e5fbca8eae14b1e27819d2603f10aef6e1613a98e0100512686fa16dadf058221277767c190e5a42d20d2eb7f2f8a52f593ff5a953ab5c69334febc9270390d2410d3309a2010120e43b8c582e5880923532fbdf731de6c4b0ed7f11d3f2f7a978a85879506cb722c385ac50200002492db10e8fb1c4a5fc8fa44160cc9621b588c437ddd2b776f68f8e0994d61fc483510124b2e211842160b6a52a66cf3a0d147a65d7aefc361130bb22c377fbbe0a5ea39d73c4502d9cfd89e102e7ac348a8790040028b06d607ba943e718b221858d94e4b6dc37bb3b7d4bdf1c0ba306e5cc544039b9e2840ed4330842216fcce82b1f76187a54f7bec51de9a921e96834ba2d8b4e8d539b52fdcf22269db691262010000f6160dea8e97aa68f0f797b4ffdc5e33f7e6d56caa224c1fc9f2347c4590461a8241835850f786c8d217f53e34e3daa71ee59352c3d29064d1e76bf8e0d947eade7cf02d12b0d9d806521e650e0f000000698d6bf0287d24eb2bd72aa2612b130d2d8b179656cfb96685ecf5844b34b08c90ffa32505b50fc170d062419755d037f3a6b90f0ba95961b1aa985868fcf0f9871ade7f6a817203d4432c0000c07e45437d3bd1e09fc675fcf67979cdd3d733d110aeb82fb6f7c44724e02e030886fd8a05b64575066fb3f7c89cf9f243bacc826e61110b5e8fbbe13f8fddd5b060cefb24b0de986db9ea8558000080fd8a06afd267aab91a54a7a18a8986aa472f5f26bb9dbe307de4d14496dfa3af7ad47e1bd8ad722fb1d083256632d2924e04a16bd6adafdeabcfefda2f1cdfd12f16de7bf2eec64f5ffe94fec8d61207722cbcbb09bb4d02003a88f8e97b585f49fb6826081a951397820a71adfa51ae7afccae599373e3f90339a431fdb3832817ecc4bf4dd45049d341c86bf110b69b49464ddfcca4c43d7fec3c2e62c2c987d57e327fe4da4d4dd2615b1000000e040450309e4675077bb5caf380dfefd275cab96eca97afcaae561741a2ea0e541d43c04437bb160a0c54e4b71faf4c7af300d38f2b8b08a858fe77d4adab2378a100b0000a059348864efac906a4c432444c3cd4496a6a1e6c392e931cec5c2397eb1c0e6a958546ca17dcacc73ac234e39372cdf4b14bd0def3167611e7316d83444b35f2cfc873678c80500404713a7fd10eb4369df2d2a7d6a59fb6f42450361a221f3a61707717a83108667eba7697f5e4e78e1bf701812d559088805d6989268c94f3ee9d20949275c7425e1382e1c62a1f1d379f7ef532c000000085934284e43b3d2c7063b0dd5543454d63c73fdca302db9e4a958789bf6eb23201812172616d84e9379e6216346a49c79cd4d9ca00bdd759144b1f193171fa87ff78985100b00001035d1c0b6c55eab88862ac76f5f9453d1b0224cc99dcc44103ea4af5d201812cf5d68cde2a82fe87e48dae50fdcc519cda1afbb9565b9e9abff3c5e3f7f165b3a5906b100000051130d6a4c03130d2c2364b55f34ccbb754d98d24867d0b288246862a7845c56b9f39c9e6aae854cde6ced9939e3b9bb85e4b48c707c9796251f3f57f7ea3d6feded2c6cc4d24900400cd239fa25d6c7d27e3dd869e0940762ff6bcbe20f38de9aa24b3dff963e61f8b8de547cbc4f38ee041258b10187a1f33a0b3dd5e5934c2976c99cf9d24c5d6e4958f64377fef9f5eb35cfdef82269cbb3a0880500000091160da46df5841ad3b04e711a6a9b16bdbaa3e18367c3b3cb25c78da57f3e9d68759c508241110b6cf9642a6b5f6cf9a4b1d79023c3716cd79a5f3ea87afcaad92478e924c402000074946850a72758ae06ff9e3d0d0be66c6dfae2eded61fab82b892c5d0bc1d079c5029b82f12f9f4c3ef58ad3ac234e3e231cc7f66c5ffb5de5fd17b0e41ebb889a9409620100003a4a34a8c99d760589869db4d4d7bd7acf06c72f9fed0e8fd3c0cf22a2383651ea36e41886381a15d5e59379a681a38e489e386d9a1c86e593becad21595f79e773309e437f78b8542da60a1160000b14e67eda7581f5c7a4e4f5534942a0fc78252f8ea6766accdb2671a8dbd0f4b0ff9a15b10e6d3d721b46cefeced25211237959edb535d1191adcbc8ef9b76f943377306b329d47317ebabb6553d7ce9f592b399d95dfe8da40adfd988a44c000028868e160db42fa67d7ff08655bad6228a7cd52397adccbe6fc1107d7ef7e4103f2a8dc8f22784e386d3f72d9db9b974fa2909da60da821c79a16bfaf5cfdc2cd833b3433daee468acaa9d3bf35a5ff9366677b1bdda3d7eb100000020664403096c8dcdfa68f660c7fa6b16f8582ebb5a1aaa1e9aba5cacad7086fc411cd79ffef90a09acca80c3108f12b5f4dc5e7b6d2895feaf59571abaf41d10ea39cb5e774bfddb8fcc70adfc71799b58d880a5930000580c31271a36c8742c5045c37665dc63db01e8a858e0ab1ebb7c59d69d6f0fe5cdb650b7b23e9bc8d232c2f10fc361883b67a1d75e7b44249d74e9499661c74d08fdfe92c4a6ffbd7167cbb70b96d09f6a687107c40200008058150dacaf56fa6c261ad8724b960db2d2bb637d6ded3337ae22a2187a3fcef10fd0e31c0bc1107fb4a67d36f61c343479e2555784638f08c7af9f3fd5f09fc7d9fe1055b4b8684394703b020040cc8b06d657bb94be9be56658afbcd638977d5b51ffce23ebc332a60ac23bf4351782217edc05f6bdccb46471264b8fb4ab1ebd8137db424efbecd9b4ec839aa7ae9b47dfeea1c509b100000071271a9c4a1fbe45110dcc71a86bfaecf59dcddfccdf11868f6131726ce584aeb3d55fa7130c41710b6cb94c49c63573a6ebb28b8a423daeaf62c76f95f79e772f7d5bc18c06daf044dc7e00001077a281f5dd0ea52fdf4c0281906c15457dddcb776d70adfea92a0c1f339296072118625f2cb04c8e76d62e52cebce674d3c051a3423daed45cbfab7af6bf6e94455febfe10b8ed0000206e51f79d28278155136c97cb3222cb4d35b3af59eddbb3231ccb236f2292786a67aab4ce9687418d5bc837f619363469c2d40b423d3fd9eb69a97ffbd1ebbc3b3730251a48ccf4f606e45a0000c43f09da8fb13ebc744a2f35b15399f2a0c99c69a3e46812aa1f9fb63cfbdef78671266b682b2738e1555ac7879040c6490886586971a5537aab710bd99cc1d42dedb2fbafa3afc690ce4f96e5966fdfbbbb65f1c2df88ba7cf2edf5583e09008062887bd1b09e8a86deea724b36169a9431c4e02ddbacab79e1e6d519d7cc191862b03cdbb78805411e433a8133dd29a624e8450f8e5b284ebfead1cb74d94585a11ed7b5fae797eb5ebfef03a22e9ff48b050000009d453490bd975bb2a989c0ca89dfbea868fce8852d61f898914496eee80cf515f78241110badf9166ce3a71c671e3a2ee475b0bef26d3f563d3c75167d5b0db10000009d5e34b0be7e2b09c434f837aa6a58307b8b73d9777b42fe108ebf8388e2a878afabcee030b0b8052b2db9fafc6e87a49c79ed25a1e65b905a1acbaa9f9e31930496de3868834290230000745ed1a0ae9c50975b32d1c0621b9a6a9fbb69adafaa2cd42048969fe16d1298a28060e8407781cd3b65d2d225ed8a87aee2adc9b6508e298b3e77e347736ff4ee58c7821cb122020000120375e504130a9b955221399a1a6be65cb34af6b8421d0b0a68790e82a1e3c482ba84b2c87ece8d671aba1dd22fd4e33afffcfad1a6ff7be547a2ee3e89a908000048049781f5f5c1bb5b329781c5335479b6ada9a97f3b2c99202713493c375eeb289e5749b0a98824c29650f61c34c4367ecae9a19e8b77e7864f6ae65cfb3a695d11b10e2b2200009d18f46f7b8b867572e9943e6ce5442d09ec6e69518aa9f9abffe8e858936219717241688fe9fcb3b4de172b4e061c86c8bb0b7d5a9750b22dab532fbdefcac0124aed484d75dbaa674dbf9304025f5c01b100000020d14403690b82640e039b9a6079141a6ae7ddb1c157bead29c48fb01359660fa671b71576e882418e6ea1622178cbeaa2b4a9779fabcfeb5612ca31659fcfddf8e1dc1b7d5565ac51b414beb54e8cf6f74241414139e81267fd77bc14ff1840c702d21604c94a85ec7537553f356395ec76853646106e0c91a46be2adfdc4a3c3c0a651fc5311a6fe470cb38c3cedf8500fe85af1fdaca6ffbdf10b7dcb9423821c01000088ca98a00641fae319bc3bd7d735cc7f7263c847e7f887e89f5d13cb618822a5e7f9a722d87c52602ae2c23b2ee1045d487118be8aeddf56cf9afe127d5b4f58dcc25b988a0000804447190b3ccad8b053110decb5aee9f337763a977d5711e24798892cbf42e2686a226e0403150b7b4d45a45e74c7645d6e9790b2394acee63d352fdc7233513339422c000000d85b34046782dca2380e8db5cfff7b9d585be10ccd65e08e26b2341d8221fca8ab22f28cbd860cb18e3c6d7c48479365a9e5bb85b778362d6736538b326705000000048b86e07886ad4aa9941c4d4db52fdeba860ef8a13d6806a6268ae2a12ee2625965e9797dd5a9882cc20b5d522fbe6b2aa737e843f96ccff6d56fd7bffdf09724b05b9988e5450080c403fdde012292b69d2d5972c0645accaed53feb9abffacf0edbb8734b4238b68d3ec0be4c386e7cac5f90987718a858501334b1949a45f649334ed317742f0ee5985253dd96ea59573f48d47c0b6fadc55d030000e06f5c86b56a3c031b33581c43ebd444fd5b0f6ff2eede1ada524b8e1b4b24f18258af87789892684dd0a4cfebdadf3666d284908e26899ea6ffbd71935857c9ec2517c40200008003140d2e12c8cfb09d04a626ca65d1d752fbdcbf57cb5e8f14da682c3c4e023b2ec72ca14f494470b82d3ddfef2eb0044d6caf88a2d48bef3a8f335a4ca17ca67bfd9fcf377ef4025b42c9e6a424387200808405fddf413f722a634785f220cb7649b679b6af35347efce29694d3afee11c2b13368798c96a97018b489058372410a6cc74e3ad6d87be880508e2936d4acaa7af4f2a789ba4fc49b70170000001ca0cb101833d4fd2658a2bf2dca6b7de387cf6ff56c5b531fe2475c4c4471340483b67363db56e7f0d6e4eec913a79d199a2e143dcd9fbf79abecf3303bc90db100000040a36850975ab27806ffd40491e596da79b7afa1634c68531382f03c09a410e88c8221fcf92a15778155189bcf294a3dffd6b3057b466a28c7746f5939b7f193177fa33f380adf5c2322ff290a0a0a7243a30eb594c018421c243035c196e6b38daa6abca51bea9b3e7d796b88c7ef4d64f1a6586c3fb1ea30b0d80a3615916fec317090f9f0e38f0ac95c68aa5d57fdf8954f91409a4f1f343200008010f12963ca6ec565605b623734fcf7b96dde9d1b1a423a32c7df4a62303743cc0986d2f3fba93917fc818ef6293327713abda05d2d88bee6afe6df22399a94a98835988a0000001012ca58c2a6266a15b1b0cdef38486273ed4b77ac93455f2853132c6df42c08867f160b6c2a424fd8f69f84e4dbc69e738ca1db21a1449d124fe9c6d71b3e7886ad8a605311129a3900008030890636a6b0a909b64c7f3b094c4d547bb6ada96dfefadd1da1b90cdc194414c74230fcf3f9b02c5ad99cc1d425f994cb4f0de560b2ab6557ed0bb7b2b5ad2c4317a622000000841b9f32c6ec565c0696d0a9a161fe935b7dd5bb1d211d5910d854ba2e56be68e882214cb1178abba06e2e55987ade2d13057b566a28c774fef9ed5dded28d2c28c55df8c61a19b13a28282888790c7fff9dc8c53fb6b44d4dec549c864ad9e36aaa7ff3c1f5211ebf0f91a46b62a5fdc4d25e126a46c75c5d6e495fcb91134685726c5fe5aecf6ae6cefc8cb08da5de582d214309000044acff4e68d818537a417f96d0a99204a6255812a664e7d26f8dce3fbf2a370f1993abf9e01c7727bd4eaf93c032ce387718c200ad6835a323abe422fb39374de40c2683e65bc0e76d6cf8e099bb4820b906a622000000441a9f32e6b029093635514e4b53ddebf76f941ccdde108ecb560cde190b5f30566218f44aa5e49bfa1d31d87cc8c881a11cccb375d5d38e9f3e6519b8dc54f9414203000088b4cbd03ea1933f0052acaf6a6cfa74ded6100f3f8d969e092f184a2fe81fbc8cb230e5ac6b4f233ccf693d9ee468da583d6bfa3ca2ee1501000000440775af0975d5044b1bddd0b8e8d51d21ee68a923b2fc58420b06652aa27519a575f4994719baf6ef12c22165e71f5fdd4d45030b3ef1c05d000000106597816d83cdf69428539c863d44925aeadf7a683d1df4b51f9ce34ee9e87d263ada61685d464938be38f9a44b43dabada575df659ed4b777c4ddf3a211600000074906870d252a50806e632d4ba56ff5ced5cfa4d79682326cfd204701df5dd3a6c9544e90503d46594a9cc5d483ef992637459f9999aa37645d1d1f4e9cbf7d077cdec2744ff02004064fa6fb0ff1149198b586e8674a524d5bdf9d026d3802333398349dbd8cb91214412cfa0c2e1fdf87418b4afff64cb28d96e94d99cc1586c3b76f29850d6937a766e9cd7fccd7b9b090b747c7d15722ea0a0a0200f43a4fa6f947fcecdc0c6a04000649de230b0d4d1d5626d4543d3e76fed08ed9a73f7d1575d47b49f0e999228bdd0ef2eb06593697e77e1b469e384d42cbbe636ef71eda97bf5eea709021d010000c406c101906cc5049b8e686cfce8856d627da54bf35139ae3791a40be2d361d0067317fcb10bbcd9d6c576f4e9a34239987bf38ac73ddbd7b2f9228fa2ec000000800e43198b580024cbcdc0a626583c43157dc06da6a261736823377f37094ce9776ec1a0b80b261298d3c94f39fbbae3799bddaa59c2b534aea97ef2ea77080b748458000000105ba2810540562b82c1bfcf44f3b70bcabcbb3685b205762191a569d1fe3e21073d6a18a1dbdc059bbdab79f889878732ca3b57fe783f556cfe8c8e500b000010d1fe1b1c3ceae6546c5f2316cb90456439a9fedd599b326e7cfe30cd47e5f87fd33fe72a82243e04c3c134b95d171eb297bb907cfaf471bcc566d6da6cc5faaac5b57367b26594ee82d757ca68fe000000c9104bb0b1898e7d6a06481600994d4b9a6bd58f66f7da5fab8c7d87656a3c740e91a52ba97078325adf25da5312ea0653cc5de86239e2c461dadbb92c39fffce641d2ba8c120000008849d46596aacbc002219b1bde9bbd990efada555bc06530c78fc370805f75d745adee025b1991973c71fa58de9c64d69c76a1b67251fd1b0ffc49df7a0a5e5b2943280300000c86987419e81845c7c0e00c906cf7ca0ccfb6d556e7d2ef2acc838fd5ba9b65545d86683a0cc1ee424968ee82e46b59f2f1438a62c3324a000000b18ea48c5995ed5c862d4414b58f63517419a22218fee22e9c7ac5b1bc2549f317f455ef5ed0b8f0e9b5f4add7ef2e0000000031ee32b0314b7119d8324b7fca685fc5f606c7af8b76877068e6325c168def10ada047d55dc8e2f4c642cb70e62e681ce725c9d5fcbfd71f2581c850043a02004064fb6f10de0a57f7996082814d45d81b16ccd9621e3a2e978e8f82369781bb811efa3912589111bf0ec3ae8b0e0dde33222f69c2d4517c92f6bc0bbeaa5def367f3d7f7bc05d5881d60e0000204e5c8615aacbc09659962ba2a146acab6c74fcf4695908872ea20fd3e744fafca33125a1e65dc8241c9f6f1d79ea70cd4762eec2d7efb2e00e07ad78c42e0000008837d1c0c62e4790cbc0564e34377e3877abec756b5ff1c77133498477b28ca86050dc05b66704db2722d73676f270213d57f39e11be9af285cd5fbcbd5d5168000000403ca2ba0c4c2c3067a156acab6c72fefab9f658068eeb471faa27c4b3c3c08e6ff5bb0b84e4d98e3d7b84e623c992c7b1e49359f49d0b5311000000e2d865606318db808a2573daddea327c3477bbecf386b06282bb2592e71db13c0cbb2ededb5db01c7efc205d4e972ccd79176af62c68fcf0f9cd7e6506b9000000a183be34565c06261a727c556549cc65b01c79528146c5702411c523082ffc1c9b82e1ef5b1c130c161248039d6b3de6ac119a5ba72cfb5a7efa74b6df5d787539564600000014437cbb0c742cdb75f1c06097219f96b4c68fe66eb30c3f3e9f0efadae21138721dbdae11110c919c92d0d3924c4bb6beb8777763cf41255a0f24d657fe5fe307cf6c22885d000000d0b95c86261248e2c4564dd4f92a4b1b9ccb1657683e22c79fc1f448dc0806aa9a983232abee42d289178fa45f426bf4a6ec5af32b73179c017701000000e81c2e0369dbfe9a053fb22c902d4d9fbeb49dc89a873bb632f1ea78721898bbc0123565f2b69442f3a1a3fa6a3d90d454f75dddcb772e87bb00000020115c06cff6b575eef57f548570cccb4960c1416c0b06c55d501335e5244d983a82339a0d5a8fe7d9b2720edc050000009ddc655063199850686efabf97b78570d854224b17c683c3d096a8890a06cbd0e3066a76179ccdcbabe75cfb3ddc050000009ddc6568545c0616bfd0e05af34bb577e78606ed87e4a687fb24c3b0acb2edc17fd7d441ea52ca145ab22d474c1828a465a7689d8bf1956d7d91b0ac8eaf2c934298cf010000b09ffe1b74a0cb40c7383a7e3a825c0616b498d6fcf5bb3b532fba7380c6c3f625a26f14e185ef63d56160c7539752e658479e3654733bf67aca6be7ddba904478330d00000020465c86866097a1e5c78fcbc5866a97769381bb2adc037c38618e055b4a99a5cb292936f61c54acf540624df96bbeca5d2c10047b46000000e8ec30bb87b90c6cc5040b7eac2592e870fcf0d12eed82813f9d8dc731271894e908b69492053b66278d9f329cf082b6e34b92b3f9ab775e618aabe09565f0cc000000746a94b12ed865604b2c9b9abe786ba7ecd1bc299581c8d2d458741898bbc0821d33a850c8310d3ea69f6677a1a1eabfcddfbcc714968866040000204160635e8be232b069893aa9b9bec5b9f49b72ed87e4ae08d7581f96d4d0bba60ede2bd8d13ae2a44384e434abd6b4a3ee8dcbe6b197825796220d340000440cf4afb1e5322c95e978eaa66feb15c1c0965866367ff94ea965f8f1dab23772a48448be63e983fc57b1e230a8c18e69b46459869f78a8d60349cee63f6b5fb86529dc0500000009ea32342b62c11ffce8d9b6bacebb637dbd769381bb38461c86d6e3f8333b0aa959f98650821dab77bfd6e62e009078d0270c5eb9a70cd611a7d8ec17ddfe19c7f3e9a899ce0827d3ce5c26b2f408e1f8e7511f20c865a823815806b6d432a3e5870f77d98b6fb66b6b66fee0473603d010cab9852c1894e90813096c639d691b33f9308ed7095a9c2e59f4d5d7bffd085b4a892dac41628a854b06ab995299004fb31d7ffef5f47e1a889ae9c4f8fb3afe41fafabef25419e5cf0631885771192a95924b054379f2c4e93d794b9296ccc9262a4acf0d559486634a8265766439abd913509679f0317db41e486aa89eefdeb8ac1ecd182430ead2e412d3801163f5392517a34a1202f6c0753faa01044939b6c4b2567119ea64afa7c5f9fb97a1043f86dc97842a18d46047d6c1651afb0cebaecb2ed66c9dbad7ff11584af932a6234042ba0b6a2c50362ddd934fbb6a1ae1053d6a2661b84c167d83510d40190383d345b35513cdcd5fbf5baa7db4e686ca3e6fbf50ce2bd42989e0dc0b59d611270fd46a0e48cee63f6a5fbe731df1077c402f8044130b43d8bda4579e34f3ad479f31d650d2a70fee858482e378fe697acd8f2251bbf0685f318cd8ce6528f0966d6ef0ec585b6f28eea329968113f8f3e935bfb9a31c06263802d3111c9f61ea37bc9be69aa9dbf30e33190a5efe132d182422ec5e64794cb23983a94bf249979c8a2a4948c9702491a473511140190bd52596958a7070387ef96c77080dec1ce5413fea8261afe908f361637af3fedc0b5aec05c9d1fce53b0b0876a50489eb2eb04047b62cb920e5eceb4e15d2b2d35033892a1df94795073100d4e0c76aa534397ef870b7ec71694b3bc0714544124774946050a723322c871fdf5feb81a4e6fa452ddf7f5803770124282c7098ad8ac8d5e514f7b58e38f9685449429347cb6da806a08c894e125862c95c8606c9d9d2e25ab5a452fbc8cd4dd1fa4f43896160f3adcc424de70cc64c63afa1255aa7c3bcbbb7bd41b0941224a2bb70e910557867d052683fe7a6b338bdc9887b21e1b981969769d912d14f413b8b1797816dc4c896dcb29c0c392d3f7cb4cb3c784caeb66bce9d45ffbc866870f4b53a0cc1d3111996e113faf266ab51d3b97b3d6535cfdec8f6eb466647908862414da99e6f1e3266b8a9eff001a819e06f17b2fc24aa0190b6fd256a15d1d0e85afd5395585fe5d4e830a413491aa7e59f6a150c3c099a8e300f1add3b20550fbe48cd751f4a8e4657c14b7fc85a8f8182129f85b42da3e4f9e29489d34ea7529c43bda0f80b474e2692eff8fdb4a130580c28b15c0263e35ec18ff5544cba9ccbbfabd4deb6e433b5b41fad8241dd99328d3318338c3d0716696dae9e1debff4310ec0812ce5d384c751798e82e483ee5f2e37539c579a819b0f7d3203f8704a67f4162a3063fd628a5c5f1e3c76521b4abd3b4b42b2d82418de80e4c470c1ddf9b335a343568d9e35e5ff3cc8c1504336920f11014d19d23a4a477b71d73f671a812b00ffbb82791a56b5111094f70f0235b2dd1e8d9beb6ceb76767b3c6e3a512491c1d0dc1a04e47b0c411e9a641c7f4d25a035253ed07cc64502c170012c95d60fbafb0aca845f6c9379ec95b93b18c0efcddd3e01d2490fd132428ca18e92181cc8f2c8e814d4f389d4bbfad08418c9e190dc1a0266b4ae374fa3463af21855acfd7bd69d97bf4c587e600120ce6c831872edfd873f040f3906387a24ac03f904c64e9615443c2c3c64a35f8d13f2dd1b2e4935092389d4e858870b083ff417d0209ccbbb235e3e9e641c7f4e44d1623910fde2090ddce95b52fddb989bdd5f2ef01884b77e1b2a1aa4397c9dc8594b3ae3b933e410ab807c07ebade0b659f772e27e87e0deb61d1eee209755aa25e110c8dbe8aed8ddeb22d8dfabcaec91a8e9741441f4be2f47da41c0675cdb8321d31ba87d66f2eb5347e4ad84653f37e478b0589221682f78b28b08d997c8ca1a44f37d40c3890be97eacaa74808697d417ca38c95ea8654d58a7070ba56fe581542ab3a2d920e03ebecd874048becb61b7a0c2cd43ada7b76ac63f10b3ea8059040a8fb45e4707a6317dbf1179c84f60f0ea2731f4624e942c2f3af85f39115c4153ec565a825eade12bffeaf9cf6251a1f3cb893e91f3322e530a8d91dd30cdd06140af64c9ba646ea71adab79eea675f97017408250167017d4fd220a5326df702abd7f525133e0e02427cf62199251118989326632c1d040946909efae4df5be8a1d4d1a4568777acc039e293818c110bc9c32cd3c646c4fad5f5a72342d22c8bd00120b41b977f2f4f9ddfb5a8e3811fb45002db0d512b7a31a129ae09c0c4c38b85c6b7ed63e2d214b271fe85f3d982909f67759563a36ff6a37f63eac58aba1e52bdffa21f15b2b3018ca2e1bc629628c0d287cee13ff1bcf19cdbd23f8842253552973824e22b2bc96f0c2e7b8ffa2728d5bf78b48993ce32c4e6fd0a3fd038d5c47cb4bb46c0cfd50688371089b967090400c03cbcbd0e2fcedf30adb98495d351eef145a66855b30b4c62f08291919fafc6e199a9aa7cfbbbb7ad6d5cbf2e7fd96f02d551948d835606bf26d19373e7f1c9f943a8f0ee8baa89c0047242249a75011f17fb807237a8d0d8ad0ce370f1d7784b1d790fea81910027a2af69fa2fdc4f1a88ac4838d9db45f7191b6698966cfd6d57562438d4b4849371dfc38c08da0c7b4d363d6874b30046f3695663e6c6c0fc2f19c16712a3b9abf242c014582cb85b2cb87a9ae028b03c94e3ef9b2d1c6ee0367d3aad645b16e787a1d17c83edfb19ca0fb05b76284ea3868bf88e453af3c83a8db4500a05ded1f4744bf95fc090c8684842571da6b5ac2bdfe8f6acbb0e30a341c4b471f1cc7d0d78507d2991d68a7675604839d3e21156bfd9662630d7b9ac5ce946d62218f3e751e633bfe82c7082f183be03ccc542cb04ea7272e494444a1ba5f447ef269579da8cb2a44c63e1026cdc03d99ffe26f06544442a2ee60d9a014a76bc5f7212caf24e30f54081c9802093c25b18e2f59dfb5bfc67db82567d367af7f9be8ba960e2482529f39866e870cb69f3bf37e4e6fb475e029b1e9a5ffb1f3c17d187651c8929ce50aa9593dada34e1f872a0161140cdd689f7a032a22215177b06462812daf6c76adf8618fecf5687c18e7c22a18988a65f10b7643719f3c2139dda2e5942497e347e76f9f3751559cb082818a05d5adc91632f2faa75df1d043bc35392d064ead0b2d6cf50a966c85cf5d50f78b284c9974c399bc25c9829a01e1150dfcadb43fc52ea709863286aad3127ec1207b5c2ecfd655751ac567093de67e83260f248621783965aa69d0d1ddb41a04b2a3e90b92c0ab23ca2e3f9c5706914c3a78f4c8b876cefd823d233f86ea631091e585b4f14c501a23d08eba5f449eb1cfb021e681a30ec38431880036224b8fd2d7f3b43fa882382578b5847f5ac2bdf6976a63afc119da9a82c476cc7d3e548741500639d6f9251b7b0eced7faedbc659b59c0a394a06241155e198417baa65ffff45dbaeca25e3177a21c3796fef90a410ada5085217313b208db2fe28cabcf243ccfa36640845c8629f9737f3a12159170b0b194ad9660a9a299b3e070adfcb1328486b4df698903e9c4d4e59476dae925eb0b7b6669122f3eefce9a676ed898ffe2af09276983c4029b7a28ceb866f6bf0dc57d86c5f0294fa1e551dc8f9aafb5ba8cb2c036eedc31faa25e25a8191061d1f00ced5b214a1308652c65710c4d8a6068f1966d6910ebab9c1a0f397a7f6d687f53126ae7e7170cc6de430b398359af6939a5cbb198990c89e680955d717870a47c71daa5f74d33f619363e0eeae146224bbb6947f4246ecd834250ee976cce64ed9a34fefc93e0fa822828864144942ea16fe61d5cc78c9a8b7358d6c716453030a7c1edd9b4bcd67cd8380d33019c5df6f90ea56f96697518d4276316e99d62ec7d5881d66f25399abe2209b69c52110bcca149614f9b2967cf98422fe4a4387a6a798248d224dc93072d0e59a063917dd28c897c725a0a6a0644059e7f20ff855fd1de120b36a63a15b1c08acbb5f6b71aed5d3e7fd43f36b103785a32298221c9d0852da794898622b9567cff75fe0bbfc81aff7ddc1565f0d02975979f74fc05a7da8e39e30a2ac1b838fa1e1ce1b93789e43b2651ae5b68c57fbd03fb4514f6ec671e3a6e04ea04258a2593967b0e6e8840bdc573098ca9fe0075362dc1821f5b5c2bbfdf43875c6d63ad2c1f138a6050f32f30d56a3514f5ccd4a25a64af676dc38239d589f3a4393c388b63bee5c80963934ebaf446c20b421c7e1d3d3def0f65d16f5581bfbfe6ea7259768f14a54cba5ed92f0280a87275deb33ff4433524144c30b4a882416aaa77f8f6ec6cd6663170a342110c06553018ba1d92cf99ac9ab28ac91ee78f24b004245150e7b1734dfd861f6e9f34e3763a7818e3f8fb2473828ee56828c2bdf9b702519d7acab70c3f6184b1c7a0bea819d0117d0fbd5767a31a120a75796583e234b8d9de121a05437afe0bbff4d62218d4f958f6949c62ea7f44a1d66f23399b99604888e59474f0109427cd6c7d41f743532fbeeb7e2ab43a433224961c86ed6c9986fb739ff75120d051d095249d7ce969a812d06170dcd8fce77f3a1d159130b0b195ad9650e3189cee4d4b6b351f4d96466b110cc1f10b367d51af2cad1fefd9b8ec7b65aea5b38b85d6c44c823da34ffab4c71ee49352b33ad15764ca93ed3b818c857bbb0bcc3d62ab600a93274e9ba0cbc8cf42cd800e160db3689f6b4245747e82e218d4bd259cee35bf561159e3902b93e17ff7bffe6959a58eb46d3865d5e776cdd07202b2cfbbbeeef5fb2b2d474ce8dc03c79547a8a9803338a3b97bfabf66df27a4e59468be68b10b4b10f3362d67126c22a60a6be6c2e50ae9b9bdac479d32b6135e73107f141349bc89bedef7cf1d34da6a27c11b24185ac4866a87afb2b4599755a8658fa2e15a1c06bdf224992ca464d885d42c4d9b23c96ee7afa493c72f04890566d777c9f8d793b7ebf3bb0de8c45f9959eecf26bcbb10b8ee4c54b354ac85f649d79fc199ac78aa0331e232f037e7cffdb910159110b031565d5ec9021edd9eedebeab5b51bae276d37f6837118d4f8052618928c7d8715d083687337dcce9f49278e5f50060d75df80829433ae3e9b3e69f616ab77d7cbb2247486efc871bc48049d97d319dc9cdee0227afaca0b47d0a793b308cf2f48e09b54a7b80bd9fabcaebd74b95d4b7c55658dfee5a80044ff46953841efe10c4627673039399d9ed9d417d3722f2aa7d3c3c6587579252b2eefb6d5f564d8782db993382289879340ccda0109069eb46578b419ba0ec8d62c7b6aca7fa66aa5b3fb5e6afaecd48685cf6ca2e56d4540e848e7d893c1ab28d79db4aca765232d15b438e8b54d6477815d5fe62858bcbbb73af6dc71e67c454020452fe8a8fbb48a964db4aca4652b092cb5039d1c36c6d23e498d6308043e6e5c5a13c2218f3818c1101cf068d51774d7947f8148526df513576dece4830aa70c10bca2f0d845121511d1d93aa37ae53baadf99bd26f22428a728fb164540b9c981ed000b402460f7225b5e57abdcaf846013b94482f5cdeab484c35bb6a55172347b798b4dc358c41dbeafdffe5de7a6063c32c160d66597d835b55eaf7b29e9fc8171b2727336284fe0ec663574c21b3578fff546e53b277ac4948fb4392f4c4c19d141830ebe4745d2b6e5b18b24e8eec0094a709a68d6063cdeb2cd8dc61e03d30f5e2f70830f4630e855c1a0cb2e4ae72d56a396b141f6b87e0b7c894e3faeb081a349b941854e3c68a81d9297b406b226a666c89ffb935c76e5913ec55df02a42116201c4ca3dea3b30518f55129d4c30b895873ad62fb9bd3bd6d61b7b1caa4130902cdac7e5d23eae7c7f82410de263018f3643f74373b4b629c9d9fc6bfef33fc99db94dfabf5fe0e6f4298221f1baa704855e7b35d0c883be0a740465571d89fb17b48e45b43d781477c1ff00ebcff8a8f51a4bd210fae7a7c1bfda5770961af0c80483c550a86dff0886b774e39fb88c000000405460ae923a2de1746f5ea13de3239107ed4b1cb4478dfc6651ff665d5ed7546dea442cab9d777b15ae1f0000001015d47c0c6c5ac22935d63ac4c61a8dcef75fe318f62518d4151236bf60c82ed218f0e861cb7a900910000000880e6ccc752982814d4d787d153b9ab4e9056ee0bedc84bf73186cbc352549484eb3680a78f4b99960903049060000b10afae74e861a57d542d4c0c7b2cd4dc69e830e3eb4802325f9cf2fb1955d35a2f9ef1c0635e0d12f180c5dfa6a8e5f905d8e65f4c3d01a0100008028a08cb9eab404130c1eefce0d9a9377c9a2af6ff0cf7f2718d8924ab3bea047bad60ff2d5ee598acb07000000441516f8a84e4b383d2c45b446388eef17fc73fb2909262058f219b642c2accb2949d5e458c95253f5ace93bf39f5b824b070000b10a3ce0ce48701c83cbb7a7b44976bb7c9cc174f0596865b9ff3f390cec80ea1e12465d467e8aa636e8f36d209d7c874a000000200661632f4be0d4a208079faf6a578b468fa1ef3f390c4290c360d265e4266992a0a2976d501433018f65d38ee294ef26a45dfe40bea14bffb1bcd97a04e1855e9c20e4117f0a6c0e7b000000e28afc677f08d16140e6e830e2a515da4287bd5212d8a4ef47c2f36c03a7f2289f871af8c85649b058060f130cfafc6e076f0070e41f05436b0e06de9264e193d3cc9adaa0e85d9bffdc8f1daa161491c01c147f1067d6cd2f9fa8cb2abc8233598e22d84d10000040d8e1d2e9205b44df8ca0e512361c1259fe869667a978f89044e1299a8dbd74fcf306b90c1e5fc5f626428ed6f075b8227a3c2b3d5e4b7bc1a06ed7cb1c06b3beb0678666d1ea71aff14f6a74ac50f067ab4cbbe49ea34cfd8e78900a85be68cc000000a2a920e8a03bc65f64793991a5e984177e8ac2e7aa710ccc61707bcbb6366a1ecf455f0ffab29cb47bd20e5e52a9396193ff4ceb2ad776a05860df2189b7d90bb26e7fe351f3e063ff0bb1000000a063a50337908a05b612e051659c8a246a1c43b35f30946e6cd07eda7c37f57db0c3a0daf76c1ac22464e6276bf24e64d959f5f8953bf39efb31aad762f7b4a3545721459fdfad246dfae3cf0af6cc2108020600001043dc44c7c92174249e48027b3e44ca6170ab0e83afb2b459f279454ea717340ceaddf725180465c0650e834197919f44bfd4c11fdae7dde93f59397a43f5eee92379e5bcd374d9453dd3a63df69c9092d12b9ae7000000001c20c7d2f1e94bff6b20ce201282410d7c64c24194ea2a5d4246de41070bc892d42bd855682f1898c3601052b36c9a4e5312b792409466b4c402a788850cc20bddd32e7ff071c19ed90bed110000400c338c8a8685243241f86c0c561338b1e2f5d55638b51c88e3b8eefb170cf60c6d618b92b825efd91fa2f268af880516a499464b49ea85b74fd7e5140f423b04000010f370dc71f411fed6701f5619837dc18241aca968d1788e5dfe4e30f8631838bdc1c4db528d5a8e2d8bbe4d51ac6e36a5924c4bbeb1cfb011a641a327a205020000881fd1c0df29fbbcfd2270642618d8b484d32f18aacb9a359e5f1e1520fa60c1a026366222c1a4cb2c48663e8426c1e0f56c8992bbc0ce9db92159b4744b3ef9d28b384127a0f50100008823f474ec7a2202c71583048387053e6a3c0e4fc7f5fc7d390cfea0478109068dc8ce96ed51100beaf249b6f4b3d0d8f7f0c3f545bd7ba2dd010000883f97813b4e167d83232a1834a787a6a727082c1955eb2a097549257318f4baf41c9bd61506aed54b76da728a235ebd8abbc0b6df2eb48e38797440ad60550400008078d40cdc95740cbb3c8c870c0e7cf4f8f694366b1d2365492c0c761878d296e5512fa4e5d8341eb5baf1c3b98e28d42d3bd7245ab2d9fc8aa1c740b80b000000e25831f0679180d31f4e87a15530c81e974f723479341eaba4bd60687518f894748b4615524622bca472f7d5a398bbe04fd0c40483b1e7e09ebc25d984d6060000208eb1cba26f68041c068f527c5263ad5ba39ad9cb6150574898fc0e4392b64da78824ef8a52c59a14c19061e8dabf04ed0c000040fc9b0cfce1613ea42f4830886263ad4bd379715cfebe1c0683df61b0a5685a5249247157de33df473a90405004030bcc4cd16515a4a199010000887b6412b6a483ca582c050906afd450edd278b81cf64770d0636b0c036f49326ada855316cba3b07ba72a18580c8385b32459a2f099000000408491720231fd6123388ec12736d638358d979c3f7dc13e1d0681f30b060d7a4192f644a146d57c112ccec2c01b4c7a34320000009d80a4702b10d2b673a5576aaad31ac3901dec30084a31f096241327e8794d0fed3e5f45141ef65bcf352072381e0603000080b84726a6308f67c1818f018741d3f13963ded38bad3c09f81faac3a01732f2342b1c59122ba350a56a564a1d89cca61d00000040f4f5822c73613ea4ea3004564934d4b8359f9bcf9b1fbc4a42e7170c29199a9728ca2ec7ee28d52b17247400000000b06fc1a0667cf48ab57b34e749e2783e537d4a572d7e1d9f946ad21a44e8d9bcbc52975d180db110f42a13043d020000e8041e43b8c7b360874114ebab5c5a8f2fcb62a63a25e17717fc824163c0233d5a53fdbb4fb870c101000080987118986060710c3ed9ebf6b18c8fda8e24a7f2410e03130d026fb619340a86463cea0300000031031b93d5a5953effb0ef766a130c1c67571d0635d3a3c099ad9a04832c4bf5794f7f07c100000000c400ca982c2a6281155172b568130cb29ca66be730f0bc890a0659d3c11a3acc5f804c010000d019fc00392247f5b53a0c4e874fe3d24abb8eb4ad36f04f497026ab5e5b9647b99e403100000000b1a41824d2968f81390c5e8dd91eedc1310cfe2909de64d196395196ea71b101000080985321a25224d9e5f06a3cce5e310cfec2198c3a6d1a466ac47501000000620a351783df6190ddda0403c7717b657a0cc433083a6dc99038ae19d7050000008829d45d2bfd418fb2c7256a3c8e419d9250a72578ce60d6e630c8b207d7050000008849c11098921045ad822125787b6b7fe174cc61d012742135744cf021323d020000e82c63bb1c8983b6c530389b7cda3e4336aaab24b8568781d709daf40271432f0000000031359ec941a241927d3e51db67f0a6e01806261838ce6012349d912c3b71b50100008098435d5a29c95eb7d629091b4ff6def991273caf6d7b4d596ac23501000000620ad56190fccff6fe3c0c9a10d41511c1c2411b1cefc37501000000624e30b4390c92a479d2a37d0c0317c8c3206b3c2704310000000031349e05c73028ef35657a4ce65bdf86ea300000000020969548486a846f2716b40b06c43000000000b12c184808310c44cdc3d02616b4ea0f16c32047f58bb398098fb774732d6624000000c41d1c271141e7e64dd606de9a5c4774fa3f38932edc9f22078f9db224691ee7db9f593c4c49b0c00d172d6cb3ab3d0dff7df63bfa6a40cb0300001067b0a7fd4a5a36d0b29c969d79b3bf8ee483b6cc85302da1fb7b31a2f57c220e7316d8f44799f273c5bebf0700000010d3b040c406653c6b0a8c6f110b7a94431de775e1920ba1fedb83140cac82b7d1524d8b89205813000040fcc1864db72216d8b8e69523fb5972288ff6e17b32e7384b141519cb2ac9ac1c362dc143300000008853c1a0ee24e953c6b798258c563e17953882dcd95fc941950b0000094bf9756343ed4f51898983ffc19a13747cb804834c7c3e16b579f00744fe24000088bfe75b9050a281339ab56d3029cb2e5dfb66238b3e49930291254c0b0090484fb7d78f55ef793ee5cc6bccc65e879570465331e175e9b40f49a35d533ae1f8f4c0dfe092d5271cfa3bd6df786807e420fea945b986e3f82afacb6a8ee3f6105ed841024160126a1980b0380bea7e5124b05042131edd5ffd01cd568111721580ce280cc6b56e4e977af15d19fafc6e833893b57fce239ff42782ae371deca948e0b3c2d1ab053dbf78a9a0d845cb56faf32afa7f57d2879215f4f3d69040901880c5000e4e30f80ba733f05ab77fd091763b59d19b52db29f18209d705804e2310d8de32ba8ceb9eea9b75d73b237993e508a2370ee3045d97289d869e766d5dfc8590314a2713101292b48cfefe072a267ea242e57b12582d05003800d1c0198c82d683fc258641f6b87c9cd1a2d3703a100c00c4b783a0b38d3dc79e79cb2be3785bea78de643e963e08e4c7d8e9eaa94818465f87d1aeef86c0438efc077dfd8c48e26744d0fd46309501c0dfbb0cda831e1bfee230c85eafd69bcd8c6b0240fcb90896e127a4588f39eb142139ed0cfab0309a8545c55547c87143e9eb50da11de497b3096c86d2191a577a9d85942e0b903d06e476a8db9a765a935e8516a150ca257db3a508e4bc1750120e64502e77f4a27c4987ecdecd1bacc828b786bf2f1f4feed1c829fe372e89fd309274ca7bd5929fdf935faf3cbb4ec400b00100d84e7f41aa724945512c10e8324bb9dbe402ea88344926c9afe9d968e6fc678353e8acbbe7741163d7d2bda0388cbbb58a797092bfef706f6ba9384d95257ee17d64918ac479d9a6d1979da54c19e3185761c5d823a83ce58bd85f47bdd415f6fa7af5fd03297f0fcc711aa5fff25ccbcf5351b6fb26446eb0b66dffb5e48ff5e6aaac34dd8d1f73fa3ad0f6049092b22201678a5041c062df7bb2c37ea82c482e8170c5e8fb69b89e3a3f284426f4e5e794262311346ce607c8d56c071687a20ce6142fd7a7a3b3f13e681ccef26249f76650fd38011570b299967d34133d104369bb638ce5f647913fdf949c5797086e9f8ad7d52d3a72fa5d8cffdf793b44f3a194d1a6860312da323241804bfc3a0714a42966507df4e30c844f4699d92885627c4beb48d965c5aba4bcee624b43110d7c872bd58b7e7d4f21b8e7b3e5ca29a16168790927cf26583b2ef79f72debc889bf09a9d91727a05868df4ff5a0e539c29c1c59be9984187ba588325e79804973adfc31b3e2d689b33ddbd7be8e860d34f40591c867141cc3c0f346b3d60ccfcee02909bfc320b91c5a532e472b868129793b2ddd68e92ab534a60b29196868203efb07976347f377ef5fd6fcc55bbf9310f7440972dfcc49275ed4db3c64ec8d823df354b6f21a35fd173268bd3c445fafa59df4a3f43d136bae103a6483d22f151149ccaf79eabacdb6319317d88ebfe0344ed0e951dde0c03a0489279c10eea3aa62417518f41acfade5af53126e87579b70e76c517418d853124b14d345f6b810bf00e212b1a67c6ded2b77fddb57be9dd9e45ea2716e5d79ca65f7b2d9d863504ef21957cfd065165ccc662b51cbfb2587d6d32c2a1a9870f8377dfe3aa8a080dc595fc8b4fed975f390c0148747116d19cd5fbfebf2ec58f75dea85778ce4adc958760e3a8abda7244c168dab2448d35f0483e468f26acc029519a5154cbcd2395afdae86e83360e5148837bc3b37fe5e3befb607a496c6adf4c74665a0910fa62d97cf384e7d723071066372daa5f75fa02fee7523a737a6ab773838e02eb5980a87f9f4296a3a91c4eb88a05b7630da4f71276a49608a83f54dec012ac9b37985abe6e9ebfe4cbbfcc141425ab605150df6f314cfb566700ebf6060e3a6c019cd1ac74ca9468d6110d5223b9a3cda4e894fc3d50660ff78b6acfcb6faa9eb6ea362613509ec99c004832f77d6e7077c1753b1c0ee5d16a7906a1b3fe588acdbdffcc4d0fd9087dac402d0d68f71a3a85860d3438fd2724003bc72dd58ba6ab6e4802ddf64e9ab57d0b291960a5fe5ae9a9a6766fce1dbb3b311150c3a00d55d60ce17cf9baddaa62424b15617e42e304bf4ffd9bb0ef8b88ae3bdef5d974ebddbb2dc7bc398de7b68496821b40448210925c93f0192402009092d18d28090905062030102a619630c06635c70efbd49562fd7ebabff9dbb7dd2b3b074a7a7937ca79befc75a85d395ddd9d96fbf999d9515200cc6ca4c1f3dc2801b29448620ba73ed02d7b3f7fe912d2c50d23852f5f82239593b6efaf957b4f0430eef2c2c2dfeee033fb1548fff017503569c07290338d7bb88aa5e49777cb710def47142d2f0f822958e0df850afce9f42839c3059f6b42b1d4fdeb9bef896878eb1548f2bc42e46f4b896a57e1eeb431226ce966331f21aaaa2b6eb15869861d35d8f418521561d0e253704a20744b6ad7a83928587e8b7108668a52ddc49169251157efe95ce6cfcdc33ae38b9ecee7fbe6ba99978478c2c2006426d1843c9c247f4bbbfb07e4f481a982f0dd0d6c814862db4eda2ad41097add1d4fdfb941acdf83c50f1083ad30c026c3c2596c16ce6c359655a95318944e85c1286100e621464be81b0ae1f82010dd94851dabdf743ff79bc748bc30132c1851b6c024ab2a9818212f29fedeef6fb64d38f64e6232a74f754655559548505423215195045915228711217052d437983947ae99b7392c7421e63268f87e4c3fdf39aa225fc799cc5b92200d121d33f083cd4417ee8d7553344c3a9ebe6b63c9ad8fcdb2548f47a501315884215606de5454667c532fc709433785c11b35aa89703c0f898f8706d953118c4920d219c2fe2d0b5cffbaef511d5910aa1eff20a904c7a69f5fa81dd9cb3357d4d414ddfc9b47cd65c3cfebb2fdc12505b2a72d28b537faa4963aafdcdee0a3dffbe9f77ed9d512d26d3e0e730b3a87d5d94c45e50efa399ca6e2ca5cfab9f2cc65d54e4bf5b8023eaf283d4f1370641a6732ada1bbacdb08cfff3bb1daf0814cc70efaa4956837016bdd484983eb9ff76c2cb96dceb1f4b3e7e30c410cd47ac6fc87a6309861be197d7e55163bbe94c320bb9a8d573fe3b8721c7004a20b62fddea51d4fddf50089e72c78bac84252931d16d7586263cec9171f9777d14d7fe273f3470fda9b5764556c3ad821d6ed6a16f66f6d8eee5adba8047d7e123fd12190ae187d67acbedbe2a8270b314954fb2abb5badb4d9996a02c5d7720bafbd738ae3b8f346a4f170da2859f817819b32417588273af6461a143a86e04fdbbed4b5411fd7f1f75f6c28fdf19f8f331557e0d170c4c051ddae8447737f08b912f4b6690a834474390caa2c299c912b305575388e0f021187d45abfbee3e9bb7ed557b2c0760530c921e4505670e5ed97394ef8ca039cd932e00b8b2a442561dfe643d19d6b0e84377eb64f097820892fd8ad85598b32e2a097ddd56e8481eba62e58190902c705c5de60930124a1d25c35da9921437b0b6dc7d0f67592a0ee3f230d111d69e824518adfcdb9fe71cffa923b9e38817716d870c6200600bc9eac9bf28b8d8531555568ffd31d6ebdc22030d2a0287e6fd45450e2e8fb7392e1dc6047073022814843283ed73ef7bfefffb91a0d1fec240b7328594860ab4d775ea89d8280c5b3a2e8dbbfbec53efdd41f138e330d989d2b8a2ad4eea80f6ffc747b78ed473be97b86b08997bd6f380ae8d71105811105b11b59507b988ddc118883857455461c19fb9ee30acc65d5791934974165f8826eae2ea69bab6dbd9286399434dc19230deddd141793d4dec0bb9efbcdc6921f3e3a1b723c70e6643952bf9e698401e69b897716d98d9560885d1baf6806aae530c4c212b15a0c060803f508d538e288ac9ff3915087e7b5277e26b5374296bcab932c245216eeeccc57c82726f330ba88dc6b1d3df51b03466a42be7064e3675b83cbdf811a01f5f4571decfdba1949806c7f88c347c8e121088d24c4c20fc97c36dde7d38729428c18852dd5e3733270c1aca164610551e42bd9698a44a4410b4f1c96d321d6eee4bdaf3eb1b5f0fa5fce8492b938831029260c9ab26731e597184a7a545505727188bed2a3b66390647f47d45c35b2efcfca91e14767bb8f1203224d204b827ff1bcbba33bd76e205a82e39c8509131c9beebca8f33e02ce621d5972fb130f5a868f3d6f206c5bf6b47a425f2c5a13fc6cfe2a351a6e668b58878e2804bb91841839887f0ee3f38ffd7dccdfd0cfab6d52e067b375d494d20c9dc7f984e7dfa7a4e15afaf58d049f1f3e379086569d1387660e6f5cca9b2b6a729de75f371e27114a0c29260c9aa267e6f38b1c869e5f916143a11e49619094903f6af0cd0dc301476433c25b963f1e5cfae6276c018ef4bcc87e892cc4921b399b6374e91d4f3c6eae1c7552ca8982b7dd1b5ab5f0f3c0c7af2ea30e0088420b89cbe41e9d9a1065be4049e6bdf703da82093b9e1cf3b0d1997c839c25760785a2dc48bfce4b401a641d69d01c398cbdc5bf68ee7ecb8809f9b649c755e04c42a4709e99998d997967a1b11c86b8bf201a61d0148698b3507c2e63b7b6713c120644d6426cdcff9e67de23cf13ad8263f2640112004bf8bca27125b73ef684b96cf8ac94ee59a2e108250acb7c0b9efb90ed149abb1185089bff034d12ba3b327062109270582a461665f8f0f3942cfc87a86a3ebb3ebb57eec6fabd9911063b6b16f7bc47b697fdec4967fcf81b0291328521464a296130764a42559bba13062df151943d6dc68a2f715c199b00028e13229ba0f8ddbbddffbeff3e1297f743203ff7852c7036c7d8e25b1e7c34a5644155d5c88ed51b7cf39f7e5376b7ee23f17b2be0fd41e821a86d10069124e861669f1d0883dd54563d148a1871d4073e0569e3943ccced4565505948c6cfc6443b5e6a5723418bfbc53f6c2eb9fdf113388bcd84330b9102c2105318a88fb1f38e5c43556155596a3c92c210cf61686f345aad915325711467b6ecc67142640ba8cd077def3cfb7fb2b7a39eed1cfb4416086f1a53f2c3471fb2548d3e2155ef8992fe0eff82e7ff1bdef0c94afa23bc2f083fb8d8fb8b9d6e384a444103ec7a401e759a2b4614197564e9e9a2f917286908d3afff4b401ab4bb270e91ae5b2eed62c33eb3efed7fec28b8eac7d37076218c82f998ce5c194be5a802e30e453aa4270c5ae1a6983429b5d507e08ca43191811f4bff76f00803bc4f15931e11470fd1ad2b1fa50bf306b66394ab1e7b5fedcd269beebab8336781b651253f7cf87e4bf5b8535262c7a02a6c5db1dcf3ca9cb9aa183d40e2771ab4b3f72674be3f6dee1c0d4716fffc668d3058474da91c627398a78ef065ea64fd940c2eea9134d071a07d21302257cb548698d2105ab5d06c9f7262a96df2099538c3b269f791f2f54c3b526933975717187d6e25e4dfa7c9157a852176be5aea680a419537631f581987a38ec81648ed8d4bdcf31e9ec7768a42e762dcfb6269d5c842e17577df6a1d3deddc54bc1725e4f37bdf7cea49f77f1e7c9c928575f4573b48bc1c35246086e97b9312bdbf415b50e38429b6405a868f1f8a1562e1be8cd754599ad1db83d8784419a90382b797b02bcf3daf3eb153f17b2238cb1006a14f78b49a8a2b8d1546535529f0e91bf57a8541d12b0c445124991aaa91e24d1463719c1059b11910221dbef94fdf43b424c7e4c80248f1200d8ec8bbf8a66f3a8e39f39a94109796bafdeeb90fff496aa9dd4ae22108200990a720a69224b0cf10aba55070c56d79b609b3a77276c738ce6419454ca661f47f95703c5fa4ed6a48bcac807644d3459d8fabf20f6f34496d0dbef0864face1754bf2cd15354543d444f23993f93dfaf524a6f4f4441a64daaf305610367232fb702a419fcdfbc65f7714dd78df2c82e51910c688b996546b31155718230c8adc105ebb58ec4e1824c674d9498976638481e3903020b202e14dcbee8bee5ebf8fedde9524165a60fc706fc270c771e79deb3ce38a1fa5a2504f74c7ea4fdc731f7a5a1505b836bb89a91d308f95fe9205ddfb3697dcfef8e48afbe69dcdd91c277366cb6c62328f62e4a16f2ec2642696ea71b196ffd5efc7c22843d84ca0ecf53bb49dc688534fd02741e631d2901bd9b6ca125ebfe49063f6b92370c6210c280c5aae90d554546e8830a8aa729071844ec2a0dd58d959f655f676842d2348df993fc78fc171420c75c81dcd1f7a5ffbd3bbccc9cb49b27d486aab34578c9c99ffd5efdd45175c4bbfde84a228a12f16bee47df3290889400cbcb5bfaa824e41b0984a2aeda5fff7e469a6c2d22b395bcef974a11f984aae43bfbae16cdae0a8e5777a5119b47c0638ea7a881106b8c932c7fbd6337b6c136797f3ce42bc6f02d157c2a0290c943018541864b996710462eec67035c220c9ae96a0c137391ac7093194a1ca52d0bff8a5df12ed8e88c4a1089e4dda72c2f3638b6ef8e52ff99cfc7ec9f0aa2446031fbdfcd7c0c7af0269d1f21460072b1b210bba44445be1353f1f6f1d37f366ba407d8392044cba4b0d6ea65bb5d5941c3d9380346817558193061b29502341bbfffd1776175cfdd3e9d88d080384c141372736537eb1a1da1ed4df1dd0beef4e18204e11bb60466aad0b182a21c981fca1d630273618ee9b606968c46042acdbf9d7f0ba8fe12450a4eab105bd967d6ebaeb122dc9b184b69145d7ddfd037365cdc4fed8ac2a0a11ffc2171e0e2e7b7b2189e72b007189d2f7a274cd896448c225dabd0eb1130bc5dffffd5996eaf1b7f13979e792ce5003ceadd42929e42f44165753e7bdbeb7fd1c89ab444d4c6528a62d2fb4e6439be3f8f38659474f2dc18e1cd2db9194cc3936b73b0983a56a5431ddac70869e5b12f6f5441804b64b11c4a65a9fe1f7ad2853e99babcba0fe45209233ed907f87fbf9dffd83c4eb19c8bdd95ed3dd9768bb7670fcd539c75f709e7dfa6917f6c75e55311af2bdfd8ffb43ab17c165479048e78ba91c7f5ca026fbbcec7d6915e0728bbe75cf59d671c7fc8a77e4ce468e30a0b012defc12ed5fe8e723d6ba8171a4e3037e18f2501a18d104d2e0f4bef1e4ced29ffc15f24778ec4ae40b49403b216137578e2a32fabc4a24bcab27c21065862c484dfbfd2a2423198a2faa53e93f0b912f20861a225b573ea08483b11b282ba9734f607b9d790ba6c2b2a9ce8b6fba45e538c3ce1ec210fe05cfdd47c9c222b60385fc092989f7d189e6bb2fe9240a79977c67ba63f6b90ff0cec23390270c1a26d1f6046d3fece901309e749cb4ebb061e305f76c144a2d75f6d09a0feb724ebe641476232201bac2118c3018e50bd4e676f4a630404822aa8a82a0f8dd113ebfd8c0d14a0e2b9421861c646fc752effffeb204e60838f5040bb356c911caa58f2ab8faa7b7f0b905c6f31664490c2c7ee9bed08af71632b210533812bd8f6eef07e67b8e65d898f2826befbcdb5c5e7313dd10987164071d3f208af22ee1f905bd8d38e9ba6fa296d9517e60d1dc038e59670fe7ec3916ec464482cd8a4618a06893b1d2ebb25417fcf47f61fd93ea0d54cb6188253ec60a3819c3141c2fc49082aa2a914d4b1fd416ea2416e7d855d5b48da03bc20bace38e39ae1fafad86562ffa63f093d7dfeb2b5980f7429b89398ed2fc2befb8a4f8477f5c62ae18f93d240b47d39df37f27f1e3933daa0c6c0307f77e3430a5a15d09f903c1cfdf3e881d884800adc223289c36534955be21d7a3c8bbf5feaebb3c0ab518228c3408b2ab39d825faf7a17164b2a1bf4baa7de92361c336e04df6b4bced7fefdf503d315af9c7f7d40436da198ae073f2263acfbff6bafebc7674c7ea7ffbe63ffdf2e16421d17b5035e2023bd13ccee6a82eb9e38907724eb8e03f9ccd5e8d637ad4db08da1eeced31748c15e68be1d4c42136fedee092d76a155f4704fb105b2f3ec844b44bcd38ce662a2a731a791e55127777972df42baf56bc297e52a2a5ce6f88db701c9cf7ac4192871822ea82105af5c1c3249ebdaef4bea3bf54bb2722762a22ffcadbafe39d85866f62949a0f2e71bff0c05f493cc151471612290b976ae5978b6c938e9b597ae733af58464c0055016f404c1fdc4e64e9a4048f01d5d7c7c802908636551202c1a56feec7ee4324501860fee75a868f2de5cc5663f35e16b7eb77eadd1586c3121fc586bd1ec36f575166e298218602644fdbdbc14f5edf03ce3b89c55a3b1531dc3a66da6cfbd4934e363c85029efdeee77f7f4f5fc8021016da4c247e4f4379ee99579c5b78fd2f5e3715941c8b239976e0086ffa1be9a55a261b6fd8c0419d8d7a461c7ca115efd52b3e17de3381e869d3a25578ccb1d44c327c578b1a0defeceedc0edbd030c2003ba9a858b7cb4b14832725547536e525ef0ece0e108d043160ea8212d9b2e2cfe0b42b1f7d4fe9cdd69a7f11dbd5c3420d096a23f32ebaf91b8433998cd8a72a4b61ff07737f26bb5ba0684aac9a247d7d35c1eb6b67af211c529677e9f7be9673f2257fe0cc1607ce91b4e50cc71159f936e1f9177be3accc06e0ae09c867a8a4f6911f5ab5b0ce79fef513b00f8792bf49c97aa63f21e1b00c1b5b62f039d5e8ae759bf5bfe07b210c11ca2ea2747715363c1110880c07dde52ff2bff72f90e5845e59fd2f3a593d841faa734ebce84c4bcdc4f1465f37ba63f59cf0ea456b49fc3cbe18230b895f1f36009048372cff8adb6ecc3df5ab8fc4c80222bdc1f30f91f8a553475619e2630f7e198ef382da0427277cc1cfe6d729e1a0881d88380261b0319bb29b2b46183a9d05151e7d6f3de3ed4d615098638490041005516aab0f988aca72face17c83183b3f5c74a0c888183b06fd35fe2eac2bb6a023be3d904ada0ad26f7cccb2f316a977247d312cfdc875e20f10c7921d16b37ffe2ab879385afffe0fa9c13be72573c5f01e74606601851d51fd3f17a2881ca0061a956461aaa542152105ebbf850eee95fc7fb7b5062e8beaedb35c2602a1d5660e83965710be996b3c51fe1dd6a472be3059c5a6a8d263e0e2771691681c84c7521e4ffc2f3ca9c2fd89c48b4606bc728aba9033fdb545265286ea84a82cffffe0bf7137665769c2c247c6d7010706caa3aefe29baec939f992bb30b931c3c0717733fbe941657857531980443631e2e00f7efabf3a551215ec404437c200caa2939285223e27cf6ec81789c2e6eeeca537c2100b4b484d07bdc63dae82610944c6427635bfc8d485440e593b4659411dff889c53bf76ae614563efa63f46b6ae8052aca144afcbc842e795d994a85c9c7bdad77f816421230189b23f4d64923a950148835b0978fcc2eef5add87d089d4fd0121e736d63670c37ac7508918d89080340abc5008619150e6c73f5435e41c280c850b620b97cf3ff3e3f497521767c31be685f76baa9a8dcd005418adfbdcefdfc03ff21c95f990dc40064c72adb94134f755e70c3af89c98cc59832173f65c4a13795017c339c5e833c0650a182a1550b0f61d721746b3af8234823c8b18c986058e5975a0fad3fd2931f89c54619610843f12625e88b1a7b49ee041c3f4446f205bffb75b17e8f97240efe69ea028420863b8e3fff3463dc5a55c21b973ec016032189508456bdb1c2545032a5e08a5befe7acf65c1cb90c571954f50789fc38239450cc094e4d78a3bbd6b5c58bec21109df51760239163ae1a65ec76534569733ff7dbc6233d794f0a0318603cf1b1e9a0cf3a76ba11a67212510738e92a962382895d88d45a95b06ff37360fb958fbca3f6645fcdbffc9a3e77a1ca3ee3b459e6b2ea0a23f6287734cdf7bff7ef9530e77a7b4dddeb8253803939a6f05bf7fc92771655e23c1812b8838ee39f480fca16d8061d7ff0cf6e4618e06b6978dd9206e779d7e211cb8cf73cfd5ecfb4fc857cc2710eea8f8a8c3c9f2a46379123a89c475218b4931241a2d56368dc672c8f81e3e0963534624466cdd968688df7b53fef2089c302b07083f4072cbe2ae7944b4f37a82e08a1550be7902442113a920221909abc4bbf77bda57a3c16651a3aa8a6bbbb6b123c46d4a90cd002a12f3e68a07f878c318bc17c8396bfe0b48e9c5cc559ed862e295325f10b7284aab67c0f1c070c124e4940582222d6edea4fc5c7537028119904d9ef7e1b88726ca7df3b2c247e3aa1c25c5133d65a33699491d7933a1aff1b5cf6165454139278cdce2447eb98e927e69c74e13770c4861838eed624f6a1e09f21bf0c121ebd8adf1d10eb77bbb1f3b21eda855379d671338d273c8603abc911c2b17c2f0c36cc586c44d8bfb5a31f32c9a93886880c8222ecd9f83f9228d931cee681c917c7d48553bf7a0ae17923155185d08a054fb0f9a626784dad9224d47a1893fff55b6ee1cc562b0ed990230c27a9b234ada7ffcd4825a8c03ea63000710847b6ad6ac1cecb6ae80b36e55a468caf30ea03a37b37ae3ad2ffe8893068790c4018424ad01b96bded2183c68f0a032263a046c3ab7d6fffa33e899dbe994dcc526ae395f6c9274c36a46678dbdf09ad78ef602275e14ba1880bbf7d99b9622416ec19aa9c81377d3f91e99078c8d8c55a20bcfe93260c4b6435baf217286130578d2e35e4032571af6ffedf3d7d210c32e93a5a19bf88aa7eafd13c0670a4853896888c901782deb749a232d05d8b371c81ab701c7bf60c3eafc869646e0a7b36c2e543e1244311b12394f4b5263a4ebcf0521cad21ad32dc40e221afde5486285319e078a50fc312590fb0175020f34da5c34a4df925864e4da9a2b086f4904bd5d3996d7de263ac1e8358bbc36d9f76529511d3a7acf774c2f303741115968646a40ec281ad6fc5274bc232d03031211c516e9f76ca542336a884022bbd6ffc0db291c55e4b3ffff2eb4050ec313503aeccbef4bb57f18edc5cb4fb218d62ea37cfa37e73612f8fd1921fe1264bd81186233bd6b45a6a261663f7652a8cad67cc4768f90bf9f6c9278c34ea1f5421bc861c21e1b137c2a0ea0803186438ba67637b9e61ffc49d37603757225f40a4ca942461b7f7f5bfd6553efcb69ac0a6b470440967329759474f1d69a854bbab652e81f2cfc9bd5eec9e087359f514db94934e449bcf0a99e17a3acebd1106d80586185980b04430ba7d756bde05374cc2becb2abe0030b14d05f8893ccba8c9c38cfa08c5dbf1794fef824fc05ec118211411929a0f7a95905f30d80d67a12520d27eae46234b49a270c4af3a993cc409cbecb3ce9ecad9726c7d670bb2cbf7f633892b49c65f0fe2925073a1da79c1f51773660b5673cc0abec07d95c493d88e8818d1ec4a7e8ce531482db55ed9db11c6cecb3a6885dcc02f392dc3c71bbacb86284a7bc7d3776debe97ff7461820f131cc0803280d90c7e03168f833085e448548732841ef472471ed059e4d4c483e2cb14f39c1509d1125e47b5f3cb4db479d7ea27b2a3475a1d2945f32ce36f1b899385259837ceac013dd4b028401c2c690bb006a30848f5dd8755907d8c44098b4c00cf90b05254672aa882a4656b2b5bfcf84415f223a76bc523cb4cb78428da2a0ca804863794115c26b3ffe94edda122de03019214e5c641931d1d05967d9ddfa7a926a06c88c50186a78eed9df3887b3582d385859a5325c94c894741b3b6891e89e8d1dd871d9039dea097ea9c036f5e4d186dd6034f2596f9ba6dea44db51b61080b7b37759073bf69f4ad9c4fdbeb03e0e909263120fa6d4552745370d97c6fdec53726c3e46384c13a6a4a0defcccfe9b3fdc972bbe7d5c721fca124f85bed6444195d3886d9a79e38136d3deb2cf32b49384081f968508083d19dab5bd14e3276bc8dac675afe028423f2ad63a68e303afe92bbf9d3dede009fe0ef0fcb63106a7774a891906890299f8dc68048db692a0a6b492f525c9cc95fa6dde10013b3d836f5c471465e4b890497c8ae9648e5c36fa949bc56ec9e0ac7b167cf3278741391d90ac378fa6fa27a1b5a827a8c3028016f48f6b485b0f3b206b0f18f8523608361a93658b049913b5ccffc6a5b6f0f494418f4790c01906d85da9d2e83860fce75148e2d223d09437435e9e128513726ef6013b3c0326282a1708412f27f4812243b92aea39b108ea8b0cf387d068e52964251cee9839f8eddff2335d7fab1e3863ed8c602c294b09928b48e993682cfc9b31bf4812b13f9a544d9d65a0127c8c28d9789deb7a5c336e158630c4655bf4a89c3df52ebe909aa6f887e4376b5aeae7ce8ad44c71b6162e6b25dbfd35231b2c448f90561cfc64531ab4dee2865196773545a474e1e85769ead6c969c46dbbf7ab3297278f8382a36ecf3d8261e57819d9771636d643db36b84c136f9843146fd841a899d1293fba330a8a4ab44742c2c11ddb9a6ad1fdd71115a04220d77702ed73fefd997c4233b33912d35938671b69c3edfe3a04ae26edfbbcfb6c5c8494fbb867b0e0b7d9439669e31c5e8ad73882180c4e5f5b53c06edfe9fb058bbd3831d9715d0ca4183ea996f1b336384d127925a0f2d4a4457cc491a22c85c70422228b5d5fb646f5bd85450eae8bbe193b3e9533a9861a3c480480f522f6977bff7526df19ecb0fcf441e3bbdda88dda962643549ae92a483291925d67133c6a28d67336120e3e9f84395cff6defcbd9e3040be19511595920d0e3b70484b0c9aea59642a28293557d6941af24b9278d0f5dc6ff6267a1c9fc47381216a898fec9cef4ea3e77ced49c4e31088c156187693c4f517f437c139cd95a30cd5155185d839e744af65664e008e6e165a464c1c868394ed362a1f9b849f06c200618930b53341f1bb23d87143176c13a3299145f663ce9c689420527bf98424ceab4a8a3068e77c7dacc5ca441b67cbdcc538d488b4e2f4b2b4abf2a1f9c9d45f805d3fe415384ca555862e545382be4d49bc56d7aea1b8b282ee1cf27094b21e890a76819fd68a3881bf1624772b9e9418dad0276117d9c6cd345c7f81256227dac8244518be74ce37b26d650b65bc8ac1f776098e3322ad088318dd95c4c3803068b5da1de692aafcbebf902a8756bebf35c95d03bc4ea16dc2ac1a1c2104dd694d4fd24f4734c220bb5b82d86f431a9a1259c459ac45969a8955869e4555c5f09ac54b4812b10c3ec9a7d49ff30da89150a81f65a24712593e06c71a912e50fcee3d7d200c4e737975b19124445591f785d77d1c4e624e6aa18f7ccbf0b198e98ed0caeb27220c109688761286f646240c4314ba8d45ac889c7deac9e3388bcd506234dd30ad092e7bcb9b2c4349065a1e03243e425802ca8fb65b4618bc4695e3afa2e6bd31755b4434208451db51c31d7fffc5c1ca07e7f73c39efbd5c3beb6c8fa90be53525866c4e96ebe0df248e536a4a468ea9b8aa18ed1b416d2019b959d61306a9b5de8fb69371e39cec7ac6333f110f474c3a7e9ce1db2943c1c52441d1babe12068574e53180b2108a6c59deec3ce7ea09067be532facfaf53dbcb088491d9223791c4259a794618205ee8301557e41bb239453e9084bd6a7149277bad3cb46f04e120b14d2d64feb737c220742a0c1ec86140db19a28c41abee0897e01558474dae365c0ebae5e0db2471d1ba4e4798eca7d0f218e2d7a8b61ef21a8e9171dc54faef44340ec4d19f9e6a7b1293454f186ca6a20a434988aaaa1caa7cf0cd64922be35223cf3b4cce821c1c25449c0ec863935018ba0883b71d931e872eb4ea8ec5e6f211557c5e51ae219f24897bdd2ffe6157b22c85efc3736b19b82ea63444857d5b8c9f9650d52b70cc11475f61509a9358c4619e400d069000ada67c63939328726b923b07200c39e6e2aa02c29bf01c3d42db688d4c6461247e340e121f25c5ef89f423391d91a668bef70aad264cbceaacc9946bf4b9d470f00392e0d65ca384417f8d6a3c2cb175454b3f3ef75538f488a32f3128c9905e13e9ca61b018add54e49725b128e40230c36beb0148f5322f4f693280156d6a90c628c0e47822276dc908476cc3b97da85d5e893c89ed6b74912c729f52f9ab4b99278428d8fa90c81e8de4ded72c82f5007daf737cc7150880418736dbfe610c1281da23f3e586dee0361b0c5beda732d466c4e55d48e047fc7b1d782f964e5730b1c68db882e5fa79626213781f39734c220077d0297936fc3de1b52e0743ec9420dc364c84f2872ab7bee43abfab2849afbf812878725543522ecd9d06a9f797ab5416f7d1d250e0ff7771a216540f44361f02679fcd8cc1672336f873b240c945f55a47012c995daeb58381b1cdd44db46741a5049027b50196110196990d46848441bca2c5a98e47871acf15d7fd747be10092c5628a1ecabacd11768c72b8130c011cb5064f3e7cdf619460903b981fefbf0e0f42f027144fbf124613f9c6e213771b61c8b119be3cc1625c1df693b0773ec75e05c35da36a2cb3c9239ceab303f0d0b81ac0a828c3634e4f802d7edabb1435b5ed79b24c9e394fa1d4d5f3f8e96c7100f4becded0a61a8d9371dc1422cb33d14a10690e5ebf9013de64324c4e12bf8ef65a3c6732f3d8f5081d9c49fa688568f90c70011502f125b620bbbd6f3c995475c7fe1206ed7865478c38287224ba6793f12baf79fe7a1c3dc4514432154b35e92fbef3375b0c2de49cc9e44c724ef206e62662e823994a7e7ac2a0a84254c26e437c892f84031f484d07c2034d1800a0260499c2c04e4b2c6feec77bbf169d23e228229909c3a56621e74c49be564c6a54420174f6083d4c49dab34618544814c36e437487ec6e7d95f4311c4148df731834830c33b2002a833fba634d8b12f60bbcc369e0b404a9268a743ae14d4b8dfb7b9c130883d6a3ca7e2eb1fd6884c1c4e7e65b0ddb1b4792f9dbce07a892a0a06d233acd8783904452f6a39106458d8625b4a14cdbbfa803fb37b2dcee7ded4f9f9224ab3bf65761e81e96f0415842d8b9ce784d068eff361a0ae2e838612e1992db9964a40a11e38570783e99bb5714d6d4be66302386fc5a2225fd486d05e1792cfc8538dcc14402efcbae9648c51ffed7672669545e05c30d30c200a1896078e3a74dfdf0da5793e4127a1088d48237f54a185a7e7dd56119c9aa2818270c5c42c2a039fa58fc59f1bb233840884ee35095644b3d6b76a47256bb097b0e7198c0d0def45f124f2de833cc065f53bb8c0a8e5642a53c3f9489963ded215341a991daf74eea1eafa16cf85f0658372a6e88feecdaf83edb8fa2aa204d1878add204afa5c59e6132cb727b438840923b879b44041914b51a9181634c92ff1b5512eb3df31e591efb0b03afc3f7e36369551f8130403e4338ba7d753fc212dc77d05a10830e8ecbefed7f57fcbe53b6eb9ccaaa28c8c65e8aaf49625e6955fa243ab92525e48be22021187cc99a9ad638abcd8cdd86e8dc91847c6f28e14054e7d706853010727858025a30bcfee3867e38ee9355599a82438a186424e350557d5325638481baf04484415f7427ae32b85bf1c64104b3c2a443125da77978139e404374423cb87d2e31188e48d659f6e6440f0b4b48cdb51ea9f9a0d75c39b2c0903fe5f9efd2a7fd79dfdf066a6e08c344b524c9cc732d195151a34189e4386d065e6b7412af0564045405c85f10e5f6c680a57a5c110e148252d50e92dc899eceb2c1bc3d07cb8b67d62093818a49a8d1f05aefeb7f6157591bb309be9f9f0c76425a5802921fc3914d9f35f6c3797f8bc4cbef2210838592246d5dbbd447514201a3a71726127d39d76ea8f8fdebaa4e6180dda42036edf7e010216250e48e64bc28d1570bb5e75ab0e310b19d88cf05b517a2cccf0c3a6120ccb9051961801608adfdb8c1688c97a28cba63bcf61a31c80a4362574dbac205b21a090a065f0b1282472531a7226c5e458503db5d384888b8c090d455ecfaaaa43c6f73e0060c01c61309aff9f03562a058532a0983ca9c1bec82a03cb4873ad310dc60d90f077e3b8e2e62f0f8025796a49d6bc988b2e2f7184f44549459491206c80f0a4b4d07bc4a3880f51810d432c46472c43475c1428ddbc4d91ca83020a014f4e2d0caf7dbfba32e10d2bf1c060d5a58024802ec862a436b3faab74d3eb1caa00b3f9948f2b1c4645a9f3465c1101dc238e5ad48c27e64d6c0d6a55822a2519b53d593e8dfbe99e0b58030406134084b8862ed2e976de2ec4a1cac2c77fa91d07ede99309d455317cca6a2f2dc98e080fe3193fcd180a43048adf5cfc5fc573f6d211519b4e0e0b4bb258034f8843d1bdb644f6bb05b7279f28d0795a1a7ffdf5b2f63c3d6c7c67135891f17fb47ec240cfdb16d424e4af0ff659dc200a4212cecdfdc816395f54d0eaf5d7c28813fd487232ce6b2ea7cecb7a1d8fab606aa62f480fbdff77f12f72dc93cd70012868a075ed36a32781861805313e1c8e6cffb53f9f11afa6f314120061a1c574a125719d5121e612117e48ee6a0718ace1f47ffb527319ffc6c4e85239b963511455670b0b2595e509a422b16240a4d718c2c40de82c5545295871d87507c1d2f81ef62bee5a82b0c84edbec0c1411e433cf971d5c243aa2c1975720ea2aadfc5a1460c8a0a284ba313cd39a62ec48e3a8a4dfbbdd43e55c3b6adc8a725319f828c7cfb95903f28d6efc5d312d96ca38abc8b24be2c08fc39e42cd86284a1b00ccbed67bde1a8d1f0fa4f5e24fd4c764c3561d06a32405802aa3d7a958027d0afe447426e23a9c9b1402012880c7c22c2a0e52f808d0baa1015656f7bd8f80bf2e72778845614cdd5a9326cfebc11472a8b2109db93d8219a1861b0c709432912866c571742be85c1656f35110337530e1861d0c9a85e120f4bc4558695efd7f6c38b8f248a72250e39621068f8d4240883c8140668121454eac70b7e2d89d7d3ae908f5dee16d9baa285c81896c85a0b15852d493c0c0883951106aba9b8124312d9ce335beb9f87b53915e188542a0c9a930319b58da90c3ee1c0b60ea9f590cff03372dc5d38e48841d018662433f7185988a90c525bbdbf1f763d89fe3ba9b747109668699b7c4261e175771d5ffab3a7ce20262cf39bb53bc54870531f0883036e913015552061c86692294477bb9fffdd52b636a704fd97fc5928b7e277afaa2dbff926385437230c5095ac34bc6e497dde85df367a47c46c224b6711def4692f6fa0f33d20100631a3371b62b62d32b200a438221edae32627a9fd99375753a7fe80f6237d7e8e397c8b75d49402e705d77f833afceff2397933bbcf3544b6797e3514f8f0a5ad85d7dd9d8c3f87fc851c73e5c862ce6c31a3cd64dc581b9be747f81bd9dd02b73f47c07fa5ca0e529d23a0253fb632a5a12abcf6a306e759578de76235cd8decc67898259fa22521064e60e026b09d999084c200a18888b06f53472cf191337cf7f40db43dc088422c51ade0f2db265b464ff98ec959f44d623215e2c020626b8128ac8bee5a97cc09092d7f21c7523dbe1c7b2e8b21cb1effa2b9f3483f2e9a1a0cc2a04f7e6ca66d842a468b225b3e6f741c7fc14883cefc225596a67126f356b402c400c14c27d80cba48af4d8230c46a2328e16058ea680a9a4b87390ddaf578c5e73adb5452b5a5e0aa1f5f662aaab89177e49e4a7ab96b0291a58441125691c4b2b2168e80f2e30e4be5a852ecb92ce60bbef69785bd9bbc24c565bb521a138d491ff15d1abcd116a63204829fbf73b03fe7c839def4333401c48082e74f493407758401c21282d4d8bf8ba1b89cbc274b6e7d6c9b65d898672959380dc902e28884211c5891c4c3803040382217088379d818240c596b30aa14d9fcf933e0a3d89a9c9e8441e758b50ba94065f0c89e365f74d7ba16e39e9503f9b6062d013180932c516d0420bc7012a8b3026374dfa6f6febc2467b64ca10da563446f761909ad59fc59128e1fd4620847e41193c9612e1f8185efb2144ad0b730b0e4b5832485c98e03461898616bc98fcd4c6508063f7ffb603f9ed64227cebd680a880103c79d9a845d0b8c0c7b638461c71a3cea881858be20465784562e48748457cb5f8070449e75f4f4e194889ab0f7b28723e87f10eb77ff9d68c98e29460a72188ef89eb4c2332d8c345489f57bf3c543bb5c9611138c315f8edc4c5feb41e6acbbbd3e660223fa4b18c8306a47a3e877bd115bad02238422026a341c169bf6792cd5e37137871818c210097e443aef00e8953040fe426e9c304c198e3e316347bcafeb19245e8bdadf507b59e37965cecaf81a9c7a1b189073dd15bffbaf3ef911aa4c81741b0cad5850db8fa70595e1e768508881e3e94a321518b5824a505f2422eced5f580281e80d62f3c1f749e22a7da02638802cd0e6b48e9c340c7b2e63372e7dcd3d5128610875d94beddfc047b135380d0943cf176ae98f5882cae08d6cffa2596e6f0a18bfa48bbba5e08adb2a937a7d6cd8fa6e5f1727b8244e6184c1cb484328bc6959235154ec3b6c296faa10dde679e98fbb2b7e4b9d7fef17175a186128e0acf67c73e5e872ecbf4cf5417c451f2eab8c854939deec8fd94b24bccbfdfc03efc7d6defe5c7c39d80a83eec38498ba002a0314720a0557bc77a01fcf69b74d3afea748431103c3eeb97399f33db272f6dbff6a790cda3d0f7ed9d5e2975a6abdd87988940b5ea1c09b24f1397a2d1c01c77b0bed534e1c83f90b19ae31f4455d800d8cc9ec8ec99f6df54fb13577c0e251034618987315d96eac99355f78c3274db2a72d64b8372db69bedd34f2d43bb420c00f292b84952230c1d444b7edcb9b605bb0e916a88b5dbdf208933ddc187c3e9887c200cd671c78cc69ecb1e13011fc4596d6daa281cf2fc77ceabe09fd8da9bae84a157bd43d1a90c8d3127ab28c1d0aaf70f1ad66c3862739e7bcd2dc9bd3e366c7db52feeab096c5a6636ed662a4330bc7e490351248c4b604b5953a3a135de379fda53f1db5712d8552c711d4e474065d07ceba849d5d87f433e6ea12d7c101e6de71dce16b9a3f11f4ac01b88afb97d7eaea3af30c4558657340917e2bd4d9d2ac39ac5f58acf65f87a605341c9d7ade366a0ca8018085cdddbbc60361d61ea0210619fec73058403dbdbb0eb10a902b5a99748efa5ca49cb6fafd587238a6d138e1dc33b0b73b1f7863c34f51e12af5b145fc71edf827fbf1057175e19d0e3318371fb9dcc245c70a80de06455590a85d67e5467f81939ce9477eeb597a0dd20520e8e1b9e6458c2cf6c5a5319eab1f310298122fb839ffeef5592381c018401c211054018ecd34e9e849d973588b28d788b50bbb3563cb4c74306a050d3a013069dcae0d2a90cded08af7ea9480376af479cd55a38eb58e9986e7df1103401af8ab9320c1508fa18391067f64c7ea56c5ef8e60e721facd1782feb722db567993d82d6ae188624a740bad636760fe42f6280cdaa6a5837d8d0eb4ba901ac2905c984473b070c41272195caa2406435f2c3ad88f500ee73ce79ad918d2c2360021c26fd0af969efe7fc56f5ed1e287da55ee2ea228a1f0fa4f0e61ff61eb77fac2de4d4f930447e3583802ee8e8064c712fb941327f139f939d87f24f3d313924b3b80904484adab91d81a6b381d228d148698ca1077b051e6601b99cae00bad78af56f11bcf65b00c1f3b82b7e75a0802915a89a19ca8caa5091e2491aeb0444c6508ae5c50a70a1109fb0f61585d08f93ff6bdfdcc36925c38026a2f40b263a963d6d933b0f7b203b09ed2a6301b91e17bb6c60e3806aa34744f32ae562e1ae2bd15aa2ce653277b30ef821b261b7d755351591e964145a49e33905ba85dcdefcdb793ae13404080abd548a828b2757983e3d873466207228c406adcf7744c5efecdcb6a02bf061b2548762ce59d855596519346a11f1c0a487e0ce336d2b7bfe92ff8c17a21f6e1403a71319501f219bce1d51f1eea575d06abdd8c46861800c6f015facf8804f6ac251e016180705b20b8eced5a5596f0422a44df978a4868bdfba5473f2571f5aa47b4fcee3a7db26379eec9171fc799b05813220308431fc3259acad0cc5486d88909a8fe88e12b6ce9569181b6ef2569cf6dcca65d94fc7a235b96d763ff61eb6b13eaf7cc01d5aafc372f2b09ec0ec8011c9f847b07caac534e9c8afd876d105218064f61009477edca0e5719d67edc20bb5a02c8df1069865b493c4e9cac3d43b82d1058f2fa01551265ec3e44b250c281559e971efd3091bad01a5717a0f602243b96db8f397396a9b0ac087b1091110a830174cf656823aa120c2e796d2f0e0722cd504a54f5a6048fd10aa83433d2e052fc2e5f64e352accb80481ae2816d8f91784e4ca27016af53172a728e3fff04ec3dc490250c6c57066748e1c444036beec8b695cd62c33e370e0922adc091ffeb6d9e9477e5e67430020cc4c11ff8f8d5fd74d72860072212aa0b7ef787ded7ffb214fc627967225b8fea82455317ac63674c310f1b538d3d88182cf43f61503594a1f9a51313b415043e9cb7a7e8a6fb4ee8db855d08c480623c51e5cb08c7bf99a4ca00f65ca64682ced0676fed735e70fd64ec4244cffe5311c26b16ff8ec4cfd32b09fc29384628d454425b55cec9979c61d0ff22d2d7205061f8d2aeecfe97f4b1df7aa632b8c4ba5dedd1dd1bf1e63f449aa90cdcfda41716cbec3976110c6d87483c34e10d7df1c121a9bdc18f1d88e809527be38bc1656fed04d2c9eca83768ea42a565e4a429d6d153c7610f22863c6160504857f5c743444b185bfcd21e3c96864833c63093ee04af4ae4fb99ca0064a12e66cfaa12082c7c7127dd05e23610f1e5bda41069f4bff3ec639dea422f687de07af0d590800bb90b55b9675c711e25b228c522b2833030360d52ae96cb004a834bee68f246362dc3843144baa90c0ff4365f983d6bb90c87347b160e6c6b8b6c467b467c19d15debee131bf6b62652172859d07217a0ee42a575ec8c99d6d153c6630f22b24961d05486105319605706c72c7d818f5ed98709638834630c9388aa5c97e0415a6e0ea80c07993dfbfd0b5fdc831753210e331457cb7bbef94f2f04ff47c9422245552b035d46dbf0dc332ebf00182cf62222ab08834e65f032270b3bb3363512f48796bdb50f8707915e9c817f98c493ce7ab3672d37a78e9186165588f8fdef3fbf034bf72200aa186d0b7c38ef37cceff55e77a14b5d803b23aaec33cf38c93262c258ec4544861286fed59a2abf7f1eb06b48186b634e369e30b6ea833aa9ed900f6b71614ba3564ddbdd096aa769aa590b230c60d3aee8ae75cde1f59fd4611f667b53d4c896e5f74677af07db8852ffa726b027f0d170674405e14d35b9675c7629f621b6a355eb914f13e2a21d4b03b2501b77b66a30b068de2edc9521d20c9430909a9e5586797ad50c14b303249ea3e30b2cfccf6eb9bd114f4d6431a4a6da97fdeffd1b421149243adea05d610d951c873bcfbdfa2253517929f6222273158614909cf2fbe6752f7e03cd2decdfda16ddb9be198920b6346a0ea2aa7392b0e728b367d849eea7ad4995c580f7cda7b6aa8220613f665f5302de9d9e57e63c48e289de42cc4e7adffc9998ba504589c244c7acb3cfc17ec476342f93e0d388bc40c218ecbe9a98ca005f038145ffd9ad8a8284dc0e913ee0be4154e56b49d87380d9f13e461cdaa4e65a977fe10bdbb10fb30bd48779038b5ffeb112f04071af2823953dab0bbfbf419fe83822ef92ef5ec3d9721cd89388cc561852043681b492d1f54cce6d97bd1dded08a77f7e35021d28b33f04f9178119ddeec590b4d803def6544d815d9f4596378dd47b5d889d9c2165425bc7ec9bd912dcbb7927828424e822cc00553708c72b863f679675b474f9d811d8940c27038b4624e2dccb942ecd71b5cf6f641a9bdd187c3854823400dff879220c1109a68670ac31e4684bdfe0fe6ee16eb767560370e7d087b373d1df870de7bf45b0f90c844ea02e9ba60aa927738c7e59e79c555d88b887480a9bfc5c272cfbc3c656f864e0c12fc6cbeca888326c9e5518aee945a0f098e99a70da3bfc5f3c78874c1f1449197118e3bd08b4dabd4a66147096135b06d73ccae55d511ddb9d6679f34bb8ccf715ab12b8726c4c67d6f7be63e04c771a1d64cb8fcbeb9094211dfd2fc5e256de30baebae35673e5482c019d35506183f1c860bd1af54d19ad30d05dd9dceec72c6147e612eb76b647b62cc78a798874024778d37fe8d7e2048fd3f2731a98ca00e18926351af27a5e7e6c8312f446b12b871ee48ee635eee77f0ff5165a18595092200b401ea1e64275ce49175d681d7fcc89d893d9c417620a7bda824fd7b946e20963e0600f92f8714bbf7fd1bcbd4ad087ce15914e184e67f93f1290602d9fc1c348f02e124f846c913d6d1eefab7fda40c983885d3984c882b763a7e7d5c77f4614b991f93239893feb3c15612eaf9e9e7bfa65d7614f661b6150ea9030f45d65d057cc038501f2195aa1026460c9abbbd1aa106926345c4527fa7793b06948ead58e5aeed44883d8b0afddf3df2736e069a0a10125e039e87de5b1dbe48e66185fc8bd9292084568974b95118e1f9dfff51fdecad97372b137b38f6ba6f39beb7f0ec319570cc81b63b11590f0b4b82f30ef3ca9b956b10c1f9f6f2aaac0c9844827d2703edd4dbe479d7d4b2f7345cb67105903db0609daa6783b38a9717fc036e5a40a8ee379eccf0c250b415f83e7bf8fff486aa9dbce363c42f9af1390853f7c4b2bd0044599c6e67ffd073fb08e997e32f666362a0cea21ea439e1bac97cbf81c86ce1dd9afe7ea8fa541680212cb62b5197c0bfeb513255c449ac1417813ccbea20476ad2f1d0db90cb0b0c0b1e13661ffd616efab8fa3d290a964c1efaef5befee7dba4a603db185988264916b49b28ab734ebaf862fbb4532ec6de440c5185e1f2017b73f0dc94018183855d19c4f7eca034a8d1b04d15c28a6ddccc721c42441a8192057526fdfa0ae9a58e1a63f560d3026b0a5b346cb2bb5515eb77fbed93669773668b09bb3433207bdbf77a5f7de267942c6c22f184ed48f9afff93b0961eb505504ff3681b611d39f9d4bc4b6ebe8b339bf1d44cd62a0cca21c271a830f4672e92ae2b8341658093129ef0da8feb85da1ded686188f4027721fde7c1de5586d842a2af040979395b99e2d022d6ee6cf1bc32673d26f86608597035eff0cc7be4a7524bdd661d594874653569fdc3b7b5bc85723ebf7872ded76eb99bb3da73b04711e98ab4270cccb96a19e6f58c34c4328ffdef3ebb5d15a328df22d20dbfa43b85eff78134347e8934d4ef6d75bff0c06aba1805b03bd317749c96bb9ebdef27b2bb15424bf15a0bc99105907641312de32cd6b185d7fcfc5e53414915f628020943ff4983569b0126e441123f35d1267bdabd8125afe1a909441a0a0dfcd344912fec236980e3965b187968a48b5087ebb9dfae11ebf76045c8344474e7daf994d4fd9a6e5a761b240b25b48d2af8e6cfef32978f98823d8a40c2903ae8255c5019e0bcaa27bc66f12161ffd6561c4a449ac14c78d3ab94341cd307d2d0c4480348db70ecb2418d845ceeff3cb43ebce1d33aecd2f4802a89d1d08af79ef4feefaf7f22f1a3b16d7d240b5a71a691f997dffa43eba8c96762af229030a45665d0ceb1bb1859d042137edf3bffdca184fc18ef45a41bf22969584cbf4e4892344095b766a6300069d816b3754576f9173cb79db6adaa24c8d8ad470f4ac0dbe69bfff47d8125afcd636401f2a8227d200bda89889abc4bbe73b37dea49dfc05e45640afa7f4ae2f4cb07edcde69e71b91a5cd6796a4293f59caa10b12b5e97689b747c250e2922cd00496c50ace42d12bf89b527db86a650fb06db8e9078082ea2b375b3d47c5010f66d765b474d29e4ed78ffc460436cd8bbc1fbf263bf151bf77dc1362d309ed1f27b139f86687db01b59f8cab76f741c7bf62d7468f16e1c441706bb0ec3b2be9d9248c1b1cacb06b53f83cbded27663401ccccc213ba5b67ad55452e9309757e7a3d521d24e6920e452dade24f1ca7f0948f15bda91cb306b5acd115e0978d4c886a56da682628bb962440176ed20f870498886577ff88a6ffe534faad1f00e12af0b03e32896dffb621264e1468ef92ab08311cef3aebb2ee7f873efa05c010b7421ba19db201fab5cf6d6601386cb07b53f63b519e2a441ab02093b2da8fa982becdf1ab64f3fa582b7e558d0f2106906b8a0eaebb4bd4be2277e92250d21d6a28c28f344914dd15debbc527b63d05a33a988b3daccd8bd0303b9a3a9ce3bffe9c7221b972e20f11044ac781c8172cf7d270bd57917dc7043cef1e7fd1fc16a9e88b45018863861d039542d3401b0c748832c39a4a68361c7f453aa68a7a3d4874847d270156def90782e4e2262ac30d200a18920531b04469479b9bd41886c5ad6c6e79758cce5c3f309defc9e5a5561edc7ef785fffcb5f156ffb7ac24e66c11850a22027e3f7ba9385fc4bbff73dc7b167fd04c9020209c320a35b68422b8092abf83a4c847e28ebc8c925687d8834042c1ed7a9b2b488ae1b2d89e6563cafe12d49471a82ec7b892d6c70bccf23361df059aac715f0f65ccc6de827c4867dbbbc6f3ef9174ac6dea73d0c09a850ff85e52bbca824f31c8c2c68390b230aaebce30efbb4937e80390b08240c4701ba1d9844ba2ea8827c865cb16e57d4327252a1a9b014aba621d21139942c5c4f14791d750efb93b07595910641471aa069610a4e76b58891f54b9a892ccb9661a3f3399319cb4af711b2b7bd3df8c96b2ff917bef88212f0408967181b38b5927408424716e2472779534de1f5bfbccf366ec67548161048188e1261e8461a64f2a57c862d41fbf453ab30be8b4853d8a863b886a84a035d4736f4c1d6210132cc1631685a7e83429f8b50b21ca03be3563e27cf642a1d964789092e5209a08483c1f0fa251f795ffbf33352e3fe15f4577b98aa0061a348b221081d59809b278bf8bcc2b14537def78465d8980bb097114818c8e09f92e8e103cba4ebf8194cd65c5588daa5f6c6887dda89950483bb88f40484cf20111248eda7c9cc35da2044213292002a839fb510532014558ccad1ddebddd1ed5fb49a9cf9167349a59370b8bbfd926f8e84c2945c7dee7be36fff8aee5af73175d6502c0beabbb4b03e15cbef7d414df6f95a1fbc490b8d9658474e9a51f8cd9ffddd545c3e0b7b1a91bc51a6f72909aebf7e844ea8a3dec774a26a44016eaf9c481b4cd2c9b45538cfbb6662ce89178e414b44a4b9a778974ec76f91f875eec9da3ccfec1e6e3b2ca56d186dd5b48d00db27f1244ba7a9a4b230f7f4cb46db261d5789a10acaa842fe6074c7eab5c1a5f3172be1c07ea626c0e907c8530830a2a0f4d1ff749285dcd3be765ece49173dc2d91ca568d788be19a7bc9cf0a6d30671ed1c64c270cf0b69d1cfad0fc5d83de42c0ca76d2a6d5092771cfd88254537fce2584bcd249cbc8874c71e5596aea48bfa963ed83d47e257bfc36205099565b455b179309c91e822200ebcb3308f2e6435f6e9a755f38eec4b8e84bb39229b3fff22f4c5c2cf55493cc48802a8091d8c28c4423bd4a7a97dec7f508820145a5670e51ddfb74d98f553c2f178b41b91fe84e1a12c250cecc36b77cb8fa26d3a6d33e07b3e27afa4f87bbf3f913a4c075a2422cd1124aaf243bae0cceba3ed6b59f91a7100825cc954872a4624628a0325240efbf45387d9679e3edc327c6cf1508ed851622089b53bf685377cba3aba7b3d10b146d6e0fe19c85180d043aca2665f8882aecf8178e59b4a2a47165c7edbefcde5232e4413460c55c230d41202b57afc8dcc7102eb772821bfc53bffe9cd85d7dd7d3c759678061a91cec8a564612efd0a0bcf6d24c910055bec04ea00b42398b010c23d074d4c65a864ad4c95a5a2f0c6a55eda6acda5c30aecc79c359cee8a2b4c8565b943832528aad452d71cddbb795778ede23574fe4365c666d6a096823b0544410b0715e59e71c59939c79dfb2867cfad46f3450c650c2985413799b57c06b8f407421390cf509973e285a39de75e3319871d9121a8a53b8e1be88ee37303f380671b02286a06aa5b21531d605e5430c5a188a9114014ece6aad145f6692757d9c64c2fa33be6bc4c521e280992a596da1661ffd6fd914d9f6d91bd1d0d4c45d01a841d3c44771cb5af4441e75f622108baf9282bb8e6ce9f586b26fc80923c3c8d8518f20ac390230c3a6709f90c20c54e219df90ca4ace0f25ba7db269f300c2d1391292e84b63fd3761f899f8430bac0d9d89c286044a18491062011c5ecf7402c4099b3f379454efba4e32b2ca3a7945a2a4715f0ce427b9a51045576b7fac4a683cdc281ad07a23bd7ee51a3e10e460cda9992a091045013b42a99868882ceaf403fe6e79c72e9f139c79fff109f5b301d4d1481842169c2f07c5af67beb43379b9803848cf169b4cda46d3467b69414ddf8ebd9e68a9a42b44e44e6403d4814f516c2f38b0dce072d39d242b452ea7175a1901106ad15b2df3b35f2409bd55454eeb48e9e5a6a193eb6d0545295672eae7472f6c1bab345856ba543942078a5b6860eb1615f93b06f53ad120a4068012e81723372e062df034908e8d4043886aa525fa5f6a3ef6285e128912a2bb8f2f69f59aa467d97703c56d544643861b8b94f8f1fca329ac21c4633e9ca67b0ab9268f1befed7cd4537df7f029f9b6f470b456406b85184e73ea41beb7994e6df49e2d9fd7d21f6b058427e83449d44842da86ef63cb98c20e4e9148842f63dfc3e972ed68eb0bbb536bcfe13d861c34269361594e698ab4615980acb73a1aaaaa9a02487eeb86d944858395b8e85b7392c2489c251104e502321518d8604251a8e2a7e7748f1b902b2a7cd2f7534bba5c6fd6d4a38a0d59a083292e065c4c0c37ef691c30b59897135c11849d011854e5521efe29bcfb34f9afd5bce9e3b16ed1191955e68a82a0cba090fce0de4d7714c658010c5704bcdc48ac26bef3c0e93201119083f250e0fd1d9fb27b638f6678ef0dd94074d7dd05a9eae39d9ef1c6c11b5b1bfd39a993d1734987b1cef70c6480367b6f09ccdd15903420905a2f43328aa181155211ad5c80c5be805f6b980d8e8ab5a6a45aaf4552e43ec71292109ddfa053e536ece49174d761c77eefda6fc12acd888c86a85a1ff84e157cfa775ffb73e1c230de0e0f4499050dca9d231ebac917917de3815ad14919950f7d345f76eba2cbf49e2a5d15331574c6ce1b730b2ad910887eeabbed975e4c1da8d38f01a71604dd535ad3a6b4f2441df22baaf1a3910d8dfc1df2bd40fa929f417f0fe1dd67133873bcfbaea27e6d26137d13eb6a1bd21861c6178789043126a9af77f1975246d0fc7245888711ed439396b78c3a7bca9bcc6e938f6ec9168a988cc03378652feffd159b89e12875fd3456d617fe78a6ea71f69eb22107a12a12713d66e24c17c0495415315f48441614d230c7ae220ea0884a0fb59d23d5629eb4610faeb87749fd5611d35a52cf79c6ffed0543aecfb9cc95ca8a2a12110a9210c9900ea5c14ea106087d2ca76429aa46a092c9abbcb5454eeb08e9e5a8ee680c850e2702c250e7015f36aa2a8f7129eff2855645bb75047750b2bcf9a49f7552308bc4e59d02b0cfa755dd111073d815074ca837675bd5a9622f5200151b05b474f2bcb3dfbaa9bcca5c36f27267331da150291858481011c10c43d1b19596052aa6af6bdf1b72d85dfbef73873f988023409440613871308cf2da636bd89a8ea1cc2f1ff658b7d2ac9b73e9c20f6b208139db27044316020894092442156a722e7a48b6bec334fffa1a9b00c6a5ee0e92904a2270fd3df1c86b25f3d97311fb6ede1ef68499090050e1752c1196ac86118c1e7151517dd74df09e977de1c81300ab59e2ecf7f63b7dfb5677b6fb0f9af95d0b6e75ff6a3e32dd5e3be47e7fce5b48ff08824e2e863907318e89c4085a11772a3d20e82b8281cc5aa63e421169a50fc6edefbfa5f37165e7ff7719cd58e55db1043613f504d97c747e937bf27aafa166dcf129eff98a47fead1401005083b58ed334e2b719cf8956b4df925d7d3793e036d048140c2908834403c168abc1c24bac42da9f9a0c9f7ce3f37175c71fbac64ce8f231019022bdd415f1d6bb19315e415ba93798d98cc9b8738498895c7b6d44cca739e7bf5057c7ef115bcc37911e1f81c3409040209435f48039c9c0099569ff16d16f66ce4028b5fdaeefcca0d5387f22d7e88ac551dc650b3be9792857b2979d845c9c3cb4455de25bc6963a62b0f7a92609b72625ece89179ec3e7175dc6db9d17d30d00e627211048180c9306853a18ede48499741d0f3385d77fc2f3b905d69cd3be361e4d043184c9c3444a1e7e4738d3ef28576826aaba88fe7201dd8143f9694f06918458e1a982ab7f3ad15c567d3167cf3997b3d84e211c87f94808445a11860cde9394fdf239b9ed91ef68e5a32d7ad2105cf6d67e2e27df0ac59dd04c1059401e2a69bb917e73239dd37456abdb288158417f5e4609c472faf5c05127078f74262d9aace38fb1e79e7ef93125b7ffe934ce623d9912841309cf970f15df84c852a8e96db798dcd775dcb2817415a881c60716cdddc9e7e65b6d138eadc26e4264137ba0ff4da33b74b8b4ed16e6c93c94406ca1df6ca65f37d3ffbf8d2ed0fb18d91e086200e0edc79c6973cc3c63349f5b30b6e4c77f99c199ccd389d932953399c6d3f780271b1088c1740cfd3e56f9cb7f677c27b43df25deda8159cc10645011ce594d8f73c5f5478cd9dc7586a2696a2b920105fda1245e88ea8969208da9446152aaaaa2a3417a51dedf42b5c0aa5d0af707744585564cde11450dfc3abb26c87fc02fa6d31f5462584e369e32a389e1f467f5f437fae225dd5221188a18dc13e56f9c877516130407a54da715084066ec03b44f4656e1585f7feefaf9b0bafbb7b96b9726411f6160271d89ec34e89c144bac84f847cc344db0f2ec1cf0804227d813735ea480389d7ae872b7f6b69db49db6eda1a5421e2f5bcfcc78d527ba30f7b0a8140201003015555c348183293341ca46d076d7b686b04d2e07de9d1f5b2abd98f3d854020108801405aaf2f48188e4c1ab4db2d21337c3b892b0d8d4a38e0f1bc326783ec690b624f2110080422a590e516240c994b1ada68dbcf4803280dcd8adfedf6fe77ce7afa358c3d8540201088944191762161c84cd2a0f4441a644fbbdbf3f2636b91342010080422657c21e85b95ceefcfd4df6395b9a77d6dc80e1efd6c6ae8f377a04e03e435c0fd13f03d9c9eb0a991a059d8bbc96d9b38ab9cb3d92d68ea08040281300c5569733fffc02f734e385f1aac97a4eb5b9f1e9fd5951e93521a7ef12fa5edd1ef8599d2c0b3166359b2bb85785e9eb3b6f0da3b8fe3f38a1c68f10804028130a42e84826f297eb798ce6b2a862492230da02c8468838414084b6c235a78c2dde2f6bc3207c3130804028130bcf5161bf6fe8bc4556c240cd9401a645f47087b0a814020107d5317fc0b7d6f3eb53ddddf271286fe93063872d9444983cb33ef91b5b2ab39803d8540201088e4b405251cd9bcec01fa9d40d798b40ef2236148216950fcee186990daeabdd853080402814804b161ff9ce0d237e138a594eeef1509436a48c356da60c0e3c59de63db25e6cdcefc69e42201008444f90dd2d1f7a5e7ae459fa6d1812ecd3fdfda6e058e557b372a063472e97bf0bc421ca1a5c5e059d6925b2648e6e5fe5b6548fcb371594e4e0b440201008c46164c1d3b69e6e2e6f534501ae888fd0b574d0c311740d438561f0948667f54ac35e120f4fc0fd13f5aa247a3caf3eb131ba676333f614028140203448ad875678e63e7cbb12f237c6d58567954c78df4818fa4f1a60a0e148652b230d5b1969384414c5ed7bf3e94de10d4b6bb1a710080422cba1285264dbca97ddcf3f7037250b0749fcb2293953de3e567a4c0174e109a80809e5a4213c01f252ac2aa4b06f339c9c50ad35138a09e967872310080422f3548596ba3dfe852f3c1e5efde19bf447d844429e5b946e3a8fdac988be8624b0d263aa9486bb9f55dafef87d501ae0964b501d24d68048d4d0815115bf279a77c1f553086f4265078140208638544914c5fadd7b239b962d89ee5ab79cfe6a1f6df58c2c44e8baa166d21a6ac6214d29695029690085c1a5230d226b23239b97494ac817719e75d544c2f5c8193a1508ce6ab770f69c64efa950d5903f4a0d54c69140201069842e9f66b698b89c3cabfe77295b9cc381882a0a47cfffa98a425f9ffa787f50f6b4b9c586bd0785bd1bb7a942b48efe5fad41e8da47a0e6c2ddcf66dc761b09c3c090862863901a69805005a80fc384bd9bda5d7b37ed4830b1f47756f436b154f61afaaf080402916e8481eff635254b749af83f786d99f97ad83042223cd4e269a7ad9935200a1ef6ffe44c240b481806963408cc40b4dc063f339c7cda4c092696a98f8441335815490302814843b2c077db08a58a30a8ccf729479134681b43d8280699aff7b24da397290a401444085d67f2609a533366882f93867f52d2708bc88c058c09121f2176654f3069b83e4c2cadf3912c20108874260d9c6ea3944ac27034fd9fda6de326902e35596bf0732c091ed6844c77d1a8300c3c69d0c88296db604a3061f4aa02d747a345c2804020d29530a4922ca493ff5375a441660441ee22094307481806813430e3d1aa42221008444a403724fdf54fd88988a481c7fb10080402814020614020100804028184018140201008c420002b3d22100844b602fd37a20f40850181402010084442601d06040281c85aa0ff46240f54181008040281402061402010080402d17f60e1a60c41db633f00720737575af32ebc71846df2f1cf7066cbe9d8330844f6a2ecae7f0c814fa17e4808f72d12bfa00991c640852133c88276bf848db622ff072f9a3bfef67ff7884d079ea5930dafb346201099481444351abec7fd9f872fa53eae0dfb23fd810a43e600eea0808bab8a691ba14ae230cfbc47f6daa79ef49cf39cabafe2ecb945d84508042223a882106d8c6c5dfef3c0c7af7e4c527fbf04020943d643bb261b2eb1820bad203c511cd9b68a130e6cfb28efe29b8eb78e9e360abb098140a433c4a6039ffb173cff84ec6ed941e2173529d82b19b26be5b8fe91bbdc53bf8abd38c0803e0ead78af939c77531c9caa2838a3db57079480276cad9958cc99cc26ec350402915eaa42241c5ab160aefffde79f5723c103f457edb40561035476d73ff07ce751806e5d192cc27029f6faa090864b553ab89aca1022f12bb3c38ca1c364e3a596ba6874e79a3673e548a729bf28077b0d8140a403a4d6fa3dbef94f3f1addb56e31fd711f6d8db4f9c07f95ddf50c9285ac210ca720611834d240fb9a0eb0c2484398b17368706d3690095e8d864964cbca762289b265d8d8228e3761622b0281383aaa82240a910d9fcef7bdf5ccdf94a06f13fdd541dadad8a6472ebb13c942261106cc61c830b00926b7cdf9214c38891107501bbcac8da2d3b42ab47a9118ddbbb12defa29ba658aa461763cf211088415515da1af60716bff42fb171ff3afa631d230ae0ab04240a990954188686da10624a037c85a448f83da786836a64cb8a2eb5c1846a030281181455e16ddf5b7f7f52f1bb37d05f41be422b230b129205541810474f6d90dae6fc10c882c8d406880bba5903b5a132a636ec5edf9af7956f4db68c98508a3d87402006445568aedded5ffcd2f3524bdd26a62a0051f03355014f43a0c2800a431aa80d5a4264947425440699da102beca4464224b26d658712f046acc3c71572660b9ea4402010a95115a2a16068d5c2d7fdef3fffac12f40259d84f5b33230b22aa0aa83020d2536d88c50899dae0d5a90d35b45545362f1384bd9b3a9ce75d3bc136615615f61c0281e807552042edce0d810f5f9a2b7bdba1aec2215415506140852133d5062d21527f0493a862548dee5ae7969a0e7a2dc346e7f3f65c2bf61c0281e80b649fab2db8e4b5e7839fbef1b21a0d6d25f15c8516541550614064b6da10646a838bb591a0360807b6465dcfed70e79efad5d18ed9e78ec63005028148a82948a218ddfec592c09257dfa4df43e8a19ec48b30694401550554187adad15e82bd98d66ac302add853984d682dbf017ea710552562ddce4074e7da365351b9c35454968b3d8740208e04b17eef0edfbbcf3e1dd9bc6c0151949df457b5e4b013107f475521a314860583ab30a075a4374ae313586a9ff3234d6d80a4480f6d1d6c57006ac370d9d316f6bef164c03a764679ee59574ea4e4c189bd87402000b2b7a32dbc72c1fcc8d695cb184968623e04fc89c0fc0cae07a830f48e1ccc61c808e4c4ea362cd057890c30c521c87e8e9da690dd2d6264d367cd44966573e5c87cbc970281c85ea8422442fdc187bef97fff87d452b78afe6a378927366a64412a4555011506c490551be4f6393fd2122061c27b99d20055d8e024453551948ad0aa85d1c8e6658d39675c31d63ee5c46ac2f378052d02912d501459d8b7695de093ffcd577cae5da4ebf48387f90d198942f681ebafc250faf3bf632f6628da1fff11547e846bb221fc00e5a32b196980360c8697b63c53e9b042e759df98601939a90c7b0d8118da101bf7ef097d367fbed8b07713230a107e8064e9588138eaf331a971e8ac017d7a3c8624b218399014b93216a6d0177c824a917ef673ec264c35e497a2dbbf68979a6b7da69261b97c6ebe1d7b0f81185a905dcd8dc14f5e7b35f8c9ebaf287e179474de43bac20fb16ba829594055610881faff3e3d1e4312590ee60064ca34214ca14f8a8430450bd1c21484540807b686686bb34d396958ce29978c351594e2890a0422c3a1f85caef0fa8f1787d72df994c4cb39c3d5d36d6cf310cb6f42a28040c280e84e1c244a1c024c71801d858b398e66461a86d3561eddbe2a1cddb1bad971ecd9231cc79d3f8a771638b00711880c230a219f3fb279f952bacb5c4c1419884203e9ca5388e539215140e881390c88234297df002a4211280c8c30007180fc06c86728e0cc965cc7ecf36aecc79e358acfc9b761cf2110e90d351c0c46b6adf83cb4fcddc5aa24d632a2d0c28802e62964979fefd3e3318701d1d3b86af90d5a9802f21a7cac810a11bfd84a5164b1616f20b27169135115d95c363c8f335bf1282602916e4421120c45362d5bea7bfb99e785fd5b96b2c24bfb18617011ed9824aa0a5983bee630a44061781a7b7dc8b3d05bc1488004c09d13fa1315c35983efe144453e67b1e53a669f33c23eeb4c541c1088745114b6af5a155ab1e0235588d4e914051723ff108254a82f47a2907dbe1d090362c089834d471c2a8e401cf22054613ff69c118e59678ee49d8598e380400c3262390a5b56ac0c7ff1c1a7aa28f4441464240a4818903020068338d8bb1187618c38c0f725b415109339c73ee3b4e18e59678dc472d308c4c043f676b8a25b96af0caffb78992a89f5a42b991188825f230a203ea0ff46c2d017e02909841192c84e54dc0a095211b65b71b1dd4b03230ec362c441964a231b3e0dd076c8367176a5e3f8f3469a2b4616612f2210a985d456df18d9b46c396d5f90f8d1c8263627dd449f7784573e200c020903622088031cc3849d4d552771a00f8fee5a17a0add15233b1d431fbdc91d65153cab1e43402d10fa88a221edab33fbce193cf85bd9b373192d0c414058d2844912820903020d29538f8758a0310874a461ce06b8958b7cb4f5baba9b02cdf71dc79236d938f1fc659ed16ec490422499e2044a2c2becddb42ab3f5c26b737eed5110528b8a61d8f44a2804833c280a688d088c3cf187178e2569939abc0118883d6ca644f5b61e0a357dcc1a56feeb11f7366b57dda29d598e78040f40cd9dbee8aee5cbb31bceea3956a24a4ddf300f3ab83745d0c25244d14d07f23506140a421710079b4951187723d7150c5685178cd875edaf65b474d29a3e4a1c63a6a6a19e1791e7b1391f5506445acdf7320b279d9eae8ee0d5b483ce4a7851d80906b259c812828480310481810994a1c644a1c22dd8883961c0947302b58031251221cdceea3ad99cf2bcc73cc3cb3da36f984617c5e510ef62622eb7882dfe313f66dda165ebfe40bd9d356cb8802908436d2959fa05d55af2251402061400c15e2002d4ac903ec8220beea658e0fb2b98b1961d0c84309759685c1cfdf76053f7f678f75ccb432fb8cd34658464e2ee34c66541d104317b20495530f46b6adda10ddb17a332308cd6cae74b079a3e50a49481210194618d05e117d210f4f81c188ed4fdc26b1dd11384048d40289b548a73a008128a3f65524ecdfe2a1ad91cfc9cbb54d3b65b86dd27155e6d26105d89b8821c3135ccd6dc2de4d3bc31b3f5ba7043c10b66b6164a19da909fab083cce611a1f308fd3702150644561007893a3c99749dacd0c215f54c7528eb220ea44409f90bc2ab17b968db672eab2eb4cf3875b875dc31957c6ebe1d7b149169a0f61c140e6cdb13ddb27ca3d8b87f1f5311b490838b9169ad7e422ceca0110504020903225b89030b57dc263007e9215de18a02a63a94b106df17496df5f9818f5f6d211fbf66b78e9a5c669b72429575f4b472cee6b062af22d2156a341c150fed3e18ddb9664b74cfc69d4455db7544410b39686a4254af262010481810889e55071f73a2cd8c38149278c9698d3c1453175c281cdceea6ad9ef0bcc336ee98720859407128aced80480b92204404b161df2161f7861d919d6bb611590292a01185764612a085504d4020614020fa4e1c8034c84c75e89e24994fe2f90ec57ad581284a4174f77a176d75943cd86c6367545827ceaeb40279b0e7a2f280183c92100946802444f76cda15ddb5760725092e1d497091ae7b1db49083806a02020903029102d581290f9aeaa01583cad5918712461c4a624a84a2e447f76ceca0ed20e1788775d4e452ebf8632aac35934af9fc623ca689483914bfcb4f49429db077f39ee8de8d7ba80d424e4e07230af0554b5e0402ac851c24240908240c0844eac90314a551d8098b10393c64e164e4a190290f25ec6b1151957ce1c0b636dae02cbbdd5c3ea2c03a7e56259008489ec4fb2c10c61882a24a1d8ded62ddeedae8eef5bba4a603f58c1474e854040fb353ad6602280918724020614020065175d0274a0279d042160e461ef2483cef410b5d14b3eff3a4d643d01a43cbdfb171f69c1c085d58464f2db50c1b5bc23b0bf0c405a2678e10f485283168146a771e8cee5ab7478d045d8c246804c1cd6cd1df8d2400c9559024209030201047973ce8f31d34f26065e4218791873c4618f42d5f8d849c916dab5a6903a26033970d2fb48e995e6aa91e5f62ae1c59c4d91c983899c5808445a9a5ae556cd8d7201cd87a406a3a584fba8e00bbff9fbd33db6ddb88c230778aa656db59ecb659102068df2d377d92dcf461fa0a2dd06b27e812c88b645992b571d50c879da166e0d301650b851b54c9f9811f47a464c21024cea77f0e87352942829080426040a1f60f1e62f91917f0e04b780841fad095e0d095db4d3abe0ab92f8c5f7ee6af377df79b3787eeab1f8edd93573de7d9cb0e5eb6f98503429ee6747c39a1d7fdeb75ffac4fce3f5e18651949089d0350584a70882524e4001270ba0185c08042ed193c94f224bee60011cb93bcaba50faa7152f53f2878e0505186e4ea8f11772081c3739ebde8ba2fbe3f764f5ff79c27dfb6adb6b8cf05b640ec291e88fb3544743210803022fdb30b32f86b2021602521414d312c34405029025edd804260d8fd3b87df13d41e00c48f3f554b520b4fdebf4be5c91fa60f0d090fc2aa81b2032cf68574747ec0dd48254088e5aaddefdef69c93d7871c263acee1f396d938c014e2ff8807599c17b39b391d5f8dc9f0d3889c7fb864d1620e006109e0404f10322d4560f233b5dfe7413c7fa3306140a11e8487423ae7002122675ba60fae8487864c20e03446fb2e7dd800044b5641fef137e186840fd7ee1c359dd3373d914638c7a76dbbf734b49a9d009388cf981c44cba4588c17c5f47a56f5205cfe3e2ce6e35b990c080888408aa0c3810204b58812a952040808281402030af5d502c466ad87f7ef323998d82081f0244004d2218088160008011741b1980a37f2b35f7d0511a61ff8cef3971d7119a78008ab731c72b038d8dc070341e25f8341bc4ac5fa07fcfd5e15d3e12dbdb99890e1a79b324bd4150aa9040005082b0007707a41a5072a411030592224a050080c28d47df020cce42fcb9443840900c2dd02117a1ad1948fabe7cb3c6d90fe079f5b4d8188e338a6eb79625d08fbe8a465779f362b8868f502abd90dacb0251a2fbf729a284b9644198be6095bcda2829bcd6e16743a14c9c1a45c676ab0cf002044c0303550cf67000e8802048403140a8101857ab404420c3612202c0d225c0011d0b0b93254298474a3246b8f5cfde9737be038c2b6693b6e359dd17d12daed430e1102243a552a61054d4f2c776d05a16758b6b5976f2c2b18cb92bc4ce39c65dcf13265f1428041cc56b751311b2f8bd9685152a2a606540a9069e9819e16649a151810901e300404140a810185fa1c00a17a20c460640088706a40c20730e11b774d968166081a5e5950974e068e311978e07836a8c2168707df6a1f35ac83966f061544f8621f070ad7747dc7f4fc4d753dc7703cdbe41c226c98965955cbe6d5a9b677fbd1cfca92d2820ff8bc9262b34da85190a224c2392de99a94eb9c3ba3e2524596ac72d174c8041c24ab942da731af897c0fd540aea6030800834c03049812e4205d58cbc73a1850840314ea71649a26ce9fa250ffd5f74b5a8184b32595a8b3afc105dca7fece05c7b3355ba0429b35d5301e6ea42841653515ba00159a02405883d4002607b9b6afce755040c1ff837080422130a0505f0c481835833cb46bdc355d3a601ba60cd04e4dd561e23e88d8295bd8010ee0204e6a2a7451f31a983214f7d8403040a11018502884897f0ee8f696ed6de982bd050c940d000ad00fc1023493fbd9166f1be8a9061975f0c1c0f1110a50280406140af5486061de534d00093a1cec020adbc0418708050f1028b6550401146a0ff5b7000300cd11bd50cbc57c5f0000000049454e44ae426082, 'cpg28110@gmail.com', '12345678', '2018-12-06 15:24:02', '2018-12-05 16:08:15', NULL, 0);
INSERT INTO `docente` (`dc_codigo`, `dc_paterno`, `dc_materno`, `dc_nombres`, `dc_nacimiento`, `dc_nombramiento`, `dc_nivel`, `dc_categoria`, `dc_adscripcion`, `dc_foto`, `user`, `password`, `created_at`, `updated_at`, `remember_token`, `rol_user`) VALUES
('3', 'Apellido paterno C', 'Apellido materno C', 'Hunberto', '2018-10-24', 'Nombramiento C', 'Nivel C', 'Categoría C', 'Adscripión C', 0x89504e470d0a1a0a0000000d49484452000001000000010008060000005c72a866000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000420549444154785eed9deb7aa3ba0e40fbb8a74d7a9f5ea69d763f7a8e976d816c040102c424fc585f1262c0962559be606efefbefbfc3a97c7f7f1deeef7787870677f5f7077d3c83ffe4ff3c5dcb79dcafba674c23bfe53f7879793abcbfbf99f99e8287c7c7c3ff6eef7af1f4f47cf8fdfd6d5ce3f7e7f7f0f6f67ed8dfdf9be7fdef2efd2de7fdeff63639defc3d07cd7bd4f951c7b33c076e0ff70f0f87e7e797c3d7d757759ec5bf7fff0ebbfd3e3937bd96d32d277bebdc294067d01dad4b5ac7727d6da4f1c795fe6bf84fceb7d0ff19e9b83e3667e57b28273b003222991201b4d32210681388082bfb3f11b6fa9474d6f1391c41a590a6c2076e77bbc3c7e7a7797ecec7c7c7e1f66e579fdfb8eeede16f349efc38dc1a86321de11ee9f75b9f17f254ff175179a74c18fedbdb9b33ee9fa4cc6dfcfefe1c1e1f9fdcf9edd7b5ce3b0574a44b87cccf48235d97beb7fed7754eb887dc670a2770b203c04b92e97b8f64aec3f3e5bffd31975ebee769e43f7d4ef27f2d90fcd34a4b7ea7f29e9028a601adfecf4f3f8517bebfbf0f77ce6958d7833f7fde94c169ecf49382f1dd89a3099017f264a67760fc2fafaf8777e7dc7e8c08e8187f9cd3b0ae0b56fa31a013419795fe80e850fe69c17f9adc0ef2ffaaef7da8ed0b5be337f9b5ca3284931cc0cb73109827164432d928bc9017be0f722dffbd1ba93cff599d5f1f97ef533801141f43b05a5dc2f9bf7fc7dfe3efdfbf8d6b066e7de8fbe7cf9fe4d8620e007454e2be9397d015b2f3f0fcf272922ce03529af732aee5e20d1d029a00b5a6f844a7f7ae85d824f3f52c74d74e3eaf0e903d8a055a6be8c7600d23f221369c63a0aa20b3c067d1d7d5d8bea9c203cbe2742749cea416b234c0d1085b7d20f855653ae09b7ea7b2bae75368fcf817604913c8ff70f8f3ea2b1ca3794dd5ec6486a79530756dabe48ab0f5a3fc26734e278ac37a27b63b1aee9a9f3a3f3798a1e8f7200be9f947925ffe9338703300427859b0a7d5d7d9fe478ea8c24aff9f7b1d1801e00d491c0540a4fd741aebf4608fdbf269205f8f1112567183b10489d8b1e08b95e040c5db610bd9c8afcdacaae745ec3f7bbd1e35b831d80084ea83311a932af8c4f0a35178d7b37d179acbfd7791c2340adec815bdf77b7d28e8531845e2d7f619067c605ac328d851994bb9d9e19085869bb080d58aa03418febeff5ff1de47a3835d5bda29eaa6321bff56f18d3900d7200da6bea1b9bc724b3ba404b91e745d0ffc5b4419041c084527d85d81cf50edfa70aff05660fea7bac07a6f07e8df29ccacb0bdda254ee7dc701a85b09f965d0faa8ce6824ed92c87d553ebaec6fa813e8ed00b4f1f7129efc770e3068ff7984983617681f21b68d7a7ffefd6ba61f0b6b04acfb940e23f756794e85c1c4c6bd7a441aa2bf4255e7a69ec41657d03a752e747e74be1c894d3a863881de0e2078cebadf2fad668d21b47353e5297efa63295a1174998e0daca4a3f0e0faa6aecffbdf8869ae6358616f823118373b47eec9421eab2c539077898e0d044aab1feadbd571d483aaee35958e28dde1d8b9d179547a0a62fca13cc3a6077b39002e28172733f5cd327c46c95c214213aabc0da7cd9b361dc0dde1d1f5d7adb4a7f2f4fc9cdca7c431019da7a9c74172c2e2a0fa7e6d0ea06ef55383e94dae47e744db5596cfca1e633abef77502471d800c98a437d164c2950c9786ce632f85880277dfadb9d6aa0ba05ac2f7f78f46ba29a8a7031901afef571a216fb7de40ad724c45180770f78ab2b7ba0049a3a5ead2d3d00750ff43ae3fa5a0f368e4b9b253479f81eda30e40df405fbc2154c8335b223aaf3aef1af51fe1d56eef5af76cba498f01a0f83074c55f5f64259c373094fe1c21ff3162bec8234b7ead724c058b8282b309e40ee0f1e9f1b0777526faea75b6677dfbefa5a3f3aeec30b5cf80968b45a70348a74b02f50d32e3e7b795d9d2907ceabce7bf2362fcb7d1e0f49cf36b7400a2888c7a6bd94dc9fbfb7ba5ec6b8088c52ac754240ed1415dc87fd411f575e7d04ea051bf669daf4887f37cbb4fab9cc7a2804e07905f2cc16724fbbd261a42144498a9f10be204c401087386bd2c80d1f72a1225a7d7d7d356e71de32d7388e200928559a613e8a8734b474a46e73fff9d91cb4fd3ea00acd63f416eaa33b5469272b5183f9f4ac151b4e000988f0e305067c9710a3e3ed6b516607607e023805af6d48536feaa3be2d04e40d77185a5136b42caa0cb94d11505b43a00eb42267986d6882f4b3fe34fbe57380730d30c00f0145df39e0e332f0b63e481413aab1c5311c65ff462a0485e4f8ed40988f1c74f4b17d6862f4f17a1ac961cc17400788cca63ca4df24f8fbbb864e4127065b2c2fe06d5ff752b346717e0cd1c038806702caf7392c8a13efe34f720a08b30b4ecd3bcd850a79513b0ea7ead544e4d7e373f29f3db9b1d95990ee076e704b5977e53865c5cbeaf8998ef5c09a48fb877e53e6afc42968ea7de2c594e41e379f8be795c1295a787a5a6018d7b77d18804940e881eac59afadef946917f5da9265c3018467dcb5c75417d5e80cac042f0c57260442d9f6cec9f1c9ef3b849429cc1058ad97cb722af267e1bdc2f754fa45c8f2b3dfdf9be5988a7c61d410d06bea5a1a380dfac0a7a53bc543be3328a337fe5876eb998986039069142fa8bb60205e2855a891b69e7d08e7378f2f0d152c65d3a0bca718bff0fbdff4cb8021dd17a080d03fa7ca4bdd15b0ca3115c980df00a48ea5de89087006def9c7dfe888a53b4b32da5e2a1b0dd7d0c60fc82d9765e200c2136ea990a0f28c8275f316384f5ad929fa5f5c23e99e18694c5c5addbfaf94217e0e23eb7f46e65aff9eb678cdfb96419aaf9f9ff99e05686e163a8d4cd08da0a786fe7440fa29741b82bd483432f09ae49bbc383d17a79697318f021207907bd6ca58bc131826182f145708ef85dcf963859bc335f1d4bb2a4f3d85e4ee7b6a981fd00a972a1df3f55a9e53c1f882becf1a98faa948813d01d27bb5d7c750d00d74abaf8e06630d7aed75dbe9a695ae2f5c2fb117d1ef01f911fb68d3f33c0aa81c806efd2d821308373033c5cd391633b1df858ce4d7a89c407e7e0f4440e9f5244f2e4ddb35dd712a8af43a3fe3c815ae56bad799a6bf1a1b844e528e89c9f274ea565d6d1065d5f769af8bb160384775d41de77f74ca1b5b2418ac91be075eb7d1d198079f17774d1a2d697c737cfee277891a243f79b9343a0aa81cc0b17e95cf1419a2a03153e210c2f7701c7426724fe405e5143a8438a910ba20ad0ee1e5daa0f3e48513afed05e39c557edee9d80af730cb4cc03af703986b5dc4e767be59aa5d17a7804e7927203a1aa9742aea7aaee35eb7a30e5a3adc06e9b109cecfed45ae2b3aeef1f70ff6e0c730382f929f6ba1a380ca015809db10c3939b7af8af6706e4dc60b44e0808ac45685ee82e8d081cacebf94ff71fc2f04289b49d3307b7b7d33f069bb678eb61ae5911fd10d69c9190e892e82878838bfa94eb94d641ce116761e97445a6dbfa7a26dcd77d4a5a2b1f7d11797a07603ddb7e0c29f0187c21c0655e0c16e1561185130c2db7785ad29c52d9a7e47528533f11d86cf1d6c31c4f47b2c828b9cf097ad185e88ce8a9ff2d9f2df8b4e0d2a1b37483d163710629b56e8f35e253902e5aed00ce90098d17b2c1b9f33514f6f3d70a7b2a6111d074e1ed72dcf67e1bd210586360dfaf3c44877d0317c923d32e87321beebe8903d07f2409172617c6598473223ca8a215f65478b6debacf1a78997883d4e60c40d988fe16a5d7cac691e98d1ffd3fb3e15f12533f08b3bf7f30efb306c8bb55a6b1581b826e8cc4d93cb67f5385ff9b13389110a63f3e4db90efe3774831af75a07e47dca71807a49f41abb440511ed1ddbbf490eeacf8d514cb933d0f7f73a670034ec6560956d0c3857eb1e1b3d316cbc7600fa8fcd098c24b44cece56f29f050d864b4798f75315997e8f73f1751b0206a6bfd47d162dba903d8980436f030957820bc65c8bafe9ab01e4019c3d7d7b779fd8dd3d81cc00cdc3f4c33f8b5e6014061aa7704844d40ec7b6c8c67730033716adf776d535e5d4c3110983e01b831159b039809faaba7bc26fcebc8c3596b826dcdad32f6e5d8836a1be3d91cc08cec76fbc3b7ebbb5a4a7d0c16d158d75c23c8e194cd52b6d1fff9d81cc0ccb0ea6bc892d87f2e5c3ef664e61a791b1905b4ee88bc310937c9b2c46dfa6f36feb4eccaaa61dc204c75d9d75833944b3f877e0cc60dd6bc0cba58948d63fba90380cd094c0e2be29e5d18fbf6e7cfe1f7b73920c65801fde47d63ababf43a6b0739f0ac04039cb90c347f5dc4d4d80465e37432dbf60e401fd898079e8dc70184473f777e7e9fd69ef0968d334883f1bfbebe1e76fbdd791f169994da895126ca4619292b539cb4f02c1462496ae0cd4fa17a593999a5d7da9883e80078edf4b6c26a4efca39f9907ae71f277ffedef6b2760a75b2f95f1bb320639d8fad62da78d2908b61ee4bf450045102a8456120309330097e0906319ee6e7d99bcf157c72fa17ceb67730045112201bfe865c25610a323a466330db877e1770ec799ae9b6b109232d52dff66fca5507501f23fd6044abb9ad173d71a5ac7a5dfef4360be4fe000306cc61be85be7bcbdbd479affb1ec96adb7d88e7c945cf3bcc7321d0ded5b64b3310741d6ab8d00504c1688f08cb8565e06986e9d22ddd19a46acf3cf8391176514e4bb91df118e80963c0cae39993803675f41661a7e3a9e52fcfd0d536fa4635b339e44f4cec0c917390f7604e4fba8c11bc70aaa2fd11faf4bae6e886218ace44d4dc897015c9cac38ef35b24a0780d069a568c1985b0696ce7e7c7e1c5ede5e0fb78ff787bba77bf7b93fdc3df042905081d6b54a80f7db8b2156cb5ec538fa18928251748c16d99cb214197e7e7fbdf3104780dcad7b56e4f994bcc7e37a1d00654ed216846f409ccea03b5e87bc2edd1f9efebc781d43d7d89d88599cca493e3a27695cab745417a05c03d1e075113a0a9ecf277ffdfb3ebcfffd3cdcbb8adabd3e075e9e0e77cfce4b5391388242cba9cb91ac041c60fc9c876c9862a445d7d73c052283b7f7777fedf6558a51aecae0abdfee337f2cb8fabf207c6b8f8ea02b4e67d09d4a8f1c7f307ea763ba1cc846a2252203dea7695dbb2c6a7bbf19a260e704efcabc719bf10395f3f6f979d8bb8ab87d7e0ebc5079ce21b8cabc7d7a38dced43455bf73817942d2f0bafd8aed2481d11c524914cfd7db7bff7b2997a576201798ba2a74fe6e5f9218ff23b60bd2ebcb4d6d21b3fbae1742418fe8bd79d4a8f1c7f9c6ee50e4060b9b73881f58c47ada80b70ccf8e1f3ebdb57d2bdeb1ee88a833bef08dca7f3ec77f72cb6d18a7b3e3084dc01102afb963677cefcae1c409a7f1c00a1a9beced42077eaa1a9e0312f5637cbe599b2e8f01fa4dc8df467c01bbfd309dfeaa32399e10be8d6df8e6e9574094e797df9d2acc201f0caad63c60f1f4ec9da1c00dc39f6ceb37b27e057dc9dd709680360708932f831006fe8f13fcb09e8df1196ce221fde24d425a35320dca51e1817e03eb47a551e749ef531f59f3801ca2a69ceed0442cb1f8c3fe846536f0474ebb3c3c92277ea0019ade5fd05c53b005a1b19e947012dc10bef2efca592922e4006de3d54f4bd0ff9ac7b2e41aef8b21cb66e4d23f25da515688de732f67ec44d4bacfce9bcabffeb72d6c7cee904d00174c1eb444bcb2fa05b3432b62c026ce48aae324b60ddaf348a770032b0d567449bfe3f95b473c2b72a50f0dd012afbc939012b6c5d9c3c0feeb7188e362495e676b71ffd88ed5450278c7eff2fef12e83ceb32249c5feed43d3a802e1c337e7875ba452363c942235d81354401453b005a06a6fb10a82568cdaf03e30f0ec0f5538d0ad4dc398fbf7b790c533d0b2a63b3b553f7ae0c8563f1b8693cf5a0dfd789537d6309e16e587bd1ba618795f7e4582af72523011ffabbbaf73ae074c1d2919c17a7873432963c34ece9805c88d0ac7b9744d10e000f8a20e96f5a82d630672d0ee096812aa30273aaf1809d32b8c550f71bd9426278c887b0d392c95c60fc3cbeccbd419e681c448723989f30dd27fd7e4b372c9e29b3d3af3edd2e8902589465e7a10c8a76008f4eb1faee27e7bdaeab1cc234abf22caaaec0230fa92cad848aca18c883cec7f13c31e28ca2e5a3ec73f1efdf4f35d0e58d1f59764e7be5e589984e6f19a86beabc6fe82f3c450780ae59b2d17cbb460bf9f82e9291875228da0130a7da57b1bfa303204cb32aaf0d3fdf5b4501763e66a56108c3f38192a16cccd31f1b283d0556bf89e1d3353bba32b0813880f8fb4c4ec02ff671751eeabea9136d3cd2e5713ad6b7db85a34487ad3c9442b10e801555285a5f85fec2e3baca214cb32aaf0d1f05bc3e2d3e16e01103e0b3657ebf2f2cce41d990192b01a7740428fc5b0cf999916161cfb8fe7a2c1b65d5654fd2cc4bd5f7a7ce07b4fe200ea06b2a50c3a22c64567237a0580720fd7f4bb0167fa30378729564555e177b167f2c3d23a015bffa7e9a13c02879828fd619d9d10fe58d3a63a60a712028b084fb5cd31b7e67b8df077102ead8824e803aa6aea9734b17ba78707240c78e4d050a7497901deb58acbc9440b10e00a111d25a82b560851695f3e8046e555e17b40477cf8f6129a89197c99959e1c511544f043ade5c0bfee9e443188f53600a8fc155a0bfca6f56129286b4721ed7f08f0567f7989c059c006508f3feaeae07b6fe30d401004f6396bc32b0580740bf76c876dae200ee5d886a55de31f6388187850603176cf1083f9125fb02c882aa2e48435ad65f2cfa60cb220e80f07fefebdad281638c710074c7889eacfc9440b10e80a9a5210fb68803e85a05d8851f102a6661d07cb07ee0fefed187f3c898d60907412bcf7f97bc1f5fb5f067e0e09f30740c0018c4c6b196fa9460b10e804514431e6e1107706c15601b77aed50b6b02ecfc5c3a8b747dce0c75ebebb8c742310b71005d0f04e5d0c5c201a44f509643b90ec055d290556e320b30b672fd3800abc2cef87cc01260e86dc67ee94ec0f7ffa9e3915d806a1ad0e99aa583160ca6e2004a7dd373b10e80c1a7213bdac842a0b10e00eed83ce4becc506de374fc23bfec0b61d47d1fc401f45908243003830360a7262b4fe7e6621c8017340ea0e732600bbf7b901f08b4f374715c707f3f873aa56efdc63046ddf7e1892951a76343a7557100a54e055e4c17004e8d00fc6610e75e16bc310b7e0680e5bf23e6ff057916c0d2bd2e980adc1cc040860e02029533761010bc726c0ee022a14efdfaff131cc00b5ba28d7400c3974d2f43b10e60e8342050396dbb01f5c13f1cc254e0e6002e0eea94baf50f7f1975df079e3319e500fc2060997b037807e047860beb0f3237cdaa344ba06d50390cd45895d787d005b8df22800b247401580360d77d1f78d274a8039041c0925e76aa6dbd7e3d78610e803ed387f3b89650dba072863e0da8f1cae15a89cd015c1ebe0be0170135ebbd1f2f5ebf863a00d601b0bad2cad3d988b68eed57114092a00008997810c5126a1b524176051e47ba008b3880051dee98fa5d54271690858f004ee802b0cbd41807c0b31725ee0c24f59b8c0194e4080899089d2ca1b6d1774fc0367c17c029c9b26300d71c6db8b22fe408ab31809111c03d8f5a3bddeab325988607da4a9a01c86dbc8e000aeb02902742a73edb8109b22df8c3c80782bc725cf02c409f725d72d94f9905e02953746bc88340d2ff2f6e3f0065ebc5ce02008b81864c05fa6d985c258dd91300fc42a00b7000a997bf4c831e0a75ead7018c5c08246b00d879cad23d0b16b215d7ffcf28fad5606c7a3964205056038e1d08f40ee0fe0c0e20d6c13433313aef7c17749ab19c7e9dca392dac77de01b8ba1deb005ee31420bb4f5bba67c12c56d16f097275d08800f23ec239e1010a165158c26d43ba01439704f38088df22fadececb7c38a3721531df34ec54c63f1dbeacbebccbe68dbaf5753c702090d5a5e8d490f01ffc02a0829e01b06cbbe82e80ec0b38641c40ba0143f70538ebe6a07319ff1446366bde9665ec66a06c32834ea15b96ce59c863c0a5bf2db86807008c030c5910242f0819ba20286c08b25f6e06a0d50026bcff48230b2dc5828e70216740dd52c7431d00fdffa1a3ffe86ce93b0243f10ec0bf1acc19f39027b0d8b1853e9b559916d55e004b3f0abc801328a74b27655ad0b1188447828775036850866c0222a3ffac66b5f25012c53b00de7a8b3087cc06c8de007dbb017e8758e6ff17dc0e6c59c33cafd11d634959c8b6607d7705e6d91274694803546d0356f076e04274002848b94ac24a2ade436709bb0d5ee2d8e71d0184837e9758d7322c3afa7f863e70b12c288b301bc0ebc01f7b75057802f073e063e9fe8520aeeb6addbf0c6a3d2f3e02003f1be03cea90d75fc99b82baa2001685c8dcffe29b81a2f45ef15bee7b490ea2b52caeec951c9683ba9635015d0b83d01d7488f74e5a3a66c1dc3fbaca26abd6bd4b63150e00fc5b6f8646018c05b80acca704ef1cb5f1bbd0ffdcaf051323d0e469d74e6165a4cefdd381d109a0135a4780f52443fbfe44aa6c035eced84b372d0ee04c06d1011b2ae059874c09e2b919bd258cf36f0c66aedf857da1c21f54cb5f48790b308c53e9547c5dbeb397d339801809a00bbe41a04b10070759fa4b37d2d2ab363e5d7a74b4ccdd7f6c1dcf1c407986af612c60e823c23881f72fc603de428b2f86cf0eb125193f2cdd0d591c573e296311ce2e3a0174411c81d391c7b75767fcc3427f3ff0ec8cbfecbe7f93e000ce5e11fd605105e1158f585a95d0c6cfefcfe1ede3fdb0a392d91bbe4447d769fc17e6180a7474fe6941a71b0fcf8f5e5786eefccbc01febfed730f2ef8936dfe80294de7741c03881a1bb05d175604d8175cdb37306073c6f3df730f0421b1dc699867433bdf1bf07e3e785b6f9f54ac2aaf39b3fea69a5d2b6056b8348c04f0d3ac10fa92c9ecdceaf757606c97c2d9100f994bc76e45997bd10dd1bf25a75d2fa96df3548a51bbfa06d1cdbaf1dc0a2153040913bf2c5c020b30344037d166af0ba66eb3ae744e78f69ce2a4a69947b2dc60fcaf829472c0bef23cca772d3f3ce4f5f07c0c234fafc6c5edbbade7f904d2d58bf315fde015098f670b02b532333ec6fceb9d315987502bc47805d84bb1c0173b4d6f9e7820ab0f2a9a332df5ff67de6c0e28f2a0f20e42d52e5d9fde7eabc57590ba06b1b3a744b56f9b1cc77bafebec8ccfaaf0f51ce478fd560f394c93b002bc1b10b8c820256034014b8c73d0608850aa195a112f1d0740f3e3ffffa10edbcebb2ed72762d6ce2bf445615cdeb94459657577f47cb19d3a5d7390fe8104ee99d0780dedefc980023fbe80f613e4bd3adf3c6729bd7f16039c8f9c78e3541fede01f8b0b38f31260c4c1f0be65b0955c85a0019a4294429a6212d2732d78660519f27d4e717835947699eadb269dabb3d17405799e4bfead3c9cb137ff7a2967382bf46db7fb795fe7907307b18e632530d3e5485938cb94fabc0d6b10aa3502ba3ab5504c2ccd60a5c0d21ff94c52aa3505a143039c7f4bbfa1eeb7b901388e798ffb5235d32ef0080039527960b5e6a859c995ead7f2fd94bc50f578065a8f5c82aa3a6d6bd1cae516af90aa6457f90b3183f540ea0f2c29e28742eb2a41358f25e0b920fb21e6bfda192bf3eb7533e851a89cff3ad59464d1e0524329b5b2faaeb9f22c3683313d543fbc0fc40a2fc75beb4fe550e20f7c0f588ae5c64e55086a5cba1ee2715daa7f587eadc3cdf4b97e1145419ac32e6880e2e6afc39adf79bc6b05b69dcf794fb315b547fcfafa575b01e045409eacccc5ce889296b8a2c0a5e64e93ea9943ead3fe4e7ca756fef7687c7e767bff6e1fde3e3acb31be80dbbdef2b9db67536249de8f4700806c9ac65f960e963c0ddb24ea20df950e8138811ba6cbaa0459a2d284bf1a2a39c60a5072cd95be8de4fc784da6a098d2fcf9972e56f9f8f88ce997c31ad863cad5cf8de7e577dff3b46d54f7f0d750e5df1881213fe41aeb07db4fdf0bd03afab855c271da041d655afd0e82b7945fc379c9c21a075b4cbfbddb0b5596dc8082d6decac3efef7f87671711e83c4b19acf49aaa2112a2acaacf04ae691d1fc394d72a1caf83aabcee777c1a500be18a0432392db2339458f7c32cc2b584700e4b9fdb1e8766c18abefe9cb44deb61c4e94eb87519acf442a30b9a93e827bf23fad8460f941ca34c5b3604b97632859b9aa8bcd6da78411b8f9c47ff1fe3b3963b7f7df55be69cf4b1474088fffb632fb77e73d149fa26dcba0c567aca5e197f6ed0fe775d763835ef1b4da2038882debc6a2b5dcac77fadfff790a9e504ac74c0ebd258ea6c3d05c923a92f2f2f7e60f0de1916cf4860b0a71a0e8bb86e773b7f5d9ea7c8efcb0334442638a7b6dd70f27328b395ee189db2ee449c8938a5fcff2ba1d2c72003350670c54219817feec0293b4acfba71f0cf1c38036d8c889ba4f2d68b33a0cd71c8a628dcf7cddd9396bfcf939080a10a38108c59e0412a8f334c365c617bab2ff7c97f3c4569ddc33f1c13b7c1021c10514a9e67caa2cf6bae3cedd2bdf01fd112dd1c9c1fb2e67e441b8c7df881c7c6795d5cbbaec7f2bb7a59d58e40d3324e0950b8d73fafbec56b7b74549e1ae309c55eca19e5afc7051a6914b24bb2e6e3f3d31b6b5f67700ac1f0bfbc41ea3c740d44cab969c8df5d0738529c1de5d2f7d79097ef7fdfde1996f41ebee2893a775d63006d8e8ee36dff45504606b898721bf48e38e72408cbad6b260610ef2f4e401fb3209d363e0deb036899319c362735048c8c8881413e09f57368a1ad7c0a5ca7d9dfa7fc4d27e0c7465cfef37c1ce3e7e7d76ffad21a81c97db55c6580b143d697cc3608a84994a0564c1417c51fb2fb500e11c1ae6dd7984cf9485b194b07b7b7bbc3ce4518cc0e60342cca21eac051118e27464af84c57c5950327c69c3d61be05d104e9489fb7f239cf2fafede58a5096469fdf9035630ddcd792df10a827ba62f5f515725f3e33b95f23d7ed00b402b4280306758ae16b6849fb18367de486c18c008362cc806e0846caf3ec741f701802e3181afd1ff87314381c3fb068f5f55ba02ccd7e7f0a037b635afd3690756be42575cd674bbd5f0bd7eb00accacf7e77ed0e331aa7988f4f2c9649ef9543dac45914ada8cd305e8e5106cad2fc3f658a96dfa2b14db755e745cb765eb62e400b6f2efcb5146a0a7eff3b1e09d06256ad66a2a496b19502794bf39794a305ba2c969ca6a2b53bb071ba030873b2252be57078d8c652a4296131cdfebe7b4c8074faf71a1e44c9f39897218791fbff7e6d194d05dd815d9bac578b7ee26f3c377a9be0be50c9fe450a77b7879dc3bf5de5ee7ffed814995a9e5a69e9db4e3172de07fac6695f3ae623d649fb3840898ec0ce5355864acf5259774df14d899775bc6f9e8fb540fe83dd395bd3b6e78e8d691cb0fd9b07e719f7bb5d601f3eefdc1f6d861cdea0e26ef8b83fdc3edffbd729f977ebf3d61d5ebbec32b48696aa4d01183db714682e585360e5e31aa06b60c9642e9e5fdac65ecad757dfe862ecd818b687cd617bce06b145ffb2d3967278c7e16c5adb3860fb37ec7c0aef6f6117547871213009f20b79e3df3b03f7377f3cec5f5dba3f2fee535eb8f918fedb850ce7e7978e6ffd7f9769fd05eec768bb959f4b86d988a565cd9a8c21b317a5e08d9f4637da1db686cd05db5376e76cd37202d832366dd9facde3c3fd019e1e1f0fcf8ea747a67fecf5e33ef470de66f7e28cdfddfc2ebe49d5bf75f7253a8297a79019e7adf2f34b87293f4b71e68611f0315db1b54259db9e6a9c9bf469c575e0a36a6753d856b0b1fa2dc6d820b6884dfa28dcd9687e3eb68c4d63dbc1c61fbdcd831f04240195e28927e584d6dffdef32222dbebc475de01debfc7747665ca8b2aa28c0b50c7d9ed39f03c61cd2590127b78b7008bafeebef949581394b1673f3efe79fca53376db6b024bef527eca7d1c5b6329b0389084214106cd5be9623b3f3deb3005cf4f6c165c4f53bf0387926843be79d76af2e0a78749969c94889109232476f29cd12b0aa2ee4653d32ebc62a4738f636e3146b1ffaacc328056f77ce96b0296ccbb239f011396302d8e8001d1ae0005cf82f0e006f6364020849fc78000ec008474a8425b53c746229cb52107d34df317709ce202d03659c6a65e55858ea4c9deb7c352943f6a1db8d0308b665d91c84e8e021d8a8b355eb5a16bd1d4008455c869e4204608522b07319f1e300f4478a56e03a6f0c0c4db90c750c0c502db9add7b9909581e784ee8739fd5a20210260dcedc9db966573beeb8d4d3adbc4468774bd072d04f2831178a33818d1700271408251493c51b9630069be58277fee5609789847e7eb12a1ab63957d69da570796a5b3bee1f59177187897c13f41c6dd42a33b7cf0dd2f0402e609851dc78cc478231908ac46246368e247232523fc8fb328d60108217fec7473ae41290dc6415d34f3791950b6730db4e6300516f2a574b4c0992b6cc8db92b239b13719fc139b6b1b00c496b1696de362f7374c0d3c3d3d1e9e3d4f87e76707bbdaecd28b08be4fc2083f37747d8e90a9d8efafd6011468fcaeb0c9a77c77f048aba5244b43df34bc7db63c459c029e222cc1d182df4331d67f9547f9ae8f15808f021aeb009ccd39dbf3037fdef85d94d032e6862d6bdbc6d6b1796cff46b6b312f08c3c46d9e600c00f08b2f20847405fdf65c067e28179c8828dbf059e79b7946469d865a7df7662a7c3609c7ffcf7c1295063f0711efcba7fa3dce780a9572b8f15253a01675bd898b7356c0edb638ad0af026c1ff8c396b169bf0828b3f71b56088508e0e9f0e82ae8c12920e18275218dcf108e00880aa0f8962bcf5ff87dae45293984c7ad0f084d08cff5eb0d43980169ce404ccfb9165ab511f265eb44a9f86e78656f813e0d2e368d6d63e3d83a368feddf88b1fb4502ea846b825d702c05591a1e8c499705cfa38cf93e7b0c80a6db79cfc3d26bff8f61e5f1d2d1768eed0f9a05b8544a7200f58ac0798c9f7e38ad7ede17a71b347757809053dff3dc5879bc363607e0bc202fdab4146469e8021cdb28e45408ffdf0c43a41b746c6fbf533977578b7e7ff5a8b77380693fbfecd07f2eaed801840a271c2a650ce0efd75f3f30d7cceb74d0c560b621bf374e90e5d0d63953c166a4f97d978068870156b67893aecfefef8feaf25ea7f143e600ae4f102801a3a35a6196da102407239cdb01707dabcbc34ac8b91f4bb61c2ddd82b9d60630b6814cab9d8ddda7d42d5bbb1f5f0e7cc9045bdfba000e368ed48a83b2d04afecc3867cd3c747e8cc78209d193fc2561eae93015677579d831a771ef53c9f26e4db7ca4c044ef85447404b8f612746af78535d1fd2e8bc5d27b786039858e1cae7b6b13efde9e9d90f8831774acb38d5e2155a24ae87b2a390fa3feec1f1b010c8cae73410e65bbb1de300d8f2db3a672aac69c086913a1910ae23ab2eb9e39c4983d3c05953a6fc5ac03da94bea543fef11362abdb28857db76fc5e3b000e68e4f82592958fc5375ad978bb8c2cc90daf02fbe3c3e6215d03d2d2dfc4b0087d4521893650cadc0851665a2d9daf39c0c1900ff2a5efbf448b4884a1ef096fae551643453622a70a2713645593fddf02539df270157589c12363b96fe359804bd779a08c19c101c881fc844bc4282b2dc4b70ac9add1789497e7c8512c0c3a79b38e331e06b8701c6f51a10576a0a1f5a17f2dad3bfdf0bc3f4cebc492647dcfb9203fa13ffc1bc2e664fa713e186fc99d28ad377292b10f1624212bf288ecb42c8f8103a18ef2ae0c65cb1d6ee39d8dd7620352ce48783b305409ae242cd26576a040a21cb414ad6fba75a0c828108a0628acc06fa6d3ba56d6f1d41f61aedc8ff704a0a06204738f4e737df2409929270f4359e94e46e99294291f07c0d9928fae272191a5bcd9289735f8371519e701754819b5bcbfdd3d9374992e5c26a12ebc9c94cdabd7837390444da56b13ee6a510210fc8e404a3131c8633bc7ec5dd741ba0a1a9eb6ca8f09a290ba25c40882c351691bd798de1950af4bd76dfe401072c02974395cb0648abca883fcb8863ae4fafa9e4471493aae6d5cffb210db4ef5281d0330125c139f7febd171c2625aa6ae81b167d76a598af9f8d83e9dc64b3ce92ac87d5890c2549819825f82521a65c000abf23b648ca4eb0dc3964c913d75901f17a83baeab07ff60a907aecaa3cd01504982fa5373715180010aa85b0afaf98d77cb295e5f5e1a0e0039bd3cdb8a2cadbf1e8c6230ee256f918eb0f6ba20ff7a1092a9bb63510032cdcb8deca9037d4ce30715b3d69fae8095f66ac86cdd9e059063570621e59b9a2b065aa7b6c5397ffebc9a0ee0b5c56930b0a557e111fe86a93fd5225d89fcef76f749378835107e2ca0a5db854c2d07401de8630275c6f5f2f516c9f5af4dd729af108fd50e40c8125c1b2c94d123f4b41e8c07e4a3c628a3e5004429736565b0ca3f0c13df83c7757de86f39972b913f53710c80220f190bc06891954e3754d6d415d144d2d5721069e8745705b233f42a1d04bc76a22c988ec3e85118142784e94ed1b2f0f495ed9932f98952ea639ca74351317e5a236b10b15127569ab5e3ca44d95fd59b8165dc8531825cd66d0e803ad0c7388fd09ffa639a53ae0ddb5b82339cfc9ad380174f1804c95b0d2d03e6eb69415046e6f7e9b3bf398345b1b462beb43900f5f699d07ad5c6efc37e8cdf7cfefe4206604526f1b331c099c9ec8dc8281ae9f777180f607f025d47c8d492357520bfc5f891776efcd4a33e57d3d0856b00593aea41c03cc145d3e20414eccc234e0085642419689d18450e86edbe672d956e9508651948ac95dbb5702877e6481ac4ca31ff5b0b31ffb20948d7422322013d2888b3c46031667944d98ab6903dd7a72e18f1d70b87a46b2172bf6d59625debc08538dfbe445936c700ae82bab26d2710fec7802b27e078732d152d1446cdd2555eb278ef1c050b55b80e8acc6fc2fb3f3e040d835c441032c88592268b84a8884cb11b74fe5fb6e28a1162e0763942fe3160064831fc372fbf2073f0b276c7902d3246d661c5a093b59333ff4b5a41648fd3ae9eafc8ee9fd6fd953980c8953a802e5245604029b42cb523606499c53b7f9dc2e66bd3f9cdd2605a31d27967c07fb4fc84b55d2dbf80a26a65cd7f2790df6594d77696dd8803a89c40f27f9a6f64838cb4ac05646ac99a3ad0c73ceef89b93fbc3037dfe4c36ad72bc4eaec601b0d22f1fc9ef0bad0e03483a1a40c9de51344329dfdfe578488f036176c1ba768386b13b0596dfadcabb8c03188376009074051a650d4e8665be3a9c4f659ac99a634ad6405d5167e19ac8a6bf13b8bbb2454257e1005008518e618fbca68a4328c9b5bc728ae279e5aba994d52924abd4f229ad4e128310c55579508a8b82b37e9eb099d78a8501cafaff39610c84414c1c22656cdc97dff158ee00821350a3f12aad064780ecb83eb2b41c803861603681671afad42ff76f1b93e03a7429c6443b6be42a1c808c0cc394afdf2264c529a0740c1a6218ac4ddfef5dff343248911243c88c5fe1e7b95fff24a3e7c058036525da20e2c180c81be9819695f263b8de789da2931ea706184538373c60437928dfdddddeff4f7786d76beb7be2807088d5ee3a9941ebb41a2b6d0e837e2247648a6c838c83acc37777dcd7819375cbb57c1d64792262d069808142d113ca9bff7f89dce423ab1a04a7b1d2940e462a950a28bdad74b6b1f5265e133921d344213b646cd36efca007bdec1d8d7ffd20d8bf7f61134c99829c92b096a1dee7a0ad8b639d0b8901229f4c4662fcc1f031f0704c64caa7c899fff691f07fbbecb86fe3fe11ced5dd3c1c669e660df4b55be477c36b821e9cc77f7870f0e9e0e5018feef7936b1102fc0ec7f8fffe5e7bde5831c60d4a806924a950a83cbb5794926957e2bdab8b5755263d85b604381616da68b9a62b1aebbc5be76b2c4314e3cf1d00065a398098eece1de7bfe004542410d30962f88dfb6669d10f29d36c8f499f88945dca8c7cb0c960bbc17efd2bffa2fdca31b16fb1756cbff16ab00a57c1e67147e88be1291d2e147de145852e235666cf8dac0917c60e0496068e8d8788a45c84e273b4f439b25a4fe3bb002db31bd6352cc42031dea6f1ab8646e18d00e2ffde18fc673012ae971bbe404beff3e8ce97bc02fa21e53af638f8b9a0bcd81cb6277618c69e6c7bedb265ff72505e11c4c3160c8000bf197ce126af0eff2aa11805e051f020be92f03aee3b95546a048017970a5d6ac79da5a0df4d8b5545034e0978da6dae909ff50f224b2d537bf393f08e48eb5a5d30d8571107f8c0373a8257faf09de33992debabe200ec742c68ca61c2f9a126c0d9bf376e86c105be47b68ed43eb8fcd62bbd8b0b7656c3cda37b6ee5f09e8d2f9d783eb5002ef29de96f0ca7f3ac4c04b35f436586f2fca9a84a999e75f330cf4258b619cf2336fcea2254bf987c018028b6930a8eafa91f681b27a0cc3ba6609a4b30069774b64692fd72e176da362b762c3c1c683e390ae3bb67ff1b300da01306a6ca5998ff67efc1cd02da0d5aa5ac80883750c16b2788999021918cce1380f40918e2e85eee71332cb8b436456a1be777b392de37b7979727d50d73dbb772d57e49ecf87fa77173e6dc7efe43a7c57bf892c9a0b92529861a1cc6d8f265f1257e80044599735ce7949cb4248ce5cb75e4c730a5c67d8fa09478cb0b4e1637c62f8478db80549c7e77d75add4995488f16b87e0a0f54bf35beb44320650e820e0945c950358e2d5dba581423345e7e7ffd5a0e131307ad9617770b72f1a3f61b618fff7f797333e0cb53656d3e83363d574390df35a2d780710f398f3a46601d63a0d38848b77007a10b0d4419d718c8b60fc980f0b689c72e3183052c646fc2ebb0e5afa5ecf2b24a8bc18c60fc1f8c401a48e20e18803309d40e39c966b47aa19abcc092017d115ba51f6e0e66571f10e0045ac2b956ec025440125765f5c9e5a8c9f3e7f6ab82e8d375a6da872cc22a40bd748cf11a7d0b87ef2bb86eec26e9fe53b7ed75da66be8ffc3cd835f40c032d1f0c9eeab619a8fc53e4c3184ff78f412fc5257e741fdef98068f5aeaec005e5c87be7c4f07b0d64c098e20cfc36db2302984fed100b581371c801ccba9d38803a88d3dfbefc8f9423506a022001d2932e0393c0a5a0e6c0d9babedd3d9a5fc8e761aa6076b1bc6a6bd6d2b5b07bf10289943558b04f47181d088cd19805d5ad8aae9e9e9d14f3558992d01c25abdc4f3b29c407984a8cbc9dbe94b6e7cb591629842f6bfa4310ddad14813afd1e73cf7990f02a6a13fcb9aed07854a015bc3e6b03d6cb0b2472773cb66db6c9adf7e2150f0100fce438485047eb9aff71e616d805f68e03d4af0327ead80cb0482c413956cfc42be2230388135f7f14aea06a4796101907cdfbb70db1ea5d7c7a81ff769919c03cad8bb906b36cecf1dc0ad5fcc247ac17e04f57fe512e6f64359b0c530c71f6cb4b655b15f5afbb8c4dfd938b6ce31bf10680dc63b15618ebc7602f4f9da468337c621c62f5d42141407903a819ec6afa9d203e7c76b586935c97901ed0098e5d0fa5072e83f35d8fec50f026a504a56776927d0f5369a8d31342313abcf9e6019ae269ed718e8b3d25a64e7690720d3c4741107af75b800aeca01087ec79918f6f928c048532e2585fe397957207c86d65fc80cd232588bfcbc21e7823a8fb058f28803f0ab1c2f6276683857e900849deb176d8381f3130ccf700296a17621e78d393f733e55fe5c185cea0cd6125cb503d85886da0023feb7431b681f94019f7a3e0ba2acbc5e1b9b03d89815fadbb9f1350c7308539cefd0e300d7cce6003666c53b00317cc132cc2589dd816b0efd85eddd801bb3c2b2dbf21c40608b02f2086073061b13d37400b14b706e5c3e989db0f27c4d6c5d808dd960515035f0270ec032c67310f3734d0be12c3607b0312be922a0425a7fc1e58ba5ca56be2f8a3627e78e7b07b00d866ccc01fbd1494b6b1ae0b98991c9d54d09baf2fa328b03c8ffac7f97bcea6ca374784435185a34b6dc004be05aa2809c68e7373cbad9f8b393353985cd819d93640ad032be1288f95b7b14d09d7f650792ce7d62fb376cda502754c4844b740fc8bcc64ad38e65e41cdb8cffdc84475395b195883828c7e9d382dd3a779a9e1fc15f4fdf3fcbcb5dfc4dba786f6cdf3b80c636c9ad991b6754081608b59211614ff6dba818409998529a5c701bb351d59f36b812517a06c36606b0896017fe197da7a395e3b3f0f7cb6d40083622f6d2bcd7117cbe3b6c54954b766df20e00d84d44270a2dbfbe583fe34f8d3d2d5cfa7b08726efc7442e4fad73e855332e880aeafe271f964c64236d2b0ca64810ea6baeebefbebe9634349cf1de214ac883d3f86ad8bdd570e00f478801dfab73b81fb86c10f20af0c2f4085ffddbc3e0b394438697ec8a790ffb7b104c101c4ba2b1daf4b62fc5af7dbf587f291d6dee8c47dc6eb56e4f7ccff37f4bb0df2da1609db765b936fd89a38000d2182dfd7cdc1f3d281b08946754195093ce1712710ffb784616109b2032ae5d1ef9516f22d79d7df870f7a6e8c01059537f77a4371c6e58d25afe339412fb2dfe407d05531787ea3bf7544d9347c7407dd22add6b94efc3d0794d9ba4606c68f5cabbc291bd4ba1ef43d6c74a23769cd6975006d5406c48dd5cd2171024981d4b13154d711b24a706964c1095b505bf9161088cef3c6327887807e1c3108fef77569fc3704ae417f5cde8727465ee547e5adeb98801185579a455de33e7c56643a09599e7ad372bd86f103658ae5ca5bf73e0c720089f167371712272058851c83bea6ba3682f19512b1f22e6c0ee0bca0c095012938e6c36fa73fd502a22c8d50d5b5f19fc7190f066fdd7f2c7efbb878df4adffcbd0cf2fc8c455d93fb7519bf7c0e7502bd1d002145e3e6fa53d18804a6420944c82b82dfbc83ce2a036c0ee0bcd0ca62e4182806af43709da60ab5b3fadf3be3262d3be25ad104f5ef1d49bcd654901faf6b42bc57f55b93e5e924dcf5b84fc3f84164a66407d8aaa5fb16bd1c40639a10b8a926fbdf3b81a9850172cd28984ae8fe378e270c9058e5808623db28026db0f21d1d1227218e82baadd2b9efc19160f421cce79827a6398d7a2c806beea38ea53a17bf6bdd9c904ee3d764ff77f5fb35471d4065fcc64dbaa8bcb851a89311a167202c5190362fc8c0489ed78d72e932e4698cbc8d7420907ba15bd5188585a5ab27e29d9aca472fa20df47102471d4072d1814e000f6e156a3294f0a5e5d7f7b7cab35c17609b825c3fb613201ad1ba67eae614b86be73a7d14d2ab732c1bd0743a8064ca2cbb701f667500aa0274cbafb1cad474006b33549ddf12f27e5d8eae72025957c0d4d109c086ac7cb4427a75ceb141c156076087fec32a1b41f970c928d8c944c15b2dbf844c5637601b04dc18830ec37524508d09583a7a225eb7d57dfba16c34da455757a0d50124ad7fc23027706c4ae71478dc948a3085e48e63ec79b92ec3015c57ab5b225eef1cf4d1add988937136630efe7562eb455714603a80aaf59f080a22de52afbeaaf68bb30470044664f396df222f5bea0036439a841ef5b06a8e940f9db674f4284e87fdcb752bfb08dd59be0f37fe6edaa200d301ccf5be3cabb596a91e2fc49ecea0adcfef91e3f1936e407b34b331096d757169b494131deeddd58d464ee3971bb94415c3c3fee360d396ad371cc0d4ad7f5f2878d7b46198eb0dcea2d3f8dbfe5b35472295aacc43231ad24f10055da4cc3551461dfa8513f04b8f3d4e672d8780e13b1d17039fc3d0bbb0a280860338f74219bc62bed8a2d3e88f318772ce71cd936831e4ae7cca06111b93e28d3a3a031f1554d0c0edceaa3bd6a078c30158272e4d150a09469a5e206cb0fe13faa4c91973ced49c74ff1687b19172621da3bb3468c0772bcdd2e4f69e388073b7fed311951ba10b8d3429e3c3316d48851b9597c366f883a8f4e732e49647018903b04e581faaa2a4f27c05f6a06fba3333ca590d95c586c16538016df3950338d7e0df6c9ca4f059454f6e343d15a9e3be273981f87b7cd473055472ba0ca3d7e8c1c0ca015cd454d9e4063b0143f3d49afef214b26ca2bc4bd4a991e88541de0124adff051574124e91c7a4b2441105ebff8d8d23287d9428c03b80c6e0dfc53881528c658a7cc83526b8d6e6e47b32a1cccf4d56e73218683b808d092951792e40a1374e22710056820dc7942de5ca5adddbbbdde1fee1f1f0fcfc72787dfd73d8efefcd741beb6573004bb22207b0bf7ff00f4db111a68013d8660d2e0bef00b6f07f43b3732d3d3aa18d5f2022b0ced95827d4f3e60016620dad27613f2dbd65fcf0f2f26a9eb7b14ebc03b0fed8988eb584cdac55c7c02dc3d7e024acf337d649ea00563650b5712ab7559d3fbfbc98069fb30d06ae9cccc69b11c0e604ae843815487d3b9e9e9f2b23e7fb6ebff77d7e6dfcd01807b8bb7551ce36adb80a0cdbde22800dcf9d0bed99f2d34bc2c380606dfc2fafaffe983e6f63656436be8d016c341125719ff7ce21302d78cb6616793a616b38568b73009718be6d61e9c6c6716e2fd101509ecdf837a6e612f5aa72009bd16c5c095b77c551db7c1c03d88c7fe3748aef7661fc9b038884bada06013736ae980b7500db20e0c6461f2ecc0188d16fc6bf311797a55b37f55af550b0d5b79c5b1f6f63c3a4b66db1f5e800d6f2c0cac6c6c63488dd6f83801b1b57cc3608b8b1d1934b8c94bd0328b66043faf349dacdf837a625b191a37a59befe49796efc4b0b57f3a658f2d9ccab2f8c2f07bf37e39f1b9e1c645f80dd6e6ffebf7a8e1a7817b9fe15aa8f3cc6edca79015d00710a9be1cf094ef6fefea1b16bd0d3d3b3997eddb4e8d2498ea14c1207505657a0af5187febe60a7d938055a7bf602d086afd93f3c98e7ad9a3c9abcd0e8b27200e735fe36c11e1338ff07ca725e1782537a5a78cbe83517bb49c8ac2d7e19ce64b55d007634655ff3f05e83e808fc588638843204bc3ae27890df24b4a5d5fffcfbd7bf5beefde3c3ef2214cecbaeb372aa71a5ec78f55f2b6d7a57eba6fdff79b8a14227ad3c7fadbe851c260c5e56a15f6d9c3a00d28880875d7743a8e5f660ec07f8f6f67ef8f7f3e365fefbfbeb7fdf75ed1474751cd33ba59b476caee964a6d469772d777fea74c6f7024c99e1d0e2e7bcba02404823c2159ad7d8e84fdefa7f7e7e7aa317e3c719df5dea2c00fa23063aba711ca2832d69ab7b8b4ec77413cdda6143831c40df7e368ac1ceb28faeff68ee23df47a88b08be54162c0372d6b276df99e6d3c60f3fb1e5fffafaf6d1417e4ef5fd62185b0773d45d7e4df5dbcb7ee03d637d519fe91880fbc3af0bd0c71c6c052dd33fbc390605b0d201db49ebf7cad192746e2829b45cef34fa086668850d49afd3f63baf76b243f3d597e3d7ddb9fa92fafbf34694f5c73bf4fdbd3dd857e559d561dfc6a25c90d35c75d0c6c07b7a79bbf45d1141875d351d4006ad77db0b235e9d61a7fdbf5bffdb7ab514695bdf2833d6f0bbce13c158ff25b4a5c98e37ee75cab5fb629f9f1a5633cd1486777bbb7306ffe2e972f64d4e2d73492c5d16ee67cc66b5c9be3ade924ff9df389f7b3c3c3e753b002afdd8db623076dd0fec4acf7ffafadd8c11fe88a9c089fa52bda02274651815d38a4fbbb4425e1ae5cbafd2dfde7a42995aca25e7a1e3f935dc6f6c3275005922faefb911c3dbfbbbef0f7e7efef5bffd6ba35dcb7ffff0d0489b431a7d8f69e951c19550d4b1b914a3722e535e7fa6bcf62557a48be3bcf2f50e40eb68fcae67bef81e06c143d74c9f0f6923e81a45b98e5c37c2359a11404c445f2f375e60da47468281f9608e132a3ef778b124196e869363853eecbcfcbefdc3da1eb45d6bca7b6c5c3ea22f99de603b627353d374000e7301c85b3d12acf9f8fc6ca6ed80be4730de33b7661b1ba5d27000f5a2b7a9698c01b485f25fdfdfe605fefbefd7770bac732c4214b02d1ed92891d8286506b828c6bd677500f9c099d5fabfbf7f98270b4406f9395d3cfa2820bdef461fb6a8697e44c6e790b57dcfd9230071028ce85b06fbfdef9f79b2e66f1c0fe8c316055c13eb725a7983780ef23c2cd60530c37fd7f7b74eb4781bd015d0afa15e5649d6a590ab258e2799ff15ce399d407e6f7e632f96bd4d41e20030cadc5059036e9d68f1ef5fffae809f3e54f7deb82470b26b74b465e699e75d2c7b9b02e700ea425b0ea07df0cf46a606fbc04613baa01b17805fffb042e32f385a99d901d437628a2e37d27f3dfaff39ac17c8af63c162237dff8d8db3e29cc0f9a3d2b0a255e7035bb1ec6c0a8e46003f6ae14f5f701af97584efeffabf17d70d907b6f5c122b8c00a0d0e8055bb1ec6c0ad208c0d80442affc1b822c15b6aef7f5f555ed2833e98abc8db2585ddd1664fcce19491480dd583636058903e0b1dfdc60ad93faf26ecc0a60fc0c16f23fdfb71d652e15654c031c014acf7e043c56ce18113b117b9c6ed240b521e93887e9ecb1d3cce7ef02a479e0fba976d845e200f64e80b9c15a27f5a56b8110ce81054625087c636a2494761c317ede2d40d793e749ac47c9dfd01317297e7c7cfaa8924166bf27e1dfafea3b3355a421ad3e97ebb18f01cee3a843209faad53d273e0ff161b2e000165a0780d7d5021cb206c0a26b2c00965e112895bb399db9510ec0f81fa37f7c7af20bc22a7d70ba8691d33564e1d998b127e1e7e7d78f35b1388d4686eb732f76385e6201dad4fa45dead724e41e200104e5521b152ac93fa22c2cfa1408fb210681b03b8609a0e80705df480d9225a70e912ce050e818881fb11151c9f7eb61d577f4e39bf79ee620e009267014e7000f4efabeb384238167698d9fafda72ad84a8861ac0665a6fbf73d707dc95478bd747addd8d0b46a885c9ea76894c65ec39f97ca6db175004058ae0dd73ae9188cf413e2d50332e93d36e6a46ce7f2f9b7ffcad2b9403f69e8d2bc21b7a98d7f645d544e2030af03e066aad0b4ce0c3a880318330df8f1f1515def382385b41ae6289f2887f55fd910f25b3ab334e8f53dddd0290c7e5670007376010c01e87e1ae19a75621b8476dbe3be73933980d29558e56fa83ecd09b354bd76ac3e274e76f38f01180aa4f704246cfb357603d2e051df5cdf2abf8e86e91ee03b23a5d7351a3f65abedae53f5af4fb9a63a772127c2409ca53fe782fc58f93c8da9ea3930eb34201717a3cc616f40bdd32fde9b4194bc5b8027f54ff759532c285654aeb0a161ed24cee104cee27426332ead58b2667c22659bdc0118f972f7387566694ad0e3eadd8673600c828e416f0a3a3537fa0737b29c016f7f2522a866085c25d2cf67ae9577c5857dfed2732aa262715dee81c309aff2beb608601e4496cdff7a289faf9bbe4a7a2c9d6df0f9f73f6ff3b5663918388d13eb51e89acaf2731aabc7a7f8be039dc753c8af83f14fe400acb24dc37f87ff037a0cdb5ca36187670000000049454e44ae426082, NULL, NULL, '2018-12-03 21:52:34', NULL, NULL, NULL);
INSERT INTO `docente` (`dc_codigo`, `dc_paterno`, `dc_materno`, `dc_nombres`, `dc_nacimiento`, `dc_nombramiento`, `dc_nivel`, `dc_categoria`, `dc_adscripcion`, `dc_foto`, `user`, `password`, `created_at`, `updated_at`, `remember_token`, `rol_user`) VALUES
('4', 'Apellido paterno D', 'Apellido materno D', 'Gilberto', '2018-10-24', 'Nombramiento D', 'Nivel D', 'Categoría D', 'Adscripión D', 0x89504e470d0a1a0a0000000d4948445200000200000002000806000000f478d4fa000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000570049444154785eeddd81aee5aa7220d02891462ff30973e7ff7f73e6b96f7c9b432fdbd8060c76455ad26b8e0d4581ab76a228f98f7fffd7ff0b218410c2e7703084104208efc6c110c260fefaeb2ffad7bffef58fbdbfe9ef2d28f610c29038f87afff55ffff50ffd3dbcc77ffff77f1fd27ba351b35dec35f8f46ffa7b0b8a7d34ba0339bd17dee33ffff33fffa1bf7f04075f2b6dfc253447189b8af9599af7696ab68bbd069ffe4d7f6f41b13f4d677c96e60d634b9b7c09cdf1721c7c2535f83bb44678960af7559aff497933af410dfc2ec5fe249ded559a3f3c4b8dfc0eadf1621c7c1535ef56b47e684fc5ba16adf70435f0dad4d0cf52ec4fd059d6a2f5427b6ad8ad68fd17e2e02ba841f7a498425d2acead68fd9ed4b07b51a35fe859c5de93ceae15ad1fea5273ee4931bd0807a7a666fc34c519ee51416e4d71f4a4863b12c5dc93ceac35c511ee51237e9ae27c010e4e4bcd77348a3b9ca342dc8be2e9454d77248ab9179d552f8a279ca3a63b1ac53d390e4e478d7606da4b38a622dc8be2e9410d77448abd079d552f8a271c53939d81f632290e4e458d7546da5bf8930a706f8aab3535db1129f6d67446bd29aef02735d419696f13e2e034d448df407b0d7f53f1ed4d71b5a6663b22c5de9acea837c515fea606fa06daeb6438380535ceb7d1bebf4ec5b737c5d5921aedc8b487967446bd29aeaf53d37c1bed7b221c1c9e9ae5db290f5fa3c2fb04c5d6929aecc8b4879674464f506c5fa326f976cac32438383435c7af503ebe4445f7298aaf1535d991690fade86c9ea2f8be44cdf12b948f097070686a8c5fa3bc7c818aee53145f2b6ab223d31e5ad1d93c45f17d811ae2d7282f13e0e0b0d40cbf4af9793b15dda728be16d46067a0bdb4a0b3798ae27b3b35c3af527e06c7c121a9097e9df2f4662aba4f517c2da8b9ce407b694167f314c5f7666a825fa73c0d8c83c351f30bbf29676fa382fb34c5599b9aeb0cb497da74264f539c6fa3c6177e53ce06c5c1a1a8e1853f29776fa262fb34c5599b9aeb0cb497da74264f539c6fa28617fea4dc0d8883c350a30bfb94c73750b17d9ae2ac498d7526da534d3a93a729ce3750930bfb94c7c17070086a6ea18cf2393b15dba729ce9ad45467a23dd5a433799ae29c9d9a5b28a37c0e84838f53530be729b73352a11d8162ad450d7546da5b2d3a931128d619a9a185f394db4170f0716a66e11ae577362ab2a350bc35a899ce487bab4167310ac53b1b35b2708df23b080e3e4a4d2cdca33ccf444576148ab70635d319696f35e82c46a17867a22616ee519e07c0c1c7a879857a94f319a8c88e42f1dea5463a33edf12e9dc52814ef0cd4b8423dcaf9c338f80835ac509f723f3a15d95128debbd44467a63ddea5b31885e21d9d1a56a84fb97f1007bb53a30a6de91c46a5223b0ac57b979ae8ccb4c7bb7416a350bca352930a6de91c1ec2c1aed49c421f3a8f11a9c88e42f1dea106fa06daeb1d3a8b5128de11a939853e741e0fe060376a4aa12f9dcb68546447a178ef50f37c03edf50e9dc52814ef68d494425f3a97ce38d88d1a527886ce67142ab2a350bc77a879be81f67a87ce62148a77146a44e1193a9fce38d8859a507896ce69042ab2a350bc57a971be89f67c95ce62148a77046a42e1593aa78e38d89c9a4f1887ceec492ab2a350bc57a969be89f67c95ce62148af7496a3c611c3ab34e38d8941a4e188fceee292ab2a350bc57a969be89f67c95ce62148af7296a38613c3abb0e38d8949a4d1893ceef092ab2a350bc57a861be91f67e85ce62148af7096a34614c3abf0e38d88c9a4c189bceb13715d95128de2bd42cdf487bbf4267310ac5db9b9a4c189bceb1310e36a30613c6a7b3ec494576148af70a35cb37d2deafd0598c42f1f6a4e612c6a7b36c8c834da8b18479e84c7b51911d85e23d4b8df2cd9483b37416a350bcbda8b18479e84c1be260136a2a612e3ad71e546447a178cf52937c33e5e02c9dc528146f0f6a28612e3ad78638589d9a499893ceb73515d95128deb3d424df4c39384b67310ac5db9a9a499893ceb7110e56a74612e6a5336e494576148af70c35c82f502eced0598c42f1b6a42612e6a5336e848355a98184f9e9ac5b51911d85e23d43cdf10b948b337416a350bcada88184f9e9ac1be060556a1ee11d74de2da8c88e42f1965263fc12e5a494ce62148ab705358ef00e3aef0638588d9a4678179d7b6d2ab2a350bca5d414bf443929a5b31885e2ad4d4d23bc8bcebd320e56a38611de47675f938aec28146f2935c52f514e4ae92c46a1786b52b308efa3b3af8c8355a85184f7d21da8454576148ab7841ae2172937257416a350bcb5a85184f7d21da8888355a8498477d33da8414576148ab7849ae1172937257416a350bc35a8418477d33da88883b7a939846fd07db84b4576048ab5841ae19729472574262350ac77a939846fd07da88483b7a93184efd09db84b85f6698ab3849ae09729472574264f539c77a92984efd09da88483b7a82184efd1ddb843c5f6698ab3849ae09729472574264f539c77a82184efd1dda88083b7a819846fd2fdb84ac5f6698af3881a60b8f6234067f234c579951a41f826dd8f0a3878999a40f836dd932b546c9fa6388fa8f985f80190531308dfa67b7213072f5303084177e52c15dba729ce3d6a7ce137e56c8fcee4698af32c15ff1074576ee2e0252afc21ac7467ce50b17d9ae2dca3a6177e53cef6e84c9ea638cf50e10f61a53b7303072f51d10f21a57b534ac5f6698a738b1a5ef89372b74567f234c5594a053f8494eecd0d1cbc44053f849cee4e0915dba7294e51a30bdb9443d1993c4d719650b10f21a7bb7303074f53a10f618beed01115db2729c62d6a72619b72b84567f324c57844853e842dba431771f03415f910b6e80e9550c17d8ae21335b8704cb9149dcd53145f0915f910b6e80e5dc4c15354e04338a2bb744445f7298a2fa7c616ca29a7399dcd5314df1115f8108ee82e5dc0c15354dc4328a1fbb44745f7298a2fa58616ce536e533a9ba728be3d2aec2194d07dba8083c554d4433843f76a8b8aee53145f4acd2c9ca7dca674364f517c5b54d4433843f7ea240e1653410fe10cddab3d2abcbd29ae959a58b84fb95ee98c7a535c7b54d0433843f7ea240e1653410fe12cddad2d2abebd29ae851a57a847395fe88c7a535c5b54cc43384b77eb240e1651210fe12add3151f1ed2d8f49cd2ab493e75f67d45b1ed31615f210aed21d3b81834554c443b84a774c547c7b5b6351730afd8c78278ea888877095eed8091c2ca2221ec21dba673915df9ed638d49046a2d8cfd09c231aed5eec51010fe10eddb313385844053c84bb74d7722ac0bdac31a819f5a2b85a531c2318e94eec51f10ee12eddb513387848853b845a74e7522ac2bdac31a819b5a01846a2987b1ae94e6c51e10ea116ddb9421c3ca4a21d422dba732915e15ed618d48c6ad09a33d05e7a18e94e6c51d10ea116ddb9421c3ca4a21d424dba772b15e15ed238d490aed03a33d31e5b48cf4271f492c69153c10ea126ddbb421cdca5621d420bba7f2b15e2d6f218d494ced01a6fa4bdd7909f87d66e2d8f21a5621d420bba7f0538b84b853a84567407172ac6ade531a8291dd1bc5fa05cdc959f87d66d2d8f61a5221d422bba830538b84b453a84567407172ac6ad290e3526d17c5fa4dc5ca1b3d07aad298e858a7408ade80e16e0e02615e8105ad35d5ca820b7a2f5176a4e29cd15eeff10d0592cb4562b5a7fa1021d426bba8b0738b849c539841e741f172accb569ddd45683d25ce127e5ee489eff9cd6a94deb2e549843e841f7f1000737a93087d083eee34a05ba16ad97cb9b93e609fbd21c1ec9f32f5aa316adb752610ea107ddc7031cdca4c21c422fba932915ebab34ff11cd13ce51c34f29ef7bb4c6559a3fa5a21c422fba930738482ac821f4a6bb9952e13e4bf396d05ce11c35fd94f27e44eb9ca579532ac821f4a6bbb98383a4621cc213743f532ae0a5345f29cd17ce53e35f28e7a5b44e29cd9752210ee109ba9f3b38482ac4213c41f7738b0a7a4eef5da1b9c375357f00a4b4564eef6d51210ee109ba9f3b38f80715e1109ea47bbae76e912fa575c275b59b7f4aebe9b93d2ac2213c49f7740307ffa0021cc293744f47a0a612ae6bf903a00615e0109ea47bba81837f50010ee149baa7a350230bd78cdcfc172ac0213c49f7740307ffa0021cc2d3745747a16616ce536e47a1e21bc2d374573770f00f2abe213c4d7775146a66e13ce576142abe213c4d777503077f50e10d6114bab3a350430be594d351a8f086300add59e0e00f2aba218c427776246a6ce19872391215dd1046a13b0b1cfc4145378451e8ce8e460d2e6c530e47a3a21bc228746781833fa8e8863012dddbd1a8d1853f2977a351c10d6124bab7c0c11f5470431889eeed88d4f0c26fcad9885470431889ee2d70f00715dc1046a27b3b2a35be304ff35fa8e0863012dd5be0e00f2ab8218c467777546a805fa61c8d4ac53684d1e8ee02077f50b10d6134babb235323fc22e566642ab6218c46771738f8838a6d0823d2fd1d991ae29728272353a10d6144babfc0c11f5468431891eeefe8d418bf40b9189d0a6d0823d2fd050efe4345368451e90ecf400df2cd948319a8d086302adde10c07ffa1221bc2c8748f67a166f926daf32c5460431899ee718683ff50810d6164bac73351e37c03ed75262ab0218c4cf738c3c17fa8c0863032dde3d9a881ce4c7b9c8d0a6c0823d33dce70f01f2ab0218c4e7779666aaa23d31e66a6e21ac2e87497331cfc878a6b08a3d35d0ee12a15d71046a7bb9ce1e03f545c439881ee730867a9b0863003dde70c07ffa1c21ac20c749f43384b85358419e83e6738f80f15d61066a0fb1cc2592aac21cc40f739c3c17fa8b0863003dde7d1e97fa1ee4db4e7d1a9b0863003dde70c077f51510d6126bad72352b37c33e560442aaa21cc44f73ac1c15f5450439889eef548d41cbf443919890a6a0833d1bd4e70f01715d41066a27b3d0235c32f538e46a0821ac24c74af131cfc4505358499e85e3f4d0d308cf9234005358499e85e2738f88b0a6a0833d1bd7e8a9a5ef89372f71415d41066a27b9de0e02f2aa821cc44f7fa096a74619b72f80415d41066a27b9de0e02f2aa821cc44f7ba2735b7504e39ed4905358499e85e2738f88b0a6a0833d1bdee450d2d9ca7dcf6a2821ac24c74af131cfc45053584d9e86eb7a64616ae538e5b53310d6136badb090efea2621ac26c74b75b52030bf729d72da99886301bdded04077f51310d6136badbada871857a94f356544c43988dee768283bfa89806fbd7bffec5f1f03cddeddad4ac423b3a83da544c43988dee768283bfa898065b7e00c48f8031e96ed7a40615dad359d4a4621ac26c74b7131cfc45c53458fc001897ee762d6a4ca11f9d492d2aa621cc46773bc1c15f544c83ad3f00e247c07874b76b50430afde96c6a50310d6136badb090efea2621a2cfd01103f02c6a3fb7d979a51e84f6773970a690833d2fd4e70f01715d2b02d7e008c4bf7fb0e35a2f01c9dd11d2aa421cc48f73bc1c15f5448c3bef8113026ddefabd4809ed623be1e6b5cb57c6f697c77a990863023ddef04077f51210dc7e247c07874bfaf50f31981626d49313c69fdde14eb152aa421cc48f73bc1c15f54484399f8013016ddefb3d47846a1785b520c4f5abfb75a3f025448439891ee778283bfa89086326941d2df435fbadf67a8e98c4431b7a4189e907e6729c57c860a690833d2fd4e70f01715d250262d46fa7be84bf7fb0c359f9128e69614436fe937268abb940a690833d2fd4e70f01715d250262d44fa7be84bf7fb0c35a09128e69614432fe9b7b547719752210d635acf5b7f0bf103e031cba5d4787886eef8196a46a350bc2d29861ed6625f4ab11f51110de3cacf5ccf7c99ee788283bfa8888672cb65d4787886eef891bcb82cd4989ea6d85b520c2de91c4a28f6232aa2615cf999eb992fd31d4f70f01715d1506eb98c1a0fcfd01ddf931796236a5c3d690f2d68ed5694e7b3b4873d2aa2614c3a6f3df765bae3090efea2221ac2ac74c7b7a8b0945013eb45fb68416bd7a4bcdea57d6c51110d634acf373def859effa2fc7e6738f88b8a6808b3d21ddf921793b3d4d85ad33e5ad0da35299f77691f5b5444c398d2f34dcf5bcf7e557ebf331cfc870a690833d2fd96b490dca506d78af6d282d6ae6d5947f9bc23dfc71615d1309efc5cd3b3d6f35f94deeb0d1cfc870a690833d2fd96b490d4a226579bf6d282d6ae65995ff9ab21dfc71615d2301e9deb3aa6e7bf28cdcd060efe4385348419e97ee7d602d28a9a5e2dda4f0b5afb2ee5aa05ed27a7421ac6a3f3cccf5bef7d499e1fe0e03f5448439891ee772e2f20ada809dea5fdb4a0b5af526e5ad27e722aa4612c3ab7557ade7af74b949f0c07ffa142fa45e9a55ae9b9302eddef9cceb90735c7b3b49f16b4f619da7f2fda4f4e85348ce3e81cd3f3d6fb5fa2fc6438f80f15d22f4a2f554ecf87f1e87ee774be4f51f3dca3fdb4a0b58f687f4fd07e722aa4611c3ab3dc7ade7aff4b949b0c07ffa142fa1569e128a139c21874b7b7e86c9fa4862ada4b0b5a3ba77d3c4d7bd9a2621ac6a0f3caad67aef7bf44b9c970f00715d42f488b472acd4dfe37cdb33afa7b68273db312f9b98e408d36a57db4a0b5578a7b04dac71e15d330069d576e3d77bdff15ca0b70f00715d4374b0b474ab959e899bdf9d2bf853ed2f32a959fdb28d47817da430beb7a8a6d44dac31115d4f03c9dd51ecdf115ca0770f00715d4373b5b44b69e4bc7535a33b4959ecb593ac311a4cd7fa1d85b98a5f92bf6522aa8e1793aab3d9ae32b940fe0e00f2aa86f76b698ec3d9bff6da135435be9999ca5331c8de26e49313c2d2d7ecbbf1577a974ae300e9dd511cdf305ca0570f00715d437cb0bcb5131d97b36ffdb426b86b6d233b942e73812c5dc926278d2c5e2b7299f2f3c4fe77444f37c85f2011cfc4105f5cdd2c2a27cc8d63be9784aeb8676d233b94267d843e9da79bcad29865ce97377dd287e9b34677896cee988e6f90ae50338f8830aeadba50546392995ce93d29aa10d9dcb593ac31e14cba2f4b9564ad7cf9fab49456fa558ced2bca33bcacbcc74464734cf57281fc0c11f5454df2e2d34ca49a9749e94d60c6de85caed039b6a63866a23dd5a2a2b7501c5768eef01c9dd111cdf315ca0770f00f2aac6f96171be5a4443ecf4a6b8e68a658b7e85caec8cfb007c57196e62da1b9ced2bcb5a8e82d14c7159a3b3c43e75342737d8172b181837f50617db3bcd8282725f279565a734433c69cd3b95c91e6a217c57196e62da1b9ced2bcb5a8f02d14c7159a3b3c43e75342737d8172b181837f50617db3bcd8282725f279565a7344b3c69dd2b95c91e7a235c57085e62ea1b9aed0dc35a8f02d14c3159a3b3c43e75342737d8172b181837f50617db3bcd8282725f279565a734433c5ba45e772557e8e2d69fd2b347709cd7585e6aee166e13ba4f9c333743e2534d71728171b38f80715d6b7cb0b8ef272249f63a5f5421b3a97ab7496ad68fd2b347709cd7585e6aee166e13ba4f9437f3a9b529aef0b948b0d1cfc830aebdbe50547792991cfb3d07aa13e9dc75d3acf16b4f6159abb84e6ba4273d770a3e815cbd708fde95c4a69be2f502e3670905460df2c2f38ca49897c9e95d60c75e93ceed259b6a0b5afd0dc2534d7159abb968b45af583a7fe84f67522abf1f5fa15cece020a9c0be5d5a6c949312e91c29ad17ead279d4a0f3ac4deb5ea1b94b68ae2b34776d5ab70615d8d08fcea494ee89d6781be56207074905f6edf20ba4bc94c8e75968bd5097cea2069d676d5af70acd5d42735da1b96bd3ba35a8c0863e741e67e89e2cb4d69b28173b38482ab06f975f1ee5a5443ecf42eb85ba741635e83c5bd0da6769de129aeb2ccddb82d6ae410536f4a1f33843f744b4f6cc948b1d1c2415d8b7cb2f8bf252229f67a1f5425d3a8b5a74a6b569ddb3346f09cd7596e6ad4debd6a2021bdad3599ca17b524af1cc44f9d8c1c14d2ab26f975f10e5e5483ec74aeb857a7416b5e83c6bd3ba5768ee3d9ae30acd5d9bd6ad450536b4a7b33843f7e42cc5353ae5e2000737a9c8be5d7e31949712f93c0bad77468d39de4a6750537e962d68dd2b34f71ecd7185e6ae4debd6a4421bdad2399ca17b7285621b99727180839b5468bf20bf18cacd11cda1b5f62cefedfd3bfc96e7bfb6f42c5bd1ba5768eec55f7ffdf587655c735c91afd782d6ad4985f64dd63cea6f4fd139944aef460b8a7714cac7010e6e52a1fd82fc12283747f4bed6dab2be9b8fa5ff0ebfa5b96f613d8fd6b4f659eb5c6af8a239ce4af7d092d6ae498536b4a333384377a415c5ff24e5e3000737a9d09ea1248ade7d521e9f727385d692e5d93c86959ebfeb6c7ca359e36f4967d182d63e6399434dfe88e63a23df472b5abb3615dbd086f25f4af7a327eda727e5e400077769e3ade5055e63ade531293767699d54fa6cbefe4aef5d95aea7bfcf22dd470b3a87dafed7fffa5fff500c39cdb15073bf6a994f6be7f2185a530c35a9d8863694ff52ba1b4fd1de5a523e0a70709736fb1415ff96f2f5959f33b4c62a7f365f7ba577afc8d7d33333c8f7d182cea1b6a31f007a27a7267e57bec6d5d86a520cb5a9e886fa94fb12ba17a3d03e6b534e0a7070973638323589abf2b9959fb3b48e9ecbd75ee9fdb3f2b5f4cc2cf2bdb4a073a86deb07809edda2065e83d6ba1a630de9daada8e886ba94f752ba17a3530eae524e0a70709736321b358e12f93ccacf595a47cfe5d618f47e29cdabe766a1fdf492de8b11a871d7a4357b50ee7b51e10df528e725744f66a25c9ca5bc14e0e0ae35e8118a416d6933d1df45393a235d73a5e7b6e8fd129a6ba16767a1fdf4a4fbf184f4db6c45ebb6a69cf7a4c21bea51ce4be8aecc40dfd516e52ba5bc14e0e02105b8d026df4ef939e36e23d3fb7b34c742cfce46fb7a82ee494ffa365bd0da2d28c74f50e10d7528df25745f46a76fa994e6535e0a71f090025b28b8b7537eceb8dbc4f2f7f7e8fd959e9f89f6f424dd951ef45db6a2f56b536e9fa4e615ee53ae4be8ce8c48dfcf1de9dcca4b210e1e5240ab34b0af508eceb8d3c8d277f7e8dd959e9f8df63502dd9756f43db6a4186a512e47a0e6f505adf79fe6b894eecd88f4edd4b0ceafdc14e2e02105934b13f076ca512f6a8639bdb7d2f3b3d1be46a1fbd28abec3d614470dcae528d4c066a37d9da579afd0dc25746f46a36fa6a6650de5a610078b28985c9e8cb7527e7a51435ce9f994de9991f63612dd99daf4fdf5a058ee520e47a2263623eded0acd7d86e62ca1bb33127d2fb5292f2770b088821125e68d94a3d6d40c577a3ea57766a4bd8d4877a6267d7b39c5b5d0b3a514cb1d8a6f446a6433d2deaed0dc25345709dd9d51e83b6945b93981834514cc1625e96d94a3d6d410177a36a57766a5fd8d4af7a6167d7739c5b4d2f32514cb558a6b546a66b3d2feeed01a5bf4fe11dd9d91e83b6945f93981834514cc1625e96d94a3d6ae3444bd332bed6f74ba3b77e99bdbb215939e2d91c77295e21a9d1adaacb4bfab34ff16bdbf47776734fa4e5a518e4ee0603105244ad2c8d23deaef5bd2f75abbda10f5deacb4bfd1e9dedca56f6e8fe2d173a5d258ae4a639a851adaccb4c73bb4464aef6cd19dd973e7ddbbf48db490eef1220e166b14d4d074e02b3ddfcad56698bf372bed6d06ba3777e81b3cebee3c794c5728573350639b95f67787d658e9f93dba3329bdf326faeef4dc491c0c859ebc84579a611e6f3ac76cb4bf19e46770970a436f8aeb2ce56a066a6e33d31eafd2fc2b3dbfe74d7766201c0c2fa58f68a1063b3aed6f64ca7b0d6ac8bd29aeab94bb91a9b9cd4efb5c9d3d2fcdbfd0b3a13b0e8617ca3fdc9c9aeca8b4bfd129e777a9193f41b15da5dc8d4e0dee0d743e258e7293fe3d3c8a836160fae06a52c31d8df2323ae5fa2e35e32728b6ab94bbd1a9c9bd81cee72ccdab1c864770300c401f536f6abe4f53ae66a11c5fa546fc24c5789672360b35bad9e98cced2bcca5f780407c303f4f18c428df829cadd8c94e733d4849fa4184b28373352a3bb63b9eb1aef456775c5debcca63e88a83a1a3f4839841de907b52fe66a71c9750137e9262dca35ccc2e6f7677ac775e7feb416776d6d1bcca61e88a83a1a3f483984dda9c7b50fede40b9dda306fc34c5b94539780335bc3b963baff11e746e671dcda91c86ae38183aca3f8ad9e44dba15e5ee4d94db2d6ac04f539ca2bdbf49def466a473bb626f5ee52e74c7c1d059fa61cc4c8dbb06e5ec8d94d39c9aef4814f34a7b7ea3bcf1cd44e776c5dedcca59780407c303d28f67766ae25729576fa67ca6d4744794c7adbdbe991ae0e8f233bb42f3ae96bf2b57e1311c0c0fc93f26d17b47344f0f6ae867682f5fa05c2ed46847b7c4ad3d7e819ae0c8d67ba6bd1c59dfd5bc2bbd171ec5c1f090f523123d7f85e66e498dbd94e2ff0ae5520d7674dadb57a8098e4af15fa1b9577a3e3c8a83e1412afc7aee2acddf831afc1ec5fe25caa11aece8b4b72f51231c9162bf2a9d77bdbb7a2e3c8e83e16169d1d7dfef4ae7ef4dcd3ea798bf28cd9b9aebe8b4a72f4a1be28814f35de9ddd5dfc31038185e2efd389fa0a6bf52bc5f95e64c0d7674dad357a9f18e42f1864fe060f8b0b4e9b4163f00f6ad7952739d81f6f4556abc3d29a6f0791c0c1f9736e9d6a2f9ef5b72a4e63a3aede5ebd4987b502c21fc1b0743f8256fd62d69fdf01f6cae33d05e42df1f015a3f84040743f8879a756d5af7adfefbbffffb0f7a6ea5e63a03ed657536076fa3665d9bd60d21c3c110fea0c65d83d67a1b35bc94de59a9b9ce407b59290729bdf3366ada777de57b0ad570b0a9fffdbffff7aba9a03d45f9bf236fde35689d37d1b988de5da9c18e4c7b5869efa277df440dfcacd6df92cee509aab36fa3fc77c0c16ab4d12fd0257e82cea486bcf05ca5b9df46e7227a77a5263b32ed61a5bd8bde7d1b35f512bdbe239dcb135463bf40675219072fd106be4a97f8093aa75af2227496e67c239d8be8dd959a6c8925cf1a6f4d7b5869efa277df480d3e977f3b29cd598bcee509aab15fa573ba8183a729d02fd3257e82ceaa3615a5239ae7ad742e5bf4fe424db6449a73fdbd15ed61a13d6fd1fb6fa5a6bf48cf2fa7796ad3b93c4575f6ab74561771f01405f875bac04fd079b5a222257af7ed74365bf4fe1b68af5bf4fedbe95b11bddb8acee629aab35fa6f3ba8083c5145818e30780ceab0715ad94de793b9dcf16bdff06daeb16bdff76fa56527aa7079dcf93546fbf4ae77512078b29a8f0ed1f000b15b0859efd0a9dd116bd3f33ed718bdeff0a7d330b3ddb8bcee869aab95fa4f33a8983451450f89b2e6d4f3aaf278c52c446a073daa33966a4bdedd11c5f32e237a3737a926aee57e9bc4ee0e02105127ed2c5ed4567169ea573ba42738f40b15ea1b9c3b3744ea350edfd1a9d59210eee5200e14fbaac3de8cc66f0967decc9f7187e52ce66f7963de6fb188d6af097e8cc0a707097160f7fd225ed4167362ac52f7a7746da5bf84d399b91f6267a77548a7f24aac15fa2332bc0c14d5a38982e696b3ab39128e62b34f72cb49f1067bad0dc2351cca3500dfe1a9dd9010e92160cdb74495bd3b98d40b1d6a0b546a77d8438cb94d61a81621d89eaf0d7e8dc7670f00f5a28ecd3056d4d67f734c55993d61c9df6f165cad1e8b48f9ab4e6d314e7485487bf4867b781833f6881704c17b4079de153145f0b5a7b64dac397294723d31e5ad0da4f517c23522dfe229d2170f0074d1e8ee972f6a033ec4d71f5a05846a4d8bf4c391a9162ef41b1f4a6b846a45afc453a43e0e03f347128a3cbd983ceb127c5d493621a8de2fe32e568348abb27c5d493621a95eaf117e91c331cfc45138672ba983de82c7b513c4f506ca351dc5fa4dc8c46713f41b1f5a27846a57afc553acb04073951384717738bde5fe8d9233acf1e14cb9314e34814f31729372351cc4f528c3d289651a9967e99cef37ffc39a809c279352ea6e638a2336d49318c44318f40b17e91723302c53a12c5dc92621899eae997e94cffedcf41bd1c9ea18b5d42e7da82d61e91627f9ae2fc22e5e6698a73448abd05ad3d3ad5d32fd3b9fedbcf01bd189ea38b5d223fd716b4eec8b4872729c62f526e9ea41847a63dd4a67547a77afa7538dbdfffd00be159bad825d2736d416bce407b798ae2fb22e5e6298a6f06da4b4d5a7316aaab5f969deddfff410f8667e932974a0eb83aad3713ede9098aed8b949b2728b699684fb568bd59a8b67e5d72b67fff073d149ea5cb5c2239dceab4de8cb4b7de14d7172937bd29ae19696fb568bd19a8b67e5d72aed1fc47a48b5c2a39dceab4de8cb4b7de14d7172937bd29ae19696fb568bd59a8c67eddaf73d51fc2f374894be41f6d4d5a6f66da632f8ae7cb94a35e14cfccb4c75ab4de0c5463c3bf7f0468303c4b17b8843ed89ab4e6ccb4c75e14cf972947bd289e99698f3569cdd1a9ce86f801301c5dde52fa586bd17a6fa0bdf6a058be4c39ea41b1bc81f65a8bd61b9d6a6d881f00c3d1e52da10fb526adf906da6b0f8ae5cb94a31e14cb1b68af3569cd91a9d686f80130145ddc52fa486bd29a6fa0bdf6a058be4c39ea41b1bc81f65a93d61c99ea6d881f0043d1c52da10fb426adf926da734b8a21c439d4a63dd7a43547a57a1be207c03074694be9e3ac496bbe89f6dc926208710eb569cf3569cd51a9e686f801300c5dda12fa306bd29a6fa4bdb7a2f5439c410bda7b4d5a7354aabb5f173f0006a0cb5a421f646d5af78db4f716b476f84d396b416bbf91f65e9bd61d916aefd7c50f8001e8b296d0c75893d67c33e5a036ad1b7e53ce6ad3ba6fa61cd4a4358fa80ed6d673ad59c50f8087a51fc519fa106bd3ba35f458e38a34ae16b466f893725793d6ece58918d2bdb7a275f7a81686fee207c083f46194d247589bd6bd436be4f45e2f8aa726ad19fea4dcd5a4357b782a8674dd56b4ee1ed5c3d05ffc0078903e8c12fa006bd3ba77688d2d7abf17c55383d60adb94c31ab4566b23c4a1186ad3ba7b5413435ff103e021fa204ae9e3ab4debdea1358e689ed614c7559a3f9ca7dc5ea5f95b520c0b3ddb9262a84deb1e516d0cfdc40f8007e84338431f5f6d5af70ead7144f3b4a638ced09ca11ee5fc0ccdd9926258e8d99614436d5ab7846a64e8237e003c401fc119faf86ad3ba77688d239aa735c57144f384f6741647344f2b5a3fa5775ad1fab569dd12aa91a18ff801d0993e802bf401d6a435afd2fc6768ce56b4fe11cd13dad3591cd13c2d68ed9cde6b45ebd7a435cf50ad0cedc50f80ce74f9afd0475893d6bc4af39fa5795bd0da47344f684f677144f3b4a0b5737aaf15ad5f93d63c43b532b4173f003ad2c5bf4a1f612d5aef0ead7196e66d45ebefd11ca13d9dc51ecdd18ad6cfe9bd9614432d5aef2cd5ccd056fc00e84417fe0e7d84b568bd3bb4c6599ab715adbf477384f674167b34472b5a3fa7f75a520cb568bdb35437435bf103a0135df83bf411d6a2f5eed01a6769de56b4fe1ecd11dad359ecd11cad68fd9cde6b4931d4a2f5ae50ed0cedc40f800e74d1efd247588bd6bb436b9ca5795bd1fa7b3447684f67b14773b4a418527aa725c5508bd6bb42f533b4f3efb3fb0ffe21d4a38b7e57faf1d5a6f5eed01a6769de56b4fe11cd13dad1191cd13c2d298694de694931d4a2f5ae520d0df5fdcfd9fd7d807a20dca70b5ecb7a76b569ad3bb4c6599ab715ad7f44f38476740647344f6b8a63a5e75b520c3568ad3b5447435dc9f9fd3e483d18eed105af253dbb9ab4d61d5ae32ccddb8ad63fa279423b3a83239aa707c5b2d0b32d29861ab4d65daaa5a18eecfc7eff430f87eb74b16b4acfae16ad5383d63a4373b6a418f6688ed08ece608fe6e869949814c75d5ae72ed5d35047767e3ffec117c235bad8b5e5e77797d6a8416b9da1395b520c4734cfc8668ffb0ccdd3db0831e531dca5356a514d0df7e00cff18e08be13c5deada747e77688d1ab45629cdd79ae238a27946367bdc67689ea73c194f9e97bbb4462daaa9e13a9ddfbf7190138472bad02de8eceed01a3568ad239aa717c57344f38c6cf6b8cfd03c5fa4dcdca1356a515d0dd7e8ecfe07077fd144a18c2e742b3abb3bb4c65d5a678fe6e845f194d27ca39a39e62b34df97282777688dda545bc3393abb0407ffa109c33e5de496746e77688d1ab4564eeff5a6b84a69be51cd1cf3159aef4b94933bb4466daaafa19cce2dc3c11f3471d8a68bdc92ceec0ead51db53eb96506ca534dfa8668ef90acdf725cac91d5aa336d5d7504667061cfc4193876dbac8ade9dcaed2fc5fa29c9ca13947346bbc5769ce2f514eaed2fcada8c686633a37e0e01fb440f8932e700f3ab3ab34ff9728276768ce11cd1aef559af34b9493ab347f2baab3619fce6c0307490b859f74817bd1995da5f9bf40b9384bf38e68d678efd0bc5fa05c5ca5f95b529d0ddb74663b38b8490b86671bff4ae77595e6ff02e5e20acd1dae538eafd0dc5fa05c5ca5f95b52bd0da6f33ac0c15d5af8eb74719fa0f3ba42737f81727185e60ed729c75768ee2f502eaed0dcada9de863fe9bc0a70f09002f8325ddc27e8acaed0dc5fa05c5ca5f9c379caed559aff0b948b2b34776baab7e1279d55210e1651205fa58bfb049dd3159afb0b948bab347f384fb9bd4af37f81727185e66e49b536fca4733a8183c514d0d7e8e23e49e77485e67e33e5e02ead13ca29a777699d37530eaed0dcada9de86df744e2771b09882fa1a5ddc27e99caed0dc6fa61cdca5754239e5f42eadf366cac1159abb35d5dbf09bcee9240e9ea2c0be4417f7693aa7b334ef9b290777699d504e39bd4bebbc99727096e6ed41f536fc4de77401072f51905fa08bfb349dcf599af7cd94831ab45638a65cd6a0b5de4c39384bf3f6a07afb753a9f1b38788b827e335ddc11e86cced2bc6fa4bdd7a2f5c231e5b216adf746dafb599ab717d5dbafd2d954c0c16ab49137d1a51d85cee32ccdfb46da7b4d5a336c530e6bd29a6fa4bd9fa5797b51cdfd129d47651cac4e9b7b035dda91e82cced2bc6fa23db7a0b5c39f94bb16b4f69b68cf6769de5e546fbf4267d108079bd16667a68b3b129dc1159afb0db4d756b47ef89372d78ad67f03edf50acddd8beaeddbe90c1ae36033daf4cc747147a233b84af3cf4c7b6c4d7184df94b3d614c7ccb4c7ab347f0faab55fa033688c83d569b36fa0cb3b129dc5559a7f66da630f8a25c479d4a23d5ea5f95b539dfd1a9d45231cac469b7b135de091e84ceed01a33d2de7a513c21cea406eded0eadd19aeaec57e94c2ae3e02ddac85be9028f44e77397d69989f6d49be2fa32e5a837c53513ede92eadd39aea6c68f66380839728e82fd0251e85cea906ad3503ede5098aedcb94a32728b619682f3568add65463c36f3aa71b38788a82fc125de251e8bc6ad17a23d31e9ea418bf48b97992621c99f6508bd66b49f53598ceeb020e1653605fa4cbfc349d574d5a7364dac3d314e79728274f539c23d31e6ad29a2da8ae867d3aaf9338584c417d912ef4d3745eb569dd1129f6516cc59a8fa5ff7e83759f2352bc2352ecb569dd165457c33e9dd7491c2ca280be4c97fa493ab316b4f64814f368f6e24dfff616f91e47a4b847a2985bd0da2da8a686633ab313387848817c9d2ef593746ead68fd1128d6d9685f33d31e47a5f847a0585bd1fa35a9968673746e8538b84b0184bfe9823f4567d78ad61f81629d89f6342bed6f74dac708146b2b5abf26d5d1709eceae00073769e1f09b2ef853747ead298e2728b619696f33d2de66a23d3d41b1b5a6386a521d0dd7e8fc0e7090b460305df4de7486bd289e1e14cbccb4c799684f33d31e7b502cbd289e9a543fc3753ac31d1cfc83160adb74d17bd339f6a6b85ad0da6fa1fdce407b790bedb705addd9be2aa49f533dca373dcc0c11fb440d8a78bde9bcef2098aad26adf946dafb8814fb1b69ef3569cd2728b65a543b431d3a4be0e00f9a3c1cd385ef4967f924c57887d6f802e562048af50b948b3bb4c69314632daa9ba10e9d2570f01f9a3894d185ef49e73902c57a86e6fc2ae5a727c5f455cacf199a73048ab516d5cd508fce33c3c15f346128a70bdf93ce34bc9bee414d5a33bc9bee412daa9ba12e9d6982839c289ca74bdf8bce357c8beec5199a337c8bee450daa97a10d9debfff8735013846b74f17bd0b986717de1ecbeb0c7b74acfae16d5cbd08ecef5df7e0ee8c5709d2e7e0ff9b93ee1afbffedaa4e75b531c0b3ddbd3a8e757d317f6f8663abfbb542f435b38dbdfffd00be11e5dfc1ed273ed490d768bde6f416b8bde6d49e796d23b33d2de527a278c45e77695ea64e8273bdbdfffd0c3e13e7d042da567dad3bffef52f36d63d9aa726adb94773d4a633dba33966a0bdecd11c611c3ab32b5423433fd9b9fefd1ff460a8431f414bc9e176b334fffc0740e90f02cd5783d62aa1b96ad299b5a638f6688ed614471887ceec0ad5c8d05772aed1fc5bd347d05272b85daccd7f8f1a6d4af3dea135ced09cb5e8cc42fc00189dceec0ad5c8d0dfaf73d51f427dfa105ac83fda96d4e8f7a8d1ae34ff1d5ae38c255ecd5b83ce2dc40f8019e8dcae508d0cfdc50f804ef411b4a08fb685bcb99752b35d699d2b34f7154bbc9abf069ddd972947613c3abbab5427435ff103a0237d04b5e9a3ad2d6fea67a8d1a6b4de199af38e2566ad5383ceef8b949b30269ddf55aa91a1aff801d0913e82daf4d1d69437f4b3d464735ab744e9fc67ac716bbd1a74865fa29c8471e90caf528d0c7dc50f80cef421d4a48fb696b519dea1269bd3da2534570d6bec5ab3069d636b4faebd4a7310e6a073bc4af531f4153f003ad38750933eda1ad2267e979a6c4e31ecd11cb5a4b16bed5a749e2d3cb5ee2a5f3fcc43e77995ea63e82b7e003c401f432dfa68ef4a1b600d6ab2a25844efd6b6c6aef56bd299d6f4c49a29ad1fe6a133bd4ab531f4153f001ea20fa2067db477a5cdbb063558512ca2775b58e3570c35e95c6be9bd5e4a6b87b9e85caf525d0c7dc50f8087e883a8411fed1d69e3ae490d5614534aefb492c6af586ad2d9dea575167ab636ad1be6a3b3bd4a7531f4153f001ea20fa2067db477a44daf2635d82d8a6ba1675b5be3573c35e96cefd23a39bd5783d60af3d1d95ea5ba18fa8a1f000fd10751833edaabd286dd821aac28b6859e6d2d8d5f31d5a2b3bd4beba4f44e2d5a2fcc47677b95ea62e82b7e003c481fc55dfa68af481b5d2b6ab05bf2f8f44c0f69fc794c35e96c73fff7fffe5f8e6fd13a2b3d5f93d60cf3d1d95ea59a18fa8a1f000fd38771973edcb3d246d78a1aec9e3536fdad977c0f69ce6ad199e696e63fd30f8085d60df3d099dea17a18fa8a1f000fd38771973ede33f226d78a1aec9e353efdada77c1f69ee6ad099e6ce36ff85d65ae8d916b4769887cef40ed5c3d057fc0018803e8ebbf40197ca1b5c0b6aacb3c8f7a21cdea1f34c5d69fe8b2b6bd5a4f5c31c749e77a91686bee207c000f471dca58fb854dee05a50639d45be17e5f00e9d67eaea0f80c5d9b56acad70ef3d079dea55a18fa8a1f0083d00772973ee41279836b418d7516f95e94c33b7496b5f45a47d2b5c33c749677a90686fee207c020f491dca58fb944dee05a50639d45be17e5f02a9d634dbdd6d992ee35cc41e778976a60e82f7e000c441fca5dfaa08fe40dae3635d599e4fb510eafd219be89f61cc6a533ac41f52ff4173f0006a20fe52e7dd447f206579b9aea4cf2fd288757e90cdf447b1ed9fff93fff67939ebf4beba4f44e4b3ac31a54ff427ff103a093920f207fa6167dd87bf206579b9aea4cf2fd288757e9fcde447b1e8d1aef1ecd7196e6dda3396ad3f9d5a2fa17fa8b1f0095e9b28f401ff896bcc1d5a6a63a937c0fcae1153ab737d2de47a0465b4af395d27ca5345f0d3ab79a543b437fff3eebffe01fc235baec23483fee2379c3ae2d6d9e33caf7a01c5ea1737b23ed7d046ab06768ce239ae72ccd7b97cead26d5ced0d7ff9cf5df07ae07c279baeca358cffa48deb06b4b9be78cf23d288757e8ccde487b7f9a1aeb159a7b8fe6b842735fa533ab4db533f4939cf7dfff410f85f374d947921cfca6bc61d79636cf19e5fb510eafd079bd91f6fe2435d4ab34ff1ecd7195e63f4be7d5826a67e82739f3df87af07c339baeca349cf5cf20657931aea6cf23d298757e8acde487b7f8a1ae95d5a47f4ee1d5ae30c9d552baa9da18fecdc7ffc832f8472baeca3c9cf3c9737b89ad4506793ef49393c4be7f466ca416f6aa235682dd1bb77699d523aa756543b437b38f73f06f86228a3cb3e229dfb2a6f70b5a899ce28df97727896cee8cd9483ded4406bd17a29bd538bd63ba2336a49b533b4a573ffb73f07f57228a3cb3e2a9dfd226f70b5a899ce28df97727896cee7cd94839ed4386bd3ba2b3d5f93d6dca2f3694db533b4a5b3ff370e72825046177e543afbbcc1d5a0463aab7c6fcae1593a9b37530e7a51c36c416b2ff46c6d5a577436bda876863674f6ff8383bf68a2704c977d543af7bcc1d5a0463aab7c6fcae1193a972f502e5a53b36ce9c9f5f3b545e7d28b6a67a84fe79ee0e03f3461d8a7cb3e2a9d79dee06a50239d55be37e5f00c9dcb172817ada951b634dafa399d4b2faa9da12e9d798683ffd0a4619f2efba874e67983ab418d7456f9de94c33d3a87d0fe07811a640fa3ac2f3a875e543b435d3af30c077fd0c4619b2efba874de7bcdeeaa74ced9e57b530e57ca7928a79c5ea1c6d8cb08eb6f51ce7b52fd0c75e8bc81837fd002c174d147a4735eec35bbabd2396797ef2dcf9f721deecbf37c861ae39728272be5ba17d5cf709fce790307490b853fe9a28f4867bcd86b7657a573ce2edf4f9e3fe53adc97e7b9941ae2d7282f2be5ba17d5cf708fce780707498b853fe9a28f46e7bb4a9b5bdec8af4ae77c9b3c7fca77b82fcf732935c42f526e56ca772faaa1e13a9def0e0e6ed282e1275df2d1e86c5769735333bf229df36df2fc29dfe1be3ccf25d408bf4af95929dfbda886866b74b60738b84b0b87df74c947a3735de50d4e0dfd8c7cbeb7c9f3a77c87fbf23c975023fc32e568a17cf7a43a1aced1b916e0e02e2d1e7ed3051f89ce3495373835f533f2f9de26cf9f721eeecbf37c440d308cf9234075349ca3332dc0c1430a20fc4d177c243acf949adc42cdbd84e67a933c7fca79b82fcff31135bf10ff538037d27916e260110512c6fe01a073cca9c92dd4dc4b68ae37c9f3a7bc87fbf23cef51e30bbf29670be5bd37d5d4b04de77802078b29a0afd3a51e85ce30a726b752833fa279de24cf9ff21eeecbf3bc474d2ffca69c2d94f7de545383e90c4fe2603105f575bad4a3d019e6d4e4566af04734cf9be4f953dec37d799eb7a8e1853f2977cafb53545bc34f3ac39338788a02fb325de611e8ec444d6ea5067f44f3bc499e3fe53edc97e7798b9a5df89372b750ee9fa0da1a7ed3d95dc0c1d314e057e9328f40e7266a722b35f8239ae74df2fc29f7e1be3ccfa24617b62987cafd53545f43b5e6bfe0e0250af48b74919fa6f3daa226975293dfa339de24cf9ff21feecbf32c6a72619b72b850fe9fa21afb653aaf1b38d88436f346bac44fd3796c51934ba9c9efd11c6f92e74ff90ff7e579cea9c1857dcae342f97f92eaec5be93c1ae260f83035b9949afc1ecdf12679fe54c0c27d799e736a70e19872193e8383e1c3d4e4526af25bf4fedbe4f953f30af7e579cea9b98563ca65f80c0e860f53934ba9d16fd1fb6f93e74fcd2bdc97e739a5c616ca29a7e11338183e4c4d2ea5462f7af78df2fca97985fbf23ca7d4d44239e5347c0207c387a9c9e5d4f0737aef8df2fca97985fbf23cafd4d0c279ca6d783d0e860f5393cba9e1e7f4de1be5f953f30af7e5795ea99985f394dbf07a1c0c1fa626276afa39bdf73679fed4bcc27d799e576a66e13ce536bc1e07c387a9c9891a7e4aefbc519e3f35af705f9ee7851a59b84e390eafc6c1f0616a72a2a69fd23b6f94e74fcd2bdc97e779a12616ae538ec3ab71f073feebbffeeb90de7b23353951d34fe99d37520ed5c0c275cab11a58b84fb99ec97ffee77f1ed27b1fc5c1575373bf4273bf819a9ca8e9a7f4ce1b29876a62e13ae558cd2bdca75c8f4c0dfe0acdfd011c7c1535ef9ab4e6ccd4e4444d3f75f6f945fece0c944335b1709d72ace615ee53ae47a4265e93d67c210ebe829a754b8a61466a725bd4c457679e4de5ef8d4e3954130bd729c76a5ee13ee57a246ad62d298617e1e0d4d49c7b524c335193dba2067e97d6199972a82616aecbf3abc615eac9f33d0235e79e14d30b70704a6ac64f517cb35093dba2065e83d61a9572b850230be729b76a5aa11ee5fc496ac84f506c93e3e074d4849fa41867a126b745cdbb06ad352ae570a16616ce536ed5b4423dcaf993d48c9fa41827c5c169a8f98e42f1ce404d6e8f1af85d5ae76a7cada5b9cba9a18572cae9424d2bd4a39c3f450d78148a77321c1c9e1aee8814fbe8d4e4f6a881df95af5123ce56145b4a8d2d1c532e576a5aa11ee5fc096aba2352ec93e0e0b0d46447a77d8c4c4d6e8f1af85de9fc8a31953efb04c59452730bc794cb851a56a84fb9ef498d7674dac7e038382435d719682f2353933ba2265e83e213c5d48be2c9a9c1856dcae14acd2ad4a7dcf7a4063b03ed65601c1c8e1aeb4cb4a751a9c91d51f3be4bb1ed515c3d28969c9a5cd8a61caed4ac427dca7d2f6aac33d19e06c5c1a1a8a1ce487b1b919adc1135f03b145709c5d69ae21035baf027e52ea56615ea53ee7b50439d91f636200e0e438d7466dae368d4e48ea88997d23c8aab543a5f0f8a618b1a5ef84d394ba951857674062da991ce4c7b1c0c0787a0063a3bed73346a7247d2867e563e8f622a91ced39362d9a3c6178e9bff424d2ab4a33368494d7476dae74038f83835cfb7d07e47a22677246feaa5f279144f897c9e9e144f0935c12f526eb6a84985767406ada879be85f63b080e3e4a4df34db4e791a8c91d51732fa1b914534eef3d45f1955243fc12e5648f9a54684767d08a1ae79b68cf03e0e063d430df487b1f859adc1135f7239a675523a65ef258af50737c13edf90a35a9d08ecea00535cc37d2de1fc6c147a851be95f63f0a35b9236af04734cf8c94c3abd43cdf407b3d4b0d2ab4a7b3a84dcdf2adb4ff0771b03b35c9b7531e46a02657424d7e8fe698917278979ae8ccb4c7b3d49c427b3a8b9ad424df4e79780807bb5273fc02e562046a7225d4e4b7e8fd59298735a9a1ce407bb943cd29b4a7b3a8490df20b948b0770b01b35c6af503e46a02657428d7e8bde9f9572d88a1aed4814732d6a4ea13d9d454d6a8e5fa17c74c6c16ed418bf4439799a9a5c0935fa2d7a7f56ca612f6ac23d29a616d498423f3a931ad414bf4439e98c835da8217e8df2f23435b9126af4a27767a61c3e498dba06add58b9a52e8476752839ae2d7282f1d71b03935c3af527e9ea4265742cd5ef4eecc94c350979a52e8476772979ae157293f9d70b02935c12f538e9ea4265742cd5ef4eecc94c350979a52e8476772971ae19729471d70b01935c030d68f0035b9126af629ad95d29c33d05e425d6a4aa11f9dc91d6a80e1911f011c6c46cd2f8cfd0340cff496c73412c5fb2677fef701f4ee42cfee51530afde84cee50f30b2fff01a0c617fea67c3d6586e696c6f834c5f7066adc29bd93d23b29bdb3454d29f4a333b943cd2ffc4df96a8883d5a9e985df94b350464db917c5f3166ada39bdb7d0b3a277454d29f4a333b9438d2ffca69c35c2c1ead4f4c24fca5b28a706dd8ad67f1335eb2d77de5de4ef8b9a52e8476772951a5ef849796b848355a9d9853f2977e13c35ec5ab4dedba8491fb9f3ee225d5fd494423f3a93abd4f0c29f94bb063858959a5df8937217ae5303bf4af3bf951a746b8a23a5a614fad2b95ca16617fea4dc35c0c16ad4e882297fa12e35f72d7aff0bd4a07b502c0b35a3d09fcee60a35bb60ca5f651cac468d2e6c530e435bd1f87f5363ee45f12cd48c427f3a9bb3d4e4c236e5b0320e56a10617f6298f21f4a2c6dc8be259a81985fe743667a9c9857dca63451cac420d2eec531e43e8458db927c5a46614fad3d99ca50617f6298f1571f03635b7704cb9ac49176ca5e7437fba172b3d5f939a724f8a49cd28f4a7b3394b75271c532e2be1e06d2a5ee1987259832e95e8ddd08fee444eefd5a2a6dc936252330afde96cce52cd09c794cb4a38788b8a5628a79cdea10bb54773d4a675577abe079dc542cfb6a0b5b7e8fd1ad4947b524c6a46a13f9dcd19fad64339e5b4020edea28215ca29a777e8321dd13cb5683dd1bb2de80c44efd6a2f58e689ebbd4947b524c6a46a13f9dcd19fac64339e5b4020e5ea64215ce515eafd2452aa1b96ad05a7b34474dcaff16bd5f83d62aa5f9ee5053ee4931a91985fe743667e8fb0ee728af3771f03215a9708ef27a852ed0199af32acd5f4af3d5a0dc1fd13c77688db334ef556aca3d292635a3d09fcee60c7ddbe11ce5f5260e5ea2e214ce536ecfd2e5b942735fa1b9cfd09c7728efa534df159afb2acd7f859a724f8a49cd28f4a7b33943df75384fb9bd818397a83085f394db337469aed2fc6769de2b34f715caf9599af72ccd7b87d6384b4db927c5a46614fad3d99ca16f3a9ca7dcdec0c14b5494c279ca6d295d98bbb44e29cd7787d63843f9be42739fa1396bd05a67a829f7a498d48c427f3a9b33f43d87f394db1b38789a8a51b84e392ea10b7397d629a5f9eed23a2594e73bb44629cd5783d63a434db927c5a46614fad3d994d2771cae538e2fe2e0692a46e13ae5b8842e4b0d5aeb88e6a9416b95509eefd01a2534572d5aef0c35e59e14939a51e84f67534adf71b84e39be8883a7a91885eb94e323ba28b568bd3d9aa326adb94739ae416bedd11cb569dd526aca3d292635a3d09fcea694bee1709d727c11074f51110af728cf4774516ad17a5bf47e6d5a778f725c83d6daa3396ad3baa5d4947b524c6a46a13f9d4d297dc3e11ee5f9020e9ea22214ee519ef7e882d4a67545efb6a0b545f9ad496b8ade6d416b975253ee4931a91985fe7436a5f4fd867b94e70b38584c0528dca75cefd105a94debe6f45e2b5a3fa7dcd6a67545efb6a2f54ba829f7a498d48c427f3a9b52fa7ec37dcaf5491c2ca6e213ee53aef7e872b4a0b5537aa725c590526e5bd0da29bdd3926228a1a6dc936252330afde96c4ae9db0df729d72771b0988a4fb84fb9dea28bd18ad64fe99d9614c34a796d45eba7f44e6b8ae3889a724f8a49cd28f4a7b329a56f37dca75c9fc4c1222a3aa10ee57b8b2e464b8a61a1677b502c0be5b525c5b0d0b33d2896526aceabd2e7ae48e75ea91985fe7436a5f4dd863a94ef133858444527d4a17c6fd1a56849312cf46c0f8a65a1bcb6a418167ab607c5524acd7951fadc59f9bc2935a3d09fcea694bedb5087f27d02078ba8e8843a946fd185686d9438568a67a1bcb636420cab3c9633ce34693d7b86e64ca91985fe7436a5f4dd863a94ef133858444527d4a17c8b2e440fa3c4b1c8635928a73d8c12c72a8fa7d4d9269d3f5f4a73e5d48cc2b63cc77ae60a9d4d297db7a10ee5fb040e1e52b109f528e7a20bd1c30831a4d27816ca690fa3c4b1cae329953610fd3d973e2f5bcfa6e35bd48cc2b634bf293d7b86cea694bed9508f725e888387546c423dcab9e832f432420cab34270be5b497116258a53969296f367ae62a35a3b02f3f8f959e2da5b329a56f36d4a39c17e2e021159b508f722eba0cbd8c10c32acdc94239ed65841856694e5a4a9b8cfe7e879a51d8979e474acf96d2d994d2371bea51ce0b71f0908a4da84739cfe9227c559e1be5f48bf2bccc48cd28ec53f35fe8d9523a9b52fa66433dca79210eee52a1097529ef395d84af4af3a27c7e599a9b19a919857d6afe0b3d5b4a67534adf6ca84b792fc0c15d2a32a12ee53da74bf0656b5e94cf2f4befcc157913d13392bf97d2f35bd48cc23ee57ca1674be96c4ae97b0d7529ef0538b84b4526d4a5bce77409be6ccd8bf2f965e99d394b4d64a5e7577a3ea7f744cd28ec53be177ab694cea694bed75097f25e8083bb5464423dcab9e8127cd99a17e5f4cbd23b73861a48eeea7b2bbd9f53330afb94eb859e2da5b33943df6ca847392fc0c15d2a32a11ee55c7409be6ccd8b72fa65e99d29a5e6b1e5ea7babf47d51330afb94c725d77ab694e63c43df6ca847392fc0c14d2a30a12ee55d7409be6ccd8b72fa65e99d299137e81277de5da4ebe7d48cc236e570a5e74b69be33f4cd86ba94f7031cdca40213ea52de4517e0cbd6bc28a75f96de99236ace25eebcbbc8e3c8a9210553fe527aa784e63a43df6ca84b793fc0c14d2a30a12ee55d7401be6ccd8b72fa65e99d39a2e6dc8be259a921853f2977a2778f689e33f4cd86ba94f7031cdca40213ea52de4517e0cbd6bc28a75f96de993d6aca3d29a6951a52f89372b745efefd11c67e89b0d7529ef0738b84905266cfbd7bffeb549cf2f9477d105f8b2352fcae997a577668f9a726f8a6ba186147e52de8e689e2d7aff0c7db3a12ee5fd000737a9c084dfd4e8b7e8fd85f22eba005fb6e64539fdb2f4ce6c51337e82625ba821859f94b7129a4bf4ee19fa66435dcafb010e6e528109e71aff4af32c9477d105f8b2352fcae997a577668b9af11314db420d29fca69c9da139737aef0c7db3a12ee5fd000737a9c07c959a7aeaafbffefa43fa77cdb950de4517e0cbd6bc28a75f96de992d6ac64f506c0b35a4f09b727686e6cce9bd33f4cd86ba94f7031cdca402f3356913dfa31f00abe5ef9a5b39dfa20bf0656b5e94d72f4befcc1635e32728b6851a52f84d393b4373a6f4ce15fa6e433dcaf9010e6e5281f982bcb91f51d3df92aea39c6fd105f8b2352f693e43fc00f802e5ec0ccd99d23b57e8bb95a5866a3cec53ce0f7070930acc5be54dfd0c35fa12caf9165d802f5bf3a2b3fcb2f4ce6c51337e82625ba82985df94b33334674aef5ca1ef56d25aaabf0753ce0f7070930acc9ba417ef0e35f712caf9165d802f5bf3a273fdb2f4ce6c51337e82625ba82985df94b33334674aef5ca1ef76a53abad2f3e14fcaf9010e6e5281999d2edc5d6aee2594f32dba005fb6e64567fc65e99dd9a266fc04c5b652630a7f53beced09c29bd73856a65297df3e127e5fc000737a9c0cc4817ac1535fa2dcaf9165d802f5bf3a2f3feb2f4ce6c51337e82625ba931853acd59f3a6f4ce15793dcc6b65097dfbe16fcaf9010e6e528199852e534fe9c517e57b8f2ec097ad79d1d97f597a67b6a819e7ce3e7f45ba464e8d29ccf50360a1dab750cddca31af026daf34acf2f94ef031cdca4023332256f04fa0094ef3dba004fd11ef7688ebbd6bce81e7c597a67b6a819a7ce3e7f55be4e4a8d297cf707c04ab56066da634eef2d94ef031cdca402331225eb09ca5dfe4cfe01e89d3dba0077e531b6a618ae5af3a27bf165e99dd9a266bcd2f30b3d7b97d659a931853e741e57e5756fb5d604bd93d68c52aa11a352fc5bf4fe4ab93bc0c14d2a304f52829ea27cb5a40b7087f6d48362b962cd8beec997a577668f1af242cf2ef4ec559a3fa7c614fad0793c45356444aa5139bd7744f3ac94af031cdca522d38b12f224e5a7175d80abb4b79e14d3596b5e746fbe2cbd337bce36663d7f85e61635a6d087ce6304aa256fa7dab7507e0a7070978a4c6ddaf828949327e8129ca5fd3d4931965af3a2fbf465e99d3972a639e7cf5ea5b9458d29b4a7b31891eac91ba9f62d9493021cdca5227395363822e5e169ba0467689f2350ac25d6bce89e7d597a678e9c69cce9b35769de2d6a4ea13d9dc5e85457de42b56fa13c14e0e02e159912dacce8b4ff51e81294d25e47a2988fac79d1ddfbb2f4ced4a6a67e86e6dca30615dad239cc42b56566aa7b2bedbf000777a9c8e414fc2cb4e711e9121cd17e47a5f8f7ac79d17dfcb2f4ced4a6a65e4af31d51830a6de91c66a41a331bd5bd95f65c8083875468520a7e74dae7c874098e68df23d31eb6ac79d17dfcb2f4ced4a6c65e4af31d51830aede80c66a73a330bd5bd85f6598883875468520a7e44dadb2c7411f668ff33d05e64cd8bee630f8a3da5777a48ef4c6d6aeca534df1135a9f0539a63fdfd0c9dc19be83b1d99eade427b2bc4c1430a6e06dacbac7411b6281733d19e726b5ed4045b52bc47344f2be99da92d6d366769be236a52e137e559cf95d219bc99bed591a8ee2db497421c3ca4e046a5f8df401721a77ccc4afb4bad7951136c45715ea139d3b13bd23b539b1a4e29cd77444d2afc4d395ee8d9523a83af48bfcfa7a9dea5147f210e1e52902351cc6fa38b90525e66a77daed6bca8095eb5ac99fffb29691c67a477a636359c529aef889a54d86efe0b3d5f42f9ff2a7d8f3da9dea51473210e1651a04f506c5fa08b9052ae66a77daed6bca80996d29aa351dc7bd23b539b1a4e29cd5742cd2ac4fff8bf377d9bada8dead14db091c2ca2405b520c5fa6cbb052fede407b5dad795113dca23566a37da5d23b539b9a4e09cd554acd2ac40f8051e81bbd4bf56ea5184ee06011057a87d608db741994d737d19e576b5ed404539af70db4d7457a676a52c329a1b9ce50b30af1036016fa76cf52ddbb8883451498e8dd705f7a0994f7374af79c5bf392363fcdf105690ed23b53931a4e09cd75869ad5d729cf0b3d5b4ab90ffde8bb16bd7b02078b540e249c94e7ff2bd4fc175fcfcb96f4ced4a4865342739da166f565a579d5bb5bf47e1843e5ef9b836102f945f892bcf92f6391174bef4c4d69532fa579ce52c3fab23379d5fba277c32b71304c40c57e5667f777f70740ba8ee89d59697f77e58dbd84e6b9420debabaee65573a5f4ce4cfefaebaf7fe8efe11f1c0c21844d7973dfa2776b50d3fa1ae5a594e64be99dabd2669cd2b377688d9cdefb380e8610c22635fb959eaf4d4deb6b9497529a6fa5e7cf52f3dda3394a69be239ae7a338184208c352e3fa92bb3fb434e74acf9fa5a67b44f394d05c4734cf4771f0b227febb8110c2b7a8717dc9c83f00d4704b69be3d9aa394e6fb200e9e92377dd17b6769de859e0d21bc971ad7d7282fa534df4acf9752a33d43736ed1fb6769de8fe1e0296acaa2774b682ed1bb21847752f3fa12e5a484e64ae99d126ab057686ed1bb5768ee0fe1603135e23d9ae388e6d9a2f74398818af142cf6ed1fb0b3d7b568d7935c742cf1ed13c5fa29c94d05c2b3d5f428df50ead91d23b77688d8fe0603135e1239a678bdedfa33942189d8a714aefa4f44e4eef95d27c29bd93d23b39bdb747737c8972524273adf4fc1135d4bbb44e4aefdca5753e808345d4804b682ed1bb2534570857d528927bf2f9b7e8dd859edda2f78f681ed1bb0b3dbb45ef6fd1fb5fa29c94d05c2b3d7f44cdb406adb5d0b3b568bd97e3e02135de3334674aef9ca1394338430532a577ced2bc7b5acdb145ef6fd1fb0b3dbb47736cd1fb5fa17c94d05c2b3dbf474db496deeb2db4e6cb71f0909aee599a77a5e7cfd09c2194527114bd7b86e6dc73f7fd453ec716bd7ba4c51c7bf4fe57281f2534d74acfef5113ade9e9f53e8083bbd470afd0dc0b3d7b85e6ae29fd7fb9dae2fff5aae64fe99d3bf2fffbfa39bd7355ebf917578b5bfede11cd51427395b8fbfe228d638bde2b71f7fd451ac71ebdfb15ca4709cdb5d0b347d4446b7b62ad0fe1e02e35dbab5aceafb9ef522316bd5b4af36dd1fb57a8216fd1fba5349fe8dd522a6e29bdb3d2f32534d71ecd7146ad39f6e89d1277df5fa471ecd1bbe1b73339d3b347d4446b7b62ad0fe1e02e35dbab5acebdc8e7bf430df888e6d9a2f74b68ae33d4804b68ae2d7aff88e639a2c2267a77a1674b69be2d7abf37c5b5d2f3bd292ed1bbe13ce5768f1a680b4fadf7111cdca4267b47eff9af52e33d4373a6f4ce199ab3841aef199a33a577ced09c5b54d4b6dc7d5f34e716bddf9be25ae9f9de1497e8dd709e72bb47cdf30db4d717e3e02635d9bb5ace9fce7d951aee159a7ba167afd0dc7bd470afd0dc0b3d7b85e61615b53d77df977c4ed17b4f506c2b3ddf9be212bd1bce536ef7a879be81f6fa621cdca4267b57cbb91769fc67a9d1ded17bfe2d6ab477f49e3fa78256a2c61ca974be2d7aef098a6da1679fa2f844ef8672cae91135cf37d05e5f8c83a4e65a43aff9af5093bda3f7fc5bd464efe83d7f4e45adc4ddf773694ca2779e347a8c8a4ff46e28a79cee51e37c13edf9a538486aaeb5b49c3fdfc7196ab277f49e7f8b9aec1dbde74fa9a09d51638e541e5f4acf3f69f418159fe8dd2fb99b13bdbf474df34db4e797e220a9b9ce42fb39a2065b43aff9b7a8c1d6d06bfe9c0ada1935e648e5f1a5f4fc93468f51f16dd1fb6fa73ca4f44e4eef1d51d37c13edf9a538f80735d599684f47d45c6be835ff1635d71a7acd9f53517b92625ce9f927cd16df1ebdff46dafb1ecd91d23b47d434df447b7e290efe414d7526dad31e35d699684f0b35d699e4fb51411b411ee74acf3e69b6f8f6e8fd37d2de8f689e959e3fa2a6f926daf34b71f00f6aaab3d1beb6a8a9ce447b5aa8a9ce24df8f0ada08f238577af649b3c5774473bc8df67d44f32cf46c0935cd37d19e5f8a833fa899ce487bdba2a63a13ed69a1a63a937c3f2a6a23c8e35ce9d927cd16df11cdf136daf711cdb3d0b325d434df447b7e290efea0663a23ed4dd4506794ef4b0d7546e99e54d44690c698d2b34f9a2dbe239ae36db4ef3d9a63a1674ba969be89f6fc521cfc41cd7446da9ba899ce28df979ae98cd23da9b08d208d31a5679f345b7c2534cf9b68cf7b34c742cf9652d37c13edf9a538f8839ae98cb43751339d51be2f35d319a57b52611b411a634acf3e69b6f84a689e37d19ef7688e859e2da5a6f926daf34b71f00735d319696fa2663aa37c5f6aa6334af7a4c2368234c6949e7dd26cf195d25c6fa0bdeed11c0b3d7b869ae69b68cf2fc5c11fd44c67a4bd899ae98cf27da999ce28dd938adb08d218537af649b3c5574a73bd81f6ba47732cf4ec196a9aad3cb9e60770f00735d319696fa2663aa37c5f6aa6334af7a4e2368234c6949e7dd26cf19da1f966a77d6ed1fb0b3d7b969a660ba3acfb621cfc41cd7446da9ba899ce28df979ae98cd23da9c08d208d31a5679f345b7c6768bed9699f5bf4fe42cf9ea5a6599bd65de8d9dab4ee4b71f00735d337d05e176aa633caf7a5663aa3744f2a702348634ce9d927cd16df199a6f76dae716bdbfd0b367a969d6a435577abe36adfb521cfc41cdf30db4d7859ae98cf27da999ce28dd930adc08d218537af649b3c57796e67cb3a37da7b9b9434db326ad99d23b3569cd97e2e00f6a9e6fa0bd2ed44c6794ef4bcd7446e99e54e44690c698d2b34f9a2dbeb334e797294757a869d6a2f544efd6a2f55e8a833fa879be81f6ba50339d51be2f35d319a57b52911b411a634acf3e69b6f8aed0bc5fa4dc5ca5a65983d6daa2f76bd17a2fc5c11fd43cdf407b5da899ce28df979ae98cd23da9d08d208d31a56753cbbdd4782b67e3eb2d8fef0acdfb45cacd556a9a3568ad3d9aa306adf5521cfc216f9c6fa1bd2ed44c6794ef4bcd7446e99e54e84690c698d2b3abf46eeaef2d94c4d73ba6541edf559afb4b94933bd434efd23a47344f0d5aeba538f887b4383d4571b5a0663aa37c5f6aa6334af7a462b72a7dae8574ed949e5de8be2ff46c4d25f1f58e2995c77795e6fe12e5e40e35cdbbb44e09cd7597d679290e6eca8b414f8aa70535d319e5fb52339d51baa7b3c54ecfb7a0b517679e5de8f99a4ad6cbbf3f3dd34a1adb5d9aff0b948bbbd434efd23a2534d75d5ae7a538582c6dd02d69ed56d44c6794ef4bcd7446e99eae14bbfc9d16b4eea2f4b9d472fff3f76ac9d7d233fafef45c0bf9ba7768fe2f502eee52d3bc436b94d27c77699d97e2e06569d3ae496bb5a2663aa37c5f6aa6334af774b5d0a5efb5a0351725cfc8fa1da4efd790af53f2cc4acfd6a675efd01a6fa61cd4a0a67987d6384373dea1355e8a83b7a48dbb16add38a9ae95dfffad7bf48cfd692ef4bcd7446f9beae52c1ac45ebddb57c075aeb8e7c8da3bfe7f2e76bd39a77688d37530e6a50d3bc4af39fa579efd01a2fc5c15bf2e67d97d66849cdf40a35fc239ae7aa7c5f6aa633caf775950a660d5aab16ad77d5d1fcfabba4efd4a6f5eed23a6fa4bdd7a2a67995e6bf42735fa5f95f8a83b7a8895fa5f95b53332da5a67e87d62895ef4bcd7446f9beee50e1bc436bd4a675af389a5b7f97f49ddab4de5d5ae78db4f75ad434afd0dc5769feab34ff4b71f01635f2ab347f6b6aa6a286dd9262d893ef4bcd7446f9beee52f1bc4af3d7a675cfd2bc77688d1ab4560d5a6b8bea929e1b89f65c939ae6159afb0ead7185e67e290edea20fe60acddd839ae94a8df9498a7195ef4bcd7446f9beee5201bd4273b7a0b5cfd09c77699dbbb44e2d5a6f8b6ad3159abb05edb73635cdb3346f0d5aeb2ccdfb521cbc4597ff0acddd43de48d5784793c7bcc8f7a5663aa37c5f77a9889ea5795bd1fa6768ce1ab4d61d5aa326adb9502daa4debd6a2bdd6a6a67986e6ac45eb9da5795f8a83b7e8c29fa5797b51839d51be2f35d3192c7b49ff9defeb2e15d1b3346f2b5abf94e6ab496b5ea1b96bcbd7541dea258fe52aedb30535cd529aaf36ad7b86e67c290ede925eecbdbf6dc9dfe92d6fa4b3caf79536d185de59e4cff5a47872f9beee52213d4373b6a4184a68aedab4ee599ab715d59f11282f7bd6f7b4c716d4348f689ed6144709cdf5521c6c2ebdec393ddf939ace8cf27d5d69b68bfcbddab4e69e7c5f77a9a09ea1397b513ca2775bd1fa6768ce56547f66a5fdb5a2a6b94773f4a2788e689e97e260174f5fe22d6a3a33d2beee34de543acf559ab744beafbbd484ced09c4f1a2946c5b24773b4a63a7486e62ca5f9aed2fcada8698ade7d8ae2dba2f75f8a83dd3c79894348a9211dd13c23982dc627e3cc6b5009cd5393d63ca2795a51d35ce8d9d128ee9cde7b290e8610368cd0b4425d6aa82b3dff04c5b6d2f361db871b7e8e832184f019b335d4d9e20d23fa8ffff7ff0110a54ac5d026ead40000000049454e44ae426082, NULL, NULL, '2018-12-03 21:52:34', NULL, NULL, NULL),
('5', 'Sandoval', 'Vallejo', 'Mónica Elizabeth', '1990-12-01', 'Nombramiento B', 'Nivel A', 'Categoría B', 'Adscripión A', NULL, NULL, NULL, '2018-12-06 21:32:36', NULL, NULL, NULL),
('6', 'Robles', 'Zepeda', 'Francisco Javier', '1990-12-01', 'Nombramiento B', 'Nivel B', 'Categoría B', 'Adscripión B', NULL, NULL, NULL, '2018-12-06 20:25:01', NULL, NULL, NULL),
('7', 'Benítez', 'Cortés', 'Rubén Paul', '1990-12-01', 'Nombramiento C', 'Nivel C', 'Categoría C', 'Adscripión C', NULL, NULL, NULL, '2018-12-06 20:25:01', NULL, NULL, NULL),
('8', 'Aguilar', 'Navarrete', 'Perla', '1990-12-01', 'Nombramiento D', 'Nivel D', 'Categoría D', 'Adscripión D', NULL, NULL, NULL, '2018-12-06 20:25:01', NULL, NULL, NULL),
('9', 'Salcedo', 'Rosales', 'Mónica', '1990-12-01', 'Nombra', 'Nivel', 'Categoía', 'adscripción', NULL, NULL, NULL, '2018-12-06 20:25:01', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresado`
--

CREATE TABLE `egresado` (
  `idegresado` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidoPaterno` varchar(45) NOT NULL,
  `apellidoMaterno` varchar(45) NOT NULL,
  `matricula` varchar(45) NOT NULL,
  `plan` int(11) NOT NULL,
  `periodo` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefonoCasa` varchar(45) DEFAULT NULL,
  `telefonoCel` varchar(45) DEFAULT NULL,
  `generacion` varchar(45) NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `prorroga1` date DEFAULT NULL,
  `prorroga2` date DEFAULT NULL,
  `numeroActa` varchar(20) DEFAULT NULL,
  `idmetodoTitulacion` int(11) NOT NULL,
  `ctpa_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estan_acad`
--

CREATE TABLE `estan_acad` (
  `ea_institucion` varchar(255) NOT NULL,
  `ea_proyecto` varchar(120) NOT NULL,
  `ea_fecha` date NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `est_des_per`
--

CREATE TABLE `est_des_per` (
  `edp_nivel` varchar(250) NOT NULL,
  `edp_inicio` date NOT NULL,
  `edp_fin` date NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exp_profesional`
--

CREATE TABLE `exp_profesional` (
  `ep_actcargo` varchar(120) NOT NULL,
  `ep_institucion` varchar(230) NOT NULL,
  `ep_inicio` date NOT NULL,
  `ep_fin` date NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formacion`
--

CREATE TABLE `formacion` (
  `f_curso` varchar(140) NOT NULL,
  `f_institucion` varchar(280) NOT NULL,
  `f_inicio` date NOT NULL,
  `f_fin` date NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `cat_actualizacion_fk` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados_academicos`
--

CREATE TABLE `grados_academicos` (
  `ga_institucion` varchar(230) NOT NULL,
  `ga_inicio` date NOT NULL,
  `ga_fin` date NOT NULL,
  `ga_grado` tinyint(1) NOT NULL,
  `ga_anio` varchar(4) DEFAULT NULL,
  `ga_pnpc` varchar(40) NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `cat_grados_fk` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrantes_area_aca`
--

CREATE TABLE `integrantes_area_aca` (
  `idintegrantes_area_aca` int(11) NOT NULL,
  `cat_area_aca_ctaa_id` int(10) UNSIGNED NOT NULL,
  `docente_dc_codigo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `integrantes_area_aca`
--

INSERT INTO `integrantes_area_aca` (`idintegrantes_area_aca`, `cat_area_aca_ctaa_id`, `docente_dc_codigo`) VALUES
(1, 8, '1'),
(2, 9, '2'),
(3, 9, '3'),
(4, 8, '4'),
(5, 9, '1'),
(6, 10, '1'),
(7, 12, '14'),
(8, 12, '13'),
(9, 12, '12'),
(10, 12, '11'),
(11, 12, '10'),
(12, 12, '6'),
(13, 12, '9'),
(14, 12, '8'),
(15, 12, '7'),
(16, 12, '7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrantes_comision`
--

CREATE TABLE `integrantes_comision` (
  `idintegrantes_comision` int(11) NOT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  `comision_cuerpos_colegiados_comision_id` int(11) NOT NULL,
  `docente_dc_codigo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `integrantes_comision`
--

INSERT INTO `integrantes_comision` (`idintegrantes_comision`, `cargo`, `comision_cuerpos_colegiados_comision_id`, `docente_dc_codigo`) VALUES
(1, 'Responsable', 3, '1'),
(2, NULL, 4, '5'),
(3, NULL, 4, '6'),
(4, NULL, 4, '7'),
(5, NULL, 4, '8'),
(6, NULL, 4, '9'),
(7, NULL, 4, '10'),
(8, NULL, 4, '11'),
(9, NULL, 4, '12'),
(10, NULL, 4, '13'),
(11, NULL, 4, '14'),
(12, 'Integrante', 4, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrantes_unid_acade`
--

CREATE TABLE `integrantes_unid_acade` (
  `idintegrantes_unid_acade` int(11) NOT NULL,
  `docente_dc_codigo` varchar(30) NOT NULL,
  `cat_unid_acade_ctua_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `integrantes_unid_acade`
--

INSERT INTO `integrantes_unid_acade` (`idintegrantes_unid_acade`, `docente_dc_codigo`, `cat_unid_acade_ctua_id`) VALUES
(1, '1', 19),
(3, '1', 21),
(4, '2', 20),
(5, '3', 21),
(6, '4', 22),
(7, '14', 23),
(8, '13', 23),
(9, '12', 23),
(10, '11', 23),
(11, '10', 23),
(12, '9', 23),
(13, '8', 23),
(14, '7', 23),
(15, '6', 23),
(16, '5', 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_didac`
--

CREATE TABLE `material_didac` (
  `md_nombre` varchar(250) NOT NULL,
  `md_fecha` date NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `cat_mat_didac_fk` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodotitulacion`
--

CREATE TABLE `metodotitulacion` (
  `idmetodoTitulacion` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `creado` timestamp NULL DEFAULT NULL,
  `actualizado` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `minutas`
--

CREATE TABLE `minutas` (
  `id_minutas` int(11) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lugar` varchar(255) NOT NULL,
  `orden_del_dia` longtext NOT NULL,
  `acuerdos` longtext,
  `asunto` varchar(255) NOT NULL,
  `minutas_comision_cuerpos_colegiados_comision_id` int(11) NOT NULL,
  `cat_prog_acad_ctpa_id` int(10) UNSIGNED NOT NULL,
  `asistentes` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `minutas`
--

INSERT INTO `minutas` (`id_minutas`, `create_at`, `update_at`, `fecha`, `hora_inicio`, `hora_fin`, `lugar`, `orden_del_dia`, `acuerdos`, `asunto`, `minutas_comision_cuerpos_colegiados_comision_id`, `cat_prog_acad_ctpa_id`, `asistentes`) VALUES
(2, '2018-12-03 17:37:00', '2018-12-04 00:38:10', '2018-12-03', '17:37:00', '2018-12-04 00:38:10', 'Aula X', 'Nada', 'Nada.\r\nNada.\r\n', 'Nada', 0, 56, 'Norberto, '),
(3, '2018-12-03 17:45:00', '2018-12-04 00:46:24', '2018-12-03', '17:45:00', '2018-12-04 00:46:24', 'Aula X', 'Nada', 'Nada.\r\n', 'Nada.', 0, 56, 'Norberto, '),
(4, '2018-12-03 17:50:00', '2018-12-04 00:51:54', '2018-12-03', '17:50:00', '2018-12-04 00:51:54', ' ', ' ', NULL, 'n', 0, 56, 'No hay asistentes :('),
(5, '2018-12-03 17:56:00', '2018-12-06 01:47:05', '2018-12-02', '17:56:00', '2018-12-06 01:47:05', 'Aula X', 'Orden del día 1. Orden del día 2. Orden del día 3.', 'Acuerdo 1.\r\nAcuerdo 2.', 'Asunto 1.', 3, 56, 'No hay asistentes :('),
(6, '2018-12-06 14:07:00', '2018-12-06 21:12:16', '2018-12-06', '14:07:00', '2018-12-06 21:12:16', 'aula ECO-11', 'Informe de observaciones atendidas.\r\nPlan de mejora continua 2018.', 'La Mtra. Monica se incorpora a los trabajos de a categoría de investigación.\r\nEl Dr. Francisco se incorpora a la categoría de infraestructura por ser el responsable de la Subdirección Administrativa en el lugar de la Dra. Yolanda.\r\nSe trabajará colaborativamente en el a plataforma Trello para seguimiento a las actividades.\r\n\r\n', 'Revisión de acreditación.', 4, 60, 'Sergio Agustín, Janoe Antonio, Sonia Yadira, Isabel Dado, Nayely Yatemi, Mónica Elizabeth, Francisco Javier, Rubén Paul, Perla, Mónica, ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `part_red_inves`
--

CREATE TABLE `part_red_inves` (
  `pr_nombre` varchar(120) NOT NULL,
  `pr_fecha` date NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `cat_impacto_fk` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premios_distin`
--

CREATE TABLE `premios_distin` (
  `pd_nombre` varchar(140) NOT NULL,
  `pd_motivo` text NOT NULL,
  `pd_institucion` varchar(280) NOT NULL,
  `pd_fecha` date NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prodep`
--

CREATE TABLE `prodep` (
  `pro_inicio` date NOT NULL,
  `pro_fin` date NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productividad`
--

CREATE TABLE `productividad` (
  `p_nombreart` varchar(250) NOT NULL,
  `p_nombrecont` varchar(250) NOT NULL,
  `p_issnisbn` varchar(50) NOT NULL,
  `p_fecha` date NOT NULL,
  `p_participacion` tinyint(1) NOT NULL,
  `p_actividades` text,
  `docente_dc_fk` varchar(30) NOT NULL,
  `cat_productos_fk` int(10) UNSIGNED NOT NULL,
  `cat_proy_tipo_fk` int(10) UNSIGNED NOT NULL,
  `cat_impacto_fk` int(10) UNSIGNED NOT NULL,
  `cat_prog_acad_fk` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prod_proy_reg`
--

CREATE TABLE `prod_proy_reg` (
  `ppr_nombreart` varchar(250) NOT NULL,
  `ppr_nombrecont` varchar(250) NOT NULL,
  `ppr_issnisbn` varchar(50) NOT NULL,
  `ppr_fecha` date NOT NULL,
  `ppr_participacion` tinyint(1) NOT NULL,
  `ppr_actividades` text,
  `docente_dc_fk` varchar(30) NOT NULL,
  `cat_productos_fk` int(10) UNSIGNED NOT NULL,
  `cat_proy_tipo_fk` int(10) UNSIGNED NOT NULL,
  `cat_impacto_fk` int(10) UNSIGNED NOT NULL,
  `cat_prog_acad_fk` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proy_registrados`
--

CREATE TABLE `proy_registrados` (
  `pr_nombre` varchar(120) NOT NULL,
  `pr_clave` varchar(230) NOT NULL,
  `pr_financiado` tinyint(1) NOT NULL,
  `pr_inicio` date NOT NULL,
  `pr_fin` date NOT NULL,
  `pr_institucion` varchar(180) NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sis_nac_inv`
--

CREATE TABLE `sis_nac_inv` (
  `sni_inicio` date NOT NULL,
  `sni_fin` date NOT NULL,
  `docente_dc_fk` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id_actividad`),
  ADD KEY `fk_actividad_docente1_idx` (`docente_dc_codigo`),
  ADD KEY `fk_actividad_minutas1_idx` (`minutas_id_minutas`);

--
-- Indices de la tabla `adicional`
--
ALTER TABLE `adicional`
  ADD KEY `adicional_docente_dc_fk_foreign` (`docente_dc_fk`);

--
-- Indices de la tabla `administrativo`
--
ALTER TABLE `administrativo`
  ADD KEY `administrativo_docente_dc_fk_foreign` (`docente_dc_fk`);

--
-- Indices de la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD PRIMARY KEY (`dc_codigo`,`idegresado`),
  ADD KEY `fk_docente_has_egresado_docente1_idx` (`dc_codigo`);

--
-- Indices de la tabla `carga_horaria`
--
ALTER TABLE `carga_horaria`
  ADD PRIMARY KEY (`cgh_periodo`,`cgh_dia`,`cgh_horario`,`cat_unid_apren_fk`,`docente_dc_fk`,`grupo`),
  ADD KEY `carga_horaria_cat_unid_apren_fk_foreign` (`cat_unid_apren_fk`),
  ADD KEY `carga_horaria_docente_dc_fk_foreign` (`docente_dc_fk`);

--
-- Indices de la tabla `cat_actualizacion`
--
ALTER TABLE `cat_actualizacion`
  ADD PRIMARY KEY (`cta_id`);

--
-- Indices de la tabla `cat_area_aca`
--
ALTER TABLE `cat_area_aca`
  ADD PRIMARY KEY (`ctaa_id`);

--
-- Indices de la tabla `cat_comision`
--
ALTER TABLE `cat_comision`
  ADD PRIMARY KEY (`ctc_id`);

--
-- Indices de la tabla `cat_direcciones`
--
ALTER TABLE `cat_direcciones`
  ADD PRIMARY KEY (`ctd_id`);

--
-- Indices de la tabla `cat_grados`
--
ALTER TABLE `cat_grados`
  ADD PRIMARY KEY (`ctg_id`);

--
-- Indices de la tabla `cat_impacto`
--
ALTER TABLE `cat_impacto`
  ADD PRIMARY KEY (`cti_id`);

--
-- Indices de la tabla `cat_mat_didac`
--
ALTER TABLE `cat_mat_didac`
  ADD PRIMARY KEY (`ctmd_id`);

--
-- Indices de la tabla `cat_productos`
--
ALTER TABLE `cat_productos`
  ADD PRIMARY KEY (`ctp_id`);

--
-- Indices de la tabla `cat_prog_acad`
--
ALTER TABLE `cat_prog_acad`
  ADD PRIMARY KEY (`ctpa_id`),
  ADD KEY `cat_prog_acad_cat_unid_acade_fk_foreign` (`cat_unid_acade_fk`);

--
-- Indices de la tabla `cat_proy_tipo`
--
ALTER TABLE `cat_proy_tipo`
  ADD PRIMARY KEY (`ctpt_id`);

--
-- Indices de la tabla `cat_tipo_uap`
--
ALTER TABLE `cat_tipo_uap`
  ADD PRIMARY KEY (`cttua_id`);

--
-- Indices de la tabla `cat_unid_acade`
--
ALTER TABLE `cat_unid_acade`
  ADD PRIMARY KEY (`ctua_id`),
  ADD KEY `cat_unid_acade_cat_area_fk_foreign` (`cat_area_fk`);

--
-- Indices de la tabla `cat_unid_apren`
--
ALTER TABLE `cat_unid_apren`
  ADD PRIMARY KEY (`ctuap_id`),
  ADD KEY `cat_unid_apren_cat_tipo_uap_fk_foreign` (`cat_tipo_uap_fk`),
  ADD KEY `cat_unid_apren_cat_prog_acad_fk_foreign` (`cat_prog_acad_fk`);

--
-- Indices de la tabla `comision_cuerpos_colegiados`
--
ALTER TABLE `comision_cuerpos_colegiados`
  ADD PRIMARY KEY (`comision_id`),
  ADD KEY `comision_cat_comision_fk_foreign` (`cat_comision_fk`),
  ADD KEY `fk_comision_cuerpos_colegiados_cat_unid_acade1_idx` (`cat_unid_acade_ctua_id`),
  ADD KEY `fk_comision_cuerpos_colegiados_cat_area_aca1_idx` (`cat_area_aca_ctaa_id`);

--
-- Indices de la tabla `cuerpo_acad`
--
ALTER TABLE `cuerpo_acad`
  ADD KEY `cuerpo_acad_docente_dc_fk_foreign` (`docente_dc_fk`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD KEY `direcciones_docente_dc_fk_foreign` (`docente_dc_fk`),
  ADD KEY `direcciones_cat_direcciones_fk_foreign` (`cat_direcciones_fk`),
  ADD KEY `direcciones_cat_prog_acad_fk_foreign` (`cat_prog_acad_fk`);

--
-- Indices de la tabla `docencia`
--
ALTER TABLE `docencia`
  ADD KEY `docencia_docente_dc_fk_foreign` (`docente_dc_fk`),
  ADD KEY `docencia_cat_grados_fk_foreign` (`cat_grados_fk`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`dc_codigo`);

--
-- Indices de la tabla `egresado`
--
ALTER TABLE `egresado`
  ADD PRIMARY KEY (`idegresado`),
  ADD KEY `fk_egresado_metodoTitulacion1_idx` (`idmetodoTitulacion`),
  ADD KEY `fk_egresado_cat_prog_acad1_idx` (`ctpa_id`);

--
-- Indices de la tabla `estan_acad`
--
ALTER TABLE `estan_acad`
  ADD KEY `estan_acad_docente_dc_fk_foreign` (`docente_dc_fk`);

--
-- Indices de la tabla `est_des_per`
--
ALTER TABLE `est_des_per`
  ADD KEY `est_des_per_docente_dc_fk_foreign` (`docente_dc_fk`);

--
-- Indices de la tabla `exp_profesional`
--
ALTER TABLE `exp_profesional`
  ADD KEY `exp_profesional_docente_dc_fk_foreign` (`docente_dc_fk`);

--
-- Indices de la tabla `formacion`
--
ALTER TABLE `formacion`
  ADD KEY `formacion_docente_dc_fk_foreign` (`docente_dc_fk`),
  ADD KEY `formacion_cat_actualizacion_fk_foreign` (`cat_actualizacion_fk`);

--
-- Indices de la tabla `grados_academicos`
--
ALTER TABLE `grados_academicos`
  ADD KEY `grados_academicos_docente_dc_fk_foreign` (`docente_dc_fk`),
  ADD KEY `grados_academicos_cat_grados_fk_foreign` (`cat_grados_fk`);

--
-- Indices de la tabla `integrantes_area_aca`
--
ALTER TABLE `integrantes_area_aca`
  ADD PRIMARY KEY (`idintegrantes_area_aca`),
  ADD KEY `fk_integrantes_area_aca_cat_area_aca1_idx` (`cat_area_aca_ctaa_id`),
  ADD KEY `fk_integrantes_area_aca_docente1_idx` (`docente_dc_codigo`);

--
-- Indices de la tabla `integrantes_comision`
--
ALTER TABLE `integrantes_comision`
  ADD PRIMARY KEY (`idintegrantes_comision`),
  ADD KEY `fk_integrantes_comision_comision_cuerpos_colegiados1_idx` (`comision_cuerpos_colegiados_comision_id`),
  ADD KEY `fk_integrantes_comision_docente1_idx` (`docente_dc_codigo`);

--
-- Indices de la tabla `integrantes_unid_acade`
--
ALTER TABLE `integrantes_unid_acade`
  ADD PRIMARY KEY (`idintegrantes_unid_acade`),
  ADD KEY `fk_integrantes_unid_acade_docente1_idx` (`docente_dc_codigo`),
  ADD KEY `fk_integrantes_unid_acade_cat_unid_acade1_idx` (`cat_unid_acade_ctua_id`);

--
-- Indices de la tabla `material_didac`
--
ALTER TABLE `material_didac`
  ADD KEY `material_didac_docente_dc_fk_foreign` (`docente_dc_fk`),
  ADD KEY `material_didac_cat_mat_didac_fk_foreign` (`cat_mat_didac_fk`);

--
-- Indices de la tabla `metodotitulacion`
--
ALTER TABLE `metodotitulacion`
  ADD PRIMARY KEY (`idmetodoTitulacion`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `minutas`
--
ALTER TABLE `minutas`
  ADD PRIMARY KEY (`id_minutas`),
  ADD KEY `fk_minutas_comision_cuerpos_colegiados1_idx` (`minutas_comision_cuerpos_colegiados_comision_id`),
  ADD KEY `fk_minutas_cat_prog_acad1_idx` (`cat_prog_acad_ctpa_id`);

--
-- Indices de la tabla `part_red_inves`
--
ALTER TABLE `part_red_inves`
  ADD KEY `part_red_inves_docente_dc_fk_foreign` (`docente_dc_fk`),
  ADD KEY `part_red_inves_cat_impacto_fk_foreign` (`cat_impacto_fk`);

--
-- Indices de la tabla `premios_distin`
--
ALTER TABLE `premios_distin`
  ADD KEY `premios_distin_docente_dc_fk_foreign` (`docente_dc_fk`);

--
-- Indices de la tabla `prodep`
--
ALTER TABLE `prodep`
  ADD KEY `prodep_docente_dc_fk_foreign` (`docente_dc_fk`);

--
-- Indices de la tabla `productividad`
--
ALTER TABLE `productividad`
  ADD KEY `productividad_docente_dc_fk_foreign` (`docente_dc_fk`),
  ADD KEY `productividad_cat_productos_fk_foreign` (`cat_productos_fk`),
  ADD KEY `productividad_cat_proy_tipo_fk_foreign` (`cat_proy_tipo_fk`),
  ADD KEY `productividad_cat_impacto_fk_foreign` (`cat_impacto_fk`),
  ADD KEY `productividad_cat_prog_acad_fk_foreign` (`cat_prog_acad_fk`);

--
-- Indices de la tabla `prod_proy_reg`
--
ALTER TABLE `prod_proy_reg`
  ADD KEY `prod_proy_reg_docente_dc_fk_foreign` (`docente_dc_fk`),
  ADD KEY `prod_proy_reg_cat_productos_fk_foreign` (`cat_productos_fk`),
  ADD KEY `prod_proy_reg_cat_proy_tipo_fk_foreign` (`cat_proy_tipo_fk`),
  ADD KEY `prod_proy_reg_cat_impacto_fk_foreign` (`cat_impacto_fk`),
  ADD KEY `prod_proy_reg_cat_prog_acad_fk_foreign` (`cat_prog_acad_fk`);

--
-- Indices de la tabla `proy_registrados`
--
ALTER TABLE `proy_registrados`
  ADD KEY `proy_registrados_docente_dc_fk_foreign` (`docente_dc_fk`);

--
-- Indices de la tabla `sis_nac_inv`
--
ALTER TABLE `sis_nac_inv`
  ADD KEY `sis_nac_inv_docente_dc_fk_foreign` (`docente_dc_fk`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `cat_actualizacion`
--
ALTER TABLE `cat_actualizacion`
  MODIFY `cta_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cat_area_aca`
--
ALTER TABLE `cat_area_aca`
  MODIFY `ctaa_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `cat_comision`
--
ALTER TABLE `cat_comision`
  MODIFY `ctc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cat_direcciones`
--
ALTER TABLE `cat_direcciones`
  MODIFY `ctd_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cat_grados`
--
ALTER TABLE `cat_grados`
  MODIFY `ctg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cat_impacto`
--
ALTER TABLE `cat_impacto`
  MODIFY `cti_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cat_mat_didac`
--
ALTER TABLE `cat_mat_didac`
  MODIFY `ctmd_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cat_productos`
--
ALTER TABLE `cat_productos`
  MODIFY `ctp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cat_prog_acad`
--
ALTER TABLE `cat_prog_acad`
  MODIFY `ctpa_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT de la tabla `cat_proy_tipo`
--
ALTER TABLE `cat_proy_tipo`
  MODIFY `ctpt_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cat_tipo_uap`
--
ALTER TABLE `cat_tipo_uap`
  MODIFY `cttua_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cat_unid_acade`
--
ALTER TABLE `cat_unid_acade`
  MODIFY `ctua_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `cat_unid_apren`
--
ALTER TABLE `cat_unid_apren`
  MODIFY `ctuap_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `comision_cuerpos_colegiados`
--
ALTER TABLE `comision_cuerpos_colegiados`
  MODIFY `comision_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `integrantes_area_aca`
--
ALTER TABLE `integrantes_area_aca`
  MODIFY `idintegrantes_area_aca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `integrantes_comision`
--
ALTER TABLE `integrantes_comision`
  MODIFY `idintegrantes_comision` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `integrantes_unid_acade`
--
ALTER TABLE `integrantes_unid_acade`
  MODIFY `idintegrantes_unid_acade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `minutas`
--
ALTER TABLE `minutas`
  MODIFY `id_minutas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `fk_actividad_docente1` FOREIGN KEY (`docente_dc_codigo`) REFERENCES `docente` (`dc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_actividad_minutas1` FOREIGN KEY (`minutas_id_minutas`) REFERENCES `minutas` (`id_minutas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `adicional`
--
ALTER TABLE `adicional`
  ADD CONSTRAINT `adicional_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `administrativo`
--
ALTER TABLE `administrativo`
  ADD CONSTRAINT `administrativo_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD CONSTRAINT `fk_docente_has_egresado_docente1` FOREIGN KEY (`dc_codigo`) REFERENCES `docente` (`dc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carga_horaria`
--
ALTER TABLE `carga_horaria`
  ADD CONSTRAINT `carga_horaria_cat_unid_apren_fk_foreign` FOREIGN KEY (`cat_unid_apren_fk`) REFERENCES `cat_unid_apren` (`ctuap_id`),
  ADD CONSTRAINT `carga_horaria_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `cat_prog_acad`
--
ALTER TABLE `cat_prog_acad`
  ADD CONSTRAINT `cat_prog_acad_cat_unid_acade_fk_foreign` FOREIGN KEY (`cat_unid_acade_fk`) REFERENCES `cat_unid_acade` (`ctua_id`);

--
-- Filtros para la tabla `cat_unid_acade`
--
ALTER TABLE `cat_unid_acade`
  ADD CONSTRAINT `cat_unid_acade_cat_area_fk_foreign` FOREIGN KEY (`cat_area_fk`) REFERENCES `cat_area_aca` (`ctaa_id`);

--
-- Filtros para la tabla `cat_unid_apren`
--
ALTER TABLE `cat_unid_apren`
  ADD CONSTRAINT `cat_unid_apren_cat_prog_acad_fk_foreign` FOREIGN KEY (`cat_prog_acad_fk`) REFERENCES `cat_prog_acad` (`ctpa_id`),
  ADD CONSTRAINT `cat_unid_apren_cat_tipo_uap_fk_foreign` FOREIGN KEY (`cat_tipo_uap_fk`) REFERENCES `cat_tipo_uap` (`cttua_id`);

--
-- Filtros para la tabla `comision_cuerpos_colegiados`
--
ALTER TABLE `comision_cuerpos_colegiados`
  ADD CONSTRAINT `comision_cat_comision_fk_foreign` FOREIGN KEY (`cat_comision_fk`) REFERENCES `cat_comision` (`ctc_id`),
  ADD CONSTRAINT `fk_comision_cuerpos_colegiados_cat_area_aca1` FOREIGN KEY (`cat_area_aca_ctaa_id`) REFERENCES `cat_area_aca` (`ctaa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comision_cuerpos_colegiados_cat_unid_acade1` FOREIGN KEY (`cat_unid_acade_ctua_id`) REFERENCES `cat_unid_acade` (`ctua_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cuerpo_acad`
--
ALTER TABLE `cuerpo_acad`
  ADD CONSTRAINT `cuerpo_acad_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `direcciones_cat_direcciones_fk_foreign` FOREIGN KEY (`cat_direcciones_fk`) REFERENCES `cat_direcciones` (`ctd_id`),
  ADD CONSTRAINT `direcciones_cat_prog_acad_fk_foreign` FOREIGN KEY (`cat_prog_acad_fk`) REFERENCES `cat_prog_acad` (`ctpa_id`),
  ADD CONSTRAINT `direcciones_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `docencia`
--
ALTER TABLE `docencia`
  ADD CONSTRAINT `docencia_cat_grados_fk_foreign` FOREIGN KEY (`cat_grados_fk`) REFERENCES `cat_grados` (`ctg_id`),
  ADD CONSTRAINT `docencia_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `egresado`
--
ALTER TABLE `egresado`
  ADD CONSTRAINT `fk_egresado_cat_prog_acad1` FOREIGN KEY (`ctpa_id`) REFERENCES `cat_prog_acad` (`ctpa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresado_metodoTitulacion1` FOREIGN KEY (`idmetodoTitulacion`) REFERENCES `metodotitulacion` (`idmetodoTitulacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estan_acad`
--
ALTER TABLE `estan_acad`
  ADD CONSTRAINT `estan_acad_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `est_des_per`
--
ALTER TABLE `est_des_per`
  ADD CONSTRAINT `est_des_per_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `exp_profesional`
--
ALTER TABLE `exp_profesional`
  ADD CONSTRAINT `exp_profesional_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `formacion`
--
ALTER TABLE `formacion`
  ADD CONSTRAINT `formacion_cat_actualizacion_fk_foreign` FOREIGN KEY (`cat_actualizacion_fk`) REFERENCES `cat_actualizacion` (`cta_id`),
  ADD CONSTRAINT `formacion_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `grados_academicos`
--
ALTER TABLE `grados_academicos`
  ADD CONSTRAINT `grados_academicos_cat_grados_fk_foreign` FOREIGN KEY (`cat_grados_fk`) REFERENCES `cat_grados` (`ctg_id`),
  ADD CONSTRAINT `grados_academicos_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `integrantes_area_aca`
--
ALTER TABLE `integrantes_area_aca`
  ADD CONSTRAINT `fk_integrantes_area_aca_cat_area_aca1` FOREIGN KEY (`cat_area_aca_ctaa_id`) REFERENCES `cat_area_aca` (`ctaa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_integrantes_area_aca_docente1` FOREIGN KEY (`docente_dc_codigo`) REFERENCES `docente` (`dc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `integrantes_comision`
--
ALTER TABLE `integrantes_comision`
  ADD CONSTRAINT `fk_integrantes_comision_comision_cuerpos_colegiados1` FOREIGN KEY (`comision_cuerpos_colegiados_comision_id`) REFERENCES `comision_cuerpos_colegiados` (`comision_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_integrantes_comision_docente1` FOREIGN KEY (`docente_dc_codigo`) REFERENCES `docente` (`dc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `integrantes_unid_acade`
--
ALTER TABLE `integrantes_unid_acade`
  ADD CONSTRAINT `fk_integrantes_unid_acade_cat_unid_acade1` FOREIGN KEY (`cat_unid_acade_ctua_id`) REFERENCES `cat_unid_acade` (`ctua_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_integrantes_unid_acade_docente1` FOREIGN KEY (`docente_dc_codigo`) REFERENCES `docente` (`dc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `material_didac`
--
ALTER TABLE `material_didac`
  ADD CONSTRAINT `material_didac_cat_mat_didac_fk_foreign` FOREIGN KEY (`cat_mat_didac_fk`) REFERENCES `cat_mat_didac` (`ctmd_id`),
  ADD CONSTRAINT `material_didac_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `minutas`
--
ALTER TABLE `minutas`
  ADD CONSTRAINT `fk_minutas_cat_prog_acad1` FOREIGN KEY (`cat_prog_acad_ctpa_id`) REFERENCES `cat_prog_acad` (`ctpa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `part_red_inves`
--
ALTER TABLE `part_red_inves`
  ADD CONSTRAINT `part_red_inves_cat_impacto_fk_foreign` FOREIGN KEY (`cat_impacto_fk`) REFERENCES `cat_impacto` (`cti_id`),
  ADD CONSTRAINT `part_red_inves_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `premios_distin`
--
ALTER TABLE `premios_distin`
  ADD CONSTRAINT `premios_distin_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `prodep`
--
ALTER TABLE `prodep`
  ADD CONSTRAINT `prodep_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `productividad`
--
ALTER TABLE `productividad`
  ADD CONSTRAINT `productividad_cat_impacto_fk_foreign` FOREIGN KEY (`cat_impacto_fk`) REFERENCES `cat_impacto` (`cti_id`),
  ADD CONSTRAINT `productividad_cat_productos_fk_foreign` FOREIGN KEY (`cat_productos_fk`) REFERENCES `cat_productos` (`ctp_id`),
  ADD CONSTRAINT `productividad_cat_prog_acad_fk_foreign` FOREIGN KEY (`cat_prog_acad_fk`) REFERENCES `cat_prog_acad` (`ctpa_id`),
  ADD CONSTRAINT `productividad_cat_proy_tipo_fk_foreign` FOREIGN KEY (`cat_proy_tipo_fk`) REFERENCES `cat_proy_tipo` (`ctpt_id`),
  ADD CONSTRAINT `productividad_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `prod_proy_reg`
--
ALTER TABLE `prod_proy_reg`
  ADD CONSTRAINT `prod_proy_reg_cat_impacto_fk_foreign` FOREIGN KEY (`cat_impacto_fk`) REFERENCES `cat_impacto` (`cti_id`),
  ADD CONSTRAINT `prod_proy_reg_cat_productos_fk_foreign` FOREIGN KEY (`cat_productos_fk`) REFERENCES `cat_productos` (`ctp_id`),
  ADD CONSTRAINT `prod_proy_reg_cat_prog_acad_fk_foreign` FOREIGN KEY (`cat_prog_acad_fk`) REFERENCES `cat_prog_acad` (`ctpa_id`),
  ADD CONSTRAINT `prod_proy_reg_cat_proy_tipo_fk_foreign` FOREIGN KEY (`cat_proy_tipo_fk`) REFERENCES `cat_proy_tipo` (`ctpt_id`),
  ADD CONSTRAINT `prod_proy_reg_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `proy_registrados`
--
ALTER TABLE `proy_registrados`
  ADD CONSTRAINT `proy_registrados_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

--
-- Filtros para la tabla `sis_nac_inv`
--
ALTER TABLE `sis_nac_inv`
  ADD CONSTRAINT `sis_nac_inv_docente_dc_fk_foreign` FOREIGN KEY (`docente_dc_fk`) REFERENCES `docente` (`dc_codigo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
