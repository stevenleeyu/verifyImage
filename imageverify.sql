/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : imageverify

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-12-30 16:36:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ts_image_verify`
-- ----------------------------
DROP TABLE IF EXISTS `ts_image_verify`;
CREATE TABLE `ts_image_verify` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `code` char(32) NOT NULL DEFAULT '' COMMENT '图形对应编码',
  `name` char(20) NOT NULL DEFAULT '' COMMENT '图形对应中文',
  `url` char(100) NOT NULL DEFAULT '' COMMENT '图片地址',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:1启用2废弃',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_image_verify
-- ----------------------------
INSERT INTO `ts_image_verify` VALUES ('1', '3eecde6c6cd8764ad2a6a1b8932060b8', '上箭头', 'Uploads/Verify/201612/586221fe203b0.png', '1');
INSERT INTO `ts_image_verify` VALUES ('2', '302fed402c6c50f2517e81c03bc839d6', '下箭头', 'Uploads/Verify/201612/586221fe3960e.png', '1');
INSERT INTO `ts_image_verify` VALUES ('3', 'cf292e32c563143ed869c3b4954eddc0', '中国地图', 'Uploads/Verify/201612/586221fe4b722.png', '1');
INSERT INTO `ts_image_verify` VALUES ('4', '4fb2025116c8c65a5dafcf2af5a8243b', '乐符', 'Uploads/Verify/201612/586221fe5b50e.png', '1');
INSERT INTO `ts_image_verify` VALUES ('5', '67d9836f738e67462ffa156b464236c4', '云朵', 'Uploads/Verify/201612/586221fe70503.png', '1');
INSERT INTO `ts_image_verify` VALUES ('6', '0717cd337bab22a7785344eca0f4c654', '伞', 'Uploads/Verify/201612/586221fe8a319.png', '1');
INSERT INTO `ts_image_verify` VALUES ('7', 'dfe78af1e8647511c2b18a2b94089d42', '信封', 'Uploads/Verify/201612/586221fea54b7.png', '1');
INSERT INTO `ts_image_verify` VALUES ('8', 'abe538cceba60e5168e4fe98ca3fca99', '公交车', 'Uploads/Verify/201612/586221febb064.png', '1');
INSERT INTO `ts_image_verify` VALUES ('9', '1ebe40c3df0418e7b8ecd83668fe88d1', '出租车', 'Uploads/Verify/201612/586221fecc1d8.png', '1');
INSERT INTO `ts_image_verify` VALUES ('10', '34fa485f2973359db20788b5d1eaea44', '剪刀', 'Uploads/Verify/201612/586221fedeabd.png', '1');
INSERT INTO `ts_image_verify` VALUES ('11', '72b1266ee40f0193b0374d6ff711ca99', '加号', 'Uploads/Verify/201612/586221ff069bb.png', '1');
INSERT INTO `ts_image_verify` VALUES ('12', 'c6812fec2b206145bdd5a2b3a58c650f', '勋章', 'Uploads/Verify/201612/586221ff21772.png', '1');
INSERT INTO `ts_image_verify` VALUES ('13', '88395b11e308d0199a06537406fbf171', '双箭头', 'Uploads/Verify/201612/586221ff3925f.png', '1');
INSERT INTO `ts_image_verify` VALUES ('14', '802fc86050025c538bbcba04cbf90a71', '右箭头', 'Uploads/Verify/201612/586221ff543fe.png', '1');
INSERT INTO `ts_image_verify` VALUES ('15', '509c73fa69bf9435ec81153fbf73c40c', '回形针', 'Uploads/Verify/201612/586221ff645d1.png', '1');
INSERT INTO `ts_image_verify` VALUES ('16', 'b05efc4d9b013fb5940692799daf9665', '图钉', 'Uploads/Verify/201612/586221ff75b2d.png', '1');
INSERT INTO `ts_image_verify` VALUES ('17', 'c447d420ca0844fa1bc6688452c7e2f3', '圣诞树', 'Uploads/Verify/201612/586221ff90114.png', '1');
INSERT INTO `ts_image_verify` VALUES ('18', '986133a94faa3af65e01ac0e1a193db1', '太阳', 'Uploads/Verify/201612/586221ffabe6a.png', '1');
INSERT INTO `ts_image_verify` VALUES ('19', 'c2780362df288debfc0c3955610eee7f', '奖杯', 'Uploads/Verify/201612/586221ffc1a17.png', '1');
INSERT INTO `ts_image_verify` VALUES ('20', 'a151ca72509bc44794e710afb906b0fb', '女生', 'Uploads/Verify/201612/586221ffd5e54.png', '1');
INSERT INTO `ts_image_verify` VALUES ('21', 'cfd9e03f703403c6c2abfbea327d6d12', '婴儿', 'Uploads/Verify/201612/586221ffe5c40.png', '1');
INSERT INTO `ts_image_verify` VALUES ('22', '0e9fdfa8e961f7eb8a953c57947a1d26', '对勾', 'Uploads/Verify/201612/58622200046cc.png', '1');
INSERT INTO `ts_image_verify` VALUES ('23', '0dfa92016d4a9d91142a5128b6e3be46', '尖括号', 'Uploads/Verify/201612/58622200167e0.png', '1');
INSERT INTO `ts_image_verify` VALUES ('24', 'e5749922fec83e87fb447ccde9dd53e7', '左箭头', 'Uploads/Verify/201612/58622200269b4.png', '1');
INSERT INTO `ts_image_verify` VALUES ('25', '2919fc44f2b21069f57eb055b9b993fb', '帽子', 'Uploads/Verify/201612/5862220039e51.png', '1');
INSERT INTO `ts_image_verify` VALUES ('26', '4591e0765bdc4ae4d26dee7306262694', '感叹号', 'Uploads/Verify/201612/586222004b795.png', '1');
INSERT INTO `ts_image_verify` VALUES ('27', '9c8770ca5f5f5c3709069b86ce80860e', '手', 'Uploads/Verify/201612/586222006a7b4.png', '1');
INSERT INTO `ts_image_verify` VALUES ('28', 'cf83b60d19ded44d6ef9120cff31a99e', '手提包', 'Uploads/Verify/201612/586222008844b.png', '1');
INSERT INTO `ts_image_verify` VALUES ('29', '0ef27b7d8b81ab6b0f39a784a5cb5234', '手机', 'Uploads/Verify/201612/58622200a2e19.png', '1');
INSERT INTO `ts_image_verify` VALUES ('30', '25fd83a07c1d7d646f8355a2a2d9de26', '手表', 'Uploads/Verify/201612/58622200b37bd.png', '1');
INSERT INTO `ts_image_verify` VALUES ('31', '962d4adb179f79c10a00d2018330bda2', '扑克', 'Uploads/Verify/201612/58622200d27dc.png', '1');
INSERT INTO `ts_image_verify` VALUES ('32', 'da12a39cfbce2612a5f1c632d7e1df6a', '扳手', 'Uploads/Verify/201612/58622200ef4d3.png', '1');
INSERT INTO `ts_image_verify` VALUES ('33', '018642f629ce198b2cd0688aed16c667', '插头', 'Uploads/Verify/201612/586222010d3a7.png', '1');
INSERT INTO `ts_image_verify` VALUES ('34', 'e8356b0b0a1995439974884aaf00d411', '摩托车', 'Uploads/Verify/201612/586222011f8a4.png', '1');
INSERT INTO `ts_image_verify` VALUES ('35', '7c495f35c31686ee5a973a500cc9314c', '放大镜', 'Uploads/Verify/201612/586222013e4db.png', '1');
INSERT INTO `ts_image_verify` VALUES ('36', '62f4d5942a4a9937dbd38ba8a1664b94', '旗帜', 'Uploads/Verify/201612/5862220155be0.png', '1');
INSERT INTO `ts_image_verify` VALUES ('37', '968374dd1f2631f4ca77c3ca2cc1ea31', '星星', 'Uploads/Verify/201612/586222016984d.png', '1');
INSERT INTO `ts_image_verify` VALUES ('38', 'fbb6f4196471f6f27b508e9e5e5d6f47', '月亮', 'Uploads/Verify/201612/58622201849eb.png', '1');
INSERT INTO `ts_image_verify` VALUES ('39', 'df1f614f282a7edb454d74ea51266fce', '望远镜', 'Uploads/Verify/201612/5862220195f47.png', '1');
INSERT INTO `ts_image_verify` VALUES ('40', '9d6e63330baab7aaf9fb9fb0a06e4ea5', '树叶', 'Uploads/Verify/201612/58622201aaf3c.png', '1');
INSERT INTO `ts_image_verify` VALUES ('41', 'dd05726b075f84116c0b4167332f78bc', '梅花', 'Uploads/Verify/201612/58622201bb4f8.png', '1');
INSERT INTO `ts_image_verify` VALUES ('42', 'ef4e6b77abfefb0b668ecff6a2d718e1', '棒棒糖', 'Uploads/Verify/201612/58622201cdddc.png', '1');
INSERT INTO `ts_image_verify` VALUES ('43', 'aadb22aa3c4d113c27cc8a92c607fa67', '水滴', 'Uploads/Verify/201612/58622201e02d9.png', '1');
INSERT INTO `ts_image_verify` VALUES ('44', '46a4d8f314d40d3228abcb02e80d03c5', '游戏手柄', 'Uploads/Verify/201612/58622201f3b5d.png', '1');
INSERT INTO `ts_image_verify` VALUES ('45', '01b10454e3963b012137c63da22385d8', '灯泡', 'Uploads/Verify/201612/586222021b28c.png', '1');
INSERT INTO `ts_image_verify` VALUES ('46', '79c55d60cc741830821c1ba4ddbb1a06', '灯笼', 'Uploads/Verify/201612/586222023ae63.png', '1');
INSERT INTO `ts_image_verify` VALUES ('47', '1a61f1f2519ffdc795f4bb9998119e8f', '热气球', 'Uploads/Verify/201612/586222024d748.png', '1');
INSERT INTO `ts_image_verify` VALUES ('48', '600f8220e7c40be7161513102720c4ad', '爬虫', 'Uploads/Verify/201612/586222026b3df.png', '1');
INSERT INTO `ts_image_verify` VALUES ('49', '84da5b7e3ddb92388494991dd7ed773e', '爱心', 'Uploads/Verify/201612/586222027e493.png', '1');
INSERT INTO `ts_image_verify` VALUES ('50', 'efcdc6fa117e2771515997cc22528718', '狗', 'Uploads/Verify/201612/58622202905a7.png', '1');
INSERT INTO `ts_image_verify` VALUES ('51', 'b86774bb2b829d61e27525d846f438f5', '球', 'Uploads/Verify/201612/58622202a0393.png', '1');
INSERT INTO `ts_image_verify` VALUES ('52', '552719370ba01b0417bebba5772690c5', '球拍', 'Uploads/Verify/201612/58622202b72c8.png', '1');
INSERT INTO `ts_image_verify` VALUES ('53', '53c3dbe51237524429dfc86394f08cab', '电动车', 'Uploads/Verify/201612/58622202cc2bd.png', '1');
INSERT INTO `ts_image_verify` VALUES ('54', '9146f916b050d885ccc878c8cecc1d5a', '电视机', 'Uploads/Verify/201612/58622202e12b2.png', '1');
INSERT INTO `ts_image_verify` VALUES ('55', 'e4c00a120996e8e13d44140400ca7e99', '皇冠', 'Uploads/Verify/201612/58622202f33c6.png', '1');
INSERT INTO `ts_image_verify` VALUES ('56', '6b36b17585fe8ddbda02938b479f92ce', '相机', 'Uploads/Verify/201612/5862220311e53.png', '1');
INSERT INTO `ts_image_verify` VALUES ('57', '5c8d055e995f3f63ae961141e9b0d01e', '省略号', 'Uploads/Verify/201612/5862220326678.png', '1');
INSERT INTO `ts_image_verify` VALUES ('58', '865958a126afb0353ebb7ce91cb28dbd', '眼睛', 'Uploads/Verify/201612/586222033878c.png', '1');
INSERT INTO `ts_image_verify` VALUES ('59', 'e4e09905c4991c256d299801db0c1e36', '磁带', 'Uploads/Verify/201612/586222034ac88.png', '1');
INSERT INTO `ts_image_verify` VALUES ('60', '2bc492ab9504e600719f42c636c1f437', '立方体', 'Uploads/Verify/201612/586222035d56c.png', '1');
INSERT INTO `ts_image_verify` VALUES ('61', '48c50794dde6ee047295e6f8ea26a171', '笑脸', 'Uploads/Verify/201612/586222037b203.png', '1');
INSERT INTO `ts_image_verify` VALUES ('62', '283a3e57f54b29bcfa075060e34140e2', '笔记本', 'Uploads/Verify/201612/586222039e48c.png', '1');
INSERT INTO `ts_image_verify` VALUES ('63', '43c568b6208ae70a90d9f1f3400caadb', '耳机', 'Uploads/Verify/201612/58622203bccdb.png', '1');
INSERT INTO `ts_image_verify` VALUES ('64', '936805d9082f65c7d33dafc60d504276', '自行车', 'Uploads/Verify/201612/58622203ccac7.png', '1');
INSERT INTO `ts_image_verify` VALUES ('65', '2bd3d56bdb46a2c07e4d8bfa96750e84', '色子', 'Uploads/Verify/201612/58622203dd082.png', '1');
INSERT INTO `ts_image_verify` VALUES ('66', '09d506da83e66fec138279d2f588eb19', '花朵', 'Uploads/Verify/201612/58622203f0137.png', '1');
INSERT INTO `ts_image_verify` VALUES ('67', 'a202ec9a0c59a2beac7cfb6d20177191', '茶杯', 'Uploads/Verify/201612/586222041bace.png', '1');
INSERT INTO `ts_image_verify` VALUES ('68', 'a596ac097b9167e804d4dcaf9bf4c74e', '草莓', 'Uploads/Verify/201612/58622204383dd.png', '1');
INSERT INTO `ts_image_verify` VALUES ('69', 'ffc626187571794f74f5b678a3a3596b', '菱形', 'Uploads/Verify/201612/586222044b0a9.png', '1');
INSERT INTO `ts_image_verify` VALUES ('70', 'd6ec6580e49ba7ae5f5089104b97131c', '蘑菇', 'Uploads/Verify/201612/5862220468570.png', '1');
INSERT INTO `ts_image_verify` VALUES ('71', 'f0301e5503dbb3992bcc34cacd1923ee', '蛋糕', 'Uploads/Verify/201612/586222048ac40.png', '1');
INSERT INTO `ts_image_verify` VALUES ('72', '30770ef9cf2d3ef5e730a9f2e6c7ac69', '蜡烛', 'Uploads/Verify/201612/58622204a178e.png', '1');
INSERT INTO `ts_image_verify` VALUES ('73', 'ed09a1bb6ca65cada25e62ebfd92899a', '蝴蝶', 'Uploads/Verify/201612/58622204b2cea.png', '1');
INSERT INTO `ts_image_verify` VALUES ('74', '97d599ab92bb152c233e148ee7c6e735', '螺丝刀', 'Uploads/Verify/201612/58622204ca007.png', '1');
INSERT INTO `ts_image_verify` VALUES ('75', 'd4a7973aadbd4f7068741cbfa3bfde38', '袜子', 'Uploads/Verify/201612/58622204d9a0b.png', '1');
INSERT INTO `ts_image_verify` VALUES ('76', 'ae3788b5f70ddc004b854f79884621b4', '西瓜', 'Uploads/Verify/201612/58622204ea797.png', '1');
INSERT INTO `ts_image_verify` VALUES ('77', 'cb89ff5494b564a88906527182b0460c', '购物车', 'Uploads/Verify/201612/5862220508a53.png', '1');
INSERT INTO `ts_image_verify` VALUES ('78', '19dc24928f054d4d97a67965dccd164a', '逗号', 'Uploads/Verify/201612/586222051caa8.png', '1');
INSERT INTO `ts_image_verify` VALUES ('79', '639b7baaa7dc21d66f5a67f74fe87869', '酒杯', 'Uploads/Verify/201612/586222052d44c.png', '1');
INSERT INTO `ts_image_verify` VALUES ('80', 'ea55f96c382154f8ca04a6d7cb711c61', '钥匙', 'Uploads/Verify/201612/586222053fd30.png', '1');
INSERT INTO `ts_image_verify` VALUES ('81', '2c5fcaf026ecaa2bb716f91e98dacdfa', '钱袋', 'Uploads/Verify/201612/5862220552614.png', '1');
INSERT INTO `ts_image_verify` VALUES ('82', 'ce2e29163a74ecd7da1d76287d0bea2a', '铃铛', 'Uploads/Verify/201612/5862220564729.png', '1');
INSERT INTO `ts_image_verify` VALUES ('83', '328c74bf88d9aa6a0fca209165cc569e', '铅笔', 'Uploads/Verify/201612/586222057683d.png', '1');
INSERT INTO `ts_image_verify` VALUES ('84', 'a30c706dae38ac73bb6c58a42dac823e', '锁', 'Uploads/Verify/201612/5862220590653.png', '1');
INSERT INTO `ts_image_verify` VALUES ('85', 'da0e3be21ac66b6703ac7a76ac18d0ac', '锅', 'Uploads/Verify/201612/58622205a17c7.png', '1');
INSERT INTO `ts_image_verify` VALUES ('86', '44a450212b34e728ef41148ac468cc68', '闪电', 'Uploads/Verify/201612/58622205c0fb6.png', '1');
INSERT INTO `ts_image_verify` VALUES ('87', 'fce118b9591c03e1a6a3a1ff7bed9c4b', '问号', 'Uploads/Verify/201612/58622205e329e.png', '1');
INSERT INTO `ts_image_verify` VALUES ('88', '70044bfb53dd573c548f74fb037c3f26', '雪花', 'Uploads/Verify/201612/586222060925c.png', '1');
INSERT INTO `ts_image_verify` VALUES ('89', 'a87032430144d7eb1a1f278a914e748a', '鞋子', 'Uploads/Verify/201612/586222061fdaa.png', '1');
INSERT INTO `ts_image_verify` VALUES ('90', '06039237a7440337d9ffe5802030577f', '领带', 'Uploads/Verify/201612/586222063074e.png', '1');
INSERT INTO `ts_image_verify` VALUES ('91', 'a429f6ff1e2c5c155efda98b649dde22', '飞机', 'Uploads/Verify/201612/586222064a564.png', '1');
INSERT INTO `ts_image_verify` VALUES ('92', 'dcd706b304108f5a3c332bd76e1f2c89', '餐盘', 'Uploads/Verify/201612/586222065d230.png', '1');
INSERT INTO `ts_image_verify` VALUES ('93', '3690cb5934d8f9cbe1ddb5bfe5ec11c5', '鱼', 'Uploads/Verify/201612/58622206787b6.png', '1');
INSERT INTO `ts_image_verify` VALUES ('94', '3141265d5b9d0df6974745c705e50530', '鱼骨', 'Uploads/Verify/201612/586222068bc53.png', '1');
INSERT INTO `ts_image_verify` VALUES ('95', 'd14b45c37579f3b41a3a01f8e30b21b9', '鸟', 'Uploads/Verify/201612/586222069e537.png', '1');
INSERT INTO `ts_image_verify` VALUES ('96', '10c9fca565ead417bfbc13d9f04cec56', '鹅', 'Uploads/Verify/201612/58622206ad383.png', '1');
INSERT INTO `ts_image_verify` VALUES ('97', 'f1af25806709bb61d75fcf429001137f', '麦克风', 'Uploads/Verify/201612/58622206c0fef.png', '1');
INSERT INTO `ts_image_verify` VALUES ('98', '4b137062ab305d3f21ac2dbf1fae9cb7', '鼠标', 'Uploads/Verify/201612/58622206d4c5c.png', '1');
INSERT INTO `ts_image_verify` VALUES ('99', '6aa644a00574de6e5ec6069ed991f9dc', '鼻尖', 'Uploads/Verify/201612/58622206e80f9.png', '1');
INSERT INTO `ts_image_verify` VALUES ('100', '663a89e6e62a1cf8b327b31a85b91916', '齿轮', 'Uploads/Verify/201612/5862220706b85.png', '1');
