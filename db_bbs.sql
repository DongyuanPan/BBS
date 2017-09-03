/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : db_bbs

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-09-03 10:44:47
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bbs
-- ----------------------------
INSERT INTO `tb_bbs` VALUES ('2', '1', '普通主题', '乱码问题！！', '请问，在JSP中如何解决获取表单数据后的中文乱码问题？？谢谢！！', 'tsoft', '2013-08-05 10:44:03', '127.0.0.1', 'face11.gif', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', '1', '2013-08-05 10:43:03', '这里是精华原因');
INSERT INTO `tb_bbs` VALUES ('10', '2', '普通主题', 'PHP 双冒号的用法', '在PHP中，访问类的方法/变量有两种方法：\r\n1. 创建对象$object = new Class()，然后使用\"->\"调用：$object->attribute/function，前提是该变量/方法可访问。\r\n2. 直接调用类方法/变量：class::attribute/function，无论是静态/非静态都可以。但是有前提条件：\r\n    A. 如果是变量，需要该变量可访问。\r\n    B. 如果是方法，除了该方法可访问外，还需要满足：\r\n        b1) 如果是静态方法，没有特殊条件；\r\n        b2) 如果是非静态方法，需要改方法中没有使用$this，即没有调用非静态的变量/方法，当然，调用静态的变量/方法没有问题。\r\n\r\n然后我们再看一下使用$object->... 和使用class::... 都有什么区别：\r\n1. 使用$object->... ，需要执行构造函数创建对象；\r\n2. 使用class::... 调用静态方法/变量，不需要执行构造函数创建对象；\r\n3. 使用class::... 调用非静态方法/变量，也不需要执行构造函数创建对象。\r\n\r\n然后奇怪的地方就出来了，既然2和3都一样，那静态方法/变量存在还有什么意义呢？\r\n差异还是显然存在的，如下：\r\n1. 静态变量\r\n静态成员只保留一个变量值，而这个变量值对所有的实例都是有效，也就是说，所有的实例共享这个成员。\r\n2. 静态方法\r\n静态方法可以直接使用class::... 来调用，而非静态方法需要满足一定限制条件才能使用class::.. 的方法调用，如之前所述。', '00', '2017-08-30 20:52:38', '127.0.0.1', 'face0.gif', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', null);
INSERT INTO `tb_bbs` VALUES ('13', '19', '普通主题', '随时回答你的问题', '如果你有什么问题或者疑问可随时发帖子给我，我会及时给您回复．', '00', '2013-08-05 10:43:03', '127.0.0.1', 'face0.gif', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', '0', '2013-08-05 10:43:03', null);
INSERT INTO `tb_bbs` VALUES ('15', '1', '普通主题', '测试发帖', '测试发帖内容。<font color=red>请输入要设置颜色的文字！</font>', 'java1234', '2013-08-05 11:10:54', '127.0.0.1', 'face0.gif', '2013-08-05 11:10:54', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('20', '1', '投票贴', '你平时喜欢使用的开发语言？', '5@124:JSP$21;C++$30;JAVA$35;PHP$17;Python$21;', 'tsoft', '2017-09-02 09:50:22', '127.1.0.1', 'face3.gif', '2017-09-02 09:50:22', '1', '2017-09-02 21:58:44', '0', null, null);
INSERT INTO `tb_bbs` VALUES ('22', '2', '普通主题', '推荐！国外程序员收集整理的 PHP 资源', '依赖管理\r\n\r\n依赖和包管理库\r\n\r\nComposer/Packagist：一个包和依赖管理器\r\nComposer Installers：一个多框架Composer库安装器\r\nPickle：一个PHP扩展安装器\r\n \r\n\r\n其他的依赖管理\r\n\r\n其他的相关依赖管理\r\n\r\nSatis：一个静态Composer存储库生成器\r\nComposition：一个在运行时检查Composer环境的库\r\nVersion：语义版本的解析和比较库\r\nNameSpacer -转化下划线到命名空间的库\r\nPatch Installer -使用Composer安装补丁的库\r\nComposer Checker -校验Composer配置的工具\r\n \r\n\r\n框架\r\n\r\nWeb开发框架\r\n\r\nSymfony2 -一个独立组件组成的框架\r\nZend Framework 2 -另一个由独立组件组成的框架\r\nLaravel 4 -另一个PHP框架\r\nAura PHP -独立组件的框架\r\nYii2 - 另一个PHP框架\r\nNette - 另一个由个体组件组成的框架\r\nPPI Framework 2 -一个互操作性框架\r\nPhalcon -通过C扩展实现的框架\r\n\r\n其他框架\r\n\r\n其他Web开发框架\r\n\r\nSymfony CMF - 创建自定义CMS的内容管理框架\r\nKnp RAD Bundle -Symfony 2的快速应用程序（RAD）包\r\n\r\n框架组件\r\n\r\n来自web开发框架的独立组件\r\n\r\nSymfony2 Components -Symfony2组件\r\nZend Framework 2 Components -ZF2组件\r\nAura Components -PHP5.4组件包\r\nHoa Project -另一个PHP组件包\r\n\r\n微型框架\r\n\r\n微型框架和路由\r\n\r\nSilex - 基于Symfony2组件的微型框架\r\nSlim - 另一个简单的微型框架\r\nBullet PHP -用于构建REST APIs的微型框架\r\nFast Route - 快速路由库\r\nPux -另一个快速路由库\r\n \r\n\r\n其他微型框架\r\n\r\n其他相关的微型框架和路由\r\n\r\nSilex Skeleton -Silex的项目架构\r\nSilex Web Profiler -Silex web调试工具条\r\nStack - Silex/Symfony的可堆叠中间件库\r\nSlim Skeleton -Slim架构\r\nSlim View -Slim的自定义视图集合\r\nSlim Middleware -Slim的自定义中间件集合\r\n\r\n模板\r\n\r\n模板化和词法分析的库和工具\r\n\r\nTwig -一个全面的模板语言\r\nTwig Cache Extension -一个用于Twig的模板片段缓存库\r\nMustache -一个Mustache模板语言的PHP实现\r\nPhly Mustache -另一个Mustache模板语言的PHP实现\r\nMtHaml - 一个HAML 模板语言的PHP实现\r\nPHPTAL -一个 TAL 模板语言的PHP实现\r\nPlates -一个原生PHP模板库\r\nLex -一个轻量级模板解析器\r\n\r\n静态站点生成器\r\n\r\n预处理工具来生成web页面的内容。\r\n\r\nSculpin -转换Markdown和Twig为静态HTML的工具\r\nPhrozn - 另一个转换Textile，Markdown和Twig为HTML的工具\r\n\r\nHTTP\r\n\r\n用于HTTP和网站爬取的库\r\n\r\nGuzzle -一个全面的HTTP客户端\r\nBuzz -另一个HTTP客户端\r\nRequests -一个简单的HTTP库\r\nHTTPFul -一个链式HTTP库\r\nGoutte -一个简单的web爬取器\r\nPHP VCR -录制和重放HTTP请求的库\r\n \r\n\r\nURL\r\n\r\n解析URL的库\r\n\r\nPurl -一个URL处理库\r\nPHP Domain Parser -一个本地前缀解析库\r\n \r\n\r\nEmail\r\n\r\n发送和解析邮件的库\r\n\r\nSwiftMailer - 一个邮件解决方案\r\nPHPMailer - 另一个邮件解决方案\r\nFetch -一个IMAP库\r\nEmail Reply Parser -一个邮件回复解析库\r\nStampie -邮件服务库，不如 SendGrid, PostMark, MailGun 和 Mandrill.\r\nCssToInlineStyles -一个在邮件模板内联CSS的库\r\n\r\n文件\r\n\r\n文件处理和MIME类型检测库\r\n\r\nGaufrette -一个文件系统抽象层\r\nFlysystem - 另一个文件系统抽象层\r\nCanal -一个检测互联网媒体类型的库\r\n PHP视频\r', 'java1234', '2017-09-02 10:26:22', '128.3.2.2', 'face0.gif', '2017-09-02 10:26:24', '1', '2017-09-02 10:51:01', '1', null, null);
INSERT INTO `tb_bbs` VALUES ('24', '3', '普通主题', 'ajax技术的背景', '不可否认，ajax技术的流行得益于google的大力推广，正是由于google earth、google suggest以及gmail等对ajax技术的广泛应用，催生了ajax的流行。而这也让微软感到无比的尴尬，因为早在97年，微软便已经发明了ajax中的关键技术，并且在99年IE5推出之时，它便开始支持XmlHttpRequest对象，并且微软之前已经开始在它的一些产品中应用ajax，比如说MSDN网站菜单中的一些应用。遗憾的是，不知道出于什么想法，当时微软发明了ajax的核心技术之后，并没有看到它的潜力而加以发展和推广，而是将它搁置起来。对于这一点来说，我个人是觉得非常奇怪的，因为以微软的资源和它的战略眼光来说，应该不会看不到ajax技术的前景，唯一的解释也许就是因为当时它的主要竞争对手Netscape的消失反而使它变得麻痹和迟钝，毕竟巨人也有打盹的时候，比如IBM曾经在对微软战略上的失误。正是这一次的失误，成就了它现在的竞争对手google在ajax方面的领先地位，而事实上google目前在ajax技术方面的领先是微软所无法达到的，这一点在后面我讲述ajax缺陷的时候也会提到。现在微软也意识到了这个问题，因此它也开始在ajax领域奋起直追，比如说推出它自己的ajax框架atlas，并且在.NET2.0也提供了一个用来实现异步回调的接口，即ICallBack接口。那么微软为什么对自己在ajax方面的落后如此紧张呢？现在就让我们来分析一下ajax技术后面隐藏的深刻意义', 'tsoft', '2017-09-02 10:55:19', '10.101.9.10', 'face0.gif', '2017-09-02 10:55:21', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('25', '4', '普通主题', 'oracle安装笔记', '对于不熟悉Oracle的程序员来说,安装oracle真是一件痛苦的事,难安装不说还会出现各种各样的BUG,令人措手不及,像我,由于公司需求需要用到oracle10g,但由于版本比较老,官网好像已经没有的下载了,不过百度搜还是可以搜的到的,但是下载好多个oracle10g64位的都无法安装成功,我也是在网上看别人的教程一步一步的来操作但是总是卡在输完口令之后下一步就会出现\"未知错误\"这里,又在网上找各种资料解决问题,很多都说把setup.exe的兼容性修改为 Windows XP (Service pack 3)并且以管理员身份运行该程序就可以了,可以我下载的oracle10g64位的没有Windows XP (Service pack 3)这个选项呀,如下图:', 'tsoft', '2017-09-02 12:45:01', '128.3.2.1', 'face11.gif', '2017-09-02 12:45:06', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('26', '1', '普通主题', 'java关于多线程安全', '什么样的类能叫多线程安全呢？在阅读hibernate或者mybatis相关资料的时候总能看到，sessionFactory类是多线程安全的。在查看了关于sessionFactory的源码过后，我的理解是，&nbsp;没有成员变量的类或者有成员变量但是成员变量的使用没有改变变量的值，这种类可以叫做多线程安全。比如SessionFactory类中有一个成员变量configration，但这个值一直没有改变。', 'bebeyo', '2017-09-03 09:45:04', '10.10.80.211', 'face0.gif', '2017-09-03 09:45:04', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('27', '1', '普通主题', 'JSP与JS的区别', 'JSP全名为Java&nbsp;Server&nbsp;Pages，其根本是一个简化的Servlet设计，他实现了Html语法中的Java扩张（以&nbsp;&lt;%,&nbsp;%&gt;形式）。JSP与Servlet一样，是在服务器端执行的。通常返回给客户端的就是一个HTML文本，因此客户端只要有浏览器就能浏览。Web服务器在遇到访问JSP网页的请求时，首先执行其中的程序段，然后将执行结果连同JSP文件中的HTML代码一起返回给客户端。插入的Java程序段可以操作数据库、重新定向网页等，以实现建立动态网页所需要的功能。<br>JSP页面由HTML代码和嵌入其中的Java代码所组成。服务器在页面被客户端请求以后对这些Java代码进行处理，然后将生成的HTML页面返回给客户端的浏览器。Java&nbsp;Servlet是JSP的技术基础，而且大型的Web应用程序的开发需要Java&nbsp;Servlet和JSP配合才能完成。JSP具备了Java技术的简单易用，完全的面向对象，具有平台无关性且安全可靠，主要面向因特网的所有特点。<br>jsp&nbsp;要先翻译，注意是翻译成servlet才能执行：<br>比如&nbsp;test.jsp&nbsp;要变成&nbsp;test_jsp.java&nbsp;然后编译成&nbsp;test_jsp.class<br>而&nbsp;test_jsp.java&nbsp;本身就是一个servlet.<br>所以&nbsp;jsp只是servlet的一个变种，方便书写html内容才出现的。<br>servlet是根本，所有jsp能做的，servlet全能做。<br>servlet的运行机制和Applet类似，只不过它运行在服务器端。一个servlet是javax.servlet包中HttpServlet类的子类。<br>JS是java&nbsp;Script&nbsp;的缩写，是一种基于对象的客户端脚本语言。主要目的是为了解决服务器端语言，比如Perl，遗留的速度问题，为客户提供更流畅的浏览效果。JS可以直接嵌入到html代码中进行解析执行，非常简单易学，可以产生很多动态的效果。', 'xiangzi', '2017-09-03 09:46:21', '10.10.80.216', 'face0.gif', '2017-09-03 09:46:21', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('28', '2', '普通主题', '使用PHP读取WORD中的图片并保存', '查了很多资料目前使用的方法如下：<br>$app&nbsp;=&nbsp;new&nbsp;COM(\"word.application\");<br>$filepath&nbsp;=&nbsp;\"C:\\\\Program&nbsp;Files\\\\AppServ\\\\www\\\\ReadWord\\\\tempword.doc\";<br>$doc&nbsp;=&nbsp;$app-&gt;Documents-&gt;Open($filepath);<br><br>$text&nbsp;=&nbsp;$doc-&gt;ActiveDocument-&gt;content-&gt;Text;<br><br>但是这是一个有图片的word，因此$text返回是乱码，想请问下如何才能单独读出图片，并保存至本地呢<br>还有，想按行读取word中的文字又该怎么办呢', 'bebeyo', '2017-09-03 09:54:26', '10.10.80.211', 'face0.gif', '2017-09-03 09:54:26', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('29', '3', '普通主题', '如何使用AJAX获取数据', '接口后台已经写好了，页面上有一个div和一个按钮，div中包含2个数据:金额和时间，请问如何用AJAX在点击按钮时调用后台的接口获取数据金额和时间，填进div中', 'bebeyo', '2017-09-03 09:57:58', '10.10.80.211', 'face0.gif', '2017-09-03 09:57:58', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('30', '17', '普通主题', 'SQL安装', 'MySQL&nbsp;Server&nbsp;5.0&nbsp;?C&nbsp;安装及配置<br>Author&nbsp;：&nbsp;Jeff&nbsp;&nbsp;&nbsp;2006-2-20<br>关键字：&nbsp;mysql&nbsp;配置<br>环境：Window&nbsp;XP&nbsp;Professional&nbsp;+&nbsp;SP2，&nbsp;MySQL&nbsp;Server&nbsp;5.0<br>&nbsp;<br>下载软件：<br>MySQL&nbsp;Server&nbsp;5.0.18&nbsp;http://dev.mysql.com/downloads/mysql/5.0.html<br>下载MySQL&nbsp;Server，并安装在本地机器上。<br>下面两个为Windows图形界面工具。<br>MySQL&nbsp;Query&nbsp;Browser&nbsp;1.1.20&nbsp;http://dev.mysql.com/downloads/query-browser/1.1.html<br>MySQL&nbsp;Control&nbsp;Center&nbsp;0.9.4&nbsp;http://mysql.easynet.be/Downloads/MySQLCC/mysqlcc-0.9.4-win32.zip', '翔子', '2017-09-03 09:59:45', '10.10.80.216', 'face0.gif', '2017-09-03 09:59:45', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('31', '16', '普通主题', 'CGI调用不了JS&nbsp;', '现象是这样的，我用c语言写的cgi程序，在head&nbsp;引入了JS的路径&nbsp;\"./settei.js\",&nbsp;此cgi文件名为&nbsp;haha.cgi&nbsp;在程序里面有个button，点击button的时候调用函数，&nbsp;此函数在JS文件中，但是当我在浏览器执行此cgi&nbsp;&nbsp;--&gt;http://localhost/cgi-bin/haha.cgi&nbsp;之后，画面出来了，但是点击button之后没有反应，<br>于是我右键把源source取出来&nbsp;拷贝到一个文办11.txt，然后改为11.html，之后双击11.html---&gt;点击button&nbsp;好使了，这是为什么啊？？', 'bebeyo', '2017-09-03 10:03:05', '10.10.80.211', 'face0.gif', '2017-09-03 10:03:05', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('32', '4', '普通主题', 'Oracle-SQL', '数据完整性约束&nbsp;<br>分类：1、域完整性约束（非空not&nbsp;null，检查check）&nbsp;<br>2、实体完整性约束（唯一unique，主键primary&nbsp;key）&nbsp;<br>3、参照完整性约束（外键foreign&nbsp;key）<br><br>约束类型：&nbsp;<br>主键约束（Primary&nbsp;Key）&nbsp;<br>唯一约束（Unique）&nbsp;<br>检查约束（Check）&nbsp;<br>非空约束（not&nbsp;null）&nbsp;<br>外键约束（Foreign&nbsp;Key）<br><br>三种完整性约束的区别：&nbsp;<br>域完整性约束：字段约束&nbsp;<br>实体完整性约束：行和行之间的约束&nbsp;<br>引用完整性约束：表和表之间的约束<br><br>约束从作用上分类，可以分成两大类：&nbsp;<br>表级约束：可以约束表中的任意一列或多列。可以定义除了Not&nbsp;Null以外的任何约束。&nbsp;<br>列级约束：只能约束其所在的某一列。可以定义任何约束。<br><br>', '翔子', '2017-09-03 10:03:11', '10.10.80.216', 'face2.gif', '2017-09-03 10:03:11', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('33', '4', '普通主题', 'oracle是否支持中文数据库名？', '我使用oracle自带的配置助手，新创建一个数据库时，数据库名为中文，SID为英文，发现创建不成功。<br>oracle数据库名能否为中文？', 'bebeyo', '2017-09-03 10:05:54', '10.10.80.211', 'face0.gif', '2017-09-03 10:05:54', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('34', '17', '普通主题', '我我我我哦我我哦我哦我我哦我哦我哦', '咀多的数字', '翔子', '2017-09-03 10:06:11', '10.10.80.216', 'face0.gif', '2017-09-03 10:06:11', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('35', '8', '普通主题', '如何测试一次连接的数据量呢？', '比如说一次http中req和res的大小。<br>通过抓包吗？还是.net里有现成的封装？', 'bebeyo', '2017-09-03 10:07:03', '10.10.80.211', 'face0.gif', '2017-09-03 10:07:03', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('36', '17', '普通主题', 'SQL无法自动截断事务日志', '数据库mdf文件4GB不到&nbsp;，日志文件100GB了，查询发现数据库恢复模式为完整，备份数据库没有自动截断事务日志，将恢复模式改为简单后重启数据库，再次备份数据库，还是没能截断事务日志，日志文件已用空间还是99%。', 'bebeyo', '2017-09-03 10:09:50', '10.10.80.211', 'face0.gif', '2017-09-03 10:09:50', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('37', '5', '普通主题', '数据库开发规范', '库表设计规范&nbsp;<br>Common&nbsp;<br>【强制】只能使用小写字母、下划线及数字，但不能以数字和下划线开头，禁止两个下划线中间只出现数字，使用见名知意的单词&nbsp;<br>【强制】禁止使用拼音！&nbsp;<br>【强制】禁用保留字，如desc、range、match、delayed等，参考本文的“MySQL保留字”&nbsp;<br>【强制】建表必须增加注释，包括：表级注释、字段级注释并保持更新&nbsp;<br>【推荐】库名与应用名称尽量一致。&nbsp;<br>Database&nbsp;<br>【强制】数据库名以db_开头&nbsp;<br>Table&nbsp;<br>【强制】表名称以t_开头，规范同数据库命名&nbsp;<br>【强制】表引擎使用InnoDB&nbsp;<br>【强制】所有表字符编码设置为UTF-8，如果需要存储emoj表情，需要使用UTF8mb4(mysql&nbsp;5.5.3以后支持)&nbsp;<br>【强制】禁止使用外键。说明：外键与级联更新适用于单机低并发，不适合分布式、高并发集群；级联更新是强阻塞，存在数据库更新风暴的风险；外键影响数据库的插入速度。&nbsp;<br>【强制】表名不使用复数名词。&nbsp;说明：表名应该仅仅表示表里面的实体内容，不应该表示实体数量，对应于DO类名也是单数形式，符合表达习惯&nbsp;<br>【强制】varchar是可变长字符串，不预先分配存储空间，长度不要超过5000，如果存储长度大于此值，定义字段类型为text，独立出来一张表，用主键来对应，避免影响其它字段索引效率&nbsp;<br>【强制】如果存储的字符串长度几乎相等，使用char定长字符串类型&nbsp;<br>【推荐】表的命名最好是加上“业务名称_表的作用”。&nbsp;正例：tiger_task&nbsp;/&nbsp;tiger_reader&nbsp;/&nbsp;mpp_config&nbsp;<br>【推荐】单表行数超过500万行或者单表容量超过2GB，才推荐进行分库分表。&nbsp;说明：如果预计三年后的数据量根本达不到这个级别，请不要在创建表时就分库分表。&nbsp;', '翔子', '2017-09-03 10:09:58', '10.10.80.216', 'face1.gif', '2017-09-03 10:09:58', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('38', '18', '普通主题', 'wmf文件转换问题', 'Datastore的saveas命令可以输出wmf图片，我想把这个输出的wmf图片转成jpg、bmp或者gif文件都可以，我在网上找了很久都没有找到，有谁可以分享一下？', 'bebeyo', '2017-09-03 10:10:42', '10.10.80.211', 'face0.gif', '2017-09-03 10:10:42', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('39', '5', '普通主题', '数据库开发基础', '一、编程简介<br>QtSql模块提供了与平台以及数据库种类无关的访问SQL数据库的接口，这个接口由利用Qt的模型视图结构将数据库与用户界面集成的一套类来支持。<br>QSqlDatabase代表数据库的关联。Qt使用驱动程序同各种数据库的接口进行通信。Qt4.8.6主要包括以下一些驱动程序：QDB2&nbsp;QIBASE&nbsp;QMYSQL&nbsp;QOCI&nbsp;QODBC&nbsp;QPSQL&nbsp;QSQLITE&nbsp;QSQLITE2&nbsp;QTDS，Qt的开源版本驱动通常需要自己进行编译，生成目录在插件目录下。<br><br>二、使用举例<br>1、关联数据库<br>三、数据库管理工具<br>数据库管理工具目前有很多，不同的数据库产品有自己专门的管理工具，同时也有向navicat这种可以访问不同数据库的产品，主要推荐还是使用数据库自带的命令工具，功能和性能方面都比较不错。', '翔子', '2017-09-03 10:11:13', '10.10.80.216', 'face17.gif', '2017-09-03 10:11:13', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('40', '6', '普通主题', 'ava多线程中时间片结束，会不会释放锁', 'java多线程中时间片结束，会不会释放锁，<br>求解答', 'bebeyo', '2017-09-03 10:12:29', '10.10.80.211', 'face0.gif', '2017-09-03 10:12:29', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('41', '6', '普通主题', 'Java内存区域', '在上述的五部分中，方法区和Java堆是所有线程共享的，而虚拟机栈、本地方法栈和程序计数器是线程隔离的，每个线程产生一个独立的区域<br><br>java堆&nbsp;<br>java堆是虚拟机内存创建的最大的一块内存区域，该内存区域由所有线程共享，在虚拟机启动的时候创建。&nbsp;<br>几乎所有的实例对象都在该区域存放（随着技术的发展，变得不再是绝对）&nbsp;<br>java堆是垃圾收集器管理的主要区域（回收，分配等细节后续再写）。&nbsp;<br>java堆可以是物理上不连续的内存区域，逻辑上是连续的即可。在创建的时候，可以是固<br>方法区无法满足内存分配需求时会抛出OutOfMemory异常。<br><br><br>虚拟机栈是线程私有的内存区域，其生命周期与线程的生命周期相同。&nbsp;<br>每个方法执行的时候都会创建一个栈帧，用来存放局部变量表、操作数栈、动态链接、方法出口等信息。栈中最主要的是局部变量表部分。&nbsp;<br>局部变量表存放了编译器可知的基本的数据类型（int、Boolean、double、float、byte、char、sho', '翔子', '2017-09-03 10:13:09', '10.10.80.216', 'face8.gif', '2017-09-03 10:13:09', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('42', '6', '普通主题', 'Java&nbsp;IO', 'IO流<br><br>流是一组有顺序的，有起点和终点的字节集合，是对数据传输的总称或抽象。<br><br>IO流用来处理设备之间的数据传输。<br><br>Java对数据的操作是通过流的方式。Java用于操作流的对象都在IO包中。<br><br><br><br>流按方向分为：输入流、输出流，输入流和输出流相对于内存设备而言的。<br><br>将外设中的数据读取到内存中：输入。<br>将内存的数写入到外设中：输出。<br><br>流按操作数据分为两种：字节流与字符流。<br><br>IO流<br><br>字节流的抽象基类：InputStream，OutputStream。<br><br>字符流的抽象基类：Reader，Writer。<br><br>由这四个类派生出来的子类名称都是以其父类名作为子类名的后缀。<br><br><br><br><br>字符流<br><br>字符流的由来<br><br>其实就是：字节流读取文字字节数据后，不直接操作而是先查指定的编码表，获取对应的文字。再对这个文字进行操作。<br><br>简单说：字节流+编码表。', '翔子', '2017-09-03 10:14:13', '10.10.80.216', 'face8.gif', '2017-09-03 10:14:13', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('43', '7', '普通主题', 'Redis和Mysql如何配合使用', '最近想研究下redis，网上也看到一些，但是大多只是提供方案，没有详细的代码实现。<br><br>想知道到底怎么实现的，也就是更新到Mysql的数据，如何同步到Redis。&nbsp;Redis挂掉了，如何继续通过Mysql获得结果。<br>Mysql和Redis怎么搭配使用，如何实现负载均衡。<br><br>基于Java实践最好。谢谢了。', 'bebeyo', '2017-09-03 10:15:25', '10.10.80.211', 'face0.gif', '2017-09-03 10:15:25', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('44', '9', '普通主题', 'this.close和this.hide', '之前做系统的时候关闭窗体都是用的this.closing，后来就发生一种情况，主窗体关闭了但是他的子程序还在，当时不知道怎么回事，后来觉得是close的原因，请问close和hide有什么区别呢？', 'bebeyo', '2017-09-03 10:16:10', '10.10.80.211', 'face0.gif', '2017-09-03 10:16:10', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('45', '7', '普通主题', '.NET开源是无奈，还是潮流？', '上周，微软宣布.NET开源，并把它扩展到Linux和Mac&nbsp;OS平台上面。此举受到那些曾经常怀疑微软意图的IT团体的热烈欢迎（好吧，我的好朋友Adrian&nbsp;Bridgwater是个例外，他暗示微软开源的举动只是为了巩固其统治世界的地位）。<br><br><br><br>根据ZDNet主编Mary&nbsp;Jo&nbsp;Foley的记录，微软从2014年4月开始的一系列举动中，.NET开源是最新的举动。那时微软宣布将开源数个开发技术，包括ASP.NET、Roslyn.NET编译器平台、.NET微框架、.NET&nbsp;Rx以及VB和C#程序语言。这些技术都可以通过一种新的方式创建.NET基础。Mary&nbsp;Jo&nbsp;Foley记录上提到，在这一新的举措里，微软在MIT开源许可证下面增加了更多.NET开源的列表，包括.NET通用语言库（CLR）、即时编译器、垃圾收集器和基类库。<br><br>但是.NET的开源对于世界而言意味着什么？外界对于微软.NET开源主要有六种看法。<br><br>让Windows成为世界的操作系统。自从2002年Windows奠定了基础以来，.NET就是Web服务器、服务导向架构以及云部署需要选择的框架。它是Java框架的主要竞争对手，随着它只能在Windows机器上运行这个约束的消失，那么将意味着全世界的工作都可在Windows上运行。<br>', '翔子', '2017-09-03 10:16:10', '10.10.80.216', 'face3.gif', '2017-09-03 10:16:10', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('46', '10', '普通主题', '获得线性表元素的操作小问题', 'status&nbsp;GetElem(SqList&nbsp;L,int&nbsp;i,ElemType&nbsp;*e)//获得元素的操作线性表L第i个数据的值，并用e返回<br>{<br>if(L.length==0||i&lt;1||L.length)<br>return&nbsp;ERROR;<br>*e=L.data<i-1>;//这句不太理解不应该是&nbsp;e=&amp;L.data<i-1>吗<br>return&nbsp;OK;<br>}<br>不要明白*e=L.data<i-1>这句话，不应该是&nbsp;e=&amp;L.data<i-1>吗？', 'bebeyo', '2017-09-03 10:17:13', '10.10.80.211', 'face0.gif', '2017-09-03 10:17:13', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('48', '12', '普通主题', '怎么查某个逻辑地址使用的是哪个段寄存器', '做一个搜索内存的程序，搜索0～2G内存的时候，比如说一个逻辑地址0x00450020，<br>我想查这个逻辑地址里数据的话，必须的得知道这个逻辑地址是使用哪个段的，<br>那怎么查这个逻辑地址使用的是那个段寄存器，以及这个段寄存器里的段选择符是多少呢？', 'bebeyo', '2017-09-03 10:18:15', '10.10.80.211', 'face0.gif', '2017-09-03 10:18:15', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('49', '10', '普通主题', '如何做一个牛逼C++程序员？', '这个题目的噱头太大，要真的写起来，&nbsp;足够写一本书了。<br><br>&nbsp;<br><br>本人是过来人，&nbsp;结合自身的体会和大家交流一下，希望新人能少走弯路。<br><br>&nbsp;<br><br>每个人的情况不一样，我下面的描述可能并不适合每一个看到这篇文章的人。<br><br>&nbsp;<br><br>一、C/C++语言<br><br>&nbsp;<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果你的基础很差，&nbsp;建议不要一开始就学C++语言，从C开始学起，对程序有个初步的认识，循序渐进。C语言的书嘛，先买一本&nbsp;300&nbsp;页以内的，把书中的每一个例子都通过键盘敲打进去到&nbsp;Visual&nbsp;studio里面去，然后单步执行，逐行调试去看各个变量的值。或者自行添加一些printf语句去输出变量的值。这样当你看完一本书后，&nbsp;你就有编写小程序的感觉了。<br><br>&nbsp;<br><br>记住，千万不要偷懒，不敲进去，自以为聪明，&nbsp;能看懂，&nbsp;或者直接从光盘复制。偷懒的代价是会花费更多的时间学习，最后还没有学会，给自己的自信心造成巨大打击，再也不想学程序了。<br><br>&nbsp;<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c语言看完一本书后，下来你就可以买一本C++的书看了。&nbsp;C++的书也是一样，&nbsp;必须300页以内的那种，不要一来就想学《C++&nbsp;Primer中文版》这样的好书，&nbsp;因为太厚了，怕你没有信心能够看完，即使你很有信心，花费一年的时间才看完，不值得。这种经典的厚的好书，&nbsp;适合作为资料查阅，不适合挨个细节都看。<br><br>&nbsp;<br><br>还是要提醒各位，一定要把书中的例子挨个敲打到电脑里面，&nbsp;单步执行。一定不要从光盘复制，&nbsp;一定要单步执行。<br><br>&nbsp;<br><br>经过两本书的磨练，&nbsp;估计你对C/C++肯定有比较深入的了解了，&nbsp;下来应该可以进入实战了。<br><br>', '翔子', '2017-09-03 10:18:21', '10.10.80.216', 'face14.gif', '2017-09-03 10:18:21', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('50', '12', '直播贴', '汇编语言8086笔记', '为什么要学习汇编语言？<br><br>　　汇编语言是很多相关课程的重要基础，比如：操作系统、接口技术等。它是底层编程语言，是计算机系统提供给用户最快最有效的语言，也是能对硬件直接编程的语言。因此，对空间和时间要求很高的程序，或需要直接控制硬件的程序，必须使用汇编语言进行程序设计。<br><br>程序员是个大江湖之我来自编译门<br>汇编语言的特点<br><br>面向机器的低级语言，与处理器密切相关。通常是为特定的计算机或计算机系列专门设计的。<br>保持了机器语言的优点，具有直接和简捷的特点。<br>可有效地访问、控制计算机的各种硬件设备,&nbsp;如磁盘、存储器、CPU、I/O端口等。<br>目标代码简短，占用内存少，执行速度快，是高效的程序设计语言。<br>经常与高级语言配合使用，应用十分广泛。<br>汇编语言的主要应用场合<br><br>要求执行效率高、反应快的领域，如：操作系统内核，实时系统等；<br>与硬件资源密切相关的软件开发，如：设备驱动程序等；<br>大型系统性能的瓶颈，或频繁被使用的子程序或程序段；高级绘图程序、视频游戏程序一般是用汇编语言编写的。<br>受存储容量限制的应用领域，如：家用电器的计算机控制功能等。', '翔子', '2017-09-03 10:19:49', '10.10.80.216', 'face10.gif', '2017-09-03 10:19:49', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('51', '13', '普通主题', 'usb&nbsp;块传输出现的问题', '我在linux&nbsp;下用&nbsp;USB进行块传输。大部分时间，我期望的数据大小&nbsp;&nbsp;是我收到的数据大小。但有时候出现我期望的数据不是我收到的数据大小。这是什么原因呢。<br>', 'bebeyo', '2017-09-03 10:19:59', '10.10.80.211', 'face0.gif', '2017-09-03 10:19:59', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('52', '14', '普通主题', '核心板电路的设计', '最近在做控制芯片的核心板电路的设计和布线。不过对于外围电路的电容电阻以及磁珠之类的选择和电路设计出了去参考别人的原理图，还可以怎么去判断和设计，通过芯片数据手册么，一般应该按什么样的思路去解决呢！求大神指点一二，一个在硬件道路上艰难奔跑的青年！！<br>', 'bebeyo', '2017-09-03 10:20:40', '10.10.80.211', 'face0.gif', '2017-09-03 10:20:40', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('53', '14', '直播贴', '硬件设计规范', '一、硬件设计原则：<br>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所有的设计依据来自于元器件SPEC，必须详细阅读各个元件的规格书并深入理解;<br>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;原理图与PCB图对应;<br>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;原理图与BOM对应，在有不同搭配的地方列表注明差异;<br>4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关键器件注明供应商，试产结束之后如果替代必须提供规格书，小批量试产验证才能大批量导入;<br>5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;使用标准封装库;<br>6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元器件选型及设计标准化;<br>7.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;线路设计和PCB&nbsp;Layout时要充分考虑EMC和安规要求，确保生产时100%过EMC.', '翔子', '2017-09-03 10:21:05', '10.10.80.216', 'face13.gif', '2017-09-03 10:21:05', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('54', '15', '普通主题', '目前wifi要看哪些协议？', '目前wifi要看哪些协议？如题～', 'bebeyo', '2017-09-03 10:21:35', '10.10.80.211', 'face0.gif', '2017-09-03 10:21:35', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('55', '19', '普通主题', '你妈让我问候你大爷', '你大爷说你妈挺好的。', '翔子', '2017-09-03 10:22:29', '10.10.80.216', 'face6.gif', '2017-09-03 10:22:29', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('56', '5', '普通主题', '如何测试对sdb功能选举测试', '1、测试sdb的选举功能&nbsp;<br>2、关掉主节点之后并没有主动选主,连入协调节点并创建连接var&nbsp;db&nbsp;=&nbsp;new&nbsp;Sdb(\"localhost\",11790)时报错没有主节点.&nbsp;<br>', 'bebeyo', '2017-09-03 10:22:43', '10.10.80.211', 'face0.gif', '2017-09-03 10:22:43', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('57', '20', '普通主题', '哦哦哦哦哦', '你听，多么美的声音！', '翔子', '2017-09-03 10:23:39', '10.10.80.216', 'face0.gif', '2017-09-03 10:23:39', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('58', '5', '普通主题', 'hbase+hive整合问题', '先说下我的理解，如上图所示，hbase做数据实时查询，hive做数据分析，数据从hbase或者hive端用相应的工具如sqoop从外部导入，虽然导入的数据都是存储在同一个hdfs上，但是导入的表数据在hive和hbase中是互相看不见的，因为它们各自维护了一套自己的映射规则。我的疑问是：现在有没有成熟的解决方案来整合hbase和hive，让它们互通，各自查询的表数据是同一份hdfs数据。现在网上有整合的案例，好像也只是让hive可以查询hbase，并没有做到真正的互通。', 'bebeyo', '2017-09-03 10:23:44', '10.10.80.211', 'face0.gif', '2017-09-03 10:23:44', '0', null, '0', null, null);
INSERT INTO `tb_bbs` VALUES ('59', '8', '普通主题', 'jsp好玩吗', 'jsp真的很好玩', '翔子', '2017-09-03 10:26:44', '10.10.80.216', 'face10.gif', '2017-09-03 10:26:44', '0', null, '0', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bbsanswer
-- ----------------------------
INSERT INTO `tb_bbsanswer` VALUES ('6', '2', 'yrtyyrtyrty', '<font color=blue>ytryrtytrytrytr</font>', '00', '2013-01-01 00:00:00', 'face0.gif');
INSERT INTO `tb_bbsanswer` VALUES ('7', '15', '测试回复', '测试回复', 'java1234', '2013-08-05 11:11:35', 'face0.gif');
INSERT INTO `tb_bbsanswer` VALUES ('8', '1', '策略模式', '策略', '翔子', '2017-09-03 10:26:02', 'face11.gif');

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
-- Table structure for `tb_forbidden_ip`
-- ----------------------------
DROP TABLE IF EXISTS `tb_forbidden_ip`;
CREATE TABLE `tb_forbidden_ip` (
  `forbidden_IP` varchar(255) NOT NULL,
  PRIMARY KEY (`forbidden_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_forbidden_ip
-- ----------------------------
INSERT INTO `tb_forbidden_ip` VALUES ('102.3.3.3');
INSERT INTO `tb_forbidden_ip` VALUES ('103.2.2.21');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

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
INSERT INTO `tb_user` VALUES ('30', 'beyoyo', '202cb962ac59075b964b07152d234b70', 'user0.gif', '男', '18815194702', '448759710', '448759710@qq.com', '新加坡', '0', '0');
INSERT INTO `tb_user` VALUES ('31', 'xiangzi', '0e0812de4c9dfab1fb10242043373ab0', 'user13.gif', '男', '15815815858', '123456789', '123456789@qq.com', '黑河', '0', '0');
INSERT INTO `tb_user` VALUES ('32', 'bebeyo', 'e10adc3949ba59abbe56e057f20f883e', 'user0.gif', '男', '17317899006', '448759710', '448759710@qq.com', '新加坡', '0', '0');
INSERT INTO `tb_user` VALUES ('33', '翔子', '0e0812de4c9dfab1fb10242043373ab0', 'user12.gif', '女', '13434565789', '2343453454', '238797382@qq.com', '北京', '0', '0');
INSERT INTO `tb_user` VALUES ('34', '周淮安', '670b14728ad9902aecba32e22fa4f6bd', 'user0.gif', '男', '18549875660', '448759710', '448759710@qq.com', '龙门', '0', '0');
INSERT INTO `tb_user` VALUES ('35', 'Divine', '827ccb0eea8a706c4c34a16891f84e7b', 'user4.gif', '男', '13905421342', '1234', '213141122@seu.edu.cn', '安徽', '0', '0');
