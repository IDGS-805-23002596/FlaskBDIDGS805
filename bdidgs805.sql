/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3308
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3308
 Source Schema         : bdidgs805

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 08/03/2026 16:37:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version`  (
  `version_num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`version_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version` VALUES ('6b42f33b22f8');

-- ----------------------------
-- Table structure for alumnos
-- ----------------------------
DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE `alumnos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `apellidos` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alumnos
-- ----------------------------
INSERT INTO `alumnos` VALUES (9, 'saul', 'saul@gmail.com', '2026-02-24 20:19:12', 'Villeda', '4771234567');
INSERT INTO `alumnos` VALUES (10, 'jorge', 'jorge@gmail.com', '2026-02-24 20:19:46', 'hernandez', '4771236565');
INSERT INTO `alumnos` VALUES (11, 'naomi', 'naomi@gmail.com', '2026-02-24 20:19:55', 'Aanzazu', '47712344343');
INSERT INTO `alumnos` VALUES (12, 'Victor', 'victor@gmail.com', '2026-02-24 20:20:03', 'Cuellar', '47712345657');
INSERT INTO `alumnos` VALUES (13, 'Mayra', 'mayra@gmail.com', '2026-02-24 20:51:23', 'hernandez', '4771234567');
INSERT INTO `alumnos` VALUES (14, 'hola', 'saul@gmail.com', '2026-02-24 20:51:41', 'Villeda', '4771234567');
INSERT INTO `alumnos` VALUES (19, 'fulanito 1', 'fulanito@gmail.com', '2026-03-06 20:10:45', 'bolaños', 'fulanito@gmail.com');
INSERT INTO `alumnos` VALUES (20, 'fulanito 2', 'fulanito@gmail.com', '2026-03-06 20:11:00', 'bolaños', 'fulanito@gmail.com');

-- ----------------------------
-- Table structure for cursos
-- ----------------------------
DROP TABLE IF EXISTS `cursos`;
CREATE TABLE `cursos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `maestro_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `maestro_id`(`maestro_id` ASC) USING BTREE,
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`maestro_id`) REFERENCES `maestros` (`matricula`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cursos
-- ----------------------------
INSERT INTO `cursos` VALUES (2, 'Edición en Capcut', 'Aprende edición de videos', 5);
INSERT INTO `cursos` VALUES (3, 'Wordpress desde 0', 'Diseña páginas web', 2);
INSERT INTO `cursos` VALUES (8, 'Literatura', 'Aprende a leer', 18);
INSERT INTO `cursos` VALUES (9, 'Frances', 'Aprende frances', 18);

-- ----------------------------
-- Table structure for inscripciones
-- ----------------------------
DROP TABLE IF EXISTS `inscripciones`;
CREATE TABLE `inscripciones`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `alumno_id` int NOT NULL,
  `curso_id` int NOT NULL,
  `fecha_inscripcion` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_alumno_curso`(`alumno_id` ASC, `curso_id` ASC) USING BTREE,
  INDEX `curso_id`(`curso_id` ASC) USING BTREE,
  CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inscripciones
-- ----------------------------
INSERT INTO `inscripciones` VALUES (5, 10, 2, '2026-03-05 13:16:36');
INSERT INTO `inscripciones` VALUES (7, 11, 3, '2026-03-07 10:22:45');
INSERT INTO `inscripciones` VALUES (8, 12, 2, '2026-03-07 10:24:30');
INSERT INTO `inscripciones` VALUES (9, 19, 2, '2026-03-07 10:24:32');
INSERT INTO `inscripciones` VALUES (10, 19, 9, '2026-03-07 10:26:57');
INSERT INTO `inscripciones` VALUES (11, 20, 9, '2026-03-07 10:27:00');
INSERT INTO `inscripciones` VALUES (12, 19, 8, '2026-03-07 10:27:13');
INSERT INTO `inscripciones` VALUES (13, 20, 8, '2026-03-07 10:27:16');

-- ----------------------------
-- Table structure for maestros
-- ----------------------------
DROP TABLE IF EXISTS `maestros`;
CREATE TABLE `maestros`  (
  `matricula` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `apellidos` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `especialidad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`matricula`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of maestros
-- ----------------------------
INSERT INTO `maestros` VALUES (2, 'Rosa ', 'Martinez Orozco', 'Español', 'rosa@gmail.com');
INSERT INTO `maestros` VALUES (5, 'Marcos', 'Baños Martinez', 'Matemáticas', 'marcos@gmail.com');
INSERT INTO `maestros` VALUES (16, 'Martha', 'Lechuga Morales', 'Marketing', 'martha@gmail.com');
INSERT INTO `maestros` VALUES (18, 'Dario', 'Ruiz Ruiz', 'Base de datos', 'dario@gmail.com');

SET FOREIGN_KEY_CHECKS = 1;
