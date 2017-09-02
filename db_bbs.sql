/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : db_bbs

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-09-02 11:06:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_accessory`
-- ----------------------------
DROP TABLE IF EXISTS `tb_accessory`;
CREATE TABLE `tb_accessory` (
  `accessory_id` int(11) NOT NULL AUTO_INCREMENT,
  `accessory_bbs_id` int(11) NOT NULL,
  `accessory_file_name` varchar(255) NOT NULL,
  `accessory_path` varchar(255) NOT NULL,
  `accessory_upload_time` datetime NOT NULL,
  `accessory_description` varchar(255) NOT NULL,
  `accessory_size` varchar(255) NOT NULL,
  `accessory_download_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`accessory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_accessory
-- ----------------------------
INSERT INTO `tb_accessory` VALUES ('1', '1', 'accessory1.cpp', 'accessory/', '2017-08-30 16:20:35', '这是第一份附件', '2M', '0');
INSERT INTO `tb_accessory` VALUES ('2', '1', 'accessory2.c', 'accessory/', '2017-09-01 11:02:37', '这是第二份附件', '3M', '0');

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
  `bbs_isTop` varchar(1) DEFAULT '0',
  `bbs_toTopTime` datetime DEFAULT NULL,
  `bbs_isGood` varchar(1) DEFAULT '0',
  `bbs_toGoodTime` datetime DEFAULT NULL,
  `bbs_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bbs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bbs
-- ----------------------------
INSERT INTO `tb_bbs` VALUES ('1', '1', '普通主题', 'JSP程序开发中有那些设计模式？', '请问各位，在JSP开发中有哪些开发模式？', 'tsoft', '2013-08-05 10:43:03', '127.0.0.1', 'face3.gif', '2013-08-05 10:43:03', '1', '2017-09-01 13:28:21', '1', '2013-08-05 10:43:03', '这里是精华原因');
INSERT INTO `tb_bbs` VALUES ('2', '1', '普通主题', '乱码问题！！', '请问，在JSP中如何解决获取表单数据后的中文乱码问题？？谢谢！！', 'tsoft', '2013-08-05 10:44:03', '127.0.0.1', 'face11.gif', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', '1', '2013-08-05 10:43:03', '这里是精华原因');
INSERT INTO `tb_bbs` VALUES ('10', '2', '普通主题', 'PHP 双冒号的用法', '在PHP中，访问类的方法/变量有两种方法：\r\n1. 创建对象$object = new Class()，然后使用\"->\"调用：$object->attribute/function，前提是该变量/方法可访问。\r\n2. 直接调用类方法/变量：class::attribute/function，无论是静态/非静态都可以。但是有前提条件：\r\n    A. 如果是变量，需要该变量可访问。\r\n    B. 如果是方法，除了该方法可访问外，还需要满足：\r\n        b1) 如果是静态方法，没有特殊条件；\r\n        b2) 如果是非静态方法，需要改方法中没有使用$this，即没有调用非静态的变量/方法，当然，调用静态的变量/方法没有问题。\r\n\r\n然后我们再看一下使用$object->... 和使用class::... 都有什么区别：\r\n1. 使用$object->... ，需要执行构造函数创建对象；\r\n2. 使用class::... 调用静态方法/变量，不需要执行构造函数创建对象；\r\n3. 使用class::... 调用非静态方法/变量，也不需要执行构造函数创建对象。\r\n\r\n然后奇怪的地方就出来了，既然2和3都一样，那静态方法/变量存在还有什么意义呢？\r\n差异还是显然存在的，如下：\r\n1. 静态变量\r\n静态成员只保留一个变量值，而这个变量值对所有的实例都是有效，也就是说，所有的实例共享这个成员。\r\n2. 静态方法\r\n静态方法可以直接使用class::... 来调用，而非静态方法需要满足一定限制条件才能使用class::.. 的方法调用，如之前所述。', '00', '2017-08-30 20:52:38', '127.0.0.1', 'face0.gif', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', null);
INSERT INTO `tb_bbs` VALUES ('13', '19', '普通主题', '随时回答你的问题', '如果你有什么问题或者疑问可随时发帖子给我，我会及时给您回复．', '00', '2013-08-05 10:43:03', '127.0.0.1', 'face0.gif', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', null);
INSERT INTO `tb_bbs` VALUES ('15', '1', '普通主题', '测试发帖', '测试发帖内容。<font color=red>请输入要设置颜色的文字！</font>', 'java1234', '2013-08-05 11:10:54', '127.0.0.1', 'face0.gif', '2013-08-05 11:10:54', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('20', '1', '投票贴', '你喜欢谁？', '4:妈妈,2;,爸爸,3;姐姐,2;弟弟,1;', 'tsoft', '2017-09-02 09:50:22', '127.1.0.1', 'face3.gif', '2017-09-02 09:50:22', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('22', '2', '普通主题', '推荐！国外程序员收集整理的 PHP 资源', '依赖管理\r\n\r\n依赖和包管理库\r\n\r\nComposer/Packagist：一个包和依赖管理器\r\nComposer Installers：一个多框架Composer库安装器\r\nPickle：一个PHP扩展安装器\r\n \r\n\r\n其他的依赖管理\r\n\r\n其他的相关依赖管理\r\n\r\nSatis：一个静态Composer存储库生成器\r\nComposition：一个在运行时检查Composer环境的库\r\nVersion：语义版本的解析和比较库\r\nNameSpacer -转化下划线到命名空间的库\r\nPatch Installer -使用Composer安装补丁的库\r\nComposer Checker -校验Composer配置的工具\r\n \r\n\r\n框架\r\n\r\nWeb开发框架\r\n\r\nSymfony2 -一个独立组件组成的框架\r\nZend Framework 2 -另一个由独立组件组成的框架\r\nLaravel 4 -另一个PHP框架\r\nAura PHP -独立组件的框架\r\nYii2 - 另一个PHP框架\r\nNette - 另一个由个体组件组成的框架\r\nPPI Framework 2 -一个互操作性框架\r\nPhalcon -通过C扩展实现的框架\r\n\r\n其他框架\r\n\r\n其他Web开发框架\r\n\r\nSymfony CMF - 创建自定义CMS的内容管理框架\r\nKnp RAD Bundle -Symfony 2的快速应用程序（RAD）包\r\n\r\n框架组件\r\n\r\n来自web开发框架的独立组件\r\n\r\nSymfony2 Components -Symfony2组件\r\nZend Framework 2 Components -ZF2组件\r\nAura Components -PHP5.4组件包\r\nHoa Project -另一个PHP组件包\r\n\r\n微型框架\r\n\r\n微型框架和路由\r\n\r\nSilex - 基于Symfony2组件的微型框架\r\nSlim - 另一个简单的微型框架\r\nBullet PHP -用于构建REST APIs的微型框架\r\nFast Route - 快速路由库\r\nPux -另一个快速路由库\r\n \r\n\r\n其他微型框架\r\n\r\n其他相关的微型框架和路由\r\n\r\nSilex Skeleton -Silex的项目架构\r\nSilex Web Profiler -Silex web调试工具条\r\nStack - Silex/Symfony的可堆叠中间件库\r\nSlim Skeleton -Slim架构\r\nSlim View -Slim的自定义视图集合\r\nSlim Middleware -Slim的自定义中间件集合\r\n\r\n模板\r\n\r\n模板化和词法分析的库和工具\r\n\r\nTwig -一个全面的模板语言\r\nTwig Cache Extension -一个用于Twig的模板片段缓存库\r\nMustache -一个Mustache模板语言的PHP实现\r\nPhly Mustache -另一个Mustache模板语言的PHP实现\r\nMtHaml - 一个HAML 模板语言的PHP实现\r\nPHPTAL -一个 TAL 模板语言的PHP实现\r\nPlates -一个原生PHP模板库\r\nLex -一个轻量级模板解析器\r\n\r\n静态站点生成器\r\n\r\n预处理工具来生成web页面的内容。\r\n\r\nSculpin -转换Markdown和Twig为静态HTML的工具\r\nPhrozn - 另一个转换Textile，Markdown和Twig为HTML的工具\r\n\r\nHTTP\r\n\r\n用于HTTP和网站爬取的库\r\n\r\nGuzzle -一个全面的HTTP客户端\r\nBuzz -另一个HTTP客户端\r\nRequests -一个简单的HTTP库\r\nHTTPFul -一个链式HTTP库\r\nGoutte -一个简单的web爬取器\r\nPHP VCR -录制和重放HTTP请求的库\r\n \r\n\r\nURL\r\n\r\n解析URL的库\r\n\r\nPurl -一个URL处理库\r\nPHP Domain Parser -一个本地前缀解析库\r\n \r\n\r\nEmail\r\n\r\n发送和解析邮件的库\r\n\r\nSwiftMailer - 一个邮件解决方案\r\nPHPMailer - 另一个邮件解决方案\r\nFetch -一个IMAP库\r\nEmail Reply Parser -一个邮件回复解析库\r\nStampie -邮件服务库，不如 SendGrid, PostMark, MailGun 和 Mandrill.\r\nCssToInlineStyles -一个在邮件模板内联CSS的库\r\n\r\n文件\r\n\r\n文件处理和MIME类型检测库\r\n\r\nGaufrette -一个文件系统抽象层\r\nFlysystem - 另一个文件系统抽象层\r\nCanal -一个检测互联网媒体类型的库\r\n PHP视频\r', 'java1234', '2017-09-02 10:26:22', '128.3.2.2', 'face0.gif', '2017-09-02 10:26:24', '1', '2017-09-02 10:51:01', '1', null, null);
INSERT INTO `tb_bbs` VALUES ('23', '1', '普通主题', 'jsp基础', '1、概念\r\nJSP：java服务器页面（java server pages  ）\r\nJSP是一套动态网页技术，这个标准是由各大web服务器厂商实现。\r\n2、作用\r\n可以编写java代码\r\n3、运行方式\r\n必须由web服务器来解析运行\r\n4、运行\r\n前提：电脑上安装好jdk并且配置好环境变量要使用java_home\r\n进入tomcate根目录下的bin目录，双击startup.bat，然后会出现一个dos窗口，不要关闭，当出现server startup in 毫秒值时，说明tomcat启动成功了\r\n这时再在浏览器中输出http://localhost:8080/，如果出现一个猫标志的网页，就说明服务器启动成功了\r\n5、使用\r\n进入根目录下的webapps目录，自己创建一个文件夹名字随意，但是不要用中文，进入该文件夹，在文件夹中创建jsp文件就可以了\r\n6、访问\r\n在浏览器中输入localhost:8080/文件夹名/jsp文件名（要有后缀）', 'tsoft', '2017-09-02 10:29:15', '134.3.2.1', 'face11.gif', '2017-09-02 10:29:07', '1', '2017-09-02 10:35:23', '1', null, null);
INSERT INTO `tb_bbs` VALUES ('24', '3', '普通主题', 'ajax技术的背景', '不可否认，ajax技术的流行得益于google的大力推广，正是由于google earth、google suggest以及gmail等对ajax技术的广泛应用，催生了ajax的流行。而这也让微软感到无比的尴尬，因为早在97年，微软便已经发明了ajax中的关键技术，并且在99年IE5推出之时，它便开始支持XmlHttpRequest对象，并且微软之前已经开始在它的一些产品中应用ajax，比如说MSDN网站菜单中的一些应用。遗憾的是，不知道出于什么想法，当时微软发明了ajax的核心技术之后，并没有看到它的潜力而加以发展和推广，而是将它搁置起来。对于这一点来说，我个人是觉得非常奇怪的，因为以微软的资源和它的战略眼光来说，应该不会看不到ajax技术的前景，唯一的解释也许就是因为当时它的主要竞争对手Netscape的消失反而使它变得麻痹和迟钝，毕竟巨人也有打盹的时候，比如IBM曾经在对微软战略上的失误。正是这一次的失误，成就了它现在的竞争对手google在ajax方面的领先地位，而事实上google目前在ajax技术方面的领先是微软所无法达到的，这一点在后面我讲述ajax缺陷的时候也会提到。现在微软也意识到了这个问题，因此它也开始在ajax领域奋起直追，比如说推出它自己的ajax框架atlas，并且在.NET2.0也提供了一个用来实现异步回调的接口，即ICallBack接口。那么微软为什么对自己在ajax方面的落后如此紧张呢？现在就让我们来分析一下ajax技术后面隐藏的深刻意义', 'tsoft', '2017-09-02 10:55:19', '10.101.9.10', 'face0.gif', '2017-09-02 10:55:21', '0', null, '0', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_collect
-- ----------------------------
INSERT INTO `tb_collect` VALUES ('3', 'tsoft', '2');
INSERT INTO `tb_collect` VALUES ('4', 'tsoft', '1');

-- ----------------------------
-- Table structure for `tb_friend`
-- ----------------------------
DROP TABLE IF EXISTS `tb_friend`;
CREATE TABLE `tb_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `my_name` varchar(255) DEFAULT NULL,
  `friend_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_friend
-- ----------------------------
INSERT INTO `tb_friend` VALUES ('1', 'tsoft', 'java1234');
INSERT INTO `tb_friend` VALUES ('2', 'tsoft', 'me');
INSERT INTO `tb_friend` VALUES ('3', 'tsoft', 'admin');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) CHARACTER SET gb2312 DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_face` varchar(11) DEFAULT NULL,
  `user_sex` varchar(10) DEFAULT NULL,
  `user_phone` varchar(12) DEFAULT NULL,
  `user_OICQ` varchar(14) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_from` varchar(200) CHARACTER SET gb2312 NOT NULL DEFAULT '',
  `user_able` varchar(1) NOT NULL DEFAULT '0',
  `user_forbidden` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'tsoft', '698d51a19d8a121ce581499d7b701668', 'user0.gif', '男', '134****4783', '10500646A', 'xujiu1@***.com.cn', '新疆', '2', '0');
INSERT INTO `tb_user` VALUES ('2', '莫明', '15de21c670ae7c3f6f3f1f37029303c9', 'user4.gif', '男', '134****4783', '10500646A', 'xujiu1@***.com.cn', '黑龙江', '1', '0');
INSERT INTO `tb_user` VALUES ('5', '荣*天', '888', 'user15.gif', '男', '134****4783', '10500646A', 'xujiu1@***.com.cn', '湖南', '1', '0');
INSERT INTO `tb_user` VALUES ('8', '雨飞', '333', 'user18.gif', '女', '134****4783', '10500646A', 'xujiu1@***.com.cn', '广东', '1', '0');
INSERT INTO `tb_user` VALUES ('9', '许久', '444', 'user5.gif', '男', '134****4783', '10500646A', 'xujiu1@***.com.cn', '云南', '1', '0');
INSERT INTO `tb_user` VALUES ('14', '00', '000000', 'user6.gif', '女', '135*****117', '5454', '11@11.com', '贵州', '1', '0');
INSERT INTO `tb_user` VALUES ('15', 'java1234', '123', 'user15.gif', '女', '12345678900', '12321', '231@qq.com', '江西', '0', '0');
INSERT INTO `tb_user` VALUES ('16', 'me', '000000', 'user9.gif', '男', '11111111111', '120', '110@seu.edu.cn', '福建', '0', '0');
INSERT INTO `tb_user` VALUES ('18', 'you', '111111', 'user0.gif', '男', '11111111111', '111', '111@qq.com', '福建', '0', '0');
INSERT INTO `tb_user` VALUES ('19', 'op', '11111', 'user0.gif', '男', '11111111111', '111', '111@11.com', '福建', '0', '0');
INSERT INTO `tb_user` VALUES ('20', 'll', '11111', 'user0.gif', '男', '11111111111', '111', '111@qq.com', '福建', '0', '0');
INSERT INTO `tb_user` VALUES ('21', '我', '111', 'user0.gif', '男', '111', '111', '11.qq.com', '广州', '0', '1');
INSERT INTO `tb_user` VALUES ('22', '王', '111', 'user0.gif', '男', '112', '111', '11@seu.com', '新酱', '0', '0');
INSERT INTO `tb_user` VALUES ('23', '1', '1111', 'user0.gif', '女', '11111111111', '11', '11@qq.com', '福建', '0', '1');
INSERT INTO `tb_user` VALUES ('29', 'admin', '670b14728ad9902aecba32e22fa4f6bd', 'user0.gif', '男', '12345678911', '4321412', '2341@qq.com', '福建', '2', '0');
