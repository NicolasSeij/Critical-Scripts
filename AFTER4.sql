-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.25-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para afterlife
CREATE DATABASE IF NOT EXISTS `afterlife` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `afterlife`;

-- Volcando estructura para tabla afterlife.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.addon_account: ~8 rows (aproximadamente)
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Livret Bleu', 0),
	('caution', 'caution', 0),
	('society_ambulance', 'EMS', 1),
	('society_banker', 'Banque', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);

-- Volcando estructura para tabla afterlife.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.addon_account_data: ~6 rows (aproximadamente)
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_cardealer', 0, NULL),
	(2, 'society_police', 0, NULL),
	(3, 'society_ambulance', 0, NULL),
	(4, 'society_mechanic', 0, NULL),
	(5, 'society_taxi', 0, NULL),
	(9, 'society_banker', 0, NULL);

-- Volcando estructura para tabla afterlife.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.addon_inventory: ~5 rows (aproximadamente)
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'EMS', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);

-- Volcando estructura para tabla afterlife.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.addon_inventory_items: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.banking
CREATE TABLE IF NOT EXISTS `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.banking: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.billing: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.cardealer_vehicles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.codem-hud-data
CREATE TABLE IF NOT EXISTS `codem-hud-data` (
  `identifier` varchar(46) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `stress` int(11) DEFAULT NULL,
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.codem-hud-data: ~0 rows (aproximadamente)
INSERT INTO `codem-hud-data` (`identifier`, `data`, `stress`) VALUES
	('char1:867df0c491ce807a7b773cec971241d548e47bbe', '{"speedtype":"kmh","showCompass":true,"hide":false,"positionsData":[],"maptype":"rectangle","hideBoxData":{"hunger":100,"armor":100,"health":100,"stamina":100,"water":100,"stress":100},"showHideBox":false,"hudSize":1.0,"hud":"radial","speedometerSize":0.7,"hudColors":{"radial":{"oxy":"#48A7FFac","health":"#FF4848ac","altitude":"#00FFF0ac","stress":"#48A7FFac","hunger":"#FFA048ac","armor":"#FFFFFFac","thirst":"#4886FFac","stamina":"#C4FF48ac","parachute":"#48FFBDac","nitro":"#AFFF48ac"},"text":{"oxy":"#48A7FFac","health":"#FF4848ac","altitude":"#00FFF0ac","stress":"#48A7FFac","hunger":"#FFA048ac","armor":"#FFFFFFac","thirst":"#4886FFac","stamina":"#C4FF48ac","parachute":"#48FFBDac","nitro":"#AFFF48ac"},"classic":{"oxy":"#48A7FFac","health":"#9F2929","altitude":"#48deff","stress":"#AA35A6","hunger":"#B3743A","armor":"#2E3893","thirst":"#2F549C","stamina":"#c4ff48","parachute":"#48ffde","nitro":"#8eff48"}},"refreshRate":200}', 0);

-- Volcando estructura para tabla afterlife.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.datastore: ~9 rows (aproximadamente)
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);

-- Volcando estructura para tabla afterlife.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.datastore_data: ~15 rows (aproximadamente)
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_police', NULL, '{}'),
	(2, 'society_ambulance', NULL, '{}'),
	(3, 'society_mechanic', NULL, '{}'),
	(4, 'society_taxi', NULL, '{}'),
	(5, 'property', NULL, '{}'),
	(6, 'property', NULL, '{}'),
	(7, 'property', NULL, '{}'),
	(8, 'property', NULL, '{}'),
	(14, 'property', NULL, '{}'),
	(15, 'property', NULL, '{}'),
	(16, 'property', NULL, '{}'),
	(17, 'property', NULL, '{}'),
	(18, 'property', NULL, '{}'),
	(19, 'property', NULL, '{}'),
	(20, 'property', NULL, '{}');

-- Volcando estructura para tabla afterlife.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.fine_types: ~52 rows (aproximadamente)
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Mal uso del claxon', 3000, 0),
	(2, 'Cruzar indebidamente la línea continua', 4000, 0),
	(3, 'Conducir por el lado incorrecto de la carretera', 2500, 0),
	(4, 'Giro indebido', 2500, 0),
	(5, 'Conducir indebidamente fuera de la carretera', 1700, 0),
	(6, 'No hacer caso a una orden de un agente', 300, 0),
	(7, 'Detener el vehículo de forma incorrecta', 1500, 0),
	(8, 'Aparcar en un lugar no habilitado', 7000, 0),
	(9, 'No ceder al girar a la derecha', 7000, 0),
	(10, 'No cumplir con los datos de tu vehículo', 9000, 0),
	(11, 'No pararse en una señal de STOP', 1050, 0),
	(12, 'No pararse en un semáforo cuando está en rojo', 1300, 0),
	(13, 'Cruzar indebidamente', 1000, 0),
	(14, 'Conducir un coche no permitido', 1000, 0),
	(15, 'Conducir sin carnet de conducción', 15000, 0),
	(16, 'Chocar y darse a la fuga', 8000, 0),
	(17, 'Exceder la velocidad permitida en 5 km/h', 900, 0),
	(18, 'Exceder la velocidad permitida entre 5 y 15 km/h', 1200, 0),
	(19, 'Exceder la velocidad permitida entre 15 y 30 km/h', 1800, 0),
	(20, 'Exceder la velocidad permitida más de 30 km/h', 3000, 0),
	(21, 'Generar atasco en una carretera', 1100, 1),
	(22, 'Intoxicación pública', 9000, 1),
	(23, 'Conducta alocada', 9000, 1),
	(24, 'Obstrucción a la justicia', 13000, 1),
	(25, 'Insultos hacia civiles', 7500, 1),
	(26, 'Insultos hacia un agente', 11000, 1),
	(27, 'Amenaza verbar a un civil', 9000, 1),
	(28, 'Amenaza verbal a un agente', 15000, 1),
	(29, 'Dar información falsa', 25000, 1),
	(30, 'Intento de corrupción', 150000, 1),
	(31, 'Tendencia de armas en los limites de la ciudad', 12000, 2),
	(32, 'Tendencia de armas letales en los limites de la ciudad', 30000, 2),
	(33, 'No tener licencia de armas', 60000, 2),
	(34, 'Posesión de un arma ilegal', 70000, 2),
	(35, 'Posesión de herramientas para robos', 30000, 2),
	(36, 'Desorden público', 18000, 2),
	(37, 'Intento de venta o distribución de sustancias ilegales', 15000, 2),
	(38, 'Fabricación de sustancias ilegales', 15000, 2),
	(39, 'Posesión de sustancias ilegales', 65000, 2),
	(40, 'Secuestro de un civil', 45000, 2),
	(41, 'Secuestro de un agente', 60000, 2),
	(42, 'Robo', 6500, 2),
	(43, 'Robo armado a una tienda', 15000, 2),
	(44, 'Robo armado a un banco', 45000, 2),
	(45, 'Asalto a un civil', 20000, 3),
	(46, 'Asalto a un agente', 45000, 3),
	(47, 'Intento de asesinato a un civil', 30000, 3),
	(48, 'Intento de asesinato a un agente', 50000, 3),
	(49, 'Asesinato de un civil', 10000, 3),
	(50, 'Asesinato de un policia', 80000, 3),
	(51, 'Homicidio involuntario', 38000, 3),
	(52, 'Fraude', 70000, 2);

-- Volcando estructura para tabla afterlife.guille_gangsv2
CREATE TABLE IF NOT EXISTS `guille_gangsv2` (
  `gang` varchar(50) DEFAULT NULL,
  `maxmembers` int(11) DEFAULT NULL,
  `ranks` longtext DEFAULT NULL,
  `gangStyle` int(11) DEFAULT NULL,
  `colors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `vehicles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `points` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `members` mediumtext DEFAULT NULL,
  `shop` longtext DEFAULT NULL,
  `inventory` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.guille_gangsv2: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.items: ~39 rows (aproximadamente)
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('alive_chicken', 'Living chicken', 1, 0, 1),
	('bandage', 'Bandage', 2, 0, 1),
	('blowpipe', 'Blowtorch', 2, 0, 1),
	('bread', 'Bread', 1, 0, 1),
	('canap', 'Caña de Pescar', 1, 0, 1),
	('cannabis', 'Cannabis', 3, 0, 1),
	('carokit', 'Body Kit', 3, 0, 1),
	('carotool', 'Tools', 2, 0, 1),
	('clothe', 'Cloth', 1, 0, 1),
	('contract', 'Contrato', 1, 0, 1),
	('copper', 'Copper', 1, 0, 1),
	('cutted_wood', 'Cut wood', 1, 0, 1),
	('diamond', 'Diamond', 1, 0, 1),
	('essence', 'Gas', 1, 0, 1),
	('fabric', 'Fabric', 1, 0, 1),
	('fish', 'Fish', 1, 0, 1),
	('fixkit', 'Repair Kit', 3, 0, 1),
	('fixtool', 'Repair Tools', 2, 0, 1),
	('fiz', 'Pescado Fresco', 1, 0, 1),
	('gazbottle', 'Gas Bottle', 2, 0, 1),
	('gold', 'Gold', 1, 0, 1),
	('gps', 'GPS', 1, 0, 1),
	('iron', 'Iron', 1, 0, 1),
	('jewels', 'Joyas', -1, 0, 1),
	('marijuana', 'Marijuana', 2, 0, 1),
	('medikit', 'Medikit', 2, 0, 1),
	('packaged_chicken', 'Chicken fillet', 1, 0, 1),
	('packaged_plank', 'Packaged wood', 1, 0, 1),
	('petrol', 'Oil', 1, 0, 1),
	('petrol_raffin', 'Processed oil', 1, 0, 1),
	('phone', 'Phone', 1, 0, 1),
	('radio', 'Radio', 1, 0, 1),
	('repairkit', 'Kit De Reparaciones', 3, 0, 1),
	('slaughtered_chicken', 'Slaughtered chicken', 1, 0, 1),
	('stancer', 'Kit Suspencion', 1, 0, 1),
	('stone', 'Stone', 1, 0, 1),
	('washed_stone', 'Washed stone', 1, 0, 1),
	('water', 'Water', 1, 0, 1),
	('wood', 'Wood', 1, 0, 1),
	('wool', 'Wool', 1, 0, 1);

-- Volcando estructura para tabla afterlife.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.jobs: ~17 rows (aproximadamente)
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'EMS', 1),
	('banker', 'Banquero', 1),
	('cardealer', 'Cardealer', 1),
	('fisherman', 'Pescador', 0),
	('fueler', 'Petrolero', 0),
	('lumberjack', 'Leñador', 0),
	('mechanic', 'Mecanico', 1),
	('miner', 'Minero', 0),
	('offambulance', 'Off-Service', 1),
	('offmechanic', 'Off-Service', 1),
	('offpolice', 'Off-Service', 1),
	('police', 'Policia', 1),
	('reporter', 'Reportero', 0),
	('slaughterer', 'Carnicero', 0),
	('tailor', 'Sastre', 0),
	('taxi', 'Taxi', 0),
	('unemployed', 'Desempleado', 0);

-- Volcando estructura para tabla afterlife.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.job_grades: ~50 rows (aproximadamente)
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Desempleado', 1250, '{}', '{}'),
	(2, 'police', 0, 'recruit', 'Recluta', 10000, '{}', '{}'),
	(3, 'police', 1, 'officer', 'Oficial', 20000, '{}', '{}'),
	(4, 'police', 2, 'sergeant', 'Sargento', 25000, '{}', '{}'),
	(5, 'police', 3, 'lieutenant', 'Teniente', 35000, '{}', '{}'),
	(6, 'police', 4, 'boss', 'Capitan', 45000, '{}', '{}'),
	(11, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
	(12, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(13, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
	(14, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(15, 'lumberjack', 0, 'employee', 'Employee', 2000, '{}', '{}'),
	(16, 'fisherman', 0, 'employee', 'Employee', 2000, '{}', '{}'),
	(17, 'fueler', 0, 'employee', 'Employee', 2000, '{}', '{}'),
	(18, 'reporter', 0, 'employee', 'Employee', 2000, '{}', '{}'),
	(19, 'tailor', 0, 'employee', 'Employee', 2000, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(20, 'miner', 0, 'employee', 'Employee', 2000, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(21, 'slaughterer', 0, 'employee', 'Employee', 2000, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(22, 'ambulance', 0, 'ambulance', 'Novato', 30000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(23, 'ambulance', 1, 'doctor', 'Doctor', 40000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(24, 'ambulance', 2, 'chief_doctor', 'Experimentado', 50000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(25, 'ambulance', 3, 'boss', 'Cirujano', 60000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(26, 'mechanic', 0, 'recrue', 'Recluta', 12000, '{}', '{}'),
	(27, 'mechanic', 1, 'novice', 'Novato', 20000, '{}', '{}'),
	(28, 'mechanic', 2, 'experimente', 'Experimentado', 24000, '{}', '{}'),
	(29, 'mechanic', 3, 'chief', 'SubJefe', 32000, '{}', '{}'),
	(30, 'mechanic', 4, 'boss', 'Lider', 38000, '{}', '{}'),
	(31, 'taxi', 0, 'recrue', 'Recluta', 9000, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(32, 'taxi', 1, 'novice', 'Novato', 12000, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(33, 'taxi', 2, 'experimente', 'Experimentado', 14000, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(34, 'taxi', 3, 'uber', 'SubJefe', 15000, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(35, 'taxi', 4, 'boss', 'Jefe', 16000, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(36, 'banker', 0, 'advisor', 'Conseiller', 10, '{}', '{}'),
	(37, 'banker', 1, 'banker', 'Banquier', 20, '{}', '{}'),
	(38, 'banker', 2, 'business_banker', 'Banquier d\'affaire', 30, '{}', '{}'),
	(39, 'banker', 3, 'trader', 'Trader', 40, '{}', '{}'),
	(40, 'banker', 4, 'boss', 'Patron', 0, '{}', '{}'),
	(41, 'offpolice', 0, 'recruit', 'Recluta', 5000, '{}', '{}'),
	(42, 'offpolice', 1, 'officer', 'Oficial', 5000, '{}', '{}'),
	(43, 'offpolice', 2, 'sergeant', 'Sargento', 5000, '{}', '{}'),
	(44, 'offpolice', 3, 'lieutenant', 'Teniente', 5000, '{}', '{}'),
	(45, 'offpolice', 4, 'boss', 'Comisario', 5000, '{}', '{}'),
	(46, 'offambulance', 0, 'ambulance', 'Novato', 5000, '{}', '{}'),
	(47, 'offambulance', 1, 'doctor', 'Doctor', 5000, '{}', '{}'),
	(48, 'offambulance', 2, 'chief_doctor', 'Experimentado', 5000, '{}', '{}'),
	(49, 'offambulance', 3, 'boss', 'Jefe', 5000, '{}', '{}'),
	(50, 'offmechanic', 0, 'recrue', 'Recruit', 5000, '{}', '{}'),
	(51, 'offmechanic', 1, 'novice', 'Oficla', 5000, '{}', '{}'),
	(52, 'offmechanic', 2, 'experimente', 'Experimentado', 5000, '{}', '{}'),
	(53, 'offmechanic', 3, 'chief', 'Sub-Jefe', 5000, '{}', '{}'),
	(54, 'offmechanic', 4, 'boss', 'Jefe', 5000, '{}', '{}');

-- Volcando estructura para tabla afterlife.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.licenses: ~5 rows (aproximadamente)
INSERT INTO `licenses` (`type`, `label`) VALUES
	('dmv', 'Driving Permit'),
	('drive', 'Licencia De Conducir'),
	('drive_bike', 'Licencia De Moto'),
	('drive_truck', 'Licencia Comercial'),
	('weed_processing', 'Licencia De Marihuana');

-- Volcando estructura para tabla afterlife.multicharacter_slots
CREATE TABLE IF NOT EXISTS `multicharacter_slots` (
  `identifier` varchar(46) NOT NULL,
  `slots` int(11) NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  KEY `slots` (`slots`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.multicharacter_slots: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_calls
CREATE TABLE IF NOT EXISTS `npwd_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `transmitter` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `is_accepted` tinyint(4) DEFAULT 0,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_calls: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_darkchat_channels
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_identifier` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `darkchat_channels_channel_identifier_uindex` (`channel_identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_darkchat_channels: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_darkchat_channel_members
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channel_members` (
  `channel_id` int(11) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `is_owner` tinyint(4) NOT NULL DEFAULT 0,
  KEY `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_darkchat_channel_members: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_darkchat_messages
CREATE TABLE IF NOT EXISTS `npwd_darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_image` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `darkchat_messages_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `darkchat_messages_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_darkchat_messages: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_marketplace_listings
CREATE TABLE IF NOT EXISTS `npwd_marketplace_listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reported` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_marketplace_listings: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_match_profiles
CREATE TABLE IF NOT EXISTS `npwd_match_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `name` varchar(90) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(512) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '',
  `voiceMessage` varchar(512) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_match_profiles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_match_views
CREATE TABLE IF NOT EXISTS `npwd_match_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `profile` int(11) NOT NULL,
  `liked` tinyint(4) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `match_profile_idx` (`profile`),
  KEY `identifier` (`identifier`),
  CONSTRAINT `match_profile` FOREIGN KEY (`profile`) REFERENCES `npwd_match_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_match_views: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_messages
CREATE TABLE IF NOT EXISTS `npwd_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(512) NOT NULL,
  `user_identifier` varchar(48) NOT NULL,
  `conversation_id` varchar(512) NOT NULL,
  `isRead` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `author` varchar(255) NOT NULL,
  `is_embed` tinyint(4) NOT NULL DEFAULT 0,
  `embed` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_identifier` (`user_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_messages: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_messages_conversations
CREATE TABLE IF NOT EXISTS `npwd_messages_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_list` varchar(225) NOT NULL,
  `label` varchar(60) DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_message_id` int(11) DEFAULT NULL,
  `is_group_chat` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_messages_conversations: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_messages_participants
CREATE TABLE IF NOT EXISTS `npwd_messages_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `participant` varchar(225) NOT NULL,
  `unread_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `message_participants_npwd_messages_conversations_id_fk` (`conversation_id`) USING BTREE,
  CONSTRAINT `message_participants_npwd_messages_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `npwd_messages_conversations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_messages_participants: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_notes
CREATE TABLE IF NOT EXISTS `npwd_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_notes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_phone_contacts
CREATE TABLE IF NOT EXISTS `npwd_phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `display` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_phone_contacts: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_phone_gallery
CREATE TABLE IF NOT EXISTS `npwd_phone_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_phone_gallery: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_twitter_likes
CREATE TABLE IF NOT EXISTS `npwd_twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_twitter_likes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_twitter_profiles
CREATE TABLE IF NOT EXISTS `npwd_twitter_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(90) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT 'https://i.file.glass/QrEvq.png',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_name_UNIQUE` (`profile_name`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_twitter_profiles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_twitter_reports
CREATE TABLE IF NOT EXISTS `npwd_twitter_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `report_profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `report_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_twitter_reports: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.npwd_twitter_tweets
CREATE TABLE IF NOT EXISTS `npwd_twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(46) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `images` varchar(1000) DEFAULT '',
  `retweet` int(11) DEFAULT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` (`profile_id`) USING BTREE,
  CONSTRAINT `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.npwd_twitter_tweets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.owned_properties
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(46) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla afterlife.owned_properties: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(46) DEFAULT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT '',
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT NULL,
  `pound` varchar(60) DEFAULT NULL,
  `damages` longtext DEFAULT NULL,
  `garage` varchar(255) NOT NULL DEFAULT 'square',
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.owned_vehicles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.ox_inventory
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(46) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.ox_inventory: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entering` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inside` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outside` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ipls` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '[]',
  `gateway` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla afterlife.properties: ~72 rows (aproximadamente)
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{"y":564.89,"z":182.959,"x":119.384}', '{"x":117.347,"y":559.506,"z":183.304}', '{"y":557.032,"z":183.301,"x":118.037}', '{"y":567.798,"z":182.131,"x":119.249}', '[]', NULL, 1, 1, 0, '{"x":118.748,"y":566.573,"z":175.697}', 1500000),
	(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{"x":372.796,"y":428.327,"z":144.685}', '{"x":373.548,"y":422.982,"z":144.907}', '{"y":420.075,"z":145.904,"x":372.161}', '{"x":372.454,"y":432.886,"z":143.443}', '[]', NULL, 1, 1, 0, '{"x":377.349,"y":429.422,"z":137.3}', 1500000),
	(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{"y":-379.165,"z":37.961,"x":-936.363}', '{"y":-365.476,"z":113.274,"x":-913.097}', '{"y":-367.637,"z":113.274,"x":-918.022}', '{"y":-382.023,"z":37.961,"x":-943.626}', '[]', NULL, 1, 1, 0, '{"x":-927.554,"y":-377.744,"z":112.674}', 1700000),
	(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{"y":440.8,"z":146.702,"x":346.964}', '{"y":437.456,"z":148.394,"x":341.683}', '{"y":435.626,"z":148.394,"x":339.595}', '{"x":350.535,"y":443.329,"z":145.764}', '[]', NULL, 1, 1, 0, '{"x":337.726,"y":436.985,"z":140.77}', 1500000),
	(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{"y":502.696,"z":136.421,"x":-176.003}', '{"y":497.817,"z":136.653,"x":-174.349}', '{"y":495.069,"z":136.666,"x":-173.331}', '{"y":506.412,"z":135.0664,"x":-177.927}', '[]', NULL, 1, 1, 0, '{"x":-174.725,"y":493.095,"z":129.043}', 1500000),
	(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{"y":596.58,"z":142.641,"x":-686.554}', '{"y":591.988,"z":144.392,"x":-681.728}', '{"y":590.608,"z":144.392,"x":-680.124}', '{"y":599.019,"z":142.059,"x":-689.492}', '[]', NULL, 1, 1, 0, '{"x":-680.46,"y":588.6,"z":136.769}', 1500000),
	(7, 'LowEndApartment', 'Basic apartment', '{"y":-1078.735,"z":28.4031,"x":292.528}', '{"y":-1007.152,"z":-102.002,"x":265.845}', '{"y":-1002.802,"z":-100.008,"x":265.307}', '{"y":-1078.669,"z":28.401,"x":296.738}', '[]', NULL, 1, 1, 0, '{"x":265.916,"y":-999.38,"z":-100.008}', 562500),
	(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{"y":454.955,"z":96.462,"x":-1294.433}', '{"x":-1289.917,"y":449.541,"z":96.902}', '{"y":446.322,"z":96.899,"x":-1289.642}', '{"y":455.453,"z":96.517,"x":-1298.851}', '[]', NULL, 1, 1, 0, '{"x":-1287.306,"y":455.901,"z":89.294}', 1500000),
	(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{"x":-853.346,"y":696.678,"z":147.782}', '{"y":690.875,"z":151.86,"x":-859.961}', '{"y":688.361,"z":151.857,"x":-859.395}', '{"y":701.628,"z":147.773,"x":-855.007}', '[]', NULL, 1, 1, 0, '{"x":-858.543,"y":697.514,"z":144.253}', 1500000),
	(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{"y":620.494,"z":141.588,"x":-752.82}', '{"y":618.62,"z":143.153,"x":-759.317}', '{"y":617.629,"z":143.153,"x":-760.789}', '{"y":621.281,"z":141.254,"x":-750.919}', '[]', NULL, 1, 1, 0, '{"x":-762.504,"y":618.992,"z":135.53}', 1500000),
	(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{"y":37.025,"z":42.58,"x":-618.299}', '{"y":58.898,"z":97.2,"x":-603.301}', '{"y":58.941,"z":97.2,"x":-608.741}', '{"y":30.603,"z":42.524,"x":-620.017}', '[]', NULL, 1, 1, 0, '{"x":-622.173,"y":54.585,"z":96.599}', 1700000),
	(12, 'MiltonDrive', 'Milton Drive', '{"x":-775.17,"y":312.01,"z":84.658}', NULL, NULL, '{"x":-775.346,"y":306.776,"z":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
	(13, 'Modern1Apartment', 'Modern Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_01_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.661,"y":327.672,"z":210.396}', 1300000),
	(14, 'Modern2Apartment', 'Modern Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_01_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.735,"y":326.757,"z":186.313}', 1300000),
	(15, 'Modern3Apartment', 'Modern Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_01_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.386,"y":330.782,"z":195.08}', 1300000),
	(16, 'Mody1Apartment', 'Mody Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_02_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.615,"y":327.878,"z":210.396}', 1300000),
	(17, 'Mody2Apartment', 'Mody Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_02_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.297,"y":327.092,"z":186.313}', 1300000),
	(18, 'Mody3Apartment', 'Mody Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_02_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.303,"y":330.932,"z":195.085}', 1300000),
	(19, 'Vibrant1Apartment', 'Vibrant Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_03_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.885,"y":327.641,"z":210.396}', 1300000),
	(20, 'Vibrant2Apartment', 'Vibrant Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_03_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.607,"y":327.344,"z":186.313}', 1300000),
	(21, 'Vibrant3Apartment', 'Vibrant Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_03_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.525,"y":330.851,"z":195.085}', 1300000),
	(22, 'Sharp1Apartment', 'Sharp Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_04_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.527,"y":327.89,"z":210.396}', 1300000),
	(23, 'Sharp2Apartment', 'Sharp Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_04_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.642,"y":326.497,"z":186.313}', 1300000),
	(24, 'Sharp3Apartment', 'Sharp Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_04_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.503,"y":331.318,"z":195.085}', 1300000),
	(25, 'Monochrome1Apartment', 'Monochrome Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_05_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.289,"y":328.086,"z":210.396}', 1300000),
	(26, 'Monochrome2Apartment', 'Monochrome Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_05_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.692,"y":326.762,"z":186.313}', 1300000),
	(27, 'Monochrome3Apartment', 'Monochrome Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_05_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.094,"y":330.976,"z":195.085}', 1300000),
	(28, 'Seductive1Apartment', 'Seductive Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_06_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.263,"y":328.104,"z":210.396}', 1300000),
	(29, 'Seductive2Apartment', 'Seductive Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_06_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.655,"y":326.611,"z":186.313}', 1300000),
	(30, 'Seductive3Apartment', 'Seductive Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_06_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.3,"y":331.414,"z":195.085}', 1300000),
	(31, 'Regal1Apartment', 'Regal Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_07_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.956,"y":328.257,"z":210.396}', 1300000),
	(32, 'Regal2Apartment', 'Regal Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_07_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.545,"y":326.659,"z":186.313}', 1300000),
	(33, 'Regal3Apartment', 'Regal Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_07_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.087,"y":331.429,"z":195.123}', 1300000),
	(34, 'Aqua1Apartment', 'Aqua Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_08_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.187,"y":328.47,"z":210.396}', 1300000),
	(35, 'Aqua2Apartment', 'Aqua Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_08_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.658,"y":326.563,"z":186.313}', 1300000),
	(36, 'Aqua3Apartment', 'Aqua Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_08_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.287,"y":331.084,"z":195.086}', 1300000),
	(37, 'IntegrityWay', '4 Integrity Way', '{"x":-47.804,"y":-585.867,"z":36.956}', NULL, NULL, '{"x":-54.178,"y":-583.762,"z":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
	(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{"x":-31.409,"y":-594.927,"z":79.03}', '{"x":-26.098,"y":-596.909,"z":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-11.923,"y":-597.083,"z":78.43}', 1700000),
	(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{"x":-17.702,"y":-588.524,"z":89.114}', '{"x":-16.21,"y":-582.569,"z":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-26.327,"y":-588.384,"z":89.123}', 1700000),
	(40, 'DellPerroHeights', 'Dell Perro Heights', '{"x":-1447.06,"y":-538.28,"z":33.74}', NULL, NULL, '{"x":-1440.022,"y":-548.696,"z":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
	(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{"x":-1452.125,"y":-540.591,"z":73.044}', '{"x":-1455.435,"y":-535.79,"z":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1467.058,"y":-527.571,"z":72.443}', 1700000),
	(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{"x":-1451.562,"y":-523.535,"z":55.928}', '{"x":-1456.02,"y":-519.209,"z":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1457.026,"y":-530.219,"z":55.937}', 1700000),
	(43, 'MazeBankBuilding', 'Maze Bank Building', '{"x":-79.18,"y":-795.92,"z":43.35}', NULL, NULL, '{"x":-72.50,"y":-786.92,"z":43.40}', '[]', NULL, 0, 0, 1, NULL, 0),
	(44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(47, 'ExecutiveRich', 'Executive Rich', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(48, 'ExecutiveCool', 'Executive Cool', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(53, 'LomBank', 'Lom Bank', '{"x":-1581.36,"y":-558.23,"z":34.07}', NULL, NULL, '{"x":-1583.60,"y":-555.12,"z":34.07}', '[]', NULL, 0, 0, 1, NULL, 0),
	(54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(63, 'MazeBankWest', 'Maze Bank West', '{"x":-1379.58,"y":-499.63,"z":32.22}', NULL, NULL, '{"x":-1378.95,"y":-502.82,"z":32.22}', '[]', NULL, 0, 0, 1, NULL, 0),
	(64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000);

-- Volcando estructura para tabla afterlife.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.rented_vehicles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.society_moneywash: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(46) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `pincode` int(11) DEFAULT NULL,
  `secondjob` varchar(32) NOT NULL DEFAULT 'unemployed',
  `secondjob_grade` varchar(32) NOT NULL DEFAULT '0',
  `phone_number` varchar(20) DEFAULT NULL,
  `avatar` mediumtext DEFAULT NULL,
  `comserv` text DEFAULT '',
  `jail` text DEFAULT '',
  `ban` text DEFAULT '',
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.users: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.user_contacts
CREATE TABLE IF NOT EXISTS `user_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_contacts_identifier_name_number` (`identifier`,`name`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.user_contacts: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.user_licenses: ~0 rows (aproximadamente)

-- Volcando estructura para tabla afterlife.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.vehicles: ~224 rows (aproximadamente)
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('8c', '8c', 2200000, 'alfa'),
	('gtam21', 'gtam21', 3520000, 'alfa'),
	('stelvio', 'stelvio', 2965000, 'alfa'),
	('alfmito', 'alfmito', 750000, 'alfa'),
	('8c', '8c', 2200000, 'alfa'),
	('gtam21', 'gtam21', 3520000, 'alfa'),
	('stelvio', 'stelvio', 2965000, 'alfa'),
	('alfmito', 'alfmito', 750000, 'alfa'),
	('8c', '8c', 2200000, 'alfa'),
	('gtam21', 'gtam21', 3520000, 'alfa'),
	('stelvio', 'stelvio', 2965000, 'alfa'),
	('alfmito', 'alfmito', 750000, 'alfa'),
	('8c', '8c', 2200000, 'alfa'),
	('gtam21', 'gtam21', 3520000, 'alfa'),
	('stelvio', 'stelvio', 2965000, 'alfa'),
	('alfmito', 'alfmito', 750000, 'alfa'),
	('8c', '8c', 2200000, 'alfa'),
	('gtam21', 'gtam21', 3520000, 'alfa'),
	('stelvio', 'stelvio', 2965000, 'alfa'),
	('alfmito', 'alfmito', 750000, 'alfa'),
	('8c', '8c', 2200000, 'alfa'),
	('gtam21', 'gtam21', 3520000, 'alfa'),
	('stelvio', 'stelvio', 2965000, 'alfa'),
	('alfmito', 'alfmito', 750000, 'alfa'),
	('ie', 'ie', 8750000, 'race'),
	('gmscarabeo', 'gmscarabeo', 2500, 'motos'),
	('rsv4', 'rsv4', 2750000, 'motos'),
	('a8fsi', 'a8fsi', 2000000, 'audi'),
	('ocnetrongt', 'ocnetrongt', 3540000, 'audi'),
	('audsq517', 'audsq517', 1375000, 'audi'),
	('q820', 'q820', 3000000, 'audi'),
	('lummaq8', 'lummaq8', 4500000, 'audi'),
	('r820', 'r820', 6540000, 'audi'),
	('rs3202', 'rs3202', 2530000, 'audi'),
	('rs3', 'rs3', 1875000, 'audi'),
	('rs3lms', 'rs3lms', 5000000, 'race'),
	('rs4b7', 'rs4b7', 820000, 'audi'),
	('rs520', 'rs520', 3500000, 'audi'),
	('rs5', 'rs5', 2500000, 'audi'),
	('RS62', 'RS62', 3500000, 'audi'),
	('rs6sedan', 'rs6sedan', 2600000, 'audi'),
	('rs7c821', 'rs7c821', 6500000, 'audi'),
	('s1', 's1', 95000, 'audi'),
	('s3', 's3', 120000, 'audi'),
	('tts', 'tts', 2630000, 'audi'),
	('bmw1er', 'bmw1er', 450000, 'bmw'),
	('850', '850', 1950000, 'bmw'),
	('m3e30', 'm3e30', 900000, 'bmw'),
	('m3e36', 'm3e36', 1520000, 'bmw'),
	('m3e46', 'm3e46', 1500000, 'bmw'),
	('r1250r', 'r1250r', 1000000, 'motos'),
	('gs1', 'gs1', 2500000, 'motos'),
	('m2', 'm2', 3200000, 'bmw'),
	('bmwm3e92', 'bmwm3e92', 3560000, 'bmw'),
	('m3e92gts', 'm3e92gts', 3990000, 'bmw'),
	('m3f80', 'm3f80', 4000000, 'bmw'),
	('m3', 'm3', 4150000, 'bmw'),
	('bmwm4cs', 'bmwm4cs', 4600000, 'bmw'),
	('f82', 'f82', 4200000, 'bmw'),
	('bmci', 'bmci', 4700000, 'bmw'),
	('bmwm8wb', 'bmwm8wb', 5760000, 'bmw'),
	('bmwm8', 'bmwm8', 7500000, 'bmw'),
	('m1000rr', 'm1000rr', 2950000, 'motos'),
	('bmwsrr', 'bmwsrr', 2200000, 'motos'),
	('s1000rr', 's1000rr', 2750000, 'motos'),
	('sxr', 'sxr', 2500000, 'motos'),
	('x6m', 'x6m', 4100000, 'bmw'),
	('z419', 'z419', 4200000, 'bmw'),
	('pursport', 'pursport', 18500000, 'bug'),
	('bug300ss', 'bug300ss', 21000000, 'bug'),
	('razerx3', 'razerx3', 2000000, 'utv'),
	('cfmotoz10', 'cfmotoz10', 750000, 'utv'),
	('c7', 'c7', 2543000, 'ch'),
	('c8', 'c8', 3200000, 'ch'),
	('zl12017', 'zl12017', 4200000, 'ch'),
	('chevelle1970', 'chevelle1970', 1760000, 'ch'),
	('penumbra', 'penumbra', 12000, 'ch'),
	('checap17', 'checap17', 1200000, 'ch'),
	('16challenger', '16challenger', 2870000, 'dodge'),
	('16charger', '16charger', 2980000, 'dodge'),
	('durango18', 'durango18', 3100000, 'dodge'),
	('dl2016', 'dl2016', 3500000, 'dodge'),
	('ram2500', 'ram2500', 1000000, 'dodge'),
	('trx', 'trx', 4000000, 'dodge'),
	('texviper', 'texviper', 6500000, 'dodge'),
	('v4', 'v4', 1870000, 'motos'),
	('v4r', 'v4r', 3160000, 'motos'),
	('v4s', 'v4s', 2660000, 'motos'),
	('v4sl', 'v4sl', 3760000, 'motos'),
	('v4sp', 'v4sp', 4350000, 'motos'),
	('v4sf', 'v4sf', 3800000, 'motos'),
	('forfalcxr', 'forfalcxr', 250000, 'ford'),
	('599xxevo', '599xxevo', 6500000, 'race'),
	('641', '641', 9500000, 'race'),
	('f2004', 'f2004', 20000000, 'race'),
	('fc15', 'fc15', 5000000, 'ferrari'),
	('f8t', 'f8t', 6000000, 'ferrari'),
	('f40', 'f40', 10000000, 'ferrari'),
	('f355s', 'f355s', 3000000, 'ferrari'),
	('f430s', 'f430s', 4000000, 'ferrari'),
	('f812', 'f812', 8000000, 'ferrari'),
	('fxxkevo', 'fxxkevo', 20000000, 'race'),
	('fugitive', 'fugitive', 10000, 'fiat'),
	('punto', 'punto', 100000, 'fiat'),
	('rocoto', 'rocoto', 50000, 'fiat'),
	('issi2', 'issi2', 10000, 'fiat'),
	('wildtrak', 'wildtrak', 2750000, 'ford'),
	('focusrs', 'focusrs', 900000, 'ford'),
	('focus3', 'focus3', 72000, 'ford'),
	('st225', 'st225', 220000, 'ford'),
	('gt17', 'gt17', 7600000, 'ford'),
	('fordka', 'fordka', 20000, 'ford'),
	('boss429', 'boss429', 700000, 'ford'),
	('fmgt', 'fmgt', 1800000, 'ford'),
	('mach1', 'mach1', 2880000, 'ford'),
	('mache', 'mache', 2000000, 'ford'),
	('mst', 'mst', 4800000, 'ford'),
	('frr', 'frr', 1000000, 'ford'),
	('19raptor', '19raptor', 5000000, 'ford'),
	('africat', 'africat', 2650000, 'motos'),
	('biz25', 'biz25', 2500, 'motos'),
	('cb500f', 'cb500f', 125000, 'motos'),
	('cb500x', 'cb500x', 180000, 'motos'),
	('cb650r', 'cb650r', 550000, 'motos'),
	('hcbr17', 'hcbr17', 2560000, 'motos'),
	('eg6', 'eg6', 320000, 'honda'),
	('hondacivictr', 'hondacivictr', 1980000, 'honda'),
	('crf450r', 'crf450r', 650000, 'utv'),
	('rc213vs', 'rc213vs', 5000000, 'race'),
	('ap2', 'ap2', 300000, 'honda'),
	('wave110i', 'wave110i', 10000, 'motos'),
	('xre300', 'xre300', 300000, 'motos'),
	('13genesis', '13genesis', 450000, 'hyundai'),
	('veln', 'veln', 650000, 'hyundai'),
	('jlumma', 'jlumma', 4000000, 'jaguar'),
	('srt8', 'srt8', 4200000, 'jeep'),
	('trhawk', 'trhawk', 4500000, 'jeep'),
	('kx450f', 'kx450f', 650000, 'utv'),
	('zx6r', 'zx6r', 2760000, 'motos'),
	('gpz1100', 'gpz1100', 3600000, 'motos'),
	('nh2r', 'nh2r', 5500000, 'motos'),
	('z1000', 'z1000', 2240000, 'motos'),
	('zh2', 'zh2', 4500000, 'motos'),
	('zx10r', 'zx10r', 2900000, 'motos'),
	('rc390s21', 'rc390s21', 450000, 'motos'),
	('ktm450sx', 'ktm450sx', 250000, 'utv'),
	('ksd', 'ksd', 2800000, 'motos'),
	('rc16', 'rc16', 5000000, 'race'),
	('smallcamper', 'smallcamper', 50000, 'trailer'),
	('aventador', 'aventador', 6200000, 'lambo'),
	('lgss', 'lgss', 4700000, 'lambo'),
	('hevo', 'hevo', 5700000, 'lambo'),
	('urustc', 'urustc', 6000000, 'lambo'),
	('lfa', 'lfa', 10000000, 'lexus'),
	('exige12', 'exige12', 3300000, 'lotus'),
	('mgrantur2010', 'mgrantur2010', 4500000, 'mase'),
	('mqgts', 'mqgts', 5400000, 'mase'),
	('levante', 'levante', 4400000, 'mase'),
	('rx7tunable', 'rx7tunable', 540000, 'mazda'),
	('rx8r', 'rx8r', 760000, 'mazda'),
	('600lt', '600lt', 2950000, 'mc'),
	('675lt', '675lt', 3200000, 'mc'),
	('765lt', '765lt', 3650000, 'mc'),
	('mansgt', 'mansgt', 3000000, 'mc'),
	('p1lm', 'p1lm', 8000000, 'race'),
	('a45amg', 'a45amg', 1870000, 'mr'),
	('c63w205', 'c63w205', 3700000, 'mr'),
	('e63amg', 'e63amg', 3200000, 'mr'),
	('gle53', 'gle53', 3900000, 'mr'),
	('amggt', 'amggt', 4400000, 'mr'),
	('amg1', 'amg1', 32000000, 'race'),
	('mbbs20', 'mbbs20', 12000000, 'mr'),
	('gls63', 'gls63', 4300000, 'mr'),
	('370z', '370z', 450000, 'nissan'),
	('gtrnismo17', 'gtrnismo17', 3500000, 'nissan'),
	('skyline', 'skyline', 3200000, 'nissan'),
	('s15', 's15', 650000, 'nissan'),
	('206gti', '206gti', 400000, 'peu'),
	('307c', '307c', 420000, 'peu'),
	('por718gt4', 'por718gt4', 2500000, 'porche'),
	('ikx3duke911', 'ikx3duke911', 8000000, 'porche'),
	('pts21', 'pts21', 6000000, 'porche'),
	('cayenneturbo', 'cayenneturbo', 5600000, 'porche'),
	('pgt2', 'pgt2', 3700000, 'porche'),
	('pgt3', 'pgt3', 5000000, 'porche'),
	('pgt322', 'pgt322', 7000000, 'porche'),
	('22psh', '22psh', 4500000, 'porche'),
	('Taycans20', 'Taycans20', 5440000, 'porche'),
	('18Velar', '18Velar', 5440000, 'ranger'),
	('rrst', 'rrst', 6440000, 'ranger'),
	('kangoo', 'kangoo', 50000, 'renault'),
	('22b', '22b', 200000, 'subaru'),
	('wrx19', 'wrx19', 600000, 'subaru'),
	('castrolsupra', 'castrolsupra', 5000000, 'race'),
	('ltr450s', 'ltr450s', 250000, 'utv'),
	('gsxrr', 'gsxrr', 5000000, 'race'),
	('gsxr19', 'gsxr19', 3000000, 'motos'),
	('hayabusa', 'hayabusa', 3100000, 'motos'),
	('tchcop', 'tchcop', 150000, 'toyo'),
	('gt86', 'gt86', 700000, 'toyo'),
	('sclkuz', 'sclkuz', 2200000, 'toyo'),
	('toysupmk4', 'toysupmk4', 760000, 'toyo'),
	('gxa90', 'gxa90', 3200000, 'toyo'),
	('20fttrailer', '20fttrailer', 50000, 'trailer'),
	('cartrailer', 'cartrailer', 50000, 'trailer'),
	('cotrailer', 'cotrailer', 50000, 'trailer'),
	('amarok', 'amarok', 2500000, 'vw'),
	('blista', 'blista', 15000, 'vw'),
	('golfmk6', 'golfmk6', 650000, 'vw'),
	('mk3vr6', 'mk3vr6', 185000, 'vw'),
	('golf75r', 'golf75r', 2220000, 'vw'),
	('16CC', '16CC', 450000, 'vw'),
	('polo2018', 'polo2018', 195000, 'vw'),
	('vsci', 'vsci', 1530000, 'vw'),
	('vwtoua19cf', 'vwtoua19cf', 900000, 'vw'),
	('uptsi', 'uptsi', 750000, 'vw'),
	('banshee87', 'banshee87', 250000, 'utv'),
	('mt03', 'mt03', 150000, 'motos'),
	('mt09', 'mt09', 2430000, 'motos'),
	('14r1', '14r1', 2800000, 'motos'),
	('yzfr6', 'yzfr6', 1950000, 'motos'),
	('r6', 'r6', 2400000, 'motos'),
	('xt700', 'xt700', 1650000, 'motos'),
	('blazer3', 'blazer3', 150000, 'utv');

-- Volcando estructura para tabla afterlife.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.vehicle_categories: ~32 rows (aproximadamente)
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('alfa', 'ALFA ROMERO'),
	('audi', 'AUDI'),
	('bmw', 'BMW'),
	('bug', 'BUGGATI'),
	('ch', 'CHEVROLET'),
	('dodge', 'DODGE'),
	('ferrari', 'FERRARI'),
	('fiat', 'FIAT'),
	('ford', 'FORD'),
	('honda', 'HONDA'),
	('hyundai', 'HYUNDAI'),
	('jaguar', 'JAGUAR'),
	('jeep', 'JEEP'),
	('lambo', 'LAMBORGHINI'),
	('lexus', 'LEXUS'),
	('lotus', 'LOTUS'),
	('mase', 'MASERATI'),
	('mazda', 'MAZDA'),
	('mc', 'MCLAREN'),
	('motos', 'MOTOS'),
	('mr', 'MERCEDEZ'),
	('nissan', 'NISSAN'),
	('peu', 'PEUGEOT'),
	('porche', 'PORCHE'),
	('race', 'CARS RACE'),
	('ranger', 'RANGER ROVER'),
	('renault', 'RENAULT'),
	('subaru', 'SUBARU'),
	('toyo', 'TOYOTA'),
	('trailer', 'TRAILERS'),
	('utv', 'UTV'),
	('vw', 'VOLSKVAWEN');

-- Volcando estructura para tabla afterlife.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla afterlife.vehicle_sold: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
