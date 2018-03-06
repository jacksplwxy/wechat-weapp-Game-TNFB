-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-01-23 15:20:54
-- 服务器版本： 5.7.18
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cAuth`
--

-- --------------------------------------------------------

--
-- 表的结构 `cSessionInfo`
--

CREATE TABLE `cSessionInfo` (
  `open_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `session_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_info` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会话管理用户信息';

-- --------------------------------------------------------

--
-- 表的结构 `friendsnetwork`
--

CREATE TABLE `friendsnetwork` (
  `id` int(11) NOT NULL,
  `openId` varchar(64) NOT NULL,
  `appId` varchar(32) NOT NULL,
  `fromOpenId` varchar(64) NOT NULL,
  `fromGId` varchar(64) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `question_detail`
--

CREATE TABLE `question_detail` (
  `id` int(11) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `ask` varchar(32) NOT NULL,
  `answer` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `question_detail`
--

INSERT INTO `question_detail` (`id`, `sort_id`, `ask`, `answer`) VALUES
(1, 8, '由百位明星共同演唱的奥运歌曲《北京欢迎你》的曲作者是谁？', '[{\"right\": false, \"answer\": \"李宇春\"}, {\"right\": false, \"answer\": \"那英\"}, {\"right\": false, \"answer\": \"孙燕姿\"}, {\"right\": true, \"answer\": \"小柯\"}]'),
(2, 8, '电视剧《情深深雨蒙蒙》中饰演“杜飞”的是哪位台湾男星？ ', '[{\"right\": true, \"answer\": \"苏有朋\"}, {\"right\": false, \"answer\": \"古巨基\"}, {\"right\": false, \"answer\": \"高鑫\"}, {\"right\": false, \"answer\": \"吴奇隆\"}]'),
(3, 8, '著名歌手陈奕迅的妻子是谁？', '[{\"right\": true, \"answer\": \"徐濠萦\"}, {\"right\": false, \"answer\": \"蒙嘉慧\"}, {\"right\": false, \"answer\": \"江蕙\"}, {\"right\": false, \"answer\": \"罗美薇\"}]'),
(4, 8, '韩剧《大长今》中饰演闵政浩，主演了《如果爱》的男星是谁？', '[{\"right\": true, \"answer\": \"池珍熙\"}, {\"right\": false, \"answer\": \"金贤重\"}, {\"right\": false, \"answer\": \"李准基\"}, {\"right\": false, \"answer\": \"李敏镐\"}]'),
(5, 8, '电影《铜雀台》中，苏有朋扮演的是谁？', '[{\"right\": false, \"answer\": \"曹操\"}, {\"right\": true, \"answer\": \"汉献帝\"}, {\"right\": false, \"answer\": \"许褚\"}, {\"right\": false, \"answer\": \"穆顺\"}]'),
(6, 8, '以《祝你平安》红遍大江南北的内地女歌手是谁？', '[{\"right\": false, \"answer\": \"孙燕姿\"}, {\"right\": false, \"answer\": \"毛阿敏\"}, {\"right\": false, \"answer\": \"刘若英\"}, {\"right\": true, \"answer\": \"孙悦\"}]'),
(7, 8, '执导了电影《二次曝光》的著名女导演是？', '[{\"right\": false, \"answer\": \"范冰冰\"}, {\"right\": false, \"answer\": \"马俪文\"}, {\"right\": true, \"answer\": \"李玉\"}, {\"right\": false, \"answer\": \"李少红\"}]'),
(8, 8, '歌词“东方之珠，我的爱人”中的东方之珠指的是哪个城市？ ', '[{\"right\": true, \"answer\": \"香港 \"}, {\"right\": false, \"answer\": \"深圳\"}, {\"right\": false, \"answer\": \"台湾\"}, {\"right\": false, \"answer\": \"广州\"}]'),
(9, 8, '周杰伦的MV《枫》和刘畊宏的哪首歌曲的mv共同组成了一个完整的故', '[{\"right\": false, \"answer\": \"《心痛心动》\"}, {\"right\": false, \"answer\": \"《十一月的肖邦》\"}, {\"right\": true, \"answer\": \"《彩虹天堂》\"}, {\"right\": false, \"answer\": \"《心灵交战》\"}]'),
(10, 8, '28年作为央视春节联欢晚会结尾曲的歌曲叫什么名字？', '[{\"right\": true, \"answer\": \"难忘今宵\"}, {\"right\": false, \"answer\": \"新年快乐歌\"}, {\"right\": false, \"answer\": \"同一首歌\"}, {\"right\": false, \"answer\": \"快乐就是这么简单\"}]'),
(11, 8, '新版《还珠格格》中饰演容嬷嬷的是？', '[{\"right\": false, \"answer\": \"赵丽颖\"}, {\"right\": false, \"answer\": \"海陆\"}, {\"right\": false, \"answer\": \"李晟\"}, {\"right\": true, \"answer\": \"方青卓\"}]'),
(12, 8, '“是我对你认识太少，还是我自己想的太多”这首《两个人的烟火》是香', '[{\"right\": false, \"answer\": \"周华健\"}, {\"right\": false, \"answer\": \"刘德华\"}, {\"right\": true, \"answer\": \"黎明\"}, {\"right\": false, \"answer\": \"张学友\"}]'),
(13, 8, '陈景润是被哪个数学家发掘并培养的？', '[{\"right\": false, \"answer\": \"丘成桐\"}, {\"right\": false, \"answer\": \"陈省身\"}, {\"right\": false, \"answer\": \"苏步青\"}, {\"right\": true, \"answer\": \"华罗庚\"}]'),
(14, 8, '越剧《十八相送》是描写了哪段古代爱情故事中的情节？', '[{\"right\": true, \"answer\": \"梁山伯与祝英台\"}, {\"right\": false, \"answer\": \"牛郎织女\"}, {\"right\": false, \"answer\": \"罗密欧与朱丽叶\"}, {\"right\": false, \"answer\": \"孟姜女哭长城\"}]'),
(15, 8, '吴承恩小说《西游记》当中，唐僧在哪条河收了沙和尚做徒弟？', '[{\"right\": true, \"answer\": \"流沙河\"}, {\"right\": false, \"answer\": \"黄河\"}, {\"right\": false, \"answer\": \"长江\"}, {\"right\": false, \"answer\": \"澜沧江\"}]'),
(16, 8, '代表作品有《家后》，被誉为“台语歌后”的是哪位台湾女歌手?', '[{\"right\": false, \"answer\": \"张悬\"}, {\"right\": false, \"answer\": \"王心凌\"}, {\"right\": false, \"answer\": \"张惠妹\"}, {\"right\": true, \"answer\": \"江蕙\"}]'),
(17, 8, '被称为“文艺复兴的摇篮”的是哪一座意大利城市？', '[{\"right\": false, \"answer\": \"罗马\"}, {\"right\": true, \"answer\": \"佛罗伦萨\"}, {\"right\": false, \"answer\": \"米兰\"}, {\"right\": false, \"answer\": \"那不勒斯\"}]'),
(18, 8, '被称为美国“石油大王”，标准石油公司的创立者是谁？', '[{\"right\": false, \"answer\": \"约翰逊\"}, {\"right\": false, \"answer\": \"威廉姆斯\"}, {\"right\": true, \"answer\": \"洛克菲勒\"}, {\"right\": false, \"answer\": \"布朗琼斯\"}]'),
(19, 8, '主演了《心灵捕手》《谍影重重》《十三罗汉》的是哪位好莱坞男星？', '[{\"right\": true, \"answer\": \"马特达蒙\"}, {\"right\": false, \"answer\": \"约翰尼德普\"}, {\"right\": false, \"answer\": \"莱昂纳多斯\"}, {\"right\": false, \"answer\": \"阿尔帕西诺\"}]'),
(20, 8, '电影《莫扎特传》中，莫扎特临终前写的最后一首曲子是什么？', '[{\"right\": false, \"answer\": \"生命交响曲\"}, {\"right\": false, \"answer\": \"命运交响曲\"}, {\"right\": true, \"answer\": \"安魂曲\"}, {\"right\": false, \"answer\": \"催眠曲\"}]'),
(21, 8, '白宫时美国总统的官邸，那么爱丽舍宫是哪个欧洲国家的总统的官邸？', '[{\"right\": false, \"answer\": \"爱尔兰\"}, {\"right\": false, \"answer\": \"英国\"}, {\"right\": true, \"answer\": \"法国\"}, {\"right\": false, \"answer\": \"比利时\"}]'),
(22, 8, '“跟我走吧，天亮就出发”这首《快乐老家》原唱是哪位内地女歌手？', '[{\"right\": false, \"answer\": \"孙悦\"}, {\"right\": false, \"answer\": \"周迅\"}, {\"right\": false, \"answer\": \"江蕙\"}, {\"right\": true, \"answer\": \"陈明\"}]'),
(23, 8, '近期上映的电影《太极1从零开始》、《太极2英雄崛起》的导演是谁？', '[{\"right\": false, \"answer\": \"谢晋\"}, {\"right\": true, \"answer\": \"冯德伦\"}, {\"right\": false, \"answer\": \"陈国星\"}, {\"right\": false, \"answer\": \"黄健中\"}]'),
(24, 8, '李安的电影《卧虎藏龙》是改编自哪位作家创作的同名小说？', '[{\"right\": false, \"answer\": \"袁腾飞\"}, {\"right\": false, \"answer\": \"张晓风\"}, {\"right\": true, \"answer\": \"王度卢\"}, {\"right\": false, \"answer\": \"林清玄\"}]'),
(25, 8, '主演了《野草闲花》《三个摩登女性》的是哪位有“民国四大美女”之称', '[{\"right\": false, \"answer\": \"张爱玲 \"}, {\"right\": false, \"answer\": \"林徽因\"}, {\"right\": true, \"answer\": \"陆小曼\"}, {\"right\": false, \"answer\": \"阮玲玉\"}]'),
(26, 8, '以下哪些是史蒂文 斯皮尔伯格的代表作?', '[{\"right\": true, \"answer\": \"侏罗纪公园\"}, {\"right\": false, \"answer\": \"星球大战\"}, {\"right\": false, \"answer\": \"变形金刚\"}, {\"right\": false, \"answer\": \"哈利波特\"}]'),
(27, 8, '电影 《钢铁侠》的扮演者是下面哪一位演员?', '[{\"right\": false, \"answer\": \"汤姆克鲁斯\"}, {\"right\": true, \"answer\": \"小罗伯特汤尼\"}, {\"right\": false, \"answer\": \"布拉德皮特\"}, {\"right\": false, \"answer\": \"罗伯特唐尼\"}]'),
(28, 8, '电影《投名状》改编自清末四大奇案之一，请问是哪个奇案？', '[{\"right\": false, \"answer\": \"杨乃武与小白菜案\"}, {\"right\": false, \"answer\": \"名伶杨月楼冤案\"}, {\"right\": true, \"answer\": \"太原奇案\"}, {\"right\": false, \"answer\": \"张文祥刺马案\"}]'),
(29, 8, '获得第五十九届奥斯卡最佳原著剧本奖，执导《汉娜姐妹》的鬼才导演是', '[{\"right\": true, \"answer\": \"伍迪艾伦\"}, {\"right\": false, \"answer\": \"李安\"}, {\"right\": false, \"answer\": \"奥地利\"}, {\"right\": false, \"answer\": \"4雪莉贝西\"}]'),
(30, 8, '美国第一位由影坛跨入政坛的总统是谁？', '[{\"right\": true, \"answer\": \"里根\"}, {\"right\": false, \"answer\": \"奥巴马\"}, {\"right\": false, \"answer\": \"布什\"}, {\"right\": false, \"answer\": \"福布斯\"}]'),
(31, 8, '莫文蔚和周迅均重新演绎的歌曲《外面的世界》翻唱了哪位台湾男歌手的', '[{\"right\": false, \"answer\": \"张学友\"}, {\"right\": false, \"answer\": \"周华健\"}, {\"right\": false, \"answer\": \"黎明\"}, {\"right\": true, \"answer\": \"H齐秦\"}]'),
(32, 8, '与包拯齐名，因其两袖清风，刚正不阿而被后人称为“海清天”的明朝功', '[{\"right\": false, \"answer\": \"李善长\"}, {\"right\": false, \"answer\": \"刘伯温\"}, {\"right\": true, \"answer\": \"海瑞\"}, {\"right\": false, \"answer\": \"朱家雄\"}]'),
(33, 8, '古代文学理论著作《文心雕龙》是哪位南朝文学理论家的著作？', '[{\"right\": false, \"answer\": \"萧统\"}, {\"right\": false, \"answer\": \"沈约\"}, {\"right\": false, \"answer\": \"谢眺\"}, {\"right\": true, \"answer\": \"刘勰\"}]'),
(34, 8, '香港组合Twins的粤语歌曲《下一站天后》的国语版歌名是什么？', '[{\"right\": false, \"answer\": \"下一站天后\"}, {\"right\": false, \"answer\": \"死性不改\"}, {\"right\": true, \"answer\": \"莫斯科没有眼泪\"}, {\"right\": false, \"answer\": \"星光游乐园\"}]'),
(35, 8, '电影《朗读者》《革命之路》中担任主演的英国籍著名女演员是谁？', '[{\"right\": false, \"answer\": \"奥黛丽赫本\"}, {\"right\": false, \"answer\": \"艾玛沃特森\"}, {\"right\": false, \"answer\": \"凯瑟琳\"}, {\"right\": true, \"answer\": \"凯特温斯莱特\"}]'),
(36, 3, '欧洲最高峰?', '[{\"right\": true, \"answer\": \"厄尔布鲁士山\"}, {\"right\": false, \"answer\": \"夏蒙尼?勃朗峰\"}, {\"right\": false, \"answer\": \"少女峰\"}, {\"right\": false, \"answer\": \"乞力马扎罗山\"}]'),
(37, 3, '世界最大的半岛?', '[{\"right\": false, \"answer\": \"朝鲜半岛\"}, {\"right\": true, \"answer\": \"阿拉伯半岛\"}, {\"right\": false, \"answer\": \"印度半岛\"}, {\"right\": false, \"answer\": \"索马里半岛\"}]'),
(38, 7, '古诗“会当凌绝顶，一览重山小”说的是我国著名的哪一座山?', '[{\"right\": true, \"answer\": \"泰山\"}, {\"right\": false, \"answer\": \"黄山\"}, {\"right\": false, \"answer\": \"庐山\"}, {\"right\": false, \"answer\": \"华山\"}]'),
(39, 3, '世界上面积最大的平原是?', '[{\"right\": false, \"answer\": \"东欧平原\"}, {\"right\": false, \"answer\": \"西西伯利亚平原\"}, {\"right\": true, \"answer\": \"亚马孙平原\"}, {\"right\": false, \"answer\": \"密西西比河平原\"}]'),
(40, 3, '世界平均海拔最低的国家是?', '[{\"right\": true, \"answer\": \"荷兰\"}, {\"right\": false, \"answer\": \"巴西\"}, {\"right\": false, \"answer\": \"哈萨克斯坦 \"}, {\"right\": false, \"answer\": \"巴里\"}]'),
(41, 3, '目前观测到的距地球最近的一颗恒星位于?', '[{\"right\": false, \"answer\": \"织女座\"}, {\"right\": false, \"answer\": \"仙女座\"}, {\"right\": true, \"answer\": \"半人马座\"}, {\"right\": false, \"answer\": \"大熊座\"}]'),
(42, 3, '亚洲最大的半岛是?', '[{\"right\": false, \"answer\": \"中南半岛 \"}, {\"right\": false, \"answer\": \"辽东半岛\"}, {\"right\": true, \"answer\": \"阿拉伯半岛\"}, {\"right\": false, \"answer\": \"印度半岛\"}]'),
(43, 3, '“三北”防护林体系不包括的省区有?', '[{\"right\": false, \"answer\": \"黑龙江 \"}, {\"right\": false, \"answer\": \"山西\"}, {\"right\": true, \"answer\": \"河南\"}, {\"right\": false, \"answer\": \"青海\"}]'),
(44, 3, '下列人种的分布中，纯属人口迁移造成的是?', '[{\"right\": false, \"answer\": \"非洲白色人种 \"}, {\"right\": false, \"answer\": \"澳洲棕色人种\"}, {\"right\": false, \"answer\": \"亚洲白色人种\"}, {\"right\": true, \"answer\": \"美洲黑色人种\"}]'),
(45, 2, '黄金与其它金属混合可以制成五颜六色的色金首饰，当黄金与铜按比例混', '[{\"right\": false, \"answer\": \"赤色金\"}, {\"right\": false, \"answer\": \"褐色金\"}, {\"right\": true, \"answer\": \"红色金\"}, {\"right\": false, \"answer\": \"黄色金\"}]'),
(46, 11, '长期使用铝制品作为食品容器会引发下列哪种疾病?', '[{\"right\": true, \"answer\": \"老年痴呆症\"}, {\"right\": false, \"answer\": \"甲状腺肿大\"}, {\"right\": false, \"answer\": \"肠胃疾病\"}, {\"right\": false, \"answer\": \"癌症\"}]'),
(47, 11, '绿色蔬菜营养营养丰富，下列不属于绿色蔬菜所含营养物质的为?', '[{\"right\": true, \"answer\": \"钙质\"}, {\"right\": false, \"answer\": \"叶酸\"}, {\"right\": false, \"answer\": \"维生素\"}, {\"right\": false, \"answer\": \"维生素1\"}]'),
(48, 11, '夏天被蚊虫的叮咬时，用可以迅速止痒。', '[{\"right\": false, \"answer\": \"盐\"}, {\"right\": false, \"answer\": \"醋\"}, {\"right\": false, \"answer\": \"酱油\"}, {\"right\": true, \"answer\": \"浓肥皂\"}]'),
(49, 2, '下列不属于混合物的是', '[{\"right\": false, \"answer\": \"碘酒\"}, {\"right\": true, \"answer\": \"冰水混合物(H2O)\"}, {\"right\": false, \"answer\": \"清新的空气\"}, {\"right\": false, \"answer\": \"糖水\"}]'),
(50, 2, '下列各组物质中，前者是纯净物，后者是混合物的是?', '[{\"right\": false, \"answer\": \"糖水，白酒\"}, {\"right\": false, \"answer\": \"铁矿石，氧气\"}, {\"right\": true, \"answer\": \"冰水混合物，盐水\"}, {\"right\": false, \"answer\": \"氮气，氧气\"}]'),
(51, 2, '下列物质属于纯净物的是?', '[{\"right\": false, \"answer\": \"玻璃 \"}, {\"right\": true, \"answer\": \"蒸馏水\"}, {\"right\": false, \"answer\": \"漂白粉\"}, {\"right\": false, \"answer\": \"空气\"}]'),
(52, 4, '东汉末年汉献帝名为?', '[{\"right\": false, \"answer\": \"刘邦\"}, {\"right\": true, \"answer\": \"刘协\"}, {\"right\": false, \"answer\": \"刘表\"}, {\"right\": false, \"answer\": \"刘宏\"}]'),
(53, 4, '1915年由陈独秀创办的，成为“新文化运动”主阵地的刊物是?', '[{\"right\": true, \"answer\": \"《新青年》\"}, {\"right\": false, \"answer\": \"《红旗杂志》\"}, {\"right\": false, \"answer\": \"《创造月刊》\"}, {\"right\": false, \"answer\": \"《新民日报》\"}]'),
(54, 4, '后世尊称的“药王”是？', '[{\"right\": false, \"answer\": \"华佗\"}, {\"right\": true, \"answer\": \"孙思邈\"}, {\"right\": false, \"answer\": \"李时珍\"}, {\"right\": false, \"answer\": \"扁鹊\"}]'),
(55, 4, '历史上推翻西晋王朝的少数民族是？', '[{\"right\": true, \"answer\": \"匈奴\"}, {\"right\": false, \"answer\": \"鲜卑\"}, {\"right\": false, \"answer\": \"羌族\"}, {\"right\": false, \"answer\": \"契丹\"}]'),
(56, 4, '澳门回归的日期是？', '[{\"right\": false, \"answer\": \"1998.7.1\"}, {\"right\": false, \"answer\": \"1997.7.1\"}, {\"right\": false, \"answer\": \"1998.12.20\"}, {\"right\": true, \"answer\": \"1999.12.20\"}]'),
(57, 4, '四大名亭中的陶然亭是因为谁的诗句得名的？', '[{\"right\": false, \"answer\": \"欧阳修\"}, {\"right\": true, \"answer\": \"白居易\"}, {\"right\": false, \"answer\": \"陶渊明\"}, {\"right\": false, \"answer\": \"杜牧\"}]'),
(58, 8, '2014年第九届中国作家富豪榜排名第一的是?', '[{\"right\": true, \"answer\": \"张嘉佳\"}, {\"right\": false, \"answer\": \"郭敬明\"}, {\"right\": false, \"answer\": \"刘同\"}, {\"right\": false, \"answer\": \"南派三叔\"}]'),
(59, 4, '名著《三国演义》中，曹操中了周瑜的反间计，杀了张允和哪位水军大将', '[{\"right\": false, \"answer\": \"夏侯惇\"}, {\"right\": false, \"answer\": \"张辽\"}, {\"right\": false, \"answer\": \"乐进\"}, {\"right\": true, \"answer\": \"蔡瑁\"}]'),
(60, 4, '与西施有“浣纱双姝”之称，和西施一起送吴国的美女是谁?', '[{\"right\": true, \"answer\": \"郑旦\"}, {\"right\": false, \"answer\": \"施夷光\"}, {\"right\": false, \"answer\": \"越女\"}, {\"right\": false, \"answer\": \"嬴弄玉\"}]'),
(61, 4, '创立了解析几何学的是哪位法国数学家?', '[{\"right\": true, \"answer\": \"笛卡尔\"}, {\"right\": false, \"answer\": \"韦达\"}, {\"right\": false, \"answer\": \"帕斯卡\"}, {\"right\": false, \"answer\": \"嘉当\"}]'),
(62, 4, '科举制开始于哪个朝代?', '[{\"right\": false, \"answer\": \"唐朝\"}, {\"right\": true, \"answer\": \"隋朝\"}, {\"right\": false, \"answer\": \"宋朝\"}, {\"right\": false, \"answer\": \"元朝\"}]'),
(63, 4, '京杭大运河是哪个皇帝在位时修建的', '[{\"right\": false, \"answer\": \"隋文帝\"}, {\"right\": false, \"answer\": \"李世民\"}, {\"right\": true, \"answer\": \"隋炀帝\"}, {\"right\": false, \"answer\": \"李渊\"}]'),
(64, 4, '《西游记》作者吴承恩是哪个朝代人？', '[{\"right\": true, \"answer\": \"明\"}, {\"right\": false, \"answer\": \"唐\"}, {\"right\": false, \"answer\": \"宋\"}, {\"right\": false, \"answer\": \"元\"}]'),
(65, 4, '中国沦为半殖民地半封建社会的开端是？', '[{\"right\": true, \"answer\": \"鸦片战争\"}, {\"right\": false, \"answer\": \"第二次鸦片战争\"}, {\"right\": false, \"answer\": \"甲午战争\"}, {\"right\": false, \"answer\": \"八国联军侵华战争\"}]'),
(66, 4, '齐国在齐桓公统治时期国力强盛，主要是因为重用了一位贤相，他就是?', '[{\"right\": true, \"answer\": \"管仲 \"}, {\"right\": false, \"answer\": \"李斯 \"}, {\"right\": false, \"answer\": \"魏征 \"}, {\"right\": false, \"answer\": \"诸葛亮\"}]'),
(67, 11, '蟑螂，也就是我们俗称的小强，它的头被切掉后还可以存活多长时间?', '[{\"right\": false, \"answer\": \"5-10分钟\"}, {\"right\": false, \"answer\": \"1-3小时\"}, {\"right\": false, \"answer\": \"6-10天\"}, {\"right\": true, \"answer\": \"1个星期左右\"}]'),
(68, 6, '下列植物的结构不属于叶的是?', '[{\"right\": false, \"answer\": \"仙人掌的刺\"}, {\"right\": true, \"answer\": \"我们吃的洋葱\"}, {\"right\": false, \"answer\": \"大豆的子叶\"}, {\"right\": false, \"answer\": \"竹叶\"}]'),
(69, 6, '下列动物中，属于鱼类的是?', '[{\"right\": false, \"answer\": \"甲鱼\"}, {\"right\": true, \"answer\": \"鳝鱼\"}, {\"right\": false, \"answer\": \"鲸鱼\"}, {\"right\": false, \"answer\": \"娃娃鱼\"}]'),
(70, 6, '世界上最小的鸟是', '[{\"right\": true, \"answer\": \"蜂鸟\"}, {\"right\": false, \"answer\": \"麻雀\"}, {\"right\": false, \"answer\": \"燕子\"}, {\"right\": false, \"answer\": \"海鸥\"}]'),
(71, 6, '古人有“拼死吃河豚”一说，河豚的毒素主要在那个部分?', '[{\"right\": false, \"answer\": \"肌肉\"}, {\"right\": false, \"answer\": \"大脑\"}, {\"right\": false, \"answer\": \"皮肤\"}, {\"right\": true, \"answer\": \"肝脏\"}]'),
(72, 5, '欧洲足球五大联赛正式比赛中历史进球数最多的人是？', '[{\"right\": false, \"answer\": \"德尔?皮耶罗\"}, {\"right\": false, \"answer\": \"劳尔\"}, {\"right\": false, \"answer\": \"亨利\"}, {\"right\": true, \"answer\": \"盖德?穆勒\"}]'),
(73, 5, '历史上唯一在欧洲足球五大联赛都效力过的球员是', '[{\"right\": true, \"answer\": \"拉杜乔尤\"}, {\"right\": false, \"answer\": \"沙维尔\"}, {\"right\": false, \"answer\": \"伊布拉希莫维奇 \"}, {\"right\": false, \"answer\": \"海因策\"}]'),
(74, 5, '第一个进军欧洲五大联赛的中国足球运动员是？', '[{\"right\": true, \"answer\": \"杨晨\"}, {\"right\": false, \"answer\": \"孙祥\"}, {\"right\": false, \"answer\": \"孙继海\"}, {\"right\": false, \"answer\": \"范志毅\"}]'),
(75, 5, '于1997-1998赛季创造了以“升班马”的姿态勇夺德甲联赛冠军', '[{\"right\": true, \"answer\": \"凯泽斯劳滕\"}, {\"right\": false, \"answer\": \"摩纳哥 \"}, {\"right\": false, \"answer\": \"诺丁汉森林\"}, {\"right\": false, \"answer\": \"阿贾克斯\"}]'),
(76, 5, '在NFL历史上获得超级碗冠军数最多的队伍是？', '[{\"right\": false, \"answer\": \"巴尔的摩乌鸦\"}, {\"right\": false, \"answer\": \"丹佛野马\"}, {\"right\": false, \"answer\": \"新英格兰爱国者 \"}, {\"right\": true, \"answer\": \"匹兹堡钢人\"}]'),
(77, 4, '提出著名的韦达公式的数学家韦达，是哪国人？', '[{\"right\": false, \"answer\": \"英国\"}, {\"right\": true, \"answer\": \"法国\"}, {\"right\": false, \"answer\": \"德国\"}, {\"right\": false, \"answer\": \"俄国\"}]'),
(78, 4, '伟大的文学家、革命家鲁迅先生逝世于哪一年？', '[{\"right\": true, \"answer\": \"1936\"}, {\"right\": false, \"answer\": \"1937\"}, {\"right\": false, \"answer\": \"1938\"}, {\"right\": false, \"answer\": \"1939\"}]'),
(79, 8, '好莱坞大片《云图》中，饰演“星美451”的韩国女星是谁?', '[{\"right\": false, \"answer\": \"金妍儿\"}, {\"right\": false, \"answer\": \"朴敏英\"}, {\"right\": true, \"answer\": \"裴斗娜\"}, {\"right\": false, \"answer\": \"韩胜妍\"}]'),
(80, 4, '创立了解析几何学的是哪位法国数学家?', '[{\"right\": true, \"answer\": \"笛卡尔\"}, {\"right\": false, \"answer\": \"韦达\"}, {\"right\": false, \"answer\": \"帕斯卡\"}, {\"right\": false, \"answer\": \"嘉当\"}]'),
(81, 11, '下列哪些蚊子会吸人的血?', '[{\"right\": false, \"answer\": \"雄蚊\"}, {\"right\": true, \"answer\": \"雌蚊\"}, {\"right\": false, \"answer\": \"幼蚊\"}, {\"right\": false, \"answer\": \"所有蚊子\"}]'),
(82, 7, '作品结局“意料之外，情理之中”是评价下列哪位作家的作品？', '[{\"right\": false, \"answer\": \"莫泊桑\"}, {\"right\": false, \"answer\": \"契诃夫\"}, {\"right\": false, \"answer\": \"福楼拜\"}, {\"right\": true, \"answer\": \"欧?亨利\"}]'),
(83, 7, '文学界有“通俗小说之王”美誉的是？', '[{\"right\": false, \"answer\": \"海明威 \"}, {\"right\": false, \"answer\": \"契诃夫\"}, {\"right\": true, \"answer\": \"大仲马(改为亚历山大.仲马) \"}, {\"right\": false, \"answer\": \"小仲马\"}]'),
(84, 7, '以下不是现代奇幻文学之父托尔金的著作的是？', '[{\"right\": false, \"answer\": \"《魔戒》\"}, {\"right\": true, \"answer\": \"《冰与火之歌》\"}, {\"right\": false, \"answer\": \"《霍比特人》\"}, {\"right\": false, \"answer\": \"《精灵宝钻》\"}]'),
(85, 7, '以下不是西方奇幻三巨头的作品是？', '[{\"right\": false, \"answer\": \"《时光之轮》\"}, {\"right\": false, \"answer\": \"《魔戒》\"}, {\"right\": false, \"answer\": \"《冰与火之歌》\"}, {\"right\": true, \"answer\": \"《地海传奇》\"}]'),
(86, 2, '用手电筒同时斜射在一面镜子和一张灰色纸上，观察发现？', '[{\"right\": false, \"answer\": \"镜子亮\"}, {\"right\": true, \"answer\": \"灰纸亮\"}, {\"right\": false, \"answer\": \"一样亮\"}, {\"right\": false, \"answer\": \"不一定\"}]'),
(87, 2, '一朵花放在夹角为60°两面镜子中间，从镜子里可以看到？', '[{\"right\": false, \"answer\": \"2朵\"}, {\"right\": false, \"answer\": \"4朵\"}, {\"right\": true, \"answer\": \"5朵\"}, {\"right\": false, \"answer\": \"8朵\"}]'),
(88, 2, '彩色电视荧光屏上的彩色是3种光合成的？', '[{\"right\": false, \"answer\": \"蓝、黄、绿\"}, {\"right\": false, \"answer\": \" 红、黄、绿\"}, {\"right\": false, \"answer\": \"红、黄、蓝\"}, {\"right\": true, \"answer\": \"红、绿、蓝\"}]'),
(89, 2, '黄昏时，太阳呈红色，是因为黄昏时？', '[{\"right\": false, \"answer\": \"太阳发出较多的红光\"}, {\"right\": true, \"answer\": \"阳光经过空气的路途较长\"}, {\"right\": false, \"answer\": \"太阳距地球较近\"}, {\"right\": false, \"answer\": \"太阳距地球较远\"}]'),
(90, 2, '物体做曲线运动时，一定变化的物理量是？', '[{\"right\": false, \"answer\": \"速率\"}, {\"right\": true, \"answer\": \"速度\"}, {\"right\": false, \"answer\": \"加速度\"}, {\"right\": false, \"answer\": \"合外力\"}]'),
(91, 2, '想从镜子里看到放大的像应该使用？', '[{\"right\": false, \"answer\": \"凸面镜\"}, {\"right\": true, \"answer\": \"凹面镜\"}, {\"right\": false, \"answer\": \"平面镜\"}, {\"right\": false, \"answer\": \"透视镜\"}]'),
(92, 2, '南极海洋上的浮冰的味道是？', '[{\"right\": true, \"answer\": \"淡的\"}, {\"right\": false, \"answer\": \"和海水一样咸\"}, {\"right\": false, \"answer\": \"比海水咸\"}, {\"right\": false, \"answer\": \"苦的\"}]'),
(93, 2, '一定量的理想气体，在等压过程中对外做功200J，若此气体是刚性双', '[{\"right\": false, \"answer\": \"500J\"}, {\"right\": true, \"answer\": \"700J\"}, {\"right\": false, \"answer\": \"900J\"}, {\"right\": false, \"answer\": \"1100J\"}]'),
(94, 2, '大气臭氧层的主要作用？', '[{\"right\": false, \"answer\": \"有助于杀菌\"}, {\"right\": false, \"answer\": \"反射电磁波 \"}, {\"right\": true, \"answer\": \"吸收阳光中的紫外线 \"}, {\"right\": false, \"answer\": \"好看\"}]'),
(95, 2, '冬天下雪后，为了融雪要在马路上撒盐因为？', '[{\"right\": false, \"answer\": \"盐和冰混合后熔点提高 \"}, {\"right\": true, \"answer\": \"盐和冰混合后熔点降低\"}, {\"right\": false, \"answer\": \"盐和冰发生化学反应 \"}, {\"right\": false, \"answer\": \"防止有人吃雪\"}]'),
(96, 2, '鞋底、轮胎上都有凹凸不平的花纹，这主要是为？', '[{\"right\": false, \"answer\": \"增大受力面积，减少压强 \"}, {\"right\": false, \"answer\": \"减少受力面积，增大压强\"}, {\"right\": true, \"answer\": \"使接触面粗糙，增大摩擦 \"}, {\"right\": false, \"answer\": \"增强产品的美观\"}]'),
(97, 11, '请问以下哪种乐器属于铜管乐器？', '[{\"right\": false, \"answer\": \"大提琴\"}, {\"right\": false, \"answer\": \"黑管\"}, {\"right\": false, \"answer\": \"大号 \"}, {\"right\": true, \"answer\": \"萨克斯\"}]'),
(98, 7, '在《美育书简》中谁提出了“游戏说”?', '[{\"right\": false, \"answer\": \"席勒 \"}, {\"right\": false, \"answer\": \"亚里士多德 \"}, {\"right\": true, \"answer\": \"柏拉图 \"}, {\"right\": false, \"answer\": \"歌德\"}]'),
(99, 7, '以下属于古典音乐时期的音乐作品是？', '[{\"right\": true, \"answer\": \"《四季》\"}, {\"right\": false, \"answer\": \"《月光奏鸣曲》\"}, {\"right\": false, \"answer\": \"《十二钢琴平均律》\"}, {\"right\": false, \"answer\": \"《哈利路亚》\"}]'),
(100, 7, '威尔第一生创作了大量的音乐作品，其中以歌剧作品最为著名，下面哪部', '[{\"right\": false, \"answer\": \"《奥赛罗》\"}, {\"right\": false, \"answer\": \"《游吟诗人》\"}, {\"right\": false, \"answer\": \"《阿依达》\"}, {\"right\": true, \"answer\": \"《梦游女》\"}]'),
(101, 8, '《流星花园》是由哪个组合主演的？', '[{\"right\": false, \"answer\": \"加油男孩\"}, {\"right\": false, \"answer\": \"飞轮海\"}, {\"right\": true, \"answer\": \"F4\"}, {\"right\": false, \"answer\": \"S.H.E\"}]'),
(102, 8, '被称为“包子”的小龙女饰演者是？', '[{\"right\": false, \"answer\": \"赵丽颖\"}, {\"right\": false, \"answer\": \"刘亦菲\"}, {\"right\": false, \"answer\": \"林心如\"}, {\"right\": true, \"answer\": \"陈妍希\"}]'),
(103, 8, '每年春晚结尾曲的曲名是？', '[{\"right\": true, \"answer\": \"难忘今宵\"}, {\"right\": false, \"answer\": \"双截棍\"}, {\"right\": false, \"answer\": \"匆匆那年\"}, {\"right\": false, \"answer\": \"因为爱情\"}]'),
(104, 8, '陈奕迅毕业于哪一所大学？', '[{\"right\": false, \"answer\": \" 香港科技大学\"}, {\"right\": false, \"answer\": \" 香港中文大学\"}, {\"right\": true, \"answer\": \"英国金斯顿大学\"}, {\"right\": false, \"answer\": \"英国皇家音乐学院\"}]'),
(105, 8, '粉丝一般称张国荣为什么? ', '[{\"right\": false, \"answer\": \"荣哥\"}, {\"right\": true, \"answer\": \"哥哥\"}, {\"right\": false, \"answer\": \"大哥\"}, {\"right\": false, \"answer\": \"荣荣\"}]'),
(106, 8, '邓超的妻子是？', '[{\"right\": true, \"answer\": \"孙俪 \"}, {\"right\": false, \"answer\": \"文章\"}, {\"right\": false, \"answer\": \"郑凯\"}, {\"right\": false, \"answer\": \"陈赫\"}]'),
(107, 8, ' 黄晓明的出生地是？', '[{\"right\": false, \"answer\": \"北京\"}, {\"right\": false, \"answer\": \" 福建\"}, {\"right\": false, \"answer\": \"上海\"}, {\"right\": true, \"answer\": \"山东\"}]'),
(108, 4, '康有为的维新思想吸收了西方资本主义政治学说的内容其中最主要的是？', '[{\"right\": false, \"answer\": \"民主共和思想\"}, {\"right\": false, \"answer\": \"三权分立学说\"}, {\"right\": true, \"answer\": \"君主立宪思想\"}, {\"right\": false, \"answer\": \"人文主义思想\"}]'),
(109, 4, '中国人民政治协商会议是？', '[{\"right\": false, \"answer\": \"权力机关\"}, {\"right\": false, \"answer\": \"政权组织形式\"}, {\"right\": true, \"answer\": \"爱国统一战线组织\"}, {\"right\": false, \"answer\": \"民间社团组织\"}]'),
(110, 4, '“发展体育运动，增强人民体质“是我国哪位领导人的题词', '[{\"right\": true, \"answer\": \"毛泽东\"}, {\"right\": false, \"answer\": \"周恩来\"}, {\"right\": false, \"answer\": \"邓小平\"}, {\"right\": false, \"answer\": \"贺龙\"}]'),
(111, 4, '我国是在哪个时期进入奴隶社会的？', '[{\"right\": true, \"answer\": \"夏\"}, {\"right\": false, \"answer\": \"商\"}, {\"right\": false, \"answer\": \"战国\"}, {\"right\": false, \"answer\": \"秦\"}]'),
(112, 4, '下列农民起义哪次是洪秀全领导的？', '[{\"right\": false, \"answer\": \"大泽乡起义\"}, {\"right\": false, \"answer\": \"黄巾起义\"}, {\"right\": false, \"answer\": \"赤眉起义\"}, {\"right\": true, \"answer\": \"太平天国起义\"}]'),
(113, 4, '美国第一任总统是谁？', '[{\"right\": false, \"answer\": \"林肯\"}, {\"right\": true, \"answer\": \"华盛顿\"}, {\"right\": false, \"answer\": \"罗斯福\"}, {\"right\": false, \"answer\": \"杜鲁门\"}]'),
(114, 4, '日前，朝鲜核武器被推上风口浪尖，尤其领导人金正恩，请问他的父亲是', '[{\"right\": false, \"answer\": \"金日成\"}, {\"right\": true, \"answer\": \"金正日\"}, {\"right\": false, \"answer\": \"金正男\"}, {\"right\": false, \"answer\": \"金正哲\"}]'),
(115, 4, '英国英格兰独立事件在哪一年得到解决?', '[{\"right\": false, \"answer\": \"2012\"}, {\"right\": true, \"answer\": \"2014\"}, {\"right\": false, \"answer\": \"2016\"}, {\"right\": false, \"answer\": \"2015\"}]'),
(116, 5, ' 在N21中，十五次入选N21最佳防守阵容(历史排名第一)的球员', '[{\"right\": false, \"answer\": \"科比.布莱恩特\"}, {\"right\": false, \"answer\": \"凯文.加内特\"}, {\"right\": true, \"answer\": \"蒂姆.邓肯\"}, {\"right\": false, \"answer\": \"比尔.拉塞尔\"}]'),
(117, 5, '2006年第十八届德国世界杯的冠军是?', '[{\"right\": false, \"answer\": \"巴西\"}, {\"right\": false, \"answer\": \"阿根廷\"}, {\"right\": true, \"answer\": \"意大利\"}, {\"right\": false, \"answer\": \"德国\"}]'),
(118, 5, '有飞人之称的美国著名篮球运动员迈克尔乔丹于哪一年正式退役?', '[{\"right\": false, \"answer\": \"1993\"}, {\"right\": false, \"answer\": \"1998\"}, {\"right\": true, \"answer\": \"2003\"}, {\"right\": false, \"answer\": \"2004\"}]'),
(119, 5, '现今尚不属于奈?史密斯篮球名人纪念堂(N21名人堂)的球员是？', '[{\"right\": false, \"answer\": \"迈克尔?乔丹\"}, {\"right\": false, \"answer\": \"卡里姆?贾巴尔\"}, {\"right\": false, \"answer\": \"雷吉-米勒\"}, {\"right\": true, \"answer\": \"科比?布莱恩特\"}]'),
(120, 5, '不属于N21西部球队的是？', '[{\"right\": true, \"answer\": \"纽约尼克斯队\"}, {\"right\": false, \"answer\": \"丹佛掘金队\"}, {\"right\": false, \"answer\": \"萨克拉门托国王队\"}, {\"right\": false, \"answer\": \"犹他爵士队\"}]'),
(121, 5, '2008年N21总决赛赛冠军是？', '[{\"right\": false, \"answer\": \"洛杉矶湖人\"}, {\"right\": true, \"answer\": \"波士顿凯尔特人\"}, {\"right\": false, \"answer\": \"迈阿密热火\"}, {\"right\": false, \"answer\": \"圣安东尼奥马刺队\"}]'),
(122, 2, '科学揭示燃烧现象的是？', '[{\"right\": false, \"answer\": \"波兰的哥白尼\"}, {\"right\": false, \"answer\": \"英国的牛顿\"}, {\"right\": true, \"answer\": \"法国的拉瓦锡\"}, {\"right\": false, \"answer\": \"俄国的门捷列夫\"}]'),
(123, 2, '最早创造数字的是？', '[{\"right\": false, \"answer\": \"阿拉伯人\"}, {\"right\": false, \"answer\": \"希腊人\"}, {\"right\": true, \"answer\": \"印度人\"}, {\"right\": false, \"answer\": \"罗马人\"}]'),
(124, 2, '发现行星运动定律的天文学家是？', '[{\"right\": false, \"answer\": \"哥白尼\"}, {\"right\": true, \"answer\": \"伽利略\"}, {\"right\": false, \"answer\": \"开普勒\"}, {\"right\": false, \"answer\": \"张衡\"}]'),
(125, 2, '在第二次工业革命中，首先制成发电机的是？', '[{\"right\": false, \"answer\": \"迈克尔·法拉第\"}, {\"right\": false, \"answer\": \"爱迪生\"}, {\"right\": false, \"answer\": \"贝尔\"}, {\"right\": true, \"answer\": \"西门子\"}]'),
(126, 2, '1903年，美国人谁制造出了飞机？', '[{\"right\": true, \"answer\": \"莱特兄弟\"}, {\"right\": false, \"answer\": \"富尔顿\"}, {\"right\": false, \"answer\": \"福特\"}, {\"right\": false, \"answer\": \"瓦特\"}]'),
(127, 2, '第一个研制成功原子弹的国家是？', '[{\"right\": true, \"answer\": \"美国\"}, {\"right\": false, \"answer\": \"苏联\"}, {\"right\": false, \"answer\": \"英国\"}, {\"right\": false, \"answer\": \"中国\"}]'),
(128, 2, '目前世界上拥有核武器的国家不包括？', '[{\"right\": false, \"answer\": \"印度和巴基斯坦\"}, {\"right\": false, \"answer\": \"美国、英国、法国\"}, {\"right\": false, \"answer\": \"中国和俄国\"}, {\"right\": true, \"answer\": \"德国和日本\"}]'),
(129, 2, '目前世界软件出口最大的发展中国家是？', '[{\"right\": true, \"answer\": \"印度\"}, {\"right\": false, \"answer\": \"巴西\"}, {\"right\": false, \"answer\": \"埃及\"}, {\"right\": false, \"answer\": \"中国\"}]'),
(130, 2, '根据板块构造学说，地球的岩石圈分为六大板块，而惟一全是海洋的板块', '[{\"right\": true, \"answer\": \"太平洋板块\"}, {\"right\": false, \"answer\": \"印度洋板块\"}, {\"right\": false, \"answer\": \"亚欧板块 \"}, {\"right\": false, \"answer\": \"南极洲板块\"}]'),
(131, 2, '九大行星中不属于类地行星的是？', '[{\"right\": false, \"answer\": \"水星\"}, {\"right\": false, \"answer\": \"金星\"}, {\"right\": false, \"answer\": \"火星\"}, {\"right\": true, \"answer\": \"土星\"}]'),
(132, 2, '我国南方的梅雨属于?', '[{\"right\": false, \"answer\": \"地形雨\"}, {\"right\": false, \"answer\": \"对流雨\"}, {\"right\": true, \"answer\": \"锋面雨\"}, {\"right\": false, \"answer\": \"雷阵雨\"}]'),
(133, 2, '一般来说，海拔每升高1000米，气温下降?', '[{\"right\": true, \"answer\": \" 3℃\"}, {\"right\": false, \"answer\": \" 4℃\"}, {\"right\": false, \"answer\": \" 1℃\"}, {\"right\": false, \"answer\": \" 2℃\"}]'),
(134, 2, '决定生物由水生——陆生、简单——复杂、低等——高等的方向发展的原', '[{\"right\": false, \"answer\": \"遗传\"}, {\"right\": false, \"answer\": \"变异\"}, {\"right\": false, \"answer\": \"生存斗争\"}, {\"right\": true, \"answer\": \"自然选择\"}]'),
(135, 2, '太阳系中，中心天体太阳的质量约占太阳系总质量的?', '[{\"right\": false, \"answer\": \"91%\"}, {\"right\": false, \"answer\": \"93.7%\"}, {\"right\": false, \"answer\": \"98.6%\"}, {\"right\": true, \"answer\": \"99.8%\"}]'),
(136, 2, '运用试管香蕉技术来推广优良香蕉品种，这种技术属于？', '[{\"right\": false, \"answer\": \"基因工程\"}, {\"right\": true, \"answer\": \"细胞工程\"}, {\"right\": false, \"answer\": \"酶工程\"}, {\"right\": false, \"answer\": \"发酵工程\"}]'),
(137, 2, '目前国际公认的高技术前沿是指?', '[{\"right\": false, \"answer\": \"航天航空技术\"}, {\"right\": true, \"answer\": \"计算机与信息技术\"}, {\"right\": false, \"answer\": \"生物技术\"}, {\"right\": false, \"answer\": \"新材料技术\"}]'),
(138, 2, '电能是用途最广泛的能源之一，它属于?', '[{\"right\": true, \"answer\": \"二次能源\"}, {\"right\": false, \"answer\": \"一次能源\"}, {\"right\": false, \"answer\": \"不可再生能源\"}, {\"right\": false, \"answer\": \"可再生能源\"}]'),
(139, 2, '21世纪高技术的核心是？', '[{\"right\": false, \"answer\": \"信息技术\"}, {\"right\": true, \"answer\": \"生物技术\"}, {\"right\": false, \"answer\": \"新能源技术\"}, {\"right\": false, \"answer\": \"航天技术\"}]'),
(140, 2, '中国成功发射第一颗人造卫星是在？', '[{\"right\": true, \"answer\": \"1970年4月24日\"}, {\"right\": false, \"answer\": \"1964年4月24日\"}, {\"right\": false, \"answer\": \"1976年4月24日\"}, {\"right\": false, \"answer\": \"1978年4月24日\"}]'),
(141, 2, 'GPS是什么的简称？', '[{\"right\": false, \"answer\": \"全球通讯系统\"}, {\"right\": true, \"answer\": \"全球定位系统\"}, {\"right\": false, \"answer\": \"全球预警系统\"}, {\"right\": false, \"answer\": \"全球网络系统\"}]'),
(142, 2, '按照目前近代物理研究的最新成果，物质的最小的构成单位是？', '[{\"right\": false, \"answer\": \"质子\"}, {\"right\": false, \"answer\": \"中子\"}, {\"right\": false, \"answer\": \"强子\"}, {\"right\": true, \"answer\": \"夸克\"}]'),
(143, 2, '纳米是一种？', '[{\"right\": false, \"answer\": \"水稻的一种\"}, {\"right\": true, \"answer\": \"长度单位\"}, {\"right\": false, \"answer\": \"粒子\"}, {\"right\": false, \"answer\": \"时间单位\"}]'),
(144, 2, '一天之中气温最高值出现在？', '[{\"right\": false, \"answer\": \"正午时分\"}, {\"right\": true, \"answer\": \"午时2时前后\"}, {\"right\": false, \"answer\": \"上午8-9点钟\"}, {\"right\": false, \"answer\": \"日落之时\"}]'),
(145, 2, '20世纪60年代，最先到达月球的地球人类是？', '[{\"right\": true, \"answer\": \"美国人\"}, {\"right\": false, \"answer\": \"苏联人\"}, {\"right\": false, \"answer\": \"英国人\"}, {\"right\": false, \"answer\": \"中国人\"}]'),
(146, 2, '新西兰的几维鸟是曾与恐龙生活在同一时代的古老鸟类，它？', '[{\"right\": false, \"answer\": \"有翅无尾  \"}, {\"right\": false, \"answer\": \"有尾无翅    \"}, {\"right\": true, \"answer\": \"无尾无翅    \"}, {\"right\": false, \"answer\": \"有尾有翅\"}]'),
(147, 2, '属于国家一类保护动物的是？', '[{\"right\": false, \"answer\": \"天鹅   \"}, {\"right\": false, \"answer\": \"娃娃鱼    \"}, {\"right\": false, \"answer\": \"孔雀   \"}, {\"right\": true, \"answer\": \"丹顶鹤\"}]'),
(148, 2, '小王家的水壶中积有大量水垢，长期饮用此壶中水的人？', '[{\"right\": false, \"answer\": \"易得结石症  \"}, {\"right\": false, \"answer\": \"易得心血管疾病  \"}, {\"right\": false, \"answer\": \"易得胃溃疡 \"}, {\"right\": true, \"answer\": \"健康不受影响\"}]'),
(149, 2, '非洲国家边界按什么划分的最多？', '[{\"right\": false, \"answer\": \"直线或曲线的几何方法  \"}, {\"right\": true, \"answer\": \"经线或纬线    \"}, {\"right\": false, \"answer\": \"河流、山脉等自然地貌\"}, {\"right\": false, \"answer\": \"民族\"}]'),
(150, 2, '“三十年河东，三十年河西”中的“河”最初是指？', '[{\"right\": true, \"answer\": \"黄河  \"}, {\"right\": false, \"answer\": \"淮河 \"}, {\"right\": false, \"answer\": \"长江  \"}, {\"right\": false, \"answer\": \"汾河\"}]'),
(151, 2, '下列河流哪一条是世界流程最长？', '[{\"right\": true, \"answer\": \"尼罗河] \"}, {\"right\": false, \"answer\": \"长江]\"}, {\"right\": false, \"answer\": \"亚马孙河 \"}, {\"right\": false, \"answer\": \"密西西比河\"}]'),
(152, 2, '世界十大环境污染之首是？', '[{\"right\": false, \"answer\": \"垃圾污染  \"}, {\"right\": true, \"answer\": \"大气污染   \"}, {\"right\": false, \"answer\": \"土地荒漠污染 \"}, {\"right\": false, \"answer\": \"水体污染\"}]'),
(153, 2, '我国第一部有声影片是？', '[{\"right\": true, \"answer\": \"《四郎探母》 \"}, {\"right\": false, \"answer\": \"《定军山》\"}, {\"right\": false, \"answer\": \"《林则徐》\"}, {\"right\": false, \"answer\": \"《玉人何处》\"}]'),
(154, 2, '55个少数民族中，通用汉语的是哪两个民族？', '[{\"right\": false, \"answer\": \"蒙古、满\"}, {\"right\": false, \"answer\": \"苗、藏\"}, {\"right\": false, \"answer\": \"回、布依\"}, {\"right\": true, \"answer\": \"满、回\"}]'),
(155, 2, '牙膏的主要原料是?', '[{\"right\": true, \"answer\": \"摩擦剂\"}, {\"right\": false, \"answer\": \"保湿剂\"}, {\"right\": false, \"answer\": \"泡沫剂\"}, {\"right\": false, \"answer\": \"香味剂\"}]'),
(156, 2, '如果把红色的西红柿放在蓝色光下观看，西红柿是什么颜色的?', '[{\"right\": false, \"answer\": \"红色\"}, {\"right\": false, \"answer\": \"蓝色\"}, {\"right\": true, \"answer\": \"黑色\"}, {\"right\": false, \"answer\": \"紫色\"}]'),
(157, 2, '造成温室效应的气体，即被称为“温室气体”，以下不是“温室气体”的', '[{\"right\": false, \"answer\": \"二氧化碳\"}, {\"right\": false, \"answer\": \"甲烷\"}, {\"right\": false, \"answer\": \"氟氯烃\"}, {\"right\": true, \"answer\": \"一氧化碳\"}]'),
(158, 2, '穿什么颜色衣服的人最容易被蚊子叮？', '[{\"right\": true, \"answer\": \"黑色\"}, {\"right\": false, \"answer\": \"红色\"}, {\"right\": false, \"answer\": \"黄色\"}, {\"right\": false, \"answer\": \"白色\"}]'),
(159, 2, '不锈钢中的什么元素使这种合金钢不生锈?', '[{\"right\": false, \"answer\": \"碳 \"}, {\"right\": false, \"answer\": \"铁\"}, {\"right\": true, \"answer\": \"铬\"}, {\"right\": false, \"answer\": \"铝\"}]'),
(160, 2, '飞机起飞与降落时，如下哪种情况最有利于安全保障？', '[{\"right\": false, \"answer\": \"顺风起飞，顺风降落\"}, {\"right\": false, \"answer\": \" 顺风起飞，逆风降落\"}, {\"right\": false, \"answer\": \"逆风起飞，顺风降落 \"}, {\"right\": true, \"answer\": \" 逆风起飞，逆风降落\"}]'),
(161, 2, '将红色颜料与哪中颜料可配成紫色？', '[{\"right\": true, \"answer\": \"蓝\"}, {\"right\": false, \"answer\": \"绿\"}, {\"right\": false, \"answer\": \"黄\"}, {\"right\": false, \"answer\": \"灰\"}]'),
(162, 2, '爱因斯坦生于', '[{\"right\": true, \"answer\": \"德国\"}, {\"right\": false, \"answer\": \"法国\"}, {\"right\": false, \"answer\": \"美国\"}, {\"right\": false, \"answer\": \"瑞典\"}]'),
(163, 2, '正常人应有牙齿多少颗？', '[{\"right\": true, \"answer\": \"32\"}, {\"right\": false, \"answer\": \"30\"}, {\"right\": false, \"answer\": \"34\"}, {\"right\": false, \"answer\": \"36\"}]'),
(164, 2, '人的五官中哪个感觉反应最快？', '[{\"right\": false, \"answer\": \"嗅觉\"}, {\"right\": false, \"answer\": \"视觉\"}, {\"right\": false, \"answer\": \"听觉\"}, {\"right\": true, \"answer\": \"味觉\"}]'),
(165, 2, '我国不受寒潮影响的地区是？', '[{\"right\": true, \"answer\": \"雅鲁藏布江谷地\"}, {\"right\": false, \"answer\": \"海南岛\"}, {\"right\": false, \"answer\": \"台湾岛\"}, {\"right\": false, \"answer\": \"汾河谷地\"}]'),
(166, 2, '诱发海啸的原因是？', '[{\"right\": false, \"answer\": \"台风 \"}, {\"right\": false, \"answer\": \"龙卷风\"}, {\"right\": true, \"answer\": \"海底地震 \"}, {\"right\": false, \"answer\": \"大陆地震\"}]'),
(167, 2, '中秋节那天月亮升起的时刻是？', '[{\"right\": true, \"answer\": \"日落时\"}, {\"right\": false, \"answer\": \"子夜\"}, {\"right\": false, \"answer\": \"中午\"}, {\"right\": false, \"answer\": \"日出前2小时\"}]'),
(168, 2, '天气预报“今天阴有小雨”，小雨的降雨量为多少？ ', '[{\"right\": true, \"answer\": \"15毫升以下\"}, {\"right\": false, \"answer\": \"20毫升以下\"}, {\"right\": false, \"answer\": \"25毫升以下\"}, {\"right\": false, \"answer\": \"30毫升以下\"}]'),
(169, 2, '人体最大的器官是？', '[{\"right\": false, \"answer\": \"大脑\"}, {\"right\": false, \"answer\": \"肌肉\"}, {\"right\": false, \"answer\": \"骨骼\"}, {\"right\": true, \"answer\": \"皮肤\"}]'),
(170, 2, '地球的周围有4个圈层,最外层称为 什么？ ', '[{\"right\": true, \"answer\": \"大气圈\"}, {\"right\": false, \"answer\": \"水圈\"}, {\"right\": false, \"answer\": \"土壤岩石圈\"}, {\"right\": false, \"answer\": \"生物圈\"}]'),
(171, 2, '根据空气密度与高度的关系把大气分为几层？', '[{\"right\": false, \"answer\": \"3\"}, {\"right\": false, \"answer\": \"4\"}, {\"right\": true, \"answer\": \"5\"}, {\"right\": false, \"answer\": \"6\"}]'),
(172, 2, '天然水体最大的污染源是什么？', '[{\"right\": false, \"answer\": \"工业污水 农田污水\"}, {\"right\": true, \"answer\": \"工业污水生活污水\"}, {\"right\": false, \"answer\": \"生活污水 农田污水\"}, {\"right\": false, \"answer\": \"酸雨生活污水 \"}]'),
(173, 2, '下列不属于世界四大科学难题的是？', '[{\"right\": false, \"answer\": \"人体基因结构\"}, {\"right\": false, \"answer\": \"宇宙中的黑暗物质\"}, {\"right\": false, \"answer\": \"受控核聚变\"}, {\"right\": true, \"answer\": \"纳米技术\"}]'),
(174, 2, '激光器产生于？', '[{\"right\": true, \"answer\": \"1953\"}, {\"right\": false, \"answer\": \"1961\"}, {\"right\": false, \"answer\": \"1960\"}, {\"right\": false, \"answer\": \"1948\"}]'),
(175, 2, '计算机网络最突出的优点是?', '[{\"right\": true, \"answer\": \"共享资源\"}, {\"right\": false, \"answer\": \"精度高\"}, {\"right\": false, \"answer\": \"运算速度快\"}, {\"right\": false, \"answer\": \"内存容量大\"}]'),
(176, 2, '电子计算机技术在半个世纪中虽有很大进步,但至今其运行仍遵循着一位', '[{\"right\": false, \"answer\": \"牛顿\"}, {\"right\": false, \"answer\": \"爱因斯坦\"}, {\"right\": false, \"answer\": \"爱迪生\"}, {\"right\": true, \"answer\": \"冯·诺依曼\"}]'),
(177, 2, '国务院发布的《计算机软件保护条例》开始施行的日期是？', '[{\"right\": false, \"answer\": \"1985年6月\"}, {\"right\": false, \"answer\": \"1990年8月\"}, {\"right\": true, \"answer\": \"1991年10月\"}, {\"right\": false, \"answer\": \"1992年1月\"}]'),
(178, 2, '一个完整的计算机系统应该包括？', '[{\"right\": false, \"answer\": \"计算机及其外部设备\"}, {\"right\": false, \"answer\": \"主机,键盘,显示器\"}, {\"right\": false, \"answer\": \"系统软件与应用软件\"}, {\"right\": true, \"answer\": \"硬件系统与软件系统\"}]'),
(179, 2, '下列存储设备中,断电后其中信息会丢失的是？', '[{\"right\": false, \"answer\": \"ROM\"}, {\"right\": true, \"answer\": \"RIM\"}, {\"right\": false, \"answer\": \"硬盘\"}, {\"right\": false, \"answer\": \"软盘\"}]'),
(180, 2, '用晶体管作为电子器件制成的计算机属于？', '[{\"right\": false, \"answer\": \"第一代\"}, {\"right\": true, \"answer\": \"第二代\"}, {\"right\": false, \"answer\": \"第三代\"}, {\"right\": false, \"answer\": \"第四代\"}]'),
(181, 2, ' 世界上最大的哺乳动物是', '[{\"right\": false, \"answer\": \"大象\"}, {\"right\": true, \"answer\": \"蓝鲸\"}, {\"right\": false, \"answer\": \"野马\"}, {\"right\": false, \"answer\": \"鲨鱼\"}]'),
(182, 11, '感冒忌用下列哪一种食物？', '[{\"right\": true, \"answer\": \"海鱼\"}, {\"right\": false, \"answer\": \"豆浆\"}, {\"right\": false, \"answer\": \"青菜\"}, {\"right\": false, \"answer\": \"生姜\"}]'),
(183, 11, '老年人一天吃几只鸡蛋才合适 ', '[{\"right\": false, \"answer\": \"2只\"}, {\"right\": true, \"answer\": \"1~2只\"}, {\"right\": false, \"answer\": \"1只\"}, {\"right\": false, \"answer\": \"2~3只\"}]'),
(184, 11, '酒中含有酒精，饮酒过多或经常饮酒，会造成酒精中毒，使身体受损，那', '[{\"right\": false, \"answer\": \"眼睛 \"}, {\"right\": false, \"answer\": \"皮肤\"}, {\"right\": true, \"answer\": \"心脏 \"}, {\"right\": false, \"answer\": \"肺 \"}]'),
(185, 11, '苹果中含有增强记忆力的微量元素是？', '[{\"right\": false, \"answer\": \"铁\"}, {\"right\": true, \"answer\": \"锌\"}, {\"right\": false, \"answer\": \"钙\"}, {\"right\": false, \"answer\": \"碘\"}]'),
(186, 11, '吃太多手摇爆米花机爆出的米花会导致？', '[{\"right\": false, \"answer\": \"锡中毒\"}, {\"right\": true, \"answer\": \"铅中毒\"}, {\"right\": false, \"answer\": \"铬中毒\"}, {\"right\": false, \"answer\": \"碘中毒\"}]'),
(187, 11, '方便面里必然有哪种食品添加剂？', '[{\"right\": false, \"answer\": \"防腐剂\"}, {\"right\": true, \"answer\": \"合成抗氧化剂 \"}, {\"right\": false, \"answer\": \"食用色素\"}, {\"right\": false, \"answer\": \"漂白剂\"}]'),
(188, 11, '低盐饮食有利于预防什么疾病？', '[{\"right\": false, \"answer\": \"乙型肝炎\"}, {\"right\": false, \"answer\": \"糖尿病\"}, {\"right\": true, \"answer\": \"高血压\"}, {\"right\": false, \"answer\": \"贫血\"}]'),
(189, 11, '碘缺乏会导致儿童、青少年？', '[{\"right\": false, \"answer\": \"甲亢\"}, {\"right\": false, \"answer\": \"无力\"}, {\"right\": false, \"answer\": \"心理疾病\"}, {\"right\": true, \"answer\": \"生长发育和智力受影响\"}]'),
(190, 11, '夏季在烈日下工作或运动量过大出汗多时，为预防中暑应多喝？ ', '[{\"right\": false, \"answer\": \"糖水\"}, {\"right\": false, \"answer\": \"糖醋水\"}, {\"right\": true, \"answer\": \"盐开水\"}, {\"right\": false, \"answer\": \"白开水 \"}]'),
(191, 11, '烧菜时最好在何时加碘盐以减少碘的损失？', '[{\"right\": false, \"answer\": \"烧菜前用碘盐爆锅\"}, {\"right\": false, \"answer\": \"烧菜加水后\"}, {\"right\": false, \"answer\": \"烧菜加水前\"}, {\"right\": true, \"answer\": \"菜将出锅时\"}]'),
(192, 11, '某人由于营养不良，身体浮肿，其食疗补救措施是', '[{\"right\": false, \"answer\": \"多吃蔬菜 \"}, {\"right\": true, \"answer\": \"多喝豆汁 \"}, {\"right\": false, \"answer\": \"多吃馒头\"}, {\"right\": false, \"answer\": \"多喝水\"}]'),
(193, 11, '下列不属于营养物质的是', '[{\"right\": false, \"answer\": \"食物中的葡萄糖 \"}, {\"right\": true, \"answer\": \"肝糖元分解形成的葡萄糖\"}, {\"right\": false, \"answer\": \"饮水中的碘\"}, {\"right\": false, \"answer\": \"食物中的胡萝卜素\"}]'),
(194, 11, '在人的一生中，脑发育的最关键时期是？', '[{\"right\": true, \"answer\": \"胎儿期和婴儿期 \"}, {\"right\": false, \"answer\": \"婴儿期和儿童期\"}, {\"right\": false, \"answer\": \"儿童期和青春期\"}, {\"right\": false, \"answer\": \"青春期和婴儿期\"}]'),
(195, 11, '自然界中，有“智慧元素”之称的是', '[{\"right\": false, \"answer\": \"铁\"}, {\"right\": true, \"answer\": \"碘\"}, {\"right\": false, \"answer\": \"钙\"}, {\"right\": false, \"answer\": \"锌\"}]'),
(196, 11, '食品的保质期是指它的？', '[{\"right\": false, \"answer\": \"生产日期\"}, {\"right\": false, \"answer\": \"最终食用期\"}, {\"right\": true, \"answer\": \"最佳食用期\"}, {\"right\": false, \"answer\": \"出厂日期\"}]'),
(197, 11, '以下哪种食品可以食用?', '[{\"right\": false, \"answer\": \"发霉的茶叶\"}, {\"right\": false, \"answer\": \"发芽的土豆\"}, {\"right\": true, \"answer\": \"变绿的豆芽\"}, {\"right\": false, \"answer\": \"变红的汤圆\"}]'),
(198, 11, '出现食物中毒症状或者误食化学品时，最先采取的急救措施是？', '[{\"right\": true, \"answer\": \"催吐\"}, {\"right\": false, \"answer\": \"吃止泻药物\"}, {\"right\": false, \"answer\": \"进行人工呼吸\"}, {\"right\": false, \"answer\": \"向卫生防疫部门报告\"}]'),
(199, 11, '铜器与什么不宜长久接触，否则会产生铜绿。用生有铜绿的铜器盛放食品', '[{\"right\": false, \"answer\": \"酱油\"}, {\"right\": false, \"answer\": \"花椒面\"}, {\"right\": false, \"answer\": \"味精\"}, {\"right\": true, \"answer\": \"醋\"}]'),
(200, 11, '店灯丝断了，把灯泡晃了晃使灯丝又搭上了，再用的时候会发现？', '[{\"right\": true, \"answer\": \"灯比原来亮了\"}, {\"right\": false, \"answer\": \"灯比原来暗了\"}, {\"right\": false, \"answer\": \"跟原来一样\"}, {\"right\": false, \"answer\": \"不会亮了\"}]'),
(201, 11, '树干为什么常常刷成白色？', '[{\"right\": false, \"answer\": \"防火\"}, {\"right\": true, \"answer\": \"灭菌\"}, {\"right\": false, \"answer\": \"防牲畜啃食\"}, {\"right\": false, \"answer\": \"保暖\"}]'),
(202, 11, '汽车轮胎上的沟纹主要作用是？', '[{\"right\": true, \"answer\": \"减轻车身重量\"}, {\"right\": false, \"answer\": \"排除雨水和泥水\"}, {\"right\": false, \"answer\": \"增加车身的缓冲\"}, {\"right\": false, \"answer\": \"增加与地面的摩擦\"}]'),
(203, 11, '白炽灯用久了会发黑是为什么？', '[{\"right\": false, \"answer\": \"钨丝氧化\"}, {\"right\": true, \"answer\": \"钨丝升华\"}, {\"right\": false, \"answer\": \"玻璃老化\"}, {\"right\": false, \"answer\": \"外表面有灰尘\"}]'),
(204, 11, '下面提供的几种识别矿泉水真假的方法哪一种是错误的？', '[{\"right\": true, \"answer\": \"在日光下无色透明\"}, {\"right\": false, \"answer\": \"折光率比自来水大\"}, {\"right\": false, \"answer\": \"矿化度比自来水大\"}, {\"right\": false, \"answer\": \"矿物质比自来水多\"}]'),
(205, 11, '在一个温度恒定的室内，你赤脚站在瓷砖上觉得比站在棉花上冷是因为？', '[{\"right\": false, \"answer\": \"棉花温度较高\"}, {\"right\": true, \"answer\": \"瓷砖导热较快\"}, {\"right\": false, \"answer\": \"瓷砖温度低\"}, {\"right\": false, \"answer\": \"身体的错觉\"}]'),
(206, 11, '闹钟装入塑料兜并放入水中，闹钟的声音是？', '[{\"right\": true, \"answer\": \"听得清楚\"}, {\"right\": false, \"answer\": \"听起来时隐时现\"}, {\"right\": false, \"answer\": \"听不到声音\"}, {\"right\": false, \"answer\": \"听不清楚\"}]'),
(207, 11, '以下哪种锅炒菜更科学？', '[{\"right\": true, \"answer\": \"铁锅\"}, {\"right\": false, \"answer\": \"铝锅\"}, {\"right\": false, \"answer\": \"不锈钢锅\"}, {\"right\": false, \"answer\": \"陶瓷器\"}]'),
(208, 11, '不能用开水煎中药的原因是？', '[{\"right\": false, \"answer\": \"会杀死植物性中药的有效细胞\"}, {\"right\": true, \"answer\": \"开水会使淀粉和蛋白凝结\"}, {\"right\": false, \"answer\": \"开水不能和中药溶合\"}, {\"right\": false, \"answer\": \"开水会让开水味道散去\"}]'),
(209, 11, '核电站运用了放射性元素的什么来转化为电能？', '[{\"right\": true, \"answer\": \"裂变\"}, {\"right\": false, \"answer\": \"聚变\"}, {\"right\": false, \"answer\": \"衰变\"}, {\"right\": false, \"answer\": \"质量\"}]'),
(210, 11, '菜刀生锈除锈的方法最好用？', '[{\"right\": false, \"answer\": \"用水洗\"}, {\"right\": false, \"answer\": \"用洗涤精擦洗\"}, {\"right\": true, \"answer\": \"用切开的葱头擦拭\"}, {\"right\": false, \"answer\": \"用牙膏清洗\"}]'),
(211, 11, '在糖水中加少量盐尝起来会怎样？', '[{\"right\": false, \"answer\": \"变涩\"}, {\"right\": false, \"answer\": \"变咸\"}, {\"right\": true, \"answer\": \"更甜\"}, {\"right\": false, \"answer\": \"没有区别\"}]'),
(212, 11, '目前人类已知的最软石头是什么？', '[{\"right\": false, \"answer\": \"磷灰石\"}, {\"right\": false, \"answer\": \"方解石\"}, {\"right\": true, \"answer\": \"滑石\"}, {\"right\": false, \"answer\": \"石灰岩\"}]'),
(213, 11, '天空上的星星为什么有的亮有的暗？', '[{\"right\": false, \"answer\": \"大小不一样\"}, {\"right\": false, \"answer\": \"发光能力不一样\"}, {\"right\": false, \"answer\": \"方向不同\"}, {\"right\": true, \"answer\": \"距离不同\"}]'),
(214, 11, '胰岛素是一种？', '[{\"right\": false, \"answer\": \"脂类\"}, {\"right\": true, \"answer\": \"蛋白质\"}, {\"right\": false, \"answer\": \"碳水化合物\"}, {\"right\": false, \"answer\": \"小分子\"}]'),
(215, 11, '古人所谓黄道是哪种天体运行周年的轨道？', '[{\"right\": false, \"answer\": \"地球\"}, {\"right\": false, \"answer\": \"月亮\"}, {\"right\": true, \"answer\": \"太阳\"}, {\"right\": false, \"answer\": \"木星\"}]'),
(216, 11, '现在通用的铅笔是由石墨和什么混合制成的？', '[{\"right\": false, \"answer\": \"铅粉\"}, {\"right\": true, \"answer\": \"粘土\"}, {\"right\": false, \"answer\": \"松香\"}, {\"right\": false, \"answer\": \"硅土\"}]'),
(217, 11, '青蛙除了用肺外还用什么器官呼吸？', '[{\"right\": false, \"answer\": \"肌肉\"}, {\"right\": true, \"answer\": \"皮肤\"}, {\"right\": false, \"answer\": \"肝脏\"}, {\"right\": false, \"answer\": \"腮\"}]'),
(218, 11, '狗的鼻尖为什么经常是湿乎乎的？', '[{\"right\": false, \"answer\": \"狗常年感冒\"}, {\"right\": false, \"answer\": \"经常喝水而弄湿的\"}, {\"right\": false, \"answer\": \"经常用唾液清洗\"}, {\"right\": true, \"answer\": \"滋润嗅觉细胞的分泌物\"}]'),
(219, 11, '美丽的极光多出现在极地上空这是因为？', '[{\"right\": false, \"answer\": \"极夜期间天空黑暗\"}, {\"right\": true, \"answer\": \"地球磁场作用的结果\"}, {\"right\": false, \"answer\": \"太阳斜射极地高层大气\"}, {\"right\": false, \"answer\": \"太阳光反射造成的\"}]'),
(220, 11, '常温下下列哪种物质能导电？', '[{\"right\": false, \"answer\": \"橡皮\"}, {\"right\": false, \"answer\": \"陶瓷\"}, {\"right\": true, \"answer\": \"铅笔芯\"}, {\"right\": false, \"answer\": \"塑料笔5我们每个人每只手都有\"}]'),
(221, 11, '根手指哪根手指上的指甲长得最快呢？', '[{\"right\": false, \"answer\": \"大拇指上的指甲\"}, {\"right\": true, \"answer\": \"中指上的指甲\"}, {\"right\": false, \"answer\": \"小拇指上的指甲\"}, {\"right\": false, \"answer\": \"无名指上的指甲\"}]'),
(222, 11, '如果眼睛感到疲倦时主要是哪个部分疲倦了？', '[{\"right\": false, \"answer\": \"瞳孔\"}, {\"right\": false, \"answer\": \"视网膜\"}, {\"right\": false, \"answer\": \"晶状体\"}, {\"right\": true, \"answer\": \"睫状肌\"}]'),
(223, 11, '下列哪种情况下最容易引起静电', '[{\"right\": true, \"answer\": \"干燥的环境下\"}, {\"right\": false, \"answer\": \"潮湿的环境下\"}, {\"right\": false, \"answer\": \"刚打完闪电之后\"}, {\"right\": false, \"answer\": \"下完雨之后\"}]'),
(224, 11, '大气和水被污染时可能引起人的牙齿和骨骼变酥引起这种污染的元素是？', '[{\"right\": false, \"answer\": \"碘\"}, {\"right\": true, \"answer\": \"氟\"}, {\"right\": false, \"answer\": \"汞\"}, {\"right\": false, \"answer\": \"钙\"}]'),
(225, 11, '生产面粉的车间严禁吸烟主要原因是？', '[{\"right\": false, \"answer\": \"防止火灾\"}, {\"right\": true, \"answer\": \"防止爆炸\"}, {\"right\": false, \"answer\": \"保护环境\"}, {\"right\": false, \"answer\": \"确保面粉质量\"}]'),
(226, 11, '用自来水养鱼时将水注入鱼缸以前需在阳光下曝晒一段时间目的是？', '[{\"right\": true, \"answer\": \"使水中次氯酸分解\"}, {\"right\": false, \"answer\": \"起到杀菌作用\"}, {\"right\": false, \"answer\": \"增加水中O2的含量\"}, {\"right\": false, \"answer\": \"减少二氧化碳浓度\"}]'),
(227, 11, '俗称人造小太阳的强光灯所采用的气体是？', '[{\"right\": false, \"answer\": \"氩气\"}, {\"right\": false, \"answer\": \"氖气\"}, {\"right\": true, \"answer\": \"氦气\"}, {\"right\": false, \"answer\": \"氢气\"}]'),
(228, 11, '柿饼外的白粉是？', '[{\"right\": false, \"answer\": \"果糖粉末\"}, {\"right\": false, \"answer\": \"纤维素\"}, {\"right\": false, \"answer\": \"淀粉\"}, {\"right\": true, \"answer\": \"葡萄糖粉末\"}]'),
(229, 11, '摩托车做飞跃障碍物的表演时为了减少向前翻车的危险应该？', '[{\"right\": true, \"answer\": \"后轮先着地\"}, {\"right\": false, \"answer\": \"前轮先着地\"}, {\"right\": false, \"answer\": \"尽量前后轮同时着地\"}, {\"right\": false, \"answer\": \"紧急止刹\"}]'),
(230, 11, '将空调设置在除湿模式工作，此时即使室温稍高也能令人感觉凉爽，且比', '[{\"right\": false, \"answer\": \"费电\"}, {\"right\": false, \"answer\": \"省电\"}, {\"right\": false, \"answer\": \"复杂\"}, {\"right\": true, \"answer\": \"简单\"}]'),
(231, 11, '大自然中口香糖的分解约需要多少年。', '[{\"right\": false, \"answer\": \"1-2\"}, {\"right\": true, \"answer\": \"3-4\"}, {\"right\": false, \"answer\": \"5-6\"}, {\"right\": false, \"answer\": \"8-10\"}]'),
(232, 11, '以下哪一类茶是半发酵茶？', '[{\"right\": false, \"answer\": \"红茶\"}, {\"right\": false, \"answer\": \"绿茶\"}, {\"right\": true, \"answer\": \"乌龙茶 \"}, {\"right\": false, \"answer\": \"花茶\"}]'),
(233, 11, '狗热时用什么散热？', '[{\"right\": false, \"answer\": \"皮肤\"}, {\"right\": true, \"answer\": \"舌头\"}, {\"right\": false, \"answer\": \"眼睛\"}, {\"right\": false, \"answer\": \"耳朵\"}]'),
(234, 11, '树干为什么经常刷成白色？', '[{\"right\": false, \"answer\": \"防火\"}, {\"right\": true, \"answer\": \"灭菌\"}, {\"right\": false, \"answer\": \"防牲口啃食\"}, {\"right\": false, \"answer\": \"区分树木\"}]'),
(235, 11, '相传我国古代能作“掌上舞”的人是？', '[{\"right\": false, \"answer\": \"杨玉环\"}, {\"right\": true, \"answer\": \"赵飞燕\"}, {\"right\": false, \"answer\": \"西施\"}, {\"right\": false, \"answer\": \"貂蝉\"}]'),
(236, 11, '醋放久了会生白，为了防止其生白，最好在醋内加一些黄酒后再掺进少？', '[{\"right\": false, \"answer\": \"姜末\"}, {\"right\": false, \"answer\": \"白糖\"}, {\"right\": true, \"answer\": \"精盐\"}, {\"right\": false, \"answer\": \"味精\"}]'),
(237, 11, '人体最大的细胞是？', '[{\"right\": true, \"answer\": \"卵细胞\"}, {\"right\": false, \"answer\": \" 脑细胞\"}, {\"right\": false, \"answer\": \"淋巴细胞\"}, {\"right\": false, \"answer\": \"干细胞\"}]'),
(238, 11, '“飞天奖”是？', '[{\"right\": false, \"answer\": \"电 影奖\"}, {\"right\": false, \"answer\": \"舞蹈奖\"}, {\"right\": true, \"answer\": \"电视剧奖\"}, {\"right\": false, \"answer\": \"音乐奖\"}]'),
(239, 11, '起初婚礼上放鞭炮是为了？', '[{\"right\": true, \"answer\": \" 震妖除邪\"}, {\"right\": false, \"answer\": \"增加喜庆\"}, {\"right\": false, \"answer\": \"求子\"}, {\"right\": false, \"answer\": \"祝愿婚后美好\"}]'),
(240, 11, '“碧云天，黄花地，北雁南飞”语出？', '[{\"right\": false, \"answer\": \"《窦娥冤》\"}, {\"right\": true, \"answer\": \"《西厢记》\"}, {\"right\": false, \"answer\": \"《牡丹亭》\"}, {\"right\": false, \"answer\": \"《墙头马上》\"}]'),
(241, 11, '五子棋最高段位为？ ', '[{\"right\": false, \"answer\": \"一段\"}, {\"right\": false, \"answer\": \"六段 \"}, {\"right\": true, \"answer\": \"九段 \"}, {\"right\": false, \"answer\": \"十二段\"}]'),
(242, 11, '我们日常的主食属于？ ', '[{\"right\": true, \"answer\": \"酸性食物 \"}, {\"right\": false, \"answer\": \"碱性食物 \"}, {\"right\": false, \"answer\": \"中性食物\"}, {\"right\": false, \"answer\": \"半酸半碱食物\"}]'),
(243, 11, '女方在怀孕期间、分娩后多长时间，男方不得提出离婚？', '[{\"right\": false, \"answer\": \" 半年\"}, {\"right\": true, \"answer\": \" 一年\"}, {\"right\": false, \"answer\": \" 一年半\"}, {\"right\": false, \"answer\": \" 两年\"}]'),
(244, 11, '雪莲花的颜色是？ ', '[{\"right\": true, \"answer\": \"深红色\"}, {\"right\": false, \"answer\": \" 粉红色\"}, {\"right\": false, \"answer\": \"白色 \"}, {\"right\": false, \"answer\": \"淡黄色\"}]'),
(245, 11, '经常食用以下哪种食物容易引起铅中毒？', '[{\"right\": false, \"answer\": \"油条\"}, {\"right\": true, \"answer\": \"松花蛋\"}, {\"right\": false, \"answer\": \"豆腐\"}, {\"right\": false, \"answer\": \"粉条\"}]'),
(246, 11, '血液占人体比重的？', '[{\"right\": true, \"answer\": \"7-8%\"}, {\"right\": false, \"answer\": \"17-18%\"}, {\"right\": false, \"answer\": \"10-12%\"}, {\"right\": false, \"answer\": \"30-38%\"}]'),
(247, 11, '冬天倒开水时，最容易爆破的玻璃杯是？', '[{\"right\": false, \"answer\": \"越薄的\"}, {\"right\": true, \"answer\": \"越厚的\"}, {\"right\": false, \"answer\": \"越高的\"}, {\"right\": false, \"answer\": \"没区别\"}]');
INSERT INTO `question_detail` (`id`, `sort_id`, `ask`, `answer`) VALUES
(248, 11, '现在中国有多少姓氏？', '[{\"right\": true, \"answer\": \"两万多\"}, {\"right\": false, \"answer\": \"一万多\"}, {\"right\": false, \"answer\": \"五千多\"}, {\"right\": false, \"answer\": \"三千多\"}]'),
(249, 11, '在远古时代，跳远是为了？', '[{\"right\": false, \"answer\": \"锻炼身体\"}, {\"right\": false, \"answer\": \"捕捉猎物\"}, {\"right\": true, \"answer\": \"逃避猛兽\"}, {\"right\": false, \"answer\": \"纯属娱乐\"}]'),
(250, 11, '下列哪个作家不是法国人？', '[{\"right\": false, \"answer\": \"雨果\"}, {\"right\": false, \"answer\": \"莫泊桑\"}, {\"right\": false, \"answer\": \"巴尔扎克 \"}, {\"right\": true, \"answer\": \"海涅\"}]'),
(251, 11, '人的下列感观中哪个反应最快？', '[{\"right\": false, \"answer\": \"嗅觉\"}, {\"right\": false, \"answer\": \"视觉\"}, {\"right\": false, \"answer\": \"听觉\"}, {\"right\": true, \"answer\": \"味觉\"}]'),
(252, 11, '如果把一个成人的所有血管连接起来，其长度接近？', '[{\"right\": false, \"answer\": \"十公里\"}, {\"right\": false, \"answer\": \"一千公里\"}, {\"right\": false, \"answer\": \"一万公里\"}, {\"right\": true, \"answer\": \"十万公里  \"}]'),
(253, 11, '“沙龙”salon是从哪国传来的外来词？', '[{\"right\": false, \"answer\": \"英国\"}, {\"right\": true, \"answer\": \"法国\"}, {\"right\": false, \"answer\": \"美国 \"}, {\"right\": false, \"answer\": \"俄国\"}]'),
(254, 5, '2004年的夏季奥运会在哪里举行？', '[{\"right\": false, \"answer\": \"悉尼\"}, {\"right\": true, \"answer\": \"雅典\"}, {\"right\": false, \"answer\": \"巴黎\"}, {\"right\": false, \"answer\": \"北京 \"}]'),
(255, 5, '2004年的欧洲杯在哪个国家进行？', '[{\"right\": false, \"answer\": \"德国\"}, {\"right\": false, \"answer\": \"比利时\"}, {\"right\": true, \"answer\": \"葡萄牙\"}, {\"right\": false, \"answer\": \"荷兰 \"}]'),
(256, 5, '被誉为梦之队的是中国哪个体育代表队？', '[{\"right\": true, \"answer\": \"跳水或乒乓\"}, {\"right\": false, \"answer\": \"体操或乒乓\"}, {\"right\": false, \"answer\": \"跳水或羽毛\"}, {\"right\": false, \"answer\": \"羽毛或体操 \"}]'),
(257, 5, '1984年谁获得的奥运金牌，实现了我过在奥运史上金牌的“零的突破', '[{\"right\": false, \"answer\": \"郎平\"}, {\"right\": true, \"answer\": \"许海峰\"}, {\"right\": false, \"answer\": \"李宁\"}, {\"right\": false, \"answer\": \"黄志红 \"}]'),
(258, 5, '在双杠的支撑摆动动作中，应以哪个部位为轴摆动？', '[{\"right\": false, \"answer\": \"手\"}, {\"right\": true, \"answer\": \"肩\"}, {\"right\": false, \"answer\": \"宽\"}, {\"right\": false, \"answer\": \"腰 \"}]'),
(259, 5, '个性心理特征包括？ ', '[{\"right\": false, \"answer\": \"气质、性格、动机 \"}, {\"right\": false, \"answer\": \"气质、性格、需要 \"}, {\"right\": false, \"answer\": \"兴趣、动机、需要 \"}, {\"right\": true, \"answer\": \"能力、气质、性格 \"}]'),
(260, 5, '中国古代教育中的“六艺”（礼、乐、射、御、书、数）中属于体育范畴', '[{\"right\": false, \"answer\": \"礼、乐\"}, {\"right\": false, \"answer\": \"乐、射\"}, {\"right\": true, \"answer\": \"射、御\"}, {\"right\": false, \"answer\": \"御、数\"}]'),
(261, 5, '抓好学校体育工作计划的主要负责人是？', '[{\"right\": false, \"answer\": \"校长\"}, {\"right\": false, \"answer\": \"教导主任\"}, {\"right\": true, \"answer\": \"体育教研组长\"}, {\"right\": false, \"answer\": \"体育教师\"}]'),
(262, 5, '重复训练法的主要特征是？ ', '[{\"right\": false, \"answer\": \"不间断进行训练\"}, {\"right\": false, \"answer\": \"循环进行训练\"}, {\"right\": true, \"answer\": \"反复做同一练习\"}, {\"right\": false, \"answer\": \"控制练习的间歇\"}]'),
(263, 5, '对学生进行运动技能成绩的评定可采用？', '[{\"right\": false, \"answer\": \"定量评定\"}, {\"right\": false, \"answer\": \"定性评定\"}, {\"right\": true, \"answer\": \"定性与定量相结合\"}, {\"right\": false, \"answer\": \"因人而异\"}]'),
(264, 5, '奥林匹克精神是？ ', '[{\"right\": false, \"answer\": \"更快、更高、更强 \"}, {\"right\": true, \"answer\": \"互相了解、友谊、团结和公平竞争\"}, {\"right\": false, \"answer\": \"团结、友谊、进步\"}, {\"right\": false, \"answer\": \"重要的不是取胜，而是参加 \"}]'),
(265, 5, '逆时针弯道跑时，身体应向什么方向倾斜 ？ ', '[{\"right\": false, \"answer\": \"右\"}, {\"right\": true, \"answer\": \"左\"}, {\"right\": false, \"answer\": \"前\"}, {\"right\": false, \"answer\": \"后\"}]'),
(266, 5, '最合理的跳高过杆技术是？', '[{\"right\": false, \"answer\": \"剪式\"}, {\"right\": false, \"answer\": \"跨越式\"}, {\"right\": true, \"answer\": \"背越式\"}, {\"right\": false, \"answer\": \"俯卧式 \"}]'),
(267, 5, '一般来说，人到了多少岁，骺软骨就完全骨化，骨的长度不在增长？', '[{\"right\": true, \"answer\": \"18—20\"}, {\"right\": false, \"answer\": \"20—22\"}, {\"right\": false, \"answer\": \"20—25\"}, {\"right\": false, \"answer\": \"22--25\"}]'),
(268, 5, '有五支篮球队参加比赛，若采用单循环赛制，则共有几场比赛？', '[{\"right\": true, \"answer\": \"10\"}, {\"right\": false, \"answer\": \"12\"}, {\"right\": false, \"answer\": \"15\"}, {\"right\": false, \"answer\": \"20\"}]'),
(269, 5, '单手肩上投篮时，全身协调用力，手指拨球，使球向哪个方向旋转？', '[{\"right\": false, \"answer\": \"左\"}, {\"right\": false, \"answer\": \"右\"}, {\"right\": false, \"answer\": \"前\"}, {\"right\": true, \"answer\": \"后\"}]'),
(270, 5, '原地双手低手传、接球适用于在什么战术配合下运用？ ', '[{\"right\": false, \"answer\": \"进攻\"}, {\"right\": false, \"answer\": \"防守\"}, {\"right\": true, \"answer\": \"掩护\"}, {\"right\": false, \"answer\": \"突分\"}]'),
(271, 5, '什么进攻战术形式，是进攻战术中最简单、最基本的战术形式？', '[{\"right\": true, \"answer\": \"中一二\"}, {\"right\": false, \"answer\": \"边一二\"}, {\"right\": false, \"answer\": \"后排插上\"}, {\"right\": false, \"answer\": \"交叉换位 \"}]'),
(272, 5, '中长跑起源于哪个国家?', '[{\"right\": true, \"answer\": \"英国\"}, {\"right\": false, \"answer\": \"美国\"}, {\"right\": false, \"answer\": \"德国\"}, {\"right\": false, \"answer\": \"中国\"}]'),
(273, 5, '乒乓球起源于哪个国家?', '[{\"right\": false, \"answer\": \"中国\"}, {\"right\": true, \"answer\": \"英国\"}, {\"right\": false, \"answer\": \"美国\"}, {\"right\": false, \"answer\": \"韩国 \"}]'),
(274, 5, '被称为“世界第一运动”的是什么运动?', '[{\"right\": false, \"answer\": \"篮球\"}, {\"right\": false, \"answer\": \"羽毛球\"}, {\"right\": false, \"answer\": \"排球\"}, {\"right\": true, \"answer\": \"足球\"}]'),
(275, 5, '2008年北京奥运会是第几届？', '[{\"right\": false, \"answer\": \"26\"}, {\"right\": false, \"answer\": \"27\"}, {\"right\": true, \"answer\": \"28\"}, {\"right\": false, \"answer\": \"29\"}]'),
(276, 5, '北京2008年奥运会口号是？', '[{\"right\": true, \"answer\": \"同一个世界\"}, {\"right\": false, \"answer\": \"同一个梦想\"}, {\"right\": false, \"answer\": \"美丽中国\"}, {\"right\": false, \"answer\": \"美丽奥运\"}]'),
(277, 5, '第27届奥运会中，我国在奖牌大国中位居第几位？', '[{\"right\": false, \"answer\": \"1\"}, {\"right\": false, \"answer\": \"2\"}, {\"right\": true, \"answer\": \"3\"}, {\"right\": false, \"answer\": \"4\"}]'),
(278, 5, '冬季奥运会共举办过多少届？', '[{\"right\": true, \"answer\": \"20\"}, {\"right\": false, \"answer\": \"21\"}, {\"right\": false, \"answer\": \"22\"}, {\"right\": false, \"answer\": \"23\"}]'),
(279, 5, '国际奥委会最高领导人任期为几年？', '[{\"right\": false, \"answer\": \"4\"}, {\"right\": true, \"answer\": \"8\"}, {\"right\": false, \"answer\": \"12\"}, {\"right\": false, \"answer\": \"16\"}]'),
(280, 5, '足球比赛时,驱逐球员出场用的牌子为什么颜色？', '[{\"right\": false, \"answer\": \"黄色\"}, {\"right\": true, \"answer\": \"红色\"}, {\"right\": false, \"answer\": \"橘色\"}, {\"right\": false, \"answer\": \"白色\"}]'),
(281, 5, '一般国际足球赛的比赛时间为分钟？', '[{\"right\": true, \"answer\": \"九十\"}, {\"right\": false, \"answer\": \"八十\"}, {\"right\": false, \"answer\": \"七十\"}, {\"right\": false, \"answer\": \"六十分钟\"}]'),
(282, 5, '在2012年NBA总决赛中，三届最有价值球员谁终于实现了职业生涯', '[{\"right\": true, \"answer\": \"姚明\"}, {\"right\": false, \"answer\": \"科比\"}, {\"right\": false, \"answer\": \"詹姆斯\"}, {\"right\": false, \"answer\": \"梅西\"}]'),
(283, 5, '游泳比赛时，个人混合泳的姿势顺序是？', '[{\"right\": true, \"answer\": \" 蝶泳；仰泳；蛙泳；自由泳\"}, {\"right\": false, \"answer\": \"仰泳；蝶泳；蛙泳；自由泳\"}, {\"right\": false, \"answer\": \"蝶泳；蛙泳；仰泳；自由泳\"}, {\"right\": false, \"answer\": \"自由泳；仰泳；蛙泳；蝶泳\"}]'),
(284, 5, '以下不是被称为世界三大体育赛事的是？', '[{\"right\": false, \"answer\": \"奥运会\"}, {\"right\": false, \"answer\": \"世界杯\"}, {\"right\": true, \"answer\": \"亚运会\"}, {\"right\": false, \"answer\": \"F1方程式赛车 \"}]'),
(285, 5, '中国第一个参加奥运会的运动员是？', '[{\"right\": true, \"answer\": \"刘长春\"}, {\"right\": false, \"answer\": \"葛菲\"}, {\"right\": false, \"answer\": \"顾俊\"}, {\"right\": false, \"answer\": \"陈静\"}]'),
(286, 5, '自1894年起共有多少人被受任为奥委会主席？', '[{\"right\": false, \"answer\": \"5\"}, {\"right\": false, \"answer\": \"6\"}, {\"right\": false, \"answer\": \"7\"}, {\"right\": true, \"answer\": \"8\"}]'),
(287, 5, '古代第一届奥林匹克运动会是哪一年举行的？', '[{\"right\": true, \"answer\": \"公元前776年\"}, {\"right\": false, \"answer\": \"公元前772年\"}, {\"right\": false, \"answer\": \"公元前768年\"}, {\"right\": false, \"answer\": \"公元前764年\"}]'),
(288, 5, '亚洲首次举办奥运会的时间是1964年，其举办地是？', '[{\"right\": false, \"answer\": \"俄罗斯\"}, {\"right\": false, \"answer\": \"韩国\"}, {\"right\": true, \"answer\": \"日本\"}, {\"right\": false, \"answer\": \"朝鲜\"}]'),
(289, 5, '现代奥运会上年龄最大的冠军 奥斯卡-斯旺最后一次登上领奖台是多少', '[{\"right\": true, \"answer\": \"73岁\"}, {\"right\": false, \"answer\": \"74岁\"}, {\"right\": false, \"answer\": \"75岁\"}, {\"right\": false, \"answer\": \"76岁\"}]'),
(290, 5, '第一次兴奋剂检测工作开始于几几 年？', '[{\"right\": false, \"answer\": \"1945年\"}, {\"right\": true, \"answer\": \"1955年\"}, {\"right\": false, \"answer\": \"1965年\"}, {\"right\": false, \"answer\": \"1975年\"}]'),
(291, 5, '连续参加了四届奥运会，且都获得奖牌的中国运动员是谁？', '[{\"right\": true, \"answer\": \"熊倪\"}, {\"right\": false, \"answer\": \"刘翔\"}, {\"right\": false, \"answer\": \"李宁\"}, {\"right\": false, \"answer\": \"郭晶晶\"}]'),
(292, 5, '现代奥运会的创始人是谁?', '[{\"right\": true, \"answer\": \"顾拜旦\"}, {\"right\": false, \"answer\": \"安素泰\"}, {\"right\": false, \"answer\": \"铁斯\"}, {\"right\": false, \"answer\": \"埃姆斯\"}]'),
(293, 5, '第一位把标枪投过100米大关的是？', '[{\"right\": false, \"answer\": \"魏庆光 \"}, {\"right\": false, \"answer\": \"庄永\"}, {\"right\": false, \"answer\": \"曾国强 \"}, {\"right\": true, \"answer\": \"霍恩\"}]'),
(294, 5, '足球主教练中年薪最高的是？', '[{\"right\": true, \"answer\": \"穆里尼奥\"}, {\"right\": false, \"answer\": \"弗格森\"}, {\"right\": false, \"answer\": \"卡佩罗\"}, {\"right\": false, \"answer\": \"希斯菲尔德\"}]'),
(295, 5, '排球场地上的线一般有几条（种）？', '[{\"right\": false, \"answer\": \"3\"}, {\"right\": false, \"answer\": \"4\"}, {\"right\": true, \"answer\": \"5\"}, {\"right\": false, \"answer\": \"6\"}]'),
(296, 9, '《名侦探柯南》中服部平次是哪里人？', '[{\"right\": true, \"answer\": \"大阪\"}, {\"right\": false, \"answer\": \"东京\"}, {\"right\": false, \"answer\": \"横滨\"}, {\"right\": false, \"answer\": \"神户\"}]'),
(297, 9, '《火影忍者》中的第五代火影是谁？', '[{\"right\": false, \"answer\": \"旗木卡卡西\"}, {\"right\": true, \"answer\": \"千手纲手\"}, {\"right\": false, \"answer\": \"波风水门\"}, {\"right\": false, \"answer\": \"千手扉间\"}]'),
(298, 9, '《数码兽大冒险》中第八位被选召的孩子是？', '[{\"right\": false, \"answer\": \"武之内素娜/武之内空\"}, {\"right\": false, \"answer\": \"城户丈\"}, {\"right\": false, \"answer\": \"泉光子郎\"}, {\"right\": true, \"answer\": \"八神光/八神嘉儿\"}]'),
(299, 9, '《魔法禁书目录》中炮姐的最爱是？', '[{\"right\": false, \"answer\": \"贺氏Y太\"}, {\"right\": false, \"answer\": \"哞太\"}, {\"right\": true, \"answer\": \"呱太\"}, {\"right\": false, \"answer\": \"咩太\"}]'),
(300, 9, '《哆啦A梦》中多啦A梦是从什么时代来的？', '[{\"right\": false, \"answer\": \"21世纪\"}, {\"right\": false, \"answer\": \"25世纪\"}, {\"right\": false, \"answer\": \"23世纪\"}, {\"right\": true, \"answer\": \"22世纪\"}]'),
(301, 9, '《海贼王》中与路飞同行的一位厨师是？', '[{\"right\": true, \"answer\": \"娜美\"}, {\"right\": false, \"answer\": \"香奈儿\"}, {\"right\": false, \"answer\": \"香吉士\"}, {\"right\": false, \"answer\": \"赤犬\"}]'),
(302, 9, '《我的妹妹不可能这么可爱》中五更琉璃的CV是谁？', '[{\"right\": false, \"answer\": \"花泽香菜\"}, {\"right\": false, \"answer\": \"钉宫理惠\"}, {\"right\": true, \"answer\": \"丰崎爱生\"}, {\"right\": false, \"answer\": \"林原惠美\"}]'),
(303, 9, '《火影忍者》中4代火影和主角鸣人是什么关系？', '[{\"right\": false, \"answer\": \"朋友\"}, {\"right\": false, \"answer\": \"兄弟\"}, {\"right\": true, \"answer\": \"父子\"}, {\"right\": false, \"answer\": \"情敌\"}]'),
(304, 9, '《我的朋友很少》中，井上麻里奈为哪个角色配音？', '[{\"right\": false, \"answer\": \"三日月太空\"}, {\"right\": false, \"answer\": \"三日月空太\"}, {\"right\": false, \"answer\": \"三日月夜空\"}, {\"right\": true, \"answer\": \"三日月星空\"}]'),
(305, 9, '动漫11区指哪里？', '[{\"right\": false, \"answer\": \"美国\"}, {\"right\": false, \"answer\": \"中国\"}, {\"right\": false, \"answer\": \"英国\"}, {\"right\": true, \"answer\": \"日本\"}]'),
(306, 9, '阿姆斯特朗回旋加速喷气式阿姆斯特朗炮“的名字出自哪部动漫？', '[{\"right\": false, \"answer\": \"《潜行吧！奈亚子》\"}, {\"right\": true, \"answer\": \"《旋风管家》\"}, {\"right\": false, \"answer\": \"《中二病也要谈恋爱》\"}, {\"right\": false, \"answer\": \"《银魂》\"}]'),
(307, 9, '《魔法少女小圆》的编剧（脚本）是谁？', '[{\"right\": false, \"answer\": \"冈本伦\"}, {\"right\": false, \"answer\": \"虚渊玄\"}, {\"right\": false, \"answer\": \"尾田荣一郎\"}, {\"right\": true, \"answer\": \"青山刚昌\"}]'),
(308, 9, '《火影忍者》中，宇智波佐助所拥有的瞳术的名字是？', '[{\"right\": false, \"answer\": \"光盘眼\"}, {\"right\": false, \"answer\": \"白眼\"}, {\"right\": false, \"answer\": \"轮回眼\"}, {\"right\": true, \"answer\": \"写轮眼\"}]'),
(309, 9, '《轻音少女》动画中，活动室里养的动物是？', '[{\"right\": true, \"answer\": \"兔子\"}, {\"right\": false, \"answer\": \"鹦鹉\"}, {\"right\": false, \"answer\": \"猫\"}, {\"right\": false, \"answer\": \"乌龟\"}]'),
(310, 9, '《魁拔》中，魁拔的重生时间是？', '[{\"right\": false, \"answer\": \"333年\"}, {\"right\": false, \"answer\": \"666年\"}, {\"right\": false, \"answer\": \"999年\"}, {\"right\": true, \"answer\": \"123年\"}]'),
(311, 9, '《天降之物》第一集中从天而降的天使名字是？', '[{\"right\": false, \"answer\": \"宙斯\"}, {\"right\": true, \"answer\": \"哈雷路亚\"}, {\"right\": false, \"answer\": \"伊洛斯儿\"}, {\"right\": false, \"answer\": \"伊卡洛斯\"}]'),
(312, 9, 'FFF团出自哪部动漫？', '[{\"right\": true, \"answer\": \"《gosick》\"}, {\"right\": false, \"answer\": \"《笨蛋测试召唤兽》\"}, {\"right\": false, \"answer\": \"《刀剑神域》\"}, {\"right\": false, \"answer\": \"《凉宫春日的忧郁》\"}]'),
(313, 9, '《加速世界》男主角是谁？', '[{\"right\": true, \"answer\": \"有田春雪\"}, {\"right\": false, \"answer\": \"初号机\"}, {\"right\": false, \"answer\": \"黛拓武.\"}, {\"right\": false, \"answer\": \"有田夏雪\"}]'),
(314, 9, '《叛逆的鲁路修》中，C.C.的头发的颜色是？', '[{\"right\": false, \"answer\": \"绿色\"}, {\"right\": false, \"answer\": \"红色\"}, {\"right\": true, \"answer\": \"紫色\"}, {\"right\": false, \"answer\": \"黑色\"}]'),
(315, 9, '为动漫《魔法少女小圆》中佐仓杏子一角配音的声优是？', '[{\"right\": true, \"answer\": \"斋藤千和\"}, {\"right\": false, \"answer\": \"喜多村英梨\"}, {\"right\": false, \"answer\": \"野中蓝\"}, {\"right\": false, \"answer\": \"悠木碧\"}]'),
(316, 9, '《Angel Be Ast》的女主角是谁？', '[{\"right\": false, \"answer\": \"立华奏\"}, {\"right\": false, \"answer\": \"音无结弦\"}, {\"right\": false, \"answer\": \"仲村由理\"}, {\"right\": true, \"answer\": \"日向秀树\"}]'),
(317, 9, '《中二病也要谈恋爱》中小鸟游六花的姐姐叫什么名字？', '[{\"right\": false, \"answer\": \"小鸟游七花\"}, {\"right\": false, \"answer\": \"小鸟游八花\"}, {\"right\": true, \"answer\": \"小鸟游九花\"}, {\"right\": false, \"answer\": \"小鸟游十花\"}]'),
(318, 9, '《未来日记》中女主叫什么名字?', '[{\"right\": false, \"answer\": \"平坂黄泉\"}, {\"right\": false, \"answer\": \"火山高夫\"}, {\"right\": true, \"answer\": \"我妻由乃\"}, {\"right\": false, \"answer\": \"天野雪辉\"}]'),
(319, 9, '《银魂》中男主角是谁?', '[{\"right\": true, \"answer\": \"坂田金时\"}, {\"right\": false, \"answer\": \"坂田甜食\"}, {\"right\": false, \"answer\": \"坂田银时\"}, {\"right\": false, \"answer\": \"坂田零食\"}]'),
(320, 9, '《冰菓》中奉太郎的人生信条是？', '[{\"right\": false, \"answer\": \"节能主义\"}, {\"right\": false, \"answer\": \"反对恋爱\"}, {\"right\": true, \"answer\": \"脱离中二\"}, {\"right\": false, \"answer\": \"和平主义\"}]'),
(321, 9, '《进击的巨人中》兵长的身高是多少？', '[{\"right\": true, \"answer\": \"70m\"}, {\"right\": false, \"answer\": \"75m\"}, {\"right\": false, \"answer\": \"60m\"}, {\"right\": false, \"answer\": \"80m\"}]'),
(322, 9, '《刀剑神域》中桐人的真名是什么？', '[{\"right\": false, \"answer\": \"桐谷和人\"}, {\"right\": false, \"answer\": \"桐山和人\"}, {\"right\": true, \"answer\": \"桐和谷人\"}, {\"right\": false, \"answer\": \"桐叶和人\"}]'),
(323, 9, '圣斗士星矢的看家技能是？', '[{\"right\": false, \"answer\": \"天马钻石拳\"}, {\"right\": false, \"answer\": \"天马陨石拳\"}, {\"right\": false, \"answer\": \"天马流星拳\"}, {\"right\": true, \"answer\": \"天马星辰拳\"}]'),
(324, 9, '《蜡笔小新》中主人公小新的姓氏是什么？', '[{\"right\": false, \"answer\": \"小山\"}, {\"right\": true, \"answer\": \"风间\"}, {\"right\": false, \"answer\": \"吉永\"}, {\"right\": false, \"answer\": \"野原\"}]'),
(325, 9, '命运石之门男主角的网名是', '[{\"right\": false, \"answer\": \"约翰·提托\"}, {\"right\": false, \"answer\": \"凤凰院凶真\"}, {\"right\": true, \"answer\": \"栗悟饭和龟派气功\"}, {\"right\": false, \"answer\": \"凤凰院胸针\"}]'),
(326, 9, '在《死亡笔记》中，是谁杀死了夜神月？', '[{\"right\": false, \"answer\": \"魅上照\"}, {\"right\": false, \"answer\": \"龙崎（L）\"}, {\"right\": false, \"answer\": \"硫克\"}, {\"right\": true, \"answer\": \"尼亚\"}]'),
(327, 9, '《魔笛M AGI》中梶裕貴配音的角色是谁？', '[{\"right\": false, \"answer\": \"阿西巴巴\"}, {\"right\": false, \"answer\": \"卡西巴巴\"}, {\"right\": true, \"answer\": \"咔叽巴巴\"}, {\"right\": false, \"answer\": \"阿里巴巴\"}]'),
(328, 9, '《凉宫春日的忧郁》中SOS团团长的名字是', '[{\"right\": true, \"answer\": \"须川亮\"}, {\"right\": false, \"answer\": \"千反田爱瑠\"}, {\"right\": false, \"answer\": \"凉宫春日\"}, {\"right\": false, \"answer\": \"库洛洛鲁西鲁\"}]'),
(329, 9, '《摇曳百合》中京子喜爱的冰淇淋口味是什么？', '[{\"right\": true, \"answer\": \"朗姆酒葡萄干\"}, {\"right\": false, \"answer\": \"提拉米苏黑莓\"}, {\"right\": false, \"answer\": \"覆盆子柠檬\"}, {\"right\": false, \"answer\": \"焦糖巧克力\"}]'),
(330, 9, '在《F Ate/st Ay night》中阿尔托莉雅的职介是什么', '[{\"right\": false, \"answer\": \"S ABER\"}, {\"right\": false, \"answer\": \"L ANCER\"}, {\"right\": false, \"answer\": \"C ASTER\"}, {\"right\": true, \"answer\": \"RIDER\"}]'),
(331, 9, '国产动画《魁拔》中，主角的名字是？', '[{\"right\": true, \"answer\": \"三十张\"}, {\"right\": false, \"answer\": \"野吉\"}, {\"right\": false, \"answer\": \"蛮凶\"}, {\"right\": false, \"answer\": \"蛮吉\"}]'),
(332, 9, '《妖精的尾巴》中，妖精的尾巴公会的第二代灭龙魔导士是', '[{\"right\": false, \"answer\": \"拉克萨斯\"}, {\"right\": false, \"answer\": \"伽吉鲁\"}, {\"right\": false, \"answer\": \"温蒂\"}, {\"right\": true, \"answer\": \"纳兹\"}]'),
(333, 9, '《刀剑神域》中桐人他女儿结衣在ALO里系统识别种族是？', '[{\"right\": false, \"answer\": \"人工智能\"}, {\"right\": false, \"answer\": \"精神健康辅助程序\"}, {\"right\": true, \"answer\": \"NPC\"}, {\"right\": false, \"answer\": \"导航妖精\"}]'),
(334, 9, '《犬夜叉》中犬夜叉使用的武器叫什么？', '[{\"right\": false, \"answer\": \"阎魔刀\"}, {\"right\": false, \"answer\": \"叛逆之剑\"}, {\"right\": false, \"answer\": \"铁碎牙\"}, {\"right\": true, \"answer\": \"天生牙\"}]'),
(335, 9, '《黑子的篮球》中黑子所在的队伍叫什么？', '[{\"right\": false, \"answer\": \"桐皇\"}, {\"right\": true, \"answer\": \"阳泉\"}, {\"right\": false, \"answer\": \"海常\"}, {\"right\": false, \"answer\": \"诚凛\"}]'),
(336, 9, '《刀剑神域》中莉法是桐人什么人？', '[{\"right\": false, \"answer\": \"姐姐\"}, {\"right\": false, \"answer\": \"妹妹\"}, {\"right\": false, \"answer\": \"女儿\"}, {\"right\": true, \"answer\": \"妻子\"}]'),
(337, 9, '《冰菓》中千反田爱馏和折木奉太郎的瞳色是？', '[{\"right\": true, \"answer\": \"黄色和蓝色\"}, {\"right\": false, \"answer\": \"红色和绿色\"}, {\"right\": false, \"answer\": \"蓝色和黑色\"}, {\"right\": false, \"answer\": \"紫色和绿色\"}]'),
(338, 9, '《未来日记》中天野雪辉是几号？', '[{\"right\": true, \"answer\": \"1\"}, {\"right\": false, \"answer\": \"3\"}, {\"right\": false, \"answer\": \"6\"}, {\"right\": false, \"answer\": \"5\"}]'),
(339, 9, '《银魂》中坂田银时的配刀叫什么', '[{\"right\": false, \"answer\": \"洞爷湖\"}, {\"right\": false, \"answer\": \"胧村正\"}, {\"right\": true, \"answer\": \"逆刃刀\"}, {\"right\": false, \"answer\": \"斩月\"}]'),
(340, 9, '《Another》中谁是多余的人？', '[{\"right\": false, \"answer\": \"风见智彦\"}, {\"right\": false, \"answer\": \"榊原恒一\"}, {\"right\": true, \"answer\": \"三神怜子\"}, {\"right\": false, \"answer\": \"见崎鸣\"}]'),
(341, 9, '《七龙珠》的作者是谁？', '[{\"right\": false, \"answer\": \"鸡山鸣\"}, {\"right\": false, \"answer\": \"鸭山鸣\"}, {\"right\": false, \"answer\": \"鸟山鸣\"}, {\"right\": true, \"answer\": \"乌山鸣\"}]'),
(342, 9, '《魔法禁书目录》中御坂美琴是LV几的能力者？', '[{\"right\": true, \"answer\": \"LV4\"}, {\"right\": false, \"answer\": \"LV3\"}, {\"right\": false, \"answer\": \"LV6\"}, {\"right\": false, \"answer\": \"LV5\"}]'),
(343, 9, '童年动画《黑猫警长》每集打四枪出现四个字是？', '[{\"right\": false, \"answer\": \"百步穿杨\"}, {\"right\": false, \"answer\": \"惩奸除恶\"}, {\"right\": true, \"answer\": \"请看下集\"}, {\"right\": false, \"answer\": \"保卫人民\"}]'),
(344, 9, '下列4项那个不是key社“三大催泪弹”之一？', '[{\"right\": false, \"answer\": \"Air\"}, {\"right\": false, \"answer\": \"Clannad\"}, {\"right\": false, \"answer\": \"Kanon\"}, {\"right\": true, \"answer\": \"Rewire\"}]'),
(345, 9, '中二病也要谈恋爱里女主角收藏的枪是什么枪？', '[{\"right\": true, \"answer\": \"毛瑟军用手枪\"}, {\"right\": false, \"answer\": \"勃朗宁M1910\"}, {\"right\": false, \"answer\": \"左轮\"}, {\"right\": false, \"answer\": \"MP5\"}]'),
(346, 9, '下面那位不是钉宫四萌之一', '[{\"right\": false, \"answer\": \"夏娜\"}, {\"right\": true, \"answer\": \"亚里亚\"}, {\"right\": false, \"answer\": \"逢坂大河\"}, {\"right\": false, \"answer\": \"三千院凪\"}]'),
(347, 9, '金坷垃的原产地位于？ ', '[{\"right\": true, \"answer\": \"圣地亚哥\"}, {\"right\": false, \"answer\": \"圣彼得堡\"}, {\"right\": false, \"answer\": \"圣西罗\"}, {\"right\": false, \"answer\": \"圣保罗\"}]'),
(348, 9, '招牌口头禅是うるさいうるさいうるさい是哪位动漫人物？ ', '[{\"right\": false, \"answer\": \"露易丝\"}, {\"right\": false, \"answer\": \"夏娜\"}, {\"right\": false, \"answer\": \"三千院凪\"}, {\"right\": true, \"answer\": \"逢坂大河\"}]'),
(349, 9, '《这是僵尸吗》中男主的武器叫什么名字？', '[{\"right\": false, \"answer\": \"克里斯丁\"}, {\"right\": false, \"answer\": \"优克莉伍德·海尔赛兹\"}, {\"right\": false, \"answer\": \"萨拉丝巴蒂\"}, {\"right\": true, \"answer\": \"米斯特汀\"}]'),
(350, 9, 'K中的猴哥是指谁？', '[{\"right\": false, \"answer\": \"伏见猿比古\"}, {\"right\": false, \"answer\": \"夜刀神狗朗\"}, {\"right\": false, \"answer\": \"亚达酱\"}, {\"right\": true, \"answer\": \"八田美咲\"}]'),
(351, 9, '动漫中出了很多本子的女性角色我们一般叫她们什么？', '[{\"right\": false, \"answer\": \"女主角\"}, {\"right\": false, \"answer\": \"劳模\"}, {\"right\": false, \"answer\": \"淑女\"}, {\"right\": true, \"answer\": \"女绅士\"}]'),
(352, 9, '以下哪位不是世界知名的数学家？', '[{\"right\": true, \"answer\": \"爱因斯坦\"}, {\"right\": false, \"answer\": \"欧几里得\"}, {\"right\": false, \"answer\": \"牛顿\"}, {\"right\": false, \"answer\": \"毕达哥拉斯\"}]'),
(353, 9, '翠星石的双瞳是什么颜色的？', '[{\"right\": false, \"answer\": \"左红右绿\"}, {\"right\": true, \"answer\": \"左绿右红\"}, {\"right\": false, \"answer\": \"左右皆红\"}, {\"right\": false, \"answer\": \"左右皆绿\"}]'),
(354, 9, '《旋风管家》中的女主角三千院凪的身高是？', '[{\"right\": false, \"answer\": \"154\"}, {\"right\": false, \"answer\": \"143\"}, {\"right\": true, \"answer\": \"138\"}, {\"right\": false, \"answer\": \"163\"}]'),
(355, 9, '以下哪个动漫人物被作为我朝四代隐形战机的爱称？', '[{\"right\": false, \"answer\": \"阎魔爱\"}, {\"right\": false, \"answer\": \"蓬莱山辉夜\"}, {\"right\": false, \"answer\": \"谏山黄泉\"}, {\"right\": true, \"answer\": \"秋山澪\"}]'),
(356, 9, '\"既不回头，何必不忘”出自哪部游戏？', '[{\"right\": true, \"answer\": \"仙剑奇侠传\"}, {\"right\": false, \"answer\": \"隋唐英雄传\"}, {\"right\": false, \"answer\": \"三国赵云传\"}, {\"right\": false, \"answer\": \"金庸群侠传\"}]'),
(357, 9, '以下是《某科学的超电磁炮》《黑子的篮球》《潜行吧！奈亚子》的共同', '[{\"right\": false, \"answer\": \"篮球\"}, {\"right\": false, \"answer\": \"黑子的声优\"}, {\"right\": true, \"answer\": \"黑子\"}, {\"right\": false, \"answer\": \"炮姐\"}]'),
(358, 9, '金坷垃不能辅助农作物吸收哪种元素？', '[{\"right\": false, \"answer\": \"钾\"}, {\"right\": true, \"answer\": \"钙\"}, {\"right\": false, \"answer\": \"磷\"}, {\"right\": false, \"answer\": \"氮\"}]'),
(359, 9, '《化物语》中男主人公“阿良良木历”那广为流传的绰号是什么？', '[{\"right\": true, \"answer\": \"阿垃垃圾君\"}, {\"right\": false, \"answer\": \"阿萝萝莉控\"}, {\"right\": false, \"answer\": \"阿良良木健\"}, {\"right\": false, \"answer\": \"阿变变态狂\"}]'),
(360, 9, '无论多高的地方跳下,只要有稻草堆就不会受伤的技能是?', '[{\"right\": false, \"answer\": \"纵身一跃\"}, {\"right\": true, \"answer\": \"信仰之跃\"}, {\"right\": false, \"answer\": \"草之奥义\"}, {\"right\": false, \"answer\": \"闪现\"}]'),
(361, 9, '普遍认为，“金坷垃”系列中的非洲人的真名是？', '[{\"right\": false, \"answer\": \"北仙要\"}, {\"right\": false, \"answer\": \"南仙要\"}, {\"right\": false, \"answer\": \"西先要\"}, {\"right\": true, \"answer\": \"东仙要\"}]'),
(362, 9, '动漫《灌篮高手》中，下列哪支队伍是湘北队没有击败过的？', '[{\"right\": false, \"answer\": \"湘南队\"}, {\"right\": true, \"answer\": \"海南队\"}, {\"right\": false, \"answer\": \"湖南队\"}, {\"right\": false, \"answer\": \"江南对\"}]'),
(363, 9, '《英雄传说》系列中，噬身之蛇执行者的NO.XV是', '[{\"right\": false, \"answer\": \"“漆黑之牙”\"}, {\"right\": true, \"answer\": \"“歼灭天使”\"}, {\"right\": false, \"answer\": \"“瘦狼”\"}, {\"right\": false, \"answer\": \"“剑帝”\"}]'),
(364, 9, '白熊咖啡厅中企鹅先生总是点哪一款咖啡？', '[{\"right\": false, \"answer\": \"原味咖啡\"}, {\"right\": false, \"answer\": \"黑咖啡\"}, {\"right\": true, \"answer\": \"摩卡咖啡\"}, {\"right\": false, \"answer\": \"卡布基诺\"}]'),
(365, 9, '《学园默示录》中“守住男人的尊严，是女人的矜持”是谁的名台词？', '[{\"right\": false, \"answer\": \"鞠川静香\"}, {\"right\": true, \"answer\": \"毒岛冴子\"}, {\"right\": false, \"answer\": \"宫本丽\"}, {\"right\": false, \"answer\": \"高城沙耶\"}]'),
(366, 9, '动画《Angel Beats!》中，参加卒业式的成员共有几人？', '[{\"right\": false, \"answer\": \"4人\"}, {\"right\": false, \"answer\": \"6人\"}, {\"right\": true, \"answer\": \"5人\"}, {\"right\": false, \"answer\": \"7人\"}]'),
(367, 9, '以下动漫人物不是粉毛的是？ ', '[{\"right\": false, \"answer\": \"露易丝\"}, {\"right\": true, \"answer\": \"维多利加·德·布洛瓦\"}, {\"right\": false, \"answer\": \"骷髅宫歌留多\"}, {\"right\": false, \"answer\": \"鹿目园香\"}]'),
(368, 9, '《轩辕剑3》中的主角四人组是?', '[{\"right\": false, \"answer\": \"赛特尼库卡玛李静\"}, {\"right\": false, \"answer\": \"赛特妮可卡尔玛李青\"}, {\"right\": true, \"answer\": \"赛德妮可卡玛李靖\"}, {\"right\": false, \"answer\": \"赛特妮可卡玛李靖\"}]'),
(369, 9, '2012年海蓝项链的获得者是？ ', '[{\"right\": false, \"answer\": \"本间芽衣子\"}, {\"right\": true, \"answer\": \"立华奏\"}, {\"right\": false, \"answer\": \"春日野穹\"}, {\"right\": false, \"answer\": \"黑雪姬\"}]'),
(370, 9, '在黑执事中，是谁杀死了红夫人？ ', '[{\"right\": false, \"answer\": \"夏尔-凡多姆海恩\"}, {\"right\": false, \"answer\": \"塞巴斯蒂安-米凯艾利斯\"}, {\"right\": true, \"answer\": \"格雷尔-萨多格里夫\"}, {\"right\": false, \"answer\": \"威廉-威廉T-斯皮尔特\"}]'),
(371, 9, '活该绿帽子！”这句话形容了男人的一个什么状态？ ', '[{\"right\": false, \"answer\": \"马头人\"}, {\"right\": false, \"answer\": \"猪头人\"}, {\"right\": false, \"answer\": \"羊头人\"}, {\"right\": true, \"answer\": \"牛头人\"}]'),
(372, 9, '最早的一部内部操控式大型萝卜片是什么？ ', '[{\"right\": false, \"answer\": \"铁人28号\"}, {\"right\": true, \"answer\": \"魔神Z\"}, {\"right\": false, \"answer\": \"盖塔\"}, {\"right\": false, \"answer\": \"高达0079\"}]'),
(373, 9, '洛克人X系列登场的两位主角中，红色的思考型机器人叫什么名字？ ', '[{\"right\": true, \"answer\": \"ZERO\"}, {\"right\": false, \"answer\": \"ZORRO\"}, {\"right\": false, \"answer\": \"ZERA\"}, {\"right\": false, \"answer\": \"ZELO\"}]'),
(374, 9, '动画《口袋妖怪》引发的“3D龙事件”让人们认识到了一种什么病症？', '[{\"right\": true, \"answer\": \"急性光过敏症\"}, {\"right\": false, \"answer\": \"眩晕症\"}, {\"right\": false, \"answer\": \"自闭症\"}, {\"right\": false, \"answer\": \"选择性失忆症\"}]'),
(375, 9, '死神里2000年前发生了哪个重要的事件', '[{\"right\": true, \"answer\": \"尸魂界净灵廷——真央灵术院成立\"}, {\"right\": false, \"answer\": \"死神为避免世界毁灭而屠杀了灭却师一族\"}, {\"right\": false, \"answer\": \"山本担任总队长\"}, {\"right\": false, \"answer\": \"尸魂界净灵廷——碎蜂加入刑军\"}]'),
(376, 7, '王先生的QQ签名档最近改成了“庆祝弄璋之喜”，王先生近来的喜事是', '[{\"right\": false, \"answer\": \"新婚\"}, {\"right\": false, \"answer\": \"搬家\"}, {\"right\": true, \"answer\": \"妻子生了个男孩 \"}, {\"right\": false, \"answer\": \"考试通过\"}]'),
(377, 7, '“爆竹声中一岁除，春风送暖入屠苏”，这里的“屠苏”指的是', '[{\"right\": false, \"answer\": \"苏州\"}, {\"right\": false, \"answer\": \"房屋\"}, {\"right\": true, \"answer\": \"酒 \"}, {\"right\": false, \"answer\": \"庄稼\"}]'),
(378, 7, '“月上柳梢头，人约黄昏后”描写的是哪个传统节日?　', '[{\"right\": false, \"answer\": \"中秋节\"}, {\"right\": true, \"answer\": \"元宵节\"}, {\"right\": false, \"answer\": \"端午节 \"}, {\"right\": false, \"answer\": \"七夕节\"}]'),
(379, 7, '下列哪个成语典故与项羽有关?', '[{\"right\": false, \"answer\": \"隔岸观火\"}, {\"right\": false, \"answer\": \" 暗度陈仓\"}, {\"right\": false, \"answer\": \" 背水一战\"}, {\"right\": true, \"answer\": \"破釜沉舟 \"}]'),
(380, 7, '《百家姓》中没有下面哪个姓?', '[{\"right\": false, \"answer\": \"乌\"}, {\"right\": false, \"answer\": \"巫\"}, {\"right\": true, \"answer\": \"肖 \"}, {\"right\": false, \"answer\": \"萧\"}]'),
(381, 7, '“鄂尔多斯”在蒙古语中是什么意思?', '[{\"right\": false, \"answer\": \"大草原\"}, {\"right\": false, \"answer\": \"盛产羊毛的地方\"}, {\"right\": true, \"answer\": \"众多宫殿 \"}, {\"right\": false, \"answer\": \"美丽的地方\"}]'),
(382, 7, '京剧《贵妃醉酒》是根据哪部古代戏曲改编而成的?', '[{\"right\": false, \"answer\": \"《桃花扇》\"}, {\"right\": true, \"answer\": \"《长生殿》\"}, {\"right\": false, \"answer\": \"《牡丹亭》 \"}, {\"right\": false, \"answer\": \"《南柯梦》\"}]'),
(383, 7, '道家思想在我国影响深远，请问历史中的哪一时期最接近道家所主张的无', '[{\"right\": true, \"answer\": \"文景之治\"}, {\"right\": false, \"answer\": \"光武中兴\"}, {\"right\": false, \"answer\": \"贞观之治 \"}, {\"right\": false, \"answer\": \"开无盛世\"}]'),
(384, 7, '下面哪句话出自《孟子》?', '[{\"right\": false, \"answer\": \"水能载舟，亦能覆舟\"}, {\"right\": false, \"answer\": \"先天下之忧而忧，后天下之乐而乐\"}, {\"right\": false, \"answer\": \"民惟邦本，本固邦宁 \"}, {\"right\": true, \"answer\": \"独乐乐，与人乐乐，熟乐\"}]'),
(385, 7, '墨子的主要思想是“兼爱”，他所反对的“爱有差等”这一观点是哪家学', '[{\"right\": true, \"answer\": \"儒家\"}, {\"right\": false, \"answer\": \"法家\"}, {\"right\": false, \"answer\": \"道家 \"}, {\"right\": false, \"answer\": \"名家\"}]'),
(386, 7, '“勿以恶小而为之，勿以善小而不为”语出《三国志》，这是谁说的?', '[{\"right\": false, \"answer\": \"诸葛亮\"}, {\"right\": false, \"answer\": \"曹操\"}, {\"right\": true, \"answer\": \"刘备 \"}, {\"right\": false, \"answer\": \"周瑜\"}]'),
(387, 7, '如果在华佗去世后不及，曹操还想寻找一位名医为自己治病，他可以找下', '[{\"right\": false, \"answer\": \"扁鹊\"}, {\"right\": false, \"answer\": \"孙思邈\"}, {\"right\": false, \"answer\": \"李时珍\"}, {\"right\": true, \"answer\": \"张仲景\"}]'),
(388, 7, '下列哪项不是端午节的习俗?', '[{\"right\": false, \"answer\": \" 挂香包\"}, {\"right\": false, \"answer\": \"插艾蒿\"}, {\"right\": true, \"answer\": \"登高采菊\"}, {\"right\": false, \"answer\": \"喝雄黄酒\"}]'),
(389, 7, '“态生两靥之愁，娇袭一身之病”玉对黛玉的第一印象，其中“靥”是指', '[{\"right\": true, \"answer\": \"酒窝\"}, {\"right\": false, \"answer\": \"眼睛 \"}, {\"right\": false, \"answer\": \"嘴角 \"}, {\"right\": false, \"answer\": \"腮帮\"}]'),
(390, 7, '孟子说：“君子有三乐”，下列哪项不在其“三乐”之列?　', '[{\"right\": false, \"answer\": \"父母俱存，兄弟无故\"}, {\"right\": false, \"answer\": \"仰不愧于天，俯不作于人\"}, {\"right\": true, \"answer\": \"乡人无不称其善也\"}, {\"right\": false, \"answer\": \"得天下英才而教育之\"}]'),
(391, 7, '中国历史上被誉为“药王“的是？', '[{\"right\": false, \"answer\": \"扁鹊\"}, {\"right\": false, \"answer\": \"华佗\"}, {\"right\": true, \"answer\": \"孙思邈 \"}, {\"right\": false, \"answer\": \"李时珍\"}]'),
(392, 7, '根据中国传统建筑的特点，面对大院的门口，你的左手边是什么方向?', '[{\"right\": false, \"answer\": \" 东\"}, {\"right\": true, \"answer\": \"西\"}, {\"right\": false, \"answer\": \"南 \"}, {\"right\": false, \"answer\": \"北\"}]'),
(393, 7, '孔子弟子中擅长做生意的是谁?', '[{\"right\": false, \"answer\": \"子路\"}, {\"right\": false, \"answer\": \"子张\"}, {\"right\": true, \"answer\": \"子贡\"}, {\"right\": false, \"answer\": \"颜回\"}]'),
(394, 7, '元太祖铁木真是蒙古草原上的英雄，他被人们尊称为“成吉思汗”，“汗', '[{\"right\": false, \"answer\": \" 天空\"}, {\"right\": true, \"answer\": \"大海\"}, {\"right\": false, \"answer\": \"草原\"}, {\"right\": false, \"answer\": \"高山\"}]'),
(395, 7, '太极拳讲究“以柔克刚，以静制动，以弱胜强”这和下面哪位思想家的观', '[{\"right\": true, \"answer\": \"老子 \"}, {\"right\": false, \"answer\": \"孟子\"}, {\"right\": false, \"answer\": \"荀子 \"}, {\"right\": false, \"answer\": \"孔子\"}]'),
(396, 7, '唐代边塞诗人王昌龄的“但使龙城飞将在，不教胡马度阴山”中的“飞将', '[{\"right\": false, \"answer\": \"张飞\"}, {\"right\": false, \"answer\": \"关羽\"}, {\"right\": false, \"answer\": \"卫青\"}, {\"right\": true, \"answer\": \"李广\"}]'),
(397, 7, '木版年画发源于四大名镇中的哪个名镇?', '[{\"right\": false, \"answer\": \"汉口镇\"}, {\"right\": false, \"answer\": \"景德镇\"}, {\"right\": true, \"answer\": \"朱仙镇 \"}, {\"right\": false, \"answer\": \"佛山镇\"}]'),
(398, 7, '下列哪部著作的成书时间最长?', '[{\"right\": true, \"answer\": \"《徐霞客游记》\"}, {\"right\": false, \"answer\": \"《说文解字》\"}, {\"right\": false, \"answer\": \"《天工开物》\"}, {\"right\": false, \"answer\": \"《梦溪笔谈》\"}]'),
(399, 7, '下面哪个剧种被称为“中国百戏之师”?', '[{\"right\": false, \"answer\": \"京剧\"}, {\"right\": false, \"answer\": \"黄梅戏\"}, {\"right\": true, \"answer\": \"昆曲 \"}, {\"right\": false, \"answer\": \"越剧\"}]'),
(400, 7, '《在水一方》的歌词来源于？', '[{\"right\": true, \"answer\": \"《诗经》\"}, {\"right\": false, \"answer\": \"《陌上桑》\"}, {\"right\": false, \"answer\": \"《楚辞》 \"}, {\"right\": false, \"answer\": \"《孔雀东南飞》\"}]'),
(401, 7, '文人对各种植物有自己的偏爱，陶渊明喜爱菊花，北宋文豪苏东坡则说过', '[{\"right\": false, \"answer\": \" 居无松\"}, {\"right\": true, \"answer\": \"居无竹\"}, {\"right\": false, \"answer\": \"居无梅 \"}, {\"right\": false, \"answer\": \"居无菊\"}]'),
(402, 7, '天干地支纪年始于汉代，请问这种纪年是以哪一天为起点的?', '[{\"right\": false, \"answer\": \"除夕\"}, {\"right\": false, \"answer\": \"正月初一\"}, {\"right\": true, \"answer\": \"立春 \"}, {\"right\": false, \"answer\": \"春分\"}]'),
(403, 7, '王实甫在《西厢记》中写道：“淋漓襟袖啼红泪，比司马青衫更湿”，其', '[{\"right\": false, \"answer\": \" 司马相如\"}, {\"right\": false, \"answer\": \"崔莺莺\"}, {\"right\": true, \"answer\": \"白居易 \"}, {\"right\": false, \"answer\": \"杜甫\"}]'),
(404, 7, '明朝永乐年间，从西洋归来的郑和船队带回了一只西方异域兽“麒麟”，', '[{\"right\": false, \"answer\": \"狮子\"}, {\"right\": false, \"answer\": \"金钱豹\"}, {\"right\": false, \"answer\": \"河马 \"}, {\"right\": true, \"answer\": \"长颈鹿\"}]'),
(405, 7, '草书、行书、楷书、隶书四种字体当中哪一种是其余三种的起源?', '[{\"right\": false, \"answer\": \"草书\"}, {\"right\": false, \"answer\": \"行书\"}, {\"right\": false, \"answer\": \"楷书 \"}, {\"right\": true, \"answer\": \"隶书\"}]'),
(406, 7, '“大材小用古所叹，管仲、萧何实流亚”是陆游的一句名诗，其中“大材', '[{\"right\": false, \"answer\": \"韩愈\"}, {\"right\": true, \"answer\": \"辛弃疾\"}, {\"right\": false, \"answer\": \"庞统 \"}, {\"right\": false, \"answer\": \"宋玉\"}]'),
(407, 7, '下列哪个成语典故说的是吕不讳的故事?　', '[{\"right\": true, \"answer\": \"一字千金\"}, {\"right\": false, \"answer\": \"一诺千金\"}, {\"right\": false, \"answer\": \"一饭千金 \"}, {\"right\": false, \"answer\": \"一掷千金\"}]'),
(408, 7, '以下哪个字不含“黑色”的意思?', '[{\"right\": false, \"answer\": \"玄\"}, {\"right\": false, \"answer\": \"皂\"}, {\"right\": false, \"answer\": \"青 \"}, {\"right\": true, \"answer\": \"苍\"}]'),
(409, 7, '、下面四句话中，意义与其它三句不同的是？', '[{\"right\": false, \"answer\": \"合抱之木生于毫末\"}, {\"right\": false, \"answer\": \"九层之台起于累土\"}, {\"right\": false, \"answer\": \"千里之行始于足下 \"}, {\"right\": true, \"answer\": \"一日之行在于清晨\"}]'),
(410, 7, '《三国演义》中有关羽“单刀赴会”的故事，历史上也确有“单刀赴会”', '[{\"right\": false, \"answer\": \"赵云\"}, {\"right\": false, \"answer\": \"张飞\"}, {\"right\": false, \"answer\": \"周瑜 \"}, {\"right\": true, \"answer\": \"鲁肃\"}]'),
(411, 7, '以下哪位女性的名字被用来命名外太空环形山?', '[{\"right\": false, \"answer\": \"班昭\"}, {\"right\": false, \"answer\": \"蔡文姬\"}, {\"right\": false, \"answer\": \"王昭君 \"}, {\"right\": true, \"answer\": \"李清照\"}]'),
(412, 7, '小王模仿古人填了一首词，写完后发现正文刚好100字，请问他用的是', '[{\"right\": false, \"answer\": \"满庭芳\"}, {\"right\": false, \"answer\": \"雨霖铃\"}, {\"right\": true, \"answer\": \"念奴娇 \"}, {\"right\": false, \"answer\": \"水龙吟\"}]'),
(413, 7, '以下几位历史人物谁在家排行老大?', '[{\"right\": false, \"answer\": \"孔子\"}, {\"right\": false, \"answer\": \"诸葛亮\"}, {\"right\": true, \"answer\": \"班固 \"}, {\"right\": false, \"answer\": \"程顾\"}]'),
(414, 7, '在白族姑娘的头饰上，蕴含着一个完美熟悉的词语，它就是?', '[{\"right\": false, \"answer\": \"阴晴圆缺\"}, {\"right\": true, \"answer\": \"风花雪月\"}, {\"right\": false, \"answer\": \"梅兰竹菊 \"}, {\"right\": false, \"answer\": \"春夏秋冬\"}]'),
(415, 7, '“实事求是”一词出自哪部典籍?', '[{\"right\": false, \"answer\": \"《左传》\"}, {\"right\": false, \"answer\": \"《战国策》\"}, {\"right\": false, \"answer\": \"《史记》\"}, {\"right\": true, \"answer\": \"《汉书》\"}]'),
(416, 7, '“醉里挑灯看剑，梦回吹角连营”出自谁的作品?', '[{\"right\": false, \"answer\": \"陆游\"}, {\"right\": false, \"answer\": \"岳飞\"}, {\"right\": true, \"answer\": \"辛弃疾\"}, {\"right\": false, \"answer\": \"李清照\"}]'),
(417, 7, '秦始皇统一中国后，将全国文字统一成了下面哪一种?', '[{\"right\": false, \"answer\": \"楷书\"}, {\"right\": true, \"answer\": \"小篆\"}, {\"right\": false, \"answer\": \"鸟虫文\"}, {\"right\": false, \"answer\": \"行书\"}]'),
(418, 7, '“但愿人长久，千里共婵娟”，苏东坡借这首词表达了对谁的思念之情?', '[{\"right\": false, \"answer\": \"妻子\"}, {\"right\": true, \"answer\": \"兄弟\"}, {\"right\": false, \"answer\": \"朋友\"}, {\"right\": false, \"answer\": \"父亲\"}]'),
(419, 7, '宣纸得名于它的?', '[{\"right\": false, \"answer\": \"用途\"}, {\"right\": false, \"answer\": \"材质\"}, {\"right\": true, \"answer\": \"产地 \"}, {\"right\": false, \"answer\": \"使用人群\"}]'),
(420, 7, '下面哪个是农历五月的别称?', '[{\"right\": false, \"answer\": \"杏月\"}, {\"right\": false, \"answer\": \"桃月\"}, {\"right\": true, \"answer\": \"榴月\"}, {\"right\": false, \"answer\": \"荷月\"}]'),
(421, 7, '古代有很多姓氏都来源于官职，司马的职能是什么?', '[{\"right\": false, \"answer\": \"农耕\"}, {\"right\": true, \"answer\": \"军政\"}, {\"right\": false, \"answer\": \"养马\"}, {\"right\": false, \"answer\": \"水利\"}]'),
(422, 7, '下列植物中，不应当出现在《岁寒三友图》中的是：', '[{\"right\": true, \"answer\": \"菊\"}, {\"right\": false, \"answer\": \"梅\"}, {\"right\": false, \"answer\": \"竹 \"}, {\"right\": false, \"answer\": \"松\"}]'),
(423, 7, '古琴最初只有五根弦，代表着金、木、水、火、土。后来又增加了两根弦', '[{\"right\": false, \"answer\": \"天、地\"}, {\"right\": false, \"answer\": \"南、北\"}, {\"right\": false, \"answer\": \"阴、阳\"}, {\"right\": true, \"answer\": \"文、武\"}]'),
(424, 7, '下面哪个诗句描写的不是古琴?', '[{\"right\": false, \"answer\": \"欲把心事付瑶琴;\"}, {\"right\": true, \"answer\": \"一弦一柱思华年\"}, {\"right\": false, \"answer\": \"为我一挥手，如听万壑松\"}, {\"right\": false, \"answer\": \"寒苦不忍言，为君奏丝桐\"}]'),
(425, 7, '“楚河”和“汉界”在今天的哪个省?', '[{\"right\": false, \"answer\": \"湖北\"}, {\"right\": true, \"answer\": \"河南\"}, {\"right\": false, \"answer\": \"河北\"}, {\"right\": false, \"answer\": \"湖南\"}]'),
(426, 7, '个成语典故和棋文化有关?', '[{\"right\": false, \"answer\": \"势如破竹\"}, {\"right\": false, \"answer\": \"出奇制胜\"}, {\"right\": true, \"answer\": \"专心致志\"}, {\"right\": false, \"answer\": \"渭分明\"}]'),
(427, 7, '峻丽，骨力劲健”形容的是历史上哪位书法家的字?', '[{\"right\": false, \"answer\": \"王羲之\"}, {\"right\": false, \"answer\": \"颜真卿\"}, {\"right\": true, \"answer\": \"柳公权\"}, {\"right\": false, \"answer\": \"吴道子\"}]'),
(428, 7, '存最早用纸作画的作品是？', '[{\"right\": false, \"answer\": \"清明上河图\"}, {\"right\": false, \"answer\": \"洛神赋图\"}, {\"right\": true, \"answer\": \"五牛图 \"}, {\"right\": false, \"answer\": \"历代帝王图\"}]'),
(429, 10, '“月光放肆在染色的窗边”出自蔡依林的?', '[{\"right\": false, \"answer\": \"大艺术家 \"}, {\"right\": true, \"answer\": \"舞娘 \"}, {\"right\": false, \"answer\": \"特务J \"}, {\"right\": false, \"answer\": \"日不落 \"}]'),
(430, 10, '沈丹丹是出自哪个组合?', '[{\"right\": false, \"answer\": \"南拳妈妈 \"}, {\"right\": false, \"answer\": \" F.I.R \"}, {\"right\": true, \"answer\": \" T.R.Y \"}, {\"right\": false, \"answer\": \"4S.H.E \"}]'),
(431, 10, '“细腻的喜欢，毛毯般的厚重感”出自梁静茹的那首歌曲？', '[{\"right\": false, \"answer\": \"勇气 \"}, {\"right\": false, \"answer\": \"满满的都是爱 \"}, {\"right\": true, \"answer\": \"暖暖 \"}, {\"right\": false, \"answer\": \"宁夏 \"}]'),
(432, 10, '以下哪位明星没有演唱过《北京欢迎你》？ ', '[{\"right\": false, \"answer\": \"孙燕姿 \"}, {\"right\": false, \"answer\": \"周笔畅 \"}, {\"right\": false, \"answer\": \"张靓颖 \"}, {\"right\": true, \"answer\": \"宋祖英 \"}]'),
(433, 10, '“我心甘情愿爱爱爱爱到要吐”出自陈奕迅的哪首歌曲？', '[{\"right\": false, \"answer\": \"爱情转移 \"}, {\"right\": false, \"answer\": \"你的背包 \"}, {\"right\": false, \"answer\": \"浮夸 \"}, {\"right\": true, \"answer\": \" K歌之王\"}]'),
(434, 10, '经典老歌《月亮代表我的心》以下谁没有演唱过 ', '[{\"right\": false, \"answer\": \"张国荣 \"}, {\"right\": false, \"answer\": \"钟嘉欣 \"}, {\"right\": false, \"answer\": \"任贤齐 \"}, {\"right\": true, \"answer\": \"付笛声\"}]'),
(435, 10, '《我爱的人》是周杰伦写给谁的歌？', '[{\"right\": true, \"answer\": \"陈小春 \"}, {\"right\": false, \"answer\": \"林宥嘉 \"}, {\"right\": false, \"answer\": \"王力宏 \"}, {\"right\": false, \"answer\": \"杨培安  \"}]'),
(436, 10, '费翔的《故乡的云》中“那故乡的风和故乡的云”下一句是？', '[{\"right\": true, \"answer\": \"为我抹去创痕 \"}, {\"right\": false, \"answer\": \"归来吧，归来哟 \"}, {\"right\": false, \"answer\": \"我已厌倦漂泊 \"}, {\"right\": false, \"answer\": \"我曾经豪情万丈 \"}]'),
(437, 10, '经典老歌《味道》的原唱是？', '[{\"right\": false, \"answer\": \"张学友 \"}, {\"right\": true, \"answer\": \"辛晓琪 \"}, {\"right\": false, \"answer\": \"张国荣 \"}, {\"right\": false, \"answer\": \"邓丽君\"}]'),
(438, 10, '即兴演奏/唱的基本依据是。', '[{\"right\": false, \"answer\": \"音色\"}, {\"right\": false, \"answer\": \"节奏\"}, {\"right\": false, \"answer\": \"节奏\"}, {\"right\": true, \"answer\": \"和声进行\"}]'),
(439, 10, '以下哪个选项不是歌曲制作阶段的工作人员？', '[{\"right\": false, \"answer\": \"录音师\"}, {\"right\": false, \"answer\": \"制作人\"}, {\"right\": true, \"answer\": \"经纪人\"}, {\"right\": false, \"answer\": \"乐手\"}]'),
(440, 10, '以下哪一项属于“致敬”翻唱？', '[{\"right\": false, \"answer\": \"邓紫棋《一无所有》\"}, {\"right\": true, \"answer\": \"专辑《谁是崔健？》\"}, {\"right\": false, \"answer\": \"《老男孩》\"}, {\"right\": false, \"answer\": \"《热情的沙漠》\"}]'),
(441, 10, '下列选项中不是目前世界音乐产业三巨头的公司是?', '[{\"right\": false, \"answer\": \"1/15索尼音乐娱乐\"}, {\"right\": false, \"answer\": \"环球唱片\"}, {\"right\": true, \"answer\": \"滚石唱片\"}, {\"right\": false, \"answer\": \"华纳音乐集团\"}]'),
(442, 10, '哪项是拉丁音乐共有的艺术特点？', '[{\"right\": false, \"answer\": \"和声复杂\"}, {\"right\": true, \"answer\": \"具有较强的节奏动感\"}, {\"right\": false, \"answer\": \"柔情舒缓\"}, {\"right\": false, \"answer\": \"以演唱为主要表现手段\"}]'),
(443, 10, '邓紫棋在电视节目里把崔健的《一无所有》与哪支乐队的歌曲串在了一起', '[{\"right\": false, \"answer\": \"R.E.M. 乐队\"}, {\"right\": true, \"answer\": \"皇后乐队\"}, {\"right\": false, \"answer\": \"披头士乐队\"}, {\"right\": false, \"answer\": \"涅槃乐队\"}]'),
(444, 10, '被称为摇滚之父的是?', '[{\"right\": true, \"answer\": \"猫王\"}, {\"right\": false, \"answer\": \"迈克尔·杰克逊\"}, {\"right\": false, \"answer\": \"小理查德\"}, {\"right\": false, \"answer\": \"滚石\"}]'),
(445, 10, '锡塔琴是哪个国家的代表性古典乐器？', '[{\"right\": false, \"answer\": \"哈萨克斯坦\"}, {\"right\": false, \"answer\": \"以色列\"}, {\"right\": true, \"answer\": \"印度\"}, {\"right\": false, \"answer\": \"南非\"}]'),
(446, 10, '“西北风”歌曲体现出哪种西方音乐体裁的特点？', '[{\"right\": false, \"answer\": \"电子乐\"}, {\"right\": true, \"answer\": \"硬摇滚\"}, {\"right\": false, \"answer\": \"芭乐情歌\"}, {\"right\": false, \"answer\": \"民谣\"}]'),
(447, 10, '作为头号巨星，猫王最厉害之处主要是', '[{\"right\": false, \"answer\": \"性感的舞台装\"}, {\"right\": false, \"answer\": \"性感的发型\"}, {\"right\": false, \"answer\": \"性感的舞台动作\"}, {\"right\": true, \"answer\": \"音乐融合了布鲁斯和乡村音乐\"}]'),
(448, 10, '音乐行业内常常与“音乐产业”互换的术语是：', '[{\"right\": true, \"answer\": \"唱片业\"}, {\"right\": false, \"answer\": \"文化产业\"}, {\"right\": false, \"answer\": \"创意产业\"}, {\"right\": false, \"answer\": \"传媒产业\"}]'),
(449, 10, '促生流行音乐的社会文化因素不包括?', '[{\"right\": false, \"answer\": \"工业革命\"}, {\"right\": false, \"answer\": \"城市化\"}, {\"right\": true, \"answer\": \"音乐自身的进化\"}, {\"right\": false, \"answer\": \"文化融合\"}]'),
(450, 10, '电影《十字路口》中的“十字路口”隐喻了?', '[{\"right\": true, \"answer\": \"流行乐手对音乐创造性的追求\"}, {\"right\": false, \"answer\": \"流行音乐与古典音乐的关系\"}, {\"right\": false, \"answer\": \"布鲁斯艺人的信仰\"}, {\"right\": false, \"answer\": \"黑人音乐的古老传说\"}]'),
(451, 10, '作品中体现出民族文化自觉意识的台湾歌手不包括哪位？', '[{\"right\": false, \"answer\": \"李双泽\"}, {\"right\": false, \"answer\": \"杨弦\"}, {\"right\": false, \"answer\": \"胡德夫\"}, {\"right\": true, \"answer\": \"高凌风\"}]'),
(452, 10, '韩国流行音乐发展迅猛的原因不包括：', '[{\"right\": false, \"answer\": \"政策扶持\"}, {\"right\": true, \"answer\": \"国际援助\"}, {\"right\": false, \"answer\": \"影视助力\"}, {\"right\": false, \"answer\": \"市场运作\"}]'),
(453, 10, '爱情歌曲的分类可以根据内容分为表达爱意和', '[{\"right\": false, \"answer\": \"爱的表白\"}, {\"right\": true, \"answer\": \"分手情伤\"}, {\"right\": false, \"answer\": \"爱的分享\"}, {\"right\": false, \"answer\": \"表达醋意\"}]'),
(454, 10, '电影《十字路口》中的乐手“与魔鬼交易”一说，最初来自：', '[{\"right\": false, \"answer\": \"歌德《浮士德》\"}, {\"right\": true, \"answer\": \"欧洲民间传说\"}, {\"right\": false, \"answer\": \"黑人民间故事\"}, {\"right\": false, \"answer\": \"帕格尼尼的故事\"}]'),
(455, 10, '第二次世界大战之前，流行音乐的主流是', '[{\"right\": false, \"answer\": \"民谣\"}, {\"right\": false, \"answer\": \"摇滚乐\"}, {\"right\": true, \"answer\": \"爵士乐\"}, {\"right\": false, \"answer\": \"乡村音乐\"}]'),
(456, 10, '粉丝的作用有很多，但不包括', '[{\"right\": false, \"answer\": \"追捧歌手\"}, {\"right\": false, \"answer\": \"帮助唱片公司宣传歌手\"}, {\"right\": false, \"answer\": \"带动身边人一同欣赏追捧歌手的唱片\"}, {\"right\": true, \"answer\": \"唱片公司全部的经济来源\"}]'),
(457, 10, '第一首描写校园里青少年叛逆的摇滚歌曲是比尔·哈利的', '[{\"right\": false, \"answer\": \"《一块红布》\"}, {\"right\": true, \"answer\": \"《昼夜摇滚》\"}, {\"right\": false, \"answer\": \"《一无所有》\"}, {\"right\": false, \"answer\": \"《无地自容》\"}]'),
(458, 10, '以下哪一点不是流行音乐排行榜能够体现的东西？', '[{\"right\": false, \"answer\": \"音乐市场区隔\"}, {\"right\": false, \"answer\": \"歌迷欣赏口味\"}, {\"right\": true, \"answer\": \"音乐品质\"}, {\"right\": false, \"answer\": \"流行趋势\"}]'),
(459, 10, '乔妮·米契尔是哪种风格类型的歌手？', '[{\"right\": false, \"answer\": \"摇滚\"}, {\"right\": true, \"answer\": \"民谣\"}, {\"right\": false, \"answer\": \"抒情\"}, {\"right\": false, \"answer\": \"流行\"}]'),
(460, 10, '乐队的效果比一个人表演效果', '[{\"right\": false, \"answer\": \"不好\"}, {\"right\": false, \"answer\": \"差\"}, {\"right\": true, \"answer\": \"好\"}, {\"right\": false, \"answer\": \"没差别\"}]'),
(461, 10, '民谣摇滚的创立者是', '[{\"right\": false, \"answer\": \"琼·贝兹\"}, {\"right\": false, \"answer\": \"滚石\"}, {\"right\": true, \"answer\": \"鲍勃·迪伦\"}, {\"right\": false, \"answer\": \"披头士\"}]'),
(462, 10, '关于《录像杀死电台明星》，以下哪一项描述最恰当？', '[{\"right\": false, \"answer\": \"音乐纪录片\"}, {\"right\": false, \"answer\": \"世界上最早的MV\"}, {\"right\": true, \"answer\": \"MTV 电视频道开播第一首MV\"}, {\"right\": false, \"answer\": \"电台歌曲\"}]'),
(463, 10, '失恋疗伤的歌曲有治愈的功效，如', '[{\"right\": true, \"answer\": \"《爱笑的眼睛》\"}, {\"right\": false, \"answer\": \"《光阴的故事》\"}, {\"right\": false, \"answer\": \"《凡人歌》\"}, {\"right\": false, \"answer\": \"《Sugar 》\"}]'),
(464, 10, '60年代美国出现的一个青年群体是', '[{\"right\": false, \"answer\": \"雅皮士\"}, {\"right\": true, \"answer\": \"嬉皮士\"}, {\"right\": false, \"answer\": \"X 一代\"}, {\"right\": false, \"answer\": \"宽松世代\"}]'),
(465, 10, '爱国人士一般都喜欢欣赏爱国题材的流行音乐。但以下哪首不属于此类人', '[{\"right\": false, \"answer\": \"《龙的传人》\"}, {\"right\": false, \"answer\": \"《中国人》\"}, {\"right\": false, \"answer\": \"《大中国》\"}, {\"right\": true, \"answer\": \"《不做大哥好多年》\"}]'),
(466, 10, '所谓的“神曲”的一个特征是，它们往往会引发：', '[{\"right\": false, \"answer\": \"艺术争议\"}, {\"right\": false, \"answer\": \"社会问题\"}, {\"right\": true, \"answer\": \"病毒式的流行，模仿和恶搞\"}, {\"right\": false, \"answer\": \"音乐创造\"}]'),
(467, 10, '表达爱意的歌曲常常被我们视为最佳爱情歌曲。以下（）不是这类歌曲。', '[{\"right\": false, \"answer\": \"苏芮《牵手》\"}, {\"right\": false, \"answer\": \"王心凌《爱你》\"}, {\"right\": true, \"answer\": \"小虎队《新年快乐》\"}, {\"right\": false, \"answer\": \"张信哲《爱如潮水》\"}]'),
(468, 10, '以下哪首歌曲不是属于同一类的情歌。', '[{\"right\": false, \"answer\": \"《囚鸟》\"}, {\"right\": false, \"answer\": \"《容易受伤的女人》\"}, {\"right\": false, \"answer\": \"《后来》\"}, {\"right\": true, \"answer\": \"《我的甜蜜》\"}]'),
(469, 10, '“魔岩”厂牌与哪种音乐体裁关系密切？', '[{\"right\": true, \"answer\": \"摇滚乐\"}, {\"right\": false, \"answer\": \"R&B\"}, {\"right\": false, \"answer\": \"电子音乐\"}, {\"right\": false, \"answer\": \"都市情歌\"}]'),
(470, 10, '“现场表演”（live ）对于欣赏爵士乐很重要，这是因为现场？', '[{\"right\": false, \"answer\": \"音响效果好\"}, {\"right\": false, \"answer\": \"视听结合\"}, {\"right\": false, \"answer\": \"体现乐手水准\"}, {\"right\": true, \"answer\": \"体现音乐欣赏的未知感和交流\"}]'),
(471, 10, '澳大利亚昆士兰大学心理系研究表明，经常听以下哪种甚至是极端音乐的', '[{\"right\": false, \"answer\": \"民歌\"}, {\"right\": false, \"answer\": \"古典音乐\"}, {\"right\": true, \"answer\": \"重金属\"}, {\"right\": false, \"answer\": \"波萨·诺瓦\"}]'),
(472, 10, '欧美也有乡谣，被称为（），如约翰·丹佛的《take Me Hom', '[{\"right\": false, \"answer\": \"摇滚\"}, {\"right\": false, \"answer\": \"爵士\"}, {\"right\": true, \"answer\": \"乡村音乐\"}, {\"right\": false, \"answer\": \"农村音乐\"}]'),
(473, 10, '在当下华语歌坛，“原创”经常和以下哪个词相对应成为话题焦点？', '[{\"right\": false, \"answer\": \"创作\"}, {\"right\": false, \"answer\": \"模仿\"}, {\"right\": false, \"answer\": \"欣赏\"}, {\"right\": true, \"answer\": \"抄袭\"}]'),
(474, 10, '具有转折性意义的韩国流行音乐组合是？', '[{\"right\": true, \"answer\": \"SeoTaiji\"}, {\"right\": false, \"answer\": \"H.O.T.\"}, {\"right\": false, \"answer\": \"Exo\"}, {\"right\": false, \"answer\": \"BIGBANG\"}]'),
(475, 10, '歌手这一称呼乐于被很多唱歌的人使用，因为他更接近', '[{\"right\": false, \"answer\": \"街头艺人\"}, {\"right\": true, \"answer\": \"劳动人民\"}, {\"right\": false, \"answer\": \"明星\"}, {\"right\": false, \"answer\": \"巨星\"}]'),
(476, 10, '特雷门琴通过以下哪个乐队的应用而大放异彩？', '[{\"right\": false, \"answer\": \"涅槃乐队\"}, {\"right\": false, \"answer\": \"披头士乐队\"}, {\"right\": false, \"answer\": \"山羊皮乐队\"}, {\"right\": true, \"answer\": \"沙滩男孩乐队\"}]'),
(477, 10, '现代人听流行音乐的要求是？', '[{\"right\": false, \"answer\": \"着正装\"}, {\"right\": false, \"answer\": \"穿礼服\"}, {\"right\": true, \"answer\": \"想怎么听怎听\"}, {\"right\": false, \"answer\": \"去音乐厅听\"}]'),
(478, 10, 'DJ是指?', '[{\"right\": true, \"answer\": \"唱片骑师\"}, {\"right\": false, \"answer\": \"说唱歌手\"}, {\"right\": false, \"answer\": \"街舞者\"}, {\"right\": false, \"answer\": \"涂鸦者\"}]'),
(479, 10, '歌咏模式的形成年代是（）时期。', '[{\"right\": true, \"answer\": \"五四运动\"}, {\"right\": false, \"answer\": \"文革\"}, {\"right\": false, \"answer\": \"改革开放\"}, {\"right\": false, \"answer\": \"21世纪\"}]'),
(480, 10, '《渔光曲》的曲作者是？', '[{\"right\": true, \"answer\": \"任光\"}, {\"right\": false, \"answer\": \"易伟斋\"}, {\"right\": false, \"answer\": \"黄自\"}, {\"right\": false, \"answer\": \"刘大白\"}]'),
(481, 10, '以下歌曲不属于齐秦的是？', '[{\"right\": false, \"answer\": \"《狼》\"}, {\"right\": false, \"answer\": \"《荒》\"}, {\"right\": false, \"answer\": \"《大约在冬季》\"}, {\"right\": true, \"answer\": \"《牵手》\"}]'),
(482, 10, '20世纪中国歌曲最大的变化，体现在以下哪些方面？', '[{\"right\": true, \"answer\": \"大众歌曲\"}, {\"right\": false, \"answer\": \"传统民歌\"}, {\"right\": false, \"answer\": \"西方歌剧\"}, {\"right\": false, \"answer\": \"戏剧\"}]'),
(483, 10, '下列属于抒情歌曲范畴的是？', '[{\"right\": true, \"answer\": \"《我爱你，中国》\"}, {\"right\": false, \"answer\": \"《北京的金山上》\"}, {\"right\": false, \"answer\": \"《当兵的人》\"}, {\"right\": false, \"answer\": \"《摇船歌》\"}]'),
(484, 10, '《问》的曲作者是？', '[{\"right\": false, \"answer\": \"保罗·罗伯特\"}, {\"right\": false, \"answer\": \"易伟斋\"}, {\"right\": true, \"answer\": \"肖友梅\"}, {\"right\": false, \"answer\": \"聂耳\"}]'),
(485, 10, '“爱是欢笑泪珠飘落的过程，爱曾经是我也是你”出自歌曲（）。', '[{\"right\": true, \"answer\": \"《爱的箴言》\"}, {\"right\": false, \"answer\": \"《第二道彩虹》\"}, {\"right\": false, \"answer\": \"《路边的野花不要采》\"}, {\"right\": false, \"answer\": \"《风中有朵雨做的云》\"}]'),
(486, 10, '“三月里桃花红呦似海??七月里谷米黄呦似金??”出自歌曲（）。', '[{\"right\": false, \"answer\": \"《月亮代表我的心》\"}, {\"right\": true, \"answer\": \"《盼红军》\"}, {\"right\": false, \"answer\": \"《茉莉花开》\"}, {\"right\": false, \"answer\": \"《送郎当红军》\"}]'),
(487, 10, '《黄河船夫曲》是哪个地方的民歌？', '[{\"right\": false, \"answer\": \"苏皖江淮\"}, {\"right\": true, \"answer\": \"陕北地区\"}, {\"right\": false, \"answer\": \"河北地区\"}, {\"right\": false, \"answer\": \"北京地区\"}]'),
(488, 10, '文革后高考恢复的第一年是（）年。', '[{\"right\": false, \"answer\": \"1976.0\"}, {\"right\": true, \"answer\": \"1977.0\"}, {\"right\": false, \"answer\": \"1978.0\"}, {\"right\": false, \"answer\": \"1979.0\"}]'),
(489, 10, '《泪洒天堂》的起源是什么歌曲？', '[{\"right\": false, \"answer\": \"民族\"}, {\"right\": false, \"answer\": \"通俗\"}, {\"right\": true, \"answer\": \"宗教\"}, {\"right\": false, \"answer\": \"纯音乐\"}]'),
(490, 10, '“新民歌”出现在什么时期？', '[{\"right\": false, \"answer\": \"20世纪初\"}, {\"right\": false, \"answer\": \"20世纪中期\"}, {\"right\": true, \"answer\": \"20世纪末\"}, {\"right\": false, \"answer\": \"21世纪初\"}]'),
(491, 10, '《我的祖国》作词是谁？', '[{\"right\": true, \"answer\": \"乔羽\"}, {\"right\": false, \"answer\": \"庄奴\"}, {\"right\": false, \"answer\": \"雷振邦\"}, {\"right\": false, \"answer\": \"刘白羽\"}]'),
(492, 10, '《翻身农奴把歌唱》是哪个地区的民歌？', '[{\"right\": false, \"answer\": \"山西\"}, {\"right\": false, \"answer\": \"陕西\"}, {\"right\": true, \"answer\": \"西藏\"}, {\"right\": false, \"answer\": \"河北\"}]');
INSERT INTO `question_detail` (`id`, `sort_id`, `ask`, `answer`) VALUES
(493, 10, '下列歌曲属于１９８０年群众喜欢的广播歌曲曲目的是？', '[{\"right\": false, \"answer\": \"《大海啊故乡》\"}, {\"right\": false, \"answer\": \"《泉水叮咚响》\"}, {\"right\": false, \"answer\": \"《心中的玫瑰》\"}, {\"right\": true, \"answer\": \"以上都正确\"}]'),
(494, 10, '1943年（）创作的《在那遥远的地方》在国际上广泛流传。', '[{\"right\": false, \"answer\": \"田汉\"}, {\"right\": false, \"answer\": \"聂耳\"}, {\"right\": true, \"answer\": \"王洛宾\"}, {\"right\": false, \"answer\": \"萧友梅\"}]'),
(495, 10, '下列歌曲属于抗日救亡歌曲的是？', '[{\"right\": true, \"answer\": \"《大刀进行曲》\"}, {\"right\": false, \"answer\": \"《黄河船夫曲》\"}, {\"right\": false, \"answer\": \"《同桌的你》\"}, {\"right\": false, \"answer\": \"《五月的鲜花》\"}]'),
(496, 10, '“太太发现秘书穿的裙子很短，她就买了八千块的耳环??”出自歌曲?', '[{\"right\": false, \"answer\": \"《我是一只小小鸟》\"}, {\"right\": false, \"answer\": \"《梦醒时分》\"}, {\"right\": true, \"answer\": \"《最近比较烦》\"}, {\"right\": false, \"answer\": \"《凡人歌》\"}]'),
(497, 10, '《衡山里下来的游击队》是哪个省的民歌？', '[{\"right\": false, \"answer\": \"苏皖江淮\"}, {\"right\": true, \"answer\": \"陕北地区\"}, {\"right\": false, \"answer\": \"河北地区\"}, {\"right\": false, \"answer\": \"北京地区\"}]'),
(498, 10, '高晓声的作品中大多关注谁的命运？', '[{\"right\": false, \"answer\": \"学生\"}, {\"right\": false, \"answer\": \"工人\"}, {\"right\": true, \"answer\": \"农民\"}, {\"right\": false, \"answer\": \"知识分子\"}]'),
(499, 10, '以下歌曲不是邓丽君的是？', '[{\"right\": false, \"answer\": \"《我只在乎你》\"}, {\"right\": false, \"answer\": \"《甜蜜蜜》\"}, {\"right\": false, \"answer\": \"《在水一方》\"}, {\"right\": true, \"answer\": \"《红豆》\"}]'),
(500, 10, '下列（）不是李宗盛创作的歌曲。', '[{\"right\": false, \"answer\": \"《我是一只小小鸟》\"}, {\"right\": false, \"answer\": \"《梦醒时分》\"}, {\"right\": false, \"answer\": \"《凡人歌》\"}, {\"right\": true, \"answer\": \"《龙的传人》\"}]'),
(501, 10, '《黄河大合唱》是在1939年由（）作词。', '[{\"right\": true, \"answer\": \"张光年\"}, {\"right\": false, \"answer\": \"田汉\"}, {\"right\": false, \"answer\": \"冼星海\"}, {\"right\": false, \"answer\": \"聂耳\"}]'),
(502, 10, '“雪山啊闪银光，雅鲁藏布江翻波浪”是出自歌曲?', '[{\"right\": false, \"answer\": \"《弹起我心爱的土琵琶》\"}, {\"right\": true, \"answer\": \"《翻身农奴把歌唱》\"}, {\"right\": false, \"answer\": \"《交城山》\"}, {\"right\": false, \"answer\": \"《东方红》\"}]'),
(503, 10, '以下不属于罗大佑歌曲的是？', '[{\"right\": false, \"answer\": \"《光阴的故事》\"}, {\"right\": false, \"answer\": \"《鹿港小镇》\"}, {\"right\": false, \"answer\": \"《野百合也有春天》\"}, {\"right\": true, \"answer\": \"《大约在冬季》\"}]'),
(504, 10, '“原生态民歌”兴起于哪个时代？', '[{\"right\": true, \"answer\": \"20世纪末21世纪初\"}, {\"right\": false, \"answer\": \"21世纪20年代\"}, {\"right\": false, \"answer\": \"20世纪末\"}, {\"right\": false, \"answer\": \"20世纪50年代\"}]'),
(505, 10, '以下不是我国摇滚乐队名字的是？', '[{\"right\": false, \"answer\": \"万李马王\"}, {\"right\": false, \"answer\": \"1989.0\"}, {\"right\": true, \"answer\": \"灵感\"}, {\"right\": false, \"answer\": \"鲍家街43号\"}]'),
(506, 10, '以下作品不是朱践耳作曲的是？', '[{\"right\": false, \"answer\": \"《唱支山歌给党听》\"}, {\"right\": false, \"answer\": \"《打得好》\"}, {\"right\": false, \"answer\": \"《翻身的日子》\"}, {\"right\": true, \"answer\": \"《摇船歌》\"}]'),
(507, 10, '下列（）是孟庭苇的经典歌曲。', '[{\"right\": false, \"answer\": \"《月亮代表我的心》\"}, {\"right\": false, \"answer\": \"《小城故事》\"}, {\"right\": false, \"answer\": \"《路边的野花不要采》\"}, {\"right\": true, \"answer\": \"《风中有朵雨做的云》\"}]'),
(508, 10, '“月亮的脸偷偷的在改变??”出自孟庭苇的歌曲?', '[{\"right\": false, \"answer\": \"《野百合也有春天》\"}, {\"right\": true, \"answer\": \"《你看你看月亮的脸》\"}, {\"right\": false, \"answer\": \"《第二道彩虹》\"}, {\"right\": false, \"answer\": \"《风中有朵雨做的云》\"}]'),
(509, 10, '下列哪一词汇时刻影响着港台流行音乐发展轨迹？', '[{\"right\": true, \"answer\": \"移民心态\"}, {\"right\": false, \"answer\": \"世界眼光\"}, {\"right\": false, \"answer\": \"多元风格\"}, {\"right\": false, \"answer\": \"文化碰撞\"}]'),
(510, 10, '《泪洒天堂》最初属于什么歌曲？', '[{\"right\": true, \"answer\": \"宗教歌曲\"}, {\"right\": false, \"answer\": \"婚礼歌曲\"}, {\"right\": false, \"answer\": \"丧礼歌曲\"}, {\"right\": false, \"answer\": \"民族歌曲\"}]'),
(511, 10, '《黄河大合唱》与时代的关系是？', '[{\"right\": false, \"answer\": \"艺术的夸张\"}, {\"right\": true, \"answer\": \"艺术的写实\"}, {\"right\": false, \"answer\": \"时代的必然产物\"}, {\"right\": false, \"answer\": \"没有关系\"}]'),
(512, 10, '“pop ”摇滚类型出现于哪个年代？', '[{\"right\": false, \"answer\": \"50年代\"}, {\"right\": false, \"answer\": \"60-70年代\"}, {\"right\": true, \"answer\": \"70-80年代\"}, {\"right\": false, \"answer\": \"80-90年代\"}]'),
(513, 10, '下列歌曲体现了新时代年轻人的风貌？', '[{\"right\": true, \"answer\": \"《年轻的朋友们我们来相会》\"}, {\"right\": false, \"answer\": \"《毕业歌》\"}, {\"right\": false, \"answer\": \"《盼红军》\"}, {\"right\": false, \"answer\": \"《到敌人后方去》\"}]'),
(514, 10, '“也许牵了手的手，前生不一定好走??所以牵了手的手，来生还要一起', '[{\"right\": false, \"answer\": \"《跟着感觉走》\"}, {\"right\": false, \"answer\": \"《酒干倘卖无》\"}, {\"right\": true, \"answer\": \"《牵手》\"}, {\"right\": false, \"answer\": \"《亲爱的小孩》\"}]'),
(515, 10, '《大海航行靠舵手》属于（）歌曲类型。', '[{\"right\": false, \"answer\": \"学堂乐歌\"}, {\"right\": false, \"answer\": \"民歌\"}, {\"right\": true, \"answer\": \"语录歌\"}, {\"right\": false, \"answer\": \"西洋乐\"}]'),
(516, 10, '最能说明现代社会时代特征的是重金属?', '[{\"right\": false, \"answer\": \"民歌\"}, {\"right\": true, \"answer\": \"摇滚\"}, {\"right\": false, \"answer\": \"抒情音乐\"}, {\"right\": false, \"answer\": \"离散歌曲\"}]'),
(517, 8, '中国电影历史上第一部电影是？', '[{\"right\": true, \"answer\": \"《定军山》\"}, {\"right\": false, \"answer\": \"《歌女红牡丹》\"}, {\"right\": false, \"answer\": \"《渔光曲》\"}, {\"right\": false, \"answer\": \"《新儿女英雄传》\"}]'),
(518, 8, '中国第一部获得国际奖的电影是？', '[{\"right\": false, \"answer\": \"《神女》\"}, {\"right\": false, \"answer\": \"《歌女红牡丹》\"}, {\"right\": true, \"answer\": \"《渔光曲》\"}, {\"right\": false, \"answer\": \"《生死恨》\"}]'),
(519, 8, '有一部根据同名小说《飘》改编的电影，那请问这部影片的名称是?', '[{\"right\": false, \"answer\": \"《罗马假日》\"}, {\"right\": true, \"answer\": \"《乱世佳人》\"}, {\"right\": false, \"answer\": \"《魂断蓝桥》\"}, {\"right\": false, \"answer\": \"《窈窕淑女》\"}]'),
(520, 8, '是谁第一次将中国功夫引入好莱坞？', '[{\"right\": false, \"answer\": \"李连杰\"}, {\"right\": false, \"answer\": \"甄子丹\"}, {\"right\": true, \"answer\": \"李小龙\"}, {\"right\": false, \"answer\": \"成龙\"}]'),
(521, 8, '著名导演李安凭借下列哪部电影获得奥斯卡最佳导演奖? ', '[{\"right\": false, \"answer\": \"《色戒》\"}, {\"right\": true, \"answer\": \"《断背山》\"}, {\"right\": false, \"answer\": \"《卧虎藏龙》\"}, {\"right\": false, \"answer\": \"《喜宴》\"}]'),
(522, 8, '电影《无间道》是在哪里拍摄的？', '[{\"right\": false, \"answer\": \"中国大陆\"}, {\"right\": true, \"answer\": \"香港\"}, {\"right\": false, \"answer\": \"好莱坞\"}, {\"right\": false, \"answer\": \"台湾\"}]'),
(523, 8, '中国经典电影《一个都不能少》的导演是哪位？', '[{\"right\": false, \"answer\": \"李爽\"}, {\"right\": false, \"answer\": \"韦家辉\"}, {\"right\": true, \"answer\": \"张艺谋 \"}, {\"right\": false, \"answer\": \"陈力\"}]'),
(524, 8, '请问下列哪个是张国荣的电影作品？', '[{\"right\": false, \"answer\": \"《重庆森林》\"}, {\"right\": true, \"answer\": \"《霸王别姬》\"}, {\"right\": false, \"answer\": \"《东邪西毒》\"}, {\"right\": false, \"answer\": \"《花样年华》\"}]'),
(525, 8, '电影《十月围城》中的故事发生的地点是在哪里? ', '[{\"right\": false, \"answer\": \"广州\"}, {\"right\": false, \"answer\": \"北京\"}, {\"right\": false, \"answer\": \"日本\"}, {\"right\": true, \"answer\": \"香港\"}]'),
(526, 8, '《分手合约》的主题曲《相爱有时》是谁唱的？', '[{\"right\": false, \"answer\": \"莫文蔚\"}, {\"right\": false, \"answer\": \"郭静\"}, {\"right\": true, \"answer\": \"尚雯婕\"}, {\"right\": false, \"answer\": \"陈慧娴\"}]'),
(527, 8, '以下哪部不是约翰尼·德普主演的电影？', '[{\"right\": false, \"answer\": \"查理与巧克力工厂\"}, {\"right\": false, \"answer\": \"加勒比海盗\"}, {\"right\": true, \"answer\": \"天堂电影院 \"}, {\"right\": false, \"answer\": \"剪刀手爱德华\"}]'),
(528, 8, '电影《国王的演讲》的影片中，一直妨碍国王顺利发表演讲的原因是什么', '[{\"right\": false, \"answer\": \"他哥哥的势力阻挡 \"}, {\"right\": true, \"answer\": \"自身患有口吃\"}, {\"right\": false, \"answer\": \"人民的声讨\"}, {\"right\": false, \"answer\": \"聋哑 \"}]'),
(529, 8, '中国第一次电影放映的地方是在哪里？ ', '[{\"right\": true, \"answer\": \"上海\"}, {\"right\": false, \"answer\": \"北京\"}, {\"right\": false, \"answer\": \"香港\"}, {\"right\": false, \"answer\": \"台湾\"}]'),
(530, 8, '欧洲三大电影节不包括下列哪一个？', '[{\"right\": false, \"answer\": \"威尼斯电影节\"}, {\"right\": true, \"answer\": \"瑞典电影节\"}, {\"right\": false, \"answer\": \"柏林国际电影节\"}, {\"right\": false, \"answer\": \"戛纳电影节\"}]'),
(531, 8, '她是一位著名影星，人称“谋女郎”，代表作是《卧虎藏龙》，请问这位', '[{\"right\": false, \"answer\": \"巩俐\"}, {\"right\": false, \"answer\": \"舒淇\"}, {\"right\": false, \"answer\": \"范冰冰\"}, {\"right\": true, \"answer\": \"章子怡\"}]'),
(532, 8, '首位在戛纳电影节封后的华人女演员是？', '[{\"right\": false, \"answer\": \"章子怡\"}, {\"right\": false, \"answer\": \"杨紫琼\"}, {\"right\": true, \"answer\": \"巩俐\"}, {\"right\": false, \"answer\": \"张曼玉\"}]'),
(533, 8, '《致我们即将逝去的青春》这部电影的导演是谁？', '[{\"right\": true, \"answer\": \"赵薇\"}, {\"right\": false, \"answer\": \"张艺谋\"}, {\"right\": false, \"answer\": \"林心如\"}, {\"right\": false, \"answer\": \"于仁泰\"}]'),
(534, 8, '以下哪个不是电影《听风者》的主要演员 ？', '[{\"right\": false, \"answer\": \"梁朝伟\"}, {\"right\": false, \"answer\": \"约瑟夫·高登-莱维特\"}, {\"right\": false, \"answer\": \"周迅\"}, {\"right\": true, \"answer\": \" 凯特·温丝莱特\"}]'),
(535, 8, '电影《枪王之王》影片的结尾出现了一段文字，说明借本片纪念张国荣的', '[{\"right\": false, \"answer\": \"《枪王之王》 \"}, {\"right\": false, \"answer\": \"《神枪手》\"}, {\"right\": false, \"answer\": \"《枪王之战》\"}, {\"right\": true, \"answer\": \"《枪王》\"}]'),
(536, 8, '宫崎骏的作品《千与千寻》中，影片最后，在千寻的帮助下，白龙找回了', '[{\"right\": true, \"answer\": \"琥珀川\"}, {\"right\": false, \"answer\": \" 荻野千寻\"}, {\"right\": false, \"answer\": \"小白\"}, {\"right\": false, \"answer\": \"赈早贤 \"}]'),
(537, 8, '电影《一个陌生女人的来信》的导演是下列哪位？', '[{\"right\": false, \"answer\": \"吴基恒\"}, {\"right\": false, \"answer\": \"陈可辛 \"}, {\"right\": true, \"answer\": \"徐静蕾\"}, {\"right\": false, \"answer\": \"韦家辉\"}]'),
(538, 8, '在香港僵尸系列电影中，借着一部讲述民国时期茅山道士捉僵尸题材的影', '[{\"right\": true, \"answer\": \"林正英\"}, {\"right\": false, \"answer\": \"洪金宝 \"}, {\"right\": false, \"answer\": \"钱小豪\"}, {\"right\": false, \"answer\": \"郑则仕\"}]'),
(539, 8, '《分手合约》的女主角是下列哪位明星饰演的？', '[{\"right\": false, \"answer\": \"吴佩慈\"}, {\"right\": true, \"answer\": \"白百何\"}, {\"right\": false, \"answer\": \"伊能静\"}, {\"right\": false, \"answer\": \"安以轩\"}]'),
(540, 8, '1933年摄制完成的《姊妹花》的女主角在这一年获得了“电影皇后”', '[{\"right\": false, \"answer\": \"阮玲玉\"}, {\"right\": false, \"answer\": \"王汉伦\"}, {\"right\": true, \"answer\": \"胡蝶\"}, {\"right\": false, \"answer\": \"杨紫琼\"}]'),
(541, 8, '系列电影《加勒比海盗》是哪间电影公司的作品？', '[{\"right\": false, \"answer\": \"梦工厂\"}, {\"right\": false, \"answer\": \"华纳\"}, {\"right\": true, \"answer\": \"迪士尼\"}, {\"right\": false, \"answer\": \"好莱坞\"}]'),
(542, 8, '电影《狄仁杰之通天帝国》中，大陆演员邓超所饰演的裴东来是导演徐克', '[{\"right\": true, \"answer\": \"有白化病\"}, {\"right\": false, \"answer\": \"肤色黝黑\"}, {\"right\": false, \"answer\": \"黑衣人\"}, {\"right\": false, \"answer\": \"白衣人\"}]'),
(543, 8, '下列不属于影帝梁朝伟的电影作品是？', '[{\"right\": false, \"answer\": \"《花样年华》\"}, {\"right\": true, \"answer\": \"《重庆森林》\"}, {\"right\": false, \"answer\": \"《悲情城市》\"}, {\"right\": false, \"answer\": \"《旺角卡门》\"}]'),
(544, 8, '电影《李米的猜想》的女主角李米的扮演者是谁？', '[{\"right\": false, \"answer\": \"范冰冰\"}, {\"right\": false, \"answer\": \"李冰冰\"}, {\"right\": false, \"answer\": \"赵薇\"}, {\"right\": true, \"answer\": \"周迅\"}]'),
(545, 8, '意大利著名电影《海上钢琴师》中，钢琴师的结局是？', '[{\"right\": false, \"answer\": \"离开了船，到岸上生活\"}, {\"right\": false, \"answer\": \"与爱人一起环游世界\"}, {\"right\": true, \"answer\": \"与船一起沉落大海\"}, {\"right\": false, \"answer\": \"在船上开了个人演奏会\"}]'),
(546, 8, '2004年武侠巨献《十面埋伏》的导演是？', '[{\"right\": false, \"answer\": \"吴宇森\"}, {\"right\": true, \"answer\": \"张艺谋\"}, {\"right\": false, \"answer\": \"李安\"}, {\"right\": false, \"answer\": \"陈凯歌\"}]'),
(547, 8, '电影的基本语言是什么?', '[{\"right\": true, \"answer\": \"声音和画面 \"}, {\"right\": false, \"answer\": \"声音和动作\"}, {\"right\": false, \"answer\": \"画面和动作\"}, {\"right\": false, \"answer\": \"画面和感情 \"}]'),
(548, 8, '田汉作词、聂耳作曲的《义勇军进行曲》是下列哪部影片的主题歌？', '[{\"right\": true, \"answer\": \"《风云儿女》\"}, {\"right\": false, \"answer\": \"《城市之夜》\"}, {\"right\": false, \"answer\": \"《母性之光》\"}, {\"right\": false, \"answer\": \"《马路天使》\"}]'),
(549, 8, '动漫《秦时明月》的主题曲《月光》是谁唱的？', '[{\"right\": false, \"answer\": \"林志炫\"}, {\"right\": false, \"answer\": \"张敬轩\"}, {\"right\": true, \"answer\": \"胡彦斌\"}, {\"right\": false, \"answer\": \"胡歌\"}]'),
(550, 8, '《暮光之城》男主角吸血鬼是谁主演的？', '[{\"right\": false, \"answer\": \"杰森·贝特曼\"}, {\"right\": true, \"answer\": \"罗伯特·帕丁森\"}, {\"right\": false, \"answer\": \"小罗伯特﹒唐尼\"}, {\"right\": false, \"answer\": \"凯特﹒哈德森\"}]'),
(551, 8, ' 巴金的小说《激流》有三部曲，其中有一部被国联公司拍成电影，请问', '[{\"right\": true, \"answer\": \"《寒夜》\"}, {\"right\": false, \"answer\": \"《家》\"}, {\"right\": false, \"answer\": \"《雾》\"}, {\"right\": false, \"answer\": \"《秋》\"}]'),
(552, 8, '罕有的才情和写传奇的本领，在与桑弧合作的《不了情》、《太太万岁》', '[{\"right\": false, \"answer\": \"琼瑶\"}, {\"right\": true, \"answer\": \"张爱玲\"}, {\"right\": false, \"answer\": \"萧红\"}, {\"right\": false, \"answer\": \"阮玲玉\"}]'),
(553, 8, '下列电影中哪一部不是白百何主演？', '[{\"right\": false, \"answer\": \"《失恋33天》\"}, {\"right\": false, \"answer\": \"《我的青春我做主》\"}, {\"right\": true, \"answer\": \"《大城小事》\"}, {\"right\": false, \"answer\": \"《幸福在哪里》\"}]'),
(554, 8, '《第101次求婚》的女主角是谁？', '[{\"right\": false, \"answer\": \"梁咏琪\"}, {\"right\": false, \"answer\": \"杨颖\"}, {\"right\": false, \"answer\": \"刘诗诗\"}, {\"right\": true, \"answer\": \"林志玲\"}]'),
(555, 8, '1913年，中国拍摄了由剧评家郑正秋编写剧本的第一部故事片是下列', '[{\"right\": true, \"answer\": \"难夫难妻\"}, {\"right\": false, \"answer\": \"风云儿女\"}, {\"right\": false, \"answer\": \"火车进站\"}, {\"right\": false, \"answer\": \"渔光曲\"}]'),
(556, 8, '中国第一次电影放映的地方在上海的哪个地方？', '[{\"right\": true, \"answer\": \"徐园\"}, {\"right\": false, \"answer\": \"大光明电影院\"}, {\"right\": false, \"answer\": \"大上海影院\"}, {\"right\": false, \"answer\": \"上海电影院\"}]'),
(557, 8, '中国第一个涉及电影拍摄的出版社是下列哪一个？', '[{\"right\": false, \"answer\": \"文学出版社\"}, {\"right\": false, \"answer\": \"电影出版社\"}, {\"right\": true, \"answer\": \"商务出版社\"}, {\"right\": false, \"answer\": \"古籍书店\"}]'),
(558, 8, '电影《搜索》的男主角是谁？', '[{\"right\": false, \"answer\": \"彭于晏\"}, {\"right\": true, \"answer\": \"赵又廷\"}, {\"right\": false, \"answer\": \"佟大为\"}, {\"right\": false, \"answer\": \"张家辉\"}]'),
(559, 8, '刚上映不久的电影《忠烈杨家将》中饰演杨三郎的明星是谁？', '[{\"right\": false, \"answer\": \"郑伊健\"}, {\"right\": false, \"answer\": \"吴尊\"}, {\"right\": false, \"answer\": \"付辛博\"}, {\"right\": true, \"answer\": \"周渝民\"}]'),
(560, 8, '在革命根据地电影事业不断发展壮大，成为中国电影发展史上最重要组成', '[{\"right\": true, \"answer\": \"延安电影团\"}, {\"right\": false, \"answer\": \"鲁迅艺术团\"}, {\"right\": false, \"answer\": \"抗日大学\"}, {\"right\": false, \"answer\": \"抗战电影大学  \"}]'),
(561, 8, '你知道以下哪部动画片1978年获伦敦国际电影节最佳影片奖？', '[{\"right\": true, \"answer\": \"大闹天宫\"}, {\"right\": false, \"answer\": \"人参娃娃\"}, {\"right\": false, \"answer\": \"金色的海螺\"}, {\"right\": false, \"answer\": \"骄傲的将军 \"}]'),
(562, 8, '在2012年上映的电影《第一次》中的女主角是谁饰演的？', '[{\"right\": false, \"answer\": \"范晓萱\"}, {\"right\": false, \"answer\": \"梁咏琪\"}, {\"right\": true, \"answer\": \"杨颖\"}, {\"right\": false, \"answer\": \"杨幂\"}]'),
(563, 8, '电影《生化危机》的女主角是下列哪位？', '[{\"right\": false, \"answer\": \"伊娃·朗格丽亚\"}, {\"right\": true, \"answer\": \"米拉·乔沃维奇\"}, {\"right\": false, \"answer\": \"佐伊·索尔达娜\"}, {\"right\": false, \"answer\": \"哈莉·贝瑞 \"}]'),
(564, 8, '《致我们终将逝去的青春》的主题曲是谁唱的？', '[{\"right\": false, \"answer\": \"陈红\"}, {\"right\": true, \"answer\": \"王菲\"}, {\"right\": false, \"answer\": \"尚雯婕\"}, {\"right\": false, \"answer\": \"韩红\"}]'),
(565, 8, '下列哪部电影融合了中国元素？', '[{\"right\": false, \"answer\": \"《玩具总动员》\"}, {\"right\": false, \"answer\": \"《机器人瓦力》\"}, {\"right\": true, \"answer\": \"《功夫熊猫》\"}, {\"right\": false, \"answer\": \"《怪兽公司》\"}]'),
(566, 8, '王菲2011巡唱成都站门票最高为?', '[{\"right\": false, \"answer\": \"2999元\"}, {\"right\": true, \"answer\": \"3999元\"}, {\"right\": false, \"answer\": \"4999元\"}, {\"right\": false, \"answer\": \"1999元\"}]'),
(567, 8, '白百何在电影失恋33天中表现抢眼她的老公是谁?', '[{\"right\": false, \"answer\": \"胡海泉\"}, {\"right\": false, \"answer\": \"朴树\"}, {\"right\": true, \"answer\": \"陈羽凡\"}, {\"right\": false, \"answer\": \"文章\"}]'),
(568, 8, '中国电影历史上第一部电影是?', '[{\"right\": true, \"answer\": \"定军山\"}, {\"right\": false, \"answer\": \"歌女红牡丹\"}, {\"right\": false, \"answer\": \"渔光曲\"}, {\"right\": false, \"answer\": \"新儿女英雄传\"}]'),
(569, 8, '有一部根据同名小说飘改编的电影那请问这部影片的名称是?', '[{\"right\": false, \"answer\": \"罗马假日\"}, {\"right\": true, \"answer\": \"乱世佳人\"}, {\"right\": false, \"answer\": \"魂断蓝桥\"}, {\"right\": false, \"answer\": \"窈窕淑女\"}]'),
(570, 8, '接拍新神雕侠侣的女主角是?', '[{\"right\": false, \"answer\": \"刘亦菲\"}, {\"right\": false, \"answer\": \"钟欣桐\"}, {\"right\": true, \"answer\": \"陈妍希\"}, {\"right\": false, \"answer\": \"周冬雨\"}]'),
(571, 8, '以下哪位艺人出演了龙门飞甲?', '[{\"right\": true, \"answer\": \"陈坤\"}, {\"right\": false, \"answer\": \"桂纶镁\"}, {\"right\": false, \"answer\": \"章子怡\"}, {\"right\": false, \"answer\": \"范晓萱\"}]'),
(572, 8, '下面哪位艺人自曝喜欢看人擦窗户?', '[{\"right\": false, \"answer\": \"林志颖\"}, {\"right\": false, \"answer\": \"袁咏仪\"}, {\"right\": false, \"answer\": \"周杰伦\"}, {\"right\": true, \"answer\": \"王力宏\"}]'),
(573, 8, '下面哪位女星曾是大胖子?', '[{\"right\": false, \"answer\": \"林心如\"}, {\"right\": false, \"answer\": \"赵薇\"}, {\"right\": true, \"answer\": \"赵丽颖\"}, {\"right\": false, \"answer\": \"刘涛\"}]'),
(574, 8, '十月围城中的故事发生的地点是?', '[{\"right\": false, \"answer\": \"广州\"}, {\"right\": false, \"answer\": \"北京\"}, {\"right\": false, \"answer\": \"日本\"}, {\"right\": true, \"answer\": \"香港\"}]'),
(575, 8, '下面那首歌表达了SHE之间的感情?', '[{\"right\": true, \"answer\": \"老婆\"}, {\"right\": false, \"answer\": \"天使在唱歌\"}, {\"right\": false, \"answer\": \"不想唱歌\"}, {\"right\": false, \"answer\": \"爱呢\"}]'),
(576, 8, '分手合约的主题曲相爱有时是谁唱的?', '[{\"right\": false, \"answer\": \"莫文蔚\"}, {\"right\": false, \"answer\": \"郭静\"}, {\"right\": true, \"answer\": \"尚雯婕\"}, {\"right\": false, \"answer\": \"陈慧娴\"}]'),
(577, 8, '新版笑傲江湖中的东方不败是下面谁演的?', '[{\"right\": false, \"answer\": \"袁珊珊\"}, {\"right\": true, \"answer\": \"陈乔恩\"}, {\"right\": false, \"answer\": \"霍建华\"}, {\"right\": false, \"answer\": \"佟丽娅\"}]'),
(578, 8, '下述一组优秀影片产生于中国40年代的是?', '[{\"right\": false, \"answer\": \"一江春水向东流神女\"}, {\"right\": true, \"answer\": \"一江春水向东流乌鸦与麻雀\"}, {\"right\": false, \"answer\": \"乌鸦与麻雀林家铺子\"}, {\"right\": false, \"answer\": \"神女青春之歌\"}]'),
(579, 8, '历史上的第一部有声电影是?', '[{\"right\": false, \"answer\": \"歌女红牡丹\"}, {\"right\": false, \"answer\": \"红色沙漠\"}, {\"right\": true, \"answer\": \"爵士歌王\"}, {\"right\": false, \"answer\": \"浮华世界\"}]'),
(580, 8, '世界电影诞生于?', '[{\"right\": true, \"answer\": \"1895年\"}, {\"right\": false, \"answer\": \"1896年\"}, {\"right\": false, \"answer\": \"1905年\"}, {\"right\": false, \"answer\": \"1906年\"}]'),
(581, 8, '1945年意大利著名导演罗西里尼的影片标志着新现实主义电影运动的', '[{\"right\": true, \"answer\": \"罗马不设防的城市\"}, {\"right\": false, \"answer\": \"与狼共舞\"}, {\"right\": false, \"answer\": \"八部半\"}, {\"right\": false, \"answer\": \"贝壳与僧侣\"}]'),
(582, 8, '电影叙事学的理论基础是结构主义叙事学其奠基人为?', '[{\"right\": false, \"answer\": \"弗洛伊德\"}, {\"right\": false, \"answer\": \"列维8226斯特劳斯\"}, {\"right\": true, \"answer\": \"麦茨\"}, {\"right\": false, \"answer\": \"索绪尔\"}]'),
(583, 8, '提出媒介是人的延伸和地球村概念的传播学家是?', '[{\"right\": false, \"answer\": \"拉斯韦尔\"}, {\"right\": true, \"answer\": \"麦克卢汉\"}, {\"right\": false, \"answer\": \"阿恩海姆\"}, {\"right\": false, \"answer\": \"马尔库塞\"}]'),
(584, 8, '在北京丰泰照相馆拍摄了我国第一部影片定军山它标志着中国电影的诞生', '[{\"right\": false, \"answer\": \"1903年\"}, {\"right\": false, \"answer\": \"1904年\"}, {\"right\": true, \"answer\": \"1905年\"}, {\"right\": false, \"answer\": \"1906年\"}]'),
(585, 8, '标志着电影心理学这门新学科的诞生的专著电影一次心理学研究的问世的', '[{\"right\": false, \"answer\": \"阿恩海姆\"}, {\"right\": true, \"answer\": \"闵斯特堡\"}, {\"right\": false, \"answer\": \"普多夫金\"}, {\"right\": false, \"answer\": \"巴拉兹\"}]'),
(586, 8, '热情奏鸣曲是的作品?', '[{\"right\": false, \"answer\": \"莫扎特\"}, {\"right\": false, \"answer\": \"舒伯特\"}, {\"right\": false, \"answer\": \"苏佩\"}, {\"right\": true, \"answer\": \"贝多芬\"}]'),
(587, 8, '创作著名钢琴曲一分钟圆舞曲的肖邦是的音乐家?', '[{\"right\": false, \"answer\": \"奥地利\"}, {\"right\": false, \"answer\": \"匈牙利\"}, {\"right\": true, \"answer\": \"波兰\"}, {\"right\": false, \"answer\": \"荷兰\"}]'),
(588, 8, '二胡曲良宵的作者是?', '[{\"right\": true, \"answer\": \"华彦钧\"}, {\"right\": false, \"answer\": \"刘天华\"}, {\"right\": false, \"answer\": \"刘北茂\"}, {\"right\": false, \"answer\": \"肖友梅\"}]'),
(589, 8, '法国印象派音乐的代表人物是?', '[{\"right\": false, \"answer\": \"柏辽兹\"}, {\"right\": false, \"answer\": \"比才\"}, {\"right\": false, \"answer\": \"肖邦\"}, {\"right\": true, \"answer\": \"德彪西\"}]'),
(590, 8, '京韵大鼓是音乐的一种形式?', '[{\"right\": false, \"answer\": \"戏曲\"}, {\"right\": true, \"answer\": \"说唱\"}, {\"right\": false, \"answer\": \"歌舞\"}, {\"right\": false, \"answer\": \"秧歌\"}]'),
(591, 8, '舞剧天鹅湖的曲作者是?', '[{\"right\": false, \"answer\": \"贝多芬\"}, {\"right\": true, \"answer\": \"柴科夫斯基\"}, {\"right\": false, \"answer\": \"德彪西\"}, {\"right\": false, \"answer\": \"莫扎特\"}]'),
(592, 8, '巴赫和亨德尔是欧洲音乐史上时期的两位代表性作曲家?', '[{\"right\": false, \"answer\": \"浪漫主义\"}, {\"right\": false, \"answer\": \"印象主义\"}, {\"right\": true, \"answer\": \"巴洛克\"}, {\"right\": false, \"answer\": \"文艺复兴\"}]'),
(593, 8, '黄河大合唱的曲作者是?', '[{\"right\": false, \"answer\": \"聂耳\"}, {\"right\": true, \"answer\": \"冼星海\"}, {\"right\": false, \"answer\": \"贺绿汀\"}, {\"right\": false, \"answer\": \"郑律成\"}]'),
(594, 8, '第二届中国好声音中的冠军出自哪位导师的战队?', '[{\"right\": true, \"answer\": \"张惠妹\"}, {\"right\": false, \"answer\": \"那英\"}, {\"right\": false, \"answer\": \"汪峰\"}, {\"right\": false, \"answer\": \"庾澄庆\"}]'),
(595, 8, '2013快乐男声首次开启V神模式请问以下哪位没有担任过本届快男的', '[{\"right\": false, \"answer\": \"范冰冰\"}, {\"right\": false, \"answer\": \"海清\"}, {\"right\": false, \"answer\": \"杨幂\"}, {\"right\": true, \"answer\": \"李冰冰\"}]'),
(596, 8, '下列哪部电影不是周杰伦执导或者参演的？', '[{\"right\": false, \"answer\": \"天台爱情\"}, {\"right\": true, \"answer\": \"熊猫大侠\"}, {\"right\": false, \"answer\": \"青蜂侠\"}, {\"right\": false, \"answer\": \"寻找周杰伦\"}]'),
(597, 8, '演而优则导演员跨刀做导演已是司空见惯请问下面哪位没有做过导演?', '[{\"right\": false, \"answer\": \"赵薇\"}, {\"right\": false, \"answer\": \"徐静蕾\"}, {\"right\": true, \"answer\": \"李冰冰\"}, {\"right\": false, \"answer\": \"杨采妮\"}]'),
(598, 8, '明星的感情世界向来风云变幻请问下面明星哪位没有爆出离婚新闻?', '[{\"right\": false, \"answer\": \"汪峰\"}, {\"right\": false, \"answer\": \"董洁\"}, {\"right\": false, \"answer\": \"王菲\"}, {\"right\": true, \"answer\": \"汪小菲\"}]'),
(599, 8, '小说改编电视剧日渐热门请问下面哪部电视剧不是由小说改编而来?', '[{\"right\": true, \"answer\": \"兰陵王\"}, {\"right\": false, \"answer\": \"倾世皇妃\"}, {\"right\": false, \"answer\": \"绝爱之城\"}, {\"right\": false, \"answer\": \"云中歌\"}]'),
(600, 8, '宫斗主题饱受都市年轻人热议请问下面哪部电视剧不属于宫斗系列?', '[{\"right\": false, \"answer\": \"金枝欲孽\"}, {\"right\": false, \"answer\": \"甄嬛传\"}, {\"right\": true, \"answer\": \"公主嫁到\"}, {\"right\": false, \"answer\": \"唐宫燕\"}]'),
(601, 8, '新晋的内地四小花不包括?', '[{\"right\": false, \"answer\": \"杨幂\"}, {\"right\": true, \"answer\": \"赵丽颖\"}, {\"right\": false, \"answer\": \"唐嫣\"}, {\"right\": false, \"answer\": \"戚薇\"}]'),
(602, 8, '下面哪部电视剧不是由游戏改编而来?', '[{\"right\": false, \"answer\": \"古剑奇谭\"}, {\"right\": false, \"answer\": \"轩辕剑\"}, {\"right\": false, \"answer\": \"剑侠情缘\"}, {\"right\": true, \"answer\": \"紫钗奇缘\"}]'),
(603, 8, '越来越多的明星选择在公众面前公开恋情下面哪对明星情侣关系没有对外', '[{\"right\": false, \"answer\": \"杨幂刘恺威\"}, {\"right\": false, \"answer\": \"倪妮冯绍峰\"}, {\"right\": false, \"answer\": \"严宽杜若溪\"}, {\"right\": true, \"answer\": \"霍建华陈乔恩\"}]'),
(604, 8, '林夕被称为词霸请问下面哪首歌曲的歌词不是由林夕创作?', '[{\"right\": false, \"answer\": \"再见二丁目\"}, {\"right\": false, \"answer\": \"红豆\"}, {\"right\": false, \"answer\": \"似是故人来\"}, {\"right\": true, \"answer\": \"可惜我是水瓶座\"}]');

-- --------------------------------------------------------

--
-- 表的结构 `question_sort`
--

CREATE TABLE `question_sort` (
  `id` int(11) NOT NULL,
  `sort` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `question_sort`
--

INSERT INTO `question_sort` (`id`, `sort`) VALUES
(1, '综合'),
(2, '科学'),
(3, '地理'),
(4, '历史'),
(5, '体育'),
(6, '生物'),
(7, '文学'),
(8, '影视'),
(9, '动漫'),
(10, '音乐'),
(11, '生活');

-- --------------------------------------------------------

--
-- 表的结构 `user_network`
--

CREATE TABLE `user_network` (
  `clickId` int(11) NOT NULL,
  `fromClickId` int(11) NOT NULL DEFAULT '0',
  `appid` varchar(128) NOT NULL,
  `openid` varchar(128) NOT NULL,
  `fromGId` varchar(128) NOT NULL,
  `scene` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `param_1` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--
--
-- 表的结构 `fighting_record`
--

CREATE TABLE `fighting_record` (
  `id` int(11) NOT NULL,
  `room_name` varchar(128) NOT NULL,
  `run_away` tinyint(1) NOT NULL,
  `open_id_winner` varchar(64) NOT NULL,
  `open_id_loser` varchar(64) NOT NULL,
  `score_winner` int(11) NOT NULL,
  `score_loser` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `cSessionInfo`
--
ALTER TABLE `cSessionInfo`
  ADD PRIMARY KEY (`open_id`),
  ADD KEY `openid` (`open_id`) USING BTREE,
  ADD KEY `skey` (`skey`) USING BTREE;

--
-- Indexes for table `friendsnetwork`
--
ALTER TABLE `friendsnetwork`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_detail`
--
ALTER TABLE `question_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_sort`
--
ALTER TABLE `question_sort`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_network`
--
ALTER TABLE `user_network`
  ADD PRIMARY KEY (`clickId`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `friendsnetwork`
--
ALTER TABLE `friendsnetwork`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `question_detail`
--
ALTER TABLE `question_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=605;
--
-- 使用表AUTO_INCREMENT `question_sort`
--
ALTER TABLE `question_sort`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `user_network`
--
ALTER TABLE `user_network`
  MODIFY `clickId` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
