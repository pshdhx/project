/*
 Navicat Premium Data Transfer

 Source Server         : mysqlConnection
 Source Server Type    : MySQL
 Source Server Version : 50623
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50623
 File Encoding         : 65001

 Date: 26/05/2019 12:31:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES (1, 'admin', 'admin');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (2, '鞋靴箱包');
INSERT INTO `category` VALUES (3, '运动户外');
INSERT INTO `category` VALUES (4, '珠宝配饰');
INSERT INTO `category` VALUES (5, '手机数码');
INSERT INTO `category` VALUES (6, '家电办公');
INSERT INTO `category` VALUES (7, '护肤彩妆');
INSERT INTO `category` VALUES (8, '房产汽车');

-- ----------------------------
-- Table structure for categorysecond
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond`  (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`csid`) USING BTREE,
  INDEX `FK936FCAF21DB1FD15`(`cid`) USING BTREE,
  CONSTRAINT `FK936FCAF21DB1FD15` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of categorysecond
-- ----------------------------
INSERT INTO `categorysecond` VALUES (9, '女鞋', 2);
INSERT INTO `categorysecond` VALUES (10, '短靴', 2);
INSERT INTO `categorysecond` VALUES (11, '男鞋', 2);
INSERT INTO `categorysecond` VALUES (12, '女包', 2);
INSERT INTO `categorysecond` VALUES (13, '男包', 2);
INSERT INTO `categorysecond` VALUES (14, '服饰配件', 2);
INSERT INTO `categorysecond` VALUES (15, '运动鞋', 3);
INSERT INTO `categorysecond` VALUES (16, '运动服', 3);
INSERT INTO `categorysecond` VALUES (17, '户外运动', 3);
INSERT INTO `categorysecond` VALUES (18, '健身装备', 3);
INSERT INTO `categorysecond` VALUES (19, '骑行装备', 3);
INSERT INTO `categorysecond` VALUES (20, '珠宝首饰', 4);
INSERT INTO `categorysecond` VALUES (21, '时尚饰品', 4);
INSERT INTO `categorysecond` VALUES (22, '品质手表', 4);
INSERT INTO `categorysecond` VALUES (23, '眼镜配饰', 4);
INSERT INTO `categorysecond` VALUES (24, '手机', 5);
INSERT INTO `categorysecond` VALUES (25, '平板', 5);
INSERT INTO `categorysecond` VALUES (26, '电脑', 5);
INSERT INTO `categorysecond` VALUES (27, '相机', 5);
INSERT INTO `categorysecond` VALUES (28, '大家电', 6);
INSERT INTO `categorysecond` VALUES (29, '厨房电器', 6);
INSERT INTO `categorysecond` VALUES (30, '生活电器', 6);
INSERT INTO `categorysecond` VALUES (31, '个户电器', 6);
INSERT INTO `categorysecond` VALUES (32, '办公耗材', 6);
INSERT INTO `categorysecond` VALUES (33, '美容护肤', 7);
INSERT INTO `categorysecond` VALUES (34, '强效保养', 7);
INSERT INTO `categorysecond` VALUES (35, '超值彩妆', 7);
INSERT INTO `categorysecond` VALUES (36, '换季保养', 7);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `oid` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  INDEX `FKE8B2AB6166C01961`(`oid`) USING BTREE,
  INDEX `FKE8B2AB6171DB7AE4`(`pid`) USING BTREE,
  INDEX `FKE8B2AB6140ACF87A`(`oid`) USING BTREE,
  INDEX `FKE8B2AB6140AD0F00`(`uid`) USING BTREE,
  CONSTRAINT `FKE8B2AB6140ACF87A` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKE8B2AB6140AD0F00` FOREIGN KEY (`uid`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKE8B2AB6171DB7AE4` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (1, 1, 125, 74, 1, 1);
INSERT INTO `orderitem` VALUES (2, 1, 125, 74, 2, 2);
INSERT INTO `orderitem` VALUES (3, 1, 125, 75, 2, 2);
INSERT INTO `orderitem` VALUES (4, 1, 125, 75, 4, 4);
INSERT INTO `orderitem` VALUES (5, 1, 125, 74, 5, 5);
INSERT INTO `orderitem` VALUES (6, 1, 125, 75, 5, 5);
INSERT INTO `orderitem` VALUES (7, 1, 125, 74, 6, 6);
INSERT INTO `orderitem` VALUES (8, 1, 299, 60, 6, 6);
INSERT INTO `orderitem` VALUES (9, 1, 125, 75, 7, NULL);
INSERT INTO `orderitem` VALUES (10, 1, 125, 74, 8, NULL);
INSERT INTO `orderitem` VALUES (11, 1, 125, 75, 9, NULL);
INSERT INTO `orderitem` VALUES (12, 1, 299, 57, 10, NULL);
INSERT INTO `orderitem` VALUES (13, 1, 125, 75, 11, NULL);
INSERT INTO `orderitem` VALUES (14, 1, 14000, 79, 12, NULL);
INSERT INTO `orderitem` VALUES (15, 1, 14000, 79, 13, NULL);
INSERT INTO `orderitem` VALUES (16, 1, 198, 73, 14, NULL);
INSERT INTO `orderitem` VALUES (17, 1, 83, 68, 15, NULL);
INSERT INTO `orderitem` VALUES (18, 1, 555, 84, 16, NULL);
INSERT INTO `orderitem` VALUES (19, 1, 555, 84, 17, NULL);
INSERT INTO `orderitem` VALUES (20, 1, 172, 2, 18, NULL);
INSERT INTO `orderitem` VALUES (21, 1, 6666, 80, 18, NULL);
INSERT INTO `orderitem` VALUES (22, 1, 6666, 80, 20, NULL);
INSERT INTO `orderitem` VALUES (23, 1, 119, 3, 21, NULL);
INSERT INTO `orderitem` VALUES (24, 1, 14000, 79, 22, NULL);
INSERT INTO `orderitem` VALUES (25, 1, 158, 10, 23, NULL);
INSERT INTO `orderitem` VALUES (26, 1, 555, 82, 24, NULL);
INSERT INTO `orderitem` VALUES (27, 1, 125, 76, 24, NULL);
INSERT INTO `orderitem` VALUES (28, 1, 14000, 79, 25, NULL);
INSERT INTO `orderitem` VALUES (29, 1, 198, 73, 26, NULL);
INSERT INTO `orderitem` VALUES (30, 1, 6666, 80, 27, NULL);
INSERT INTO `orderitem` VALUES (31, 1, 358, 43, 28, NULL);
INSERT INTO `orderitem` VALUES (32, 1, 6666, 80, 29, NULL);
INSERT INTO `orderitem` VALUES (33, 1, 555, 82, 30, NULL);
INSERT INTO `orderitem` VALUES (34, 1, 555, 84, 30, NULL);
INSERT INTO `orderitem` VALUES (35, 1, 222, 83, 31, NULL);
INSERT INTO `orderitem` VALUES (36, 1, 222, 83, 32, NULL);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `total` double NULL DEFAULT NULL,
  `ordertime` datetime(0) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `FKC3DF62E5AA3D9C7`(`uid`) USING BTREE,
  CONSTRAINT `FKC3DF62E5AA3D9C7` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 125, '2019-02-13 10:59:35', 1, NULL, NULL, NULL, 14);
INSERT INTO `orders` VALUES (2, 250, '2019-02-13 11:23:26', 1, NULL, NULL, NULL, 14);
INSERT INTO `orders` VALUES (3, 0, '2019-02-13 11:24:01', 1, NULL, NULL, NULL, 14);
INSERT INTO `orders` VALUES (4, 125, '2019-02-13 11:24:11', 1, NULL, NULL, NULL, 14);
INSERT INTO `orders` VALUES (5, 250, '2019-02-13 11:25:26', 1, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (6, 424, '2019-02-13 11:27:09', 1, NULL, NULL, NULL, 14);
INSERT INTO `orders` VALUES (7, 125, '2019-02-13 13:12:04', 2, NULL, NULL, NULL, 14);
INSERT INTO `orders` VALUES (8, 125, '2019-02-13 13:12:10', 3, NULL, NULL, NULL, 14);
INSERT INTO `orders` VALUES (9, 125, '2019-02-13 13:14:57', 3, NULL, NULL, NULL, 14);
INSERT INTO `orders` VALUES (10, 299, '2019-02-13 15:19:44', 1, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (11, 125, '2019-02-13 18:02:43', 1, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (12, 14000, '2019-02-15 16:58:59', 4, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (13, 14000, '2019-02-15 17:33:25', 1, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (14, 198, '2019-02-15 17:33:49', 4, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (15, 83, '2019-03-02 00:31:00', 1, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (16, 555, '2019-04-29 11:04:38', 1, 'bbb', 'bbb', 'bbb', 18);
INSERT INTO `orders` VALUES (17, 555, '2019-04-29 12:39:59', 3, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (18, 6838, '2019-05-02 17:21:13', 1, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (19, 0, '2019-05-02 17:31:06', 1, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (20, 6666, '2019-05-02 17:35:26', 1, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (21, 119, '2019-05-02 17:35:45', 1, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (22, 14000, '2019-05-02 17:37:46', 1, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (23, 158, '2019-05-02 17:40:53', 1, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (24, 680, '2019-05-23 14:32:53', 1, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (25, 14000, '2019-05-23 16:01:39', 1, NULL, NULL, NULL, 14);
INSERT INTO `orders` VALUES (26, 198, '2019-05-24 22:12:55', 1, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (27, 6666, '2019-05-24 22:18:10', 1, 'aaa', 'aaa', 'aaa', 14);
INSERT INTO `orders` VALUES (28, 358, '2019-05-24 22:21:19', 1, 'bbb', 'bbb', 'bbb', 18);
INSERT INTO `orders` VALUES (29, 6666, '2019-05-24 22:41:02', 1, 'bbb', 'bbb', 'bbb', 18);
INSERT INTO `orders` VALUES (30, 1110, '2019-05-25 09:33:50', 1, NULL, NULL, NULL, 14);
INSERT INTO `orders` VALUES (31, 222, '2019-05-25 09:41:25', 1, NULL, NULL, NULL, 14);
INSERT INTO `orders` VALUES (32, 222, '2019-05-25 10:13:53', 1, NULL, NULL, NULL, 14);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `market_price` double NULL DEFAULT NULL,
  `shop_price` double NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_hot` int(11) NULL DEFAULT NULL,
  `pdate` datetime(0) NULL DEFAULT NULL,
  `csid` int(11) NULL DEFAULT NULL,
  `pvisitcount` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `FKED8DCCEFB9B74E02`(`csid`) USING BTREE,
  CONSTRAINT `FKED8DCCEFB9B74E02` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '韩版连帽加厚毛衣女外套', 558, 228, 'products/1/cs10001.jpg', '双11限量200件，拍完下架，加车享优惠，早下手早发货。。秋冬个性中长款毛衣，美丽和温度同在！限量供应，拒绝撞衫！迫于纱线和人工在不断上涨的双重压力下，产品涨价在即！少量现货出售中，手快有，手慢等哦，赶紧抢哦，绝对高大上。', 1, '2014-11-02 20:18:00', NULL, 7);
INSERT INTO `product` VALUES (2, '女装立领长袖拼接PU皮毛呢外套', 436, 172, 'products/1/cs10002.jpg', '【现在拍下并支付定金，即可获得双12当天10元无门槛优惠券一张。注：只限有预付定金款~优惠券统一在12月11号发放】 毛呢外套 整洁干练的长款版型 整个肩部给予皮绒拼接 与毛呢一起撑起品质感 立领 长袖 肩部往下做流行加层拼接 一粒扣收合门襟 特意做的夹棉里层（袖里无） 不必再畏惧冷冽寒风', 0, '2014-11-04 20:18:00', NULL, 2);
INSERT INTO `product` VALUES (3, '韩版女装翻领羔绒夹棉格子毛呢外套', 238, 119, 'products/1/cs10003.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套 ｙａｎｇ　羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', 0, '2014-10-01 20:18:00', NULL, 8);
INSERT INTO `product` VALUES (4, '韩版女装翻领羔绒夹棉格子毛呢外套', 238, 119, 'products/1/cs10004.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套 ｙａｎｇ　羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', 0, '2014-12-07 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (5, '韩版女装翻领羔绒夹棉格子毛呢外套', 238, 119, 'products/1/cs10005.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套 ｙａｎｇ　羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', 0, '2014-11-02 20:18:00', NULL, 9);
INSERT INTO `product` VALUES (6, '冬装韩版女装翻领羔绒夹棉格子毛呢外套', 238, 119, 'products/1/cs10006.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套 ｙａｎｇ　羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', 0, '2014-11-10 15:18:00', NULL, 2);
INSERT INTO `product` VALUES (7, '新款优雅奢华毛领白鸭绒轻薄羽绒服', 1120, 590, 'products/1/cs10007.jpg', '秋冬热卖款，今日特惠！库存有限，卖完即止！喜欢的赶紧出手哦！', 0, '2014-11-03 20:18:00', NULL, 9);
INSERT INTO `product` VALUES (8, '秋冬季毛呢外套女中长款圆领小香风呢子大衣', 672, 336, 'products/1/cs10008.jpg', '【双12预售】双12提前开抢，11月24日—12月11日抢先付预付款33.6元，12月12日付剩余尾款，先付先发货，提前引爆双12！！！买就【送】双十二10元无门槛优惠券！！！商家【赠】运费险！！！', 0, '2014-11-03 20:18:00', NULL, 2);
INSERT INTO `product` VALUES (9, '女装貉子毛大衣 时尚修身长袖淑女毛呢外套', 238, 119, 'products/1/cs10009.jpg', '秋冬热卖款，今日特惠！库存有限，卖完即止！喜欢的赶紧出手哦！', 0, '2014-11-03 20:18:00', NULL, 7);
INSERT INTO `product` VALUES (10, '修身显瘦淑女针织长袖打底连衣裙女', 356, 158, 'products/1/cs10010.jpg', '【1212万能盛典预售抢先购,早买早便宜！】定金15.80元，预售价158.00元，双12价涨价至178.00元!', 0, '2014-11-03 20:18:00', NULL, 9);
INSERT INTO `product` VALUES (11, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20001.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', NULL, 3);
INSERT INTO `product` VALUES (12, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20002.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', NULL, 20);
INSERT INTO `product` VALUES (13, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20003.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (14, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20004.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', NULL, 2);
INSERT INTO `product` VALUES (15, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20005.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (16, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20006.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (17, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20007.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (18, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20008.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (19, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20009.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-10-01 20:18:00', NULL, 8);
INSERT INTO `product` VALUES (20, '中长款貂皮大衣整貂女装', 17900, 7290, 'products/1/cs20010.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】【售后保障】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (21, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30001.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 1, '2014-11-03 20:18:00', NULL, 11);
INSERT INTO `product` VALUES (22, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30002.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (23, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30003.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (24, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30004.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (25, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30005.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (26, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30006.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (27, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30007.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (28, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30008.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (29, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30009.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (30, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30010.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-10 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (31, '打底衫加厚修身羊毛衫女装羊绒衫10', 387, 186, 'products/1/cs40001.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', NULL, 3);
INSERT INTO `product` VALUES (32, '打底衫加厚修身羊毛衫女装羊绒衫11', 387, 186, 'products/1/cs40002.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', NULL, 2);
INSERT INTO `product` VALUES (33, '打底衫加厚修身羊毛衫女装羊绒衫1', 387, 186, 'products/1/cs40003.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', NULL, 11);
INSERT INTO `product` VALUES (34, '性感时尚 酷感黑色小圆领露肩修身长袖针织衫2', 387, 186, 'products/1/cs40004.jpg', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (35, '韩版黑色打底衫加厚修身羊毛衫女装羊绒3', 387, 186, 'products/1/cs40005.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 1, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (36, '韩版黑色打底衫加厚修身羊毛衫女装羊绒4', 387, 186, 'products/1/cs40006.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (37, '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫5', 387, 186, 'products/1/cs40007.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (38, '韩版黑色打底衫加厚修身羊毛衫女装羊绒6', 387, 186, 'products/1/cs40008.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (39, '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫7', 387, 186, 'products/1/cs40009.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (40, '韩版黑色打底衫加厚修身羊毛衫女装羊绒8', 387, 186, 'products/1/cs40010.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (41, '韩版黑色打底衫加厚修身羊毛衫女装羊绒9', 387, 186, 'products/1/cs40011.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 1, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (42, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50001.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 1, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (43, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50002.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 0, '2014-11-03 20:18:00', NULL, 2);
INSERT INTO `product` VALUES (44, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50003.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 1, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (45, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50004.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 0, '2014-12-07 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (46, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50005.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (47, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50006.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 1, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (48, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50007.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (49, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50008.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (50, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50009.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (51, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50010.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 1, '2014-12-07 20:18:00', NULL, 17);
INSERT INTO `product` VALUES (52, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60001.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (53, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60002.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 1, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (54, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60003.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (55, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60004.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (56, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60005.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (57, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60006.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 1, '2014-12-07 22:18:00', NULL, 14);
INSERT INTO `product` VALUES (58, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60007.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 0, '2014-11-03 20:18:00', NULL, 2);
INSERT INTO `product` VALUES (59, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60008.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (60, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60009.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 1, '2014-12-02 20:18:00', NULL, 6);
INSERT INTO `product` VALUES (61, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60010.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (62, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70001.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 1, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (63, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70002.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 1, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (64, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70003.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (65, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70004.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 1, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (66, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70005.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (67, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70006.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 1, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (68, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70007.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 0, '2014-12-04 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (69, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70008.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 1, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (70, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70009.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 0, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (71, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70010.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 1, '2014-11-03 20:18:00', NULL, 1);
INSERT INTO `product` VALUES (72, '女鞋', 198, 83, 'products/1/nvxie.jpg', '韩版女鞋...', 0, '2015-02-10 12:02:54', 9, 4);
INSERT INTO `product` VALUES (73, '短靴1', 299, 198, 'products/1/duanxue1.png', '女款短靴...', 1, '2015-02-10 15:02:08', 10, 25);
INSERT INTO `product` VALUES (74, '女款短靴2', 200, 125, 'products/1/duanxue2.png', '女款短靴', 1, '2014-12-15 00:00:00', 10, 9);
INSERT INTO `product` VALUES (75, '女款短靴3', 200, 125, 'products/1/duanxue3.png', '女款短靴', 0, '2014-12-15 00:00:00', 10, 1);
INSERT INTO `product` VALUES (76, '女款短靴4', 200, 125, 'products/1/duanxue4.png', '女款短靴', 1, '2014-12-15 00:00:00', 10, 14);
INSERT INTO `product` VALUES (79, 'apple_computer111', 15000, 14000, 'products/1/apple_computer.jpg', 'apple......', 1, '2019-02-15 16:28:35', 26, 107);
INSERT INTO `product` VALUES (80, '平板电脑', 8888, 6666, 'products/1/ipad.jpg', 'ipaidGOOD', 1, '2019-04-23 19:06:43', 26, 38);
INSERT INTO `product` VALUES (82, '男士衣服', 666, 555, 'products/1/adidas.jpg', 'adidas', 1, '2019-04-23 19:09:47', NULL, 38);
INSERT INTO `product` VALUES (83, '女鞋001', 333, 222, 'products/1/nvxiesport.jpg', '运动鞋系列精品', 1, '2019-04-27 18:00:11', 9, 14);
INSERT INTO `product` VALUES (84, '女鞋002', 666, 555, 'products/1/nvxiegaogen1.jpg', '高跟系列精品', 1, '2019-04-18 18:01:37', 9, 26);
INSERT INTO `product` VALUES (85, '女鞋003', 999, 666, 'products/1/nvxiegaogen2.jpg', '高跟系列精品', 0, '2019-04-11 18:02:41', 9, 1);
INSERT INTO `product` VALUES (86, '女鞋004', 1111, 999, 'products/1/nvxiepixie.jpg', '皮鞋系列精品', 0, '2019-04-24 18:04:37', 9, 12);
INSERT INTO `product` VALUES (87, '苹果手机01', 9999, 8888, 'products/1/iphone.jpg', '苹果手机', 0, '2019-04-28 13:59:16', 24, 22);
INSERT INTO `product` VALUES (88, '苹果手机02', 9999, 8888, 'products/1/iphone1.jpg', '苹果手机', 0, '2019-04-28 13:59:16', 24, 22);
INSERT INTO `product` VALUES (89, '台式机01', 8888, 6666, 'products/1/computer1.jpg', '台式机', 0, '2019-04-25 14:01:29', 26, 22);
INSERT INTO `product` VALUES (90, '相机01', 8888, 8555, 'products/1/camera.jpg', '相机', 1, '2019-04-17 14:03:33', 27, 64);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `recordid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NULL DEFAULT NULL,
  `csid` int(10) NULL DEFAULT NULL,
  `csidvisit` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`recordid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 435 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (37, 14, 1, 29);
INSERT INTO `record` VALUES (38, 14, 2, 16);
INSERT INTO `record` VALUES (39, 14, 3, 4);
INSERT INTO `record` VALUES (40, 14, 4, 3);
INSERT INTO `record` VALUES (41, 14, 5, 10);
INSERT INTO `record` VALUES (42, 14, 6, 5);
INSERT INTO `record` VALUES (43, 14, 7, 1);
INSERT INTO `record` VALUES (44, 14, 8, 0);
INSERT INTO `record` VALUES (45, 14, 9, 18);
INSERT INTO `record` VALUES (46, 14, 10, 11);
INSERT INTO `record` VALUES (47, 14, 11, 0);
INSERT INTO `record` VALUES (48, 14, 12, 0);
INSERT INTO `record` VALUES (49, 14, 13, 0);
INSERT INTO `record` VALUES (50, 14, 14, 0);
INSERT INTO `record` VALUES (51, 14, 15, 0);
INSERT INTO `record` VALUES (52, 14, 16, 0);
INSERT INTO `record` VALUES (53, 14, 17, 0);
INSERT INTO `record` VALUES (54, 14, 18, 0);
INSERT INTO `record` VALUES (55, 14, 19, 0);
INSERT INTO `record` VALUES (56, 14, 20, 0);
INSERT INTO `record` VALUES (57, 14, 21, 0);
INSERT INTO `record` VALUES (58, 14, 22, 0);
INSERT INTO `record` VALUES (59, 14, 23, 0);
INSERT INTO `record` VALUES (60, 14, 24, 0);
INSERT INTO `record` VALUES (61, 14, 25, 0);
INSERT INTO `record` VALUES (62, 14, 26, 35);
INSERT INTO `record` VALUES (63, 14, 27, 2);
INSERT INTO `record` VALUES (64, 14, 28, 0);
INSERT INTO `record` VALUES (65, 14, 29, 0);
INSERT INTO `record` VALUES (66, 14, 30, 0);
INSERT INTO `record` VALUES (67, 14, 31, 0);
INSERT INTO `record` VALUES (68, 14, 32, 0);
INSERT INTO `record` VALUES (69, 14, 33, 0);
INSERT INTO `record` VALUES (70, 14, 34, 0);
INSERT INTO `record` VALUES (71, 14, 35, 0);
INSERT INTO `record` VALUES (72, 14, 36, 0);
INSERT INTO `record` VALUES (75, 18, 1, 3);
INSERT INTO `record` VALUES (76, 18, 2, 1);
INSERT INTO `record` VALUES (77, 18, 3, 3);
INSERT INTO `record` VALUES (78, 18, 4, 5);
INSERT INTO `record` VALUES (79, 18, 5, 1);
INSERT INTO `record` VALUES (80, 18, 6, 0);
INSERT INTO `record` VALUES (81, 18, 7, 1);
INSERT INTO `record` VALUES (82, 18, 8, 0);
INSERT INTO `record` VALUES (83, 18, 9, 13);
INSERT INTO `record` VALUES (84, 18, 10, 3);
INSERT INTO `record` VALUES (85, 18, 11, 0);
INSERT INTO `record` VALUES (86, 18, 12, 0);
INSERT INTO `record` VALUES (87, 18, 13, 0);
INSERT INTO `record` VALUES (88, 18, 14, 0);
INSERT INTO `record` VALUES (89, 18, 15, 0);
INSERT INTO `record` VALUES (90, 18, 16, 0);
INSERT INTO `record` VALUES (91, 18, 17, 0);
INSERT INTO `record` VALUES (92, 18, 18, 0);
INSERT INTO `record` VALUES (93, 18, 19, 0);
INSERT INTO `record` VALUES (94, 18, 20, 0);
INSERT INTO `record` VALUES (95, 18, 21, 0);
INSERT INTO `record` VALUES (96, 18, 22, 0);
INSERT INTO `record` VALUES (97, 18, 23, 0);
INSERT INTO `record` VALUES (98, 18, 24, 0);
INSERT INTO `record` VALUES (99, 18, 25, 0);
INSERT INTO `record` VALUES (100, 18, 26, 6);
INSERT INTO `record` VALUES (101, 18, 27, 1);
INSERT INTO `record` VALUES (102, 18, 28, 0);
INSERT INTO `record` VALUES (103, 18, 29, 0);
INSERT INTO `record` VALUES (104, 18, 30, 0);
INSERT INTO `record` VALUES (105, 18, 31, 0);
INSERT INTO `record` VALUES (106, 18, 32, 0);
INSERT INTO `record` VALUES (107, 18, 33, 0);
INSERT INTO `record` VALUES (108, 18, 34, 0);
INSERT INTO `record` VALUES (109, 18, 35, 0);
INSERT INTO `record` VALUES (110, 18, 36, 0);
INSERT INTO `record` VALUES (111, 23, 1, 1);
INSERT INTO `record` VALUES (112, 23, 2, 1);
INSERT INTO `record` VALUES (113, 23, 3, 0);
INSERT INTO `record` VALUES (114, 23, 4, 0);
INSERT INTO `record` VALUES (115, 23, 5, 0);
INSERT INTO `record` VALUES (116, 23, 6, 1);
INSERT INTO `record` VALUES (117, 23, 7, 0);
INSERT INTO `record` VALUES (118, 23, 8, 0);
INSERT INTO `record` VALUES (119, 23, 9, 1);
INSERT INTO `record` VALUES (120, 23, 10, 2);
INSERT INTO `record` VALUES (121, 23, 11, 0);
INSERT INTO `record` VALUES (122, 23, 12, 0);
INSERT INTO `record` VALUES (123, 23, 13, 0);
INSERT INTO `record` VALUES (124, 23, 14, 0);
INSERT INTO `record` VALUES (125, 23, 15, 0);
INSERT INTO `record` VALUES (126, 23, 16, 0);
INSERT INTO `record` VALUES (127, 23, 17, 0);
INSERT INTO `record` VALUES (128, 23, 18, 0);
INSERT INTO `record` VALUES (129, 23, 19, 0);
INSERT INTO `record` VALUES (130, 23, 20, 0);
INSERT INTO `record` VALUES (131, 23, 21, 0);
INSERT INTO `record` VALUES (132, 23, 22, 0);
INSERT INTO `record` VALUES (133, 23, 23, 0);
INSERT INTO `record` VALUES (134, 23, 24, 2);
INSERT INTO `record` VALUES (135, 23, 25, 0);
INSERT INTO `record` VALUES (136, 23, 26, 2);
INSERT INTO `record` VALUES (137, 23, 27, 0);
INSERT INTO `record` VALUES (138, 23, 28, 0);
INSERT INTO `record` VALUES (139, 23, 29, 0);
INSERT INTO `record` VALUES (140, 23, 30, 5);
INSERT INTO `record` VALUES (141, 23, 31, 0);
INSERT INTO `record` VALUES (142, 23, 32, 0);
INSERT INTO `record` VALUES (143, 23, 33, 0);
INSERT INTO `record` VALUES (144, 23, 34, 0);
INSERT INTO `record` VALUES (145, 23, 35, 0);
INSERT INTO `record` VALUES (146, 23, 36, 0);
INSERT INTO `record` VALUES (147, 25, 1, 0);
INSERT INTO `record` VALUES (148, 25, 2, 0);
INSERT INTO `record` VALUES (149, 25, 3, 0);
INSERT INTO `record` VALUES (150, 25, 4, 0);
INSERT INTO `record` VALUES (151, 25, 5, 0);
INSERT INTO `record` VALUES (152, 25, 6, 1);
INSERT INTO `record` VALUES (153, 25, 7, 6);
INSERT INTO `record` VALUES (154, 25, 8, 0);
INSERT INTO `record` VALUES (155, 25, 9, 3);
INSERT INTO `record` VALUES (156, 25, 10, 2);
INSERT INTO `record` VALUES (157, 25, 11, 0);
INSERT INTO `record` VALUES (158, 25, 12, 0);
INSERT INTO `record` VALUES (159, 25, 13, 0);
INSERT INTO `record` VALUES (160, 25, 14, 0);
INSERT INTO `record` VALUES (161, 25, 15, 0);
INSERT INTO `record` VALUES (162, 25, 16, 0);
INSERT INTO `record` VALUES (163, 25, 17, 0);
INSERT INTO `record` VALUES (164, 25, 18, 0);
INSERT INTO `record` VALUES (165, 25, 19, 0);
INSERT INTO `record` VALUES (166, 25, 20, 0);
INSERT INTO `record` VALUES (167, 25, 21, 0);
INSERT INTO `record` VALUES (168, 25, 22, 0);
INSERT INTO `record` VALUES (169, 25, 23, 0);
INSERT INTO `record` VALUES (170, 25, 24, 0);
INSERT INTO `record` VALUES (171, 25, 25, 0);
INSERT INTO `record` VALUES (172, 25, 26, 6);
INSERT INTO `record` VALUES (173, 25, 27, 5);
INSERT INTO `record` VALUES (174, 25, 28, 0);
INSERT INTO `record` VALUES (175, 25, 29, 0);
INSERT INTO `record` VALUES (176, 25, 30, 0);
INSERT INTO `record` VALUES (177, 25, 31, 0);
INSERT INTO `record` VALUES (178, 25, 32, 0);
INSERT INTO `record` VALUES (179, 25, 33, 0);
INSERT INTO `record` VALUES (180, 25, 34, 0);
INSERT INTO `record` VALUES (181, 25, 35, 0);
INSERT INTO `record` VALUES (182, 25, 36, 0);
INSERT INTO `record` VALUES (183, 26, 1, 0);
INSERT INTO `record` VALUES (184, 26, 2, 0);
INSERT INTO `record` VALUES (185, 26, 3, 0);
INSERT INTO `record` VALUES (186, 26, 4, 0);
INSERT INTO `record` VALUES (187, 26, 5, 1);
INSERT INTO `record` VALUES (188, 26, 6, 0);
INSERT INTO `record` VALUES (189, 26, 7, 0);
INSERT INTO `record` VALUES (190, 26, 8, 0);
INSERT INTO `record` VALUES (191, 26, 9, 2);
INSERT INTO `record` VALUES (192, 26, 10, 1);
INSERT INTO `record` VALUES (193, 26, 11, 0);
INSERT INTO `record` VALUES (194, 26, 12, 0);
INSERT INTO `record` VALUES (195, 26, 13, 0);
INSERT INTO `record` VALUES (196, 26, 14, 0);
INSERT INTO `record` VALUES (197, 26, 15, 0);
INSERT INTO `record` VALUES (198, 26, 16, 0);
INSERT INTO `record` VALUES (199, 26, 17, 0);
INSERT INTO `record` VALUES (200, 26, 18, 0);
INSERT INTO `record` VALUES (201, 26, 19, 0);
INSERT INTO `record` VALUES (202, 26, 20, 0);
INSERT INTO `record` VALUES (203, 26, 21, 0);
INSERT INTO `record` VALUES (204, 26, 22, 0);
INSERT INTO `record` VALUES (205, 26, 23, 0);
INSERT INTO `record` VALUES (206, 26, 24, 0);
INSERT INTO `record` VALUES (207, 26, 25, 0);
INSERT INTO `record` VALUES (208, 26, 26, 0);
INSERT INTO `record` VALUES (209, 26, 27, 0);
INSERT INTO `record` VALUES (210, 26, 28, 0);
INSERT INTO `record` VALUES (211, 26, 29, 0);
INSERT INTO `record` VALUES (212, 26, 30, 0);
INSERT INTO `record` VALUES (213, 26, 31, 0);
INSERT INTO `record` VALUES (214, 26, 32, 0);
INSERT INTO `record` VALUES (215, 26, 33, 0);
INSERT INTO `record` VALUES (216, 26, 34, 0);
INSERT INTO `record` VALUES (217, 26, 35, 0);
INSERT INTO `record` VALUES (218, 26, 36, 0);
INSERT INTO `record` VALUES (219, 27, 1, 0);
INSERT INTO `record` VALUES (220, 27, 2, 1);
INSERT INTO `record` VALUES (221, 27, 3, 0);
INSERT INTO `record` VALUES (222, 27, 4, 0);
INSERT INTO `record` VALUES (223, 27, 5, 0);
INSERT INTO `record` VALUES (224, 27, 6, 0);
INSERT INTO `record` VALUES (225, 27, 7, 4);
INSERT INTO `record` VALUES (226, 27, 8, 0);
INSERT INTO `record` VALUES (227, 27, 9, 0);
INSERT INTO `record` VALUES (228, 27, 10, 1);
INSERT INTO `record` VALUES (229, 27, 11, 0);
INSERT INTO `record` VALUES (230, 27, 12, 0);
INSERT INTO `record` VALUES (231, 27, 13, 0);
INSERT INTO `record` VALUES (232, 27, 14, 0);
INSERT INTO `record` VALUES (233, 27, 15, 0);
INSERT INTO `record` VALUES (234, 27, 16, 0);
INSERT INTO `record` VALUES (235, 27, 17, 0);
INSERT INTO `record` VALUES (236, 27, 18, 0);
INSERT INTO `record` VALUES (237, 27, 19, 0);
INSERT INTO `record` VALUES (238, 27, 20, 0);
INSERT INTO `record` VALUES (239, 27, 21, 0);
INSERT INTO `record` VALUES (240, 27, 22, 0);
INSERT INTO `record` VALUES (241, 27, 23, 0);
INSERT INTO `record` VALUES (242, 27, 24, 0);
INSERT INTO `record` VALUES (243, 27, 25, 0);
INSERT INTO `record` VALUES (244, 27, 26, 5);
INSERT INTO `record` VALUES (245, 27, 27, 0);
INSERT INTO `record` VALUES (246, 27, 28, 0);
INSERT INTO `record` VALUES (247, 27, 29, 0);
INSERT INTO `record` VALUES (248, 27, 30, 0);
INSERT INTO `record` VALUES (249, 27, 31, 0);
INSERT INTO `record` VALUES (250, 27, 32, 0);
INSERT INTO `record` VALUES (251, 27, 33, 0);
INSERT INTO `record` VALUES (252, 27, 34, 0);
INSERT INTO `record` VALUES (253, 27, 35, 0);
INSERT INTO `record` VALUES (254, 27, 36, 0);
INSERT INTO `record` VALUES (255, 28, 1, 0);
INSERT INTO `record` VALUES (256, 28, 2, 0);
INSERT INTO `record` VALUES (257, 28, 3, 0);
INSERT INTO `record` VALUES (258, 28, 4, 0);
INSERT INTO `record` VALUES (259, 28, 5, 0);
INSERT INTO `record` VALUES (260, 28, 6, 0);
INSERT INTO `record` VALUES (261, 28, 7, 0);
INSERT INTO `record` VALUES (262, 28, 8, 0);
INSERT INTO `record` VALUES (263, 28, 9, 0);
INSERT INTO `record` VALUES (264, 28, 10, 2);
INSERT INTO `record` VALUES (265, 28, 11, 0);
INSERT INTO `record` VALUES (266, 28, 12, 0);
INSERT INTO `record` VALUES (267, 28, 13, 0);
INSERT INTO `record` VALUES (268, 28, 14, 0);
INSERT INTO `record` VALUES (269, 28, 15, 0);
INSERT INTO `record` VALUES (270, 28, 16, 0);
INSERT INTO `record` VALUES (271, 28, 17, 0);
INSERT INTO `record` VALUES (272, 28, 18, 0);
INSERT INTO `record` VALUES (273, 28, 19, 0);
INSERT INTO `record` VALUES (274, 28, 20, 0);
INSERT INTO `record` VALUES (275, 28, 21, 0);
INSERT INTO `record` VALUES (276, 28, 22, 0);
INSERT INTO `record` VALUES (277, 28, 23, 0);
INSERT INTO `record` VALUES (278, 28, 24, 0);
INSERT INTO `record` VALUES (279, 28, 25, 0);
INSERT INTO `record` VALUES (280, 28, 26, 1);
INSERT INTO `record` VALUES (281, 28, 27, 0);
INSERT INTO `record` VALUES (282, 28, 28, 0);
INSERT INTO `record` VALUES (283, 28, 29, 0);
INSERT INTO `record` VALUES (284, 28, 30, 0);
INSERT INTO `record` VALUES (285, 28, 31, 0);
INSERT INTO `record` VALUES (286, 28, 32, 0);
INSERT INTO `record` VALUES (287, 28, 33, 0);
INSERT INTO `record` VALUES (288, 28, 34, 0);
INSERT INTO `record` VALUES (289, 28, 35, 0);
INSERT INTO `record` VALUES (290, 28, 36, 0);
INSERT INTO `record` VALUES (291, 29, 1, 0);
INSERT INTO `record` VALUES (292, 29, 2, 0);
INSERT INTO `record` VALUES (293, 29, 3, 0);
INSERT INTO `record` VALUES (294, 29, 4, 0);
INSERT INTO `record` VALUES (295, 29, 5, 0);
INSERT INTO `record` VALUES (296, 29, 6, 0);
INSERT INTO `record` VALUES (297, 29, 7, 0);
INSERT INTO `record` VALUES (298, 29, 8, 0);
INSERT INTO `record` VALUES (299, 29, 9, 0);
INSERT INTO `record` VALUES (300, 29, 10, 0);
INSERT INTO `record` VALUES (301, 29, 11, 0);
INSERT INTO `record` VALUES (302, 29, 12, 0);
INSERT INTO `record` VALUES (303, 29, 13, 0);
INSERT INTO `record` VALUES (304, 29, 14, 0);
INSERT INTO `record` VALUES (305, 29, 15, 0);
INSERT INTO `record` VALUES (306, 29, 16, 0);
INSERT INTO `record` VALUES (307, 29, 17, 0);
INSERT INTO `record` VALUES (308, 29, 18, 0);
INSERT INTO `record` VALUES (309, 29, 19, 0);
INSERT INTO `record` VALUES (310, 29, 20, 0);
INSERT INTO `record` VALUES (311, 29, 21, 0);
INSERT INTO `record` VALUES (312, 29, 22, 0);
INSERT INTO `record` VALUES (313, 29, 23, 0);
INSERT INTO `record` VALUES (314, 29, 24, 0);
INSERT INTO `record` VALUES (315, 29, 25, 0);
INSERT INTO `record` VALUES (316, 29, 26, 0);
INSERT INTO `record` VALUES (317, 29, 27, 0);
INSERT INTO `record` VALUES (318, 29, 28, 0);
INSERT INTO `record` VALUES (319, 29, 29, 0);
INSERT INTO `record` VALUES (320, 29, 30, 0);
INSERT INTO `record` VALUES (321, 29, 31, 0);
INSERT INTO `record` VALUES (322, 29, 32, 0);
INSERT INTO `record` VALUES (323, 29, 33, 0);
INSERT INTO `record` VALUES (324, 29, 34, 0);
INSERT INTO `record` VALUES (325, 29, 35, 0);
INSERT INTO `record` VALUES (326, 29, 36, 0);
INSERT INTO `record` VALUES (327, 30, 1, 0);
INSERT INTO `record` VALUES (328, 30, 2, 0);
INSERT INTO `record` VALUES (329, 30, 3, 0);
INSERT INTO `record` VALUES (330, 30, 4, 0);
INSERT INTO `record` VALUES (331, 30, 5, 0);
INSERT INTO `record` VALUES (332, 30, 6, 0);
INSERT INTO `record` VALUES (333, 30, 7, 0);
INSERT INTO `record` VALUES (334, 30, 8, 0);
INSERT INTO `record` VALUES (335, 30, 9, 0);
INSERT INTO `record` VALUES (336, 30, 10, 0);
INSERT INTO `record` VALUES (337, 30, 11, 0);
INSERT INTO `record` VALUES (338, 30, 12, 0);
INSERT INTO `record` VALUES (339, 30, 13, 0);
INSERT INTO `record` VALUES (340, 30, 14, 0);
INSERT INTO `record` VALUES (341, 30, 15, 0);
INSERT INTO `record` VALUES (342, 30, 16, 0);
INSERT INTO `record` VALUES (343, 30, 17, 0);
INSERT INTO `record` VALUES (344, 30, 18, 0);
INSERT INTO `record` VALUES (345, 30, 19, 0);
INSERT INTO `record` VALUES (346, 30, 20, 0);
INSERT INTO `record` VALUES (347, 30, 21, 0);
INSERT INTO `record` VALUES (348, 30, 22, 0);
INSERT INTO `record` VALUES (349, 30, 23, 0);
INSERT INTO `record` VALUES (350, 30, 24, 0);
INSERT INTO `record` VALUES (351, 30, 25, 0);
INSERT INTO `record` VALUES (352, 30, 26, 0);
INSERT INTO `record` VALUES (353, 30, 27, 0);
INSERT INTO `record` VALUES (354, 30, 28, 0);
INSERT INTO `record` VALUES (355, 30, 29, 0);
INSERT INTO `record` VALUES (356, 30, 30, 0);
INSERT INTO `record` VALUES (357, 30, 31, 0);
INSERT INTO `record` VALUES (358, 30, 32, 0);
INSERT INTO `record` VALUES (359, 30, 33, 0);
INSERT INTO `record` VALUES (360, 30, 34, 0);
INSERT INTO `record` VALUES (361, 30, 35, 0);
INSERT INTO `record` VALUES (362, 30, 36, 0);
INSERT INTO `record` VALUES (363, 43, 1, 1);
INSERT INTO `record` VALUES (364, 43, 2, 0);
INSERT INTO `record` VALUES (365, 43, 3, 0);
INSERT INTO `record` VALUES (366, 43, 4, 0);
INSERT INTO `record` VALUES (367, 43, 5, 0);
INSERT INTO `record` VALUES (368, 43, 6, 0);
INSERT INTO `record` VALUES (369, 43, 7, 0);
INSERT INTO `record` VALUES (370, 43, 8, 0);
INSERT INTO `record` VALUES (371, 43, 9, 1);
INSERT INTO `record` VALUES (372, 43, 10, 1);
INSERT INTO `record` VALUES (373, 43, 11, 0);
INSERT INTO `record` VALUES (374, 43, 12, 0);
INSERT INTO `record` VALUES (375, 43, 13, 0);
INSERT INTO `record` VALUES (376, 43, 14, 0);
INSERT INTO `record` VALUES (377, 43, 15, 0);
INSERT INTO `record` VALUES (378, 43, 16, 0);
INSERT INTO `record` VALUES (379, 43, 17, 0);
INSERT INTO `record` VALUES (380, 43, 18, 0);
INSERT INTO `record` VALUES (381, 43, 19, 0);
INSERT INTO `record` VALUES (382, 43, 20, 0);
INSERT INTO `record` VALUES (383, 43, 21, 0);
INSERT INTO `record` VALUES (384, 43, 22, 0);
INSERT INTO `record` VALUES (385, 43, 23, 0);
INSERT INTO `record` VALUES (386, 43, 24, 0);
INSERT INTO `record` VALUES (387, 43, 25, 0);
INSERT INTO `record` VALUES (388, 43, 26, 0);
INSERT INTO `record` VALUES (389, 43, 27, 0);
INSERT INTO `record` VALUES (390, 43, 28, 0);
INSERT INTO `record` VALUES (391, 43, 29, 0);
INSERT INTO `record` VALUES (392, 43, 30, 0);
INSERT INTO `record` VALUES (393, 43, 31, 0);
INSERT INTO `record` VALUES (394, 43, 32, 0);
INSERT INTO `record` VALUES (395, 43, 33, 0);
INSERT INTO `record` VALUES (396, 43, 34, 0);
INSERT INTO `record` VALUES (397, 43, 35, 0);
INSERT INTO `record` VALUES (398, 43, 36, 0);
INSERT INTO `record` VALUES (399, 44, 1, 1);
INSERT INTO `record` VALUES (400, 44, 2, 0);
INSERT INTO `record` VALUES (401, 44, 3, 0);
INSERT INTO `record` VALUES (402, 44, 4, 0);
INSERT INTO `record` VALUES (403, 44, 5, 0);
INSERT INTO `record` VALUES (404, 44, 6, 1);
INSERT INTO `record` VALUES (405, 44, 7, 0);
INSERT INTO `record` VALUES (406, 44, 8, 0);
INSERT INTO `record` VALUES (407, 44, 9, 0);
INSERT INTO `record` VALUES (408, 44, 10, 0);
INSERT INTO `record` VALUES (409, 44, 11, 0);
INSERT INTO `record` VALUES (410, 44, 12, 0);
INSERT INTO `record` VALUES (411, 44, 13, 0);
INSERT INTO `record` VALUES (412, 44, 14, 0);
INSERT INTO `record` VALUES (413, 44, 15, 0);
INSERT INTO `record` VALUES (414, 44, 16, 0);
INSERT INTO `record` VALUES (415, 44, 17, 0);
INSERT INTO `record` VALUES (416, 44, 18, 0);
INSERT INTO `record` VALUES (417, 44, 19, 0);
INSERT INTO `record` VALUES (418, 44, 20, 0);
INSERT INTO `record` VALUES (419, 44, 21, 0);
INSERT INTO `record` VALUES (420, 44, 22, 0);
INSERT INTO `record` VALUES (421, 44, 23, 0);
INSERT INTO `record` VALUES (422, 44, 24, 0);
INSERT INTO `record` VALUES (423, 44, 25, 0);
INSERT INTO `record` VALUES (424, 44, 26, 0);
INSERT INTO `record` VALUES (425, 44, 27, 0);
INSERT INTO `record` VALUES (426, 44, 28, 0);
INSERT INTO `record` VALUES (427, 44, 29, 0);
INSERT INTO `record` VALUES (428, 44, 30, 0);
INSERT INTO `record` VALUES (429, 44, 31, 0);
INSERT INTO `record` VALUES (430, 44, 32, 0);
INSERT INTO `record` VALUES (431, 44, 33, 0);
INSERT INTO `record` VALUES (432, 44, 34, 0);
INSERT INTO `record` VALUES (433, 44, 35, 0);
INSERT INTO `record` VALUES (434, 44, 36, 0);

-- ----------------------------
-- Table structure for similar
-- ----------------------------
DROP TABLE IF EXISTS `similar`;
CREATE TABLE `similar`  (
  `similarid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `refuid` int(10) NULL DEFAULT NULL,
  `similarvalue` double NULL DEFAULT NULL,
  PRIMARY KEY (`similarid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of similar
-- ----------------------------
INSERT INTO `similar` VALUES (8, 14, 18, 0.7099558302641398);
INSERT INTO `similar` VALUES (9, 14, 23, 0.46226173872951803);
INSERT INTO `similar` VALUES (10, 18, 14, 0.6651427798383145);
INSERT INTO `similar` VALUES (11, 18, 23, 0.3383419611633493);
INSERT INTO `similar` VALUES (14, 23, 14, 0.4137939547053894);
INSERT INTO `similar` VALUES (15, 23, 18, 0.3775452111242115);
INSERT INTO `similar` VALUES (19, 25, 14, 0.5006466063467513);
INSERT INTO `similar` VALUES (20, 25, 18, 0.5172938179593085);
INSERT INTO `similar` VALUES (21, 25, 23, 0.29646714964663473);
INSERT INTO `similar` VALUES (22, 26, 14, 0.30192577371347357);
INSERT INTO `similar` VALUES (23, 26, 18, 0.7018199273519565);
INSERT INTO `similar` VALUES (24, 26, 23, 0.25503068522533534);
INSERT INTO `similar` VALUES (25, 26, 25, 0.16666666666666669);
INSERT INTO `similar` VALUES (26, 27, 14, 0.6062750892411573);
INSERT INTO `similar` VALUES (27, 27, 18, 0.37614318410159037);
INSERT INTO `similar` VALUES (28, 27, 23, 0.3096115803492016);
INSERT INTO `similar` VALUES (29, 27, 25, 0.6848300870011594);
INSERT INTO `similar` VALUES (30, 27, 26, 0.0880450906325624);
INSERT INTO `similar` VALUES (31, 28, 14, 0.4858987147293248);
INSERT INTO `similar` VALUES (32, 28, 18, 0.36768944875568155);
INSERT INTO `similar` VALUES (33, 28, 23, 0.4190581774617469);
INSERT INTO `similar` VALUES (34, 28, 25, 0.7302967433402214);
INSERT INTO `similar` VALUES (35, 28, 26, 0.5163977794943222);
INSERT INTO `similar` VALUES (55, 14, 25, 0.5390595945138187);
INSERT INTO `similar` VALUES (56, 14, 26, 0.43048609170797164);
INSERT INTO `similar` VALUES (57, 14, 27, 0.5811562152464576);
INSERT INTO `similar` VALUES (58, 14, 28, 0.4715738862413873);
INSERT INTO `similar` VALUES (59, 18, 25, 0.5405129260144534);
INSERT INTO `similar` VALUES (60, 18, 26, 0.7580980435789035);
INSERT INTO `similar` VALUES (61, 18, 27, 0.35869813213277946);
INSERT INTO `similar` VALUES (62, 18, 28, 0.3321819194149599);
INSERT INTO `similar` VALUES (63, 23, 25, 0);
INSERT INTO `similar` VALUES (64, 23, 26, 0);
INSERT INTO `similar` VALUES (65, 23, 27, 0);
INSERT INTO `similar` VALUES (66, 23, 28, 0);
INSERT INTO `similar` VALUES (67, 25, 26, 0.30999370331685144);
INSERT INTO `similar` VALUES (68, 25, 27, 0.8105733292832928);
INSERT INTO `similar` VALUES (69, 25, 28, 0.42447635997800887);
INSERT INTO `similar` VALUES (70, 26, 27, 0.062257280636469035);
INSERT INTO `similar` VALUES (71, 26, 28, 0.3651483716701107);
INSERT INTO `similar` VALUES (72, 29, 14, 0);
INSERT INTO `similar` VALUES (73, 29, 18, 0);
INSERT INTO `similar` VALUES (74, 29, 23, 0);
INSERT INTO `similar` VALUES (75, 29, 25, 0);
INSERT INTO `similar` VALUES (76, 29, 26, 0);
INSERT INTO `similar` VALUES (77, 29, 27, 0);
INSERT INTO `similar` VALUES (78, 29, 28, 0);
INSERT INTO `similar` VALUES (79, 26, 29, 0);
INSERT INTO `similar` VALUES (80, 14, 29, 0);
INSERT INTO `similar` VALUES (81, 18, 29, 0);
INSERT INTO `similar` VALUES (82, 23, 29, 0);
INSERT INTO `similar` VALUES (83, 30, 14, 0);
INSERT INTO `similar` VALUES (84, 30, 18, 0);
INSERT INTO `similar` VALUES (85, 30, 23, 0);
INSERT INTO `similar` VALUES (86, 30, 25, 0);
INSERT INTO `similar` VALUES (87, 30, 26, 0);
INSERT INTO `similar` VALUES (88, 30, 27, 0);
INSERT INTO `similar` VALUES (89, 30, 28, 0);
INSERT INTO `similar` VALUES (90, 30, 29, 0);
INSERT INTO `similar` VALUES (91, 25, 29, 0);
INSERT INTO `similar` VALUES (92, 25, 30, 0);
INSERT INTO `similar` VALUES (93, 18, 30, 0);
INSERT INTO `similar` VALUES (94, 14, 30, 0);
INSERT INTO `similar` VALUES (95, 23, 30, 0);
INSERT INTO `similar` VALUES (96, 43, 14, 0.588453158981734);
INSERT INTO `similar` VALUES (97, 43, 18, 0.6951736466013723);
INSERT INTO `similar` VALUES (98, 43, 23, 0.360667853866973);
INSERT INTO `similar` VALUES (99, 43, 25, 0.27399831217559556);
INSERT INTO `similar` VALUES (100, 43, 26, 0.7071067811865476);
INSERT INTO `similar` VALUES (101, 43, 27, 0.0880450906325624);
INSERT INTO `similar` VALUES (102, 43, 28, 0.5163977794943222);
INSERT INTO `similar` VALUES (103, 43, 29, 0);
INSERT INTO `similar` VALUES (104, 43, 30, 0);
INSERT INTO `similar` VALUES (105, 14, 43, 0.6194799582416014);
INSERT INTO `similar` VALUES (106, 44, 14, 0.4623390492373579);
INSERT INTO `similar` VALUES (107, 44, 18, 0.13443321448446624);
INSERT INTO `similar` VALUES (108, 44, 23, 0.22086305214969307);
INSERT INTO `similar` VALUES (109, 44, 25, 0.06711560552140243);
INSERT INTO `similar` VALUES (110, 44, 26, 0);
INSERT INTO `similar` VALUES (111, 44, 27, 0);
INSERT INTO `similar` VALUES (112, 44, 28, 0);
INSERT INTO `similar` VALUES (113, 44, 29, 0);
INSERT INTO `similar` VALUES (114, 44, 30, 0);
INSERT INTO `similar` VALUES (115, 44, 43, 0.40824829046386296);
INSERT INTO `similar` VALUES (116, 14, 44, 0.4447580458747142);
INSERT INTO `similar` VALUES (117, 18, 43, 0.6790046053972701);
INSERT INTO `similar` VALUES (118, 18, 44, 0.13130643285972257);
INSERT INTO `similar` VALUES (119, 23, 43, 0);
INSERT INTO `similar` VALUES (120, 23, 44, 0);
INSERT INTO `similar` VALUES (121, 25, 43, 0);
INSERT INTO `similar` VALUES (122, 25, 44, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'pshd', 'pshd', '潘圣东', NULL, NULL, NULL, 1, NULL);
INSERT INTO `user` VALUES (14, 'aaa', 'aaa', 'aaa', 'aaa@shop.com', 'aaa', 'aaa', 1, NULL);
INSERT INTO `user` VALUES (18, 'bbb', 'bbb', 'bbb', 'bbb@shop.com', 'bbb', 'bbb', 1, '');
INSERT INTO `user` VALUES (19, '333', '333', '潘圣东', 'aaa@shop.com', '333', '???', 1, NULL);
INSERT INTO `user` VALUES (20, '111', '111', '???', 'aaa@shop.com', '111', '???', 0, '43cf30ed1e5249888a74c8b513e4f6218fc6b576c6e34d7babf467c4fc1afa06');
INSERT INTO `user` VALUES (21, '1111', '1111', '哈哈哈', 'aaa@shop.com', '111', '哈哈哈', 0, '2067c02f34314e26a0b662fd3e9ca3a0263fe699c48b40a8ba343987adef5b16');
INSERT INTO `user` VALUES (22, 'wwww', 'wwww', '哈哈哈', 'aaa@shop.com', '111', '哈哈哈', 0, 'e8a70e1a2df1424ca2d475c9556c7a68200b6cd772dc4105a2c49b19c6850091');
INSERT INTO `user` VALUES (23, 'ccc', 'ccc', 'ccc', 'bbb@shop.com', '111', 'ccc', 1, NULL);
INSERT INTO `user` VALUES (24, 'ccc', 'ccc', 'ccc', 'bbb@shop.com', '111', 'ccc', 1, NULL);
INSERT INTO `user` VALUES (25, 'ddd', 'ddd', 'ddd', 'bbb@shop.com', '111', 'ddd', 1, NULL);
INSERT INTO `user` VALUES (26, 'eee', 'eee', 'eee', 'bbb@shop.com', '111', 'eee', 1, NULL);
INSERT INTO `user` VALUES (27, 'fff', 'fff', 'fff', 'bbb@shop.com', '111', 'fff', 1, NULL);
INSERT INTO `user` VALUES (28, 'ggg', 'ggg', 'ggg', 'bbb@shop.com', '111', 'ggg', 1, NULL);
INSERT INTO `user` VALUES (29, 'hhh', 'hhh', 'hhh', 'bbb@shop.com', '111', 'hhh', 1, NULL);
INSERT INTO `user` VALUES (30, 'iii', 'iii', 'iii', 'bbb@shop.com', '111', 'iii', 1, NULL);
INSERT INTO `user` VALUES (31, 'jjj', 'jjj', 'jjj', 'bbb@shop.com', '111', 'jjj', 1, NULL);
INSERT INTO `user` VALUES (32, 'kkk', 'kkk', 'kkk', 'bbb@shop.com', '111', 'kkk', 1, NULL);
INSERT INTO `user` VALUES (33, 'LLL', 'LLL', 'LLL', 'bbb@shop.com', '111', 'LLL', 1, NULL);
INSERT INTO `user` VALUES (34, 'mmm', 'mmm', 'mmm', 'bbb@shop.com', '111', 'mmm', 1, NULL);
INSERT INTO `user` VALUES (35, 'nnn', 'nnn', 'nnn', 'bbb@shop.com', '111', 'nnn', 1, NULL);
INSERT INTO `user` VALUES (36, 'ooo', 'ooo', 'ooo', 'bbb@shop.com', '111', 'ooo', 1, NULL);
INSERT INTO `user` VALUES (37, 'ppp', 'ppp', 'ppp', 'bbb@shop.com', '111', 'ppp', 1, NULL);
INSERT INTO `user` VALUES (43, 'zzz', 'zzz', 'zzz', 'aaa@shop.com', 'zzz', 'zzz', 1, NULL);
INSERT INTO `user` VALUES (44, '潘圣东', 'pshdhx', '潘圣东', 'aaa@shop.com', '17864195273', '山东师范大学长清湖校区', 1, NULL);
INSERT INTO `user` VALUES (45, 'abc', 'abc', 'ppp', 'aaa@shop.com', '564564', 'fasdfd', 1, NULL);

-- ----------------------------
-- Table structure for uservisit
-- ----------------------------
DROP TABLE IF EXISTS `uservisit`;
CREATE TABLE `uservisit`  (
  `uvid` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户浏览表记录id',
  `uvuserid` int(20) NULL DEFAULT NULL COMMENT '浏览用户id',
  `uvusername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览用户姓名',
  `visitpid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户浏览的商品id',
  PRIMARY KEY (`uvid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uservisit
-- ----------------------------
INSERT INTO `uservisit` VALUES (1, 14, 'aaa', '1,222,79,80,7,3,10,90,76,73,84,83,5,');
INSERT INTO `uservisit` VALUES (6, 18, 'bbb', '79,66,33,73,74,80,21,5,19,76,1,82,43,');
INSERT INTO `uservisit` VALUES (9, 23, 'ccc', '79,51,72,73,80,1,60,76,19,');
INSERT INTO `uservisit` VALUES (18, 25, 'ddd', '82,79,');
INSERT INTO `uservisit` VALUES (19, 43, 'zzz', '84,73,3,');
INSERT INTO `uservisit` VALUES (20, 44, '潘圣东', '57,7,');

SET FOREIGN_KEY_CHECKS = 1;
