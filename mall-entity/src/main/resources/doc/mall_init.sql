-- 1、创建角色表：sys_role
DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role (
  role_id int(10) NOT NULL AUTO_INCREMENT COMMENT '角色主键',
  role_name varchar(200) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (role_id)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
insert  into sys_role(role_id,role_name) values (1,'超级管理员');

-- 2、创建用户表：sys_user
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
  user_id int(10) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  user_no varchar(100) DEFAULT NULL COMMENT '用户编号',
  username varchar(200) DEFAULT NULL COMMENT '真实姓名',
  login_name varchar(500) DEFAULT NULL COMMENT '用户登录名',
  password varchar(500) DEFAULT NULL COMMENT '用户登录密码，MD5加密',
  role_id int(10) DEFAULT NULL COMMENT '用户角色',
  gender varchar(50) DEFAULT NULL COMMENT '性别：M-男，F-女',
  id_card varchar(100) DEFAULT NULL COMMENT '身份证号码',
  cellphone varchar(100) DEFAULT NULL COMMENT '联系电话',
  email varchar(500) DEFAULT NULL COMMENT '电子邮件',
  birthday date DEFAULT NULL COMMENT '出生日期',
  status_id int(10) DEFAULT NULL COMMENT '用户状态',
  create_user int(10) DEFAULT NULL COMMENT '创建人',
  create_time timestamp NULL DEFAULT NULL COMMENT '创建时间',
  update_user int(10) DEFAULT NULL COMMENT '更新人',
  update_time timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (user_id)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
insert  into sys_user(user_id,user_no,username,login_name,password,role_id,gender,id_card,cellphone,email,birthday,status_id,create_user,create_time,update_user,update_time) values (1,'AUG-00001','test','test','21232f297a57a5a743894a0e4a801fc3',1,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-09-05 16:36:24',NULL,'2018-09-05 17:09:13');

-- 3、创建菜单表：sys_menu
DROP TABLE IF EXISTS sys_menu;
CREATE TABLE sys_menu (
  menu_id int(10) NOT NULL AUTO_INCREMENT COMMENT '菜单主键',
  parent_id int(10) DEFAULT NULL COMMENT '上级菜单',
  text varchar(200) DEFAULT NULL COMMENT '菜单内容',
  icon varchar(500) DEFAULT NULL COMMENT '菜单图标',
  url varchar(500) DEFAULT NULL COMMENT '菜单地址',
  sort_order int(10) DEFAULT NULL COMMENT '排序字段',
  status_id int(10) DEFAULT NULL COMMENT '菜单状态',
  create_user int(10) DEFAULT NULL COMMENT '创建人',
  create_time timestamp NULL DEFAULT NULL COMMENT '创建时间',
  update_user int(10) DEFAULT NULL COMMENT '更新人',
  update_time timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (menu_id)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
insert  into sys_menu(menu_id,parent_id,text,icon,url,sort_order,status_id,create_user,create_time,update_user,update_time) values (1,NULL,'系统管理','fa fa-home',NULL,1,2,NULL,'2018-09-21 15:10:13',NULL,'2018-09-21 15:10:18'),(2,NULL,'基础管理','fa fa-leaf',NULL,2,2,NULL,'2018-09-21 15:10:21',NULL,NULL),(3,NULL,'商品管理','fa fa-gift',NULL,3,2,NULL,'2018-09-21 15:10:26',NULL,'2018-09-21 15:10:24'),(4,NULL,'交易管理','fa fa-cart-plus',NULL,4,2,NULL,'2018-09-21 15:10:29',NULL,NULL),(5,NULL,'会员管理','fa fa-users',NULL,5,2,NULL,'2018-09-21 15:10:31',NULL,NULL),(6,NULL,'物流管理','fa fa-truck',NULL,6,2,NULL,'2018-09-21 15:10:32',NULL,NULL),(7,1,'后台用户','fa fa-user','/user/list/1/0',11,2,NULL,'2018-09-21 15:10:37',NULL,NULL),(8,1,'后台角色','fa fa-street-view',NULL,12,2,NULL,NULL,NULL,NULL),(9,1,'个人信息','fa fa-cog',NULL,13,2,NULL,NULL,NULL,NULL),(10,2,'地址管理','fa fa-road',NULL,21,2,NULL,NULL,NULL,NULL),(11,2,'支付方式','fa fa-yen',NULL,NULL,2,NULL,NULL,NULL,NULL),(12,2,'积分等级','fa fa-circle-o',NULL,NULL,2,NULL,NULL,NULL,NULL),(13,3,'商品类别','fa fa-navicon',NULL,31,2,NULL,NULL,NULL,NULL),(14,3,'商品属性','fa fa-pencil',NULL,32,2,NULL,NULL,NULL,NULL),(15,3,'商品属性值','fa fa-server',NULL,33,2,NULL,NULL,NULL,NULL),(16,3,'商品信息','fa fa-gift',NULL,34,2,NULL,NULL,NULL,NULL),(17,4,'注册用户','fa fa-child',NULL,41,2,NULL,NULL,NULL,NULL),(18,4,'订单管理','fa fa-bookmark',NULL,42,2,NULL,NULL,NULL,NULL),(19,5,'会员管理','fa fa-user',NULL,NULL,2,NULL,NULL,NULL,NULL),(20,6,'物流公司','fa fa-truck',NULL,NULL,2,NULL,NULL,NULL,NULL),(21,6,'发货管理','fa fa-calendar-minus-o',NULL,NULL,2,NULL,NULL,NULL,NULL),(22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

-- 4、创建角色、菜单关联表：sys_role_menu
DROP TABLE IF EXISTS sys_role_menu;
CREATE TABLE sys_role_menu (
  role_id int(10) DEFAULT NULL COMMENT '角色主键',
  menu_id int(10) DEFAULT NULL COMMENT '菜单主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
insert  into sys_role_menu(role_id,menu_id) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21);

-- 5、创建状态表：sys_status
DROP TABLE IF EXISTS sys_status;
CREATE TABLE sys_status (
  status_id int(10) NOT NULL AUTO_INCREMENT COMMENT '状态主键',
  parent_id int(10) DEFAULT NULL COMMENT '上级主键',
  status_name varchar(255) DEFAULT NULL COMMENT '状态名称',
  status_code varchar(255) DEFAULT NULL COMMENT '状态编码',
  sort_order varchar(10) DEFAULT NULL COMMENT '排序字段',
  PRIMARY KEY (status_id)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
insert  into sys_status(status_id,parent_id,status_name,status_code,sort_order) values (1,1,'是否启用',NULL,'1'),(2,1,'启用','ENABLE','11'),(3,1,'禁用','DISABLE','12');

-- 6、创建省份表：sys_province
DROP TABLE IF EXISTS sys_province;
CREATE TABLE sys_province (
  province_id int(10) NOT NULL AUTO_INCREMENT COMMENT '省份主键',
  province_name varchar(255) DEFAULT NULL COMMENT '省份名称',
  province_code varchar(255) DEFAULT NULL COMMENT '省份编码',
  PRIMARY KEY (province_id)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
insert  into sys_province(province_id,province_name,province_code) values (1,'北京市','110000'),(2,'天津市','120000'),(3,'河北省','130000'),(4,'山西省','140000'),(5,'内蒙古自治区','150000'),(6,'辽宁省','210000'),(7,'吉林省','220000'),(8,'黑龙江省','230000'),(9,'上海市','310000'),(10,'江苏省','320000'),(11,'浙江省','330000'),(12,'安徽省','340000'),(13,'福建省','350000'),(14,'江西省','360000'),(15,'山东省','370000'),(16,'河南省','410000'),(17,'湖北省','420000'),(18,'湖南省','430000'),(19,'广东省','440000'),(20,'广西壮族自治区','450000'),(21,'海南省','460000'),(22,'重庆市','500000'),(23,'四川省','510000'),(24,'贵州省','520000'),(25,'云南省','530000'),(26,'西藏自治区','540000'),(27,'陕西省','610000'),(28,'甘肃省','620000'),(29,'青海省','630000'),(30,'宁夏回族自治区','640000'),(31,'新疆维吾尔自治区','650000'),(32,'台湾省','710000'),(33,'香港特别行政区','810000'),(34,'澳门特别行政区','820000');

-- 7、创建城市表：sys_city
DROP TABLE IF EXISTS sys_city;
CREATE TABLE sys_city (
  city_id int(10) NOT NULL AUTO_INCREMENT COMMENT '城市主键',
  province_id int(10) DEFAULT NULL COMMENT '所在身份',
  city_name varchar(255) DEFAULT NULL COMMENT '城市名称',
  city_code varchar(255) DEFAULT NULL COMMENT '城市编码',
  PRIMARY KEY (city_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 8、创建区县表：sys_county
DROP TABLE IF EXISTS sys_county;
CREATE TABLE sys_county (
  county_id int(10) NOT NULL COMMENT '区县主键',
  province_id int(10) DEFAULT NULL COMMENT '所在省份',
  city_id int(10) DEFAULT NULL COMMENT '所在城市',
  county_name varchar(255) DEFAULT NULL COMMENT '区县名称',
  county_code varchar(255) DEFAULT NULL COMMENT '区县编码',
  PRIMARY KEY (county_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;