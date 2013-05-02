/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50523
Source Host           : localhost:3306
Source Database       : tckms

Target Server Type    : MYSQL
Target Server Version : 50523
File Encoding         : 65001

Date: 2012-05-28 14:29:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `authority_table`
-- ----------------------------
DROP TABLE IF EXISTS `authority_table`;
CREATE TABLE `authority_table` (
  `authority_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `authority_name` varchar(20) NOT NULL COMMENT '权限名称',
  `authority_description` varchar(200) NOT NULL DEFAULT '' COMMENT '权限的描述',
  PRIMARY KEY (`authority_id`),
  UNIQUE KEY `aname` (`authority_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority_table
-- ----------------------------
INSERT INTO `authority_table` VALUES ('1', 'view_video', '观看视频');
INSERT INTO `authority_table` VALUES ('2', 'edit_video', '编辑自己视频');
INSERT INTO `authority_table` VALUES ('3', 'edit_videos', '编辑所有视频');
INSERT INTO `authority_table` VALUES ('4', 'del_video', '删除自己视频');
INSERT INTO `authority_table` VALUES ('5', 'del_videos', '删除所有视频');
INSERT INTO `authority_table` VALUES ('6', 'add_video', '添加视频');

-- ----------------------------
-- Table structure for `major_table`
-- ----------------------------
DROP TABLE IF EXISTS `major_table`;
CREATE TABLE `major_table` (
  `major_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '专业id',
  `major_name` varchar(20) NOT NULL DEFAULT '软件工程' COMMENT '专业名称',
  `major_description` varchar(200) NOT NULL DEFAULT '暂无介绍' COMMENT '专业介绍',
  PRIMARY KEY (`major_id`),
  UNIQUE KEY `major_name` (`major_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major_table
-- ----------------------------
INSERT INTO `major_table` VALUES ('1', '计算机科学与技术', '暂无介绍');
INSERT INTO `major_table` VALUES ('2', '软件工程', '暂无介绍');
INSERT INTO `major_table` VALUES ('3', '网络工程', '暂无介绍');

-- ----------------------------
-- Table structure for `role_authority_table`
-- ----------------------------
DROP TABLE IF EXISTS `role_authority_table`;
CREATE TABLE `role_authority_table` (
  `role_authority_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色权限表',
  `role_id` smallint(5) unsigned NOT NULL,
  `authority_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`role_authority_id`),
  KEY `role_id` (`role_id`),
  KEY `authority_id` (`authority_id`),
  CONSTRAINT `role_authority_table_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_table` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_authority_table_ibfk_2` FOREIGN KEY (`authority_id`) REFERENCES `authority_table` (`authority_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_authority_table
-- ----------------------------
INSERT INTO `role_authority_table` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `role_table`
-- ----------------------------
DROP TABLE IF EXISTS `role_table`;
CREATE TABLE `role_table` (
  `role_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色的id',
  `role_name` varchar(20) NOT NULL COMMENT '角色的名称',
  `role_description` varchar(200) NOT NULL DEFAULT '暂无介绍' COMMENT '角色的描述',
  `role_type` enum('用户','管理员') DEFAULT '用户',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `rname` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_table
-- ----------------------------
INSERT INTO `role_table` VALUES ('1', '普通用户', '仅能观看视频', '用户');

-- ----------------------------
-- Table structure for `sdept_major_table`
-- ----------------------------
DROP TABLE IF EXISTS `sdept_major_table`;
CREATE TABLE `sdept_major_table` (
  `sdept_major_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `major_id` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sdept_id` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`sdept_major_id`),
  KEY `major_id` (`major_id`),
  KEY `sdept_id` (`sdept_id`),
  CONSTRAINT `sdept_major_table_ibfk_1` FOREIGN KEY (`sdept_id`) REFERENCES `sdept_table` (`sdept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sdept_major_table_ibfk_2` FOREIGN KEY (`major_id`) REFERENCES `major_table` (`major_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sdept_major_table
-- ----------------------------
INSERT INTO `sdept_major_table` VALUES ('1', '1', '1');
INSERT INTO `sdept_major_table` VALUES ('2', '2', '1');
INSERT INTO `sdept_major_table` VALUES ('3', '3', '1');

-- ----------------------------
-- Table structure for `sdept_table`
-- ----------------------------
DROP TABLE IF EXISTS `sdept_table`;
CREATE TABLE `sdept_table` (
  `sdept_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '院系id',
  `sdept_name` varchar(20) NOT NULL DEFAULT '计算机科学与技术系' COMMENT '院系名称',
  `sdept_description` varchar(200) NOT NULL DEFAULT '暂无介绍' COMMENT '院系介绍',
  PRIMARY KEY (`sdept_id`),
  UNIQUE KEY `sdept_name` (`sdept_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sdept_table
-- ----------------------------
INSERT INTO `sdept_table` VALUES ('1', '计算机科学与技术系', '暂无介绍');

-- ----------------------------
-- Table structure for `table_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `table_favorites`;
CREATE TABLE `table_favorites` (
  `favorites_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`favorites_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for `table_msgboard`
-- ----------------------------
DROP TABLE IF EXISTS `table_msgboard`;
CREATE TABLE `table_msgboard` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` text NOT NULL,
  `nickname` varchar(20) NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_msgboard
-- ----------------------------
INSERT INTO `table_msgboard` VALUES ('1', '0', '1', '2012-05-07 16:35:09', '测试1111', '我是普通用户');
INSERT INTO `table_msgboard` VALUES ('2', '525', '1', '2012-05-07 16:51:18', '测试', '我是普通用户');
INSERT INTO `table_msgboard` VALUES ('3', '524', '1', '2012-05-07 16:51:47', '再测试', '我是普通用户');
INSERT INTO `table_msgboard` VALUES ('4', '524', '1', '2012-05-07 17:18:40', '再测试aaaaa', '我是普通用户');
INSERT INTO `table_msgboard` VALUES ('5', '524', '1', '2012-05-07 17:18:58', '再测试aaaaa', '我是普通用户');
INSERT INTO `table_msgboard` VALUES ('6', '524', '1', '2012-05-07 17:19:40', '测试\n', '我是普通用户');
INSERT INTO `table_msgboard` VALUES ('7', '524', '1', '2012-05-07 17:23:30', '留言内容是这些啦', '我是普通用户');
INSERT INTO `table_msgboard` VALUES ('8', '524', '1', '2012-05-07 17:24:03', '留言内容是这些啦留言内容是这些啦留言内容是这些啦留言内容是这些啦留言内容是这些啦留言内容是这些啦留言内容是这些啦留言内容是这些啦留言内容是这些啦留言内容是这些啦留言内容是这些啦留言内容是这些啦留言内容是这些啦留言内容是这些啦', '我是普通用户');
INSERT INTO `table_msgboard` VALUES ('9', '524', '1', '2012-05-07 17:24:09', '', '我是普通用户');
INSERT INTO `table_msgboard` VALUES ('10', '524', '1', '2012-05-07 17:26:28', '留言', '我是普通用户');
INSERT INTO `table_msgboard` VALUES ('11', '524', '1', '2012-05-07 17:27:02', '东奔西走', '我是普通用户');
INSERT INTO `table_msgboard` VALUES ('12', '525', '1', '2012-05-07 17:40:15', '花样百出', '我是普通用户');
INSERT INTO `table_msgboard` VALUES ('13', '525', '1', '2012-05-08 15:59:12', '21213132ljljlkj', '我是普通用户');

-- ----------------------------
-- Table structure for `user_role_table`
-- ----------------------------
DROP TABLE IF EXISTS `user_role_table`;
CREATE TABLE `user_role_table` (
  `user_role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `role_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_role_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_table_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role_table` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role_table
-- ----------------------------
INSERT INTO `user_role_table` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `user_table`
-- ----------------------------
DROP TABLE IF EXISTS `user_table`;
CREATE TABLE `user_table` (
  `user_id` mediumint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(40) NOT NULL DEFAULT '000000',
  `nickname` varchar(20) DEFAULT NULL,
  `realname` varchar(20) NOT NULL DEFAULT '',
  `sex` enum('男','女') NOT NULL DEFAULT '男',
  `email` varchar(40) NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '1990-01-01' COMMENT '出生年月',
  `major_id` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `entrance_year` smallint(6) NOT NULL DEFAULT '2009' COMMENT '入学年份',
  `user_type` enum('教师','学生') NOT NULL DEFAULT '学生',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `nickname` (`nickname`),
  KEY `major_id` (`major_id`),
  CONSTRAINT `user_table_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `major_table` (`major_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_table
-- ----------------------------
INSERT INTO `user_table` VALUES ('1', '11111111', '670B14728AD9902AECBA32E22FA4F6BD', '我是普通用户', '普通用户', '男', '359677285@qq.com', '2012-03-30', '1', '2009', '学生');
INSERT INTO `user_table` VALUES ('2', '22222222', '670B14728AD9902AECBA32E22FA4F6BD', 'MC', 'MC', '男', '1', '2012-03-31', '1', '2009', '学生');

-- ----------------------------
-- Table structure for `video_recommend_table`
-- ----------------------------
DROP TABLE IF EXISTS `video_recommend_table`;
CREATE TABLE `video_recommend_table` (
  `video_recommend_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐视频ID',
  `video_id` bigint(9) unsigned NOT NULL,
  PRIMARY KEY (`video_recommend_id`),
  UNIQUE KEY `video_id` (`video_id`) USING BTREE,
  CONSTRAINT `video_recommend_table_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `video_table` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_recommend_table
-- ----------------------------
INSERT INTO `video_recommend_table` VALUES ('1', '1');
INSERT INTO `video_recommend_table` VALUES ('2', '2');
INSERT INTO `video_recommend_table` VALUES ('3', '3');
INSERT INTO `video_recommend_table` VALUES ('4', '4');
INSERT INTO `video_recommend_table` VALUES ('5', '5');
INSERT INTO `video_recommend_table` VALUES ('6', '6');
INSERT INTO `video_recommend_table` VALUES ('7', '7');
INSERT INTO `video_recommend_table` VALUES ('8', '8');
INSERT INTO `video_recommend_table` VALUES ('9', '9');
INSERT INTO `video_recommend_table` VALUES ('10', '10');
INSERT INTO `video_recommend_table` VALUES ('11', '11');
INSERT INTO `video_recommend_table` VALUES ('12', '12');
INSERT INTO `video_recommend_table` VALUES ('13', '13');
INSERT INTO `video_recommend_table` VALUES ('14', '14');
INSERT INTO `video_recommend_table` VALUES ('15', '15');
INSERT INTO `video_recommend_table` VALUES ('16', '16');
INSERT INTO `video_recommend_table` VALUES ('17', '17');
INSERT INTO `video_recommend_table` VALUES ('18', '18');
INSERT INTO `video_recommend_table` VALUES ('19', '19');
INSERT INTO `video_recommend_table` VALUES ('20', '20');

-- ----------------------------
-- Table structure for `video_subject_table`
-- ----------------------------
DROP TABLE IF EXISTS `video_subject_table`;
CREATE TABLE `video_subject_table` (
  `video_subject_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `video_subject_name` varchar(20) NOT NULL DEFAULT '',
  `video_subject_discription` varchar(500) NOT NULL DEFAULT '暂无介绍',
  `video_subject_order` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`video_subject_id`),
  UNIQUE KEY `video_type_subject_name` (`video_subject_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_subject_table
-- ----------------------------
INSERT INTO `video_subject_table` VALUES ('1', '智能手机', '暂无介绍', '1');
INSERT INTO `video_subject_table` VALUES ('2', '单片机/物联网', '暂无介绍', '2');
INSERT INTO `video_subject_table` VALUES ('3', '嵌入式操作系统', '暂无介绍', '3');
INSERT INTO `video_subject_table` VALUES ('4', '开发语言与平台', '暂无介绍', '4');

-- ----------------------------
-- Table structure for `video_table`
-- ----------------------------
DROP TABLE IF EXISTS `video_table`;
CREATE TABLE `video_table` (
  `video_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增',
  `video_name` varchar(60) NOT NULL DEFAULT '' COMMENT '视频文件名 用uuid来定义',
  `video_title` varchar(50) NOT NULL DEFAULT '' COMMENT '视频标题',
  `video_info` varchar(500) NOT NULL DEFAULT '' COMMENT '视频介绍',
  `video_link` varchar(200) NOT NULL DEFAULT '' COMMENT '视频连接',
  `video_tags` varchar(50) NOT NULL DEFAULT '' COMMENT '视频标签 以空格隔开',
  `video_udate` date NOT NULL COMMENT '上传时间',
  `video_mdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `video_clicks` int(11) NOT NULL DEFAULT '0' COMMENT '视频点击次数',
  `video_pass` enum('通过','不通过') NOT NULL DEFAULT '不通过' COMMENT '视频审核是否通过 默认为0 通过为1',
  `video_size` int(11) NOT NULL DEFAULT '0',
  `video_duration` varchar(10) NOT NULL DEFAULT '',
  `video_img_url` varchar(200) NOT NULL DEFAULT '',
  `video_type_id` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`video_id`),
  KEY `video_table_ibfk_1` (`video_type_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `video_table_ibfk_1` FOREIGN KEY (`video_type_id`) REFERENCES `video_type_table` (`video_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `video_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=548 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of video_table
-- ----------------------------
INSERT INTO `video_table` VALUES ('1', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('2', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('3', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('4', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('5', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('6', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('7', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('8', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('9', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('10', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('11', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('12', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('13', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('14', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('15', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('16', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('17', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('18', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('19', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('20', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('21', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('22', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('23', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('24', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('25', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('26', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('27', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('28', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('29', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('30', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('31', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('32', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('33', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('34', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('35', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('36', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('37', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('38', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('39', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('40', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('41', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('42', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('43', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('44', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('45', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('46', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('47', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('48', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('49', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('50', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('51', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('52', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 21:50:07', '5', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('53', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 21:51:12', '56', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('54', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('55', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('56', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('57', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('58', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('59', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('60', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('61', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('62', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('63', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('64', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('65', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('66', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('67', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('68', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('69', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('70', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('71', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('72', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('73', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('74', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('75', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('76', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('77', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('78', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('79', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('80', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('81', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('82', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('83', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('84', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('85', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('86', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('87', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('88', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('89', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('90', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('91', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('92', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('93', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('94', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('95', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('96', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('97', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('98', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('99', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('100', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('101', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('102', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('103', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('104', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('105', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('106', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('107', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('108', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('109', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('110', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('111', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('112', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('113', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('114', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('115', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('116', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('117', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('118', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('119', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('120', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('121', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('122', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('123', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('124', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('125', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('126', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('127', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('128', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('129', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('130', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('131', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('132', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('133', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('134', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('135', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('136', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('137', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('138', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('139', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('140', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('141', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('142', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('143', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('144', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('145', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('146', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('147', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('148', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('149', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('150', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('151', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('152', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('153', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('154', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('155', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('156', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('157', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('158', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('159', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('160', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('161', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('162', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('163', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('164', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('165', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('166', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('167', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('168', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('169', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('170', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('171', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('172', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('173', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '101', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('174', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('175', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('176', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('177', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('178', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('179', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('180', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('181', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('182', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('183', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('184', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('185', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('186', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('187', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('188', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('189', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('190', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('191', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('192', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('193', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('194', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('195', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('196', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('197', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('198', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('199', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('200', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('201', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('202', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('203', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('204', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('205', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('206', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('207', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('208', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('209', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('210', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('211', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('212', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('213', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('214', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('215', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('216', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('217', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('218', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('219', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('220', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('221', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('222', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('223', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('224', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('225', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('226', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('227', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('228', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('229', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('230', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('231', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('232', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('233', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('234', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('235', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('236', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('237', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('238', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('239', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('240', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('241', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('242', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('243', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('244', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('245', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('246', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('247', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('248', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('249', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('250', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('251', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('252', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('253', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('254', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('255', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('256', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('257', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('258', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('259', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('260', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('261', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('262', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('263', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('264', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('265', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('266', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('267', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('268', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('269', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('270', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('271', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('272', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('273', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('274', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('275', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('276', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('277', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('278', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('279', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('280', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('281', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('282', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('283', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('284', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('285', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('286', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('287', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('288', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('289', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('290', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('291', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('292', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('293', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('294', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('295', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('296', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('297', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('298', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('299', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('300', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('301', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('302', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('303', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('304', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('305', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('306', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('307', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('308', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('309', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('310', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('311', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('312', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('313', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('314', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('315', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('316', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('317', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('318', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('319', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('320', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('321', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('322', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('323', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('324', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('325', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('326', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('327', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('328', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('329', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('330', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('331', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('332', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('333', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('334', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('335', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('336', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('337', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('338', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('339', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('340', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('341', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('342', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('343', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('344', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('345', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('346', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('347', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('348', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('349', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('350', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('351', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('352', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('353', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('354', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('355', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('356', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('357', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('358', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('359', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('360', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('361', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('362', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('363', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 21:49:46', '5', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('364', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('365', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('366', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('367', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('368', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('369', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('370', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('371', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('372', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('373', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('374', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('375', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('376', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('377', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('378', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('379', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('380', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('381', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('382', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('383', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('384', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('385', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('386', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('387', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('388', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('389', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('390', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('391', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('392', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('393', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('394', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('395', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('396', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('397', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('398', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('399', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('400', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('401', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('402', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('403', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('404', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('405', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('406', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('407', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('408', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('409', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('410', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('411', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('412', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('413', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('414', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('415', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('416', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('417', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 21:47:18', '64', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('418', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('419', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('420', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('421', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('422', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('423', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('424', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('425', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('426', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('427', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('428', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('429', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('430', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-18 10:43:20', '5', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('431', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('432', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('433', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('434', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('435', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('436', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('437', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('438', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('439', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('440', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('441', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('442', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('443', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('444', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('445', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('446', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('447', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-19 20:18:25', '56', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('448', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('449', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('450', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('451', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('452', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('453', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('454', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('455', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('456', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('457', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('458', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('459', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('460', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('461', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('462', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('463', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('464', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('465', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('466', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('467', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('468', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('469', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('470', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('471', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('472', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('473', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('474', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('475', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('476', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('477', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('478', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('479', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('480', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('481', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('482', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('483', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('484', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('485', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('486', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('487', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('488', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('489', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('490', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('491', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('492', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('493', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('494', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('495', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('496', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('497', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('498', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('499', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('500', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('501', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('502', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('503', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('504', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('505', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('506', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('507', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('508', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('509', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('510', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '100', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('511', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('512', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 19:33:08', '4', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('513', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '4', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('514', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-04-15 19:40:12', '55', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('515', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-04-15 20:43:45', '101', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('516', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 19:45:04', '20', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('517', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-15 21:49:16', '5', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('518', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-04-15 20:43:45', '7', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('519', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-05-07 16:08:18', '58', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('520', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-05-06 20:53:13', '117', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('521', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-04-15 21:45:53', '22', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('522', '111111111111111111111111111111111.mp4', 'Android开发视频教学 特别篇 Linux环境搭建', 'Android教学视频第一季', 'upload/videos/111111111111111111111111111111111.mp4', 'android', '2012-04-14', '2012-04-19 19:09:43', '6', '通过', '62', '0:33:30', 'upload/vimgs/111111111111111111111111111111111.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('523', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-14', '2012-05-15 14:19:35', '17', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('524', '2222222222.mp4', 'Android开发视频教学 01_05_Activity和Intent', 'Android教学视频第一季', 'upload/videos/2222222222.mp4', 'android', '2012-04-15', '2012-05-24 17:22:10', '98', '通过', '62', '0:33:30', 'upload/vimgs/2222222222.PNG', '2', '2');
INSERT INTO `video_table` VALUES ('525', 'sdfsdfsdfsdfw2.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-01-面向对象(继承-概述)', 'JAVA', 'upload/videos/sdfsdfsdfsdfw2.FLV', 'java', '2012-04-15', '2012-05-09 10:04:22', '131', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('526', '1asdsadasd.FLV', '黑马程序员_毕向东_Java基础视频教程第07天-02-面向对象(继承-概述2)', 'JAVA', 'upload/videos/1asdsadasd.FLV', 'java', '2012-04-15', '2012-05-15 14:17:52', '45', '通过', '62', '0:33:30', 'upload/vimgs/sdfsdfsdfsdfw2.PNG', '3', '2');
INSERT INTO `video_table` VALUES ('527', 'fd093937-d3d1-4f0f-9b67-6c23774d5121.mp4', 'aaaaaa', 'aaaaaa', 'upload/videos/fd093937-d3d1-4f0f-9b67-6c23774d5121.mp4', 'aaaasdsdcc', '2012-01-01', '2012-05-16 00:29:05', '0', '不通过', '1033262', '', 'upload/vimgs/null.jpg', '6', '1');
INSERT INTO `video_table` VALUES ('528', '4a27d673-2fd0-475f-bed5-213508ba29ac.mp4', 'asdasdasd', 'asdasdasdasdasd', 'upload/videos/4a27d673-2fd0-475f-bed5-213508ba29ac.mp4', 'aaa,vvv,ddd,sss,', '2012-05-15', '2012-05-16 00:29:18', '0', '不通过', '1015917', '', 'upload/vimgs/null.jpg', '6', '1');
INSERT INTO `video_table` VALUES ('529', 'c76a87ed-19c6-4677-9fc3-a69a8fb5acab.mp4', 'aaaaaaaaa', 'sdadasdasfasdasdas', 'upload/videos/c76a87ed-19c6-4677-9fc3-a69a8fb5acab.mp4', 'aa,ccc,ssd,www,', '2012-05-16', '2012-05-16 00:29:21', '0', '不通过', '1015917', '', 'upload/vimgs/null.jpg', '8', '1');
INSERT INTO `video_table` VALUES ('530', '966e66b1-d173-4d17-90a3-2058e0e0d58f.mp4', 'mcccc', 'mcmcmcmcm', 'upload/videos/966e66b1-d173-4d17-90a3-2058e0e0d58f.mp4', 'mccc,xsds,ccc,', '2012-05-16', '2012-05-16 00:56:09', '11', '通过', '1015917', '', 'upload/vimgs/null.jpg', '2', '1');
INSERT INTO `video_table` VALUES ('531', 'fc7a2bf6-e153-4d25-b78b-4a5e8feaaf28.mp4', 'sadsadas', 'dasdasdasd', 'src/main/webapp/resource/videos/fc7a2bf6-e153-4d25-b78b-4a5e8feaaf28.mp4', 'asdasdasd,', '2012-05-20', '2012-05-20 23:25:32', '0', '不通过', '1010196', '', 'resource/vimgs/null.jpg', '9', '1');
INSERT INTO `video_table` VALUES ('532', 'c9f51765-4993-44e8-9a3d-22254e875e85.mp4', 'aaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaa', 'src/main/webapp/resource/videos/c9f51765-4993-44e8-9a3d-22254e875e85.mp4', 'aaaaaaaaaa,', '2012-05-20', '2012-05-20 23:31:47', '0', '不通过', '1010196', '', 'resource/vimgs/null.jpg', '2', '1');
INSERT INTO `video_table` VALUES ('533', '875c17c5-a960-49e8-82b1-b3b3f93704b4.mp4', 'aaaasasasas', 'asasasas', 'resource/videos/875c17c5-a960-49e8-82b1-b3b3f93704b4.mp4', 'asasas,', '2012-05-21', '2012-05-21 00:46:40', '0', '不通过', '1044379', '', 'resource/vimgs/null.jpg', '2', '1');
INSERT INTO `video_table` VALUES ('534', '439325a6-f696-4f77-87c3-94b2da925d7b.mp4', 'vvvvvvvvvvv', 'vvvvvvvvv', 'resource/videos/439325a6-f696-4f77-87c3-94b2da925d7b.mp4', 'vvvvvvvvv,', '2012-05-21', '2012-05-21 00:47:34', '0', '不通过', '2069220', '', 'resource/vimgs/null.jpg', '2', '1');
INSERT INTO `video_table` VALUES ('535', '2f281776-d9db-4e67-a817-bfed1059f5da.mp4', 'wwwwwwwww', 'wwwww', 'resource/videos/2f281776-d9db-4e67-a817-bfed1059f5da.mp4', 'wwwwwwwww,', '2012-05-21', '2012-05-21 00:58:09', '0', '不通过', '1015917', '', 'resource/vimgs/null.jpg', '3', '1');
INSERT INTO `video_table` VALUES ('536', '2aab25db-0e44-4598-9de1-50d8dcc50918.mp4', 'ssssssss', 'ssssssss', 'resource/videos/2aab25db-0e44-4598-9de1-50d8dcc50918.mp4', 'sssss,', '2012-05-21', '2012-05-21 01:03:31', '0', '不通过', '21603730', '', 'resource/vimgs/null.jpg', '2', '1');
INSERT INTO `video_table` VALUES ('537', 'a150fdb8-1102-4125-a3e7-b93756197a88.mp4', 'sasas', 'asasas', 'resource/videos/a150fdb8-1102-4125-a3e7-b93756197a88.mp4', 'asas,', '2012-05-21', '2012-05-21 01:05:00', '0', '不通过', '2069220', '', 'resource/vimgs/null.jpg', '5', '1');
INSERT INTO `video_table` VALUES ('538', '2eb8904b-3080-4a13-a0bc-182c2c26ef1e.mp4', 'gggggggggggg', 'ggggggggggggggggggggggg', 'resource/videos/2eb8904b-3080-4a13-a0bc-182c2c26ef1e.mp4', 'gggg,', '2012-05-22', '2012-05-22 23:54:22', '0', '不通过', '1010196', '', 'resource/vimgs/null.jpg', '3', '1');
INSERT INTO `video_table` VALUES ('539', '62afa871-24b8-4633-bb68-9b487a3a7d73.mp4', 'aaaaaaaa', 'aaaaaa', 'resource/videos/62afa871-24b8-4633-bb68-9b487a3a7d73.mp4', 'aaaaa,', '2012-05-24', '2012-05-24 17:39:03', '0', '不通过', '21603730', '', 'resource/vimgs/null.jpg', '2', '1');
INSERT INTO `video_table` VALUES ('540', '463a7033-b3ee-418a-aea9-a2ad1756edea.mp4', 'asdfsdf', 'dsfasdf', 'resource/videos/463a7033-b3ee-418a-aea9-a2ad1756edea.mp4', 'sadfasdf,', '2012-05-25', '2012-05-25 12:35:20', '0', '不通过', '21603730', '', 'resource/vimgs/null.jpg', '9', '1');
INSERT INTO `video_table` VALUES ('541', '73817f8f-faf5-42c1-ae10-419090a8857e.mp4', 'sdfsdf', 'sdfsdfsd', 'resource/videos/73817f8f-faf5-42c1-ae10-419090a8857e.mp4', 'fsdfsdf,', '2012-05-25', '2012-05-25 12:37:26', '0', '不通过', '2069220', '', 'resource/vimgs/null.jpg', '4', '1');
INSERT INTO `video_table` VALUES ('542', 'e32492cb-66b3-413f-b2ea-5f15501e31ba.mp4', 'asdfasdf', 'asdfasdf', 'resource/videos/e32492cb-66b3-413f-b2ea-5f15501e31ba.mp4', 'sadfsd,', '2012-05-25', '2012-05-25 13:42:32', '0', '不通过', '2069220', '', 'resource/vimgs/null.jpg', '2', '1');
INSERT INTO `video_table` VALUES ('543', '3a3187f3-d45e-4c82-9ab0-7d526fbc6f01.mp4', 'sadfasdfa', 'ssadfsadf', 'resource/videos/3a3187f3-d45e-4c82-9ab0-7d526fbc6f01.mp4', 'sdafsadfsd,', '2012-05-25', '2012-05-25 14:20:00', '0', '不通过', '1010196', '', 'resource/vimgs/null.jpg', '2', '1');
INSERT INTO `video_table` VALUES ('544', '40c725e1-786e-474e-a3ce-949cb86f8756.mp4', 'sdafas', 'dfsadf', 'resource/videos/40c725e1-786e-474e-a3ce-949cb86f8756.mp4', 'sadfdsa,', '2012-05-25', '2012-05-25 14:27:35', '0', '不通过', '994625', '', 'resource/vimgs/null.jpg', '2', '1');
INSERT INTO `video_table` VALUES ('545', 'f042a68d-e4d2-403e-acd5-7b68cf97d3a5.mp4', 'aaaaaaaa', 'asd', 'resource/videos/f042a68d-e4d2-403e-acd5-7b68cf97d3a5.mp4', ',', '2012-05-28', '2012-05-28 05:04:36', '0', '不通过', '21603730', '', 'resource/vimgs/null.jpg', '2', '1');
INSERT INTO `video_table` VALUES ('546', 'efdfb860-7c3e-4960-ba48-418783dd8d91.mp4', 'aasdasdasdasdasdaasdasdasdasdasdaasdasdasdasdasdaa', '', 'resource/videos/efdfb860-7c3e-4960-ba48-418783dd8d91.mp4', ',', '2012-05-28', '2012-05-28 05:08:52', '0', '不通过', '1032278', '', 'resource/vimgs/null.jpg', '2', '1');
INSERT INTO `video_table` VALUES ('547', '616f89c5-0486-4777-b201-9cb66ee47786.mp4', 'asdas', 'aasdasdasdasaasdasdasdasaasdasdasdasaasdasdasdasaasd', 'resource/videos/616f89c5-0486-4777-b201-9cb66ee47786.mp4', 'asdasd,', '2012-05-28', '2012-05-28 13:39:24', '0', '不通过', '21603730', '', 'resource/vimgs/null.jpg', '2', '1');

-- ----------------------------
-- Table structure for `video_type_table`
-- ----------------------------
DROP TABLE IF EXISTS `video_type_table`;
CREATE TABLE `video_type_table` (
  `video_type_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增',
  `video_type_name` varchar(15) NOT NULL COMMENT '类型名',
  `video_type_discription` varchar(200) NOT NULL DEFAULT '暂无介绍',
  `video_subject_id` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `video_type_order` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`video_type_id`),
  UNIQUE KEY `video_type_name` (`video_type_name`),
  KEY `video_subject_id` (`video_subject_id`),
  CONSTRAINT `video_type_table_ibfk_1` FOREIGN KEY (`video_subject_id`) REFERENCES `video_subject_table` (`video_subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_type_table
-- ----------------------------
INSERT INTO `video_type_table` VALUES ('1', '其它', '暂无介绍', '4', '1');
INSERT INTO `video_type_table` VALUES ('2', 'Android', '暂无介绍', '1', '3');
INSERT INTO `video_type_table` VALUES ('3', 'Java', '暂无介绍', '4', '2');
INSERT INTO `video_type_table` VALUES ('4', 'Java EE', '暂无介绍', '4', '3');
INSERT INTO `video_type_table` VALUES ('5', 'JavaScript', '暂无介绍', '4', '4');
INSERT INTO `video_type_table` VALUES ('6', 'CSS/HTML', '暂无介绍', '4', '5');
INSERT INTO `video_type_table` VALUES ('7', 'PHP', '暂无介绍', '4', '6');
INSERT INTO `video_type_table` VALUES ('8', 'C/C++', '暂无介绍', '4', '7');
INSERT INTO `video_type_table` VALUES ('9', 'C#', '暂无介绍', '4', '8');
INSERT INTO `video_type_table` VALUES ('10', 'IPhone', '暂无介绍', '1', '2');
INSERT INTO `video_type_table` VALUES ('11', 'WPhone', '暂无介绍', '1', '1');

-- ----------------------------
-- View structure for `video_recommend_view`
-- ----------------------------
DROP VIEW IF EXISTS `video_recommend_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `video_recommend_view` AS select `video_recommend_table`.`video_recommend_id` AS `video_recommend_id`,`video_table`.`video_id` AS `video_id`,`video_table`.`video_name` AS `video_name`,`video_table`.`video_title` AS `video_title`,`video_table`.`video_info` AS `video_info`,`video_table`.`video_link` AS `video_link`,`video_table`.`video_tags` AS `video_tags`,`video_table`.`video_udate` AS `video_udate`,`video_table`.`video_mdate` AS `video_mdate`,`video_table`.`video_clicks` AS `video_clicks`,`video_table`.`video_pass` AS `video_pass`,`video_table`.`video_size` AS `video_size`,`video_table`.`video_duration` AS `video_duration`,`video_table`.`video_img_url` AS `video_img_url`,`video_table`.`video_type_id` AS `video_type_id`,`video_table`.`user_id` AS `user_id`,`user_table`.`nickname` AS `nickname`,`video_type_table`.`video_type_name` AS `video_type_name` from (((`video_table` join `video_recommend_table`) join `user_table`) join `video_type_table`) where ((`video_table`.`video_id` = `video_recommend_table`.`video_id`) and (`video_table`.`user_id` = `user_table`.`user_id`) and (`video_table`.`video_pass` = '通过') and (`video_table`.`video_type_id` = `video_type_table`.`video_type_id`)) ;

-- ----------------------------
-- View structure for `video_user_view`
-- ----------------------------
DROP VIEW IF EXISTS `video_user_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `video_user_view` AS select `video_table`.`video_id` AS `video_id`,`video_table`.`video_name` AS `video_name`,`video_table`.`video_title` AS `video_title`,`video_table`.`video_info` AS `video_info`,`video_table`.`video_link` AS `video_link`,`video_table`.`video_tags` AS `video_tags`,`video_table`.`video_udate` AS `video_udate`,`video_table`.`video_mdate` AS `video_mdate`,`video_table`.`video_clicks` AS `video_clicks`,`video_table`.`video_pass` AS `video_pass`,`video_table`.`video_size` AS `video_size`,`video_table`.`video_duration` AS `video_duration`,`video_table`.`video_img_url` AS `video_img_url`,`video_table`.`video_type_id` AS `video_type_id`,`video_table`.`user_id` AS `user_id`,`video_type_table`.`video_type_name` AS `video_type_name`,`user_table`.`nickname` AS `nickname` from ((`video_table` join `video_type_table`) join `user_table`) where ((`video_table`.`video_type_id` = `video_type_table`.`video_type_id`) and (`video_table`.`user_id` = `user_table`.`user_id`) and (`video_table`.`video_pass` = '通过')) ;
