/*
Navicat MySQL Data Transfer

Source Server         : 阿里MySQL5.6
Source Server Version : 50642
Source Host           : 47.95.196.58:3306
Source Database       : loveTrace

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2018-12-22 19:43:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `content` text,
  `img` varchar(500) DEFAULT NULL,
  `datetime` varchar(30) DEFAULT NULL,
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `state` int(5) NOT NULL DEFAULT '0' COMMENT '0为启用 1为删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='内容的添加页面';

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '无标题' COMMENT '图片名字',
  `path` varchar(255) DEFAULT '' COMMENT '图片路径',
  `story` text,
  `datetime` varchar(255) DEFAULT '' COMMENT '图片的事件',
  `state` int(5) DEFAULT '0' COMMENT '状态 插入就是0 删除为1',
  `create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '插入图片的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for story
-- ----------------------------
DROP TABLE IF EXISTS `story`;
CREATE TABLE `story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '无名字' COMMENT '故事的名字',
  `photos` text COMMENT '图片集合  id的集合  ，分割',
  `article` text COMMENT '文章内容',
  `datetime` varchar(30) DEFAULT NULL COMMENT '时间',
  `create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '存入数据的时间',
  `state` int(5) DEFAULT '0' COMMENT '0为激活1为禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
