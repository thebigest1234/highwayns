﻿DROP TABLE IF EXISTS `hw_ad`;
CREATE TABLE `hw_ad` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `alias` varchar(80) NOT NULL,
  `is_display` tinyint(1) NOT NULL default '1',
  `category_id` smallint(5) NOT NULL,
  `type_id` smallint(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `note` varchar(230) NOT NULL,
  `show_order` int(10) unsigned NOT NULL default '50',
  `addtime` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `deadline` int(11) NOT NULL default '0',
  `text_content` varchar(250) NOT NULL,
  `text_url` varchar(250) NOT NULL,
  `text_color` varchar(60) NOT NULL,
  `img_path` varchar(250) NOT NULL,
  `img_url` varchar(250) NOT NULL,
  `img_explain` varchar(250) NOT NULL,
  `img_uid` int(10) NOT NULL default '0',
  `code_content` text NOT NULL,
  `flash_path` varchar(250) NOT NULL,
  `flash_width` int(10) unsigned NOT NULL,
  `flash_height` int(10) unsigned NOT NULL,
  `floating_type` tinyint(3) unsigned NOT NULL default '1',
  `floating_width` int(10) unsigned NOT NULL,
  `floating_height` int(10) unsigned NOT NULL,
  `floating_url` varchar(250) NOT NULL,
  `floating_path` varchar(250) NOT NULL,
  `floating_left` varchar(10) NOT NULL,
  `floating_right` varchar(10) NOT NULL,
  `floating_top` int(11) NOT NULL,
  `video_path` varchar(250) NOT NULL,
  `video_width` int(10) unsigned NOT NULL,
  `video_height` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `alias_starttime_deadline` (`alias`,`starttime`,`deadline`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||adテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_admin`;
CREATE TABLE `hw_admin` (
  `admin_id` smallint(5) unsigned NOT NULL auto_increment,
  `admin_name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `pwd` varchar(32) NOT NULL,
  `pwd_hash` varchar(30) NOT NULL,
  `purview` text NOT NULL,
  `rank` varchar(32) NOT NULL,
  `add_time` int(10) NOT NULL,
  `last_login_time` int(10) NOT NULL,
  `last_login_ip` varchar(15) NOT NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||adminテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_admin_log`;
CREATE TABLE `hw_admin_log` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `admin_name` varchar(20) NOT NULL,
  `add_time` int(10) NOT NULL,
  `log_value` varchar(255) NOT NULL,
  `log_ip` varchar(20) NOT NULL,
  `log_type` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`log_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||admin_logテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_ad_category`;
CREATE TABLE `hw_ad_category` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `alias` varchar(100) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `categoryname` varchar(100) NOT NULL,
  `admin_set` tinyint(3) unsigned NOT NULL default '0',
  `expense` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||ad_categoryテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_article`;
CREATE TABLE `hw_article` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `type_id` tinyint(3) unsigned NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `tit_color` varchar(10) NULL default NULL,
  `tit_b` tinyint(1) unsigned NOT NULL default '0',
  `Small_img` varchar(80) NULL default NULL,
  `author` varchar(50) NULL default NULL,
  `source` varchar(100) NULL default NULL,
  `focos` tinyint(3) unsigned NOT NULL default '1',
  `is_display` tinyint(3) unsigned NOT NULL default '1',
  `is_url` varchar(200) NOT NULL default '0',
  `seo_keywords` varchar(100) NULL default NULL,
  `seo_description` varchar(200) NULL default NULL,
  `click` int(10) unsigned NOT NULL default '1',
  `addtime` int(10) unsigned NOT NULL,
  `article_order` smallint(5) unsigned NOT NULL default '0',
  `robot` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `type_id_article_order_id` (`type_id`,`article_order`,`id`),
  KEY `click` (`click`),
  KEY `focos_article_order_id` (`focos`,`article_order`,`id`),
  KEY `addtime` (`addtime`),
  KEY `parentid_article_order_id` (`parentid`,`article_order`,`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||articleテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_article_category`;
CREATE TABLE `hw_article_category` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `parentid` smallint(5) unsigned NOT NULL,
  `categoryname` varchar(80) NOT NULL,
  `category_order` smallint(5) unsigned NOT NULL default '0',
  `title` varchar(255) NULL default NULL,
  `description` varchar(255) NULL default NULL,
  `keywords` varchar(255) NULL default NULL,
  `admin_set` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||article_categoryテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_article_property`;
CREATE TABLE `hw_article_property` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `categoryname` varchar(30) NOT NULL,
  `category_order` smallint(5) unsigned NOT NULL default '0',
  `admin_set` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||article_propertyテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_audit_reason`;
CREATE TABLE `hw_audit_reason` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `jobs_id` int(10) unsigned NOT NULL default '0',
  `company_id` int(10) unsigned NOT NULL default '0',
  `resume_id` int(10) unsigned NOT NULL default '0',
  `reason` varchar(255) NOT NULL,
  `addtime` int(10) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `jobs_id` (`jobs_id`),
  KEY `company_id` (`company_id`),
  KEY `resume_id` (`resume_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||audit_reasonテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_baiduxml`;
CREATE TABLE `hw_baiduxml` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||baiduxmlテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_baidu_submiturl`;
CREATE TABLE `hw_baidu_submiturl` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||baidu_submiturlテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_captcha`;
CREATE TABLE `hw_captcha` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `value` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||captchaテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_category`;
CREATE TABLE `hw_category` (
  `c_id` int(10) unsigned NOT NULL auto_increment,
  `c_parentid` int(10) unsigned NOT NULL,
  `c_alias` char(30) NOT NULL,
  `c_name` char(30) NOT NULL,
  `c_order` int(10) NOT NULL,
  `c_index` char(1) NOT NULL,
  `c_note` char(60) NOT NULL,
  `stat_jobs` char(15) NOT NULL,
  `stat_resume` char(15) NOT NULL,
  PRIMARY KEY  (`c_id`),
  KEY `c_alias` (`c_alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||categoryテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_category_district`;
CREATE TABLE `hw_category_district` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `parentid` int(10) unsigned NOT NULL default '0',
  `categoryname` varchar(30) NOT NULL,
  `category_order` smallint(5) unsigned NOT NULL default '0',
  `stat_jobs` varchar(15) NOT NULL,
  `stat_resume` varchar(15) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||category_districtテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_category_group`;
CREATE TABLE `hw_category_group` (
  `g_id` int(10) unsigned NOT NULL auto_increment,
  `g_alias` varchar(60) NOT NULL,
  `g_name` varchar(100) NOT NULL,
  `g_sys` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`g_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||category_groupテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_category_jobs`;
CREATE TABLE `hw_category_jobs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `parentid` smallint(5) unsigned NOT NULL,
  `categoryname` varchar(80) NOT NULL,
  `category_order` smallint(5) unsigned NOT NULL default '0',
  `stat_jobs` varchar(15) NOT NULL,
  `stat_resume` varchar(15) NOT NULL,
  `content` text NULL,
  PRIMARY KEY  (`id`),
  KEY `parentid` (`parentid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||category_jobsテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_category_major`;
CREATE TABLE `hw_category_major` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `parentid` int(10) NOT NULL,
  `categoryname` varchar(50) NOT NULL,
  `category_order` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||category_majorテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_color`;
CREATE TABLE `hw_color` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `value` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||colorテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_company_down_resume`;
CREATE TABLE `hw_company_down_resume` (
  `did` int(10) unsigned NOT NULL auto_increment,
  `resume_id` int(10) unsigned NOT NULL,
  `resume_name` varchar(60) NOT NULL,
  `resume_uid` int(10) unsigned NOT NULL,
  `company_uid` int(10) unsigned NOT NULL,
  `company_name` varchar(60) NOT NULL,
  `down_addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`did`),
  KEY `resume_uid_resume_id` (`resume_uid`,`resume_id`),
  KEY `down_addtime` (`down_addtime`),
  KEY `company_uid_down_addtime` (`company_uid`,`down_addtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||company_down_resumeテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_company_favorites`;
CREATE TABLE `hw_company_favorites` (
  `did` int(10) unsigned NOT NULL auto_increment,
  `resume_id` int(10) unsigned NOT NULL,
  `company_uid` int(10) unsigned NOT NULL,
  `favoritesa_ddtime` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`did`),
  KEY `company_uid` (`company_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||company_favoritesテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_company_interview`;
CREATE TABLE `hw_company_interview` (
  `did` int(10) unsigned NOT NULL auto_increment,
  `resume_id` int(10) unsigned NOT NULL,
  `resume_name` varchar(30) NOT NULL,
  `resume_addtime` int(10) NOT NULL,
  `resume_uid` int(10) unsigned NOT NULL,
  `jobs_id` int(10) unsigned NOT NULL,
  `jobs_name` varchar(60) NOT NULL,
  `jobs_addtime` int(10) NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `company_name` varchar(60) NOT NULL,
  `company_addtime` int(10) NOT NULL,
  `company_uid` int(10) unsigned NOT NULL,
  `interview_addtime` int(10) unsigned NOT NULL,
  `notes` varchar(255) NOT NULL default '',
  `personal_look` tinyint(3) unsigned NOT NULL default '1',
  `interview_time` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`did`),
  KEY `resume_uid_resume_id` (`resume_uid`,`resume_id`),
  KEY `company_uid_jobs_id` (`company_uid`,`jobs_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||company_interviewテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_company_label_resume`;
CREATE TABLE `hw_company_label_resume` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) NOT NULL,
  `personal_uid` int(10) NOT NULL,
  `resume_id` int(10) NOT NULL,
  `resume_state` tinyint(1) NOT NULL default '0',
  `resume_state_cn` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||company_label_resumeテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_company_profile`;
CREATE TABLE `hw_company_profile` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `tpl` varchar(60) NOT NULL,
  `companyname` varchar(60) NOT NULL,
  `nature` smallint(5) unsigned NOT NULL,
  `nature_cn` varchar(30) NOT NULL,
  `trade` smallint(5) unsigned NOT NULL,
  `trade_cn` varchar(30) NOT NULL,
  `district` smallint(5) unsigned NOT NULL,
  `sdistrict` smallint(5) unsigned NOT NULL,
  `district_cn` varchar(100) NOT NULL default '',
  `street` smallint(5) unsigned NOT NULL,
  `street_cn` varchar(50) NOT NULL,
  `scale` smallint(5) unsigned NOT NULL,
  `scale_cn` varchar(30) NOT NULL,
  `registered` varchar(150) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `address` varchar(250) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `telephone` varchar(130) NOT NULL,
  `email` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `license` varchar(120) NOT NULL,
  `certificate_img` varchar(80) NOT NULL,
  `logo` varchar(30) NOT NULL,
  `contents` text NOT NULL,
  `audit` tinyint(4) unsigned NOT NULL default '0',
  `map_open` tinyint(3) unsigned NOT NULL default '0',
  `map_x` varchar(50) NOT NULL,
  `map_y` varchar(50) NOT NULL,
  `map_zoom` tinyint(3) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `refreshtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL default '1',
  `user_status` tinyint(3) unsigned NOT NULL default '1',
  `yellowpages` tinyint(1) NOT NULL default '0',
  `contact_show` tinyint(1) unsigned NOT NULL default '0',
  `telephone_show` tinyint(1) unsigned NOT NULL default '0',
  `address_show` tinyint(1) unsigned NOT NULL default '0',
  `email_show` tinyint(1) unsigned NOT NULL default '0',
  `robot` tinyint(3) unsigned NOT NULL default '0',
  `comment` int(10) unsigned NOT NULL,
  `resume_processing` tinyint(3) NOT NULL default '100',
  `tag` varchar(60) NOT NULL,
  `wzp_tpl` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`),
  KEY `audit` (`audit`),
  KEY `companyname` (`companyname`),
  KEY `yellowpages_trade` (`yellowpages`,`trade`),
  KEY `addtime` (`addtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||company_profileテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_config`;
CREATE TABLE `hw_config` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||configテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_consultant`;
CREATE TABLE `hw_consultant` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `pic` text NULL,
  `qq` int(15) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||consultantテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_crons`;
CREATE TABLE `hw_crons` (
  `cronid` smallint(5) unsigned NOT NULL auto_increment,
  `available` tinyint(1) unsigned NOT NULL,
  `admin_set` tinyint(1) unsigned NOT NULL default '0',
  `name` varchar(60) NOT NULL,
  `filename` varchar(60) NOT NULL,
  `lastrun` int(10) unsigned NOT NULL,
  `nextrun` int(10) unsigned NOT NULL,
  `weekday` tinyint(1) NOT NULL,
  `day` tinyint(2) NOT NULL,
  `hour` tinyint(2) NOT NULL,
  `minute` varchar(60) NOT NULL,
  PRIMARY KEY  (`cronid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||cronsテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_explain`;
CREATE TABLE `hw_explain` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `type_id` smallint(5) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `tit_color` varchar(10) NULL default NULL,
  `tit_b` tinyint(1) NOT NULL default '0',
  `is_display` tinyint(3) unsigned NOT NULL default '1',
  `is_url` varchar(200) NOT NULL default '0',
  `seo_keywords` varchar(100) NULL default NULL,
  `seo_description` varchar(200) NULL default NULL,
  `click` int(11) NOT NULL default '1',
  `addtime` int(10) NOT NULL,
  `show_order` smallint(5) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||explainテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_explain_category`;
CREATE TABLE `hw_explain_category` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `categoryname` varchar(80) NOT NULL,
  `category_order` smallint(5) unsigned NOT NULL default '0',
  `admin_set` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||explain_categoryテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_feedback`;
CREATE TABLE `hw_feedback` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `infotype` tinyint(3) unsigned NOT NULL,
  `feedback` varchar(250) NOT NULL,
  `addtime` int(10) NOT NULL,
  `tel` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||feedbackテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_help`;
CREATE TABLE `hw_help` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `type_id` tinyint(3) unsigned NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `click` int(10) unsigned NOT NULL default '1',
  `addtime` int(10) unsigned NOT NULL,
  `order` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `type_id_order_id` (`type_id`,`order`,`id`),
  KEY `order_id` (`order`,`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||helpテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_help_category`;
CREATE TABLE `hw_help_category` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `parentid` smallint(5) unsigned NOT NULL,
  `categoryname` varchar(80) NOT NULL,
  `category_order` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||help_categoryテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_hotword`;
CREATE TABLE `hw_hotword` (
  `w_id` int(10) unsigned NOT NULL auto_increment,
  `w_word` varchar(120) NOT NULL,
  `w_hot` int(10) unsigned NOT NULL default '1',
  PRIMARY KEY  (`w_id`),
  KEY `w_word` (`w_word`),
  KEY `w_hot` (`w_hot`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||hotwordテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_hrtools`;
CREATE TABLE `hw_hrtools` (
  `h_id` int(10) unsigned NOT NULL auto_increment,
  `h_typeid` smallint(5) unsigned NOT NULL,
  `h_filename` varchar(200) NOT NULL,
  `h_fileurl` varchar(200) NOT NULL,
  `h_order` int(10) NOT NULL default '0',
  `h_color` varchar(7) NOT NULL,
  `h_strong` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`h_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||hrtoolsテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_hrtools_category`;
CREATE TABLE `hw_hrtools_category` (
  `c_id` smallint(5) unsigned NOT NULL auto_increment,
  `c_name` varchar(80) NOT NULL,
  `c_order` int(11) NOT NULL default '0',
  `c_adminset` tinyint(3) NOT NULL default '0',
  PRIMARY KEY  (`c_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||hrtools_categoryテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_jobs`;
CREATE TABLE `hw_jobs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `jobs_name` varchar(30) NOT NULL,
  `companyname` varchar(50) NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `company_addtime` int(10) unsigned NOT NULL,
  `company_audit` tinyint(1) unsigned NOT NULL default '0',
  `recommend` tinyint(1) unsigned NOT NULL default '0',
  `emergency` tinyint(1) unsigned NOT NULL default '0',
  `highlight` varchar(7) NOT NULL,
  `stick` tinyint(1) NOT NULL,
  `nature` tinyint(3) unsigned NOT NULL,
  `nature_cn` varchar(30) NOT NULL,
  `sex` tinyint(1) unsigned NOT NULL default '3',
  `sex_cn` varchar(3) NOT NULL,
  `age` varchar(10) NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  `topclass` smallint(5) unsigned NOT NULL,
  `category` smallint(5) unsigned NOT NULL,
  `subclass` smallint(5) unsigned NOT NULL,
  `category_cn` varchar(100) NOT NULL default '',
  `trade` smallint(5) unsigned NOT NULL,
  `trade_cn` varchar(30) NOT NULL,
  `scale` smallint(5) unsigned NOT NULL,
  `scale_cn` varchar(30) NOT NULL,
  `district` smallint(5) unsigned NOT NULL,
  `sdistrict` smallint(5) unsigned NOT NULL,
  `district_cn` varchar(100) NOT NULL,
  `street` int(10) unsigned NOT NULL,
  `street_cn` varchar(50) NOT NULL default '',
  `tag` varchar(50) NOT NULL,
  `tag_cn` varchar(100) NOT NULL,
  `education` smallint(5) unsigned NOT NULL,
  `education_cn` varchar(30) NOT NULL,
  `experience` smallint(5) unsigned NOT NULL,
  `experience_cn` varchar(30) NOT NULL,
  `wage` smallint(5) unsigned NOT NULL,
  `wage_cn` varchar(30) NOT NULL,
  `negotiable` tinyint(1) unsigned NOT NULL,
  `graduate` tinyint(1) unsigned NOT NULL default '0',
  `contents` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `deadline` int(10) unsigned NOT NULL,
  `refreshtime` int(10) unsigned NOT NULL,
  `setmeal_deadline` int(10) unsigned NOT NULL default '0',
  `setmeal_id` smallint(5) unsigned NOT NULL,
  `setmeal_name` varchar(60) NOT NULL,
  `audit` tinyint(1) unsigned NOT NULL default '1',
  `display` tinyint(1) unsigned NOT NULL default '1',
  `click` int(10) unsigned NOT NULL default '1',
  `key` text NOT NULL,
  `user_status` tinyint(1) unsigned NOT NULL default '1',
  `robot` tinyint(1) unsigned NOT NULL default '0',
  `tpl` varchar(60) NOT NULL,
  `map_x` double(9,6) NOT NULL,
  `map_y` double(9,6) NOT NULL,
  `add_mode` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`),
  KEY `refreshtime` (`refreshtime`),
  KEY `addtime` (`addtime`),
  KEY `company_id` (`company_id`),
  KEY `deadline` (`deadline`),
  KEY `audit` (`audit`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||jobsテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_jobs_contact`;
CREATE TABLE `hw_jobs_contact` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pid` int(10) unsigned NOT NULL,
  `contact` varchar(80) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `telephone` varchar(80) NOT NULL,
  `address` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `notify` tinyint(3) unsigned NOT NULL,
  `notify_mobile` tinyint(3) NOT NULL,
  `contact_show` tinyint(1) unsigned NOT NULL default '0',
  `telephone_show` tinyint(1) unsigned NOT NULL default '0',
  `address_show` tinyint(1) unsigned NOT NULL default '0',
  `email_show` tinyint(1) unsigned NOT NULL default '0',
  `qq_show` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||jobs_contactテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_jobs_search_hot`;
CREATE TABLE `hw_jobs_search_hot` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `recommend` tinyint(1) unsigned NOT NULL default '0',
  `emergency` tinyint(1) unsigned NOT NULL default '0',
  `nature` tinyint(3) unsigned NOT NULL,
  `sex` tinyint(1) unsigned NOT NULL default '3',
  `topclass` smallint(5) unsigned NOT NULL,
  `category` smallint(5) unsigned NOT NULL,
  `subclass` smallint(5) unsigned NOT NULL,
  `trade` smallint(5) unsigned NOT NULL,
  `district` smallint(5) unsigned NOT NULL,
  `sdistrict` smallint(5) unsigned NOT NULL,
  `street` smallint(5) unsigned NOT NULL,
  `education` smallint(5) unsigned NOT NULL,
  `experience` smallint(5) unsigned NOT NULL,
  `wage` smallint(5) unsigned NOT NULL,
  `scale` smallint(5) unsigned NOT NULL default '0',
  `graduate` tinyint(1) unsigned NOT NULL default '0',
  `refreshtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL default '1',
  `setmeal_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `click` (`click`),
  KEY `category_click` (`category`,`click`),
  KEY `sdistrict_click` (`sdistrict`,`click`),
  KEY `district_click` (`district`,`click`),
  KEY `trade_click` (`trade`,`click`),
  KEY `subclass_click` (`subclass`,`click`),
  KEY `uid` (`uid`),
  KEY `refreshtime` (`refreshtime`),
  KEY `street_click` (`street`,`click`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||jobs_search_hotテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_jobs_search_key`;
CREATE TABLE `hw_jobs_search_key` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `recommend` tinyint(1) unsigned NOT NULL default '0',
  `emergency` tinyint(1) unsigned NOT NULL default '0',
  `nature` tinyint(3) unsigned NOT NULL,
  `sex` tinyint(1) unsigned NOT NULL default '3',
  `topclass` smallint(5) unsigned NOT NULL,
  `category` smallint(5) unsigned NOT NULL,
  `subclass` smallint(5) unsigned NOT NULL,
  `trade` smallint(5) unsigned NOT NULL,
  `district` smallint(5) unsigned NOT NULL,
  `sdistrict` smallint(5) unsigned NOT NULL,
  `street` smallint(5) unsigned NOT NULL,
  `education` smallint(5) unsigned NOT NULL,
  `experience` smallint(5) unsigned NOT NULL,
  `wage` smallint(5) unsigned NOT NULL,
  `scale` smallint(5) unsigned NOT NULL default '0',
  `graduate` tinyint(1) unsigned NOT NULL default '0',
  `map_x` double(9,6) NOT NULL,
  `map_y` double(9,6) NOT NULL,
  `refreshtime` int(10) unsigned NOT NULL,
  `key` text NOT NULL,
  `likekey` varchar(220) NOT NULL,
  `setmeal_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `refreshtime` (`refreshtime`),
  KEY `uid` (`uid`),
  KEY `category` (`category`),
  KEY `subclass` (`subclass`),
  KEY `district` (`district`),
  KEY `sdistrict` (`sdistrict`),
  FULLTEXT KEY `key` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||jobs_search_keyテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_jobs_search_rtime`;
CREATE TABLE `hw_jobs_search_rtime` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `recommend` tinyint(1) unsigned NOT NULL default '0',
  `emergency` tinyint(1) unsigned NOT NULL default '0',
  `nature` tinyint(3) unsigned NOT NULL,
  `sex` tinyint(1) unsigned NOT NULL default '3',
  `topclass` smallint(5) unsigned NOT NULL,
  `category` smallint(5) unsigned NOT NULL,
  `subclass` smallint(5) unsigned NOT NULL,
  `trade` smallint(5) unsigned NOT NULL,
  `district` smallint(5) unsigned NOT NULL,
  `sdistrict` smallint(5) unsigned NOT NULL,
  `street` smallint(5) unsigned NOT NULL,
  `education` smallint(5) unsigned NOT NULL,
  `experience` smallint(5) unsigned NOT NULL,
  `wage` smallint(5) unsigned NOT NULL,
  `scale` smallint(5) unsigned NOT NULL default '0',
  `graduate` tinyint(1) unsigned NOT NULL default '0',
  `map_x` double(9,6) NOT NULL,
  `map_y` double(9,6) NOT NULL,
  `refreshtime` int(10) unsigned NOT NULL,
  `setmeal_id` smallint(5) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `refreshtime` (`refreshtime`),
  KEY `recommend_refreshtime` (`recommend`,`refreshtime`),
  KEY `emergency_refreshtime` (`emergency`,`refreshtime`),
  KEY `trade_refreshtime` (`trade`,`refreshtime`),
  KEY `sdistrict_refreshtime` (`sdistrict`,`refreshtime`),
  KEY `subclass_refreshtime` (`subclass`,`refreshtime`),
  KEY `district_refreshtime` (`district`,`refreshtime`),
  KEY `category_refreshtime` (`category`,`refreshtime`),
  KEY `uid` (`uid`),
  KEY `map_x_map_y` (`map_x`,`map_y`),
  KEY `street_refreshtime` (`street`,`refreshtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||jobs_search_rtimeテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_jobs_search_scale`;
CREATE TABLE `hw_jobs_search_scale` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `recommend` tinyint(1) unsigned NOT NULL default '0',
  `emergency` tinyint(1) unsigned NOT NULL default '0',
  `nature` tinyint(3) unsigned NOT NULL,
  `sex` tinyint(1) unsigned NOT NULL default '3',
  `topclass` smallint(5) unsigned NOT NULL,
  `category` smallint(5) unsigned NOT NULL,
  `subclass` smallint(5) unsigned NOT NULL,
  `trade` smallint(5) unsigned NOT NULL,
  `scale` smallint(5) unsigned NOT NULL,
  `graduate` tinyint(1) unsigned NOT NULL default '0',
  `district` smallint(5) unsigned NOT NULL,
  `sdistrict` smallint(5) unsigned NOT NULL,
  `street` smallint(5) unsigned NOT NULL,
  `education` smallint(5) unsigned NOT NULL,
  `experience` smallint(5) unsigned NOT NULL,
  `wage` smallint(5) unsigned NOT NULL,
  `refreshtime` int(10) unsigned NOT NULL,
  `setmeal_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`),
  KEY `category_scale_refreshtime` (`category`,`scale`,`refreshtime`),
  KEY `subclass_scale_refreshtime` (`subclass`,`scale`,`refreshtime`),
  KEY `trade_scale_refreshtime` (`trade`,`scale`,`refreshtime`),
  KEY `scale_refreshtime` (`scale`,`refreshtime`),
  KEY `district_scale_refreshtime` (`district`,`scale`,`refreshtime`),
  KEY `sdistrict_scale_refreshtime` (`sdistrict`,`scale`,`refreshtime`),
  KEY `street_scale_refreshtime` (`street`,`scale`,`refreshtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||jobs_search_scaleテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_jobs_search_stickrtime`;
CREATE TABLE `hw_jobs_search_stickrtime` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `recommend` tinyint(1) unsigned NOT NULL default '0',
  `emergency` tinyint(1) unsigned NOT NULL default '0',
  `stick` tinyint(1) NOT NULL default '0',
  `nature` tinyint(3) unsigned NOT NULL,
  `sex` tinyint(1) unsigned NOT NULL default '3',
  `topclass` smallint(5) unsigned NOT NULL,
  `category` smallint(5) unsigned NOT NULL,
  `subclass` smallint(5) unsigned NOT NULL,
  `trade` smallint(5) unsigned NOT NULL,
  `district` smallint(5) unsigned NOT NULL,
  `sdistrict` smallint(5) unsigned NOT NULL,
  `street` smallint(5) unsigned NOT NULL,
  `education` smallint(5) unsigned NOT NULL,
  `experience` smallint(5) unsigned NOT NULL,
  `wage` smallint(5) unsigned NOT NULL,
  `scale` smallint(5) unsigned NOT NULL default '0',
  `graduate` tinyint(1) unsigned NOT NULL default '0',
  `refreshtime` int(10) unsigned NOT NULL,
  `setmeal_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `stick_refreshtime` (`stick`,`refreshtime`),
  KEY `subclass_stick_refreshtime` (`subclass`,`stick`,`refreshtime`),
  KEY `trade_stick_refreshtime` (`trade`,`stick`,`refreshtime`),
  KEY `district_stick_refreshtime` (`district`,`stick`,`refreshtime`),
  KEY `sdistrict_stick_refreshtime` (`sdistrict`,`stick`,`refreshtime`),
  KEY `uid` (`uid`),
  KEY `category_stick_refreshtime` (`category`,`stick`,`refreshtime`),
  KEY `street_stick_refreshtime` (`street`,`stick`,`refreshtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||jobs_search_stickrtimeテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_jobs_search_wage`;
CREATE TABLE `hw_jobs_search_wage` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `recommend` tinyint(1) unsigned NOT NULL default '0',
  `emergency` tinyint(1) unsigned NOT NULL default '0',
  `nature` tinyint(3) unsigned NOT NULL,
  `sex` tinyint(1) unsigned NOT NULL default '3',
  `topclass` smallint(5) unsigned NOT NULL,
  `category` smallint(5) unsigned NOT NULL,
  `subclass` smallint(5) unsigned NOT NULL,
  `trade` smallint(5) unsigned NOT NULL,
  `district` smallint(5) unsigned NOT NULL,
  `sdistrict` smallint(5) unsigned NOT NULL,
  `street` smallint(5) unsigned NOT NULL,
  `education` smallint(5) unsigned NOT NULL,
  `experience` smallint(5) unsigned NOT NULL,
  `wage` smallint(5) unsigned NOT NULL,
  `scale` smallint(5) unsigned NOT NULL default '0',
  `graduate` tinyint(1) unsigned NOT NULL default '0',
  `refreshtime` int(10) unsigned NOT NULL,
  `setmeal_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `refreshtime_wage` (`refreshtime`,`wage`),
  KEY `uid` (`uid`),
  KEY `sdistrict_wage_refreshtime` (`sdistrict`,`wage`,`refreshtime`),
  KEY `district_wage_refreshtime` (`district`,`wage`,`refreshtime`),
  KEY `trade_wage_refreshtime` (`trade`,`wage`,`refreshtime`),
  KEY `subclass_wage_refreshtime` (`subclass`,`wage`,`refreshtime`),
  KEY `category_wage_refreshtime` (`category`,`wage`,`refreshtime`),
  KEY `street_wage_refreshtime` (`street`,`wage`,`refreshtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||jobs_search_wageテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_jobs_tag`;
CREATE TABLE `hw_jobs_tag` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `tag` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `pid` (`pid`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||jobs_tagテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_jobs_tmp`;
CREATE TABLE `hw_jobs_tmp` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `jobs_name` varchar(30) NOT NULL,
  `companyname` varchar(50) NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `company_addtime` int(10) unsigned NOT NULL,
  `company_audit` tinyint(1) unsigned NOT NULL default '0',
  `recommend` tinyint(1) unsigned NOT NULL default '0',
  `emergency` tinyint(1) unsigned NOT NULL default '0',
  `highlight` varchar(7) NOT NULL,
  `stick` tinyint(1) NOT NULL,
  `nature` tinyint(3) unsigned NOT NULL,
  `nature_cn` varchar(30) NOT NULL,
  `sex` tinyint(1) unsigned NOT NULL default '3',
  `sex_cn` varchar(3) NOT NULL,
  `age` varchar(10) NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  `topclass` smallint(5) unsigned NOT NULL,
  `category` smallint(5) unsigned NOT NULL,
  `subclass` smallint(5) unsigned NOT NULL,
  `category_cn` varchar(100) NOT NULL default '',
  `trade` smallint(5) unsigned NOT NULL,
  `trade_cn` varchar(30) NOT NULL,
  `scale` smallint(5) unsigned NOT NULL,
  `scale_cn` varchar(30) NOT NULL,
  `district` smallint(5) unsigned NOT NULL,
  `sdistrict` smallint(5) unsigned NOT NULL,
  `district_cn` varchar(100) NOT NULL,
  `street` int(10) unsigned NOT NULL,
  `street_cn` varchar(50) NOT NULL default '',
  `tag` varchar(50) NOT NULL,
  `tag_cn` varchar(100) NOT NULL,
  `education` smallint(5) unsigned NOT NULL,
  `education_cn` varchar(30) NOT NULL,
  `experience` smallint(5) unsigned NOT NULL,
  `experience_cn` varchar(30) NOT NULL,
  `wage` smallint(5) unsigned NOT NULL,
  `wage_cn` varchar(30) NOT NULL,
  `negotiable` tinyint(1) unsigned NOT NULL,
  `graduate` tinyint(1) unsigned NOT NULL default '0',
  `contents` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `deadline` int(10) unsigned NOT NULL,
  `refreshtime` int(10) unsigned NOT NULL,
  `setmeal_deadline` int(10) unsigned NOT NULL default '0',
  `setmeal_id` smallint(5) unsigned NOT NULL,
  `setmeal_name` varchar(60) NOT NULL,
  `audit` tinyint(1) unsigned NOT NULL default '1',
  `display` tinyint(1) unsigned NOT NULL default '1',
  `click` int(10) unsigned NOT NULL default '1',
  `key` text NOT NULL,
  `user_status` tinyint(1) unsigned NOT NULL default '1',
  `robot` tinyint(1) unsigned NOT NULL default '0',
  `tpl` varchar(60) NOT NULL,
  `map_x` double(9,6) NOT NULL,
  `map_y` double(9,6) NOT NULL,
  `add_mode` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`),
  KEY `refreshtime` (`refreshtime`),
  KEY `addtime` (`addtime`),
  KEY `company_id` (`company_id`),
  KEY `deadline` (`deadline`),
  KEY `audit` (`audit`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||jobs_tmpテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_link`;
CREATE TABLE `hw_link` (
  `link_id` int(10) unsigned NOT NULL auto_increment,
  `type_id` tinyint(3) unsigned NOT NULL,
  `display` tinyint(1) unsigned NOT NULL default '1',
  `alias` varchar(30) NOT NULL,
  `link_name` varchar(255) NOT NULL,
  `link_url` varchar(255) NOT NULL,
  `link_logo` varchar(255) NOT NULL,
  `show_order` smallint(5) unsigned NOT NULL default '50',
  `Notes` varchar(255) NULL default NULL,
  `app_notes` varchar(300) NOT NULL,
  PRIMARY KEY  (`link_id`),
  KEY `show_order` (`show_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||linkテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_link_category`;
CREATE TABLE `hw_link_category` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `categoryname` varchar(80) NOT NULL,
  `c_sys` tinyint(1) unsigned NOT NULL default '0',
  `c_alias` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||link_categoryテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_locoyspider`;
CREATE TABLE `hw_locoyspider` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||locoyspiderテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_mailconfig`;
CREATE TABLE `hw_mailconfig` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||mailconfigテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_mailqueue`;
CREATE TABLE `hw_mailqueue` (
  `m_id` int(10) unsigned NOT NULL auto_increment,
  `m_type` tinyint(3) unsigned NOT NULL default '0',
  `m_addtime` int(10) unsigned NOT NULL,
  `m_sendtime` int(10) unsigned NOT NULL default '0',
  `m_uid` int(10) unsigned NOT NULL default '0',
  `m_mail` varchar(80) NOT NULL,
  `m_subject` varchar(200) NOT NULL,
  `m_body` text NOT NULL,
  PRIMARY KEY  (`m_id`),
  KEY `m_uid` (`m_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||mailqueueテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_mail_templates`;
CREATE TABLE `hw_mail_templates` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||mail_templatesテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_members`;
CREATE TABLE `hw_members` (
  `uid` int(10) unsigned NOT NULL auto_increment,
  `utype` tinyint(1) unsigned NOT NULL default '1',
  `username` varchar(60) NOT NULL default '',
  `email` varchar(80) NOT NULL,
  `email_audit` tinyint(1) unsigned NOT NULL default '0',
  `mobile` varchar(11) NOT NULL,
  `mobile_audit` tinyint(1) unsigned NOT NULL default '0',
  `password` varchar(100) NOT NULL default '',
  `pwd_hash` varchar(30) NOT NULL,
  `reg_time` int(10) unsigned NOT NULL,
  `reg_ip` varchar(15) NOT NULL,
  `last_login_time` int(10) unsigned NOT NULL,
  `last_login_ip` varchar(15) NOT NULL,
  `qq_openid` varchar(50) NOT NULL,
  `sina_access_token` varchar(50) NOT NULL,
  `taobao_access_token` varchar(50) NOT NULL,
  `qq_nick` varchar(100) NOT NULL,
  `sina_nick` varchar(100) NOT NULL,
  `taobao_nick` varchar(100) NOT NULL,
  `weixin_nick` varchar(100) NOT NULL,
  `qq_binding_time` int(10) NOT NULL,
  `sina_binding_time` int(10) NOT NULL,
  `taobao_binding_time` int(10) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL default '1',
  `avatars` varchar(32) NOT NULL,
  `robot` tinyint(3) unsigned NOT NULL default '0',
  `consultant` smallint(5) unsigned NOT NULL,
  `weixin_openid` varchar(50) NULL default NULL,
  `bindingtime` int(10) unsigned NOT NULL,
  `remind_email_time` int(10) unsigned NULL default NULL,
  `imei` varchar(50) NOT NULL default '',
  `reg_type` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`uid`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`),
  KEY `qq_openid` (`qq_openid`),
  KEY `sina_access_token` (`sina_access_token`),
  KEY `taobao_access_token` (`taobao_access_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||membersテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_members_charge_log`;
CREATE TABLE `hw_members_charge_log` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `log_uid` int(10) NOT NULL,
  `log_username` varchar(60) NOT NULL,
  `log_addtime` int(10) NOT NULL,
  `log_value` varchar(255) NOT NULL,
  `log_amount` decimal(10,2) NOT NULL,
  `log_ismoney` tinyint(1) unsigned NOT NULL default '1',
  `log_type` tinyint(1) unsigned NOT NULL,
  `log_mode` tinyint(1) unsigned NOT NULL default '1',
  `log_utype` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`log_id`),
  KEY `log_username` (`log_username`),
  KEY `log_addtime` (`log_addtime`),
  KEY `log_type_log_addtime` (`log_type`,`log_addtime`),
  KEY `log_uid_log_addtime` (`log_uid`,`log_addtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||members_charge_logテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_members_handsel`;
CREATE TABLE `hw_members_handsel` (
  `id` int(10) NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `htype` varchar(60) NOT NULL,
  `addtime` int(10) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `uid_htype_addtime` (`uid`,`htype`,`addtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||members_handselテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_members_info`;
CREATE TABLE `hw_members_info` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `realname` varchar(30) NOT NULL,
  `sex` smallint(1) unsigned NOT NULL,
  `sex_cn` varchar(10) NOT NULL,
  `birthday` varchar(30) NOT NULL,
  `residence` varchar(30) NOT NULL default '',
  `education` smallint(5) unsigned NOT NULL,
  `education_cn` varchar(30) NOT NULL,
  `major` smallint(5) NOT NULL,
  `major_cn` varchar(50) NOT NULL,
  `experience` smallint(5) unsigned NOT NULL,
  `experience_cn` varchar(30) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL default '',
  `height` varchar(5) NOT NULL default '',
  `householdaddress` varchar(30) NOT NULL default '',
  `marriage` smallint(5) unsigned NOT NULL,
  `marriage_cn` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||members_infoテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_members_log`;
CREATE TABLE `hw_members_log` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `log_uid` int(10) NOT NULL,
  `log_username` varchar(60) NOT NULL,
  `log_addtime` int(10) NOT NULL,
  `log_value` varchar(255) NOT NULL,
  `log_ip` varchar(20) NOT NULL,
  `log_address` varchar(50) NOT NULL,
  `log_utype` tinyint(1) unsigned NOT NULL default '1',
  `log_type` smallint(5) unsigned NOT NULL default '1',
  `log_mode` tinyint(1) unsigned NOT NULL,
  `log_op_type` smallint(5) unsigned NOT NULL,
  `log_op_type_cn` varchar(20) NOT NULL,
  `log_op_used` varchar(20) NOT NULL,
  `log_op_leave` varchar(20) NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `log_username` (`log_username`),
  KEY `log_addtime` (`log_addtime`),
  KEY `log_type_log_addtime` (`log_type`,`log_addtime`),
  KEY `log_utype_log_addtime` (`log_utype`,`log_addtime`),
  KEY `log_uid_log_addtime` (`log_uid`,`log_addtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||members_logテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_members_points`;
CREATE TABLE `hw_members_points` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `points` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||members_pointsテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_members_points_rule`;
CREATE TABLE `hw_members_points_rule` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `utype` tinyint(1) NOT NULL default '1',
  `title` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `operation` tinyint(1) NOT NULL default '2',
  `value` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||members_points_ruleテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_members_setmeal`;
CREATE TABLE `hw_members_setmeal` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `effective` tinyint(3) unsigned NOT NULL default '0',
  `uid` int(10) unsigned NOT NULL,
  `setmeal_id` int(10) unsigned NOT NULL,
  `setmeal_name` varchar(200) NOT NULL,
  `days` int(10) unsigned NOT NULL,
  `expense` int(10) unsigned NOT NULL,
  `jobs_ordinary` int(10) unsigned NOT NULL,
  `download_resume_ordinary` int(10) unsigned NOT NULL,
  `download_resume_senior` int(10) unsigned NOT NULL,
  `interview_ordinary` int(10) unsigned NOT NULL,
  `interview_senior` int(10) unsigned NOT NULL,
  `talent_pool` int(10) unsigned NOT NULL,
  `recommend_num` int(10) unsigned NOT NULL,
  `recommend_days` int(10) unsigned NOT NULL,
  `stick_num` int(10) unsigned NOT NULL,
  `stick_days` int(10) unsigned NOT NULL,
  `emergency_num` int(10) unsigned NOT NULL,
  `emergency_days` int(10) unsigned NOT NULL,
  `highlight_num` int(10) unsigned NOT NULL,
  `highlight_days` int(10) unsigned NOT NULL,
  `jobsfair_num` int(10) unsigned NOT NULL,
  `change_templates` tinyint(1) unsigned NOT NULL default '0',
  `map_open` tinyint(1) unsigned NOT NULL default '0',
  `added` varchar(250) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `refresh_jobs_space` int(10) unsigned NOT NULL default '0',
  `refresh_jobs_time` int(10) unsigned NOT NULL default '0',
  `set_sms` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `effective_setmeal_id` (`effective`,`setmeal_id`),
  KEY `effective_endtime` (`effective`,`endtime`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||members_setmealテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_navigation`;
CREATE TABLE `hw_navigation` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `alias` varchar(100) NOT NULL,
  `urltype` tinyint(3) unsigned NOT NULL default '0',
  `display` tinyint(3) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL,
  `color` varchar(30) NOT NULL,
  `pagealias` varchar(100) NOT NULL,
  `list_id` varchar(30) NOT NULL,
  `tag` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `target` varchar(100) NOT NULL,
  `navigationorder` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||navigationテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_navigation_category`;
CREATE TABLE `hw_navigation_category` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `alias` varchar(100) NOT NULL,
  `categoryname` varchar(30) NOT NULL,
  `admin_set` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||navigation_categoryテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_notice`;
CREATE TABLE `hw_notice` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `type_id` smallint(5) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `tit_color` varchar(10) NULL default NULL,
  `tit_b` tinyint(1) NOT NULL default '0',
  `is_display` tinyint(3) unsigned NOT NULL default '1',
  `is_url` varchar(200) NOT NULL default '0',
  `seo_keywords` varchar(100) NULL default NULL,
  `seo_description` varchar(200) NULL default NULL,
  `click` int(11) NOT NULL default '1',
  `addtime` int(10) NOT NULL,
  `sort` smallint(5) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `type_id_sort_id` (`type_id`,`sort`,`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||noticeテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_notice_category`;
CREATE TABLE `hw_notice_category` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `categoryname` varchar(80) NOT NULL,
  `sort` smallint(5) unsigned NOT NULL default '0',
  `admin_set` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||notice_categoryテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_order`;
CREATE TABLE `hw_order` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `utype` tinyint(2) unsigned NOT NULL default '1',
  `pay_type` int(1) unsigned NOT NULL,
  `is_paid` tinyint(3) unsigned NOT NULL default '1',
  `oid` varchar(200) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_name` varchar(20) NOT NULL,
  `points` int(10) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `payment_time` int(10) unsigned NOT NULL,
  `description` varchar(150) NOT NULL,
  `setmeal` int(10) unsigned NOT NULL,
  `notes` varchar(150) NOT NULL,
  `week` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`),
  KEY `addtime` (`addtime`),
  KEY `payment_name` (`payment_name`),
  KEY `oid` (`oid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||orderテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_page`;
CREATE TABLE `hw_page` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `systemclass` tinyint(3) unsigned NOT NULL default '0',
  `pagetpye` tinyint(3) unsigned NOT NULL default '1',
  `alias` varchar(60) NOT NULL,
  `pname` varchar(12) NOT NULL,
  `file` varchar(100) NOT NULL,
  `tpl` varchar(100) NOT NULL,
  `rewrite` varchar(200) NOT NULL,
  `url` tinyint(3) unsigned NOT NULL default '0',
  `caching` int(10) unsigned NOT NULL default '0',
  `tag` varchar(60) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `keywords` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||pageテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_payment`;
CREATE TABLE `hw_payment` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `listorder` int(10) unsigned NOT NULL default '50',
  `typename` varchar(15) NOT NULL,
  `byname` varchar(50) NOT NULL,
  `p_introduction` varchar(100) NOT NULL,
  `notes` text NULL,
  `partnerid` varchar(80) NULL default NULL,
  `ytauthkey` varchar(100) NULL default NULL,
  `fee` varchar(6) NOT NULL default '0',
  `parameter1` varchar(50) NULL default NULL,
  `parameter2` varchar(50) NULL default NULL,
  `parameter3` varchar(50) NULL default NULL,
  `p_install` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||paymentテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_personal_favorites`;
CREATE TABLE `hw_personal_favorites` (
  `did` int(10) unsigned NOT NULL auto_increment,
  `personal_uid` int(10) unsigned NOT NULL,
  `jobs_id` int(10) unsigned NOT NULL,
  `jobs_name` varchar(100) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`did`),
  KEY `personal_uid` (`personal_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||personal_favoritesテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_personal_jobs_apply`;
CREATE TABLE `hw_personal_jobs_apply` (
  `did` int(10) unsigned NOT NULL auto_increment,
  `resume_id` int(10) unsigned NOT NULL,
  `resume_name` varchar(60) NOT NULL,
  `personal_uid` int(10) unsigned NOT NULL,
  `jobs_id` int(10) unsigned NOT NULL,
  `jobs_name` varchar(60) NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `company_name` varchar(60) NOT NULL,
  `company_uid` int(10) unsigned NOT NULL,
  `apply_addtime` int(10) unsigned NOT NULL,
  `personal_look` tinyint(3) unsigned NOT NULL default '1',
  `notes` varchar(200) NOT NULL,
  `is_reply` tinyint(1) unsigned NOT NULL default '0',
  `is_apply` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`did`),
  KEY `personal_uid_resume_id` (`personal_uid`,`resume_id`),
  KEY `company_uid_jobs_id` (`company_uid`,`jobs_id`),
  KEY `company_uid_personal_look` (`company_uid`,`personal_look`),
  KEY `personal_uid_apply_addtime` (`personal_uid`,`apply_addtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||personal_jobs_applyテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_plug`;
CREATE TABLE `hw_plug` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `typename` varchar(15) NOT NULL,
  `plug_name` varchar(50) NOT NULL,
  `p_install` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||plugテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_pms`;
CREATE TABLE `hw_pms` (
  `pmid` int(10) unsigned NOT NULL auto_increment,
  `msgtype` tinyint(1) unsigned NOT NULL default '1',
  `msgfrom` varchar(30) NOT NULL,
  `msgfromuid` int(10) unsigned NOT NULL,
  `msgtouid` int(10) unsigned NOT NULL,
  `msgtoname` varchar(30) NOT NULL,
  `message` varchar(250) NOT NULL,
  `dateline` int(10) NOT NULL,
  `new` tinyint(1) unsigned NOT NULL default '1',
  `replytime` int(10) NOT NULL,
  `replyuid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`pmid`),
  KEY `msgfromuid` (`msgfromuid`),
  KEY `msgtouid` (`msgtouid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||pmsテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_pms_sys`;
CREATE TABLE `hw_pms_sys` (
  `spmid` int(10) unsigned NOT NULL auto_increment,
  `spms_usertype` tinyint(1) unsigned NOT NULL default '0',
  `spms_type` tinyint(1) NOT NULL default '1',
  `message` varchar(250) NOT NULL,
  `dateline` int(10) NOT NULL,
  PRIMARY KEY  (`spmid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||pms_sysテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_pms_sys_log`;
CREATE TABLE `hw_pms_sys_log` (
  `lid` int(10) unsigned NOT NULL auto_increment,
  `loguid` int(10) unsigned NOT NULL,
  `pmid` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`lid`),
  KEY `loguid` (`loguid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||pms_sys_logテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_promotion`;
CREATE TABLE `hw_promotion` (
  `cp_id` int(10) unsigned NOT NULL auto_increment,
  `cp_available` tinyint(1) NOT NULL default '1',
  `cp_promotionid` int(10) unsigned NOT NULL,
  `cp_uid` int(10) unsigned NOT NULL,
  `cp_jobid` int(10) unsigned NOT NULL,
  `cp_days` int(10) unsigned NOT NULL,
  `cp_starttime` int(10) unsigned NOT NULL,
  `cp_endtime` int(10) unsigned NOT NULL,
  `cp_val` varchar(160) NOT NULL,
  `cp_hour` tinyint(2) unsigned NOT NULL,
  `cp_hour_cn` varchar(30) NOT NULL,
  PRIMARY KEY  (`cp_id`),
  KEY `cp_uid` (`cp_uid`),
  KEY `cp_endtime` (`cp_endtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||promotionテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_promotion_category`;
CREATE TABLE `hw_promotion_category` (
  `cat_id` int(10) unsigned NOT NULL auto_increment,
  `cat_available` tinyint(1) NOT NULL default '1',
  `cat_name` varchar(30) NOT NULL,
  `cat_type` tinyint(3) unsigned NOT NULL,
  `cat_minday` smallint(5) unsigned NOT NULL default '0',
  `cat_maxday` int(10) unsigned NOT NULL default '0',
  `cat_points` int(10) NOT NULL default '0',
  `cat_notes` text NOT NULL,
  `cat_order` int(10) NOT NULL default '0',
  PRIMARY KEY  (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||promotion_categoryテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_refresh_log`;
CREATE TABLE `hw_refresh_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `mode` tinyint(1) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||refresh_logテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_report`;
CREATE TABLE `hw_report` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `jobs_id` int(10) unsigned NOT NULL,
  `jobs_name` varchar(150) NOT NULL,
  `jobs_addtime` int(10) unsigned NOT NULL,
  `report_type` int(10) NOT NULL,
  `audit` int(10) NOT NULL default '1',
  `content` varchar(250) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||reportテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_report_resume`;
CREATE TABLE `hw_report_resume` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `resume_id` int(10) unsigned NOT NULL,
  `title` varchar(150) NOT NULL default '',
  `resume_addtime` int(10) unsigned NOT NULL,
  `report_type` int(10) NOT NULL,
  `audit` int(10) NOT NULL default '1',
  `content` varchar(250) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||report_resumeテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_resume`;
CREATE TABLE `hw_resume` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `display` tinyint(3) unsigned NOT NULL default '1',
  `display_name` tinyint(3) unsigned NOT NULL default '1',
  `audit` tinyint(3) unsigned NOT NULL default '1',
  `title` varchar(80) NOT NULL,
  `fullname` varchar(15) NOT NULL,
  `sex` tinyint(3) unsigned NOT NULL,
  `sex_cn` varchar(3) NOT NULL,
  `nature` tinyint(3) unsigned NOT NULL,
  `nature_cn` varchar(30) NOT NULL,
  `trade` varchar(60) NOT NULL,
  `trade_cn` varchar(100) NOT NULL,
  `birthdate` smallint(4) unsigned NOT NULL,
  `residence` varchar(30) NOT NULL default '',
  `height` tinyint(3) unsigned NOT NULL,
  `marriage` tinyint(3) unsigned NOT NULL,
  `marriage_cn` varchar(5) NOT NULL,
  `experience` smallint(5) NOT NULL,
  `experience_cn` varchar(30) NOT NULL,
  `district_cn` varchar(100) NOT NULL default '',
  `wage` tinyint(5) unsigned NOT NULL,
  `wage_cn` varchar(30) NOT NULL,
  `householdaddress` varchar(30) NOT NULL default '',
  `education` smallint(5) unsigned NOT NULL,
  `education_cn` varchar(30) NOT NULL,
  `major` smallint(5) NOT NULL,
  `major_cn` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `tag_cn` varchar(100) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `email_notify` tinyint(1) unsigned NOT NULL default '1',
  `intention_jobs` varchar(100) NOT NULL,
  `specialty` varchar(200) NOT NULL,
  `photo` tinyint(1) unsigned NOT NULL default '0',
  `photo_img` varchar(80) NOT NULL,
  `photo_audit` tinyint(1) unsigned NOT NULL default '1',
  `photo_display` tinyint(1) unsigned NOT NULL default '1',
  `addtime` int(10) unsigned NOT NULL,
  `refreshtime` int(10) unsigned NOT NULL,
  `talent` tinyint(1) unsigned NOT NULL default '1',
  `level` tinyint(1) unsigned NOT NULL,
  `complete_percent` tinyint(3) unsigned NOT NULL default '0',
  `current` tinyint(5) unsigned NOT NULL,
  `current_cn` varchar(50) NOT NULL default '',
  `word_resume` varchar(255) NOT NULL,
  `key` text NOT NULL,
  `click` int(10) unsigned NOT NULL default '1',
  `tpl` varchar(60) NOT NULL,
  `resume_from_pc` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`),
  KEY `refreshtime` (`refreshtime`),
  KEY `addtime` (`addtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||resumeテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_resume_credent`;
CREATE TABLE `hw_resume_credent` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` int(4) NOT NULL,
  `month` int(2) NOT NULL,
  `images` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||resume_credentテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_resume_district`;
CREATE TABLE `hw_resume_district` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `district` int(10) unsigned NOT NULL,
  `sdistrict` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `pid` (`pid`),
  KEY `district_sdistrict` (`district`,`sdistrict`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||resume_districtテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_resume_education`;
CREATE TABLE `hw_resume_education` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `startyear` smallint(4) unsigned NOT NULL,
  `startmonth` smallint(2) unsigned NOT NULL,
  `endyear` smallint(4) unsigned NOT NULL,
  `endmonth` smallint(2) unsigned NOT NULL,
  `school` varchar(50) NOT NULL,
  `speciality` varchar(50) NOT NULL,
  `education` smallint(5) unsigned NOT NULL,
  `education_cn` varchar(30) NOT NULL default '',
  `todate` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||resume_educationテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_resume_img`;
CREATE TABLE `hw_resume_img` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `resume_id` int(10) unsigned NOT NULL,
  `img` varchar(50) NOT NULL default '',
  `title` varchar(20) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`),
  KEY `resume_id` (`resume_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||resume_imgテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_resume_jobs`;
CREATE TABLE `hw_resume_jobs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `topclass` int(10) unsigned NOT NULL,
  `category` int(10) unsigned NOT NULL,
  `subclass` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `pid` (`pid`),
  KEY `category_subclass` (`category`,`subclass`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||resume_jobsテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_resume_language`;
CREATE TABLE `hw_resume_language` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `language` smallint(5) NOT NULL,
  `language_cn` varchar(50) NOT NULL,
  `level` smallint(5) unsigned NOT NULL,
  `level_cn` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||resume_languageテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_resume_search_key`;
CREATE TABLE `hw_resume_search_key` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `display` tinyint(1) NOT NULL default '1',
  `audit` tinyint(1) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL default '0',
  `sex` tinyint(3) unsigned NOT NULL default '1',
  `nature` tinyint(3) unsigned NOT NULL default '0',
  `marriage` tinyint(3) unsigned NOT NULL default '0',
  `experience` smallint(5) NOT NULL default '0',
  `district` smallint(5) unsigned NOT NULL default '0',
  `sdistrict` smallint(5) unsigned NOT NULL default '0',
  `wage` tinyint(5) unsigned NOT NULL default '0',
  `education` smallint(5) unsigned NOT NULL default '0',
  `major` smallint(5) NOT NULL,
  `current` smallint(5) unsigned NOT NULL default '0',
  `photo` tinyint(1) unsigned NOT NULL default '0',
  `refreshtime` int(10) unsigned NOT NULL,
  `talent` tinyint(1) unsigned NOT NULL default '1',
  `key` text NOT NULL,
  `likekey` varchar(220) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`),
  FULLTEXT KEY `key` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||resume_search_keyテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_resume_search_rtime`;
CREATE TABLE `hw_resume_search_rtime` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `display` tinyint(1) NOT NULL default '1',
  `audit` tinyint(1) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL default '0',
  `sex` tinyint(3) unsigned NOT NULL default '1',
  `nature` tinyint(3) unsigned NOT NULL default '0',
  `marriage` tinyint(3) unsigned NOT NULL default '0',
  `experience` smallint(5) NOT NULL default '0',
  `district` smallint(5) unsigned NOT NULL default '0',
  `sdistrict` smallint(5) unsigned NOT NULL default '0',
  `wage` smallint(5) unsigned NOT NULL default '0',
  `education` smallint(5) unsigned NOT NULL default '0',
  `major` smallint(5) NOT NULL,
  `current` smallint(5) unsigned NOT NULL default '0',
  `photo` tinyint(1) unsigned NOT NULL default '0',
  `refreshtime` int(10) unsigned NOT NULL,
  `talent` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`),
  KEY `refreshtime` (`refreshtime`),
  KEY `district_refreshtime` (`district`,`refreshtime`),
  KEY `photo_refreshtime` (`photo`,`refreshtime`),
  KEY `sdistrict_refreshtime` (`sdistrict`,`refreshtime`),
  KEY `talent_refreshtime` (`talent`,`refreshtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||resume_search_rtimeテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_resume_tag`;
CREATE TABLE `hw_resume_tag` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `tag` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `pid` (`pid`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||resume_tagテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_resume_trade`;
CREATE TABLE `hw_resume_trade` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `trade` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `pid` (`pid`),
  KEY `trade` (`trade`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||resume_tradeテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_resume_training`;
CREATE TABLE `hw_resume_training` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `startyear` smallint(4) unsigned NOT NULL,
  `startmonth` smallint(2) unsigned NOT NULL,
  `endyear` smallint(4) unsigned NOT NULL,
  `endmonth` smallint(2) unsigned NOT NULL,
  `agency` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `todate` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||resume_trainingテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_resume_work`;
CREATE TABLE `hw_resume_work` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `startyear` smallint(4) unsigned NOT NULL,
  `startmonth` smallint(2) unsigned NOT NULL,
  `endyear` smallint(4) unsigned NOT NULL,
  `endmonth` smallint(2) unsigned NOT NULL,
  `companyname` varchar(50) NOT NULL,
  `jobs` varchar(30) NOT NULL,
  `achievements` varchar(255) NOT NULL,
  `todate` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||resume_workテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_setmeal`;
CREATE TABLE `hw_setmeal` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `display` tinyint(3) unsigned NOT NULL default '1',
  `apply` tinyint(3) unsigned NOT NULL default '1',
  `setmeal_name` varchar(200) NOT NULL,
  `days` int(10) unsigned NOT NULL default '0',
  `original_price` int(10) unsigned NOT NULL,
  `expense` int(10) unsigned NOT NULL,
  `jobs_ordinary` int(10) unsigned NOT NULL default '0',
  `download_resume_ordinary` int(10) unsigned NOT NULL default '0',
  `download_resume_senior` int(10) unsigned NOT NULL default '0',
  `interview_ordinary` int(10) unsigned NOT NULL default '0',
  `interview_senior` int(10) unsigned NOT NULL default '0',
  `talent_pool` int(10) unsigned NOT NULL default '0',
  `recommend_num` int(10) unsigned NOT NULL,
  `recommend_days` int(10) unsigned NOT NULL,
  `stick_num` int(10) unsigned NOT NULL,
  `stick_days` int(10) unsigned NOT NULL,
  `emergency_num` int(10) unsigned NOT NULL,
  `emergency_days` int(10) unsigned NOT NULL,
  `highlight_num` int(10) unsigned NOT NULL,
  `highlight_days` int(10) unsigned NOT NULL,
  `jobsfair_num` int(10) unsigned NOT NULL,
  `change_templates` tinyint(1) unsigned NOT NULL default '0',
  `map_open` tinyint(1) unsigned NOT NULL default '0',
  `added` varchar(255) NOT NULL,
  `show_order` int(10) unsigned NOT NULL default '0',
  `refresh_jobs_space` int(10) unsigned NOT NULL default '0',
  `refresh_jobs_time` int(10) unsigned NOT NULL default '0',
  `set_sms` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||setmealテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_simple`;
CREATE TABLE `hw_simple` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `audit` tinyint(1) unsigned NOT NULL default '0',
  `pwd` varchar(60) NOT NULL,
  `pwd_hash` varchar(30) NOT NULL,
  `jobname` varchar(100) NOT NULL,
  `amount` smallint(3) unsigned NOT NULL default '0',
  `comname` varchar(100) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `district` smallint(5) unsigned NOT NULL,
  `district_cn` varchar(20) NOT NULL,
  `sdistrict` smallint(5) unsigned NOT NULL,
  `sdistrict_cn` varchar(20) NOT NULL,
  `detailed` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `deadline` int(10) unsigned NOT NULL,
  `refreshtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL default '1',
  `addip` varchar(80) NOT NULL,
  `key` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `tel` (`tel`),
  KEY `audit_refreshtime` (`audit`,`refreshtime`),
  KEY `audit_click` (`audit`,`click`),
  KEY `deadline` (`deadline`),
  FULLTEXT KEY `key` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||simpleテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_smsqueue`;
CREATE TABLE `hw_smsqueue` (
  `s_id` int(10) unsigned NOT NULL auto_increment,
  `s_type` tinyint(3) unsigned NOT NULL default '0',
  `s_addtime` int(10) unsigned NOT NULL,
  `s_sendtime` int(10) unsigned NOT NULL default '0',
  `s_uid` int(10) unsigned NOT NULL default '0',
  `s_mobile` text NULL,
  `s_body` varchar(100) NOT NULL,
  PRIMARY KEY  (`s_id`),
  KEY `s_uid` (`s_uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||smsqueueテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_sms_config`;
CREATE TABLE `hw_sms_config` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `value` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||sms_configテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_sms_templates`;
CREATE TABLE `hw_sms_templates` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||sms_templatesテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_syslog`;
CREATE TABLE `hw_syslog` (
  `l_id` int(10) unsigned NOT NULL auto_increment,
  `l_type` tinyint(1) unsigned NOT NULL,
  `l_type_name` varchar(30) NOT NULL,
  `l_time` int(10) unsigned NOT NULL,
  `l_ip` varchar(20) NOT NULL,
  `l_address` varchar(50) NOT NULL,
  `l_page` text NOT NULL,
  `l_str` text NOT NULL,
  PRIMARY KEY  (`l_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||syslogテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_sys_email_log`;
CREATE TABLE `hw_sys_email_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `send_from` varchar(50) NOT NULL,
  `send_to` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `body` varchar(255) NOT NULL,
  `state` smallint(3) NOT NULL,
  `sendtime` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||sys_email_logテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_text`;
CREATE TABLE `hw_text` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||textテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_tpl`;
CREATE TABLE `hw_tpl` (
  `tpl_id` int(10) unsigned NOT NULL auto_increment,
  `tpl_type` tinyint(1) NOT NULL,
  `tpl_name` varchar(80) NOT NULL,
  `tpl_display` tinyint(1) NOT NULL default '1',
  `tpl_dir` varchar(80) NOT NULL,
  `tpl_val` int(10) NOT NULL default '0',
  PRIMARY KEY  (`tpl_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||tplテーブル作成成功！||-_-||#

DROP TABLE IF EXISTS `hw_weixin_menu`;
CREATE TABLE `hw_weixin_menu` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `parentid` int(10) unsigned NOT NULL default '0',
  `title` varchar(30) NOT NULL,
  `key` varchar(30) NOT NULL,
  `type` varchar(10) NOT NULL,
  `url` varchar(255) NOT NULL,
  `menu_order` smallint(5) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#||-_-||weixin_menuテーブル作成成功！||-_-||#

