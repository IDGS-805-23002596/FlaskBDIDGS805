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

 Date: 27/02/2026 21:57:10
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
INSERT INTO `alembic_version` VALUES ('4a2dabf89daa');

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alumnos
-- ----------------------------
INSERT INTO `alumnos` VALUES (9, 'saul', 'saul@gmail.com', '2026-02-24 20:19:12', 'Villeda', '4771234567');
INSERT INTO `alumnos` VALUES (10, 'jorge', 'jorge@gmail.com', '2026-02-24 20:19:46', 'hernandez', '4771236565');
INSERT INTO `alumnos` VALUES (11, 'naomi', 'naomi@gmail.com', '2026-02-24 20:19:55', 'aranzazu', '47712344343');
INSERT INTO `alumnos` VALUES (12, 'Victor', 'victor@gmail.com', '2026-02-24 20:20:03', 'Cuellar', '47712345657');
INSERT INTO `alumnos` VALUES (13, 'Mayra', 'mayra@gmail.com', '2026-02-24 20:51:23', 'hernandez', '4771234567');
INSERT INTO `alumnos` VALUES (14, 'hola', 'saul@gmail.com', '2026-02-24 20:51:41', 'Villeda', '4771234567');

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of maestros
-- ----------------------------
INSERT INTO `maestros` VALUES (2, 'Rosa Fernanda', 'Martinez Orozco', 'Español', 'rosa@gmail.com');
INSERT INTO `maestros` VALUES (5, 'Marcos', 'Baños', 'Matemáticas', 'marcos@gmail.com');
INSERT INTO `maestros` VALUES (16, 'Martha', 'Baños', 'Marketing', 'martha@gmail.com');

SET FOREIGN_KEY_CHECKS = 1;
