/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : db_bbs

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-09-01 09:07:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_accessory`
-- ----------------------------
DROP TABLE IF EXISTS `tb_accessory`;
CREATE TABLE `tb_accessory` (
  `accessory_id` int(11) NOT NULL AUTO_INCREMENT,
  `accessory_file_name` varchar(255) NOT NULL,
  `accessory_path` varchar(255) NOT NULL,
  `accessory_upload_time` datetime NOT NULL,
  `accessory_description` varchar(255) NOT NULL,
  `accessory_size` varchar(255) NOT NULL,
  `accessory_download_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`accessory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_accessory
-- ----------------------------
INSERT INTO `tb_accessory` VALUES ('1', 'accessory1.cpp', '/accessory/', '2017-08-30 16:20:35', '这是第一份附件', '2M', '0');

-- ----------------------------
-- Table structure for `tb_bbs`
-- ----------------------------
DROP TABLE IF EXISTS `tb_bbs`;
CREATE TABLE `tb_bbs` (
  `bbs_id` int(11) NOT NULL AUTO_INCREMENT,
  `bbs_boardID` int(11) NOT NULL,
  `bbs_type` varchar(11) NOT NULL DEFAULT '普通主题',
  `bbs_title` varchar(20) NOT NULL,
  `bbs_content` varchar(2000) NOT NULL,
  `bbs_sender` varchar(20) NOT NULL,
  `bbs_sendTime` datetime NOT NULL,
  `bbs_sendIP` varchar(20) DEFAULT NULL,
  `bbs_face` varchar(10) DEFAULT NULL,
  `bbs_opTime` datetime DEFAULT NULL,
  `bbs_isTop` varchar(1) DEFAULT NULL,
  `bbs_toTopTime` datetime DEFAULT NULL,
  `bbs_isGood` varchar(1) DEFAULT NULL,
  `bbs_toGoodTime` datetime DEFAULT NULL,
  `bbs_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bbs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bbs
-- ----------------------------
INSERT INTO `tb_bbs` VALUES ('1', '1', '普通主题', 'JSP程序开发中有那些设计模式？', '请问各位，在JSP开发中有哪些开发模式？', 'tsoft', '2013-08-05 10:43:03', '127.0.0.1', 'face3.gif', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', '1', '2013-08-05 10:43:03', '这里是精华原因');
INSERT INTO `tb_bbs` VALUES ('2', '1', '普通主题', '乱码问题！！', '请问，在JSP中如何解决获取表单数据后的中文乱码问题？？谢谢！！', 'tsoft', '2013-08-05 10:44:03', '127.0.0.1', 'face11.gif', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', '1', '2013-08-05 10:43:03', '这里是精华原因');
INSERT INTO `tb_bbs` VALUES ('10', '2', '普通主题', 'fdsfdsfd', 'fdsfdsfdsfdfdfdfdfd', '00', '2017-08-30 20:52:38', '127.0.0.1', 'face0.gif', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', null);
INSERT INTO `tb_bbs` VALUES ('13', '19', '普通主题', '随时回答你的问题', '如果你有什么问题或者疑问可随时发帖子给我，我会及时给您回复．', '00', '2013-08-05 10:43:03', '127.0.0.1', 'face0.gif', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', null);
INSERT INTO `tb_bbs` VALUES ('15', '1', '普通主题', '测试发帖', '测试发帖内容。<font color=red>请输入要设置颜色的文字！</font>', 'java1234', '2013-08-05 11:10:54', '127.0.0.1', 'face0.gif', '2013-08-05 11:10:54', '0', null, '0', null, null);

-- ----------------------------
-- Table structure for `tb_bbsanswer`
-- ----------------------------
DROP TABLE IF EXISTS `tb_bbsanswer`;
CREATE TABLE `tb_bbsanswer` (
  `bbsAnswer_id` int(11) NOT NULL AUTO_INCREMENT,
  `bbsAnswer_rootID` int(11) DEFAULT NULL,
  `bbsAnswer_title` varchar(70) DEFAULT NULL,
  `bbsAnswer_content` varchar(2000) DEFAULT NULL,
  `bbsAnswer_sender` varchar(20) DEFAULT NULL,
  `bbsAnswer_sendTime` datetime DEFAULT NULL,
  `bbsAnswer_face` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`bbsAnswer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bbsanswer
-- ----------------------------
INSERT INTO `tb_bbsanswer` VALUES ('6', '2', 'yrtyyrtyrty', '<font color=blue>ytryrtytrytrytr</font>', '00', '2013-01-01 00:00:00', 'face0.gif');
INSERT INTO `tb_bbsanswer` VALUES ('7', '15', '测试回复', '测试回复', 'java1234', '2013-08-05 11:11:35', 'face0.gif');

-- ----------------------------
-- Table structure for `tb_board`
-- ----------------------------
DROP TABLE IF EXISTS `tb_board`;
CREATE TABLE `tb_board` (
  `board_id` int(11) NOT NULL AUTO_INCREMENT,
  `board_classID` int(11) DEFAULT NULL,
  `board_name` varchar(40) DEFAULT NULL,
  `board_master` varchar(20) DEFAULT NULL,
  `board_pcard` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_board
-- ----------------------------
INSERT INTO `tb_board` VALUES ('1', '1', 'JSP开发', '许久', '欢迎进入 WEB开发/JSP开发 版面！');
INSERT INTO `tb_board` VALUES ('2', '1', 'PHP开发', 'tsoft', '欢迎进入 WEB开发/PHP开发 版面！');
INSERT INTO `tb_board` VALUES ('3', '1', 'Ajax技术', 'tsoft', '欢迎进入 WEB开发/Ajax技术 版面！');
INSERT INTO `tb_board` VALUES ('4', '2', 'Oracle开发', 'tsoft', '欢迎进入 数据库开发/Oracle开发 版面！');
INSERT INTO `tb_board` VALUES ('5', '2', '其他', 'tsoft', '欢迎进入 数据库开发/其他版面！');
INSERT INTO `tb_board` VALUES ('6', '3', 'Java技术', '许久', '欢迎进入 软件开发/Java技术 版面！');
INSERT INTO `tb_board` VALUES ('7', '3', '.NET技术', 'tsoft', '欢迎进入 软件开发/.NET技术 版面！');
INSERT INTO `tb_board` VALUES ('8', '1', '.NET/ASP开发', '许久', '欢迎进入 .NET/ASP开发 版面！');
INSERT INTO `tb_board` VALUES ('9', '3', 'VB技术', 'tsoft', '欢迎进入 软件开发/VB技术 版面！');
INSERT INTO `tb_board` VALUES ('10', '3', 'C/C++技术', 'tsoft', '欢迎进入 软件开发/C/C++技术 版面！');
INSERT INTO `tb_board` VALUES ('11', '3', '其他', 'tsoft', '欢迎进入 软件开发/其他 版面！');
INSERT INTO `tb_board` VALUES ('12', '4', '汇编语言', 'yxq', '欢迎进入 硬件开发/汇编语言 版面！');
INSERT INTO `tb_board` VALUES ('13', '4', '单片机', 'tsoft', '欢迎进入 硬件开发/单片机 版面！');
INSERT INTO `tb_board` VALUES ('14', '4', '硬件设计', 'tsoft', '欢迎进入 硬件开发/硬件设计 版面！');
INSERT INTO `tb_board` VALUES ('15', '4', '其他', 'tsoft', '欢迎进入 硬件开发/其他 版面！');
INSERT INTO `tb_board` VALUES ('16', '1', '其他', 'tsoft', '欢迎进入 WEB开发/其他 版面！');
INSERT INTO `tb_board` VALUES ('17', '2', 'MS-SQL Server开发', '莫明', '欢迎进入 数据库开发/MS-SQL Server开发 版面！');
INSERT INTO `tb_board` VALUES ('18', '2', 'PowerBuilder开发', '莫明', '欢迎进入 数据库开发/PowerBuilder开发 版面！');
INSERT INTO `tb_board` VALUES ('19', '5', '问候', '00', '请不要乱写内容');
INSERT INTO `tb_board` VALUES ('20', '5', '44444', '00', '4444');

-- ----------------------------
-- Table structure for `tb_broadcast`
-- ----------------------------
DROP TABLE IF EXISTS `tb_broadcast`;
CREATE TABLE `tb_broadcast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `broadcast_message` varchar(255) NOT NULL,
  `broadcast_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_broadcast
-- ----------------------------
INSERT INTO `tb_broadcast` VALUES ('1', '这里是第一条公告，修改了。', '2017-09-01 09:04:18');

-- ----------------------------
-- Table structure for `tb_class`
-- ----------------------------
DROP TABLE IF EXISTS `tb_class`;
CREATE TABLE `tb_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(40) DEFAULT NULL,
  `class_intro` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_class
-- ----------------------------
INSERT INTO `tb_class` VALUES ('1', 'WEB开发', '欢迎进入“WEB开发”世界，互相交流、互相学习！');
INSERT INTO `tb_class` VALUES ('2', '数据库开发', '欢迎进入“数据库开发”世界，互相交流、互相学习！');
INSERT INTO `tb_class` VALUES ('3', '软件开发', '欢迎进入“软件开发”世界，互相交流、互相学习！');
INSERT INTO `tb_class` VALUES ('4', '硬件开发', '欢迎进入“硬件开发”世界，互相交流、互相学习！');
INSERT INTO `tb_class` VALUES ('5', '关爱', '欢迎访问！');

-- ----------------------------
-- Table structure for `tb_collect`
-- ----------------------------
DROP TABLE IF EXISTS `tb_collect`;
CREATE TABLE `tb_collect` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_collector` varchar(255) NOT NULL,
  `collect_bbs_id` int(11) NOT NULL,
  PRIMARY KEY (`collect_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_collect
-- ----------------------------
INSERT INTO `tb_collect` VALUES ('1', 'tsoft', '2');
INSERT INTO `tb_collect` VALUES ('2', 'tsoft', '13');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) CHARACTER SET gb2312 DEFAULT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  `user_face` varchar(11) DEFAULT NULL,
  `user_sex` varchar(10) DEFAULT NULL,
  `user_phone` varchar(12) DEFAULT NULL,
  `user_OICQ` varchar(14) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_from` varchar(200) CHARACTER SET gb2312 DEFAULT NULL,
  `user_able` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'tsoft', '111', 'user0.gif', '男', '134****4783', '10500646A', 'xujiu1@***.com.cn', '新疆', '2');
INSERT INTO `tb_user` VALUES ('2', '莫明', '555', 'user4.gif', '男', '134****4783', '10500646A', 'xujiu1@***.com.cn', '黑龙江', '1');
INSERT INTO `tb_user` VALUES ('5', '荣*天', '888', 'user15.gif', '男', '134****4783', '10500646A', 'xujiu1@***.com.cn', '湖南', '1');
INSERT INTO `tb_user` VALUES ('8', '雨飞', '333', 'user18.gif', '女', '134****4783', '10500646A', 'xujiu1@***.com.cn', '广东', '1');
INSERT INTO `tb_user` VALUES ('9', '许久', '444', 'user5.gif', '男', '134****4783', '10500646A', 'xujiu1@***.com.cn', '云南', '1');
INSERT INTO `tb_user` VALUES ('14', '00', '000000', 'user6.gif', '女', '135*****117', '5454', '11@11.com', '贵州', '1');
INSERT INTO `tb_user` VALUES ('15', 'java1234', '123', 'user15.gif', '女', '12345678900', '12321', '231@qq.com', '江西', '0');
INSERT INTO `tb_user` VALUES ('16', 'me', '000000', 'user9.gif', '?', '11111111111', '120', '110@seu.edu.cn', '福建', '0');
INSERT INTO `tb_user` VALUES ('18', 'you', '111111', 'user0.gif', '?', '11111111111', '111', '111@qq.com', '??', '0');
INSERT INTO `tb_user` VALUES ('19', 'op', '11111', 'user0.gif', '?', '11111111111', '111', '111@11.com', '??', '0');
INSERT INTO `tb_user` VALUES ('20', 'll', '11111', 'user0.gif', '?', '11111111111', '111', '111@qq.com', '??', '0');
INSERT INTO `tb_user` VALUES ('21', '我', '111', 'user0.gif', '男', '111', '111', '11.qq.com', '广州', '0');
INSERT INTO `tb_user` VALUES ('22', '王', '111', 'user0.gif', '男', '112', '111', '11', '新酱', '0');
INSERT INTO `tb_user` VALUES ('23', '1', '1111', 'user0.gif', '?', '11111111111', '11', '11@qq.com', '??', '0');
INSERT INTO `tb_user` VALUES ('26', '??', '111', 'user0.gif', '?', '11111111111', '111', '112@qq.com', '???', '0');
