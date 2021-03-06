/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50704
Source Host           : 127.0.0.1:3306
Source Database       : jsh_erp

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2019-12-28 12:23:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jsh_account
-- ----------------------------
DROP TABLE IF EXISTS `jsh_account`;
CREATE TABLE `jsh_account` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `Name` varchar(50) DEFAULT NULL COMMENT 'Tên',
  `SerialNo` varchar(50) DEFAULT NULL COMMENT 'Số',
  `InitialAmount` decimal(24,6) DEFAULT NULL COMMENT 'Số tiền mở',
  `CurrentAmount` decimal(24,6) DEFAULT NULL COMMENT 'Số dư hiện tại',
  `Remark` varchar(100) DEFAULT NULL COMMENT 'Ghi chú',
  `IsDefault` bit(1) DEFAULT NULL COMMENT 'Cho dù mặc định',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT 'Id người thuê nhà',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT 'Xóa dấu, 0 không xóa, 1 xóa',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Thông tin tài khoản';

-- ----------------------------
-- Records of jsh_account
-- ----------------------------
INSERT INTO `jsh_account` VALUES ('4', 'Ngân hàng xây dựng Nam Thông', '652346523465234623', '1200.000000', '215.000000', 'Tài khoản CCB', '\0', null, '0');
INSERT INTO `jsh_account` VALUES ('9', 'Sổ cái hiện tại', '65234624523452364', '2000.000000', '393.000000', 'Tài khoản hiện tại', '', null, '0');
INSERT INTO `jsh_account` VALUES ('10', 'Alipay', '123456789@qq.com', '10000.000000', null, '', '\0', null, '0');
INSERT INTO `jsh_account` VALUES ('11', 'Chúng tôi', '13000000000', '10000.000000', null, '', '\0', null, '0');
INSERT INTO `jsh_account` VALUES ('12', 'Ngân hàng Nông nghiệp Thượng Hải', '65324345234523211', '10000.000000', '0.000000', '', '\0', null, '0');
INSERT INTO `jsh_account` VALUES ('13', 'Tài khoản 1', 'abcd123', '0.000000', null, '', '', '1', '0');
INSERT INTO `jsh_account` VALUES ('14', 'Tài khoản 1', 'zhanghu1', '0.000000', null, '', '', '117', '0');
INSERT INTO `jsh_account` VALUES ('15', 'Tài khoản 2222', 'zh2222', '0.000000', null, '', '\0', '117', '0');
INSERT INTO `jsh_account` VALUES ('16', 'Tài khoản 1', '1231241244', '0.000000', null, '', '', '115', '0');
INSERT INTO `jsh_account` VALUES ('17', 'Tài khoản 1', 'zzz111', '0.000000', null, '', '', '63', '0');
INSERT INTO `jsh_account` VALUES ('18', 'Tài khoản 2', '1234131324', '0.000000', null, '', '\0', '63', '0');

-- ----------------------------
-- Table structure for jsh_accounthead
-- ----------------------------
DROP TABLE IF EXISTS `jsh_accounthead`;
CREATE TABLE `jsh_accounthead` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `Type` varchar(50) DEFAULT NULL COMMENT 'Loại (chi phí / doanh thu / nhận / thanh toán / chuyển khoản)',
  `OrganId` bigint(20) DEFAULT NULL COMMENT 'Id đơn vị (Đơn vị nhận / thanh toán)',
  `HandsPersonId` bigint(20) DEFAULT NULL COMMENT 'Xử lý Man Id',
  `ChangeAmount` decimal(24,6) DEFAULT NULL COMMENT 'Thay đổi số tiền (ưu đãi / nhận / thanh toán / thanh toán)',
  `TotalPrice` decimal(24,6) DEFAULT NULL COMMENT 'Tổng số tiền',
  `AccountId` bigint(20) DEFAULT NULL COMMENT 'Tài khoản (nhận / thanh toán)',
  `BillNo` varchar(50) DEFAULT NULL COMMENT 'Số tài liệu',
  `BillTime` datetime DEFAULT NULL COMMENT 'Ngày lập hồ sơ',
  `Remark` varchar(100) DEFAULT NULL COMMENT 'Ghi chú',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT 'Người thuê id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT 'Xóa dấu, 0 không xóa, 1 xóa',
  PRIMARY KEY (`Id`),
  KEY `FK9F4C0D8DB610FC06` (`OrganId`),
  KEY `FK9F4C0D8DAAE50527` (`AccountId`),
  KEY `FK9F4C0D8DC4170B37` (`HandsPersonId`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='Thạc sĩ tài chính';

-- ----------------------------
-- Records of jsh_accounthead
-- ----------------------------
INSERT INTO `jsh_accounthead` VALUES ('57', 'Thanh toán tạm ứng', '8', '3', null, '1000.000000', null, '2342134', '2017-06-27 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('61', 'Thanh toán tạm ứng', '9', '3', null, '33.000000', null, 'SYF2017062901721', '2017-06-29 00:00:00', 'aaaaaa', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('67', 'Thanh toán tạm ứng', '10', '4', null, '2100.000000', null, 'SYF2017070222414', '2017-07-02 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('70', 'Chi tiêu', '4', '3', '-60.000000', '-60.000000', '4', 'ZC20170703233735', '2017-07-03 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('74', 'Chuyển khoản', null, '3', '-100.000000', '-100.000000', '4', 'ZZ2017070323489', '2017-07-03 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('77', 'Thu nhập', '2', '3', '40.000000', '40.000000', '4', 'SR20170704222634', '2017-07-04 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('78', 'Thanh toán tạm ứng', '9', '3', null, '200.000000', null, 'SYF201707050257', '2017-07-05 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('79', 'Thanh toán tạm ứng', '9', '3', null, '100.000000', null, 'SYF20170705076', '2017-07-05 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('82', 'Bộ sưu tập', '2', '3', '0.000000', '2.600000', null, 'SK20171008191440', '2017-10-09 00:08:11', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('83', 'Thanh toán', '1', '4', '0.000000', '-20.000000', null, 'FK20171008232825', '2017-10-08 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('84', 'Thu nhập', '2', '4', '0.000000', '21.000000', '10', 'SR20171009000300', '2017-10-09 00:03:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('85', 'Thu nhập', '2', '3', '22.000000', '22.000000', '11', 'SR20171009000637', '2017-10-09 00:06:37', '备注123 备注123 备注123', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('86', 'Chuyển khoản', null, '4', '-22.000000', '-22.000000', '10', 'ZZ20171009000719', '2017-10-09 00:07:19', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('87', 'Thanh toán', '4', '4', '10.000000', '-33.000000', null, 'FK20171009000747', '2017-10-09 00:07:47', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('88', 'Bộ sưu tập', '2', '4', '0.000000', '2.800000', null, 'SK20171024220754', '2017-10-24 22:07:54', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('89', 'Bộ sưu tập', '2', '4', '0.000000', '11.000000', null, 'SK20171030232535', '2017-10-30 23:25:35', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('90', 'Bộ sưu tập', '2', '4', '0.000000', '10.000000', null, 'SK20171119231440', '2017-11-19 23:14:40', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('91', 'Thu nhập', '48', '9', '66.000000', '6.000000', '13', 'SR20190319221438', '2019-03-19 22:14:38', '', '1', '0');
INSERT INTO `jsh_accounthead` VALUES ('92', 'Chi tiêu', '50', '9', '-33.000000', '-33.000000', '13', 'ZC20190319221454', '2019-03-19 22:14:54', '', '1', '0');
INSERT INTO `jsh_accounthead` VALUES ('93', 'Bộ sưu tập', '48', '9', null, '44.000000', null, 'SK20190319221513', '2019-03-19 22:15:13', '', '1', '0');
INSERT INTO `jsh_accounthead` VALUES ('94', 'Thanh toán', '50', '9', null, '-66.000000', null, 'FK20190319221525', '2019-03-19 22:15:25', '', '1', '0');
INSERT INTO `jsh_accounthead` VALUES ('95', 'Thanh toán tạm ứng', '49', '9', null, '6.000000', null, 'SYF20190319221556', '2019-03-19 22:15:56', '', '1', '0');
INSERT INTO `jsh_accounthead` VALUES ('96', 'Thu nhập', '5', '4', '22.000000', '22.000000', '12', 'SR20190321235925', '2019-03-21 23:59:25', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('97', 'Thu nhập', '58', '16', '10.000000', '10.000000', '17', 'SR20191228121609', '2019-12-28 12:16:09', '', '63', '0');
INSERT INTO `jsh_accounthead` VALUES ('98', 'Chi tiêu', '57', '16', '-20.000000', '-20.000000', '17', 'ZC20191228121854', '2019-12-28 12:18:54', '', '63', '0');
INSERT INTO `jsh_accounthead` VALUES ('99', 'Bộ sưu tập', '58', '16', null, '20.000000', null, 'SK20191228121908', '2019-12-28 12:19:08', '', '63', '0');
INSERT INTO `jsh_accounthead` VALUES ('100', 'Thanh toán', '68', '16', null, '-20.000000', null, 'FK20191228121920', '2019-12-28 12:19:20', '', '63', '0');
INSERT INTO `jsh_accounthead` VALUES ('101', 'Chuyển khoản', null, '16', '-20.000000', '-20.000000', '18', 'ZZ20191228121932', '2019-12-28 12:19:32', '', '63', '0');
INSERT INTO `jsh_accounthead` VALUES ('102', 'Thanh toán tạm ứng', '60', '16', null, '1000.000000', null, 'SYF20191228121945', '2019-12-28 12:19:45', '', '63', '0');

-- ----------------------------
-- Table structure for jsh_accountitem
-- ----------------------------
DROP TABLE IF EXISTS `jsh_accountitem`;
CREATE TABLE `jsh_accountitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `HeaderId` bigint(20) NOT NULL COMMENT 'Id tiêu đề',
  `AccountId` bigint(20) DEFAULT NULL COMMENT 'Tài khoản Id',
  `InOutItemId` bigint(20) DEFAULT NULL COMMENT 'Id dự án doanh thu và chi tiêu',
  `EachAmount` decimal(24,6) DEFAULT NULL COMMENT 'Số tiền duy nhất',
  `Remark` varchar(100) DEFAULT NULL COMMENT 'Nhận xét tài liệu',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT 'Người thuê id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT 'Xóa dấu, 0 không xóa, 1 xóa',
  PRIMARY KEY (`Id`),
  KEY `FK9F4CBAC0AAE50527` (`AccountId`),
  KEY `FK9F4CBAC0C5FE6007` (`HeaderId`),
  KEY `FK9F4CBAC0D203EDC5` (`InOutItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='Tài chính';

-- ----------------------------
-- Records of jsh_accountitem
-- ----------------------------
INSERT INTO `jsh_accountitem` VALUES ('58', '57', '9', null, '1000.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('62', '61', '4', null, '33.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('68', '67', '4', null, '2100.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('71', '70', null, '11', '60.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('75', '74', '9', null, '100.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('78', '77', null, '14', '40.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('79', '78', '9', null, '200.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('80', '79', '9', null, '100.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('83', '82', '10', null, '2.600000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('84', '83', '10', null, '-20.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('85', '84', null, '13', '21.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('86', '85', null, '12', '22.000000', '44', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('87', '86', '11', null, '22.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('88', '87', '10', null, '-33.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('89', '88', '10', null, '2.800000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('90', '89', '11', null, '11.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('91', '90', '12', null, '10.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('92', '91', null, '16', '66.000000', '', '1', '0');
INSERT INTO `jsh_accountitem` VALUES ('93', '92', null, '17', '33.000000', '', '1', '0');
INSERT INTO `jsh_accountitem` VALUES ('94', '93', '13', null, '44.000000', '', '1', '0');
INSERT INTO `jsh_accountitem` VALUES ('95', '94', '13', null, '-66.000000', '', '1', '0');
INSERT INTO `jsh_accountitem` VALUES ('96', '95', '13', null, '6.000000', '', '1', '0');
INSERT INTO `jsh_accountitem` VALUES ('97', '96', null, '14', '22.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('98', '97', null, '22', '10.000000', '', '63', '0');
INSERT INTO `jsh_accountitem` VALUES ('99', '98', null, '21', '20.000000', '', '63', '0');
INSERT INTO `jsh_accountitem` VALUES ('100', '99', '17', null, '20.000000', '', '63', '0');
INSERT INTO `jsh_accountitem` VALUES ('101', '100', '17', null, '-20.000000', '', '63', '0');
INSERT INTO `jsh_accountitem` VALUES ('102', '101', '17', null, '20.000000', '', '63', '0');
INSERT INTO `jsh_accountitem` VALUES ('103', '102', '17', null, '1000.000000', '', '63', '0');

-- ----------------------------
-- Table structure for jsh_depot
-- ----------------------------
DROP TABLE IF EXISTS `jsh_depot`;
CREATE TABLE `jsh_depot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `name` varchar(20) DEFAULT NULL COMMENT 'Tên kho',
  `address` varchar(50) DEFAULT NULL COMMENT 'Địa chỉ kho',
  `warehousing` decimal(24,6) DEFAULT NULL COMMENT 'Phí lưu trữ',
  `truckage` decimal(24,6) DEFAULT NULL COMMENT 'Phí di chuyển',
  `type` int(10) DEFAULT NULL COMMENT 'Loại',
  `sort` varchar(10) DEFAULT NULL COMMENT 'Sắp xếp',
  `remark` varchar(100) DEFAULT NULL COMMENT 'Mô tả',
  `principal` bigint(20) DEFAULT NULL COMMENT 'Người phụ trách',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT 'Người thuê id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT 'Xóa dấu, 0 không xóa, 1 xóa',
  `is_default` bit(1) DEFAULT NULL COMMENT 'Cho dù mặc định',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Bảng kho';

-- ----------------------------
-- Records of jsh_depot
-- ----------------------------
INSERT INTO `jsh_depot` VALUES ('1', 'Cửa hàng Dieshi Kiều', '地址222', '33.000000', '22.000000', '0', '2', '上海33', '95', null, '0', null);
INSERT INTO `jsh_depot` VALUES ('2', 'Trụ sở công ty', '地址12355', '44.000000', '22.220000', '0', '1', '总部', '64', null, '0', null);
INSERT INTO `jsh_depot` VALUES ('3', 'Cửa hàng cát', '地址666', '31.000000', '4.000000', '0', '3', '苏州', '64', null, '0', null);
INSERT INTO `jsh_depot` VALUES ('4', '1268200294', '', null, null, '1', '1', '', null, null, '0', null);
INSERT INTO `jsh_depot` VALUES ('5', '1268787965', null, null, null, '1', '3', '', null, null, '0', null);
INSERT INTO `jsh_depot` VALUES ('6', '1269520625', null, null, null, '1', '2', '', null, null, '0', null);
INSERT INTO `jsh_depot` VALUES ('7', 'Kho 1', '', null, null, '0', '', '', null, '1', '0', null);
INSERT INTO `jsh_depot` VALUES ('8', 'Kho 1111', '', null, null, '0', '', '', '117', '117', '0', null);
INSERT INTO `jsh_depot` VALUES ('9', 'Kho 567', '', null, null, '0', '', '', '117', '117', '0', null);
INSERT INTO `jsh_depot` VALUES ('10', 'Kho 321342', '', null, null, '0', '', '', null, '117', '0', null);
INSERT INTO `jsh_depot` VALUES ('11', 'Kho 321321', '', null, null, '0', '', '', null, '117', '0', null);
INSERT INTO `jsh_depot` VALUES ('12', 'Kho 111222', '', null, null, '0', '', '', null, '117', '0', null);
INSERT INTO `jsh_depot` VALUES ('13', 'Kho 1', '', null, null, '0', '', '', null, '115', '0', null);
INSERT INTO `jsh_depot` VALUES ('14', 'Kho 1', '', null, null, '0', '', '', null, '63', '0', '');
INSERT INTO `jsh_depot` VALUES ('15', 'Kho 2', '', null, null, '0', '', '', null, '63', '0', '\0');

-- ----------------------------
-- Table structure for jsh_depothead
-- ----------------------------
DROP TABLE IF EXISTS `jsh_depothead`;
CREATE TABLE `jsh_depothead` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `Type` varchar(50) DEFAULT NULL COMMENT 'Loại (ra / vào)',
  `SubType` varchar(50) DEFAULT NULL COMMENT 'Phân loại ra nước ngoài',
  `ProjectId` bigint(20) DEFAULT NULL COMMENT 'Id dự án',
  `DefaultNumber` varchar(50) DEFAULT NULL COMMENT 'Số vé ban đầu',
  `Number` varchar(50) DEFAULT NULL COMMENT 'Số vé',
  `OperPersonName` varchar(50) DEFAULT NULL COMMENT 'Tên nhà khai thác',
  `CreateTime` datetime DEFAULT NULL COMMENT 'Thời gian sáng tạo',
  `OperTime` datetime DEFAULT NULL COMMENT 'Thời gian đi',
  `OrganId` bigint(20) DEFAULT NULL COMMENT 'Id nhà cung cấp',
  `HandsPersonId` bigint(20) DEFAULT NULL COMMENT 'Id mua hàng / xử lý đón khách',
  `AccountId` bigint(20) DEFAULT NULL COMMENT 'Tài khoản Id',
  `ChangeAmount` decimal(24,6) DEFAULT NULL COMMENT 'Thay đổi số tiền (nhận / thanh toán)',
  `AllocationProjectId` bigint(20) DEFAULT NULL COMMENT 'Khi chuyển nhượng, Id dự án của đối tác',
  `TotalPrice` decimal(24,6) DEFAULT NULL COMMENT 'Tổng số tiền',
  `PayType` varchar(50) DEFAULT NULL COMMENT 'Loại thanh toán (tiền mặt, sổ sách kế toán, v.v.)',
  `Remark` varchar(1000) DEFAULT NULL COMMENT 'Ghi chú',
  `Salesman` varchar(50) DEFAULT NULL COMMENT 'Nhân viên bán hàng (nhiều)',
  `AccountIdList` varchar(50) DEFAULT NULL COMMENT 'Danh sách ID nhiều tài khoản',
  `AccountMoneyList` varchar(200) DEFAULT '' COMMENT 'Danh sách số tiền nhiều tài khoản',
  `Discount` decimal(24,6) DEFAULT NULL COMMENT 'Tỷ lệ chiết khấu',
  `DiscountMoney` decimal(24,6) DEFAULT NULL COMMENT 'Số tiền chiết khấu',
  `DiscountLastMoney` decimal(24,6) DEFAULT NULL COMMENT 'Số tiền sau khi giảm giá',
  `OtherMoney` decimal(24,6) DEFAULT NULL COMMENT 'Tổng chi phí bán hoặc mua',
  `OtherMoneyList` varchar(200) DEFAULT NULL COMMENT 'Chi phí bán hoặc mua liên quan đến mảng ID dự án (bao gồm chuyển phát nhanh, khách sạn, v.v.)',
  `OtherMoneyItem` varchar(200) DEFAULT NULL COMMENT 'Chi phí bán hoặc mua liên quan đến các mặt hàng (bao gồm chuyển phát nhanh, khách sạn, v.v.)',
  `AccountDay` int(10) DEFAULT NULL COMMENT 'Ngày giải quyết',
  `Status` varchar(1) DEFAULT '0' COMMENT 'Tình trạng, 0 chưa xem xét, 1 đánh giá, 2 chuyển sang mua sắm | bán hàng',
  `LinkNumber` varchar(50) DEFAULT NULL COMMENT 'Số thứ tự liên kết',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT 'Người thuê id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT 'Xóa dấu, 0 không xóa, 1 xóa',
  PRIMARY KEY (`Id`),
  KEY `FK2A80F214CA633ABA` (`AllocationProjectId`),
  KEY `FK2A80F214C4170B37` (`HandsPersonId`),
  KEY `FK2A80F214B610FC06` (`OrganId`),
  KEY `FK2A80F2142888F9A` (`ProjectId`),
  KEY `FK2A80F214AAE50527` (`AccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8 COMMENT='Thạc sĩ tài liệu';

-- ----------------------------
-- Records of jsh_depothead
-- ----------------------------
INSERT INTO `jsh_depothead` VALUES ('7', 'Kho', 'Mua hàng', null, 'GHDD201708120002', 'GHDD201708120002', '季圣华', '2017-08-12 12:04:07', '2017-08-12 12:03:23', '1', null, '12', '-30.000000', null, '-36.000000', '现付', 'abcdefg', '', null, null, '10.000000', '3.600000', '32.400000', '30.000000', '[\"10\",\"9\"]', '[\"10\",\"20\"]', '45', '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('8', 'Ra nước ngoài', 'Bán hàng', null, 'XHDD201708120001', 'XHDD201708120001', '季圣华', '2017-08-12 18:10:14', '2017-08-12 18:09:45', '2', null, '11', '17.000000', null, '24.000000', '现付', '', '<7>,<6>', null, null, '22.000000', '5.280000', '18.720000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('9', 'Kho', 'Mua hàng', null, 'GHDD201708120003', 'GHDD201708120003', '季圣华', '2017-08-12 21:01:09', '2017-08-12 21:00:36', '1', null, '11', '-100.000000', null, '-120.000000', '现付', '', '', null, null, '10.000000', '12.000000', '108.000000', null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('10', 'Kho', 'Mua hàng', null, 'GHDD201708120004', 'GHDD201708120004', '季圣华', '2017-08-12 21:10:42', '2017-08-12 21:10:16', '1', null, '4', '-10.000000', null, '-12.000000', '现付', '', '', null, null, '10.000000', '1.200000', '10.800000', null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('11', 'Kho', 'Mua hàng', null, 'GHDD201708120005', 'jshenghua001', '季圣华', '2017-08-12 22:07:44', '2017-08-12 22:06:37', '1', null, '12', '-20.000000', null, '-24.000000', '现付', '', '', null, null, '10.000000', '2.400000', '21.600000', null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('12', 'Kho', 'Mua hàng', null, 'GHDD201708120006', 'GHDD201708120006', '季圣华', '2017-08-12 22:17:11', '2017-08-12 22:16:35', '1', null, '11', '-10.000000', null, '-12.000000', '现付', '', '', null, null, '10.000000', '1.200000', '10.800000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('13', 'Kho', 'Mua hàng', null, 'GHDD201708120007', 'jishenghua3', '季圣华', '2017-08-12 22:17:52', '2017-08-12 22:17:14', '1', null, '4', '-20.000000', null, '-24.000000', '现付', '', '', null, null, '10.000000', '2.400000', '21.600000', null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('14', 'Kho', 'Mua hàng', null, 'GHDD201708120008', 'jishenghua004', '季圣华', '2017-08-12 22:19:37', '2017-08-12 22:19:07', '1', null, '11', '-30.000000', null, '-36.000000', '现付', '', '', null, null, '10.000000', '3.600000', '32.400000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('16', 'Kho', 'Mua hàng', null, 'GHDD201708120009', 'jishenghua005', '季圣华', '2017-08-12 22:26:23', '2017-08-12 22:25:14', '1', null, '10', '-20.000000', null, '-24.000000', '现付', '', '', null, null, '10.000000', '2.400000', '21.600000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('17', 'Kho', 'Mua hàng', null, 'GHDD201708120010', 'GHDD201708120010', '季圣华', '2017-08-12 22:28:20', '2017-08-12 22:28:02', '1', null, '9', '-30.000000', null, '-36.000000', '现付', '', '', null, null, '10.000000', '3.600000', '32.400000', null, '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('18', 'Kho', 'Mua hàng', null, 'GHDD201708120011', 'GHDD201708120011', '季圣华', '2017-08-12 22:30:08', '2017-08-12 22:29:48', '1', null, '4', '-20.000000', null, '-24.000000', '现付', '', '', null, null, '10.000000', '2.400000', '21.600000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('19', 'Kho', 'Mua hàng', null, 'GHDD201708120012', 'GHDD201708120012', '季圣华', '2017-08-12 22:30:57', '2017-08-12 22:29:32', '1', null, null, '-10.000000', null, '-26.400000', '现付', '', '', '[\"4\"]', '[\"-10\"]', '10.000000', '2.640000', '23.760000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('20', 'Kho', 'Mua hàng', null, 'GHDD201708120013', 'GHDD201708120013', '季圣华', '2017-08-12 22:46:43', '2017-08-12 22:45:55', '1', null, '10', '-23.000000', null, '-36.000000', '现付', '', '', null, null, '20.000000', '7.200000', '28.800000', null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('21', 'Kho', 'Mua hàng', null, 'GHDD201708120014', 'GHDD201708120014', '季圣华', '2017-08-12 22:46:52', '2017-08-12 22:45:59', '1', null, '11', '-20.000000', null, '-26.400000', '现付', '', '', null, null, '10.000000', '2.640000', '23.760000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('22', 'Kho', 'Mua hàng', null, 'GHDD201708120015', 'GHDD201708120015', '季圣华', '2017-08-12 23:49:32', '2017-08-12 23:48:24', '1', null, '11', '-20.000000', null, '-24.000000', '现付', '', '', null, null, '10.000000', '2.400000', '21.600000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('23', 'Kho', 'Mua hàng', null, 'GHDD201708140001', 'GHDD201708140001', '季圣华', '2017-08-14 20:41:54', '2017-08-14 20:40:49', '1', null, '4', '-300.000000', null, '-360.000000', '现付', '', '', null, null, '10.000000', '36.000000', '324.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('24', 'Kho', 'Mua hàng', null, 'GHDD201708150001', 'GHDD201708150001', '季圣华', '2017-08-15 21:36:25', '2017-08-15 21:35:38', '1', null, '11', '-675.000000', null, '-750.000000', '现付', '', '', null, null, '10.000000', '75.000000', '675.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('25', 'Kho', 'Mua hàng', null, 'GHDD201708150002', 'GHDD201708150002', '季圣华', '2017-08-15 22:31:46', '2017-08-15 22:29:47', '1', null, null, '-33.000000', null, '-75.000000', '现付', 'ababab', '', '[\"9\",\"10\"]', '[\"-22\",\"-11\"]', '10.000000', '7.500000', '67.500000', '22.000000', '[\"10\",\"8\"]', '[\"11\",\"11\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('26', 'Kho', 'Mua hàng', null, 'GHDD201708160001', 'GHDD201708160001', '季圣华', '2017-08-16 23:50:35', '2017-08-16 23:47:42', '4', null, '9', '-162.000000', null, '-150.000000', '现付', '', '', null, null, '10.000000', '18.000000', '162.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('27', 'Kho', 'Mua hàng', null, 'GHDD201708180001', 'GHDD201708180001', '季圣华', '2017-08-18 00:25:58', '2017-08-18 00:25:43', '1', null, '11', '-74.250000', null, '-75.000000', '现付', '', '', null, null, '10.000000', '8.250000', '74.250000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('28', 'Kho', 'Mua hàng', null, 'GHDD201708270001', 'GHDD201708270001', '季圣华', '2017-08-27 23:10:44', '2017-08-27 23:06:05', '46', null, '10', '-64.800000', null, '-72.000000', '现付', '', '', null, null, '10.000000', '7.200000', '64.800000', '10.000000', '[\"10\"]', '[\"10\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('29', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK201708280001', 'XSCK201708280001', '季圣华', '2017-08-28 23:06:40', '2017-08-28 23:05:11', '2', null, '11', '120.850000', null, '130.000000', '现付', '', '<7>', null, null, '10.000000', '13.650000', '122.850000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('30', 'Kho', 'Bán hàng Trả về', null, 'XSTH201708280001', 'XSTH201708280001', '季圣华', '2017-08-28 23:13:08', '2017-08-28 23:12:48', '2', null, '10', '-48.000000', null, '-48.000000', '现付', '', '<5>,<6>', null, null, '0.000000', '0.000000', '48.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('31', 'Ra nước ngoài', 'Mua hàngTrả về', null, 'CGTH201708280001', 'CGTH201708280001', '季圣华', '2017-08-28 23:15:45', '2017-08-28 23:15:21', '1', null, '10', '28.600000', null, '26.000000', '现付', '', '', null, null, '0.000000', '0.000000', '28.600000', '12.000000', '[\"10\"]', '[\"12\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('32', 'Kho', 'Khác', null, 'QTRK201708280001', 'QTRK201708280001', '季圣华', '2017-08-28 23:17:55', '2017-08-28 23:17:33', '1', null, null, null, null, '12.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('33', 'Ra nước ngoài', 'Khác', null, 'QTCK201708280001', 'QTCK201708280001', '季圣华', '2017-08-28 23:21:14', '2017-08-28 23:20:36', '2', null, null, null, null, '65.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('37', 'Ra nước ngoài', 'Phân bổ', null, 'DBCK201708280002', 'DBCK201708280002', '季圣华', '2017-08-28 23:56:34', '2017-08-28 23:56:10', null, null, null, null, null, '1.300000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('38', 'Ra nước ngoài', 'Phân bổ', null, 'DBCK201708290001', 'DBCK201708290001', '季圣华', '2017-08-29 00:20:11', '2017-08-29 00:19:58', null, null, null, null, null, '2.600000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('41', 'Ra nước ngoài', 'Bán lẻ', null, 'LSCK201708290002', 'LSCK201708290002', '季圣华', '2017-08-29 23:29:39', '2017-08-29 23:29:06', '7', null, '10', '42.000000', null, '42.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('42', 'Ra nước ngoài', 'Bán lẻ', null, 'LSCK201708290003', 'LSCK201708290003', '季圣华', '2017-08-29 23:35:12', '2017-08-29 23:33:21', '7', null, '11', '11.000000', null, '11.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('43', 'Ra nước ngoài', 'Bán lẻ', null, 'LSCK201708290004', 'LSCK201708290004', '季圣华', '2017-08-29 23:39:44', '2017-08-29 23:39:28', '7', null, '9', '12.100000', null, '12.100000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('44', 'Kho', 'Bán lẻTrả về', null, 'LSTH201708290001', 'LSTH201708290001', '季圣华', '2017-08-29 23:48:43', '2017-08-29 23:46:35', '7', null, '10', '-2.200000', null, '-2.200000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('45', 'Kho', 'Bán lẻTrả về', null, 'LSTH201708290002', 'LSTH201708290002', '季圣华', '2017-08-29 23:51:55', '2017-08-29 23:51:31', '7', null, '12', '-3.300000', null, '-3.300000', '现付', '', '', null, null, null, null, null, null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('48', 'Ra nước ngoài', 'Bán lẻ', null, 'LSCK201708310001', 'LSCK201708310001', '季圣华', '2017-08-31 00:30:31', '2017-08-31 00:29:10', '7', null, null, '12.000000', null, '12.000000', '现付', '', '', '[\"10\",\"11\"]', '[\"15\",\"20\"]', null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('49', 'Ra nước ngoài', 'Bán lẻ', null, 'LSCK201708310002', 'LSCK201708310002', '季圣华', '2017-08-31 00:57:40', '2017-08-31 00:57:08', '7', null, null, '12.000000', null, '12.000000', '现付', '', '', '[\"9\",\"11\"]', '[\"22\",\"11\"]', null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('50', 'Ra nước ngoài', 'Bán lẻ', null, 'LSCK201709030001', 'LSCK201709030001', '季圣华', '2017-09-03 12:51:50', '2017-09-03 12:51:21', '10', null, '10', '22.000000', null, '22.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('52', 'Ra nước ngoài', 'Bán lẻ', null, 'LSCK201709040001', 'LSCK201709040001', '季圣华', '2017-09-04 21:32:49', '2017-09-04 21:31:24', '7', null, '11', '24.200000', null, '24.200000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('53', 'Ra nước ngoài', 'Bán lẻ', null, 'LSCK201709040002', 'LSCK201709040002', '季圣华', '2017-09-04 21:34:02', '2017-09-04 21:33:30', '7', null, '9', '36.300000', null, '36.300000', '现付', '', '', null, null, null, null, null, null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('54', 'Kho', 'Mua hàng', null, 'CGRK201709040001', 'CGRK201709040001', '季圣华', '2017-09-04 22:20:12', '2017-09-04 22:13:00', '1', null, '10', '-10.800000', null, '-12.000000', '现付', '', '', null, null, '10.000000', '1.200000', '10.800000', '12.000000', '[\"9\"]', '[\"12\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('57', 'Kho', 'Mua hàng', null, 'CGRK201709050001', 'CGRK201709050001', '季圣华', '2017-09-05 22:37:54', '2017-09-05 22:37:31', '1', null, '11', '-182.520000', null, '-182.400000', '现付', '', '', null, null, '0.000000', '0.000000', '182.520000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('63', 'Kho', 'Mua hàng', null, 'CGRK201709170001', 'CGRK201709170001', '季圣华', '2017-09-17 21:45:14', '2017-09-17 21:44:50', '1', null, '10', '-13.200000', null, '-12.000000', '现付', '', '', null, null, '0.000000', '0.000000', '13.200000', null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('65', 'Kho', 'Mua hàng', null, 'CGRK201709170002', 'CGRK201709170002', '季圣华', '2017-09-17 21:47:07', '2017-09-17 20:45:55', '1', null, null, '-42.000000', null, '-39.000000', '现付', '', '', '[\"12\",\"9\"]', '[\"-20\",\"-22\"]', '0.000000', '0.000000', '42.900000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('68', 'Khác', 'Danh sách hội', null, 'ZZD2017092000001', 'ZZD2017092000001', '季圣华', '2017-09-20 23:29:28', '2017-09-20 23:29:13', null, null, null, null, null, '7.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('69', 'Khác', 'Trình tự tháo gỡ', null, 'CXD2017092000001', 'CXD2017092000001', '季圣华', '2017-09-20 23:40:55', '2017-09-20 23:40:41', null, null, null, null, null, '0.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('70', 'Kho', 'Mua hàng', null, 'CGRK201709210001', 'CGRK201709210001', '季圣华', '2017-09-21 22:37:20', '2017-09-21 22:36:37', '1', null, null, '-50.000000', null, '-50.000000', '现付', '', '', '[\"4\",\"9\"]', '[\"-10\",\"-40\"]', '0.000000', '0.000000', '50.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('71', 'Kho', 'Bán hàngTrả về', null, 'XSTH201709210001', 'XSTH201709210001', '季圣华', '2017-09-21 22:39:00', '2017-09-21 22:38:37', '2', null, '11', '-48.000000', null, '-48.000000', '现付', '', '<6>,<7>', null, null, '0.000000', '0.000000', '48.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('72', 'Kho', 'Khác', null, 'QTRK201709210001', 'QTRK201709210001', '季圣华', '2017-09-21 22:39:26', '2017-09-21 22:39:14', '4', null, null, null, null, '24.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('73', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK201709210001', 'XSCK201709210001', '季圣华', '2017-09-21 22:40:01', '2017-09-21 22:39:44', '2', null, '11', '10.000000', null, '10.000000', '现付', '', '<6>', null, null, '0.000000', '0.000000', '10.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('74', 'Ra nước ngoài', 'Mua hàngTrả về', null, 'CGTH201709210001', 'CGTH201709210001', '季圣华', '2017-09-21 22:40:57', '2017-09-21 22:40:38', '4', null, '4', '5.000000', null, '5.000000', '现付', '', '', null, null, '0.000000', '0.000000', '5.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('75', 'Ra nước ngoài', 'Khác', null, 'QTCK201709210001', 'QTCK201709210001', '季圣华', '2017-09-21 22:41:15', '2017-09-21 22:41:02', '2', null, null, null, null, '13.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('76', 'Ra nước ngoài', 'Phân bổ', null, 'DBCK201709210001', 'DBCK201709210001', '季圣华', '2017-09-21 22:41:36', '2017-09-21 22:41:19', null, null, null, null, null, '10.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('77', 'Ra nước ngoài', 'Bán lẻ', null, 'LSCK201709210001', 'LSCK201709210001', '季圣华', '2017-09-21 22:42:44', '2017-09-21 22:42:21', '7', null, '4', '2.200000', null, '2.200000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('78', 'Kho', 'Bán lẻTrả về', null, 'LSTH201709210001', 'LSTH201709210001', '季圣华', '2017-09-21 22:46:07', '2017-09-21 22:45:49', '7', null, '4', '-2.200000', null, '-2.200000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('79', 'Kho', 'Mua hàng', null, 'CGRK201709210002', 'CGRK201709210002', '季圣华', '2017-09-21 23:16:37', '2017-09-21 23:16:21', '1', null, '11', '-23.760000', null, '-21.600000', '现付', '', '', null, null, '0.000000', '0.000000', '23.760000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('80', 'Khác', 'Danh sách hội', null, 'ZZD2017092100001', 'ZZD2017092100001', '季圣华', '2017-09-21 23:17:16', '2017-09-21 23:16:59', null, null, null, null, null, '5.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('82', 'Kho', 'Mua hàng', null, 'CGRK201709220001', 'CGRK201709220001', '季圣华', '2017-09-22 23:06:01', '2017-09-22 23:05:39', '1', null, null, '-50.000000', null, '-52.000000', '现付', '', '', '[\"11\",\"9\"]', '[\"-20\",\"-30\"]', '10.000000', '5.720000', '51.480000', '5.000000', '[\"11\",\"10\"]', '[\"2\",\"3\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('84', 'Kho', 'Mua hàng', null, 'CGRK201709220002', 'CGRK201709220002', '季圣华', '2017-09-22 23:22:02', '2017-09-22 23:21:48', '1', null, '10', '-26.400000', null, '-24.000000', '现付', '', '', null, null, '0.000000', '0.000000', '26.400000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('85', 'Kho', 'Mua hàng', null, 'CGRK201709240001', 'CGRK201709240001', '季圣华', '2017-09-24 22:46:00', '2017-09-24 22:44:35', '4', null, null, '-85.000000', null, '-75.000000', '现付', '', '', '[\"10\",\"9\"]', '[\"-20\",\"-65\"]', '0.000000', '0.000000', '87.750000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('87', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK201709250001', 'XSCK201709250001', '季圣华', '2017-09-25 22:24:08', '2017-09-25 22:23:47', '2', null, '10', '4.000000', null, '4.000000', '现付', '', '<6>', null, null, '0.000000', '0.000000', '4.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('88', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK201709250002', 'XSCK201709250002', '季圣华', '2017-09-25 22:36:51', '2017-09-25 22:35:09', '2', null, '10', '39.600000', null, '40.000000', '现付', '', '<7>', null, null, '10.000000', '4.400000', '39.600000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('89', 'Kho', 'Bán lẻTrả về', null, 'LSTH201709260001', 'LSTH201709260001', '季圣华', '2017-09-26 00:26:52', '2017-09-26 00:26:19', '7', null, '9', '-18.000000', null, '-18.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('90', 'Ra nước ngoài', 'Bán lẻ', null, 'LSCK201709260001', 'LSCK201709260001', '季圣华', '2017-09-26 22:31:24', '2017-09-26 22:29:50', '7', null, null, '100.000000', null, '100.000000', '现付', '', '', '[\"10\",\"11\"]', '[\"60\",\"40\"]', null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('93', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK201710080001', 'XSCK201710080001', '季圣华', '2017-10-08 19:12:23', '2017-10-08 19:11:44', '2', null, '10', '0.000000', null, '2.600000', '现付', '', '<7>', null, null, '0.000000', '0.000000', '2.600000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('94', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK201710080002', 'XSCK201710080002', '季圣华', '2017-10-08 19:58:55', '2017-10-08 19:58:27', '5', null, '9', '0.000000', null, '8.000000', '现付', '', '<6>', null, null, '0.000000', '0.000000', '8.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('95', 'Kho', 'Mua hàng', null, 'CGRK201710180001', 'CGRK201710180001', '季圣华', '2017-10-18 23:21:24', '2017-10-18 23:21:12', '1', null, '11', '-2.860000', null, '-2.600000', '现付', '', '', null, null, '0.000000', '0.000000', '2.860000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('96', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK201710240001', 'XSCK201710240001', '季圣华', '2017-10-24 22:04:06', '2017-10-24 22:03:08', '2', null, '9', '0.000000', null, '2.800000', '现付', '', '<7>', null, null, '10.000000', '0.280000', '2.520000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('97', 'Kho', 'Mua hàng', null, 'CGRK201710290001', 'CGRK201710290001', '季圣华', '2017-10-29 23:30:47', '2017-10-29 23:30:08', '4', null, '10', '0.000000', null, '-200.000000', '现付', '', '', null, null, '0.000000', '0.000000', '234.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('98', 'Kho', 'Mua hàng', null, 'CGRK201710290002', 'CGRK201710290002', '季圣华', '2017-10-29 23:32:07', '2017-10-29 23:30:52', '4', null, '10', '0.000000', null, '-300.000000', '现付', '', '', null, null, '0.000000', '0.000000', '351.000000', null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('99', 'Kho', 'Mua hàng', null, 'CGRK201710290003', 'CGRK201710290003', '季圣华', '2017-10-29 23:33:45', '2017-10-29 23:32:11', '4', null, '11', '-10.000000', null, '-720.000000', '现付', '', '', null, null, '0.000000', '0.000000', '842.400000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('101', 'Ra nước ngoài', 'Phân bổ', null, 'DBCK201711020001', 'DBCK201711020001', '季圣华', '2017-11-02 22:51:17', '2017-11-02 22:48:58', null, null, null, '0.000000', null, '50.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('102', 'Ra nước ngoài', 'Bán lẻ', null, 'LSCK201711060001', 'LSCK201711060001', '季圣华', '2017-11-06 20:38:46', '2017-11-06 20:38:01', '7', null, null, '12.000000', null, '12.000000', '现付', '', '', '[\"9\",\"12\"]', '[\"10\",\"2\"]', null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('103', 'Kho', 'Mua hàng', null, 'CGRK201711070001', 'CGRK201711070001', '季圣华', '2017-11-07 21:07:05', '2017-11-07 21:06:53', '1', null, '10', '-26.400000', null, '-24.000000', '现付', '', '', null, '', '0.000000', '0.000000', '26.400000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('104', 'Kho', 'Mua hàng', null, 'CGRK201711070002', 'CGRK201711070002', '季圣华', '2017-11-07 21:07:40', '2017-11-07 21:07:08', '4', null, null, '-11.000000', null, '-10.000000', '现付', '', '', '[\"9\",\"11\"]', '[\"-10\",\"-1\"]', '0.000000', '0.000000', '11.700000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('105', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK201711070001', 'XSCK201711070001', '季圣华', '2017-11-07 21:08:48', '2017-11-07 21:08:34', '2', null, '10', '13.000000', null, '13.000000', '现付', '', '<6>', null, '', '0.000000', '0.000000', '13.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('106', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK201711070002', 'XSCK201711070002', '季圣华', '2017-11-07 21:09:20', '2017-11-07 21:08:51', '2', null, null, '13.000000', null, '13.000000', '现付', '', '<5>', '[\"9\",\"10\"]', '[\"5\",\"8\"]', '0.000000', '0.000000', '13.000000', '54.000000', '[\"11\",\"10\"]', '[\"21\",\"33\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('107', 'Kho', 'Mua hàng', null, 'CGRK201712030001', 'CGRK201712030001', '季圣华', '2017-12-03 22:38:36', '2017-12-03 22:37:26', '4', null, '9', '-1.000000', null, '-1.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('108', 'Kho', 'Mua hàng', null, 'CGRK201712030002', 'sdfasdfa', '季圣华', '2017-12-03 22:40:57', '2017-12-03 22:40:38', '4', null, '4', '-42.120000', null, '-36.000000', '现付', '', '', null, '', '0.000000', '0.000000', '42.120000', null, '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('109', 'Kho', 'Mua hàng', null, 'CGRK201712030003', 'CGRK201712030003', '季圣华', '2017-12-03 22:41:38', '2017-12-03 22:41:01', '4', null, '11', '-1.400000', null, '-1.200000', '现付', '', '', null, '', '0.000000', '0.000000', '1.400000', null, '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('110', 'Kho', 'Mua hàng', null, 'CGRK201712050001', 'CGRK201712050001', '季圣华', '2017-12-05 23:05:48', '2017-12-05 23:05:34', '1', null, '10', '-11.000000', null, '-10.000000', '现付', '', '', null, '', '0.000000', '0.000000', '11.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('111', 'Kho', 'Mua hàng', null, 'CGRK201712050002', 'CGRK201712050002', '季圣华', '2017-12-05 23:12:53', '2017-12-05 23:12:40', '1', null, '10', '0.000000', null, '-20.000000', '现付', '', '', null, '', '0.000000', '0.000000', '22.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('112', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK201712100001', 'XSCK201712100001', '季圣华', '2017-12-10 21:07:45', '2017-12-10 21:07:25', '2', null, '11', '2.600000', null, '2.600000', '现付', '', '<>', null, '', '0.000000', '0.000000', '2.600000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('114', 'Khác', 'Mua hàngĐặt hàng', null, 'CGDD00000000001', 'CGDD00000000001', '季圣华', '2019-03-09 15:49:57', '2019-03-09 15:49:50', '4', null, null, '0.000000', null, '-2.400000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('115', 'Kho', 'Mua hàng', null, 'CGRK00000000002', 'CGRK00000000002', '季圣华', '2019-03-09 15:52:05', '2019-03-09 15:51:45', '4', null, '9', '-257.400000', null, '-220.000000', '现付', '', '', null, '', '0.000000', '0.000000', '257.400000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('116', 'Kho', 'Mua hàng', null, 'CGRK00000000003', 'CGRK00000000003', '季圣华', '2019-03-09 15:52:21', '2019-03-09 15:52:09', '4', null, '9', '-1029.600000', null, '-880.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1029.600000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('117', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK00000000004', 'XSCK00000000004', '季圣华', '2019-03-09 15:53:07', '2019-03-09 15:52:28', '5', null, '9', '110.000000', null, '110.000000', '现付', '', '<7>', null, '', '0.000000', '0.000000', '110.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('118', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK00000000005', 'XSCK00000000005', '季圣华', '2019-03-09 15:57:26', '2019-03-09 15:53:10', '2', null, '9', '11.000000', null, '11.000000', '现付', '', '<7>', null, '', '0.000000', '0.000000', '11.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('119', 'Kho', 'Mua hàng', null, 'CGRK00000000009', 'CGRK00000000009', '季圣华', '2019-03-09 16:02:30', '2019-03-09 16:01:22', '1', null, '9', '-88.000000', null, '-80.000000', '现付', '', '', null, '', '0.000000', '0.000000', '88.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('120', 'Khác', 'Bán hàngĐặt hàng', null, 'XSDD00000000012', 'XSDD00000000012', '季圣华', '2019-03-09 16:27:38', '2019-03-09 22:12:14', '5', null, null, '0.000000', null, '3.900000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('121', 'Kho', 'Mua hàng', null, 'CGRK00000000013', 'CGRK00000000013', '季圣华', '2019-03-09 16:35:53', '2019-03-09 16:35:32', '4', null, '9', '-42.120000', null, '-36.000000', '现付', '', '', null, '', '0.000000', '0.000000', '42.120000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('122', 'Kho', 'Mua hàng', null, 'CGRK00000000015', 'CGRK00000000015', '季圣华', '2019-03-09 16:37:34', '2019-03-09 16:37:01', '4', null, '9', '0.000000', null, '-100.000000', '现付', '', '', null, '', '0.000000', '0.000000', '117.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('123', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK00000000016', 'XSCK00000000016', '季圣华', '2019-03-09 16:38:03', '2019-03-09 16:37:40', '5', null, '9', '0.000000', null, '26.000000', '现付', '', '<7>', null, '', '0.000000', '0.000000', '26.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('124', 'Kho', 'Khác', null, 'QTRK00000000074', 'QTRK00000000074', '季圣华', '2019-03-09 22:35:21', '2019-03-09 22:34:56', '4', null, null, '0.000000', null, '800.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('137', 'Kho', 'Mua hàng', null, 'CGRK00000000125', 'CGRK00000000125', '季圣华', '2019-03-10 16:46:13', '2019-03-10 16:44:32', '4', null, '9', '-2.400000', null, '-2.400000', '现付', '', '', null, '', '0.000000', '0.000000', '2.400000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', 'CGDD00000000001', null, '0');
INSERT INTO `jsh_depothead` VALUES ('139', 'Khác', 'Mua hàngĐặt hàng', null, 'CGDD00000000127', 'CGDD00000000127', '季圣华', '2019-03-10 17:00:24', '2019-03-10 18:52:21', '4', null, null, '0.000000', null, '-50.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('141', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK00000000134', 'XSCK00000000134', '季圣华', '2019-03-10 17:40:13', '2019-03-10 17:39:41', '5', null, '9', '3.900000', null, '3.900000', '现付', '', '', null, '', '0.000000', '0.000000', '3.900000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', 'XSDD00000000012', null, '0');
INSERT INTO `jsh_depothead` VALUES ('142', 'Khác', 'Bán hàngĐặt hàng', null, 'XSDD00000000135', 'XSDD00000000135', '季圣华', '2019-03-10 17:42:11', '2019-03-10 17:44:07', '2', null, null, '0.000000', null, '7.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('144', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK00000000137', 'XSCK00000000137', '季圣华', '2019-03-10 17:44:49', '2019-03-10 17:44:14', '2', null, '9', '7.000000', null, '7.000000', '现付', '', '', null, '', '0.000000', '0.000000', '7.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', 'XSDD00000000135', null, '0');
INSERT INTO `jsh_depothead` VALUES ('147', 'Khác', 'Mua hàngĐặt hàng', null, 'CGDD00000000140', 'CGDD00000000140', '季圣华', '2019-03-10 17:49:51', '2019-03-10 17:49:38', '4', null, null, '0.000000', null, '-240.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('148', 'Kho', 'Mua hàng', null, 'CGRK00000000141', 'CGRK00000000141', '季圣华', '2019-03-10 17:50:19', '2019-03-10 17:50:06', '4', null, '9', '-240.000000', null, '-240.000000', '现付', '', '', null, '', '0.000000', '0.000000', '240.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', 'CGDD00000000140', null, '0');
INSERT INTO `jsh_depothead` VALUES ('155', 'Kho', 'Mua hàng', null, 'CGRK00000000173', 'CGRK00000000173', '季圣华', '2019-03-10 19:21:56', '2019-03-10 19:20:30', '4', null, '4', '-54.080000', null, '-46.220000', '现付', '', '', null, '', '0.000000', '0.000000', '54.080000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', 'CGDD00000000127', null, '0');
INSERT INTO `jsh_depothead` VALUES ('158', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK00000000177', 'XSCK00000000177', '季圣华', '2019-03-10 20:02:32', '2019-03-10 20:02:21', '5', null, '9', '10.000000', null, '10.000000', '现付', '', '', null, '', '0.000000', '0.000000', '10.000000', null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('159', 'Kho', 'Mua hàng', null, 'CGRK00000000178', 'CGRK00000000178', '季圣华', '2019-03-15 23:05:40', '2019-03-15 23:05:28', '46', null, '9', '-19.500000', null, '-19.500000', '现付', '', '', null, '', '0.000000', '0.000000', '19.500000', null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('160', 'Kho', 'Mua hàng', null, 'CGRK00000000179', 'CGRK00000000179', '季圣华', '2019-03-15 23:06:22', '2019-03-15 23:06:03', '46', null, '9', '-1111.000000', null, '-1111.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1111.000000', null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('161', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK00000000180', 'XSCK00000000180', '季圣华', '2019-03-15 23:06:52', '2019-03-15 23:06:38', '2', null, '9', '111.000000', null, '111.000000', '现付', '', '', null, '', '0.000000', '0.000000', '111.000000', null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('162', 'Kho', 'Khác', null, 'QTRK00000000181', 'QTRK00000000181', '季圣华', '2019-03-15 23:08:18', '2019-03-15 23:08:11', '4', null, null, '0.000000', null, '144.300000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('163', 'Ra nước ngoài', 'Phân bổ', null, 'DBCK00000000182', 'DBCK00000000182', '季圣华', '2019-03-15 23:08:32', '2019-03-15 23:08:22', null, null, null, '0.000000', null, '111.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('164', 'Ra nước ngoài', 'Bán lẻ', null, 'LSCK00000000184', 'LSCK00000000184', '季圣华', '2019-03-15 23:15:30', '2019-03-15 23:15:22', '8', null, '9', '1.200000', null, '1.200000', '预付款', '', '', null, '', null, null, null, null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('165', 'Kho', 'Mua hàng', null, 'CGRK00000000190', 'CGRK00000000190', 'lili', '2019-03-19 22:10:17', '2019-03-19 22:09:49', '47', null, '13', '-220.000000', null, '-220.000000', '现付', '', '', null, '', '0.000000', '0.000000', '220.000000', null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('166', 'Khác', 'Mua hàngĐặt hàng', null, 'CGDD00000000191', 'CGDD00000000191', 'lili', '2019-03-19 22:10:35', '2019-03-19 22:10:22', '50', null, null, '0.000000', null, '-2442.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('167', 'Ra nước ngoài', 'Mua hàngTrả về', null, 'CGTH00000000193', 'CGTH00000000193', 'lili', '2019-03-19 22:11:39', '2019-03-19 22:11:12', '47', null, '13', '110.000000', null, '110.000000', '现付', '', '', null, '', '0.000000', '0.000000', '110.000000', null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('168', 'Khác', 'Bán hàngĐặt hàng', null, 'XSDD00000000194', 'XSDD00000000194', 'lili', '2019-03-19 22:12:04', '2019-03-19 22:11:55', '48', null, null, '0.000000', null, '22.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('169', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK00000000195', 'XSCK00000000195', 'lili', '2019-03-19 22:12:18', '2019-03-19 22:12:09', '48', null, '13', '22.000000', null, '22.000000', '现付', '', '', null, '', '0.000000', '0.000000', '22.000000', null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('170', 'Kho', 'Bán hàngTrả về', null, 'XSTH00000000196', 'XSTH00000000196', 'lili', '2019-03-19 22:12:29', '2019-03-19 22:12:21', '48', null, '13', '-22.000000', null, '-22.000000', '现付', '', '', null, '', '0.000000', '0.000000', '22.000000', null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('171', 'Ra nước ngoài', 'Bán lẻ', null, 'LSCK00000000197', 'LSCK00000000197', 'lili', '2019-03-19 22:12:43', '2019-03-19 22:12:35', '49', null, '13', '22.000000', null, '22.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('172', 'Kho', 'Bán lẻTrả về', null, 'LSTH00000000198', 'LSTH00000000198', 'lili', '2019-03-19 22:12:53', '2019-03-19 22:12:46', '49', null, '13', '-22.000000', null, '-22.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('173', 'Kho', 'Khác', null, 'QTRK00000000199', 'QTRK00000000199', 'lili', '2019-03-19 22:13:20', '2019-03-19 22:13:09', '50', null, null, '0.000000', null, '2200.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('174', 'Ra nước ngoài', 'Khác', null, 'QTCK00000000200', 'QTCK00000000200', 'lili', '2019-03-19 22:13:34', '2019-03-19 22:13:23', '48', null, null, '0.000000', null, '176.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('175', 'Khác', 'Mua hàngĐặt hàng', null, 'CGDD00000000203', 'CGDD00000000203', '季圣华', '2019-03-19 22:48:07', '2019-03-19 22:47:55', '46', null, null, '0.000000', null, '-10.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('176', 'Kho', 'Mua hàng', null, 'CGRK00000000204', 'CGRK00000000204', '季圣华', '2019-03-19 22:48:22', '2019-03-19 22:48:10', '4', null, '13', '-28.080000', null, '-24.000000', '现付', '', '', null, '', '0.000000', '0.000000', '28.080000', null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('177', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK00000000205', 'XSCK00000000205', '季圣华', '2019-03-19 22:48:40', '2019-03-19 22:48:26', '5', null, '13', '10.000000', null, '10.000000', '现付', '', '', null, '', '0.000000', '0.000000', '10.000000', null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('178', 'Kho', 'Mua hàng', null, 'CGRK00000000213', 'CGRK00000000213', '季圣华', '2019-03-21 23:58:56', '2019-03-21 23:58:44', '4', null, '13', '-14.400000', null, '-14.400000', '现付', '', '', null, '', '0.000000', '0.000000', '14.400000', null, null, null, null, '0', '', null, '1');
INSERT INTO `jsh_depothead` VALUES ('179', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK00000000214', 'XSCK00000000214', '季圣华', '2019-03-21 23:59:18', '2019-03-21 23:59:05', '5', null, '10', '317.200000', null, '317.200000', '现付', '', '', null, '', '0.000000', '0.000000', '317.200000', null, null, null, null, '0', '', null, '1');
INSERT INTO `jsh_depothead` VALUES ('180', 'Kho', 'Mua hàng', null, 'CGRK00000000242', 'CGRK00000000242', 'laoba123', '2019-04-02 22:30:01', '2019-04-02 22:29:52', '55', null, '16', '-1221.000000', null, '-1221.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1221.000000', null, null, null, null, '0', '', '115', '0');
INSERT INTO `jsh_depothead` VALUES ('181', 'Kho', 'Mua hàng', null, 'CGRK00000000243', 'CGRK00000000243', 'laoba123', '2019-04-02 22:30:20', '2019-04-02 22:30:03', '55', null, '16', '-1342.000000', null, '-1342.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1342.000000', null, null, null, null, '0', '', '115', '0');
INSERT INTO `jsh_depothead` VALUES ('182', 'Kho', 'Mua hàng', null, 'CGRK00000000245', 'CGRK00000000245', '季圣华', '2019-04-02 22:32:00', '2019-04-02 22:31:48', '46', null, '16', '-14.400000', null, '-14.400000', '现付', '', '', null, '', '0.000000', '0.000000', '14.400000', null, null, null, null, '0', '', null, '1');
INSERT INTO `jsh_depothead` VALUES ('183', 'Kho', 'Mua hàng', null, 'CGRK00000000247', 'CGRK00000000247', '季圣华', '2019-04-04 23:06:58', '2019-04-04 23:06:41', '46', null, '16', '-159.600000', null, '-159.600000', '现付', '', '', null, '', '0.000000', '0.000000', '159.600000', null, null, null, null, '0', '', null, '1');
INSERT INTO `jsh_depothead` VALUES ('184', 'Kho', 'Mua hàng', null, 'CGRK00000000248', 'CGRK00000000248', '季圣华', '2019-04-07 20:23:23', '2019-04-07 20:22:40', '4', null, '4', '-35.100000', null, '-30.000000', '现付', '', '', null, '', '0.000000', '0.000000', '35.100000', null, null, null, null, '0', '', null, '1');
INSERT INTO `jsh_depothead` VALUES ('185', 'Kho', 'Mua hàng', null, 'CGRK00000000249', 'CGRK00000000249', '季圣华', '2019-04-07 20:25:30', '2019-04-07 20:25:00', '4', null, '16', '-35.100000', null, '-30.000000', '现付', '', '', null, '', '0.000000', '0.000000', '35.100000', null, null, null, null, '0', '', null, '1');
INSERT INTO `jsh_depothead` VALUES ('186', 'Kho', 'Mua hàng', null, 'CGRK00000000250', 'CGRK00000000250', '季圣华', '2019-04-07 20:35:00', '2019-04-07 20:34:29', '4', null, '16', '-11.700000', null, '-10.000000', '现付', '', '', null, '', '0.000000', '0.000000', '11.700000', null, null, null, null, '0', '', null, '1');
INSERT INTO `jsh_depothead` VALUES ('187', 'Kho', 'Mua hàng', null, 'CGRK00000000252', 'CGRK00000000252', '季圣华', '2019-04-07 20:44:09', '2019-04-07 20:43:49', '4', null, '4', '-421.200000', null, '-360.000000', '现付', '', '', null, '', '0.000000', '0.000000', '421.200000', null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('188', 'Khác', 'Danh sách hội', null, 'ZZD00000000254', 'ZZD00000000254', '季圣华', '2019-04-07 20:51:51', '2019-04-07 22:39:59', null, null, null, '0.000000', null, '0.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('189', 'Kho', 'Mua hàng', null, 'CGRK00000000261', 'CGRK00000000261', '季圣华', '2019-04-10 22:25:49', '2019-04-10 22:26:00', '57', null, '17', '-24.000000', null, '-24.000000', '现付', '', '', null, '', '0.000000', '0.000000', '24.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('190', 'Kho', 'Mua hàng', null, 'CGRK00000000263', 'CGRK00000000263', '季圣华', '2019-04-13 19:57:43', '2019-04-13 19:57:32', '57', null, '17', '-24.000000', null, '-24.000000', '现付', '', '', null, '', '0.000000', '0.000000', '24.000000', null, null, null, null, '0', '', '63', '1');
INSERT INTO `jsh_depothead` VALUES ('191', 'Kho', 'Mua hàng', null, 'CGRK00000000264', 'CGRK00000000264', '季圣华', '2019-04-13 19:57:58', '2019-04-13 19:57:48', '57', null, '17', '-2.000000', null, '-2.000000', '现付', '', '', null, '', '0.000000', '0.000000', '2.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('192', 'Kho', 'Mua hàng', null, 'CGRK00000000265', 'CGRK00000000265', '季圣华', '2019-04-20 00:36:24', '2019-04-20 00:35:57', '57', null, '17', '-44.000000', null, '-44.000000', '现付', '', '', null, '', '0.000000', '0.000000', '44.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('193', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK00000000268', 'XSCK00000000268', '季圣华', '2019-04-29 23:41:02', '2019-04-29 23:40:49', '58', null, '17', '0.000000', null, '100.000000', '现付', '', '', null, '', '0.000000', '0.000000', '100.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('194', 'Kho', 'Mua hàng', null, 'CGRK00000000272', 'CGRK00000000272', '季圣华', '2019-04-30 22:33:24', '2019-04-30 22:33:09', '57', null, '17', '-500.000000', null, '-500.000000', '现付', '', '', null, '', '0.000000', '0.000000', '500.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('195', 'Kho', 'Mua hàng', null, 'CGRK00000000273', 'CGRK00000000273', '季圣华', '2019-04-30 22:34:45', '2019-04-30 22:34:32', '57', null, '17', '-610.000000', null, '-610.000000', '现付', '', '', null, '', '0.000000', '0.000000', '610.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('196', 'Kho', 'Mua hàng', null, 'CGRK00000000274', 'CGRK00000000274', '季圣华', '2019-04-30 22:35:53', '2019-05-03 11:57:49', '57', null, '18', '-670.000000', null, '-670.000000', '现付', '', '', null, '', '0.000000', '0.000000', '670.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('197', 'Ra nước ngoài', 'Bán hàng', null, 'XSCK00000000290', 'XSCK00000000290', '季圣华', '2019-04-30 23:15:27', '2019-04-30 23:15:09', '58', null, '17', '90.000000', null, '90.000000', '现付', '', '', null, '', '0.000000', '0.000000', '90.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('198', 'Kho', 'Mua hàng', null, 'CGRK00000000292', 'CGRK00000000292', '季圣华', '2019-05-03 14:20:56', '2019-05-03 14:19:38', '57', null, '17', '-1.120000', null, '-1.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1.120000', null, null, null, null, '0', '', '63', '1');
INSERT INTO `jsh_depothead` VALUES ('199', 'Khác', 'Mua hàngĐặt hàng', null, 'CGDD00000000305', 'CGDD00000000305', '季圣华', '2019-12-28 12:16:36', '2019-12-28 12:16:27', '57', '63', null, '0.000000', null, '-10.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('200', 'Ra nước ngoài', 'Mua hàngTrả về', null, 'CGTH00000000306', 'CGTH00000000306', '季圣华', '2019-12-28 12:16:55', '2019-12-28 12:16:45', '57', '63', '17', '22.400000', null, '20.000000', '现付', '', '', null, '', '0.000000', '0.000000', '22.400000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('201', 'Khác', 'Bán hàngĐặt hàng', null, 'XSDD00000000307', 'XSDD00000000307', '季圣华', '2019-12-28 12:17:09', '2019-12-28 12:16:59', '58', '63', null, '0.000000', null, '5.000000', '现付', '', '<14>', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('202', 'Kho', 'Bán hàngTrả về', null, 'XSTH00000000308', 'XSTH00000000308', '季圣华', '2019-12-28 12:17:22', '2019-12-28 12:17:13', '58', '63', '17', '-8.000000', null, '-8.000000', '现付', '', '', null, '', '0.000000', '0.000000', '8.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('203', 'Kho', 'Khác', null, 'QTRK00000000309', 'QTRK00000000309', '季圣华', '2019-12-28 12:17:40', '2019-12-28 12:17:26', '57', '63', null, '0.000000', null, '13.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('204', 'Ra nước ngoài', 'Khác', null, 'QTCK00000000310', 'QTCK00000000310', '季圣华', '2019-12-28 12:17:48', '2019-12-28 12:17:42', '58', '63', null, '0.000000', null, '5.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('205', 'Ra nước ngoài', 'Phân bổ', null, 'DBCK00000000311', 'DBCK00000000311', '季圣华', '2019-12-28 12:17:58', '2019-12-28 12:17:51', null, '63', null, '0.000000', null, '0.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('206', 'Khác', 'Danh sách hội', null, 'ZZD00000000312', 'ZZD00000000312', '季圣华', '2019-12-28 12:18:09', '2019-12-28 12:18:00', null, '63', null, '0.000000', null, '0.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('207', 'Khác', 'Trình tự tháo gỡ', null, 'CXD00000000313', 'CXD00000000313', '季圣华', '2019-12-28 12:18:47', '2019-12-28 12:18:11', null, '63', null, '0.000000', null, '0.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('208', 'Ra nước ngoài', 'Bán lẻ', null, 'LSCK00000000314', 'LSCK00000000314', '季圣华', '2019-12-28 12:20:26', '2019-12-28 12:20:14', '60', '63', '17', '6.000000', null, '6.000000', '预付款', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('209', 'Kho', 'Bán lẻTrả về', null, 'LSTH00000000315', 'LSTH00000000315', '季圣华', '2019-12-28 12:20:39', '2019-12-28 12:20:29', '60', '63', '17', '-6.000000', null, '-6.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');

-- ----------------------------
-- Table structure for jsh_depotitem
-- ----------------------------
DROP TABLE IF EXISTS `jsh_depotitem`;
CREATE TABLE `jsh_depotitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `HeaderId` bigint(20) NOT NULL COMMENT 'Id tiêu đề',
  `MaterialId` bigint(20) NOT NULL COMMENT 'Tài liệu Id',
  `MUnit` varchar(20) DEFAULT NULL COMMENT 'Đơn vị đo lường hàng hóa',
  `OperNumber` decimal(24,6) DEFAULT NULL COMMENT 'Số lượng',
  `BasicNumber` decimal(24,6) DEFAULT NULL COMMENT 'Số lượng cơ bản, chẳng hạn như kg, chai',
  `UnitPrice` decimal(24,6) DEFAULT NULL COMMENT 'Đơn giá',
  `TaxUnitPrice` decimal(24,6) DEFAULT NULL COMMENT 'Đã bao gồm thuế Đơn giá',
  `AllPrice` decimal(24,6) DEFAULT NULL COMMENT 'Số tiền',
  `Remark` varchar(200) DEFAULT NULL COMMENT 'Mô tả',
  `Img` varchar(50) DEFAULT NULL COMMENT 'Hình ảnh',
  `Incidentals` decimal(24,6) DEFAULT NULL COMMENT 'Chi phí linh tinh',
  `DepotId` bigint(20) DEFAULT NULL COMMENT 'ID kho (hàng tồn kho được tính)',
  `AnotherDepotId` bigint(20) DEFAULT NULL COMMENT 'Phân bổ Quảng cáo, Id kho khác',
  `TaxRate` decimal(24,6) DEFAULT NULL COMMENT 'Thuế suất',
  `TaxMoney` decimal(24,6) DEFAULT NULL COMMENT 'Thuế',
  `TaxLastMoney` decimal(24,6) DEFAULT NULL COMMENT 'Tổng giá và thuế',
  `OtherField1` varchar(50) DEFAULT NULL COMMENT 'Trường tùy chỉnh1-Tên sản phẩm',
  `OtherField2` varchar(50) DEFAULT NULL COMMENT 'Trường tùy chỉnh2-Mô hình',
  `OtherField3` varchar(50) DEFAULT NULL COMMENT 'Trường tùy chỉnh3-Nhà sản xuất',
  `OtherField4` varchar(50) DEFAULT NULL COMMENT 'Trường tùy chỉnh4',
  `OtherField5` varchar(50) DEFAULT NULL COMMENT 'Trường tùy chỉnh5',
  `MType` varchar(20) DEFAULT NULL COMMENT 'Loại sản phẩm',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT 'Người thuê id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT 'Xóa dấu, 0 không xóa, 1 xóa',
  PRIMARY KEY (`Id`),
  KEY `FK2A819F475D61CCF7` (`MaterialId`),
  KEY `FK2A819F474BB6190E` (`HeaderId`),
  KEY `FK2A819F479485B3F5` (`DepotId`),
  KEY `FK2A819F47729F5392` (`AnotherDepotId`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COMMENT='Tài liệu phụ';

-- ----------------------------
-- Records of jsh_depotitem
-- ----------------------------
INSERT INTO `jsh_depotitem` VALUES ('7', '7', '500', 'Sân', '30.000000', '30.000000', '1.200000', '1.320000', '36.000000', 'remark', null, null, '3', null, '10.000000', '3.600000', '39.600000', 'a', 'b', 'c', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('8', '8', '500', 'Sân', '20.000000', '20.000000', '1.200000', '1.200000', '24.000000', '', null, null, '3', null, null, '0.000000', '24.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('9', '9', '500', 'Sân', '100.000000', '100.000000', '1.200000', '1.320000', '120.000000', '', null, null, '3', null, '10.000000', '12.000000', '132.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('10', '10', '500', 'Sân', '10.000000', '10.000000', '1.200000', '1.320000', '12.000000', '', null, null, '3', null, '10.000000', '1.200000', '13.200000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('11', '11', '500', 'Sân', '20.000000', '20.000000', '1.200000', '1.320000', '24.000000', '', null, null, '3', null, '10.000000', '2.400000', '26.400000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('12', '12', '500', 'Sân', '10.000000', '10.000000', '1.200000', '1.320000', '12.000000', '', null, null, '3', null, '10.000000', '1.200000', '13.200000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('13', '13', '500', 'Sân', '20.000000', '20.000000', '1.200000', '1.320000', '24.000000', '', null, null, '3', null, '10.000000', '2.400000', '26.400000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('14', '14', '500', 'Sân', '30.000000', '30.000000', '1.200000', '1.320000', '36.000000', '', null, null, '3', null, '10.000000', '3.600000', '39.600000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('16', '16', '500', 'Sân', '20.000000', '20.000000', '1.200000', '1.320000', '24.000000', '', null, null, '3', null, '10.000000', '2.400000', '26.400000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('17', '17', '500', 'Sân', '30.000000', '30.000000', '1.200000', '1.320000', '36.000000', '', null, null, '3', null, '10.000000', '3.600000', '39.600000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('18', '18', '500', 'Sân', '20.000000', '20.000000', '1.200000', '1.320000', '24.000000', '', null, null, '3', null, '10.000000', '2.400000', '26.400000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('19', '19', '500', 'Sân', '22.000000', '22.000000', '1.200000', '1.320000', '26.400000', '', null, null, '3', null, '10.000000', '2.640000', '29.040000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('20', '20', '500', 'Sân', '30.000000', '30.000000', '1.200000', '1.320000', '36.000000', '', null, null, '3', null, '10.000000', '3.600000', '39.600000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('21', '21', '500', 'Sân', '22.000000', '22.000000', '1.200000', '1.320000', '26.400000', '', null, null, '3', null, '10.000000', '2.640000', '29.040000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('22', '22', '500', 'Sân', '20.000000', '20.000000', '1.200000', '1.320000', '24.000000', '', null, null, '3', null, '10.000000', '2.400000', '26.400000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('23', '23', '517', 'Hộp', '10.000000', '120.000000', '36.000000', '36.000000', '360.000000', '', null, null, '3', null, '0.000000', '0.000000', '360.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('24', '24', '518', 'Gói', '10.000000', '250.000000', '75.000000', '75.000000', '750.000000', '', null, null, '3', null, '0.000000', '0.000000', '750.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('25', '25', '518', 'Gói', '1.000000', '25.000000', '75.000000', '75.000000', '75.000000', '', null, null, '3', null, '0.000000', '0.000000', '75.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('26', '26', '518', 'Gói', '2.000000', '50.000000', '75.000000', '90.000000', '150.000000', '', null, null, '3', null, '20.000000', '30.000000', '180.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('27', '27', '518', 'Gói', '1.000000', '25.000000', '75.000000', '82.500000', '75.000000', '', null, null, '3', null, '10.000000', '7.500000', '82.500000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('28', '28', '517', 'Hộp', '2.000000', '24.000000', '36.000000', '36.000000', '72.000000', '', null, null, '3', null, '0.000000', '0.000000', '72.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('29', '29', '500', 'Sân', '100.000000', '100.000000', '1.300000', '1.370000', '130.000000', '', null, null, '3', null, '5.000000', '6.500000', '136.500000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('30', '30', '500', 'Sân', '40.000000', '40.000000', '1.200000', '1.200000', '48.000000', '', null, null, '3', null, '0.000000', '0.000000', '48.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('31', '31', '500', 'Sân', '20.000000', '20.000000', '1.300000', '1.430000', '26.000000', '', null, null, '3', null, '10.000000', '2.600000', '28.600000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('32', '32', '500', 'Sân', '10.000000', '10.000000', '1.200000', '1.320000', '12.000000', '', null, null, '3', null, '10.000000', '1.200000', '13.200000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('33', '33', '500', 'Sân', '50.000000', '50.000000', '1.300000', '1.430000', '65.000000', '', null, null, '3', null, '10.000000', '6.500000', '71.500000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('37', '37', '500', 'Sân', '1.000000', '1.000000', '1.300000', '1.300000', '1.300000', '', null, null, '3', '1', '0.000000', '0.000000', '1.300000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('38', '38', '500', 'Sân', '2.000000', '2.000000', '1.300000', '1.300000', '2.600000', '', null, null, '3', '1', '0.000000', '0.000000', '2.600000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('41', '41', '500', 'Sân', '20.000000', '20.000000', '2.100000', '2.310000', '42.000000', '', null, null, '3', null, '10.000000', '4.200000', '46.200000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('42', '42', '500', 'Sân', '10.000000', '10.000000', '1.100000', '1.100000', '11.000000', '', null, null, '3', null, '0.000000', '0.000000', '11.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('43', '43', '500', 'Sân', '11.000000', '11.000000', '1.100000', '1.100000', '12.100000', '', null, null, '3', null, '0.000000', '0.000000', '12.100000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('44', '44', '499', 'Sân', '1.000000', '1.000000', '2.200000', '2.200000', '2.200000', '', null, null, '3', null, '0.000000', '0.000000', '2.200000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('45', '45', '500', 'Sân', '3.000000', '3.000000', '1.100000', '1.100000', '3.300000', '', null, null, '3', null, '0.000000', '0.000000', '3.300000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('48', '48', '498', 'Sân', '10.000000', '10.000000', '1.200000', '1.200000', '12.000000', '', null, null, '3', null, '0.000000', '0.000000', '12.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('49', '49', '498', 'Sân', '10.000000', '10.000000', '1.200000', '1.200000', '12.000000', '', null, null, '3', null, '0.000000', '0.000000', '12.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('50', '50', '500', 'Sân', '20.000000', '20.000000', '1.100000', '1.100000', '22.000000', '', null, null, '3', null, '0.000000', '0.000000', '22.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('52', '52', '500', 'Sân', '22.000000', '22.000000', '1.100000', '1.100000', '24.200000', '', null, null, '3', null, '0.000000', '0.000000', '24.200000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('53', '53', '500', 'Sân', '33.000000', '33.000000', '1.100000', '1.100000', '36.300000', '', null, null, '3', null, '0.000000', '0.000000', '36.300000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('54', '54', '500', 'Sân', '10.000000', '10.000000', '1.200000', '1.200000', '12.000000', '', null, null, '1', null, '10.000000', '0.000000', '12.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('57', '57', '500', 'Sân', '2.000000', '2.000000', '1.200000', '1.260000', '2.400000', '', null, null, '3', null, '0.000000', '0.120000', '2.520000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('63', '57', '517', 'Hộp', '5.000000', '60.000000', '36.000000', '36.000000', '180.000000', '', null, null, '3', null, '0.000000', '0.000000', '180.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('64', '63', '500', 'Sân', '10.000000', '10.000000', '1.200000', '1.320000', '12.000000', '', null, null, '3', null, '10.000000', '1.200000', '13.200000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('66', '65', '498', 'Sân', '30.000000', '30.000000', '1.300000', '1.430000', '39.000000', '', null, null, '3', null, '10.000000', '3.900000', '42.900000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('71', '68', '498', 'Sân', '1.000000', '1.000000', '3.000000', '3.000000', '3.000000', '', null, null, '3', null, '0.000000', '0.000000', '3.000000', '', '', '', '', '', '组合件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('72', '68', '499', 'Sân', '1.000000', '1.000000', '4.000000', '4.000000', '4.000000', '', null, null, '3', null, '0.000000', '0.000000', '4.000000', '', '', '', '', '', '普通子件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('73', '69', '498', 'Sân', '1.000000', '1.000000', '0.000000', '0.000000', '0.000000', '', null, null, '1', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '组合件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('74', '69', '499', 'Sân', '1.000000', '1.000000', '0.000000', '0.000000', '0.000000', '', null, null, '1', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '普通子件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('75', '70', '487', 'Sân', '50.000000', '50.000000', '1.000000', '1.000000', '50.000000', '', null, null, '1', null, '10.000000', '0.000000', '50.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('76', '71', '499', 'Sân', '20.000000', '20.000000', '2.400000', '2.400000', '48.000000', '', null, null, '3', null, '0.000000', '0.000000', '48.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('77', '72', '499', 'Sân', '10.000000', '10.000000', '2.400000', '2.810000', '24.000000', '', null, null, '3', null, '17.000000', '4.080000', '28.080000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('78', '73', '487', 'Sân', '10.000000', '10.000000', '1.000000', '1.000000', '10.000000', '', null, null, '1', null, '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('79', '74', '487', 'Sân', '5.000000', '5.000000', '1.000000', '1.000000', '5.000000', '', null, null, '3', null, '0.000000', '0.000000', '5.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('80', '75', '500', 'Sân', '10.000000', '10.000000', '1.300000', '1.300000', '13.000000', '', null, null, '3', null, '0.000000', '0.000000', '13.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('81', '76', '487', 'Sân', '10.000000', '10.000000', '1.000000', '1.000000', '10.000000', '', null, null, '3', '1', '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('82', '77', '499', 'Sân', '1.000000', '1.000000', '2.200000', '2.200000', '2.200000', '', null, null, '3', null, '0.000000', '0.000000', '2.200000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('83', '78', '499', 'Sân', '1.000000', '1.000000', '2.200000', '2.200000', '2.200000', '', null, null, '3', null, '0.000000', '0.000000', '2.200000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('84', '79', '499', 'Sân', '9.000000', '9.000000', '2.400000', '2.640000', '21.600000', '', null, null, '3', null, '10.000000', '2.160000', '23.760000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('85', '80', '500', 'Sân', '1.000000', '1.000000', '2.000000', '2.000000', '2.000000', '', null, null, '3', null, '0.000000', '0.000000', '2.000000', '', '', '', '', '', '组合件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('86', '80', '498', 'Sân', '1.000000', '1.000000', '3.000000', '3.000000', '3.000000', '', null, null, '3', null, '0.000000', '0.000000', '3.000000', '', '', '', '', '', '普通子件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('88', '82', '498', 'Sân', '40.000000', '40.000000', '1.300000', '1.430000', '52.000000', '', null, null, '3', null, '10.000000', '5.200000', '57.200000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('90', '84', '499', 'Sân', '10.000000', '10.000000', '2.400000', '2.640000', '24.000000', '', null, null, '1', null, '10.000000', '2.400000', '26.400000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('91', '85', '518', 'Gói', '1.000000', '25.000000', '75.000000', '87.750000', '75.000000', '', null, null, '3', null, '17.000000', '12.750000', '87.750000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('93', '87', '518', 'kg', '1.000000', '1.000000', '4.000000', '4.000000', '4.000000', '', null, null, '3', null, '0.000000', '0.000000', '4.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('94', '88', '517', 'Chai', '10.000000', '10.000000', '4.000000', '4.400000', '40.000000', '', null, null, '3', null, '10.000000', '4.000000', '44.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('95', '89', '517', 'Hộp', '1.000000', '12.000000', '18.000000', '18.000000', '18.000000', '', null, null, '3', null, '0.000000', '0.000000', '18.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('96', '90', '518', 'Gói', '2.000000', '50.000000', '50.000000', '50.000000', '100.000000', '', null, null, '3', null, '0.000000', '0.000000', '100.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('101', '94', '517', 'Chai', '2.000000', '2.000000', '4.000000', '4.000000', '8.000000', '', null, null, '3', null, '0.000000', '0.000000', '8.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('102', '95', '498', 'Sân', '2.000000', '2.000000', '1.300000', '1.430000', '2.600000', '', null, null, '3', null, '10.000000', '0.260000', '2.860000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('103', '96', '498', 'Sân', '2.000000', '2.000000', '1.400000', '1.400000', '2.800000', '', null, null, '3', null, '0.000000', '0.000000', '2.800000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('104', '97', '485', 'Sân', '200.000000', '200.000000', '1.000000', '1.170000', '200.000000', '', null, null, '3', null, '17.000000', '34.000000', '234.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('105', '98', '487', 'Sân', '300.000000', '300.000000', '1.000000', '1.170000', '300.000000', '', null, null, '3', null, '17.000000', '51.000000', '351.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('106', '99', '517', 'Hộp', '20.000000', '240.000000', '36.000000', '42.120000', '720.000000', '', null, null, '3', null, '17.000000', '122.400000', '842.400000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('107', '100', '487', 'Sân', '1.000000', '1.000000', '1.000000', '1.000000', '1.000000', '', null, null, '4', null, '0.000000', '0.000000', '1.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('108', '101', '485', 'Sân', '50.000000', '50.000000', '1.000000', '1.000000', '50.000000', '', null, null, '3', '1', '0.000000', '0.000000', '50.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('109', '102', '498', 'Sân', '10.000000', '10.000000', '1.200000', '1.200000', '12.000000', '', null, null, '3', null, '0.000000', '0.000000', '12.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('110', '103', '499', 'Sân', '10.000000', '10.000000', '2.400000', '2.640000', '24.000000', '', null, null, '3', null, '10.000000', '2.400000', '26.400000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('111', '104', '487', 'Sân', '10.000000', '10.000000', '1.000000', '1.170000', '10.000000', '', null, null, '3', null, '17.000000', '1.700000', '11.700000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('112', '105', '499', 'Sân', '5.000000', '5.000000', '2.600000', '2.600000', '13.000000', '', null, null, '3', null, '0.000000', '0.000000', '13.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('113', '106', '499', 'Sân', '5.000000', '5.000000', '2.600000', '2.600000', '13.000000', '', null, null, '3', null, '0.000000', '0.000000', '13.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('114', '107', '487', 'Sân', '1.000000', '1.000000', '1.000000', '1.000000', '1.000000', '', null, null, '1', null, '0.000000', '0.000000', '1.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('116', '108', '517', 'Hộp', '1.000000', '12.000000', '36.000000', '42.120000', '36.000000', '', null, null, '3', null, '17.000000', '6.120000', '42.120000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('117', '109', '500', 'Sân', '1.000000', '1.000000', '1.200000', '1.400000', '1.200000', '', null, null, '3', null, '17.000000', '0.200000', '1.400000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('118', '110', '487', 'Sân', '10.000000', '10.000000', '1.000000', '1.100000', '10.000000', '', null, null, '3', null, '10.000000', '1.000000', '11.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('119', '111', '487', 'Sân', '20.000000', '20.000000', '1.000000', '1.100000', '20.000000', '', null, null, '1', null, '10.000000', '2.000000', '22.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('120', '112', '499', 'Sân', '1.000000', '1.000000', '2.600000', '2.600000', '2.600000', '', null, null, '3', null, '0.000000', '0.000000', '2.600000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('123', '114', '499', 'Sân', '1.000000', '1.000000', '2.400000', '2.400000', '2.400000', '', null, null, '3', null, '0.000000', '0.000000', '2.400000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('124', '115', '563', 'Trương', '20.000000', '20.000000', '11.000000', '12.870000', '220.000000', '', null, null, '1', null, '17.000000', '37.400000', '257.400000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('125', '116', '563', 'Trương', '80.000000', '80.000000', '11.000000', '12.870000', '880.000000', '', null, null, '3', null, '17.000000', '149.600000', '1029.600000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('126', '117', '563', 'Trương', '10.000000', '10.000000', '11.000000', '11.000000', '110.000000', '', null, null, '3', null, '0.000000', '0.000000', '110.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('127', '118', '563', 'Trương', '1.000000', '1.000000', '11.000000', '11.000000', '11.000000', '', null, null, '1', null, '0.000000', '0.000000', '11.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('128', '119', '562', 'Mỗi', '10.000000', '10.000000', '8.000000', '8.800000', '80.000000', '', null, null, '3', null, '10.000000', '8.000000', '88.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('129', '120', '500', 'Sân', '3.000000', '3.000000', '1.300000', '1.300000', '3.900000', '', null, null, '3', null, '0.000000', '0.000000', '3.900000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('130', '121', '517', 'Hộp', '1.000000', '12.000000', '36.000000', '42.120000', '36.000000', '', null, null, '3', null, '17.000000', '6.120000', '42.120000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('131', '122', '487', 'Sân', '100.000000', '100.000000', '1.000000', '1.170000', '100.000000', '', null, null, '3', null, '17.000000', '17.000000', '117.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('132', '123', '499', 'Sân', '10.000000', '10.000000', '2.600000', '2.600000', '26.000000', '', null, null, '3', null, '0.000000', '0.000000', '26.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('133', '124', '562', 'Mỗi', '100.000000', '100.000000', '8.000000', '9.360000', '800.000000', '', null, null, '1', null, '17.000000', '136.000000', '936.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('144', '137', '499', 'Sân', '1.000000', '1.000000', '2.400000', '2.400000', '2.400000', '', null, null, '3', null, '0.000000', '0.000000', '2.400000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('146', '139', '499', 'Sân', '10.000000', '10.000000', '2.400000', '2.810000', '24.000000', '', null, null, '3', null, '17.000000', '4.080000', '28.080000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('148', '141', '500', 'Sân', '3.000000', '3.000000', '1.300000', '1.300000', '3.900000', '', null, null, '3', null, '0.000000', '0.000000', '3.900000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('149', '142', '498', 'Sân', '5.000000', '5.000000', '1.400000', '1.400000', '7.000000', '', null, null, '3', null, '0.000000', '0.000000', '7.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('151', '144', '498', 'Sân', '5.000000', '5.000000', '1.400000', '1.400000', '7.000000', '', null, null, '3', null, '0.000000', '0.000000', '7.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('154', '147', '499', 'Sân', '100.000000', '100.000000', '2.400000', '2.400000', '240.000000', '', null, null, '3', null, '0.000000', '0.000000', '240.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('155', '148', '499', 'Sân', '100.000000', '100.000000', '2.400000', '2.400000', '240.000000', '', null, null, '3', null, '0.000000', '0.000000', '240.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('158', '139', '498', 'Sân', '20.000000', '20.000000', '1.110000', '1.300000', '22.220000', '', null, null, '3', null, '17.000000', '3.780000', '26.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('161', '155', '499', 'Sân', '10.000000', '10.000000', '2.400000', '2.810000', '24.000000', '', null, null, '3', null, '17.000000', '4.080000', '28.080000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('162', '155', '498', 'Sân', '20.000000', '20.000000', '1.110000', '1.300000', '22.220000', '', null, null, '3', null, '17.000000', '3.780000', '26.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('165', '158', '487', 'Sân', '10.000000', '10.000000', '1.000000', '1.000000', '10.000000', '', null, null, '3', null, '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('166', '159', '498', 'Sân', '15.000000', '15.000000', '1.300000', '1.300000', '19.500000', '', null, null, '3', null, '0.000000', '0.000000', '19.500000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('167', '160', '487', 'Sân', '1111.000000', '1111.000000', '1.000000', '1.000000', '1111.000000', '', null, null, '1', null, '0.000000', '0.000000', '1111.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('168', '161', '487', 'Sân', '111.000000', '111.000000', '1.000000', '1.000000', '111.000000', '', null, null, '1', null, '0.000000', '0.000000', '111.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('169', '162', '498', 'Sân', '111.000000', '111.000000', '1.300000', '1.520000', '144.300000', '', null, null, '3', null, '17.000000', '24.530000', '168.830000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('170', '163', '487', 'Sân', '111.000000', '111.000000', '1.000000', '1.000000', '111.000000', '', null, null, '1', '3', '0.000000', '0.000000', '111.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('171', '164', '498', 'Sân', '1.000000', '1.000000', '1.200000', '1.200000', '1.200000', '', null, null, '3', null, '0.000000', '0.000000', '1.200000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('172', '165', '564', 'Mỗi', '10.000000', '10.000000', '22.000000', '22.000000', '220.000000', '', null, null, '7', null, '0.000000', '0.000000', '220.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('173', '166', '564', 'Mỗi', '111.000000', '111.000000', '22.000000', '22.000000', '2442.000000', '', null, null, '7', null, '0.000000', '0.000000', '2442.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('174', '167', '564', 'Mỗi', '5.000000', '5.000000', '22.000000', '22.000000', '110.000000', '', null, null, '7', null, '0.000000', '0.000000', '110.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('175', '168', '564', 'Mỗi', '1.000000', '1.000000', '22.000000', '22.000000', '22.000000', '', null, null, '7', null, '0.000000', '0.000000', '22.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('176', '169', '564', 'Mỗi', '1.000000', '1.000000', '22.000000', '22.000000', '22.000000', '', null, null, '7', null, '0.000000', '0.000000', '22.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('177', '170', '564', 'Mỗi', '1.000000', '1.000000', '22.000000', '22.000000', '22.000000', '', null, null, '7', null, '0.000000', '0.000000', '22.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('178', '171', '564', 'Mỗi', '1.000000', '1.000000', '22.000000', '22.000000', '22.000000', '', null, null, '7', null, '0.000000', '0.000000', '22.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('179', '172', '564', 'Mỗi', '1.000000', '1.000000', '22.000000', '22.000000', '22.000000', '', null, null, '7', null, '0.000000', '0.000000', '22.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('180', '173', '564', 'Mỗi', '100.000000', '100.000000', '22.000000', '22.000000', '2200.000000', '', null, null, '7', null, '0.000000', '0.000000', '2200.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('181', '174', '564', 'Mỗi', '8.000000', '8.000000', '22.000000', '22.000000', '176.000000', '', null, null, '7', null, '0.000000', '0.000000', '176.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('182', '175', '487', 'Sân', '10.000000', '10.000000', '1.000000', '1.000000', '10.000000', '', null, null, '1', null, '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('183', '176', '499', 'Sân', '10.000000', '10.000000', '2.400000', '2.810000', '24.000000', '', null, null, '1', null, '17.000000', '4.080000', '28.080000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('184', '177', '487', 'Sân', '10.000000', '10.000000', '1.000000', '1.000000', '10.000000', '', null, null, '1', null, '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('185', '178', '500', 'Sân', '12.000000', '12.000000', '1.200000', '1.200000', '14.400000', '', null, null, '3', null, '0.000000', '0.000000', '14.400000', '', '', '', '', '', '', null, '1');
INSERT INTO `jsh_depotitem` VALUES ('186', '179', '499', 'Sân', '122.000000', '122.000000', '2.600000', '2.600000', '317.200000', '', null, null, '3', null, '0.000000', '0.000000', '317.200000', '', '', '', '', '', '', null, '1');
INSERT INTO `jsh_depotitem` VALUES ('187', '180', '567', 'Mỗi', '111.000000', null, '11.000000', '11.000000', '1221.000000', '', null, null, '13', null, '0.000000', '0.000000', '1221.000000', '', '', '', '', '', '', '115', '0');
INSERT INTO `jsh_depotitem` VALUES ('188', '181', '567', 'Mỗi', '122.000000', null, '11.000000', '11.000000', '1342.000000', '', null, null, '13', null, '0.000000', '0.000000', '1342.000000', '', '', '', '', '', '', '115', '0');
INSERT INTO `jsh_depotitem` VALUES ('189', '182', '500', 'Sân', '12.000000', null, '1.200000', '1.200000', '14.400000', '', null, null, '1', null, '0.000000', '0.000000', '14.400000', '', '', '', '', '', '', null, '1');
INSERT INTO `jsh_depotitem` VALUES ('190', '183', '500', 'Sân', '133.000000', null, '1.200000', '1.200000', '159.600000', '', null, null, '1', null, '0.000000', '0.000000', '159.600000', '', '', '', '', '', '', null, '1');
INSERT INTO `jsh_depotitem` VALUES ('191', '184', '517', 'Chai', '10.000000', null, '3.000000', '3.510000', '30.000000', '', null, null, '3', null, '17.000000', '5.100000', '35.100000', '', '', '', '', '', '', null, '1');
INSERT INTO `jsh_depotitem` VALUES ('192', '185', '517', 'Chai', '10.000000', null, '3.000000', '3.510000', '30.000000', '', null, null, '3', null, '17.000000', '5.100000', '35.100000', '', '', '', '', '', '', null, '1');
INSERT INTO `jsh_depotitem` VALUES ('193', '186', '487', 'Sân', '10.000000', null, '1.000000', '1.170000', '10.000000', '', null, null, '3', null, '17.000000', '1.700000', '11.700000', '', '', '', '', '', '', null, '1');
INSERT INTO `jsh_depotitem` VALUES ('194', '187', '517', 'Hộp', '10.000000', '120.000000', '36.000000', '42.120000', '360.000000', '', null, null, '3', null, '17.000000', '61.200000', '421.200000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('195', '188', '485', 'Sân', '8.000000', '8.000000', '0.000000', '0.000000', '0.000000', '', null, null, '3', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '组合件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('196', '188', '487', 'Sân', '8.000000', '8.000000', '0.000000', '0.000000', '0.000000', '', null, null, '3', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '普通子件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('197', '188', '498', 'Sân', '8.000000', '8.000000', '0.000000', '0.000000', '0.000000', '', null, null, '3', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '普通子件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('198', '189', '569', 'Chỉ', '12.000000', '12.000000', '2.000000', '2.000000', '24.000000', '', null, null, '14', null, '0.000000', '0.000000', '24.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('199', '190', '569', 'Chỉ', '12.000000', '12.000000', '2.000000', '2.000000', '24.000000', '', null, null, '14', null, '0.000000', '0.000000', '24.000000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('200', '191', '569', 'Chỉ', '1.000000', '1.000000', '2.000000', '2.000000', '2.000000', '', null, null, '14', null, '0.000000', '0.000000', '2.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('201', '192', '569', 'Chỉ', '22.000000', '22.000000', '2.000000', '2.000000', '44.000000', '', null, null, '14', null, '0.000000', '0.000000', '44.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('202', '193', '569', 'Chỉ', '20.000000', '20.000000', '5.000000', '5.000000', '100.000000', '', null, null, '14', null, '0.000000', '0.000000', '100.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('203', '194', '569', 'Chỉ', '100.000000', '100.000000', '5.000000', '5.000000', '500.000000', '', null, null, '15', null, '0.000000', '0.000000', '500.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('204', '195', '569', 'Chỉ', '122.000000', '122.000000', '5.000000', '5.000000', '610.000000', '', null, null, '15', null, '0.000000', '0.000000', '610.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('205', '196', '569', 'Chỉ', '122.000000', '122.000000', '5.000000', '5.000000', '610.000000', '', null, null, '15', null, '0.000000', '0.000000', '610.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('206', '197', '569', 'Chỉ', '18.000000', '18.000000', '5.000000', '5.000000', '90.000000', '', null, null, '14', null, '0.000000', '0.000000', '90.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('207', '196', '569', 'Chỉ', '2.000000', '2.000000', '5.000000', '5.000000', '10.000000', '', null, null, '15', null, '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('208', '196', '569', 'Chỉ', '2.000000', '2.000000', '5.000000', '5.000000', '10.000000', '', null, null, '15', null, '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('209', '196', '568', 'Mỗi', '2.000000', '2.000000', '0.000000', '0.000000', '0.000000', '', null, null, '14', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('210', '196', '568', 'Mỗi', '2.000000', '2.000000', '0.000000', '0.000000', '0.000000', '', null, null, '14', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('211', '196', '568', 'Mỗi', '3.000000', '3.000000', '0.000000', '0.000000', '0.000000', '', null, null, '14', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('212', '196', '568', 'Mỗi', '4.000000', '4.000000', '0.000000', '0.000000', '0.000000', '', null, null, '14', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('213', '196', '568', 'Mỗi', '5.000000', '5.000000', '2.000000', '2.000000', '10.000000', '', null, null, '14', null, '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('214', '196', '569', 'Chỉ', '6.000000', '6.000000', '5.000000', '5.000000', '30.000000', '', null, null, '14', null, '0.000000', '0.000000', '30.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('215', '198', '578', 'Hộp', '1.000000', '12.000000', '1.000000', '1.120000', '1.000000', '', null, null, '14', null, '12.000000', '0.120000', '1.120000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('216', '199', '568', 'Mỗi', '1.000000', '1.000000', '10.000000', '11.200000', '10.000000', '', null, null, '14', null, '12.000000', '1.200000', '11.200000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('217', '200', '568', 'Mỗi', '1.000000', '1.000000', '20.000000', '22.400000', '20.000000', '', null, null, '14', null, '12.000000', '2.400000', '22.400000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('218', '201', '568', 'Mỗi', '1.000000', '1.000000', '5.000000', '5.000000', '5.000000', '', null, null, '14', null, '0.000000', '0.000000', '5.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('219', '202', '568', 'Mỗi', '1.000000', '1.000000', '8.000000', '8.000000', '8.000000', '', null, null, '14', null, '0.000000', '0.000000', '8.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('220', '203', '568', 'Mỗi', '1.000000', '1.000000', '8.000000', '8.960000', '8.000000', '', null, null, '14', null, '12.000000', '0.960000', '8.960000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('221', '203', '569', 'Chỉ', '1.000000', '1.000000', '5.000000', '5.600000', '5.000000', '', null, null, '14', null, '12.000000', '0.600000', '5.600000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('222', '204', '569', 'Chỉ', '1.000000', '1.000000', '5.000000', '5.000000', '5.000000', '', null, null, '14', null, '0.000000', '0.000000', '5.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('223', '205', '568', 'Mỗi', '1.000000', '1.000000', '0.000000', '0.000000', '0.000000', '', null, null, '14', '15', '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('224', '206', '568', 'Mỗi', '1.000000', '1.000000', '0.000000', '0.000000', '0.000000', '', null, null, '14', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '组合件', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('225', '206', '569', 'Chỉ', '1.000000', '1.000000', '0.000000', '0.000000', '0.000000', '', null, null, '14', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '普通子件', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('226', '207', '569', 'Chỉ', '1.000000', '1.000000', '0.000000', '0.000000', '0.000000', '', null, null, '14', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '组合件', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('227', '207', '568', 'Mỗi', '1.000000', '1.000000', '0.000000', '0.000000', '0.000000', '', null, null, '14', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '普通子件', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('228', '208', '568', 'Mỗi', '1.000000', '1.000000', '6.000000', '6.000000', '6.000000', '', null, null, '14', null, '0.000000', '0.000000', '6.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('229', '209', '568', 'Mỗi', '1.000000', '1.000000', '6.000000', '6.000000', '6.000000', '', null, null, '14', null, '0.000000', '0.000000', '6.000000', '', '', '', '', '', '', '63', '0');

-- ----------------------------
-- Table structure for jsh_functions
-- ----------------------------
DROP TABLE IF EXISTS `jsh_functions`;
CREATE TABLE `jsh_functions` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `Number` varchar(50) DEFAULT NULL COMMENT 'Số',
  `Name` varchar(50) DEFAULT NULL COMMENT 'Tên',
  `PNumber` varchar(50) DEFAULT NULL COMMENT 'Số cao cấp',
  `URL` varchar(100) DEFAULT NULL COMMENT 'Liên kết',
  `State` bit(1) DEFAULT NULL COMMENT 'Co lại',
  `Sort` varchar(50) DEFAULT NULL COMMENT 'Sắp xếp',
  `Enabled` bit(1) DEFAULT NULL COMMENT 'Kích hoạt',
  `Type` varchar(50) DEFAULT NULL COMMENT '类型',
  `PushBtn` varchar(50) DEFAULT NULL COMMENT '功能按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COMMENT='功能模块表';

-- ----------------------------
-- Records of jsh_functions
-- ----------------------------
INSERT INTO `jsh_functions` VALUES ('1', '0001', '系统管理', '0', '', '', '0910', '', '电脑版', '', 'icon-settings', '0');
INSERT INTO `jsh_functions` VALUES ('13', '000102', '角色管理', '0001', '/pages/manage/role.html', '\0', '0130', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('14', '000103', '用户管理', '0001', '/pages/manage/user.html', '\0', '0140', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('15', '000104', '日志管理', '0001', '/pages/manage/log.html', '\0', '0160', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('16', '000105', '功能管理', '0001', '/pages/manage/functions.html', '\0', '0135', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('21', '0101', '商品管理', '0', '', '\0', '0620', '', '电脑版', null, 'icon-social-dropbox', '0');
INSERT INTO `jsh_functions` VALUES ('22', '010101', '商品类别', '0101', '/pages/materials/materialcategory.html', '\0', '0230', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('23', '010102', '商品信息', '0101', '/pages/materials/material.html', '\0', '0240', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('24', '0102', '基本资料', '0', '', '\0', '0750', '', '电脑版', null, 'icon-grid', '0');
INSERT INTO `jsh_functions` VALUES ('25', '01020101', '供应商信息', '0102', '/pages/manage/vendor.html', '\0', '0260', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('26', '010202', '仓库信息', '0102', '/pages/manage/depot.html', '\0', '0270', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('31', '010206', '经手人管理', '0102', '/pages/materials/person.html', '\0', '0284', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('32', '0502', 'Mua hàng管理', '0', '', '\0', '0330', '', '电脑版', '', 'icon-loop', '0');
INSERT INTO `jsh_functions` VALUES ('33', '050201', 'Mua hàngKho', '0502', '/pages/materials/purchase_in_list.html', '\0', '0340', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('38', '0603', 'Bán hàng管理', '0', '', '\0', '0390', '', '电脑版', '', 'icon-briefcase', '0');
INSERT INTO `jsh_functions` VALUES ('40', '080107', 'Phân bổRa nước ngoài', '0801', '/pages/materials/allocation_out_list.html', '\0', '0807', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('41', '060303', 'Bán hàngRa nước ngoài', '0603', '/pages/materials/sale_out_list.html', '\0', '0394', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('44', '0704', '财务管理', '0', '', '\0', '0450', '', '电脑版', '', 'icon-map', '0');
INSERT INTO `jsh_functions` VALUES ('59', '030101', '库存状况', '0301', '/pages/reports/in_out_stock_report.html', '\0', '0600', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('194', '010204', '收支项目', '0102', '/pages/manage/inOutItem.html', '\0', '0282', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('195', '010205', '结算账户', '0102', '/pages/manage/account.html', '\0', '0283', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('197', '070402', '收入单', '0704', '/pages/financial/item_in.html', '\0', '0465', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('198', '0301', '报表查询', '0', '', '\0', '0570', '', '电脑版', null, 'icon-pie-chart', '0');
INSERT INTO `jsh_functions` VALUES ('199', '050204', 'Mua hàngTrả về', '0502', '/pages/materials/purchase_back_list.html', '\0', '0345', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('200', '060305', 'Bán hàngTrả về', '0603', '/pages/materials/sale_back_list.html', '\0', '0396', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('201', '080103', 'KhácKho', '0801', '/pages/materials/other_in_list.html', '\0', '0803', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('202', '080105', 'KhácRa nước ngoài', '0801', '/pages/materials/other_out_list.html', '\0', '0805', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('203', '070403', '支出单', '0704', '/pages/financial/item_out.html', '\0', '0470', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('204', '070404', '收款单', '0704', '/pages/financial/money_in.html', '\0', '0475', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('205', '070405', '付款单', '0704', '/pages/financial/money_out.html', '\0', '0480', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('206', '070406', '转账单', '0704', '/pages/financial/giro.html', '\0', '0490', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('207', '030102', '结算账户', '0301', '/pages/reports/account_report.html', '\0', '0610', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('208', '030103', '进货统计', '0301', '/pages/reports/buy_in_report.html', '\0', '0620', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('209', '030104', 'Bán hàng统计', '0301', '/pages/reports/sale_out_report.html', '\0', '0630', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('210', '040102', 'Bán lẻRa nước ngoài', '0401', '/pages/materials/retail_out_list.html', '\0', '0405', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('211', '040104', 'Bán lẻTrả về', '0401', '/pages/materials/retail_back_list.html', '\0', '0407', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('212', '070407', '收预付款', '0704', '/pages/financial/advance_in.html', '\0', '0495', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('217', '01020102', '客户信息', '0102', '/pages/manage/customer.html', '\0', '0262', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('218', '01020103', '会员信息', '0102', '/pages/manage/member.html', '\0', '0263', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('219', '000107', '资产管理', '0001', '/pages/asset/asset.html', '\0', '0170', '\0', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('220', '010103', '计量单位', '0101', '/pages/manage/unit.html', '\0', '0245', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('225', '0401', 'Bán lẻ管理', '0', '', '\0', '0101', '', '电脑版', '', 'icon-present', '0');
INSERT INTO `jsh_functions` VALUES ('226', '030106', 'Kho明细', '0301', '/pages/reports/in_detail.html', '\0', '0640', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('227', '030107', 'Ra nước ngoài明细', '0301', '/pages/reports/out_detail.html', '\0', '0645', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('228', '030108', 'Kho汇总', '0301', '/pages/reports/in_material_count.html', '\0', '0650', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('229', '030109', 'Ra nước ngoài汇总', '0301', '/pages/reports/out_material_count.html', '\0', '0655', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('232', '080109', 'Danh sách hội', '0801', '/pages/materials/assemble_list.html', '\0', '0809', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('233', '080111', 'Trình tự tháo gỡ', '0801', '/pages/materials/disassemble_list.html', '\0', '0811', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('234', '000105', '系统配置', '0001', '/pages/manage/systemConfig.html', '\0', '0165', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('235', '030110', '客户对账', '0301', '/pages/reports/customer_account.html', '\0', '0660', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('236', '000106', '商品属性', '0001', '/pages/materials/materialProperty.html', '\0', '0168', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('237', '030111', '供应商对账', '0301', '/pages/reports/vendor_account.html', '\0', '0665', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('239', '0801', '仓库管理', '0', '', '\0', '0420', '', '电脑版', '', 'icon-layers', '0');
INSERT INTO `jsh_functions` VALUES ('240', '010104', '序列号', '0101', '/pages/manage/serialNumber.html', '\0', '0246', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('241', '050202', 'Mua hàngĐặt hàng', '0502', '/pages/materials/purchase_orders_list.html', '\0', '0335', '', '电脑版', '3', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('242', '060301', 'Bán hàngĐặt hàng', '0603', '/pages/materials/sale_orders_list.html', '\0', '0392', '', '电脑版', '3', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('243', '000108', '机构管理', '0001', '/pages/manage/organization.html', '', '0139', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('244', '030112', '库存预警', '0301', '/pages/reports/stock_warning_report.html', '\0', '0670', '', '电脑版', '', 'icon-notebook', '0');

-- ----------------------------
-- Table structure for jsh_inoutitem
-- ----------------------------
DROP TABLE IF EXISTS `jsh_inoutitem`;
CREATE TABLE `jsh_inoutitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `Type` varchar(20) DEFAULT NULL COMMENT '类型',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='收支项目';

-- ----------------------------
-- Records of jsh_inoutitem
-- ----------------------------
INSERT INTO `jsh_inoutitem` VALUES ('1', '办公耗材', '支出', '办公耗材', null, '0');
INSERT INTO `jsh_inoutitem` VALUES ('5', '房租收入', '收入', '房租收入', null, '0');
INSERT INTO `jsh_inoutitem` VALUES ('7', '利息收入', '收入', '利息收入', null, '0');
INSERT INTO `jsh_inoutitem` VALUES ('8', '水电费', '支出', '水电费水电费', null, '0');
INSERT INTO `jsh_inoutitem` VALUES ('9', '快递费', '支出', '快递费', null, '0');
INSERT INTO `jsh_inoutitem` VALUES ('10', '交通报销费', '支出', '交通报销费', null, '0');
INSERT INTO `jsh_inoutitem` VALUES ('11', '差旅费', '支出', '差旅费', null, '0');
INSERT INTO `jsh_inoutitem` VALUES ('12', '全车贴膜-普通', '收入', '', null, '0');
INSERT INTO `jsh_inoutitem` VALUES ('13', '全车贴膜-高档', '收入', '', null, '0');
INSERT INTO `jsh_inoutitem` VALUES ('14', '洗车', '收入', '', null, '0');
INSERT INTO `jsh_inoutitem` VALUES ('15', '保养汽车', '收入', '', null, '0');
INSERT INTO `jsh_inoutitem` VALUES ('16', '收入项目1', '收入', '', '1', '0');
INSERT INTO `jsh_inoutitem` VALUES ('17', '支出项目1', '支出', '', '1', '0');
INSERT INTO `jsh_inoutitem` VALUES ('18', '收入1', '收入', '', '117', '0');
INSERT INTO `jsh_inoutitem` VALUES ('19', '支出1', '支出', '', '117', '0');
INSERT INTO `jsh_inoutitem` VALUES ('20', '支出2', '支出', '', '117', '0');
INSERT INTO `jsh_inoutitem` VALUES ('21', '支出1', '支出', '', '63', '0');
INSERT INTO `jsh_inoutitem` VALUES ('22', '收入1', '收入', '', '63', '0');

-- ----------------------------
-- Table structure for jsh_log
-- ----------------------------
DROP TABLE IF EXISTS `jsh_log`;
CREATE TABLE `jsh_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `userID` bigint(20) NOT NULL COMMENT '操作用户ID',
  `operation` varchar(500) DEFAULT NULL COMMENT '操作模块名称',
  `clientIP` varchar(50) DEFAULT NULL COMMENT '客户端IP',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '操作状态 0==成功，1==失败',
  `contentdetails` varchar(1000) DEFAULT NULL COMMENT '操作详情',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`),
  KEY `FKF2696AA13E226853` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6420 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of jsh_log
-- ----------------------------
INSERT INTO `jsh_log` VALUES ('6230', '63', '商品', '127.0.0.1', '2019-04-30 22:47:10', '0', '修改,id:568商品', '修改,id:568商品', '63');
INSERT INTO `jsh_log` VALUES ('6231', '63', '商品', '127.0.0.1', '2019-04-30 22:47:17', '0', '修改,id:569商品', '修改,id:569商品', '63');
INSERT INTO `jsh_log` VALUES ('6232', '63', '商品', '127.0.0.1', '2019-04-30 22:47:30', '0', '修改,id:570商品', '修改,id:570商品', '63');
INSERT INTO `jsh_log` VALUES ('6233', '63', '商家', '127.0.0.1', '2019-04-30 22:48:41', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6234', '63', '商家', '127.0.0.1', '2019-04-30 22:50:03', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6235', '63', '商家', '127.0.0.1', '2019-04-30 22:50:15', '0', '修改,id:60商家', '修改,id:60商家', '63');
INSERT INTO `jsh_log` VALUES ('6236', '63', '商家', '127.0.0.1', '2019-04-30 22:50:17', '0', '修改,id:60商家', '修改,id:60商家', '63');
INSERT INTO `jsh_log` VALUES ('6237', '63', '仓库', '127.0.0.1', '2019-04-30 23:04:32', '0', '修改,id:14仓库', '修改,id:14仓库', '63');
INSERT INTO `jsh_log` VALUES ('6238', '63', '仓库', '127.0.0.1', '2019-04-30 23:04:32', '0', '修改,id:15仓库', '修改,id:15仓库', '63');
INSERT INTO `jsh_log` VALUES ('6239', '63', '仓库', '127.0.0.1', '2019-04-30 23:04:36', '0', '修改,id:15仓库', '修改,id:15仓库', '63');
INSERT INTO `jsh_log` VALUES ('6240', '63', '仓库', '127.0.0.1', '2019-04-30 23:04:36', '0', '修改,id:14仓库', '修改,id:14仓库', '63');
INSERT INTO `jsh_log` VALUES ('6241', '63', '仓库', '127.0.0.1', '2019-04-30 23:09:07', '0', '修改,id:14仓库', '修改,id:14仓库', '63');
INSERT INTO `jsh_log` VALUES ('6242', '63', '仓库', '127.0.0.1', '2019-04-30 23:09:07', '0', '修改,id:15仓库', '修改,id:15仓库', '63');
INSERT INTO `jsh_log` VALUES ('6243', '63', '单据', '127.0.0.1', '2019-04-30 23:15:27', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6244', '63', '单据明细', '127.0.0.1', '2019-04-30 23:15:27', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6245', '63', '单据明细', '127.0.0.1', '2019-04-30 23:15:27', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6246', '63', '单据', '127.0.0.1', '2019-05-03 11:50:21', '0', '修改,id:196单据', '修改,id:196单据', '63');
INSERT INTO `jsh_log` VALUES ('6247', '63', '单据明细', '127.0.0.1', '2019-05-03 11:50:21', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6248', '63', '单据明细', '127.0.0.1', '2019-05-03 11:50:21', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6249', '63', '单据', '127.0.0.1', '2019-05-03 11:51:52', '0', '修改,id:196单据', '修改,id:196单据', '63');
INSERT INTO `jsh_log` VALUES ('6250', '63', '单据明细', '127.0.0.1', '2019-05-03 11:51:52', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6251', '63', '单据明细', '127.0.0.1', '2019-05-03 11:51:52', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6252', '63', '单据', '127.0.0.1', '2019-05-03 11:57:49', '0', '修改,id:196单据', '修改,id:196单据', '63');
INSERT INTO `jsh_log` VALUES ('6253', '63', '单据明细', '127.0.0.1', '2019-05-03 11:57:49', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6254', '63', '单据明细', '127.0.0.1', '2019-05-03 11:57:49', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6255', '63', '商家', '127.0.0.1', '2019-05-03 13:05:32', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6256', '63', '商家', '127.0.0.1', '2019-05-03 13:20:45', '0', '删除,id:61商家', '删除,id:61商家', '63');
INSERT INTO `jsh_log` VALUES ('6257', '63', '商家', '127.0.0.1', '2019-05-03 13:25:50', '0', '修改,id:57商家', '修改,id:57商家', '63');
INSERT INTO `jsh_log` VALUES ('6258', '63', '商家', '127.0.0.1', '2019-05-03 13:25:58', '0', '修改,id:57商家', '修改,id:57商家', '63');
INSERT INTO `jsh_log` VALUES ('6259', '63', '商家', '127.0.0.1', '2019-05-03 13:27:23', '0', '修改,id:57商家', '修改,id:57商家', '63');
INSERT INTO `jsh_log` VALUES ('6260', '63', '商家', '127.0.0.1', '2019-05-03 13:27:32', '0', '修改,id:57商家', '修改,id:57商家', '63');
INSERT INTO `jsh_log` VALUES ('6261', '63', '商家', '127.0.0.1', '2019-05-03 13:28:45', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6262', '63', '商家', '127.0.0.1', '2019-05-03 13:43:28', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6263', '63', '商家', '127.0.0.1', '2019-05-03 13:43:31', '0', '删除,id:63商家', '删除,id:63商家', '63');
INSERT INTO `jsh_log` VALUES ('6264', '63', '商家', '127.0.0.1', '2019-05-03 13:43:35', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6265', '63', '商家', '127.0.0.1', '2019-05-03 13:43:44', '0', '修改,id:64商家', '修改,id:64商家', '63');
INSERT INTO `jsh_log` VALUES ('6266', '63', '商家', '127.0.0.1', '2019-05-03 13:45:52', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6267', '63', '商家', '127.0.0.1', '2019-05-03 13:46:17', '0', '修改,id:65商家', '修改,id:65商家', '63');
INSERT INTO `jsh_log` VALUES ('6268', '63', '商家', '127.0.0.1', '2019-05-03 13:46:23', '0', '删除,id:62,64,65商家', '删除,id:62,64,65商家', '63');
INSERT INTO `jsh_log` VALUES ('6269', '63', '商家', '127.0.0.1', '2019-05-03 13:46:28', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6270', '63', '商家', '127.0.0.1', '2019-05-03 13:46:34', '0', '删除,id:66商家', '删除,id:66商家', '63');
INSERT INTO `jsh_log` VALUES ('6271', '63', '商家', '127.0.0.1', '2019-05-03 13:46:58', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6272', '63', '商家', '127.0.0.1', '2019-05-03 13:47:07', '0', '修改,id:67商家', '修改,id:67商家', '63');
INSERT INTO `jsh_log` VALUES ('6273', '63', '商家', '127.0.0.1', '2019-05-03 13:47:17', '0', '修改,id:67商家', '修改,id:67商家', '63');
INSERT INTO `jsh_log` VALUES ('6274', '63', '商家', '127.0.0.1', '2019-05-03 13:54:20', '0', '删除,id:67商家', '删除,id:67商家', '63');
INSERT INTO `jsh_log` VALUES ('6275', '63', '商家', '127.0.0.1', '2019-05-03 13:54:32', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6276', '63', '商家', '127.0.0.1', '2019-05-03 13:55:00', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6277', '63', '商家', '127.0.0.1', '2019-05-03 13:55:33', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6278', '63', '商家', '127.0.0.1', '2019-05-03 13:56:22', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6279', '63', '商家', '127.0.0.1', '2019-05-03 13:56:42', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6280', '63', '商家', '127.0.0.1', '2019-05-03 13:57:06', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6281', '63', '商家', '127.0.0.1', '2019-05-03 13:57:24', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6282', '63', '商家', '127.0.0.1', '2019-05-03 13:57:42', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6283', '63', '商家', '127.0.0.1', '2019-05-03 13:57:50', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6284', '63', '商家', '127.0.0.1', '2019-05-03 13:58:33', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6285', '63', '商家', '127.0.0.1', '2019-05-03 13:58:43', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6286', '63', '计量单位', '127.0.0.1', '2019-05-03 14:00:00', '0', '新增计量单位', '新增计量单位', '63');
INSERT INTO `jsh_log` VALUES ('6287', '63', '商品', '127.0.0.1', '2019-05-03 14:00:56', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6288', '63', '商品', '127.0.0.1', '2019-05-03 14:06:56', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6289', '63', '商品', '127.0.0.1', '2019-05-03 14:07:09', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6290', '63', '商品', '127.0.0.1', '2019-05-03 14:07:19', '0', '删除,id:572,573商品', '删除,id:572,573商品', '63');
INSERT INTO `jsh_log` VALUES ('6291', '63', '商品', '127.0.0.1', '2019-05-03 14:14:43', '0', '删除,id:571商品', '删除,id:571商品', '63');
INSERT INTO `jsh_log` VALUES ('6292', '63', '商品', '127.0.0.1', '2019-05-03 14:15:13', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6295', '63', '商品', '127.0.0.1', '2019-05-03 14:16:06', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6296', '63', '商品', '127.0.0.1', '2019-05-03 14:16:15', '0', '删除,id:574,575商品', '删除,id:574,575商品', '63');
INSERT INTO `jsh_log` VALUES ('6297', '63', '商品', '127.0.0.1', '2019-05-03 14:17:08', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6298', '63', '商品', '127.0.0.1', '2019-05-03 14:17:12', '0', '删除,id:576商品', '删除,id:576商品', '63');
INSERT INTO `jsh_log` VALUES ('6299', '63', '商品', '127.0.0.1', '2019-05-03 14:17:39', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6300', '63', '商品', '127.0.0.1', '2019-05-03 14:18:59', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6301', '63', '商品', '127.0.0.1', '2019-05-03 14:19:17', '0', '修改,id:578商品', '修改,id:578商品', '63');
INSERT INTO `jsh_log` VALUES ('6302', '63', '商品', '127.0.0.1', '2019-05-03 14:19:27', '0', '修改,id:578商品', '修改,id:578商品', '63');
INSERT INTO `jsh_log` VALUES ('6303', '63', '商品', '127.0.0.1', '2019-05-03 14:19:34', '0', '修改,id:578商品', '修改,id:578商品', '63');
INSERT INTO `jsh_log` VALUES ('6304', '63', '单据', '127.0.0.1', '2019-05-03 14:20:56', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6305', '63', '单据明细', '127.0.0.1', '2019-05-03 14:20:56', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6306', '63', '单据明细', '127.0.0.1', '2019-05-03 14:20:56', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6307', '63', '商品', '127.0.0.1', '2019-05-03 14:21:11', '0', '删除,id:578商品', '删除,id:578商品', '63');
INSERT INTO `jsh_log` VALUES ('6312', '63', '商品', '127.0.0.1', '2019-05-03 14:35:11', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6314', '63', '商品', '127.0.0.1', '2019-05-03 14:36:06', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6315', '63', '商品', '127.0.0.1', '2019-05-03 14:36:18', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6316', '63', '商品', '127.0.0.1', '2019-05-03 14:40:05', '0', '修改,id:581商品', '修改,id:581商品', '63');
INSERT INTO `jsh_log` VALUES ('6317', '63', '商品', '127.0.0.1', '2019-05-03 14:40:07', '0', '修改,id:581商品', '修改,id:581商品', '63');
INSERT INTO `jsh_log` VALUES ('6318', '63', '商品', '127.0.0.1', '2019-05-03 14:40:10', '0', '删除,id:581商品', '删除,id:581商品', '63');
INSERT INTO `jsh_log` VALUES ('6319', '63', '商品', '127.0.0.1', '2019-05-03 14:40:12', '0', '删除,id:580商品', '删除,id:580商品', '63');
INSERT INTO `jsh_log` VALUES ('6320', '63', '商品', '127.0.0.1', '2019-05-03 14:40:24', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6321', '63', '商品', '127.0.0.1', '2019-05-03 14:40:46', '0', '修改,id:582商品', '修改,id:582商品', '63');
INSERT INTO `jsh_log` VALUES ('6322', '63', '商品', '127.0.0.1', '2019-05-03 14:43:25', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6323', '63', '商品', '127.0.0.1', '2019-05-03 14:43:28', '0', '删除,id:583商品', '删除,id:583商品', '63');
INSERT INTO `jsh_log` VALUES ('6324', '63', '商品', '127.0.0.1', '2019-05-03 14:45:57', '0', '删除,id:582商品', '删除,id:582商品', '63');
INSERT INTO `jsh_log` VALUES ('6325', '63', '商品', '127.0.0.1', '2019-05-03 14:46:18', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6326', '63', '商品', '127.0.0.1', '2019-05-03 14:46:38', '0', '修改,id:584商品', '修改,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6327', '63', '商品', '127.0.0.1', '2019-05-03 14:46:43', '0', '修改,id:584商品', '修改,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6328', '63', '商品', '127.0.0.1', '2019-05-03 14:46:51', '0', '修改,id:584商品', '修改,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6329', '63', '商品', '127.0.0.1', '2019-05-03 14:47:13', '0', '修改,id:584商品', '修改,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6330', '63', '商品', '127.0.0.1', '2019-05-03 14:47:18', '0', '修改,id:584商品', '修改,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6331', '63', '商品', '127.0.0.1', '2019-05-03 14:47:21', '0', '修改,id:584商品', '修改,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6332', '63', '商品', '127.0.0.1', '2019-05-03 14:47:29', '0', '修改,id:584商品', '修改,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6333', '63', '商品', '127.0.0.1', '2019-05-03 14:48:53', '0', '删除,id:584商品', '删除,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6334', '63', '商品', '127.0.0.1', '2019-05-03 14:49:11', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6335', '63', '商家', '127.0.0.1', '2019-05-03 14:55:10', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6336', '63', '商家', '127.0.0.1', '2019-05-03 14:55:26', '0', '删除,id:69商家', '删除,id:69商家', '63');
INSERT INTO `jsh_log` VALUES ('6337', '63', '商家', '127.0.0.1', '2019-05-03 14:56:46', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6338', '63', '商家', '127.0.0.1', '2019-05-03 14:57:13', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6339', '63', '商家', '127.0.0.1', '2019-05-03 14:58:47', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6340', '63', '商家', '127.0.0.1', '2019-05-03 14:58:52', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6341', '63', '商家', '127.0.0.1', '2019-05-03 14:59:03', '0', '删除,id:70,72,73商家', '删除,id:70,72,73商家', '63');
INSERT INTO `jsh_log` VALUES ('6342', '120', '关联关系', '127.0.0.1', '2019-05-03 16:37:15', '0', '修改,id:32关联关系', '修改,id:32关联关系', null);
INSERT INTO `jsh_log` VALUES ('6343', '120', '功能', '127.0.0.1', '2019-05-03 16:55:52', '0', '新增功能', '新增功能', null);
INSERT INTO `jsh_log` VALUES ('6344', '120', '关联关系', '127.0.0.1', '2019-05-03 16:56:20', '0', '修改,id:32关联关系', '修改,id:32关联关系', null);
INSERT INTO `jsh_log` VALUES ('6345', '120', '关联关系', '127.0.0.1', '2019-05-03 16:57:24', '0', '修改,id:5关联关系', '修改,id:5关联关系', null);
INSERT INTO `jsh_log` VALUES ('6346', '120', '功能', '127.0.0.1', '2019-05-03 16:58:04', '0', '修改,id:245功能', '修改,id:245功能', null);
INSERT INTO `jsh_log` VALUES ('6347', '63', '角色', '127.0.0.1', '2019-05-03 17:06:47', '0', '新增角色', '新增角色', '63');
INSERT INTO `jsh_log` VALUES ('6348', '63', '机构', '127.0.0.1', '2019-12-28 12:13:01', '0', '新增机构', null, '63');
INSERT INTO `jsh_log` VALUES ('6349', '63', '用户', '127.0.0.1', '2019-12-28 12:13:15', '0', '新增用户', null, '63');
INSERT INTO `jsh_log` VALUES ('6350', '63', '关联关系', '127.0.0.1', '2019-12-28 12:13:24', '0', '新增关联关系', null, '63');
INSERT INTO `jsh_log` VALUES ('6351', '63', '系统配置', '127.0.0.1', '2019-12-28 12:13:39', '0', '新增系统配置', null, '63');
INSERT INTO `jsh_log` VALUES ('6352', '63', '系统配置', '127.0.0.1', '2019-12-28 12:13:47', '0', '修改,id:9系统配置', null, '63');
INSERT INTO `jsh_log` VALUES ('6353', '63', '商品', '127.0.0.1', '2019-12-28 12:14:23', '0', '新增商品', null, '63');
INSERT INTO `jsh_log` VALUES ('6354', '63', '商品', '127.0.0.1', '2019-12-28 12:14:27', '0', '删除,id:585商品', null, '63');
INSERT INTO `jsh_log` VALUES ('6355', '63', '序列号', '127.0.0.1', '2019-12-28 12:14:39', '0', '新增序列号', null, '63');
INSERT INTO `jsh_log` VALUES ('6356', '63', '商家', '127.0.0.1', '2019-12-28 12:14:58', '0', '修改,id:59商家', null, '63');
INSERT INTO `jsh_log` VALUES ('6357', '63', '商家', '127.0.0.1', '2019-12-28 12:15:04', '0', '修改,id:71商家', null, '63');
INSERT INTO `jsh_log` VALUES ('6358', '63', '收支项目', '127.0.0.1', '2019-12-28 12:15:17', '0', '新增收支项目', null, '63');
INSERT INTO `jsh_log` VALUES ('6359', '63', '收支项目', '127.0.0.1', '2019-12-28 12:15:23', '0', '新增收支项目', null, '63');
INSERT INTO `jsh_log` VALUES ('6360', '63', '经手人', '127.0.0.1', '2019-12-28 12:15:35', '0', '新增经手人', null, '63');
INSERT INTO `jsh_log` VALUES ('6361', '63', '经手人', '127.0.0.1', '2019-12-28 12:15:40', '0', '新增经手人', null, '63');
INSERT INTO `jsh_log` VALUES ('6362', '63', '经手人', '127.0.0.1', '2019-12-28 12:15:48', '0', '新增经手人', null, '63');
INSERT INTO `jsh_log` VALUES ('6363', '63', '财务', '127.0.0.1', '2019-12-28 12:16:23', '0', '新增财务', null, '63');
INSERT INTO `jsh_log` VALUES ('6364', '63', '财务明细', '127.0.0.1', '2019-12-28 12:16:23', '0', '修改,id:,headerId:97财务明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6365', '63', '财务明细', '127.0.0.1', '2019-12-28 12:16:23', '0', '删除,id:财务明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6366', '63', '单据', '127.0.0.1', '2019-12-28 12:16:36', '0', '新增单据', null, '63');
INSERT INTO `jsh_log` VALUES ('6367', '63', '单据明细', '127.0.0.1', '2019-12-28 12:16:36', '0', '新增单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6368', '63', '单据明细', '127.0.0.1', '2019-12-28 12:16:36', '0', '删除,id:单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6369', '63', '单据', '127.0.0.1', '2019-12-28 12:16:43', '0', '删除,id:198单据', null, '63');
INSERT INTO `jsh_log` VALUES ('6370', '63', '单据', '127.0.0.1', '2019-12-28 12:16:43', '0', '删除,id:198单据', null, '63');
INSERT INTO `jsh_log` VALUES ('6371', '63', '单据', '127.0.0.1', '2019-12-28 12:16:43', '0', '删除,id:198单据', null, '63');
INSERT INTO `jsh_log` VALUES ('6372', '63', '单据', '127.0.0.1', '2019-12-28 12:16:55', '0', '新增单据', null, '63');
INSERT INTO `jsh_log` VALUES ('6373', '63', '单据明细', '127.0.0.1', '2019-12-28 12:16:55', '0', '新增单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6374', '63', '单据明细', '127.0.0.1', '2019-12-28 12:16:55', '0', '删除,id:单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6375', '63', '单据', '127.0.0.1', '2019-12-28 12:17:09', '0', '新增单据', null, '63');
INSERT INTO `jsh_log` VALUES ('6376', '63', '单据明细', '127.0.0.1', '2019-12-28 12:17:09', '0', '新增单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6377', '63', '单据明细', '127.0.0.1', '2019-12-28 12:17:09', '0', '删除,id:单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6378', '63', '单据', '127.0.0.1', '2019-12-28 12:17:22', '0', '新增单据', null, '63');
INSERT INTO `jsh_log` VALUES ('6379', '63', '单据明细', '127.0.0.1', '2019-12-28 12:17:22', '0', '新增单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6380', '63', '单据明细', '127.0.0.1', '2019-12-28 12:17:22', '0', '删除,id:单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6381', '63', '单据', '127.0.0.1', '2019-12-28 12:17:40', '0', '新增单据', null, '63');
INSERT INTO `jsh_log` VALUES ('6382', '63', '单据明细', '127.0.0.1', '2019-12-28 12:17:40', '0', '新增单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6383', '63', '单据明细', '127.0.0.1', '2019-12-28 12:17:40', '0', '删除,id:单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6384', '63', '单据', '127.0.0.1', '2019-12-28 12:17:48', '0', '新增单据', null, '63');
INSERT INTO `jsh_log` VALUES ('6385', '63', '单据明细', '127.0.0.1', '2019-12-28 12:17:48', '0', '新增单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6386', '63', '单据明细', '127.0.0.1', '2019-12-28 12:17:48', '0', '删除,id:单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6387', '63', '单据', '127.0.0.1', '2019-12-28 12:17:58', '0', '新增单据', null, '63');
INSERT INTO `jsh_log` VALUES ('6388', '63', '单据明细', '127.0.0.1', '2019-12-28 12:17:58', '0', '新增单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6389', '63', '单据明细', '127.0.0.1', '2019-12-28 12:17:58', '0', '删除,id:单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6390', '63', '单据', '127.0.0.1', '2019-12-28 12:18:09', '0', '新增单据', null, '63');
INSERT INTO `jsh_log` VALUES ('6391', '63', '单据明细', '127.0.0.1', '2019-12-28 12:18:09', '0', '新增单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6392', '63', '单据明细', '127.0.0.1', '2019-12-28 12:18:09', '0', '删除,id:单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6393', '63', '商品', '127.0.0.1', '2019-12-28 12:18:27', '0', '修改,id:570商品', null, '63');
INSERT INTO `jsh_log` VALUES ('6394', '63', '单据', '127.0.0.1', '2019-12-28 12:18:47', '0', '新增单据', null, '63');
INSERT INTO `jsh_log` VALUES ('6395', '63', '单据明细', '127.0.0.1', '2019-12-28 12:18:47', '0', '新增单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6396', '63', '单据明细', '127.0.0.1', '2019-12-28 12:18:47', '0', '删除,id:单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6397', '63', '财务', '127.0.0.1', '2019-12-28 12:19:05', '0', '新增财务', null, '63');
INSERT INTO `jsh_log` VALUES ('6398', '63', '财务明细', '127.0.0.1', '2019-12-28 12:19:05', '0', '修改,id:,headerId:98财务明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6399', '63', '财务明细', '127.0.0.1', '2019-12-28 12:19:05', '0', '删除,id:财务明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6400', '63', '财务', '127.0.0.1', '2019-12-28 12:19:19', '0', '新增财务', null, '63');
INSERT INTO `jsh_log` VALUES ('6401', '63', '财务明细', '127.0.0.1', '2019-12-28 12:19:19', '0', '修改,id:,headerId:99财务明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6402', '63', '财务明细', '127.0.0.1', '2019-12-28 12:19:19', '0', '删除,id:财务明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6403', '63', '财务', '127.0.0.1', '2019-12-28 12:19:30', '0', '新增财务', null, '63');
INSERT INTO `jsh_log` VALUES ('6404', '63', '财务明细', '127.0.0.1', '2019-12-28 12:19:30', '0', '修改,id:,headerId:100财务明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6405', '63', '财务明细', '127.0.0.1', '2019-12-28 12:19:30', '0', '删除,id:财务明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6406', '63', '财务', '127.0.0.1', '2019-12-28 12:19:42', '0', '新增财务', null, '63');
INSERT INTO `jsh_log` VALUES ('6407', '63', '财务明细', '127.0.0.1', '2019-12-28 12:19:42', '0', '修改,id:,headerId:101财务明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6408', '63', '财务明细', '127.0.0.1', '2019-12-28 12:19:42', '0', '删除,id:财务明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6409', '63', '商家', '127.0.0.1', '2019-12-28 12:19:54', '0', '修改,id:60商家', null, '63');
INSERT INTO `jsh_log` VALUES ('6410', '63', '财务', '127.0.0.1', '2019-12-28 12:19:54', '0', '新增财务', null, '63');
INSERT INTO `jsh_log` VALUES ('6411', '63', '财务明细', '127.0.0.1', '2019-12-28 12:19:54', '0', '修改,id:,headerId:102财务明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6412', '63', '财务明细', '127.0.0.1', '2019-12-28 12:19:54', '0', '删除,id:财务明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6413', '63', '单据', '127.0.0.1', '2019-12-28 12:20:26', '0', '新增单据', null, '63');
INSERT INTO `jsh_log` VALUES ('6414', '63', '商家', '127.0.0.1', '2019-12-28 12:20:26', '0', '修改,id:60商家', null, '63');
INSERT INTO `jsh_log` VALUES ('6415', '63', '单据明细', '127.0.0.1', '2019-12-28 12:20:26', '0', '新增单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6416', '63', '单据明细', '127.0.0.1', '2019-12-28 12:20:26', '0', '删除,id:单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6417', '63', '单据', '127.0.0.1', '2019-12-28 12:20:39', '0', '新增单据', null, '63');
INSERT INTO `jsh_log` VALUES ('6418', '63', '单据明细', '127.0.0.1', '2019-12-28 12:20:39', '0', '新增单据明细', null, '63');
INSERT INTO `jsh_log` VALUES ('6419', '63', '单据明细', '127.0.0.1', '2019-12-28 12:20:39', '0', '删除,id:单据明细', null, '63');

-- ----------------------------
-- Table structure for jsh_material
-- ----------------------------
DROP TABLE IF EXISTS `jsh_material`;
CREATE TABLE `jsh_material` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `CategoryId` bigint(20) DEFAULT NULL COMMENT '产品类型',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `Mfrs` varchar(50) DEFAULT NULL COMMENT '制造商',
  `Packing` decimal(24,6) DEFAULT NULL COMMENT 'Gói装（KG/Gói）',
  `SafetyStock` decimal(24,6) DEFAULT NULL COMMENT '安全存量（KG）',
  `Model` varchar(50) DEFAULT NULL COMMENT '型号',
  `Standard` varchar(50) DEFAULT NULL COMMENT '规格',
  `Color` varchar(50) DEFAULT NULL COMMENT '颜色',
  `Unit` varchar(50) DEFAULT NULL COMMENT '单位-单Mỗi',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `RetailPrice` decimal(24,6) DEFAULT NULL COMMENT 'Bán lẻ价',
  `LowPrice` decimal(24,6) DEFAULT NULL COMMENT '最低售价',
  `PresetPriceOne` decimal(24,6) DEFAULT NULL COMMENT '预设售价一',
  `PresetPriceTwo` decimal(24,6) DEFAULT NULL COMMENT '预设售价二',
  `UnitId` bigint(20) DEFAULT NULL COMMENT '计量单位Id',
  `FirstOutUnit` varchar(50) DEFAULT NULL COMMENT '首选Ra nước ngoài单位',
  `FirstInUnit` varchar(50) DEFAULT NULL COMMENT '首选Kho单位',
  `PriceStrategy` varchar(500) DEFAULT NULL COMMENT '价格策略',
  `Enabled` bit(1) DEFAULT NULL COMMENT '启用 0-禁用  1-启用',
  `OtherField1` varchar(50) DEFAULT NULL COMMENT '自定义1',
  `OtherField2` varchar(50) DEFAULT NULL COMMENT '自定义2',
  `OtherField3` varchar(50) DEFAULT NULL COMMENT '自定义3',
  `enableSerialNumber` varchar(1) DEFAULT '0' COMMENT '是否开启序列号，0否，1是',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`),
  KEY `FK675951272AB6672C` (`CategoryId`),
  KEY `UnitId` (`UnitId`)
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of jsh_material
-- ----------------------------
INSERT INTO `jsh_material` VALUES ('485', '2', '棉线', 'a1', null, '100.000000', 'A21-4321', '5g', '白色', 'Sân', '', '1.000000', '1.000000', '1.000000', '1.000000', null, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', 'b2', 'c3', 'd4', '0', null, '0');
INSERT INTO `jsh_material` VALUES ('487', '1', '网布', '制造商b', null, '100.000000', '12343', '10g', '', 'Sân', '', '1.000000', '1.000000', '1.000000', '1.000000', null, '', '', '[{\"basic\":{\"Unit\":\"kg\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}},{\"other\":{\"Unit\":\"Gói\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', null, null, null, '0', null, '0');
INSERT INTO `jsh_material` VALUES ('498', '1', '蕾丝', '制造商c', null, null, 'B123a', '6g', '', 'Sân', '', '1.200000', '1.000000', '1.300000', '1.400000', null, '', '', '[{\"basic\":{\"Unit\":\"kg\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}},{\"other\":{\"Unit\":\"Gói\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', null, null, null, '0', null, '0');
INSERT INTO `jsh_material` VALUES ('499', '1', '棉线', '制造商d', null, null, 'A21-1234', '7g', '', 'Sân', '', '2.200000', '2.000000', '2.400000', '2.600000', null, '', '', '[{\"basic\":{\"Unit\":\"kg\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}},{\"other\":{\"Unit\":\"Gói\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', null, null, null, '0', null, '0');
INSERT INTO `jsh_material` VALUES ('500', '1', '纯棉线', '制造商e', null, null, 'AAA666', '11g', '', 'Sân', '', '1.100000', '1.000000', '1.200000', '1.300000', null, '', '', '[{\"basic\":{\"Unit\":\"kg\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}},{\"other\":{\"Unit\":\"Gói\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', null, null, null, '0', null, '0');
INSERT INTO `jsh_material` VALUES ('517', '1', '奶酪', '制造商', null, null, 'AAAA', '12ml', '', '', '', null, null, null, null, '8', 'Chai', 'Hộp', '[{\"basic\":{\"Unit\":\"Chai\",\"RetailPrice\":\"1.5\",\"LowPrice\":\"2\",\"PresetPriceOne\":\"3\",\"PresetPriceTwo\":\"4\"}},{\"other\":{\"Unit\":\"Hộp\",\"RetailPrice\":\"18\",\"LowPrice\":\"24\",\"PresetPriceOne\":\"36\",\"PresetPriceTwo\":\"48\"}}]', '', null, null, null, '0', null, '0');
INSERT INTO `jsh_material` VALUES ('518', '1', '安慕希', '伊利', null, null, 'abcd', '350ml', '银白色', '', '', null, null, null, null, '2', 'kg', 'Gói', '[{\"basic\":{\"Unit\":\"kg\",\"RetailPrice\":\"2\",\"LowPrice\":\"1\",\"PresetPriceOne\":\"3\",\"PresetPriceTwo\":\"4\"}},{\"other\":{\"Unit\":\"Gói\",\"RetailPrice\":\"50\",\"LowPrice\":\"25\",\"PresetPriceOne\":\"75\",\"PresetPriceTwo\":\"100\"}}]', '', '', '', '', '0', null, '0');
INSERT INTO `jsh_material` VALUES ('562', '1', '红苹果（蛇果）', '', null, null, '60#', '大铁筐', '', 'Mỗi', '', '12.000000', '10.000000', '8.000000', '11.000000', null, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"enableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', null, '0');
INSERT INTO `jsh_material` VALUES ('563', '8', '139电话卡', '', null, null, '139', '规格1', '绿色', 'Trương', '', '11.000000', '11.000000', '11.000000', '11.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"enableSerialNumber\":\"1\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '1', null, '0');
INSERT INTO `jsh_material` VALUES ('564', '14', '商品1', '', null, null, 'sp1', '', '', 'Mỗi', '', '22.000000', '22.000000', '22.000000', '22.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"enableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '1', '0');
INSERT INTO `jsh_material` VALUES ('565', '14', '商品2', '', null, null, 'sp2', '', '', 'Mỗi', '', '44.000000', '44.000000', '44.000000', '44.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"1\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '1', '1', '0');
INSERT INTO `jsh_material` VALUES ('566', '15', '商品666', '', null, null, 'sp666', '', '', 'Mỗi', '', '5.000000', '4.000000', '3.000000', '2.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '117', '0');
INSERT INTO `jsh_material` VALUES ('567', null, '商品1', '', null, null, 'dsp1', '', '', 'Mỗi', '', '11.000000', '11.000000', '11.000000', '11.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '115', '0');
INSERT INTO `jsh_material` VALUES ('568', '17', '商品1', '', null, '100.000000', 'sp1', '', '', 'Mỗi', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('569', '17', '商品2', '', null, '200.000000', 'sp2', '', '', 'Chỉ', '', '5.000000', '5.000000', '5.000000', '5.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('570', '17', '商品3', '', null, '300.000000', 'sp3', '', '', 'Mỗi', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('571', null, '商品4', '', null, null, 'sp4', '', '', '', '', null, null, null, null, '15', 'Mỗi', 'Hộp', '[{\"basic\":{\"Unit\":\"Mỗi\",\"RetailPrice\":\"3\",\"LowPrice\":\"2\",\"PresetPriceOne\":\"2\",\"PresetPriceTwo\":\"2\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"Hộp\",\"RetailPrice\":\"36\",\"LowPrice\":\"24\",\"PresetPriceOne\":\"24\",\"PresetPriceTwo\":\"24\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('572', null, '234234', '', null, null, '234234', '', '', '', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('573', null, '12312', '', null, null, '12', '', '', '', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('574', null, '商品5', '', null, null, '213qw', '', '', 'Mỗi', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('575', null, '商品6', '', null, null, 'sp6', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"Mỗi\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"Hộp\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('576', null, '商品7', '', null, null, 'sp7', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"Mỗi\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"Hộp\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('577', null, '商品8', '', null, null, 'sp8', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"Mỗi\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"Hộp\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('578', '17', '商品9', '', null, null, 'sp9', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"Mỗi\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"Hộp\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('579', null, '商品17', '', null, null, 'sp17', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"Mỗi\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"Hộp\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('580', null, '15', '', null, null, '15', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"Mỗi\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"Hộp\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('581', null, '16', '', null, null, '16', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"Mỗi\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"Hộp\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('582', null, '商品20', '', null, null, 'sp2', '', '', 'Mỗi', '', null, null, null, null, null, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('583', null, 'wer', '', null, null, 'rqwe', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"Mỗi\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"Hộp\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('584', null, 'sfds', '', null, null, 'a2233', '12', '2', 'ge', '', '1.000000', '2.000000', '3.000000', '4.000000', null, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('585', null, 'asdf', '', null, null, 'adsfasdf', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"Mỗi\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"Hộp\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('586', null, '序列号商品测试', '', null, null, 'xlh123', '', '', 'Mỗi', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"1\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '1', '63', '0');

-- ----------------------------
-- Table structure for jsh_materialcategory
-- ----------------------------
DROP TABLE IF EXISTS `jsh_materialcategory`;
CREATE TABLE `jsh_materialcategory` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `CategoryLevel` smallint(6) DEFAULT NULL COMMENT '等级',
  `ParentId` bigint(20) DEFAULT NULL COMMENT '上级ID',
  `sort` varchar(10) DEFAULT NULL COMMENT '显示顺序',
  `status` varchar(1) DEFAULT '0' COMMENT '状态，0系统默认，1启用，2删除',
  `serial_no` varchar(100) DEFAULT NULL COMMENT '编号',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`Id`),
  KEY `FK3EE7F725237A77D8` (`ParentId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='产品类型表';

-- ----------------------------
-- Records of jsh_materialcategory
-- ----------------------------
INSERT INTO `jsh_materialcategory` VALUES ('1', '根目录', '1', '-1', null, '2', '1', null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('2', '花边一级A', '1', '1', '', '2', '', '', null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('3', '花边一级B', '1', '1', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('4', '其他', '2', '3', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('5', '其他', '3', '4', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('6', '花边二级A', '2', '2', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('7', '花边三级A', '3', '6', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('8', '花边二级B', '2', '2', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('9', '花边一级C', '1', '1', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('10', '花边三级B', '3', '6', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('11', 'ddddd', null, '-1', '', '1', '', '', '2019-03-15 23:09:13', '63', '2019-03-15 23:09:13', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('12', 'ffffff', null, '11', '', '1', '', '', '2019-03-15 23:09:27', '63', '2019-03-15 23:09:27', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('13', '目录1', null, '-1', '', '1', '111', '', '2019-03-18 22:45:39', '63', '2019-03-18 22:45:39', '63', '1');
INSERT INTO `jsh_materialcategory` VALUES ('14', '目录2', null, '13', '', '1', '234', '', '2019-03-18 23:39:39', '63', '2019-03-18 23:39:39', '63', '1');
INSERT INTO `jsh_materialcategory` VALUES ('15', '目录1', null, '-1', '', '1', '', '', '2019-03-31 21:53:53', '117', '2019-03-31 21:53:53', '117', '117');
INSERT INTO `jsh_materialcategory` VALUES ('16', 'aaaa', null, '-1', '', '1', '', '', '2019-04-02 22:28:07', '115', '2019-04-02 22:28:07', '115', '115');
INSERT INTO `jsh_materialcategory` VALUES ('17', '目录1', null, '-1', '', '1', '', '', '2019-04-10 22:18:12', '63', '2019-04-10 22:18:12', '63', '63');

-- ----------------------------
-- Table structure for jsh_materialproperty
-- ----------------------------
DROP TABLE IF EXISTS `jsh_materialproperty`;
CREATE TABLE `jsh_materialproperty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `nativeName` varchar(50) DEFAULT NULL COMMENT '原始名称',
  `enabled` bit(1) DEFAULT NULL COMMENT '是否启用',
  `sort` varchar(10) DEFAULT NULL COMMENT '排序',
  `anotherName` varchar(50) DEFAULT NULL COMMENT '别名',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='产品扩展字段表';

-- ----------------------------
-- Records of jsh_materialproperty
-- ----------------------------
INSERT INTO `jsh_materialproperty` VALUES ('1', '规格', '', '02', '规格', '0');
INSERT INTO `jsh_materialproperty` VALUES ('2', '颜色', '', '01', '颜色', '0');
INSERT INTO `jsh_materialproperty` VALUES ('3', '制造商', '\0', '03', '制造商', '0');
INSERT INTO `jsh_materialproperty` VALUES ('4', '自定义1', '\0', '04', '自定义1', '0');
INSERT INTO `jsh_materialproperty` VALUES ('5', '自定义2', '\0', '05', '自定义2', '0');
INSERT INTO `jsh_materialproperty` VALUES ('6', '自定义3', '\0', '06', '自定义3', '0');

-- ----------------------------
-- Table structure for jsh_material_stock
-- ----------------------------
DROP TABLE IF EXISTS `jsh_material_stock`;
CREATE TABLE `jsh_material_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `material_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `depot_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `number` decimal(24,6) DEFAULT NULL COMMENT '初始库存Số lượng',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_fag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='产品初始库存';

-- ----------------------------
-- Records of jsh_material_stock
-- ----------------------------

-- ----------------------------
-- Table structure for jsh_msg
-- ----------------------------
DROP TABLE IF EXISTS `jsh_msg`;
CREATE TABLE `jsh_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `msg_title` varchar(100) DEFAULT NULL COMMENT '消息标题',
  `msg_content` varchar(500) DEFAULT NULL COMMENT '消息内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `type` varchar(20) DEFAULT NULL COMMENT '消息类型',
  `status` varchar(1) DEFAULT NULL COMMENT '状态，1未读 2已读',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='消息表';

-- ----------------------------
-- Records of jsh_msg
-- ----------------------------
INSERT INTO `jsh_msg` VALUES ('2', '标题1', '内容1', '2019-09-10 00:11:39', '类型1', '1', '63', '0');

-- ----------------------------
-- Table structure for jsh_organization
-- ----------------------------
DROP TABLE IF EXISTS `jsh_organization`;
CREATE TABLE `jsh_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `org_no` varchar(20) DEFAULT NULL COMMENT '机构编号',
  `org_full_name` varchar(500) DEFAULT NULL COMMENT '机构全称',
  `org_abr` varchar(20) DEFAULT NULL COMMENT '机构简称',
  `org_tpcd` varchar(9) DEFAULT NULL COMMENT '机构类型',
  `org_stcd` char(1) DEFAULT NULL COMMENT '机构状态,1未营业、2正常营业、3暂停营业、4终止营业、5已除名',
  `org_parent_no` varchar(20) DEFAULT NULL COMMENT '机构父节点编号',
  `sort` varchar(20) DEFAULT NULL COMMENT '机构显示顺序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `org_create_time` datetime DEFAULT NULL COMMENT '机构创建时间',
  `org_stop_time` datetime DEFAULT NULL COMMENT '机构停运时间',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of jsh_organization
-- ----------------------------
INSERT INTO `jsh_organization` VALUES ('1', '01', '根机构', '根机构', null, '5', '-1', '1', '根机构，初始化存在', null, null, '2019-03-15 23:01:21', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('2', null, 'Bán hàng', 'Bán hàng', null, '5', '01', '1', '机构表初始化', null, null, '2019-03-15 23:01:21', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('3', null, 'sdf444', 'sdf444', null, '5', '01', '2', '机构表初始化', null, null, '2019-03-15 23:01:19', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('4', null, '1231', '1231', null, '5', '01', '3', '机构表初始化', null, null, '2019-03-15 23:01:19', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('5', null, '23', '23', null, '5', '01', '4', '机构表初始化', null, null, '2019-03-15 23:01:19', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('6', '4444', 'abcd', 'abcd', null, '1', '-1', '', '', '2019-03-15 23:01:30', '63', '2019-03-15 23:01:47', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('7', '123', 'bbbb', 'bbbb', null, '1', 'abcd', '', '', '2019-03-15 23:01:42', '63', '2019-03-15 23:01:42', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('8', 'ddddd', 'ddddd', 'ddddd', null, '1', '4444', '', '', '2019-03-15 23:02:02', '63', '2019-03-15 23:02:02', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('9', '555', 'dddddddddd', 'dddddddddd', null, '1', 'ddddd', '', '', '2019-03-15 23:02:16', '63', '2019-03-15 23:02:16', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('10', '23124', 'gaga', 'gaga', null, '1', '-1', '11', '', '2019-03-31 21:52:31', '117', '2019-03-31 21:52:31', '117', null, null, '117');
INSERT INTO `jsh_organization` VALUES ('11', '12312', 'fsadfasdf', 'fsadfasdf', null, '1', '23124', '12312', '', '2019-03-31 21:52:52', '117', '2019-03-31 21:52:52', '117', null, null, '117');
INSERT INTO `jsh_organization` VALUES ('12', '001', '测试机构', '测试机构', null, '2', '-1', '001', '', '2019-12-28 12:13:01', '63', '2019-12-28 12:13:01', '63', null, null, '63');

-- ----------------------------
-- Table structure for jsh_orga_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `jsh_orga_user_rel`;
CREATE TABLE `jsh_orga_user_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `orga_id` bigint(20) NOT NULL COMMENT '机构id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `user_blng_orga_dspl_seq` varchar(20) DEFAULT NULL COMMENT '用户在所属机构中显示顺序',
  `delete_flag` char(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='机构用户关系表';

-- ----------------------------
-- Records of jsh_orga_user_rel
-- ----------------------------
INSERT INTO `jsh_orga_user_rel` VALUES ('1', '9', '64', '', '0', null, null, '2019-03-15 23:03:39', '63', null);
INSERT INTO `jsh_orga_user_rel` VALUES ('2', '3', '65', null, '0', null, null, null, null, null);
INSERT INTO `jsh_orga_user_rel` VALUES ('3', '3', '67', null, '0', null, null, null, null, null);
INSERT INTO `jsh_orga_user_rel` VALUES ('4', '4', '84', null, '0', null, null, null, null, null);
INSERT INTO `jsh_orga_user_rel` VALUES ('5', '5', '86', null, '0', null, null, null, null, null);
INSERT INTO `jsh_orga_user_rel` VALUES ('6', '3', '91', '', '0', '2019-03-12 21:55:28', '63', '2019-03-12 21:55:28', '63', null);
INSERT INTO `jsh_orga_user_rel` VALUES ('7', '9', '95', '', '0', '2019-03-15 23:03:22', '63', '2019-03-15 23:03:22', '63', null);
INSERT INTO `jsh_orga_user_rel` VALUES ('8', '9', '96', '', '0', '2019-03-17 23:32:08', '63', '2019-03-17 23:32:08', '63', null);
INSERT INTO `jsh_orga_user_rel` VALUES ('9', '10', '117', '', '0', '2019-03-31 21:53:03', '117', '2019-03-31 21:53:12', '117', '117');
INSERT INTO `jsh_orga_user_rel` VALUES ('10', '12', '131', '', '0', '2019-12-28 12:13:15', '63', '2019-12-28 12:13:15', '63', '63');

-- ----------------------------
-- Table structure for jsh_person
-- ----------------------------
DROP TABLE IF EXISTS `jsh_person`;
CREATE TABLE `jsh_person` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `Type` varchar(20) DEFAULT NULL COMMENT '类型',
  `Name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='经手人表';

-- ----------------------------
-- Records of jsh_person
-- ----------------------------
INSERT INTO `jsh_person` VALUES ('3', '财务员', '王五-财务', null, '0');
INSERT INTO `jsh_person` VALUES ('4', '财务员', '赵六-财务', null, '0');
INSERT INTO `jsh_person` VALUES ('5', '业务员', '小李', null, '0');
INSERT INTO `jsh_person` VALUES ('6', '业务员', '小军', null, '0');
INSERT INTO `jsh_person` VALUES ('7', '业务员', '小曹', null, '0');
INSERT INTO `jsh_person` VALUES ('8', '仓管员', '小季', '1', '0');
INSERT INTO `jsh_person` VALUES ('9', '财务员', '小月', '1', '0');
INSERT INTO `jsh_person` VALUES ('10', '仓管员', '小Trương', '117', '0');
INSERT INTO `jsh_person` VALUES ('11', '业务员', '晓丽', '117', '0');
INSERT INTO `jsh_person` VALUES ('12', '财务员', '小草', '117', '0');
INSERT INTO `jsh_person` VALUES ('13', '业务员', '经手人1', '115', '0');
INSERT INTO `jsh_person` VALUES ('14', '业务员', '小李', '63', '0');
INSERT INTO `jsh_person` VALUES ('15', '仓管员', '小军', '63', '0');
INSERT INTO `jsh_person` VALUES ('16', '财务员', '小夏', '63', '0');

-- ----------------------------
-- Table structure for jsh_role
-- ----------------------------
DROP TABLE IF EXISTS `jsh_role`;
CREATE TABLE `jsh_role` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `value` varchar(200) DEFAULT NULL COMMENT '值',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of jsh_role
-- ----------------------------
INSERT INTO `jsh_role` VALUES ('4', '管理员', null, null, null, null, '0');
INSERT INTO `jsh_role` VALUES ('5', '仓管员', null, null, null, null, '0');
INSERT INTO `jsh_role` VALUES ('10', '租户', null, null, null, null, '0');
INSERT INTO `jsh_role` VALUES ('12', '角色123', null, null, null, '117', '0');
INSERT INTO `jsh_role` VALUES ('13', '角色test', null, null, null, null, '0');
INSERT INTO `jsh_role` VALUES ('14', '44444', null, null, null, null, '1');
INSERT INTO `jsh_role` VALUES ('15', 'laoba角色', null, null, null, '115', '0');
INSERT INTO `jsh_role` VALUES ('16', '测试角色123', null, null, null, '63', '0');

-- ----------------------------
-- Table structure for jsh_sequence
-- ----------------------------
DROP TABLE IF EXISTS `jsh_sequence`;
CREATE TABLE `jsh_sequence` (
  `seq_name` varchar(50) NOT NULL COMMENT '序列名称',
  `min_value` bigint(20) NOT NULL COMMENT '最小值',
  `max_value` bigint(20) NOT NULL COMMENT '最大值',
  `current_val` bigint(20) NOT NULL COMMENT '当前值',
  `increment_val` int(11) NOT NULL DEFAULT '1' COMMENT '增长步数',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`seq_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单据编号表';

-- ----------------------------
-- Records of jsh_sequence
-- ----------------------------
INSERT INTO `jsh_sequence` VALUES ('depot_number_seq', '1', '999999999999999999', '315', '1', '单据编号sequence');

-- ----------------------------
-- Table structure for jsh_serial_number
-- ----------------------------
DROP TABLE IF EXISTS `jsh_serial_number`;
CREATE TABLE `jsh_serial_number` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `material_Id` bigint(20) DEFAULT NULL COMMENT '产品表id',
  `serial_Number` varchar(64) DEFAULT NULL COMMENT '序列号',
  `is_Sell` varchar(1) DEFAULT '0' COMMENT '是否卖出，0未卖出，1卖出',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_Time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `depothead_Id` bigint(20) DEFAULT NULL COMMENT '单据主表id，用于跟踪序列号流向',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='序列号表';

-- ----------------------------
-- Records of jsh_serial_number
-- ----------------------------
INSERT INTO `jsh_serial_number` VALUES ('1', '563', '13915521178850971', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('2', '563', '13915521178850972', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('3', '563', '13915521178850973', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('4', '563', '13915521178850974', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('5', '563', '13915521178850975', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('6', '563', '13915521178850976', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('7', '563', '13915521178850977', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('8', '563', '13915521178850978', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('9', '563', '13915521178850979', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('10', '563', '139155211788509710', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('11', '563', '139155211788509711', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:57:26', '63', '118', null);
INSERT INTO `jsh_serial_number` VALUES ('12', '563', '139155211788509712', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('13', '563', '139155211788509713', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('14', '563', '139155211788509714', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('15', '563', '139155211788509715', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('16', '563', '139155211788509716', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('17', '563', '139155211788509717', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('18', '563', '139155211788509718', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('19', '563', '139155211788509719', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('20', '563', '139155211788509720', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('21', '563', '139155211788509721', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('22', '563', '139155211788509722', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('23', '563', '139155211788509723', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('24', '563', '139155211788509724', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('25', '563', '139155211788509725', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('26', '563', '139155211788509726', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('27', '563', '139155211788509727', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('28', '563', '139155211788509728', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('29', '563', '139155211788509729', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('30', '563', '139155211788509730', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('31', '563', '139155211788509731', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('32', '563', '139155211788509732', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('33', '563', '139155211788509733', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('34', '563', '139155211788509734', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('35', '563', '139155211788509735', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('36', '563', '139155211788509736', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('37', '563', '139155211788509737', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('38', '563', '139155211788509738', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('39', '563', '139155211788509739', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('40', '563', '139155211788509740', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('41', '563', '139155211788509741', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('42', '563', '139155211788509742', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('43', '563', '139155211788509743', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('44', '563', '139155211788509744', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('45', '563', '139155211788509745', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('46', '563', '139155211788509746', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('47', '563', '139155211788509747', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('48', '563', '139155211788509748', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('49', '563', '139155211788509749', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('50', '563', '139155211788509750', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('51', '563', '139155211788509751', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('52', '563', '139155211788509752', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('53', '563', '139155211788509753', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('54', '563', '139155211788509754', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('55', '563', '139155211788509755', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('56', '563', '139155211788509756', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('57', '563', '139155211788509757', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('58', '563', '139155211788509758', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('59', '563', '139155211788509759', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('60', '563', '139155211788509760', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('61', '563', '139155211788509761', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('62', '563', '139155211788509762', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('63', '563', '139155211788509763', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('64', '563', '139155211788509764', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('65', '563', '139155211788509765', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('66', '563', '139155211788509766', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('67', '563', '139155211788509767', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('68', '563', '139155211788509768', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('69', '563', '139155211788509769', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('70', '563', '139155211788509770', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('71', '563', '139155211788509771', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('72', '563', '139155211788509772', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('73', '563', '139155211788509773', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('74', '563', '139155211788509774', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('75', '563', '139155211788509775', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('76', '563', '139155211788509776', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('77', '563', '139155211788509777', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('78', '563', '139155211788509778', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('79', '563', '139155211788509779', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('80', '563', '139155211788509780', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('81', '563', '139155211788509781', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('82', '563', '139155211788509782', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('83', '563', '139155211788509783', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('84', '563', '139155211788509784', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('85', '563', '139155211788509785', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('86', '563', '139155211788509786', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('87', '563', '139155211788509787', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('88', '563', '139155211788509788', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('89', '563', '139155211788509789', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('90', '563', '139155211788509790', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('91', '563', '139155211788509791', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('92', '563', '139155211788509792', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('93', '563', '139155211788509793', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('94', '563', '139155211788509794', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('95', '563', '139155211788509795', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('96', '563', '139155211788509796', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('97', '563', '139155211788509797', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('98', '563', '139155211788509798', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('99', '563', '139155211788509799', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('100', '563', '1391552117885097100', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('102', '563', '123123123', '0', '', '0', '2019-03-21 23:57:29', '63', '2019-03-21 23:57:29', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('103', '565', '2222222', '0', '', '0', '2019-03-21 23:57:37', '63', '2019-03-21 23:57:37', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('104', '563', '234213123', '0', '', '0', '2019-03-21 23:58:00', '63', '2019-03-21 23:58:00', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('105', '586', '12312323423223', '0', '', '0', '2019-12-28 12:14:39', '63', '2019-12-28 12:14:39', '63', null, '63');

-- ----------------------------
-- Table structure for jsh_supplier
-- ----------------------------
DROP TABLE IF EXISTS `jsh_supplier`;
CREATE TABLE `jsh_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `supplier` varchar(255) NOT NULL COMMENT '供应商名称',
  `contacts` varchar(100) DEFAULT NULL COMMENT '联系人',
  `phonenum` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮Hộp',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `isystem` tinyint(4) DEFAULT NULL COMMENT '是否系统自带 0==系统 1==非系统',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `enabled` bit(1) DEFAULT NULL COMMENT '启用',
  `AdvanceIn` decimal(24,6) DEFAULT '0.000000' COMMENT '预收款',
  `BeginNeedGet` decimal(24,6) DEFAULT NULL COMMENT '期初应收',
  `BeginNeedPay` decimal(24,6) DEFAULT NULL COMMENT '期初应付',
  `AllNeedGet` decimal(24,6) DEFAULT NULL COMMENT '累计应收',
  `AllNeedPay` decimal(24,6) DEFAULT NULL COMMENT '累计应付',
  `fax` varchar(30) DEFAULT NULL COMMENT '传真',
  `telephone` varchar(30) DEFAULT NULL COMMENT '手机',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `taxNum` varchar(50) DEFAULT NULL COMMENT '纳税人识别号',
  `bankName` varchar(50) DEFAULT NULL COMMENT '开户行',
  `accountNumber` varchar(50) DEFAULT NULL COMMENT '账号',
  `taxRate` decimal(24,6) DEFAULT NULL COMMENT '税率',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='供应商/客户信息表';

-- ----------------------------
-- Records of jsh_supplier
-- ----------------------------
INSERT INTO `jsh_supplier` VALUES ('1', '上海某某花边工厂', '乔治', '', '', '', '1', '供应商', '', '0.000000', null, '20.000000', null, null, '', '', '', '', '', '', '10.000000', null, '0');
INSERT INTO `jsh_supplier` VALUES ('2', '客户AAAA', '佩琪', '', '', '', '1', '客户', '', '24.000000', '10.000000', null, null, null, '', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('4', '苏州新源布料厂', '龙哥', '13000000000', '312341@qq.com', '55', '1', '供应商', '', '0.000000', null, '44.000000', null, null, '', '', '', '', '', '', '17.000000', null, '0');
INSERT INTO `jsh_supplier` VALUES ('5', '客户BBBB', '彪哥', '13000000000', '666@qq.com', '', '1', '客户', '', '36.000000', '20.000000', null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('6', '南通宝贝家纺', '姗姗', '1231', '31243@qq.com', '备注备注备注', '1', '客户', '', '0.000000', '5.000000', null, null, null, '2134', '15678903', '地址地址地址', '纳税人识别号', '开户行', '31234124312', '0.170000', null, '0');
INSERT INTO `jsh_supplier` VALUES ('7', '非会员', '宋江', '13000000000', '123456@qq.com', '', '1', '会员', '', '76.600000', null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('8', 'hy00001', '宋江', '13000000000', '', '', '1', '会员', '', '954.800000', null, null, null, null, '', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('9', 'hy00002', '吴用', '13000000000', '', '', '1', '会员', '', '344.000000', null, null, null, null, '', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('10', '1268787965', '李逵', '82567384', '423@qq.com', '', '1', '会员', '', '2122.000000', null, null, null, null, '', '13000000001', '', '', '', '', null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('45', '666666666', '武松', '82567384', '423@qq.com', '', '1', '会员', '', '2100.000000', '0.000000', '0.000000', '0.000000', '0.000000', '', '13000000001', '', '', '', '', '0.000000', null, '0');
INSERT INTO `jsh_supplier` VALUES ('46', '南通居梦莱家纺', '曹操', '', '', '', '1', '供应商', '', '0.000000', null, null, '0.000000', '0.000000', '', '13000000000', '', '', '', '', null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('47', '供应商1', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '1', '0');
INSERT INTO `jsh_supplier` VALUES ('48', '客户1', '', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '1', '0');
INSERT INTO `jsh_supplier` VALUES ('49', 'ddddd123', '', '', '', '', null, '会员', '', '6.000000', null, null, null, null, '', '', '', '', '', '', null, '1', '0');
INSERT INTO `jsh_supplier` VALUES ('50', '供应商2', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '1', '0');
INSERT INTO `jsh_supplier` VALUES ('51', '供应商1', '小周', '', '', '', null, '供应商', '', '0.000000', null, '2000.000000', null, null, '', '', '', '', '', '', null, '117', '0');
INSERT INTO `jsh_supplier` VALUES ('52', '客户123', '', '', '', '', null, '客户', '', '0.000000', '1000.000000', null, null, null, '', '', '', '', '', '', null, '117', '0');
INSERT INTO `jsh_supplier` VALUES ('53', '会员123123', '', '', '', '', null, '会员', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '117', '0');
INSERT INTO `jsh_supplier` VALUES ('54', '供应商2222', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '117', '0');
INSERT INTO `jsh_supplier` VALUES ('55', '供应商1', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '115', '0');
INSERT INTO `jsh_supplier` VALUES ('56', '客户666', '', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '115', '0');
INSERT INTO `jsh_supplier` VALUES ('57', '供应商1', '', '', '', '', null, '供应商', '', '0.000000', '0.000000', '0.000000', null, '0.000000', '', '', '', '', '', '', '12.000000', '63', '0');
INSERT INTO `jsh_supplier` VALUES ('58', '客户1', '', '', '', '', null, '客户', '', '0.000000', '200.000000', '0.000000', '-100.000000', null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('59', '客户2', '', '', '', '', null, '客户', '', '0.000000', '0.000000', '0.000000', '0.000000', null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('60', '12312666', '', '', '', '', null, '会员', '', '994.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('61', '', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', '12312312.000000', '63', '1');
INSERT INTO `jsh_supplier` VALUES ('62', '供if', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('63', '', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('64', 'wrwer', '', '', '', '', null, '供应商', '', '0.000000', '0.000000', '0.000000', null, '0.000000', '', '', '', '', '', '', '233.000000', '63', '1');
INSERT INTO `jsh_supplier` VALUES ('65', '123123', '', '', '', '', null, '供应商', '', '0.000000', '0.000000', '0.000000', null, '0.000000', '', '', '', '', '', '', '44.000000', '63', '1');
INSERT INTO `jsh_supplier` VALUES ('66', 'rrtt', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('67', '供应商2', '', '', '', '', null, '供应商', '', '0.000000', '0.000000', '0.000000', null, '0.000000', '', '', '', '', '', '', '7.000000', '63', '1');
INSERT INTO `jsh_supplier` VALUES ('68', '供应商3', '', '', '', '', null, '供应商', '', '0.000000', '15.000000', '0.000000', null, '-15.000000', '', '13000000000', '', '', '', '', '22.000000', '63', '0');
INSERT INTO `jsh_supplier` VALUES ('69', '', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', '3123.000000', '63', '1');
INSERT INTO `jsh_supplier` VALUES ('70', 'rrrrr', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('71', '客户3', '', '', '', '', null, '客户', '', '0.000000', '0.000000', '0.000000', '0.000000', null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('72', 'sdfafadsf', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('73', 'sadvczXCvz', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '1');

-- ----------------------------
-- Table structure for jsh_systemconfig
-- ----------------------------
DROP TABLE IF EXISTS `jsh_systemconfig`;
CREATE TABLE `jsh_systemconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `company_contacts` varchar(20) DEFAULT NULL COMMENT '公司联系人',
  `company_address` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `company_tel` varchar(20) DEFAULT NULL COMMENT '公司电话',
  `company_fax` varchar(20) DEFAULT NULL COMMENT '公司传真',
  `company_post_code` varchar(20) DEFAULT NULL COMMENT '公司邮编',
  `depot_flag` varchar(1) DEFAULT '0' COMMENT '仓库启用标记，0未启用，1启用',
  `customer_flag` varchar(1) DEFAULT '0' COMMENT '客户启用标记，0未启用，1启用',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统参数';

-- ----------------------------
-- Records of jsh_systemconfig
-- ----------------------------
INSERT INTO `jsh_systemconfig` VALUES ('7', '南通jshERP公司', 'Trương三', '南通市通州区某某路', '0513-10101010', '0513-18181818', '226300', '0', '0', null, '0');
INSERT INTO `jsh_systemconfig` VALUES ('8', '公司123', '', '', '', '', '', '0', '0', '117', '0');
INSERT INTO `jsh_systemconfig` VALUES ('9', '公司1', '小军', '', '', '', '', '0', '0', '63', '0');

-- ----------------------------
-- Table structure for jsh_tenant
-- ----------------------------
DROP TABLE IF EXISTS `jsh_tenant`;
CREATE TABLE `jsh_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登录名',
  `user_num_limit` int(11) DEFAULT NULL COMMENT '用户Số lượng限制',
  `bills_num_limit` int(11) DEFAULT NULL COMMENT '单据Số lượng限制',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='租户';

-- ----------------------------
-- Records of jsh_tenant
-- ----------------------------
INSERT INTO `jsh_tenant` VALUES ('13', '63', 'jsh', '20', '2000', null);
INSERT INTO `jsh_tenant` VALUES ('14', '113', 'abc123', '2', '200', null);
INSERT INTO `jsh_tenant` VALUES ('15', '115', 'jzh', '2', '200', null);
INSERT INTO `jsh_tenant` VALUES ('16', '123', 'caoyuli', '2', '200', null);
INSERT INTO `jsh_tenant` VALUES ('17', '124', 'jchb', '2', '200', null);
INSERT INTO `jsh_tenant` VALUES ('18', '126', '123123', '2', '200', null);
INSERT INTO `jsh_tenant` VALUES ('19', '127', '2345123', '2', '200', null);
INSERT INTO `jsh_tenant` VALUES ('20', '128', 'q12341243', '2', '200', null);
INSERT INTO `jsh_tenant` VALUES ('21', '130', 'jsh666', '2', '200', null);

-- ----------------------------
-- Table structure for jsh_unit
-- ----------------------------
DROP TABLE IF EXISTS `jsh_unit`;
CREATE TABLE `jsh_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `UName` varchar(50) DEFAULT NULL COMMENT '名称，支持多单位',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='多单位表';

-- ----------------------------
-- Records of jsh_unit
-- ----------------------------
INSERT INTO `jsh_unit` VALUES ('2', 'kg,Gói(1:25)', null, '0');
INSERT INTO `jsh_unit` VALUES ('8', 'Chai,Hộp(1:12)', null, '0');
INSERT INTO `jsh_unit` VALUES ('11', 'qwe,sed(1:33)', null, '0');
INSERT INTO `jsh_unit` VALUES ('12', '1,2(1:33)', null, '0');
INSERT INTO `jsh_unit` VALUES ('13', 'aa,vv(1:22)', '1', '0');
INSERT INTO `jsh_unit` VALUES ('14', 'Mỗi,Hộp(1:12)', '117', '0');
INSERT INTO `jsh_unit` VALUES ('15', 'Mỗi,Hộp(1:12)', '63', '0');

-- ----------------------------
-- Table structure for jsh_user
-- ----------------------------
DROP TABLE IF EXISTS `jsh_user`;
CREATE TABLE `jsh_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `username` varchar(255) NOT NULL COMMENT '用户姓名--例如Trương三',
  `loginame` varchar(255) DEFAULT NULL COMMENT '登录用户名--可能为空',
  `password` varchar(50) DEFAULT NULL COMMENT '登陆密Sân',
  `position` varchar(200) DEFAULT NULL COMMENT '职位',
  `department` varchar(255) DEFAULT NULL COMMENT '所属部门',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮Hộp',
  `phonenum` varchar(100) DEFAULT NULL COMMENT '手机号Sân',
  `ismanager` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否为管理者 0==管理者 1==员工',
  `isystem` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否系统自带数据 ',
  `Status` tinyint(4) DEFAULT '0' COMMENT '状态，0：正常，1：删除，2封禁',
  `description` varchar(500) DEFAULT NULL COMMENT '用户描述信息',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of jsh_user
-- ----------------------------
INSERT INTO `jsh_user` VALUES ('63', '季圣华', 'jsh', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '1', '0', '', null, '63');
INSERT INTO `jsh_user` VALUES ('64', 'Trương三', 'zs', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('65', '李四', 'ls', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('67', 'fas666', 'asd555', null, 'asdf333', null, '11111@qq.com', '222222', '1', '0', '0', 'sdf0000', null, null);
INSERT INTO `jsh_user` VALUES ('74', '21312sfdfsdf', '1231234', null, '', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('84', '123123', 'jsh123', null, '3123', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('86', '2333', 'sdf111aaa', null, '3232', null, '', '32323', '1', '0', '0', '33232', null, null);
INSERT INTO `jsh_user` VALUES ('87', '122123132', 'sdfasd1', null, '', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('90', '232343', '233', null, '', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('91', 'jsh1231', 'jsh1231', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('92', '213123', 'aaaa', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '1', '', null, null);
INSERT INTO `jsh_user` VALUES ('93', '111', 'ffff', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '1', '', null, null);
INSERT INTO `jsh_user` VALUES ('94', 'sdfsdf', 'fsdfsdsd', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '1', '', null, null);
INSERT INTO `jsh_user` VALUES ('95', '4444444', '4444', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('96', 'lili', 'lili', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '0', '', null, '1');
INSERT INTO `jsh_user` VALUES ('113', 'yuyu123', 'yuyu123', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, '113');
INSERT INTO `jsh_user` VALUES ('115', 'laoba123', 'laoba123', 'e10adc3949ba59abbe56e057f20f883e', '33333', null, '', '', '1', '0', '0', '', null, '115');
INSERT INTO `jsh_user` VALUES ('116', 'gggg123', 'gggg123', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '1', '', null, '115');
INSERT INTO `jsh_user` VALUES ('120', '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, null);
INSERT INTO `jsh_user` VALUES ('121', 'hhhh', 'hhhh', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '0', '', null, '115');
INSERT INTO `jsh_user` VALUES ('122', 'admin1', 'admin1', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '1', '', null, '63');
INSERT INTO `jsh_user` VALUES ('123', 'caoyuli', 'caoyuli', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, '123');
INSERT INTO `jsh_user` VALUES ('124', 'jchb', 'jchb', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, '124');
INSERT INTO `jsh_user` VALUES ('126', '123123', '123123', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, '126');
INSERT INTO `jsh_user` VALUES ('127', '2345123', '2345123', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, '127');
INSERT INTO `jsh_user` VALUES ('128', 'q12341243', 'q12341243', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, '128');
INSERT INTO `jsh_user` VALUES ('130', 'jsh666', 'jsh666', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, '130');
INSERT INTO `jsh_user` VALUES ('131', '测试用户', 'test123', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '0', '', null, '63');

-- ----------------------------
-- Table structure for jsh_userbusiness
-- ----------------------------
DROP TABLE IF EXISTS `jsh_userbusiness`;
CREATE TABLE `jsh_userbusiness` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `Type` varchar(50) DEFAULT NULL COMMENT '类别',
  `KeyId` varchar(50) DEFAULT NULL COMMENT '主ID',
  `Value` varchar(10000) DEFAULT NULL COMMENT '值',
  `BtnStr` varchar(2000) DEFAULT NULL COMMENT '按钮权限',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='用户/角色/模块关系表';

-- ----------------------------
-- Records of jsh_userbusiness
-- ----------------------------
INSERT INTO `jsh_userbusiness` VALUES ('5', 'RoleFunctions', '4', '[245][13][12][16][243][14][15][234][236][22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][244][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212][246]', '[{\"funId\":\"25\",\"btnStr\":\"1\"},{\"funId\":\"217\",\"btnStr\":\"1\"},{\"funId\":\"218\",\"btnStr\":\"1\"},{\"funId\":\"241\",\"btnStr\":\"3\"},{\"funId\":\"242\",\"btnStr\":\"3\"}]', '0');
INSERT INTO `jsh_userbusiness` VALUES ('6', 'RoleFunctions', '5', '[22][23][25][26][194][195][31][33][200][201][41][199][202]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('7', 'RoleFunctions', '6', '[22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212]', '[{\"funId\":\"33\",\"btnStr\":\"4\"}]', '0');
INSERT INTO `jsh_userbusiness` VALUES ('9', 'RoleFunctions', '7', '[168][13][12][16][14][15][189][18][19][132]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('10', 'RoleFunctions', '8', '[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('11', 'RoleFunctions', '9', '[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187][188]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('12', 'UserRole', '1', '[5]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('13', 'UserRole', '2', '[6][7]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('14', 'UserDepot', '2', '[1][2][6][7]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('15', 'UserDepot', '1', '[1][2][5][6][7][10][12][14][15][17]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('16', 'UserRole', '63', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('18', 'UserDepot', '63', '[14][15]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('19', 'UserDepot', '5', '[6][45][46][50]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('20', 'UserRole', '5', '[5]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('21', 'UserRole', '64', '[13]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('22', 'UserDepot', '64', '[1]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('23', 'UserRole', '65', '[5]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('24', 'UserDepot', '65', '[1]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('25', 'UserCustomer', '64', '[5][2]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('26', 'UserCustomer', '65', '[6]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('27', 'UserCustomer', '63', '[58]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('28', 'UserDepot', '96', '[7]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('29', 'UserRole', '96', '[6]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('30', 'UserRole', '113', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('32', 'RoleFunctions', '10', '[245][13][243][14][15][234][22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][244][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212][246]', '[{\"funId\":\"25\",\"btnStr\":\"1\"},{\"funId\":\"217\",\"btnStr\":\"1\"},{\"funId\":\"218\",\"btnStr\":\"1\"},{\"funId\":\"241\",\"btnStr\":\"3\"},{\"funId\":\"242\",\"btnStr\":\"3\"}]', '0');
INSERT INTO `jsh_userbusiness` VALUES ('34', 'UserRole', '115', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('35', 'UserRole', '117', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('36', 'UserDepot', '117', '[8][9]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('37', 'UserCustomer', '117', '[52]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('38', 'UserRole', '120', '[4]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('39', 'UserDepot', '120', '[7][8][9][10][11][12][2][1][3]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('40', 'UserCustomer', '120', '[52][48][6][5][2]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('41', 'RoleFunctions', '12', '', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('48', 'RoleFunctions', '13', '[59][207][208][209][226][227][228][229][235][237][210][211][241][33][199][242][41][200]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('51', 'UserRole', '74', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('52', 'UserDepot', '121', '[13]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('54', 'UserDepot', '115', '[13]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('56', 'UserCustomer', '115', '[56]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('57', 'UserCustomer', '121', '[56]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('58', 'UserRole', '121', '[15]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('59', 'UserRole', '123', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('60', 'UserRole', '124', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('61', 'UserRole', '125', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('62', 'UserRole', '126', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('63', 'UserRole', '127', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('64', 'UserRole', '128', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('65', 'UserRole', '129', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('66', 'UserRole', '130', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('67', 'UserRole', '131', '[16]', null, '0');
