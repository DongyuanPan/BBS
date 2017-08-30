/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : jforumdb

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-08-29 16:24:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user_login_info_tlb`
-- ----------------------------
DROP TABLE IF EXISTS `user_login_info_tlb`;
CREATE TABLE `user_login_info_tlb` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password_tip_question` varchar(40) DEFAULT NULL,
  `password_tip_answer` varchar(40) DEFAULT NULL,
  `register_time` datetime NOT NULL,
  `login_in_time` datetime NOT NULL,
  `login_in_ip` varchar(15) NOT NULL,
  `last_login_in_time` datetime DEFAULT NULL,
  `last_login_in_ip` varchar(15) DEFAULT NULL,
  `messege_sum` tinyint(4) unsigned zerofill DEFAULT NULL,
  `essence_messege_sum` tinyint(4) unsigned zerofill DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_login_info_tlb
-- ----------------------------
INSERT INTO `user_login_info_tlb` VALUES ('1', 'admin', '000000', '1@qq.com', null, null, '2017-08-29 16:22:41', '2017-08-29 16:22:50', '107.1.1.1', null, null, '0000', '0000', '1');
