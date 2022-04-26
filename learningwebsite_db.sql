/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : learningwebsite_db

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2021-03-16 21:50:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `content` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('7', '智慧企业的特征', '2021-03-16 20:18:09', '', '1智慧企业会颠覆传统企业吗？恰恰相反，传统企业拥有着大量的资产积累，如企业的品牌效应、客户、供应商等，尤其是企业在发展过程产生的大量数据，这正是企业数字化转型的基础和动力。<br />\r\n<br />\r\n<br />\r\n<br />\r\n不管是传统企业还是新型企业，其信息化高度发展到一定阶段，即有可能成为智慧企业。智慧企业就是传统企业拥抱互联网，融入国家“互联网+”战略、落实创新发展理念和双创要求的最佳实践。<br />\r\n<br />\r\n<br />\r\n<br />\r\n机器人、沉浸式现实、人工智能及互联设备，这些技术高度发展到一定程度，智慧企业也将会层出不穷，这些企业涉及的业务领域虽然有所不同，但在管理形态、企业模式上却会呈现出一定的共性特征。<br />\r\n<br />\r\n<br />\r\n<br />\r\n第一个是企业平台化。在数字化时代，扁平化会成为企业发展的主流，企业组织越来越扁平化，管理越来越人性化，员工越来越社会化、移动化。<br />\r\n<br />\r\n<br />\r\n<br />\r\n第二个是服务共享化，包括财务管理、法务管理等在内，以共享的方式为集团主体或者业务主体进行服务。<br />\r\n<br />\r\n<br />\r\n<br />\r\n第三个是业务数字化，围绕产业层面，无论是供应链环节、制造环节、销售环节或消费环节，都要进行数字化管理。<br />\r\n<br />\r\n<br />\r\n<br />\r\n第四个是管理智能化，包括企业的智能决策、流程优化、智能运维等。<br />');
INSERT INTO `activity` VALUES ('8', '双层ERP', '2021-03-16 20:21:47', '', '<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	大型ERP系统的功能强大、成本昂贵、集成性强，能实现人、财、物的集约化管理，能够满足企业集团层面的管理要求。\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	然而，对于企业的子公司，甚至生态伙伴等规模较小的企业来说，部署一套大型ERP系统，从经济和实用方面都是不现实的。大型企业集团与其子公司信息化系统需求不同，对数据的管控、业务的流转存在很大的差异，但又要深度地集成。\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	为此，双层ERP战略解决了这一难题，集团层面实现集中管控和数据共享，产业层面针对子公司及其生态伙伴独特的业务提供<a href=\"http://www.teamsfy.com/html/r_G0021.html\" target=\"_self\"><strong>个性化软件定制服务</strong></a>，在技术上通过标准服务接口的快速开发实现系统的集成，实现了管理上的灵活性，集团和产业单位不再沦为管理的孤岛。\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	<strong>双层ERP</strong>是大型集团企业采用的一种技术策略。上层ERP用于整个集团层面，统一管控企业级财务、资金和绩效管理等核心通用业务流程；对于子公司和生态伙伴，因公司规模不同和业务需求的多样性，故采用单独的下层ERP来实现其个性化业务流程。\r\n</p>\r\n<p class=\"on\" style=\"text-indent:28px;text-align:center;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.teamsfy.com/system/UserData/000/ed1473b6c1fc4258b5cc24b7c0e4d073.png\" title=\"双层ERP\" alt=\"双层ERP\" />\r\n</p>');
INSERT INTO `activity` VALUES ('9', '双模IT', '2021-03-16 20:22:32', '', '<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	随着信息化的不断发展，企业的业务模式正在逐渐发生变化，企业的IT架构面临着新的挑战。一方面，许多传统的企业仍然需要传统的IT模式，以维持其关键业务的安全可靠性和稳定性；另一方面，随着企业数字化程度的加强，越来越多的业务面向互联网，这要求企业的IT模式具有较高的敏捷性。如何在满足稳定性的同时，更加敏捷地应对不断变化的业务需求，成为企业IT部门必须思考的问题。为了满足这两种业务模式的需求，保证企业业务的正常发展，同时帮助企业成功进行数字化转型，Gartner在2014年提出了双模IT的理念。\r\n</p>\r\n<p class=\"on\" style=\"text-indent:28px;text-align:center;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.teamsfy.com/system/UserData/000/bc349ca4d11f4501a9af5eca29a0cd76.png\" title=\"双模IT是什么\" alt=\"双模IT是什么\" />\r\n</p>\r\n<p class=\"box\" style=\"background:#F3FCFF;text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;\">\r\n	<strong>双模IT具体包括以下两种模式：</strong><br />\r\n&nbsp; &nbsp;一是<strong>传统IT模式</strong>，强调稳定性，也可称之为稳态IT，以满足企业业务稳态发展的需求；<br />\r\n&nbsp; &nbsp;二是<strong>敏态IT模式</strong>，强调敏捷性，以达到企业业务快速响应市场需求、敏捷开发的要求。\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	传统IT模式比较传统、线性，侧重于安全可靠和稳定；相比之下，敏态IT模式更具备探索性，是非线性的，强调敏捷和快速响应。企业能否赢得数字化的成功转型，关键在于敏态IT模式。\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	<strong>传统可规划的IT模式无法满足企业业务模式发展的需求。</strong>\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	因此，企业的IT部门不应只遵循传统的IT模式，除关注传统的架构、应用外，还应考虑新的收入流、新的产品、服务以及新的商业模式，例如营销的数字化、生产流程的数字化等，这有利于帮助企业赢得数字化转型。\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;\">\r\n	举例来说，一个原本只进行线下销售的传统企业，在数字化转型的驱动下采用双模IT，在保持原有线下销售业务的同时，积极开展面向互联网的业务，利用网站、微信等第三方平台进行线上销售，这不但帮助企业开拓了更多的线上客户，同时也给客户提供了更加个性化和便捷化的服务。不仅如此，在大数据、云计算、物联网等技术的支持下，产品的生产流程更加柔性化，支持客户个性化定制。\r\n</p>');
INSERT INTO `activity` VALUES ('10', '企业大数据服务平台的应用', '2021-03-16 20:23:05', '', '<p style=\"text-indent:2em;\">\r\n	随着企业信息化的建设，企业逐步应用了计划管理、财务会计、全面预算、合同管理、资产管理、供应链管理、生产管理、制造执行管理、质量管理等多种业务应用系统，满足了多种业务层面的互通，保证了业务层面的有效信息传递。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	而对于企业的决策层、管理层以及部分业务人员来讲他们不能有效地通过这么多业务系统获取想要的综合信息特别是一些涉及业务的关键指标。大数据服务平台可以有效地解决这三个层次面临的困惑，提供多层级的应用。面向决策层，提供战略决策、企业价值评价、投资决策、预警与风险管理等；面向管理层，提供预测分析、最优生产、动态成本测算等；面向操作层，提供一线人员即时查询分析、报警提示等。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<strong>大数据服务平台</strong>围绕“数据”和“应用”，以人工智能、<a href=\"http://www.teamsfy.com/html/list.aspx?id=G0002_10\" target=\"_self\">大数据</a>、<a href=\"http://www.teamsfy.com/html/list.aspx?id=G0002_08\" target=\"_self\">云计算</a>和物联网为支撑，通过数据整合，构建企业大数据中心，为企业提供高层辅助决策、内部效率提升、风险防控等智慧应用。\r\n</p>\r\n<p class=\"on\" style=\"text-indent:2em;text-align:center;\">\r\n	<img src=\"http://www.teamsfy.com/system/UserData/000/0a61f5e178c34531a75dd84bf343407d.png\" title=\"大数据服务平台\" alt=\"大数据服务平台\" />\r\n</p>\r\n<h2 style=\"background:#F7F7F7;font-size:18px;color:#31BDF3;text-indent:1em;\">\r\n	大数据服务平台可以提供丰富的大数据分析工具\r\n</h2>\r\n<p style=\"text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	①自助分析从传统BI转向敏捷BI，屏蔽技术细节，只要简单拖拽，即可制作出丰富的图表。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	②大屏设计器提供丰富的展示模板，业务人员通过简单配置，即可设计出精美的大屏展示。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	③报表中心提供灵活的报表组件，为企业提供数据采集及各类业务报表应用。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	④AI人工智能，以算法和模型为支撑，实现工具智能化转型。\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<br />\r\n</p>');
INSERT INTO `activity` VALUES ('11', '智能供应链管理11', '2021-03-16 20:23:43', '1611130783110.jpg', '<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, \" font-size:14px;background-color:#ffffff;\"=\"\">11\r\n	企业通过采购管理、销售管理、库存管理等系统，可帮助企业实现线下<strong>供应链</strong>的全面管理，帮助企业建立高效的内部运营体系。借助互联网、物联网等先进技术，通过框架协议、供应商协同、寻源采购、WMS、客户协同、网上订单等构建企业线上业务。通过线上、线下业务的协同应用，实现企业从消费到供应，从线上到线下的全面管理，帮助企业实现精准营销。\r\n	</p>\r\n<p class=\"on\" style=\"text-indent:28px;text-align:center;color:#333333;font-family:微软雅黑, \" font-size:14px;background-color:#ffffff;\"=\"\"> <img src=\"http://www.teamsfy.com/system/UserData/000/c81a2fbe53c04ec7b7d50b8fdfd33f67.png\" title=\"企业智能供应链管理软件系统\" alt=\"企业智能供应链管理软件系统\" /> \r\n</p>\r\n<h2 style=\"background:#F7F7F7;font-size:18px;color:#31BDF3;text-indent:1em;font-family:微软雅黑,;\">\r\n	1.多种集团采购模式应用，构建高效率低成本供应体系\r\n</h2>\r\n<span style=\"color:#333333;font-family:微软雅黑, \" font-size:14px;background-color:#ffffff;\"=\"\"></span> <p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, \" font-size:14px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, \" font-size:14px;background-color:#ffffff;\"=\"\">\r\n	基于集团公司采购的业务处理，<strong>智能供应链管理</strong>支持多工厂、多采购组织，可以实现整个集团集中采购，并能兼顾实现单一企业采购。支持集中采购、集中结算的供应公司模式和集中采购、分散结算的采购组织模式，支持虚拟采购组织模式，支持跨公司的采购业务。通过对集团集中采购的管理，统一设定采购的标准和体系，控制采购限价，确保采购质量，实现对供应商的统一管理，发挥集团采购优势。\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, \" font-size:14px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n	<h2 style=\"background:#F7F7F7;font-size:18px;color:#31BDF3;text-indent:1em;font-family:微软雅黑,;\">\r\n		2.结合物联网技术，构建企业产品质量快捷追溯体系\r\n	</h2>\r\n<span style=\"color:#333333;font-family:微软雅黑, \" font-size:14px;background-color:#ffffff;\"=\"\"></span> <p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, \" font-size:14px;background-color:#ffffff;\"=\"\"><br />\r\n</p>\r\n<p style=\"text-indent:28px;color:#333333;font-family:微软雅黑, \" font-size:14px;background-color:#ffffff;\"=\"\">\r\n	产品质量追溯体系能够帮助企业树立品牌形象，提升社会效应和经济效益。全程化的追踪管理，既加强了企业质量管理，减少纠错成本，又方便企业收集商品情报，了解消费趋势，提高自身的快速响应能力。在流程制造领域，尤其在食品、药品生产，以及一些化工产品制造领域，建立产品质量追溯体系已成为企业赖以生存的重要管理手段之一。智能供应链管理可结合RFID等现代物联网技术，实现从产品反向追溯其生产加工过程、原材料组成、原材料供应商情况等信息，也可从原材料正向跟踪和其相关的产品信息。\r\n	</p>');

-- ----------------------------
-- Table structure for `answers`
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL auto_increment,
  `questionid` varchar(255) default '',
  `option_` varchar(255) default NULL,
  `content` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answers
-- ----------------------------
INSERT INTO `answers` VALUES ('49', '3d6b2ee075724fe19c129193de033eed', 'A', 'char c[]=\'goodmorning\'；');
INSERT INTO `answers` VALUES ('50', '3d6b2ee075724fe19c129193de033eed', 'B', 'char e[20]=\"goodmorning\"：');
INSERT INTO `answers` VALUES ('51', '3d6b2ee075724fe19c129193de033eed', 'C', 'char c[]=(\'a\'，\'b\'，\'c\'，\'d\')；');
INSERT INTO `answers` VALUES ('52', '3d6b2ee075724fe19c129193de033eed', 'D', 'char c[]={”ffgoodmorning”)；');
INSERT INTO `answers` VALUES ('53', '1743c87c66a84bb7870c43f460e0a623', 'A', 'i*m+j-1');
INSERT INTO `answers` VALUES ('54', '1743c87c66a84bb7870c43f460e0a623', 'B', 'i*m+j');
INSERT INTO `answers` VALUES ('55', '1743c87c66a84bb7870c43f460e0a623', 'C', 'j*m+i');
INSERT INTO `answers` VALUES ('56', '1743c87c66a84bb7870c43f460e0a623', 'D', 'i*m+j+1');
INSERT INTO `answers` VALUES ('57', '407fa4b6903a4b079f8ffd444c645f5d', 'A', '耦合性');
INSERT INTO `answers` VALUES ('58', '407fa4b6903a4b079f8ffd444c645f5d', 'B', '内聚性');
INSERT INTO `answers` VALUES ('59', '407fa4b6903a4b079f8ffd444c645f5d', 'C', '复杂性');
INSERT INTO `answers` VALUES ('60', '407fa4b6903a4b079f8ffd444c645f5d', 'D', '数据传输特性');
INSERT INTO `answers` VALUES ('61', 'b5049e0d96be4932bf39cf5d712eedd3', 'A', 'ab');
INSERT INTO `answers` VALUES ('62', 'b5049e0d96be4932bf39cf5d712eedd3', 'B', 'file');
INSERT INTO `answers` VALUES ('63', 'b5049e0d96be4932bf39cf5d712eedd3', 'C', 'Main');
INSERT INTO `answers` VALUES ('64', 'b5049e0d96be4932bf39cf5d712eedd3', 'D', 'PRINTF');
INSERT INTO `answers` VALUES ('65', '0adb5329620a4a38b698a871c8b5e9bb', 'A', '控制耦合');
INSERT INTO `answers` VALUES ('66', '0adb5329620a4a38b698a871c8b5e9bb', 'B', '公共耦合');
INSERT INTO `answers` VALUES ('67', '0adb5329620a4a38b698a871c8b5e9bb', 'C', '内容耦合');
INSERT INTO `answers` VALUES ('68', '0adb5329620a4a38b698a871c8b5e9bb', 'D', '数据耦合');
INSERT INTO `answers` VALUES ('69', 'f6929635a1f9427f8604c4d2a2270db4', 'A', '反码');
INSERT INTO `answers` VALUES ('70', 'f6929635a1f9427f8604c4d2a2270db4', 'B', '补码');
INSERT INTO `answers` VALUES ('71', 'f6929635a1f9427f8604c4d2a2270db4', 'C', 'EBCDIC码');
INSERT INTO `answers` VALUES ('72', 'f6929635a1f9427f8604c4d2a2270db4', 'D', 'ASCIl码');
INSERT INTO `answers` VALUES ('73', '003489dc956b4d638123e5128c5699c8', 'A', '队列');
INSERT INTO `answers` VALUES ('74', '003489dc956b4d638123e5128c5699c8', 'B', '栈');
INSERT INTO `answers` VALUES ('75', '003489dc956b4d638123e5128c5699c8', 'C', '双向链表');
INSERT INTO `answers` VALUES ('76', '003489dc956b4d638123e5128c5699c8', 'D', '二叉树');
INSERT INTO `answers` VALUES ('77', '907449b04a624c999635086978625de4', 'A', '随机值');
INSERT INTO `answers` VALUES ('78', '907449b04a624c999635086978625de4', 'B', '0');
INSERT INTO `answers` VALUES ('79', '907449b04a624c999635086978625de4', 'C', 'x的地址');
INSERT INTO `answers` VALUES ('80', '907449b04a624c999635086978625de4', 'D', 'P的地址');
INSERT INTO `answers` VALUES ('81', '3cdbb447bb3a42c7b457f69c8a6da76a', 'A', '*(*(a+i)+j)');
INSERT INTO `answers` VALUES ('82', '3cdbb447bb3a42c7b457f69c8a6da76a', 'B', '(a+i)[j]');
INSERT INTO `answers` VALUES ('83', '3cdbb447bb3a42c7b457f69c8a6da76a', 'C', '*(a+j+j)');
INSERT INTO `answers` VALUES ('84', '3cdbb447bb3a42c7b457f69c8a6da76a', 'D', '*(a+i)+j');
INSERT INTO `answers` VALUES ('85', 'f4c2fc434ffc4d58b27cade0b140460e', 'A', 'c=(c-\'A\')％26+\'A\'');
INSERT INTO `answers` VALUES ('86', 'f4c2fc434ffc4d58b27cade0b140460e', 'B', 'C=c+32');
INSERT INTO `answers` VALUES ('87', 'f4c2fc434ffc4d58b27cade0b140460e', 'C', 'c=c-\'A\'+\'A\'');
INSERT INTO `answers` VALUES ('88', 'f4c2fc434ffc4d58b27cade0b140460e', 'D', 'c=(\'A\'+C)％26—\'a\'');
INSERT INTO `answers` VALUES ('89', '259214492915456d803285f285a702f5', 'A', '％');
INSERT INTO `answers` VALUES ('90', '259214492915456d803285f285a702f5', 'B', '／');
INSERT INTO `answers` VALUES ('91', '259214492915456d803285f285a702f5', 'C', '!');
INSERT INTO `answers` VALUES ('92', '259214492915456d803285f285a702f5', 'D', '**');
INSERT INTO `answers` VALUES ('93', 'bc0fb31d90e24dd087b02b8cf2c8afc2', 'A', '在实数的浮点表示中，阶码是一个整数');
INSERT INTO `answers` VALUES ('94', 'bc0fb31d90e24dd087b02b8cf2c8afc2', 'B', '整数是实数的特例，也可以用浮点数表示');
INSERT INTO `answers` VALUES ('95', 'bc0fb31d90e24dd087b02b8cf2c8afc2', 'C', '实数的补码是其对应的反码在后一位加1');
INSERT INTO `answers` VALUES ('96', 'bc0fb31d90e24dd087b02b8cf2c8afc2', 'D', '相同长度的浮点数和定点数，前者可表示数的范围要大于后者');
INSERT INTO `answers` VALUES ('97', '75ede4a3c3234fb5832f3554a7c7e979', 'A', '函数定义时在函数首部所说明的函数类型');
INSERT INTO `answers` VALUES ('98', '75ede4a3c3234fb5832f3554a7c7e979', 'B', 'return语句中表达式值的类型');
INSERT INTO `answers` VALUES ('99', '75ede4a3c3234fb5832f3554a7c7e979', 'C', '调用函数时主调函数所传递的实参类型');
INSERT INTO `answers` VALUES ('100', '75ede4a3c3234fb5832f3554a7c7e979', 'D', '函数定义时形参的类型');
INSERT INTO `answers` VALUES ('101', 'c9553e579d4c4ec1a0d4b5add222580e', 'A', 'JAVA2 EE');
INSERT INTO `answers` VALUES ('102', 'c9553e579d4c4ec1a0d4b5add222580e', 'B', 'JAVA2 Card');
INSERT INTO `answers` VALUES ('103', 'c9553e579d4c4ec1a0d4b5add222580e', 'C', 'JAVA2 ME');
INSERT INTO `answers` VALUES ('104', 'c9553e579d4c4ec1a0d4b5add222580e', 'D', 'JAVA2 HE');
INSERT INTO `answers` VALUES ('105', 'f53524a673c14e8f9605ae5dfed4a4cb', 'A', 'JAVA程序的main方法必须写在类里面');
INSERT INTO `answers` VALUES ('106', 'f53524a673c14e8f9605ae5dfed4a4cb', 'B', 'JAVA程序中可以有多个main方法');
INSERT INTO `answers` VALUES ('107', 'f53524a673c14e8f9605ae5dfed4a4cb', 'C', 'JAVA程序中类名必须与文件名一样');
INSERT INTO `answers` VALUES ('108', 'f53524a673c14e8f9605ae5dfed4a4cb', 'D', 'JAVA程序的main方法中如果只有一条语句，可以不用{}(大括号)括起来');
INSERT INTO `answers` VALUES ('109', '42fcf661132c4461910523e8d1aa3e4d', 'A', '0');
INSERT INTO `answers` VALUES ('110', '42fcf661132c4461910523e8d1aa3e4d', 'B', '1');
INSERT INTO `answers` VALUES ('111', '42fcf661132c4461910523e8d1aa3e4d', 'C', '2');
INSERT INTO `answers` VALUES ('112', '42fcf661132c4461910523e8d1aa3e4d', 'D', '3');
INSERT INTO `answers` VALUES ('113', '0aad14823a0342ab915124b838ef1c00', 'A', '变量由字母、下划线、数字、$符号随意组成；');
INSERT INTO `answers` VALUES ('114', '0aad14823a0342ab915124b838ef1c00', 'B', '变量不能以数字作为开头；');
INSERT INTO `answers` VALUES ('115', '0aad14823a0342ab915124b838ef1c00', 'C', 'A和a在java中是同一个变量；');
INSERT INTO `answers` VALUES ('116', '0aad14823a0342ab915124b838ef1c00', 'D', '不同类型的变量，可以起相同的名字；');
INSERT INTO `answers` VALUES ('117', '7582b8bbee97455d8fd601e7102936ff', 'A', '/*我爱北京天安门*/');
INSERT INTO `answers` VALUES ('118', '7582b8bbee97455d8fd601e7102936ff', 'B', '//我爱北京天安门*/');
INSERT INTO `answers` VALUES ('119', '7582b8bbee97455d8fd601e7102936ff', 'C', '/**我爱北京天安门*/');
INSERT INTO `answers` VALUES ('120', '7582b8bbee97455d8fd601e7102936ff', 'D', '/*我爱北京天安门**/');
INSERT INTO `answers` VALUES ('121', 'b8f76c50fae5440580878ff0a843b3b1', 'A', 'boolean = 1;');
INSERT INTO `answers` VALUES ('122', 'b8f76c50fae5440580878ff0a843b3b1', 'B', 'boolean a = (9 >= 10);');
INSERT INTO `answers` VALUES ('123', 'b8f76c50fae5440580878ff0a843b3b1', 'C', 'boolean a=\"真\";');
INSERT INTO `answers` VALUES ('124', 'b8f76c50fae5440580878ff0a843b3b1', 'D', 'boolean a = = false;');
INSERT INTO `answers` VALUES ('125', 'ccdb533220854d49a473c6b27cf6b47f', 'A', 'STRING');
INSERT INTO `answers` VALUES ('126', 'ccdb533220854d49a473c6b27cf6b47f', 'B', 'x3x;');
INSERT INTO `answers` VALUES ('127', 'ccdb533220854d49a473c6b27cf6b47f', 'C', 'void');
INSERT INTO `answers` VALUES ('128', 'ccdb533220854d49a473c6b27cf6b47f', 'D', 'de$f');
INSERT INTO `answers` VALUES ('129', '7ad9b6e045954317924071841c2de9b3', 'A', '31');
INSERT INTO `answers` VALUES ('130', '7ad9b6e045954317924071841c2de9b3', 'B', '0');
INSERT INTO `answers` VALUES ('131', '7ad9b6e045954317924071841c2de9b3', 'C', '1');
INSERT INTO `answers` VALUES ('132', '7ad9b6e045954317924071841c2de9b3', 'D', '2');
INSERT INTO `answers` VALUES ('133', '9c70c01b276c4b75b1dcdf2e026808ed', 'A', 'i++;');
INSERT INTO `answers` VALUES ('134', '9c70c01b276c4b75b1dcdf2e026808ed', 'B', 'i>5;');
INSERT INTO `answers` VALUES ('135', '9c70c01b276c4b75b1dcdf2e026808ed', 'C', 'bEqual = str.equals(\"q\");');
INSERT INTO `answers` VALUES ('136', '9c70c01b276c4b75b1dcdf2e026808ed', 'D', 'count = = i;');
INSERT INTO `answers` VALUES ('141', 'fdd5a8b8d72e4906975afe76bbb557bf', 'A', '由高向低分别是：()、!、算术运算符、关系运算符、逻辑运算符、赋值运算符；');
INSERT INTO `answers` VALUES ('142', 'fdd5a8b8d72e4906975afe76bbb557bf', 'B', '由高向低分别是：()、关系运算符、算术运算符、赋值运算符、!、逻辑运算符');
INSERT INTO `answers` VALUES ('143', 'fdd5a8b8d72e4906975afe76bbb557bf', 'C', '由高向低分别是：()、算术运算符、逻辑运算符、关系运算符、!、赋值运算符；');
INSERT INTO `answers` VALUES ('144', 'fdd5a8b8d72e4906975afe76bbb557bf', 'D', '由高向低分别是：()、!、关系运算符、赋值运算符、算术运算符、逻辑运算符；');
INSERT INTO `answers` VALUES ('149', '8ff587fcb28542a081c29f069f3fda74', 'A', 'option');
INSERT INTO `answers` VALUES ('150', '8ff587fcb28542a081c29f069f3fda74', 'B', 'content');
INSERT INTO `answers` VALUES ('151', '8ff587fcb28542a081c29f069f3fda74', 'C', 'sum');
INSERT INTO `answers` VALUES ('152', '8ff587fcb28542a081c29f069f3fda74', 'D', 'count');
INSERT INTO `answers` VALUES ('161', 'b92d3465488843d59d9e8b5d72b2b3a0', 'A', 'select from 表A');
INSERT INTO `answers` VALUES ('162', 'b92d3465488843d59d9e8b5d72b2b3a0', 'B', 'select * from 表A');
INSERT INTO `answers` VALUES ('163', 'b92d3465488843d59d9e8b5d72b2b3a0', 'C', 'select * from 表A a left join 表B b on A.id=B.a_id where a.delstatus=0 ');
INSERT INTO `answers` VALUES ('164', 'b92d3465488843d59d9e8b5d72b2b3a0', 'D', 'drop 表A');
INSERT INTO `answers` VALUES ('165', 'ad5ca7602bdd49dbade5bfc3fbd59577', 'A', '1');
INSERT INTO `answers` VALUES ('166', 'ad5ca7602bdd49dbade5bfc3fbd59577', 'B', '2');
INSERT INTO `answers` VALUES ('167', 'ad5ca7602bdd49dbade5bfc3fbd59577', 'C', '3');
INSERT INTO `answers` VALUES ('168', 'ad5ca7602bdd49dbade5bfc3fbd59577', 'D', '4');

-- ----------------------------
-- Table structure for `baoming`
-- ----------------------------
DROP TABLE IF EXISTS `baoming`;
CREATE TABLE `baoming` (
  `id` int(11) NOT NULL auto_increment,
  `stid` varchar(255) default NULL,
  `kcid` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of baoming
-- ----------------------------
INSERT INTO `baoming` VALUES ('25', '14', '8', '2021-03-16 21:41:01');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '编程基础', '0');
INSERT INTO `category` VALUES ('2', '高手进阶', '0');
INSERT INTO `category` VALUES ('4', '复杂算法', '0');
INSERT INTO `category` VALUES ('5', '分类四1', '1');
INSERT INTO `category` VALUES ('6', '测试', '1');
INSERT INTO `category` VALUES ('7', '1122', '1');
INSERT INTO `category` VALUES ('8', '测试1', '1');

-- ----------------------------
-- Table structure for `exam`
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL auto_increment,
  `uuid` varchar(255) default NULL,
  `paperid` int(11) default NULL,
  `stuid` int(11) default NULL,
  `score` int(11) default NULL,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('8', 'd2f70e2e1a314baaa9a75dd45819f3f4', '12', '14', '4', '2021-03-16 21:46:34');

-- ----------------------------
-- Table structure for `examdetail`
-- ----------------------------
DROP TABLE IF EXISTS `examdetail`;
CREATE TABLE `examdetail` (
  `id` int(11) NOT NULL auto_increment,
  `examid` varchar(255) default NULL,
  `questionid` int(11) default NULL,
  `answer` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examdetail
-- ----------------------------
INSERT INTO `examdetail` VALUES ('27', '6dfab2098b0743d3997b68f7d6bf03b2', '10', 'D');
INSERT INTO `examdetail` VALUES ('28', '6dfab2098b0743d3997b68f7d6bf03b2', '3', 'B');
INSERT INTO `examdetail` VALUES ('29', '6dfab2098b0743d3997b68f7d6bf03b2', '14', 'A');
INSERT INTO `examdetail` VALUES ('30', '6dfab2098b0743d3997b68f7d6bf03b2', '13', 'B');
INSERT INTO `examdetail` VALUES ('31', '6dfab2098b0743d3997b68f7d6bf03b2', '12', 'C');
INSERT INTO `examdetail` VALUES ('32', '6dfab2098b0743d3997b68f7d6bf03b2', '11', 'B');
INSERT INTO `examdetail` VALUES ('33', '6dfab2098b0743d3997b68f7d6bf03b2', '4', 'B');
INSERT INTO `examdetail` VALUES ('34', '6dfab2098b0743d3997b68f7d6bf03b2', '5', 'B');
INSERT INTO `examdetail` VALUES ('35', '6dfab2098b0743d3997b68f7d6bf03b2', '9', 'A');
INSERT INTO `examdetail` VALUES ('36', '6dfab2098b0743d3997b68f7d6bf03b2', '6', 'A');
INSERT INTO `examdetail` VALUES ('37', '6dfab2098b0743d3997b68f7d6bf03b2', '15', 'B');
INSERT INTO `examdetail` VALUES ('38', '6dfab2098b0743d3997b68f7d6bf03b2', '16', 'BC');
INSERT INTO `examdetail` VALUES ('39', '6dfab2098b0743d3997b68f7d6bf03b2', '17', 'ABC');
INSERT INTO `examdetail` VALUES ('40', 'a951a1351ca24c6f8b2511f65015b485', '10', 'A');
INSERT INTO `examdetail` VALUES ('41', 'a951a1351ca24c6f8b2511f65015b485', '3', 'B');
INSERT INTO `examdetail` VALUES ('42', 'a951a1351ca24c6f8b2511f65015b485', '14', 'A');
INSERT INTO `examdetail` VALUES ('43', 'a951a1351ca24c6f8b2511f65015b485', '13', 'B');
INSERT INTO `examdetail` VALUES ('44', 'a951a1351ca24c6f8b2511f65015b485', '12', 'C');
INSERT INTO `examdetail` VALUES ('45', 'a951a1351ca24c6f8b2511f65015b485', '11', 'B');
INSERT INTO `examdetail` VALUES ('46', 'a951a1351ca24c6f8b2511f65015b485', '4', 'D');
INSERT INTO `examdetail` VALUES ('47', 'a951a1351ca24c6f8b2511f65015b485', '5', 'A');
INSERT INTO `examdetail` VALUES ('48', 'a951a1351ca24c6f8b2511f65015b485', '9', 'A');
INSERT INTO `examdetail` VALUES ('49', 'a951a1351ca24c6f8b2511f65015b485', '6', 'A');
INSERT INTO `examdetail` VALUES ('50', 'a951a1351ca24c6f8b2511f65015b485', '15', 'B');
INSERT INTO `examdetail` VALUES ('51', 'a951a1351ca24c6f8b2511f65015b485', '16', 'AB');
INSERT INTO `examdetail` VALUES ('52', 'a951a1351ca24c6f8b2511f65015b485', '17', 'ABC');
INSERT INTO `examdetail` VALUES ('53', '049789932e3e4978ba8bbeb9ae226000', '10', 'C');
INSERT INTO `examdetail` VALUES ('54', '049789932e3e4978ba8bbeb9ae226000', '3', 'B');
INSERT INTO `examdetail` VALUES ('55', '049789932e3e4978ba8bbeb9ae226000', '14', 'C');
INSERT INTO `examdetail` VALUES ('56', '049789932e3e4978ba8bbeb9ae226000', '13', 'C');
INSERT INTO `examdetail` VALUES ('57', '049789932e3e4978ba8bbeb9ae226000', '12', 'D');
INSERT INTO `examdetail` VALUES ('58', '049789932e3e4978ba8bbeb9ae226000', '11', 'B');
INSERT INTO `examdetail` VALUES ('59', '049789932e3e4978ba8bbeb9ae226000', '4', 'A');
INSERT INTO `examdetail` VALUES ('60', '049789932e3e4978ba8bbeb9ae226000', '5', 'A');
INSERT INTO `examdetail` VALUES ('61', '049789932e3e4978ba8bbeb9ae226000', '9', 'A');
INSERT INTO `examdetail` VALUES ('62', '049789932e3e4978ba8bbeb9ae226000', '6', 'A');
INSERT INTO `examdetail` VALUES ('63', '049789932e3e4978ba8bbeb9ae226000', '15', 'B');
INSERT INTO `examdetail` VALUES ('64', '049789932e3e4978ba8bbeb9ae226000', '16', 'BC');
INSERT INTO `examdetail` VALUES ('65', '049789932e3e4978ba8bbeb9ae226000', '17', 'AC');
INSERT INTO `examdetail` VALUES ('66', 'c6eabf9d8fae4d839fb46f54b47fda35', '21', 'B');
INSERT INTO `examdetail` VALUES ('67', 'c6eabf9d8fae4d839fb46f54b47fda35', '27', 'C');
INSERT INTO `examdetail` VALUES ('68', 'c6eabf9d8fae4d839fb46f54b47fda35', '22', 'C');
INSERT INTO `examdetail` VALUES ('69', 'c6eabf9d8fae4d839fb46f54b47fda35', '20', 'B');
INSERT INTO `examdetail` VALUES ('70', 'c6eabf9d8fae4d839fb46f54b47fda35', '23', 'B');
INSERT INTO `examdetail` VALUES ('71', 'c6eabf9d8fae4d839fb46f54b47fda35', '18', 'D');
INSERT INTO `examdetail` VALUES ('72', 'c6eabf9d8fae4d839fb46f54b47fda35', '19', 'A');
INSERT INTO `examdetail` VALUES ('73', 'c6eabf9d8fae4d839fb46f54b47fda35', '25', 'C');
INSERT INTO `examdetail` VALUES ('74', 'c6eabf9d8fae4d839fb46f54b47fda35', '29', 'ABCD');
INSERT INTO `examdetail` VALUES ('75', 'c6eabf9d8fae4d839fb46f54b47fda35', '28', 'ABC');
INSERT INTO `examdetail` VALUES ('89', 'd2f70e2e1a314baaa9a75dd45819f3f4', '5', 'A');
INSERT INTO `examdetail` VALUES ('90', 'd2f70e2e1a314baaa9a75dd45819f3f4', '15', 'A');
INSERT INTO `examdetail` VALUES ('91', 'd2f70e2e1a314baaa9a75dd45819f3f4', '4', 'A');
INSERT INTO `examdetail` VALUES ('92', 'd2f70e2e1a314baaa9a75dd45819f3f4', '3', 'A');
INSERT INTO `examdetail` VALUES ('93', 'd2f70e2e1a314baaa9a75dd45819f3f4', '13', 'A');
INSERT INTO `examdetail` VALUES ('94', 'd2f70e2e1a314baaa9a75dd45819f3f4', '14', 'A');
INSERT INTO `examdetail` VALUES ('95', 'd2f70e2e1a314baaa9a75dd45819f3f4', '6', 'A');
INSERT INTO `examdetail` VALUES ('96', 'd2f70e2e1a314baaa9a75dd45819f3f4', '9', 'A');
INSERT INTO `examdetail` VALUES ('97', 'd2f70e2e1a314baaa9a75dd45819f3f4', '12', 'A');
INSERT INTO `examdetail` VALUES ('98', 'd2f70e2e1a314baaa9a75dd45819f3f4', '10', '');
INSERT INTO `examdetail` VALUES ('99', 'd2f70e2e1a314baaa9a75dd45819f3f4', '16', 'AB');
INSERT INTO `examdetail` VALUES ('100', 'd2f70e2e1a314baaa9a75dd45819f3f4', '17', 'AB');

-- ----------------------------
-- Table structure for `imgadv`
-- ----------------------------
DROP TABLE IF EXISTS `imgadv`;
CREATE TABLE `imgadv` (
  `id` int(11) NOT NULL auto_increment,
  `filename` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgadv
-- ----------------------------
INSERT INTO `imgadv` VALUES ('12', '1577595041008.jpg');
INSERT INTO `imgadv` VALUES ('13', '1577595049117.jpg');

-- ----------------------------
-- Table structure for `kechen`
-- ----------------------------
DROP TABLE IF EXISTS `kechen`;
CREATE TABLE `kechen` (
  `id` int(11) NOT NULL auto_increment,
  `kcname` varchar(255) default NULL,
  `categoryid` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `content` text,
  `istj` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  `teacherid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kechen
-- ----------------------------
INSERT INTO `kechen` VALUES ('3', '从零开始学架构', '2', '1577586825055.jpeg', '<span style=\"color:#666666;font-family:PingFangSC-Light, &quot;background-color:#FFFFFF;\">本课程讲解前端负载均衡接入、动静资源隔离、服务层使用多级缓存、池化技术、异步化技术、隔离技术、队列技术、应急方案等，带你全面掌握主流互联网高性能后端服务平台的系统分层模型及设计思想</span>', 'yes', '0', '15');
INSERT INTO `kechen` VALUES ('4', '微博热门话题系统架构设计', '1', '1577587295413.png', '<span style=\"color:#666666;font-family:PingFangSC-Light, &quot;background-color:#FFFFFF;\">本课程通过讲解微博业务模块中最常见、流量最高的热门话题，展示如何搭建高性能亿级流量微博社交网站的系统架构。</span>', 'yes', '0', '15');
INSERT INTO `kechen` VALUES ('5', '架构设计专项课程之页面静态化技术', '1', '1577587339112.jpeg', '<span style=\"color:#666666;font-family:PingFangSC-Light, &quot;background-color:#FFFFFF;\">本次课程介绍了页面静态化技术的演进方案，帮助大家掌握又一项加薪利器</span>', 'no', '0', '15');
INSERT INTO `kechen` VALUES ('6', '架构设计专项课程之异步化架构设计', '4', '1577587385130.png', '<span style=\"color:#666666;font-family:PingFangSC-Light, &quot;background-color:#FFFFFF;\">本课程将为大家介绍不同消息队列适用的场景范围、优缺点以及消息中间件的具体实现，并着重对RocketMQ以及Kafka做具体分析，帮助大家提升架构开发能力，成为后端开发核心人员。</span>', 'no', '0', '15');
INSERT INTO `kechen` VALUES ('7', 'PHP7进阶到架构', '1', '1577587431321.jpg', '<span style=\"color:#333333;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">从TP5/Laravel框架内核原理，到PHP性能优化，到swoole网络通信引擎，微服务架构，大型商业企业项目实战，从人工智能技术到高并发分布式架构，跟着老师学习解决高薪就业和创业的问题。</span>', 'yes', '0', '15');
INSERT INTO `kechen` VALUES ('8', 'C#/.Net/架构师/分布式', '2', '1577587503486.jpg', '<span style=\"color:#333333;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">从TP5/Laravel框架内核原理，到PHP性能优化，到swoole网络通信引擎，微服务架构，大型商业企业项目实战，从人工智能技术到高并发分布式架构，跟着老师学习解决高薪就业和创业的问题</span>', 'yes', '0', '15');
INSERT INTO `kechen` VALUES ('14', 'JAVA零基础到精通', '1', '1605848834604.jpg', '<p>\r\n	第一章.************************\r\n</p>\r\n<p>\r\n	<span>第二章.************************</span> \r\n</p>\r\n<p>\r\n	<span>第三章.************************</span> \r\n</p>\r\n<p>\r\n	<span>第四章.************************</span> \r\n</p>', 'no', '0', '24');
INSERT INTO `kechen` VALUES ('15', '测试11', '4', '1611149899930.png', '111', 'no', '1', '15');

-- ----------------------------
-- Table structure for `kechenlr`
-- ----------------------------
DROP TABLE IF EXISTS `kechenlr`;
CREATE TABLE `kechenlr` (
  `id` int(11) NOT NULL auto_increment,
  `tcid` varchar(255) default NULL,
  `kcid` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `content` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  `flag` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  `shstatus` varchar(255) default NULL,
  `cs` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kechenlr
-- ----------------------------
INSERT INTO `kechenlr` VALUES ('47', '15', '8', 'C#/.Net/架构师/分布式第一章视频', '1611149974296.mp4', null, '2021-03-16 21:39:34', '课程视频', '0', '通过审核', '0');
INSERT INTO `kechenlr` VALUES ('48', '15', '8', 'C#/.Net/架构师/分布式第二章视频', '1611149995545.mp4', null, '2021-03-16 21:39:55', '课程视频', '0', '通过审核', '1');
INSERT INTO `kechenlr` VALUES ('49', '15', '8', '课件一', '1611150146624.txt', null, '2021-03-16 21:42:27', '课件', '0', '通过审核', '0');
INSERT INTO `kechenlr` VALUES ('50', '15', '8', '2021-1-20', '1611150451793.txt', null, '2021-03-16', '作业', '0', '通过审核', '0');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL auto_increment,
  `uname` varchar(255) default NULL,
  `upass` varchar(255) default NULL,
  `tname` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `utype` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  `shstatus` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('9', 'H001', '123', '张三', '13877661122', 'zhang@126.com', '学生', '0', '通过');
INSERT INTO `member` VALUES ('13', 'H002', '123', '李四', '13609871134', 'li@126.com', '学生', '0', '通过');
INSERT INTO `member` VALUES ('14', 'H003', '123', '王五', '13678995521', 'wang@126.com', '学生', '0', '通过');
INSERT INTO `member` VALUES ('15', 'T001', '123', '丁老师', '13970882253', 'ding@126.com', '老师', '0', '通过');
INSERT INTO `member` VALUES ('24', 'T002', '123', '杨小壮', '13789066111', 'yang@126.com', '老师', '0', '通过');
INSERT INTO `member` VALUES ('28', 'H004', '123', '胡勇', '13876590331', 'H004@126.com', '学生', '0', '通过');
INSERT INTO `member` VALUES ('29', 'T003', '123', '周老师', '13789064433', 'T003@126.com', '老师', '0', '通过');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` varchar(255) default NULL,
  `content` text,
  `savetime` varchar(255) default NULL,
  `hfcontent` text,
  `hfsavetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('5', '15', '111', '2021-03-16 21:48:37', '22', null);

-- ----------------------------
-- Table structure for `paper`
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `id` int(11) NOT NULL auto_increment,
  `uuid` varchar(255) default NULL,
  `kcid` int(11) default NULL,
  `teacherid` int(11) default NULL,
  `title` varchar(255) default NULL,
  `testtime` int(11) default NULL,
  `delstatus` varchar(255) default NULL,
  `score` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('9', '56ef66d08ebd43fb8bbe07ffe4ae260d', '8', '15', '单元测试试卷', '1', '0', '28');
INSERT INTO `paper` VALUES ('10', '678dafaef56c4693856637c3202740cc', '14', '26', '小试牛刀', '1', '0', '22');
INSERT INTO `paper` VALUES ('11', '9bbb5cf3f86346079027e2e9191c4c56', '8', '15', '11', '10', '1', '10');
INSERT INTO `paper` VALUES ('12', '0d90fd714ff149fb85dc178c95320bcb', '8', '15', '模拟考试', '1', '0', '26');

-- ----------------------------
-- Table structure for `paperdetail`
-- ----------------------------
DROP TABLE IF EXISTS `paperdetail`;
CREATE TABLE `paperdetail` (
  `id` int(11) NOT NULL auto_increment,
  `qno` int(11) default NULL,
  `paperid` varchar(255) default NULL,
  `questionid` int(255) default NULL,
  `type` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paperdetail
-- ----------------------------
INSERT INTO `paperdetail` VALUES ('31', '1', '56ef66d08ebd43fb8bbe07ffe4ae260d', '10', '1');
INSERT INTO `paperdetail` VALUES ('32', '2', '56ef66d08ebd43fb8bbe07ffe4ae260d', '3', '1');
INSERT INTO `paperdetail` VALUES ('33', '3', '56ef66d08ebd43fb8bbe07ffe4ae260d', '14', '1');
INSERT INTO `paperdetail` VALUES ('34', '4', '56ef66d08ebd43fb8bbe07ffe4ae260d', '13', '1');
INSERT INTO `paperdetail` VALUES ('35', '5', '56ef66d08ebd43fb8bbe07ffe4ae260d', '12', '1');
INSERT INTO `paperdetail` VALUES ('36', '6', '56ef66d08ebd43fb8bbe07ffe4ae260d', '11', '1');
INSERT INTO `paperdetail` VALUES ('37', '7', '56ef66d08ebd43fb8bbe07ffe4ae260d', '4', '1');
INSERT INTO `paperdetail` VALUES ('38', '8', '56ef66d08ebd43fb8bbe07ffe4ae260d', '5', '1');
INSERT INTO `paperdetail` VALUES ('39', '9', '56ef66d08ebd43fb8bbe07ffe4ae260d', '9', '1');
INSERT INTO `paperdetail` VALUES ('40', '10', '56ef66d08ebd43fb8bbe07ffe4ae260d', '6', '1');
INSERT INTO `paperdetail` VALUES ('41', '11', '56ef66d08ebd43fb8bbe07ffe4ae260d', '15', '1');
INSERT INTO `paperdetail` VALUES ('42', '12', '56ef66d08ebd43fb8bbe07ffe4ae260d', '16', '2');
INSERT INTO `paperdetail` VALUES ('43', '13', '56ef66d08ebd43fb8bbe07ffe4ae260d', '17', '2');
INSERT INTO `paperdetail` VALUES ('44', '1', '678dafaef56c4693856637c3202740cc', '21', '1');
INSERT INTO `paperdetail` VALUES ('45', '2', '678dafaef56c4693856637c3202740cc', '27', '1');
INSERT INTO `paperdetail` VALUES ('46', '3', '678dafaef56c4693856637c3202740cc', '22', '1');
INSERT INTO `paperdetail` VALUES ('47', '4', '678dafaef56c4693856637c3202740cc', '20', '1');
INSERT INTO `paperdetail` VALUES ('48', '5', '678dafaef56c4693856637c3202740cc', '23', '1');
INSERT INTO `paperdetail` VALUES ('49', '6', '678dafaef56c4693856637c3202740cc', '18', '1');
INSERT INTO `paperdetail` VALUES ('50', '7', '678dafaef56c4693856637c3202740cc', '19', '1');
INSERT INTO `paperdetail` VALUES ('51', '8', '678dafaef56c4693856637c3202740cc', '25', '1');
INSERT INTO `paperdetail` VALUES ('52', '9', '678dafaef56c4693856637c3202740cc', '29', '2');
INSERT INTO `paperdetail` VALUES ('53', '10', '678dafaef56c4693856637c3202740cc', '28', '2');
INSERT INTO `paperdetail` VALUES ('54', '1', '9bbb5cf3f86346079027e2e9191c4c56', '4', '1');
INSERT INTO `paperdetail` VALUES ('55', '2', '9bbb5cf3f86346079027e2e9191c4c56', '5', '1');
INSERT INTO `paperdetail` VALUES ('56', '3', '9bbb5cf3f86346079027e2e9191c4c56', '16', '2');
INSERT INTO `paperdetail` VALUES ('57', '4', '9bbb5cf3f86346079027e2e9191c4c56', '17', '2');
INSERT INTO `paperdetail` VALUES ('58', '1', '0d90fd714ff149fb85dc178c95320bcb', '5', '1');
INSERT INTO `paperdetail` VALUES ('59', '2', '0d90fd714ff149fb85dc178c95320bcb', '15', '1');
INSERT INTO `paperdetail` VALUES ('60', '3', '0d90fd714ff149fb85dc178c95320bcb', '4', '1');
INSERT INTO `paperdetail` VALUES ('61', '4', '0d90fd714ff149fb85dc178c95320bcb', '3', '1');
INSERT INTO `paperdetail` VALUES ('62', '5', '0d90fd714ff149fb85dc178c95320bcb', '13', '1');
INSERT INTO `paperdetail` VALUES ('63', '6', '0d90fd714ff149fb85dc178c95320bcb', '14', '1');
INSERT INTO `paperdetail` VALUES ('64', '7', '0d90fd714ff149fb85dc178c95320bcb', '6', '1');
INSERT INTO `paperdetail` VALUES ('65', '8', '0d90fd714ff149fb85dc178c95320bcb', '9', '1');
INSERT INTO `paperdetail` VALUES ('66', '9', '0d90fd714ff149fb85dc178c95320bcb', '12', '1');
INSERT INTO `paperdetail` VALUES ('67', '10', '0d90fd714ff149fb85dc178c95320bcb', '10', '1');
INSERT INTO `paperdetail` VALUES ('68', '11', '0d90fd714ff149fb85dc178c95320bcb', '16', '2');
INSERT INTO `paperdetail` VALUES ('69', '12', '0d90fd714ff149fb85dc178c95320bcb', '17', '2');

-- ----------------------------
-- Table structure for `pinlun`
-- ----------------------------
DROP TABLE IF EXISTS `pinlun`;
CREATE TABLE `pinlun` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` varchar(255) default NULL,
  `kechenid` varchar(255) default NULL,
  `content` text,
  `savetime` varchar(255) default NULL,
  `hfcontent` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pinlun
-- ----------------------------
INSERT INTO `pinlun` VALUES ('7', '14', '8', '这课程老师教的不错', '2021-03-16 21:49:06', '222');

-- ----------------------------
-- Table structure for `questions`
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL auto_increment,
  `uuid` varchar(255) default '',
  `title` varchar(255) default NULL,
  `answer` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `kcid` int(11) default NULL,
  `teacherid` int(11) default NULL,
  `delstatus` varchar(255) default NULL,
  `score` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('3', 'b5049e0d96be4932bf39cf5d712eedd3', '以下选项中不合法的用户标识符是（　　）。', 'B', '1', '8', '15', '0', '2');
INSERT INTO `questions` VALUES ('4', '3d6b2ee075724fe19c129193de033eed', '下列字符数组初始化语句中，不正确的是（　　）', 'C', '1', '8', '15', '0', '2');
INSERT INTO `questions` VALUES ('5', '1743c87c66a84bb7870c43f460e0a623', '若二维数组a有m列，则在a[i][j]前的元素个数为（　　）。', 'B', '1', '8', '15', '0', '2');
INSERT INTO `questions` VALUES ('6', '407fa4b6903a4b079f8ffd444c645f5d', '两个或两个以上模块之间联系的紧密程度称为（　　）。', 'A', '1', '8', '15', '0', '2');
INSERT INTO `questions` VALUES ('9', '0adb5329620a4a38b698a871c8b5e9bb', '为了提高软件的独立性，模块之间是（　　）。', 'D', '1', '8', '15', '0', '2');
INSERT INTO `questions` VALUES ('10', 'f6929635a1f9427f8604c4d2a2270db4', 'C语言中，字符(char)型数据在微机内存中的存储形式是（　　）。', 'D', '1', '8', '15', '0', '2');
INSERT INTO `questions` VALUES ('11', '003489dc956b4d638123e5128c5699c8', '按照“先进后出”原则组织数据的结构是（　　）。', 'B', '1', '8', '15', '0', '2');
INSERT INTO `questions` VALUES ('12', '907449b04a624c999635086978625de4', '若有定义：“int*P，x=0，*P，P=＆x；”，则语句“printf(”％d＼n”，*p)；”的输出结果是（　　）。', 'C', '1', '8', '15', '0', '2');
INSERT INTO `questions` VALUES ('13', '3cdbb447bb3a42c7b457f69c8a6da76a', '若有定义：“int a[2][3]；”，则对a数组的第i行第j列元素的正确引用为（　　）。', 'C', '1', '8', '15', '0', '2');
INSERT INTO `questions` VALUES ('14', 'f4c2fc434ffc4d58b27cade0b140460e', '已知大写字母A的ASCIl码是65，小写字母a的ACSII码是97。下列能将变量C中的大写字母转换为对应小写字母的语句是（　　）。', 'A', '1', '8', '15', '0', '2');
INSERT INTO `questions` VALUES ('15', '259214492915456d803285f285a702f5', 'C语言中运算对象必须是整型的运算符是（　　）。', 'B', '1', '8', '15', '0', '2');
INSERT INTO `questions` VALUES ('16', 'bc0fb31d90e24dd087b02b8cf2c8afc2', '下列关于定点数与浮点数的叙述中错误的是（　　）。', 'BC', '2', '8', '15', '0', '3');
INSERT INTO `questions` VALUES ('17', '75ede4a3c3234fb5832f3554a7c7e979', '在C语言中，函数返回值的类型终取决于（　　）。', 'ABC', '2', '8', '15', '0', '3');
INSERT INTO `questions` VALUES ('18', 'c9553e579d4c4ec1a0d4b5add222580e', 'JAVA所定义的版本中不包括：（）', 'D', '1', '14', '24', '0', '2');
INSERT INTO `questions` VALUES ('19', 'f53524a673c14e8f9605ae5dfed4a4cb', '下列说法正确的是（）', 'A', '1', '14', '24', '0', '2');
INSERT INTO `questions` VALUES ('20', '42fcf661132c4461910523e8d1aa3e4d', 'Java中，在如下所示的Test类中，共有（）个构造方法。public class Test{\r\n\r\nprivate int x;\r\n\r\npublic Test(){\r\n\r\nx=35;\r\n\r\n}\r\n\r\npublic void Test(double f){\r\n\r\nThis.x=(int)f;\r\n\r\n}\r\n\r\npublic Test(String s){}\r\n\r\n}', 'C', '1', '14', '24', '0', '2');
INSERT INTO `questions` VALUES ('21', '0aad14823a0342ab915124b838ef1c00', '变量命名规范说法正确的是（）', 'B', '1', '14', '24', '0', '2');
INSERT INTO `questions` VALUES ('22', '7582b8bbee97455d8fd601e7102936ff', '下列javaDoc注释正确的是（）', 'C', '1', '14', '24', '0', '2');
INSERT INTO `questions` VALUES ('23', 'b8f76c50fae5440580878ff0a843b3b1', '为一个boolean类型变量赋值时，可以使用()方式', 'B', '1', '14', '24', '0', '2');
INSERT INTO `questions` VALUES ('24', 'ccdb533220854d49a473c6b27cf6b47f', '以下()不是合法的标识符', 'C', '1', '14', '24', '0', '2');
INSERT INTO `questions` VALUES ('25', '7ad9b6e045954317924071841c2de9b3', '表达式(11+3*8)/4%3的值是()', 'D', '1', '14', '24', '0', '2');
INSERT INTO `questions` VALUES ('26', '9c70c01b276c4b75b1dcdf2e026808ed', '（）表达式不可以作为循环条件', 'A', '1', '14', '24', '0', '2');
INSERT INTO `questions` VALUES ('27', 'fdd5a8b8d72e4906975afe76bbb557bf', '运算符优先级别排序正确的是（）', 'A', '1', '14', '24', '0', '2');
INSERT INTO `questions` VALUES ('28', 'b92d3465488843d59d9e8b5d72b2b3a0', '以下SQL正确的是(   )', 'BCD', '2', '14', '24', '0', '3');
INSERT INTO `questions` VALUES ('29', '8ff587fcb28542a081c29f069f3fda74', 'SQL的关键字有(   )', 'ABCD', '2', '14', '24', '0', '3');
INSERT INTO `questions` VALUES ('30', 'ad5ca7602bdd49dbade5bfc3fbd59577', '11', 'A', '1', '8', '15', '1', '2');

-- ----------------------------
-- Table structure for `studyrecord`
-- ----------------------------
DROP TABLE IF EXISTS `studyrecord`;
CREATE TABLE `studyrecord` (
  `id` int(11) NOT NULL auto_increment,
  `kclrid` int(11) default NULL,
  `mid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studyrecord
-- ----------------------------
INSERT INTO `studyrecord` VALUES ('14', '48', '14');
INSERT INTO `studyrecord` VALUES ('15', '49', '14');

-- ----------------------------
-- Table structure for `sysuser`
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `userpassword` varchar(255) default NULL,
  `realname` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  `usertype` varchar(255) NOT NULL,
  `filename` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('1', 'admin', '123', '沙沙', '女', '13888888886', 'admin@126.com', '0', '管理员', null);

-- ----------------------------
-- Table structure for `zuoye`
-- ----------------------------
DROP TABLE IF EXISTS `zuoye`;
CREATE TABLE `zuoye` (
  `id` int(11) NOT NULL auto_increment,
  `stid` varchar(255) default NULL,
  `tcid` varchar(255) default NULL,
  `kcid` varchar(255) default NULL,
  `zyid` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zuoye
-- ----------------------------
INSERT INTO `zuoye` VALUES ('11', '14', '15', '8', '50', '1611150479336.txt', '2021-03-16 21:47:59');
