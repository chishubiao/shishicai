/*
Navicat MySQL Data Transfer

Source Server         : 虚拟机
Source Server Version : 50709
Source Host           : 192.168.192.128:3306
Source Database       : shishicai

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2017-06-21 07:29:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for agent
-- ----------------------------
DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `paid_rate` decimal(10,4) DEFAULT NULL,
  `credit_limit` decimal(10,4) DEFAULT NULL,
  `credit` decimal(10,4) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agent
-- ----------------------------

-- ----------------------------
-- Table structure for bet
-- ----------------------------
DROP TABLE IF EXISTS `bet`;
CREATE TABLE `bet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `broke_id` int(11) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `param1` int(255) DEFAULT NULL,
  `param2` int(255) DEFAULT NULL,
  `param3` int(255) DEFAULT NULL,
  `param4` int(11) DEFAULT NULL,
  `param5` int(11) DEFAULT NULL,
  `bet_amount` decimal(10,4) DEFAULT NULL,
  `paid_rate` decimal(10,4) DEFAULT NULL,
  `paid_amount` decimal(10,4) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bet
-- ----------------------------

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_date` date DEFAULT NULL,
  `game_no` int(11) DEFAULT NULL,
  `game_time` datetime DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game
-- ----------------------------

-- ----------------------------
-- Table structure for operate_log
-- ----------------------------
DROP TABLE IF EXISTS `operate_log`;
CREATE TABLE `operate_log` (
  `id` int(11) NOT NULL,
  `record` text,
  `operator` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `type` tinyint(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', '2017-06-01 22:45:48', '2017-06-01 22:45:52', 'jjj', '1');
INSERT INTO `user` VALUES ('2', 'agent1', '1111111111', '1', '2017-06-21 01:04:15', '2017-06-07 01:04:18', 'sgadg', '2');
