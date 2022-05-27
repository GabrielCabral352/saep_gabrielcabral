-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Maio-2022 às 16:28
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `techman`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `apiv1_comment`
--

CREATE TABLE `apiv1_comment` (
  `id` bigint(20) NOT NULL,
  `commentDate` date DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `fk_tool_id` bigint(20) NOT NULL,
  `fk_user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `apiv1_comment`
--

INSERT INTO `apiv1_comment` (`id`, `commentDate`, `description`, `fk_tool_id`, `fk_user_id`) VALUES
(3, '2022-05-27', 'Gostei Muito Disso', 8, 1),
(4, '2022-05-27', 'teste 2', 8, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `apiv1_tool`
--

CREATE TABLE `apiv1_tool` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `image` varchar(100) NOT NULL,
  `insertDate` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `cDate` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `apiv1_tool`
--

INSERT INTO `apiv1_tool` (`id`, `name`, `description`, `image`, `insertDate`, `status`, `cDate`) VALUES
(3, 'Torno Mecânico 500mm Modelo BV20L 220V - TTM520 - Tander', '\"O Torno Mecânico Tander TTM520 é uma ferramenta utilizada por vários profissionais na confecção e acabamento de inúmeras peças metálicas, tais como: eixos, polias, pinos, roscas, peças cilíndricas internas e externas, cones, esferas, entre outros.  Este torno vem com motor monofásico de 220V e 550W de potência, o que lhe confere maior torque e vida útil, menor consumo de energia e baixo índice de manutenção.  Possui interruptor magnético com a função de travagem de emergência, rotação frente/re', 'None-Torno_Mecanico_500mm.png', '2022-05-27', 1, '2019-01-10 16:54:21.000000'),
(4, 'Processador Intel Core i9-7920X Skylake, Cache 16.5MB, 2.9GHz (4.3GHz Max Turbo), LGA 2066 - BX80673', 'Com esse processador inovador e incrível você desfruta ao máximo o verdadeiro potencial do seu computador e desfruta da mais pura velocidade. Maximize o seu desempenho seja trabalhando, jogando, navegando ou assistindo o seu filme preferido, com esse processador você pode tudo!', 'None-Intel_Core_i9.png', '2022-05-27', 1, '2019-01-10 17:00:21.000000'),
(5, 'Monitor, Dell, U2518D, UltraSharp, Preto e Suporte em Alumínio, 25\"', 'Dê vida ao seu trabalho com uma tela de 25 polegadas quase sem bordas que conta com detalhes em cores vívidas e consistentes graças a tecnologia hdr, resolução qhd e ângulo de visão ultra-amplo. Aumente sua performance com os recursos dell display manager, dell easy arrange e trabalhe confortavelmente graça a um suporte totalmente ajustável e recurso confortview.', 'None-Monitor_Dell.png', '2022-05-27', 0, '2018-01-10 12:00:20.000000'),
(6, 'All-in-One Media Keyboard', 'O All-in-One Media Keyboard é o dispositivo ideal para sua sala ou home office. Com teclado em tamanho natural e trackpad multitoque integrado, é possível digitar, passar o dedo, arrastar, fazer zoom e clicar facilmente. O teclado com teclas de atalho de mídia personalizáveis permite que a Web e suas músicas, fotos e filmes favoritos estejam a seu alcance. O teclado também tem um design resistente, portanto, não é necessário se preocupar com esbarrões, quedas ou derramamentos comuns. O All-in-On', 'None-Teclado_Microsoft.png', '2022-05-27', 0, '2017-01-10 15:00:00.000000'),
(8, 'Mouse Gamer Razer Deathadder Essential Óptico 5 Botões 4G 6.400 DPI', 'Nada melhor do que um mouse gamer com tecnologia de ponta para qualificar seus comandos e aprimorar suas jogadas nos games. Com este Mouse Gamer Razer, sua atuação nas batalhas gamers serão ainda mais bem-sucedidas, com desempenho acima da média e desenvoltura arrasadora, que vai deixar seus oponentes impressionados. O mouse Razer Deathadder Essential tem sensor óptico de 6400 DPI de 4G, 5 botões, design moderno e ergonômico, especialmente projetado para jogadores destros, e uma empunhadura late', 'None-Mouse_Razer_WQkwtWD.png', '2022-05-27', 1, '2022-05-27 12:22:37.484062');

-- --------------------------------------------------------

--
-- Estrutura da tabela `apiv1_usertech`
--

CREATE TABLE `apiv1_usertech` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `apiv1_usertech`
--

INSERT INTO `apiv1_usertech` (`id`, `name`, `password`) VALUES
(1, 'Comum', 111111),
(2, 'Administrador', 222222),
(3, 'Tecnico', 333333),
(4, 'Gerente', 444444);

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add tool', 7, 'add_tool'),
(26, 'Can change tool', 7, 'change_tool'),
(27, 'Can delete tool', 7, 'delete_tool'),
(28, 'Can view tool', 7, 'view_tool'),
(29, 'Can add user tech', 8, 'add_usertech'),
(30, 'Can change user tech', 8, 'change_usertech'),
(31, 'Can delete user tech', 8, 'delete_usertech'),
(32, 'Can view user tech', 8, 'view_usertech'),
(33, 'Can add comment', 9, 'add_comment'),
(34, 'Can change comment', 9, 'change_comment'),
(35, 'Can delete comment', 9, 'delete_comment'),
(36, 'Can view comment', 9, 'view_comment');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$16BYRubtl5s26pwfRSD4Mc$Kf1YipYDC65b4riMX2++c2v0uAcH6ImLSDGfKJAYkQs=', '2022-05-26 12:23:47.315036', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2022-05-13 12:27:52.056010');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-05-13 13:10:27.379601', '1', 'Comum', 1, '[{\"added\": {}}]', 8, 1),
(2, '2022-05-13 13:11:03.109023', '2', 'Administrador', 1, '[{\"added\": {}}]', 8, 1),
(3, '2022-05-13 13:11:11.595569', '3', 'Tecnico', 1, '[{\"added\": {}}]', 8, 1),
(4, '2022-05-13 13:11:21.591912', '4', 'Gerente', 1, '[{\"added\": {}}]', 8, 1),
(5, '2022-05-13 13:13:52.086386', '1', 'Teste', 1, '[{\"added\": {}}]', 7, 1),
(6, '2022-05-13 13:51:03.305889', '1', 'Teste', 1, '[{\"added\": {}}]', 9, 1),
(7, '2022-05-13 13:51:10.166082', '2', 'Teste', 1, '[{\"added\": {}}]', 9, 1),
(8, '2022-05-27 10:48:14.387539', '1', 'Teste', 3, '', 7, 1),
(9, '2022-05-27 10:56:05.602968', '2', 'Mouse Gamer Razer Deathadder Essential Óptico 5 Botões 4G 6.400 DPI', 1, '[{\"added\": {}}]', 7, 1),
(10, '2022-05-27 11:04:05.476349', '2', 'Mouse Gamer Razer Deathadder Essential Óptico 5 Botões 4G 6.400 DPI', 2, '[{\"changed\": {\"fields\": [\"CDate\"]}}]', 7, 1),
(11, '2022-05-27 11:06:51.541856', '3', 'Torno Mecânico 500mm Modelo BV20L 220V - TTM520 - Tander', 1, '[{\"added\": {}}]', 7, 1),
(12, '2022-05-27 11:07:34.681384', '4', 'Processador Intel Core i9-7920X Skylake, Cache 16.5MB, 2.9GHz (4.3GHz Max Turbo), LGA 2066 - BX80673', 1, '[{\"added\": {}}]', 7, 1),
(13, '2022-05-27 11:08:15.709146', '5', 'Monitor, Dell, U2518D, UltraSharp, Preto e Suporte em Alumínio, 25\"', 1, '[{\"added\": {}}]', 7, 1),
(14, '2022-05-27 11:09:06.785225', '6', 'All-in-One Media Keyboard', 1, '[{\"added\": {}}]', 7, 1),
(15, '2022-05-27 12:19:52.739567', '7', 'teste', 1, '[{\"added\": {}}]', 7, 1),
(16, '2022-05-27 12:22:37.496473', '8', 'Mouse Gamer Razer Deathadder Essential Óptico 5 Botões 4G 6.400 DPI', 1, '[{\"added\": {}}]', 7, 1),
(17, '2022-05-27 12:26:26.606018', '9', 'teste', 1, '[{\"added\": {}}]', 7, 1),
(18, '2022-05-27 12:27:05.294927', '10', 'teste', 1, '[{\"added\": {}}]', 7, 1),
(19, '2022-05-27 13:07:36.869099', '11', 'teste', 1, '[{\"added\": {}}]', 7, 1),
(20, '2022-05-27 13:13:31.104537', '3', 'Gostei Muito Disso', 1, '[{\"added\": {}}]', 9, 1),
(21, '2022-05-27 13:14:18.572595', '4', 'teste 2', 1, '[{\"added\": {}}]', 9, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(9, 'apiv1', 'comment'),
(7, 'apiv1', 'tool'),
(8, 'apiv1', 'usertech'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-13 12:20:44.119311'),
(2, 'auth', '0001_initial', '2022-05-13 12:20:44.908453'),
(3, 'admin', '0001_initial', '2022-05-13 12:20:45.067339'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-13 12:20:45.078032'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-13 12:20:45.087775'),
(6, 'apiv1', '0001_initial', '2022-05-13 12:20:45.299868'),
(7, 'apiv1', '0002_alter_tool_image', '2022-05-13 12:20:45.313399'),
(8, 'contenttypes', '0002_remove_content_type_name', '2022-05-13 12:20:45.415358'),
(9, 'auth', '0002_alter_permission_name_max_length', '2022-05-13 12:20:45.480870'),
(10, 'auth', '0003_alter_user_email_max_length', '2022-05-13 12:20:45.512305'),
(11, 'auth', '0004_alter_user_username_opts', '2022-05-13 12:20:45.522530'),
(12, 'auth', '0005_alter_user_last_login_null', '2022-05-13 12:20:45.568443'),
(13, 'auth', '0006_require_contenttypes_0002', '2022-05-13 12:20:45.575443'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2022-05-13 12:20:45.587604'),
(15, 'auth', '0008_alter_user_username_max_length', '2022-05-13 12:20:45.610458'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2022-05-13 12:20:45.631698'),
(17, 'auth', '0010_alter_group_name_max_length', '2022-05-13 12:20:45.656433'),
(18, 'auth', '0011_update_proxy_permissions', '2022-05-13 12:20:45.668928'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2022-05-13 12:20:45.688492'),
(20, 'sessions', '0001_initial', '2022-05-13 12:20:45.734620'),
(21, 'apiv1', '0003_alter_tool_image_alter_tool_name', '2022-05-27 10:52:04.103243'),
(22, 'apiv1', '0004_alter_tool_description', '2022-05-27 10:55:03.031859'),
(23, 'apiv1', '0005_tool_cdate', '2022-05-27 10:59:07.296838');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9ehxkgjnsgz55pcksgom0jqbrtangkfk', '.eJxVjDsOwjAQBe_iGlnrjeMPJT1nsJzdNQ6gRIqTCnF3iJQC2jcz76VS3taatiZLGlmdlVGn323I9JBpB3zP023WNE_rMg56V_RBm77OLM_L4f4d1Nzqt3Y9W_QBoENwZLmj4voIQWxE7wUilc743nBGxy4SFxoCGIFChGJRvT-4tDdy:1npUOr:8fMaeaolaokEGAqogL24B0G51cNBbsgqkx5WOdGKv0g', '2022-05-27 12:28:05.405495'),
('tsens1ym3k7nukhbeucigcqn0x9tpba5', '.eJxVjDsOwjAQBe_iGlnrjeMPJT1nsJzdNQ6gRIqTCnF3iJQC2jcz76VS3taatiZLGlmdlVGn323I9JBpB3zP023WNE_rMg56V_RBm77OLM_L4f4d1Nzqt3Y9W_QBoENwZLmj4voIQWxE7wUilc743nBGxy4SFxoCGIFChGJRvT-4tDdy:1nuCWp:l1tHxPo2fsrIYOu5ijT4c13v7TFEytv37Y0JV-l7n0s', '2022-06-09 12:23:47.320237');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `apiv1_comment`
--
ALTER TABLE `apiv1_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apiv1_comment_fk_tool_id_d19a5cd7_fk_apiv1_tool_id` (`fk_tool_id`),
  ADD KEY `apiv1_comment_fk_user_id_c18101ef_fk_apiv1_usertech_id` (`fk_user_id`);

--
-- Índices para tabela `apiv1_tool`
--
ALTER TABLE `apiv1_tool`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `apiv1_usertech`
--
ALTER TABLE `apiv1_usertech`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Índices para tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Índices para tabela `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Índices para tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Índices para tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Índices para tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Índices para tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Índices para tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `apiv1_comment`
--
ALTER TABLE `apiv1_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `apiv1_tool`
--
ALTER TABLE `apiv1_tool`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `apiv1_usertech`
--
ALTER TABLE `apiv1_usertech`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `apiv1_comment`
--
ALTER TABLE `apiv1_comment`
  ADD CONSTRAINT `apiv1_comment_fk_tool_id_d19a5cd7_fk_apiv1_tool_id` FOREIGN KEY (`fk_tool_id`) REFERENCES `apiv1_tool` (`id`),
  ADD CONSTRAINT `apiv1_comment_fk_user_id_c18101ef_fk_apiv1_usertech_id` FOREIGN KEY (`fk_user_id`) REFERENCES `apiv1_usertech` (`id`);

--
-- Limitadores para a tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limitadores para a tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limitadores para a tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
