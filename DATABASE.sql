-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySql-8.2
-- Время создания: Окт 23 2024 г., 14:55
-- Версия сервера: 8.2.0
-- Версия PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sitemanager`
--
CREATE DATABASE IF NOT EXISTS `sitemanager` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `sitemanager`;

-- --------------------------------------------------------

--
-- Структура таблицы `b_admin_notify`
--

CREATE TABLE IF NOT EXISTS `b_admin_notify` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `MESSAGE` text,
  `ENABLE_CLOSE` char(1) DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_admin_notify_lang`
--

CREATE TABLE IF NOT EXISTS `b_admin_notify_lang` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int NOT NULL,
  `LID` char(2) NOT NULL,
  `MESSAGE` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_agent`
--

CREATE TABLE IF NOT EXISTS `b_agent` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `NAME` text,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int DEFAULT '86400',
  `IS_PERIOD` char(1) DEFAULT 'Y',
  `USER_ID` int DEFAULT NULL,
  `RUNNING` char(1) NOT NULL DEFAULT 'N',
  `RETRY_COUNT` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ix_agent_user_id` (`USER_ID`),
  KEY `ix_agent_name` (`NAME`(100)),
  KEY `ix_agent_act_period_next_exec` (`ACTIVE`,`IS_PERIOD`,`NEXT_EXEC`),
  KEY `ix_agent_next_exec` (`NEXT_EXEC`),
  KEY `ix_agent_module_act` (`MODULE_ID`,`ACTIVE`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_agent`
--

INSERT INTO `b_agent` (`ID`, `MODULE_ID`, `SORT`, `NAME`, `ACTIVE`, `LAST_EXEC`, `NEXT_EXEC`, `DATE_CHECK`, `AGENT_INTERVAL`, `IS_PERIOD`, `USER_ID`, `RUNNING`, `RETRY_COUNT`) VALUES
(1, 'main', 100, 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2024-10-23 14:10:40', '2024-10-23 15:10:40', NULL, 3600, 'N', NULL, 'N', 0),
(2, 'main', 100, 'CSiteCheckerTest::CommonTest();', 'Y', '2024-10-23 03:04:42', '2024-10-24 03:04:42', NULL, 86400, 'N', NULL, 'N', 0),
(3, 'main', 100, 'CEvent::CleanUpAgent();', 'Y', '2024-10-23 03:12:15', '2024-10-24 03:12:15', NULL, 86400, 'N', NULL, 'N', 0),
(4, 'main', 100, 'CUser::CleanUpHitAuthAgent();', 'Y', '2024-10-23 03:15:44', '2024-10-24 03:15:44', NULL, 86400, 'N', NULL, 'N', 0),
(5, 'main', 100, 'CUndo::CleanUpOld();', 'Y', '2024-10-23 03:20:08', '2024-10-24 03:20:08', NULL, 86400, 'N', NULL, 'N', 0),
(6, 'main', 100, 'CUserCounter::DeleteOld();', 'Y', '2024-10-23 03:25:45', '2024-10-24 03:25:45', NULL, 86400, 'N', NULL, 'N', 0),
(7, 'main', 100, '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable::deleteOldAgent(22, 20);', 'Y', '2024-10-23 03:31:47', '2024-10-24 03:31:47', NULL, 86400, 'N', NULL, 'N', 0),
(8, 'main', 100, 'CUser::AuthActionsCleanUpAgent();', 'Y', '2024-10-23 04:16:28', '2024-10-24 04:16:28', NULL, 86400, 'N', NULL, 'N', 0),
(9, 'main', 100, 'CUser::CleanUpAgent();', 'Y', '2024-10-23 04:22:21', '2024-10-24 04:22:21', NULL, 86400, 'N', NULL, 'N', 0),
(10, 'main', 100, 'CUser::DeactivateAgent();', 'Y', '2024-10-23 04:25:20', '2024-10-24 04:25:20', NULL, 86400, 'N', NULL, 'N', 0),
(11, 'main', 100, 'CEventLog::CleanUpAgent();', 'Y', '2024-10-23 04:31:05', '2024-10-24 04:31:05', NULL, 86400, 'N', NULL, 'N', 0),
(13, 'clouds', 100, 'CCloudStorage::CleanUp();', 'Y', '2024-10-22 21:29:46', '2024-10-23 21:29:46', NULL, 86400, 'N', NULL, 'N', 0),
(14, 'landing', 100, 'Bitrix\\Landing\\Agent::clearRecycle();', 'Y', '2024-10-23 13:07:44', '2024-10-23 15:07:44', NULL, 7200, 'N', NULL, 'N', 0),
(15, 'landing', 100, 'Bitrix\\Landing\\Agent::clearFiles(30);', 'Y', '2024-10-23 14:10:40', '2024-10-23 15:10:40', NULL, 3600, 'N', NULL, 'N', 0),
(16, 'landing', 100, 'Bitrix\\Landing\\Agent::sendRestStatistic();', 'Y', '2024-10-22 21:29:46', '2024-10-23 21:29:46', NULL, 86400, 'N', NULL, 'N', 0),
(17, 'landing', 100, 'Bitrix\\Landing\\Agent::clearTempFiles();', 'Y', '2024-10-22 21:29:46', '2024-10-23 21:29:46', NULL, 86400, 'N', NULL, 'N', 0),
(20, 'location', 100, '\\Bitrix\\Location\\Infrastructure\\Service\\RecentAddressesService::cleanUp();', 'Y', '2024-10-22 22:51:44', '2024-10-23 22:51:44', NULL, 86400, 'N', NULL, 'N', 0),
(21, 'messageservice', 100, 'Bitrix\\MessageService\\Queue::cleanUpAgent();', 'Y', '2024-10-23 00:00:19', '2024-10-24 00:00:00', NULL, 86400, 'Y', NULL, 'N', 0),
(22, 'messageservice', 100, 'Bitrix\\MessageService\\IncomingMessage::cleanUpAgent();', 'Y', '2024-10-23 00:00:19', '2024-10-24 00:00:00', NULL, 86400, 'Y', NULL, 'N', 0),
(23, 'rest', 100, 'Bitrix\\Rest\\Marketplace\\Client::getNumUpdates();', 'Y', '2024-10-22 21:29:47', '2024-10-23 21:29:47', NULL, 86400, 'N', NULL, 'N', 0),
(24, 'rest', 100, '\\Bitrix\\Rest\\EventOfflineTable::cleanProcessAgent();', 'Y', '2024-10-22 21:29:47', '2024-10-23 21:29:47', NULL, 86400, 'N', NULL, 'N', 0),
(25, 'rest', 100, '\\Bitrix\\Rest\\LogTable::cleanUpAgent();', 'Y', '2024-10-22 21:29:47', '2024-10-23 21:29:47', NULL, 86400, 'N', NULL, 'N', 0),
(26, 'rest', 100, '\\Bitrix\\Rest\\Configuration\\Helper::sendStatisticAgent();', 'Y', '2024-10-22 21:29:47', '2024-10-23 21:29:47', NULL, 86400, 'N', NULL, 'N', 0),
(27, 'rest', 100, '\\Bitrix\\Rest\\UsageStatTable::sendAgent();', 'Y', '2024-10-23 14:10:40', '2024-10-23 15:10:40', NULL, 3600, 'N', NULL, 'N', 0),
(28, 'rest', 100, '\\Bitrix\\Rest\\UsageStatTable::cleanUpAgent();', 'Y', '2024-10-23 14:10:40', '2024-10-23 15:10:40', NULL, 3600, 'N', NULL, 'N', 0),
(29, 'rest', 100, '\\Bitrix\\Rest\\Marketplace\\Notification::checkAgent();', 'Y', '2024-10-22 21:29:47', '2024-10-23 21:29:47', NULL, 86400, 'N', NULL, 'N', 0),
(30, 'rest', 100, '\\Bitrix\\Rest\\Marketplace\\Immune::load();', 'Y', '2024-10-22 21:29:48', '2024-10-23 21:29:48', NULL, 86400, 'N', NULL, 'N', 0),
(31, 'rest', 100, '\\Bitrix\\Rest\\Configuration\\Structure::clearContentAgent();', 'Y', '2024-10-22 21:29:48', '2024-10-23 21:29:48', NULL, 86400, 'N', NULL, 'N', 0),
(32, 'rest', 100, '\\Bitrix\\Rest\\Helper::recoveryAgents();', 'Y', '2024-10-22 21:29:48', '2024-10-29 21:29:48', NULL, 604800, 'N', NULL, 'N', 0),
(33, 'search', 10, 'CSearchSuggest::CleanUpAgent();', 'Y', '2024-10-22 21:29:48', '2024-10-23 21:29:48', NULL, 86400, 'N', NULL, 'N', 0),
(34, 'search', 10, 'CSearchStatistic::CleanUpAgent();', 'Y', '2024-10-22 21:29:48', '2024-10-23 21:29:48', NULL, 86400, 'N', NULL, 'N', 0),
(35, 'security', 100, 'CSecuritySession::CleanUpAgent();', 'Y', '2024-10-23 14:10:40', '2024-10-23 14:40:40', NULL, 1800, 'N', NULL, 'N', 0),
(36, 'security', 100, 'CSecurityIPRule::CleanUpAgent();', 'Y', '2024-10-23 14:10:40', '2024-10-23 15:10:40', NULL, 3600, 'N', NULL, 'N', 0),
(37, 'seo', 100, 'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();', 'Y', '2024-10-23 14:10:40', '2024-10-23 15:10:40', NULL, 3600, 'N', NULL, 'N', 0),
(38, 'seo', 100, 'Bitrix\\Seo\\Adv\\LogTable::clean();', 'Y', '2024-10-22 21:29:48', '2024-10-23 21:29:48', NULL, 86400, 'N', NULL, 'N', 0),
(39, 'seo', 100, 'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();', 'Y', '2024-10-23 14:10:40', '2024-10-23 15:10:40', NULL, 3600, 'N', NULL, 'N', 0),
(41, 'ui', 100, '\\Bitrix\\UI\\FileUploader\\TempFileAgent::clearOldRecords();', 'Y', '2024-10-23 14:10:40', '2024-10-23 14:40:40', NULL, 1800, 'N', NULL, 'N', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_app_password`
--

CREATE TABLE IF NOT EXISTS `b_app_password` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `APPLICATION_ID` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `DIGEST_PASSWORD` varchar(255) NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) DEFAULT NULL,
  `COMMENT` varchar(255) DEFAULT NULL,
  `SYSCOMMENT` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_b24connector_buttons`
--

CREATE TABLE IF NOT EXISTS `b_b24connector_buttons` (
  `ID` int NOT NULL,
  `APP_ID` int NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SCRIPT` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_b24connector_button_site`
--

CREATE TABLE IF NOT EXISTS `b_b24connector_button_site` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `BUTTON_ID` int NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BUTTON_ID` (`BUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_bitrixcloud_option`
--

CREATE TABLE IF NOT EXISTS `b_bitrixcloud_option` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `SORT` int NOT NULL,
  `PARAM_KEY` varchar(50) DEFAULT NULL,
  `PARAM_VALUE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_bitrixcloud_option_1` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_bitrixcloud_option`
--

INSERT INTO `b_bitrixcloud_option` (`ID`, `NAME`, `SORT`, `PARAM_KEY`, `PARAM_VALUE`) VALUES
(1, 'backup_quota', 0, '0', '0'),
(2, 'backup_total_size', 0, '0', '0'),
(3, 'backup_last_backup_time', 0, '0', '1729621845'),
(4, 'monitoring_expire_time', 0, '0', '1729679926');

-- --------------------------------------------------------

--
-- Структура таблицы `b_cache_tag`
--

CREATE TABLE IF NOT EXISTS `b_cache_tag` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) DEFAULT NULL,
  `CACHE_SALT` char(4) DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) DEFAULT NULL,
  `TAG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_captcha`
--

CREATE TABLE IF NOT EXISTS `b_captcha` (
  `ID` varchar(32) NOT NULL,
  `CODE` varchar(20) NOT NULL,
  `IP` varchar(15) NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_checklist`
--

CREATE TABLE IF NOT EXISTS `b_checklist` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) DEFAULT NULL,
  `TESTER` varchar(255) DEFAULT NULL,
  `COMPANY_NAME` varchar(255) DEFAULT NULL,
  `PICTURE` int DEFAULT NULL,
  `TOTAL` int DEFAULT NULL,
  `SUCCESS` int DEFAULT NULL,
  `FAILED` int DEFAULT NULL,
  `PENDING` int DEFAULT NULL,
  `SKIP` int DEFAULT NULL,
  `STATE` longtext,
  `REPORT_COMMENT` text,
  `REPORT` char(1) DEFAULT 'Y',
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE` varchar(50) DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) DEFAULT 'N',
  `HIDDEN` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_copy_queue`
--

CREATE TABLE IF NOT EXISTS `b_clouds_copy_queue` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `OP` char(1) NOT NULL,
  `SOURCE_BUCKET_ID` int NOT NULL,
  `SOURCE_FILE_PATH` varchar(500) NOT NULL,
  `TARGET_BUCKET_ID` int NOT NULL,
  `TARGET_FILE_PATH` varchar(500) NOT NULL,
  `FILE_SIZE` int NOT NULL DEFAULT '-1',
  `FILE_POS` int NOT NULL DEFAULT '0',
  `FAIL_COUNTER` int NOT NULL DEFAULT '0',
  `STATUS` char(1) NOT NULL DEFAULT 'Y',
  `ERROR_MESSAGE` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_delete_queue`
--

CREATE TABLE IF NOT EXISTS `b_clouds_delete_queue` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `BUCKET_ID` int NOT NULL,
  `FILE_PATH` varchar(500) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_clouds_delete_queue_1` (`BUCKET_ID`,`FILE_PATH`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_bucket`
--

CREATE TABLE IF NOT EXISTS `b_clouds_file_bucket` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) DEFAULT 'Y',
  `SORT` int DEFAULT '500',
  `READ_ONLY` char(1) DEFAULT 'N',
  `SERVICE_ID` varchar(50) DEFAULT NULL,
  `BUCKET` varchar(63) DEFAULT NULL,
  `LOCATION` varchar(50) DEFAULT NULL,
  `CNAME` varchar(100) DEFAULT NULL,
  `FILE_COUNT` int DEFAULT '0',
  `FILE_SIZE` double DEFAULT '0',
  `LAST_FILE_ID` int DEFAULT NULL,
  `PREFIX` varchar(100) DEFAULT NULL,
  `SETTINGS` text,
  `FILE_RULES` text,
  `FAILOVER_ACTIVE` char(1) DEFAULT 'N',
  `FAILOVER_BUCKET_ID` int DEFAULT NULL,
  `FAILOVER_COPY` char(1) DEFAULT 'N',
  `FAILOVER_DELETE` char(1) DEFAULT 'N',
  `FAILOVER_DELETE_DELAY` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_hash`
--

CREATE TABLE IF NOT EXISTS `b_clouds_file_hash` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `BUCKET_ID` int NOT NULL,
  `FILE_PATH` varchar(760) NOT NULL,
  `FILE_SIZE` bigint DEFAULT NULL,
  `FILE_MTIME` datetime DEFAULT NULL,
  `FILE_HASH` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_clouds_file_hash` (`BUCKET_ID`,`FILE_PATH`(190))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_resize`
--

CREATE TABLE IF NOT EXISTS `b_clouds_file_resize` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `ERROR_CODE` int NOT NULL DEFAULT '0',
  `FILE_ID` int DEFAULT NULL,
  `PARAMS` text,
  `FROM_PATH` varchar(500) DEFAULT NULL,
  `TO_PATH` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  KEY `ix_b_file_resize_file` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_save`
--

CREATE TABLE IF NOT EXISTS `b_clouds_file_save` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `BUCKET_ID` int NOT NULL,
  `SUBDIR` varchar(255) DEFAULT NULL,
  `FILE_NAME` varchar(255) NOT NULL,
  `EXTERNAL_ID` varchar(50) DEFAULT NULL,
  `FILE_SIZE` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_upload`
--

CREATE TABLE IF NOT EXISTS `b_clouds_file_upload` (
  `ID` varchar(32) NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `FILE_PATH` varchar(500) NOT NULL,
  `FILE_SIZE` bigint DEFAULT NULL,
  `TMP_FILE` varchar(500) DEFAULT NULL,
  `BUCKET_ID` int NOT NULL,
  `PART_SIZE` int NOT NULL,
  `PART_NO` int NOT NULL,
  `PART_FAIL_COUNTER` int NOT NULL,
  `NEXT_STEP` mediumtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_component_params`
--

CREATE TABLE IF NOT EXISTS `b_component_params` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `COMPONENT_NAME` varchar(255) NOT NULL,
  `TEMPLATE_NAME` varchar(255) DEFAULT NULL,
  `REAL_PATH` varchar(255) NOT NULL,
  `SEF_MODE` char(1) NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) DEFAULT NULL,
  `START_CHAR` int NOT NULL,
  `END_CHAR` int NOT NULL,
  `PARAMETERS` text,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_composite_log`
--

CREATE TABLE IF NOT EXISTS `b_composite_log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `HOST` varchar(100) NOT NULL,
  `URI` varchar(2000) NOT NULL,
  `TITLE` varchar(250) DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `TYPE` varchar(50) NOT NULL,
  `MESSAGE` longtext,
  `AJAX` char(1) NOT NULL DEFAULT 'N',
  `USER_ID` int NOT NULL DEFAULT '0',
  `PAGE_ID` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_LOG_PAGE_ID` (`PAGE_ID`),
  KEY `IX_B_COMPOSITE_LOG_HOST` (`HOST`),
  KEY `IX_B_COMPOSITE_LOG_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_composite_page`
--

CREATE TABLE IF NOT EXISTS `b_composite_page` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CACHE_KEY` varchar(2000) NOT NULL,
  `HOST` varchar(100) NOT NULL,
  `URI` varchar(2000) NOT NULL,
  `TITLE` varchar(250) DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `CHANGED` datetime NOT NULL,
  `LAST_VIEWED` datetime NOT NULL,
  `VIEWS` int NOT NULL DEFAULT '0',
  `REWRITES` int NOT NULL DEFAULT '0',
  `SIZE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_PAGE_CACHE_KEY` (`CACHE_KEY`(100)),
  KEY `IX_B_COMPOSITE_PAGE_VIEWED` (`LAST_VIEWED`),
  KEY `IX_B_COMPOSITE_PAGE_HOST` (`HOST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_agreement`
--

CREATE TABLE IF NOT EXISTS `b_consent_agreement` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CODE` varchar(45) DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) NOT NULL,
  `TYPE` char(1) DEFAULT NULL,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) DEFAULT NULL,
  `AGREEMENT_TEXT` longtext,
  `LABEL_TEXT` varchar(4000) DEFAULT NULL,
  `SECURITY_CODE` varchar(32) DEFAULT NULL,
  `USE_URL` char(1) NOT NULL DEFAULT 'N',
  `URL` varchar(255) DEFAULT NULL,
  `IS_AGREEMENT_TEXT_HTML` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_field`
--

CREATE TABLE IF NOT EXISTS `b_consent_field` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AGREEMENT_ID` int NOT NULL,
  `CODE` varchar(100) DEFAULT NULL,
  `VALUE` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_user_consent`
--

CREATE TABLE IF NOT EXISTS `b_consent_user_consent` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `IP` varchar(15) NOT NULL,
  `URL` varchar(4000) DEFAULT NULL,
  `ORIGIN_ID` varchar(30) DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`),
  KEY `IX_CONSENT_USER_CONSENT_USER_ORIGIN` (`USER_ID`,`ORIGIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_user_consent_item`
--

CREATE TABLE IF NOT EXISTS `b_consent_user_consent_item` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_CONSENT_ID` int NOT NULL,
  `VALUE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_ITEM_AG_ID` (`USER_CONSENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_counter_data`
--

CREATE TABLE IF NOT EXISTS `b_counter_data` (
  `ID` varchar(16) NOT NULL,
  `TYPE` varchar(30) NOT NULL,
  `DATA` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_culture`
--

CREATE TABLE IF NOT EXISTS `b_culture` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `FORMAT_DATE` varchar(50) DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) DEFAULT NULL,
  `FORMAT_NAME` varchar(50) DEFAULT NULL,
  `WEEK_START` int DEFAULT '1',
  `CHARSET` varchar(50) DEFAULT NULL,
  `DIRECTION` char(1) DEFAULT 'Y',
  `SHORT_DATE_FORMAT` varchar(50) DEFAULT 'n/j/Y',
  `MEDIUM_DATE_FORMAT` varchar(50) DEFAULT 'M j, Y',
  `LONG_DATE_FORMAT` varchar(50) DEFAULT 'F j, Y',
  `FULL_DATE_FORMAT` varchar(50) DEFAULT 'l, F j, Y',
  `DAY_MONTH_FORMAT` varchar(50) DEFAULT 'F j',
  `DAY_SHORT_MONTH_FORMAT` varchar(50) DEFAULT 'M j',
  `DAY_OF_WEEK_MONTH_FORMAT` varchar(50) DEFAULT 'l, F j',
  `SHORT_DAY_OF_WEEK_MONTH_FORMAT` varchar(50) DEFAULT 'D, F j',
  `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT` varchar(50) DEFAULT 'D, M j',
  `SHORT_TIME_FORMAT` varchar(50) DEFAULT 'g:i a',
  `LONG_TIME_FORMAT` varchar(50) DEFAULT 'g:i:s a',
  `AM_VALUE` varchar(20) DEFAULT 'am',
  `PM_VALUE` varchar(20) DEFAULT 'pm',
  `NUMBER_THOUSANDS_SEPARATOR` varchar(10) DEFAULT ',',
  `NUMBER_DECIMAL_SEPARATOR` varchar(10) DEFAULT '.',
  `NUMBER_DECIMALS` tinyint DEFAULT '2',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_culture`
--

INSERT INTO `b_culture` (`ID`, `CODE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `SHORT_DATE_FORMAT`, `MEDIUM_DATE_FORMAT`, `LONG_DATE_FORMAT`, `FULL_DATE_FORMAT`, `DAY_MONTH_FORMAT`, `DAY_SHORT_MONTH_FORMAT`, `DAY_OF_WEEK_MONTH_FORMAT`, `SHORT_DAY_OF_WEEK_MONTH_FORMAT`, `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT`, `SHORT_TIME_FORMAT`, `LONG_TIME_FORMAT`, `AM_VALUE`, `PM_VALUE`, `NUMBER_THOUSANDS_SEPARATOR`, `NUMBER_DECIMAL_SEPARATOR`, `NUMBER_DECIMALS`) VALUES
(1, 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', 1, 'UTF-8', 'Y', 'd.m.Y', 'j M Y', 'j F Y', 'l, j F Y', 'j F', 'j M', 'l, j F', 'D, j F', 'D, j M', 'H:i', 'H:i:s', 'am', 'pm', ' ', ',', 2),
(2, 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', 0, 'UTF-8', 'Y', 'n/j/Y', 'M j, Y', 'F j, Y', 'l, F j, Y', 'F j', 'M j', 'l, F j', 'D, F j', 'D, M j', 'g:i a', 'g:i:s a', 'am', 'pm', ',', '.', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `b_entity_usage`
--

CREATE TABLE IF NOT EXISTS `b_entity_usage` (
  `USER_ID` int NOT NULL,
  `CONTEXT` varchar(50) NOT NULL,
  `ENTITY_ID` varchar(30) NOT NULL,
  `ITEM_ID` varchar(50) NOT NULL,
  `ITEM_ID_INT` int NOT NULL DEFAULT '0',
  `PREFIX` varchar(10) NOT NULL DEFAULT '',
  `LAST_USE_DATE` datetime NOT NULL,
  PRIMARY KEY (`USER_ID`,`CONTEXT`,`ENTITY_ID`,`ITEM_ID`),
  KEY `IX_ENTITY_USAGE_ITEM_ID_INT` (`ITEM_ID_INT`),
  KEY `IX_ENTITY_USAGE_LAST_USE_DATE` (`LAST_USE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event`
--

CREATE TABLE IF NOT EXISTS `b_event` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) NOT NULL,
  `MESSAGE_ID` int DEFAULT NULL,
  `LID` varchar(255) NOT NULL,
  `C_FIELDS` longtext,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_attachment`
--

CREATE TABLE IF NOT EXISTS `b_event_attachment` (
  `EVENT_ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `IS_FILE_COPIED` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`EVENT_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_log`
--

CREATE TABLE IF NOT EXISTS `b_event_log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SEVERITY` varchar(50) NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `ITEM_ID` varchar(255) NOT NULL,
  `REMOTE_ADDR` varchar(40) DEFAULT NULL,
  `USER_AGENT` text,
  `REQUEST_URI` text,
  `SITE_ID` char(2) DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `GUEST_ID` int DEFAULT NULL,
  `DESCRIPTION` mediumtext,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`),
  KEY `ix_b_event_log_audit_type_time` (`AUDIT_TYPE_ID`,`TIMESTAMP_X`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_event_log`
--

INSERT INTO `b_event_log` (`ID`, `TIMESTAMP_X`, `SEVERITY`, `AUDIT_TYPE_ID`, `MODULE_ID`, `ITEM_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REQUEST_URI`, `SITE_ID`, `USER_ID`, `GUEST_ID`, `DESCRIPTION`) VALUES
(1, '2024-10-22 20:56:58', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:131.0) Gecko/20100101 Firefox/131.0', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&lang=ru&path=%2Findex.php&site=s1&back_url=%2Findex.php%3Fback_url_admin%3D%252Fbitrix%252Fadmin%252Fsettings.php%253Flang%253Dru%2526mid%253Dmain%2526tabControl_active_tab%253Dedit1%2526back_url_settings%253D%26clear_cache%3DY&templateID=empty&siteTemplateId=empty', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(2, '2024-10-22 21:12:03', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:131.0) Gecko/20100101 Firefox/131.0', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&lang=ru&path=%2Findex.php&site=s1&back_url=%2Findex.php%3Fback_url_admin%3D%252Fbitrix%252Fadmin%252Fsettings.php%253Flang%253Dru%2526mid%253Dmain%2526tabControl_active_tab%253Dedit1%2526back_url_settings%253D%26clear_cache%3DY&templateID=empty&siteTemplateId=empty', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(3, '2024-10-22 21:12:55', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:131.0) Gecko/20100101 Firefox/131.0', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&lang=ru&path=%2Findex.php&site=s1&back_url=%2Findex.php%3Fback_url_admin%3D%252Fbitrix%252Fadmin%252Fsettings.php%253Flang%253Dru%2526mid%253Dmain%2526tabControl_active_tab%253Dedit1%2526back_url_settings%253D%26clear_cache%3DY&templateID=empty&siteTemplateId=empty', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(4, '2024-10-23 00:04:42', 'WARNING', 'SITE_CHECKER_SUCCESS', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/bitrix/tools/public_session.php?k=0e09711f4f92113ca6f0a1abdcecc67d.a150475601c5c5b9b14904983b433b1a478eb55499d6cac60b81fe8c4c7fca5a', 's1', NULL, NULL, ''),
(5, '2024-10-23 02:03:25', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:131.0) Gecko/20100101 Firefox/131.0', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&lang=ru&path=%2Findex.php&site=s1&back_url=%2Findex.php%3Fshow_lang_files%3DY%26back_url_admin%3D%252Fbitrix%252Fadmin%252Fsite_edit.php%253Flang%253Dru%2526LID%253Ds1%26clear_cache%3DY&templateID=empty&siteTemplateId=empty', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(6, '2024-10-23 02:03:34', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:131.0) Gecko/20100101 Firefox/131.0', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&lang=ru&path=%2Findex.php&site=s1&back_url=%2Findex.php%3Fshow_lang_files%3DY%26back_url_admin%3D%252Fbitrix%252Fadmin%252Fsite_edit.php%253Flang%253Dru%2526LID%253Ds1%26clear_cache%3DY&templateID=empty&siteTemplateId=empty', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(7, '2024-10-23 02:07:17', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:131.0) Gecko/20100101 Firefox/131.0', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&lang=ru&path=%2Findex.php&site=s1&back_url=%2Findex.php%3Fshow_lang_files%3DY%26back_url_admin%3D%252Fbitrix%252Fadmin%252Fsite_edit.php%253Flang%253Dru%2526LID%253Ds1%26clear_cache%3DY&templateID=empty&siteTemplateId=empty', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message`
--

CREATE TABLE IF NOT EXISTS `b_event_message` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `EVENT_NAME` varchar(255) NOT NULL,
  `LID` char(2) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) DEFAULT NULL,
  `MESSAGE` longtext,
  `MESSAGE_PHP` longtext,
  `BODY_TYPE` varchar(4) NOT NULL DEFAULT 'text',
  `BCC` text,
  `REPLY_TO` varchar(255) DEFAULT NULL,
  `CC` varchar(255) DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) DEFAULT NULL,
  `PRIORITY` varchar(50) DEFAULT NULL,
  `FIELD1_NAME` varchar(50) DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) DEFAULT NULL,
  `FIELD2_NAME` varchar(50) DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) DEFAULT NULL,
  `ADDITIONAL_FIELD` text,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_event_message`
--

INSERT INTO `b_event_message` (`ID`, `TIMESTAMP_X`, `EVENT_NAME`, `LID`, `ACTIVE`, `EMAIL_FROM`, `EMAIL_TO`, `SUBJECT`, `MESSAGE`, `MESSAGE_PHP`, `BODY_TYPE`, `BCC`, `REPLY_TO`, `CC`, `IN_REPLY_TO`, `PRIORITY`, `FIELD1_NAME`, `FIELD1_VALUE`, `FIELD2_NAME`, `FIELD2_VALUE`, `SITE_TEMPLATE_ID`, `ADDITIONAL_FIELD`, `LANGUAGE_ID`) VALUES
(1, '2024-10-22 18:22:26', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams[\"SERVER_NAME\"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\n\nИмя: <?=$arParams[\"NAME\"];?>\n\nФамилия: <?=$arParams[\"LAST_NAME\"];?>\n\nE-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nПисьмо сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(2, '2024-10-22 18:22:26', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(3, '2024-10-22 18:22:26', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(4, '2024-10-22 18:22:26', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(5, '2024-10-22 18:22:26', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams[\"SERVER_NAME\"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(6, '2024-10-22 18:22:26', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>\n\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(7, '2024-10-22 18:22:26', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nE-mail автора: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"TEXT\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(8, '2024-10-22 18:22:26', 'MAIN_MAIL_CONFIRM_CODE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#MESSAGE_SUBJECT#', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_join', NULL, NULL),
(9, '2024-10-22 18:22:26', 'EVENT_LOG_NOTIFICATION', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'Оповещение журнала событий: #NAME#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: #AUDIT_TYPE_ID#\nОбъект: #ITEM_ID#\nПользователь: #USER_ID# \nIP-адрес: #REMOTE_ADDR#\nБраузер: #USER_AGENT#\nСтраница: #REQUEST_URI# \n\nКоличество записей: #EVENT_COUNT# \n\n#ADDITIONAL_TEXT#\n\nПерейти в журнал событий:\nhttp://#SERVER_NAME#/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=#AUDIT_TYPE_ID#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: <?=$arParams[\"AUDIT_TYPE_ID\"];?>\n\nОбъект: <?=$arParams[\"ITEM_ID\"];?>\n\nПользователь: <?=$arParams[\"USER_ID\"];?> \nIP-адрес: <?=$arParams[\"REMOTE_ADDR\"];?>\n\nБраузер: <?=$arParams[\"USER_AGENT\"];?>\n\nСтраница: <?=$arParams[\"REQUEST_URI\"];?> \n\nКоличество записей: <?=$arParams[\"EVENT_COUNT\"];?> \n\n<?=$arParams[\"ADDITIONAL_TEXT\"];?>\n\n\nПерейти в журнал событий:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=<?=$arParams[\"AUDIT_TYPE_ID\"];?>', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(10, '2024-10-22 18:22:26', 'USER_CODE_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос кода авторизации', 'Используйте для авторизации код:\n\n#CHECKWORD#\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nЛогин: #LOGIN#\n\nСообщение создано автоматически.', 'Используйте для авторизации код:\n\n<?=$arParams[\"CHECKWORD\"];?>\n\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nЛогин: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение создано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(11, '2024-10-22 18:22:27', 'NEW_DEVICE_LOGIN', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'Вход с нового устройства', 'Здравствуйте, #NAME#,\n\nНовое устройство авторизовалось под вашим логином #LOGIN#.\n \nУстройство: #DEVICE# \nБраузер: #BROWSER#\nПлатформа: #PLATFORM#\nМестоположение: #LOCATION# (может быть неточным)\nДата: #DATE#\n\nЕсли вы не знаете, кто это был, рекомендуем немедленно сменить пароль.\n', 'Здравствуйте, <?=$arParams[\"NAME\"];?>,\n\nНовое устройство авторизовалось под вашим логином <?=$arParams[\"LOGIN\"];?>.\n \nУстройство: <?=$arParams[\"DEVICE\"];?> \nБраузер: <?=$arParams[\"BROWSER\"];?>\n\nПлатформа: <?=$arParams[\"PLATFORM\"];?>\n\nМестоположение: <?=$arParams[\"LOCATION\"];?> (может быть неточным)\nДата: <?=$arParams[\"DATE\"];?>\n\n\nЕсли вы не знаете, кто это был, рекомендуем немедленно сменить пароль.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(12, '2024-10-22 18:22:27', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: New user has been registered on the site', 'Informational message from #SITE_NAME#\n---------------------------------------\n\nNew user has been successfully registered on the site #SERVER_NAME#.\n\nUser details:\nUser ID: #USER_ID#\n\nName: #NAME#\nLast Name: #LAST_NAME#\nUser\'s E-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nAutomatically generated message.', 'Informational message from <?=$arParams[\"SITE_NAME\"];?>\n\n---------------------------------------\n\nNew user has been successfully registered on the site <?=$arParams[\"SERVER_NAME\"];?>.\n\nUser details:\nUser ID: <?=$arParams[\"USER_ID\"];?>\n\n\nName: <?=$arParams[\"NAME\"];?>\n\nLast Name: <?=$arParams[\"LAST_NAME\"];?>\n\nUser\'s E-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nAutomatically generated message.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(13, '2024-10-22 18:22:27', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Registration info', 'Informational message from #SITE_NAME#\n---------------------------------------\n\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nYour registration info:\n\nUser ID: #USER_ID#\nAccount status: #STATUS#\nLogin: #LOGIN#\n\nTo change your password please visit the link below:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=en&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nAutomatically generated message.', 'Informational message from <?=$arParams[\"SITE_NAME\"];?>\n\n---------------------------------------\n\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nYour registration info:\n\nUser ID: <?=$arParams[\"USER_ID\"];?>\n\nAccount status: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nTo change your password please visit the link below:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=en&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nAutomatically generated message.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(14, '2024-10-22 18:22:27', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Password Change Request', 'Informational message from #SITE_NAME#\n---------------------------------------\n\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nTo change your password please visit the link below:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=en&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nYour registration info:\n\nUser ID: #USER_ID#\nAccount status: #STATUS#\nLogin: #LOGIN#\n\nAutomatically generated message.', 'Informational message from <?=$arParams[\"SITE_NAME\"];?>\n\n---------------------------------------\n\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nTo change your password please visit the link below:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=en&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nYour registration info:\n\nUser ID: <?=$arParams[\"USER_ID\"];?>\n\nAccount status: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nAutomatically generated message.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(15, '2024-10-22 18:22:27', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Password Change Confirmation', 'Informational message from #SITE_NAME#\n---------------------------------------\n\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nYour registration info:\n\nUser ID: #USER_ID#\nAccount status: #STATUS#\nLogin: #LOGIN#\n\nAutomatically generated message.', 'Informational message from <?=$arParams[\"SITE_NAME\"];?>\n\n---------------------------------------\n\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nYour registration info:\n\nUser ID: <?=$arParams[\"USER_ID\"];?>\n\nAccount status: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nAutomatically generated message.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(16, '2024-10-22 18:22:27', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: New user registration confirmation', 'Greetings from #SITE_NAME#!\n------------------------------------------\n\nHello,\n\nyou have received this message because you (or someone else) used your e-mail to register at #SERVER_NAME#.\n\nYour registration confirmation code: #CONFIRM_CODE#\n\nPlease use the link below to verify and activate your registration:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nAlternatively, open this link in your browser and enter the code manually:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nAttention! Your account will not be activated until you confirm registration.\n\n---------------------------------------------------------------------\n\nAutomatically generated message.', 'Greetings from <?=$arParams[\"SITE_NAME\"];?>!\n------------------------------------------\n\nHello,\n\nyou have received this message because you (or someone else) used your e-mail to register at <?=$arParams[\"SERVER_NAME\"];?>.\n\nYour registration confirmation code: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nPlease use the link below to verify and activate your registration:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nAlternatively, open this link in your browser and enter the code manually:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nAttention! Your account will not be activated until you confirm registration.\n\n---------------------------------------------------------------------\n\nAutomatically generated message.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(17, '2024-10-22 18:22:27', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Invitation to site', 'Informational message from site #SITE_NAME#\n------------------------------------------\nHello #NAME# #LAST_NAME#!\n\nAdministrator has added you to registered site users.\n\nWe invite you to visit our site.\n\nYour registration info:\n\nUser ID: #ID#\nLogin: #LOGIN#\n\nWe recommend you to change automatically generated password.\n\nTo change password please follow the link:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#', 'Informational message from site <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nHello <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nAdministrator has added you to registered site users.\n\nWe invite you to visit our site.\n\nYour registration info:\n\nUser ID: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nWe recommend you to change automatically generated password.\n\nTo change password please follow the link:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(18, '2024-10-22 18:22:27', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: A feedback form message', 'Notification from #SITE_NAME#\n------------------------------------------\n\nA message has been sent to you from the feedback form.\n\nSent by: #AUTHOR#\nSender\'s e-mail: #AUTHOR_EMAIL#\n\nMessage text:\n#TEXT#\n\nThis notification has been generated automatically.', 'Notification from <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nA message has been sent to you from the feedback form.\n\nSent by: <?=$arParams[\"AUTHOR\"];?>\n\nSender\'s e-mail: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nMessage text:\n<?=$arParams[\"TEXT\"];?>\n\n\nThis notification has been generated automatically.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(19, '2024-10-22 18:22:27', 'MAIN_MAIL_CONFIRM_CODE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#MESSAGE_SUBJECT#', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_join', NULL, NULL),
(20, '2024-10-22 18:22:27', 'EVENT_LOG_NOTIFICATION', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'Event log notification: #NAME#', 'Log events matching the notification parameters are found:\n\nEvent type: #AUDIT_TYPE_ID#\nObject: #ITEM_ID#\nUser: #USER_ID# \nIP address: #REMOTE_ADDR#\nBrowser: #USER_AGENT#\nPage URL: #REQUEST_URI# \n\nNumber of events: #EVENT_COUNT# \n\n#ADDITIONAL_TEXT#\n\nGo to event log:\nhttp://#SERVER_NAME#/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=#AUDIT_TYPE_ID#', 'Log events matching the notification parameters are found:\n\nEvent type: <?=$arParams[\"AUDIT_TYPE_ID\"];?>\n\nObject: <?=$arParams[\"ITEM_ID\"];?>\n\nUser: <?=$arParams[\"USER_ID\"];?> \nIP address: <?=$arParams[\"REMOTE_ADDR\"];?>\n\nBrowser: <?=$arParams[\"USER_AGENT\"];?>\n\nPage URL: <?=$arParams[\"REQUEST_URI\"];?> \n\nNumber of events: <?=$arParams[\"EVENT_COUNT\"];?> \n\n<?=$arParams[\"ADDITIONAL_TEXT\"];?>\n\n\nGo to event log:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=<?=$arParams[\"AUDIT_TYPE_ID\"];?>', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(21, '2024-10-22 18:22:27', 'USER_CODE_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Request for verification code', 'Use the following code to log in:\n\n#CHECKWORD#\n\nOnce logged in, you can change your password in your user profile.\n\nYour registration information:\n\nUser ID: #USER_ID#\nAccount status: #STATUS#\nLogin: #LOGIN#\n\nThis message was created automatically.', 'Use the following code to log in:\n\n<?=$arParams[\"CHECKWORD\"];?>\n\n\nOnce logged in, you can change your password in your user profile.\n\nYour registration information:\n\nUser ID: <?=$arParams[\"USER_ID\"];?>\n\nAccount status: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nThis message was created automatically.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(22, '2024-10-22 18:22:27', 'NEW_DEVICE_LOGIN', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'New device signed in', 'Hello #NAME#,\n\na new device has just signed in using your login #LOGIN#.\n \nDevice: #DEVICE# \nBrowser: #BROWSER#\nPlatform: #PLATFORM#\nLocation: #LOCATION# (approximate)\nDate: #DATE#\n\nWe recommend that you change your password immediately if it was not you or the sign-in was not on your behalf.\n', 'Hello <?=$arParams[\"NAME\"];?>,\n\na new device has just signed in using your login <?=$arParams[\"LOGIN\"];?>.\n \nDevice: <?=$arParams[\"DEVICE\"];?> \nBrowser: <?=$arParams[\"BROWSER\"];?>\n\nPlatform: <?=$arParams[\"PLATFORM\"];?>\n\nLocation: <?=$arParams[\"LOCATION\"];?> (approximate)\nDate: <?=$arParams[\"DATE\"];?>\n\n\nWe recommend that you change your password immediately if it was not you or the sign-in was not on your behalf.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(23, '2024-10-22 18:25:50', 'VIRUS_DETECTED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Обнаружен вирус', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера #SERVER_NAME# обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера <?=$arParams[\"SERVER_NAME\"];?> обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message_attachment`
--

CREATE TABLE IF NOT EXISTS `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message_site`
--

CREATE TABLE IF NOT EXISTS `b_event_message_site` (
  `EVENT_MESSAGE_ID` int NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_event_message_site`
--

INSERT INTO `b_event_message_site` (`EVENT_MESSAGE_ID`, `SITE_ID`) VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1'),
(5, 's1'),
(6, 's1'),
(7, 's1'),
(8, 's1'),
(9, 's1'),
(10, 's1'),
(11, 's1'),
(12, 's1'),
(13, 's1'),
(14, 's1'),
(15, 's1'),
(16, 's1'),
(17, 's1'),
(18, 's1'),
(19, 's1'),
(20, 's1'),
(21, 's1'),
(22, 's1'),
(23, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_type`
--

CREATE TABLE IF NOT EXISTS `b_event_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LID` char(2) NOT NULL,
  `EVENT_NAME` varchar(255) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `DESCRIPTION` text,
  `SORT` int NOT NULL DEFAULT '150',
  `EVENT_TYPE` varchar(10) NOT NULL DEFAULT 'email',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_event_type`
--

INSERT INTO `b_event_type` (`ID`, `LID`, `EVENT_NAME`, `NAME`, `DESCRIPTION`, `SORT`, `EVENT_TYPE`) VALUES
(1, 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', 1, 'email'),
(2, 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 2, 'email'),
(3, 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', 3, 'email'),
(4, 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 4, 'email'),
(5, 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 5, 'email'),
(6, 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', 6, 'email'),
(7, 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 7, 'email'),
(8, 'ru', 'MAIN_MAIL_CONFIRM_CODE', 'Подтверждение email-адреса отправителя', '\n\n#EMAIL_TO# - Email-адрес для подтверждения\n#MESSAGE_SUBJECT# - Тема сообщения\n#CONFIRM_CODE# - Код подтверждения', 8, 'email'),
(9, 'ru', 'EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#EMAIL# - Email получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 9, 'email'),
(10, 'ru', 'USER_CODE_REQUEST', 'Запрос кода авторизации', '#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#LOGIN# - Логин\n#CHECKWORD# - Код для авторизации\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - Email пользователя\n', 10, 'email'),
(11, 'ru', 'NEW_DEVICE_LOGIN', 'Вход с нового устройства', '#USER_ID# - ID пользователя\n#EMAIL# - Email пользователя\n#LOGIN# - Логин пользователя\n#NAME# - Имя пользователя\n#LAST_NAME# - Фамилия пользователя\n#DEVICE# - Устройство\n#BROWSER# - Браузер\n#PLATFORM# - Платформа\n#USER_AGENT# - User agent\n#IP# - IP-адрес\n#DATE# - Дата\n#COUNTRY# - Страна\n#REGION# - Регион\n#CITY# - Город\n#LOCATION# - Объединенные город, регион, страна\n', 11, 'email'),
(12, 'ru', 'SMS_USER_CONFIRM_NUMBER', 'Подтверждение номера телефона по СМС', '#USER_PHONE# - номер телефона\n#CODE# - код подтверждения\n', 100, 'sms'),
(13, 'ru', 'SMS_USER_RESTORE_PASSWORD', 'Восстановление пароля через СМС', '#USER_PHONE# - номер телефона\n#CODE# - код для восстановления\n', 100, 'sms'),
(14, 'ru', 'SMS_EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#PHONE_NUMBER# - Номер телефона получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 100, 'sms'),
(15, 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', 1, 'email'),
(16, 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 2, 'email'),
(17, 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', 3, 'email'),
(18, 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 4, 'email'),
(19, 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 5, 'email'),
(20, 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', 6, 'email'),
(21, 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address', 7, 'email'),
(22, 'en', 'MAIN_MAIL_CONFIRM_CODE', 'Confirm sender\'s email address', '\n\n#EMAIL_TO# - confirmation email address\n#MESSAGE_SUBJECT# - Message subject\n#CONFIRM_CODE# - Confirmation code', 8, 'email'),
(23, 'en', 'EVENT_LOG_NOTIFICATION', 'Event log notification', '#EMAIL# - Recipient email\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 9, 'email'),
(24, 'en', 'USER_CODE_REQUEST', 'Request for verification code', '#USER_ID# - user ID\n#STATUS# - Login status\n#LOGIN# - Login\n#CHECKWORD# - Verification code\n#NAME# - First name\n#LAST_NAME# - Last name\n#EMAIL# - User email\n', 10, 'email'),
(25, 'en', 'NEW_DEVICE_LOGIN', 'New device signed in', '#USER_ID# - User ID\n#EMAIL# - User email:\n#LOGIN# - User login\n#NAME# - User first name\n#LAST_NAME# - User last name\n#DEVICE# - Device\n#BROWSER# - Browser\n#PLATFORM# - Platform\n#USER_AGENT# - User agent\n#IP# - IP address\n#DATE# - Date\n#COUNTRY# - Country\n#REGION# - Region\n#CITY# - City\n#LOCATION# - Full location (city, region, country)\n', 11, 'email'),
(26, 'en', 'SMS_USER_CONFIRM_NUMBER', 'Verify phone number using SMS', '#USER_PHONE# - phone number\n#CODE# - confirmation code', 100, 'sms'),
(27, 'en', 'SMS_USER_RESTORE_PASSWORD', 'Recover password using SMS', '#USER_PHONE# - phone number\n#CODE# - recovery confirmation code', 100, 'sms'),
(28, 'en', 'SMS_EVENT_LOG_NOTIFICATION', 'Event log notification', '#PHONE_NUMBER# - Recipient phone number\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 100, 'sms'),
(29, 'ru', 'VIRUS_DETECTED', 'Обнаружен вирус', '#EMAIL# - E-Mail администратора сайта (из настроек главного модуля)', 100, 'email'),
(30, 'en', 'VIRUS_DETECTED', 'Virus detected', '#EMAIL# - Site administrator\'s e-mail address (from the Kernel module settings)', 100, 'email');

-- --------------------------------------------------------

--
-- Структура таблицы `b_favorite`
--

CREATE TABLE IF NOT EXISTS `b_favorite` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int NOT NULL DEFAULT '100',
  `MODIFIED_BY` int DEFAULT NULL,
  `CREATED_BY` int DEFAULT NULL,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `URL` text,
  `COMMENTS` text,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `CODE_ID` int DEFAULT NULL,
  `COMMON` char(1) NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file`
--

CREATE TABLE IF NOT EXISTS `b_file` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `HEIGHT` int DEFAULT NULL,
  `WIDTH` int DEFAULT NULL,
  `FILE_SIZE` bigint DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) DEFAULT NULL,
  `FILE_NAME` varchar(255) NOT NULL,
  `ORIGINAL_NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `HANDLER_ID` varchar(50) DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_duplicate`
--

CREATE TABLE IF NOT EXISTS `b_file_duplicate` (
  `DUPLICATE_ID` int NOT NULL,
  `ORIGINAL_ID` int NOT NULL,
  `COUNTER` int NOT NULL DEFAULT '1',
  `ORIGINAL_DELETED` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`DUPLICATE_ID`,`ORIGINAL_ID`),
  KEY `ix_file_duplicate_original_del` (`ORIGINAL_ID`,`ORIGINAL_DELETED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_hash`
--

CREATE TABLE IF NOT EXISTS `b_file_hash` (
  `FILE_ID` int NOT NULL,
  `FILE_SIZE` bigint NOT NULL,
  `FILE_HASH` varchar(50) NOT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `ix_file_hash_size_hash` (`FILE_SIZE`,`FILE_HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_preview`
--

CREATE TABLE IF NOT EXISTS `b_file_preview` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FILE_ID` int NOT NULL,
  `PREVIEW_ID` int DEFAULT NULL,
  `PREVIEW_IMAGE_ID` int DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL,
  `TOUCHED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_PL_TOUCH` (`TOUCHED_AT`),
  KEY `IX_B_FILE_PL_FILE` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_search`
--

CREATE TABLE IF NOT EXISTS `b_file_search` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `F_PATH` varchar(255) DEFAULT NULL,
  `B_DIR` int NOT NULL DEFAULT '0',
  `F_SIZE` int NOT NULL DEFAULT '0',
  `F_TIME` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_version`
--

CREATE TABLE IF NOT EXISTS `b_file_version` (
  `ORIGINAL_ID` int NOT NULL,
  `VERSION_ID` int NOT NULL,
  `META` text,
  PRIMARY KEY (`ORIGINAL_ID`),
  UNIQUE KEY `ux_file_version_version` (`VERSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_filters`
--

CREATE TABLE IF NOT EXISTS `b_filters` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int DEFAULT NULL,
  `FILTER_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FIELDS` text NOT NULL,
  `COMMON` char(1) DEFAULT NULL,
  `PRESET` char(1) DEFAULT NULL,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  `PRESET_ID` varchar(255) DEFAULT NULL,
  `SORT` int DEFAULT NULL,
  `SORT_FIELD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_finder_dest`
--

CREATE TABLE IF NOT EXISTS `b_finder_dest` (
  `USER_ID` int NOT NULL,
  `CODE` varchar(30) NOT NULL,
  `CODE_USER_ID` int DEFAULT NULL,
  `CODE_TYPE` varchar(10) DEFAULT NULL,
  `CONTEXT` varchar(50) NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  KEY `IX_FINDER_DEST` (`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_geoip_handlers`
--

CREATE TABLE IF NOT EXISTS `b_geoip_handlers` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SORT` int NOT NULL DEFAULT '100',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) NOT NULL,
  `CONFIG` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_geoip_handlers`
--

INSERT INTO `b_geoip_handlers` (`ID`, `SORT`, `ACTIVE`, `CLASS_NAME`, `CONFIG`) VALUES
(1, 100, 'Y', '\\Bitrix\\Main\\Service\\GeoIp\\GeoIP2', NULL),
(2, 110, 'N', '\\Bitrix\\Main\\Service\\GeoIp\\MaxMind', NULL),
(3, 120, 'N', '\\Bitrix\\Main\\Service\\GeoIp\\SypexGeo', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_geoname`
--

CREATE TABLE IF NOT EXISTS `b_geoname` (
  `ID` bigint UNSIGNED NOT NULL,
  `LANGUAGE_CODE` varchar(35) NOT NULL,
  `NAME` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`ID`,`LANGUAGE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group`
--

CREATE TABLE IF NOT EXISTS `b_group` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `C_SORT` int NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) NOT NULL DEFAULT 'N',
  `IS_SYSTEM` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SECURITY_POLICY` text,
  `STRING_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_group`
--

INSERT INTO `b_group` (`ID`, `TIMESTAMP_X`, `ACTIVE`, `C_SORT`, `ANONYMOUS`, `IS_SYSTEM`, `NAME`, `DESCRIPTION`, `SECURITY_POLICY`, `STRING_ID`) VALUES
(1, NULL, 'Y', 1, 'N', 'Y', 'Администраторы', 'Полный доступ к управлению сайтом.', NULL, NULL),
(2, NULL, 'Y', 2, 'Y', 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', NULL, NULL),
(3, NULL, 'Y', 3, 'N', 'Y', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE'),
(4, NULL, 'Y', 4, 'N', 'Y', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE_AUTHORITY');

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_collection_task`
--

CREATE TABLE IF NOT EXISTS `b_group_collection_task` (
  `GROUP_ID` int NOT NULL,
  `TASK_ID` int NOT NULL,
  `COLLECTION_ID` int NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_subordinate`
--

CREATE TABLE IF NOT EXISTS `b_group_subordinate` (
  `ID` int NOT NULL,
  `AR_SUBGROUP_ID` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_task`
--

CREATE TABLE IF NOT EXISTS `b_group_task` (
  `GROUP_ID` int NOT NULL,
  `TASK_ID` int NOT NULL,
  `EXTERNAL_ID` varchar(50) DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity`
--

CREATE TABLE IF NOT EXISTS `b_hlblock_entity` (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_hlblock_entity`
--

INSERT INTO `b_hlblock_entity` (`ID`, `NAME`, `TABLE_NAME`) VALUES
(1, 'HLUSERS', 'hlusers');

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity_lang`
--

CREATE TABLE IF NOT EXISTS `b_hlblock_entity_lang` (
  `ID` int UNSIGNED NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_hlblock_entity_lang`
--

INSERT INTO `b_hlblock_entity_lang` (`ID`, `LID`, `NAME`) VALUES
(1, 'ru', 'Пользователи'),
(1, 'en', 'Users');

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity_rights`
--

CREATE TABLE IF NOT EXISTS `b_hlblock_entity_rights` (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `HL_ID` int UNSIGNED NOT NULL,
  `TASK_ID` int UNSIGNED NOT NULL,
  `ACCESS_CODE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hot_keys`
--

CREATE TABLE IF NOT EXISTS `b_hot_keys` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) NOT NULL,
  `CODE_ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_hot_keys`
--

INSERT INTO `b_hot_keys` (`ID`, `KEYS_STRING`, `CODE_ID`, `USER_ID`) VALUES
(1, 'Ctrl+Alt+85', 139, 0),
(2, 'Ctrl+Alt+80', 17, 0),
(3, 'Ctrl+Alt+70', 120, 0),
(4, 'Ctrl+Alt+68', 117, 0),
(5, 'Ctrl+Alt+81', 3, 0),
(6, 'Ctrl+Alt+75', 106, 0),
(7, 'Ctrl+Alt+79', 133, 0),
(8, 'Ctrl+Alt+70', 121, 0),
(9, 'Ctrl+Alt+69', 118, 0),
(10, 'Ctrl+Shift+83', 87, 0),
(11, 'Ctrl+Shift+88', 88, 0),
(12, 'Ctrl+Shift+76', 89, 0),
(13, 'Ctrl+Alt+85', 139, 1),
(14, 'Ctrl+Alt+80', 17, 1),
(15, 'Ctrl+Alt+70', 120, 1),
(16, 'Ctrl+Alt+68', 117, 1),
(17, 'Ctrl+Alt+81', 3, 1),
(18, 'Ctrl+Alt+75', 106, 1),
(19, 'Ctrl+Alt+79', 133, 1),
(20, 'Ctrl+Alt+70', 121, 1),
(21, 'Ctrl+Alt+69', 118, 1),
(22, 'Ctrl+Shift+83', 87, 1),
(23, 'Ctrl+Shift+88', 88, 1),
(24, 'Ctrl+Shift+76', 89, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_hot_keys_code`
--

CREATE TABLE IF NOT EXISTS `b_hot_keys_code` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TITLE_OBJ` varchar(50) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `IS_CUSTOM` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_hot_keys_code`
--

INSERT INTO `b_hot_keys_code` (`ID`, `CLASS_NAME`, `CODE`, `NAME`, `COMMENTS`, `TITLE_OBJ`, `URL`, `IS_CUSTOM`) VALUES
(3, 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', 0),
(5, 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', 0),
(6, 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', 0),
(7, 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', 0),
(8, 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', 0),
(9, 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', 0),
(10, 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', 0),
(12, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', 0),
(13, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', 0),
(14, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', 0),
(15, 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', 0),
(17, 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', 0),
(19, 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', 0),
(20, 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', 0),
(54, 'top_panel_org_fav', '', '-=AUTONAME=-', NULL, 'top_panel_org_fav', NULL, 0),
(55, 'top_panel_module_settings', '', '-=AUTONAME=-', NULL, 'top_panel_module_settings', '', 0),
(56, 'top_panel_interface_settings', '', '-=AUTONAME=-', NULL, 'top_panel_interface_settings', '', 0),
(57, 'top_panel_help', '', '-=AUTONAME=-', NULL, 'top_panel_help', '', 0),
(58, 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', NULL, 'top_panel_bizproc_tasks', '', 0),
(59, 'top_panel_add_fav', '', '-=AUTONAME=-', NULL, 'top_panel_add_fav', NULL, 0),
(60, 'top_panel_create_page', '', '-=AUTONAME=-', NULL, 'top_panel_create_page', '', 0),
(62, 'top_panel_create_folder', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder', '', 0),
(63, 'top_panel_edit_page', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page', '', 0),
(64, 'top_panel_page_prop', '', '-=AUTONAME=-', NULL, 'top_panel_page_prop', '', 0),
(65, 'top_panel_edit_page_html', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_html', '', 0),
(67, 'top_panel_edit_page_php', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_php', '', 0),
(68, 'top_panel_del_page', '', '-=AUTONAME=-', NULL, 'top_panel_del_page', '', 0),
(69, 'top_panel_folder_prop', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop', '', 0),
(70, 'top_panel_access_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_access_folder_new', '', 0),
(71, 'main_top_panel_struct_panel', '', '-=AUTONAME=-', NULL, 'main_top_panel_struct_panel', '', 0),
(72, 'top_panel_cache_page', '', '-=AUTONAME=-', NULL, 'top_panel_cache_page', '', 0),
(73, 'top_panel_cache_comp', '', '-=AUTONAME=-', NULL, 'top_panel_cache_comp', '', 0),
(74, 'top_panel_cache_not', '', '-=AUTONAME=-', NULL, 'top_panel_cache_not', '', 0),
(75, 'top_panel_edit_mode', '', '-=AUTONAME=-', NULL, 'top_panel_edit_mode', '', 0),
(76, 'top_panel_templ_site_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site_css', '', 0),
(77, 'top_panel_templ_templ_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_templ_css', '', 0),
(78, 'top_panel_templ_site', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site', '', 0),
(81, 'top_panel_debug_time', '', '-=AUTONAME=-', NULL, 'top_panel_debug_time', '', 0),
(82, 'top_panel_debug_incl', '', '-=AUTONAME=-', NULL, 'top_panel_debug_incl', '', 0),
(83, 'top_panel_debug_sql', '', '-=AUTONAME=-', NULL, 'top_panel_debug_sql', NULL, 0),
(84, 'top_panel_debug_compr', '', '-=AUTONAME=-', NULL, 'top_panel_debug_compr', '', 0),
(85, 'MTP_SHORT_URI1', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI1', '', 0),
(86, 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI_LIST', '', 0),
(87, 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKER_ADD', '', 0),
(88, 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS_SHOW', '', 0),
(89, 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_CUR_STICKER_LIST', '', 0),
(90, 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_ALL_STICKER_LIST', '', 0),
(91, 'top_panel_menu', 'var d=BX(\"bx-panel-menu\"); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-menu', '', 0),
(92, 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(93, 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-view-tab', '', 0),
(94, 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(96, 'top_panel_folder_prop_new', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop_new', '', 0),
(97, 'main_top_panel_structure', '', '-=AUTONAME=-', NULL, 'main_top_panel_structure', '', 0),
(98, 'top_panel_clear_cache', '', '-=AUTONAME=-', NULL, 'top_panel_clear_cache', '', 0),
(99, 'top_panel_templ', '', '-=AUTONAME=-', NULL, 'top_panel_templ', '', 0),
(100, 'top_panel_debug', '', '-=AUTONAME=-', NULL, 'top_panel_debug', '', 0),
(101, 'MTP_SHORT_URI', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI', '', 0),
(102, 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS', '', 0),
(103, 'top_panel_settings', '', '-=AUTONAME=-', NULL, 'top_panel_settings', '', 0),
(104, 'top_panel_fav', '', '-=AUTONAME=-', NULL, 'top_panel_fav', '', 0),
(106, 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', 0),
(107, 'top_panel_edit_new', '', '-=AUTONAME=-', NULL, 'top_panel_edit_new', '', 0),
(108, 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_CREATE_WITH_WF', '', 0),
(109, 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_EDIT_WITH_WF', '', 0),
(110, 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_HISTORY', '', 0),
(111, 'top_panel_create_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_new', '', 0),
(112, 'top_panel_create_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder_new', '', 0),
(116, 'bx-panel-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-toggle', '', 0),
(117, 'bx-panel-small-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-small-toggle', '', 0),
(118, 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', NULL, 'bx-panel-expander', '', 0),
(119, 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-hider', '', 0),
(120, 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', 0),
(121, 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', 0),
(133, 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', 0),
(135, 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', 0),
(136, 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', 0),
(137, 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', 0),
(138, 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', 0),
(139, 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock`
--

CREATE TABLE IF NOT EXISTS `b_iblock` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) NOT NULL,
  `LID` char(2) NOT NULL,
  `CODE` varchar(50) DEFAULT NULL,
  `API_CODE` varchar(50) DEFAULT NULL,
  `REST_ON` char(1) NOT NULL DEFAULT 'N',
  `NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) DEFAULT NULL,
  `PICTURE` int DEFAULT NULL,
  `DESCRIPTION` text,
  `DESCRIPTION_TYPE` char(4) NOT NULL DEFAULT 'text',
  `RSS_TTL` int NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int DEFAULT NULL,
  `RSS_FILE_DAYS` int DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) DEFAULT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  `INDEX_ELEMENT` char(1) NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) DEFAULT NULL,
  `LIST_MODE` char(1) DEFAULT NULL,
  `RIGHTS_MODE` char(1) DEFAULT NULL,
  `SECTION_PROPERTY` char(1) DEFAULT NULL,
  `PROPERTY_INDEX` char(1) DEFAULT NULL,
  `VERSION` int NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) DEFAULT NULL,
  `SECTION_NAME` varchar(100) DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_api_code` (`API_CODE`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_cache`
--

CREATE TABLE IF NOT EXISTS `b_iblock_cache` (
  `CACHE_KEY` varchar(35) NOT NULL,
  `CACHE` longtext NOT NULL,
  `CACHE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element`
--

CREATE TABLE IF NOT EXISTS `b_iblock_element` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int DEFAULT NULL,
  `IBLOCK_ID` int NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `NAME` varchar(255) NOT NULL,
  `PREVIEW_PICTURE` int DEFAULT NULL,
  `PREVIEW_TEXT` text,
  `PREVIEW_TEXT_TYPE` varchar(4) NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int DEFAULT NULL,
  `DETAIL_TEXT` longtext,
  `DETAIL_TEXT_TYPE` varchar(4) NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text,
  `WF_STATUS_ID` int DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int DEFAULT NULL,
  `WF_NEW` char(1) DEFAULT NULL,
  `WF_LOCKED_BY` int DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text,
  `IN_SECTIONS` char(1) NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `TAGS` varchar(255) DEFAULT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int DEFAULT NULL,
  `SHOW_COUNTER` int DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_iprop`
--

CREATE TABLE IF NOT EXISTS `b_iblock_element_iprop` (
  `IBLOCK_ID` int NOT NULL,
  `SECTION_ID` int NOT NULL,
  `ELEMENT_ID` int NOT NULL,
  `IPROP_ID` int NOT NULL,
  `VALUE` text NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_lock`
--

CREATE TABLE IF NOT EXISTS `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_property`
--

CREATE TABLE IF NOT EXISTS `b_iblock_element_property` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int NOT NULL,
  `IBLOCK_ELEMENT_ID` int NOT NULL,
  `VALUE` text NOT NULL,
  `VALUE_TYPE` char(4) NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_val` (`VALUE`(50),`IBLOCK_PROPERTY_ID`,`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_right`
--

CREATE TABLE IF NOT EXISTS `b_iblock_element_right` (
  `IBLOCK_ID` int NOT NULL,
  `SECTION_ID` int NOT NULL,
  `ELEMENT_ID` int NOT NULL,
  `RIGHT_ID` int NOT NULL,
  `IS_INHERITED` char(1) NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_fields`
--

CREATE TABLE IF NOT EXISTS `b_iblock_fields` (
  `IBLOCK_ID` int NOT NULL,
  `FIELD_ID` varchar(50) NOT NULL,
  `IS_REQUIRED` char(1) DEFAULT NULL,
  `DEFAULT_VALUE` longtext,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_group`
--

CREATE TABLE IF NOT EXISTS `b_iblock_group` (
  `IBLOCK_ID` int NOT NULL,
  `GROUP_ID` int NOT NULL,
  `PERMISSION` char(1) NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_iblock_iprop`
--

CREATE TABLE IF NOT EXISTS `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int NOT NULL,
  `IPROP_ID` int NOT NULL,
  `VALUE` text NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_iproperty`
--

CREATE TABLE IF NOT EXISTS `b_iblock_iproperty` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int NOT NULL,
  `CODE` varchar(50) NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `TEMPLATE` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_messages`
--

CREATE TABLE IF NOT EXISTS `b_iblock_messages` (
  `IBLOCK_ID` int NOT NULL,
  `MESSAGE_ID` varchar(50) NOT NULL,
  `MESSAGE_TEXT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_offers_tmp`
--

CREATE TABLE IF NOT EXISTS `b_iblock_offers_tmp` (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int UNSIGNED NOT NULL,
  `OFFERS_IBLOCK_ID` int UNSIGNED NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_property`
--

CREATE TABLE IF NOT EXISTS `b_iblock_property` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IBLOCK_ID` int NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int NOT NULL DEFAULT '500',
  `CODE` varchar(50) DEFAULT NULL,
  `DEFAULT_VALUE` text,
  `PROPERTY_TYPE` char(1) NOT NULL DEFAULT 'S',
  `ROW_COUNT` int NOT NULL DEFAULT '1',
  `COL_COUNT` int NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) DEFAULT NULL,
  `FILE_TYPE` varchar(200) DEFAULT NULL,
  `MULTIPLE_CNT` int DEFAULT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  `LINK_IBLOCK_ID` int DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) DEFAULT NULL,
  `SEARCHABLE` char(1) NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) DEFAULT NULL,
  `VERSION` int NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) DEFAULT NULL,
  `USER_TYPE_SETTINGS` text,
  `HINT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_property_enum`
--

CREATE TABLE IF NOT EXISTS `b_iblock_property_enum` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `DEF` char(1) NOT NULL DEFAULT 'N',
  `SORT` int NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) NOT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_property_feature`
--

CREATE TABLE IF NOT EXISTS `b_iblock_property_feature` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `FEATURE_ID` varchar(100) NOT NULL,
  `IS_ENABLED` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_property_feature` (`PROPERTY_ID`,`MODULE_ID`,`FEATURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_right`
--

CREATE TABLE IF NOT EXISTS `b_iblock_right` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int NOT NULL,
  `GROUP_CODE` varchar(50) NOT NULL,
  `ENTITY_TYPE` varchar(32) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `DO_INHERIT` char(1) NOT NULL,
  `TASK_ID` int NOT NULL,
  `OP_SREAD` char(1) NOT NULL,
  `OP_EREAD` char(1) NOT NULL,
  `XML_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_rss`
--

CREATE TABLE IF NOT EXISTS `b_iblock_rss` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int NOT NULL,
  `NODE` varchar(50) NOT NULL,
  `NODE_VALUE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section`
--

CREATE TABLE IF NOT EXISTS `b_iblock_section` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIED_BY` int DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int DEFAULT NULL,
  `IBLOCK_ID` int NOT NULL,
  `IBLOCK_SECTION_ID` int DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int NOT NULL DEFAULT '500',
  `NAME` varchar(255) NOT NULL,
  `PICTURE` int DEFAULT NULL,
  `LEFT_MARGIN` int DEFAULT NULL,
  `RIGHT_MARGIN` int DEFAULT NULL,
  `DEPTH_LEVEL` int DEFAULT NULL,
  `DESCRIPTION` text,
  `DESCRIPTION_TYPE` char(4) NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text,
  `CODE` varchar(255) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  `DETAIL_PICTURE` int DEFAULT NULL,
  `SOCNET_GROUP_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`),
  KEY `ix_iblock_section_left_margin2` (`IBLOCK_ID`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_right_margin2` (`IBLOCK_ID`,`RIGHT_MARGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_element`
--

CREATE TABLE IF NOT EXISTS `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int NOT NULL,
  `IBLOCK_ELEMENT_ID` int NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_iprop`
--

CREATE TABLE IF NOT EXISTS `b_iblock_section_iprop` (
  `IBLOCK_ID` int NOT NULL,
  `SECTION_ID` int NOT NULL,
  `IPROP_ID` int NOT NULL,
  `VALUE` text NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_property`
--

CREATE TABLE IF NOT EXISTS `b_iblock_section_property` (
  `IBLOCK_ID` int NOT NULL,
  `SECTION_ID` int NOT NULL,
  `PROPERTY_ID` int NOT NULL,
  `SMART_FILTER` char(1) DEFAULT NULL,
  `DISPLAY_TYPE` char(1) DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) DEFAULT NULL,
  `FILTER_HINT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_right`
--

CREATE TABLE IF NOT EXISTS `b_iblock_section_right` (
  `IBLOCK_ID` int NOT NULL,
  `SECTION_ID` int NOT NULL,
  `RIGHT_ID` int NOT NULL,
  `IS_INHERITED` char(1) NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_sequence`
--

CREATE TABLE IF NOT EXISTS `b_iblock_sequence` (
  `IBLOCK_ID` int NOT NULL,
  `CODE` varchar(50) NOT NULL,
  `SEQ_VALUE` int DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_site`
--

CREATE TABLE IF NOT EXISTS `b_iblock_site` (
  `IBLOCK_ID` int NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_type`
--

CREATE TABLE IF NOT EXISTS `b_iblock_type` (
  `ID` varchar(50) NOT NULL,
  `SECTIONS` char(1) NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) DEFAULT NULL,
  `IN_RSS` char(1) NOT NULL DEFAULT 'N',
  `SORT` int NOT NULL DEFAULT '500',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_iblock_type`
--

INSERT INTO `b_iblock_type` (`ID`, `SECTIONS`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `IN_RSS`, `SORT`) VALUES
('rest_entity', 'Y', NULL, NULL, 'N', 1000);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_type_lang`
--

CREATE TABLE IF NOT EXISTS `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `SECTION_NAME` varchar(100) DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_iblock_type_lang`
--

INSERT INTO `b_iblock_type_lang` (`IBLOCK_TYPE_ID`, `LID`, `NAME`, `SECTION_NAME`, `ELEMENT_NAME`) VALUES
('rest_entity', 'ru', 'Хранилище данных для приложений', 'Разделы', 'Элементы');

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing`
--

CREATE TABLE IF NOT EXISTS `b_landing` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) DEFAULT NULL,
  `RULE` varchar(255) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `DELETED` char(1) NOT NULL DEFAULT 'N',
  `PUBLIC` char(1) NOT NULL DEFAULT 'Y',
  `SYS` char(1) NOT NULL DEFAULT 'N',
  `VIEWS` int NOT NULL DEFAULT '0',
  `TITLE` varchar(255) NOT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TPL_ID` int DEFAULT NULL,
  `TPL_CODE` varchar(255) DEFAULT NULL,
  `SITE_ID` int NOT NULL,
  `SITEMAP` char(1) NOT NULL DEFAULT 'N',
  `FOLDER` char(1) NOT NULL DEFAULT 'N',
  `FOLDER_ID` int DEFAULT NULL,
  `SEARCH_CONTENT` mediumtext,
  `VERSION` int NOT NULL DEFAULT '1',
  `HISTORY_STEP` int NOT NULL DEFAULT '0',
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  `DATE_PUBLIC` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_LAND_CODE` (`CODE`),
  KEY `IX_B_LAND_ACTIVE` (`ACTIVE`),
  KEY `IX_B_LAND_DELETED` (`DELETED`),
  KEY `IX_B_LAND_SYS` (`SYS`),
  KEY `IX_B_LAND_XML_ID` (`XML_ID`),
  KEY `IX_B_LAND_SITE_ID` (`SITE_ID`),
  KEY `IX_B_LAND_SITEMAP` (`SITEMAP`),
  KEY `IX_B_LAND_FOLDER` (`FOLDER`),
  KEY `IX_B_LAND_FOLDER_ID` (`FOLDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_binding`
--

CREATE TABLE IF NOT EXISTS `b_landing_binding` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  `BINDING_ID` varchar(50) NOT NULL,
  `BINDING_TYPE` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_BINDING` (`BINDING_ID`,`BINDING_TYPE`),
  KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_B_BINDING_TYPE` (`BINDING_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_block`
--

CREATE TABLE IF NOT EXISTS `b_landing_block` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int DEFAULT NULL,
  `LID` int NOT NULL,
  `CODE` varchar(255) NOT NULL,
  `TPL_CODE` varchar(255) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) NOT NULL,
  `ANCHOR` varchar(255) DEFAULT NULL,
  `SORT` int DEFAULT '500',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `PUBLIC` char(1) NOT NULL DEFAULT 'Y',
  `DELETED` char(1) NOT NULL DEFAULT 'N',
  `DESIGNED` char(1) NOT NULL DEFAULT 'N',
  `ACCESS` char(1) NOT NULL DEFAULT 'X',
  `SOURCE_PARAMS` mediumtext,
  `CONTENT` mediumtext NOT NULL,
  `SEARCH_CONTENT` mediumtext,
  `ASSETS` text,
  `FAVORITE_META` text,
  `HISTORY_STEP_DESIGNER` int NOT NULL DEFAULT '0',
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_BLOCK_LID` (`LID`),
  KEY `IX_B_BLOCK_LID_PUBLIC` (`LID`,`PUBLIC`),
  KEY `IX_B_BLOCK_CODE` (`CODE`),
  KEY `IX_B_BLOCK_ACTIVE` (`ACTIVE`),
  KEY `IX_B_BLOCK_PUBLIC` (`PUBLIC`,`DATE_CREATE`),
  KEY `IX_B_BLOCK_DELETED` (`DELETED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_block_last_used`
--

CREATE TABLE IF NOT EXISTS `b_landing_block_last_used` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `CODE` varchar(255) NOT NULL,
  `DATE_CREATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_BLOCK_LU_USER` (`USER_ID`),
  KEY `IX_B_BLOCK_LU_CODE` (`CODE`),
  KEY `IX_B_BLOCK_LU_USER_CODE` (`USER_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_chat`
--

CREATE TABLE IF NOT EXISTS `b_landing_chat` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CHAT_ID` int NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `AVATAR` int DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHAT` (`CHAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_chat_binding`
--

CREATE TABLE IF NOT EXISTS `b_landing_chat_binding` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `INTERNAL_CHAT_ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHAT` (`INTERNAL_CHAT_ID`),
  KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_cookies_agreement`
--

CREATE TABLE IF NOT EXISTS `b_landing_cookies_agreement` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SITE_ID` int NOT NULL,
  `CODE` varchar(50) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `CONTENT` mediumtext NOT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE` (`SITE_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_demo`
--

CREATE TABLE IF NOT EXISTS `b_landing_demo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) NOT NULL,
  `APP_CODE` varchar(255) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `TYPE` varchar(10) NOT NULL,
  `TPL_TYPE` char(1) NOT NULL,
  `SHOW_IN_LIST` char(1) NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PREVIEW_URL` varchar(255) DEFAULT NULL,
  `PREVIEW` varchar(255) DEFAULT NULL,
  `PREVIEW2X` varchar(255) DEFAULT NULL,
  `PREVIEW3X` varchar(255) DEFAULT NULL,
  `MANIFEST` mediumtext,
  `LANG` text,
  `SITE_TEMPLATE_ID` varchar(255) DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_DEMO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DEMO_SHOW_IN_LIST` (`SHOW_IN_LIST`),
  KEY `IX_B_DEMO_XML_ID` (`XML_ID`),
  KEY `IX_B_DEMO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_DEMO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_designer_repo`
--

CREATE TABLE IF NOT EXISTS `b_landing_designer_repo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `SORT` int DEFAULT '100',
  `HTML` text NOT NULL,
  `MANIFEST` text NOT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_XML_ID` (`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_domain`
--

CREATE TABLE IF NOT EXISTS `b_landing_domain` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `DOMAIN` varchar(255) NOT NULL,
  `PREV_DOMAIN` varchar(255) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `PROTOCOL` varchar(10) NOT NULL,
  `PROVIDER` varchar(50) DEFAULT NULL,
  `FAIL_COUNT` int DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_DOMAIN_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DOMAIN_DOMAIN` (`DOMAIN`),
  KEY `IX_B_DOMAIN_PROVIDER` (`PROVIDER`),
  KEY `IX_B_DOMAIN_XML_ID` (`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_entity_lock`
--

CREATE TABLE IF NOT EXISTS `b_landing_entity_lock` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  `LOCK_TYPE` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_TYPE` (`LOCK_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_entity_rights`
--

CREATE TABLE IF NOT EXISTS `b_landing_entity_rights` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  `TASK_ID` int NOT NULL,
  `ACCESS_CODE` varchar(50) NOT NULL,
  `ROLE_ID` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_ROLE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_file`
--

CREATE TABLE IF NOT EXISTS `b_landing_file` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  `FILE_ID` int NOT NULL,
  `TEMP` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_FILE` (`FILE_ID`),
  KEY `IX_TEMP` (`TEMP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_filter_block`
--

CREATE TABLE IF NOT EXISTS `b_landing_filter_block` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FILTER_ID` int NOT NULL,
  `BLOCK_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_BLOCK` (`FILTER_ID`,`BLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_filter_entity`
--

CREATE TABLE IF NOT EXISTS `b_landing_filter_entity` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SOURCE_ID` varchar(255) NOT NULL,
  `FILTER_HASH` char(32) NOT NULL,
  `FILTER` text,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_HASH` (`FILTER_HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_folder`
--

CREATE TABLE IF NOT EXISTS `b_landing_folder` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int DEFAULT NULL,
  `SITE_ID` int NOT NULL,
  `INDEX_ID` int DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `DELETED` char(1) NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) NOT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FOLDER_SITE_ID` (`SITE_ID`),
  KEY `IX_B_FOLDER_ACTIVE` (`ACTIVE`),
  KEY `IX_B_FOLDER_DELETED` (`DELETED`),
  KEY `IX_B_FOLDER_PARENT_ID` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_history`
--

CREATE TABLE IF NOT EXISTS `b_landing_history` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` char(1) NOT NULL DEFAULT 'L',
  `ENTITY_ID` int NOT NULL,
  `ACTION` text NOT NULL,
  `ACTION_PARAMS` text NOT NULL,
  `MULTIPLY_ID` int DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_LAND_HISTORY_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_history_step`
--

CREATE TABLE IF NOT EXISTS `b_landing_history_step` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` char(1) NOT NULL DEFAULT 'L',
  `ENTITY_ID` int NOT NULL,
  `STEP` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_HISTORY_STEP` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_hook_data`
--

CREATE TABLE IF NOT EXISTS `b_landing_hook_data` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  `HOOK` varchar(50) NOT NULL,
  `CODE` varchar(50) NOT NULL,
  `VALUE` text,
  `PUBLIC` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `K_HOOK_CODE` (`HOOK`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_placement`
--

CREATE TABLE IF NOT EXISTS `b_landing_placement` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `APP_ID` int DEFAULT NULL,
  `PLACEMENT` varchar(255) NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) NOT NULL,
  `TITLE` varchar(255) DEFAULT '',
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_repo`
--

CREATE TABLE IF NOT EXISTS `b_landing_repo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) NOT NULL,
  `APP_CODE` varchar(255) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SECTIONS` varchar(255) DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) DEFAULT NULL,
  `PREVIEW` varchar(255) DEFAULT NULL,
  `MANIFEST` text,
  `CONTENT` text NOT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_REPO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_REPO_XML_ID` (`XML_ID`),
  KEY `IX_B_REPO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_REPO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_role`
--

CREATE TABLE IF NOT EXISTS `b_landing_role` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ACCESS_CODES` text,
  `ADDITIONAL_RIGHTS` text,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_ROLE_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_site`
--

CREATE TABLE IF NOT EXISTS `b_landing_site` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `DELETED` char(1) NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) NOT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TYPE` varchar(50) NOT NULL DEFAULT 'PAGE',
  `TPL_ID` int DEFAULT NULL,
  `TPL_CODE` varchar(255) DEFAULT NULL,
  `DOMAIN_ID` int NOT NULL,
  `SMN_SITE_ID` char(2) DEFAULT NULL,
  `LANDING_ID_INDEX` int DEFAULT NULL,
  `LANDING_ID_404` int DEFAULT NULL,
  `LANDING_ID_503` int DEFAULT NULL,
  `LANG` char(2) DEFAULT NULL,
  `SPECIAL` char(1) NOT NULL DEFAULT 'N',
  `VERSION` int DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE_CODE` (`CODE`),
  KEY `IX_B_SITE_ACTIVE` (`ACTIVE`),
  KEY `IX_B_SITE_DELETED` (`DELETED`),
  KEY `IX_B_SITE_XML_ID` (`XML_ID`),
  KEY `IX_B_SITE_SPECIAL` (`SPECIAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_syspage`
--

CREATE TABLE IF NOT EXISTS `b_landing_syspage` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SITE_ID` int NOT NULL,
  `TYPE` varchar(50) NOT NULL,
  `LANDING_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_ID` (`SITE_ID`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_template`
--

CREATE TABLE IF NOT EXISTS `b_landing_template` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `TITLE` varchar(255) NOT NULL,
  `SORT` int DEFAULT '100',
  `XML_ID` varchar(255) DEFAULT NULL,
  `CONTENT` text NOT NULL,
  `AREA_COUNT` int NOT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_landing_template`
--

INSERT INTO `b_landing_template` (`ID`, `ACTIVE`, `TITLE`, `SORT`, `XML_ID`, `CONTENT`, `AREA_COUNT`, `CREATED_BY_ID`, `MODIFIED_BY_ID`, `DATE_CREATE`, `DATE_MODIFY`) VALUES
(1, 'Y', '#EMPTY#', 100, 'empty', '#CONTENT#', 0, 1, 1, '2024-10-22 18:24:22', '2024-10-22 18:24:22'),
(2, 'Y', '#SIDEBAR_LEFT#', 200, 'sidebar_left', '<div class=\"landing-layout-flex\">\n								<div class=\"landing-sidebar g-max-width-100x g-overflow-hidden\">#AREA_1#</div>\n								<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n							</div>', 1, 1, 1, '2024-10-22 18:24:22', '2024-10-22 18:24:22'),
(3, 'Y', '#SIDEBAR_RIGHT#', 300, 'sidebar_right', '<div class=\"landing-layout-flex sidebar-right\">\n								<div class=\"landing-sidebar g-max-width-100x\">#AREA_1#</div>\n								<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n							</div>', 1, 1, 1, '2024-10-22 18:24:22', '2024-10-22 18:24:22'),
(4, 'Y', '#HEADER_ONLY#', 400, 'header_only', '<div class=\"landing-header\">#AREA_1#</div> \n								<div class=\"landing-main\">#CONTENT#</div>', 1, 1, 1, '2024-10-22 18:24:22', '2024-10-22 18:24:22'),
(5, 'Y', '#HEADER_FOOTER#', 500, 'header_footer', '<div class=\"landing-header\">#AREA_1#</div> \n								<div class=\"landing-main\">#CONTENT#</div> \n							<div class=\"landing-footer\">#AREA_2#</div>', 2, 1, 1, '2024-10-22 18:24:22', '2024-10-22 18:24:22'),
(6, 'Y', '#WITHOUT_LEFT#', 600, 'without_left', '<div class=\"landing-header\">#AREA_1#</div>\n								<div class=\"landing-layout-flex without-left\">\n									<div class=\"landing-sidebar g-max-width-100x\">#AREA_2#</div>\n									<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n								</div>\n							<div class=\"landing-footer\">#AREA_3#</div>', 3, 1, 1, '2024-10-22 18:24:22', '2024-10-22 18:24:22'),
(7, 'Y', '#WITHOUT_RIGHT#', 700, 'without_right', '<div class=\"landing-header\">#AREA_1#</div>\n								<div class=\"landing-layout-flex\">\n									<div class=\"landing-sidebar g-max-width-100x\">#AREA_2#</div>\n									<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n								</div>\n							<div class=\"landing-footer\">#AREA_3#</div>', 3, 1, 1, '2024-10-22 18:24:22', '2024-10-22 18:24:22');

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_template_ref`
--

CREATE TABLE IF NOT EXISTS `b_landing_template_ref` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  `AREA` int NOT NULL,
  `LANDING_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `K_LANDING_ID` (`LANDING_ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_update_block`
--

CREATE TABLE IF NOT EXISTS `b_landing_update_block` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) NOT NULL,
  `LAST_BLOCK_ID` int DEFAULT '0',
  `PARAMS` text,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_urlchecker_host`
--

CREATE TABLE IF NOT EXISTS `b_landing_urlchecker_host` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int NOT NULL,
  `HOST` varchar(255) NOT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHECKER_STATUS_HOST` (`STATUS_ID`,`HOST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_urlchecker_status`
--

CREATE TABLE IF NOT EXISTS `b_landing_urlchecker_status` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `URL` varchar(255) NOT NULL,
  `HASH` char(32) NOT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHECKER_HASH` (`HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_urlchecker_whitelist`
--

CREATE TABLE IF NOT EXISTS `b_landing_urlchecker_whitelist` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DOMAIN` varchar(255) NOT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHECKER_DOMAIN` (`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_urlrewrite`
--

CREATE TABLE IF NOT EXISTS `b_landing_urlrewrite` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SITE_ID` int NOT NULL,
  `RULE` varchar(255) NOT NULL,
  `LANDING_ID` int NOT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_RULE` (`SITE_ID`,`RULE`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_view`
--

CREATE TABLE IF NOT EXISTS `b_landing_view` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `VIEWS` int NOT NULL,
  `FIRST_VIEW` datetime NOT NULL,
  `LAST_VIEW` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_VIEW_LIDUID` (`LID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_lang`
--

CREATE TABLE IF NOT EXISTS `b_lang` (
  `LID` char(2) NOT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `DEF` char(1) NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) NOT NULL,
  `DIR` varchar(50) NOT NULL,
  `FORMAT_DATE` varchar(50) DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) DEFAULT NULL,
  `FORMAT_NAME` varchar(255) DEFAULT NULL,
  `WEEK_START` int DEFAULT NULL,
  `CHARSET` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `DOC_ROOT` varchar(255) DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) DEFAULT NULL,
  `SITE_NAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `CULTURE_ID` int DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_lang`
--

INSERT INTO `b_lang` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `DIR`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `LANGUAGE_ID`, `DOC_ROOT`, `DOMAIN_LIMITED`, `SERVER_NAME`, `SITE_NAME`, `EMAIL`, `CULTURE_ID`) VALUES
('s1', 1, 'Y', 'Y', 'Название сайта', '/', NULL, NULL, NULL, NULL, NULL, 'ru', NULL, 'N', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_language`
--

CREATE TABLE IF NOT EXISTS `b_language` (
  `LID` char(2) NOT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `DEF` char(1) NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) NOT NULL,
  `FORMAT_DATE` varchar(50) DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) DEFAULT NULL,
  `FORMAT_NAME` varchar(255) DEFAULT NULL,
  `WEEK_START` int DEFAULT NULL,
  `CHARSET` varchar(255) DEFAULT NULL,
  `DIRECTION` char(1) DEFAULT NULL,
  `CULTURE_ID` int DEFAULT NULL,
  `CODE` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_language`
--

INSERT INTO `b_language` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `CULTURE_ID`, `CODE`) VALUES
('en', 2, 'N', 'Y', 'English', NULL, NULL, NULL, NULL, NULL, NULL, 2, 'en'),
('ru', 1, 'Y', 'Y', 'Russian', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `b_lang_domain`
--

CREATE TABLE IF NOT EXISTS `b_lang_domain` (
  `LID` char(2) NOT NULL,
  `DOMAIN` varchar(255) NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location`
--

CREATE TABLE IF NOT EXISTS `b_location` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) NOT NULL,
  `EXTERNAL_ID` varchar(255) DEFAULT NULL,
  `SOURCE_CODE` varchar(15) DEFAULT NULL,
  `LATITUDE` decimal(8,6) DEFAULT NULL,
  `LONGITUDE` decimal(9,6) DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `TYPE` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CODE` (`CODE`),
  UNIQUE KEY `IX_LOC_SE` (`EXTERNAL_ID`,`SOURCE_CODE`),
  KEY `IX_LOC_LAT` (`LATITUDE`),
  KEY `IX_LOC_LON` (`LONGITUDE`),
  KEY `IX_LOC_T` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_address`
--

CREATE TABLE IF NOT EXISTS `b_location_address` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LOCATION_ID` int DEFAULT '0',
  `LANGUAGE_ID` char(2) NOT NULL,
  `LATITUDE` decimal(8,6) DEFAULT NULL,
  `LONGITUDE` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_LOC_BLA_LOC` (`LOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_addr_fld`
--

CREATE TABLE IF NOT EXISTS `b_location_addr_fld` (
  `ADDRESS_ID` int NOT NULL,
  `TYPE` int NOT NULL,
  `VALUE` varchar(1024) DEFAULT NULL,
  `VALUE_NORMALIZED` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_addr_link`
--

CREATE TABLE IF NOT EXISTS `b_location_addr_link` (
  `ADDRESS_ID` int NOT NULL,
  `ENTITY_ID` varchar(100) NOT NULL,
  `ENTITY_TYPE` varchar(50) NOT NULL,
  PRIMARY KEY (`ADDRESS_ID`,`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IDX_BLAL_EI_ET` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_area`
--

CREATE TABLE IF NOT EXISTS `b_location_area` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(100) NOT NULL,
  `CODE` varchar(100) DEFAULT NULL,
  `SORT` int NOT NULL,
  `GEOMETRY` longtext,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TYPE` (`TYPE`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_location_area`
--

INSERT INTO `b_location_area` (`ID`, `TYPE`, `CODE`, `SORT`, `GEOMETRY`) VALUES
(1, 'CUSTOM_FIELDS', 'CRIMEA', 0, '{\"type\":\"Polygon\",\"coordinates\":[[[32.201579,45.396892],[32.2052178,45.3690507],[32.2090567,45.3553206],[32.2172905,45.3355145],[32.2240585,45.3025866],[32.235686,45.2758033],[32.2434204,45.2628881],[32.2625503,45.2383126],[32.2738567,45.2267674],[32.2996887,45.2054331],[32.329404,45.1867687],[32.3624492,45.1711247],[32.3982085,45.1587952],[32.4168995,45.1539484],[32.4554687,45.1470047],[32.4878048,45.1442331],[32.5164102,45.1327887],[32.5532795,45.1222016],[32.5918488,45.115254],[32.6313994,45.1120768],[32.6711947,45.1127297],[32.729727,45.1208441],[32.8314558,45.1507864],[32.853076,45.1219934],[32.8767811,45.0994253],[32.8902144,45.0890467],[32.9199297,45.0703442],[32.9451894,45.0580954],[32.9796287,45.0321305],[33.0110823,45.0148866],[33.0279839,45.0074406],[33.0637432,44.9950757],[33.0879643,44.989073],[33.1342119,44.9689946],[33.192902,44.9506562],[33.2511697,44.9416162],[33.2951871,44.9405202],[33.5542562,44.8402319],[33.5621787,44.8410979],[33.5671526,44.838601],[33.5736666,44.8238183],[33.5866523,44.807848],[33.6044231,44.8103433],[33.6586481,44.7965631],[33.6693271,44.7918226],[33.6774224,44.7858657],[33.6827993,44.7703386],[33.6355485,44.7529449],[33.6136625,44.7497551],[33.6148368,44.7391957],[33.6111957,44.738286],[33.6105707,44.7329396],[33.611606,44.7296545],[33.6146258,44.729927],[33.6161203,44.711976],[33.6589663,44.7142533],[33.6708014,44.7097439],[33.7006932,44.7148119],[33.7072434,44.7105734],[33.7051533,44.7086069],[33.7050933,44.7049158],[33.7145084,44.705868],[33.715643,44.715848],[33.7265921,44.716636],[33.7348624,44.7075832],[33.7462868,44.7010307],[33.7518027,44.6987863],[33.7615132,44.7009902],[33.7769711,44.690265],[33.7674787,44.6820761],[33.754625,44.6753399],[33.7518666,44.6637439],[33.7300323,44.6470751],[33.7254762,44.6401041],[33.7176817,44.6375914],[33.7168675,44.6332156],[33.7218757,44.631584],[33.7162703,44.6204383],[33.7272166,44.6085501],[33.7286926,44.6046812],[33.735653,44.6009246],[33.7419126,44.6053835],[33.7496197,44.60791],[33.7651672,44.6091022],[33.7795796,44.6131096],[33.7828306,44.6059825],[33.781845,44.5971035],[33.7872108,44.5856602],[33.7920091,44.5848619],[33.7951987,44.5802969],[33.8004378,44.5814222],[33.8056839,44.5753186],[33.8093847,44.5769972],[33.8114458,44.5738111],[33.8139036,44.5771175],[33.8173303,44.577274],[33.8272108,44.5712636],[33.8273394,44.563316],[33.8310821,44.5548411],[33.8345552,44.5499395],[33.8372152,44.548782],[33.8337314,44.5416787],[33.8394649,44.5384748],[33.8401482,44.5304315],[33.8494976,44.5306195],[33.8572702,44.5258757],[33.8456566,44.519124],[33.85315,44.5154015],[33.8603572,44.5067568],[33.868911,44.5073968],[33.8707581,44.5054113],[33.8673484,44.5025419],[33.8672494,44.5003522],[33.8736292,44.4926938],[33.8869091,44.4822103],[33.8971535,44.4787873],[33.8934902,44.4732254],[33.8972198,44.4692246],[33.9262025,44.4213251],[33.9094099,44.4188846],[33.9024805,44.4193681],[33.8980569,44.4214726],[33.8828051,44.4210572],[33.8706281,44.4188467],[33.8591887,44.4199143],[33.8469623,44.4171293],[33.8292787,44.4089158],[33.8245729,44.411664],[33.8140922,44.4100258],[33.797829,44.4041246],[33.781585,44.4057444],[33.7840022,44.402866],[33.7855572,44.3968776],[33.7623083,44.3900862],[33.696591,44.1910397],[33.7357422,44.1858835],[33.7755079,44.184598],[33.8151473,44.1872073],[33.8567133,44.1943491],[33.9116725,44.1858835],[33.9514382,44.184598],[33.9910776,44.1872073],[34.0298524,44.1936623],[34.0670401,44.2038415],[34.0927335,44.2136353],[34.1417952,44.2137713],[34.2003274,44.2220125],[34.2375152,44.2321868],[34.2552959,44.2386127],[34.2888171,44.2539909],[34.3191029,44.2724903],[34.3328536,44.282804],[34.3551268,44.3032135],[34.3834932,44.3128241],[34.4170144,44.3281829],[34.4325985,44.3370516],[34.4579166,44.3546118],[34.4947227,44.3688605],[34.5111166,44.3769423],[34.5414024,44.3954029],[34.5678887,44.4166315],[34.590082,44.4402299],[34.607569,44.4657558],[34.6144422,44.4790935],[34.6220858,44.4994412],[34.6450122,44.5206113],[34.6661359,44.547163],[34.7006849,44.5628297],[34.735755,44.5848013],[34.7764494,44.5934492],[34.8085382,44.6038903],[34.8324881,44.6023351],[34.8722834,44.6029938],[34.9291911,44.6108698],[34.963432,44.598995],[35.0012394,44.590126],[35.0602428,44.5838827],[35.1197957,44.5863196],[35.1774068,44.5973337],[35.1957581,44.6028408],[35.2306662,44.6164595],[35.2586785,44.6310857],[35.2852182,44.6416945],[35.3171962,44.6585585],[35.3318979,44.668113],[35.3583842,44.6892424],[35.3805775,44.7127305],[35.3975542,44.7373268],[35.4116276,44.7442895],[35.4626979,44.7517865],[35.4998857,44.7618689],[35.5176664,44.7682366],[35.5511876,44.7834757],[35.5667717,44.7922754],[35.5952241,44.8120281],[35.6196208,44.8343376],[35.6322493,44.8491155],[35.670408,44.8272773],[35.7048906,44.8131714],[35.7230689,44.8074017],[35.7803291,44.7955387],[35.8397932,44.7921897],[35.8794326,44.7947719],[35.9241291,44.8026019],[35.9742343,44.8026778],[36.013533,44.8071728],[36.051603,44.8154218],[36.1028199,44.8336163],[36.1372853,44.8256548],[36.1764365,44.8205545],[36.2162022,44.8192829],[36.2558416,44.821864],[36.3134527,44.8328333],[36.3630225,44.8503296],[36.4154063,44.8528108],[36.454181,44.8591924],[36.4913688,44.869256],[36.5262768,44.8828121],[36.5426707,44.8908227],[36.5729565,44.9091205],[36.5994428,44.9301619],[36.6097225,44.9406672],[36.5679872,45.0506562],[36.5428648,45.1340402],[36.5338353,45.1751824],[36.530486,45.1992024],[36.5542469,45.2216309],[36.5859391,45.2441721],[36.5941742,45.252542],[36.5937019,45.2823897],[36.6030245,45.3093876],[36.6227602,45.3280113],[36.6635019,45.3599397],[36.6815681,45.4566115],[36.6684499,45.6266206],[36.583205,45.635158],[36.3387005,45.6715002],[36.1353542,45.6476547],[36.1034835,45.638376],[36.0723795,45.6256431],[36.028427,45.6242237],[35.9817734,45.6167329],[35.9534794,45.6280572],[35.9215589,45.6372534],[35.8711492,45.6454011],[35.8366954,45.6469342],[35.8022501,45.6453103],[35.7518847,45.6370298],[35.7200141,45.6277494],[35.6901483,45.6156372],[35.6627986,45.6008987],[35.6384328,45.5837842],[35.6174678,45.5645842],[35.6002625,45.5436256],[35.587111,45.5212652],[35.5764936,45.4903874],[35.5747509,45.4895333],[35.5487365,45.5142538],[35.5242787,45.5313252],[35.4968497,45.5460096],[35.459695,45.5603381],[35.4555162,45.5730522],[35.4443574,45.5959169],[35.4290297,45.6175579],[35.4198817,45.6278035],[35.3869834,45.6557223],[35.3609843,45.6715964],[35.3373014,45.6827713],[35.3237297,45.7127561],[35.3165721,45.7237303],[35.299254,45.7445762],[35.2663557,45.7724368],[35.2334204,45.7917299],[34.9750748,45.7619919],[34.9597746,45.7565682],[34.9411705,45.7658247],[34.876163,45.7904304],[34.7990874,45.8104643],[34.8021689,45.9006479],[34.7540112,45.9088363],[34.6699108,45.9676437],[34.628541,45.9864034],[34.6011392,45.9941699],[34.5816123,45.9956678],[34.5611691,45.9943843],[34.5542176,45.9904652],[34.5448398,45.9790277],[34.5443875,45.9761218],[34.5269998,45.9590021],[34.5109022,45.9480281],[34.4985264,45.9425606],[34.4762212,45.9441393],[34.459176,45.9512094],[34.4430184,45.9618096],[34.4233801,45.9786713],[34.4131796,45.9897359],[34.4107666,45.9992636],[34.4049875,46.0092864],[34.3471695,46.0549489],[34.3326403,46.0598467],[34.320021,46.0682092],[34.2648618,46.0548851],[34.2521968,46.0531749],[34.1843736,46.0668628],[34.1450093,46.0866862],[34.1359107,46.0966617],[34.1218931,46.1057194],[34.0809285,46.117556],[34.0695052,46.1166994],[34.0526389,46.1091293],[33.9982336,46.1264504],[33.971714,46.1411991],[33.9405553,46.1546515],[33.8973358,46.1706248],[33.86133,46.1945116],[33.8486859,46.1996667],[33.811324,46.203796],[33.7968936,46.2030156],[33.7726027,46.1976249],[33.7503231,46.18772],[33.7399776,46.1852474],[33.6995994,46.2028553],[33.6892658,46.2047794],[33.670864,46.2117939],[33.6661371,46.2207141],[33.6467708,46.22958],[33.6152408,46.2262179],[33.6177993,46.215981],[33.6135506,46.2139172],[33.6185932,46.213932],[33.6355706,46.1463365],[33.6412746,46.1424429],[33.6147111,46.1346624],[33.5870932,46.1191796],[33.5721329,46.1025643],[33.5911874,46.0612472],[33.5407189,46.0120312],[32.7727018,45.8266419],[32.7396744,45.8073204],[32.7259238,45.7972779],[32.7026395,45.7764183],[32.6659033,45.7625368],[32.6339252,45.7459969],[32.6054729,45.7265666],[32.5890615,45.7123247],[32.5685226,45.7063996],[32.5336146,45.6930389],[32.5016366,45.6764785],[32.4779329,45.660501],[32.4354921,45.6517736],[32.39936,45.6400966],[32.3822327,45.6329918],[32.3502547,45.6164136],[32.3218024,45.5969383],[32.2974057,45.5749258],[32.2868735,45.5630938],[32.2775192,45.5507836],[32.2643049,45.5283722],[32.2405042,45.5038633],[32.2230173,45.4787954],[32.2105624,45.4522796],[32.2062983,45.4386318],[32.2017961,45.4108733],[32.201579,45.396892]]]}'),
(2, 'CUSTOM_FIELDS', 'SEVASTOPOL', 0, '{\"type\":\"Polygon\",\"coordinates\":[[[33.0912003,44.575292],[33.0923427,44.5611278],[33.0948391,44.5470488],[33.098678,44.5331207],[33.1038415,44.5194085],[33.1103056,44.5059764],[33.11804,44.4928871],[33.1270087,44.4802021],[33.1371699,44.4679806],[33.1484762,44.45628],[33.1608749,44.4451553],[33.1743082,44.4346585],[33.1887135,44.424839],[33.2040236,44.4157429],[33.2086709,44.4133451],[33.2094146,44.4120847],[33.2183833,44.399382],[33.2285445,44.3871437],[33.2398508,44.3754269],[33.2522496,44.3642868],[33.2656829,44.3537755],[33.2800882,44.3439424],[33.2953982,44.3348338],[33.3115417,44.3264924],[33.3284434,44.3189574],[33.3460243,44.3122644],[33.3642027,44.3064448],[33.3828937,44.3015261],[33.4020101,44.2975313],[33.4203481,44.2946542],[33.4320666,44.285474],[33.4464718,44.2756294],[33.4617819,44.2665102],[33.4779254,44.2581591],[33.494827,44.2506154],[33.512408,44.2439146],[33.5305864,44.2380882],[33.5492773,44.2331638],[33.5651943,44.2298337],[33.5652086,44.2298263],[33.5821103,44.222279],[33.5996913,44.2155749],[33.6178696,44.2097458],[33.6365606,44.2048189],[33.655677,44.2008176],[33.6565829,44.2006752],[33.6587836,44.1999694],[33.6774746,44.1950417],[33.696591,44.1910397],[33.728796,44.2890915],[33.7617836,44.3893566],[33.7623083,44.3900862],[33.7644627,44.39131],[33.7661883,44.3922413],[33.7674533,44.3924805],[33.7687465,44.3928432],[33.769492,44.392962],[33.7699576,44.393016],[33.7715405,44.3931863],[33.7730193,44.3935192],[33.774707,44.3935744],[33.777065,44.3940918],[33.7777973,44.3942201],[33.7793589,44.3947809],[33.7817877,44.3956215],[33.7836011,44.3961329],[33.784602,44.3966051],[33.7855572,44.3968776],[33.7860359,44.3973385],[33.7859944,44.3976584],[33.785869,44.3980833],[33.7850763,44.3993542],[33.7840022,44.402866],[33.7824206,44.4047494],[33.781585,44.4057444],[33.7848861,44.4059456],[33.78561,44.4059422],[33.7867504,44.4059368],[33.7905145,44.405793],[33.7920085,44.405468],[33.7939379,44.4054048],[33.7949226,44.4042551],[33.7961222,44.4040542],[33.7968066,44.4041122],[33.797829,44.4041246],[33.798804,44.4042682],[33.8006006,44.404652],[33.8033942,44.4053378],[33.8047636,44.4064156],[33.8060364,44.4065733],[33.8067964,44.4068336],[33.8072752,44.4071005],[33.8077367,44.4072255],[33.8090294,44.407645],[33.8097904,44.4079192],[33.8115009,44.4086777],[33.812809,44.409377],[33.8140922,44.4100258],[33.8163472,44.4105069],[33.8208851,44.4110173],[33.8245729,44.411664],[33.8292787,44.4089158],[33.8315362,44.4097661],[33.8331706,44.4107066],[33.834337,44.411441],[33.8368255,44.4126419],[33.8378791,44.4129104],[33.8392701,44.4135574],[33.8403546,44.4141208],[33.8419751,44.4150042],[33.844276,44.416073],[33.8469623,44.4171293],[33.8479604,44.4172362],[33.8493755,44.4176828],[33.8510817,44.4180416],[33.853582,44.4181848],[33.8545701,44.4185108],[33.8549461,44.4187747],[33.8563622,44.4192879],[33.8573247,44.4196807],[33.8577227,44.4196301],[33.8591887,44.4199143],[33.8609822,44.4198818],[33.8621742,44.4196061],[33.8658143,44.419531],[33.8679753,44.4191812],[33.8706281,44.4188467],[33.8723856,44.4190714],[33.8738289,44.419035],[33.8752078,44.4194022],[33.8775438,44.419784],[33.8790023,44.4203254],[33.8792926,44.420694],[33.8828051,44.4210572],[33.8863997,44.4204493],[33.888967,44.4206103],[33.8910973,44.4208699],[33.8924542,44.4209641],[33.8939331,44.4212097],[33.8961951,44.421392],[33.8980569,44.4214726],[33.8988883,44.4210946],[33.9000252,44.4204447],[33.9024805,44.4193681],[33.9044672,44.4189381],[33.9067978,44.418834],[33.9094099,44.4188846],[33.9128633,44.4192],[33.9151412,44.4195532],[33.917457,44.4197775],[33.9205117,44.4200815],[33.9223084,44.4202527],[33.9249719,44.4208207],[33.9262025,44.4213251],[33.9258923,44.42188],[33.925104,44.4224578],[33.9244377,44.423187],[33.9239963,44.4238478],[33.9233878,44.4248718],[33.9229372,44.4257993],[33.9214856,44.4281539],[33.9211657,44.4289375],[33.9208161,44.4295308],[33.920427,44.4301435],[33.9199583,44.4307663],[33.919504,44.4314653],[33.919296,44.4317622],[33.918696,44.4324908],[33.9185054,44.4330543],[33.9178127,44.4340656],[33.9177002,44.4342608],[33.9173786,44.4349491],[33.9169398,44.4357908],[33.9160682,44.4370073],[33.9157728,44.4376669],[33.9155138,44.4381071],[33.9147946,44.4388747],[33.9143689,44.4397068],[33.9138655,44.4406727],[33.9136646,44.4414267],[33.9132965,44.4416964],[33.9121917,44.4433148],[33.9117133,44.4441853],[33.911418,44.4448543],[33.9111876,44.4454276],[33.9106412,44.4462034],[33.9102429,44.4470923],[33.9099173,44.447533],[33.9097649,44.4479914],[33.9093865,44.4484516],[33.909006,44.4487784],[33.9083968,44.4497928],[33.9079994,44.4507484],[33.9077825,44.4513406],[33.9072948,44.4516112],[33.9069701,44.452109],[33.9066851,44.452597],[33.9062066,44.4534675],[33.9051458,44.4553807],[33.9046497,44.4559752],[33.9040933,44.4569796],[33.9037687,44.4574869],[33.9035214,44.4578318],[33.9031034,44.4583208],[33.902964,44.4587695],[33.9028632,44.4591322],[33.9024163,44.4594691],[33.9020773,44.4599099],[33.9012075,44.4612882],[33.9008465,44.4620244],[33.9004518,44.4623037],[33.9001919,44.4626963],[33.8999322,44.4631079],[33.8996486,44.4636911],[33.8995509,44.4642538],[33.8991999,44.4647804],[33.8987151,44.4652604],[33.8985499,44.4657569],[33.898542,44.4661094],[33.8983745,44.4664631],[33.8980854,44.4666939],[33.8979039,44.4670001],[33.8977638,44.4674013],[33.8975981,44.4678692],[33.897385,44.4687186],[33.8972198,44.4692246],[33.8968803,44.4696368],[33.8960728,44.4707575],[33.8955908,44.4714184],[33.8949749,44.4720233],[33.8944214,44.472361],[33.8939106,44.4728793],[33.8934902,44.4732254],[33.8937132,44.4738904],[33.8938121,44.4742705],[33.8942191,44.4747912],[33.8949193,44.4753476],[33.8954716,44.4758004],[33.8960223,44.4761485],[33.8965611,44.4765919],[33.8968726,44.4769514],[33.8973304,44.4773097],[33.897509,44.4776798],[33.8973968,44.4781759],[33.8971535,44.4787873],[33.8962444,44.4793659],[33.8949647,44.4800617],[33.894076,44.4802306],[33.8926562,44.4804702],[33.8904838,44.4810777],[33.8893707,44.4813625],[33.8885197,44.4813882],[33.8881385,44.4816959],[33.8877033,44.481947],[33.8872527,44.4820552],[33.8869091,44.4822103],[33.8867408,44.4825164],[33.8864256,44.4827855],[33.8860304,44.4830457],[33.8852791,44.4835087],[33.8845267,44.4838955],[33.8836608,44.4847022],[33.8828731,44.4854035],[33.8824007,44.4858358],[33.8818733,44.4861541],[33.8814015,44.4866244],[33.880729,44.4870296],[33.8795338,44.4880579],[33.8788121,44.4887302],[33.8782742,44.4892391],[33.8775082,44.4896164],[33.8771005,44.4899338],[33.8766003,44.4902901],[33.8762892,44.4908448],[33.8757731,44.4910298],[33.874471,44.4920398],[33.8736292,44.4926938],[33.8723197,44.4941134],[33.8711006,44.4953418],[33.8704594,44.4960705],[33.8697109,44.4967429],[33.8690836,44.4975096],[33.8685181,44.4979615],[33.8677105,44.4991391],[33.8675184,44.4996453],[33.8672494,44.5003522],[33.8671553,44.5011815],[33.8671353,44.5016292],[33.8671564,44.5021529],[33.8673484,44.5025419],[33.8679867,44.5034038],[33.8685812,44.5040088],[33.8695899,44.5047154],[33.8707581,44.5054113],[33.8702988,44.5058529],[33.8696063,44.5067153],[33.868911,44.5073968],[33.868516,44.5076856],[33.8677851,44.5077578],[33.8671439,44.5076008],[33.8663819,44.5073684],[33.8658497,44.507382],[33.8652096,44.5072916],[33.8637816,44.5070262],[33.8625531,44.5067498],[33.8612079,44.5066837],[33.8603572,44.5067568],[33.8599229,44.5070934],[33.85961,44.5075339],[33.8588778,44.5084251],[33.8582935,44.50942],[33.8580309,44.5096696],[33.8577946,44.5098904],[33.8571672,44.5106761],[33.856215,44.5119976],[33.8556519,44.5126304],[33.8551427,44.5133104],[33.854067,44.5143851],[33.85315,44.5154015],[33.8527539,44.5156235],[33.8521084,44.5160855],[33.8512902,44.5165678],[33.8495879,44.51759],[33.8485712,44.5181595],[33.8473376,44.5184639],[33.8465578,44.5188506],[33.8456566,44.519124],[33.8455846,44.5196674],[33.8461744,44.5199487],[33.8473935,44.5204826],[33.8480629,44.5207443],[33.8486679,44.5211588],[33.8493536,44.5216204],[33.8501468,44.5221574],[33.8508967,44.5224566],[33.8517397,44.5227551],[33.8526406,44.5233674],[33.8549092,44.5246552],[33.8561822,44.5252171],[33.8570015,44.5257063],[33.8572702,44.5258757],[33.8568617,44.5261645],[33.8559258,44.5268001],[33.8553463,44.527233],[33.8545414,44.5277247],[33.8538317,44.5283586],[33.8531192,44.528802],[33.8525647,44.5291205],[33.8520773,44.5294765],[33.8515357,44.5297758],[33.8508074,44.5300479],[33.8502118,44.5302904],[33.8494976,44.5306195],[33.8487391,44.5306442],[33.8482852,44.5305619],[33.8456967,44.5301811],[33.8441107,44.530069],[33.843114,44.5302001],[33.8427399,44.5301077],[33.8419267,44.5300375],[33.841235,44.5300807],[33.8404098,44.5301058],[33.8401482,44.5304315],[33.8402203,44.530812],[33.8403335,44.5312778],[33.8403405,44.5317635],[33.840428,44.5322962],[33.8405996,44.533114],[33.8405376,44.5343621],[33.8405727,44.5349523],[33.8403277,44.5364303],[33.8401431,44.5371553],[33.840126,44.5372223],[33.8399065,44.5377001],[33.8394649,44.5384748],[33.8389023,44.5391742],[33.8386706,44.5397283],[33.8376767,44.5400689],[33.8372143,44.5403199],[33.8365809,44.5407246],[33.8358242,44.540892],[33.8352682,44.5411247],[33.8344731,44.5413971],[33.8337314,44.5416787],[33.8338235,44.5425352],[33.8340534,44.5427812],[33.8347594,44.5440569],[33.8355769,44.5450177],[33.8363265,44.5462122],[33.8368078,44.5472754],[33.8368276,44.5477229],[33.8372152,44.548782],[33.8358823,44.549463],[33.8345552,44.5499395],[33.8335337,44.5511565],[33.8329095,44.5522183],[33.8321402,44.5533763],[33.8314745,44.5543335],[33.8310821,44.5548411],[33.8308508,44.5554333],[33.8305058,44.5564644],[33.8302605,44.557009],[33.8302384,44.557333],[33.8300049,44.5577728],[33.8297434,44.5581176],[33.8295901,44.5585758],[33.8293838,44.5590631],[33.8289862,44.5601421],[33.8289102,44.5604189],[33.8287532,44.56062],[33.828465,44.560965],[33.8284554,44.5612222],[33.8283525,44.5614801],[33.8280502,44.561768],[33.8278949,44.5620929],[33.8275857,44.5628381],[33.8273394,44.563316],[33.8273604,44.5638587],[33.8274085,44.5644298],[33.8272924,44.5646973],[33.8271916,44.5651076],[33.8272308,44.565993],[33.8271548,44.5672127],[33.8272664,44.5685071],[33.8270852,44.5698227],[33.8272059,44.570833],[33.8272108,44.5712636],[33.8261553,44.5718961],[33.8254698,44.5724154],[33.8251155,44.5727989],[33.8244188,44.5734706],[33.8236795,44.5739617],[33.8233932,44.5744399],[33.8226812,44.5749784],[33.8218229,44.5755274],[33.8212036,44.5760271],[33.8206466,44.5762121],[33.8194538,44.5766683],[33.8187651,44.5769685],[33.8180081,44.5771453],[33.8173303,44.577274],[33.8164243,44.5772805],[33.8156109,44.5772386],[33.8144902,44.5771419],[33.8139036,44.5771175],[33.8135676,44.5769103],[33.8128316,44.5757346],[33.8120811,44.5744638],[33.812063,44.574121],[33.8117534,44.5738946],[33.8114458,44.5738111],[33.8106204,44.5738646],[33.8103958,44.5739995],[33.810203,44.5745057],[33.8099862,44.575212],[33.8098351,44.5758416],[33.8095614,44.5762817],[33.8093847,44.5769972],[33.8092384,44.5770173],[33.808345,44.5769665],[33.8076379,44.5769048],[33.807292,44.5769453],[33.8069947,44.5766427],[33.8069355,44.5762145],[33.8070463,44.5755566],[33.8068449,44.5754437],[33.8064839,44.5753606],[33.8056839,44.5753186],[33.8054863,44.5754819],[33.8053173,44.5757878],[33.8051745,44.576065],[33.8048852,44.5763433],[33.8046918,44.5768113],[33.8043245,44.5772329],[33.8039459,44.5777975],[33.8028948,44.5788811],[33.8020818,44.5798392],[33.8015562,44.5803858],[33.8012272,44.5806833],[33.8008203,44.5811338],[33.8004378,44.5814222],[33.8001316,44.5814434],[33.7997056,44.5814749],[33.7994165,44.5817722],[33.798626,44.5814634],[33.7982908,44.5813134],[33.7974865,44.5809666],[33.7968454,44.5808568],[33.7959867,44.5804342],[33.7951987,44.5802969],[33.7947656,44.5807856],[33.7943852,44.5812359],[33.7940437,44.5816001],[33.793662,44.5819457],[33.7935188,44.5821943],[33.7932725,44.5827008],[33.792797,44.5830183],[33.7925088,44.5833823],[33.7922883,44.5838314],[33.7921997,44.5841749],[33.7921653,44.5845846],[33.7920091,44.5848619],[33.7914775,44.5849704],[33.7907981,44.5849846],[33.7900383,44.5849708],[33.7894967,44.5853269],[33.7890424,44.5852444],[33.7884182,44.5854011],[33.787365,44.5856339],[33.7872108,44.5856602],[33.7872707,44.5869296],[33.7870293,44.5878808],[33.7868361,44.5885762],[33.7864857,44.5893477],[33.7856473,44.5904297],[33.784123,44.5920497],[33.7835797,44.5932725],[33.7829568,44.5945339],[33.782675,44.5953835],[33.781845,44.5971035],[33.7817092,44.5979139],[33.7815227,44.5989752],[33.7813617,44.5997391],[33.7818231,44.6008926],[33.7820162,44.6019926],[33.7820753,44.6025465],[33.7827136,44.6034135],[33.7829578,44.604534],[33.7828306,44.6059825],[33.7825664,44.6071558],[33.782428,44.6078705],[33.7821674,44.6092156],[33.782002,44.6098073],[33.7814198,44.6111351],[33.7806356,44.6123119],[33.7800828,44.612849],[33.7795796,44.6131096],[33.7785091,44.6128216],[33.7768504,44.6124139],[33.774818,44.61198],[33.7737859,44.611568],[33.7714466,44.6111076],[33.7699202,44.6106227],[33.7689918,44.6103537],[33.7678324,44.6100177],[33.7661308,44.6093815],[33.7651672,44.6091022],[33.7644063,44.6090311],[33.762713,44.6090234],[33.7619374,44.6088476],[33.761668,44.6086303],[33.7601611,44.6086023],[33.7581334,44.608511],[33.7561887,44.6086477],[33.755109,44.6086644],[33.7542169,44.608756],[33.7531582,44.6083344],[33.7516759,44.6081441],[33.7496197,44.60791],[33.7479194,44.6073497],[33.746085,44.6067331],[33.744399,44.6062489],[33.742739,44.6057073],[33.7419126,44.6053835],[33.7409641,44.6045188],[33.7393788,44.6035482],[33.7382751,44.6027172],[33.7367276,44.6015748],[33.735653,44.6009246],[33.7351651,44.6013468],[33.7331626,44.602505],[33.7286926,44.6046812],[33.7282625,44.6058086],[33.7272166,44.6085501],[33.7261648,44.6097377],[33.7251127,44.6109063],[33.7244398,44.6114725],[33.7241141,44.6120841],[33.7230092,44.6133006],[33.7227476,44.6137118],[33.7223653,44.6140571],[33.7221569,44.6144584],[33.7218299,44.6149747],[33.7214478,44.6153391],[33.7208401,44.6158],[33.720686,44.6162772],[33.7198544,44.6169586],[33.7192291,44.6174426],[33.7190355,44.6175924],[33.7185761,44.6181857],[33.7182733,44.6185019],[33.7169028,44.6198248],[33.7162703,44.6204383],[33.7163413,44.6207903],[33.7166882,44.6218929],[33.7170489,44.6230239],[33.7171748,44.623381],[33.7173496,44.6238771],[33.717491,44.6242783],[33.7178979,44.6248281],[33.7181591,44.6254646],[33.7183243,44.6258826],[33.718705,44.6264707],[33.7190323,44.6270591],[33.7192673,44.6277338],[33.720651,44.6296203],[33.7218757,44.631584],[33.7218653,44.6318222],[33.720897,44.6322569],[33.7203942,44.6325839],[33.7198752,44.6326729],[33.7191308,44.6328775],[33.7183313,44.6329397],[33.7175337,44.6331542],[33.7168675,44.6332156],[33.7168736,44.6337108],[33.717058,44.6346049],[33.7171711,44.6351184],[33.7175274,44.6358972],[33.7175791,44.6368397],[33.7176817,44.6375914],[33.7181781,44.6378264],[33.7196726,44.6378646],[33.7204882,44.6380214],[33.7212514,44.6382547],[33.7225479,44.6384655],[33.7228748,44.6386181],[33.7233126,44.6388226],[33.7244267,44.6393774],[33.7254762,44.6401041],[33.7261251,44.6407952],[33.7267487,44.6415913],[33.7270901,44.6422272],[33.7274049,44.6428633],[33.7276571,44.6438331],[33.7281186,44.6444683],[33.7286537,44.6456553],[33.729275,44.6462609],[33.7300323,44.6470751],[33.7308547,44.6477651],[33.7319197,44.648644],[33.7330897,44.6493793],[33.7340468,44.6501637],[33.7354083,44.6512692],[33.7366309,44.6519375],[33.7389455,44.653494],[33.7410862,44.6550039],[33.7425219,44.6561622],[33.7451887,44.658102],[33.7467661,44.6593631],[33.7485036,44.6606232],[33.7499838,44.6620992],[33.7518666,44.6637439],[33.7529934,44.6651082],[33.7525767,44.6685753],[33.7527328,44.66981],[33.7529211,44.6704373],[33.7530486,44.6710079],[33.7533587,44.6717702],[33.7538337,44.6736599],[33.7537168,44.6739106],[33.7540804,44.6741582],[33.754625,44.6753399],[33.7558236,44.675929],[33.7571387,44.676088],[33.7588447,44.6776141],[33.7598484,44.6782635],[33.762034,44.6795279],[33.7641884,44.6808728],[33.7654719,44.6815765],[33.7674787,44.6820761],[33.767794,44.6824526],[33.7687721,44.6838444],[33.7695639,44.6844824],[33.7702215,44.684989],[33.7715132,44.6861029],[33.7734405,44.6875265],[33.775878,44.689358],[33.7769711,44.690265],[33.7760274,44.6909207],[33.7751131,44.6915973],[33.7743776,44.6921555],[33.773417,44.692815],[33.7693868,44.6964503],[33.7682695,44.697132],[33.7671855,44.6981721],[33.7652945,44.6975],[33.7653914,44.6980799],[33.764286,44.698654],[33.7636924,44.6992923],[33.7615132,44.7009902],[33.7606626,44.7012564],[33.7600713,44.7006857],[33.7588479,44.7004336],[33.7567463,44.6997833],[33.7547377,44.6993466],[33.7532419,44.6990707],[33.7518027,44.6987863],[33.7510487,44.6990709],[33.7492774,44.6999539],[33.7477619,44.7004782],[33.7462868,44.7010307],[33.7450933,44.7016813],[33.7424875,44.7030982],[33.7400798,44.7043567],[33.7377416,44.705579],[33.7360228,44.7066758],[33.7348624,44.7075832],[33.7335082,44.7090062],[33.732668,44.7098973],[33.7311557,44.711507],[33.7299328,44.713029],[33.7283974,44.7144103],[33.7276578,44.7153435],[33.7265921,44.716636],[33.7257083,44.7164559],[33.7240134,44.7163024],[33.7204677,44.7158316],[33.7182993,44.7159813],[33.715643,44.715848],[33.7145084,44.705868],[33.7111774,44.7054294],[33.7050933,44.7049158],[33.7051533,44.7086069],[33.7057222,44.7088855],[33.7070032,44.709273],[33.7074283,44.7099255],[33.7072434,44.7105734],[33.7068042,44.7111815],[33.7039035,44.7123889],[33.702643,44.7132792],[33.7021009,44.7143249],[33.7006932,44.7148119],[33.6991761,44.7147547],[33.6977782,44.7146333],[33.6968818,44.7146185],[33.6955553,44.7141975],[33.6945066,44.7138526],[33.6926777,44.7132634],[33.6901829,44.7125094],[33.686687,44.7119472],[33.6839279,44.7115709],[33.681937,44.7112137],[33.6780404,44.7106298],[33.6755656,44.7102873],[33.6730571,44.7099093],[33.6708014,44.7097439],[33.6702036,44.7100213],[33.6688378,44.7102912],[33.667623,44.7106316],[33.6662457,44.7113539],[33.6644011,44.7121028],[33.6622056,44.7128179],[33.6609601,44.7134084],[33.6595327,44.7141428],[33.6589663,44.7142533],[33.6565092,44.7140055],[33.65342,44.7139518],[33.6491931,44.7136902],[33.6472211,44.7135109],[33.6437125,44.7132807],[33.6412226,44.7130685],[33.6371633,44.7128531],[33.6348429,44.712878],[33.6338247,44.7128955],[33.6308719,44.7131023],[33.6279164,44.7130591],[33.6253291,44.7130971],[33.6230743,44.7130142],[33.620986,44.7128827],[33.6161203,44.711976],[33.6158027,44.7175613],[33.6156037,44.7215496],[33.6151375,44.7216791],[33.6147871,44.7274593],[33.6146155,44.7289914],[33.6146258,44.729927],[33.611606,44.7296545],[33.6114398,44.7297841],[33.6110535,44.7315029],[33.611075,44.7317239],[33.6105707,44.7329396],[33.6107424,44.7329815],[33.6107128,44.7330684],[33.610729,44.733073],[33.6108604,44.7331625],[33.6109382,44.7333455],[33.6109275,44.7336865],[33.610906,44.7340981],[33.6107343,44.7355271],[33.6105949,44.7366856],[33.6106431,44.7371276],[33.6107558,44.7374934],[33.6109167,44.7378059],[33.6111957,44.738286],[33.6117214,44.7386289],[33.6121935,44.7388804],[33.6129713,44.7391033],[33.6132958,44.7391395],[33.6135775,44.7391605],[33.6140415,44.7391814],[33.6144572,44.7391872],[33.6148368,44.7391957],[33.6148448,44.7392777],[33.6146356,44.7393863],[33.6144774,44.7395311],[33.6143647,44.7399845],[33.6140928,44.7414791],[33.6136476,44.7436124],[33.6135172,44.745494],[33.6134149,44.7468755],[33.6135014,44.748744],[33.6136625,44.7497551],[33.6145825,44.7498692],[33.6180757,44.7500289],[33.6235469,44.7508087],[33.626959,44.7511828],[33.6307899,44.7516617],[33.6325826,44.752128],[33.6355485,44.7529449],[33.6396422,44.7545053],[33.6448596,44.7564403],[33.648079,44.7574696],[33.6546382,44.7598132],[33.6588491,44.7613127],[33.6616671,44.7622607],[33.6666163,44.7639938],[33.6702227,44.765187],[33.6747231,44.767089],[33.6777949,44.7682613],[33.6802293,44.769223],[33.6823606,44.7699841],[33.6827993,44.7703386],[33.6826717,44.7708631],[33.6823162,44.7718891],[33.6815548,44.7739412],[33.6810253,44.7758133],[33.6803857,44.7768528],[33.6796058,44.7787622],[33.6788157,44.7812311],[33.6783361,44.7831705],[33.6780405,44.7841524],[33.6776172,44.7854168],[33.6774224,44.7858657],[33.6772085,44.7861542],[33.6722521,44.7897687],[33.6693271,44.7918226],[33.6670034,44.7932885],[33.6657579,44.79401],[33.6642612,44.7947092],[33.6626287,44.7952306],[33.6586481,44.7965631],[33.655296,44.7973085],[33.6514272,44.7982116],[33.6479431,44.7991361],[33.6427247,44.800487],[33.6388566,44.8014849],[33.637474,44.8019569],[33.633605,44.802895],[33.6279033,44.8044503],[33.6261528,44.8049361],[33.6229366,44.8059655],[33.6207523,44.8065488],[33.617049,44.8074022],[33.6154721,44.8077465],[33.6136956,44.8081345],[33.6112654,44.8087411],[33.6111432,44.8087707],[33.6083257,44.8094528],[33.6064696,44.8098638],[33.6060298,44.8098543],[33.6059957,44.8099254],[33.6059439,44.8100084],[33.6044231,44.8103433],[33.6028486,44.8103113],[33.5984962,44.8098937],[33.5946433,44.8092471],[33.5888817,44.8083722],[33.5866523,44.807848],[33.5862874,44.8081475],[33.5834065,44.8110074],[33.5804917,44.8138555],[33.5783969,44.8167708],[33.5776542,44.8177626],[33.5767332,44.8192676],[33.5757615,44.8208554],[33.5736666,44.8238183],[33.5720867,44.8264332],[33.5710382,44.8286765],[33.5699551,44.8308009],[33.5692012,44.8323879],[33.5684954,44.8337724],[33.568286,44.8345948],[33.5677508,44.8363236],[33.5675989,44.8369039],[33.5672415,44.8382695],[33.5672272,44.8383227],[33.5671526,44.838601],[33.5658975,44.8391391],[33.5641182,44.8399193],[33.5630574,44.8402603],[33.5621787,44.8410979],[33.5614455,44.8413991],[33.5607093,44.8414027],[33.5601044,44.8411438],[33.5592283,44.8405171],[33.5576009,44.8400608],[33.5570651,44.8400277],[33.5564958,44.8399829],[33.5554598,44.8401189],[33.5549923,44.8402283],[33.5542562,44.8402319],[33.4246711,44.8904175],[33.2951871,44.9405202],[33.2947221,44.939992],[33.2853679,44.927546],[33.2772352,44.9146743],[33.270362,44.9014366],[33.2647803,44.8878944],[33.2605162,44.8741107],[33.2591027,44.867368],[33.256724,44.8627832],[33.2511423,44.8492319],[33.2468782,44.8354389],[33.2439516,44.8214684],[33.242376,44.8073853],[33.2421589,44.7932554],[33.2433012,44.7791444],[33.2457977,44.7651183],[33.2462933,44.763327],[33.2426121,44.7620086],[33.2254849,44.7547934],[33.209091,44.7467639],[33.1935068,44.7379573],[33.1788052,44.7284144],[33.1650545,44.7181793],[33.1523189,44.7072993],[33.1406578,44.6958248],[33.1301256,44.683809],[33.1207713,44.6713076],[33.1126386,44.6583786],[33.1057654,44.645082],[33.1001838,44.6314796],[33.0959197,44.6176345],[33.092993,44.6036113],[33.0914175,44.5894752],[33.0912003,44.575292]]]}');
INSERT INTO `b_location_area` (`ID`, `TYPE`, `CODE`, `SORT`, `GEOMETRY`) VALUES
(3, 'CUSTOM_FIELDS', 'DONETSK', 0, '{\"type\":\"Polygon\",\"coordinates\":[[[36.5419522,47.9060131],[36.5493443,47.8773685],[36.5765553,47.8801693],[36.5787757,47.8719978],[36.5827686,47.8546515],[36.5847724,47.8473971],[36.5927039,47.8488017],[36.6021315,47.8502129],[36.6047014,47.8508377],[36.6083961,47.8408481],[36.608341,47.8397404],[36.6033578,47.8282132],[36.5993301,47.8178481],[36.59841,47.8173433],[36.5885271,47.8165077],[36.58765,47.7956371],[36.5878379,47.7845698],[36.5902798,47.7846099],[36.5927318,47.7842363],[36.5960956,47.7842005],[36.6233077,47.7874333],[36.6255846,47.7878374],[36.6713057,47.7935819],[36.6801758,47.7594003],[36.6786025,47.7581159],[36.6811075,47.747921],[36.685659,47.7308949],[36.699959,47.7324982],[36.7055993,47.7108199],[36.71132,47.686456],[36.7133797,47.6788709],[36.7760113,47.6835773],[36.7916444,47.6849218],[36.7902865,47.6836962],[36.7919226,47.6816716],[36.7919789,47.6810063],[36.7913455,47.6806514],[36.7895636,47.6807884],[36.7875241,47.6803493],[36.7857221,47.6802954],[36.7842412,47.6799813],[36.7829455,47.6792899],[36.7807309,47.6770004],[36.7800825,47.6756742],[36.7805276,47.6751497],[36.7840331,47.6742465],[36.7845168,47.6734753],[36.7822057,47.6728023],[36.7816666,47.6722207],[36.7816458,47.6713826],[36.7814599,47.6711125],[36.7794065,47.6703493],[36.7788401,47.6697481],[36.7793528,47.668292],[36.7786899,47.6679746],[36.7782184,47.6677941],[36.7776752,47.6679739],[36.7759714,47.6695973],[36.7755972,47.6697804],[36.7745633,47.66957],[36.7743325,47.6690324],[36.7760591,47.6662101],[36.7756078,47.665554],[36.7747236,47.665137],[36.7733124,47.6651858],[36.7721754,47.6654112],[36.7688682,47.6662988],[36.7686128,47.666829],[36.7689401,47.6679185],[36.7534448,47.6668305],[36.7521133,47.6656551],[36.752336,47.6641601],[36.7544358,47.6644869],[36.7548069,47.6619953],[36.7455561,47.6608499],[36.7182719,47.6588466],[36.720036,47.6523132],[36.725195,47.6310934],[36.7601377,47.6339007],[36.765849,47.6341133],[36.7659148,47.6329189],[36.7650928,47.6296892],[36.7653141,47.626392],[36.7659542,47.625823],[36.7661375,47.6253042],[36.7662122,47.623444],[36.758229,47.6229201],[36.7537918,47.6223773],[36.7452576,47.6217404],[36.7481032,47.6065962],[36.7566136,47.6073163],[36.7649174,47.6077703],[36.7621163,47.6031478],[36.7631436,47.6005689],[36.7646269,47.600787],[36.8303171,47.6242291],[36.8435243,47.6073093],[36.8551132,47.5930796],[36.8934106,47.5449148],[36.9116974,47.5560707],[36.9143011,47.5578372],[36.9249919,47.5641964],[36.9443387,47.5761317],[36.9602148,47.560186],[36.9667558,47.553407],[36.9800607,47.5607131],[36.9806234,47.5603625],[37.0015961,47.5388645],[37.0210271,47.5527976],[37.0267938,47.5479658],[37.032706,47.541302],[37.0328173,47.5407974],[37.0373635,47.5358348],[37.0742173,47.4936995],[37.0759196,47.4926826],[37.0782201,47.4917437],[37.0843387,47.4961072],[37.1289017,47.46966],[37.1290027,47.4695636],[37.1274007,47.4687108],[37.1288798,47.4677276],[37.129411,47.4679979],[37.1518143,47.4574761],[37.1524705,47.4569619],[37.1577018,47.4548597],[37.1645372,47.4637859],[37.1696334,47.4699219],[37.1702945,47.4712443],[37.1797983,47.4836571],[37.1959706,47.4789319],[37.1941666,47.47628],[37.1904348,47.471769],[37.1901228,47.471119],[37.189947,47.4691507],[37.1979815,47.4688331],[37.2067405,47.4687179],[37.207235,47.4679243],[37.208277,47.4669215],[37.2116918,47.4666616],[37.2114777,47.4688174],[37.213594,47.4687865],[37.2136118,47.4694975],[37.2212173,47.4694371],[37.2216848,47.4688652],[37.2243228,47.4686657],[37.2327917,47.4685216],[37.2395943,47.4685533],[37.239603,47.4692817],[37.2451667,47.4691811],[37.2395517,47.4597266],[37.2486286,47.4572336],[37.2484158,47.4568245],[37.248127,47.4564672],[37.2475775,47.4564204],[37.2470878,47.4558253],[37.2367532,47.4368406],[37.2364947,47.4367127],[37.2358533,47.4367517],[37.2320059,47.437834],[37.2311698,47.4362462],[37.2308852,47.4351549],[37.2300694,47.434196],[37.2297737,47.4327321],[37.2291592,47.4323954],[37.2183829,47.4136965],[37.2183576,47.4133052],[37.1945741,47.3733558],[37.2034197,47.3557556],[37.1619798,47.341438],[37.146039,47.3811051],[37.106553,47.3759571],[37.1139259,47.3590395],[37.1142166,47.3589345],[37.1144074,47.3584944],[37.1141104,47.3586183],[37.1221769,47.3403728],[37.0922697,47.3300747],[37.0951442,47.3259678],[37.0831999,47.3217873],[37.0831101,47.3214676],[37.0832461,47.3211559],[37.0840198,47.3203613],[37.0841686,47.3199679],[37.0825641,47.3192687],[37.0823913,47.3189171],[37.0824818,47.3185368],[37.0829473,47.3179858],[37.0828982,47.3176373],[37.0820575,47.3175348],[37.0807245,47.3177069],[37.0805198,47.3174272],[37.0812409,47.3169086],[37.0814392,47.3164507],[37.0811948,47.3159889],[37.0814141,47.3157459],[37.0829439,47.3152225],[37.0837011,47.3147193],[37.062753,47.3090178],[37.0361269,47.2999843],[37.0361326,47.3002275],[37.0354114,47.3003826],[37.0347584,47.301167],[37.0352226,47.3015832],[37.0350409,47.3019652],[37.0353757,47.3020282],[37.0353885,47.3023175],[37.0357088,47.3026367],[37.0358914,47.3040589],[37.035616,47.3046938],[37.0353013,47.3049925],[37.0355058,47.3052006],[37.0355544,47.305556],[37.0350574,47.3058462],[37.0348213,47.3064117],[37.0343178,47.3065824],[37.0342784,47.3067425],[37.0345695,47.3069079],[37.0347269,47.3073454],[37.0339952,47.3081616],[37.0338614,47.3085724],[37.0339637,47.3090152],[37.0336411,47.3091486],[37.032516,47.3086418],[37.0322011,47.3087407],[37.0318238,47.3096793],[37.0301083,47.3101782],[37.0289124,47.3108184],[37.0285343,47.3113199],[37.0278895,47.31172],[37.027504,47.3128296],[37.0275984,47.3130483],[37.0272837,47.3137151],[37.0269136,47.3139975],[37.0264564,47.3147836],[36.9710227,47.312056],[36.9673495,47.3121107],[36.9466004,47.3109951],[36.9442269,47.3206358],[36.9260221,47.3194161],[36.9283564,47.3093295],[36.9288206,47.3079159],[36.9348674,47.2933292],[36.9363786,47.2871212],[36.9378289,47.2777421],[36.9418844,47.2572616],[36.9491667,47.2283417],[36.9556994,47.2290267],[36.9625814,47.2016615],[36.9313312,47.2005647],[36.9308514,47.2069799],[36.9068593,47.206109],[36.894083,47.2059071],[36.8917618,47.2000037],[36.884915,47.2000093],[36.8798239,47.1996538],[36.8547708,47.1991557],[36.8565654,47.1980578],[36.857307,47.1979316],[36.8573839,47.197748],[36.8574479,47.1972579],[36.8564235,47.1965829],[36.8563479,47.1958496],[36.8565422,47.1949697],[36.8560242,47.1946397],[36.8560937,47.1943227],[36.8574845,47.1931501],[36.8578904,47.1924098],[36.8594986,47.1927214],[36.8600652,47.1925713],[36.8599735,47.1920657],[36.8601719,47.1917841],[36.8590782,47.189895],[36.8591538,47.1894476],[36.8602222,47.1888829],[36.8612798,47.1886776],[36.8626287,47.1881275],[36.8635718,47.1874891],[36.8638142,47.1869178],[36.8637558,47.1862538],[36.8639935,47.1857474],[36.8644035,47.1854937],[36.8656715,47.1849694],[36.8674798,47.1850131],[36.8679113,47.1847969],[36.8703443,47.18439],[36.8706195,47.1841116],[36.8719469,47.1836497],[36.8720982,47.18332],[36.8720548,47.1827696],[36.8731178,47.182194],[36.873382,47.181754],[36.8758807,47.1812586],[36.8769382,47.1802502],[36.8769002,47.1789884],[36.8776075,47.1782003],[36.8775763,47.176965],[36.8782821,47.1760243],[36.8789333,47.1755742],[36.8814708,47.1746458],[36.8819104,47.174757],[36.8823045,47.175331],[36.882971,47.1756777],[36.8829663,47.1764032],[36.8847893,47.1771114],[36.8852903,47.1771699],[36.8864357,47.1766744],[36.8868956,47.176089],[36.887021,47.1755207],[36.8862896,47.1726575],[36.8883652,47.172196],[36.8886195,47.1719838],[36.8883738,47.1712623],[36.8884834,47.1708321],[36.8897919,47.1706161],[36.8913595,47.1708821],[36.8932968,47.1714977],[36.8957574,47.1726326],[36.8980064,47.1731993],[36.8986661,47.1737733],[36.899598,47.1738645],[36.9004363,47.1732557],[36.9005637,47.1729078],[36.9011848,47.1722459],[36.9011725,47.1718226],[36.9013727,47.1716123],[36.9023846,47.1715501],[36.9026222,47.1713041],[36.9024077,47.1702006],[36.9026346,47.1697166],[36.9030209,47.1694705],[36.9068445,47.1681978],[36.9073164,47.1676585],[36.9072964,47.1668647],[36.9080625,47.1658402],[36.9083458,47.1655183],[36.9093219,47.1651521],[36.9102969,47.1652673],[36.9106982,47.1654946],[36.9115092,47.1663871],[36.9120777,47.1666144],[36.9130392,47.1665064],[36.9138669,47.1657618],[36.9143378,47.165825],[36.9149119,47.1666087],[36.9150006,47.1670805],[36.9148148,47.1676567],[36.9150949,47.1679013],[36.9150796,47.168232],[36.9157316,47.1689132],[36.9174369,47.1695303],[36.9179385,47.17065],[36.9183231,47.1710081],[36.9189668,47.1712184],[36.9201122,47.1711615],[36.9210235,47.170667],[36.9216004,47.1700816],[36.9222526,47.170093],[36.9226547,47.1698955],[36.9235652,47.170434],[36.9239699,47.1704502],[36.9242413,47.1702909],[36.9243799,47.1691236],[36.9247154,47.1683554],[36.9248744,47.1673343],[36.9247865,47.1671148],[36.9236022,47.1663888],[36.9232054,47.1657919],[36.9234429,47.1645364],[36.9241572,47.1637675],[36.9235983,47.1622408],[36.9232971,47.1620849],[36.9224114,47.1609016],[36.9224177,47.1607099],[36.9228503,47.1604744],[36.9245434,47.160299],[36.9252383,47.1609834],[36.9262674,47.1610688],[36.9277246,47.1619932],[36.9293215,47.1622159],[36.9297919,47.1626056],[36.9295956,47.162825],[36.9315504,47.1642144],[36.9366667,47.1655313],[36.9373284,47.1650766],[36.9369005,47.1634525],[36.9371129,47.1630758],[36.9367479,47.1618825],[36.9367834,47.1613744],[36.9371267,47.1608231],[36.9380654,47.1600912],[36.9384284,47.158791],[36.9404007,47.1573043],[36.9408616,47.157459],[36.9417013,47.1573214],[36.9420188,47.1575618],[36.942147,47.1580404],[36.9437164,47.1596478],[36.9444303,47.15966],[36.9456146,47.1601019],[36.946181,47.1601047],[36.9469581,47.1598272],[36.9495352,47.1586788],[36.9500011,47.1584],[36.9503191,47.1578033],[36.9500773,47.1563313],[36.9504188,47.1549083],[36.9509569,47.1546167],[36.9527256,47.1546824],[36.9546827,47.1535393],[36.954949,47.1514809],[36.9544086,47.150946],[36.9540581,47.150135],[36.9545717,47.1495599],[36.9552061,47.1494447],[36.9568227,47.1497806],[36.9584143,47.1492522],[36.9613669,47.1490494],[36.9617581,47.1488596],[36.962014,47.1485977],[36.9624139,47.1475053],[36.9630451,47.1473956],[36.9637593,47.1466162],[36.9636189,47.1458882],[36.963689,47.1450235],[36.964502,47.1447638],[36.9650621,47.1443354],[36.9665762,47.1436834],[36.967932,47.1432879],[36.9685805,47.1432775],[36.9688568,47.142824],[36.9704714,47.1425123],[36.9711388,47.1416249],[36.97199,47.1413064],[36.972267,47.1408615],[36.9730428,47.1404859],[36.9737799,47.1398799],[36.9729972,47.1381991],[36.972531,47.1376197],[36.9719006,47.1372317],[36.9715225,47.1372458],[36.9714653,47.1374494],[36.9712313,47.1375391],[36.9708873,47.1372422],[36.9706923,47.1365225],[36.9702943,47.136092],[36.9703034,47.1357347],[36.9712579,47.1348317],[36.9728805,47.1348797],[36.973869,47.1343355],[36.9754468,47.1341808],[36.976077,47.1335239],[36.9763606,47.1334564],[36.9768672,47.1325397],[36.9770261,47.1318925],[36.9774143,47.1315323],[36.9798663,47.1308455],[36.9802189,47.1301241],[36.9803438,47.1289745],[36.9793193,47.1279665],[36.9789763,47.1273339],[36.979647,47.1267708],[36.9823993,47.1253422],[36.9828348,47.1248059],[36.9835274,47.1244045],[36.986462,47.1249335],[36.9875071,47.1253147],[36.9881899,47.1257896],[36.989266,47.1254356],[36.9901482,47.1244195],[36.9911357,47.1239257],[36.9918874,47.1238358],[36.9925723,47.1240194],[36.9933511,47.1246377],[36.9933846,47.1252293],[36.994229,47.1259518],[36.9945802,47.1265149],[36.9955416,47.1272203],[36.9964481,47.1284997],[36.9965513,47.1293045],[36.9977342,47.129587],[36.9982475,47.1295982],[36.9987388,47.1291238],[37.0008758,47.1282507],[37.0017538,47.1276285],[37.0022803,47.1270553],[37.0024486,47.1263045],[37.0029416,47.1258568],[37.002973,47.1253789],[37.0016965,47.1239906],[37.0014997,47.122646],[37.0021131,47.1216909],[37.0027485,47.1211562],[37.0025796,47.1201727],[37.0021967,47.1195462],[37.0016201,47.1192215],[37.0010173,47.1184599],[37.0004321,47.1181808],[37.0003406,47.1176915],[36.9999895,47.1174184],[36.9996049,47.1153588],[37.0001003,47.1143316],[37.0000892,47.113967],[37.0021239,47.1138559],[37.0031749,47.1133788],[37.0058586,47.1129805],[37.0066612,47.1131114],[37.0070207,47.1133959],[37.0073301,47.11343],[37.0080407,47.1140559],[37.0084838,47.1142379],[37.0094951,47.1141209],[37.0100706,47.1136477],[37.0103389,47.111818],[37.0107663,47.1113987],[37.0107914,47.1106078],[37.0103147,47.1100925],[37.0101755,47.1096651],[37.0104142,47.1094652],[37.0102648,47.1088898],[37.0096675,47.1083336],[37.0099135,47.1076705],[37.0098717,47.1073529],[37.0093366,47.1064994],[37.008626,47.1061181],[37.0079655,47.1053954],[37.0075391,47.1051848],[37.0073384,47.1045076],[37.0069371,47.1041036],[37.0061345,47.1038006],[37.0054082,47.103139],[37.0031984,47.1026155],[37.0028509,47.1023113],[37.0027359,47.1016065],[37.0020205,47.1008577],[37.0022124,47.1006159],[37.0028314,47.1003775],[37.0029574,47.1001391],[37.0028756,47.0998357],[37.0033258,47.0992464],[37.0041324,47.0988075],[37.0050203,47.0979905],[37.0059911,47.0975689],[37.0067016,47.0977394],[37.0079861,47.098698],[37.0093707,47.0991695],[37.010072,47.0990793],[37.0109346,47.0984847],[37.0117288,47.0973035],[37.0113142,47.0967392],[37.0104475,47.0962749],[37.0094246,47.0950852],[37.0091237,47.0943476],[37.0090694,47.0934022],[37.0085863,47.0925413],[37.0086432,47.0922028],[37.0090221,47.091777],[37.0099398,47.0917236],[37.0110624,47.0909497],[37.0117021,47.090706],[37.0123468,47.090692],[37.0127045,47.0901167],[37.0127873,47.0893668],[37.0125098,47.089263],[37.0123208,47.0888232],[37.0107022,47.0882993],[37.0100655,47.0870085],[37.0099962,47.0863936],[37.0093586,47.0856655],[37.0092541,47.0849283],[37.0083874,47.0845123],[37.0044969,47.0844063],[37.0039979,47.0840758],[37.0031641,47.0839996],[37.0026333,47.08362],[37.0016198,47.0836827],[37.0005108,47.0832028],[37.0001765,47.0834236],[36.9985306,47.0835921],[36.9955041,47.0827327],[36.9945322,47.0822681],[36.9935404,47.0812229],[36.993171,47.0810778],[36.9912723,47.080792],[36.9907669,47.0810217],[36.9902307,47.0806444],[36.9888652,47.0806838],[36.9879776,47.0803512],[36.9870013,47.0806024],[36.9863912,47.0804302],[36.9854531,47.0797697],[36.9906019,47.0780522],[36.9932224,47.076968],[37.0226889,47.0673865],[37.081212,47.0474791],[37.0846212,47.0511526],[37.0865397,47.0524616],[37.0986952,47.0592489],[37.1249171,47.0391072],[37.1241762,47.0386353],[37.0893372,47.0074623],[37.1411334,46.9819937],[37.1233696,46.9717264],[37.1221199,46.970871],[37.1026884,46.9599756],[37.092348,46.9683681],[37.0869309,46.9652915],[37.0818964,46.9627898],[37.0767158,46.9595142],[37.0625903,46.9513941],[37.0604694,46.9503782],[37.0503935,46.9447917],[37.03181,46.9341935],[37.0214221,46.9278993],[37.031117,46.920123],[37.0335649,46.9175287],[37.0624638,46.8839559],[37.1687215,46.710379],[37.1801918,46.7061939],[37.1959368,46.7013262],[37.2121123,46.6971747],[37.2286491,46.6937574],[37.2454763,46.6910891],[37.262522,46.6891813],[37.279713,46.6880423],[37.2969758,46.687677],[37.3142365,46.688087],[37.3314211,46.6892704],[37.3484562,46.6912223],[37.3652686,46.6939341],[37.3817865,46.6973941],[37.3979391,46.7015874],[37.4136571,46.7064957],[37.4288735,46.712098],[37.4375896,46.7158298],[37.620074,46.8298909],[37.870342,46.8447314],[38.1408636,46.8609996],[38.3381215,46.9807515],[38.2296204,47.1193468],[38.229733,47.1194915],[38.228514,47.1226068],[38.2290997,47.1271667],[38.2318183,47.1297538],[38.2339764,47.1355729],[38.2362181,47.1395533],[38.2364058,47.1437507],[38.2363266,47.1591186],[38.2358904,47.1986006],[38.2356163,47.2010087],[38.2355999,47.2028947],[38.2342438,47.203242],[38.2339781,47.2037756],[38.2352719,47.2050784],[38.2370507,47.2074504],[38.2370787,47.2080439],[38.2372421,47.2083158],[38.239178,47.2086432],[38.2399131,47.2090205],[38.2410077,47.209975],[38.2411874,47.2106464],[38.2408117,47.2109183],[38.240779,47.2113733],[38.2417932,47.2120864],[38.2418279,47.2122943],[38.2408171,47.213232],[38.2408806,47.2138558],[38.2412734,47.2144522],[38.2422886,47.215191],[38.242381,47.216313],[38.242716,47.216976],[38.2427622,47.2177685],[38.2426698,47.2182314],[38.2416879,47.2186865],[38.2405847,47.2185649],[38.2402555,47.2186943],[38.240036,47.2191063],[38.2404846,47.2212848],[38.2402932,47.2216566],[38.2386593,47.2221001],[38.2384469,47.2226327],[38.2386266,47.2234038],[38.2383407,47.2237034],[38.237581,47.2240418],[38.2365355,47.2243302],[38.2363803,47.2245632],[38.2364456,47.2254286],[38.2361352,47.2256117],[38.2348364,47.2254231],[38.2339134,47.2258225],[38.2340278,47.2269097],[38.2339134,47.2277251],[38.2336193,47.2280191],[38.2328515,47.228363],[38.2329087,47.228951],[38.2345751,47.2309312],[38.2352694,47.2310865],[38.2365273,47.2308536],[38.2372134,47.2311586],[38.2380303,47.2323179],[38.2386429,47.2325952],[38.2390677,47.2326451],[38.2406278,47.2323234],[38.2424494,47.2324787],[38.2435354,47.2328383],[38.2455019,47.2338365],[38.2464107,47.2339642],[38.2470887,47.233881],[38.2480758,47.2334322],[38.2505893,47.2333641],[38.2524549,47.2334151],[38.2543436,47.2338897],[38.2549212,47.2341877],[38.2551522,47.2348152],[38.2565905,47.2351211],[38.2583868,47.2362428],[38.2587738,47.2368271],[38.2603084,47.2382552],[38.2881957,47.2385353],[38.2879737,47.2567529],[38.3244901,47.25695],[38.3244943,47.2573352],[38.3247638,47.257557],[38.325597,47.2579395],[38.3272237,47.259149],[38.3300869,47.2622996],[38.3310749,47.262927],[38.3315717,47.2636483],[38.3317103,47.2643303],[38.3315948,47.2646047],[38.3305089,47.265271],[38.3294115,47.2656551],[38.3290765,47.2659687],[38.3290533,47.2665017],[38.3293075,47.2669799],[38.3299544,47.2673719],[38.3329001,47.268336],[38.33353,47.26919],[38.3325776,47.2712172],[38.3329258,47.2723299],[38.3326686,47.2727149],[38.331552,47.2730777],[38.331402,47.2738526],[38.3311488,47.2741879],[38.331063,47.2751883],[38.3307651,47.2758756],[38.3287705,47.2760822],[38.3265053,47.2770976],[38.3261336,47.2775521],[38.3261622,47.2783141],[38.3271016,47.279439],[38.3270852,47.2797604],[38.3265992,47.2801428],[38.3253372,47.2801179],[38.3235524,47.2803506],[38.3228581,47.2811929],[38.3228295,47.2814922],[38.3254066,47.2844789],[38.3280737,47.2853766],[38.3288379,47.2864095],[38.3287281,47.287005],[38.3288263,47.2874399],[38.3296869,47.2879924],[38.3298025,47.288584],[38.3293519,47.2889405],[38.3292942,47.289156],[38.3310327,47.2907466],[38.3320782,47.29144],[38.332829,47.2922157],[38.3330968,47.2927122],[38.3332982,47.2936248],[38.3332391,47.2962036],[38.3335106,47.2965914],[38.333216,47.2968617],[38.3326096,47.2970615],[38.3276423,47.2975747],[38.3269549,47.2978449],[38.3268392,47.2981771],[38.3270003,47.2994985],[38.3282482,47.3005944],[38.3318062,47.3010644],[38.3327707,47.3014914],[38.3339952,47.3022865],[38.3340588,47.3024784],[38.3345902,47.3026939],[38.3348039,47.3030111],[38.3345728,47.3032618],[38.3345497,47.3037905],[38.3355952,47.3054042],[38.3360688,47.3056275],[38.3360399,47.3062541],[38.220892,47.3053966],[38.2212454,47.319523],[38.2210564,47.320618],[38.2213018,47.3223915],[38.2211335,47.3270782],[38.2226924,47.3283232],[38.226221,47.3292733],[38.2268857,47.3297647],[38.2269703,47.3302439],[38.2255322,47.3321809],[38.2241667,47.3322914],[38.2228858,47.3326108],[38.222493,47.3328934],[38.2225112,47.3331063],[38.2230489,47.3337738],[38.2239733,47.334212],[38.2242755,47.3351538],[38.2257341,47.3365272],[38.2278609,47.3376491],[38.2304107,47.3386482],[38.2306766,47.3390577],[38.2311358,47.340761],[38.2310029,47.3415307],[38.2311962,47.3435205],[38.2319092,47.3443148],[38.2356553,47.3453956],[38.2380757,47.3457166],[38.2392781,47.346081],[38.2432176,47.348656],[38.2451933,47.349745],[38.2462386,47.3507274],[38.2463776,47.3512678],[38.2456042,47.3522175],[38.2461842,47.3532449],[38.2464864,47.3541578],[38.249324,47.3564357],[38.2493326,47.3567773],[38.2489221,47.3573738],[38.2486533,47.3585051],[38.2486704,47.3586267],[38.2489395,47.3586296],[38.2489609,47.358809],[38.2477732,47.359301],[38.2470597,47.3600767],[38.2469742,47.3604731],[38.2474784,47.3615642],[38.2474057,47.3617407],[38.2448259,47.3631444],[38.244983,47.3637092],[38.246421,47.364454],[38.2478404,47.3661539],[38.249502,47.3670051],[38.2500458,47.3679668],[38.2508738,47.3688622],[38.2531335,47.3699998],[38.2537136,47.3706873],[38.2538223,47.3712274],[38.2543057,47.3715875],[38.2557317,47.3721195],[38.2572543,47.3732126],[38.2865486,47.3734193],[38.2864717,47.3913579],[38.3006472,47.3914516],[38.3006955,47.391967],[38.3023895,47.392848],[38.3024201,47.398333],[38.3028361,47.407243],[38.3020282,47.4749623],[38.2954668,47.4747341],[38.2952357,47.4749881],[38.2955803,47.4757519],[38.2953209,47.4758904],[38.288368,47.4760923],[38.2878407,47.47682],[38.2877857,47.4783275],[38.2870496,47.4794933],[38.2859552,47.4834921],[38.2866045,47.4838655],[38.2869165,47.4850933],[38.2867494,47.485928],[38.2868898,47.4865218],[38.2871713,47.4868428],[38.2878764,47.4870762],[38.2881544,47.4874508],[38.2884726,47.488855],[38.2888361,47.489199],[38.2903056,47.4897094],[38.2919199,47.4904991],[38.2919973,47.4910982],[38.2908384,47.4932738],[38.2906023,47.4964241],[38.2902906,47.4975739],[38.2905669,47.4982952],[38.2900394,47.4989951],[38.2906675,47.4994947],[38.2915641,47.49973],[38.2924748,47.5001916],[38.2923913,47.5004984],[38.2935679,47.5013912],[38.293748,47.5021631],[38.2934212,47.502642],[38.2932959,47.5031737],[38.2933643,47.504653],[38.2917328,47.5055144],[38.2915349,47.5058318],[38.291892,47.5064431],[38.2934292,47.5078195],[38.2934178,47.508104],[38.2927508,47.5084789],[38.2852586,47.5083891],[38.2850531,47.5085115],[38.284896,47.509034],[38.2847389,47.5224516],[38.2849289,47.5311997],[38.2847269,47.5443096],[38.2849391,47.5444713],[38.2868775,47.5446132],[38.3050538,47.5448082],[38.3054645,47.5449708],[38.3052466,47.5453229],[38.3053945,47.5456076],[38.3072667,47.5464961],[38.3073554,47.5467018],[38.3058574,47.5478172],[38.306011,47.5482915],[38.3079815,47.5490518],[38.3084006,47.5497704],[38.3085392,47.5504564],[38.3094896,47.5513034],[38.3094952,47.5521364],[38.3108168,47.5528887],[38.3112639,47.5535748],[38.3107926,47.5761448],[38.3507161,47.5761965],[38.3504612,47.616646],[38.3570263,47.616525],[38.3991765,47.6169367],[38.4567501,47.6171106],[38.4564852,47.6440438],[38.5265767,47.6444631],[38.6164721,47.6445958],[38.6165171,47.6451077],[38.6171346,47.6456343],[38.6174891,47.6463459],[38.6193061,47.6476952],[38.6215465,47.6487619],[38.6220224,47.6494384],[38.6236074,47.6507313],[38.6260943,47.6534246],[38.629749,47.6534345],[38.6292721,47.669396],[38.6532488,47.6695483],[38.6558966,47.6693677],[38.6660265,47.6693143],[38.6655825,47.6963158],[38.6647428,47.6970558],[38.6663114,47.6979008],[38.6653573,47.6986114],[38.6658283,47.6987288],[38.6662759,47.6984321],[38.6687774,47.6988273],[38.6976341,47.6986138],[38.7273535,47.6987831],[38.7347864,47.6996328],[38.7355617,47.6991083],[38.7355678,47.698777],[38.73609,47.6980378],[38.7354506,47.6971678],[38.7355667,47.6950482],[38.7354588,47.6945835],[38.7323332,47.6930912],[38.7313897,47.6928986],[38.7307779,47.692584],[38.7299855,47.6919478],[38.7298077,47.6911837],[38.7301629,47.6900905],[38.7307569,47.6895676],[38.7313235,47.6893157],[38.7331763,47.6888604],[38.7335873,47.6879698],[38.7340557,47.6873977],[38.7346271,47.6872339],[38.7351397,47.6873083],[38.7369406,47.687996],[38.7377346,47.6877386],[38.7384603,47.6863105],[38.7390465,47.6858749],[38.7396684,47.6850923],[38.7398815,47.6845644],[38.7392541,47.6837526],[38.7389208,47.6835744],[38.7374896,47.6833764],[38.7363328,47.6833698],[38.7355682,47.6825911],[38.7352545,47.6813305],[38.7353231,47.6806705],[38.7360289,47.6802415],[38.7366073,47.6801359],[38.738215,47.6804263],[38.739009,47.6809939],[38.7395482,47.6811457],[38.7398913,47.6810335],[38.740303,47.6803669],[38.7405481,47.6802481],[38.7432243,47.6806771],[38.744881,47.6822809],[38.7449202,47.6824657],[38.7444987,47.6832445],[38.7445281,47.6835612],[38.74493,47.684241],[38.7451947,47.6851781],[38.7464886,47.6862208],[38.746871,47.686366],[38.7475572,47.6862934],[38.7480473,47.6857192],[38.7500961,47.6846568],[38.7507823,47.6844654],[38.7516842,47.6846106],[38.7519881,47.6848745],[38.7525607,47.6861088],[38.7528858,47.6864173],[38.7533793,47.6865193],[38.7540472,47.6863532],[38.7551269,47.6853113],[38.764152,47.6855278],[38.7726084,47.6855249],[38.7725174,47.7054007],[38.7726359,47.7137092],[38.7730558,47.719341],[38.7730003,47.7250254],[38.7734556,47.727085],[38.7745285,47.7282685],[38.7761163,47.728384],[38.7770605,47.7289613],[38.7780046,47.7302892],[38.7780046,47.7321366],[38.7773609,47.7336952],[38.7780904,47.7349075],[38.7820386,47.7365527],[38.7887764,47.7364372],[38.7890234,47.7375434],[38.7889398,47.7654411],[38.7891099,47.7685824],[38.7917803,47.7684308],[38.7932706,47.768729],[38.793737,47.769166],[38.7937325,47.7697028],[38.7930377,47.7714137],[38.7925348,47.7720044],[38.7925152,47.7723404],[38.7933484,47.7728411],[38.794662,47.772907],[38.7964462,47.7733616],[38.7965442,47.7736581],[38.7961913,47.7739875],[38.7963187,47.7744486],[38.79576,47.7748835],[38.7955443,47.7757794],[38.7959952,47.7761615],[38.7959805,47.776458],[38.7954751,47.7766374],[38.7928767,47.7765514],[38.7924289,47.7769383],[38.7920691,47.7776582],[38.7917333,47.7778892],[38.7893428,47.7778463],[38.788991,47.7783083],[38.7889403,47.7788647],[38.7892107,47.7794951],[38.790318,47.7803301],[38.7904861,47.7818757],[38.7931292,47.7837784],[38.7932651,47.7842243],[38.7930973,47.7844216],[38.7926959,47.7845926],[38.7911064,47.7845896],[38.7906427,47.7848206],[38.7890357,47.7848153],[38.7872847,47.7844983],[38.7865412,47.7846165],[38.7859175,47.7849066],[38.7850301,47.7865451],[38.7838686,47.7880408],[38.7836382,47.7911841],[38.7839709,47.7917302],[38.7847023,47.792153],[38.7855098,47.7929104],[38.7880043,47.7940276],[38.7886039,47.7945755],[38.7892915,47.7956443],[38.790067,47.7960256],[38.7904681,47.796407],[38.7903339,47.7975221],[38.7907297,47.7988133],[38.7906844,47.7993602],[38.7898499,47.8001298],[38.7894068,47.8013471],[38.7895085,47.8032563],[38.7890517,47.8041943],[38.7889225,47.8159167],[38.8288189,47.8159186],[38.8287987,47.8232682],[38.8292331,47.8238186],[38.8314945,47.8246157],[38.8320825,47.8252762],[38.8324104,47.8266805],[38.8321638,47.8273204],[38.8319526,47.8274662],[38.8309645,47.827562],[38.8304368,47.8278303],[38.8304368,47.8283564],[38.8299091,47.8284422],[38.8294294,47.827927],[38.8288538,47.8279055],[38.828422,47.8285711],[38.8288858,47.8293547],[38.8279583,47.8299237],[38.828438,47.8310616],[38.828454,47.8318774],[38.8279743,47.8326073],[38.8273136,47.832754],[38.8265367,47.8333811],[38.8261995,47.833798],[38.8258445,47.8347439],[38.8252904,47.8353662],[38.8257088,47.8359507],[38.8260367,47.8368842],[38.8256975,47.8375141],[38.8264974,47.8387241],[38.8264224,47.8389492],[38.8246912,47.8402008],[38.8252428,47.8409483],[38.8256111,47.8421217],[38.8260624,47.8426397],[38.8263152,47.8437366],[38.8260464,47.8451456],[38.8261984,47.8456929],[38.8269019,47.84631],[38.8276611,47.8473966],[38.8273898,47.8477912],[38.8275255,47.8482009],[38.8280343,47.8483982],[38.8293903,47.8481332],[38.8297771,47.8482581],[38.8297913,47.8485645],[38.8293572,47.8491798],[38.829425,47.8495592],[38.8298434,47.8499461],[38.8307219,47.8501002],[38.8329665,47.8499901],[38.8343508,47.8495009],[38.8360547,47.8496846],[38.8375233,47.8505432],[38.8383936,47.8514366],[38.837099,47.8542641],[38.8360691,47.8548401],[38.835597,47.855704],[38.8362836,47.8560783],[38.8370132,47.8570286],[38.8364553,47.8576333],[38.8361978,47.8586987],[38.8353395,47.858929],[38.8349962,47.8606279],[38.837614,47.8644573],[38.8389444,47.8654938],[38.8418359,47.8668685],[38.8425213,47.8667743],[38.842721,47.865177],[38.8643262,47.8656038],[38.8748202,47.8666138],[38.8775066,47.8704644],[38.8788128,47.8726406],[38.8786948,47.8735041],[38.877815,47.874965],[38.8779008,47.8772822],[38.8792097,47.8776924],[38.880626,47.87698],[38.8821816,47.8769224],[38.8833296,47.8766274],[38.8840806,47.8749147],[38.8863927,47.8747024],[38.8881844,47.8741626],[38.8896543,47.8744865],[38.890239,47.8744217],[38.8909686,47.8742418],[38.8914138,47.8737488],[38.8916016,47.8739719],[38.892374,47.8739323],[38.8932431,47.874983],[38.8939565,47.875332],[38.8981837,47.8748751],[38.8989847,47.8730139],[38.9009994,47.8725532],[38.9034547,47.8723689],[38.9074438,47.8725647],[38.9091207,47.8729319],[38.909971,47.8743656],[38.9118432,47.8754854],[38.9124361,47.8756267],[38.9135249,47.8752667],[38.9145987,47.8743224],[38.9169472,47.8739735],[38.9274449,47.8731005],[38.9318561,47.872072],[38.9321995,47.8741303],[38.9328432,47.8744181],[38.9429712,47.8726334],[38.9464902,47.8712804],[38.9564895,47.8713092],[38.9650726,47.8700137],[38.9801144,47.8698302],[38.985599,47.8699334],[39.0744646,47.8695196],[39.0731563,47.8729739],[39.0725623,47.8753003],[39.0683341,47.8876293],[39.0651605,47.8960073],[39.0785871,47.9183652],[39.0906231,47.9388961],[39.0914413,47.9409895],[39.0889262,47.940587],[39.0870845,47.940517],[39.0844995,47.9406379],[39.0840041,47.9409238],[39.0837212,47.9411858],[39.0839342,47.941495],[39.0836161,47.9418521],[39.0837939,47.9423517],[39.0837237,47.9426849],[39.0831575,47.9430184],[39.0815288,47.9433052],[39.0805951,47.9441292],[39.0806247,47.9449096],[39.0792943,47.9457672],[39.0790966,47.9462052],[39.0791255,47.9465859],[39.0798176,47.9474287],[39.0795699,47.9479571],[39.0773148,47.9483766],[39.0757312,47.9506239],[39.0755624,47.9514236],[39.0748828,47.9518048],[39.0744587,47.9524333],[39.0738359,47.9529286],[39.0723907,47.9529295],[39.071795,47.952473],[39.070659,47.9506843],[39.0696379,47.9499615],[39.0688442,47.9497526],[39.0680511,47.9499815],[39.0675697,47.9502292],[39.0665226,47.9513149],[39.0662674,47.9511818],[39.066153,47.9503443],[39.065613,47.9490501],[39.0647625,47.948765],[39.0613623,47.948824],[39.0607101,47.9483865],[39.0602274,47.9475872],[39.0594335,47.9470736],[39.0586115,47.9468647],[39.0570247,47.9468464],[39.0564302,47.9473226],[39.0564313,47.9483696],[39.0561202,47.9488838],[39.0549592,47.9495697],[39.0550733,47.950274],[39.054535,47.9504265],[39.0539963,47.9501602],[39.0530328,47.9500655],[39.0523812,47.95018],[39.0507101,47.9509422],[39.050739,47.9515514],[39.0514766,47.9524268],[39.0530648,47.9536253],[39.0532638,47.9543106],[39.0529809,47.9547295],[39.0525842,47.9548249],[39.0506563,47.9540072],[39.0479358,47.9539322],[39.0471143,47.9543513],[39.0467747,47.9548464],[39.0466339,47.9558173],[39.0460108,47.9562364],[39.0442253,47.956218],[39.0435737,47.9564087],[39.0426672,47.9569611],[39.0421005,47.9570565],[39.041477,47.9569805],[39.0404559,47.95601],[39.039719,47.955858],[39.0390106,47.9559724],[39.0385008,47.9563534],[39.0385863,47.9570577],[39.0390406,47.9582235],[39.0402708,47.9627636],[39.0423555,47.9777542],[39.0434811,47.9887473],[39.0405406,48.0000156],[39.0406057,48.0016289],[39.0398439,48.0069404],[39.0251426,48.0075727],[39.0199514,48.0078735],[39.0162707,48.0082739],[39.004824,48.0085033],[38.9965262,48.0093172],[38.9877601,48.0093736],[38.9831005,48.0092303],[38.9376714,48.0118772],[38.9219424,48.0126528],[38.8612538,48.0147577],[38.8540755,48.0204487],[38.8253525,48.0297743],[38.8229821,48.0330544],[38.8213775,48.0358527],[38.825587,48.0380445],[38.8213309,48.0430268],[38.8195003,48.0423906],[38.8189543,48.0434166],[38.816937,48.0444598],[38.8146831,48.0468311],[38.8126713,48.0479449],[38.8145428,48.0505026],[38.8151558,48.0509123],[38.819672,48.0510691],[38.8213193,48.0516809],[38.8219061,48.057328],[38.8289861,48.058065],[38.8310366,48.0573797],[38.8314692,48.0579098],[38.8285357,48.0591502],[38.8272786,48.0606015],[38.8293595,48.0628421],[38.8304809,48.0633834],[38.8291555,48.0644302],[38.8293394,48.0648809],[38.826754,48.0656663],[38.8269339,48.0660459],[38.8297698,48.0683545],[38.826834,48.0692337],[38.828016,48.0702814],[38.8286123,48.0710784],[38.8289379,48.071992],[38.8279427,48.0719113],[38.8283956,48.0726832],[38.8271626,48.0735856],[38.8286584,48.075773],[38.8293027,48.0774432],[38.82905,48.077752],[38.8286092,48.0777808],[38.8241029,48.0742751],[38.8218017,48.0711997],[38.820391,48.0684504],[38.8184545,48.0663176],[38.8179226,48.0659146],[38.8168914,48.0659799],[38.8140863,48.067186],[38.8126125,48.0672254],[38.8070963,48.0692646],[38.8031906,48.0703088],[38.8038945,48.071225],[38.7995269,48.0747152],[38.8042126,48.0784256],[38.8087415,48.0780326],[38.8119997,48.0805656],[38.8142957,48.0815882],[38.8174818,48.0843192],[38.8104311,48.0872851],[38.806696,48.0882836],[38.8114651,48.097305],[38.8175557,48.1094934],[38.8203959,48.1162414],[38.8152338,48.1169328],[38.8120781,48.1169705],[38.8115008,48.1174122],[38.8117102,48.1184405],[38.8115173,48.1187257],[38.8106205,48.1190811],[38.8095542,48.1191222],[38.8072967,48.1184189],[38.8060818,48.1183026],[38.8043321,48.1186566],[38.8021372,48.1183101],[38.8004512,48.1187213],[38.7980197,48.1189312],[38.7961594,48.1202699],[38.7956444,48.1210828],[38.7947032,48.1218378],[38.7916083,48.1225746],[38.7910526,48.122902],[38.7901529,48.123914],[38.7896401,48.1241558],[38.7882522,48.1245958],[38.7859276,48.1246486],[38.7847553,48.1245179],[38.7828767,48.1250284],[38.7808044,48.1259096],[38.7806317,48.126409],[38.7815653,48.1275101],[38.7810661,48.129565],[38.780595,48.1300067],[38.7801038,48.1301628],[38.7792304,48.129947],[38.7767416,48.1284574],[38.775127,48.1270551],[38.7741461,48.1270389],[38.7731625,48.1276223],[38.7718392,48.1278766],[38.7710216,48.1295026],[38.7705075,48.1300013],[38.770208,48.1302291],[38.7697171,48.1302995],[38.7686085,48.1302259],[38.7671512,48.1317791],[38.7662963,48.1321771],[38.7659341,48.132105],[38.765829,48.1317622],[38.7659841,48.1304918],[38.7656647,48.130377],[38.765195,48.1304902],[38.7632901,48.1319711],[38.7622863,48.1322689],[38.7612633,48.1321097],[38.7601995,48.131565],[38.7576187,48.1316166],[38.7546306,48.1320814],[38.7500151,48.1338847],[38.7474118,48.1341502],[38.7454473,48.1346027],[38.7411176,48.1346073],[38.7399469,48.1341478],[38.7386455,48.1342163],[38.7373214,48.1345559],[38.733218,48.1361597],[38.731613,48.1365408],[38.7291739,48.1367129],[38.7216423,48.1389356],[38.7168429,48.1415499],[38.7141784,48.141836],[38.7117396,48.1423358],[38.70468,48.1431096],[38.7022654,48.1435445],[38.6897986,48.1460426],[38.6882617,48.1469763],[38.687012,48.1472767],[38.6864305,48.1472952],[38.6844974,48.1462236],[38.6824673,48.1455474],[38.6740668,48.148535],[38.6627308,48.1507506],[38.6645792,48.1525925],[38.6717457,48.162151],[38.6706197,48.1639561],[38.6689874,48.1648024],[38.6499994,48.1643466],[38.6457081,48.1643822],[38.6410942,48.1640778],[38.6385251,48.1633083],[38.6376809,48.1631998],[38.6350638,48.1632445],[38.6282595,48.1651819],[38.6143334,48.1695768],[38.6099054,48.1702147],[38.6016265,48.1725099],[38.6014285,48.172944],[38.6026313,48.1753621],[38.602172,48.176089],[38.6006235,48.1774538],[38.5998384,48.1777604],[38.5987974,48.1789465],[38.5981484,48.1800388],[38.601011,48.1825234],[38.6015661,48.1843576],[38.6023767,48.1853598],[38.6032259,48.1859814],[38.6034709,48.1865057],[38.6034627,48.1875764],[38.6042374,48.1887774],[38.604978,48.189167],[38.60733,48.189065],[38.6099946,48.1896214],[38.6108086,48.190219],[38.6113373,48.190887],[38.6116883,48.1915307],[38.6115366,48.1927675],[38.6092816,48.1935183],[38.6082088,48.1941048],[38.6081658,48.1947055],[38.6087451,48.195292],[38.6095606,48.1957067],[38.6106571,48.1966451],[38.6108287,48.197446],[38.6104425,48.1979752],[38.610464,48.1987333],[38.6111935,48.200092],[38.6112489,48.2005867],[38.6110862,48.2011683],[38.6117621,48.2027844],[38.6129208,48.2033028],[38.6133854,48.2037983],[38.6134215,48.2042346],[38.6118318,48.2051369],[38.6104371,48.205498],[38.6099168,48.2057518],[38.6096217,48.2061701],[38.6089114,48.206283],[38.6084093,48.2066027],[38.6079802,48.2069673],[38.608125,48.2082472],[38.6079298,48.2086175],[38.6072078,48.2086655],[38.6055479,48.2094434],[38.6041018,48.2107211],[38.6041071,48.2114646],[38.603855,48.2119722],[38.6034741,48.2122939],[38.6018862,48.2126871],[38.6012993,48.2130396],[38.6011244,48.2133162],[38.6003627,48.2133734],[38.5986332,48.2147196],[38.5975035,48.2160651],[38.5969456,48.2163546],[38.5959832,48.2178687],[38.5948535,48.220708],[38.5922234,48.223578],[38.5924636,48.2247532],[38.5923303,48.2249312],[38.5914526,48.2249386],[38.5901915,48.226563],[38.5894549,48.2269066],[38.589035,48.2273477],[38.5891685,48.228208],[38.5889259,48.2289617],[38.5889417,48.2294246],[38.5891509,48.2300071],[38.5885926,48.2308076],[38.5889327,48.231273],[38.5889789,48.2317873],[38.5894643,48.2321842],[38.5885197,48.232829],[38.588814,48.2330731],[38.5900673,48.2334687],[38.5903036,48.2343718],[38.590145,48.2348095],[38.5887248,48.2343347],[38.5881863,48.2344596],[38.5884363,48.2356143],[38.5878085,48.236752],[38.5875453,48.2382653],[38.5895959,48.2396081],[38.5893979,48.2398691],[38.5889513,48.240046],[38.5888404,48.2405453],[38.5881808,48.2406262],[38.5878937,48.2408869],[38.5877996,48.2415172],[38.5879716,48.2422792],[38.5877689,48.2431232],[38.588817,48.2434601],[38.5881381,48.2437194],[38.5890936,48.244508],[38.5895333,48.2452115],[38.5891684,48.2462929],[38.5893256,48.2466741],[38.5899438,48.2473307],[38.5897088,48.2477582],[38.5891175,48.2481963],[38.5892028,48.2486606],[38.5898127,48.2489062],[38.5893028,48.2495175],[38.5901035,48.2496394],[38.5897415,48.2503519],[38.5898495,48.2506739],[38.5902523,48.2510795],[38.5909095,48.2513197],[38.5911911,48.2517491],[38.5906318,48.2526275],[38.5892861,48.2538362],[38.5887995,48.2545245],[38.5885276,48.2551065],[38.5885679,48.2567485],[38.5882455,48.2569614],[38.5882967,48.2572353],[38.5877545,48.258197],[38.5848872,48.2602568],[38.582357,48.2624605],[38.5786179,48.264291],[38.57568,48.2661837],[38.5753142,48.2673126],[38.5733298,48.2680786],[38.5713119,48.2682104],[38.5688685,48.2697739],[38.56764,48.2698098],[38.5669617,48.2700742],[38.5244765,48.272712],[38.5240199,48.2784578],[38.5210368,48.2785637],[38.5210936,48.2729752],[38.4595946,48.276404],[38.4317598,48.2782552],[38.4270415,48.2782877],[38.4275846,48.2793181],[38.4275287,48.2797848],[38.4262163,48.2807528],[38.4260605,48.2813202],[38.42624,48.2818969],[38.4274751,48.2827835],[38.4281588,48.2835869],[38.4283873,48.284252],[38.4281824,48.2848301],[38.4276445,48.2852034],[38.4266159,48.2855896],[38.4250898,48.2866753],[38.4248693,48.2872429],[38.4249672,48.2881049],[38.4261055,48.2886303],[38.4270869,48.288764],[38.4279409,48.2893989],[38.428944,48.289649],[38.4294942,48.2900808],[38.4293206,48.2904684],[38.4287015,48.2906167],[38.4279658,48.2902483],[38.4275653,48.2902235],[38.4274095,48.2904673],[38.4278331,48.2908779],[38.4279481,48.2916372],[38.4285399,48.2919008],[38.4287154,48.292216],[38.4281042,48.2931536],[38.4281847,48.2934769],[38.4299962,48.2950715],[38.4317639,48.2954819],[38.4332209,48.2961317],[38.4336471,48.2966355],[38.4337894,48.2971971],[38.4336371,48.2988915],[38.4332719,48.2995756],[38.4329075,48.2999328],[38.4303969,48.3006929],[38.4299388,48.3014344],[38.4299246,48.3022457],[38.4289034,48.303076],[38.4283645,48.3029628],[38.4279828,48.3031279],[38.4281481,48.3043525],[38.4273466,48.3060825],[38.4281664,48.3083439],[38.4283513,48.3086695],[38.4300665,48.3091912],[38.4309835,48.3096411],[38.431595,48.3102561],[38.4315356,48.3105818],[38.4318416,48.3109961],[38.4316797,48.3114793],[38.4326088,48.3121233],[38.4327695,48.3128882],[38.4339427,48.3134006],[38.4345595,48.3138609],[38.4346106,48.3147145],[38.4362402,48.3155446],[38.4386854,48.315707],[38.4411454,48.3164583],[38.4402466,48.3181949],[38.4397578,48.3204878],[38.4393729,48.323474],[38.437043,48.3232138],[38.4334453,48.3392632],[38.434074,48.3397013],[38.4446105,48.3408137],[38.4448266,48.3414113],[38.4563502,48.3425761],[38.45571,48.3468162],[38.4608739,48.3475664],[38.4610726,48.3480948],[38.4636564,48.348458],[38.4641873,48.3488393],[38.4617699,48.3502347],[38.4635549,48.3520133],[38.4687245,48.349944],[38.4697679,48.3490855],[38.4720208,48.3500933],[38.470712,48.3510007],[38.4717713,48.3533683],[38.4709524,48.3553334],[38.4735142,48.35605],[38.4710095,48.3600359],[38.4841171,48.3615025],[38.4848237,48.3608276],[38.4868568,48.361872],[38.4848666,48.3644934],[38.4828308,48.3655537],[38.4823024,48.3652044],[38.4774386,48.3675526],[38.4728536,48.367546],[38.4724506,48.3692288],[38.4719893,48.372396],[38.4708292,48.3747463],[38.4703531,48.375201],[38.4685913,48.3791478],[38.4649753,48.379202],[38.4595262,48.3797476],[38.4534124,48.3811448],[38.4500969,48.3759133],[38.4475694,48.3800233],[38.4429384,48.3862986],[38.4431323,48.3863956],[38.442527,48.3877603],[38.4414204,48.3895703],[38.4391053,48.3915523],[38.4366438,48.3960769],[38.4381811,48.3993936],[38.4374048,48.4023171],[38.4374395,48.4040924],[38.4366703,48.405345],[38.4374217,48.4059147],[38.4379551,48.4074899],[38.4386411,48.4078078],[38.4380919,48.4084527],[38.4386261,48.4096691],[38.4383648,48.4105074],[38.4392129,48.4121924],[38.4381434,48.4137264],[38.4384335,48.4162834],[38.4393977,48.4175264],[38.4383843,48.4187171],[38.4391082,48.4198981],[38.4364814,48.4232156],[38.4359426,48.4249528],[38.4362015,48.4252224],[38.4351417,48.4256596],[38.4357387,48.426697],[38.4346934,48.4286602],[38.4351602,48.4288136],[38.4334764,48.4319743],[38.4333357,48.4338785],[38.4322942,48.4351155],[38.43346,48.4360137],[38.4332641,48.4368277],[38.4345859,48.4377446],[38.4340544,48.4386244],[38.4342325,48.4394457],[38.4338138,48.4398644],[38.4339534,48.4404326],[38.4336059,48.4408445],[38.433516,48.4412494],[38.4331043,48.4416173],[38.4327311,48.4424854],[38.433439,48.4432132],[38.4336394,48.4442295],[38.4331929,48.4466888],[38.4333354,48.4475139],[38.4331875,48.4476651],[38.4316617,48.4475787],[38.4231323,48.4450843],[38.4178752,48.4438388],[38.4154022,48.4428246],[38.4128755,48.4421129],[38.4006768,48.4397713],[38.4029084,48.4344542],[38.393392,48.4321584],[38.3847392,48.4298555],[38.3824003,48.4294141],[38.3804476,48.4300833],[38.3797181,48.4304998],[38.3751315,48.4414118],[38.3745038,48.4414581],[38.37349,48.4420951],[38.3721489,48.4425648],[38.3715427,48.4425328],[38.3698529,48.4429421],[38.3689034,48.442999],[38.3670902,48.4426253],[38.3656365,48.4432766],[38.3650464,48.442967],[38.3644912,48.4430951],[38.3636972,48.4429563],[38.3621979,48.4433139],[38.360948,48.4424332],[38.3606449,48.4423798],[38.3597168,48.4426965],[38.3595344,48.4420987],[38.3589926,48.4414937],[38.3585179,48.4411734],[38.3576542,48.4410844],[38.3571821,48.4406663],[38.3559322,48.4405471],[38.3553314,48.441072],[38.3533332,48.4414688],[38.3524024,48.4411894],[38.3495808,48.4407784],[38.3484596,48.4401111],[38.3470649,48.4398229],[38.3456084,48.4388549],[38.3434197,48.4370025],[38.3429986,48.4369508],[38.3407992,48.4373299],[38.3397022,48.4386645],[38.3397692,48.4393335],[38.3391416,48.4393015],[38.3387607,48.4398638],[38.3374035,48.4398353],[38.3373767,48.4402446],[38.3108872,48.4557299],[38.3149749,48.4599349],[38.3188212,48.4646625],[38.3047879,48.4700867],[38.2981092,48.472466],[38.2961512,48.4733481],[38.2929647,48.4744292],[38.2889092,48.4760722],[38.2881689,48.4761967],[38.2891881,48.4771035],[38.2910603,48.4765985],[38.2924712,48.4772742],[38.2966554,48.4763958],[38.2980394,48.477164],[38.2991499,48.4771142],[38.3002442,48.4766874],[38.3007431,48.4770928],[38.3038545,48.4745608],[38.3052224,48.4753823],[38.3044553,48.4759051],[38.3039296,48.4768581],[38.3040583,48.4768652],[38.3036238,48.4774271],[38.3031034,48.4789171],[38.303082,48.4795465],[38.3027333,48.48072],[38.3020091,48.4827362],[38.301875,48.4839096],[38.3021218,48.4844536],[38.3026689,48.4849727],[38.3027762,48.4855025],[38.3025402,48.4858901],[38.3023578,48.4870705],[38.3024543,48.4875931],[38.3019501,48.4883718],[38.3002549,48.4893566],[38.2995039,48.4896126],[38.3093262,48.4933064],[38.3115095,48.4927269],[38.3127165,48.4941525],[38.3147603,48.4961717],[38.3150339,48.496872],[38.3165574,48.4987844],[38.3159405,48.4990013],[38.3133709,48.5006293],[38.3088863,48.501589],[38.3093959,48.5021932],[38.3117831,48.5022537],[38.3119333,48.5023745],[38.3115309,48.5027619],[38.3119011,48.5031778],[38.312003,48.5036825],[38.311767,48.5043401],[38.3119011,48.5049372],[38.3120781,48.5050331],[38.3119628,48.5061989],[38.3130223,48.506764],[38.3128157,48.506979],[38.3145967,48.5082905],[38.3149266,48.5083864],[38.3158895,48.5082247],[38.3161873,48.5080133],[38.3175981,48.5082265],[38.3187997,48.5080683],[38.3206317,48.5081625],[38.31873,48.5092589],[38.3183277,48.5098702],[38.3164769,48.5112633],[38.3089936,48.5175602],[38.2922566,48.5307769],[38.2845533,48.5366594],[38.2818684,48.5355227],[38.276276,48.5407049],[38.2788145,48.5415216],[38.2737225,48.5453326],[38.2790977,48.5459789],[38.2792211,48.5461192],[38.2787839,48.5477102],[38.2776671,48.5540536],[38.2776225,48.5546435],[38.2777888,48.5547784],[38.2775152,48.5566567],[38.2771289,48.5575408],[38.275584,48.567137],[38.273811,48.5759736],[38.2729822,48.5813202],[38.2723546,48.5839783],[38.2723626,48.5878267],[38.2716116,48.5900923],[38.2715017,48.5900994],[38.2715124,48.5913483],[38.2706433,48.5957514],[38.2700372,48.6005266],[38.2665825,48.6193994],[38.2661533,48.6208462],[38.2662821,48.6209579],[38.2657993,48.6233072],[38.2656008,48.6236582],[38.2655203,48.6253638],[38.2649356,48.6290654],[38.2634819,48.6370174],[38.2551342,48.6364231],[38.2294323,48.6339667],[38.22888,48.6340971],[38.2288277,48.6350321],[38.2279962,48.6389812],[38.2257673,48.6522761],[38.2259282,48.6527031],[38.2310271,48.6531727],[38.2330227,48.6531124],[38.2387143,48.6549126],[38.2382315,48.6568049],[38.238599,48.6566845],[38.2450068,48.6574747],[38.2525706,48.6579814],[38.2531553,48.6548772],[38.2601666,48.6551855],[38.2598716,48.656727],[38.2659066,48.6563833],[38.2658046,48.6573046],[38.2651448,48.6588779],[38.2651555,48.6602988],[38.2653969,48.6615212],[38.2670492,48.6637463],[38.2739156,48.6636834],[38.2751816,48.6645364],[38.2868224,48.6647738],[38.2855242,48.6724403],[38.2845908,48.6769992],[38.2835314,48.6810991],[38.284843,48.6821404],[38.2893008,48.6823476],[38.2912213,48.6820607],[38.29584,48.682978],[38.304128,48.6833853],[38.3065259,48.6821492],[38.3081299,48.683063],[38.3094549,48.6834065],[38.3102649,48.6839236],[38.3153021,48.6843592],[38.3140388,48.686918],[38.3104017,48.6868401],[38.3072501,48.6877644],[38.3132489,48.6945652],[38.314181,48.6962506],[38.314653,48.7045779],[38.3110213,48.7064506],[38.3093315,48.70764],[38.3086181,48.7078595],[38.3083069,48.7084613],[38.307336,48.7083162],[38.3049005,48.7099587],[38.3041522,48.7108401],[38.3046055,48.7124259],[38.3075774,48.7127409],[38.3079421,48.7126064],[38.3111662,48.7128365],[38.3251351,48.7140328],[38.3231449,48.7284226],[38.3224636,48.7299476],[38.3198512,48.7334541],[38.3167881,48.7349118],[38.3032054,48.7361006],[38.3007914,48.7366914],[38.2972616,48.7369568],[38.2971597,48.7372079],[38.2894403,48.7368471],[38.2876217,48.736886],[38.2831088,48.7373719],[38.2824317,48.7386355],[38.2765174,48.743314],[38.2644916,48.7505522],[38.2640934,48.750102],[38.2631332,48.7502753],[38.2657281,48.7546333],[38.2680201,48.7593044],[38.2709907,48.7643531],[38.2754016,48.7728008],[38.2831317,48.7734726],[38.2824343,48.7772411],[38.2819676,48.778344],[38.2821768,48.7786304],[38.2808411,48.7852439],[38.2779658,48.8012598],[38.2785505,48.8025566],[38.2819515,48.8026979],[38.2831907,48.8024824],[38.2834643,48.8030194],[38.2840919,48.8028781],[38.3119816,48.8052383],[38.3154416,48.8058248],[38.3162731,48.8056622],[38.3167452,48.8057329],[38.3170617,48.806383],[38.3176303,48.8067504],[38.3179253,48.8073475],[38.3180487,48.8085911],[38.3171582,48.8105094],[38.3166754,48.8125371],[38.3158649,48.8183983],[38.3151144,48.8211418],[38.3137518,48.8284843],[38.2724243,48.8246666],[38.2713568,48.8311523],[38.2711905,48.8311699],[38.2709491,48.8324006],[38.2679933,48.8359034],[38.2609954,48.8412807],[38.2598126,48.8427742],[38.2546467,48.842174],[38.2431561,48.8412666],[38.221752,48.839233],[38.2212424,48.8392965],[38.2213014,48.8406205],[38.2221168,48.8412913],[38.2229268,48.8428624],[38.2236886,48.8434096],[38.2238549,48.844317],[38.2237905,48.8454855],[38.2240212,48.8460186],[38.2239187,48.8463353],[38.2245469,48.8470423],[38.2250512,48.8486026],[38.2248956,48.8487968],[38.2248634,48.8505724],[38.2262528,48.8518078],[38.2267777,48.852607],[38.2264674,48.8535515],[38.2267302,48.8540175],[38.2267141,48.854614],[38.2264996,48.855041],[38.2265103,48.8555952],[38.2262501,48.8559199],[38.2267839,48.8559552],[38.2271755,48.8567493],[38.2268214,48.8574411],[38.229112,48.8586976],[38.2290798,48.8592023],[38.2288331,48.8593717],[38.2290369,48.860494],[38.2291388,48.863949],[38.2289243,48.8653464],[38.2291549,48.8661016],[38.2286882,48.8676896],[38.2286936,48.8680742],[38.2289886,48.8683177],[38.2289994,48.8784722],[38.2288757,48.8785518],[38.2287151,48.8859367],[38.2283449,48.8882472],[38.2286507,48.8905892],[38.2285005,48.8943877],[38.228699,48.8971457],[38.2284898,48.9019628],[38.2284844,48.9123784],[38.2286829,48.9161506],[38.228538,48.9200142],[38.2286936,48.9222314],[38.2284683,48.925245],[38.2283127,48.9253367],[38.2284576,48.9278849],[38.2279472,48.933072],[38.2279914,48.9367431],[38.2266498,48.9359095],[38.2236291,48.9346418],[38.2197674,48.9336408],[38.216393,48.9322903],[38.2114738,48.9307573],[38.2059646,48.9296894],[38.2034165,48.928974],[38.1991357,48.9281704],[38.1956434,48.9277686],[38.1887019,48.928396],[38.1855905,48.9291784],[38.1831551,48.9293441],[38.1824577,48.9291537],[38.1811429,48.9291437],[38.1714419,48.9305776],[38.1673086,48.931441],[38.1643206,48.931004],[38.1633711,48.9306199],[38.1606299,48.9305036],[38.1527488,48.9309257],[38.1511724,48.9311732],[38.1465742,48.9325725],[38.1447083,48.9325899],[38.1436032,48.9328648],[38.1425706,48.9328947],[38.1416774,48.9324877],[38.1403416,48.9313399],[38.1397837,48.9304824],[38.1394887,48.9293194],[38.1379246,48.9261712],[38.1362432,48.9250794],[38.1333625,48.92374],[38.1320912,48.9238775],[38.1299722,48.9256997],[38.1283468,48.9263447],[38.126952,48.9265456],[38.1203538,48.9264822],[38.1190181,48.9266549],[38.1177145,48.9271307],[38.1166041,48.9279907],[38.1165022,48.9293863],[38.1160301,48.9309194],[38.115263,48.9315961],[38.1122911,48.9326005],[38.1074321,48.9328397],[38.1050491,48.9333722],[38.0957687,48.934655],[38.0942506,48.9353704],[38.0940789,48.9373508],[38.0937839,48.9379639],[38.0931026,48.9387462],[38.0921853,48.9393804],[38.0911499,48.9395425],[38.0862844,48.9396976],[38.080067,48.9394086],[38.0747509,48.9382529],[38.0686247,48.9376397],[38.0640113,48.9368046],[38.0627673,48.9369513],[38.0594677,48.9380837],[38.0580515,48.9387885],[38.0561512,48.9394709],[38.0549347,48.9396518],[38.0537975,48.9395869],[38.0502528,48.9382109],[38.0465823,48.9362654],[38.044678,48.9350285],[38.0434388,48.933707],[38.0428594,48.9323643],[38.0425376,48.9314269],[38.0422854,48.9292172],[38.0418616,48.9286533],[38.0393672,48.9266514],[38.0389059,48.9257033],[38.037377,48.9248644],[38.0314761,48.9268769],[38.0319804,48.9281951],[38.0343857,48.9303231],[38.0363202,48.9303062],[38.0367064,48.9317547],[38.0357623,48.9322516],[38.0354165,48.9339472],[38.036229,48.9351695],[38.0357248,48.9352364],[38.0356067,48.9349369],[38.0351454,48.9348136],[38.0349308,48.934884],[38.0349415,48.9351202],[38.0334771,48.9352505],[38.0333537,48.9348241],[38.032887,48.9345739],[38.0330694,48.934285],[38.0329245,48.9340841],[38.0325383,48.9340101],[38.03249,48.9334921],[38.031798,48.9334498],[38.0316424,48.9332489],[38.0311274,48.9331573],[38.030929,48.9332418],[38.0312508,48.9336084],[38.0305803,48.9336929],[38.0301565,48.9339149],[38.0302906,48.9341687],[38.0298346,48.934218],[38.0296737,48.9339396],[38.0293465,48.9339925],[38.0289495,48.9338233],[38.0290997,48.9335379],[38.0287993,48.9333546],[38.0284077,48.9333758],[38.0276352,48.9328013],[38.0273348,48.9328084],[38.0274904,48.9332736],[38.0270398,48.9331537],[38.0266857,48.9333088],[38.0266857,48.932967],[38.0263263,48.9329634],[38.0265087,48.9325652],[38.0257523,48.9327238],[38.0256665,48.9323291],[38.0254465,48.9321388],[38.0247277,48.9321529],[38.0246043,48.9323009],[38.0249637,48.9324243],[38.0251032,48.9327027],[38.0247384,48.9328542],[38.024261,48.9327097],[38.0238426,48.9328894],[38.0240464,48.9330304],[38.0236977,48.9333476],[38.0232364,48.9334427],[38.023054,48.9332278],[38.0225927,48.9332454],[38.0225605,48.9330375],[38.0223459,48.932967],[38.0221367,48.9330833],[38.0217987,48.9329705],[38.0215949,48.9331044],[38.0216646,48.9334251],[38.0214286,48.9333511],[38.0208439,48.9335978],[38.0206829,48.9338092],[38.0211067,48.9339255],[38.0201358,48.9345211],[38.0205488,48.9346515],[38.0206186,48.93481],[38.0200714,48.9351342],[38.0207389,48.9353795],[38.0200767,48.9355959],[38.0206883,48.9357263],[38.0206078,48.9359166],[38.0200499,48.9361174],[38.0205005,48.9362795],[38.0205381,48.9366742],[38.0198997,48.9367834],[38.01983,48.9365015],[38.0189341,48.9364628],[38.0186337,48.9367235],[38.01902,48.9370266],[38.0187678,48.9375023],[38.0178398,48.9376573],[38.0181295,48.9382529],[38.017754,48.9385312],[38.0179632,48.939169],[38.0175286,48.9395601],[38.0170888,48.9392959],[38.0160803,48.9401274],[38.0164987,48.9406877],[38.0164719,48.940878],[38.0159998,48.9412374],[38.0159193,48.9415474],[38.0165309,48.9415016],[38.0168474,48.9416849],[38.0167723,48.9420689],[38.0160695,48.9421218],[38.0160266,48.9424142],[38.0157101,48.9426714],[38.014884,48.9428582],[38.0146748,48.9426573],[38.0146426,48.942231],[38.0142134,48.9419315],[38.0135482,48.9427278],[38.0130333,48.9430343],[38.0127436,48.9430449],[38.0123627,48.9425164],[38.0118048,48.9426256],[38.011601,48.943281],[38.0111557,48.9431823],[38.0108392,48.9435347],[38.0104369,48.9434924],[38.0104262,48.9432316],[38.010909,48.9429357],[38.0109143,48.9427348],[38.0104208,48.9427595],[38.0093265,48.943429],[38.0095464,48.9439539],[38.009423,48.9441935],[38.0082589,48.9443063],[38.0080336,48.9445599],[38.0075289,48.9446747],[38.0074435,48.9453139],[38.0067515,48.9460749],[38.0058503,48.9465823],[38.0063136,48.9479108],[38.0090582,48.9509367],[38.010115,48.9506866],[38.0109626,48.9508768],[38.0103242,48.9523458],[38.0286759,48.973432],[38.0309236,48.9739179],[38.0347377,48.9723334],[38.0348182,48.9718016],[38.0368084,48.9710058],[38.03801,48.9708544],[38.0493879,48.966382],[38.0496454,48.9665475],[38.0537116,48.9648958],[38.052274,48.9715446],[38.0576545,48.975837],[38.051767,48.979409],[38.0504742,48.9832096],[38.0524671,48.9857249],[38.0578691,48.9875291],[38.06517,48.9892118],[38.067466,48.9894617],[38.0720509,48.9906424],[38.076666,48.9915139],[38.0802226,48.9920207],[38.0950619,48.9918459],[38.0984884,48.9924678],[38.098526,48.9937032],[38.0980432,48.9955159],[38.098011,48.9976347],[38.097775,48.9993628],[38.0974048,48.9993382],[38.0942291,49.0048809],[38.0914074,49.0088925],[38.0874431,49.0151343],[38.0869549,49.0151203],[38.0868208,49.0153877],[38.087132,49.0154897],[38.0862039,49.0166753],[38.0866277,49.0167492],[38.0846107,49.0191063],[38.0761617,49.0341366],[38.0729162,49.0394966],[38.0711951,49.0409812],[38.0542266,49.0573748],[38.0533281,49.0583467],[38.0526388,49.0595841],[38.05722,49.0612485],[38.0581748,49.0612801],[38.0601477,49.0620075],[38.0622572,49.0632345],[38.063271,49.0676384],[38.0632549,49.069589],[38.0636465,49.0726395],[38.0637914,49.0728644],[38.0655174,49.0834929],[38.0657682,49.0834911],[38.0664893,49.0878053],[38.0671334,49.0934745],[38.0676538,49.095958],[38.0756079,49.11356],[38.0839616,49.1353431],[38.0827922,49.1412567],[38.0821538,49.1424534],[38.0821001,49.1429798],[38.0823898,49.1435132],[38.0815852,49.148068],[38.0812633,49.1481487],[38.0689064,49.1468276],[38.0681151,49.1466328],[38.0668384,49.1466223],[38.0612808,49.1479943],[38.0610394,49.1478925],[38.0509114,49.1501206],[38.043648,49.1504996],[38.0435461,49.1493733],[38.042838,49.1464854],[38.0415988,49.1422288],[38.0411106,49.1380069],[38.0406707,49.1313593],[38.0401745,49.1265537],[38.0397856,49.1265397],[38.0124941,49.1285897],[37.9807073,49.130659],[37.9795915,49.1312575],[37.9795995,49.1315242],[37.9776174,49.1332986],[37.9761744,49.1342954],[37.9587722,49.1359853],[37.9591611,49.1365294],[37.9600583,49.1372295],[37.9594508,49.138865],[37.9586542,49.1387983],[37.9583068,49.1390229],[37.9578549,49.1400319],[37.9577674,49.1416017],[37.9574485,49.1420849],[37.9557708,49.1428307],[37.9484484,49.1394599],[37.9448006,49.1390247],[37.9268901,49.1435746],[37.9187617,49.1473785],[37.9155296,49.1497031],[37.9040095,49.154231],[37.9022017,49.1557326],[37.9013514,49.1561623],[37.8995544,49.1574657],[37.8931224,49.1603634],[37.8928462,49.1606054],[37.90236,49.1663539],[37.9025383,49.1668335],[37.893514,49.1748564],[37.8933772,49.1751721],[37.8981194,49.1771973],[37.9001659,49.178607],[37.9005226,49.1783931],[37.905187,49.1805795],[37.9062653,49.1818121],[37.9076546,49.183916],[37.9085371,49.1841702],[37.9101169,49.1849556],[37.9106319,49.1848083],[37.913813,49.1865895],[37.9349032,49.1916819],[37.9276666,49.2001723],[37.9231042,49.2058837],[37.9229084,49.2054596],[37.9226455,49.2053352],[37.9218408,49.2059625],[37.9199794,49.2050057],[37.9193813,49.20499],[37.9191586,49.2050986],[37.9196146,49.2056611],[37.9200625,49.2058346],[37.9193893,49.206448],[37.9193732,49.2066285],[37.9204273,49.206851],[37.9220903,49.2068755],[37.9241878,49.2075344],[37.9246974,49.2075519],[37.9262075,49.2083317],[37.9262772,49.2086594],[37.9286161,49.209327],[37.9287744,49.2096232],[37.9300109,49.2099701],[37.9300269,49.2102803],[37.9302523,49.2105624],[37.9297064,49.2113062],[37.9310623,49.2118292],[37.9332617,49.2129839],[37.9378831,49.2140159],[37.9380642,49.2124986],[37.9425636,49.2141219],[37.9383257,49.2167062],[37.9334722,49.2207777],[37.9300404,49.2196399],[37.9275513,49.2190985],[37.9262853,49.2184608],[37.9261538,49.218177],[37.9249281,49.2177092],[37.9176351,49.2153615],[37.9160553,49.2152897],[37.8930634,49.2120009],[37.8929883,49.2122077],[37.8896007,49.2118835],[37.8896677,49.2180158],[37.8899279,49.2182033],[37.889835,49.2191761],[37.8813958,49.2212148],[37.8812349,49.2209188],[37.8786761,49.2215039],[37.8732017,49.223261],[37.8745133,49.2339965],[37.8608662,49.2325078],[37.8566819,49.2286369],[37.8541177,49.2260234],[37.8532326,49.2236131],[37.8519237,49.2220645],[37.8504914,49.222061],[37.8465942,49.2048638],[37.8442338,49.2049812],[37.8435096,49.201336],[37.8355944,49.2021492],[37.8246054,49.2026627],[37.8246027,49.2064602],[37.8121251,49.2066197],[37.8054276,49.2073627],[37.8052828,49.2079147],[37.7983037,49.2088276],[37.7979898,49.2051144],[37.7975285,49.2022964],[37.7598059,49.2100315],[37.7510726,49.2119274],[37.7463734,49.2131609],[37.7456492,49.2129822],[37.7118835,49.2199773],[37.6603979,49.2267942],[37.6485962,49.228425],[37.6485023,49.2285633],[37.6384681,49.2299015],[37.6384225,49.2297754],[37.6262373,49.2314709],[37.6262587,49.23159],[37.6142746,49.2331348],[37.5971299,49.2300347],[37.578569,49.2312993],[37.5684732,49.2314008],[37.5610059,49.2280431],[37.5484505,49.2128875],[37.5287014,49.2068528],[37.5230849,49.2039998],[37.5129729,49.1992925],[37.5076407,49.1914751],[37.5024426,49.187026],[37.502566,49.186479],[37.5029911,49.1862713],[37.5043416,49.1859198],[37.5047573,49.1860969],[37.505028,49.1851869],[37.5058061,49.1850485],[37.506423,49.1851326],[37.5060877,49.1848364],[37.5061226,49.1845857],[37.5058785,49.1845243],[37.505849,49.183958],[37.5067019,49.1840211],[37.5073779,49.1837091],[37.5072598,49.1835303],[37.5079787,49.1831551],[37.5100601,49.1827694],[37.5104088,49.1830218],[37.5112188,49.1815175],[37.5120181,49.1817911],[37.5127262,49.1810687],[37.5096524,49.179645],[37.5096416,49.1792979],[37.5110954,49.1788245],[37.5119269,49.1788245],[37.5127235,49.1793662],[37.5134799,49.1786859],[37.5142792,49.178828],[37.5161996,49.1786947],[37.5167119,49.178472],[37.5170445,49.1778846],[37.5186646,49.1776216],[37.5223231,49.1763206],[37.5250429,49.1759874],[37.5264001,49.1760471],[37.5291413,49.1752089],[37.5294846,49.175251],[37.5304717,49.1758717],[37.5334328,49.1747845],[37.5334167,49.1744093],[37.5339049,49.1738482],[37.5379148,49.1723787],[37.5381482,49.1721858],[37.5381321,49.1718596],[37.5386202,49.1716702],[37.5393122,49.1710459],[37.5468385,49.1687135],[37.5485605,49.1687942],[37.5507224,49.168226],[37.5537103,49.1668511],[37.5542629,49.1662793],[37.5565642,49.1630347],[37.5577712,49.1590672],[37.5595415,49.1542608],[37.5643802,49.1475223],[37.5627413,49.1436606],[37.5630283,49.1423306],[37.5629479,49.1419586],[37.5631303,49.1416077],[37.5639188,49.1415831],[37.564171,49.1413059],[37.564466,49.1403548],[37.5642568,49.1399758],[37.5627172,49.1396038],[37.5615156,49.1395336],[37.5606412,49.1398143],[37.5602281,49.1405303],[37.5586349,49.1407198],[37.5580823,49.1409584],[37.557562,49.141262],[37.5576425,49.1416971],[37.5586081,49.1421499],[37.5589822,49.1428429],[37.5564837,49.1432676],[37.554751,49.1446537],[37.5541717,49.1454818],[37.5545472,49.1461907],[37.554397,49.1465275],[37.5534314,49.1469907],[37.5502825,49.1479838],[37.5476915,49.1463766],[37.5483513,49.1457871],[37.5482386,49.1456889],[37.5452721,49.1455415],[37.5419569,49.1457836],[37.5409323,49.1456573],[37.5414795,49.1449906],[37.5426328,49.1449028],[37.5436735,49.1437518],[37.5452024,49.1430359],[37.5480509,49.1427833],[37.5490648,49.1424359],[37.5520956,49.1408602],[37.5549763,49.1403373],[37.5558615,49.1400179],[37.555958,49.1392177],[37.5564462,49.138772],[37.5578731,49.1377788],[37.5591338,49.1373998],[37.5596327,49.1370242],[37.5612205,49.1369154],[37.5623685,49.1365083],[37.5626582,49.1365925],[37.5625992,49.1368838],[37.5638008,49.136754],[37.5628781,49.1358028],[37.5621378,49.1356414],[37.5621432,49.1351816],[37.5619018,49.134964],[37.5613493,49.1349324],[37.5614458,49.1345709],[37.5610167,49.1342585],[37.5633985,49.1340304],[37.5656676,49.1349324],[37.5659734,49.1353255],[37.5669497,49.1353325],[37.5673252,49.1356625],[37.5680441,49.135852],[37.5689292,49.1353115],[37.570045,49.1359573],[37.5706083,49.1357713],[37.5709623,49.1357993],[37.5710481,49.1359467],[37.5713378,49.1358871],[37.5821793,49.1284915],[37.5834399,49.1273401],[37.5838584,49.1266661],[37.5848991,49.1260061],[37.5775123,49.1236576],[37.5612634,49.1177804],[37.5464791,49.1122221],[37.5356135,49.1104734],[37.4934196,49.1031723],[37.4890637,49.1026104],[37.4873418,49.1017569],[37.4869877,49.1011423],[37.4855983,49.0999973],[37.492497,49.0956559],[37.4921536,49.0936747],[37.4964237,49.0927544],[37.5004309,49.0913738],[37.4981028,49.0889112],[37.5007904,49.0858337],[37.5057578,49.0814489],[37.5068736,49.078167],[37.5065088,49.07589],[37.5058973,49.0734653],[37.5060689,49.0719261],[37.5058865,49.0701829],[37.4985802,49.0687139],[37.4966866,49.068148],[37.4924755,49.0655507],[37.4911988,49.0626896],[37.489804,49.0627845],[37.4812049,49.059048],[37.4807757,49.0588231],[37.4815106,49.0581727],[37.4812049,49.057663],[37.4793273,49.0574626],[37.4767792,49.0582395],[37.4756849,49.0582466],[37.475127,49.057895],[37.4749285,49.057315],[37.4752825,49.0566682],[37.4701273,49.0552444],[37.4693441,49.0575681],[37.4680835,49.0570267],[37.4605036,49.0576138],[37.4588352,49.0560389],[37.4573547,49.0565733],[37.4543077,49.0544605],[37.4526983,49.0538945],[37.4515772,49.053216],[37.450515,49.0537433],[37.4493241,49.055262],[37.4504185,49.0563588],[37.4503058,49.058243],[37.4505258,49.0604295],[37.4495494,49.0613821],[37.4462074,49.0589742],[37.4454027,49.0581938],[37.442978,49.0574908],[37.4406606,49.0590199],[37.4386221,49.0618144],[37.4359775,49.0607599],[37.4327373,49.0602994],[37.4319863,49.0592554],[37.4229634,49.0611466],[37.4198949,49.0611044],[37.4191922,49.0612731],[37.4174488,49.0613153],[37.4146914,49.0577685],[37.4137795,49.0560389],[37.4114513,49.0547347],[37.4102282,49.0536871],[37.4093968,49.0525937],[37.4081147,49.0519503],[37.4070525,49.051655],[37.4048048,49.0515917],[37.3940277,49.0505651],[37.3904604,49.0498901],[37.385273,49.0483431],[37.3846132,49.0479247],[37.3840445,49.0471301],[37.3839426,49.0465605],[37.3842752,49.0450274],[37.3845541,49.0447391],[37.384243,49.0445563],[37.3886955,49.0386486],[37.3878533,49.0382759],[37.3868716,49.0374002],[37.3866516,49.0368164],[37.3855519,49.0364437],[37.3852193,49.0360955],[37.3853266,49.0343265],[37.3856699,49.0338763],[37.3864317,49.0312632],[37.3900151,49.0287237],[37.3915118,49.0281257],[37.3922199,49.0248509],[37.3902404,49.0246645],[37.3891246,49.0249846],[37.3865068,49.0245731],[37.3860186,49.0251218],[37.3836905,49.0252168],[37.3753542,49.026272],[37.3732728,49.0196059],[37.3729724,49.0191732],[37.3721194,49.0168477],[37.3720229,49.0140331],[37.3713791,49.0098003],[37.3709392,49.0050463],[37.3707515,49.004434],[37.3706979,49.0035331],[37.3728704,48.9976523],[37.373203,48.9961917],[37.3720819,48.9957588],[37.3678601,48.995178],[37.368316,48.9940799],[37.3673183,48.9932281],[37.3669159,48.9916652],[37.3582417,48.9917321],[37.3598456,48.998629],[37.353875,49.0000033],[37.3516166,49.0007178],[37.3494601,49.0019882],[37.3443961,49.0034979],[37.3442271,49.0034364],[37.3400938,48.9974658],[37.3394823,48.9962938],[37.3365962,48.9949985],[37.332589,48.9941995],[37.3300892,48.9930556],[37.3242688,48.9914118],[37.317456,48.9914012],[37.3113835,48.9900319],[37.3104769,48.9893103],[37.3099458,48.9873073],[37.3124027,48.9857267],[37.3134112,48.9859062],[37.3154497,48.9856739],[37.3190439,48.9848924],[37.3210984,48.9851986],[37.3237055,48.9851669],[37.3237646,48.9838996],[37.3239416,48.9834243],[37.3246068,48.9827871],[37.3208731,48.9824949],[37.3194945,48.9828681],[37.3175579,48.9830828],[37.3165709,48.9827272],[37.316131,48.9822484],[37.316072,48.9817203],[37.3168337,48.9776186],[37.3150527,48.9772031],[37.3143661,48.9773017],[37.3138779,48.9776186],[37.3145968,48.9787875],[37.3141462,48.9800233],[37.3132503,48.9800269],[37.3103267,48.9795692],[37.3094416,48.9797417],[37.3088193,48.9805092],[37.3080683,48.9810162],[37.3041469,48.9791185],[37.3032403,48.9788368],[37.3026556,48.9765482],[37.3014808,48.9755799],[37.3011106,48.9753898],[37.2988898,48.9761327],[37.2980636,48.9755658],[37.2978812,48.9753475],[37.2979993,48.9744884],[37.2992492,48.9727665],[37.2986644,48.9721397],[37.2978705,48.9716573],[37.297318,48.9719319],[37.296288,48.9720657],[37.295478,48.9719284],[37.2947055,48.970791],[37.294625,48.9696536],[37.2954565,48.9681287],[37.296626,48.9671814],[37.2979563,48.9667623],[37.2990721,48.9666778],[37.2994745,48.9668292],[37.3004132,48.9666954],[37.3021084,48.967361],[37.3021299,48.9667975],[37.3025161,48.9667024],[37.3081219,48.9682942],[37.3100799,48.966558],[37.3108202,48.9663467],[37.3103052,48.9656107],[37.3098814,48.9654804],[37.3091787,48.9656494],[37.3071831,48.9652409],[37.3059118,48.9653219],[37.3054719,48.9649415],[37.3047692,48.9641456],[37.3049569,48.9633285],[37.3043239,48.9628037],[37.3049623,48.9611378],[37.3079771,48.9608525],[37.3088247,48.9603594],[37.3091841,48.9598839],[37.3103481,48.959581],[37.3103374,48.9592076],[37.3098171,48.9588026],[37.3106325,48.9583376],[37.3109382,48.9578832],[37.3108739,48.9568935],[37.3125851,48.956587],[37.3196286,48.9568794],[37.3208249,48.9565342],[37.3201865,48.9545897],[37.320224,48.9535048],[37.318781,48.9524022],[37.3164314,48.9522577],[37.3154443,48.951916],[37.3138136,48.9517328],[37.3123759,48.9517152],[37.3112816,48.9520534],[37.3072636,48.9474842],[37.3073119,48.9469698],[37.3081541,48.9449827],[37.3086637,48.9446586],[37.3096722,48.9429639],[37.3110133,48.941854],[37.3142749,48.9417307],[37.3147684,48.9412057],[37.3146236,48.9403706],[37.3147792,48.9398632],[37.3155731,48.93931],[37.3192155,48.9380837],[37.3209858,48.938274],[37.3240918,48.9375058],[37.3252076,48.9376115],[37.3280051,48.9374453],[37.3280615,48.9369526],[37.327289,48.9352541],[37.3276484,48.9352047],[37.3282868,48.9347713],[37.3322457,48.9347819],[37.3290539,48.9250019],[37.3283404,48.9221538],[37.3274285,48.9217943],[37.3265272,48.9217661],[37.3137599,48.9228976],[37.312333,48.9226579],[37.3087174,48.9216709],[37.3060942,48.9205993],[37.3039699,48.9203984],[37.3021352,48.9195242],[37.3012179,48.9196405],[37.2992438,48.9195418],[37.2988361,48.9211492],[37.2990668,48.9215193],[37.2991633,48.9229152],[37.2842487,48.9229694],[37.2694057,48.9226048],[37.2679961,48.9138415],[37.2665745,48.9064057],[37.2529113,48.9080911],[37.2451007,48.9087328],[37.2444785,48.9064692],[37.2237182,48.9088774],[37.2226721,48.9087399],[37.2229832,48.9075869],[37.2235089,48.907118],[37.2232085,48.9058768],[37.2234821,48.9052139],[37.22404,48.904544],[37.2240776,48.9042513],[37.2237503,48.9037964],[37.22139,48.9019663],[37.2208375,48.9007215],[37.2198665,48.8998858],[37.2197914,48.8977134],[37.2184503,48.8963063],[37.21793,48.8963063],[37.2175491,48.8960982],[37.217136,48.895012],[37.2166157,48.8946029],[37.2149473,48.8923492],[37.2156554,48.8896369],[37.2134238,48.8887657],[37.2123134,48.8880144],[37.2115892,48.8872207],[37.2089231,48.8864729],[37.2062731,48.8851748],[37.2052914,48.8854676],[37.2048837,48.885323],[37.2051036,48.8847198],[37.2047657,48.8843423],[37.2040039,48.8841695],[37.2030276,48.8845399],[37.2015631,48.884434],[37.2014719,48.8840001],[37.2004902,48.8835768],[37.2006297,48.8832135],[37.2005439,48.8828678],[37.2002166,48.8825397],[37.1994173,48.8824727],[37.198779,48.8826385],[37.1982962,48.882134],[37.1981835,48.8815661],[37.1978724,48.8813262],[37.1972018,48.8812521],[37.1966386,48.8816049],[37.1961236,48.882381],[37.195496,48.8824656],[37.1949059,48.882321],[37.194407,48.8824903],[37.1939993,48.8823633],[37.1931517,48.8811427],[37.193141,48.88073],[37.1934468,48.8803913],[37.1925992,48.8785533],[37.1926206,48.8769727],[37.1922022,48.875745],[37.1924865,48.8752828],[37.1924919,48.8749829],[37.1934414,48.8744572],[37.1937633,48.8740973],[37.1938384,48.873621],[37.1931517,48.8732152],[37.1923417,48.8733705],[37.1920681,48.8735681],[37.1911025,48.8733952],[37.1907243,48.8698261],[37.1904185,48.8689775],[37.1948576,48.8500958],[37.195099,48.848525],[37.1929961,48.8220707],[37.1921647,48.8145825],[37.1920963,48.8144756],[37.1921366,48.8146259],[37.1871114,48.8162144],[37.1646291,48.8229396],[37.1572316,48.8245042],[37.1511322,48.8324165],[37.1407092,48.8326071],[37.138676,48.8317561],[37.1405375,48.8351054],[37.1415567,48.8355256],[37.142297,48.8369097],[37.1446466,48.8389752],[37.145682,48.8420787],[37.1381181,48.8439886],[37.1354037,48.8421599],[37.1118808,48.8478648],[37.1091181,48.848705],[37.0988131,48.8507912],[37.0942962,48.8434697],[37.0900476,48.8369521],[37.0896613,48.835967],[37.082127,48.8237095],[37.0800644,48.8197855],[37.0783612,48.8176962],[37.0673936,48.8174414],[37.0660311,48.8139184],[37.0607284,48.8140579],[37.0435381,48.8149922],[37.0391473,48.8157994],[37.0338526,48.8161491],[37.0314386,48.8169103],[37.0237648,48.8178852],[37.0206025,48.8079375],[37.0199749,48.8067239],[37.0187545,48.80172],[37.0160025,48.8024806],[37.0073765,48.8033321],[37.0054132,48.7973235],[36.994919,48.7873734],[37.0193258,48.7766366],[37.0192105,48.7763591],[37.023038,48.7748372],[37.0230326,48.7727885],[37.0234014,48.7716536],[37.022936,48.7692565],[37.022936,48.7674745],[37.0431197,48.7661786],[37.0405543,48.7585387],[37.035749,48.7460095],[37.0353842,48.7460201],[37.0344776,48.7466462],[37.0340753,48.747297],[37.0316993,48.749139],[37.0307367,48.7500123],[37.0303404,48.7505942],[37.0297313,48.7509573],[37.0279205,48.7513886],[37.027641,48.7516652],[37.0271736,48.7518133],[37.0269029,48.7517293],[37.0261208,48.7519192],[37.0256206,48.7528426],[37.0249933,48.7533859],[37.0245407,48.7534892],[37.0237662,48.7533725],[37.023236,48.7538537],[37.0222464,48.7541586],[37.0216465,48.7547021],[37.0215695,48.755053],[37.0196337,48.755564],[37.0198172,48.7564046],[37.0191025,48.7571723],[37.0181441,48.7578653],[37.0178049,48.7588806],[37.0178487,48.7593139],[37.0173083,48.7601918],[37.0163569,48.7606053],[37.0131799,48.7627347],[37.0120248,48.7631008],[37.0105105,48.7641934],[37.0084569,48.7650275],[37.00724,48.7651403],[37.0058701,48.7648276],[37.0047773,48.7654287],[37.0021623,48.765429],[37.0015401,48.7656623],[37.0000756,48.768689],[36.9996259,48.7693685],[36.9990121,48.7699028],[36.9979728,48.770044],[36.997311,48.7704269],[36.9968738,48.7703578],[36.9962595,48.7711638],[36.9963881,48.7715413],[36.9961457,48.7717321],[36.9940511,48.7720076],[36.9935636,48.7722092],[36.9931564,48.7731939],[36.9923606,48.7737308],[36.9888319,48.7747006],[36.988047,48.7759491],[36.9861808,48.7769077],[36.986328,48.7776094],[36.9861999,48.7781418],[36.9857054,48.7787847],[36.9858597,48.7790719],[36.9856652,48.7797129],[36.9848827,48.7811325],[36.9834719,48.7824572],[36.9826438,48.782688],[36.982053,48.7832776],[36.9816872,48.784307],[36.980619,48.7848817],[36.9799331,48.7854989],[36.9778105,48.7866572],[36.9777105,48.7872614],[36.9768751,48.7879066],[36.9766893,48.7882321],[36.9768457,48.7886545],[36.976645,48.788908],[36.97598,48.7891107],[36.9754911,48.7901319],[36.9717614,48.7914359],[36.9712061,48.7916738],[36.9711278,48.7919085],[36.9704757,48.7920659],[36.9692999,48.7927583],[36.9681706,48.792919],[36.9660534,48.7935724],[36.9660115,48.793779],[36.9528204,48.7952474],[36.9525576,48.7950088],[36.945785,48.7956803],[36.9448539,48.7947005],[36.9389871,48.7945654],[36.9328647,48.7931192],[36.931419,48.7925059],[36.925625,48.7933169],[36.9213509,48.7947413],[36.9207653,48.7978023],[36.9178927,48.7978146],[36.8806736,48.7994987],[36.8799287,48.7993818],[36.8733165,48.799612],[36.8542182,48.800445],[36.8408119,48.7780786],[36.8405094,48.7797152],[36.8385747,48.7831135],[36.837618,48.7830027],[36.8368583,48.7831333],[36.8357224,48.7828919],[36.8380173,48.7778515],[36.8401386,48.7741925],[36.8392986,48.7727018],[36.8212339,48.7713601],[36.8166853,48.7775693],[36.7939487,48.7800833],[36.7886624,48.7808424],[36.7919962,48.7857782],[36.7846079,48.7875386],[36.7838238,48.7899009],[36.7910296,48.8016979],[36.7905575,48.8019771],[36.7844318,48.8008929],[36.7844764,48.800577],[36.7691535,48.7973235],[36.7675871,48.7971644],[36.7650042,48.7971873],[36.7613274,48.7977872],[36.7565511,48.7989964],[36.7566153,48.7993019],[36.7474009,48.8014492],[36.7472021,48.8011913],[36.7409254,48.8027892],[36.7411383,48.8030649],[36.7337258,48.804903],[36.7314737,48.8047006],[36.7279446,48.8049921],[36.7207933,48.8060797],[36.7024648,48.7839382],[36.6893666,48.7760794],[36.6913211,48.7704374],[36.7011501,48.7689701],[36.7089116,48.7675911],[36.7091205,48.767446],[36.7127622,48.7582459],[36.7177317,48.7446715],[36.7126562,48.7436487],[36.7260701,48.7143356],[36.7356495,48.7038903],[36.7298189,48.695608],[36.7281235,48.6935383],[36.7283827,48.6928337],[36.7271109,48.6924836],[36.7255298,48.6945501],[36.7241031,48.6945882],[36.7199072,48.6936404],[36.718288,48.694383],[36.7174711,48.6943534],[36.7150972,48.6932554],[36.7118326,48.6925518],[36.7120644,48.6918293],[36.713279,48.6912792],[36.7138268,48.6907254],[36.7139286,48.6903372],[36.7144925,48.6899184],[36.715091,48.6899137],[36.7163476,48.6909305],[36.7171367,48.6909332],[36.7174449,48.6906786],[36.7175545,48.689966],[36.7194828,48.6875276],[36.7190361,48.686162],[36.7192324,48.6857371],[36.7212179,48.6834693],[36.7213059,48.6830722],[36.7210551,48.6827499],[36.7202515,48.6826933],[36.7193356,48.6831961],[36.7182627,48.6832857],[36.7179285,48.6828651],[36.7182359,48.68107],[36.7179168,48.6807303],[36.7154492,48.6804257],[36.7149174,48.6796102],[36.7152737,48.6790039],[36.7174276,48.6785183],[36.7182206,48.6772509],[36.7185802,48.6760861],[36.7170702,48.6745758],[36.7175042,48.6733202],[36.7184031,48.6729738],[36.7198792,48.673222],[36.7215859,48.6730528],[36.722274,48.6725025],[36.7230196,48.6712403],[36.7232116,48.6704904],[36.7246533,48.669722],[36.7254139,48.6697107],[36.7256922,48.6694995],[36.7249932,48.6685198],[36.7255019,48.6678912],[36.7271558,48.6673716],[36.7270677,48.6667789],[36.7231907,48.6666564],[36.7226577,48.6661602],[36.7226862,48.6657998],[36.7241761,48.6652557],[36.7213158,48.66465],[36.7208955,48.6642782],[36.7218757,48.6627245],[36.7225062,48.6624812],[36.7233833,48.6627022],[36.7246043,48.6634491],[36.7251296,48.6629102],[36.7250617,48.6621102],[36.7256497,48.6614174],[36.7259965,48.6604221],[36.7281762,48.6605967],[36.7297062,48.6600295],[36.7298859,48.6597318],[36.7295346,48.6589771],[36.7308247,48.6577812],[36.7308103,48.6569392],[36.730462,48.6566834],[36.7288232,48.6568338],[36.7266724,48.6567127],[36.7253574,48.6559942],[36.7237596,48.6557479],[36.7224893,48.6551457],[36.722573,48.6544064],[36.7242723,48.652833],[36.7251955,48.6524143],[36.7267216,48.6529496],[36.7285224,48.6515727],[36.7292375,48.6498249],[36.728072,48.6491042],[36.7276763,48.6486511],[36.7279543,48.6480348],[36.7293673,48.6472397],[36.7314539,48.6474877],[36.7318095,48.6471583],[36.7336422,48.6463299],[36.7341548,48.6465524],[36.738875,48.6261014],[36.7405919,48.6177364],[36.7453516,48.5964344],[36.7553196,48.5977242],[36.7788749,48.6004272],[36.7791635,48.5989302],[36.7799856,48.5964341],[36.7880228,48.5669533],[36.7882481,48.5668716],[36.8113983,48.5691],[36.82401,48.5700371],[36.8247932,48.5666578],[36.8590236,48.5691675],[36.8593288,48.5690893],[36.860551,48.5648994],[36.8666008,48.5593551],[36.8675101,48.5548352],[36.871807,48.5501942],[36.8829355,48.551042],[36.8847755,48.5417438],[36.9015433,48.5433428],[36.9028723,48.5372401],[36.9040454,48.5304342],[36.9047734,48.5284832],[36.9065916,48.5208455],[36.8919557,48.5195038],[36.8891548,48.5195243],[36.8887398,48.5211418],[36.8503227,48.517818],[36.8510842,48.5134524],[36.8518206,48.5110291],[36.853525,48.5034586],[36.85405,48.5018123],[36.8571514,48.4872014],[36.8385348,48.4853303],[36.8363689,48.485277],[36.8298418,48.4846492],[36.8310615,48.4774413],[36.8317616,48.4747457],[36.8323369,48.4699352],[36.8325925,48.4692624],[36.8343189,48.4589852],[36.8355984,48.4499013],[36.8359887,48.4478975],[36.8362965,48.447262],[36.8369788,48.4433018],[36.8370957,48.4430971],[36.8453738,48.4437071],[36.848296,48.4284337],[36.8484205,48.4280894],[36.8493086,48.4270826],[36.8514356,48.4240853],[36.8509796,48.4240639],[36.8502372,48.4235489],[36.8500704,48.4229479],[36.8503118,48.422526],[36.8508026,48.4223569],[36.8508241,48.4220418],[36.8499255,48.4212168],[36.8496425,48.4208118],[36.8495594,48.4203072],[36.8501106,48.419855],[36.8503922,48.4188413],[36.851268,48.4181408],[36.8514919,48.4173789],[36.8510802,48.4165359],[36.8504861,48.4159529],[36.8495071,48.4161105],[36.8486649,48.4163846],[36.8473801,48.4175507],[36.8459934,48.4182004],[36.8454972,48.4188626],[36.8448803,48.4192988],[36.8438637,48.4196833],[36.8431824,48.4202618],[36.8423992,48.4205858],[36.8414015,48.4207798],[36.8400255,48.4199431],[36.8395829,48.4198559],[36.8373191,48.4204398],[36.8366379,48.4202867],[36.8364555,48.420009],[36.8364233,48.4192756],[36.8366566,48.4185013],[36.8364608,48.4181719],[36.8357527,48.4175453],[36.8341327,48.4167104],[36.8341783,48.4165751],[36.83332,48.4164754],[36.833505,48.4165982],[36.8324321,48.4167852],[36.8310508,48.4174599],[36.8306243,48.4174919],[36.8295407,48.4166089],[36.8281862,48.4162689],[36.8276578,48.4157259],[36.8263596,48.4150352],[36.8245679,48.4147094],[36.8244633,48.4141397],[36.8247825,48.4130555],[36.8255657,48.4124733],[36.8272233,48.4120247],[36.8278,48.4121101],[36.8289828,48.4126638],[36.8294388,48.4126923],[36.8298572,48.4124876],[36.8298867,48.4115458],[36.8304098,48.4109102],[36.8308845,48.4107606],[36.8333387,48.4106253],[36.8348971,48.4102389],[36.8349534,48.4100057],[36.8344143,48.4092098],[36.8329847,48.408373],[36.8327486,48.4079386],[36.8328077,48.4077374],[36.8337357,48.407262],[36.8349588,48.4073296],[36.8358949,48.4071908],[36.8361041,48.4068471],[36.8358225,48.4062435],[36.8350902,48.4053906],[36.8300772,48.4054173],[36.8205392,48.4051217],[36.8211132,48.4025113],[36.8214941,48.4014856],[36.8213707,48.4008944],[36.825276,48.3836395],[36.8261129,48.3782167],[36.827513,48.3717457],[36.8278724,48.3694222],[36.8265849,48.3695612],[36.8261236,48.3694222],[36.8257615,48.3691015],[36.825563,48.3691371],[36.8253431,48.3685527],[36.8255362,48.3677152],[36.8251902,48.3674622],[36.8242568,48.3673339],[36.8235111,48.3664215],[36.8227628,48.3659243],[36.821588,48.3656107],[36.8203354,48.3657622],[36.8186617,48.3663484],[36.8162987,48.3663235],[36.8157113,48.366573],[36.8151695,48.3671307],[36.8149468,48.3677526],[36.8143889,48.3680716],[36.8119454,48.3685669],[36.8127313,48.3661595],[36.8129835,48.3639971],[36.8137264,48.3604409],[36.816473,48.3485025],[36.8087751,48.3478964],[36.8100518,48.342969],[36.8101162,48.3420598],[36.8126428,48.3302544],[36.8125275,48.3302366],[36.8135977,48.3257373],[36.8141931,48.3257979],[36.8169129,48.3126134],[36.8298519,48.3137265],[36.8565559,48.3155924],[36.8709326,48.3169623],[36.8712451,48.3168802],[36.8713832,48.3163995],[36.873706,48.3055685],[36.8805081,48.3063339],[36.9120401,48.3091419],[36.9129387,48.3058736],[36.9132417,48.3049905],[36.9135287,48.3047354],[36.9141483,48.3012098],[36.9157952,48.294183],[36.9159454,48.2929445],[36.9213635,48.26773],[36.9231391,48.2603021],[36.924854,48.251923],[36.9248691,48.2511426],[36.9261131,48.2456632],[36.925987,48.2453711],[36.9268942,48.2410543],[36.9270363,48.2392215],[36.9273797,48.239175],[36.9278973,48.2371992],[36.9279376,48.2363328],[36.9316283,48.2193384],[36.9323659,48.2152583],[36.9328594,48.2137427],[36.9339108,48.2077263],[36.9368344,48.1940214],[36.935259,48.1946406],[36.9339913,48.1948618],[36.9311374,48.1959274],[36.9303006,48.1960203],[36.9294584,48.1958988],[36.9273555,48.1948868],[36.9237989,48.1946329],[36.9228065,48.1944648],[36.9213313,48.1939034],[36.9204837,48.1937925],[36.9156772,48.1945077],[36.9147867,48.1944541],[36.912083,48.1936137],[36.9108385,48.1934278],[36.9088885,48.1919866],[36.9082046,48.191967],[36.906842,48.1922441],[36.9053453,48.193122],[36.9047981,48.1933402],[36.9043368,48.1932865],[36.9037709,48.1930541],[36.9036099,48.1927841],[36.9035134,48.1922727],[36.9036394,48.1918382],[36.9057798,48.1902593],[36.9064772,48.189258],[36.9061983,48.18865],[36.9046801,48.187899],[36.9026631,48.1882959],[36.9020408,48.1885821],[36.9018531,48.1891578],[36.9020569,48.1902415],[36.9018477,48.1907207],[36.9011879,48.1910819],[36.9007319,48.1911355],[36.9001794,48.1909817],[36.8996805,48.1904739],[36.8985432,48.187527],[36.8983287,48.1873053],[36.897819,48.1871658],[36.8968266,48.1872516],[36.8963706,48.1875521],[36.8949813,48.1893581],[36.8950725,48.1896907],[36.8957913,48.1903273],[36.8957108,48.191064],[36.8947452,48.1913751],[36.8931305,48.1911462],[36.8929535,48.1908208],[36.8930125,48.1896693],[36.8932539,48.1887788],[36.8925404,48.1875914],[36.8918431,48.1867903],[36.8916446,48.1858818],[36.8922937,48.1856208],[36.8942785,48.1853847],[36.8944287,48.1846551],[36.8941069,48.1841436],[36.8920255,48.1829096],[36.8918377,48.1825055],[36.89316,48.1813734],[36.8938494,48.1810032],[36.8942356,48.1802699],[36.8938601,48.1797262],[36.893388,48.1794186],[36.8914515,48.1786567],[36.8904483,48.1785065],[36.888898,48.1774333],[36.888383,48.177326],[36.8872189,48.177301],[36.8857813,48.1777517],[36.8842578,48.1783956],[36.8831474,48.1794723],[36.8832868,48.1798586],[36.8845475,48.1811964],[36.8846226,48.1817794],[36.8848747,48.18218],[36.8841505,48.1828202],[36.8829435,48.1827487],[36.8817741,48.1819904],[36.8812323,48.181833],[36.8809158,48.1819654],[36.8798804,48.1818438],[36.879065,48.1819296],[36.8781799,48.18218],[36.875605,48.1835713],[36.8727082,48.1841687],[36.8734539,48.1801483],[36.8746501,48.1757878],[36.8771499,48.1637347],[36.8828791,48.1392583],[36.8865645,48.1221547],[36.8893272,48.1104722],[36.8893111,48.1097559],[36.8918002,48.0980204],[36.8963385,48.0776058],[36.8816078,48.0635435],[36.8814924,48.0633804],[36.8817955,48.0616882],[36.8690363,48.0626419],[36.8670939,48.0515063],[36.8582177,48.052094],[36.856472,48.0405689],[36.8559414,48.0393835],[36.8545286,48.0346107],[36.8540961,48.0346001],[36.8509113,48.0354018],[36.8481531,48.0356685],[36.8473972,48.0360924],[36.8458333,48.0376107],[36.8445665,48.0383016],[36.8402214,48.0383045],[36.8381678,48.0371819],[36.8370313,48.0361974],[36.8340091,48.0351611],[36.833415,48.0351352],[36.8309899,48.0361654],[36.8302703,48.0362539],[36.8288947,48.0361974],[36.8273965,48.0358606],[36.8268024,48.0359038],[36.825795,48.0363183],[36.8244389,48.0375878],[36.8204739,48.0396603],[36.8194407,48.0400403],[36.8160181,48.0406447],[36.8142746,48.0404375],[36.8126731,48.0404893],[36.8115236,48.041206],[36.8089922,48.0436152],[36.8084369,48.0447722],[36.8083077,48.0455493],[36.8076103,48.0465595],[36.8066804,48.0469912],[36.8048077,48.047397],[36.8041232,48.0478287],[36.8039682,48.0482],[36.8041103,48.0495037],[36.8048981,48.0509714],[36.8051951,48.0520247],[36.8043944,48.0527326],[36.8034774,48.0530088],[36.800699,48.0526848],[36.8002416,48.0524986],[36.8001711,48.0520506],[36.799181,48.0510958],[36.7987337,48.0509889],[36.7982893,48.0501616],[36.7966452,48.0496159],[36.7949404,48.0485712],[36.7941913,48.0484245],[36.7926157,48.0485367],[36.7897097,48.0496591],[36.788302,48.0503843],[36.7872429,48.0512563],[36.7856543,48.0512822],[36.7854219,48.0510577],[36.7856027,48.0502634],[36.7845694,48.0491411],[36.7845297,48.0477629],[36.7826638,48.0468846],[36.7813334,48.0475678],[36.7797428,48.048683],[36.7786592,48.0489628],[36.7777365,48.0488265],[36.777412,48.0483209],[36.7757758,48.0474153],[36.7751536,48.0472665],[36.7737266,48.0472217],[36.7725706,48.0476664],[36.7722997,48.0478744],[36.7721361,48.048328],[36.7725009,48.0491959],[36.7728295,48.0492878],[36.7728553,48.0495641],[36.7725841,48.0499008],[36.7717962,48.0503411],[36.7702722,48.0506606],[36.7695612,48.0512614],[36.7694351,48.0516845],[36.7670047,48.0526808],[36.7656098,48.0540189],[36.7654037,48.0550211],[36.765157,48.0553223],[36.7639071,48.0558225],[36.7624319,48.0555052],[36.7613865,48.0548995],[36.7612315,48.0545024],[36.7615286,48.0538462],[36.7614124,48.0532851],[36.7610895,48.052465],[36.7606633,48.0519901],[36.7596987,48.0517025],[36.7581965,48.051947],[36.7572536,48.0519038],[36.7564529,48.050626],[36.7548514,48.0495468],[36.7527204,48.0493396],[36.7503569,48.0494519],[36.7494528,48.0497195],[36.7488329,48.0505311],[36.7483679,48.0505829],[36.7468698,48.0502807],[36.7453716,48.0504447],[36.7436151,48.0504188],[36.7433956,48.0506174],[36.7436668,48.0512649],[36.7436926,48.0523786],[36.7415745,48.0527671],[36.741187,48.053052],[36.741045,48.0534405],[36.7429694,48.0569022],[36.7430081,48.0571698],[36.7422203,48.0577568],[36.742104,48.0581367],[36.7422978,48.058646],[36.7434472,48.0599839],[36.7451262,48.0599926],[36.7458495,48.0602515],[36.7468956,48.0602602],[36.7478772,48.0609593],[36.7482259,48.0615636],[36.7482,48.0620901],[36.7471152,48.0624267],[36.7466373,48.0628238],[36.7466502,48.063592],[36.7469473,48.0643429],[36.7463919,48.0644292],[36.7452554,48.0638423],[36.7448679,48.063825],[36.7442996,48.0641616],[36.7440801,48.0648435],[36.7436668,48.0651283],[36.7413768,48.0657713],[36.7404896,48.0651628],[36.7395874,48.0653759],[36.7388992,48.0657506],[36.7388033,48.0660819],[36.7389773,48.066945],[36.7400132,48.0678415],[36.740047,48.0685441],[36.7391779,48.0686309],[36.7381621,48.068378],[36.7337465,48.0684781],[36.7300456,48.0692213],[36.7266125,48.0710601],[36.7261648,48.0716433],[36.7259462,48.0725507],[36.7254933,48.0731724],[36.7254004,48.0739023],[36.7259773,48.0751528],[36.7245087,48.0763217],[36.7243457,48.0766685],[36.724747,48.0779803],[36.725613,48.0789158],[36.7256407,48.0794366],[36.7252313,48.07975],[36.7241722,48.0799366],[36.7224232,48.0805895],[36.7214749,48.0817989],[36.7214733,48.0827016],[36.7213041,48.0830701],[36.7203781,48.083503],[36.7187174,48.0846701],[36.7173746,48.0849708],[36.7167841,48.0848723],[36.7162545,48.0849996],[36.7155551,48.0849155],[36.7148999,48.0845623],[36.7146211,48.0840374],[36.7150201,48.0826745],[36.7142941,48.0821145],[36.7139173,48.0815673],[36.713819,48.0802321],[36.7132129,48.0799256],[36.7109358,48.0797943],[36.7081346,48.0803525],[36.7075285,48.0807684],[36.7069387,48.0817095],[36.7058903,48.082213],[36.7047927,48.0823334],[36.7023027,48.0822458],[36.7005335,48.0826726],[36.6989609,48.0833402],[36.6972736,48.0850474],[36.6934567,48.0862183],[36.6919168,48.0865138],[36.6899674,48.0864153],[36.6886077,48.086656],[36.6869695,48.0864919],[36.6844632,48.0857368],[36.6831199,48.0859666],[36.6823755,48.0863112],[36.6804542,48.0879665],[36.6789425,48.0888993],[36.6786477,48.0892276],[36.6784347,48.0899388],[36.6763051,48.0905407],[36.6748963,48.0907157],[36.6725046,48.0906172],[36.6695067,48.0909893],[36.6684092,48.0909346],[36.6677048,48.0906172],[36.6665253,48.0894574],[36.6645595,48.0878926],[36.6639206,48.0876081],[36.6634128,48.0875971],[36.6629869,48.0877613],[36.662135,48.0886367],[36.6618238,48.090672],[36.6613651,48.0913394],[36.6584983,48.0924883],[36.6573516,48.0935059],[36.6552711,48.0945563],[36.6552384,48.0948845],[36.6560738,48.0961974],[36.6568438,48.0967226],[36.6572205,48.0971931],[36.6577447,48.0973462],[36.6580888,48.0976416],[36.6579577,48.0983309],[36.6572697,48.0988232],[36.6547797,48.0995453],[36.6538295,48.1001142],[36.6533545,48.1002126],[36.651831,48.1000048],[36.6508481,48.0993812],[36.6500945,48.097751],[36.6504222,48.0960005],[36.6500782,48.0955738],[36.648227,48.0956066],[36.6456715,48.0965913],[36.6443937,48.096843],[36.6436729,48.0966679],[36.64269,48.0954425],[36.6423279,48.0952222],[36.6407883,48.0950216],[36.6387912,48.0956613],[36.6378272,48.0955626],[36.6362768,48.094563],[36.6361105,48.0940076],[36.6363251,48.0936457],[36.6371727,48.0935275],[36.6377145,48.0929291],[36.638664,48.0924454],[36.6394043,48.0917933],[36.6413304,48.091427],[36.6416466,48.0916213],[36.6416466,48.0919116],[36.6421294,48.0921122],[36.6422206,48.0927751],[36.6423762,48.0929291],[36.6442627,48.0927837],[36.6444308,48.0930725],[36.64442,48.0936135],[36.6447043,48.0938106],[36.6454446,48.0937031],[36.6466623,48.0938034],[36.649248,48.0930581],[36.6506679,48.0919631],[36.6508153,48.091613],[36.6507498,48.0912519],[36.6504282,48.0906969],[36.6517532,48.0887297],[36.651274,48.088385],[36.6501109,48.088002],[36.6489637,48.0880417],[36.6487384,48.0883033],[36.6490549,48.0885398],[36.6490602,48.0887763],[36.648792,48.0891095],[36.6479813,48.0895558],[36.6467691,48.08972],[36.6450959,48.0888264],[36.6440284,48.0873572],[36.6433793,48.0874002],[36.6427228,48.0876847],[36.6421616,48.0882065],[36.6419041,48.0888049],[36.6415125,48.0889948],[36.6392219,48.0895825],[36.6379076,48.0893997],[36.6371244,48.0886544],[36.6367274,48.0878338],[36.6360063,48.0876299],[36.6347802,48.0877299],[36.6316488,48.0890415],[36.6302365,48.0892134],[36.6293675,48.0891095],[36.6288739,48.0889339],[36.6286755,48.0886723],[36.6281283,48.0868341],[36.628316,48.0864542],[36.6289169,48.0863575],[36.6312611,48.0867982],[36.6323179,48.0867911],[36.6328007,48.0865295],[36.6330249,48.0860213],[36.632599,48.0848176],[36.6311055,48.0837307],[36.6299415,48.0834691],[36.6293138,48.083788],[36.6283911,48.0856228],[36.6276562,48.0858199],[36.626122,48.0855082],[36.6254729,48.0852752],[36.624228,48.0829024],[36.6237693,48.08241],[36.6233925,48.0821473],[36.6226458,48.082032],[36.6221201,48.0821539],[36.621235,48.0829064],[36.6213612,48.0836904],[36.6207387,48.0840078],[36.6197886,48.08415],[36.6191988,48.0844127],[36.617446,48.0862511],[36.616201,48.0865247],[36.6122335,48.0869126],[36.611565,48.0871485],[36.6110735,48.0875424],[36.61074,48.0889122],[36.6102547,48.0894961],[36.6089213,48.0898303],[36.605725,48.0901956],[36.6041805,48.090733],[36.602293,48.0909565],[36.6011954,48.0904422],[36.6002617,48.0896981],[36.6000651,48.0893042],[36.6001961,48.0885272],[36.6005074,48.0882209],[36.6019654,48.0877831],[36.6043898,48.0865028],[36.6046519,48.0860104],[36.6040294,48.0854851],[36.601949,48.0847191],[36.6006057,48.0846753],[36.5993443,48.0843908],[36.5948721,48.0823881],[36.5922019,48.0824319],[36.590274,48.0822471],[36.5883686,48.0827711],[36.5869107,48.0829681],[36.5863865,48.0828477],[36.5860588,48.0825741],[36.5861899,48.082016],[36.5875659,48.0807355],[36.5877625,48.0800241],[36.5873684,48.0789192],[36.5870164,48.0785259],[36.5862848,48.0782071],[36.585551,48.0781088],[36.5850208,48.0782725],[36.5847408,48.0788006],[36.5825532,48.0799694],[36.5812754,48.0801336],[36.5804583,48.0797255],[36.5801281,48.079397],[36.5800067,48.0786495],[36.5803993,48.0780487],[36.5811695,48.0773601],[36.5820617,48.0770143],[36.5830118,48.0763467],[36.5838688,48.0761887],[36.5844588,48.0762669],[36.5850291,48.0768495],[36.585753,48.0768377],[36.5868288,48.0761387],[36.587009,48.0757994],[36.5869598,48.075285],[36.5855769,48.0740631],[36.5850968,48.0733844],[36.5847387,48.0716364],[36.5860752,48.0694726],[36.586239,48.0687611],[36.5860424,48.0680167],[36.5860186,48.0669109],[36.5871892,48.0649405],[36.58714,48.0647544],[36.586583,48.0643603],[36.5841094,48.06378],[36.5825695,48.0630575],[36.5804235,48.0630684],[36.5793915,48.0632327],[36.5789001,48.0631341],[36.5783267,48.0627181],[36.5779991,48.0618641],[36.5784086,48.0609992],[36.5791569,48.0603242],[36.5802761,48.0600248],[36.5818613,48.0603064],[36.5825141,48.060015],[36.5831055,48.0591088],[36.5833593,48.0581572],[36.5838145,48.0574956],[36.5860735,48.0549744],[36.5868943,48.053499],[36.5872874,48.0523601],[36.5835361,48.0501919],[36.5815703,48.0485493],[36.580571,48.0474651],[36.5799485,48.0465233],[36.5779991,48.0446615],[36.5767049,48.0430625],[36.5740839,48.0408172],[36.5738873,48.0405105],[36.5738709,48.0400286],[36.5743132,48.0396234],[36.5780154,48.0378161],[36.5837982,48.0324486],[36.5862614,48.0295321],[36.5868691,48.0290286],[36.5874385,48.0269375],[36.5882963,48.0256713],[36.5891789,48.0227341],[36.590187,48.021471],[36.5908364,48.0209166],[36.5909277,48.0201753],[36.5907504,48.0198074],[36.5904639,48.0196324],[36.588598,48.0192686],[36.5863826,48.0174798],[36.5843624,48.0166846],[36.5776425,48.0156028],[36.5756352,48.0146447],[36.5708111,48.0134393],[36.5694615,48.0127949],[36.5689762,48.0119481],[36.5689448,48.0112058],[36.5720742,48.0100303],[36.5723018,48.0105977],[36.5729434,48.0112095],[36.5745117,48.0111285],[36.576769,48.0102699],[36.578838,48.0089105],[36.5805634,48.0080875],[36.582341,48.0065526],[36.5827219,48.0057316],[36.5850512,48.0032357],[36.5867638,48.0008484],[36.5865872,47.9997275],[36.5857657,47.9991901],[36.5851476,47.999245],[36.5836242,48.0001224],[36.5829769,48.0002507],[36.5789916,47.9997455],[36.5776878,47.9989826],[36.5761042,47.9973816],[36.5767993,47.997004],[36.5770091,47.9961278],[36.576952,47.9948804],[36.5776416,47.9908767],[36.5851415,47.9566416],[36.6288135,47.9618257],[36.6345899,47.9412503],[36.6367272,47.932227],[36.6402445,47.9203042],[36.6179516,47.9174732],[36.5955035,47.9213787],[36.5898139,47.9211707],[36.5907164,47.9182475],[36.5924844,47.9108214],[36.5749,47.9090307],[36.5419522,47.9060131]],[[38.2926428,48.4906721],[38.2927233,48.4908996],[38.2937103,48.4917244],[38.2938176,48.492279],[38.2938337,48.4935197],[38.2933295,48.493861],[38.2932383,48.4943445],[38.2936406,48.4946431],[38.2944024,48.4948066],[38.2945847,48.4953185],[38.2945847,48.4956136],[38.2933938,48.4963032],[38.2942039,48.4975332],[38.2953626,48.4987418],[38.2975835,48.5002027],[38.2985222,48.499442],[38.2987261,48.4996624],[38.2992518,48.4994243],[38.299284,48.499211],[38.2989299,48.498756],[38.2998204,48.4981553],[38.3002764,48.4984112],[38.3006626,48.4987347],[38.2998311,48.4994065],[38.2993805,48.5002134],[38.2993162,48.5010771],[38.2994288,48.5014184],[38.2998472,48.5017347],[38.3014244,48.502243],[38.3025241,48.5019089],[38.3028191,48.5015819],[38.3024275,48.5001316],[38.3032322,48.4980877],[38.3031946,48.4972524],[38.3045036,48.4950164],[38.3073682,48.4937401],[38.3075827,48.4931464],[38.2989943,48.4897228],[38.2972884,48.4898117],[38.2948369,48.490313],[38.2930559,48.490313],[38.2926428,48.4906721]]]}');
INSERT INTO `b_location_area` (`ID`, `TYPE`, `CODE`, `SORT`, `GEOMETRY`) VALUES
(4, 'CUSTOM_FIELDS', 'LUGANSK', 0, '{\"type\":\"MultiPolygon\",\"coordinates\":[[[[37.83667,49.4926815],[37.8367853,49.4924307],[37.8371044,49.4923071],[37.8435123,49.4911745],[37.8464735,49.4901448],[37.8480425,49.489474],[37.8508964,49.4877142],[37.849853,49.4811781],[37.8499442,49.4807947],[37.8496599,49.4784281],[37.8470045,49.4626609],[37.8475946,49.461017],[37.8472352,49.4604103],[37.8470769,49.4594776],[37.8461918,49.4574012],[37.8440005,49.4452346],[37.8755942,49.4467491],[37.8750014,49.4401465],[37.8745133,49.4365221],[37.8798133,49.4358052],[37.8790569,49.4310834],[37.8776455,49.4187857],[37.8769702,49.4187977],[37.876777,49.417168],[37.8792822,49.416983],[37.8803283,49.4165992],[37.8804731,49.4163235],[37.8803927,49.415971],[37.8783381,49.4134652],[37.8791588,49.4134058],[37.8810337,49.415266],[37.8962713,49.4034895],[37.8955579,49.3973855],[37.8953379,49.3971708],[37.8950429,49.3947199],[37.892012,49.3795859],[37.8901452,49.3717656],[37.8893298,49.3663057],[37.8885198,49.3631196],[37.88683,49.358071],[37.8850919,49.3500202],[37.8851026,49.3495798],[37.8865906,49.3446016],[37.8864732,49.3417181],[37.8846762,49.3412987],[37.8836623,49.3408565],[37.8828234,49.3376809],[37.8791446,49.3318068],[37.8797151,49.3312325],[37.8787243,49.3305166],[37.8769165,49.3287301],[37.8821844,49.3211884],[37.882989,49.319531],[37.8827745,49.3188841],[37.8821415,49.3189383],[37.8819269,49.3175064],[37.8837347,49.317391],[37.8841209,49.3173035],[37.884357,49.3169783],[37.884078,49.3166356],[37.883724,49.3165867],[37.8834665,49.3148836],[37.8834557,49.3126874],[37.9015607,49.3108234],[37.9171725,49.3084434],[37.9231553,49.3084568],[37.9365367,49.305765],[37.945058,49.3038002],[37.948553,49.303627],[37.9483169,49.3031933],[37.947861,49.2986528],[37.9531181,49.2911433],[37.9584141,49.2851618],[37.9526675,49.2826546],[37.9511976,49.2825041],[37.9493684,49.2820107],[37.947185,49.2818882],[37.940155,49.2808979],[37.9381138,49.2803747],[37.9274815,49.2801805],[37.9137111,49.277715],[37.8988744,49.2702854],[37.9117826,49.2595009],[37.9074615,49.2591368],[37.8979826,49.2569031],[37.8957986,49.2558698],[37.8978203,49.2526095],[37.896502,49.2523145],[37.8905878,49.2518323],[37.8870875,49.2509192],[37.8858013,49.250028],[37.8820986,49.2489792],[37.8760099,49.2476783],[37.8742772,49.2475785],[37.8662869,49.2463704],[37.872102,49.2380053],[37.8745133,49.2339965],[37.8732017,49.223261],[37.8786761,49.2215039],[37.8812349,49.2209188],[37.8813958,49.2212148],[37.889835,49.2191761],[37.8899279,49.2182033],[37.8896677,49.2180158],[37.8896007,49.2118835],[37.8929883,49.2122077],[37.8930634,49.2120009],[37.9160553,49.2152897],[37.9176351,49.2153615],[37.9249281,49.2177092],[37.9261538,49.218177],[37.9262853,49.2184608],[37.9275513,49.2190985],[37.9300404,49.2196399],[37.9334722,49.2207777],[37.9383257,49.2167062],[37.9425636,49.2141219],[37.9380642,49.2124986],[37.9378831,49.2140159],[37.9332617,49.2129839],[37.9310623,49.2118292],[37.9297064,49.2113062],[37.9302523,49.2105624],[37.9300269,49.2102803],[37.9300109,49.2099701],[37.9287744,49.2096232],[37.9286161,49.209327],[37.9262772,49.2086594],[37.9262075,49.2083317],[37.9246974,49.2075519],[37.9241878,49.2075344],[37.9220903,49.2068755],[37.9204273,49.206851],[37.9193732,49.2066285],[37.9193893,49.206448],[37.9200625,49.2058346],[37.9196146,49.2056611],[37.9191586,49.2050986],[37.9193813,49.20499],[37.9199794,49.2050057],[37.9218408,49.2059625],[37.9226455,49.2053352],[37.9229084,49.2054596],[37.9231042,49.2058837],[37.9276666,49.2001723],[37.9349032,49.1916819],[37.913813,49.1865895],[37.9106319,49.1848083],[37.9101169,49.1849556],[37.9085371,49.1841702],[37.9076546,49.183916],[37.9062653,49.1818121],[37.905187,49.1805795],[37.9005226,49.1783931],[37.9001659,49.178607],[37.8981194,49.1771973],[37.8933772,49.1751721],[37.893514,49.1748564],[37.9025383,49.1668335],[37.90236,49.1663539],[37.8928462,49.1606054],[37.8931224,49.1603634],[37.8995544,49.1574657],[37.9013514,49.1561623],[37.9022017,49.1557326],[37.9040095,49.154231],[37.9155296,49.1497031],[37.9187617,49.1473785],[37.9268901,49.1435746],[37.9448006,49.1390247],[37.9484484,49.1394599],[37.9557708,49.1428307],[37.9574485,49.1420849],[37.9577674,49.1416017],[37.9578549,49.1400319],[37.9583068,49.1390229],[37.9586542,49.1387983],[37.9594508,49.138865],[37.9600583,49.1372295],[37.9591611,49.1365294],[37.9587722,49.1359853],[37.9761744,49.1342954],[37.9776174,49.1332986],[37.9795995,49.1315242],[37.9795915,49.1312575],[37.9807073,49.130659],[38.0124941,49.1285897],[38.0397856,49.1265397],[38.0401745,49.1265537],[38.0406707,49.1313593],[38.0411106,49.1380069],[38.0415988,49.1422288],[38.042838,49.1464854],[38.0435461,49.1493733],[38.043648,49.1504996],[38.0509114,49.1501206],[38.0610394,49.1478925],[38.0612808,49.1479943],[38.0668384,49.1466223],[38.0681151,49.1466328],[38.0689064,49.1468276],[38.0812633,49.1481487],[38.0815852,49.148068],[38.0823898,49.1435132],[38.0821001,49.1429798],[38.0821538,49.1424534],[38.0827922,49.1412567],[38.0839616,49.1353431],[38.0756079,49.11356],[38.0676538,49.095958],[38.0671334,49.0934745],[38.0664893,49.0878053],[38.0657682,49.0834911],[38.0655174,49.0834929],[38.0637914,49.0728644],[38.0636465,49.0726395],[38.0632549,49.069589],[38.063271,49.0676384],[38.0622572,49.0632345],[38.0601477,49.0620075],[38.0581748,49.0612801],[38.05722,49.0612485],[38.0526388,49.0595841],[38.0533281,49.0583467],[38.0542266,49.0573748],[38.0711951,49.0409812],[38.0729162,49.0394966],[38.0761617,49.0341366],[38.0846107,49.0191063],[38.0866277,49.0167492],[38.0862039,49.0166753],[38.087132,49.0154897],[38.0868208,49.0153877],[38.0869549,49.0151203],[38.0874431,49.0151343],[38.0914074,49.0088925],[38.0942291,49.0048809],[38.0974048,48.9993382],[38.097775,48.9993628],[38.098011,48.9976347],[38.0980432,48.9955159],[38.098526,48.9937032],[38.0984884,48.9924678],[38.0950619,48.9918459],[38.0802226,48.9920207],[38.076666,48.9915139],[38.0720509,48.9906424],[38.067466,48.9894617],[38.06517,48.9892118],[38.0578691,48.9875291],[38.0524671,48.9857249],[38.0504742,48.9832096],[38.051767,48.979409],[38.0576545,48.975837],[38.052274,48.9715446],[38.0537116,48.9648958],[38.0496454,48.9665475],[38.0493879,48.966382],[38.03801,48.9708544],[38.0368084,48.9710058],[38.0348182,48.9718016],[38.0347377,48.9723334],[38.0309236,48.9739179],[38.0286759,48.973432],[38.0103242,48.9523458],[38.0109626,48.9508768],[38.010115,48.9506866],[38.0090582,48.9509367],[38.0063136,48.9479108],[38.0058503,48.9465823],[38.0067515,48.9460749],[38.0074435,48.9453139],[38.0075289,48.9446747],[38.0080336,48.9445599],[38.0082589,48.9443063],[38.009423,48.9441935],[38.0095464,48.9439539],[38.0093265,48.943429],[38.0104208,48.9427595],[38.0109143,48.9427348],[38.010909,48.9429357],[38.0104262,48.9432316],[38.0104369,48.9434924],[38.0108392,48.9435347],[38.0111557,48.9431823],[38.011601,48.943281],[38.0118048,48.9426256],[38.0123627,48.9425164],[38.0127436,48.9430449],[38.0130333,48.9430343],[38.0135482,48.9427278],[38.0142134,48.9419315],[38.0146426,48.942231],[38.0146748,48.9426573],[38.014884,48.9428582],[38.0157101,48.9426714],[38.0160266,48.9424142],[38.0160695,48.9421218],[38.0167723,48.9420689],[38.0168474,48.9416849],[38.0165309,48.9415016],[38.0159193,48.9415474],[38.0159998,48.9412374],[38.0164719,48.940878],[38.0164987,48.9406877],[38.0160803,48.9401274],[38.0170888,48.9392959],[38.0175286,48.9395601],[38.0179632,48.939169],[38.017754,48.9385312],[38.0181295,48.9382529],[38.0178398,48.9376573],[38.0187678,48.9375023],[38.01902,48.9370266],[38.0186337,48.9367235],[38.0189341,48.9364628],[38.01983,48.9365015],[38.0198997,48.9367834],[38.0205381,48.9366742],[38.0205005,48.9362795],[38.0200499,48.9361174],[38.0206078,48.9359166],[38.0206883,48.9357263],[38.0200767,48.9355959],[38.0207389,48.9353795],[38.0200714,48.9351342],[38.0206186,48.93481],[38.0205488,48.9346515],[38.0201358,48.9345211],[38.0211067,48.9339255],[38.0206829,48.9338092],[38.0208439,48.9335978],[38.0214286,48.9333511],[38.0216646,48.9334251],[38.0215949,48.9331044],[38.0217987,48.9329705],[38.0221367,48.9330833],[38.0223459,48.932967],[38.0225605,48.9330375],[38.0225927,48.9332454],[38.023054,48.9332278],[38.0232364,48.9334427],[38.0236977,48.9333476],[38.0240464,48.9330304],[38.0238426,48.9328894],[38.024261,48.9327097],[38.0247384,48.9328542],[38.0251032,48.9327027],[38.0249637,48.9324243],[38.0246043,48.9323009],[38.0247277,48.9321529],[38.0254465,48.9321388],[38.0256665,48.9323291],[38.0257523,48.9327238],[38.0265087,48.9325652],[38.0263263,48.9329634],[38.0266857,48.932967],[38.0266857,48.9333088],[38.0270398,48.9331537],[38.0274904,48.9332736],[38.0273348,48.9328084],[38.0276352,48.9328013],[38.0284077,48.9333758],[38.0287993,48.9333546],[38.0290997,48.9335379],[38.0289495,48.9338233],[38.0293465,48.9339925],[38.0296737,48.9339396],[38.0298346,48.934218],[38.0302906,48.9341687],[38.0301565,48.9339149],[38.0305803,48.9336929],[38.0312508,48.9336084],[38.030929,48.9332418],[38.0311274,48.9331573],[38.0316424,48.9332489],[38.031798,48.9334498],[38.03249,48.9334921],[38.0325383,48.9340101],[38.0329245,48.9340841],[38.0330694,48.934285],[38.032887,48.9345739],[38.0333537,48.9348241],[38.0334771,48.9352505],[38.0349415,48.9351202],[38.0349308,48.934884],[38.0351454,48.9348136],[38.0356067,48.9349369],[38.0357248,48.9352364],[38.036229,48.9351695],[38.0354165,48.9339472],[38.0357623,48.9322516],[38.0367064,48.9317547],[38.0363202,48.9303062],[38.0343857,48.9303231],[38.0319804,48.9281951],[38.0314761,48.9268769],[38.037377,48.9248644],[38.0389059,48.9257033],[38.0393672,48.9266514],[38.0418616,48.9286533],[38.0422854,48.9292172],[38.0425376,48.9314269],[38.0428594,48.9323643],[38.0434388,48.933707],[38.044678,48.9350285],[38.0465823,48.9362654],[38.0502528,48.9382109],[38.0537975,48.9395869],[38.0549347,48.9396518],[38.0561512,48.9394709],[38.0580515,48.9387885],[38.0594677,48.9380837],[38.0627673,48.9369513],[38.0640113,48.9368046],[38.0686247,48.9376397],[38.0747509,48.9382529],[38.080067,48.9394086],[38.0862844,48.9396976],[38.0911499,48.9395425],[38.0921853,48.9393804],[38.0931026,48.9387462],[38.0937839,48.9379639],[38.0940789,48.9373508],[38.0942506,48.9353704],[38.0957687,48.934655],[38.1050491,48.9333722],[38.1074321,48.9328397],[38.1122911,48.9326005],[38.115263,48.9315961],[38.1160301,48.9309194],[38.1165022,48.9293863],[38.1166041,48.9279907],[38.1177145,48.9271307],[38.1190181,48.9266549],[38.1203538,48.9264822],[38.126952,48.9265456],[38.1283468,48.9263447],[38.1299722,48.9256997],[38.1320912,48.9238775],[38.1333625,48.92374],[38.1362432,48.9250794],[38.1379246,48.9261712],[38.1394887,48.9293194],[38.1397837,48.9304824],[38.1403416,48.9313399],[38.1416774,48.9324877],[38.1425706,48.9328947],[38.1436032,48.9328648],[38.1447083,48.9325899],[38.1465742,48.9325725],[38.1511724,48.9311732],[38.1527488,48.9309257],[38.1606299,48.9305036],[38.1633711,48.9306199],[38.1643206,48.931004],[38.1673086,48.931441],[38.1714419,48.9305776],[38.1811429,48.9291437],[38.1824577,48.9291537],[38.1831551,48.9293441],[38.1855905,48.9291784],[38.1887019,48.928396],[38.1956434,48.9277686],[38.1991357,48.9281704],[38.2034165,48.928974],[38.2059646,48.9296894],[38.2114738,48.9307573],[38.216393,48.9322903],[38.2197674,48.9336408],[38.2236291,48.9346418],[38.2266498,48.9359095],[38.2279914,48.9367431],[38.2279472,48.933072],[38.2284576,48.9278849],[38.2283127,48.9253367],[38.2284683,48.925245],[38.2286936,48.9222314],[38.228538,48.9200142],[38.2286829,48.9161506],[38.2284844,48.9123784],[38.2284898,48.9019628],[38.228699,48.8971457],[38.2285005,48.8943877],[38.2286507,48.8905892],[38.2283449,48.8882472],[38.2287151,48.8859367],[38.2288757,48.8785518],[38.2289994,48.8784722],[38.2289886,48.8683177],[38.2286936,48.8680742],[38.2286882,48.8676896],[38.2291549,48.8661016],[38.2289243,48.8653464],[38.2291388,48.863949],[38.2290369,48.860494],[38.2288331,48.8593717],[38.2290798,48.8592023],[38.229112,48.8586976],[38.2268214,48.8574411],[38.2271755,48.8567493],[38.2267839,48.8559552],[38.2262501,48.8559199],[38.2265103,48.8555952],[38.2264996,48.855041],[38.2267141,48.854614],[38.2267302,48.8540175],[38.2264674,48.8535515],[38.2267777,48.852607],[38.2262528,48.8518078],[38.2248634,48.8505724],[38.2248956,48.8487968],[38.2250512,48.8486026],[38.2245469,48.8470423],[38.2239187,48.8463353],[38.2240212,48.8460186],[38.2237905,48.8454855],[38.2238549,48.844317],[38.2236886,48.8434096],[38.2229268,48.8428624],[38.2221168,48.8412913],[38.2213014,48.8406205],[38.2212424,48.8392965],[38.221752,48.839233],[38.2431561,48.8412666],[38.2546467,48.842174],[38.2598126,48.8427742],[38.2609954,48.8412807],[38.2679933,48.8359034],[38.2709491,48.8324006],[38.2711905,48.8311699],[38.2713568,48.8311523],[38.2724243,48.8246666],[38.3137518,48.8284843],[38.3151144,48.8211418],[38.3158649,48.8183983],[38.3166754,48.8125371],[38.3171582,48.8105094],[38.3180487,48.8085911],[38.3179253,48.8073475],[38.3176303,48.8067504],[38.3170617,48.806383],[38.3167452,48.8057329],[38.3162731,48.8056622],[38.3154416,48.8058248],[38.3119816,48.8052383],[38.2840919,48.8028781],[38.2834643,48.8030194],[38.2831907,48.8024824],[38.2819515,48.8026979],[38.2785505,48.8025566],[38.2779658,48.8012598],[38.2808411,48.7852439],[38.2821768,48.7786304],[38.2819676,48.778344],[38.2824343,48.7772411],[38.2831317,48.7734726],[38.2754016,48.7728008],[38.2709907,48.7643531],[38.2680201,48.7593044],[38.2657281,48.7546333],[38.2631332,48.7502753],[38.2640934,48.750102],[38.2644916,48.7505522],[38.2765174,48.743314],[38.2824317,48.7386355],[38.2831088,48.7373719],[38.2876217,48.736886],[38.2894403,48.7368471],[38.2971597,48.7372079],[38.2972616,48.7369568],[38.3007914,48.7366914],[38.3032054,48.7361006],[38.3167881,48.7349118],[38.3198512,48.7334541],[38.3224636,48.7299476],[38.3231449,48.7284226],[38.3251351,48.7140328],[38.3111662,48.7128365],[38.3079421,48.7126064],[38.3075774,48.7127409],[38.3046055,48.7124259],[38.3041522,48.7108401],[38.3049005,48.7099587],[38.307336,48.7083162],[38.3083069,48.7084613],[38.3086181,48.7078595],[38.3093315,48.70764],[38.3110213,48.7064506],[38.314653,48.7045779],[38.314181,48.6962506],[38.3132489,48.6945652],[38.3072501,48.6877644],[38.3104017,48.6868401],[38.3140388,48.686918],[38.3153021,48.6843592],[38.3102649,48.6839236],[38.3094549,48.6834065],[38.3081299,48.683063],[38.3065259,48.6821492],[38.304128,48.6833853],[38.29584,48.682978],[38.2912213,48.6820607],[38.2893008,48.6823476],[38.284843,48.6821404],[38.2835314,48.6810991],[38.2845908,48.6769992],[38.2855242,48.6724403],[38.2868224,48.6647738],[38.2751816,48.6645364],[38.2739156,48.6636834],[38.2670492,48.6637463],[38.2653969,48.6615212],[38.2651555,48.6602988],[38.2651448,48.6588779],[38.2658046,48.6573046],[38.2659066,48.6563833],[38.2598716,48.656727],[38.2601666,48.6551855],[38.2531553,48.6548772],[38.2525706,48.6579814],[38.2450068,48.6574747],[38.238599,48.6566845],[38.2382315,48.6568049],[38.2387143,48.6549126],[38.2330227,48.6531124],[38.2310271,48.6531727],[38.2259282,48.6527031],[38.2257673,48.6522761],[38.2279962,48.6389812],[38.2288277,48.6350321],[38.22888,48.6340971],[38.2294323,48.6339667],[38.2551342,48.6364231],[38.2634819,48.6370174],[38.2649356,48.6290654],[38.2655203,48.6253638],[38.2656008,48.6236582],[38.2657993,48.6233072],[38.2662821,48.6209579],[38.2661533,48.6208462],[38.2665825,48.6193994],[38.2700372,48.6005266],[38.2706433,48.5957514],[38.2715124,48.5913483],[38.2715017,48.5900994],[38.2716116,48.5900923],[38.2723626,48.5878267],[38.2723546,48.5839783],[38.2729822,48.5813202],[38.273811,48.5759736],[38.275584,48.567137],[38.2771289,48.5575408],[38.2775152,48.5566567],[38.2777888,48.5547784],[38.2776225,48.5546435],[38.2776671,48.5540536],[38.2787839,48.5477102],[38.2792211,48.5461192],[38.2790977,48.5459789],[38.2737225,48.5453326],[38.2788145,48.5415216],[38.276276,48.5407049],[38.2818684,48.5355227],[38.2845533,48.5366594],[38.2922566,48.5307769],[38.3089936,48.5175602],[38.3164769,48.5112633],[38.3183277,48.5098702],[38.31873,48.5092589],[38.3206317,48.5081625],[38.3187997,48.5080683],[38.3175981,48.5082265],[38.3161873,48.5080133],[38.3158895,48.5082247],[38.3149266,48.5083864],[38.3145967,48.5082905],[38.3128157,48.506979],[38.3130223,48.506764],[38.3119628,48.5061989],[38.3120781,48.5050331],[38.3119011,48.5049372],[38.311767,48.5043401],[38.312003,48.5036825],[38.3119011,48.5031778],[38.3115309,48.5027619],[38.3119333,48.5023745],[38.3117831,48.5022537],[38.3093959,48.5021932],[38.3088863,48.501589],[38.3133709,48.5006293],[38.3159405,48.4990013],[38.3165574,48.4987844],[38.3150339,48.496872],[38.3147603,48.4961717],[38.3127165,48.4941525],[38.3115095,48.4927269],[38.3093262,48.4933064],[38.2995039,48.4896126],[38.3002549,48.4893566],[38.3019501,48.4883718],[38.3024543,48.4875931],[38.3023578,48.4870705],[38.3025402,48.4858901],[38.3027762,48.4855025],[38.3026689,48.4849727],[38.3021218,48.4844536],[38.301875,48.4839096],[38.3020091,48.4827362],[38.3027333,48.48072],[38.303082,48.4795465],[38.3031034,48.4789171],[38.3036238,48.4774271],[38.3040583,48.4768652],[38.3039296,48.4768581],[38.3044553,48.4759051],[38.3052224,48.4753823],[38.3038545,48.4745608],[38.3007431,48.4770928],[38.3002442,48.4766874],[38.2991499,48.4771142],[38.2980394,48.477164],[38.2966554,48.4763958],[38.2924712,48.4772742],[38.2910603,48.4765985],[38.2891881,48.4771035],[38.2881689,48.4761967],[38.2889092,48.4760722],[38.2929647,48.4744292],[38.2961512,48.4733481],[38.2981092,48.472466],[38.3047879,48.4700867],[38.3188212,48.4646625],[38.3149749,48.4599349],[38.3108872,48.4557299],[38.3373767,48.4402446],[38.3374035,48.4398353],[38.3387607,48.4398638],[38.3391416,48.4393015],[38.3397692,48.4393335],[38.3397022,48.4386645],[38.3407992,48.4373299],[38.3429986,48.4369508],[38.3434197,48.4370025],[38.3456084,48.4388549],[38.3470649,48.4398229],[38.3484596,48.4401111],[38.3495808,48.4407784],[38.3524024,48.4411894],[38.3533332,48.4414688],[38.3553314,48.441072],[38.3559322,48.4405471],[38.3571821,48.4406663],[38.3576542,48.4410844],[38.3585179,48.4411734],[38.3589926,48.4414937],[38.3595344,48.4420987],[38.3597168,48.4426965],[38.3606449,48.4423798],[38.360948,48.4424332],[38.3621979,48.4433139],[38.3636972,48.4429563],[38.3644912,48.4430951],[38.3650464,48.442967],[38.3656365,48.4432766],[38.3670902,48.4426253],[38.3689034,48.442999],[38.3698529,48.4429421],[38.3715427,48.4425328],[38.3721489,48.4425648],[38.37349,48.4420951],[38.3745038,48.4414581],[38.3751315,48.4414118],[38.3797181,48.4304998],[38.3804476,48.4300833],[38.3824003,48.4294141],[38.3847392,48.4298555],[38.393392,48.4321584],[38.4029084,48.4344542],[38.4006768,48.4397713],[38.4128755,48.4421129],[38.4154022,48.4428246],[38.4178752,48.4438388],[38.4231323,48.4450843],[38.4316617,48.4475787],[38.4331875,48.4476651],[38.4333354,48.4475139],[38.4331929,48.4466888],[38.4336394,48.4442295],[38.433439,48.4432132],[38.4327311,48.4424854],[38.4331043,48.4416173],[38.433516,48.4412494],[38.4336059,48.4408445],[38.4339534,48.4404326],[38.4338138,48.4398644],[38.4342325,48.4394457],[38.4340544,48.4386244],[38.4345859,48.4377446],[38.4332641,48.4368277],[38.43346,48.4360137],[38.4322942,48.4351155],[38.4333357,48.4338785],[38.4334764,48.4319743],[38.4351602,48.4288136],[38.4346934,48.4286602],[38.4357387,48.426697],[38.4351417,48.4256596],[38.4362015,48.4252224],[38.4359426,48.4249528],[38.4364814,48.4232156],[38.4391082,48.4198981],[38.4383843,48.4187171],[38.4393977,48.4175264],[38.4384335,48.4162834],[38.4381434,48.4137264],[38.4392129,48.4121924],[38.4383648,48.4105074],[38.4386261,48.4096691],[38.4380919,48.4084527],[38.4386411,48.4078078],[38.4379551,48.4074899],[38.4374217,48.4059147],[38.4366703,48.405345],[38.4374395,48.4040924],[38.4374048,48.4023171],[38.4381811,48.3993936],[38.4366438,48.3960769],[38.4391053,48.3915523],[38.4414204,48.3895703],[38.442527,48.3877603],[38.4431323,48.3863956],[38.4429384,48.3862986],[38.4475694,48.3800233],[38.4500969,48.3759133],[38.4534124,48.3811448],[38.4595262,48.3797476],[38.4649753,48.379202],[38.4685913,48.3791478],[38.4703531,48.375201],[38.4708292,48.3747463],[38.4719893,48.372396],[38.4724506,48.3692288],[38.4728536,48.367546],[38.4774386,48.3675526],[38.4823024,48.3652044],[38.4828308,48.3655537],[38.4848666,48.3644934],[38.4868568,48.361872],[38.4848237,48.3608276],[38.4841171,48.3615025],[38.4710095,48.3600359],[38.4735142,48.35605],[38.4709524,48.3553334],[38.4717713,48.3533683],[38.470712,48.3510007],[38.4720208,48.3500933],[38.4697679,48.3490855],[38.4687245,48.349944],[38.4635549,48.3520133],[38.4617699,48.3502347],[38.4641873,48.3488393],[38.4636564,48.348458],[38.4610726,48.3480948],[38.4608739,48.3475664],[38.45571,48.3468162],[38.4563502,48.3425761],[38.4448266,48.3414113],[38.4446105,48.3408137],[38.434074,48.3397013],[38.4334453,48.3392632],[38.437043,48.3232138],[38.4393729,48.323474],[38.4397578,48.3204878],[38.4402466,48.3181949],[38.4411454,48.3164583],[38.4386854,48.315707],[38.4362402,48.3155446],[38.4346106,48.3147145],[38.4345595,48.3138609],[38.4339427,48.3134006],[38.4327695,48.3128882],[38.4326088,48.3121233],[38.4316797,48.3114793],[38.4318416,48.3109961],[38.4315356,48.3105818],[38.431595,48.3102561],[38.4309835,48.3096411],[38.4300665,48.3091912],[38.4283513,48.3086695],[38.4281664,48.3083439],[38.4273466,48.3060825],[38.4281481,48.3043525],[38.4279828,48.3031279],[38.4283645,48.3029628],[38.4289034,48.303076],[38.4299246,48.3022457],[38.4299388,48.3014344],[38.4303969,48.3006929],[38.4329075,48.2999328],[38.4332719,48.2995756],[38.4336371,48.2988915],[38.4337894,48.2971971],[38.4336471,48.2966355],[38.4332209,48.2961317],[38.4317639,48.2954819],[38.4299962,48.2950715],[38.4281847,48.2934769],[38.4281042,48.2931536],[38.4287154,48.292216],[38.4285399,48.2919008],[38.4279481,48.2916372],[38.4278331,48.2908779],[38.4274095,48.2904673],[38.4275653,48.2902235],[38.4279658,48.2902483],[38.4287015,48.2906167],[38.4293206,48.2904684],[38.4294942,48.2900808],[38.428944,48.289649],[38.4279409,48.2893989],[38.4270869,48.288764],[38.4261055,48.2886303],[38.4249672,48.2881049],[38.4248693,48.2872429],[38.4250898,48.2866753],[38.4266159,48.2855896],[38.4276445,48.2852034],[38.4281824,48.2848301],[38.4283873,48.284252],[38.4281588,48.2835869],[38.4274751,48.2827835],[38.42624,48.2818969],[38.4260605,48.2813202],[38.4262163,48.2807528],[38.4275287,48.2797848],[38.4275846,48.2793181],[38.4270415,48.2782877],[38.4317598,48.2782552],[38.4595946,48.276404],[38.5210936,48.2729752],[38.5210368,48.2785637],[38.5240199,48.2784578],[38.5244765,48.272712],[38.5669617,48.2700742],[38.56764,48.2698098],[38.5688685,48.2697739],[38.5713119,48.2682104],[38.5733298,48.2680786],[38.5746523,48.2676195],[38.5753142,48.2673126],[38.57568,48.2661837],[38.5786179,48.264291],[38.582357,48.2624605],[38.5848872,48.2602568],[38.5877545,48.258197],[38.5882967,48.2572353],[38.5882455,48.2569614],[38.5885679,48.2567485],[38.5885276,48.2551065],[38.5887995,48.2545245],[38.5892861,48.2538362],[38.5906318,48.2526275],[38.5911911,48.2517491],[38.5909095,48.2513197],[38.5902523,48.2510795],[38.5898495,48.2506739],[38.5897415,48.2503519],[38.5901035,48.2496394],[38.5893028,48.2495175],[38.5898127,48.2489062],[38.5892028,48.2486606],[38.5891175,48.2481963],[38.5897088,48.2477582],[38.5899438,48.2473307],[38.5893256,48.2466741],[38.5891684,48.2462929],[38.5895333,48.2452115],[38.5890936,48.244508],[38.5881381,48.2437194],[38.588817,48.2434601],[38.5877689,48.2431232],[38.5879716,48.2422792],[38.5877996,48.2415172],[38.5878937,48.2408869],[38.5881808,48.2406262],[38.5888404,48.2405453],[38.5889513,48.240046],[38.5893979,48.2398691],[38.5895959,48.2396081],[38.5875453,48.2382653],[38.5878085,48.236752],[38.5884363,48.2356143],[38.5881863,48.2344596],[38.5887248,48.2343347],[38.590145,48.2348095],[38.5903036,48.2343718],[38.5900673,48.2334687],[38.588814,48.2330731],[38.5885197,48.232829],[38.5894643,48.2321842],[38.5889789,48.2317873],[38.5889327,48.231273],[38.5885926,48.2308076],[38.5891509,48.2300071],[38.5889417,48.2294246],[38.5889259,48.2289617],[38.5891685,48.228208],[38.589035,48.2273477],[38.5894549,48.2269066],[38.5901915,48.226563],[38.5914526,48.2249386],[38.5923303,48.2249312],[38.5924636,48.2247532],[38.5922234,48.223578],[38.5948535,48.220708],[38.5959832,48.2178687],[38.5969456,48.2163546],[38.5975035,48.2160651],[38.5986332,48.2147196],[38.6003627,48.2133734],[38.6011244,48.2133162],[38.6012993,48.2130396],[38.6018862,48.2126871],[38.6034741,48.2122939],[38.603855,48.2119722],[38.6041071,48.2114646],[38.6041018,48.2107211],[38.6055479,48.2094434],[38.6072078,48.2086655],[38.6079298,48.2086175],[38.608125,48.2082472],[38.6079802,48.2069673],[38.6084093,48.2066027],[38.6089114,48.206283],[38.6096217,48.2061701],[38.6099168,48.2057518],[38.6104371,48.205498],[38.6118318,48.2051369],[38.6134215,48.2042346],[38.6133854,48.2037983],[38.6129208,48.2033028],[38.6117621,48.2027844],[38.6110862,48.2011683],[38.6112489,48.2005867],[38.6111935,48.200092],[38.610464,48.1987333],[38.6104425,48.1979752],[38.6108287,48.197446],[38.6106571,48.1966451],[38.6095606,48.1957067],[38.6087451,48.195292],[38.6081658,48.1947055],[38.6082088,48.1941048],[38.6092816,48.1935183],[38.6115366,48.1927675],[38.6116883,48.1915307],[38.6113373,48.190887],[38.6108086,48.190219],[38.6099946,48.1896214],[38.60733,48.189065],[38.604978,48.189167],[38.6042374,48.1887774],[38.6034627,48.1875764],[38.6034709,48.1865057],[38.6032259,48.1859814],[38.6023767,48.1853598],[38.6015661,48.1843576],[38.601011,48.1825234],[38.5981484,48.1800388],[38.5987974,48.1789465],[38.5998384,48.1777604],[38.6006235,48.1774538],[38.602172,48.176089],[38.6026313,48.1753621],[38.6014285,48.172944],[38.6016265,48.1725099],[38.6099054,48.1702147],[38.6143334,48.1695768],[38.6282595,48.1651819],[38.6350638,48.1632445],[38.6376809,48.1631998],[38.6385251,48.1633083],[38.6410942,48.1640778],[38.6457081,48.1643822],[38.6499994,48.1643466],[38.6689874,48.1648024],[38.6706197,48.1639561],[38.6717457,48.162151],[38.6645792,48.1525925],[38.6627308,48.1507506],[38.6740668,48.148535],[38.6824673,48.1455474],[38.6844974,48.1462236],[38.6864305,48.1472952],[38.687012,48.1472767],[38.6882617,48.1469763],[38.6897986,48.1460426],[38.7022654,48.1435445],[38.70468,48.1431096],[38.7117396,48.1423358],[38.7141784,48.141836],[38.7168429,48.1415499],[38.7216423,48.1389356],[38.7291739,48.1367129],[38.731613,48.1365408],[38.733218,48.1361597],[38.7373214,48.1345559],[38.7386455,48.1342163],[38.7399469,48.1341478],[38.7411176,48.1346073],[38.7454473,48.1346027],[38.7474118,48.1341502],[38.7500151,48.1338847],[38.7546306,48.1320814],[38.7576187,48.1316166],[38.7601995,48.131565],[38.7612633,48.1321097],[38.7622863,48.1322689],[38.7632901,48.1319711],[38.765195,48.1304902],[38.7656647,48.130377],[38.7659841,48.1304918],[38.765829,48.1317622],[38.7659341,48.132105],[38.7662963,48.1321771],[38.7671512,48.1317791],[38.7686085,48.1302259],[38.7697171,48.1302995],[38.770208,48.1302291],[38.7705075,48.1300013],[38.7710216,48.1295026],[38.7718392,48.1278766],[38.7731625,48.1276223],[38.7741461,48.1270389],[38.775127,48.1270551],[38.7767416,48.1284574],[38.7792304,48.129947],[38.7801038,48.1301628],[38.780595,48.1300067],[38.7810661,48.129565],[38.7815653,48.1275101],[38.7806317,48.126409],[38.7808044,48.1259096],[38.7828767,48.1250284],[38.7847553,48.1245179],[38.7859276,48.1246486],[38.7882522,48.1245958],[38.7896401,48.1241558],[38.7901529,48.123914],[38.7910526,48.122902],[38.7916083,48.1225746],[38.7947032,48.1218378],[38.7956444,48.1210828],[38.7961594,48.1202699],[38.7980197,48.1189312],[38.8004512,48.1187213],[38.8021372,48.1183101],[38.8043321,48.1186566],[38.8060818,48.1183026],[38.8072967,48.1184189],[38.8095542,48.1191222],[38.8106205,48.1190811],[38.8115173,48.1187257],[38.8117102,48.1184405],[38.8115008,48.1174122],[38.8120781,48.1169705],[38.8152338,48.1169328],[38.8203959,48.1162414],[38.8175557,48.1094934],[38.8114651,48.097305],[38.806696,48.0882836],[38.8104311,48.0872851],[38.8174818,48.0843192],[38.8142957,48.0815882],[38.8119997,48.0805656],[38.8087415,48.0780326],[38.8042126,48.0784256],[38.7995269,48.0747152],[38.8038945,48.071225],[38.8031906,48.0703088],[38.8070963,48.0692646],[38.8126125,48.0672254],[38.8140863,48.067186],[38.8168914,48.0659799],[38.8179226,48.0659146],[38.8184545,48.0663176],[38.820391,48.0684504],[38.8218017,48.0711997],[38.8241029,48.0742751],[38.8286092,48.0777808],[38.82905,48.077752],[38.8293027,48.0774432],[38.8286584,48.075773],[38.8271626,48.0735856],[38.8283956,48.0726832],[38.8279427,48.0719113],[38.8289379,48.071992],[38.8286123,48.0710784],[38.828016,48.0702814],[38.826834,48.0692337],[38.8297698,48.0683545],[38.8269339,48.0660459],[38.826754,48.0656663],[38.8293394,48.0648809],[38.8291555,48.0644302],[38.8304809,48.0633834],[38.8293595,48.0628421],[38.8272786,48.0606015],[38.8285357,48.0591502],[38.8314692,48.0579098],[38.8310366,48.0573797],[38.8289861,48.058065],[38.8219061,48.057328],[38.8213193,48.0516809],[38.819672,48.0510691],[38.8151558,48.0509123],[38.8145428,48.0505026],[38.8126713,48.0479449],[38.8146831,48.0468311],[38.816937,48.0444598],[38.8189543,48.0434166],[38.8195003,48.0423906],[38.8213309,48.0430268],[38.825587,48.0380445],[38.8213775,48.0358527],[38.8229821,48.0330544],[38.8253525,48.0297743],[38.8540755,48.0204487],[38.8612538,48.0147577],[38.9219424,48.0126528],[38.9376714,48.0118772],[38.9831005,48.0092303],[38.9877601,48.0093736],[38.9965262,48.0093172],[39.004824,48.0085033],[39.0162707,48.0082739],[39.0199514,48.0078735],[39.0251426,48.0075727],[39.0398439,48.0069404],[39.0406057,48.0016289],[39.0405406,48.0000156],[39.0434811,47.9887473],[39.0423555,47.9777542],[39.0402708,47.9627636],[39.0390406,47.9582235],[39.0385863,47.9570577],[39.0385008,47.9563534],[39.0390106,47.9559724],[39.039719,47.955858],[39.0404559,47.95601],[39.041477,47.9569805],[39.0421005,47.9570565],[39.0426672,47.9569611],[39.0435737,47.9564087],[39.0442253,47.956218],[39.0460108,47.9562364],[39.0466339,47.9558173],[39.0467747,47.9548464],[39.0471143,47.9543513],[39.0479358,47.9539322],[39.0506563,47.9540072],[39.0525842,47.9548249],[39.0529809,47.9547295],[39.0532638,47.9543106],[39.0530648,47.9536253],[39.0514766,47.9524268],[39.050739,47.9515514],[39.0507101,47.9509422],[39.0523812,47.95018],[39.0530328,47.9500655],[39.0539963,47.9501602],[39.054535,47.9504265],[39.0550733,47.950274],[39.0549592,47.9495697],[39.0561202,47.9488838],[39.0564313,47.9483696],[39.0564302,47.9473226],[39.0570247,47.9468464],[39.0586115,47.9468647],[39.0594335,47.9470736],[39.0602274,47.9475872],[39.0607101,47.9483865],[39.0613623,47.948824],[39.0647625,47.948765],[39.065613,47.9490501],[39.066153,47.9503443],[39.0662674,47.9511818],[39.0665226,47.9513149],[39.0675697,47.9502292],[39.0680511,47.9499815],[39.0688442,47.9497526],[39.0696379,47.9499615],[39.070659,47.9506843],[39.071795,47.952473],[39.0723907,47.9529295],[39.0738359,47.9529286],[39.0744587,47.9524333],[39.0748828,47.9518048],[39.0755624,47.9514236],[39.0757312,47.9506239],[39.0773148,47.9483766],[39.0795699,47.9479571],[39.0798176,47.9474287],[39.0791255,47.9465859],[39.0790966,47.9462052],[39.0792943,47.9457672],[39.0806247,47.9449096],[39.0805951,47.9441292],[39.0815288,47.9433052],[39.0831575,47.9430184],[39.0837237,47.9426849],[39.0837939,47.9423517],[39.0836161,47.9418521],[39.0839342,47.941495],[39.0837212,47.9411858],[39.0840041,47.9409238],[39.0844995,47.9406379],[39.0870845,47.940517],[39.0889262,47.940587],[39.0914413,47.9409895],[39.0906231,47.9388961],[39.0785871,47.9183652],[39.0651605,47.8960073],[39.0683341,47.8876293],[39.0725623,47.8753003],[39.0731563,47.8729739],[39.0744646,47.8695196],[39.0831103,47.8695323],[39.0830608,47.851627],[39.1094853,47.8516541],[39.1094632,47.8426717],[39.1496272,47.842376],[39.1499219,47.851505],[39.1622807,47.851569],[39.1679822,47.8480325],[39.1681538,47.847509],[39.1688325,47.847242],[39.1691211,47.8469226],[39.1697374,47.8466138],[39.1705253,47.8467761],[39.1719295,47.8462211],[39.1722727,47.8465876],[39.1721401,47.8471111],[39.17434,47.8485665],[39.1757051,47.849891],[39.1757129,47.850336],[39.175908,47.8505768],[39.1778894,47.8514249],[39.1798709,47.8527231],[39.1809689,47.8536801],[39.2364875,47.8536464],[39.2366246,47.8541307],[39.2363764,47.8544675],[39.2348164,47.8563829],[39.2335604,47.857435],[39.2341767,47.8586284],[39.2339274,47.8599062],[39.234527,47.860555],[39.2354083,47.8604774],[39.23681,47.86091],[39.2375271,47.8623757],[39.2370304,47.8629883],[39.2370469,47.8634435],[39.2367932,47.8635989],[39.236738,47.8641799],[39.2369366,47.8646499],[39.241737,47.8670691],[39.3514412,47.8669487],[39.34839,47.871448],[39.3541882,47.872621],[39.3554047,47.8727119],[39.3873086,47.8711604],[39.4118449,47.8310316],[39.4132247,47.8297274],[39.4219565,47.8331576],[39.4244528,47.8357549],[39.4263563,47.8369279],[39.4301319,47.8373887],[39.4311617,47.8379752],[39.4327356,47.838212],[39.4332817,47.8381282],[39.43366,47.8387408],[39.4351188,47.838644],[39.4366127,47.8392069],[39.4373538,47.8391152],[39.4379272,47.8394006],[39.4379935,47.8396964],[39.4393541,47.8401865],[39.4332243,47.8443538],[39.4399605,47.8547661],[39.4425643,47.8552263],[39.4427671,47.8550797],[39.4443819,47.8550797],[39.4450294,47.8553833],[39.4459655,47.8554566],[39.4464492,47.8552577],[39.4469095,47.8546924],[39.4469095,47.8538286],[39.446496,47.8535617],[39.4462152,47.8530906],[39.4456145,47.8528288],[39.4455053,47.8525775],[39.4462687,47.8523184],[39.4468512,47.8525162],[39.4486493,47.8519273],[39.4489769,47.852223],[39.4500301,47.8524534],[39.4499911,47.8528041],[39.4508999,47.8531025],[39.4515477,47.8538942],[39.4520119,47.853991],[39.4542172,47.855226],[39.4563465,47.8552556],[39.4584426,47.8555592],[39.4599209,47.8569805],[39.4606567,47.8572518],[39.4608127,47.8574611],[39.461468,47.8575763],[39.4618035,47.8581625],[39.4623716,47.8586199],[39.4622944,47.8587014],[39.4636293,47.859016],[39.4641478,47.8589827],[39.4647546,47.8595452],[39.4664812,47.8598487],[39.466779,47.8596155],[39.4687245,47.8597197],[39.4695982,47.8593691],[39.472079,47.8589556],[39.4739512,47.8595837],[39.4755582,47.8597564],[39.4773758,47.8603478],[39.4778062,47.8606797],[39.4787258,47.8596487],[39.5209371,47.8256835],[39.5349572,47.8328253],[39.5425159,47.8250596],[39.5437666,47.8256109],[39.5445747,47.8264637],[39.5458622,47.826868],[39.5468001,47.8278994],[39.5478025,47.82806],[39.5493183,47.8288152],[39.5507544,47.8286732],[39.5514936,47.8290139],[39.5520778,47.8295027],[39.5536993,47.8299008],[39.5546047,47.8305915],[39.5569546,47.831184],[39.55782,47.8319],[39.5604566,47.8327951],[39.5606089,47.8330328],[39.561897,47.8335761],[39.5623604,47.8339094],[39.5627134,47.8345907],[39.5636401,47.8349239],[39.5640593,47.8354497],[39.5655533,47.8364555],[39.6216631,47.8363575],[39.6218077,47.8373306],[39.6225528,47.8379451],[39.6244949,47.8385568],[39.6257098,47.839133],[39.6295369,47.8384799],[39.6339835,47.8385794],[39.6353642,47.8383542],[39.6358229,47.8385006],[39.6451077,47.8363677],[39.6480478,47.8353442],[39.6522289,47.8329947],[39.7231968,47.8285025],[39.7375812,47.8277172],[39.7384963,47.8280085],[39.7567387,47.8468232],[39.7560201,47.8483521],[39.7595592,47.8482492],[39.7636777,47.853288],[39.7633759,47.8597129],[39.7634486,47.8706904],[39.7650257,47.8712518],[39.7655085,47.8712662],[39.7671822,47.8709567],[39.7676757,47.8710143],[39.7681478,47.8706545],[39.7714727,47.8705087],[39.7719351,47.8701867],[39.7726646,47.8699995],[39.7740916,47.8700499],[39.7752278,47.8696019],[39.7767416,47.869287],[39.7782114,47.8694166],[39.7796276,47.8692582],[39.7810975,47.86987],[39.7835866,47.8694382],[39.784402,47.8695317],[39.7848526,47.8693662],[39.7878138,47.8691863],[39.7880176,47.8690423],[39.7909573,47.8688696],[39.7935966,47.8692798],[39.7938755,47.8695173],[39.7939603,47.8700841],[39.7944227,47.8703954],[39.7949201,47.8703755],[39.7940641,47.9149851],[39.7935606,47.915877],[39.7936484,47.9193514],[39.7942688,47.9198203],[39.7945151,47.9207495],[39.7964908,47.9219495],[39.7966194,47.9224593],[39.7981328,47.9236931],[39.7983668,47.9241426],[39.7991781,47.9244876],[39.7993341,47.9248013],[39.8004731,47.9257318],[39.8010971,47.9265368],[39.801378,47.9271118],[39.8011127,47.9274463],[39.801222,47.9276659],[39.8003639,47.9290145],[39.8004731,47.9304258],[39.80072,47.93129],[39.8005906,47.931505],[39.8006872,47.9320455],[39.8014072,47.9328695],[39.8021212,47.9347411],[39.8061595,47.9349698],[39.8064707,47.9348333],[39.8060621,47.9505385],[39.8217387,47.9507538],[39.8210691,47.9516914],[39.8218965,47.9526519],[39.8221282,47.9535238],[39.8224371,47.9539376],[39.8241581,47.9546543],[39.8247759,47.955297],[39.8246113,47.9561036],[39.8243851,47.9562746],[39.8235537,47.9561325],[39.8224288,47.9562323],[39.8223047,47.9571663],[39.8232673,47.9576365],[39.8232719,47.9583128],[39.8222009,47.9590009],[39.8223068,47.9594485],[39.8220124,47.9597982],[39.8216729,47.9600131],[39.8194237,47.960121],[39.8181401,47.960644],[39.81858,47.9610932],[39.8186852,47.9615527],[39.8179927,47.961973],[39.8176802,47.9625313],[39.8178243,47.9630989],[39.8170388,47.963221],[39.8168995,47.963486],[39.8172734,47.9641316],[39.8180028,47.964566],[39.8181787,47.9652508],[39.8172,47.96596],[39.81703,47.96648],[39.8171084,47.9667086],[39.8182374,47.9670522],[39.8189656,47.9675343],[39.81874,47.96785],[39.8169679,47.9680572],[39.8163476,47.9684133],[39.81686,47.96957],[39.8165697,47.9703194],[39.8166102,47.9706427],[39.8171228,47.9709502],[39.8170937,47.9716746],[39.8178647,47.9746891],[39.8187837,47.9758064],[39.8206876,47.9764293],[39.821542,47.9769319],[39.8229166,47.9799297],[39.8231004,47.9812205],[39.822819,47.9827835],[39.8223456,47.9831026],[39.8206298,47.9832431],[39.8178081,47.984112],[39.8172586,47.9836262],[39.8162114,47.9834736],[39.8158071,47.9846394],[39.8149881,47.9856595],[39.815185,47.9875122],[39.8149466,47.9885322],[39.8151539,47.9891637],[39.8154857,47.9891498],[39.8163773,47.98958],[39.8180569,47.9896147],[39.81857,47.99034],[39.8178599,47.9906138],[39.8166676,47.9906208],[39.8164188,47.9908289],[39.8163773,47.9918489],[39.8159523,47.9930839],[39.8161492,47.9934447],[39.81771,47.99394],[39.8178081,47.9947074],[39.8171238,47.9954428],[39.8165121,47.9952833],[39.81589,47.9953596],[39.8152058,47.9959285],[39.813267,47.9966153],[39.8128109,47.9970108],[39.8128212,47.9972744],[39.8132359,47.9977531],[39.813153,47.9979543],[39.8136817,47.9984815],[39.8159419,47.99998],[39.8164188,48.0007362],[39.8164603,48.0013189],[39.8162011,48.0015339],[39.8143971,48.0014438],[39.813858,48.0023664],[39.8130908,48.0026786],[39.8104368,48.0027069],[39.8096894,48.0028598],[39.8096029,48.0031037],[39.8103788,48.0033722],[39.8106406,48.0037773],[39.810752,48.0040659],[39.8105447,48.0045654],[39.8093627,48.0047873],[39.8074226,48.0046286],[39.8063716,48.0056542],[39.8049556,48.005563],[39.8040134,48.0058362],[39.8037557,48.0066255],[39.8030953,48.007585],[39.8027408,48.0077279],[39.8021884,48.0076729],[39.8008134,48.0069615],[39.8003255,48.0069966],[39.799761,48.0080551],[39.7993062,48.0084636],[39.79885,48.0086717],[39.7975229,48.0087133],[39.7967143,48.0095456],[39.7934796,48.0108219],[39.7920696,48.0116819],[39.7915512,48.0118206],[39.7911969,48.0121917],[39.7909913,48.01318],[39.7902656,48.0138874],[39.7900997,48.0149416],[39.7896021,48.0153716],[39.7885861,48.0157322],[39.7884409,48.0163841],[39.7878035,48.017467],[39.7880395,48.0177753],[39.7880615,48.0181744],[39.7877981,48.0182149],[39.787777,48.0185106],[39.7874083,48.018706],[39.786473,48.0190014],[39.7864192,48.0193384],[39.7868925,48.0195322],[39.7870878,48.0206423],[39.7855173,48.0217654],[39.7842478,48.0229939],[39.784085,48.0239082],[39.7853514,48.0252048],[39.7848952,48.0255515],[39.783491,48.0259174],[39.7841683,48.0271111],[39.7844541,48.0281181],[39.7841404,48.0288515],[39.7837706,48.0293309],[39.7828915,48.0297727],[39.7822826,48.0305852],[39.7822826,48.0309873],[39.7815946,48.0319403],[39.7816959,48.0322513],[39.7806741,48.0334558],[39.78081,48.03394],[39.7789903,48.0343908],[39.7785285,48.0348694],[39.77857,48.03617],[39.7782523,48.0363468],[39.7780601,48.0367604],[39.7784864,48.0370552],[39.778651,48.0380133],[39.7764242,48.0384384],[39.7761965,48.0387942],[39.7764975,48.0397836],[39.8833881,48.0416068],[39.8835106,48.0489882],[39.8476919,48.059076],[39.8442592,48.06105],[39.843822,48.0611164],[39.8339672,48.0670142],[39.8688876,48.0791953],[39.87419,48.10896],[39.8704565,48.1166083],[39.8764637,48.118908],[39.8860876,48.1282079],[39.889203,48.1306223],[39.8974738,48.1340955],[39.8993645,48.135854],[39.9002671,48.1382678],[39.902495,48.1403415],[39.9067164,48.1488308],[39.9078304,48.1578272],[39.9067751,48.1683862],[39.9098171,48.1798459],[39.9141133,48.1806312],[39.9162161,48.1806741],[39.9200249,48.182019],[39.9267679,48.181597],[39.928793,48.1814002],[39.9311587,48.1809424],[39.9329799,48.1810729],[39.9341816,48.1808208],[39.9367189,48.1812715],[39.9384195,48.1817186],[39.9390954,48.1820441],[39.9389023,48.1826164],[39.9390042,48.1830706],[39.9410427,48.1877953],[39.9413753,48.1891757],[39.9419707,48.1902665],[39.9423033,48.1912178],[39.9422014,48.1914967],[39.9425393,48.1929379],[39.9418098,48.1958594],[39.9390417,48.1979691],[39.9381405,48.1989131],[39.9382585,48.2090222],[39.9385884,48.2093886],[39.9406645,48.2105791],[39.9413967,48.2122556],[39.9416676,48.2137481],[39.9410695,48.2162985],[39.9411929,48.2232824],[39.9418902,48.2254696],[39.942019,48.2269599],[39.9427164,48.2301511],[39.9429256,48.2304155],[39.9433976,48.2304619],[39.946965,48.229758],[39.9504572,48.229272],[39.9549419,48.2288241],[39.9587747,48.2281266],[39.9607488,48.2280194],[39.9678165,48.2284751],[39.9691683,48.2284],[39.9699408,48.2282857],[39.9718291,48.2272815],[39.9737817,48.2268991],[39.9846339,48.2265739],[39.9895638,48.2260521],[40.0010544,48.2252516],[40.0021326,48.224762],[40.0031412,48.2239758],[40.0028408,48.2234004],[40.0095409,48.2246869],[40.0066522,48.2418724],[40.0207043,48.2536483],[40.0123733,48.2653696],[40.015254,48.2665944],[40.0135231,48.2698488],[40.0100747,48.26976],[40.0042031,48.2808072],[39.994247,48.3002641],[39.9933216,48.3130665],[39.9929595,48.3137542],[39.9907976,48.3161542],[39.9906394,48.3166037],[39.9907896,48.3170318],[39.9904382,48.3171825],[39.9869889,48.3175197],[39.9851342,48.3169177],[39.983844,48.3160624],[39.9826518,48.315769],[39.9788953,48.3157645],[39.9753521,48.314317],[39.9742186,48.3133566],[39.9721574,48.3127609],[39.9715225,48.312275],[39.9710442,48.3115867],[39.9717139,48.3098225],[39.9716443,48.3096085],[39.9706963,48.308868],[39.9711138,48.3078847],[39.9710964,48.3072252],[39.9707572,48.3070285],[39.9688004,48.3070806],[39.9664174,48.3067162],[39.9657825,48.3064501],[39.9653737,48.3046799],[39.9650954,48.3044196],[39.964791,48.3043848],[39.9641713,48.3036988],[39.9632433,48.3032295],[39.9631333,48.3030386],[39.9567188,48.3016951],[39.9566169,48.3021046],[39.9567282,48.3029057],[39.95635,48.3033598],[39.9558806,48.303622],[39.9539615,48.3040467],[39.9520558,48.3036283],[39.9516387,48.3030315],[39.9519418,48.3024445],[39.9516803,48.3020422],[39.9521135,48.3010813],[39.952025,48.3003346],[39.9515945,48.2999617],[39.9499691,48.29948],[39.9495721,48.299091],[39.9495828,48.2987573],[39.9503499,48.2981952],[39.9507268,48.2975297],[39.9504894,48.2971773],[39.9491443,48.2968025],[39.9484295,48.2962824],[39.9483316,48.2960308],[39.9485689,48.2948272],[39.9484134,48.2944141],[39.9465573,48.2938751],[39.9455582,48.292485],[39.944386,48.2919568],[39.9433547,48.292029],[39.9419519,48.2925457],[39.941496,48.2929204],[39.9406283,48.2925305],[39.9374324,48.2920826],[39.9369349,48.2916034],[39.9365754,48.2909164],[39.9364829,48.289942],[39.9365433,48.2894289],[39.9368517,48.2888453],[39.936896,48.2877129],[39.9363083,48.2862745],[39.9361208,48.2851937],[39.9355173,48.2843343],[39.9349138,48.2837426],[39.9343894,48.2835436],[39.9331476,48.2837864],[39.9322169,48.2837792],[39.9309871,48.2834463],[39.930173,48.2829975],[39.9300563,48.2827056],[39.9301462,48.2825218],[39.9313304,48.2816204],[39.9319138,48.2812982],[39.9343814,48.2805932],[39.9349648,48.2799327],[39.9350332,48.2796873],[39.9348293,48.2792214],[39.9343345,48.2790545],[39.9329075,48.2792544],[39.9323952,48.2790259],[39.9320224,48.2782548],[39.9317354,48.2780388],[39.9295722,48.2777818],[39.928194,48.2768176],[39.9274988,48.2758967],[39.9271689,48.2751416],[39.9256736,48.2737768],[39.9259861,48.2724156],[39.92586,48.2720326],[39.9254175,48.2716917],[39.9245645,48.2713783],[39.9233843,48.2713051],[39.9211514,48.2717113],[39.9204071,48.2716488],[39.9196091,48.271215],[39.9187253,48.2704455],[39.9166252,48.2698412],[39.9153873,48.2696662],[39.9143144,48.2698956],[39.9144928,48.2705241],[39.9150467,48.2713382],[39.9148804,48.2719237],[39.9143037,48.2719827],[39.9130055,48.2711132],[39.9124449,48.2710008],[39.9109027,48.2711579],[39.9102791,48.2716408],[39.9106318,48.2722022],[39.9118575,48.2728681],[39.9122652,48.2738429],[39.9116376,48.2747462],[39.9114726,48.2753451],[39.9112138,48.2755049],[39.9114954,48.2757351],[39.912048,48.2757351],[39.9128687,48.2763117],[39.9133314,48.2768214],[39.9135178,48.2774569],[39.9140248,48.2778451],[39.9142313,48.2787912],[39.9149877,48.2796391],[39.9153149,48.2802513],[39.9153055,48.2807315],[39.9150869,48.281109],[39.9153069,48.2814687],[39.9152076,48.2819006],[39.915382,48.2822594],[39.9153391,48.282478],[39.9148563,48.2828538],[39.9149354,48.2832884],[39.9145237,48.2836159],[39.9145585,48.2837962],[39.9128379,48.2837971],[39.9127132,48.2841603],[39.9123229,48.2843245],[39.9120777,48.2853381],[39.9123645,48.2858701],[39.9121553,48.2860879],[39.9122089,48.2865162],[39.9116376,48.2868803],[39.9112889,48.2869249],[39.9111119,48.2872176],[39.9112406,48.2874389],[39.9111662,48.2879654],[39.9103874,48.2912561],[39.9016196,48.2950806],[39.8871195,48.304441],[39.8871919,48.3092954],[39.8581463,48.3091063],[39.8408125,48.3096602],[39.842108,48.319998],[39.8409574,48.3289063],[39.8447299,48.3292914],[39.8451202,48.3294591],[39.845489,48.330266],[39.8454058,48.3323006],[39.8461005,48.3326884],[39.8499602,48.3336014],[39.8605724,48.3344742],[39.8648854,48.3345598],[39.8773281,48.3339081],[39.8802303,48.3342451],[39.8988622,48.3377612],[39.9186636,48.3416872],[39.9187039,48.3472163],[39.9321388,48.3490874],[39.9427029,48.345693],[39.9467075,48.3541298],[39.9417105,48.3549221],[39.9366331,48.356356],[39.9348173,48.3577675],[39.9353349,48.3592468],[39.932937,48.3630107],[39.9338027,48.3639334],[39.9317582,48.3644239],[39.9323765,48.3651379],[39.9341234,48.3643447],[39.9365902,48.3675067],[39.9356139,48.3688093],[39.9349862,48.3702348],[39.9346912,48.3714428],[39.9347877,48.3724157],[39.9357587,48.3741582],[39.9376148,48.3760788],[39.9405599,48.3795315],[39.9425286,48.383016],[39.9428451,48.3844518],[39.9427646,48.3852783],[39.9423033,48.3861547],[39.9415255,48.3869135],[39.9405867,48.3874158],[39.9396533,48.3876652],[39.9381888,48.3875833],[39.9372232,48.3872128],[39.9353725,48.3853923],[39.934541,48.3840314],[39.9332267,48.3792144],[39.9318293,48.3773438],[39.9305364,48.3762997],[39.9287742,48.3755301],[39.9265695,48.3751702],[39.9248207,48.3752165],[39.9231362,48.3754731],[39.9217361,48.3759541],[39.9202073,48.3767166],[39.9188715,48.3777179],[39.9175733,48.379503],[39.916656,48.381427],[39.9164897,48.3839281],[39.9160874,48.3855419],[39.9158031,48.3859944],[39.9148321,48.3868102],[39.913491,48.3874408],[39.9081051,48.3886805],[39.9067426,48.3894464],[39.906131,48.3900805],[39.9059808,48.390882],[39.9062383,48.391598],[39.9066675,48.3921501],[39.9077296,48.3928127],[39.9098057,48.3933399],[39.9142367,48.393892],[39.9154437,48.394241],[39.9170154,48.3949997],[39.9180722,48.3959971],[39.9184424,48.3969338],[39.9185228,48.3978563],[39.9176753,48.3992703],[39.915626,48.4007947],[39.912917,48.4016459],[39.9083143,48.4022762],[39.9073112,48.402757],[39.9062812,48.4039465],[39.9060345,48.4049615],[39.9060666,48.4055883],[39.9064797,48.4073508],[39.906764,48.4079457],[39.9071073,48.4084799],[39.9093175,48.4105381],[39.9103045,48.4116704],[39.9112755,48.4132834],[39.9120051,48.4151705],[39.9124879,48.4179049],[39.9123752,48.4188733],[39.9114686,48.4206107],[39.9104011,48.4218745],[39.9093121,48.4226648],[39.9015874,48.4256658],[39.898417,48.4272926],[39.8970705,48.4282644],[39.894973,48.4302328],[39.8944205,48.4308272],[39.8931599,48.4340698],[39.8922211,48.4352834],[39.8914379,48.4372267],[39.8890507,48.4416965],[39.8889488,48.4423691],[39.8891419,48.4428709],[39.8895121,48.443241],[39.8903114,48.443636],[39.8915076,48.4438566],[39.8959923,48.4440986],[39.8975694,48.4446964],[39.8982346,48.445248],[39.898594,48.4461233],[39.8984599,48.4470485],[39.8980254,48.4477103],[39.8971134,48.4483081],[39.8954236,48.4488845],[39.8901933,48.4498061],[39.8869801,48.4508308],[39.8828655,48.4529691],[39.8775923,48.4561889],[39.8763156,48.4567937],[39.8691219,48.459259],[39.8586398,48.4634815],[39.8565853,48.4641716],[39.8534739,48.4662062],[39.8520309,48.4669176],[39.8510224,48.4676823],[39.8480612,48.4718934],[39.8469186,48.4729071],[39.8458993,48.4750302],[39.8454863,48.4767586],[39.8462212,48.4797564],[39.8461032,48.4812001],[39.8462212,48.4827504],[39.8456579,48.4839131],[39.8453843,48.4849834],[39.8457652,48.4864447],[39.8473316,48.4882936],[39.8476696,48.4892891],[39.8478252,48.4947249],[39.8467201,48.4987738],[39.8469025,48.5001565],[39.8476213,48.5020724],[39.8483133,48.5026766],[39.8496008,48.5031067],[39.8527658,48.5035155],[39.8541927,48.5030925],[39.8557645,48.5018911],[39.8568213,48.5015321],[39.8586559,48.5013437],[39.8609197,48.5016814],[39.8628455,48.5023603],[39.8652381,48.5037749],[39.8659462,48.5044467],[39.8665416,48.505321],[39.8668742,48.5060816],[39.8670781,48.5071514],[39.8669654,48.5086725],[39.8639935,48.5156485],[39.8634732,48.5184414],[39.8623788,48.5197455],[39.8621696,48.5206942],[39.8623574,48.5230782],[39.8621589,48.5243253],[39.8590958,48.5302511],[39.8581195,48.5316686],[39.8566979,48.5331889],[39.8553675,48.5361123],[39.855094,48.5376859],[39.8551637,48.5391137],[39.8557055,48.5406303],[39.85695,48.5426761],[39.8570627,48.5440434],[39.8566872,48.5451941],[39.8562849,48.5458795],[39.853903,48.5489158],[39.8535114,48.5496687],[39.8527551,48.551817],[39.8525673,48.5529746],[39.8526102,48.5536599],[39.853093,48.5548849],[39.8552495,48.5584391],[39.8554212,48.5589894],[39.8554265,48.5602356],[39.8534846,48.5636722],[39.8514032,48.5668779],[39.8497724,48.5686954],[39.846594,48.5708713],[39.8417017,48.5730472],[39.8376676,48.5740818],[39.8316756,48.5751803],[39.8269522,48.5768165],[39.824506,48.5772265],[39.8207214,48.5787952],[39.8205578,48.5789744],[39.8209092,48.5795174],[39.8242083,48.580842],[39.8253344,48.5817643],[39.8260644,48.5827327],[39.8262173,48.5837654],[39.8261073,48.5845194],[39.8251927,48.5858342],[39.8244899,48.5863558],[39.8231757,48.5866752],[39.8213839,48.5865226],[39.8157781,48.5844857],[39.8133492,48.5839382],[39.8111379,48.5838115],[39.8086005,48.5840741],[39.8052102,48.5850535],[39.804073,48.5856887],[39.8009616,48.5890739],[39.7966433,48.5916003],[39.794476,48.5924234],[39.7898519,48.5932927],[39.7854477,48.5931579],[39.7778892,48.5924696],[39.7744667,48.5923915],[39.7728789,48.5921467],[39.7717899,48.5913306],[39.771055,48.5896239],[39.7702128,48.5882365],[39.7694671,48.5875233],[39.7683459,48.5868917],[39.7668654,48.5862529],[39.7646606,48.5857242],[39.7612274,48.584287],[39.7556162,48.5833289],[39.7543824,48.5829385],[39.7530574,48.5821081],[39.752417,48.5819942],[39.7511905,48.58214],[39.7504395,48.582864],[39.7503537,48.5838541],[39.7509009,48.5857348],[39.7509974,48.5869413],[39.7508097,48.5883607],[39.7502518,48.5895281],[39.749313,48.5901987],[39.747194,48.5906316],[39.7458368,48.5905536],[39.7448283,48.5903087],[39.7437555,48.5898439],[39.7393888,48.5871188],[39.7370392,48.5861855],[39.7343141,48.5856568],[39.7330373,48.5856958],[39.725326,48.5866504],[39.7243872,48.5865315],[39.7229496,48.5860844],[39.7219652,48.5851387],[39.7211498,48.5848548],[39.7173196,48.5853161],[39.7150451,48.5852238],[39.7128108,48.5855042],[39.7050941,48.5876368],[39.7023448,48.5881034],[39.6961275,48.587243],[39.6931851,48.5864375],[39.6914604,48.5863647],[39.6899383,48.5868287],[39.6876973,48.5868145],[39.6872199,48.586999],[39.6868081,48.5877406],[39.6868752,48.588319],[39.6871957,48.5888326],[39.6869034,48.5893897],[39.6861818,48.5898439],[39.6852592,48.5899024],[39.6833172,48.5910734],[39.6831268,48.591304],[39.6832448,48.5921209],[39.6828385,48.5925787],[39.6821558,48.5926807],[39.6807691,48.5925653],[39.6794213,48.5919427],[39.6792912,48.5916703],[39.6794508,48.5912481],[39.6793999,48.5906263],[39.6790901,48.5902058],[39.678681,48.5900426],[39.6778335,48.5901136],[39.6771723,48.5904187],[39.6763918,48.5909421],[39.6759532,48.591453],[39.6753591,48.5934905],[39.6759975,48.5946702],[39.6780682,48.5958179],[39.6795595,48.5955935],[39.6801589,48.5958871],[39.6805545,48.5963796],[39.6802327,48.597183],[39.6790311,48.5979342],[39.6774124,48.5982668],[39.6764441,48.5981089],[39.6757923,48.5976947],[39.67528,48.5968956],[39.6737847,48.595974],[39.6720158,48.5955031],[39.670684,48.5955687],[39.6690828,48.5963111],[39.6685852,48.5969311],[39.6681614,48.5981497],[39.6682177,48.6002978],[39.6680796,48.6011714],[39.6688561,48.6020032],[39.6696071,48.6022595],[39.6708007,48.6030967],[39.671258,48.6035836],[39.6710689,48.6040625],[39.6703461,48.6046291],[39.668498,48.6050823],[39.6672213,48.6051781],[39.6659084,48.605092],[39.6647362,48.604803],[39.6634743,48.6048389],[39.6626334,48.6054033],[39.6615672,48.6057687],[39.6611018,48.6062573],[39.6609798,48.6071742],[39.66056,48.6074065],[39.6604688,48.6081275],[39.6606392,48.6084804],[39.6606968,48.6094301],[39.6614747,48.6109109],[39.663185,48.6123601],[39.663868,48.613181],[39.6638688,48.6137452],[39.6641842,48.6147648],[39.6648429,48.6152163],[39.664928,48.616032],[39.6662157,48.6179459],[39.6662426,48.618475],[39.6668813,48.6201303],[39.6673922,48.620838],[39.6676137,48.6208018],[39.6678336,48.6213233],[39.6695826,48.622696],[39.6700301,48.6233169],[39.6719417,48.6246108],[39.6726107,48.625234],[39.6806001,48.6298766],[39.6810815,48.629996],[39.6845918,48.6318135],[39.6878788,48.6328747],[39.6888824,48.6336287],[39.6899398,48.6349959],[39.6905176,48.6354001],[39.6919469,48.6357722],[39.6936947,48.6366372],[39.6942642,48.6376802],[39.6943868,48.638329],[39.694196,48.6390495],[39.6943733,48.6396983],[39.6938907,48.6416272],[39.6938725,48.6429176],[39.6936819,48.6432998],[39.6929567,48.6436754],[39.6925774,48.6441197],[39.6923201,48.6440521],[39.6920255,48.6444749],[39.6921714,48.6447573],[39.6919226,48.6446478],[39.6919097,48.644831],[39.6915552,48.6448934],[39.6912392,48.6462612],[39.6919648,48.6469943],[39.6923587,48.6478482],[39.6936369,48.6493038],[39.6948293,48.6498007],[39.6953468,48.6502295],[39.6976645,48.6511637],[39.69923,48.6523245],[39.702274,48.6532549],[39.7027958,48.6536091],[39.7033863,48.6544478],[39.70434,48.6550334],[39.7049533,48.6562281],[39.7055738,48.6565889],[39.705987,48.6566456],[39.7062501,48.6569129],[39.7069321,48.6566272],[39.7069121,48.6564831],[39.7088136,48.6546641],[39.7092526,48.6545224],[39.7137949,48.6541637],[39.7161213,48.6547668],[39.7122315,48.6590176],[39.7101678,48.6589412],[39.7096518,48.6599617],[39.7098318,48.6608011],[39.7094782,48.6620377],[39.7105224,48.6634097],[39.7108365,48.6641805],[39.7108223,48.6646139],[39.7111258,48.6651136],[39.7108989,48.6651623],[39.7113235,48.6665573],[39.7112201,48.6668205],[39.7113219,48.6672161],[39.7109399,48.6678333],[39.7100938,48.6680543],[39.7088831,48.667753],[39.7074355,48.6669701],[39.7049851,48.6669628],[39.704439,48.6666156],[39.7037368,48.6667322],[39.7030239,48.6671325],[39.7024966,48.6685596],[39.7018448,48.6695154],[39.7026151,48.6705704],[39.7037465,48.6713416],[39.7079098,48.6727614],[39.7113468,48.674194],[39.7120838,48.6746598],[39.7129829,48.6754735],[39.7136089,48.6764826],[39.7139704,48.679717],[39.7143764,48.6802948],[39.7175014,48.6815789],[39.7193419,48.6817737],[39.7210515,48.6821704],[39.7222403,48.682878],[39.7226845,48.6834039],[39.7230771,48.6834138],[39.723289,48.6838629],[39.722913,48.68476],[39.7210258,48.6862393],[39.720632,48.6867174],[39.7194454,48.6872391],[39.7186735,48.6873085],[39.7176156,48.6890105],[39.7170921,48.6892513],[39.7168791,48.6897591],[39.7167321,48.6906511],[39.7171253,48.691296],[39.7177353,48.6915584],[39.7184729,48.6925924],[39.7183688,48.6932043],[39.7166484,48.6941957],[39.7161447,48.6946174],[39.715897,48.6951845],[39.7164137,48.6957112],[39.7175663,48.6962462],[39.719667,48.6967621],[39.7200918,48.6970992],[39.7202345,48.6975829],[39.7183023,48.7009684],[39.7183903,48.7022957],[39.7179922,48.7027159],[39.7172782,48.7027878],[39.7165497,48.702575],[39.7150418,48.7007287],[39.7143256,48.700466],[39.7119352,48.700865],[39.7114491,48.7016845],[39.7108951,48.7020188],[39.7092085,48.7026182],[39.7068535,48.7037883],[39.7050983,48.7059952],[39.7045168,48.707168],[39.7046708,48.7078084],[39.7055124,48.7083479],[39.7067666,48.7096279],[39.7070885,48.7114007],[39.7075831,48.7120502],[39.7088512,48.7121199],[39.7105384,48.7116187],[39.7114224,48.7116899],[39.7120505,48.7120362],[39.712164,48.7122807],[39.7120232,48.7135198],[39.7117791,48.714277],[39.7122614,48.7155122],[39.712076,48.7158043],[39.7109194,48.7160424],[39.7099139,48.7160237],[39.7073948,48.717203],[39.7072716,48.7183421],[39.7071094,48.718629],[39.7046294,48.7197926],[39.7043076,48.7205075],[39.704575,48.7209425],[39.7054502,48.7213881],[39.7061551,48.7214549],[39.707229,48.7207708],[39.7075176,48.7201221],[39.7081939,48.7199163],[39.7092058,48.7200833],[39.709996,48.7207992],[39.7101805,48.7219072],[39.7098083,48.7234187],[39.7100575,48.724195],[39.7118296,48.7256191],[39.7129405,48.7259047],[39.713367,48.7264592],[39.7159705,48.7278643],[39.7192816,48.728657],[39.7202432,48.7286083],[39.7214127,48.7279466],[39.7218069,48.7270407],[39.7215146,48.7266161],[39.7204095,48.7259517],[39.7203934,48.7255855],[39.7206174,48.7252643],[39.7210881,48.72509],[39.7224869,48.7250794],[39.723478,48.7255324],[39.7266617,48.7288808],[39.7260582,48.7294505],[39.7234525,48.7304492],[39.7230099,48.7309083],[39.7227739,48.7315204],[39.7228476,48.7323785],[39.7231226,48.7332135],[39.7245763,48.7351931],[39.7255419,48.7373857],[39.7255862,48.7377289],[39.7252013,48.7380703],[39.7251087,48.7404353],[39.727535,48.7410039],[39.7283033,48.7409429],[39.7313637,48.7418831],[39.7317901,48.7423483],[39.7317687,48.7433529],[39.7321469,48.7443009],[39.7335993,48.7451358],[39.7344831,48.7449447],[39.7349954,48.7445636],[39.7354004,48.7438367],[39.7367415,48.7432388],[39.7384487,48.7432247],[39.739425,48.7437217],[39.7395055,48.7445875],[39.7389235,48.7463473],[39.7387773,48.7474483],[39.7371438,48.7486809],[39.7365403,48.7495926],[39.736547,48.7503212],[39.736779,48.750629],[39.7367817,48.7509756],[39.7361916,48.7508836],[39.7354701,48.7511241],[39.7354352,48.7514],[39.7351536,48.751515],[39.7346225,48.7512515],[39.7341719,48.7513222],[39.7339761,48.7523886],[39.7336999,48.7527175],[39.7323024,48.7526079],[39.7319376,48.7522683],[39.7316211,48.7513859],[39.7301513,48.7508606],[39.7301406,48.7503991],[39.7305965,48.7500047],[39.7313581,48.7487922],[39.7312805,48.7486199],[39.7302559,48.7484165],[39.728542,48.7492053],[39.7276702,48.7491965],[39.7273108,48.7495997],[39.7266993,48.749842],[39.7257552,48.7525601],[39.7262648,48.753218],[39.7271445,48.7535999],[39.7277699,48.7542813],[39.7295666,48.754302],[39.7319967,48.7552038],[39.7319698,48.7557856],[39.7305885,48.7563072],[39.7300655,48.7568713],[39.7300145,48.7574407],[39.730669,48.7588836],[39.7306931,48.7593327],[39.7317606,48.7598278],[39.7330213,48.7599091],[39.7336811,48.7602645],[39.7343114,48.7600028],[39.7358765,48.7601345],[39.7362962,48.7606455],[39.7357196,48.7608347],[39.7356766,48.761084],[39.7358268,48.7612944],[39.7366288,48.7616321],[39.7367012,48.7623968],[39.7369279,48.7625763],[39.7364464,48.7633427],[39.7369145,48.7640234],[39.7364317,48.7643514],[39.7364505,48.7645786],[39.7369279,48.7647686],[39.7387934,48.7664623],[39.7391421,48.7666515],[39.7400647,48.7665587],[39.741139,48.7660486],[39.7416298,48.7660363],[39.7442356,48.7673728],[39.7451918,48.7674267],[39.745177,48.7678581],[39.7446647,48.7680296],[39.7448203,48.7682629],[39.7447184,48.7685988],[39.7445172,48.768636],[39.7445413,48.7688393],[39.7440907,48.7690956],[39.7440612,48.7693961],[39.743506,48.7696118],[39.7437394,48.7703808],[39.7445279,48.7705735],[39.7449651,48.7704533],[39.7451234,48.7707273],[39.7461185,48.7710066],[39.7470492,48.7716324],[39.7471726,48.7721768],[39.7481167,48.7728998],[39.7496697,48.7730359],[39.7511637,48.7728786],[39.75247,48.7721538],[39.7533175,48.7713654],[39.753744,48.7704303],[39.7533578,48.7700272],[39.7529179,48.7701952],[39.7525558,48.7699866],[39.7522661,48.7700714],[39.7518879,48.7698823],[39.7507587,48.7697868],[39.7497717,48.7685511],[39.7500399,48.768323],[39.7495249,48.7682912],[39.7493237,48.7680915],[39.7495785,48.7677626],[39.7495651,48.7674709],[39.7497851,48.7673224],[39.7515942,48.7676866],[39.7526228,48.7676999],[39.7540404,48.7681171],[39.7551119,48.7681401],[39.7558039,48.7677379],[39.7563256,48.7668097],[39.7567615,48.7664376],[39.7576091,48.7662025],[39.7583976,48.7657516],[39.75904,48.7649914],[39.7603476,48.7640827],[39.7614406,48.7637821],[39.7646056,48.7638387],[39.7657818,48.7641622],[39.7678484,48.7654838],[39.7683701,48.7660734],[39.7686598,48.7674055],[39.7686785,48.7685378],[39.7683915,48.769496],[39.7680227,48.7700864],[39.7658434,48.77095],[39.7639632,48.7709854],[39.7634402,48.771171],[39.7626999,48.7719965],[39.7625631,48.7724278],[39.7626275,48.7728662],[39.763754,48.7743581],[39.7649395,48.775021],[39.7657147,48.7758403],[39.765826,48.776405],[39.7656074,48.7767656],[39.7655055,48.7780524],[39.7660795,48.7789856],[39.7671416,48.7796608],[39.7683433,48.780009],[39.7694336,48.7806462],[39.7704461,48.7817243],[39.7709826,48.7828527],[39.7721176,48.783795],[39.7735253,48.7844504],[39.7762611,48.7845087],[39.7771651,48.7849523],[39.7783855,48.7851096],[39.7797266,48.7858889],[39.7809845,48.7870005],[39.7807994,48.7874423],[39.7812903,48.7885662],[39.7823793,48.7894851],[39.7839403,48.7917859],[39.7835501,48.7931076],[39.784057,48.7936545],[39.7843198,48.7945441],[39.7852734,48.7961582],[39.7857119,48.7982528],[39.7857495,48.799297],[39.7854263,48.8000664],[39.7853324,48.800766],[39.7841576,48.8019762],[39.7839256,48.8024841],[39.7823551,48.8038197],[39.7820494,48.8044],[39.7810891,48.8053239],[39.7802563,48.8065499],[39.779925,48.8073466],[39.7800364,48.8076425],[39.7798406,48.8081548],[39.7799385,48.809083],[39.7796877,48.8101658],[39.7799063,48.8118492],[39.7814512,48.8135386],[39.7824436,48.8140923],[39.7838384,48.8158347],[39.7845854,48.8164979],[39.7850239,48.8164202],[39.7850561,48.8161094],[39.785264,48.816044],[39.7863972,48.8163416],[39.7865662,48.8166763],[39.7863825,48.8169739],[39.7864294,48.81726],[39.7867419,48.8173465],[39.7871295,48.8178075],[39.7873199,48.8185104],[39.7870785,48.8194252],[39.7864696,48.8207056],[39.7853937,48.8218871],[39.7850576,48.8228035],[39.7851681,48.82363],[39.7854894,48.824278],[39.7858436,48.8245772],[39.7866649,48.8250114],[39.7873159,48.8250542],[39.7880951,48.8249448],[39.7888716,48.8245642],[39.789408,48.824573],[39.7896467,48.8243903],[39.7900169,48.823291],[39.7902971,48.8229855],[39.7908792,48.8227753],[39.7918703,48.8227798],[39.792282,48.8226191],[39.7951788,48.8232292],[39.7958069,48.8237177],[39.7967438,48.8239091],[39.7976933,48.8246702],[39.7979254,48.8252502],[39.7977523,48.8255928],[39.7964059,48.8266894],[39.7955154,48.8270567],[39.7942695,48.8279881],[39.7934823,48.828306],[39.7929874,48.828087],[39.7920728,48.8281806],[39.7914532,48.8287474],[39.79148,48.8294925],[39.7919574,48.8303365],[39.7918153,48.832367],[39.7921284,48.8334577],[39.7919963,48.833828],[39.7920419,48.8345916],[39.7915564,48.8349889],[39.791425,48.8356359],[39.7917791,48.8361894],[39.7924295,48.8365548],[39.7934702,48.8368559],[39.7949441,48.8369424],[39.7959915,48.8374596],[39.7961967,48.8377024],[39.7962275,48.8384077],[39.7960317,48.8390308],[39.7962838,48.8398217],[39.7969222,48.8404175],[39.7991686,48.8418103],[39.8000067,48.8426356],[39.8023966,48.8430257],[39.8031691,48.8429374],[39.8038705,48.8435835],[39.8048079,48.8436956],[39.8053926,48.8433655],[39.8058057,48.8428518],[39.8063421,48.8416797],[39.806141,48.841452],[39.8063877,48.8409453],[39.8069927,48.8404951],[39.8083028,48.8399426],[39.8070328,48.8387148],[39.8286179,48.8314718],[39.8313162,48.8333787],[39.8333359,48.8336612],[39.8335344,48.83358],[39.8334834,48.8332163],[39.8336631,48.8331421],[39.836875,48.8322602],[39.8852286,48.8214641],[39.9489807,48.7960522],[39.949505,48.7961503],[39.9508595,48.795917],[39.9528739,48.7962068],[39.9542901,48.7958852],[39.9559504,48.7958852],[39.9574068,48.7965125],[39.958697,48.796652],[39.9621179,48.7959197],[39.976136,48.7934566],[39.9759006,48.7938586],[39.9760482,48.7939999],[39.9775824,48.7948021],[39.9951026,48.8076186],[40.0027918,48.8135117],[40.023247,48.8282795],[40.0248872,48.8301299],[40.0257254,48.8303718],[40.0274675,48.8318709],[40.0374547,48.8391129],[40.0378704,48.8395966],[40.0427172,48.8430337],[40.0435352,48.8433708],[40.0443453,48.8441616],[40.0452733,48.84473],[40.0519922,48.8499246],[40.0596392,48.8553719],[40.0601448,48.8560399],[40.0618158,48.8573211],[40.0661489,48.8604075],[40.0672232,48.860951],[40.0759229,48.8673834],[40.0774135,48.8687102],[40.0798362,48.8699514],[40.0723529,48.874556],[40.0584899,48.9040283],[40.0608449,48.9093807],[40.060004,48.9098717],[40.0596137,48.9098373],[40.0596942,48.9096275],[40.0595011,48.9094168],[40.0589137,48.9093983],[40.0583142,48.9098646],[40.05748,48.9101881],[40.0553504,48.9107319],[40.0540052,48.9102956],[40.0516824,48.9107152],[40.0507651,48.9103617],[40.0486609,48.9102568],[40.0478549,48.9106738],[40.0478388,48.910858],[40.0460887,48.9114397],[40.0460444,48.9117112],[40.0451083,48.9127838],[40.0451311,48.9129469],[40.0454959,48.9129971],[40.0458017,48.9134986],[40.0457454,48.9140477],[40.0454222,48.9142628],[40.0444807,48.9140442],[40.0430739,48.9141517],[40.0423712,48.9144734],[40.0418428,48.9143703],[40.0416858,48.9146814],[40.0412393,48.9148409],[40.0398888,48.9148542],[40.0387636,48.9145325],[40.0380743,48.9134422],[40.0375445,48.9130914],[40.0366996,48.913087],[40.0360143,48.9134881],[40.0359634,48.9137675],[40.0361122,48.9140451],[40.0359821,48.9144426],[40.0364757,48.9151283],[40.0364529,48.9155557],[40.0351158,48.9159109],[40.0336687,48.9155813],[40.0325958,48.915004],[40.0323585,48.9146753],[40.0315753,48.9148427],[40.0304259,48.9146594],[40.029198,48.9150644],[40.0294843,48.9146104],[40.0294462,48.914226],[40.0279462,48.91415],[40.0273427,48.9139094],[40.0270678,48.9134493],[40.0271228,48.9129733],[40.0290889,48.9125776],[40.0291882,48.9120773],[40.0272854,48.9115608],[40.0265786,48.9112057],[40.0261703,48.911291],[40.0257106,48.9119703],[40.0248523,48.9118795],[40.0246404,48.911675],[40.0246914,48.910754],[40.0234683,48.9100929],[40.0224598,48.9092335],[40.0210878,48.9092335],[40.0199103,48.909817],[40.0192344,48.9096372],[40.0193202,48.9090748],[40.0201839,48.9081581],[40.0208974,48.9069752],[40.0212246,48.9056353],[40.0209591,48.9053144],[40.0195751,48.9051593],[40.0193068,48.9046568],[40.0189126,48.9044647],[40.0173193,48.9044611],[40.0168526,48.9042619],[40.0169036,48.9038899],[40.0179014,48.9037912],[40.0182903,48.9035496],[40.0174266,48.902587],[40.0176444,48.902202],[40.0041707,48.9013689],[39.995567,48.8747456],[39.9937517,48.8692587],[39.9932215,48.8682343],[39.9828564,48.8695315],[39.9681652,48.8717386],[39.9621599,48.8720104],[39.9544403,48.8743205],[39.953818,48.8748347],[39.9517152,48.8754363],[39.9510446,48.8761348],[39.9497679,48.8761595],[39.9488398,48.8764365],[39.947716,48.8771844],[39.946847,48.8782711],[39.9458814,48.8787756],[39.94542,48.8794459],[39.9440253,48.8801391],[39.9441299,48.8807476],[39.9438214,48.8818836],[39.9417937,48.8848732],[39.9407101,48.8856016],[39.9403882,48.8863847],[39.9382907,48.8874923],[39.9374458,48.8881995],[39.9366143,48.888554],[39.93644,48.8888679],[39.9367136,48.8895522],[39.9365553,48.8898415],[39.9357158,48.8901977],[39.9332133,48.8905416],[39.932709,48.8909102],[39.9311855,48.8914569],[39.9311078,48.8918678],[39.9303675,48.8921076],[39.9296218,48.8926155],[39.9284846,48.8926754],[39.9272132,48.8939733],[39.9260572,48.8946593],[39.9250245,48.8958337],[39.8765302,48.8924938],[39.8760366,48.8933156],[39.8719007,48.8929453],[39.8719234,48.8918605],[39.8528999,48.8907603],[39.8453736,48.9028708],[39.84418,48.9021532],[39.8435417,48.9013704],[39.8423025,48.9010319],[39.8417446,48.90109],[39.8416105,48.9012981],[39.8409668,48.9015749],[39.8405912,48.9020845],[39.8405027,48.9025076],[39.8401487,48.9027915],[39.8391777,48.9032252],[39.8383811,48.9032217],[39.8363346,48.902758],[39.8341781,48.901351],[39.8337597,48.9008873],[39.8337731,48.9000304],[39.8341995,48.8990412],[39.834457,48.8977293],[39.8346609,48.897329],[39.8354709,48.8967771],[39.8355541,48.8961776],[39.8359832,48.8957738],[39.8361173,48.8946311],[39.8356345,48.8926243],[39.8344436,48.8917884],[39.8336282,48.8906421],[39.8330998,48.8893688],[39.832963,48.8886316],[39.8321718,48.8876916],[39.8304552,48.8867974],[39.8292455,48.8867745],[39.8270085,48.8864235],[39.8271507,48.8867639],[39.8269066,48.8870038],[39.8269683,48.8873988],[39.8263755,48.8875823],[39.826287,48.887801],[39.8274323,48.8886334],[39.8275101,48.8897462],[39.8269603,48.8898891],[39.8256969,48.8906174],[39.8257506,48.8909172],[39.8252436,48.8921711],[39.82416,48.8923898],[39.8238757,48.8927795],[39.8221725,48.8935783],[39.8219231,48.8938834],[39.8218989,48.8944248],[39.8206732,48.8951566],[39.819029,48.8956838],[39.81823,48.89654],[39.818294,48.8977558],[39.8187473,48.8983324],[39.8203111,48.8990412],[39.8218989,48.8994608],[39.8232078,48.9003971],[39.8242271,48.9008626],[39.8245275,48.9014056],[39.8240179,48.9022431],[39.8238328,48.903539],[39.8233527,48.9040644],[39.8222557,48.9044814],[39.8205404,48.9048543],[39.8187822,48.9055762],[39.8185542,48.9062171],[39.8191966,48.906835],[39.8190504,48.9078769],[39.8184778,48.9079977],[39.8160383,48.9077033],[39.8156092,48.9077756],[39.8151532,48.9082348],[39.8148152,48.909178],[39.8122068,48.9107125],[39.8108419,48.9109882],[39.8095313,48.9118222],[39.8088728,48.9120241],[39.8087883,48.9122753],[39.808284,48.912671],[39.8083913,48.9129575],[39.8082787,48.9131531],[39.8051217,48.9146153],[39.8028646,48.9147096],[39.7984618,48.9142566],[39.7978449,48.9138891],[39.797515,48.9134643],[39.7975324,48.9127927],[39.7979119,48.9122938],[39.7979924,48.9118892],[39.7974426,48.9109831],[39.7959512,48.9105856],[39.7942132,48.910828],[39.7933736,48.9112652],[39.7930531,48.9117262],[39.7931403,48.9124189],[39.7939758,48.9137736],[39.7938256,48.9142848],[39.793312,48.9148674],[39.79205,48.915234],[39.7881997,48.9146797],[39.784053,48.9150119],[39.7827601,48.9152666],[39.7818292,48.9159881],[39.7815303,48.9170927],[39.7812541,48.917499],[39.7796193,48.918754],[39.7782943,48.9193938],[39.7775392,48.9203993],[39.7764087,48.920847],[39.7758427,48.9215431],[39.7758655,48.9218604],[39.7753894,48.9221054],[39.7753237,48.9225239],[39.774684,48.9232492],[39.77446,48.9242652],[39.7737788,48.9245031],[39.7746813,48.9250653],[39.7752285,48.9250283],[39.7764838,48.9256151],[39.7783989,48.9260416],[39.7786027,48.9262707],[39.7785518,48.9264346],[39.7788629,48.9265104],[39.7791579,48.9268716],[39.7793967,48.9272858],[39.7794235,48.9277774],[39.7787797,48.9291925],[39.7788978,48.929619],[39.7785652,48.9302022],[39.7785839,48.9319379],[39.7797239,48.9328789],[39.7796676,48.9333123],[39.7803542,48.9341669],[39.7803032,48.9344929],[39.780727,48.9346797],[39.7807994,48.9350655],[39.7815236,48.9352787],[39.7816899,48.935543],[39.7804266,48.9368944],[39.7792089,48.9377278],[39.7789407,48.9383163],[39.7777283,48.9384326],[39.7773448,48.9383357],[39.7767439,48.9384925],[39.7763282,48.9389153],[39.7756577,48.9392712],[39.7756442,48.9400464],[39.7751051,48.9403917],[39.7732329,48.9403393],[39.7729795,48.9407432],[39.7729312,48.9415536],[39.7724672,48.9420566],[39.7719468,48.9433858],[39.7726214,48.9442913],[39.7724994,48.9447097],[39.772203,48.9450109],[39.7723532,48.9461066],[39.7734918,48.9466624],[39.77377,48.94958],[39.7766273,48.9500674],[39.7780341,48.9516025],[39.7771436,48.9526893],[39.7754753,48.9525413],[39.7742817,48.9529253],[39.7739813,48.9532564],[39.7724041,48.9530186],[39.7715914,48.9525422],[39.7711033,48.9525255],[39.7704032,48.9527932],[39.7698158,48.953267],[39.7696871,48.9542798],[39.7692418,48.9549015],[39.7678149,48.9557539],[39.7677773,48.9559723],[39.766109,48.9568706],[39.7655913,48.9573919],[39.7643226,48.9580083],[39.7643012,48.9582249],[39.7644836,48.9584116],[39.7658254,48.9588385],[39.7658917,48.9591072],[39.7663611,48.9592358],[39.7663075,48.959382],[39.766691,48.9599649],[39.7664711,48.9607504],[39.7656798,48.961092],[39.7629252,48.9612364],[39.7627026,48.9614072],[39.7626328,48.961851],[39.7630513,48.9624973],[39.7630218,48.9627615],[39.7624853,48.9631929],[39.7608304,48.9635486],[39.7604147,48.9640558],[39.7607499,48.9647478],[39.7620159,48.9651159],[39.7637594,48.9663115],[39.7640517,48.9671655],[39.7637862,48.967803],[39.7626194,48.9683559],[39.7612059,48.9683277],[39.7601733,48.9679509],[39.7592425,48.9671426],[39.7584486,48.966956],[39.7577566,48.9670528],[39.7569734,48.967685],[39.7567776,48.9701818],[39.7593632,48.9705991],[39.7601679,48.9711607],[39.7603878,48.9717013],[39.7599936,48.9722576],[39.7585773,48.9727647],[39.7582743,48.973064],[39.7581053,48.9736538],[39.7586444,48.9744989],[39.7585585,48.9755187],[39.7580846,48.9758619],[39.7574562,48.9760024],[39.7543287,48.9757718],[39.752486,48.9760359],[39.751094,48.9770517],[39.7493318,48.9779214],[39.7487068,48.9785728],[39.748452,48.9807222],[39.7485298,48.9816939],[39.7488248,48.9823611],[39.7500479,48.9834208],[39.7515151,48.9841161],[39.7523358,48.9842076],[39.7530842,48.9848378],[39.7531459,48.9855612],[39.752191,48.9864272],[39.7506648,48.9869887],[39.7480282,48.9873179],[39.7468534,48.9872739],[39.7458014,48.9869729],[39.7437182,48.9855264],[39.740856,48.9846107],[39.7386727,48.9833539],[39.7354487,48.9823329],[39.7332358,48.9804106],[39.7330722,48.9798103],[39.7326672,48.9793192],[39.7299662,48.9781485],[39.7298804,48.9777471],[39.7302532,48.9768792],[39.7299716,48.976425],[39.7284266,48.9757947],[39.7266832,48.975638],[39.7259563,48.9760693],[39.7260046,48.9769566],[39.72579,48.9772806],[39.7247426,48.9777541],[39.7246125,48.9779592],[39.7246635,48.9784742],[39.7250041,48.9786784],[39.7254628,48.9787823],[39.7268119,48.9786062],[39.7258598,48.9796176],[39.7230193,48.9793579],[39.71678,48.98237],[39.717054,48.9843108],[39.7163764,48.9853259],[39.7160555,48.9869874],[39.7142136,48.9886714],[39.7136222,48.9899589],[39.7125882,48.9901481],[39.7120813,48.9905212],[39.7118291,48.9908803],[39.7118761,48.9913951],[39.7112833,48.9919688],[39.7100481,48.9925223],[39.708581,48.9924431],[39.7077127,48.9927207],[39.7075215,48.9933495],[39.7077763,48.9938247],[39.7084898,48.9944336],[39.7082081,48.9950161],[39.7078407,48.9954033],[39.706336,48.9961486],[39.7058035,48.9968648],[39.70566,48.9974711],[39.705369,48.9975758],[39.7053905,48.9978195],[39.7043498,48.9984706],[39.7041419,48.9986959],[39.704099,48.9991428],[39.7034579,48.999486],[39.7002232,49.0006544],[39.6989062,49.0009271],[39.698248,49.00082],[39.6969885,49.0002814],[39.6964253,48.9995207],[39.6956339,48.9991252],[39.6933769,48.9993074],[39.6909495,48.9973743],[39.6913826,48.9966563],[39.690067,48.9958239],[39.6890166,48.995668],[39.6880916,48.9948876],[39.6871716,48.9947328],[39.6846449,48.9936381],[39.6840736,48.9933548],[39.6825045,48.9921158],[39.6813324,48.992019],[39.6803266,48.9912763],[39.6795434,48.9909119],[39.6785966,48.9897838],[39.677867,48.9895444],[39.6772702,48.9899272],[39.6759063,48.9902291],[39.6755388,48.9909806],[39.6743157,48.9919767],[39.6739322,48.9919591],[39.6736908,48.9921457],[39.6684028,48.9969713],[39.668844,48.9974579],[39.667908,48.9973769],[39.6673366,48.9979955],[39.6643044,49.0004054],[39.663949,49.0009298],[39.6641462,49.0011172],[39.6703944,49.0031108],[39.6710837,49.0035754],[39.6750453,49.0088696],[39.6755093,49.0096455],[39.6755066,49.0100237],[39.6784517,49.0133716],[39.6750748,49.0138624],[39.6742702,49.0142178],[39.6736345,49.0147895],[39.6728915,49.0164282],[39.6728607,49.0168178],[39.6736532,49.0181345],[39.6740918,49.019364],[39.6758406,49.0205856],[39.6766064,49.021327],[39.6770047,49.0220772],[39.6769524,49.0226585],[39.6773024,49.0234958],[39.6767727,49.0249301],[39.6767914,49.026513],[39.6772286,49.0272798],[39.6776135,49.0276491],[39.6792041,49.0283623],[39.6809193,49.0287492],[39.682361,49.0295942],[39.6828572,49.0300963],[39.6829839,49.0307782],[39.68275,49.0314408],[39.6818058,49.0320818],[39.6815443,49.0324616],[39.6808976,49.0327326],[39.6805908,49.0331228],[39.6806525,49.0333189],[39.6819909,49.0336618],[39.6834581,49.0335361],[39.6848434,49.0338561],[39.6851036,49.0341023],[39.6851435,49.034565],[39.6847133,49.035786],[39.6815293,49.037888],[39.6779669,49.0363513],[39.6758272,49.0393783],[39.6749689,49.0392025],[39.6739148,49.0393168],[39.6722598,49.0405133],[39.6836954,49.0464954],[39.6877643,49.0481972],[39.6913987,49.0499463],[39.6931931,49.0506126],[39.7078273,49.0484697],[39.7094446,49.0477928],[39.7153214,49.0467275],[39.7226854,49.044878],[39.738434,49.0425326],[39.7412449,49.0417335],[39.7570914,49.0411542],[39.7652158,49.0401397],[39.7665489,49.0398504],[39.7719106,49.0418381],[39.773984,49.0424289],[39.778655,49.0444754],[39.7889011,49.0501828],[39.7975981,49.0560372],[39.8015852,49.058149],[39.8018709,49.0584522],[39.8042178,49.0593169],[39.8053095,49.0599224],[39.8113632,49.0607476],[39.8121357,49.0600446],[39.8132032,49.0595788],[39.8138523,49.058918],[39.8143941,49.0586297],[39.8154536,49.0584909],[39.8166874,49.0580972],[39.8181653,49.0580409],[39.8260188,49.059079],[39.8400615,49.0605279],[39.8643932,49.0624225],[39.8652863,49.062368],[39.8670405,49.0627705],[39.8701304,49.0629954],[39.8798239,49.0641729],[39.8812669,49.0639989],[39.8840725,49.0633504],[39.8974729,49.0599848],[39.9053344,49.058403],[39.9099317,49.057315],[39.9203655,49.0571392],[39.9288332,49.0567807],[39.9305418,49.056517],[39.9317488,49.0566295],[39.9378052,49.0563694],[39.9383564,49.0571392],[39.9402916,49.0628425],[39.942188,49.0691058],[39.9424642,49.0705924],[39.9424468,49.0718892],[39.9419962,49.0734952],[39.9404177,49.0779228],[39.939782,49.0791694],[39.9395339,49.0802516],[39.9385281,49.0824985],[39.9385911,49.0829448],[39.9399135,49.0841631],[39.9407355,49.0846993],[39.9442948,49.0883711],[39.9459109,49.090233],[39.9492288,49.0945898],[39.9526955,49.0986889],[39.959102,49.1057475],[39.9668401,49.1168131],[39.9706006,49.1218715],[39.9714911,49.1233161],[39.97499,49.1271347],[39.977915,49.1301114],[39.9869889,49.1386194],[39.9878311,49.1392458],[39.9899501,49.1415357],[39.9959877,49.1472907],[39.9978679,49.1486627],[40.0025672,49.151368],[40.0047639,49.1539292],[40.0060084,49.1550818],[40.0098655,49.1597232],[40.0114721,49.1613105],[40.0211763,49.1694185],[40.0310227,49.1794522],[40.0321385,49.1798502],[40.0397694,49.1809863],[40.041022,49.181088],[40.0418991,49.1809407],[40.0428244,49.1811897],[40.043487,49.1815526],[40.0509113,49.1828746],[40.0544062,49.1832164],[40.0579628,49.1838528],[40.0591966,49.1839317],[40.0605726,49.1844068],[40.0678897,49.1853518],[40.0702822,49.1858339],[40.0770548,49.1868104],[40.0776342,49.187047],[40.083425,49.1927529],[40.0840071,49.193093],[40.0845382,49.1938765],[40.0858444,49.1952279],[40.0935826,49.202873],[40.0957659,49.2043573],[40.1078546,49.2107674],[40.1085922,49.2113176],[40.1137447,49.217753],[40.1152226,49.2198273],[40.1154104,49.2200393],[40.1161426,49.2202898],[40.116097,49.2209906],[40.1169339,49.2222537],[40.1192942,49.2253876],[40.1204824,49.2265384],[40.1207265,49.2271848],[40.123693,49.2311013],[40.1308438,49.2357339],[40.1370558,49.2394483],[40.1381367,49.2396409],[40.1459004,49.2393774],[40.1470256,49.2389877],[40.1480368,49.2389054],[40.1694167,49.2377225],[40.1764588,49.237148],[40.1791692,49.237254],[40.1876557,49.2381717],[40.2083784,49.2420225],[40.2132869,49.2448724],[40.2218056,49.2511975],[40.2278093,49.2605138],[40.1864106,49.2812014],[40.1859319,49.284634],[40.1842627,49.3022453],[40.1822792,49.3035868],[40.185644,49.3066159],[40.186501,49.3069647],[40.187484,49.3088342],[40.1879588,49.3099962],[40.1877804,49.3105593],[40.1883638,49.3129873],[40.1891094,49.3182792],[40.1905484,49.3227051],[40.1915704,49.3265896],[40.1926459,49.3310444],[40.1927311,49.3322204],[40.1970917,49.3387139],[40.1973411,49.3408792],[40.2004606,49.3457723],[40.1905806,49.3486005],[40.1827459,49.3512616],[40.1800422,49.3526768],[40.1755053,49.3562663],[40.1755241,49.3564602],[40.1709951,49.3562244],[40.1696098,49.3565476],[40.1586583,49.3669419],[40.1591759,49.367148],[40.1603835,49.3663099],[40.1609356,49.3664622],[40.1606618,49.3666986],[40.1616795,49.3672625],[40.1615072,49.3674308],[40.161702,49.3675284],[40.1616101,49.3677834],[40.1620527,49.3679615],[40.161649,49.3686288],[40.1583123,49.3712198],[40.1580669,49.371224],[40.1567285,49.370295],[40.1541065,49.3714704],[40.1549582,49.3722511],[40.155201,49.3721507],[40.1559744,49.3728314],[40.1470721,49.376879],[40.1466769,49.3765124],[40.1462196,49.3767316],[40.1464895,49.3769833],[40.1433483,49.3785259],[40.1427005,49.3784281],[40.1289326,49.382473],[40.1218826,49.3839177],[40.1142567,49.3858239],[40.1033566,49.3941395],[40.0782873,49.4100273],[40.0637028,49.4308548],[40.0458258,49.4462787],[40.0296187,49.4540906],[40.0421304,49.499245],[40.0389373,49.5107367],[40.039123,49.5112465],[40.0390439,49.5124465],[40.0375573,49.5167565],[40.0374895,49.517689],[40.0376813,49.5185858],[40.0383586,49.5199118],[40.0390626,49.5206343],[40.1345345,49.5570428],[40.1430398,49.5599788],[40.1472428,49.5616021],[40.1703866,49.5689372],[40.1659714,49.5722717],[40.1621559,49.5757434],[40.1590244,49.5783409],[40.1559855,49.5812461],[40.1506197,49.5858892],[40.1423787,49.5936319],[40.1395697,49.596065],[40.1381274,49.6045405],[40.1377948,49.6072877],[40.1371242,49.6099574],[40.135757,49.6169429],[40.1354561,49.6170899],[40.064979,49.5989766],[40.0579396,49.6069739],[39.9516721,49.5976672],[39.9500871,49.5954113],[39.9496311,49.5950897],[39.9495614,49.5947698],[39.9488077,49.5937179],[39.941394,49.5836346],[39.9412277,49.5833077],[39.9414369,49.5830503],[39.9412385,49.5827234],[39.9402729,49.5815026],[39.939723,49.5812104],[39.9396238,49.5808192],[39.9372205,49.5774209],[39.9350882,49.5745424],[39.9345732,49.5741232],[39.9329799,49.5731666],[39.9292061,49.571996],[39.9194294,49.5685328],[39.9178228,49.5686737],[39.9167794,49.567743],[39.9142233,49.5666854],[39.8914272,49.5587923],[39.8686096,49.5600449],[39.8506469,49.5624893],[39.8388022,49.564269],[39.8352563,49.5638237],[39.8300207,49.5626085],[39.8230241,49.5614942],[39.8180446,49.5604816],[39.8159954,49.5598814],[39.8109502,49.5589732],[39.8099162,49.5589558],[39.8089358,49.55858],[39.8064088,49.5581257],[39.7924295,49.5673247],[39.7899002,49.5684875],[39.7757556,49.5780252],[39.7729124,49.5802079],[39.7722861,49.58098],[39.7685444,49.5837546],[39.7671926,49.5856501],[39.764552,49.5869264],[39.7638318,49.5874246],[39.7502035,49.5974662],[39.7335228,49.6016949],[39.7309962,49.6024537],[39.7301325,49.6028578],[39.7177139,49.6058885],[39.7144027,49.6065151],[39.7093883,49.6060866],[39.7090235,49.6057963],[39.7080982,49.605659],[39.7064379,49.6058659],[39.698351,49.6049464],[39.6967792,49.6049603],[39.6961489,49.6051671],[39.694545,49.606243],[39.6906155,49.6092708],[39.6863736,49.6122072],[39.6601678,49.6149892],[39.6587093,49.6160723],[39.6473609,49.6269324],[39.64628,49.6277178],[39.6450636,49.6290321],[39.6424699,49.6312246],[39.6389642,49.6346434],[39.6378592,49.6378275],[39.6377331,49.6390765],[39.6369231,49.6403114],[39.6352681,49.6444591],[39.6351314,49.6453952],[39.6348256,49.6456002],[39.6324143,49.6505688],[39.6310142,49.6537936],[39.6308935,49.654568],[39.6302229,49.6554744],[39.6300808,49.6561048],[39.6294263,49.6571692],[39.626327,49.6636896],[39.6200909,49.6774091],[39.6186063,49.6800732],[39.617524,49.6827945],[39.6153313,49.6869663],[39.614245,49.6893713],[39.6138789,49.6898615],[39.6134055,49.691267],[39.6114877,49.6940796],[39.6030079,49.7043065],[39.5981437,49.7106177],[39.5919049,49.7182366],[39.5914623,49.7189788],[39.5916313,49.7192944],[39.604463,49.7288832],[39.6057129,49.7302234],[39.60846,49.73236],[39.6096799,49.7331828],[39.6106823,49.7336425],[39.5734043,49.7362314],[39.5668906,49.7368866],[39.5656273,49.7367419],[39.5635781,49.7368615],[39.5383733,49.7401932],[39.5317724,49.7414308],[39.5146251,49.7465196],[39.5097086,49.7477658],[39.5060474,49.7489599],[39.4914857,49.7531884],[39.47981,49.7563145],[39.4748251,49.7568395],[39.466812,49.7573784],[39.4496848,49.7596783],[39.4434553,49.7600953],[39.4428197,49.7603734],[39.439538,49.760143],[39.4377328,49.7601872],[39.4340368,49.7598112],[39.4288829,49.7584172],[39.4267921,49.7574911],[39.4261725,49.7574781],[39.4255087,49.7568534],[39.4249991,49.7571224],[39.424584,49.7570995],[39.4170839,49.7552479],[39.4117664,49.753684],[39.4110703,49.7532785],[39.4080716,49.7521738],[39.4075687,49.7518237],[39.4031585,49.7499061],[39.4024551,49.7493515],[39.3821159,49.7402209],[39.3791682,49.7389937],[39.37833,49.7388021],[39.3716419,49.7400372],[39.3681228,49.7401758],[39.3664867,49.7400857],[39.3633968,49.7404393],[39.346413,49.7442231],[39.328461,49.7485318],[39.3204036,49.7501262],[39.3174961,49.7509078],[39.3164232,49.7509927],[39.3088945,49.7528697],[39.2855875,49.7551815],[39.274293,49.7682885],[39.2659876,49.7677375],[39.2602068,49.7705353],[39.2513594,49.7763882],[39.2487361,49.7815123],[39.2437417,49.787118],[39.2385399,49.7985196],[39.2275866,49.8073073],[39.229888,49.8091804],[39.2304439,49.8111427],[39.2304016,49.8129765],[39.2281871,49.8164948],[39.2262173,49.8400371],[39.2090801,49.8594701],[39.2022564,49.8702208],[39.1956783,49.8729494],[39.1884885,49.8851375],[39.1799184,49.8887192],[39.1307071,49.8613563],[39.1211691,49.8491736],[39.1166282,49.8431148],[39.1098502,49.837422],[39.107911,49.836384],[39.0939689,49.8299326],[39.0925392,49.8294672],[39.0703682,49.8190265],[39.0668866,49.8155717],[39.0512118,49.8177073],[39.0345754,49.8222344],[39.0321761,49.8225943],[39.0304984,49.8225476],[39.0265596,49.8219696],[39.0169412,49.8200912],[39.0136877,49.8186297],[39.0122098,49.8182836],[39.0117806,49.81787],[39.0071055,49.8160095],[38.9941451,49.8111772],[38.9928094,49.8108311],[38.9859887,49.8083571],[38.9657298,49.8049925],[38.9526776,49.7976949],[38.9480352,49.7968783],[38.94667,49.7979309],[38.9436579,49.7995636],[38.9410669,49.8005175],[38.9391464,49.8008083],[38.9384651,49.8007564],[38.9355898,49.7998198],[38.9337417,49.7995705],[38.933444,49.7988797],[38.9338088,49.7980175],[38.9334226,49.7974392],[38.9318803,49.7968835],[38.9302388,49.7969077],[38.9297104,49.7973146],[38.9295655,49.7982287],[38.9286616,49.7985334],[38.927696,49.7990892],[38.9278114,49.799316],[38.9272186,49.7998977],[38.9267385,49.8008932],[38.9269102,49.8013762],[38.9273366,49.8017345],[38.9273474,49.8020444],[38.9278141,49.8023733],[38.9279991,49.8029446],[38.9283907,49.8032095],[38.9281628,49.8034761],[38.9281198,49.8039054],[38.927519,49.8043174],[38.9260572,49.8045822],[38.9246732,49.8043641],[38.9241287,49.804011],[38.9232999,49.8040318],[38.9218917,49.8042758],[38.9206097,49.8049596],[38.9204138,49.8053837],[38.920269,49.8067859],[38.9195314,49.808027],[38.9191774,49.809635],[38.9175412,49.8107082],[38.9159265,49.8125619],[38.9159587,49.8128873],[38.9163674,49.8131832],[38.918475,49.814137],[38.9183164,49.8147081],[38.9177236,49.8151598],[38.916133,49.8155544],[38.9149475,49.8168074],[38.9140516,49.8171033],[38.9134696,49.8177402],[38.9124718,49.8180084],[38.9121607,49.8183424],[38.9102,49.8185034],[38.9094597,49.8190122],[38.909221,49.8205195],[38.9087167,49.8221721],[38.9087328,49.8231221],[38.9080998,49.8244753],[38.9071584,49.8256796],[38.9070243,49.8263302],[38.9067024,49.8267974],[38.9070457,49.8276729],[38.9070001,49.8284809],[38.9071771,49.8286263],[38.908824,49.828846],[38.9100793,49.8284273],[38.9116082,49.8283598],[38.9127347,49.8288651],[38.9132979,49.8293495],[38.9141482,49.8309447],[38.9140087,49.8319378],[38.9135206,49.8324205],[38.9115757,49.8330349],[38.9111432,49.833512],[38.9108419,49.8345594],[38.9112729,49.8349775],[38.9131799,49.8353893],[38.9136349,49.8362411],[38.913601,49.8369168],[38.9131209,49.8380413],[38.9132175,49.8389287],[38.9130378,49.8397123],[38.9123055,49.8416653],[38.9122814,49.8420683],[38.9119863,49.8425751],[38.9121714,49.8439329],[38.9108571,49.8444518],[38.907145,49.8448185],[38.9056805,49.8456781],[38.9051467,49.8462091],[38.9050197,49.8471895],[38.9044964,49.848362],[38.9044869,49.8489418],[38.9047122,49.8493828],[38.9058307,49.8502735],[38.9070109,49.8506194],[38.9089072,49.8507699],[38.9111415,49.8526515],[38.9114955,49.8531409],[38.9115196,49.8537946],[38.9109027,49.854571],[38.9108491,49.8550725],[38.9116698,49.8561913],[38.9122197,49.8564161],[38.9134401,49.8563729],[38.9146793,49.8562622],[38.9150655,49.8559354],[38.915948,49.855932],[38.9171174,49.8567655],[38.9183298,49.8580174],[38.9184183,49.8586918],[38.9174688,49.8594803],[38.9165568,49.8598987],[38.9143038,49.8597414],[38.9131907,49.8599385],[38.9116484,49.8594941],[38.9113399,49.8592053],[38.9109376,49.8591292],[38.9083198,49.8600474],[38.9076975,49.8608808],[38.9076412,49.8616451],[38.9072067,49.8620445],[38.9068258,49.8627914],[38.9057395,49.8638323],[38.9028802,49.8657151],[38.9029124,49.8662804],[38.9022204,49.8671293],[38.9022607,49.8673437],[38.9018342,49.8674215],[38.9014828,49.8679055],[38.9012226,49.8689359],[38.9013031,49.8693871],[38.9004019,49.8695462],[38.8986558,49.8702861],[38.8968909,49.8702567],[38.8964537,49.870535],[38.894816,49.8704081],[38.8938144,49.8696136],[38.8926342,49.8693923],[38.8922104,49.8695237],[38.8916311,49.8700769],[38.8899708,49.8702083],[38.8895953,49.8700613],[38.8895443,49.869745],[38.8887423,49.869624],[38.8877419,49.8691434],[38.8869399,49.8673817],[38.8856739,49.8677897],[38.883512,49.8674094],[38.8823426,49.8690794],[38.8813461,49.8690638],[38.8798401,49.8697363],[38.8794015,49.8697744],[38.8785647,49.8694494],[38.8768186,49.8693024],[38.87546,49.86832],[38.8735235,49.8664222],[38.8730273,49.8668544],[38.8728744,49.8673955],[38.8702029,49.8666348],[38.8668689,49.8664913],[38.8654711,49.8660636],[38.863323,49.8659044],[38.8627115,49.8661974],[38.8625975,49.8664231],[38.8617083,49.8664576],[38.8590704,49.8672036],[38.8579774,49.8678537],[38.8577668,49.8681597],[38.8574048,49.8682301],[38.8574892,49.8684199],[38.8571674,49.8687397],[38.85625,49.8688538],[38.8551798,49.8682807],[38.8548043,49.867871],[38.8548285,49.8674682],[38.8546032,49.8672192],[38.8512504,49.8659035],[38.8516,49.86471],[38.84937,49.86471],[38.8476938,49.864287],[38.8475087,49.8657133],[38.8476348,49.8668198],[38.8472968,49.8675978],[38.8457787,49.8676601],[38.8451698,49.8668803],[38.8422374,49.8654585],[38.8370864,49.8670641],[38.8359833,49.8676652],[38.8348769,49.8707355],[38.8307904,49.8754597],[38.8247019,49.878687],[38.7956248,49.8833635],[38.7909597,49.8782705],[38.7807727,49.8823373],[38.7764651,49.8867892],[38.7687188,49.8957782],[38.7610826,49.8964676],[38.7520677,49.8969186],[38.7469527,49.89743],[38.7447989,49.8972538],[38.7394774,49.9013622],[38.7345958,49.904484],[38.7334987,49.9057882],[38.7330274,49.9066956],[38.7239415,49.9271076],[38.6940656,49.9347989],[38.6925629,49.9366395],[38.6920533,49.9370159],[38.6914283,49.9385195],[38.6916912,49.939229],[38.692237,49.939746],[38.6859683,49.9621287],[38.690106,49.9658114],[38.7105994,49.9808848],[38.7185508,49.9831856],[38.718245,49.9835754],[38.7182236,49.9844774],[38.7176737,49.9845516],[38.717325,49.9854622],[38.7166759,49.9857467],[38.7166116,49.9860054],[38.7163487,49.9860054],[38.7159115,49.9864469],[38.716397,49.9869039],[38.7147099,49.9877369],[38.714274,49.9874386],[38.7139884,49.9878111],[38.7130281,49.9880439],[38.712835,49.9885336],[38.7117889,49.9895683],[38.7115234,49.9896856],[38.7108663,49.989539],[38.7100402,49.9899753],[38.7097317,49.9902883],[38.7097397,49.9906366],[38.7090692,49.9909772],[38.707138,49.9932904],[38.7041567,49.9959001],[38.7037504,49.9964398],[38.7029833,49.9969916],[38.7013981,49.9976192],[38.7010011,49.9983554],[38.699719,49.9993519],[38.6995956,49.9996709],[38.6983672,50.0007812],[38.698512,50.0010527],[38.6978281,50.0016605],[38.696499,50.0021708],[38.6958419,50.002675],[38.6928526,50.0028949],[38.6914739,50.0049826],[38.6881815,50.0057919],[38.687633,50.0062177],[38.6874734,50.0067659],[38.6870939,50.0070969],[38.685282,50.0076821],[38.6840549,50.0077425],[38.6791712,50.0059669],[38.6779851,49.9987502],[38.6779475,49.997414],[38.6771321,49.9943224],[38.6770087,49.9922791],[38.6773199,49.9919601],[38.6803427,49.9785253],[38.6802006,49.9764778],[38.6808068,49.9751583],[38.6806726,49.9744476],[38.6798358,49.973937],[38.6771268,49.9728691],[38.6756113,49.9725466],[38.6745009,49.9725259],[38.6725858,49.9718151],[38.6689326,49.9721291],[38.667393,49.9719169],[38.6616343,49.9678334],[38.6564013,49.9630663],[38.653188,49.9608871],[38.6471061,49.9559856],[38.6468098,49.9563523],[38.6454177,49.9572772],[38.631261,49.9662738],[38.6303088,49.9666188],[38.6228844,49.9711165],[38.6179492,49.9737627],[38.6164632,49.9747839],[38.6126076,49.9757249],[38.5917655,49.9772558],[38.5908857,49.9770911],[38.5835499,49.9776456],[38.581911,49.9775318],[38.5681969,49.9720014],[38.56482,49.9710889],[38.564254,49.9707973],[38.5639992,49.9700175],[38.5637337,49.9697657],[38.5581923,49.968784],[38.550843,49.9663411],[38.5475466,49.9663652],[38.5469457,49.965858],[38.5441053,49.9644656],[38.5429613,49.9635434],[38.5276405,49.9587388],[38.5270263,49.9586983],[38.5232457,49.9597155],[38.5222587,49.9597828],[38.5095149,49.9633252],[38.4887955,49.9637401],[38.4885246,49.9638635],[38.4854239,49.967949],[38.4841365,49.9697225],[38.4838602,49.970454],[38.483659,49.9758448],[38.4837073,49.9761053],[38.4842813,49.976264],[38.4844691,49.9765089],[38.4842607,49.9771],[38.4795231,49.9775594],[38.4784325,49.983279],[38.4649717,49.983316],[38.469015,49.9952969],[38.4611794,49.9965588],[38.4600207,49.9969467],[38.4430102,49.999783],[38.439365,50.0005519],[38.4335688,50.0012609],[38.4284323,49.9960838],[38.4163168,49.981692],[38.3985311,49.9911772],[38.3819041,49.9966691],[38.3704175,50.0000648],[38.3498476,50.006984],[38.3502272,50.0084285],[38.3492133,50.0089767],[38.3514851,50.0115054],[38.3535451,50.018684],[38.3529469,50.0237196],[38.35336,50.0239367],[38.353537,50.0247483],[38.3530381,50.0252567],[38.3528718,50.0256719],[38.3511928,50.0357945],[38.3425708,50.0459485],[38.3383664,50.0532055],[38.3339692,50.0582239],[38.3325849,50.0580084],[38.333049,50.0665204],[38.3293019,50.08544],[38.3131483,50.088449],[38.3004574,50.0867978],[38.2917495,50.0796575],[38.2770016,50.0736569],[38.2557397,50.0725124],[38.2404189,50.0737897],[38.1787737,50.079928],[38.1789762,50.077279],[38.1817402,50.0678435],[38.1817777,50.0675173],[38.1814009,50.0664533],[38.1814934,50.0662923],[38.1819588,50.0661769],[38.1829391,50.0637269],[38.1841891,50.0592964],[38.1844063,50.0581591],[38.1843366,50.0575934],[38.1849629,50.0557086],[38.1845283,50.0527689],[38.1845753,50.0518794],[38.1840523,50.0516589],[38.1840751,50.0514884],[38.1844828,50.0512043],[38.1840576,50.0505136],[38.1834273,50.0471602],[38.1834662,50.0464429],[38.1837626,50.0456126],[38.1873366,50.0408782],[38.1891119,50.0237493],[38.1871127,50.0232913],[38.1861149,50.0228889],[38.1859164,50.0226201],[38.2008658,50.0045527],[38.2008778,50.0037],[38.2007423,50.0036112],[38.2009113,50.0034077],[38.2015268,50.0030664],[38.2027137,50.001807],[38.2040253,50.0012614],[38.2051304,50.0010355],[38.2050888,49.999939],[38.2047549,49.9987994],[38.2099101,49.9923429],[38.2108542,49.9928292],[38.214094,49.9886784],[38.2156138,49.9882758],[38.2166331,49.9875248],[38.2166706,49.9872057],[38.2170743,49.9868617],[38.2173331,49.9861538],[38.2167672,49.9855605],[38.216676,49.9852664],[38.2176952,49.9841006],[38.2175383,49.9838126],[38.2171011,49.9835435],[38.2170783,49.9832512],[38.219061,49.9832243],[38.2189545,49.9819361],[38.2218117,49.9791893],[38.2142258,49.9767849],[38.2087806,49.9748542],[38.1957373,49.9693628],[38.1956515,49.9689272],[38.1980064,49.9621458],[38.1751594,49.9548699],[38.1716135,49.9538336],[38.1708933,49.9541883],[38.1704789,49.9541831],[38.1627595,49.9515608],[38.1626026,49.9513623],[38.1627461,49.9509964],[38.1696314,49.9435971],[38.1713037,49.9420945],[38.1713064,49.9418887],[38.1703126,49.9413307],[38.1608324,49.9379015],[38.1473301,49.9321266],[38.1425907,49.9299615],[38.1401136,49.9284438],[38.1291421,49.9229475],[38.1268823,49.9220755],[38.126539,49.9222015],[38.1269024,49.9238265],[38.1279042,49.9266083],[38.1287518,49.9296671],[38.1287679,49.9306487],[38.1284997,49.9319194],[38.1276011,49.9345368],[38.1260535,49.9385281],[38.1259462,49.9393688],[38.1248774,49.9420497],[38.1245233,49.9422611],[38.0912639,49.9332851],[38.0745135,49.9283462],[38.064124,49.9255343],[38.0566688,49.9231781],[38.0545673,49.9217284],[38.0489507,49.9171709],[38.0458474,49.9148583],[38.0410999,49.9098044],[38.0401477,49.9083845],[38.0366743,49.904135],[38.0320896,49.8996608],[38.0390493,49.8938361],[38.0414263,49.8895495],[38.0462618,49.882772],[38.0597708,49.871676],[38.0678044,49.8644756],[38.0857909,49.8513734],[38.093529,49.8460777],[38.0930972,49.8456678],[38.0794997,49.8376763],[38.0782002,49.8371305],[38.073678,49.8360138],[38.0688744,49.8360084],[38.0552459,49.8372282],[38.0488064,49.8390422],[38.0484652,49.838882],[38.0427951,49.8389754],[38.0352634,49.838581],[38.0185157,49.8373977],[38.017711,49.8370829],[38.0187947,49.8355052],[38.0196744,49.8345329],[38.0128053,49.8197684],[38.0117512,49.8171466],[38.0095719,49.8127852],[38.0302128,49.8020963],[38.0344641,49.7992052],[38.0396059,49.7948854],[38.0466816,49.792799],[38.0474085,49.7927696],[38.0483553,49.7930968],[38.0548811,49.7915125],[38.0525154,49.783448],[38.0504179,49.7833553],[38.048991,49.7835051],[38.0488193,49.7831587],[38.0379456,49.7827777],[38.0365992,49.7784652],[38.0335844,49.777426],[38.0230567,49.7742744],[38.0236749,49.7722737],[38.0129032,49.7663404],[38.0101928,49.7651892],[38.009643,49.7591354],[38.0092406,49.7573507],[38.0082267,49.75672],[38.0050456,49.7554515],[37.9988497,49.7532542],[37.9898456,49.7527794],[37.9892957,49.7522734],[37.9875576,49.7528366],[37.9872787,49.7530134],[37.9872116,49.7533582],[37.9863024,49.7537741],[37.9854012,49.753807],[37.9842478,49.7542177],[37.984052,49.7545106],[37.9842285,49.7550672],[37.9838562,49.7555676],[37.983537,49.7554983],[37.9832956,49.7552003],[37.9826707,49.7551587],[37.9823247,49.7557843],[37.9823998,49.7560009],[37.9836872,49.756363],[37.9837328,49.7567564],[37.9833814,49.7569626],[37.9820833,49.7568187],[37.9798731,49.7648721],[37.9788002,49.7651632],[37.979216,49.7657851],[37.9789692,49.7664209],[37.9783496,49.7667622],[37.9781136,49.7670966],[37.9772365,49.7673357],[37.9766813,49.7678],[37.9692757,49.7603804],[37.9678434,49.7587057],[37.9605076,49.7470985],[37.9551271,49.7379969],[37.9514337,49.731662],[37.9515061,49.7309204],[37.951187,49.7305178],[37.9514444,49.7303639],[37.9543787,49.7258698],[37.9597163,49.7183701],[37.9660302,49.7140813],[37.9747072,49.7084843],[37.9907683,49.7157055],[37.9970527,49.7134448],[38.0004202,49.7136278],[38.0039191,49.7135645],[38.0101418,49.7142183],[38.0167106,49.7129176],[38.0169305,49.7120885],[38.0175863,49.7062398],[38.0052026,49.702414],[38.0050577,49.7023316],[38.0051275,49.7022258],[38.0034511,49.7017643],[38.0033639,49.701871],[37.9986513,49.70038],[38.0062768,49.6952152],[38.0133793,49.6954199],[38.0133498,49.6872561],[38.014385,49.6854279],[38.0122688,49.6854704],[38.0112711,49.6845715],[38.012352,49.6832873],[38.0143529,49.6831225],[38.0146949,49.6789225],[38.0111597,49.6781025],[38.0112724,49.6774386],[38.0203637,49.6772442],[38.0194263,49.6752933],[38.0252159,49.6700599],[38.0272785,49.6690999],[38.0307841,49.6681712],[38.0320367,49.6668015],[38.0301189,49.6648432],[38.0265141,49.6630793],[38.0322593,49.6594837],[38.0337238,49.6597441],[38.0348933,49.6601921],[38.0362424,49.6626436],[38.0384472,49.6611886],[38.0444097,49.6584089],[38.045834,49.657671],[38.0457938,49.657506],[38.0450132,49.6571917],[38.033182,49.6547191],[38.0159864,49.6514319],[38.0112488,49.6507433],[37.9959275,49.6477859],[37.9892287,49.6430505],[37.987107,49.6418408],[37.9904383,49.6350447],[37.9930495,49.6314886],[37.9948211,49.6305253],[37.9953884,49.6298547],[37.9957706,49.6286273],[37.994805,49.6279566],[37.9819143,49.6261271],[37.9805195,49.6260576],[37.9803586,49.6254652],[37.9744269,49.6201664],[37.9743826,49.6151721],[37.9748306,49.6116033],[37.9619238,49.6121933],[37.9481184,49.6112661],[37.9443097,49.6112904],[37.9435372,49.6042424],[37.9436392,49.6037713],[37.9434621,49.6022303],[37.9421881,49.5947263],[37.9423249,49.5948098],[37.9421961,49.5941004],[37.9416817,49.5938725],[37.9340331,49.5939836],[37.9339457,49.5905518],[37.9340905,49.5894807],[37.9347557,49.5876098],[37.9379421,49.583186],[37.9465018,49.5769025],[37.9502428,49.5750051],[37.9510814,49.5744523],[37.9523456,49.5732205],[37.9529303,49.5711402],[37.952823,49.5695539],[37.9523188,49.5685519],[37.9446423,49.5694895],[37.9376149,49.5697],[37.9358581,49.5698887],[37.9237533,49.5701348],[37.9242602,49.5666019],[37.9176886,49.5680106],[37.9142207,49.5691955],[37.9106428,49.5707262],[37.9061902,49.5713751],[37.90571,49.5724048],[37.9038835,49.5732275],[37.9031971,49.5737603],[37.9011744,49.5741737],[37.8990211,49.5698942],[37.891386,49.558444],[37.8871992,49.5518091],[37.8864276,49.5503845],[37.886433,49.549142],[37.8906923,49.5488427],[37.8915292,49.5489924],[37.9272576,49.5478595],[37.9264301,49.5426889],[37.9259607,49.5416342],[37.9174823,49.5340277],[37.8940505,49.5245781],[37.8857732,49.5188635],[37.8468168,49.5206187],[37.8455695,49.5147295],[37.8447998,49.513716],[37.8420103,49.5077233],[37.8422973,49.5074672],[37.8429222,49.5061888],[37.8441077,49.5027958],[37.8453577,49.501242],[37.8447354,49.4998659],[37.8427988,49.4978905],[37.8426057,49.4972703],[37.8385046,49.4946328],[37.83667,49.4926815]]],[[[38.2926428,48.4906721],[38.2930559,48.490313],[38.2948369,48.490313],[38.2972884,48.4898117],[38.2989943,48.4897228],[38.3075827,48.4931464],[38.3073682,48.4937401],[38.3045036,48.4950164],[38.3031946,48.4972524],[38.3032322,48.4980877],[38.3024275,48.5001316],[38.3028191,48.5015819],[38.3025241,48.5019089],[38.3014244,48.502243],[38.2998472,48.5017347],[38.2994288,48.5014184],[38.2993162,48.5010771],[38.2993805,48.5002134],[38.2998311,48.4994065],[38.3006626,48.4987347],[38.3002764,48.4984112],[38.2998204,48.4981553],[38.2989299,48.498756],[38.299284,48.499211],[38.2992518,48.4994243],[38.2987261,48.4996624],[38.2985222,48.499442],[38.2975835,48.5002027],[38.2953626,48.4987418],[38.2942039,48.4975332],[38.2933938,48.4963032],[38.2945847,48.4956136],[38.2945847,48.4953185],[38.2944024,48.4948066],[38.2936406,48.4946431],[38.2932383,48.4943445],[38.2933295,48.493861],[38.2938337,48.4935197],[38.2938176,48.492279],[38.2937103,48.4917244],[38.2927233,48.4908996],[38.2926428,48.4906721]]]]}');
INSERT INTO `b_location_area` (`ID`, `TYPE`, `CODE`, `SORT`, `GEOMETRY`) VALUES
(5, 'CUSTOM_FIELDS', 'ZAPOROZHYE', 0, '{\"type\":\"Polygon\",\"coordinates\":[[[34.1394646,47.4772499],[34.1416882,47.4768405],[34.1478446,47.4751524],[34.1524952,47.473877],[34.1640086,47.4708531],[34.1663863,47.4701457],[34.1699642,47.4690813],[34.17575,47.4672425],[34.1870992,47.4635844],[34.193878,47.4614294],[34.2004841,47.459237],[34.2085941,47.4564229],[34.2126653,47.4550758],[34.2184503,47.452729],[34.2217067,47.4511689],[34.2242939,47.4497297],[34.2271594,47.4481234],[34.230114,47.4460149],[34.2321441,47.4443094],[34.2347233,47.4423316],[34.236379,47.4407866],[34.2397898,47.4370579],[34.2426886,47.4338649],[34.2436188,47.4321896],[34.2445527,47.4304716],[34.2453672,47.4286773],[34.2474476,47.423858],[34.2493723,47.4193272],[34.2495225,47.417447],[34.2504946,47.4152974],[34.2564349,47.3953776],[34.2515581,47.3915388],[34.2607866,47.3597376],[34.2724553,47.3611366],[34.2824499,47.3258973],[34.2824986,47.3256449],[34.2823603,47.3254199],[34.2813157,47.3245463],[34.2811655,47.3242845],[34.2811272,47.3240386],[34.2926714,47.2772687],[34.2929268,47.2771],[34.293117,47.2768907],[34.293165,47.2766286],[34.2929968,47.2763339],[34.2929871,47.2760668],[34.2930736,47.2758304],[34.2931001,47.275617],[34.2929418,47.2752949],[34.2926983,47.2748217],[34.2927154,47.2744547],[34.2928636,47.2742226],[34.2932041,47.2738169],[34.2935203,47.2736457],[34.2938762,47.2736012],[34.2942699,47.2736733],[34.2945172,47.2738227],[34.2946622,47.2739836],[34.2948059,47.274184],[34.2949877,47.2743199],[34.295156,47.2743987],[34.2952324,47.2745231],[34.2952227,47.2746782],[34.2952683,47.2747844],[34.2954245,47.2748421],[34.2957781,47.2748386],[34.2960586,47.2747579],[34.2962537,47.2746184],[34.2964163,47.2744499],[34.2965122,47.2741826],[34.2964741,47.2739485],[34.2962595,47.2734139],[34.2962664,47.2730917],[34.2964278,47.2728825],[34.2967587,47.2726959],[34.297079,47.2726316],[34.2974837,47.272641],[34.2977485,47.2726874],[34.2979949,47.2726567],[34.2982609,47.2725342],[34.2987504,47.2722027],[34.3005952,47.2714941],[34.3053474,47.269141],[34.3094385,47.2730406],[34.3132506,47.2761832],[34.3176199,47.2799989],[34.3212673,47.2829582],[34.3287775,47.2898127],[34.3294041,47.2902484],[34.3302362,47.2904306],[34.3573864,47.293614],[34.3577775,47.2935595],[34.3580896,47.2933871],[34.369243,47.2841812],[34.3699571,47.2837459],[34.3708681,47.2835973],[34.3724937,47.2837958],[34.4013965,47.2870834],[34.3989909,47.297288],[34.3987637,47.2982773],[34.4192258,47.3006584],[34.4138387,47.3234564],[34.4279556,47.3250216],[34.437884,47.3261024],[34.4488057,47.327341],[34.4641129,47.3289905],[34.4748331,47.3300401],[34.4901169,47.3319828],[34.4920185,47.332266],[34.4927348,47.3325918],[34.495527,47.333252],[34.5013587,47.3344609],[34.5054386,47.3351652],[34.5069298,47.3349366],[34.5121847,47.3350429],[34.5124896,47.334064],[34.5125813,47.3330096],[34.5125355,47.3327613],[34.5119443,47.3328555],[34.5113182,47.3326424],[34.5104813,47.3321189],[34.5100415,47.3314135],[34.5096071,47.3298585],[34.5086438,47.328848],[34.5074107,47.3280873],[34.507252,47.3278503],[34.5071876,47.3273122],[34.5079807,47.3270522],[34.5079923,47.3268686],[34.507091,47.3262287],[34.5070159,47.3255814],[34.5074425,47.3250964],[34.5082927,47.3248396],[34.5089763,47.324791],[34.5106445,47.3248773],[34.5114684,47.3247887],[34.5123766,47.3245451],[34.5133021,47.3240163],[34.513582,47.3236324],[34.5139817,47.3224674],[34.5139068,47.320887],[34.5139611,47.3204498],[34.5144181,47.3198522],[34.5161124,47.3184443],[34.5138315,47.3181455],[34.5039906,47.3175806],[34.4984529,47.3170399],[34.4871739,47.3156983],[34.4794346,47.3151248],[34.4814715,47.308183],[34.4804555,47.3077858],[34.4837346,47.2955073],[34.4865927,47.2840452],[34.4877638,47.2799494],[34.4984606,47.2812559],[34.5182002,47.2835488],[34.5183042,47.2831829],[34.5199933,47.2772395],[34.5221908,47.2719339],[34.5236425,47.2671703],[34.5272052,47.2674288],[34.5295853,47.2557982],[34.5300976,47.2507598],[34.5252018,47.2504019],[34.5221712,47.2501804],[34.5197507,47.2496571],[34.5088101,47.2481924],[34.5011977,47.2476789],[34.4984663,47.2472914],[34.4908861,47.2468443],[34.4918777,47.2413488],[34.4909976,47.2406],[34.4941007,47.22444],[34.4961388,47.2146295],[34.4968027,47.2148342],[34.4979143,47.2103789],[34.4998977,47.2018159],[34.5027359,47.1887161],[34.504366,47.1774968],[34.5038561,47.177334],[34.5066898,47.1641054],[34.5079212,47.1583549],[34.5091904,47.1575835],[34.5121102,47.1434511],[34.5166375,47.1195265],[34.5167816,47.1187833],[34.5168822,47.1182644],[34.5195021,47.1047491],[34.5389449,47.1055095],[34.5534973,47.1059694],[34.553859,47.1021569],[34.5529108,47.1020308],[34.5539381,47.0965064],[34.5560267,47.0850424],[34.5567857,47.0806383],[34.5573738,47.0772392],[34.5607705,47.0591369],[34.5627574,47.0486448],[34.5645394,47.0389302],[34.5667768,47.0274956],[34.5672697,47.0244915],[34.574685,47.0253264],[34.5840477,47.0261884],[34.5916567,47.0267916],[34.5923098,47.0256266],[34.5929032,47.0243402],[34.5945556,47.0161199],[34.5969841,47.0043826],[34.5976708,47.0000203],[34.5989523,46.9948414],[34.5996222,46.9917725],[34.6012386,46.9920014],[34.6078025,46.9925633],[34.6174822,46.9933158],[34.6184384,46.9897104],[34.6205819,46.9881738],[34.6238427,46.9733971],[34.632119,46.9738327],[34.6399987,46.9744431],[34.640407,46.9744321],[34.6425991,46.9741138],[34.652617,46.9762331],[34.6542543,46.9766286],[34.6667176,46.9777684],[34.6809711,46.9791411],[34.6813519,46.9778701],[34.6853005,46.9573569],[34.6854556,46.9558631],[34.6968099,46.9573386],[34.7040989,46.9579223],[34.7128849,46.9589188],[34.721259,46.9598516],[34.7299839,46.9607492],[34.7364408,46.9613595],[34.7369787,46.9584871],[34.7385888,46.9513582],[34.7393759,46.9475788],[34.7394048,46.9474303],[34.7421075,46.9335408],[34.7428188,46.9313654],[34.7440307,46.9253999],[34.7449863,46.9215673],[34.748408,46.9025023],[34.7493926,46.8966473],[34.7504906,46.8899038],[34.7517367,46.8840288],[34.7525692,46.8795369],[34.7643968,46.880333],[34.7725608,46.8808139],[34.7853025,46.8815821],[34.7894519,46.8817946],[34.7979264,46.8821958],[34.8046826,46.8825274],[34.8049115,46.8813742],[34.8053862,46.878497],[34.8064622,46.8714713],[34.8076081,46.8642578],[34.809442,46.8528418],[34.8101278,46.8483155],[34.8132724,46.8330884],[34.8165539,46.8284506],[34.8109672,46.8279125],[34.8031191,46.8271484],[34.7897881,46.8258962],[34.772827,46.8242415],[34.7581324,46.8227066],[34.7587314,46.8196818],[34.7601377,46.812745],[34.7614297,46.8065858],[34.7619135,46.8042793],[34.76297,46.79931],[34.76452,46.792645],[34.7651907,46.7897562],[34.7664072,46.7852117],[34.7674863,46.7812448],[34.7675765,46.7809131],[34.7501431,46.7805134],[34.7501942,46.7731834],[34.750469,46.7611846],[34.7504856,46.7578954],[34.7351722,46.7570629],[34.7351928,46.7546117],[34.734716,46.7518802],[34.7350052,46.7473443],[34.7128633,46.7453251],[34.6976977,46.7439931],[34.6586929,46.7403319],[34.6600874,46.732634],[34.6612754,46.7271564],[34.6441357,46.7257422],[34.6252257,46.723972],[34.6272644,46.7131569],[34.6285273,46.7064446],[34.629127,46.7041632],[34.6320378,46.6893821],[34.6322356,46.6876186],[34.6387728,46.6882302],[34.6449865,46.6888306],[34.6765615,46.6918762],[34.6808284,46.6919901],[34.6835688,46.6772691],[34.6851011,46.6770294],[34.687637,46.6772145],[34.6911909,46.6776462],[34.6939425,46.6778392],[34.6986125,46.6783723],[34.6994682,46.6790294],[34.7010536,46.6792081],[34.7112344,46.6800373],[34.7354872,46.6822547],[34.7461772,46.6832188],[34.7481714,46.6726998],[34.7506537,46.6592543],[34.7515286,46.6544497],[34.7540567,46.6398418],[34.7553895,46.6320071],[34.7563087,46.6269756],[34.7481942,46.6257596],[34.7381471,46.6241663],[34.7220639,46.6216605],[34.7127641,46.6200738],[34.7131884,46.6192518],[34.7149552,46.6126337],[34.7164313,46.6072424],[34.7180316,46.6013226],[34.7198255,46.5943436],[34.7218722,46.586955],[34.7232991,46.5814666],[34.7319216,46.5824558],[34.7413721,46.5834561],[34.748275,46.5841895],[34.7485571,46.583762],[34.7498271,46.5777723],[34.75143,46.5710522],[34.7527566,46.5653883],[34.7534264,46.5621186],[34.7538519,46.561729],[34.7540696,46.5612099],[34.7568736,46.5493492],[34.7623715,46.550042],[34.7784189,46.551684],[34.7949118,46.5533178],[34.8204995,46.5559199],[34.8348679,46.5574048],[34.8428132,46.5581759],[34.8729219,46.5612726],[34.8790645,46.5621592],[34.8893784,46.563235],[34.8907061,46.5631548],[34.8915491,46.558012],[34.8926914,46.5501508],[34.8948457,46.5371691],[34.8848669,46.5363143],[34.8862415,46.5288966],[34.8877081,46.5203979],[34.8889843,46.5134578],[34.890103,46.5069564],[34.8985072,46.5077698],[34.9054562,46.5084423],[34.9089241,46.5087819],[34.9309628,46.5108515],[34.9457548,46.5122707],[34.9462054,46.5123449],[34.9468732,46.512555],[34.9468768,46.5118797],[34.9472289,46.5095427],[34.9477403,46.50705],[34.9478126,46.506692],[34.948107,46.5047768],[34.9482815,46.5038964],[34.9484523,46.5028592],[34.9526008,46.5033257],[34.9560375,46.5020159],[34.9569053,46.501728],[34.9567755,46.501538],[34.9594097,46.500651],[34.9773292,46.4942947],[34.9890951,46.4902574],[34.9910355,46.4895849],[35.0071239,46.4839758],[35.0213956,46.4789514],[35.0366725,46.4804509],[35.0546771,46.4818658],[35.0596674,46.4413835],[35.0622322,46.4248011],[35.0626507,46.4244409],[35.063085,46.420671],[35.0634783,46.4172565],[35.0642612,46.411543],[35.0653285,46.4037513],[35.0666824,46.3949781],[35.0688299,46.3830543],[35.0692434,46.3808903],[35.0695027,46.3794352],[35.0692269,46.3782474],[35.0673762,46.3767197],[35.0659736,46.3761357],[35.0619697,46.3758549],[35.0567539,46.3752108],[35.0600771,46.3591498],[35.0611074,46.3549064],[35.0616161,46.3528112],[35.0622531,46.3496909],[35.0644008,46.3355889],[35.0658084,46.3317809],[35.0677513,46.3298482],[35.0657738,46.3286731],[35.0675455,46.323378],[35.0695999,46.3134147],[35.0697501,46.310599],[35.0720342,46.2995725],[35.0810386,46.3004532],[35.0899118,46.3010967],[35.0936703,46.3013691],[35.0941085,46.3014008],[35.1002879,46.3015908],[35.1019236,46.301641],[35.1059949,46.3020459],[35.128223,46.3020878],[35.133571,46.3007694],[35.1446525,46.2985018],[35.1694604,46.2944092],[35.1846222,46.2912034],[35.2059792,46.2862733],[35.2274451,46.2812001],[35.2405593,46.2762051],[35.2476732,46.2730827],[35.2534755,46.2710593],[35.2616697,46.2686856],[35.2673489,46.2669432],[35.2750858,46.2653158],[35.275494,46.2652299],[35.2770267,46.2648232],[35.2772789,46.2647679],[35.2780627,46.264581],[35.2781489,46.2645192],[35.3757487,46.1944895],[35.4680391,46.1464862],[35.4701648,46.1478707],[35.4819473,46.1566185],[35.4928787,46.1658799],[35.5029123,46.175615],[35.5120049,46.1857818],[35.5201177,46.1963367],[35.5272159,46.2072341],[35.5307274,46.2137275],[35.5322018,46.2146868],[35.5439845,46.223424],[35.5549159,46.2326741],[35.5649494,46.2423974],[35.574042,46.2525519],[35.5819369,46.2628108],[35.5879919,46.2643953],[35.60371,46.2693433],[35.6189263,46.2749908],[35.6335757,46.2813135],[35.6475954,46.288284],[35.6609254,46.2958722],[35.6735087,46.3040454],[35.6852912,46.3127683],[35.6962226,46.3220034],[35.7062562,46.3317109],[35.7153488,46.3418488],[35.720357,46.3483463],[35.7361916,46.3524836],[35.7519097,46.3574236],[35.7671261,46.363062],[35.7817754,46.3693745],[35.7957952,46.3763338],[35.8091252,46.3839098],[35.8217084,46.3920699],[35.833491,46.4007787],[35.8444224,46.409999],[35.8472766,46.4054846],[35.8567708,46.3938667],[35.8673925,46.3827203],[35.8790922,46.3720979],[35.8918154,46.3620491],[35.9055027,46.3526211],[35.9200904,46.3438584],[35.9355103,46.335802],[35.9516906,46.3284899],[35.968556,46.3219563],[35.9860276,46.3162322],[36.0040241,46.3113444],[36.0224616,46.3073159],[36.0412541,46.3041657],[36.060314,46.3019087],[36.0795523,46.3005555],[36.0988795,46.3001125],[36.1182054,46.3005817],[36.1374399,46.301961],[36.1564934,46.3042438],[36.1752769,46.3074194],[36.1937029,46.3114728],[36.2116855,46.316385],[36.2291409,46.3221328],[36.2459876,46.3286891],[36.2621471,46.3360231],[36.2775441,46.3441003],[36.2921069,46.3528828],[36.3057674,46.3623291],[36.318462,46.3723951],[36.3301315,46.3830333],[36.3407215,46.3941939],[36.3501826,46.4058246],[36.3584708,46.4178707],[36.3646786,46.420421],[36.3798949,46.4260529],[36.3945443,46.4323581],[36.4085639,46.4393093],[36.4218939,46.4468766],[36.4344772,46.4550273],[36.4462598,46.4637262],[36.4571912,46.4729357],[36.4672247,46.4826163],[36.4763173,46.4927262],[36.4844301,46.503222],[36.4915284,46.5140584],[36.4975815,46.5251889],[36.4987834,46.5281547],[36.5025931,46.5284701],[36.5222045,46.5312107],[36.5414665,46.534735],[36.5457041,46.5356505],[36.5512539,46.5302776],[36.5622357,46.5211061],[36.5740658,46.512447],[36.5866935,46.5043376],[36.6000649,46.4968131],[36.6141225,46.4899056],[36.6288062,46.4836452],[36.6440533,46.4780587],[36.6597982,46.4731705],[36.6759738,46.4690015],[36.6925105,46.4655698],[36.7093378,46.4628902],[36.7263834,46.4609744],[36.7435744,46.4598306],[36.7608373,46.4594637],[36.778098,46.4598754],[36.7952827,46.4610639],[36.8123177,46.4630239],[36.8291301,46.4657472],[36.845648,46.4692218],[36.8618005,46.4734327],[36.8775187,46.4783618],[36.8927349,46.4839878],[36.9073843,46.4902863],[36.9214041,46.4972301],[36.9347341,46.5047894],[36.9473173,46.5129313],[36.9590999,46.5216209],[36.9700313,46.5308207],[36.9800648,46.540491],[36.9891574,46.5505902],[36.9972703,46.5610748],[37.0043684,46.5718997],[37.0104216,46.5830182],[37.015404,46.5943828],[37.0192941,46.6059446],[37.0220754,46.6176539],[37.0237359,46.6294604],[37.024161,46.6389232],[37.0245656,46.6390966],[37.0385852,46.6460215],[37.0519153,46.65356],[37.0644985,46.6616796],[37.0762811,46.6703454],[37.0872125,46.67952],[37.0972461,46.6891638],[37.097886,46.6898727],[37.1007148,46.690329],[37.1172326,46.6937892],[37.1333852,46.6979828],[37.1491033,46.7028914],[37.1611417,46.7068961],[37.1687215,46.710379],[37.0624638,46.8839559],[37.0623792,46.884054],[37.06116,46.8854885],[37.0574958,46.8896671],[37.0555499,46.8921226],[37.0536625,46.8941895],[37.0536396,46.8942167],[37.0523659,46.8957926],[37.0512224,46.8970006],[37.0428285,46.9066495],[37.0335649,46.9175287],[37.031117,46.920123],[37.0214221,46.9278993],[37.0214265,46.9279498],[37.0229535,46.9288914],[37.0316011,46.9340685],[37.03181,46.9341935],[37.0503935,46.9447917],[37.0582623,46.9490848],[37.0604694,46.9503782],[37.0625903,46.9513941],[37.0694606,46.9554556],[37.0767158,46.9595142],[37.0767989,46.9595667],[37.0791861,46.9610759],[37.0795903,46.9613865],[37.0818964,46.9627898],[37.0869309,46.9652915],[37.0896276,46.9667358],[37.0921672,46.9682677],[37.0921855,46.9682779],[37.092348,46.9683681],[37.1026884,46.9599756],[37.1054753,46.9614825],[37.1095943,46.9637834],[37.117111,46.9680131],[37.1221199,46.970871],[37.122161,46.970897],[37.1233696,46.9717264],[37.1251262,46.9727448],[37.1411334,46.9819937],[37.1361095,46.9844532],[37.1322402,46.9863564],[37.1186362,46.9930315],[37.1056231,46.9994454],[37.0896322,47.0073171],[37.0893372,47.0074623],[37.0899679,47.0080334],[37.0913053,47.0092442],[37.1048976,47.0214576],[37.1056642,47.0221326],[37.1241762,47.0386353],[37.1249171,47.0391072],[37.1125658,47.0485273],[37.112501,47.0485761],[37.1124442,47.0486195],[37.0986952,47.0592489],[37.0913671,47.0551469],[37.0871452,47.0527896],[37.0865397,47.0524616],[37.0846212,47.0511526],[37.081212,47.0474791],[37.0771361,47.048859],[37.0707341,47.0510409],[37.0667277,47.0524123],[37.0653343,47.0528845],[37.0226889,47.0673865],[37.0118274,47.070919],[37.0060836,47.0727994],[37.0056163,47.0729486],[36.9932224,47.076968],[36.9906019,47.0780522],[36.9893173,47.0784599],[36.9854531,47.0797697],[36.9856977,47.0798491],[36.985854,47.0799458],[36.986124,47.0801877],[36.9862376,47.0803135],[36.9863912,47.0804302],[36.9865778,47.0805196],[36.9870013,47.0806024],[36.9871478,47.0805514],[36.9873106,47.0804549],[36.9874787,47.0803905],[36.9877203,47.0803583],[36.9879776,47.0803512],[36.9882402,47.0803726],[36.9885251,47.080565],[36.9888652,47.0806838],[36.9892486,47.0806087],[36.9896901,47.0806134],[36.9899032,47.0806037],[36.9902307,47.0806444],[36.990642,47.080952],[36.9907669,47.0810217],[36.9910301,47.0810102],[36.9912723,47.080792],[36.9919252,47.0808484],[36.992363,47.0809163],[36.9927732,47.0810198],[36.993171,47.0810778],[36.9935404,47.0812229],[36.9937916,47.0814491],[36.9942433,47.0820249],[36.9945322,47.0822681],[36.9950279,47.082432],[36.9953206,47.0826347],[36.9955041,47.0827327],[36.9961174,47.0829129],[36.9969582,47.0830931],[36.9975154,47.0832747],[36.9981477,47.0834478],[36.9985306,47.0835921],[36.9989649,47.0835912],[36.9993548,47.0834716],[36.9998025,47.083418],[37.0001765,47.0834236],[37.000454,47.0833302],[37.0005108,47.0832028],[37.0008511,47.083363],[37.0010776,47.0834928],[37.0014208,47.0836158],[37.0016198,47.0836827],[37.0018241,47.0836905],[37.0020398,47.0836664],[37.0022421,47.0836271],[37.002439,47.0835956],[37.0026333,47.08362],[37.002874,47.0836994],[37.0029944,47.0838154],[37.0031641,47.0839996],[37.0034829,47.0840382],[37.0039979,47.0840758],[37.0042199,47.0842053],[37.0044969,47.0844063],[37.0049492,47.0844752],[37.0051561,47.0844709],[37.005347,47.0844446],[37.0055459,47.0844349],[37.0060432,47.0844736],[37.0062705,47.0844639],[37.006924,47.0843865],[37.0075729,47.0844282],[37.0081885,47.0844542],[37.0083874,47.0845123],[37.0087294,47.0847617],[37.0090085,47.0847706],[37.0091404,47.0848025],[37.0092541,47.0849283],[37.0093586,47.0856655],[37.009658,47.0860017],[37.0098934,47.0862246],[37.0099962,47.0863936],[37.0100639,47.0866503],[37.0100655,47.0870085],[37.0101776,47.08725],[37.0104195,47.087711],[37.0104912,47.0879833],[37.0105848,47.0881378],[37.0107022,47.0882993],[37.0109185,47.0883619],[37.0119689,47.0886944],[37.0123208,47.0888232],[37.0125098,47.089263],[37.0127873,47.0893668],[37.0128385,47.0895318],[37.0127543,47.08988],[37.0127045,47.0901167],[37.0125875,47.0902984],[37.0124783,47.0905288],[37.0123468,47.090692],[37.0122027,47.0907526],[37.0119536,47.0907422],[37.0118604,47.090723],[37.0117021,47.090706],[37.0115131,47.0907615],[37.0110624,47.0909497],[37.0106607,47.0913322],[37.0103061,47.0915408],[37.0099398,47.0917236],[37.0097424,47.0917877],[37.0095135,47.0918274],[37.009323,47.0918163],[37.0090221,47.091777],[37.0088427,47.091889],[37.0087142,47.092048],[37.0086432,47.0922028],[37.0085863,47.0925413],[37.008629,47.0926961],[37.0087126,47.092946],[37.0089984,47.0932378],[37.0090694,47.0934022],[37.0091546,47.0937021],[37.009091,47.0940845],[37.0091237,47.0943476],[37.0092967,47.0947757],[37.0094246,47.0950852],[37.0096439,47.0953325],[37.0097696,47.0954965],[37.010269,47.095997],[37.0104475,47.0962749],[37.0107459,47.0965071],[37.0111437,47.0966521],[37.0113142,47.0967392],[37.0114421,47.0968553],[37.0117288,47.0973035],[37.0115085,47.0977029],[37.0111877,47.0979961],[37.0109878,47.098244],[37.0109346,47.0984847],[37.0106089,47.0987743],[37.010072,47.0990793],[37.0093707,47.0991695],[37.0087601,47.0989712],[37.0079861,47.098698],[37.0077209,47.0985573],[37.0067016,47.0977394],[37.0061178,47.0975477],[37.0059911,47.0975689],[37.0057406,47.0977191],[37.0050203,47.0979905],[37.0044247,47.0985697],[37.0041324,47.0988075],[37.0038792,47.0989846],[37.0035913,47.0990825],[37.0033258,47.0992464],[37.0032178,47.0994595],[37.0029222,47.0997585],[37.0028756,47.0998357],[37.0029574,47.1001391],[37.0028314,47.1003775],[37.0022124,47.1006159],[37.0020205,47.1008577],[37.0020061,47.1009728],[37.0021864,47.1011439],[37.0024381,47.1013125],[37.0027359,47.1016065],[37.0028024,47.1017295],[37.0028508,47.1019798],[37.0028509,47.1023113],[37.0031984,47.1026155],[37.0034676,47.102767],[37.0036609,47.102744],[37.0039524,47.1027045],[37.0046353,47.1028674],[37.0049093,47.1029872],[37.0054082,47.103139],[37.0061345,47.1038006],[37.0066361,47.1039499],[37.0069371,47.1041036],[37.0071879,47.1042857],[37.0073384,47.1045076],[37.0075391,47.1051848],[37.0078568,47.1053043],[37.0079655,47.1053954],[37.0082832,47.1058165],[37.008626,47.1061181],[37.0089604,47.1062091],[37.0093366,47.1064994],[37.0095122,47.1069546],[37.0097714,47.107131],[37.0098717,47.1073529],[37.0099135,47.1076705],[37.009827,47.1079238],[37.0096644,47.1081537],[37.0096675,47.1083336],[37.0098652,47.1086141],[37.0102648,47.1088898],[37.0104142,47.1094652],[37.0101755,47.1096651],[37.0103147,47.1100925],[37.0106068,47.11028],[37.0107914,47.1106078],[37.0106827,47.1109435],[37.0107663,47.1111654],[37.0107663,47.1113987],[37.0103389,47.111818],[37.0103502,47.1123713],[37.0102479,47.1130829],[37.0101615,47.1133581],[37.0100706,47.1136477],[37.0098353,47.1138936],[37.0094951,47.1141209],[37.0091192,47.1142209],[37.0086427,47.1142721],[37.0084838,47.1142379],[37.0080407,47.1140559],[37.0076896,47.1136462],[37.0073301,47.11343],[37.0070207,47.1133959],[37.0066612,47.1131114],[37.0065107,47.1130658],[37.0063435,47.1130943],[37.0058586,47.1129805],[37.0052148,47.1131171],[37.004337,47.1131171],[37.0038771,47.1132536],[37.0031749,47.1133788],[37.0029575,47.11343],[37.0028062,47.1136011],[37.0025035,47.1137488],[37.0021239,47.1138559],[37.0014259,47.1139302],[37.0001981,47.1139313],[37.0000892,47.113967],[37.0000731,47.1140388],[37.0001003,47.1143316],[36.9999226,47.1147159],[36.9998557,47.1148297],[36.9997316,47.115008],[36.9996177,47.1151461],[36.9996049,47.1153588],[36.9997219,47.1154897],[36.9997637,47.1158253],[36.9996968,47.1160472],[36.9997136,47.1163886],[36.9998223,47.1169519],[36.9999895,47.1174184],[37.0002737,47.1175834],[37.0003406,47.1176915],[37.0003214,47.1180455],[37.0004321,47.1181808],[37.0010173,47.1184599],[37.0015036,47.1191024],[37.0016201,47.1192215],[37.0018531,47.1192973],[37.0021967,47.1195462],[37.0025796,47.1201727],[37.0025861,47.1205033],[37.0027317,47.1210424],[37.0027485,47.1211562],[37.0021131,47.1216909],[37.0019709,47.1220266],[37.0014997,47.122646],[37.0014715,47.122903],[37.0014693,47.1230847],[37.0015706,47.1237339],[37.0016965,47.1239906],[37.0019916,47.1242711],[37.0021841,47.1245968],[37.0025645,47.1249212],[37.002973,47.1253789],[37.0029416,47.1258568],[37.0026045,47.1261482],[37.0024486,47.1263045],[37.0023973,47.1264979],[37.0022767,47.1267218],[37.0022803,47.1270553],[37.0022217,47.1271634],[37.0017538,47.1276285],[37.0015683,47.1277669],[37.0013104,47.1279541],[37.0010805,47.1281191],[37.0008758,47.1282507],[37.0005914,47.1283807],[37.0000397,47.128571],[36.9997196,47.1286877],[36.9994608,47.1288498],[36.9987388,47.1291238],[36.9985355,47.1293344],[36.9982475,47.1295982],[36.9979832,47.1296303],[36.9977342,47.129587],[36.9973827,47.129487],[36.9970038,47.1294239],[36.9965513,47.1293045],[36.9965091,47.1291891],[36.9965891,47.1289693],[36.9965382,47.1287323],[36.9964481,47.1284997],[36.9962932,47.1282444],[36.9959847,47.1278801],[36.9957841,47.1276753],[36.9957005,47.1274364],[36.9955416,47.1272203],[36.9945802,47.1265149],[36.994229,47.1259518],[36.9939615,47.125747],[36.9938361,47.1255536],[36.9936856,47.1255138],[36.9933846,47.1252293],[36.9934097,47.124871],[36.9933511,47.1246377],[36.9932592,47.1245353],[36.9930583,47.1243032],[36.9928495,47.1241371],[36.9925723,47.1240194],[36.992304,47.1240046],[36.9918874,47.1238358],[36.9915089,47.1238568],[36.9911357,47.1239257],[36.9908254,47.1240846],[36.9904731,47.1242743],[36.9901482,47.1244195],[36.9898766,47.124693],[36.989823,47.1248141],[36.9897394,47.1249108],[36.9895958,47.1251027],[36.9894718,47.1252976],[36.989266,47.1254356],[36.9888949,47.125582],[36.9887528,47.1256332],[36.9884166,47.1257658],[36.9881899,47.1257896],[36.9879447,47.1256099],[36.9875071,47.1253147],[36.986462,47.1249335],[36.9856427,47.1247515],[36.9849738,47.1246832],[36.9844722,47.1245695],[36.9841712,47.12445],[36.9836946,47.1243874],[36.9835274,47.1244045],[36.9830503,47.1247121],[36.9829398,47.1247561],[36.9828348,47.1248059],[36.9825477,47.1251204],[36.9823993,47.1253422],[36.9822262,47.1254536],[36.9817686,47.125727],[36.9813202,47.126003],[36.9805415,47.1264046],[36.9801431,47.1266014],[36.979647,47.1267708],[36.9793747,47.1270574],[36.9791077,47.1271826],[36.9789763,47.1273339],[36.9789635,47.1275126],[36.9793193,47.1279665],[36.9795888,47.1282255],[36.9801894,47.1287782],[36.9803438,47.1289745],[36.9803592,47.1291009],[36.9802767,47.1293618],[36.9802468,47.1296455],[36.9802449,47.1298575],[36.9802189,47.1301241],[36.9800757,47.1303671],[36.9800456,47.1305441],[36.9799975,47.1306857],[36.9798663,47.1308455],[36.9796694,47.1309274],[36.9774143,47.1315323],[36.9770261,47.1318925],[36.9768672,47.1325397],[36.9763606,47.1334564],[36.976077,47.1335239],[36.9758631,47.1337275],[36.97562,47.1339936],[36.9754468,47.1341808],[36.9751672,47.1342609],[36.9746478,47.1342783],[36.973869,47.1343355],[36.9735966,47.1344222],[36.9733336,47.1345621],[36.9731812,47.1347347],[36.9730364,47.134841],[36.9728805,47.1348797],[36.9726363,47.1348284],[36.9724032,47.1348482],[36.9722857,47.1349384],[36.9721431,47.1349472],[36.9720667,47.1349185],[36.9717445,47.1348512],[36.9714021,47.1347969],[36.9712579,47.1348317],[36.9711671,47.1349387],[36.971108,47.1350388],[36.9709857,47.1351158],[36.9707201,47.1353031],[36.9704521,47.1355366],[36.9703034,47.1357347],[36.9702783,47.1359196],[36.9702943,47.136092],[36.9705019,47.1363407],[36.9706242,47.1364105],[36.9706923,47.1365225],[36.9707279,47.1366227],[36.9707492,47.1368052],[36.9708873,47.1372422],[36.9711051,47.1374911],[36.9712313,47.1375391],[36.9713567,47.1375244],[36.9714653,47.1374494],[36.9714699,47.1373084],[36.9715225,47.1372458],[36.9716255,47.1372211],[36.9719006,47.1372317],[36.9720982,47.1373208],[36.972531,47.1376197],[36.9729972,47.1381991],[36.9730903,47.1384818],[36.9732073,47.1387362],[36.9735356,47.1392153],[36.97378,47.1396525],[36.9738184,47.1398032],[36.9737799,47.1398799],[36.9735861,47.1399689],[36.9734485,47.1400521],[36.9733368,47.140174],[36.9731781,47.1403079],[36.9731137,47.1404282],[36.9730428,47.1404859],[36.9724683,47.1407159],[36.972267,47.1408615],[36.972231,47.1410557],[36.97199,47.1413064],[36.9718082,47.1414071],[36.9713822,47.141564],[36.9711388,47.1416249],[36.9708863,47.1419345],[36.9707433,47.142105],[36.9706331,47.1422701],[36.9705369,47.1423479],[36.9705343,47.1424517],[36.9704714,47.1425123],[36.9702305,47.1425906],[36.9699456,47.1425622],[36.9696958,47.1426757],[36.969376,47.14269],[36.9688568,47.142824],[36.968692,47.1429168],[36.9686507,47.1431652],[36.9686351,47.1432499],[36.9685805,47.1432775],[36.9684678,47.1432789],[36.9684219,47.1432469],[36.9683031,47.1432672],[36.9682077,47.1433044],[36.9680298,47.1432708],[36.967932,47.1432879],[36.9678675,47.1433757],[36.9676357,47.1434203],[36.9675761,47.1434925],[36.9674697,47.1435105],[36.9673335,47.143504],[36.9665762,47.1436834],[36.9662875,47.1438652],[36.966003,47.1439647],[36.9658213,47.1440683],[36.9650621,47.1443354],[36.9648875,47.1444531],[36.9647821,47.1445789],[36.964502,47.1447638],[36.9642355,47.1448357],[36.9639669,47.1448831],[36.9638244,47.1449304],[36.963689,47.1450235],[36.9636223,47.1451325],[36.9636052,47.1452817],[36.963633,47.1455222],[36.9636189,47.1458882],[36.9636704,47.1459493],[36.9636392,47.1461686],[36.9637424,47.146361],[36.963793,47.1463954],[36.9637593,47.1466162],[36.9636894,47.1467108],[36.9632373,47.1472458],[36.9630451,47.1473956],[36.9628602,47.1474581],[36.9627752,47.1474259],[36.9625498,47.1474231],[36.9624139,47.1475053],[36.9623492,47.1478855],[36.9621449,47.148163],[36.962014,47.1485977],[36.9619083,47.1487065],[36.9617581,47.1488596],[36.9613669,47.1490494],[36.9611153,47.1490451],[36.9606273,47.1490432],[36.9598434,47.149106],[36.9592633,47.1491317],[36.9584143,47.1492522],[36.9581234,47.149386],[36.9578278,47.1495173],[36.9574252,47.1495982],[36.957215,47.1497136],[36.9568227,47.1497806],[36.9564241,47.1497423],[36.9556473,47.1494943],[36.9552061,47.1494447],[36.9547837,47.1494596],[36.9545717,47.1495599],[36.954272,47.1499189],[36.9540581,47.150135],[36.954133,47.1504355],[36.9541667,47.1505409],[36.9544086,47.150946],[36.9546593,47.1512114],[36.9547432,47.1512755],[36.9548505,47.1513172],[36.954949,47.1514809],[36.954949,47.1518132],[36.9548705,47.1522292],[36.9548213,47.152277],[36.9547921,47.1523712],[36.9548613,47.1524736],[36.9548687,47.1527159],[36.954763,47.1527878],[36.9547411,47.1529044],[36.9547601,47.153068],[36.9546609,47.1531822],[36.9546499,47.1532739],[36.9547171,47.1533702],[36.9546827,47.1535393],[36.9546025,47.1536211],[36.954391,47.1537005],[36.9542997,47.1538411],[36.9540245,47.1540278],[36.953859,47.1541164],[36.9534662,47.1543481],[36.9527256,47.1546824],[36.9523304,47.1547467],[36.9520768,47.15473],[36.9513642,47.1546277],[36.9509569,47.1546167],[36.9507421,47.154663],[36.9505959,47.1547338],[36.9504188,47.1549083],[36.95036,47.1550722],[36.9503227,47.1553822],[36.9503184,47.1556988],[36.9501659,47.1560195],[36.9500773,47.1563313],[36.9502061,47.1565877],[36.950262,47.1570947],[36.9503191,47.1578033],[36.9501435,47.1580137],[36.9500011,47.1584],[36.9495352,47.1586788],[36.9486219,47.1591165],[36.9469581,47.1598272],[36.946181,47.1601047],[36.9456146,47.1601019],[36.94536,47.1599859],[36.9444303,47.15966],[36.9437164,47.1596478],[36.9424744,47.158399],[36.942147,47.1580404],[36.9420188,47.1575618],[36.9417013,47.1573214],[36.9413469,47.1574203],[36.9411726,47.1574096],[36.9408616,47.157459],[36.9404007,47.1573043],[36.9399922,47.1577243],[36.9393446,47.1580016],[36.9391415,47.1581653],[36.938826,47.1584298],[36.9384284,47.158791],[36.9382772,47.1593497],[36.938119,47.1596815],[36.9380654,47.1600912],[36.937573,47.160543],[36.9371267,47.1608231],[36.9369621,47.161031],[36.9367834,47.1613744],[36.9367479,47.1618825],[36.9369304,47.1625315],[36.9369498,47.1627679],[36.9371129,47.1630758],[36.9369005,47.1634525],[36.9369684,47.1637677],[36.9371068,47.1639676],[36.9371068,47.164526],[36.9372054,47.1647179],[36.9373294,47.1648827],[36.9373284,47.1650766],[36.9372346,47.1652156],[36.9371285,47.1653095],[36.9369483,47.1654038],[36.9366667,47.1655313],[36.9359035,47.1653999],[36.9355659,47.1653163],[36.9348758,47.1650633],[36.9340691,47.164837],[36.933417,47.1646525],[36.9329193,47.1645515],[36.9326243,47.164542],[36.9317741,47.1641729],[36.9315504,47.1642144],[36.9314605,47.1640858],[36.930941,47.1637367],[36.9305976,47.1636113],[36.9301237,47.1632124],[36.9295956,47.162825],[36.9297919,47.1626056],[36.9293215,47.1622159],[36.9286941,47.1621724],[36.9283614,47.1620103],[36.9280317,47.1620187],[36.9277246,47.1619932],[36.9270055,47.1615043],[36.9262674,47.1610688],[36.9255884,47.1609982],[36.9252383,47.1609834],[36.9249853,47.1607663],[36.9249067,47.1605685],[36.9245434,47.160299],[36.9243929,47.1602478],[36.9240584,47.1602763],[36.9236153,47.1604184],[36.9228503,47.1604744],[36.9225446,47.1606205],[36.9224177,47.1607099],[36.9224114,47.1609016],[36.9226351,47.1613194],[36.9228496,47.161577],[36.9232971,47.1620849],[36.9235983,47.1622408],[36.9238122,47.1627059],[36.9239426,47.1630391],[36.9240501,47.1633516],[36.9241572,47.1637675],[36.9239048,47.1641421],[36.9234429,47.1645364],[36.9232793,47.1649075],[36.9232337,47.1652347],[36.9232067,47.165556],[36.9232054,47.1657919],[36.923412,47.1661402],[36.9236022,47.1663888],[36.9241371,47.1667179],[36.924497,47.166931],[36.9247865,47.1671148],[36.9248744,47.1673343],[36.9248911,47.167519],[36.9248566,47.1677808],[36.9247899,47.1679795],[36.9247154,47.1683554],[36.9243799,47.1691236],[36.9242413,47.1702909],[36.9239699,47.1704502],[36.9237374,47.1704626],[36.9235652,47.170434],[36.9231471,47.1701953],[36.9230468,47.1700475],[36.9226547,47.1698955],[36.9224267,47.1699431],[36.9223631,47.1700445],[36.9222526,47.170093],[36.9220082,47.1701113],[36.9217593,47.1700475],[36.9216004,47.1700816],[36.9210235,47.170667],[36.9203486,47.1710496],[36.9201122,47.1711615],[36.9196357,47.1712581],[36.9189668,47.1712184],[36.9183231,47.1710081],[36.918089,47.1708489],[36.9179385,47.17065],[36.9176041,47.1697406],[36.9174369,47.1695303],[36.9170355,47.1693086],[36.9163638,47.1690454],[36.9160244,47.1690531],[36.9157316,47.1689132],[36.9150796,47.168232],[36.9150949,47.1679013],[36.9150129,47.1678074],[36.9148148,47.1676567],[36.9148759,47.167563],[36.9150006,47.1670805],[36.9149119,47.1666087],[36.914798,47.1663763],[36.9147447,47.1662677],[36.9143378,47.165825],[36.9140257,47.1657391],[36.9138669,47.1657618],[36.9133067,47.1663757],[36.9130392,47.1665064],[36.9125626,47.1666372],[36.9120777,47.1666144],[36.9117684,47.1665292],[36.9115092,47.1663871],[36.9113324,47.1661688],[36.9106982,47.1654946],[36.9102969,47.1652673],[36.9097798,47.1651566],[36.9093219,47.1651521],[36.9091431,47.1651706],[36.9087335,47.1653355],[36.9083458,47.1655183],[36.9080625,47.1658402],[36.9076669,47.1663568],[36.9074884,47.1666847],[36.9072964,47.1668647],[36.9072331,47.1670056],[36.9073305,47.1672627],[36.9073164,47.1676585],[36.9070563,47.1680402],[36.9068445,47.1681978],[36.905641,47.1686863],[36.9047681,47.1688723],[36.9043137,47.169105],[36.9041548,47.1691519],[36.9039539,47.1692183],[36.9037591,47.1692299],[36.9034486,47.1693266],[36.9030209,47.1694705],[36.9026346,47.1697166],[36.9024352,47.1700555],[36.9024077,47.1702006],[36.9024472,47.1703793],[36.9026153,47.1708216],[36.9026222,47.1710751],[36.9026222,47.1713041],[36.9023846,47.1715501],[36.9021715,47.1715393],[36.9019697,47.1715353],[36.9015533,47.1715321],[36.9013727,47.1716123],[36.9011725,47.1718226],[36.9011825,47.1720843],[36.9011848,47.1722459],[36.9007972,47.1726066],[36.9005637,47.1729078],[36.9004363,47.1732557],[36.9001958,47.1735257],[36.8998394,47.1737423],[36.899598,47.1738645],[36.8989616,47.1738638],[36.8986661,47.1737733],[36.8981617,47.1732766],[36.8980064,47.1731993],[36.8966323,47.1728122],[36.8957574,47.1726326],[36.8952131,47.172428],[36.8949305,47.1723089],[36.8941901,47.171937],[36.893791,47.1717294],[36.8932968,47.1714977],[36.8927029,47.1712854],[36.8918196,47.1710735],[36.8913595,47.1708821],[36.8906064,47.1707192],[36.890268,47.170768],[36.8900292,47.1707209],[36.8897919,47.1706161],[36.8893667,47.17066],[36.8889365,47.1706803],[36.8886532,47.1707681],[36.8884834,47.1708321],[36.8883634,47.1709732],[36.8883738,47.1712623],[36.888456,47.1714873],[36.8886272,47.1717753],[36.8886195,47.1719838],[36.8883652,47.172196],[36.8878403,47.1724119],[36.8870156,47.1724728],[36.88657,47.1725424],[36.8862896,47.1726575],[36.8862623,47.1728796],[36.8864277,47.1735583],[36.886812,47.1744466],[36.8868984,47.1746873],[36.887021,47.1755207],[36.8868956,47.176089],[36.8864357,47.1766744],[36.8856915,47.1770989],[36.8852903,47.1771699],[36.8847893,47.1771114],[36.8842102,47.1767992],[36.8829663,47.1764032],[36.8829293,47.1760346],[36.882971,47.1756777],[36.8825547,47.1755108],[36.8823045,47.175331],[36.8821467,47.1751098],[36.8819104,47.174757],[36.8814708,47.1746458],[36.8810419,47.1747124],[36.8804292,47.1749611],[36.8796636,47.175305],[36.8789333,47.1755742],[36.878484,47.1758409],[36.8782821,47.1760243],[36.8780637,47.1763199],[36.8778917,47.1765572],[36.8777155,47.1767401],[36.8775763,47.176965],[36.8775386,47.1772602],[36.8775208,47.1777565],[36.8776238,47.1780353],[36.8776075,47.1782003],[36.8775103,47.1783414],[36.8769002,47.1789884],[36.8769608,47.1799277],[36.8769382,47.1802502],[36.8767927,47.1804115],[36.8764526,47.1806169],[36.8760587,47.1811267],[36.8758807,47.1812586],[36.8754921,47.1814272],[36.874661,47.1815761],[36.8736631,47.1816034],[36.873382,47.181754],[36.8731178,47.182194],[36.8729078,47.1823515],[36.872233,47.1827147],[36.8720548,47.1827696],[36.8720334,47.1830559],[36.8720982,47.18332],[36.872071,47.1834849],[36.8719469,47.1836497],[36.8715212,47.1838913],[36.8706195,47.1841116],[36.8703443,47.18439],[36.8690065,47.1845731],[36.8679113,47.1847969],[36.8674798,47.1850131],[36.8656715,47.1849694],[36.8644035,47.1854937],[36.8639935,47.1857474],[36.8637558,47.1862538],[36.8638155,47.1867159],[36.8638142,47.1869178],[36.8637451,47.1872031],[36.8635718,47.1874891],[36.8632654,47.1877095],[36.8630712,47.1877828],[36.8626287,47.1881275],[36.8612798,47.1886776],[36.8602222,47.1888829],[36.8596125,47.1891174],[36.8591538,47.1894476],[36.8590567,47.189587],[36.8590782,47.189895],[36.8595639,47.1905917],[36.859661,47.191061],[36.8600759,47.1914936],[36.8601719,47.1917841],[36.8599735,47.1920657],[36.8600279,47.1923444],[36.8600652,47.1925713],[36.859898,47.192714],[36.8594986,47.1927214],[36.8589707,47.1926623],[36.8585982,47.1924943],[36.8580846,47.1923548],[36.8578904,47.1924098],[36.8577393,47.1925744],[36.8575724,47.1928978],[36.8574845,47.1931501],[36.8571993,47.1933949],[36.856859,47.1937361],[36.8564877,47.1939893],[36.8560937,47.1943227],[36.8560242,47.1946397],[36.8561537,47.1947717],[36.8565422,47.1949697],[36.8564873,47.1953913],[36.8563479,47.1958496],[36.8564451,47.1961356],[36.8563695,47.1964289],[36.8564235,47.1965829],[36.8572976,47.1970816],[36.8574479,47.1972579],[36.8574536,47.1974774],[36.8573839,47.197748],[36.857307,47.1979316],[36.8565654,47.1980578],[36.8549978,47.198983],[36.8547708,47.1991557],[36.856184,47.1991947],[36.8798239,47.1996538],[36.884915,47.2000093],[36.8903099,47.2000049],[36.8917618,47.2000037],[36.894083,47.2059071],[36.9017112,47.2060365],[36.9068593,47.206109],[36.9188354,47.2066205],[36.9201899,47.2066357],[36.9223424,47.2066754],[36.9308514,47.2069799],[36.9313312,47.2005647],[36.9328741,47.2006168],[36.9346342,47.2006954],[36.9625814,47.2016615],[36.9624318,47.2019829],[36.9605798,47.2096481],[36.9556994,47.2290267],[36.9491667,47.2283417],[36.9418844,47.2572616],[36.9378289,47.2777421],[36.9363786,47.2871212],[36.9354363,47.2906524],[36.9348674,47.2933292],[36.9348231,47.2933866],[36.934741,47.293757],[36.9288206,47.3079159],[36.9283564,47.3093295],[36.9273424,47.3135952],[36.9260221,47.3194161],[36.9442269,47.3206358],[36.9466004,47.3109951],[36.9527559,47.3112833],[36.9536707,47.311327],[36.9600457,47.3116311],[36.9606634,47.3116606],[36.9673495,47.3121107],[36.9710227,47.312056],[37.0005569,47.3135596],[37.0264564,47.3147836],[37.0269136,47.3139975],[37.0272837,47.3137151],[37.0274332,47.313299],[37.0275984,47.3130483],[37.027504,47.3128296],[37.02774,47.3124455],[37.02774,47.3119814],[37.0278895,47.31172],[37.028157,47.3114639],[37.0285343,47.3113199],[37.0289124,47.3108184],[37.0301083,47.3101782],[37.0309817,47.3098368],[37.0318238,47.3096793],[37.0321304,47.3090846],[37.0322011,47.3087407],[37.032516,47.3086418],[37.0331454,47.3088819],[37.0336411,47.3091486],[37.0338565,47.3091224],[37.0339637,47.3090152],[37.0338614,47.3085724],[37.0339952,47.3081616],[37.0342627,47.3077989],[37.034601,47.3074841],[37.0347269,47.3073454],[37.0346167,47.3071907],[37.0345695,47.3069079],[37.0342784,47.3067425],[37.0343178,47.3065824],[37.0348213,47.3064117],[37.0350574,47.3058462],[37.0355544,47.305556],[37.0355058,47.3052006],[37.0353013,47.3049925],[37.035616,47.3046938],[37.0357419,47.3042563],[37.0358914,47.3040589],[37.0358442,47.3034826],[37.0356632,47.3029117],[37.0357088,47.3026367],[37.0355678,47.3023983],[37.0353885,47.3023175],[37.0353579,47.3022119],[37.0354525,47.3021062],[37.0353757,47.3020282],[37.0351882,47.3020308],[37.0350409,47.3019652],[37.035081,47.3017699],[37.0352226,47.3015832],[37.0348528,47.3013431],[37.0347584,47.301167],[37.0349236,47.3010016],[37.0352619,47.3005107],[37.0354114,47.3003826],[37.0358127,47.300356],[37.0361326,47.3002275],[37.0361269,47.2999843],[37.0364201,47.3000354],[37.0386287,47.300859],[37.0482369,47.3041653],[37.062753,47.3090178],[37.0647084,47.3095485],[37.0671078,47.3101461],[37.0837011,47.3147193],[37.0829439,47.3152225],[37.0819427,47.3155578],[37.0814141,47.3157459],[37.0811948,47.3159889],[37.0814392,47.3164507],[37.0812409,47.3169086],[37.0806104,47.3173037],[37.0805198,47.3174272],[37.0805889,47.3175669],[37.0807245,47.3177069],[37.0810348,47.3177122],[37.0813956,47.3176746],[37.0820575,47.3175348],[37.0825883,47.3175266],[37.0828982,47.3176373],[37.0829645,47.3178164],[37.0829473,47.3179858],[37.0824818,47.3185368],[37.0823913,47.3189171],[37.0825641,47.3192687],[37.0828508,47.319443],[37.0834455,47.3196216],[37.0838685,47.3197438],[37.0841686,47.3199679],[37.0840198,47.3203613],[37.0836032,47.3208628],[37.0832461,47.3211559],[37.0831101,47.3214676],[37.0831618,47.3216847],[37.0831999,47.3217873],[37.0861027,47.3228074],[37.0906509,47.3243703],[37.0951442,47.3259678],[37.0922697,47.3300747],[37.1031681,47.3337367],[37.112646,47.3370137],[37.1221769,47.3403728],[37.1141104,47.3586183],[37.1144074,47.3584944],[37.1142166,47.3589345],[37.1139259,47.3590395],[37.1065777,47.3759042],[37.106553,47.3759571],[37.1175122,47.3773993],[37.1201747,47.3777446],[37.1206978,47.3778817],[37.13018,47.3790511],[37.146039,47.3811051],[37.1510941,47.3685436],[37.1556493,47.3570454],[37.1619798,47.341438],[37.2033079,47.3557271],[37.2034197,47.3557556],[37.1993667,47.3637536],[37.1990236,47.3645781],[37.1974001,47.3677809],[37.1967438,47.3688699],[37.1945741,47.3733558],[37.2049451,47.3907797],[37.2092361,47.3979873],[37.2116562,47.4020518],[37.2183576,47.4133052],[37.2183829,47.4136965],[37.2213922,47.4187324],[37.2274982,47.4294317],[37.2281408,47.4305928],[37.2291592,47.4323954],[37.2297737,47.4327321],[37.2300694,47.434196],[37.2308852,47.4351549],[37.2311698,47.4362462],[37.2320059,47.437834],[37.2341199,47.4372089],[37.2354013,47.436866],[37.2358533,47.4367517],[37.2361362,47.4367109],[37.2363558,47.4366996],[37.2364947,47.4367127],[37.2366309,47.4367616],[37.2367532,47.4368406],[37.2368199,47.4369458],[37.2374814,47.4380888],[37.2379511,47.4389046],[37.2383925,47.4397944],[37.238871,47.4406698],[37.2411893,47.4449172],[37.242502,47.4473868],[37.2437043,47.4497765],[37.2470878,47.4558253],[37.2475775,47.4564204],[37.248127,47.4564672],[37.2484158,47.4568245],[37.2486286,47.4572336],[37.2395517,47.4597266],[37.2447295,47.4684612],[37.2451667,47.4691811],[37.239603,47.4692817],[37.2395943,47.4685533],[37.2327917,47.4685216],[37.2289713,47.4685866],[37.2243228,47.4686657],[37.2216848,47.4688652],[37.2212173,47.4694371],[37.2136118,47.4694975],[37.213594,47.4687865],[37.2114777,47.4688174],[37.2116918,47.4666616],[37.2109086,47.4666809],[37.2096378,47.4667573],[37.208277,47.4669215],[37.207235,47.4679243],[37.2067405,47.4687179],[37.1979815,47.4688331],[37.189947,47.4691507],[37.1901228,47.471119],[37.1904348,47.471769],[37.191461,47.4728614],[37.1941666,47.47628],[37.1952721,47.4779508],[37.1959706,47.4789319],[37.1930834,47.4796778],[37.1926777,47.4798409],[37.1797983,47.4836571],[37.1707925,47.4718882],[37.1707635,47.4718503],[37.1702945,47.4712443],[37.1696334,47.4699219],[37.1645372,47.4637859],[37.1577018,47.4548597],[37.1544453,47.4561324],[37.153354,47.4566261],[37.1524705,47.4569619],[37.1518143,47.4574761],[37.129411,47.4679979],[37.1288798,47.4677276],[37.1274007,47.4687108],[37.1283469,47.4692768],[37.1290027,47.4695636],[37.1289017,47.46966],[37.0843387,47.4961072],[37.0782201,47.4917437],[37.0781031,47.4917492],[37.0759196,47.4926826],[37.0742173,47.4936995],[37.0730776,47.4949737],[37.0572684,47.5129659],[37.0555685,47.5149002],[37.0516033,47.5194421],[37.050471,47.5208431],[37.0490817,47.5224424],[37.045543,47.5265159],[37.0420961,47.5304394],[37.0414485,47.5311765],[37.0373635,47.5358348],[37.0328173,47.5407974],[37.032706,47.541302],[37.0267938,47.5479658],[37.0242037,47.5501391],[37.0210271,47.5527976],[37.0190256,47.5514166],[37.0156831,47.5490362],[37.0015961,47.5388645],[36.9902848,47.5504181],[36.9864941,47.5543541],[36.9806234,47.5603625],[36.9800607,47.5607131],[36.9667558,47.553407],[36.9602148,47.560186],[36.9522612,47.568224],[36.9443387,47.5761317],[36.9249919,47.5641964],[36.9170274,47.5593508],[36.9143011,47.5578372],[36.9116974,47.5560707],[36.9069608,47.5532978],[36.901884,47.5501559],[36.8950943,47.5460045],[36.8934106,47.5449148],[36.8859714,47.5542992],[36.8826189,47.5586325],[36.8763357,47.5662609],[36.856689,47.5910139],[36.8551132,47.5930796],[36.8474636,47.6024006],[36.8435243,47.6073093],[36.8303171,47.6242291],[36.8239096,47.621941],[36.8213978,47.62102],[36.8024765,47.6142619],[36.7863391,47.6085972],[36.7684795,47.6021973],[36.7646269,47.600787],[36.7633995,47.6005315],[36.7631436,47.6005689],[36.7621163,47.6031478],[36.7649174,47.6077703],[36.7566136,47.6073163],[36.7481032,47.6065962],[36.7470393,47.612351],[36.7452576,47.6217404],[36.7522927,47.6223024],[36.7537918,47.6223773],[36.758229,47.6229201],[36.7662122,47.623444],[36.7661375,47.6253042],[36.7659542,47.625823],[36.7653141,47.626392],[36.7650928,47.6296892],[36.7655999,47.6313398],[36.7659148,47.6329189],[36.765849,47.6341133],[36.7601377,47.6339007],[36.7547505,47.633434],[36.7455247,47.6326569],[36.7402158,47.6322282],[36.7320266,47.6315897],[36.725195,47.6310934],[36.720036,47.6523132],[36.7190819,47.6556136],[36.7182719,47.6588466],[36.7455561,47.6608499],[36.7500269,47.6613304],[36.7548069,47.6619953],[36.7544358,47.6644869],[36.752336,47.6641601],[36.7521133,47.6656551],[36.7534448,47.6668305],[36.7567157,47.6670708],[36.7603388,47.6673701],[36.7675046,47.6678716],[36.7689401,47.6679185],[36.7686128,47.666829],[36.7688682,47.6662988],[36.7703778,47.6659284],[36.7721754,47.6654112],[36.7733124,47.6651858],[36.7747236,47.665137],[36.7756078,47.665554],[36.7760591,47.6662101],[36.7755688,47.6671335],[36.7743325,47.6690324],[36.7745633,47.66957],[36.7750074,47.6697309],[36.7755972,47.6697804],[36.7759714,47.6695973],[36.7767095,47.668812],[36.7776752,47.6679739],[36.7782184,47.6677941],[36.7786899,47.6679746],[36.7793528,47.668292],[36.7790051,47.6691801],[36.7788401,47.6697481],[36.7794065,47.6703493],[36.7804332,47.6707309],[36.7814599,47.6711125],[36.7816458,47.6713826],[36.7816666,47.6722207],[36.7822057,47.6728023],[36.7831504,47.6731252],[36.7842143,47.6732981],[36.7845168,47.6734753],[36.784479,47.673703],[36.7843889,47.6738346],[36.7840331,47.6742465],[36.7829757,47.6745878],[36.7805276,47.6751497],[36.7800825,47.6756742],[36.7807309,47.6770004],[36.7829455,47.6792899],[36.7842412,47.6799813],[36.7857221,47.6802954],[36.7875241,47.6803493],[36.7888352,47.6806792],[36.7895636,47.6807884],[36.790465,47.6808058],[36.7913455,47.6806514],[36.7919789,47.6810063],[36.7919226,47.6816716],[36.7902865,47.6836962],[36.7916444,47.6849218],[36.7894833,47.6846898],[36.7790277,47.6839166],[36.7760113,47.6835773],[36.7251084,47.6798182],[36.7133797,47.6788709],[36.71132,47.686456],[36.7079897,47.7005391],[36.7055993,47.7108199],[36.7015569,47.7262856],[36.699959,47.7324982],[36.685659,47.7308949],[36.6811075,47.747921],[36.6809186,47.7486897],[36.6786025,47.7581159],[36.6794049,47.7587709],[36.6801758,47.7594003],[36.6713057,47.7935819],[36.6680744,47.7931831],[36.6255846,47.7878374],[36.6233077,47.7874333],[36.6017072,47.7848894],[36.5960956,47.7842005],[36.5927318,47.7842363],[36.59114,47.7845628],[36.5902798,47.7846099],[36.5878379,47.7845698],[36.58765,47.7956371],[36.5877406,47.79978],[36.5885271,47.8165077],[36.59841,47.8173433],[36.5993301,47.8178481],[36.6033578,47.8282132],[36.6058873,47.8342989],[36.608341,47.8397404],[36.6083961,47.8408481],[36.6047014,47.8508377],[36.6021315,47.8502129],[36.5927039,47.8488017],[36.5847724,47.8473971],[36.5742481,47.8455585],[36.5397515,47.8396406],[36.5265247,47.83749],[36.5209169,47.8364524],[36.5228575,47.828813],[36.5142074,47.8280402],[36.5047351,47.8271238],[36.4985398,47.8265296],[36.4951805,47.8262074],[36.4919079,47.825832],[36.4895728,47.8255891],[36.4857411,47.8251806],[36.4759563,47.824198],[36.4695098,47.8239992],[36.4641652,47.8239992],[36.4589521,47.8240655],[36.4543147,47.8241427],[36.4490522,47.8240875],[36.4445891,47.824685],[36.4392087,47.8262701],[36.4367996,47.8267876],[36.4327523,47.8269817],[36.4295883,47.8275101],[36.4270186,47.8279845],[36.4229713,47.828653],[36.421847,47.8289118],[36.4206906,47.828556],[36.4179282,47.8279522],[36.4165758,47.8277704],[36.4147696,47.8276702],[36.4118732,47.8276503],[36.4083209,47.8285361],[36.404421,47.8298391],[36.4019798,47.8302165],[36.3977879,47.8308742],[36.3950887,47.830765],[36.3922951,47.8305938],[36.3903036,47.8305076],[36.3869801,47.8303046],[36.3837989,47.830141],[36.3821359,47.8300537],[36.3803708,47.8300134],[36.3767052,47.8299891],[36.3744194,47.837979],[36.3712394,47.8381623],[36.3672081,47.8383348],[36.3532513,47.8386797],[36.3492842,47.8387875],[36.3311516,47.8392942],[36.3250485,47.8394883],[36.324133,47.8394667],[36.3235709,47.8389492],[36.3234263,47.8381407],[36.3232818,47.8371597],[36.3231212,47.8355965],[36.3237391,47.835208],[36.32439,47.8347987],[36.3258836,47.8342704],[36.327024,47.8335804],[36.3277628,47.8324914],[36.3287264,47.8317152],[36.329947,47.8312623],[36.3305252,47.8306801],[36.3299952,47.8300871],[36.3291761,47.8285237],[36.3294652,47.8273268],[36.3303648,47.8270503],[36.3320194,47.8267735],[36.3324905,47.8260404],[36.331784,47.825009],[36.3313604,47.8248036],[36.3303452,47.8241494],[36.3296946,47.8236929],[36.3297451,47.8227403],[36.3305466,47.8218525],[36.3326449,47.820649],[36.3195717,47.8188509],[36.3084577,47.8173195],[36.2985963,47.8159282],[36.2981948,47.8177401],[36.2855549,47.8165861],[36.2754525,47.8153599],[36.274992,47.8172764],[36.2738145,47.8233586],[36.2661856,47.833203],[36.2516506,47.8330844],[36.2355255,47.8328688],[36.219818,47.8327071],[36.206929,47.8326928],[36.2055721,47.8328149],[36.1975738,47.8325454],[36.1979914,47.8329658],[36.1978468,47.8333863],[36.196612,47.8341381],[36.1955768,47.8343276],[36.1947455,47.8346856],[36.1943847,47.8357385],[36.1942278,47.8364124],[36.1939141,47.8374968],[36.1931612,47.8381075],[36.192323,47.838154],[36.191624,47.8380443],[36.1914201,47.8377074],[36.1908711,47.8367493],[36.1902423,47.8365901],[36.1895222,47.8370862],[36.1886782,47.838191],[36.188326,47.8408525],[36.1882444,47.8415243],[36.1895259,47.8426056],[36.1921562,47.8452794],[36.194395,47.8489805],[36.1961035,47.8533922],[36.1967301,47.8557836],[36.1969953,47.8562697],[36.1974,47.8569064],[36.1973536,47.8581244],[36.19725,47.8588026],[36.1972104,47.8590618],[36.1958241,47.8594481],[36.1947366,47.858948],[36.1938011,47.8588535],[36.1932668,47.8593823],[36.1771939,47.8571957],[36.1786365,47.8515139],[36.1787749,47.8506565],[36.1692779,47.8497358],[36.1662856,47.8493586],[36.1520848,47.8479142],[36.1437596,47.84699],[36.1359187,47.8461774],[36.1324528,47.845806],[36.130346,47.8455521],[36.1238454,47.8448449],[36.1198904,47.8442058],[36.1162181,47.8441875],[36.1016634,47.8425887],[36.1005591,47.847721],[36.1002183,47.848513],[36.0984882,47.8494213],[36.0958889,47.8500811],[36.0934268,47.849989],[36.0911283,47.849668],[36.0885708,47.8497352],[36.0843148,47.8491808],[36.0798725,47.8488001],[36.0741986,47.8487683],[36.0736508,47.8488326],[36.0730225,47.8519231],[36.0700214,47.8628284],[36.0685622,47.8674888],[36.0575194,47.8682955],[36.0540611,47.8800013],[36.0791369,47.8832727],[36.0807874,47.8832195],[36.0818675,47.8794806],[36.0862085,47.8644442],[36.0872019,47.8612274],[36.0941608,47.8620063],[36.1001351,47.8627078],[36.105349,47.863335],[36.1117232,47.864053],[36.1192273,47.8647615],[36.1185609,47.8677662],[36.1171181,47.8680493],[36.1169226,47.8709357],[36.1202486,47.8770308],[36.1215096,47.8771036],[36.1257352,47.8839061],[36.129598,47.8896133],[36.1301856,47.8903331],[36.1224771,47.90019],[36.1277127,47.9019169],[36.1186562,47.9134557],[36.1103646,47.924578],[36.1197291,47.9278626],[36.1178316,47.9301419],[36.109366,47.941108],[36.1087035,47.9417691],[36.1020638,47.9387748],[36.0850119,47.9303057],[36.0841919,47.9321813],[36.0803533,47.9441304],[36.0791396,47.9485724],[36.0754272,47.9596287],[36.0735698,47.9652124],[36.061698,47.961598],[36.051624,47.9585709],[36.0496203,47.9625593],[36.0479461,47.9655214],[36.0482048,47.965813],[36.0487085,47.9659762],[36.0677132,47.9711546],[36.0681723,47.9704972],[36.0692476,47.9710896],[36.0707449,47.9715179],[36.0702649,47.9731819],[36.0678858,47.9783299],[36.0661957,47.9820963],[36.0645087,47.99028],[36.0623614,47.9989138],[36.0619976,48.0010325],[36.0585826,48.00156],[36.04632,48.0032653],[36.0443528,48.0034024],[36.0432372,48.0036282],[36.0416478,48.0039192],[36.0344335,48.0187162],[36.0426119,48.0203979],[36.0514036,48.0221868],[36.0655311,48.0251985],[36.0636741,48.0296205],[36.0579011,48.0418955],[36.0560879,48.0460971],[36.0582208,48.0465397],[36.0567288,48.0498973],[36.0540873,48.0555787],[36.0527131,48.0586034],[36.0524844,48.0590719],[36.042596,48.0569238],[36.0314167,48.0546532],[36.013238,48.0509294],[36.0086358,48.0499751],[35.9984882,48.0478152],[35.9940179,48.0469016],[35.9916773,48.0463368],[35.9898987,48.0459274],[35.988356,48.0456338],[35.9783609,48.0437268],[35.9764075,48.0433068],[35.9752911,48.043179],[35.9762325,48.0453249],[35.9761249,48.0459482],[35.9761339,48.0464577],[35.9762415,48.0469912],[35.9764656,48.0474167],[35.9767346,48.0477763],[35.9769856,48.0481839],[35.9772815,48.0490829],[35.977389,48.0495924],[35.977407,48.049958],[35.9775504,48.0506352],[35.9777118,48.0510727],[35.9779628,48.0515222],[35.9783484,48.0519237],[35.9791463,48.0524751],[35.9795408,48.0526968],[35.9797829,48.0529665],[35.9799532,48.0532902],[35.9801146,48.0537097],[35.9807332,48.0543629],[35.981056,48.0545846],[35.9818988,48.0552378],[35.9820243,48.0555195],[35.9821319,48.0560828],[35.9823381,48.0564424],[35.982607,48.0567899],[35.982876,48.0569457],[35.9832974,48.0571015],[35.9847229,48.0571615],[35.9856822,48.0571555],[35.9873588,48.0569637],[35.9879416,48.0570536],[35.9883092,48.0572633],[35.9885154,48.057557],[35.9885781,48.0579105],[35.9885154,48.058354],[35.9882643,48.0589292],[35.9878161,48.0592888],[35.9870181,48.0596783],[35.9852399,48.0604513],[35.9846503,48.0610954],[35.9841622,48.0615021],[35.982964,48.0623622],[35.9824378,48.0625995],[35.9816961,48.0630401],[35.9812079,48.0632986],[35.9806564,48.0634002],[35.9800921,48.0634299],[35.9797561,48.0633918],[35.9791919,48.063252],[35.9788686,48.063163],[35.9782473,48.0628749],[35.9779874,48.0627223],[35.9777084,48.0624385],[35.9766307,48.0608496],[35.9763581,48.0605911],[35.9760284,48.0600361],[35.9758129,48.0597734],[35.9755086,48.0595742],[35.9751852,48.0594259],[35.9748492,48.0593242],[35.9744055,48.0592776],[35.9740251,48.0592692],[35.9735877,48.0593115],[35.9727191,48.0595658],[35.9720218,48.0599386],[35.9717555,48.0602183],[35.9715716,48.0607225],[35.9715146,48.0609767],[35.97154,48.0612182],[35.9716403,48.0615117],[35.9723037,48.0622667],[35.9725727,48.0626502],[35.9727699,48.0631415],[35.9729615,48.063932],[35.9733796,48.0644717],[35.9735948,48.0648551],[35.9739366,48.0652081],[35.9741865,48.0658977],[35.9742044,48.0665088],[35.9737741,48.0673955],[35.9727161,48.068438],[35.9716403,48.069792],[35.9713892,48.0700197],[35.9711741,48.0702952],[35.9710485,48.0705469],[35.9709589,48.0708704],[35.9708154,48.0710741],[35.9707258,48.0712778],[35.9705465,48.0714934],[35.9702954,48.0717211],[35.9699727,48.0718768],[35.9697754,48.0720326],[35.9695961,48.0722602],[35.9693989,48.0725478],[35.9694347,48.0727515],[35.9694347,48.0731229],[35.9696499,48.0737459],[35.9699547,48.0740934],[35.9705644,48.0744289],[35.9713534,48.0747284],[35.9734334,48.0754233],[35.9739534,48.0757108],[35.9746706,48.0761541],[35.9754776,48.076825],[35.976141,48.077424],[35.9770196,48.0779751],[35.9779162,48.0780949],[35.9794045,48.078047],[35.9809466,48.0778074],[35.9822018,48.0776516],[35.9828473,48.0776756],[35.983439,48.0778433],[35.9839606,48.0781564],[35.984398,48.0789908],[35.9846262,48.0806003],[35.9845248,48.0821039],[35.9846199,48.0832643],[35.9847403,48.0835566],[35.9848354,48.0836963],[35.9854123,48.0842892],[35.9854821,48.084501],[35.985463,48.0846407],[35.9854313,48.0847805],[35.9850003,48.0853692],[35.9849559,48.0856699],[35.9848227,48.0860002],[35.9846643,48.0862458],[35.984379,48.0864576],[35.9840366,48.0866397],[35.9831871,48.0867794],[35.9815705,48.0866608],[35.9800236,48.086483],[35.9786352,48.0862712],[35.9778681,48.0861018],[35.9773229,48.0860425],[35.9768094,48.0860849],[35.9760994,48.0863475],[35.9755415,48.0867244],[35.975402,48.0868345],[35.9749836,48.0871394],[35.9748758,48.087258],[35.9747998,48.0873935],[35.974749,48.0876814],[35.974711,48.0883294],[35.975085,48.0889561],[35.9754718,48.0893923],[35.9755986,48.0895998],[35.9758141,48.0900783],[35.9759282,48.0904552],[35.9759409,48.0908871],[35.9758902,48.0914376],[35.9758331,48.0916451],[35.9756176,48.0920431],[35.975402,48.0922845],[35.9749963,48.0925132],[35.9746983,48.0925852],[35.9742292,48.0926444],[35.973665,48.0926741],[35.9731705,48.0927799],[35.9726506,48.0928646],[35.9722481,48.092959],[35.9716236,48.0930975],[35.9715285,48.0931229],[35.9713136,48.0931366],[35.9711481,48.0931695],[35.9706727,48.0934405],[35.9702669,48.0937623],[35.9699373,48.0939317],[35.9695696,48.0940502],[35.968644,48.0944313],[35.9680354,48.0945838],[35.9674014,48.0946854],[35.9668645,48.0947806],[35.9665982,48.0947947],[35.9640097,48.0938695],[35.96242,48.0933562],[35.9598436,48.0925883],[35.9537081,48.0909673],[35.9476033,48.0892634],[35.9388113,48.0870631],[35.9331894,48.0854253],[35.9267007,48.0837708],[35.920633,48.0820667],[35.9100684,48.08025],[35.8972043,48.0784266],[35.8853413,48.0766064],[35.877961,48.0755557],[35.8678441,48.0739092],[35.8563526,48.0720723],[35.8494429,48.0710215],[35.8278345,48.0677778],[35.8232899,48.0671654],[35.8168631,48.0661227],[35.8150181,48.0726019],[35.8087151,48.0928118],[35.8071672,48.0980801],[35.8059059,48.1004255],[35.8008642,48.0984853],[35.7947346,48.0963351],[35.7899919,48.0952434],[35.7862275,48.094805],[35.7831565,48.0941682],[35.7805561,48.0948712],[35.7761836,48.0967181],[35.7728786,48.0969967],[35.7663775,48.0975012],[35.7615357,48.0978568],[35.7581551,48.0986094],[35.7560005,48.098353],[35.7565701,48.0964426],[35.7447195,48.0959877],[35.7428249,48.0957479],[35.7288723,48.1118403],[35.7179792,48.1236802],[35.7078413,48.1352679],[35.7034121,48.1402147],[35.7027979,48.1401753],[35.6989239,48.1381181],[35.6957585,48.1363682],[35.6913293,48.1347917],[35.6880217,48.1334533],[35.6805811,48.1305586],[35.6568169,48.1218391],[35.6508286,48.119655],[35.6423715,48.1165623],[35.6361237,48.114293],[35.612773,48.1056495],[35.5999106,48.1008934],[35.5930955,48.0983456],[35.582311,48.0943712],[35.5708432,48.090228],[35.5633538,48.0875108],[35.5535398,48.0839004],[35.5241386,48.0746014],[35.5235388,48.0768021],[35.5214984,48.0846767],[35.5193386,48.0927432],[35.5193406,48.0932292],[35.5194175,48.0944868],[35.5193337,48.0945381],[35.5188575,48.0948609],[35.5176153,48.0950143],[35.5160904,48.09549],[35.5151219,48.0955095],[35.5149623,48.0956207],[35.514657,48.096098],[35.514324,48.0961907],[35.5138095,48.0959014],[35.5130682,48.0959775],[35.5123883,48.0963853],[35.511632,48.0966772],[35.5107409,48.096848],[35.5104942,48.0968394],[35.5098212,48.0970711],[35.509169,48.0970989],[35.5086556,48.0971823],[35.5083087,48.0973769],[35.5082948,48.097655],[35.5079687,48.0977291],[35.5076495,48.0976411],[35.5074345,48.0976179],[35.5070598,48.097363],[35.5068975,48.0971315],[35.5066601,48.0972675],[35.5063426,48.0969492],[35.5051303,48.0966124],[35.5039501,48.0964189],[35.5031991,48.0963974],[35.5013645,48.0968273],[35.5008119,48.0968954],[35.499907,48.0968858],[35.4993528,48.0967306],[35.4991114,48.0965515],[35.4984999,48.0964619],[35.4978239,48.0964296],[35.4969134,48.0961527],[35.4964542,48.0966451],[35.4955983,48.0963936],[35.4952866,48.0960929],[35.4948512,48.0960007],[35.4932166,48.0964274],[35.4914431,48.0964549],[35.4908107,48.0962637],[35.4904726,48.0959376],[35.4900213,48.0958328],[35.4889764,48.0958825],[35.4880393,48.0954723],[35.4871673,48.0952464],[35.4868189,48.0952119],[35.4864789,48.0952211],[35.4860974,48.0950497],[35.4856094,48.0949666],[35.4852847,48.0951155],[35.4845224,48.0952582],[35.484009,48.095235],[35.4835738,48.0953151],[35.4823439,48.0962267],[35.4823508,48.0963286],[35.4822675,48.0963796],[35.481879,48.096185],[35.4818167,48.0959618],[35.4816431,48.0959023],[35.4815252,48.0959672],[35.481539,48.0960321],[35.4816778,48.0960738],[35.4815269,48.0967125],[35.4810742,48.0969403],[35.4809215,48.0971859],[35.4806579,48.0974037],[35.4802694,48.0974037],[35.4800265,48.0971905],[35.479971,48.0969403],[35.4798461,48.096741],[35.4795988,48.096702],[35.4794053,48.0967819],[35.4794253,48.0970952],[35.4792196,48.0974704],[35.4792275,48.0976234],[35.4793524,48.0978041],[35.4793767,48.0979686],[35.4792211,48.0981076],[35.4786968,48.0981864],[35.477787,48.0981731],[35.4765657,48.097912],[35.4758903,48.0978713],[35.475123,48.0976127],[35.4748392,48.0976141],[35.4744756,48.0976521],[35.4740621,48.0978041],[35.4739511,48.0979362],[35.4738713,48.0983161],[35.4738299,48.0986113],[35.4737064,48.0987723],[35.4732501,48.0988378],[35.4729067,48.0987788],[35.4724966,48.0989167],[35.4719647,48.0990999],[35.4713858,48.0992047],[35.4709002,48.099457],[35.470596,48.0995553],[35.4702835,48.0994992],[35.4697346,48.0996421],[35.4687147,48.100175],[35.4681596,48.1002398],[35.4675975,48.1001749],[35.4663141,48.1007541],[35.4658978,48.1007032],[35.4652149,48.1005453],[35.4647709,48.100624],[35.4644795,48.1006379],[35.4641812,48.1005221],[35.4636539,48.1005962],[35.4632861,48.1006935],[35.4628629,48.1008928],[35.4626062,48.1010874],[35.4624952,48.1013469],[35.4624813,48.1014905],[35.4622801,48.1017036],[35.4620026,48.1017175],[35.4617667,48.1016063],[35.4613712,48.1014395],[35.461066,48.1014395],[35.4607329,48.1014488],[35.4605803,48.1015383],[35.4603056,48.1018069],[35.4597851,48.1020117],[35.4580637,48.1017381],[35.4570985,48.1017255],[35.456252,48.1019479],[35.4558288,48.1021193],[35.4555121,48.1023095],[35.450308,48.1030538],[35.4496851,48.1030923],[35.4443707,48.1041223],[35.44499,48.1021667],[35.4385883,48.101698],[35.4338358,48.1013206],[35.4288871,48.1008044],[35.4212624,48.1001881],[35.4205126,48.1045867],[35.4177326,48.1080837],[35.4162676,48.1096858],[35.4120919,48.1107178],[35.4106269,48.1108257],[35.4096972,48.1110064],[35.4091619,48.110895],[35.4085752,48.1110427],[35.4077518,48.1113571],[35.4067266,48.1112067],[35.4060379,48.1114987],[35.4055888,48.1116956],[35.4046762,48.111658],[35.4034032,48.1124328],[35.4026822,48.113215],[35.4029976,48.1138844],[35.4026397,48.1143554],[35.4017105,48.1146833],[35.4009225,48.1145158],[35.4003116,48.1141039],[35.3993158,48.1138585],[35.3985204,48.1137978],[35.3977175,48.113844],[35.3971507,48.1140048],[35.3962607,48.1139897],[35.3956073,48.114238],[35.3947087,48.1141779],[35.3943568,48.1141477],[35.3938833,48.1145447],[35.3929998,48.114981],[35.3916869,48.1155918],[35.3904927,48.1162311],[35.3892018,48.1166823],[35.3885707,48.1170003],[35.3887247,48.117228],[35.3881085,48.1175072],[35.3872283,48.1175512],[35.3871623,48.1178083],[35.3869564,48.1182896],[35.3864194,48.1183441],[35.385842,48.1183225],[35.385523,48.1187412],[35.3847809,48.1188994],[35.3844997,48.1192333],[35.3837296,48.119483],[35.3830034,48.1200412],[35.3822332,48.1198135],[35.3817186,48.1192313],[35.381342,48.1189762],[35.3807919,48.1189468],[35.3807259,48.1184547],[35.3801207,48.1182858],[35.3789655,48.1183078],[35.3780303,48.1180874],[35.3775461,48.1183298],[35.377128,48.1188367],[35.3763249,48.1193508],[35.3759288,48.1191892],[35.3756317,48.1189321],[35.3751696,48.1187999],[35.3738383,48.1188587],[35.3724821,48.1189564],[35.3716058,48.1189834],[35.370967,48.1192289],[35.3700859,48.1195446],[35.3694519,48.1195302],[35.3691618,48.1192935],[35.3687642,48.1192433],[35.3683666,48.1195733],[35.3681302,48.1199176],[35.3681195,48.1204197],[35.3672599,48.1207282],[35.365691,48.1210151],[35.3647992,48.1209075],[35.3639718,48.1210868],[35.3626824,48.1210725],[35.3619087,48.1211586],[35.3609953,48.1211155],[35.3601572,48.1214813],[35.3581693,48.1218902],[35.3576213,48.12184],[35.357084,48.1217539],[35.3568584,48.1213666],[35.3564931,48.1208358],[35.3558376,48.1208429],[35.3556442,48.121137],[35.3556764,48.1214527],[35.3554508,48.1217467],[35.3550424,48.1217683],[35.3543762,48.1213737],[35.3538497,48.1212016],[35.3534199,48.1210797],[35.3530116,48.1212877],[35.3529015,48.1218534],[35.3526462,48.1223134],[35.3517973,48.122256],[35.3504416,48.1219538],[35.3498739,48.1220624],[35.3495301,48.1225501],[35.349154,48.123167],[35.3488316,48.1232029],[35.3485308,48.1230809],[35.3476926,48.1224784],[35.3470157,48.1225358],[35.3465321,48.1228729],[35.3461883,48.1232889],[35.3456295,48.123418],[35.3454683,48.1239703],[35.3449526,48.1240564],[35.3445765,48.1238986],[35.3442756,48.1234969],[35.3438351,48.123375],[35.3435342,48.1234396],[35.3435987,48.123791],[35.3436846,48.124164],[35.3436094,48.1243864],[35.3433623,48.1245442],[35.3430614,48.1245298],[35.3426961,48.1243146],[35.3426208,48.1241066],[35.3425349,48.123999],[35.3421378,48.123981],[35.3414926,48.1239345],[35.3397257,48.1234332],[35.3384996,48.1234298],[35.3376179,48.1238301],[35.3325656,48.1281313],[35.3259353,48.1306206],[35.3214002,48.1320851],[35.3150807,48.135258],[35.3033693,48.1416419],[35.2996008,48.1430346],[35.2950206,48.1443499],[35.2903244,48.1447368],[35.2842948,48.1449302],[35.278903,48.1446981],[35.273859,48.1441178],[35.2692208,48.143228],[35.2653943,48.1420287],[35.2627274,48.1408294],[35.2595386,48.1392045],[35.2577993,48.1378117],[35.2539868,48.1360893],[35.248679,48.1350796],[35.2418637,48.1346782],[35.2395945,48.1349098],[35.237129,48.1356568],[35.2325213,48.1379664],[35.2299703,48.1386628],[35.2266656,48.1396301],[35.2246364,48.1411389],[35.2219115,48.1424156],[35.2197084,48.1427251],[35.218085,48.1426864],[35.2159979,48.1422996],[35.2144905,48.1419514],[35.213041,48.1413711],[35.2113597,48.1405973],[35.2096784,48.140133],[35.195962,48.1403684],[35.1945477,48.1403684],[35.1938103,48.1396429],[35.1790221,48.1311071],[35.1706054,48.1301242],[35.1636852,48.1287625],[35.1545445,48.1285755],[35.1326179,48.130145],[35.1150587,48.1312322],[35.1026633,48.1317639],[35.1022035,48.1316889],[35.1017463,48.1316069],[35.101292,48.1315182],[35.1008408,48.1314226],[35.1003928,48.1313203],[35.0999485,48.1312113],[35.0995078,48.1310956],[35.0990712,48.1309733],[35.0986388,48.1308445],[35.0982108,48.1307093],[35.0977875,48.1305676],[35.097369,48.1304196],[35.0969556,48.1302654],[35.0965475,48.1301049],[35.0961449,48.1299384],[35.0957479,48.1297659],[35.0953568,48.1295875],[35.0949718,48.1294032],[35.0945931,48.1292132],[35.0942209,48.1290176],[35.0938553,48.1288164],[35.0934965,48.1286097],[35.0931448,48.1283978],[35.0928002,48.1281806],[35.0924631,48.1279582],[35.0921335,48.1277309],[35.0918115,48.1274987],[35.0914975,48.1272616],[35.0911915,48.12702],[35.0908936,48.1267738],[35.0906041,48.1265231],[35.0903231,48.1262682],[35.0900507,48.1260091],[35.089787,48.125746],[35.0895322,48.125479],[35.0892865,48.1252083],[35.0890498,48.1249339],[35.0886923,48.1247646],[35.0883289,48.1246009],[35.0879597,48.1244432],[35.0875851,48.1242913],[35.0872051,48.1241455],[35.0868201,48.1240058],[35.0864302,48.1238722],[35.0860357,48.1237449],[35.0856368,48.123624],[35.0852336,48.1235094],[35.0848266,48.1234013],[35.0844157,48.1232997],[35.0840014,48.1232047],[35.0835838,48.1231163],[35.0831633,48.1230346],[35.0827399,48.1229596],[35.082314,48.1228914],[35.0818857,48.12283],[35.0814554,48.1227755],[35.0810233,48.1227278],[35.0805896,48.122687],[35.0801546,48.1226532],[35.0797185,48.1226263],[35.0792816,48.1226064],[35.0788441,48.1225934],[35.0784063,48.1225874],[35.0779683,48.1225884],[35.0775306,48.1225964],[35.0770932,48.1226113],[35.0766565,48.1226332],[35.0762207,48.1226621],[35.075786,48.1226979],[35.0753528,48.1227407],[35.0739198,48.1227263],[35.072487,48.1227061],[35.0710545,48.12268],[35.0696222,48.1226479],[35.0681902,48.1226099],[35.0667586,48.1225661],[35.0653275,48.1225163],[35.064945,48.1224854],[35.0645638,48.1224476],[35.0641844,48.122403],[35.0638068,48.1223515],[35.0634315,48.1222932],[35.0630587,48.1222281],[35.0626886,48.1221564],[35.0623216,48.1220779],[35.0619578,48.1219929],[35.0615976,48.1219014],[35.0612412,48.1218033],[35.0608889,48.1216989],[35.0605409,48.1215882],[35.0601976,48.1214712],[35.059859,48.121348],[35.0595255,48.1212188],[35.0591974,48.1210836],[35.0588749,48.1209425],[35.0585581,48.1207957],[35.0582474,48.1206432],[35.0579429,48.1204851],[35.0576449,48.1203216],[35.0573536,48.1201528],[35.0570692,48.1199787],[35.0567919,48.1197996],[35.0565219,48.1196156],[35.0562595,48.1194267],[35.0560047,48.1192332],[35.0557579,48.1190352],[35.0555191,48.1188327],[35.0552885,48.1186261],[35.0550664,48.1184153],[35.0500593,48.1130795],[35.0446942,48.1081339],[35.0412909,48.1040834],[35.0400498,48.0997252],[35.0389152,48.0984461],[35.0360399,48.0980534],[35.0258146,48.0980012],[35.0240941,48.0973222],[35.0218261,48.0968782],[35.0200469,48.0970349],[35.0181309,48.0965649],[35.0146508,48.0947498],[35.010936,48.0948281],[35.0090591,48.0941621],[35.0060873,48.0941491],[35.0022357,48.0934047],[34.9963497,48.0918553],[34.9902585,48.0891896],[34.9894565,48.0899039],[34.9886343,48.0929427],[34.9871171,48.0952698],[34.9865542,48.0964592],[34.9855916,48.0966064],[34.974789,48.0954173],[34.9724021,48.0951184],[34.9591711,48.0936424],[34.9575953,48.093493],[34.9444016,48.0920855],[34.9394887,48.0915374],[34.9297378,48.0903267],[34.930067,48.0926344],[34.9233593,48.0919181],[34.9147229,48.0909369],[34.9126374,48.0979853],[34.911089,48.1016762],[34.9104044,48.1040582],[34.9110726,48.1042028],[34.9111924,48.1070498],[34.9116864,48.1136994],[34.9200639,48.1145847],[34.9189753,48.1188567],[34.9158128,48.1306035],[34.8924986,48.1283281],[34.881325,48.1271159],[34.8783006,48.1338285],[34.8618351,48.1333317],[34.8551126,48.133049],[34.8562335,48.1283378],[34.8584169,48.1192386],[34.8608543,48.1090253],[34.8633538,48.0996999],[34.8636281,48.0983994],[34.868918,48.0760218],[34.8705103,48.0708212],[34.8727711,48.0629669],[34.8742455,48.0587343],[34.8756638,48.0544638],[34.8663538,48.05345],[34.8530559,48.0520139],[34.8392142,48.0505126],[34.8393343,48.0485922],[34.8400392,48.0476185],[34.8403859,48.0463307],[34.8414107,48.0421487],[34.8430007,48.0352188],[34.8448704,48.0237884],[34.8451443,48.023039],[34.8465192,48.0136198],[34.854069,48.0145132],[34.8562938,48.0148533],[34.8583305,48.0151785],[34.8644652,48.0016255],[34.8657656,47.9963189],[34.8695389,47.9823938],[34.9048844,47.9857185],[34.9067713,47.978795],[34.9124961,47.9577887],[34.9092776,47.9573995],[34.9137254,47.9407079],[34.9190894,47.9334607],[34.8810268,47.9289083],[34.8764227,47.9419506],[34.855838,47.9387914],[34.8492,47.9377732],[34.8503846,47.9319483],[34.8516809,47.9209705],[34.8019738,47.915638],[34.8134814,47.8752223],[34.8171129,47.8643294],[34.819746,47.8651931],[34.8239578,47.8667068],[34.8262749,47.8677273],[34.828275,47.8686746],[34.8322312,47.8692901],[34.8376164,47.8698855],[34.8405196,47.8712376],[34.8443254,47.8732153],[34.8477099,47.875647],[34.8502521,47.8770898],[34.8530801,47.8781189],[34.8579538,47.8805503],[34.8593077,47.8803082],[34.860842,47.8805301],[34.862602,47.880066],[34.864016,47.8794002],[34.865399,47.8723923],[34.8706564,47.8513111],[34.8708044,47.8506261],[34.8736527,47.8502232],[34.8789109,47.8506352],[34.8972316,47.8528148],[34.8998855,47.8427867],[34.9033773,47.8295927],[34.8854683,47.8217813],[34.8834172,47.8208218],[34.8815006,47.8198171],[34.8788837,47.8184011],[34.8808225,47.8119385],[34.8821272,47.8063381],[34.8936183,47.7602236],[34.9574977,47.7695877],[34.9616434,47.7520701],[34.9649274,47.7402064],[34.9544831,47.7390806],[34.9575224,47.7275431],[34.9518559,47.7270494],[34.9560414,47.7123379],[34.9298855,47.7115927],[34.93566,47.68684],[34.93824,47.6774],[34.9057129,47.6738848],[34.9100782,47.6557513],[34.9120831,47.6488385],[34.9126625,47.6477399],[34.9130541,47.6463394],[34.91281,47.6461533],[34.9132204,47.6442342],[34.9138427,47.6409019],[34.9142503,47.6404681],[34.9161816,47.6337991],[34.9163019,47.6336869],[34.9330849,47.6356515],[34.9415869,47.6031554],[34.9420904,47.6010127],[34.9406072,47.6007447],[34.9382641,47.5984596],[34.9372093,47.5979805],[34.9387011,47.5946354],[34.9349677,47.5907823],[34.9341349,47.5905524],[34.9315867,47.5917907],[34.9317826,47.59334],[34.9307615,47.5928756],[34.9291905,47.5930508],[34.9278291,47.593491],[34.9269054,47.5942251],[34.9260817,47.5941248],[34.926197,47.5934047],[34.9290786,47.5898437],[34.9336661,47.5886992],[34.9344679,47.588259],[34.9359785,47.5824982],[34.927307,47.581429],[34.9275494,47.5803095],[34.9391114,47.5804856],[34.9406965,47.5793912],[34.9458807,47.5742459],[34.9368667,47.5701127],[34.9348819,47.5698883],[34.9347532,47.5697435],[34.9348596,47.5695404],[34.9350536,47.5690197],[34.9360299,47.5692441],[34.9362981,47.5691862],[34.936341,47.5690486],[34.9360084,47.5688604],[34.9359763,47.5685129],[34.9358153,47.5683537],[34.9360406,47.5683682],[34.9464775,47.5719058],[34.9490118,47.5721974],[34.9523485,47.5715749],[34.9531536,47.5711006],[34.9569205,47.5685842],[34.9583459,47.5662182],[34.9578094,47.5654364],[34.9593437,47.5631777],[34.9524879,47.5599632],[34.9286914,47.5577767],[34.9265456,47.5577187],[34.9237883,47.5570164],[34.9232089,47.5564082],[34.9237883,47.5561838],[34.924314,47.5561204],[34.9253734,47.5561657],[34.9260253,47.5563684],[34.9266261,47.5564698],[34.927125,47.5564734],[34.9282139,47.556658],[34.9290723,47.5567159],[34.9296355,47.556734],[34.9302953,47.5566508],[34.9307728,47.5567196],[34.9313468,47.5567739],[34.93213,47.5567485],[34.9324411,47.5567051],[34.9330527,47.5567268],[34.9335515,47.5567377],[34.9340612,47.556763],[34.9360728,47.5566182],[34.9370813,47.5567702],[34.9380147,47.5567775],[34.9407399,47.5573784],[34.9448705,47.5576681],[34.9521446,47.5579721],[34.9540329,47.558117],[34.9550843,47.5580083],[34.9556851,47.5580301],[34.9558353,47.5583559],[34.9567258,47.5588555],[34.9584639,47.5592826],[34.958539,47.5596736],[34.9590218,47.5598473],[34.9593437,47.5600935],[34.9601161,47.5604338],[34.9605024,47.5603614],[34.9610281,47.5607379],[34.9651948,47.5512876],[34.9655262,47.5499983],[34.965296,47.5478479],[34.9639633,47.545748],[34.9618757,47.5426098],[34.9580347,47.538279],[34.9553602,47.5359233],[34.9529607,47.5339938],[34.9468934,47.5310821],[34.9442431,47.5298823],[34.9417969,47.5286597],[34.9383309,47.5271275],[34.9370227,47.5268669],[34.9291978,47.524718],[34.9216945,47.5230513],[34.9105567,47.5206831],[34.8996211,47.5182247],[34.8837424,47.515941],[34.8762616,47.5150053],[34.8622727,47.5150718],[34.8614594,47.5151376],[34.8584972,47.5157208],[34.8518414,47.5176935],[34.8459471,47.5193602],[34.8404749,47.5210181],[34.8310109,47.5251488],[34.8198274,47.5296682],[34.8171027,47.5307827],[34.8151167,47.531448],[34.8034382,47.5350908],[34.7980114,47.5365817],[34.7963243,47.5370197],[34.795522,47.5369426],[34.7894266,47.5371232],[34.7859654,47.5378243],[34.7702295,47.5380579],[34.7612876,47.538227],[34.7453407,47.5385162],[34.7409562,47.5384007],[34.7355014,47.5389117],[34.7181584,47.543382],[34.7120257,47.5448663],[34.7078844,47.5456395],[34.6977518,47.5483059],[34.6845276,47.5517833],[34.6751133,47.5542368],[34.6696871,47.5556503],[34.6582367,47.5576207],[34.6504221,47.5589903],[34.6478197,47.5594151],[34.6449779,47.5597593],[34.6390645,47.5602482],[34.6328336,47.5607486],[34.6291523,47.5610366],[34.6233656,47.5612677],[34.6151171,47.5614995],[34.611017,47.5617471],[34.6015331,47.5621666],[34.5931898,47.5621333],[34.5883534,47.5623516],[34.5791092,47.561876],[34.5770773,47.5617974],[34.572379,47.5616158],[34.5584406,47.5592667],[34.5577255,47.5594056],[34.5373495,47.555447],[34.5311549,47.554277],[34.5280762,47.5536807],[34.5131654,47.5483601],[34.51009,47.5473594],[34.4984592,47.5435748],[34.4969674,47.5429155],[34.4934103,47.5409426],[34.4856213,47.5370889],[34.4780999,47.5342211],[34.4727335,47.5328663],[34.4688614,47.532118],[34.4662466,47.5318716],[34.460891,47.5314786],[34.4529195,47.5311286],[34.4397702,47.530772],[34.4327526,47.5306349],[34.4240417,47.5301679],[34.4128919,47.529055],[34.404913,47.5282588],[34.4005685,47.5277034],[34.3963558,47.5272484],[34.3919968,47.5268587],[34.3835719,47.5259478],[34.3768845,47.5252732],[34.3666424,47.52424],[34.3527277,47.5226283],[34.3457294,47.5218916],[34.3338538,47.5210746],[34.3139363,47.5198084],[34.3071131,47.5194811],[34.299975,47.5191405],[34.2964623,47.5179487],[34.2869901,47.5150357],[34.283128,47.5138291],[34.2761487,47.511732],[34.2727464,47.5104965],[34.2681162,47.508853],[34.2650485,47.5074168],[34.2599337,47.5049197],[34.2519668,47.5009472],[34.2416328,47.4971376],[34.2341536,47.4943982],[34.2191409,47.4907009],[34.2073873,47.4882571],[34.1926483,47.4858295],[34.1774538,47.4834046],[34.1660344,47.4815657],[34.1546552,47.4796797],[34.1394646,47.4772499]]]}');
INSERT INTO `b_location_area` (`ID`, `TYPE`, `CODE`, `SORT`, `GEOMETRY`) VALUES
(6, 'CUSTOM_FIELDS', 'KHERSON', 0, '{\"type\":\"Polygon\",\"coordinates\":[[[31.1590964,46.4096818],[31.1607233,46.4093543],[31.180176,46.4064141],[31.1998745,46.404396],[31.2197267,46.4033095],[31.2372722,46.4031776],[31.236497,46.4007389],[31.2335704,46.387153],[31.2319948,46.3734576],[31.2317777,46.3597165],[31.23292,46.3459937],[31.2354164,46.3323533],[31.2392554,46.318859],[31.2395833,46.3180155],[31.2388138,46.3113188],[31.2385967,46.2975621],[31.239739,46.2838237],[31.2422354,46.2701679],[31.2460744,46.2566582],[31.2512379,46.2433579],[31.2577019,46.2303292],[31.2654363,46.217633],[31.274405,46.2053287],[31.2845662,46.1934741],[31.2958725,46.1821246],[31.3082713,46.1713336],[31.3217046,46.1611517],[31.3361099,46.1516267],[31.3436306,46.1472926],[31.3531522,46.1377268],[31.3655509,46.1269271],[31.3789842,46.116737],[31.3933895,46.1072043],[31.4086996,46.0983739],[31.424843,46.0902872],[31.4417447,46.0829824],[31.4593257,46.0764938],[31.477504,46.0708518],[31.496195,46.0660832],[31.5153114,46.0622104],[31.5347642,46.0592515],[31.5367522,46.0590466],[31.5426659,46.0564893],[31.5602469,46.0499976],[31.5784253,46.0443529],[31.5971162,46.039582],[31.6162327,46.0357073],[31.6356855,46.0327471],[31.6553839,46.0307152],[31.6752361,46.0296213],[31.6802135,46.0295837],[31.6875293,46.0273112],[31.7062203,46.0225389],[31.7253367,46.018663],[31.7447895,46.0157018],[31.7644879,46.0136693],[31.7843402,46.0125751],[31.8036251,46.0124291],[31.8075438,46.0112115],[31.8262347,46.0064377],[31.8453512,46.0025607],[31.864804,45.9995986],[31.8845024,45.9975656],[31.8924887,45.9971252],[31.8931627,45.9968335],[31.9107437,45.9903347],[31.928922,45.984684],[31.947613,45.9799079],[31.9667294,45.976029],[31.9861822,45.9730656],[31.9985396,45.9717896],[32.0063582,45.9684033],[32.0239391,45.9619012],[32.0421175,45.9562475],[32.0608085,45.951469],[32.0799249,45.9475881],[32.0993777,45.9446232],[32.1190761,45.9425881],[32.1389283,45.9414924],[32.1429798,45.9414617],[32.1466812,45.9400922],[32.1648595,45.9344364],[32.1835505,45.929656],[32.202667,45.9257736],[32.2221197,45.9228074],[32.2418182,45.9207715],[32.2475868,45.9204531],[32.2572975,45.9162433],[32.2748785,45.9097351],[32.2930568,45.9040762],[32.3117478,45.8992931],[32.3308642,45.8954086],[32.350317,45.8924408],[32.3700154,45.8904038],[32.3774797,45.8899915],[32.3908015,45.8850577],[32.4089799,45.8793962],[32.4276708,45.8746111],[32.4467873,45.8707248],[32.4662401,45.8677558],[32.4859385,45.8657178],[32.5057907,45.8646207],[32.5257042,45.8644695],[32.5279336,45.8645587],[32.5412685,45.8604042],[32.5599595,45.8556175],[32.5790759,45.8517299],[32.5985287,45.8487598],[32.6182271,45.8467212],[32.6380794,45.8456236],[32.6579928,45.8454724],[32.6626395,45.8456584],[32.6762848,45.8414057],[32.6949758,45.8366173],[32.7140922,45.8327284],[32.733545,45.8297573],[32.7532434,45.827718],[32.7727018,45.8266419],[32.9687926,45.8740416],[33.1866939,45.926666],[33.365041,45.9696869],[33.5407189,46.0120312],[33.5911874,46.0612472],[33.5721329,46.1025643],[33.5870932,46.1191796],[33.6147111,46.1346624],[33.6177246,46.1355703],[33.6217764,46.1365957],[33.6260004,46.1376914],[33.6295717,46.1385784],[33.631517,46.1390915],[33.6335843,46.1396063],[33.6359637,46.1401744],[33.6390647,46.1410602],[33.6392197,46.1411584],[33.6412746,46.1424429],[33.6355706,46.1463365],[33.6346092,46.1502447],[33.6341296,46.1521069],[33.6338015,46.1535517],[33.6334472,46.1548],[33.6328134,46.1572939],[33.6323238,46.1583591],[33.6319634,46.1601928],[33.6314826,46.1621905],[33.6314242,46.1629792],[33.6302455,46.1672264],[33.6278789,46.1766789],[33.6257262,46.1850741],[33.6228068,46.1965212],[33.6211803,46.2028181],[33.6185932,46.213932],[33.6150527,46.2135905],[33.6139369,46.2135757],[33.6135506,46.2139172],[33.6136794,46.2146002],[33.6144948,46.2149269],[33.6169195,46.2156692],[33.6177993,46.215981],[33.6169704,46.2193759],[33.6152408,46.2262179],[33.6211467,46.227019],[33.6215544,46.2277761],[33.6218762,46.2278651],[33.6225092,46.2276425],[33.6227775,46.2272639],[33.6236185,46.2272453],[33.6327123,46.2283031],[33.6457706,46.2294882],[33.6467708,46.22958],[33.6472294,46.2292666],[33.6485218,46.2284188],[33.6502656,46.2275595],[33.6511883,46.2269212],[33.6521347,46.226451],[33.6537751,46.2257818],[33.6564553,46.2247667],[33.6589823,46.2238595],[33.66115,46.2230258],[33.6624485,46.2226375],[33.6661371,46.2207141],[33.670864,46.2117939],[33.6855494,46.2064204],[33.688379,46.2051418],[33.6892658,46.2047794],[33.6920343,46.2042914],[33.6926653,46.2043066],[33.6950875,46.2039111],[33.6969351,46.2036237],[33.697578,46.203496],[33.6995994,46.2028553],[33.7358354,46.1861025],[33.7375308,46.1857679],[33.7383776,46.1855339],[33.7393236,46.1855468],[33.7399776,46.1852474],[33.7421105,46.1858525],[33.7433776,46.1862918],[33.744864,46.1863319],[33.7503231,46.18772],[33.7585952,46.1920087],[33.7588712,46.1921329],[33.7590751,46.1922273],[33.7638209,46.1942696],[33.7726027,46.1976249],[33.7861366,46.2011624],[33.7968936,46.2030156],[33.7993946,46.2031445],[33.8008251,46.2032059],[33.8020548,46.203258],[33.8036814,46.2033716],[33.8055909,46.2034902],[33.8070519,46.2035299],[33.8083183,46.203621],[33.809404,46.2036704],[33.811324,46.203796],[33.8486859,46.1996667],[33.8503345,46.1989832],[33.8514113,46.1985658],[33.852113,46.1982797],[33.8541638,46.1974503],[33.8555535,46.1968829],[33.8578627,46.1959278],[33.86133,46.1945116],[33.8949373,46.1723074],[33.8973358,46.1706248],[33.9405553,46.1546515],[33.971714,46.1411991],[33.9847014,46.1347466],[33.9982336,46.1264504],[34.0361414,46.1143822],[34.036769,46.1141841],[34.0526389,46.1091293],[34.0548665,46.1096515],[34.056042,46.109912],[34.0584687,46.111175],[34.0595694,46.1118218],[34.0615821,46.1129028],[34.0652533,46.1147967],[34.0666209,46.1154267],[34.0685264,46.1162658],[34.0695052,46.1166994],[34.0735094,46.1175545],[34.0809285,46.117556],[34.1174996,46.1072692],[34.119065,46.1067468],[34.1206657,46.1061991],[34.1218931,46.1057194],[34.1231169,46.1050611],[34.1245601,46.1043435],[34.12641,46.1034362],[34.1280231,46.102492],[34.1290863,46.1017709],[34.1305099,46.1008571],[34.1314309,46.1002124],[34.1331129,46.0988854],[34.1342796,46.0979597],[34.1359107,46.0966617],[34.1369906,46.095512],[34.1385487,46.0939133],[34.1392912,46.0930847],[34.1412081,46.0909732],[34.1431131,46.0887904],[34.1450093,46.0866862],[34.1637908,46.077071],[34.1687448,46.0745337],[34.1704141,46.0738144],[34.1717876,46.0732648],[34.1738996,46.0720589],[34.1769643,46.0702242],[34.1779764,46.0695711],[34.178967,46.0691146],[34.1805652,46.0682828],[34.182466,46.0676145],[34.1843736,46.0668628],[34.1852585,46.0666632],[34.1860678,46.0665298],[34.1884103,46.0661306],[34.2337973,46.0559851],[34.2357889,46.055603],[34.2364427,46.0554816],[34.2396792,46.054811],[34.2414463,46.0544848],[34.2442333,46.0538975],[34.2457362,46.0536811],[34.2477875,46.0532232],[34.2486386,46.0532139],[34.2499409,46.0531996],[34.2521968,46.0531749],[34.2530594,46.0532226],[34.2542952,46.0534447],[34.2566092,46.0537192],[34.2589963,46.05405],[34.2608898,46.0543219],[34.2627631,46.0546083],[34.2648618,46.0548851],[34.320021,46.0682092],[34.3326403,46.0598467],[34.3339654,46.059498],[34.3362971,46.0589185],[34.3369087,46.058759],[34.3396228,46.0578798],[34.3410936,46.0573341],[34.3436892,46.0563657],[34.3471695,46.0549489],[34.4012603,46.0122311],[34.4015399,46.0120102],[34.4049875,46.0092864],[34.4076913,46.0054445],[34.410422,45.9999835],[34.4107666,45.9992636],[34.410487,45.9976721],[34.4106897,45.9959022],[34.4111429,45.9942481],[34.4119419,45.9924291],[34.4125184,45.9912616],[34.4131796,45.9897359],[34.4139921,45.9887856],[34.4154036,45.9872208],[34.4162779,45.9860198],[34.4174821,45.9847016],[34.4192284,45.9828827],[34.4202928,45.9817804],[34.4221824,45.9799002],[34.4233801,45.9786713],[34.4251728,45.9770124],[34.4270914,45.9752805],[34.428592,45.973887],[34.4304551,45.9723284],[34.4312683,45.9714255],[34.4322646,45.9706751],[34.4338273,45.9693879],[34.4355722,45.9678842],[34.4369402,45.9666649],[34.4389753,45.9651694],[34.4403694,45.9639735],[34.4416233,45.9629639],[34.4430184,45.9618096],[34.4447476,45.9607106],[34.4460883,45.9597653],[34.4469257,45.9591536],[34.4490532,45.957627],[34.4503944,45.9567054],[34.4523428,45.9555143],[34.4535508,45.9547253],[34.4552704,45.9536291],[34.459176,45.9512094],[34.4622229,45.9496634],[34.4630486,45.9492719],[34.4647646,45.9483454],[34.4663453,45.9474681],[34.4679004,45.9469126],[34.4710934,45.945717],[34.4732002,45.9450595],[34.4736267,45.9449296],[34.4739963,45.944817],[34.4762212,45.9441393],[34.4791726,45.9434941],[34.4814965,45.9429879],[34.4834521,45.9427483],[34.4839106,45.942671],[34.4858523,45.9425505],[34.4868901,45.9424418],[34.4888343,45.9424165],[34.4904706,45.9423594],[34.4917844,45.9423661],[34.4928804,45.9425184],[34.4946216,45.9425552],[34.4985264,45.9425606],[34.499936,45.942925],[34.5014405,45.9433983],[34.5025154,45.9437682],[34.5042168,45.9446027],[34.5056146,45.9453175],[34.5074422,45.9462741],[34.5090611,45.9470812],[34.5109022,45.9480281],[34.5118629,45.94872],[34.5141939,45.9501078],[34.5156235,45.9509744],[34.5172063,45.9519532],[34.5199398,45.9535737],[34.5218422,45.9547481],[34.522247,45.9550759],[34.5229209,45.9557525],[34.5246086,45.9570631],[34.5253502,45.9577197],[34.5269998,45.9590021],[34.5282447,45.9602114],[34.5298263,45.9618685],[34.5316494,45.9636175],[34.5333,45.9652973],[34.5356858,45.9676338],[34.5368979,45.9688792],[34.5386716,45.9706763],[34.5403555,45.972308],[34.5423305,45.9739715],[34.5434908,45.9751818],[34.5443875,45.9761218],[34.5450007,45.9782821],[34.5448398,45.9790277],[34.5466613,45.9812107],[34.5498799,45.9839692],[34.5514463,45.9860416],[34.5524964,45.9879662],[34.5525295,45.9880269],[34.5526909,45.9883227],[34.5542176,45.9904652],[34.5567768,45.9922303],[34.558925,45.9933074],[34.5611691,45.9943843],[34.5657479,45.994458],[34.5680688,45.9950093],[34.5687185,45.9950361],[34.5728967,45.9954429],[34.5756862,45.9956544],[34.5773093,45.9956796],[34.5816123,45.9956678],[34.5852475,45.9955936],[34.5881758,45.9952792],[34.5901528,45.9951446],[34.5925887,45.9949321],[34.5952109,45.9946694],[34.5987208,45.9943942],[34.6011392,45.9941699],[34.6019667,45.9938489],[34.604854,45.9933085],[34.6061468,45.9931356],[34.6075122,45.9925213],[34.6092234,45.9920568],[34.612274,45.991264],[34.6150842,45.9904269],[34.6186056,45.9893892],[34.6226845,45.988153],[34.627423,45.986705],[34.628541,45.9864034],[34.6321322,45.9848525],[34.6351517,45.9836072],[34.6370918,45.9828177],[34.6404499,45.9814841],[34.6428291,45.9805335],[34.6464902,45.9790644],[34.6507239,45.977337],[34.653184,45.9762541],[34.6538382,45.9758638],[34.6549879,45.97549],[34.6567045,45.9746677],[34.658927,45.9736357],[34.6611619,45.9724487],[34.6633785,45.9712263],[34.6662028,45.9697807],[34.6699108,45.9676437],[34.6722985,45.9658829],[34.6754801,45.9638487],[34.6781205,45.9619889],[34.6803106,45.9604808],[34.681967,45.9593852],[34.683353,45.958377],[34.6854092,45.956966],[34.6881698,45.9551518],[34.6895407,45.9542151],[34.6918485,45.9526694],[34.6939555,45.9512575],[34.6964967,45.9495416],[34.6976648,45.9486792],[34.7002403,45.9469746],[34.7025809,45.9454043],[34.7046333,45.9438979],[34.7063492,45.9425511],[34.7090217,45.9406901],[34.7100374,45.9398775],[34.7118728,45.9385407],[34.714093,45.9369602],[34.7159732,45.9354204],[34.7176734,45.9341332],[34.719742,45.9326262],[34.7202076,45.9322383],[34.7212037,45.9313544],[34.7231627,45.9301704],[34.7244771,45.9291032],[34.7266825,45.9276178],[34.7295522,45.9255629],[34.731973,45.9238837],[34.7344288,45.9222397],[34.7385682,45.9193559],[34.7424567,45.9166425],[34.7468146,45.9136837],[34.7508739,45.911003],[34.7535786,45.9091762],[34.7540112,45.9088363],[34.7545153,45.9086024],[34.7575349,45.9081156],[34.7621488,45.9073661],[34.7657264,45.9067396],[34.7697758,45.905939],[34.7735612,45.9054161],[34.7779701,45.9046691],[34.7798173,45.904319],[34.7833956,45.9037276],[34.7886184,45.9028485],[34.7933158,45.9020727],[34.7975194,45.9013163],[34.8003666,45.9007953],[34.8021689,45.9006479],[34.8020227,45.8977103],[34.8019569,45.8956761],[34.8019595,45.8920696],[34.8016768,45.8885986],[34.8016061,45.8864097],[34.8015392,45.883816],[34.8014231,45.8802233],[34.8012952,45.8773212],[34.801214,45.8753348],[34.8011421,45.8715271],[34.80106,45.8668746],[34.8008629,45.8623548],[34.8006895,45.8559302],[34.8005698,45.8516948],[34.8003735,45.8477225],[34.8002963,45.844272],[34.8002206,45.8392861],[34.7999965,45.8355047],[34.8000337,45.8334926],[34.7997879,45.8300923],[34.7997787,45.8282238],[34.7995586,45.8245613],[34.7994461,45.8215994],[34.7992407,45.8178652],[34.799245,45.81483],[34.7990367,45.81206],[34.7990874,45.8104643],[34.8027161,45.8095144],[34.8063798,45.8085995],[34.8120361,45.8072007],[34.8181806,45.8056509],[34.8237318,45.8041818],[34.8282058,45.8030866],[34.8337909,45.8016283],[34.8372194,45.8008353],[34.8410343,45.7998931],[34.8454388,45.7987746],[34.8491343,45.7978341],[34.8559851,45.7960923],[34.862315,45.794561],[34.8642572,45.7941246],[34.8669476,45.7931642],[34.8709587,45.7920154],[34.876163,45.7904304],[34.8817449,45.7884461],[34.8857975,45.7870342],[34.8893775,45.7857372],[34.8926205,45.7845409],[34.8962463,45.7831001],[34.9008778,45.7812258],[34.9068699,45.7788525],[34.9109795,45.7771532],[34.9160872,45.7753061],[34.919157,45.7740524],[34.9228349,45.7726812],[34.9265113,45.7712743],[34.9303891,45.7697924],[34.9359466,45.7677106],[34.9411705,45.7658247],[34.9453932,45.7640151],[34.9492845,45.7619729],[34.953088,45.7598607],[34.9564006,45.7583043],[34.9597746,45.7565682],[34.9639248,45.7580561],[34.9667142,45.7589893],[34.9690342,45.7597648],[34.9716754,45.7608857],[34.9747583,45.7619021],[34.9750748,45.7619919],[35.1048759,45.7769349],[35.2334204,45.7917299],[35.2331226,45.7937975],[35.2302771,45.8056738],[35.2263236,45.8173925],[35.2212789,45.8289034],[35.2151647,45.8401574],[35.2080072,45.8511065],[35.199837,45.8617041],[35.1906891,45.8719049],[35.1806026,45.8816654],[35.1739108,45.8873198],[35.1711794,45.8954038],[35.1661348,45.9068986],[35.1600206,45.9181369],[35.1528631,45.9290706],[35.1509695,45.9315235],[35.158154,45.9316965],[35.1753385,45.9328965],[35.1923736,45.9348755],[35.209186,45.937625],[35.2257039,45.9411332],[35.2418565,45.9453848],[35.2575746,45.9503615],[35.2727909,45.9560418],[35.2874403,45.9624012],[35.30146,45.9694121],[35.31479,45.9770444],[35.3273733,45.9852651],[35.3391558,45.9940387],[35.3500872,46.0033274],[35.3601208,46.0130912],[35.3692134,46.0232881],[35.3773262,46.0338741],[35.3844244,46.0448037],[35.3904776,46.0560299],[35.3911545,46.057589],[35.3995114,46.0630408],[35.411294,46.071802],[35.4222254,46.0810777],[35.4322589,46.0908278],[35.4413515,46.1010103],[35.4494643,46.1115814],[35.4565625,46.1224956],[35.4626157,46.1337061],[35.4675981,46.1451645],[35.4680391,46.1464862],[35.3757487,46.1944895],[35.2781489,46.2645192],[35.2780627,46.264581],[35.2772789,46.2647679],[35.2770267,46.2648232],[35.275494,46.2652299],[35.2750858,46.2653158],[35.2673489,46.2669432],[35.2616697,46.2686856],[35.2534755,46.2710593],[35.2476732,46.2730827],[35.2405593,46.2762051],[35.2274451,46.2812001],[35.2059792,46.2862733],[35.1846222,46.2912034],[35.1694604,46.2944092],[35.1446525,46.2985018],[35.133571,46.3007694],[35.128223,46.3020878],[35.1059949,46.3020459],[35.1019236,46.301641],[35.1002879,46.3015908],[35.0941085,46.3014008],[35.0936703,46.3013691],[35.0899118,46.3010967],[35.0810386,46.3004532],[35.0720342,46.2995725],[35.0697501,46.310599],[35.0695999,46.3134147],[35.0675455,46.323378],[35.0657738,46.3286731],[35.0677513,46.3298482],[35.0658084,46.3317809],[35.0644008,46.3355889],[35.0622531,46.3496909],[35.0616161,46.3528112],[35.0611074,46.3549064],[35.0600771,46.3591498],[35.0567539,46.3752108],[35.0619697,46.3758549],[35.0659736,46.3761357],[35.0673762,46.3767197],[35.0692269,46.3782474],[35.0695027,46.3794352],[35.0692434,46.3808903],[35.0688299,46.3830543],[35.0666824,46.3949781],[35.0653285,46.4037513],[35.0642612,46.411543],[35.0634783,46.4172565],[35.063085,46.420671],[35.0626507,46.4244409],[35.0622322,46.4248011],[35.0596674,46.4413835],[35.0546771,46.4818658],[35.0366725,46.4804509],[35.0213956,46.4789514],[35.0071239,46.4839758],[34.9910355,46.4895849],[34.9890951,46.4902574],[34.9773292,46.4942947],[34.9594097,46.500651],[34.9567755,46.501538],[34.9569053,46.501728],[34.9560375,46.5020159],[34.9526008,46.5033257],[34.9484523,46.5028592],[34.9482815,46.5038964],[34.948107,46.5047768],[34.9478126,46.506692],[34.9477403,46.50705],[34.9472289,46.5095427],[34.9468768,46.5118797],[34.9468732,46.512555],[34.9462054,46.5123449],[34.9457548,46.5122707],[34.9309628,46.5108515],[34.9089241,46.5087819],[34.9054562,46.5084423],[34.8985072,46.5077698],[34.890103,46.5069564],[34.8889843,46.5134578],[34.8877081,46.5203979],[34.8862415,46.5288966],[34.8848669,46.5363143],[34.8948457,46.5371691],[34.8926914,46.5501508],[34.8915491,46.558012],[34.8907061,46.5631548],[34.8893784,46.563235],[34.8790645,46.5621592],[34.8729219,46.5612726],[34.8428132,46.5581759],[34.8348679,46.5574048],[34.8204995,46.5559199],[34.7949118,46.5533178],[34.7784189,46.551684],[34.7623715,46.550042],[34.7568736,46.5493492],[34.7540696,46.5612099],[34.7538519,46.561729],[34.7534264,46.5621186],[34.7527566,46.5653883],[34.75143,46.5710522],[34.7498271,46.5777723],[34.7485571,46.583762],[34.748275,46.5841895],[34.7413721,46.5834561],[34.7319216,46.5824558],[34.7232991,46.5814666],[34.7218722,46.586955],[34.7198255,46.5943436],[34.7180316,46.6013226],[34.7164313,46.6072424],[34.7149552,46.6126337],[34.7131884,46.6192518],[34.7127641,46.6200738],[34.7220639,46.6216605],[34.7381471,46.6241663],[34.7481942,46.6257596],[34.7563087,46.6269756],[34.7553895,46.6320071],[34.7540567,46.6398418],[34.7515286,46.6544497],[34.7506537,46.6592543],[34.7481714,46.6726998],[34.7461772,46.6832188],[34.7354872,46.6822547],[34.7112344,46.6800373],[34.7010536,46.6792081],[34.6994682,46.6790294],[34.6986125,46.6783723],[34.6939425,46.6778392],[34.6911909,46.6776462],[34.687637,46.6772145],[34.6851011,46.6770294],[34.6835688,46.6772691],[34.6808284,46.6919901],[34.6765615,46.6918762],[34.6449865,46.6888306],[34.6387728,46.6882302],[34.6322356,46.6876186],[34.6320378,46.6893821],[34.629127,46.7041632],[34.6285273,46.7064446],[34.6272644,46.7131569],[34.6252257,46.723972],[34.6441357,46.7257422],[34.6612754,46.7271564],[34.6600874,46.732634],[34.6586929,46.7403319],[34.6976977,46.7439931],[34.7128633,46.7453251],[34.7350052,46.7473443],[34.734716,46.7518802],[34.7351928,46.7546117],[34.7351722,46.7570629],[34.7504856,46.7578954],[34.750469,46.7611846],[34.7501942,46.7731834],[34.7501431,46.7805134],[34.7675765,46.7809131],[34.7674863,46.7812448],[34.7664072,46.7852117],[34.7651907,46.7897562],[34.76452,46.792645],[34.76297,46.79931],[34.7619135,46.8042793],[34.7614297,46.8065858],[34.7601377,46.812745],[34.7587314,46.8196818],[34.7581324,46.8227066],[34.772827,46.8242415],[34.7897881,46.8258962],[34.8031191,46.8271484],[34.8109672,46.8279125],[34.8165539,46.8284506],[34.8132724,46.8330884],[34.8101278,46.8483155],[34.809442,46.8528418],[34.8076081,46.8642578],[34.8064622,46.8714713],[34.8053862,46.878497],[34.8049115,46.8813742],[34.8046826,46.8825274],[34.7979264,46.8821958],[34.7894519,46.8817946],[34.7853025,46.8815821],[34.7725608,46.8808139],[34.7643968,46.880333],[34.7525692,46.8795369],[34.7517367,46.8840288],[34.7504906,46.8899038],[34.7493926,46.8966473],[34.748408,46.9025023],[34.7449863,46.9215673],[34.7440307,46.9253999],[34.7428188,46.9313654],[34.7421075,46.9335408],[34.7394048,46.9474303],[34.7393759,46.9475788],[34.7385888,46.9513582],[34.7369787,46.9584871],[34.7364408,46.9613595],[34.7299839,46.9607492],[34.721259,46.9598516],[34.7128849,46.9589188],[34.7040989,46.9579223],[34.6968099,46.9573386],[34.6854556,46.9558631],[34.6853005,46.9573569],[34.6813519,46.9778701],[34.6809711,46.9791411],[34.6667176,46.9777684],[34.6542543,46.9766286],[34.652617,46.9762331],[34.6425991,46.9741138],[34.640407,46.9744321],[34.6399987,46.9744431],[34.632119,46.9738327],[34.6238427,46.9733971],[34.6205819,46.9881738],[34.6184384,46.9897104],[34.6174822,46.9933158],[34.6078025,46.9925633],[34.6012386,46.9920014],[34.5996222,46.9917725],[34.5989523,46.9948414],[34.5976708,47.0000203],[34.5969841,47.0043826],[34.5945556,47.0161199],[34.5929032,47.0243402],[34.5923098,47.0256266],[34.5916567,47.0267916],[34.5840477,47.0261884],[34.574685,47.0253264],[34.5672697,47.0244915],[34.5667768,47.0274956],[34.5645394,47.0389302],[34.5627574,47.0486448],[34.5607705,47.0591369],[34.5573738,47.0772392],[34.5567857,47.0806383],[34.5560267,47.0850424],[34.5539381,47.0965064],[34.5529108,47.1020308],[34.553859,47.1021569],[34.5534973,47.1059694],[34.5389449,47.1055095],[34.5195021,47.1047491],[34.5168822,47.1182644],[34.5167816,47.1187833],[34.5166375,47.1195265],[34.5121102,47.1434511],[34.5091904,47.1575835],[34.5079212,47.1583549],[34.5066898,47.1641054],[34.5038561,47.177334],[34.504366,47.1774968],[34.5027359,47.1887161],[34.4998977,47.2018159],[34.4979143,47.2103789],[34.4968027,47.2148342],[34.4961388,47.2146295],[34.4941007,47.22444],[34.4909976,47.2406],[34.4918777,47.2413488],[34.4908861,47.2468443],[34.4984663,47.2472914],[34.5011977,47.2476789],[34.5088101,47.2481924],[34.5197507,47.2496571],[34.5221712,47.2501804],[34.5252018,47.2504019],[34.5300976,47.2507598],[34.5295853,47.2557982],[34.5272052,47.2674288],[34.5236425,47.2671703],[34.5221908,47.2719339],[34.5199933,47.2772395],[34.5183042,47.2831829],[34.5182002,47.2835488],[34.4984606,47.2812559],[34.4877638,47.2799494],[34.4865927,47.2840452],[34.4837346,47.2955073],[34.4804555,47.3077858],[34.4814715,47.308183],[34.4794346,47.3151248],[34.4871739,47.3156983],[34.4984529,47.3170399],[34.5039906,47.3175806],[34.5138315,47.3181455],[34.5161124,47.3184443],[34.5144181,47.3198522],[34.5139611,47.3204498],[34.5139068,47.320887],[34.5139817,47.3224674],[34.513582,47.3236324],[34.5133021,47.3240163],[34.5123766,47.3245451],[34.5114684,47.3247887],[34.5106445,47.3248773],[34.5089763,47.324791],[34.5082927,47.3248396],[34.5074425,47.3250964],[34.5070159,47.3255814],[34.507091,47.3262287],[34.5079923,47.3268686],[34.5079807,47.3270522],[34.5071876,47.3273122],[34.507252,47.3278503],[34.5074107,47.3280873],[34.5086438,47.328848],[34.5096071,47.3298585],[34.5100415,47.3314135],[34.5104813,47.3321189],[34.5113182,47.3326424],[34.5119443,47.3328555],[34.5125355,47.3327613],[34.5125813,47.3330096],[34.5124896,47.334064],[34.5121847,47.3350429],[34.5069298,47.3349366],[34.5054386,47.3351652],[34.5013587,47.3344609],[34.495527,47.333252],[34.4927348,47.3325918],[34.4920185,47.332266],[34.4901169,47.3319828],[34.4748331,47.3300401],[34.4641129,47.3289905],[34.4488057,47.327341],[34.437884,47.3261024],[34.4279556,47.3250216],[34.4138387,47.3234564],[34.4192258,47.3006584],[34.3987637,47.2982773],[34.3989909,47.297288],[34.4013965,47.2870834],[34.3724937,47.2837958],[34.3708681,47.2835973],[34.3699571,47.2837459],[34.369243,47.2841812],[34.3580896,47.2933871],[34.3577775,47.2935595],[34.3573864,47.293614],[34.3302362,47.2904306],[34.3294041,47.2902484],[34.3287775,47.2898127],[34.3212673,47.2829582],[34.3176199,47.2799989],[34.3132506,47.2761832],[34.3094385,47.2730406],[34.3053474,47.269141],[34.3005952,47.2714941],[34.2987504,47.2722027],[34.2982609,47.2725342],[34.2979949,47.2726567],[34.2977485,47.2726874],[34.2974837,47.272641],[34.297079,47.2726316],[34.2967587,47.2726959],[34.2964278,47.2728825],[34.2962664,47.2730917],[34.2962595,47.2734139],[34.2964741,47.2739485],[34.2965122,47.2741826],[34.2964163,47.2744499],[34.2962537,47.2746184],[34.2960586,47.2747579],[34.2957781,47.2748386],[34.2954245,47.2748421],[34.2952683,47.2747844],[34.2952227,47.2746782],[34.2952324,47.2745231],[34.295156,47.2743987],[34.2949877,47.2743199],[34.2948059,47.274184],[34.2946622,47.2739836],[34.2945172,47.2738227],[34.2942699,47.2736733],[34.2938762,47.2736012],[34.2935203,47.2736457],[34.2932041,47.2738169],[34.2928636,47.2742226],[34.2927154,47.2744547],[34.2926983,47.2748217],[34.2929418,47.2752949],[34.2931001,47.275617],[34.2930736,47.2758304],[34.2929871,47.2760668],[34.2929968,47.2763339],[34.293165,47.2766286],[34.293117,47.2768907],[34.2929268,47.2771],[34.2926714,47.2772687],[34.2811272,47.3240386],[34.2811655,47.3242845],[34.2813157,47.3245463],[34.2823603,47.3254199],[34.2824986,47.3256449],[34.2824499,47.3258973],[34.2724553,47.3611366],[34.2607866,47.3597376],[34.2515581,47.3915388],[34.2564349,47.3953776],[34.2504946,47.4152974],[34.2495225,47.417447],[34.2493723,47.4193272],[34.2474476,47.423858],[34.2453672,47.4286773],[34.2445527,47.4304716],[34.2436188,47.4321896],[34.2426886,47.4338649],[34.2397898,47.4370579],[34.236379,47.4407866],[34.2347233,47.4423316],[34.2321441,47.4443094],[34.230114,47.4460149],[34.2271594,47.4481234],[34.2242939,47.4497297],[34.2217067,47.4511689],[34.2184503,47.452729],[34.2126653,47.4550758],[34.2085941,47.4564229],[34.2004841,47.459237],[34.193878,47.4614294],[34.1870992,47.4635844],[34.17575,47.4672425],[34.1699642,47.4690813],[34.1663863,47.4701457],[34.1640086,47.4708531],[34.1524952,47.473877],[34.1478446,47.4751524],[34.1416882,47.4768405],[34.1394646,47.4772499],[34.1318638,47.476559],[34.1279517,47.4761501],[34.1244533,47.4757133],[34.1231303,47.4755644],[34.1192182,47.4751457],[34.1170648,47.4749002],[34.1146022,47.4746386],[34.1122251,47.4744332],[34.1103246,47.4741946],[34.1069904,47.4738746],[34.1041617,47.4735592],[34.101896,47.4733049],[34.1008414,47.4732294],[34.1000674,47.4731416],[34.0978594,47.4729629],[34.0963252,47.4727777],[34.0958897,47.4727628],[34.093315,47.4725018],[34.0914301,47.4723293],[34.0889122,47.4720963],[34.0866183,47.4718324],[34.0842276,47.4716361],[34.0805827,47.4712136],[34.0786981,47.4710505],[34.075955,47.4707812],[34.0744075,47.4706243],[34.0719278,47.4701906],[34.0677447,47.4695252],[34.0655195,47.4691746],[34.0633798,47.4688899],[34.0617174,47.4686007],[34.0608047,47.4685901],[34.0594637,47.4682217],[34.0577031,47.4679333],[34.0534217,47.4672493],[34.0507731,47.4667786],[34.048282,47.4664587],[34.0463101,47.4661245],[34.043915,47.4656894],[34.0406893,47.4651285],[34.038378,47.464664],[34.0372821,47.4646168],[34.033587,47.4637363],[34.0321907,47.4633967],[34.0289205,47.4627026],[34.0262408,47.4620507],[34.0209307,47.4608153],[34.0174412,47.4600133],[34.0173082,47.4599826],[34.01159,47.4586491],[34.0073592,47.4576035],[34.0056682,47.4572495],[34.0039232,47.4568245],[34.0033403,47.4566155],[33.9985425,47.4589657],[33.9979697,47.459292],[33.9970431,47.4594667],[33.994482,47.4594889],[33.9937949,47.4593402],[33.9919156,47.4592374],[33.9879104,47.4580345],[33.9870479,47.4578872],[33.9859958,47.4579201],[33.9826802,47.4588767],[33.9819616,47.4589185],[33.9784425,47.4593175],[33.9778285,47.4593227],[33.9756664,47.4591621],[33.9722572,47.4588108],[33.9706592,47.4587292],[33.9688308,47.4585305],[33.9664063,47.4583486],[33.9654038,47.4582143],[33.9619956,47.4579692],[33.9603077,47.4577692],[33.9570924,47.4575105],[33.9555129,47.457488],[33.9547773,47.4575536],[33.9534685,47.4579453],[33.9529652,47.4582469],[33.9523108,47.4589306],[33.9519046,47.459755],[33.9515928,47.4609475],[33.951341,47.4615802],[33.951266,47.4632586],[33.9507487,47.4686294],[33.9497888,47.4776925],[33.9496425,47.4783362],[33.9495317,47.4799792],[33.9492002,47.4830162],[33.9484561,47.488484],[33.948138,47.4912948],[33.9478852,47.4928556],[33.9474414,47.4974642],[33.9472808,47.4982984],[33.9471007,47.5000015],[33.9467374,47.5012777],[33.9460237,47.5026043],[33.9431464,47.5066618],[33.9420865,47.5082768],[33.9418875,47.5089329],[33.941314,47.5122217],[33.9411315,47.5128182],[33.9410536,47.5143538],[33.9408165,47.5148436],[33.9395849,47.5159546],[33.9390234,47.5161112],[33.9381432,47.5161609],[33.9366581,47.5161101],[33.9348228,47.5162966],[33.9308665,47.516055],[33.9299937,47.5158161],[33.9294883,47.5156445],[33.9276791,47.5150302],[33.9266381,47.5146972],[33.9258185,47.5145528],[33.924077,47.5143829],[33.9226236,47.5140642],[33.922109,47.5138448],[33.9177639,47.5130865],[33.9147705,47.5127606],[33.9143201,47.5128062],[33.913372,47.5129025],[33.9123659,47.512845],[33.9107387,47.5126224],[33.9092033,47.5122643],[33.9067329,47.5117889],[33.9049458,47.511623],[33.9044409,47.5117648],[33.9042786,47.5117454],[33.9026916,47.5115407],[33.8831775,47.5097478],[33.8739847,47.5088168],[33.8660522,47.5080579],[33.8582781,47.5072879],[33.8518879,47.5066939],[33.8444657,47.5060065],[33.8319734,47.5046625],[33.8092203,47.5024292],[33.7864992,47.4999729],[33.740925,47.4951542],[33.7159508,47.4925115],[33.6909203,47.4898015],[33.6777824,47.488403],[33.6436096,47.4845268],[33.6427955,47.4878223],[33.6421087,47.4904922],[33.6414807,47.4930912],[33.6408789,47.4955442],[33.640434,47.4971441],[33.6396752,47.5002776],[33.6389426,47.50258],[33.6385435,47.5042151],[33.6377716,47.507136],[33.6373595,47.508709],[33.6369147,47.5105516],[33.6365348,47.5120451],[33.6359662,47.5140686],[33.6346637,47.5138914],[33.6208796,47.5121293],[33.6106604,47.511058],[33.6102395,47.5110459],[33.6099041,47.5109857],[33.6097039,47.5109869],[33.6092186,47.5110046],[33.6071371,47.510764],[33.6060963,47.5106359],[33.603722,47.5102844],[33.603765,47.5101891],[33.6038853,47.5094955],[33.6041397,47.5084269],[33.6044589,47.506861],[33.6046813,47.5058093],[33.6050084,47.5041566],[33.6042626,47.5041301],[33.602902,47.5039533],[33.6007171,47.5037058],[33.5989378,47.503476],[33.5967006,47.5031844],[33.5933514,47.5028397],[33.5912774,47.5025844],[33.588445,47.5023016],[33.5881637,47.5035964],[33.5878497,47.5047719],[33.587346,47.5067118],[33.5867834,47.5087798],[33.586247,47.5107239],[33.5857171,47.5126769],[33.585063,47.5150627],[33.5845266,47.5170685],[33.5837678,47.5198164],[33.5835061,47.520912],[33.5828127,47.5237038],[33.5826295,47.5244018],[33.5819754,47.5269019],[33.581596,47.5284037],[33.5804028,47.5323842],[33.5802269,47.5324439],[33.5765214,47.5287205],[33.5759204,47.5286664],[33.5802215,47.5328726],[33.5826334,47.5351855],[33.5829081,47.5366605],[33.5854724,47.5391159],[33.5873041,47.5409618],[33.5884292,47.5420128],[33.5895805,47.5414741],[33.5925373,47.544415],[33.5918046,47.5453776],[33.5917523,47.5462254],[33.5914252,47.5475058],[33.5907056,47.5504464],[33.5902216,47.5523184],[33.5897506,47.554102],[33.5892927,47.555603],[33.5891488,47.5564507],[33.5888217,47.5574748],[33.5886516,47.5582341],[33.5898138,47.5583779],[33.5913981,47.5585768],[33.5936162,47.5588651],[33.5967526,47.559213],[33.5976515,47.5593338],[33.600587,47.5597284],[33.603185,47.5600218],[33.6062172,47.560477],[33.6085247,47.560662],[33.6090793,47.5610339],[33.6090611,47.5618715],[33.6085117,47.5638579],[33.6079491,47.5657647],[33.6075566,47.5672566],[33.6072295,47.568307],[33.6069155,47.5695781],[33.6066015,47.5707345],[33.6063791,47.571573],[33.6059212,47.5734089],[33.6056857,47.5741592],[33.605488,47.575002],[33.605097,47.575183],[33.602886,47.5749447],[33.60006,47.5746181],[33.5975088,47.5743269],[33.595808,47.5741239],[33.59501,47.5740091],[33.5944826,47.5739245],[33.5941857,47.5738061],[33.593583,47.5736792],[33.5922908,47.573653],[33.5918956,47.5751893],[33.5914994,47.5769598],[33.5910222,47.5786185],[33.5907973,47.5792622],[33.590382,47.5807993],[33.589905,47.5824794],[33.5894385,47.5841596],[33.5889628,47.5859682],[33.5887081,47.5867834],[33.5883121,47.5881472],[33.5881313,47.5887344],[33.5860817,47.5885176],[33.5848024,47.5883595],[33.5838111,47.5882285],[33.583521,47.5891087],[33.5828198,47.5915578],[33.5820361,47.59439],[33.5811587,47.5975879],[33.5803214,47.600194],[33.578734,47.5999953],[33.5757668,47.5996204],[33.5735028,47.5993584],[33.5715403,47.599119],[33.5686401,47.5987803],[33.5643677,47.5982503],[33.5609775,47.5978634],[33.5564966,47.597335],[33.5520089,47.5967433],[33.5470009,47.5961688],[33.5430728,47.595652],[33.5407301,47.5953418],[33.534566,47.5946092],[33.5294634,47.5940106],[33.5229529,47.5932156],[33.5159503,47.592279],[33.5117776,47.5917687],[33.5108493,47.5916026],[33.50994,47.5914812],[33.5090117,47.5914109],[33.5062647,47.5910596],[33.5005433,47.5904271],[33.4983457,47.5901971],[33.4945189,47.5897435],[33.4889301,47.5890919],[33.4846074,47.588608],[33.4821384,47.5883572],[33.4762655,47.5876704],[33.473719,47.5873296],[33.4739865,47.5863939],[33.4746362,47.5841497],[33.475286,47.5822189],[33.4761711,47.5789958],[33.476552,47.5777526],[33.4772018,47.5754626],[33.4776499,47.5739699],[33.4780588,47.5724054],[33.4786806,47.5702247],[33.4791455,47.5686828],[33.4795937,47.5670349],[33.4799858,47.5656024],[33.4805067,47.5638109],[33.4812181,47.5610364],[33.4817615,47.5595357],[33.4819601,47.5588605],[33.4824113,47.5575096],[33.4827417,47.5563301],[33.4831451,47.555007],[33.4836884,47.5530979],[33.4841197,47.5513966],[33.4845343,47.5497558],[33.4849712,47.5480355],[33.4855139,47.545864],[33.4861004,47.5439264],[33.4831764,47.5435256],[33.4780565,47.5428827],[33.4757935,47.5425576],[33.4723317,47.542134],[33.4696877,47.5418694],[33.46766,47.541582],[33.4657778,47.541287],[33.4628426,47.5408862],[33.4584061,47.5403719],[33.456636,47.5401677],[33.4541265,47.5398274],[33.4514201,47.5395064],[33.4500971,47.5393514],[33.4478483,47.5390921],[33.4439432,47.5385956],[33.4389827,47.5379484],[33.4346286,47.5373721],[33.433273,47.5371754],[33.4314715,47.5369298],[33.4305171,47.5367745],[33.4279067,47.536472],[33.4246802,47.5360938],[33.4181712,47.5352391],[33.4143845,47.5347778],[33.4101049,47.5341727],[33.4054681,47.5335172],[33.4009889,47.5328803],[33.3962458,47.5324153],[33.3915899,47.5317846],[33.3866605,47.5310206],[33.3826273,47.5305063],[33.3811626,47.5303293],[33.3771154,47.5297347],[33.3728179,47.5291869],[33.3677831,47.5287286],[33.3655761,47.5283806],[33.362678,47.5280559],[33.3575446,47.527414],[33.3554691,47.5271037],[33.351524,47.5265367],[33.3489404,47.5261921],[33.3459256,47.5257676],[33.3432219,47.5254241],[33.3414157,47.5251245],[33.3404025,47.5249582],[33.339439,47.524822],[33.3378481,47.5246783],[33.3353162,47.5243605],[33.3302076,47.5237553],[33.3264657,47.5230895],[33.3256031,47.5235964],[33.3248301,47.5237553],[33.3226885,47.5235625],[33.32497,47.5201387],[33.3264545,47.5178994],[33.3272051,47.5164542],[33.3282918,47.5141389],[33.3300843,47.5101208],[33.3307229,47.509523],[33.3356187,47.5053153],[33.3380162,47.5031736],[33.3402344,47.5012133],[33.3422734,47.4994347],[33.3437746,47.4980723],[33.3476285,47.4948024],[33.3488161,47.4936669],[33.3467323,47.4930008],[33.3450302,47.4924351],[33.3417356,47.49129],[33.3377473,47.4899047],[33.3328851,47.488224],[33.3297482,47.4874746],[33.3261744,47.4865737],[33.3206472,47.484718],[33.3170097,47.4834847],[33.3142543,47.4825445],[33.3117034,47.484097],[33.3090892,47.4853069],[33.3072207,47.4861517],[33.3078231,47.4864488],[33.3091437,47.4869382],[33.3125952,47.488057],[33.3136944,47.4885922],[33.3144745,47.4894912],[33.3149498,47.4906984],[33.3148636,47.4921562],[33.3142628,47.4935766],[33.3137166,47.4949903],[33.3124753,47.4970166],[33.3115033,47.4980441],[33.3111873,47.4986879],[33.3112211,47.4991855],[33.3107431,47.5000282],[33.3102563,47.5009893],[33.3099756,47.5015974],[33.3094879,47.5019775],[33.3080301,47.5023835],[33.3070162,47.5025694],[33.3044333,47.5030353],[33.3029888,47.503138],[33.3020843,47.5030478],[33.3007119,47.5029428],[33.2997836,47.5029754],[33.2984117,47.5031637],[33.2963088,47.5039755],[33.2946139,47.504888],[33.2924679,47.5064252],[33.2913458,47.5071445],[33.290365,47.5077732],[33.2880272,47.5090342],[33.2878157,47.5092125],[33.2865697,47.5099547],[33.2854315,47.5109182],[33.2839503,47.5122952],[33.283517,47.5127061],[33.2828559,47.5131358],[33.2820405,47.5140344],[33.2820105,47.5147408],[33.2811393,47.5154257],[33.2799162,47.5159474],[33.2792296,47.5167734],[33.278779,47.5177444],[33.2787146,47.5188747],[33.2787575,47.5199906],[33.279251,47.5207151],[33.2804741,47.5216715],[33.2817401,47.5225989],[33.2844438,47.5241059],[33.2859458,47.5249173],[33.2865041,47.5254711],[33.2869758,47.5263662],[33.2874693,47.5277572],[33.2876588,47.5282935],[33.2878126,47.5296552],[33.2884838,47.5316958],[33.2886815,47.5329365],[33.2887235,47.5341174],[33.2886279,47.5361816],[33.2884135,47.5383403],[33.288306,47.5392382],[33.2881022,47.540187],[33.2879627,47.5409982],[33.2880485,47.5415269],[33.2880056,47.5421787],[33.2877588,47.5427363],[33.2872009,47.5433013],[33.285581,47.5441271],[33.2837142,47.5450686],[33.283065,47.5453562],[33.2822442,47.5453961],[33.2817775,47.545387],[33.2815415,47.5454305],[33.281461,47.545483],[33.2813081,47.545626],[33.2810506,47.545731],[33.2806832,47.5458614],[33.2792725,47.5460825],[33.2764616,47.5462925],[33.2745947,47.5463142],[33.2731141,47.5459087],[33.2722986,47.5456332],[33.2715906,47.5452134],[33.2704854,47.5444962],[33.2694449,47.5439823],[33.268404,47.5436561],[33.2674279,47.5434029],[33.266226,47.5429609],[33.2647671,47.5422731],[33.2635009,47.5415341],[33.2620742,47.5408536],[33.2609689,47.5402666],[33.2602395,47.5397309],[33.2593598,47.5388835],[33.2587373,47.5380358],[33.2581045,47.53729],[33.2571282,47.5366237],[33.2557978,47.5358559],[33.254446,47.5352185],[33.252665,47.5345666],[33.2513237,47.5341244],[33.2498541,47.5337191],[33.2484593,47.5333351],[33.2471718,47.5326832],[33.2458843,47.5319588],[33.2449617,47.5315821],[33.2443869,47.531178],[33.243524,47.5308722],[33.2418074,47.5303506],[33.2404556,47.5301913],[33.2394685,47.5304231],[33.2386422,47.5304953],[33.2381594,47.530517],[33.2367863,47.5302927],[33.2355203,47.5299305],[33.2342114,47.5295393],[33.2327737,47.529322],[33.2320621,47.5292891],[33.2314807,47.5293942],[33.230864,47.5297059],[33.2302203,47.5303506],[33.2294478,47.5309012],[33.2290366,47.5311074],[33.2285036,47.5312199],[33.2280173,47.5312233],[33.2274093,47.531133],[33.2266583,47.5307853],[33.2256283,47.5304231],[33.2250059,47.5303214],[33.2241263,47.5303651],[33.2226992,47.530575],[33.2215136,47.5308358],[33.2210523,47.530843],[33.2206553,47.5308901],[33.2200706,47.5311654],[33.2194376,47.5314624],[33.2189119,47.5316688],[33.2184505,47.5317485],[33.2175976,47.5318716],[33.2171096,47.5320602],[33.216522,47.5323008],[33.2160473,47.5326811],[33.2155108,47.5331085],[33.2150497,47.5337553],[33.2150173,47.5339941],[33.2151461,47.5343345],[33.215822,47.5348923],[33.2163691,47.5353341],[33.2171523,47.5357325],[33.2191267,47.5369134],[33.2202424,47.5377826],[33.221208,47.5385214],[33.2215887,47.5389303],[33.2218945,47.5395532],[33.222034,47.5404187],[33.2220072,47.5412806],[33.2217604,47.542472],[33.2217872,47.5431781],[33.2218892,47.5439385],[33.2218462,47.5443405],[33.2215619,47.5449416],[33.2212883,47.5452892],[33.2207304,47.5455572],[33.2198131,47.5460569],[33.2191855,47.5466145],[33.218649,47.5473387],[33.218177,47.5478637],[33.2181394,47.5482367],[33.2183486,47.5486422],[33.2189333,47.5490441],[33.2195556,47.5494351],[33.2207252,47.5499568],[33.2226242,47.5507316],[33.2238471,47.5512021],[33.2251668,47.5518755],[33.2264328,47.5526358],[33.2280314,47.5533599],[33.2290292,47.5539971],[33.2295227,47.554417],[33.2300057,47.5549459],[33.2315075,47.5565023],[33.2326126,47.5577332],[33.2341041,47.5600865],[33.2352304,47.5616429],[33.2362068,47.5634745],[33.2365503,47.5644158],[33.237462,47.5675212],[33.2377195,47.5691572],[33.2376766,47.5703588],[33.2375264,47.5710971],[33.2374086,47.5716982],[33.236711,47.5732252],[33.2358634,47.5743688],[33.2352628,47.57531],[33.2343829,47.5764895],[33.233943,47.5769962],[33.2334173,47.5773653],[33.2326342,47.5776116],[33.2317006,47.5778213],[33.2310142,47.5778649],[33.2306385,47.5778574],[33.2302523,47.5777634],[33.2298875,47.5773942],[33.2297051,47.5771047],[33.2285251,47.5755778],[33.227967,47.5747597],[33.2277524,47.5744557],[33.2273662,47.5741372],[33.2261753,47.5735871],[33.2235898,47.5730879],[33.2201993,47.5722336],[33.2163584,47.5714518],[33.2119169,47.5701057],[33.2095778,47.569635],[33.2083253,47.5694597],[33.206563,47.5692948],[33.2030868,47.5692151],[33.2015741,47.569331],[33.2007158,47.5693237],[33.1997824,47.5693599],[33.1991279,47.5695336],[33.1983125,47.5696639],[33.1968963,47.5698376],[33.195008,47.5704095],[33.1909313,47.5720746],[33.188457,47.5721575],[33.184227,47.5726345],[33.1830537,47.5722817],[33.1808547,47.5713687],[33.1801731,47.5708215],[33.1789392,47.5697507],[33.1783472,47.5691868],[33.1778945,47.5688713],[33.1771979,47.5683745],[33.1761432,47.5676762],[33.1753471,47.5675151],[33.1750785,47.5676762],[33.17478,47.567542],[33.1732764,47.5671657],[33.1718551,47.5666814],[33.1700821,47.5670802],[33.1702931,47.5677259],[33.165502,47.5685453],[33.1628452,47.5689414],[33.159472,47.5694315],[33.1568252,47.5698545],[33.1542208,47.5702109],[33.1526461,47.5704117],[33.1503376,47.5707474],[33.1483276,47.5710025],[33.1456863,47.5713929],[33.1402868,47.5721274],[33.1312456,47.5733532],[33.1271133,47.573916],[33.1242874,47.5743724],[33.1196306,47.5750571],[33.1150136,47.5755942],[33.1127959,47.5759038],[33.1103491,47.5763155],[33.1056519,47.5769481],[33.0964692,47.5782722],[33.0939784,47.5786329],[33.0926838,47.5788322],[33.0923359,47.5763697],[33.0911444,47.5708207],[33.0907146,47.5662282],[33.0901098,47.5621117],[33.0896463,47.5583521],[33.0899271,47.5580901],[33.0893946,47.5550206],[33.0888625,47.5521654],[33.0897007,47.5489997],[33.0907134,47.5451199],[33.0920406,47.5403355],[33.0924927,47.5376223],[33.093399,47.5334094],[33.0939911,47.530458],[33.0946894,47.5279825],[33.0949698,47.5276253],[33.0954271,47.5278867],[33.1091393,47.5324198],[33.1246832,47.5377822],[33.1316826,47.5402256],[33.1371364,47.5427179],[33.1396344,47.5437144],[33.1413235,47.5445215],[33.1417425,47.5434739],[33.1429573,47.5378562],[33.1433727,47.5355235],[33.1431228,47.5340959],[33.1443356,47.5278357],[33.1452365,47.5232416],[33.1459991,47.5195282],[33.147041,47.5152196],[33.1468637,47.5146486],[33.1450002,47.5139847],[33.1393061,47.5125877],[33.13189,47.5107402],[33.1245095,47.5088684],[33.1232429,47.5079417],[33.1235549,47.5061803],[33.1237697,47.5053904],[33.1240694,47.5042877],[33.1242861,47.5034904],[33.1249459,47.5003484],[33.1255022,47.4979918],[33.1261293,47.495897],[33.1264764,47.4942307],[33.1272091,47.4922785],[33.1282188,47.4887791],[33.1287722,47.4870087],[33.1289853,47.4863271],[33.1293671,47.4845419],[33.1300994,47.482542],[33.1299915,47.481507],[33.1294632,47.4807936],[33.1273034,47.4804034],[33.1270905,47.4794755],[33.1277719,47.4781897],[33.1271389,47.4776906],[33.1257162,47.4772638],[33.1253981,47.4763361],[33.1257108,47.4749792],[33.1264457,47.4740503],[33.127233,47.4730499],[33.1287475,47.468015],[33.1293202,47.4654085],[33.1310387,47.4578746],[33.1311372,47.4551615],[33.1311324,47.4531982],[33.1310746,47.4511279],[33.1320666,47.4479854],[33.1323247,47.4459504],[33.1321114,47.4448441],[33.1324225,47.4429875],[33.1338266,47.4364176],[33.1354424,47.43049],[33.1362213,47.4265625],[33.136898,47.423813],[33.1375742,47.420885],[33.1378337,47.4195283],[33.1313637,47.4192146],[33.1220521,47.4181896],[33.1130566,47.4172707],[33.0972229,47.4155003],[33.0835466,47.413869],[33.0715543,47.4124492],[33.0710852,47.4155909],[33.0711955,47.419339],[33.0710961,47.4236583],[33.0713086,47.4252289],[33.0711558,47.4290129],[33.0711652,47.435938],[33.0709798,47.4546433],[33.0706801,47.4667446],[33.0707914,47.4712066],[33.0705303,47.4727774],[33.070533,47.4748122],[33.0690067,47.4752414],[33.0667949,47.4749215],[33.0564722,47.4718571],[33.048415,47.4695048],[33.0472559,47.4684701],[33.0476751,47.4662924],[33.0498278,47.4602944],[33.052241,47.4521545],[33.0529739,47.4482632],[33.0538652,47.4450144],[33.0538642,47.4440506],[33.0503909,47.4436238],[33.0411817,47.4425209],[33.0341304,47.4416307],[33.0341817,47.4395603],[33.0351789,47.4358832],[33.0362807,47.4313494],[33.0367527,47.4292431],[33.0370141,47.4269942],[33.0372238,47.4258875],[33.0345406,47.4251387],[33.0304897,47.4240332],[33.0292793,47.4228555],[33.0294888,47.4212848],[33.0312205,47.4144662],[33.0332144,47.4071478],[33.0342631,47.4026854],[33.035627,47.3978658],[33.0351006,47.3969736],[33.0347848,47.3962954],[33.0359379,47.3911547],[33.0375633,47.3853355],[33.038979,47.3805517],[33.0392937,47.3796948],[33.0426048,47.3799078],[33.0512251,47.3810823],[33.0623162,47.3824334],[33.0796551,47.3842807],[33.0840552,47.3848127],[33.0957737,47.3863128],[33.1084353,47.3879337],[33.1152787,47.3887887],[33.119403,47.3893133],[33.1216126,47.3895899],[33.121909,47.3884979],[33.1222044,47.3872046],[33.1234924,47.3818128],[33.1248166,47.3762924],[33.1255221,47.3733503],[33.1272917,47.3662089],[33.1295833,47.3579246],[33.1307265,47.3528543],[33.1312449,47.3500693],[33.1319737,47.3474268],[33.1325496,47.3466765],[33.1322319,47.3456417],[33.1341647,47.3414985],[33.1350506,47.3387845],[33.1355695,47.3363564],[33.1372968,47.3336504],[33.1357703,47.3327389],[33.1332488,47.3323135],[33.1328263,47.3313144],[33.1319815,47.3294591],[33.1306492,47.3285563],[33.1216835,47.3264243],[33.1108981,47.324103],[33.1029147,47.3223493],[33.1027734,47.3216831],[33.1045147,47.3173026],[33.1068814,47.3108273],[33.1102933,47.3024946],[33.11078,47.3010186],[33.1104272,47.2995911],[33.1098618,47.2968786],[33.1102766,47.2944507],[33.1115348,47.293926],[33.1094339,47.2929284],[33.104744,47.2916001],[33.1020838,47.2906506],[33.1043769,47.2827474],[33.1052117,47.280462],[33.1066805,47.2804606],[33.109829,47.2809812],[33.1145867,47.2816905],[33.1177349,47.2820205],[33.1185042,47.2819721],[33.119267,47.2790203],[33.1201732,47.2776867],[33.1395323,47.2723339],[33.1379884,47.2702415],[33.1361639,47.2677686],[33.1444015,47.2627608],[33.1511026,47.2588016],[33.1603815,47.2522682],[33.1661731,47.2488806],[33.1738452,47.2436811],[33.1768991,47.2419405],[33.1799857,47.240673],[33.1836885,47.2380285],[33.1830958,47.2377133],[33.182292,47.2374307],[33.1813661,47.237148],[33.1807344,47.2369921],[33.1798229,47.2370554],[33.1789329,47.2375087],[33.1784398,47.2376902],[33.1781683,47.237779],[33.1776354,47.2379299],[33.1769993,47.2379398],[33.1764433,47.2378801],[33.1759614,47.2377133],[33.1754948,47.2374063],[33.1750068,47.2369531],[33.1742029,47.2356519],[33.1736718,47.2346821],[33.1732555,47.2340632],[33.1727817,47.233761],[33.1721997,47.2336074],[33.1715113,47.2336733],[33.1707215,47.2335715],[33.1700603,47.2335778],[33.16937,47.233553],[33.168794,47.2335717],[33.1683088,47.2337525],[33.1679369,47.2340583],[33.167323,47.2343602],[33.1668461,47.2344332],[33.1663689,47.2342579],[33.1660062,47.2339608],[33.1648578,47.2326254],[33.1644917,47.2322307],[33.1639606,47.231948],[33.1632859,47.231792],[33.1626543,47.2317433],[33.162243,47.2316304],[33.1617192,47.2315432],[33.1610923,47.2315366],[33.1607467,47.2316771],[33.1606542,47.2318833],[33.1604897,47.2321112],[33.1603178,47.2322192],[33.1600992,47.2322123],[33.1598062,47.2321899],[33.159555,47.2323233],[33.1594244,47.2326449],[33.1594961,47.2328789],[33.1597545,47.2333272],[33.1602641,47.2338243],[33.1606372,47.2341709],[33.162133,47.2347593],[33.1627062,47.2349631],[33.1634626,47.2352443],[33.1637524,47.2354911],[33.1639103,47.235803],[33.1637233,47.2360066],[33.1634139,47.2361583],[33.1630803,47.2362803],[33.1626215,47.2364032],[33.162145,47.2365118],[33.1617268,47.2365063],[33.161391,47.236417],[33.1603574,47.2361295],[33.1598837,47.2359882],[33.1590785,47.23581],[33.158215,47.2358126],[33.1576838,47.2358467],[33.1572601,47.2358758],[33.1567398,47.2358486],[33.1562732,47.2358633],[33.15571,47.2357903],[33.1552939,47.235671],[33.1545066,47.2354122],[33.1533665,47.235072],[33.1523258,47.2347016],[33.1515659,47.234422],[33.1511297,47.2340935],[33.1506534,47.2337464],[33.1503735,47.2330007],[33.1502013,47.2325621],[33.1498424,47.2321575],[33.1489489,47.2313805],[33.1485284,47.2310236],[33.1479535,47.2307482],[33.1461513,47.2305309],[33.1445865,47.2303187],[33.1432467,47.2303718],[33.1423631,47.2304529],[33.1415072,47.2307108],[33.1397142,47.2314947],[33.1374174,47.2321934],[33.1353658,47.2327905],[33.1338867,47.2331271],[33.13237,47.2330245],[33.1317689,47.2328168],[33.1308857,47.2324224],[33.1297285,47.2319626],[33.1286214,47.2315891],[33.1279562,47.2312044],[33.1272546,47.2308989],[33.126895,47.2305258],[33.1265642,47.2296617],[33.1265413,47.2292531],[33.1265229,47.2290035],[33.1264591,47.2284533],[33.12665,47.2280303],[33.126866,47.2277318],[33.1270025,47.2273387],[33.1269409,47.2268917],[33.1268444,47.2263364],[33.126872,47.2259496],[33.1269561,47.2247849],[33.1271445,47.2237369],[33.1273957,47.2227803],[33.1283377,47.2201296],[33.1289927,47.2191364],[33.1311011,47.2164246],[33.1332902,47.2138529],[33.1341967,47.2128156],[33.1347442,47.2124556],[33.135483,47.2122124],[33.138252,47.2115945],[33.1394294,47.2113562],[33.1403478,47.2112092],[33.1423155,47.210716],[33.1425706,47.210475],[33.1425852,47.2103746],[33.142514,47.2101137],[33.1424088,47.2099877],[33.1425117,47.2098254],[33.1426036,47.2097081],[33.1426551,47.2095608],[33.1425779,47.209426],[33.1425262,47.2093286],[33.1421266,47.208958],[33.1418835,47.2087412],[33.1416451,47.2086287],[33.1410783,47.2085647],[33.1400749,47.2082731],[33.1395283,47.2079097],[33.1391509,47.2072062],[33.1383837,47.2065516],[33.1373893,47.205793],[33.1369546,47.2057977],[33.1365834,47.2059854],[33.1363028,47.2060895],[33.1356033,47.2060691],[33.1349962,47.2060239],[33.1344397,47.2059378],[33.1341928,47.205815],[33.1340186,47.205619],[33.1337806,47.2052352],[33.1327844,47.2042172],[33.1319208,47.2035353],[33.1313075,47.2031665],[33.130682,47.2030368],[33.1300077,47.202869],[33.1292184,47.2027997],[33.1289056,47.2030042],[33.1284033,47.203303],[33.1278462,47.2034356],[33.1269085,47.2034282],[33.1263487,47.2033143],[33.1254954,47.2030123],[33.1246713,47.2027598],[33.1238325,47.2026929],[33.1236693,47.2028042],[33.1231353,47.2029653],[33.12302,47.2031993],[33.1230918,47.2034967],[33.1229267,47.2038771],[33.1228624,47.2039386],[33.1227798,47.2039932],[33.1225359,47.2041084],[33.1221318,47.2042114],[33.1212568,47.2042975],[33.1204813,47.2042347],[33.1196193,47.2040764],[33.1187199,47.203977],[33.1176081,47.2040039],[33.116831,47.2040091],[33.1161244,47.2042839],[33.1152931,47.2045962],[33.1141014,47.2052516],[33.1122002,47.2062571],[33.1111502,47.2068666],[33.1105742,47.2073392],[33.1104182,47.207679],[33.110323,47.2082705],[33.1099041,47.2084949],[33.1093583,47.2086503],[33.1086226,47.2087865],[33.1082128,47.2091579],[33.1077319,47.2095626],[33.1072438,47.2100356],[33.1060739,47.2110205],[33.1049625,47.2121249],[33.1047561,47.2125028],[33.1045139,47.2130208],[33.10446,47.2135632],[33.1045856,47.2140507],[33.1050612,47.2146297],[33.1058417,47.2150441],[33.1064518,47.2155255],[33.1067056,47.2158981],[33.1066718,47.2161886],[33.1065146,47.2166225],[33.1059404,47.2172379],[33.1039935,47.2188102],[33.1018133,47.2209125],[33.0998664,47.222905],[33.0991487,47.2234473],[33.0981794,47.2237573],[33.0977703,47.2238265],[33.0970403,47.2239686],[33.0961672,47.2240112],[33.0946768,47.2238585],[33.0934084,47.2236758],[33.0922263,47.2236821],[33.0911961,47.22379],[33.0899029,47.2239445],[33.0891716,47.2239322],[33.0886904,47.2238188],[33.0884362,47.223819],[33.088185,47.2236423],[33.0879966,47.2234351],[33.0877813,47.2232889],[33.0872968,47.2231548],[33.0869379,47.2231183],[33.0864714,47.2229537],[33.0853319,47.2223383],[33.0847039,47.2219118],[33.0841835,47.2215218],[33.0834389,47.2210892],[33.0828132,47.2207087],[33.0816911,47.2204624],[33.0804361,47.2204444],[33.0794193,47.2205684],[33.078644,47.2207468],[33.0775941,47.221227],[33.0769484,47.2216273],[33.0761985,47.2221129],[33.0749327,47.2227499],[33.0741548,47.2231981],[33.0732918,47.2234277],[33.0726112,47.223483],[33.0719918,47.2233615],[33.0716139,47.2232036],[33.0714165,47.2229172],[33.0714075,47.2225942],[33.0714524,47.2223444],[33.0716433,47.2216439],[33.0720175,47.2211178],[33.0724964,47.2206958],[33.0734116,47.2202025],[33.0743542,47.2197109],[33.0747693,47.2193679],[33.075086,47.2190661],[33.0753462,47.2186091],[33.0752206,47.2183409],[33.0749245,47.2179631],[33.0747182,47.2178351],[33.0739715,47.2175585],[33.0730924,47.2174543],[33.0717697,47.217617],[33.0708333,47.2181459],[33.070304,47.2185481],[33.069335,47.2191941],[33.0688416,47.2195719],[33.0682674,47.2201081],[33.0675137,47.2204859],[33.0667242,47.2205895],[33.0660244,47.2204615],[33.0654951,47.2201264],[33.0653066,47.219779],[33.0650106,47.2192855],[33.0650823,47.2186212],[33.06519,47.2182861],[33.0653694,47.2178412],[33.0653964,47.2174086],[33.0654233,47.2170734],[33.0652887,47.2165859],[33.0647414,47.216074],[33.0643736,47.2156535],[33.0641134,47.2152269],[33.0640954,47.214971],[33.0641109,47.2148207],[33.0641224,47.2147089],[33.0642838,47.2143372],[33.064573,47.2139883],[33.0649454,47.2136388],[33.0652694,47.2133489],[33.0656156,47.2131318],[33.0657806,47.2129295],[33.0659526,47.2126551],[33.0659526,47.2123138],[33.0657769,47.2118402],[33.065522,47.2110705],[33.0653964,47.2106622],[33.0653158,47.2103551],[33.0653929,47.209861],[33.065632,47.2093982],[33.0660782,47.2087667],[33.0672001,47.2072639],[33.0674228,47.2069202],[33.0675048,47.2066396],[33.0674277,47.2064021],[33.067109,47.2058585],[33.0668637,47.2055671],[33.0664779,47.205226],[33.0663236,47.2050674],[33.0660474,47.2048039],[33.0657911,47.2044879],[33.0657642,47.2041649],[33.0657822,47.2038662],[33.0662666,47.2029641],[33.0664281,47.202513],[33.0664917,47.2022172],[33.0665368,47.2018578],[33.066523,47.2013978],[33.0662034,47.200876],[33.0658877,47.2006478],[33.0657256,47.2004328],[33.0655631,47.2002407],[33.0653071,47.2000501],[33.0650231,47.1998067],[33.0642718,47.199179],[33.0637129,47.1987438],[33.0631936,47.1984063],[33.0626919,47.1979148],[33.0619544,47.1973165],[33.0612892,47.1967406],[33.0605918,47.1960407],[33.0598496,47.1954944],[33.0590737,47.1950966],[33.0581081,47.1944332],[33.0572873,47.1938901],[33.0563886,47.1934176],[33.0558175,47.1932011],[33.0552115,47.1931227],[33.0546838,47.1929886],[33.0542622,47.1927043],[33.0537971,47.1921119],[33.0534189,47.1918385],[33.0530172,47.1916189],[33.0525609,47.191351],[33.0520873,47.1911937],[33.0514361,47.1911498],[33.0506822,47.1911964],[33.0502384,47.1912086],[33.0497888,47.191194],[33.048513,47.1910158],[33.0472605,47.1906817],[33.0459736,47.1904448],[33.0450424,47.1902756],[33.0439031,47.1901353],[33.0427497,47.1900768],[33.0418631,47.1900277],[33.0404092,47.1897427],[33.0393809,47.1894927],[33.0386897,47.1892632],[33.0378951,47.1889851],[33.0372004,47.1886707],[33.0365673,47.188101],[33.0360223,47.1874974],[33.0356186,47.1866072],[33.0354392,47.1858267],[33.0351969,47.184345],[33.0352508,47.1835889],[33.0352691,47.1830666],[33.0354327,47.1826998],[33.0357392,47.1820915],[33.0363185,47.1815255],[33.037081,47.1810643],[33.0377485,47.1804903],[33.0384717,47.179552],[33.0385651,47.179159],[33.0384984,47.1787774],[33.0384529,47.1786217],[33.0382972,47.1784009],[33.0378879,47.1782057],[33.0375146,47.1781689],[33.036747,47.1782133],[33.0360438,47.178235],[33.0354166,47.1782862],[33.034725,47.178279],[33.0332255,47.1781838],[33.0325091,47.1781185],[33.031536,47.1779303],[33.0298965,47.1776474],[33.0286398,47.1772884],[33.0274605,47.1768584],[33.0269195,47.1767422],[33.0260705,47.1766032],[33.0255127,47.1766886],[33.0253009,47.1769175],[33.0250948,47.1770517],[33.024725,47.1771849],[33.0242299,47.1772556],[33.0237543,47.1773965],[33.0232825,47.1776387],[33.0220546,47.1784893],[33.020824,47.1790997],[33.0190438,47.1795494],[33.0168427,47.1798747],[33.0156173,47.1803274],[33.0141886,47.1815917],[33.0133348,47.1823489],[33.0128645,47.1829379],[33.0124801,47.1837169],[33.0123096,47.1842657],[33.0122827,47.1848816],[33.0125788,47.1854852],[33.0133503,47.1860584],[33.0139156,47.1869059],[33.0141132,47.1875022],[33.0141091,47.1878314],[33.0140219,47.1880522],[33.0138278,47.1885989],[33.0135483,47.188968],[33.0132815,47.1894513],[33.012962,47.1899725],[33.0126607,47.1906166],[33.01227,47.1911438],[33.0116403,47.1918662],[33.0112225,47.1923544],[33.0106406,47.1929654],[33.0097755,47.193745],[33.0088754,47.1946334],[33.008272,47.1952224],[33.0070743,47.196107],[33.0062169,47.1965401],[33.0052265,47.1967264],[33.0044164,47.1969024],[33.0034979,47.1968859],[33.0023595,47.1968158],[33.0016009,47.1967546],[33.0011951,47.1966604],[33.0006977,47.1963898],[33.0002662,47.1958866],[32.9998157,47.1945179],[32.9995948,47.1937383],[32.9995183,47.1932127],[32.9995438,47.1928316],[32.9995484,47.1925255],[32.9996896,47.1923809],[33.0000243,47.1921702],[33.0008111,47.1920854],[33.0018886,47.1919455],[33.002611,47.19183],[33.0030445,47.1917222],[33.0033682,47.1915841],[33.0035467,47.1913184],[33.0036147,47.1910759],[33.003619,47.1908354],[33.0033131,47.190467],[33.0029314,47.1902297],[33.0020432,47.1899944],[33.0014042,47.1899236],[33.0009287,47.1899482],[33.000149,47.1901142],[32.9993886,47.1904258],[32.99857,47.1908553],[32.9980605,47.1910587],[32.9971815,47.1912132],[32.9962946,47.1912888],[32.9953369,47.19121],[32.9946001,47.1911254],[32.9928173,47.1907656],[32.9920524,47.1905464],[32.9916129,47.1904497],[32.9913268,47.1909014],[32.9903815,47.1906904],[32.988644,47.1904858],[32.9859939,47.1921142],[32.9830545,47.1918392],[32.981254,47.1913607],[32.9797702,47.1912414],[32.9761045,47.191092],[32.9714788,47.1906149],[32.9683805,47.1903464],[32.9648023,47.1899586],[32.961355,47.1896302],[32.9611816,47.1880535],[32.9614881,47.1865959],[32.9607042,47.1844835],[32.960007,47.1831743],[32.9584383,47.1804964],[32.9573049,47.1791275],[32.9566952,47.1778481],[32.9560417,47.1765984],[32.9550395,47.1751105],[32.9544733,47.1740691],[32.9527311,47.170796],[32.9514244,47.1685941],[32.9505535,47.1669873],[32.9495951,47.1655887],[32.948681,47.1636248],[32.9477634,47.1627338],[32.947374,47.1620773],[32.9462191,47.1610974],[32.9453908,47.1606615],[32.9417517,47.1581775],[32.9391807,47.1562127],[32.9360874,47.1535634],[32.9348676,47.1525215],[32.934127,47.1519558],[32.9324712,47.1508839],[32.9312515,47.1499015],[32.9284623,47.1486503],[32.9261958,47.1479051],[32.9238855,47.1473681],[32.9218802,47.14698],[32.9200065,47.146116],[32.9187006,47.1446872],[32.9178741,47.1434371],[32.9174398,47.1423361],[32.9174417,47.1411164],[32.9181864,47.138856],[32.9189295,47.1375773],[32.9196291,47.1362094],[32.919849,47.1349303],[32.9195891,47.1338592],[32.919198,47.1329962],[32.9180667,47.1316567],[32.9164995,47.1302573],[32.9135382,47.1284999],[32.9111437,47.1267727],[32.9102735,47.12582],[32.9098828,47.1248677],[32.9097537,47.1238859],[32.9091459,47.122517],[32.9082762,47.1213263],[32.9068393,47.1205517],[32.9073198,47.1199571],[32.9094154,47.1178168],[32.9106377,47.1165684],[32.9117728,47.1153793],[32.9124278,47.1145766],[32.9126478,47.1132678],[32.9126941,47.1116019],[32.9128701,47.1106203],[32.9133524,47.1087465],[32.9136592,47.1076757],[32.9144459,47.1061889],[32.9146216,47.1052965],[32.913884,47.103392],[32.9128404,47.1021418],[32.9116223,47.1010104],[32.9108842,47.0995223],[32.910364,47.0980047],[32.9098444,47.0960706],[32.9103274,47.0938696],[32.9117239,47.0923237],[32.9130768,47.0907778],[32.9147786,47.0888454],[32.9166978,47.0871808],[32.9182226,47.0869439],[32.9205753,47.0864696],[32.9238864,47.0858174],[32.9251945,47.0848365],[32.9260238,47.0835578],[32.9279285,47.0815668],[32.9305061,47.0803916],[32.9328384,47.0794697],[32.9394634,47.0767972],[32.9439766,47.0749706],[32.950032,47.0722959],[32.9559559,47.0699482],[32.9580462,47.0695325],[32.9646664,47.0667383],[32.9724616,47.0634085],[32.983173,47.0590375],[32.9881363,47.0568069],[32.9950145,47.05413],[32.9984089,47.0528211],[33.0017784,47.050367],[33.0074191,47.0481773],[33.0118797,47.0460988],[33.0178773,47.0436352],[33.0242266,47.0410066],[33.0269084,47.0396692],[33.0515956,47.0700634],[33.0729674,47.0624047],[33.102579,47.099811],[33.0819797,47.1075813],[33.1050252,47.1366073],[33.1232214,47.1297391],[33.1557081,47.1174531],[33.093245,47.0393468],[33.0891359,47.0412204],[33.0721782,47.0203573],[33.0677703,47.0222432],[33.0594835,47.012815],[33.054579,47.0077148],[33.0511519,47.0040798],[33.0498425,47.0026714],[33.0492574,47.0019863],[33.0483379,47.0007491],[33.0478626,47.0002625],[33.0442647,46.9961752],[33.0224893,46.9727807],[33.0187701,46.9730244],[33.0112689,46.9772623],[32.9987017,46.9825559],[32.9841424,46.9886808],[32.9664033,46.99628],[32.9631808,46.9976603],[32.9542201,47.0014056],[32.951349,47.0025349],[32.9496959,47.0031886],[32.9460472,46.998903],[32.9408352,46.993486],[32.9366151,46.9891071],[32.934582,46.9869971],[32.9339743,46.9862828],[32.9381552,46.9798592],[32.9418132,46.9737922],[32.9433831,46.9688545],[32.9445181,46.9639761],[32.9453034,46.960942],[32.9471348,46.9545764],[32.9496623,46.9465451],[32.9499235,46.9460097],[32.9653005,46.9479194],[32.9758582,46.9487523],[32.9778148,46.9412585],[32.9791123,46.9365712],[32.9793322,46.9357373],[32.9796812,46.9343844],[32.9798654,46.9336997],[32.9620106,46.9313179],[32.9468124,46.9292293],[32.9459438,46.9293479],[32.9442931,46.9297041],[32.9276194,46.9277312],[32.921715,46.9266563],[32.922586,46.9249314],[32.9239836,46.9192798],[32.9255553,46.9130928],[32.9260797,46.9106537],[32.9246045,46.9100577],[32.9105419,46.9082625],[32.8799023,46.9045454],[32.8516971,46.9010018],[32.8414564,46.900036],[32.8396423,46.8970585],[32.8392106,46.8962844],[32.8391937,46.8961731],[32.8409482,46.8957513],[32.8420803,46.8945033],[32.8419142,46.8919446],[32.8407936,46.889325],[32.8375923,46.886048],[32.8360347,46.8845583],[32.8368468,46.883252],[32.8377941,46.8828935],[32.8383546,46.8825934],[32.8409021,46.8820066],[32.8448103,46.880941],[32.8495015,46.8790432],[32.8528887,46.8779766],[32.8564489,46.8770292],[32.861741,46.8773927],[32.869028,46.8781153],[32.8757951,46.8786583],[32.8843837,46.8795599],[32.8922784,46.8804601],[32.9013885,46.8812418],[32.9070278,46.8820201],[32.9152698,46.883276],[32.9160522,46.8823841],[32.9175351,46.8773871],[32.9184112,46.8719137],[32.9198948,46.8661432],[32.9366934,46.867745],[32.9462653,46.8686577],[32.9491152,46.8579487],[32.9046449,46.8515657],[32.8981972,46.8506524],[32.897579,46.8505959],[32.8814158,46.8482],[32.8716194,46.8467613],[32.8707516,46.8469984],[32.8684108,46.8466982],[32.8554071,46.8449569],[32.8534129,46.8448354],[32.8507256,46.8444749],[32.8435308,46.8435133],[32.8357265,46.8426101],[32.8136251,46.8401364],[32.8149425,46.8352594],[32.8147714,46.8346046],[32.8002109,46.8330926],[32.7810563,46.83157],[32.776203,46.8311441],[32.7755981,46.8306669],[32.7759506,46.829299],[32.7794364,46.8249027],[32.7785725,46.8241871],[32.773469,46.821559],[32.7715653,46.8207817],[32.7674922,46.820595],[32.7645995,46.8279672],[32.7617397,46.8277233],[32.7484841,46.8259694],[32.7471832,46.8260855],[32.745879,46.8269156],[32.7453543,46.8278665],[32.7429267,46.8279205],[32.7272483,46.8253852],[32.7175462,46.8240526],[32.7093166,46.8230204],[32.7073259,46.8210153],[32.7069074,46.821064],[32.7060899,46.8211592],[32.7024888,46.820819],[32.7013967,46.8207644],[32.7010612,46.8207937],[32.7008188,46.8208854],[32.7005317,46.821034],[32.6999329,46.8213157],[32.6996398,46.8214475],[32.6991788,46.8216105],[32.6988647,46.8217779],[32.6984655,46.8220415],[32.6983427,46.8221573],[32.6981428,46.8224517],[32.6978757,46.8226363],[32.6975098,46.8239918],[32.6935499,46.8398344],[32.6921175,46.8455495],[32.6920936,46.845892],[32.6915418,46.8479815],[32.6912792,46.8488255],[32.6909116,46.8501634],[32.6900058,46.8538244],[32.6899243,46.854433],[32.6897758,46.854926],[32.6895836,46.8560217],[32.6885485,46.8596258],[32.6882508,46.8610327],[32.6878845,46.8620814],[32.6851757,46.8617729],[32.6824799,46.8614902],[32.6770956,46.8608481],[32.6760814,46.8606749],[32.6723802,46.8602406],[32.6719744,46.8601482],[32.6687857,46.8597721],[32.6685957,46.8598095],[32.668427,46.8598842],[32.6682244,46.8599192],[32.6636752,46.8594261],[32.6487409,46.8577187],[32.6423209,46.8569457],[32.6412969,46.8568294],[32.6410509,46.8565794],[32.635584,46.8561893],[32.623969,46.8550807],[32.6174686,46.8544047],[32.6149533,46.8543962],[32.6152095,46.8559751],[32.6133183,46.8565115],[32.612071,46.857183],[32.6111053,46.8587863],[32.5943771,46.8570622],[32.5854524,46.8558401],[32.5849228,46.8570282],[32.5843859,46.8591683],[32.5836015,46.8596415],[32.5803086,46.8592129],[32.5785743,46.8591471],[32.5780483,46.8598591],[32.5780352,46.8615251],[32.5775016,46.8631892],[32.5749865,46.8631203],[32.5723841,46.8631106],[32.5717759,46.8632274],[32.571931,46.8655485],[32.5720822,46.8683456],[32.5713602,46.8718534],[32.5704869,46.8725642],[32.5467399,46.869438],[32.5455734,46.8740149],[32.5450045,46.8797247],[32.5450666,46.8826405],[32.5442811,46.8831729],[32.5380397,46.8823744],[32.5343109,46.8820617],[32.5337954,46.8814646],[32.5350246,46.8798036],[32.5354806,46.8772469],[32.5360289,46.8740361],[32.5369997,46.872136],[32.5373539,46.8713044],[32.5374657,46.8683894],[32.5386399,46.8629795],[32.5408393,46.8543013],[32.5417418,46.8501696],[32.5251772,46.8481775],[32.5278434,46.8369834],[32.5311826,46.8231376],[32.5306386,46.8231382],[32.5232267,46.8223523],[32.5219114,46.822113],[32.519907,46.8217484],[32.5189157,46.8216386],[32.4986422,46.8193936],[32.4818812,46.8178156],[32.4693254,46.816568],[32.4680668,46.8211438],[32.4662153,46.828517],[32.4661267,46.8288699],[32.4632807,46.8404296],[32.4529296,46.8393393],[32.4438783,46.8383734],[32.432619,46.8371578],[32.4216186,46.8360912],[32.4191401,46.8363506],[32.4124689,46.8352967],[32.4111858,46.8347829],[32.3937249,46.8326513],[32.3653157,46.8292574],[32.3728903,46.7990798],[32.3415854,46.7954461],[32.3395257,46.7962109],[32.3260474,46.8010509],[32.3180866,46.8046422],[32.3183441,46.8048845],[32.3150333,46.8063332],[32.3112582,46.8080722],[32.3031789,46.811666],[32.3019868,46.8121012],[32.2956687,46.8149995],[32.2954756,46.8148233],[32.2922482,46.8162716],[32.2894642,46.8175051],[32.2808674,46.8211778],[32.2739078,46.8242745],[32.2662677,46.8276738],[32.25157,46.8342348],[32.2380801,46.8402356],[32.2275364,46.8452028],[32.2290165,46.8425535],[32.2300283,46.8409156],[32.2314146,46.8386739],[32.2339696,46.8360781],[32.2425728,46.8277756],[32.2522118,46.8196044],[32.2304225,46.8085056],[32.2288804,46.80815],[32.2096967,46.8057258],[32.2186855,46.7713054],[32.2077122,46.7694795],[32.1689531,46.7635024],[32.171543,46.7523229],[32.1540793,46.750219],[32.118393,46.7459195],[32.1118177,46.7451273],[32.1113242,46.7477475],[32.1100625,46.7476592],[32.1088909,46.752464],[32.0842106,46.7487904],[32.0815955,46.748452],[32.0674218,46.7463492],[32.05715,46.7446436],[32.0572803,46.744066],[32.0609094,46.7279785],[32.0756701,46.7299759],[32.0763857,46.7270366],[32.0805309,46.7100077],[32.0820002,46.7039705],[32.0852188,46.6908299],[32.0867801,46.6834813],[32.0718979,46.6818729],[32.0714344,46.6836777],[32.0207063,46.6775492],[32.030712,46.6689345],[31.9874104,46.6641164],[31.9885849,46.6554721],[31.9847153,46.6548122],[31.9300896,46.652885],[31.927471,46.5817546],[31.8619843,46.5234904],[31.8604159,46.5199388],[31.8587695,46.516429],[31.8585789,46.5158131],[31.8583775,46.5155248],[31.8578004,46.5146984],[31.8552693,46.5110164],[31.8527883,46.5074198],[31.8498545,46.5029969],[31.8480348,46.5004454],[31.8449252,46.4982554],[31.844083,46.4977482],[31.8431338,46.4971343],[31.8392264,46.4979545],[31.8363833,46.4985991],[31.8313848,46.499623],[31.8278107,46.4986208],[31.8275829,46.4985568],[31.822878,46.4969317],[31.8194853,46.4958368],[31.8194006,46.4958095],[31.8166637,46.4939904],[31.8144298,46.4926275],[31.8136167,46.4920256],[31.8132949,46.4916563],[31.8126501,46.4906667],[31.8121049,46.4899638],[31.8100607,46.486964],[31.8082718,46.4844247],[31.8066168,46.4820867],[31.8047302,46.479518],[31.804476,46.4791719],[31.8069219,46.4605508],[31.8073296,46.456811],[31.8078726,46.4530547],[31.8090246,46.4435351],[31.8055914,46.4309952],[31.8076513,46.403066],[31.8097113,46.3805703],[31.8109129,46.3715694],[31.8095182,46.3608196],[31.809411,46.3600051],[31.8052851,46.356219],[31.801714,46.3529418],[31.7974278,46.3490392],[31.7760192,46.3447972],[31.7664392,46.3514636],[31.7427512,46.3529859],[31.7323582,46.3535766],[31.6957718,46.3561573],[31.6726281,46.3575445],[31.600679,46.3707626],[31.5425073,46.3817142],[31.5334224,46.381562],[31.5235519,46.3812067],[31.5034804,46.3805215],[31.3814661,46.4076023],[31.1590964,46.4096818]]]}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_field`
--

CREATE TABLE IF NOT EXISTS `b_location_field` (
  `LOCATION_ID` int NOT NULL,
  `TYPE` int NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LOCATION_ID`,`TYPE`),
  KEY `IDX_BLLFL_VAL` (`VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_hierarchy`
--

CREATE TABLE IF NOT EXISTS `b_location_hierarchy` (
  `ANCESTOR_ID` int NOT NULL,
  `DESCENDANT_ID` int NOT NULL,
  `LEVEL` int NOT NULL,
  PRIMARY KEY (`ANCESTOR_ID`,`DESCENDANT_ID`),
  KEY `IX_LOC_LH_D` (`DESCENDANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_name`
--

CREATE TABLE IF NOT EXISTS `b_location_name` (
  `LOCATION_ID` int NOT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `NAME` varchar(1000) NOT NULL,
  `NAME_NORMALIZED` varchar(1000) NOT NULL,
  PRIMARY KEY (`LOCATION_ID`,`LANGUAGE_ID`),
  KEY `IX_LOC_LNN` (`NAME_NORMALIZED`(200),`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_recent_address`
--

CREATE TABLE IF NOT EXISTS `b_location_recent_address` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `ADDRESS` text,
  `USED_AT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IDX_BLRA_USER_ID_USED_AT` (`USER_ID`,`USED_AT`),
  KEY `IDX_BLRA_USED_AT` (`USED_AT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_source`
--

CREATE TABLE IF NOT EXISTS `b_location_source` (
  `CODE` varchar(15) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `CONFIG` longtext,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_location_source`
--

INSERT INTO `b_location_source` (`CODE`, `NAME`, `CONFIG`) VALUES
('GOOGLE', 'Google', 'a:4:{i:0;a:4:{s:4:\"code\";s:16:\"API_KEY_FRONTEND\";s:4:\"type\";s:6:\"string\";s:4:\"sort\";i:10;s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"code\";s:15:\"API_KEY_BACKEND\";s:4:\"type\";s:6:\"string\";s:4:\"sort\";i:20;s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"code\";s:18:\"SHOW_PHOTOS_ON_MAP\";s:4:\"type\";s:4:\"bool\";s:4:\"sort\";i:30;s:5:\"value\";b:1;}i:3;a:4:{s:4:\"code\";s:21:\"USE_GEOCODING_SERVICE\";s:4:\"type\";s:4:\"bool\";s:4:\"sort\";i:40;s:5:\"value\";b:1;}}'),
('OSM', 'OpenStreetMap', 'a:3:{i:0;a:5:{s:4:\"code\";s:11:\"SERVICE_URL\";s:4:\"type\";s:6:\"string\";s:10:\"is_visible\";b:1;s:4:\"sort\";i:10;s:5:\"value\";s:30:\"https://osm-ru-002.bitrix.info\";}i:1;a:5:{s:4:\"code\";s:15:\"MAP_SERVICE_URL\";s:4:\"type\";s:6:\"string\";s:10:\"is_visible\";b:1;s:4:\"sort\";i:15;s:5:\"value\";s:30:\"https://osm-ru-001.bitrix.info\";}i:2;a:5:{s:4:\"code\";s:5:\"TOKEN\";s:4:\"type\";s:6:\"string\";s:10:\"is_visible\";b:0;s:4:\"sort\";i:20;s:5:\"value\";N;}}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_static_map_file`
--

CREATE TABLE IF NOT EXISTS `b_location_static_map_file` (
  `HASH` char(40) NOT NULL,
  `FILE_ID` int NOT NULL,
  PRIMARY KEY (`HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_log_notification`
--

CREATE TABLE IF NOT EXISTS `b_log_notification` (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) DEFAULT NULL,
  `AUDIT_TYPE_ID` varchar(50) NOT NULL,
  `ITEM_ID` varchar(255) DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) DEFAULT NULL,
  `USER_AGENT` varchar(1000) DEFAULT NULL,
  `REQUEST_URI` varchar(1000) DEFAULT NULL,
  `CHECK_INTERVAL` int DEFAULT NULL,
  `ALERT_COUNT` int DEFAULT NULL,
  `DATE_CHECKED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_log_notification_action`
--

CREATE TABLE IF NOT EXISTS `b_log_notification_action` (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `NOTIFICATION_ID` int UNSIGNED NOT NULL,
  `NOTIFICATION_TYPE` varchar(15) NOT NULL,
  `RECIPIENT` varchar(50) DEFAULT NULL,
  `ADDITIONAL_TEXT` text,
  PRIMARY KEY (`ID`),
  KEY `ix_log_notification_action_notification_id` (`NOTIFICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_main_mail_blacklist`
--

CREATE TABLE IF NOT EXISTS `b_main_mail_blacklist` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `CATEGORY_ID` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B_MAIN_MAIL_BLACKLIST_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_main_mail_sender`
--

CREATE TABLE IF NOT EXISTS `b_main_mail_sender` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL DEFAULT '',
  `EMAIL` varchar(255) NOT NULL,
  `USER_ID` int NOT NULL,
  `IS_CONFIRMED` tinyint NOT NULL DEFAULT '0',
  `IS_PUBLIC` tinyint NOT NULL DEFAULT '0',
  `OPTIONS` text,
  `PARENT_MODULE_ID` varchar(50) NOT NULL DEFAULT 'main',
  `PARENT_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_MAIN_MAIL_SENDER_USER_ID` (`USER_ID`,`IS_CONFIRMED`,`IS_PUBLIC`),
  KEY `IX_B_MAIN_MAIL_SENDER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_main_mail_sender_send_counter`
--

CREATE TABLE IF NOT EXISTS `b_main_mail_sender_send_counter` (
  `DATE_STAT` date NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `CNT` int NOT NULL,
  PRIMARY KEY (`DATE_STAT`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_collection`
--

CREATE TABLE IF NOT EXISTS `b_medialib_collection` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` text,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int DEFAULT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `KEYWORDS` varchar(255) DEFAULT NULL,
  `ITEMS_COUNT` int DEFAULT NULL,
  `ML_TYPE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_collection_item`
--

CREATE TABLE IF NOT EXISTS `b_medialib_collection_item` (
  `COLLECTION_ID` int NOT NULL,
  `ITEM_ID` int NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_item`
--

CREATE TABLE IF NOT EXISTS `b_medialib_item` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `ITEM_TYPE` char(30) DEFAULT NULL,
  `DESCRIPTION` text,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int NOT NULL,
  `KEYWORDS` varchar(255) DEFAULT NULL,
  `SEARCHABLE_CONTENT` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_type`
--

CREATE TABLE IF NOT EXISTS `b_medialib_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) NOT NULL,
  `EXT` varchar(255) NOT NULL,
  `SYSTEM` char(1) NOT NULL DEFAULT 'N',
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_medialib_type`
--

INSERT INTO `b_medialib_type` (`ID`, `NAME`, `CODE`, `EXT`, `SYSTEM`, `DESCRIPTION`) VALUES
(1, 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'),
(2, 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'),
(3, 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');

-- --------------------------------------------------------

--
-- Структура таблицы `b_messageservice_channel`
--

CREATE TABLE IF NOT EXISTS `b_messageservice_channel` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SENDER_ID` varchar(50) NOT NULL,
  `TYPE` varchar(30) NOT NULL,
  `EXTERNAL_ID` varchar(128) NOT NULL,
  `NAME` varchar(500) NOT NULL,
  `DATE_CREATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ADDITIONAL_PARAMS` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_MS_CHANNEL_1` (`SENDER_ID`,`EXTERNAL_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_messageservice_incoming_message`
--

CREATE TABLE IF NOT EXISTS `b_messageservice_incoming_message` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `REQUEST_BODY` longtext,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SENDER_ID` varchar(50) NOT NULL,
  `EXTERNAL_ID` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_MS_INCOMING_MESSAGE_1` (`SENDER_ID`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_messageservice_message`
--

CREATE TABLE IF NOT EXISTS `b_messageservice_message` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(30) NOT NULL,
  `SENDER_ID` varchar(50) NOT NULL,
  `AUTHOR_ID` int NOT NULL DEFAULT '0',
  `MESSAGE_FROM` varchar(260) DEFAULT NULL,
  `MESSAGE_TO` varchar(50) NOT NULL,
  `MESSAGE_HEADERS` longtext,
  `MESSAGE_BODY` longtext NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) NOT NULL DEFAULT 'N',
  `EXEC_ERROR` varchar(255) DEFAULT NULL,
  `STATUS_ID` int NOT NULL DEFAULT '0',
  `EXTERNAL_ID` varchar(128) DEFAULT NULL,
  `EXTERNAL_STATUS` varchar(128) DEFAULT NULL,
  `CLUSTER_GROUP` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `B_MESSAGESERVICE_MESSAGE_1` (`DATE_EXEC`),
  KEY `B_MESSAGESERVICE_MESSAGE_2` (`SUCCESS_EXEC`,`CLUSTER_GROUP`),
  KEY `B_MESSAGESERVICE_MESSAGE_3` (`SENDER_ID`,`EXTERNAL_ID`),
  KEY `B_MESSAGESERVICE_MESSAGE_4` (`SUCCESS_EXEC`,`NEXT_EXEC`),
  KEY `B_MESSAGESERVICE_MESSAGE_5` (`DATE_INSERT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_messageservice_restriction`
--

CREATE TABLE IF NOT EXISTS `b_messageservice_restriction` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CODE` varchar(128) NOT NULL,
  `COUNTER` int DEFAULT NULL,
  `DATE_CREATE` date NOT NULL,
  `ADDITIONAL_PARAMS` text NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_MESSAGESERVISE_RESTRICTION_1` (`CODE`,`DATE_CREATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_messageservice_rest_app`
--

CREATE TABLE IF NOT EXISTS `b_messageservice_rest_app` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `APP_ID` varchar(128) NOT NULL,
  `CODE` varchar(128) NOT NULL,
  `TYPE` varchar(30) NOT NULL,
  `HANDLER` varchar(1000) NOT NULL,
  `DATE_ADD` datetime DEFAULT NULL,
  `AUTHOR_ID` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_MESSAGESERVICE_REST_APP_1` (`APP_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_messageservice_rest_app_lang`
--

CREATE TABLE IF NOT EXISTS `b_messageservice_rest_app_lang` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `APP_ID` int NOT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `NAME` varchar(500) DEFAULT NULL,
  `APP_NAME` varchar(500) DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_messageservice_template`
--

CREATE TABLE IF NOT EXISTS `b_messageservice_template` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(500) NOT NULL,
  `TITLE` varchar(500) NOT NULL,
  `DATE_CREATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_module`
--

CREATE TABLE IF NOT EXISTS `b_module` (
  `ID` varchar(50) NOT NULL,
  `DATE_ACTIVE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_module`
--

INSERT INTO `b_module` (`ID`, `DATE_ACTIVE`) VALUES
('b24connector', NULL),
('bitrix.sitecorporate', NULL),
('bitrixcloud', NULL),
('clouds', NULL),
('fileman', NULL),
('highloadblock', NULL),
('iblock', NULL),
('landing', NULL),
('location', NULL),
('main', NULL),
('messageservice', NULL),
('perfmon', NULL),
('rest', NULL),
('search', NULL),
('security', NULL),
('seo', NULL),
('socialservices', NULL),
('translate', NULL),
('ui', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_module_group`
--

CREATE TABLE IF NOT EXISTS `b_module_group` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) NOT NULL,
  `GROUP_ID` int NOT NULL,
  `G_ACCESS` varchar(255) NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_module_to_module`
--

CREATE TABLE IF NOT EXISTS `b_module_to_module` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) NOT NULL,
  `MESSAGE_ID` varchar(255) NOT NULL,
  `TO_MODULE_ID` varchar(50) NOT NULL,
  `TO_PATH` varchar(255) DEFAULT NULL,
  `TO_CLASS` varchar(255) DEFAULT NULL,
  `TO_METHOD` varchar(255) DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) DEFAULT NULL,
  `VERSION` int DEFAULT NULL,
  `UNIQUE_ID` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_module_to_module_unique_id` (`UNIQUE_ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20))
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_module_to_module`
--

INSERT INTO `b_module_to_module` (`ID`, `TIMESTAMP_X`, `SORT`, `FROM_MODULE_ID`, `MESSAGE_ID`, `TO_MODULE_ID`, `TO_PATH`, `TO_CLASS`, `TO_METHOD`, `TO_METHOD_ARG`, `VERSION`, `UNIQUE_ID`) VALUES
(1, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', 1, '2b30c309bf87645959b9bfbed51b49c6'),
(2, NULL, 100, 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', 1, 'f437e170e4daf957766b0b0579f08fb4'),
(3, NULL, 100, 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', 1, '9211999c5cfc3a4d374e4f957d5079f6'),
(4, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', 1, '9ef4e969f975b6425c7113444d210a90'),
(5, NULL, 100, 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', 1, '332179402f77c4d41c6c2e524acde4d0'),
(6, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', 1, 'e1aae03ea8eb08e7bbb6d8d42cbc2ebe'),
(7, NULL, 100, 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', 1, 'a2986b9f6e9a99c0351c2ba858dafc85'),
(8, NULL, 100, 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', 1, 'f9b70c6a75b6341063b23bde5d32e582'),
(9, NULL, 100, 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', 1, 'a0aecef95a192ec3dd134f71f0f4f175'),
(10, NULL, 100, 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', 1, '6476f96ffba6ab2b4a7dbe644f42edf6'),
(11, NULL, 100, 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', 1, '6122bee2ad083f8f72e35655cee48859'),
(12, NULL, 100, 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', 1, 'f8f806e33dc35737bdbe6b9bc42626a4'),
(13, NULL, 100, 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', 1, '9244ca7fd6964757ca191c9407cb1218'),
(14, NULL, 100, 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', 1, 'd8ae8e1f8889b1fbb6af276fb14c8411'),
(15, NULL, 100, 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', 1, '129315715250c195ee115002b445a156'),
(16, NULL, 100, 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', 1, 'bf1f5deaa1532fe9a28acd6d19d23a80'),
(17, NULL, 100, 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', 1, '298e763431f7f7d6c3af9798663f410d'),
(18, NULL, 100, 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', 1, '4ecdc4a15e24c49f0fa8f44064bf1511'),
(19, NULL, 100, 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', 1, '6ac10928b76183004ba0e88ace0a1b5b'),
(20, NULL, 100, 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', 1, '06769c4f6bbba4fad79c1619a874ee97'),
(21, NULL, 100, 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', 1, 'ecb9ae0476db69da6c95b06bcb3aebbb'),
(22, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', 1, '9fe6984fd29b7ab9508ac02c23690094'),
(23, NULL, 100, 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', 1, '02f2fe70b9068a6b307192321fe74430'),
(24, NULL, 100, 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', 1, 'ef0f2e4d0ae7bbf59d0798e8078143f9'),
(25, NULL, 100, 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', 1, 'd3ec9527c0e77709402a05ae4249afca'),
(26, NULL, 100, 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', 1, '0de6c5b48e9382f6e857d79f76d95f25'),
(27, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', 1, 'ac0b8b7a5e703131a3bd41b4399bc032'),
(28, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', 1, '1ddb38ccf35a8a9da5d3b2bc80591ad6'),
(29, NULL, 100, 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', 1, 'c1f65f88d449e8b8a3b7af9d54ef3f50'),
(30, NULL, 100, 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', 1, '8af99568465a1ccdb6a84e868cf5aad8'),
(31, NULL, 110, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', 1, '09f8200652932044934bd3c522e920c5'),
(32, NULL, 120, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', 1, '71ef247b3eb3b07e4bd6940791b89497'),
(33, NULL, 130, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', 1, '4fe2008255fe567423cc0c2f080ca741'),
(34, NULL, 140, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', 1, '686c0679e60bee52dbcc27f5502277b6'),
(35, NULL, 145, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', 1, '7e19b5fc5fc48b1cd317a6ac44d84236'),
(36, NULL, 150, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', 1, '4d5e1dd2369089f2db9480549241205f'),
(37, NULL, 155, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeUrl', 'GetUserTypeDescription', '', 1, '79fcd650625b296abf13216cd5af2428'),
(38, NULL, 160, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', 1, '67b9a4fbc45240a7887b73e3a246eba0'),
(39, NULL, 170, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', 1, 'fbebdb289fe38c1fbfeda4d3d8ee43ef'),
(40, NULL, 180, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', 1, '2065f8305645790970bac0b99f127f47'),
(41, NULL, 190, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', 1, '65bda5818e3545f1683a3ff5271cc891'),
(42, NULL, 200, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', 1, '47e3cf1c280e01dbaed43f9989a6747b'),
(43, NULL, 210, 'main', 'OnUserTypeBuildList', 'main', '', '\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType', 'getUserTypeDescription', '', 1, '719d15ee5f60f6348d2bd6a8911aeed1'),
(44, NULL, 100, 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', 1, 'ff5eb984fe6ce3e8d769bf3ba646b902'),
(45, NULL, 100, 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', 1, '0782f5a6df6dd52d834caea88c3ba3a7'),
(46, NULL, 100, 'main', 'OnFileDelete', 'main', '', '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable', 'onFileDelete', '', 1, '54c80cd94412db221338aeb59902f059'),
(47, NULL, 100, 'socialnetwork', 'OnSocNetLogDelete', 'main', '', 'CUserCounter', 'OnSocNetLogDelete', '', 1, '33e603755a0bc07abd51a1f8ed52966e'),
(48, NULL, 100, 'socialnetwork', 'OnSocNetLogCommentDelete', 'main', '', 'CUserCounter', 'OnSocNetLogCommentDelete', '', 1, '51ee2214895be904a880046f43e84138'),
(49, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'main', '', 'CMpNotifications', 'OnAdminInformerInsertItemsHandlerMP', '', 1, 'c89c0e94ac1110c334a24c70e1773daa'),
(50, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'main', '', '\\Bitrix\\Main\\Rest\\Handlers', 'onRestServiceBuildDescription', '', 1, 'c0b0c358a21b648d4f9c5d29d17a5ab2'),
(51, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeAdd', '', 1, 'e204684efc0764af9431ca94b950619a'),
(52, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onAfterUserTypeAdd', '', 1, '50932fb244caf7af686fac906caf3e73'),
(53, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeDelete', '', 1, 'd22a86deba0ff4bd031d022e331033b4'),
(54, NULL, 100, 'main', 'OnAuthProvidersBuildList', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessAuthProvider', 'getProviders', '', 1, '3a2839dac113bf47bce01812903e768a'),
(55, NULL, 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionUpdate', '', 1, 'dde505dba68c59bd4661b7680c329485'),
(56, NULL, 100, 'iblock', 'OnBeforeIBlockSectionAdd', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionAdd', '', 1, 'd3a665b1890dabbba32ff01e3e46ec57'),
(57, NULL, 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionDelete', '', 1, '157add4b02621a60fabf1369c3e7ea9b'),
(58, NULL, 100, 'sale', 'OnSaleBasketItemSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', 2, 'fa4fc3924ff2585e92f8bdabaf287864'),
(59, NULL, 100, 'sale', 'OnSaleOrderSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', 2, '6b358bb17b30da91b105fb1451ed9aaa'),
(60, NULL, 100, 'sale', 'OnSaleOrderPaid', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', 2, '8f5ca6e1c5136cb4bbf30474f0ff4183'),
(61, NULL, 1000, 'sale', 'onBuildDiscountConditionInterfaceControls', 'main', '', '\\Bitrix\\Main\\Discount\\UserConditionControl', 'onBuildDiscountConditionInterfaceControls', '', 1, '9f0d91c081704e52b52f540b3acaf52e'),
(62, NULL, 100, 'main', 'OnBeforePhpMail', 'main', '', '\\Bitrix\\Main\\Mail\\Sender', 'applyCustomSmtp', '', 2, '10fbf5b8dec05a02d8d7010e594f16ec'),
(63, NULL, 100, 'main', 'OnBuildFilterFactoryMethods', 'main', '', '\\Bitrix\\Main\\Filter\\FactoryMain', 'onBuildFilterFactoryMethods', '', 2, '19f10c2686a955bd8b8116ea1f1ad829'),
(64, NULL, 100, 'main', 'onGetUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onGetUserFieldValues', '', 2, '7f9a5e25d638a6bff29f0bf4666da1a9'),
(65, NULL, 100, 'main', 'onUpdateUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onUpdateUserFieldValues', '', 2, 'd78761f994d74258421d271810f03ebf'),
(66, NULL, 100, 'main', 'onDeleteUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onDeleteUserFieldValues', '', 2, '074b2e25238a00ffc809ad12b609db2c'),
(67, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '37b1b1538fa6a6c5f41c9ce4afbf2789'),
(68, NULL, 100, 'main', 'OnAfterUserTypeUpdate', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '6a53bbd6e85686f4aa8a69d3d75f7e37'),
(69, NULL, 100, 'main', 'OnAfterUserTypeDelete', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '010cc1e3107418a1fd9f9a4cde7d93b9'),
(70, NULL, 100, 'main', 'OnBuildGlobalMenu', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBuildGlobalMenu', '', 1, '9c4452a442bacc2d4d70635962485be1'),
(71, NULL, 100, 'main', 'OnBeforeProlog', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBeforeProlog', '', 1, '641053ff6ee8ff57518d7c30724530e5'),
(72, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', 1, 'bc7c322534797a9ed3493c40e1b8fdac'),
(73, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudBackup', 'OnAdminInformerInsertItems', '', 1, '5499039afdd0fdb38d4b245c8b886dcb'),
(74, NULL, 100, 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'bitrixcloud', '', 'CBitrixCloudMobile', 'OnBeforeAdminMobileMenuBuild', '', 1, '5828a8cdb2cc45e2724ef1c76139df88'),
(75, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'clouds', '', 'CCloudStorage', 'GetAuditTypes', '', 1, 'da69722ba95497cf263381b46e24df40'),
(76, NULL, 90, 'main', 'OnBeforeProlog', 'clouds', '', 'CCloudStorage', 'OnBeforeProlog', '', 1, 'f8c39ff182ad873715f10a7091f928a4'),
(77, NULL, 100, 'main', 'OnAdminListDisplay', 'clouds', '', 'CCloudStorage', 'OnAdminListDisplay', '', 1, '8ddf4f578e7229a63cba4d2124c7643c'),
(78, NULL, 100, 'main', 'OnBuildGlobalMenu', 'clouds', '', 'CCloudStorage', 'OnBuildGlobalMenu', '', 1, 'd6d308843a6521ad50bfa230a2fcef8f'),
(79, NULL, 100, 'main', 'OnFileSave', 'clouds', '', 'CCloudStorage', 'OnFileSave', '', 1, '1e4f94a842d6166359ed1789a6f21245'),
(80, NULL, 100, 'main', 'OnAfterFileSave', 'clouds', '', 'CCloudStorage', 'OnAfterFileSave', '', 1, 'c36bae07a3080f9b5bc5d422ec96933f'),
(81, NULL, 100, 'main', 'OnGetFileSRC', 'clouds', '', 'CCloudStorage', 'OnGetFileSRC', '', 1, '7ec03b3b7ad3f2f54c1e438a1172e5a8'),
(82, NULL, 100, 'main', 'OnFileCopy', 'clouds', '', 'CCloudStorage', 'OnFileCopy', '', 1, '6880b56c76f7d3c5d09f887fca6341ca'),
(83, NULL, 100, 'main', 'OnPhysicalFileDelete', 'clouds', '', 'CCloudStorage', 'OnFileDelete', '', 1, '3151c487c747a57d7817f68e97fd1c94'),
(84, NULL, 100, 'main', 'OnMakeFileArray', 'clouds', '', 'CCloudStorage', 'OnMakeFileArray', '', 1, '713ea8a7a25764b1af60f7a1ec3032d5'),
(85, NULL, 100, 'main', 'OnBeforeResizeImage', 'clouds', '', 'CCloudStorage', 'OnBeforeResizeImage', '', 1, '705cd310c52f9c7e8e0c8a0578a22667'),
(86, NULL, 100, 'main', 'OnAfterResizeImage', 'clouds', '', 'CCloudStorage', 'OnAfterResizeImage', '', 1, 'a403ad2328227153475df0c478a465cc'),
(87, NULL, 100, 'main', 'OnAfterFileDeleteDuplicate', 'clouds', '', 'CCloudStorage', 'OnAfterFileDeleteDuplicate', '', 1, 'c5f3eb3991b50d4f80c2ccbdc94f8656'),
(88, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_AmazonS3', 'GetObjectInstance', '', 1, 'a4eb7ed1f50b5931474c565f448a4069'),
(89, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_GoogleStorage', 'GetObjectInstance', '', 1, '1e559e2225608e8d40eeede5b7526f2a'),
(90, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_OpenStackStorage', 'GetObjectInstance', '', 1, '5ad09feff5dab28ab571ad034ccdf2ea'),
(91, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_RackSpaceCloudFiles', 'GetObjectInstance', '', 1, 'cc976773610cf809bb56871ac7dd9f01'),
(92, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_ClodoRU', 'GetObjectInstance', '', 1, 'faadad31436e94c420ed787e4424714b'),
(93, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Selectel', 'GetObjectInstance', '', 1, '5e63a8eebed42bd099b4a9ef62e8d52b'),
(94, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_HotBox', 'GetObjectInstance', '', 1, '1913169adcd6d6f3b7fb5f3b70ba1fd8'),
(95, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Yandex', 'GetObjectInstance', '', 1, '12bd1d4f0d145d5b1681955612fe61c8'),
(96, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_S3', 'GetObjectInstance', '', 1, '4af3f0ba1f50ed9be6efcdb55dfbee4e'),
(97, NULL, 100, 'perfmon', 'OnGetTableSchema', 'clouds', '', 'clouds', 'OnGetTableSchema', '', 1, 'd31a1f80f07441976eb1711db4902a71'),
(98, NULL, 100, 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', 1, 'd10f791d422ba0e7551ab267db50404c'),
(99, NULL, 100, 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', 1, 'b00a6174fb1763684c299ccf5e054c65'),
(100, NULL, 100, 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', 1, '58ae853e2b7c230b5cdb51129efd8a05'),
(101, NULL, 100, 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', 1, '7bdbd354eab11f376fa257a998587277'),
(102, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', 1, 'd9d06fd05f80b33379359ebd8e36e655'),
(103, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', 1, '20ca1d02998884b5abec68b32fdb561d'),
(104, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', 1, '991c32062e05844708a5cf7aba37bf9a'),
(105, NULL, 100, 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', 1, '41bc5efb49ebf8d165acd4e4d556f60c'),
(106, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', 1, 'e0a610651ffec1fbddb2f261223fb2e9'),
(107, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', 1, 'fbfef1ef99530f6eae191da293f9566c'),
(108, NULL, 154, 'main', 'OnUserTypeBuildList', 'fileman', '', '\\Bitrix\\Fileman\\UserField\\Address', 'getUserTypeDescription', '', 1, 'f0583a376e38d3d2675513b1a367ed3c'),
(109, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', 1, 'f9dcff287cf7753e5c56974d37975507'),
(110, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', 1, 'd1fa2865e72eca144b964b6fb1eefc15'),
(111, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', 1, '1bf13707e1a45b8320c2ecd35534cbb4'),
(112, NULL, 100, 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', 1, '2ac4a2154f4fd85d67b50f412ed5ed48'),
(113, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', 1, 'a6f7df502db8a04590e43188d7cbfc99'),
(114, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', 1, 'f2320df213f38adf32364d3169d5b197'),
(115, NULL, 100, 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', 1, '46aef774958db327c1170a12d3a70ee5'),
(116, NULL, 100, 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', 1, '861f6ee2ca56bf63c3af07db0553606b'),
(117, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', 1, '2a6d446893d46f04f2c151f458d2908c'),
(118, NULL, 100, 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', 1, 'c6c8111f129e0eb19e558106e354e6f6'),
(119, NULL, 100, 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', 1, '0ae9fc756bfb1273309240cd8f535672'),
(120, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', 1, '182d19c163e3a5a965bca170c3fb0e83'),
(121, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', 1, 'f7a182e8d9b204970d111e4703b9f523'),
(122, NULL, 200, 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', 1, '6da245944e376d586a3fa2aaee02c70b'),
(123, NULL, 100, 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', 1, '01b3f9984fa07b1dfb4bc35d107d5672'),
(124, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', 1, '2dbbccdee3f2e7bd86446bec02be1d54'),
(125, NULL, 100, 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', 1, '78f090ee29030c54788098b0782d28f9'),
(126, NULL, 100, 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', 1, '4b71a345c136beed338aa7137943d80b'),
(127, NULL, 100, 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', 1, '3de75587a47352dd3cb6d10866f69385'),
(128, NULL, 10, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDate', 'GetUserTypeDescription', '', 1, 'fa608e2c397b6793c54ad296619a22e2'),
(129, NULL, 20, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDateTime', 'GetUserTypeDescription', '', 1, '78554c9e3c38ac383d51f0ee4d013120'),
(130, NULL, 30, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyXmlID', 'GetUserTypeDescription', '', 1, '952fe5f2ea67493fb9f9b924ce1b992b'),
(131, NULL, 40, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyFileMan', 'GetUserTypeDescription', '', 1, 'fd688441d5e8203751fb47374931e011'),
(132, NULL, 50, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyHTML', 'GetUserTypeDescription', '', 1, '27645f81ce5d6d9f19a47cc171860beb'),
(133, NULL, 60, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementList', 'GetUserTypeDescription', '', 1, 'c53e9314ae43c30267b32310a02d7df4'),
(134, NULL, 70, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySequence', 'GetUserTypeDescription', '', 1, '3ff9528d1264fc77697248957aafdab5'),
(135, NULL, 80, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementAutoComplete', 'GetUserTypeDescription', '', 1, '0d233a1e7a0d6a52a52e13df88291024'),
(136, NULL, 90, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySKU', 'GetUserTypeDescription', '', 1, '8678bc826ced4f66640fba3775b18516'),
(137, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySectionAutoComplete', 'GetUserTypeDescription', '', 1, '26ff6f651cb94a1fe4ce9827566f0730'),
(138, NULL, 100, 'main', 'onVirtualClassBuildList', 'iblock', '', 'Bitrix\\Iblock\\IblockTable', 'compileAllEntities', '', 2, '8a4e85071d25e6ba7f9ed315874c411b'),
(139, NULL, 100, 'ai', 'onTuningLoad', 'landing', '', '\\Bitrix\\Landing\\Connector\\Ai', 'onTuningLoad', '', 2, '64d7f5f3d8a372fb0d441d82a49f369b'),
(140, NULL, 100, 'ai', 'onBeforeCompletions', 'landing', '', '\\Bitrix\\Landing\\Connector\\Ai', 'onBeforeCompletions', '', 2, '9192985f1e2da4ddd7a3328eb95a975e'),
(141, NULL, 100, 'bitrix24', 'onAfterPortalBlockedByLicenseScanner', 'landing', '', '\\Bitrix\\Landing\\Connector\\Bitrix24', 'onAfterPortalBlockedByLicenseScanner', '', 2, '7fa7fc40cbb93c4a7902d7773bd7e33c'),
(142, NULL, 100, 'crm', 'onAfterCrmCompanyAdd', 'landing', '', '\\Bitrix\\Landing\\Connector\\Crm', 'onAfterCompanyChange', '', 2, '7e8fed841380d8075d45525f328e8940'),
(143, NULL, 100, 'crm', 'onAfterCrmCompanyUpdate', 'landing', '', '\\Bitrix\\Landing\\Connector\\Crm', 'onAfterCompanyChange', '', 2, '688027a0f389137b02ac0a834f0a8495'),
(144, NULL, 100, 'iblock', 'onAfterIBlockSectionDelete', 'landing', '', '\\Bitrix\\Landing\\Connector\\Iblock', 'onAfterIBlockSectionDelete', '', 2, 'ffe8a984ae7ff50064ac74e788a80118'),
(145, NULL, 100, 'intranet', 'onBuildBindingMenu', 'landing', '', '\\Bitrix\\Landing\\Connector\\Intranet', 'onBuildBindingMenu', '', 2, 'd5464da9aea2308d3d5f13c2387c4c40'),
(146, NULL, 100, 'landing', 'onBuildSourceList', 'landing', '', '\\Bitrix\\Landing\\Connector\\Landing', 'onSourceBuildHandler', '', 2, 'fc391addc82a816df68510b0ae3363a5'),
(147, NULL, 100, 'main', 'onBeforeSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onBeforeMainSiteDelete', '', 2, '5faa9b5de931dbb101e2e0aef6fc594b'),
(148, NULL, 100, 'main', 'onSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onMainSiteDelete', '', 2, 'af029bceca7ea9cc809515e95bd3a710'),
(149, NULL, 100, 'main', 'onUserConsentProviderList', 'landing', '', '\\Bitrix\\Landing\\Site\\Cookies', 'onUserConsentProviderList', '', 2, 'f59a96e272348f934d62ba5d3ee79f21'),
(150, NULL, 100, 'main', 'OnAfterFileDeleteDuplicate', 'landing', '', '\\Bitrix\\Landing\\Update\\Block\\DuplicateImages', 'onAfterFileDeleteDuplicate', '', 2, 'b80f7597db6200591a0e0e41c14e0ee0'),
(151, NULL, 100, 'mobile', 'onMobileMenuStructureBuilt', 'landing', '', '\\Bitrix\\Landing\\Connector\\Mobile', 'onMobileMenuStructureBuilt', '', 2, '01fd8a44b83b5f7fcd2f36a626657ad0'),
(152, NULL, 100, 'rest', 'onRestServiceBuildDescription', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restBase', '', 2, '9af99ddecf2dd8c3c5b14721f23e8fef'),
(153, NULL, 100, 'rest', 'onBeforeApplicationUninstall', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'beforeRestApplicationDelete', '', 2, 'ef1f080a088ad54298a4ba9bf2896313'),
(154, NULL, 100, 'rest', 'onRestAppDelete', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restApplicationDelete', '', 2, '031cfc016e3be91368376a391c351dea'),
(155, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifest', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'getManifestList', '', 2, 'b88124aac7c2c8ddecf2ce127a9c6ef8'),
(156, NULL, 100, 'rest', 'onRestApplicationConfigurationExport', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onEventExportController', '', 2, '917b00a9f82e6b8f7899a6e8c3b22236'),
(157, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifestSetting', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onInitManifest', '', 2, '99fa9aa37a23a371cca0153c840c7802'),
(158, NULL, 100, 'rest', 'onRestApplicationConfigurationEntity', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'getEntityList', '', 2, '820df699b9abf22ce0356fc9957be794'),
(159, NULL, 100, 'rest', 'onRestApplicationConfigurationImport', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onEventImportController', '', 2, 'e65daaed01b2c52e6098ee47ddb7f07a'),
(160, NULL, 100, 'rest', 'onRestApplicationConfigurationFinish', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onFinish', '', 2, '45343e5617dca2ad06a5d13050232caf'),
(161, NULL, 100, 'seo', 'onExtensionInstall', 'landing', '', '\\Bitrix\\Landing\\Hook\\Page\\PixelFb', 'changeBusinessPixel', '', 2, '27bf01f04349ff82ede423de62df5384'),
(162, NULL, 100, 'socialnetwork', 'onFillSocNetFeaturesList', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onFillSocNetFeaturesList', '', 2, '9825d91c89b53b69655aa98ea4f3a6cf'),
(163, NULL, 100, 'socialnetwork', 'onFillSocNetMenu', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onFillSocNetMenu', '', 2, '14ecfb8fb4fc20f22ddb5ac64783461d'),
(164, NULL, 100, 'socialnetwork', 'onSocNetGroupDelete', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onSocNetGroupDelete', '', 2, '78202f1461a8822a105a19f45502c327'),
(165, NULL, 100, 'socialnetwork', 'onSocNetFeaturesUpdate', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onSocNetFeaturesUpdate', '', 2, 'd385df085957d9e418b63017d75630fe'),
(166, NULL, 100, 'ui', 'onUIFormInitialize', 'location', '', '\\Bitrix\\Location\\Infrastructure\\EventHandler', 'onUIFormInitialize', '', 2, '462272192a150e16b28f1e1bd33ed62b'),
(167, NULL, 100, 'main', 'OnAfterEpilog', 'messageservice', '', '\\Bitrix\\MessageService\\Queue', 'run', '', 1, '6bcb21b0ccc5ac89d9531ddf8b94683c'),
(168, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestServiceBuildDescription', '', 1, '7524628243223e572590eea87cc03f73'),
(169, NULL, 100, 'rest', 'OnRestAppDelete', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppDelete', '', 1, '5febc41cd526ecba95dbb4843dd9c134'),
(170, NULL, 100, 'rest', 'OnRestAppUpdate', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppUpdate', '', 1, '7e77b4d550c200a4ec06872af7857ee6'),
(171, NULL, 100, 'perfmon', 'OnGetTableSchema', 'perfmon', '', 'perfmon', 'OnGetTableSchema', '', 1, '3a4da255b44f05899b64e66a40c12662'),
(172, NULL, 49, 'main', 'OnBeforeProlog', 'rest', '', 'CRestEventHandlers', 'OnBeforeProlog', '', 2, '395c9c42c3cc9392de1e5887617afe6d'),
(173, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', 'CBitrixRestEntity', 'OnRestServiceBuildDescription', '', 2, 'f63068b1eb62c36219518206e1e2827c'),
(174, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\User', 'onRestServiceBuildDescription', '', 2, 'c9a03e9019564649e55f5409b661e050'),
(175, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Placement', 'onRestServiceBuildDescription', '', 2, '9751a266c2b6f6be5c34b1541bf7c194'),
(176, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Event', 'onRestServiceBuildDescription', '', 2, '842ad63f19aff6d810059c7e56739aae'),
(177, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\UserFieldType', 'onRestServiceBuildDescription', '', 2, '4caf68a5256aabe4abef37f24562e59b'),
(178, NULL, 100, 'rest', 'onFindMethodDescription', 'rest', '', '\\Bitrix\\Rest\\Engine\\RestManager', 'onFindMethodDescription', '', 2, '4d0614f880674af333326dd5ba9b2828'),
(179, NULL, 100, 'main', 'OnApplicationsBuildList', 'main', 'modules/rest/lib/apauth/application.php', '\\Bitrix\\Rest\\APAuth\\Application', 'onApplicationsBuildList', '', 2, '9c39129872987f8dcc8baacc0c446ed7'),
(180, NULL, 100, 'im', 'OnAfterConfirmNotify', 'rest', '', '\\Bitrix\\Rest\\NotifyIm', 'receive', '', 2, '2ac9c19fe69d4e106deaa6f4a7a4371b'),
(181, NULL, 100, 'rest', '\\Bitrix\\Rest\\APAuth\\Password::OnDelete', 'rest', '', '\\Bitrix\\Rest\\APAuth\\PermissionTable', 'onPasswordDelete', '', 2, 'f04447ca635f045ec1a64e593964fc90'),
(182, NULL, 100, 'perfmon', 'OnGetTableSchema', 'rest', '', 'rest', 'OnGetTableSchema', '', 2, '47a76003c8f9f2d8c820f446e084ff39'),
(183, NULL, 100, 'rest', 'OnRestApplicationConfigurationImport', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventImportController', '', 2, '3fc1dd7e523b33f9d76c19e54d45c2fb'),
(184, NULL, 100, 'rest', 'OnRestApplicationConfigurationExport', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventExportController', '', 2, 'b90a349060c693506b740c4d36f75f5f'),
(185, NULL, 100, 'rest', 'OnRestApplicationConfigurationClear', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventClearController', '', 2, '75dccda637a740c033b2d014a84a8009'),
(186, NULL, 100, 'rest', 'OnRestApplicationConfigurationEntity', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'getEntityList', '', 2, '8d83d219eaf2f415d55fb67e221b7c3d'),
(187, NULL, 100, 'rest', 'OnRestApplicationConfigurationGetManifest', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'getManifestList', '', 2, '6ba35b1f4b01d1e358e1b3a79ac437d6'),
(188, NULL, 100, 'main', 'OnAfterSetOption_~mp24_paid_date', 'rest', '', '\\Bitrix\\Rest\\Marketplace\\Client', 'onChangeSubscriptionDate', '', 2, 'b6ab5bafe2befd82726761f5a8b38a0b'),
(189, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\OAuth\\Auth', 'onRestCheckAuth', '', 2, '70e923729089b8cba69bb3b4311da11e'),
(190, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\APAuth\\Auth', 'onRestCheckAuth', '', 2, '3550e6c95772564101770e0c9cb54470'),
(191, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\SessionAuth\\Auth', 'onRestCheckAuth', '', 2, '8e33ae5a47b59d21df7d26f916d19e38'),
(192, NULL, 100, 'main', 'OnAfterRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Engine\\ScopeManager', 'onChangeRegisterModule', '', 2, '900fb8bbf0d59d1924bedae5da1b6eb1'),
(193, NULL, 100, 'main', 'OnAfterUnRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Engine\\ScopeManager', 'onChangeRegisterModule', '', 2, 'e97e569fe3fc7775aa4ece09cdf209bc'),
(194, NULL, 100, 'main', 'OnAfterRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Marketplace\\TagTable', 'onAfterRegisterModule', '', 2, '80afec537db1eeda99462f0676dbb835'),
(195, NULL, 100, 'main', 'OnAfterUnRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Marketplace\\TagTable', 'onAfterUnRegisterModule', '', 2, 'fe9cb5af7e8ca277ca29b4a5423bd08b'),
(196, NULL, 100, 'main', 'OnChangePermissions', 'search', '', 'CSearch', 'OnChangeFilePermissions', '', 1, '1c37aedc2ec89f94624291d097fe7adf'),
(197, NULL, 100, 'main', 'OnChangeFile', 'search', '', 'CSearch', 'OnChangeFile', '', 1, 'd51170fc3433fde7eab8edc1c2b933a0'),
(198, NULL, 100, 'main', 'OnGroupDelete', 'search', '', 'CSearch', 'OnGroupDelete', '', 1, '05382d7448b1ba259b89bf9e87e4eb44'),
(199, NULL, 100, 'main', 'OnLangDelete', 'search', '', 'CSearch', 'OnLangDelete', '', 1, '15ebda82514af5a966b3466cd26992a4'),
(200, NULL, 100, 'main', 'OnAfterUserUpdate', 'search', '', 'CSearchUser', 'OnAfterUserUpdate', '', 1, '9e0cea5039973193afc706ec8978d674'),
(201, NULL, 100, 'main', 'OnUserDelete', 'search', '', 'CSearchUser', 'DeleteByUserID', '', 1, '524a910f381ba144bf50caa152222ed6'),
(202, NULL, 100, 'cluster', 'OnGetTableList', 'search', '', 'search', 'OnGetTableList', '', 1, 'a40ffd36df151e2c0294b5639e81d665'),
(203, NULL, 100, 'perfmon', 'OnGetTableSchema', 'search', '', 'search', 'OnGetTableSchema', '', 1, '9c8df2577e0cb80c68afa2030e193efb'),
(204, NULL, 90, 'main', 'OnEpilog', 'search', '', 'CSearchStatistic', 'OnEpilog', '', 1, '6b3591ad78ac2a3ce6ad411f0aff47fe'),
(205, NULL, 100, 'main', 'OnUserDelete', 'security', '', 'CSecurityUser', 'OnUserDelete', '', 1, '450a1c7509f5363a9bf7d1472f22f9cf'),
(206, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityFilter', 'GetAuditTypes', '', 1, '893bc94df887141b4f3579561ea37454'),
(207, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityAntiVirus', 'GetAuditTypes', '', 1, '9ba919b0537aa25fe47e438c2428b4d9'),
(208, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecurityFilter', 'OnAdminInformerInsertItems', '', 1, 'c751923f396ccc4e102ed17e97cb8afb'),
(209, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecuritySiteChecker', 'OnAdminInformerInsertItems', '', 1, '0c7cea553d58a72f7c5521d282898bc7'),
(210, NULL, 5, 'main', 'OnBeforeProlog', 'security', '', 'CSecurityFilter', 'OnBeforeProlog', '', 1, 'bb70fedd18267b1c5290068ae80dbc4d'),
(211, NULL, 9999, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityXSSDetect', 'OnEndBufferContent', '', 1, 'd1886589ecd51b020420e6c1415edeaf'),
(212, NULL, 1, 'main', 'OnBeforeLocalRedirect', 'security', '', 'CSecurityRedirect', 'BeforeLocalRedirect', '', 1, '2dbeb7fa7a8bec4d90e8940616976b3d'),
(213, NULL, 1, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityRedirect', 'EndBufferContent', '', 1, '099871646b4df8c1263e26f9bd91f3bd'),
(214, NULL, 100, 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', 2, '79688b0b4a106b805d09e63ffe88f580'),
(215, NULL, 100, 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', 2, '7995eac5813e40f6b3e82b146631397e'),
(216, NULL, 100, 'fileman', 'OnBeforeHTMLEditorScriptRuns', 'seo', '', 'CSeoEventHandlers', 'OnBeforeHTMLEditorScriptRuns', '', 2, '313b34609f1fa34d34cde1c2103c09ff'),
(217, NULL, 100, 'iblock', 'OnAfterIBlockSectionAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addSection', '', 2, 'c61de21b0b0873525fa5c39427324664'),
(218, NULL, 100, 'iblock', 'OnAfterIBlockElementAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addElement', '', 2, '1b167ab85d6d744bba456e559546f13e'),
(219, NULL, 100, 'iblock', 'OnAfterIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\Sitemap\\Source\\Iblock', 'deleteSection', '', 2, 'ec9e3d9d970c78a5f37290fd2bf5adca'),
(220, NULL, 100, 'iblock', 'OnAfterIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\Sitemap\\Source\\Iblock', 'deleteElement', '', 2, '8bf5c0f8efa4653541a83d5a6c8c1f78'),
(221, NULL, 100, 'iblock', 'OnAfterIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\Sitemap\\Source\\Iblock', 'updateSection', '', 2, '86e379a59649e530aaf4738e4f64af9c'),
(222, NULL, 100, 'iblock', 'OnAfterIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\Sitemap\\Source\\Iblock', 'updateElement', '', 2, 'd542b6444ad3ca08bce180e414b0d838'),
(223, NULL, 100, 'forum', 'onAfterTopicAdd', 'seo', '', '\\Bitrix\\Seo\\Sitemap\\Source\\Forum', 'addTopic', '', 2, 'cd7bcd6c78d9ef041a05dc3aaa5a9d62'),
(224, NULL, 100, 'forum', 'onAfterTopicUpdate', 'seo', '', '\\Bitrix\\Seo\\Sitemap\\Source\\Forum', 'updateTopic', '', 2, 'fa0fcdf4deaf951621d16443d2dd0975'),
(225, NULL, 100, 'forum', 'onAfterTopicDelete', 'seo', '', '\\Bitrix\\Seo\\Sitemap\\Source\\Forum', 'deleteTopic', '', 2, 'cde4bfc7f1592cbebfb889abef89e1e0'),
(226, NULL, 100, 'main', 'OnAdminIBlockElementEdit', 'seo', '', '\\Bitrix\\Seo\\AdvTabEngine', 'eventHandler', '', 2, 'c894d167ef03c35375b8eb8f2551a798'),
(227, NULL, 100, 'main', 'OnBeforeProlog', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'checkSession', '', 2, '5fdf8dd9fd70719e442efcb589175bf0'),
(228, NULL, 100, 'sale', 'OnOrderSave', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onOrderSave', '', 2, '07d4ab0b1aa0aa130a0cbc06403f6eae'),
(229, NULL, 100, 'sale', 'OnBasketOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onBasketOrder', '', 2, 'cf6298b090e92e955b32c358c1d14b25'),
(230, NULL, 100, 'sale', 'onSalePayOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSalePayOrder', '', 2, '745afed820778e33d5cd3e91cbd622f1'),
(231, NULL, 100, 'sale', 'onSaleDeductOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeductOrder', '', 2, '12861bd5c6c27ffa2abe5cac90ea58d8'),
(232, NULL, 100, 'sale', 'onSaleDeliveryOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeliveryOrder', '', 2, 'ead8fb64fece572d1fabd3d6fd27af27'),
(233, NULL, 100, 'sale', 'onSaleStatusOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleStatusOrder', '', 2, 'b7b9ac4bbf458d433e1cf3835ff4cb6c'),
(234, NULL, 100, 'conversion', 'OnSetDayContextAttributes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onSetDayContextAttributes', '', 2, 'c19eb7659342fabc34b953f69e8b9eee'),
(235, NULL, 100, 'conversion', 'OnGetAttributeTypes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onGetAttributeTypes', '', 2, '379294eefad289e474bf0c5ce2a281d8'),
(236, NULL, 100, 'catalog', 'OnProductUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2, '0f4deda4d57adb4389d85a19e5bbcf2b'),
(237, NULL, 100, 'catalog', 'OnProductSetAvailableUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2, '3d040ae51f0f6a4b2a08be0e6e1494d4'),
(238, NULL, 100, 'bitrix24', 'onDomainChange', 'seo', '', '\\Bitrix\\Seo\\Service', 'changeRegisteredDomain', '', 2, 'fcb2dadb8b7ff1863c0ad86320e9e521'),
(239, NULL, 100, 'main', 'OnUserDelete', 'socialservices', '', 'CSocServAuthDB', 'OnUserDelete', '', 1, '1f5b8fc024dfdf83952d6c723466cdf5'),
(240, NULL, 100, 'main', 'OnAfterUserLogout', 'socialservices', '', 'CSocServEventHandlers', 'OnUserLogout', '', 1, '7e4c40a3ff7cd102879cef10653f97ac'),
(241, NULL, 100, 'timeman', 'OnAfterTMReportDailyAdd', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMReportDailyAdd', '', 1, 'a16159f6a90f1b67cb9ec15b0c1bab3a'),
(242, NULL, 100, 'timeman', 'OnAfterTMDayStart', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMDayStart', '', 1, '9567feb38890d6581a3204dc5e65e8b6'),
(243, NULL, 100, 'timeman', 'OnTimeManShow', 'socialservices', '', 'CSocServEventHandlers', 'OnTimeManShow', '', 1, 'b728f3cea11d374f7638c29f84e8e15e'),
(244, NULL, 100, 'main', 'OnFindExternalUser', 'socialservices', '', 'CSocServAuthDB', 'OnFindExternalUser', '', 1, '1ab251d15efc87c5b5cfe6396f5dec1b'),
(245, NULL, 100, 'perfmon', 'OnGetTableSchema', 'socialservices', '', 'socialservices', 'OnGetTableSchema', '', 1, '56107bf1a0dcee0db660c0ec27c31c6c'),
(246, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkOldUser', '', 1, 'c3d7460e4ef694f5bc53b6a6ad902407'),
(247, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkAbandonedUser', '', 1, '331f99f0b265544c33777c299eab16f6'),
(248, NULL, 100, 'main', 'OnPanelCreate', 'translate', '', '\\Bitrix\\Translate\\Ui\\Panel', 'onPanelCreate', '', 1, '88ecb95eac2e28b80f234bfc8c1cd597'),
(249, NULL, 100, 'perfmon', 'OnGetTableSchema', 'translate', '', 'translate', 'onGetTableSchema', '', 1, '00347f45b2f48480b1a521c32036beb5'),
(252, NULL, 100, 'main', 'OnUserDelete', 'ui', '', '\\Bitrix\\UI\\Integration\\Main\\User', 'onDelete', '', 2, '5e748ff204d0dac471be127b136eeb1d'),
(253, NULL, 100, 'main', 'OnFileDelete', 'ui', '', '\\Bitrix\\UI\\Avatar\\Mask\\Item', 'onFileDelete', '', 2, 'bdf678d45b7e9f3ce906099a5e4fc975'),
(254, NULL, 100, 'rest', 'onRestAppDelete', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\App', 'onRestAppDelete', '', 2, 'b213605cfa38675d5e4b60f257f6acce'),
(255, NULL, 100, 'rest', 'OnRestAppInstall', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\App', 'OnRestAppInstall', '', 2, '206ce4eafe25cc4b5fbaddfa36eaba47'),
(256, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifest', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationGetManifest', '', 2, 'daad84620a1a84daef4884f1162e2099'),
(257, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifestSetting', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationGetManifestSetting', '', 2, 'b3290d964ad532e24a892bae6001146c'),
(258, NULL, 100, 'rest', 'onRestApplicationConfigurationExport', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationExport', '', 2, 'ac9b60f1d69d98c3980413800a3524f7'),
(259, NULL, 100, 'rest', 'onRestApplicationConfigurationEntity', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationEntity', '', 2, '8d609b415b9bfa097d137ab69ba6903f'),
(260, NULL, 100, 'rest', 'onRestApplicationConfigurationImport', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationImport', '', 2, 'b1a5ce1bd868f8c86462c5b60eec1307');

-- --------------------------------------------------------

--
-- Структура таблицы `b_numerator`
--

CREATE TABLE IF NOT EXISTS `b_numerator` (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `TEMPLATE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  `SETTINGS` text,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` int DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` int DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_numerator_code` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_numerator_sequence`
--

CREATE TABLE IF NOT EXISTS `b_numerator_sequence` (
  `NUMERATOR_ID` int NOT NULL DEFAULT '0',
  `KEY` varchar(32) NOT NULL DEFAULT '0',
  `TEXT_KEY` varchar(50) DEFAULT NULL,
  `NEXT_NUMBER` int DEFAULT NULL,
  `LAST_INVOCATION_TIME` int DEFAULT NULL,
  PRIMARY KEY (`NUMERATOR_ID`,`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_operation`
--

CREATE TABLE IF NOT EXISTS `b_operation` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `BINDING` varchar(50) DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_operation`
--

INSERT INTO `b_operation` (`ID`, `NAME`, `MODULE_ID`, `DESCRIPTION`, `BINDING`) VALUES
(1, 'edit_php', 'main', NULL, 'module'),
(2, 'view_own_profile', 'main', NULL, 'module'),
(3, 'edit_own_profile', 'main', NULL, 'module'),
(4, 'view_all_users', 'main', NULL, 'module'),
(5, 'view_groups', 'main', NULL, 'module'),
(6, 'view_tasks', 'main', NULL, 'module'),
(7, 'view_other_settings', 'main', NULL, 'module'),
(8, 'view_subordinate_users', 'main', NULL, 'module'),
(9, 'edit_subordinate_users', 'main', NULL, 'module'),
(10, 'edit_all_users', 'main', NULL, 'module'),
(11, 'edit_groups', 'main', NULL, 'module'),
(12, 'edit_tasks', 'main', NULL, 'module'),
(13, 'edit_other_settings', 'main', NULL, 'module'),
(14, 'cache_control', 'main', NULL, 'module'),
(15, 'lpa_template_edit', 'main', NULL, 'module'),
(16, 'view_event_log', 'main', NULL, 'module'),
(17, 'edit_ratings', 'main', NULL, 'module'),
(18, 'manage_short_uri', 'main', NULL, 'module'),
(19, 'fm_view_permission', 'main', NULL, 'file'),
(20, 'fm_view_file', 'main', NULL, 'file'),
(21, 'fm_view_listing', 'main', NULL, 'file'),
(22, 'fm_edit_existent_folder', 'main', NULL, 'file'),
(23, 'fm_create_new_file', 'main', NULL, 'file'),
(24, 'fm_edit_existent_file', 'main', NULL, 'file'),
(25, 'fm_create_new_folder', 'main', NULL, 'file'),
(26, 'fm_delete_file', 'main', NULL, 'file'),
(27, 'fm_delete_folder', 'main', NULL, 'file'),
(28, 'fm_edit_in_workflow', 'main', NULL, 'file'),
(29, 'fm_rename_file', 'main', NULL, 'file'),
(30, 'fm_rename_folder', 'main', NULL, 'file'),
(31, 'fm_upload_file', 'main', NULL, 'file'),
(32, 'fm_add_to_menu', 'main', NULL, 'file'),
(33, 'fm_download_file', 'main', NULL, 'file'),
(34, 'fm_lpa', 'main', NULL, 'file'),
(35, 'fm_edit_permission', 'main', NULL, 'file'),
(36, 'bitrixcloud_monitoring', 'bitrixcloud', NULL, 'module'),
(37, 'bitrixcloud_backup', 'bitrixcloud', NULL, 'module'),
(38, 'clouds_browse', 'clouds', NULL, 'module'),
(39, 'clouds_upload', 'clouds', NULL, 'module'),
(40, 'clouds_config', 'clouds', NULL, 'module'),
(41, 'fileman_view_file_structure', 'fileman', NULL, 'module'),
(42, 'fileman_add_element_to_menu', 'fileman', NULL, 'module'),
(43, 'fileman_edit_menu_elements', 'fileman', NULL, 'module'),
(44, 'fileman_edit_existent_files', 'fileman', NULL, 'module'),
(45, 'fileman_edit_existent_folders', 'fileman', NULL, 'module'),
(46, 'fileman_admin_files', 'fileman', NULL, 'module'),
(47, 'fileman_admin_folders', 'fileman', NULL, 'module'),
(48, 'fileman_view_permissions', 'fileman', NULL, 'module'),
(49, 'fileman_upload_files', 'fileman', NULL, 'module'),
(50, 'fileman_view_all_settings', 'fileman', NULL, 'module'),
(51, 'fileman_edit_menu_types', 'fileman', NULL, 'module'),
(52, 'fileman_edit_all_settings', 'fileman', NULL, 'module'),
(53, 'fileman_install_control', 'fileman', NULL, 'module'),
(54, 'medialib_view_collection', 'fileman', NULL, 'medialib'),
(55, 'medialib_new_collection', 'fileman', NULL, 'medialib'),
(56, 'medialib_new_item', 'fileman', NULL, 'medialib'),
(57, 'medialib_edit_item', 'fileman', NULL, 'medialib'),
(58, 'medialib_del_item', 'fileman', NULL, 'medialib'),
(59, 'medialib_edit_collection', 'fileman', NULL, 'medialib'),
(60, 'medialib_del_collection', 'fileman', NULL, 'medialib'),
(61, 'medialib_access', 'fileman', NULL, 'medialib'),
(62, 'sticker_view', 'fileman', NULL, 'stickers'),
(63, 'sticker_edit', 'fileman', NULL, 'stickers'),
(64, 'sticker_new', 'fileman', NULL, 'stickers'),
(65, 'sticker_del', 'fileman', NULL, 'stickers'),
(66, 'hl_element_read', 'highloadblock', NULL, 'module'),
(67, 'hl_element_write', 'highloadblock', NULL, 'module'),
(68, 'hl_element_delete', 'highloadblock', NULL, 'module'),
(69, 'section_read', 'iblock', NULL, 'iblock'),
(70, 'element_read', 'iblock', NULL, 'iblock'),
(71, 'section_element_bind', 'iblock', NULL, 'iblock'),
(72, 'iblock_admin_display', 'iblock', NULL, 'iblock'),
(73, 'element_edit', 'iblock', NULL, 'iblock'),
(74, 'element_edit_price', 'iblock', NULL, 'iblock'),
(75, 'element_delete', 'iblock', NULL, 'iblock'),
(76, 'element_bizproc_start', 'iblock', NULL, 'iblock'),
(77, 'section_edit', 'iblock', NULL, 'iblock'),
(78, 'section_delete', 'iblock', NULL, 'iblock'),
(79, 'section_section_bind', 'iblock', NULL, 'iblock'),
(80, 'element_edit_any_wf_status', 'iblock', NULL, 'iblock'),
(81, 'iblock_edit', 'iblock', NULL, 'iblock'),
(82, 'iblock_delete', 'iblock', NULL, 'iblock'),
(83, 'iblock_rights_edit', 'iblock', NULL, 'iblock'),
(84, 'iblock_export', 'iblock', NULL, 'iblock'),
(85, 'section_rights_edit', 'iblock', NULL, 'iblock'),
(86, 'element_rights_edit', 'iblock', NULL, 'iblock'),
(87, 'landing_read', 'landing', NULL, 'module'),
(88, 'landing_edit', 'landing', NULL, 'module'),
(89, 'landing_sett', 'landing', NULL, 'module'),
(90, 'landing_public', 'landing', NULL, 'module'),
(91, 'landing_delete', 'landing', NULL, 'module'),
(92, 'security_filter_bypass', 'security', NULL, 'module'),
(93, 'security_edit_user_otp', 'security', NULL, 'module'),
(94, 'security_module_settings_read', 'security', NULL, 'module'),
(95, 'security_panel_view', 'security', NULL, 'module'),
(96, 'security_filter_settings_read', 'security', NULL, 'module'),
(97, 'security_otp_settings_read', 'security', NULL, 'module'),
(98, 'security_iprule_admin_settings_read', 'security', NULL, 'module'),
(99, 'security_session_settings_read', 'security', NULL, 'module'),
(100, 'security_redirect_settings_read', 'security', NULL, 'module'),
(101, 'security_stat_activity_settings_read', 'security', NULL, 'module'),
(102, 'security_iprule_settings_read', 'security', NULL, 'module'),
(103, 'security_antivirus_settings_read', 'security', NULL, 'module'),
(104, 'security_frame_settings_read', 'security', NULL, 'module'),
(105, 'security_module_settings_write', 'security', NULL, 'module'),
(106, 'security_filter_settings_write', 'security', NULL, 'module'),
(107, 'security_otp_settings_write', 'security', NULL, 'module'),
(108, 'security_iprule_admin_settings_write', 'security', NULL, 'module'),
(109, 'security_session_settings_write', 'security', NULL, 'module'),
(110, 'security_redirect_settings_write', 'security', NULL, 'module'),
(111, 'security_stat_activity_settings_write', 'security', NULL, 'module'),
(112, 'security_iprule_settings_write', 'security', NULL, 'module'),
(113, 'security_file_verifier_sign', 'security', NULL, 'module'),
(114, 'security_file_verifier_collect', 'security', NULL, 'module'),
(115, 'security_file_verifier_verify', 'security', NULL, 'module'),
(116, 'security_antivirus_settings_write', 'security', NULL, 'module'),
(117, 'security_frame_settings_write', 'security', NULL, 'module'),
(118, 'seo_tools', 'seo', NULL, 'module'),
(119, 'seo_settings', 'seo', NULL, 'module');

-- --------------------------------------------------------

--
-- Структура таблицы `b_option`
--

CREATE TABLE IF NOT EXISTS `b_option` (
  `MODULE_ID` varchar(50) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `VALUE` mediumtext,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  PRIMARY KEY (`MODULE_ID`,`NAME`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_option`
--

INSERT INTO `b_option` (`MODULE_ID`, `NAME`, `VALUE`, `DESCRIPTION`, `SITE_ID`) VALUES
('fileman', 'GROUP_DEFAULT_TASK', '18', NULL, NULL),
('fileman', 'stickers_use_hotkeys', 'N', NULL, NULL),
('fileman', 'use_editor_3', 'Y', NULL, NULL),
('fileman', 'use_pspell', 'N', NULL, NULL),
('landing', 'pub_path_s1', '/lp/', NULL, NULL),
('location', 'address_format_code', 'RU', NULL, NULL),
('main', '~crypto_b_socialservices_user', 'a:2:{s:7:\"OATOKEN\";b:1;s:13:\"REFRESH_TOKEN\";b:1;}', NULL, NULL),
('main', '~crypto_b_user_auth_code', 'a:1:{s:10:\"OTP_SECRET\";b:1;}', NULL, NULL),
('main', '~crypto_b_user_phone_auth', 'a:1:{s:10:\"OTP_SECRET\";b:1;}', NULL, NULL),
('main', '~new_license18_0_sign', 'Y', NULL, NULL),
('main', '~update_autocheck_result', 'a:4:{s:10:\"check_date\";i:1729621782;s:6:\"result\";b:0;s:5:\"error\";s:0:\"\";s:7:\"modules\";a:0:{}}', NULL, NULL),
('main', 'admin_lid', 'ru', NULL, NULL),
('main', 'admin_passwordh', 'FVoQeWYUBwUtCUVcAxcGCgsTAQ==', NULL, NULL),
('main', 'all_bcc', '', NULL, NULL),
('main', 'allow_qrcode_auth', 'N', NULL, NULL),
('main', 'allow_socserv_authorization', 'Y', NULL, NULL),
('main', 'ALLOW_SPREAD_COOKIE', 'Y', NULL, NULL),
('main', 'attach_images', 'N', NULL, NULL),
('main', 'auth_components_template', '', NULL, NULL),
('main', 'auth_controller_sso', 'N', NULL, NULL),
('main', 'auth_multisite', 'N', NULL, NULL),
('main', 'auto_time_zone', 'N', NULL, NULL),
('main', 'bx_fast_download', 'N', NULL, NULL),
('main', 'captcha_registration', 'N', NULL, NULL),
('main', 'captcha_restoring_password', 'N', NULL, NULL),
('main', 'collect_geonames', 'N', NULL, NULL),
('main', 'compres_css_js_files', 'N', NULL, NULL),
('main', 'control_file_duplicates', 'Y', NULL, NULL),
('main', 'convert_mail_header', 'Y', NULL, NULL),
('main', 'convert_original_file_name', 'Y', NULL, NULL),
('main', 'CONVERT_UNIX_NEWLINE_2_WINDOWS', 'N', NULL, NULL),
('main', 'cookie_name', 'BITRIX_SM', NULL, NULL),
('main', 'custom_register_page', '', NULL, NULL),
('main', 'device_history_cleanup_days', '180', NULL, NULL),
('main', 'disk_space', '', NULL, NULL),
('main', 'duplicates_max_size', '100', NULL, NULL),
('main', 'email_from', 'qwestor@list.ru', NULL, NULL),
('main', 'error_reporting', '85', NULL, NULL),
('main', 'event_log_block_user', 'N', NULL, NULL),
('main', 'event_log_cleanup_days', '7', NULL, NULL),
('main', 'event_log_file_access', 'N', NULL, NULL),
('main', 'event_log_group_policy', 'N', NULL, NULL),
('main', 'event_log_login_fail', 'N', NULL, NULL),
('main', 'event_log_login_success', 'N', NULL, NULL),
('main', 'event_log_logout', 'N', NULL, NULL),
('main', 'event_log_marketplace', 'N', NULL, NULL),
('main', 'event_log_module_access', 'N', NULL, NULL),
('main', 'event_log_password_change', 'N', NULL, NULL),
('main', 'event_log_password_request', 'N', NULL, NULL),
('main', 'event_log_permissions_fail', 'N', NULL, NULL),
('main', 'event_log_register', 'N', NULL, NULL),
('main', 'event_log_register_fail', 'N', NULL, NULL),
('main', 'event_log_task', 'N', NULL, NULL),
('main', 'event_log_user_delete', 'N', NULL, NULL),
('main', 'event_log_user_edit', 'N', NULL, NULL),
('main', 'event_log_user_groups', 'N', NULL, NULL),
('main', 'fill_to_mail', 'N', NULL, NULL),
('main', 'GROUP_DEFAULT_RIGHT', 'D', NULL, NULL),
('main', 'GROUP_DEFAULT_TASK', '1', NULL, NULL),
('main', 'hide_panel_for_users', 's:0:\"\";', NULL, NULL),
('main', 'image_resize_quality', '95', NULL, NULL),
('main', 'imageeditor_proxy_enabled', 'N', NULL, NULL),
('main', 'imageeditor_proxy_white_list', 's:0:\"\";', NULL, NULL),
('main', 'inactive_users_block_days', '0', NULL, NULL),
('main', 'last_mp_modules_result', 'a:4:{s:10:\"check_date\";i:1729621844;s:13:\"update_module\";a:0:{}s:10:\"end_update\";a:0:{}s:10:\"new_module\";a:0:{}}', NULL, NULL),
('main', 'mail_additional_parameters', '', NULL, NULL),
('main', 'mail_event_bulk', '5', NULL, NULL),
('main', 'mail_event_period', '14', NULL, NULL),
('main', 'mail_gen_text_version', 'Y', NULL, NULL),
('main', 'mail_link_protocol', '', NULL, NULL),
('main', 'map_left_menu_type', 'left', NULL, NULL),
('main', 'map_top_menu_type', 'top', NULL, NULL),
('main', 'max_file_size', '20000000', NULL, NULL),
('main', 'move_js_to_body', 'N', NULL, NULL),
('main', 'new_user_email_auth', 'Y', NULL, NULL),
('main', 'new_user_email_required', 'Y', NULL, NULL),
('main', 'new_user_email_uniq_check', 'N', NULL, NULL),
('main', 'new_user_phone_auth', 'N', NULL, NULL),
('main', 'new_user_phone_required', 'N', NULL, NULL),
('main', 'new_user_registration', 'Y', NULL, NULL),
('main', 'new_user_registration_cleanup_days', '7', NULL, NULL),
('main', 'new_user_registration_def_group', '', NULL, NULL),
('main', 'new_user_registration_email_confirmation', 'N', NULL, NULL),
('main', 'optimize_css_files', 'N', NULL, NULL),
('main', 'optimize_js_files', 'N', NULL, NULL),
('main', 'PARAM_MAX_SITES', '2', NULL, NULL),
('main', 'PARAM_MAX_USERS', '0', NULL, NULL),
('main', 'phone_number_default_country', '16', NULL, NULL),
('main', 'profile_history_cleanup_days', '0', NULL, NULL),
('main', 'profile_image_height', '', NULL, NULL),
('main', 'profile_image_size', '', NULL, NULL),
('main', 'profile_image_width', '', NULL, NULL),
('main', 'rating_assign_authority_group', '4', NULL, NULL),
('main', 'rating_assign_authority_group_add', '2', NULL, NULL),
('main', 'rating_assign_authority_group_delete', '2', NULL, NULL),
('main', 'rating_assign_rating_group', '3', NULL, NULL),
('main', 'rating_assign_rating_group_add', '1', NULL, NULL),
('main', 'rating_assign_rating_group_delete', '1', NULL, NULL),
('main', 'rating_assign_type', 'auto', NULL, NULL),
('main', 'rating_authority_rating', '2', NULL, NULL),
('main', 'rating_authority_weight_formula', 'Y', NULL, NULL),
('main', 'rating_community_authority', '30', NULL, NULL),
('main', 'rating_community_last_visit', '90', NULL, NULL),
('main', 'rating_community_size', '1', NULL, NULL),
('main', 'rating_count_vote', '10', NULL, NULL),
('main', 'rating_normalization', '10', NULL, NULL),
('main', 'rating_normalization_type', 'auto', NULL, NULL),
('main', 'rating_self_vote', 'Y', NULL, NULL),
('main', 'rating_start_authority', '3', NULL, NULL),
('main', 'rating_text_like_d', 'Это нравится', NULL, NULL),
('main', 'rating_text_like_n', 'Не нравится', NULL, NULL),
('main', 'rating_text_like_y', 'Нравится', NULL, NULL),
('main', 'rating_vote_show', 'Y', NULL, NULL),
('main', 'rating_vote_template', 'like', NULL, NULL),
('main', 'rating_vote_type', 'like', NULL, NULL),
('main', 'rating_vote_weight', '10', NULL, NULL),
('main', 'save_original_file_name', 'N', NULL, NULL),
('main', 'secure_logout', 'Y', NULL, NULL),
('main', 'send_mid', 'N', NULL, NULL),
('main', 'server_name', 'bitrix.local', NULL, NULL),
('main', 'server_uniq_id', '1dab7gy272hq2f66ox5b3c513kuyshfw', NULL, NULL),
('main', 'session_auth_only', 'Y', NULL, NULL),
('main', 'session_expand', 'Y', NULL, NULL),
('main', 'session_show_message', 'Y', NULL, NULL),
('main', 'show_panel_for_users', 's:0:\"\";', NULL, NULL),
('main', 'signer_default_key', '0d9326c42177b8e619ebc3d429303881e5cead802c8b8d5128c85caf5fc1ef510648767fa1bdbec6e4a77d7c445d55493ecb9ef92f536038e31f0a005c517960', NULL, NULL),
('main', 'site_checker_success', 'Y', NULL, NULL),
('main', 'site_name', 'bitrix.local', NULL, NULL),
('main', 'smile_gallery_id', '1', NULL, NULL),
('main', 'smile_last_update', '1729621346', NULL, NULL),
('main', 'sms_default_service', '', NULL, NULL),
('main', 'stable_versions_only', 'Y', NULL, NULL),
('main', 'store_password', 'Y', NULL, NULL),
('main', 'strong_update_check', 'Y', NULL, NULL),
('main', 'track_outgoing_emails_click', 'Y', NULL, NULL),
('main', 'track_outgoing_emails_read', 'Y', NULL, NULL),
('main', 'translate_key_yandex', '', NULL, NULL),
('main', 'translit_original_file_name', 'N', NULL, NULL),
('main', 'update_autocheck', '', NULL, NULL),
('main', 'update_devsrv', 'N', NULL, NULL),
('main', 'update_is_gzip_installed', 'Y', NULL, NULL),
('main', 'update_load_timeout', '30', NULL, NULL),
('main', 'update_safe_mode', 'N', NULL, NULL),
('main', 'update_site', 'www.1c-bitrix.ru', NULL, NULL),
('main', 'update_site_ns', 'Y', NULL, NULL),
('main', 'update_site_proxy_addr', '', NULL, NULL),
('main', 'update_site_proxy_pass', '', NULL, NULL),
('main', 'update_site_proxy_port', '', NULL, NULL),
('main', 'update_site_proxy_user', '', NULL, NULL),
('main', 'update_stop_autocheck', 'N', NULL, NULL),
('main', 'update_use_https', 'Y', NULL, NULL),
('main', 'upload_dir', 'upload', NULL, NULL),
('main', 'url_preview_enable', 'N', NULL, NULL),
('main', 'url_preview_save_images', 'N', NULL, NULL),
('main', 'use_digest_auth', 'N', NULL, NULL),
('main', 'use_encrypted_auth', 'N', NULL, NULL),
('main', 'use_hot_keys', 'Y', NULL, NULL),
('main', 'use_minified_assets', 'N', NULL, NULL),
('main', 'use_secure_password_cookies', 'N', NULL, NULL),
('main', 'use_time_zones', 'N', NULL, NULL),
('main', 'user_device_geodata', 'N', NULL, NULL),
('main', 'user_device_history', 'N', NULL, NULL),
('main', 'user_device_notify', 'N', NULL, NULL),
('main', 'user_profile_history', 'N', NULL, NULL),
('main', 'vendor', '1c_bitrix', NULL, NULL),
('main_sec', 'SEC_ACTUALIZE_VENDOR_NOTIFICATIONS', '1729621785', NULL, NULL),
('main_sec', 'WWALL_ACTUALIZE_RULES', '1729678060', NULL, NULL),
('messageservice', 'clean_up_period', '14', NULL, NULL),
('messageservice', 'force_region', 'ru', NULL, NULL);
INSERT INTO `b_option` (`MODULE_ID`, `NAME`, `VALUE`, `DESCRIPTION`, `SITE_ID`) VALUES
('rest', 'app_immune', '[\"infoservice.migrator_amocrm\",\"informunity.excel\",\"bitrix.eshop\",\"bitrix.1cdoc\",\"bitrix.assistant\",\"bitrix.denominationby\",\"bitrix.propertiesbot\",\"bitrix.giphybot\",\"bitrix.1c\",\"bitrix.restapi\",\"bitrix.partnerlandingexport\",\"bitrix.partnerapplication\",\"bitrix.partnerlanding\",\"bitrix.1ctotal\",\"integrations24.pipedrive\",\"integrations24ru.pipedrive\",\"integrations24.zoho\",\"integrations24.asana\",\"integrations24ru.asana\",\"integrations24.sugar\",\"integrations24ru.sugar\",\"integrations24.jira_migration\",\"integrations24.qbinventory\",\"integrations24.zohoinventory\",\"integrations24.trello\",\"integrations24ru.slack_migration\",\"SEVERCODE.trello_migrator\",\"htmls.ms_migrator\",\"integrations24.mns_kazakhstan_poisk_po_bin\",\"integrations24.portal_nalog_gov_by\",\"integrations24ru.microsoft_teams_migration\",\"bitrix.pbi_all\",\"bitrix.pbi_company\",\"bitrix.pbi_company_uf\",\"bitrix.pbi_contact\",\"bitrix.pbi_contact_uf\",\"bitrix.pbi_crm_activity\",\"bitrix.pbi_deal_product_row\",\"bitrix.pbi_deal_stage_history\",\"bitrix.pbi_deals_ru\",\"bitrix.pbi_lead\",\"bitrix.pbi_lead_product_row\",\"bitrix.pbi_lead_uf\",\"bitrix.pbi_leads_ru\",\"bitrix.pbi_socialnetwork_group\",\"bitrix.pbi_telephony\",\"bitrix.pbi_user\",\"bitrix.gds_all\",\"bitrix.gds_company\",\"bitrix.gds_company_uf\",\"bitrix.gds_contact\",\"bitrix.gds_contact_uf\",\"bitrix.gds_crm_activity\",\"bitrix.gds_deal_product_row\",\"bitrix.gds_deal_stage_history\",\"bitrix.gds_deals_ru\",\"bitrix.gds_lead\",\"bitrix.gds_lead_product_row\",\"bitrix.gds_lead_uf\",\"bitrix.gds_leads_ru\",\"bitrix.gds_socialnetwork_group\",\"bitrix.gds_telephony\",\"bitrix.gds_user\",\"bitrix.gds_activity\",\"bitrix.gds_deal_uf\",\"bitrix.gds_telephony_call\",\"itsolutionru.gptconnector\",\"asmo.ai\",\"bitrix.bic_datasets_en\",\"bitrix.bic_datasets_kz\",\"bitrix.bic_datasets_ru\",\"bitrix.bic_deals_en\",\"bitrix.bic_deals_kz\",\"bitrix.bic_deals_ru\",\"bitrix.bic_leads_en\",\"bitrix.bic_leads_kz\",\"bitrix.bic_leads_ru\",\"bitrix.bic_sales_en\",\"bitrix.bic_sales_kz\",\"bitrix.bic_sales_ru\",\"bitrix.bic_sales_struct_en\",\"bitrix.bic_sales_struct_kz\",\"bitrix.bic_sales_struct_ru\",\"bitrix.bic_telephony_en\",\"bitrix.bic_telephony_kz\",\"bitrix.bic_telephony_ru\",\"bitrix.bic_deals_complex\",\"bitrix.bic_general_stat\",\"bitrix.bic_lead_generation\",\"bitrix.kompleksnaya_analitika_sdelok\",\"integrations24.telegram_repost\",\"integrations24.kufar\",\"bitrix.bic_sales_struct_ru\",\"bitrix.bic_sales_ru\",\"bitrix.bic_leads_ru\",\"bitrix.bic_deals_ru\",\"bitrix.bic_datasets_ru\",\"bitrix.bic_datasets_en\",\"bitrix.bic_deals_en\",\"bitrix.bic_leads_en\",\"bitrix.bic_sales_en\",\"bitrix.bic_sales_struct_en\",\"bitrix.bic_datasets_kz\",\"bitrix.bic_deals_kz\",\"bitrix.bic_leads_kz\",\"bitrix.bic_sales_kz\",\"bitrix.bic_sales_struct_kz\",\"bitrix.bic_deals_complex\",\"bitrix.bic_general_stat\",\"bitrix.bic_lead_generation\",\"bitrix.bic_retention\",\"bitrix.bic_abcanalysis\",\"bitrix.bic_bizproc\",\"bitrix.bic_catdeal\",\"bitrix.bic_cohort\",\"bitrix.bic_abcsku\",\"bitrix.bic_telephony\",\"bitrix.bic_compsales\",\"bitrix.bic_bizproceff\",\"bitrix.bic_smartproc\",\"bitrix.bic_taskdeadline\",\"bitrix.bic_taskload\",\"bitrix.khellouin_ru\",\"bitrix.den_zashchitnika_otechestva_2_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_ua\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_ua\",\"bitrix.mezhdunarodnyy_zhenskiy_den_ua\",\"bitrix.den_smekha_ua\",\"bitrix.den_svyatogo_valentina_ua\",\"bitrix.den_vsekh_vlyublyennykh_ua\",\"bitrix.katolicheskaya_paskha_ua\",\"bitrix.novyy_god_ua\",\"bitrix.rozhdestvo_ua\",\"bitrix.valentinov_den_ua\",\"bitrix.pravoslavnaya_paskha_ua\",\"bitrix.chernaya_pyatnitsa_ua\",\"bitrix.khellouin_ua\",\"bitrix.den_zashchitnika_otechestva_3_ru\",\"bitrix.den_zashchitnika_otechestva_ru\",\"bitrix.den_zashchitnika_otechestva_by\",\"bitrix.den_zashchitnika_otechestva_2_by\",\"bitrix.den_zashchitnika_otechestva_3_by\",\"bitrix.den_zashchitnika_otechestva_kz\",\"bitrix.den_zashchitnika_otechestva_2_kz\",\"bitrix.den_zashchitnika_otechestva_3_kz\",\"bitrix.pravoslavnaya_paskha_ru\",\"bitrix.pravoslavnaya_paskha_by\",\"bitrix.pravoslavnaya_paskha_kz\",\"bitrix.den_smekha_ru\",\"bitrix.den_smekha_by\",\"bitrix.den_smekha_kz\",\"bitrix.valentinov_den_ru\",\"bitrix.valentinov_den_by\",\"bitrix.valentinov_den_kz\",\"bitrix.rozhdestvo_ru\",\"bitrix.rozhdestvo_by\",\"bitrix.rozhdestvo_kz\",\"bitrix.novyy_god_ru\",\"bitrix.novyy_god_by\",\"bitrix.novyy_god_kz\",\"bitrix.katolicheskaya_paskha_ru\",\"bitrix.katolicheskaya_paskha_by\",\"bitrix.katolicheskaya_paskha_kz\",\"bitrix.den_vsekh_vlyublyennykh_ru\",\"bitrix.den_vsekh_vlyublyennykh_by\",\"bitrix.den_vsekh_vlyublyennykh_kz\",\"bitrix.den_svyatogo_valentina_ru\",\"bitrix.den_svyatogo_valentina_by\",\"bitrix.den_svyatogo_valentina_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_kz\",\"bitrix.thanksgiving_day_en\",\"bitrix.april_fools_day_en\",\"bitrix.valentine_s_day_en\",\"bitrix.valentine_s_day_2_en\",\"bitrix.valentine_s_day_3_en\",\"bitrix.chernaya_pyatnitsa_ru\",\"bitrix.chernaya_pyatnitsa_by\",\"bitrix.chernaya_pyatnitsa_kz\",\"bitrix.khellouin_by\",\"bitrix.khellouin_kz\",\"bitrix.easter_en\",\"bitrix.halloween_en\",\"bitrix.christmas_en\",\"bitrix.new_year_en\",\"bitrix.black_friday_en\",\"bitrix.kraytvirtualtravel_ru\",\"bitrix.kraytvirtualtravel_by\",\"bitrix.kraytvirtualtravel_kz\",\"bitrix.kraytvirtualtravel_ua\",\"bitrix.kraytnutritionist_ru\",\"bitrix.kraytnutritionist_by\",\"bitrix.delobotcorporatetraining_en\",\"bitrix.delobotblackfriday_en\",\"bitrix.delobotcleaningcompany_en\",\"bitrix.delobotfitness_en\",\"bitrix.delobotfooddelivery_en\",\"bitrix.delobotvisagiste_en\",\"bitrix.delobotpsychologist_en\",\"bitrix.delobotflorist_en\",\"bitrix.delobotdecoration_en\",\"bitrix.delobotcarservice_en\",\"bitrix.kraytagency_en\",\"bitrix.kraytagriculture_en\",\"bitrix.kraytarchitecture_en\",\"bitrix.kraytbusiness_en\",\"bitrix.kraytdelivery_en\",\"bitrix.kraytevents_en\",\"bitrix.kraythalloween_en\",\"bitrix.kraytvetclinic_en\",\"bitrix.kraytmasterforhour_en\",\"bitrix.kraytinstagramcontacts_en\",\"bitrix.kraytinstagramstock_en\",\"bitrix.kraytinstagramtarget_en\",\"bitrix.kraytonlinebabysitter_en\",\"bitrix.kraytpetservice_en\",\"bitrix.kraytsolarenergy_en\",\"bitrix.kraytsportonline_en\",\"bitrix.kraytsummersale_en\",\"bitrix.krayttravelblog_en\",\"bitrix.kraytvebinar_en\",\"bitrix.kraytartificialintelligence_en\",\"bitrix.kraytbakeryproducts_en\",\"bitrix.kraytchildrensschool_en\",\"bitrix.kraytfooddelivery_en\",\"bitrix.kraytfurniture_en\",\"bitrix.kraytvirtualtravel_en\",\"bitrix.kraytyoutubechannel_en\",\"bitrix.kraytknitting_en\",\"bitrix.kraytnutritionist_en\",\"bitrix.kraytnailservice_en\",\"bitrix.kraytmedicine_en\",\"bitrix.kraytprofipage_en\",\"bitrix.kraytsale11_en\",\"bitrix.delobotblackfriday_ua\",\"bitrix.delobotcleaning_ua\",\"bitrix.delobotcorporatetraining_ua\",\"bitrix.delobotfitness_ua\",\"bitrix.delobotfooddelivery_ua\",\"bitrix.delobotvisagiste_ua\",\"bitrix.kraytagency_ua\",\"bitrix.kraytagriculture_ua\",\"bitrix.kraytarchitecture_ua\",\"bitrix.kraytbusiness_ua\",\"bitrix.kraytevents_ua\",\"bitrix.kraythalloween_ua\",\"bitrix.kraytinstagramcontacts_ua\",\"bitrix.kraytinstagramstock_ua\",\"bitrix.kraytinstagramtarget_ua\",\"bitrix.kraytpetservice_ua\",\"bitrix.kraytsolarenergy_ua\",\"bitrix.kraytsummersale_ua\",\"bitrix.krayttravelblog_ua\",\"bitrix.kraytvebinar_ua\",\"bitrix.kraytvetclinic_ua\",\"bitrix.kraytnutritionist_ua\",\"bitrix.kraytnutritionist_kz\",\"bitrix.kraytfurniture_by\",\"bitrix.kraytfurniture_ru\",\"bitrix.kraytfurniture_kz\",\"bitrix.kraytfurniture_ua\",\"bitrix.kraytmedicine_ru\",\"bitrix.kraytmedicine_by\",\"bitrix.kraytmedicine_kz\",\"bitrix.kraytmedicine_ua\",\"bitrix.kraytsale11_ru\",\"bitrix.kraytsale11_by\",\"bitrix.kraytsale11_kz\",\"bitrix.kraytsale11_ua\",\"bitrix.kraytnailservice_ru\",\"bitrix.kraytnailservice_by\",\"bitrix.kraytnailservice_kz\",\"bitrix.kraytnailservice_ua\",\"bitrix.kraytknitting_ru\",\"bitrix.kraytknitting_by\",\"bitrix.kraytknitting_kz\",\"bitrix.kraytknitting_ua\",\"bitrix.kraytfooddelivery_ru\",\"bitrix.kraytfooddelivery_by\",\"bitrix.kraytfooddelivery_kz\",\"bitrix.kraytfooddelivery_ua\",\"bitrix.kraytbakeryproducts_ru\",\"bitrix.kraytbakeryproducts_by\",\"bitrix.kraytbakeryproducts_kz\",\"bitrix.kraytbakeryproducts_ua\",\"bitrix.kraytschoolmusic_ru\",\"bitrix.kraytschoolmusic_by\",\"bitrix.kraytschoolmusic_kz\",\"bitrix.kraytschoolmusic_ua\",\"bitrix.kraytautomechanic_ru\",\"bitrix.kraytautomechanic_by\",\"bitrix.kraytautomechanic_kz\",\"bitrix.kraytautomechanic_ua\",\"bitrix.kraytpresents_ru\",\"bitrix.kraytpresents_by\",\"bitrix.kraytpresents_kz\",\"bitrix.kraytpresents_ua\",\"bitrix.kraytportfoliophotographer_ru\",\"bitrix.kraytportfoliophotographer_by\",\"bitrix.kraytportfoliophotographer_kz\",\"bitrix.kraytportfoliophotographer_ua\",\"bitrix.kraytcrm_ru\",\"bitrix.delobotcleaningcompany_ru\",\"bitrix.delobotblackfriday_ru\",\"bitrix.delobotblackfriday_by\",\"bitrix.delobotblackfriday_kz\",\"bitrix.delobotcleaningcompany_by\",\"bitrix.delobotcleaningcompany_kz\",\"bitrix.delobotcorporatetraining_ru\",\"bitrix.delobotcorporatetraining_by\",\"bitrix.delobotcorporatetraining_kz\",\"bitrix.delobotfitness_ru\",\"bitrix.delobotfitness_by\",\"bitrix.delobotfitness_kz\",\"bitrix.delobotfooddelivery_ru\",\"bitrix.delobotfooddelivery_by\",\"bitrix.delobotfooddelivery_kz\",\"bitrix.delobotvisagiste_ru\",\"bitrix.delobotvisagiste_by\",\"bitrix.delobotvisagiste_kz\",\"bitrix.delobotgiftsforwomensday_ru\",\"bitrix.delobotgiftsforwomensday_by\",\"bitrix.delobotgiftsforwomensday_kz\",\"bitrix.delobotgiftsforwomensday_ua\",\"bitrix.delobotwebdesigner_ru\",\"bitrix.delobotwebdesigner_by\",\"bitrix.delobotwebdesigner_kz\",\"bitrix.delobotwebdesigner_ua\",\"bitrix.delobotatelier_ru\",\"bitrix.delobotatelier_by\",\"bitrix.delobotatelier_kz\",\"bitrix.delobotatelier_ua\",\"bitrix.delobotconstructioncompany_ru\",\"bitrix.delobotconstructioncompany_by\",\"bitrix.delobotconstructioncompany_ua\",\"bitrix.delobotlanguageschool_ru\",\"bitrix.delobotlanguageschool_by\",\"bitrix.delobotlanguageschool_kz\",\"bitrix.delobotlanguageschool_ua\",\"bitrix.delobotcoffee_ru\",\"bitrix.delobotcoffee_by\",\"bitrix.delobotcoffee_kz\",\"bitrix.delobotcoffee_ua\",\"bitrix.kraytcrm_by\",\"bitrix.kraytcrm_kz\",\"bitrix.kraytcrm_ua\",\"bitrix.kraytonlinebabysitter_ru\",\"bitrix.kraytonlinebabysitter_by\",\"bitrix.kraytonlinebabysitter_kz\",\"bitrix.kraytonlinebabysitter_uaa\",\"bitrix.kraytsportonline_ru\",\"bitrix.kraytsportonline_by\",\"bitrix.kraytsportonline_kz\",\"bitrix.kraytsportonline_ua\",\"bitrix.kraytmasterforhour_ru\",\"bitrix.kraytmasterforhour_by\",\"bitrix.kraytmasterforhour_kz\",\"bitrix.kraytmasterforhour_ua\",\"bitrix.kraytdelivery_ru\",\"bitrix.kraytdelivery_by\",\"bitrix.kraytdelivery_kz\",\"bitrix.kraytdelivery_ua\",\"bitrix.kraytrepairservice_ru\",\"bitrix.kraytrepairservice_by\",\"bitrix.kraytrepairservice_kz\",\"bitrix.kraytrepairservice_ua\",\"bitrix.kraytprofipage_ru\",\"bitrix.kraytprofipage_by\",\"bitrix.kraytprofipage_kz\",\"bitrix.kraytprofipage_ua\",\"bitrix.krayttutor_ru\",\"bitrix.krayttutor_by\",\"bitrix.krayttutor_kz\",\"bitrix.krayttutor_ua\",\"bitrix.kraytartificialintelligence_ru\",\"bitrix.kraytartificialintelligence_by\",\"bitrix.kraytartificialintelligence_kz\",\"bitrix.kraytartificialintelligence_ua\",\"bitrix.kraytyoutubechannel_ru\",\"bitrix.kraytyoutubechannel_by\",\"bitrix.kraytyoutubechannel_kz\",\"bitrix.kraytyoutubechannel_ua\",\"bitrix.kraytchildrensschool_ru\",\"bitrix.kraytchildrensschool_by\",\"bitrix.kraytchildrensschool_kz\",\"bitrix.kraytchildrensschool_ua\",\"bitrix.krayttravelagency_ru\",\"bitrix.krayttravelagency_by\",\"bitrix.krayttravelagency_kz\",\"bitrix.krayttravelagency_ua\",\"bitrix.krayttranslator_ru\",\"bitrix.krayttranslator_by\",\"bitrix.krayttranslator_kz\",\"bitrix.krayttranslator_ua\",\"bitrix.kraytstylist_ru\",\"bitrix.kraytstylist_by\",\"bitrix.kraytstylist_kz\",\"bitrix.kraytstylist_ua\",\"bitrix.kraytstretchingstudio_ru\",\"bitrix.kraytstretchingstudio_by\",\"bitrix.kraytstretchingstudio_kz\",\"bitrix.kraytstretchingstudio_ua\",\"bitrix.kraytsportschool_ru\",\"bitrix.kraytsportschool_by\",\"bitrix.kraytsportschool_kz\",\"bitrix.kraytsportschool_ua\",\"bitrix.kraytsitedesigner_ru\",\"bitrix.kraytsitedesigner_by\",\"bitrix.kraytsitedesigner_kz\",\"bitrix.kraytsitedesigner_ua\",\"bitrix.kraytsport_ru\",\"bitrix.kraytsport_by\",\"bitrix.kraytsport_kz\",\"bitrix.kraytsport_ua\",\"bitrix.kraytmobileapp_ru\",\"bitrix.kraytmobileapp_by\",\"bitrix.kraytmobileapp_kz\",\"bitrix.kraytmobileapp_ua\",\"bitrix.kraytrealestate_ru\",\"bitrix.kraytrealestate_by\",\"bitrix.kraytrealestate_kz\",\"bitrix.kraytrealestate_ua\",\"bitrix.delobotnewyearsale_ru\",\"bitrix.delobotnewyearsale_by\",\"bitrix.delobotnewyearsale_kz\",\"bitrix.delobotnewyearsale_ua\",\"bitrix.delobotyoga_ru\",\"bitrix.delobotyoga_by\",\"bitrix.delobotyoga_kz\",\"bitrix.delobotyoga_ua\",\"bitrix.delobotcake_ru\",\"bitrix.delobotcake_by\",\"bitrix.delobotcake_kz\",\"bitrix.delobotcake_ua\",\"bitrix.delobotveterinarian_ru\",\"bitrix.delobotveterinarian_by\",\"bitrix.delobotveterinarian_kz\",\"bitrix.delobotveterinarian_ua\",\"bitrix.delobotpsychologist_ru\",\"bitrix.delobotpsychologist_by\",\"bitrix.delobotpsychologist_kz\",\"bitrix.delobotpsychologist_ua\",\"bitrix.delobotdecoration_ru\",\"bitrix.delobotdecoration_by\",\"bitrix.delobotdecoration_kz\",\"bitrix.delobotdecoration_ua\",\"bitrix.delobotflorist_ru\",\"bitrix.delobotflorist_by\",\"bitrix.delobotflorist_kz\",\"bitrix.delobotflorist_ua\",\"bitrix.delobotcarservice_ru\",\"bitrix.delobotcarservice_by\",\"bitrix.delobotcarservice_kz\",\"bitrix.delobotcarservice_ua\",\"bitrix.delobotcargotransportation_ru\",\"bitrix.delobotcargotransportation_by\",\"bitrix.delobotcargotransportation_kz\",\"bitrix.delobotcargotransportation_ua\",\"bitrix.delobotrealtor_ru\",\"bitrix.delobotrealtor_by\",\"bitrix.delobotrealtor_kz\",\"bitrix.delobotrealtor_ua\",\"bitrix.delobotfurnituremanufacturing_ru\",\"bitrix.delobotfurnituremanufacturing_by\",\"bitrix.delobotfurnituremanufacturing_kz\",\"bitrix.delobotfurnituremanufacturing_ua\",\"bitrix.delobotorganizationofholidays_ru\",\"bitrix.delobotorganizationofholidays_by\",\"bitrix.delobotorganizationofholidays_kz\",\"bitrix.delobotorganizationofholidays_ua\",\"bitrix.delobotconcertannounce_ru\",\"bitrix.delobotconcertannounce_by\",\"bitrix.delobotconcertannounce_kz\",\"bitrix.delobotconcertannounce_ua\",\"bitrix.delobotphotographersservice_ru\",\"bitrix.delobotphotographersservice_by\",\"bitrix.delobotphotographersservice_kz\",\"bitrix.delobotphotographersservice_ua\",\"bitrix.kraytsecurityagency_ru\",\"bitrix.kraytsecurityagency_by\",\"bitrix.kraytsecurityagency_kz\",\"bitrix.kraytsecurityagency_ua\",\"bitrix.kraytrecordingstudio_ru\",\"bitrix.kraytrecordingstudio_by\",\"bitrix.kraytrecordingstudio_kz\",\"bitrix.kraytrecordingstudio_ua\",\"bitrix.kraytrealestateagent_ru\",\"bitrix.kraytrealestateagent_by\",\"bitrix.kraytrealestateagent_kz\",\"bitrix.kraytrealestateagent_ua\",\"bitrix.delobotdecorationhouses_ru\",\"bitrix.delobotdecorationhouses_by\",\"bitrix.delobotdecorationhouses_kz\",\"bitrix.delobotdecorationhouses_ua\",\"bitrix.delobotairconditioners_ru\",\"bitrix.delobotairconditioners_by\",\"bitrix.delobotairconditioners_kz\",\"bitrix.delobotairconditioners_ua\",\"bitrix.delobotdesignworkshop_ru\",\"bitrix.delobotdesignworkshop_by\",\"bitrix.delobotdesignworkshop_kz\",\"bitrix.delobotdesignworkshop_ua\",\"bitrix.delobotcitygreeningproject_ru\",\"bitrix.delobotcitygreeningproject_by\",\"bitrix.delobotcitygreeningproject_kz\",\"bitrix.delobotcitygreeningproject_ua\",\"bitrix.delobotecoproducts_ru\",\"bitrix.delobotecoproducts_by\",\"bitrix.delobotecoproducts_kz\",\"bitrix.delobotecoproducts_ua\",\"bitrix.delobotsoundrecordingservices_ru\",\"bitrix.delobotsoundrecordingservices_by\",\"bitrix.delobotsoundrecordingservices_kz\",\"bitrix.delobotsoundrecordingservices_ua\",\"bitrix.delobotsecurityservice_ru\",\"bitrix.delobotsecurityservice_by\",\"bitrix.delobotsecurityservice_kz\",\"bitrix.delobotsecurityservice_ua\",\"bitrix.delobotsportschool_ru\",\"bitrix.delobotsportschool_by\",\"bitrix.delobotsportschool_kz\",\"bitrix.delobotsportschool_ua\",\"bitrix.delobotfamilyleisure_ru\",\"bitrix.delobotfamilyleisure_by\",\"bitrix.delobotfamilyleisure_kz\",\"bitrix.delobotfamilyleisure_ua\",\"bitrix.delobotdoctortherapist_ru\",\"bitrix.delobotdoctortherapist_by\",\"bitrix.delobotdoctortherapist_kz\",\"bitrix.delobotdoctortherapist_ua\",\"bitrix.kraytagency_ru\",\"bitrix.kraytagency_by\",\"bitrix.kraytagency_kz\",\"bitrix.kraytarchitecture_ru\",\"bitrix.kraytarchitecture_by\",\"bitrix.kraytarchitecture_kz\",\"bitrix.kraytagriculture_ru\",\"bitrix.kraytagriculture_by\",\"bitrix.kraytagriculture_kz\",\"bitrix.kraytbusiness_ru\",\"bitrix.kraytbusiness_by\",\"bitrix.kraytbusiness_kz\",\"bitrix.kraytevents_ru\",\"bitrix.kraytevents_by\",\"bitrix.kraytevents_kz\",\"bitrix.kraythalloween_ru\",\"bitrix.kraythalloween_by\",\"bitrix.kraythalloween_kz\",\"bitrix.kraytinstagramtarget_ru\",\"bitrix.kraytinstagramtarget_by\",\"bitrix.kraytinstagramtarget_kz\",\"bitrix.kraytinstagramcontacts_ru\",\"bitrix.kraytinstagramcontacts_by\",\"bitrix.kraytinstagramcontacts_kz\",\"bitrix.kraytinstagramstock_ru\",\"bitrix.kraytinstagramstock_by\",\"bitrix.kraytinstagramstock_kz\",\"bitrix.kraytpetservice_ru\",\"bitrix.kraytpetservice_by\",\"bitrix.kraytpetservice_kz\",\"bitrix.kraytsolarenergy_ru\",\"bitrix.kraytsolarenergy_by\",\"bitrix.kraytsolarenergy_kz\",\"bitrix.kraytsummersale_ru\",\"bitrix.kraytsummersale_by\",\"bitrix.kraytsummersale_kz\",\"bitrix.krayttravelblog_ru\",\"bitrix.krayttravelblog_by\",\"bitrix.krayttravelblog_kz\",\"bitrix.kraytvebinar_ru\",\"bitrix.kraytvebinar_by\",\"bitrix.kraytvebinar_kz\",\"bitrix.kraytvetclinic_ru\",\"bitrix.kraytvetclinic_by\",\"bitrix.kraytvetclinic_kz\",\"bitrix.kraytrestaurant_ru\",\"bitrix.kraytrestaurant_by\",\"bitrix.kraytrestaurant_kz\",\"bitrix.kraytrestaurant_ua\",\"bitrix.kraytweddingservices_ru\",\"bitrix.kraytweddingservices_by\",\"bitrix.kraytweddingservices_kz\",\"bitrix.kraytweddingservices_ua\",\"bitrix.kraytoptics_ru\",\"bitrix.kraytoptics_by\",\"bitrix.kraytoptics_kz\",\"bitrix.kraytoptics_ua\",\"bitrix.krayt3dprint_ru\",\"bitrix.krayt3dprint_by\",\"bitrix.krayt3dprint_kz\",\"bitrix.krayt3dprint_ua\",\"bitrix.kraytbusinesspremisesdesign_ru\",\"bitrix.kraytbusinesspremisesdesign_by\",\"bitrix.kraytbusinesspremisesdesign_kz\",\"bitrix.kraytbusinesspremisesdesign_ua\",\"bitrix.kraytcentersproject_ru\",\"bitrix.kraytcentersproject_by\",\"bitrix.kraytcentersproject_kz\",\"bitrix.kraytcentersproject_ua\",\"bitrix.kraytcitygreening_ru\",\"bitrix.kraytcitygreening_by\",\"bitrix.kraytcitygreening_kz\",\"bitrix.kraytcitygreening_ua\",\"bitrix.kraytclimatesystems_ru\",\"bitrix.kraytclimatesystems_by\",\"bitrix.kraytclimatesystems_kz\",\"bitrix.kraytclimatesystems_ua\",\"bitrix.kraytclinicmomandbaby_ru\",\"bitrix.kraytclinicmomandbaby_by\",\"bitrix.kraytclinicmomandbaby_kz\",\"bitrix.kraytclinicmomandbaby_ua\",\"bitrix.kraytdesignerclothing_ru\",\"bitrix.kraytdesignerclothing_by\",\"bitrix.kraytdesignerclothing_kz\",\"bitrix.kraytdesignerclothing_ua\",\"bitrix.kraytprivatedoctor_ru\",\"bitrix.kraytprivatedoctor_by\",\"bitrix.kraytprivatedoctor_kz\",\"bitrix.kraytprivatedoctor_ua\",\"bitrix.kraytprintinghouse_ru\",\"bitrix.kraytprintinghouse_by\",\"bitrix.kraytprintinghouse_kz\",\"bitrix.kraytprintinghouse_ua\",\"bitrix.kraytpersonalcoach_ru\",\"bitrix.kraytpersonalcoach_by\",\"bitrix.kraytpersonalcoach_kz\",\"bitrix.kraytpersonalcoach_ua\",\"bitrix.kraytperfumer_ru\",\"bitrix.kraytperfumer_by\",\"bitrix.kraytperfumer_kz\",\"bitrix.kraytperfumer_ua\",\"bitrix.kraytnewsblog_ru\",\"bitrix.kraytnewsblog_by\",\"bitrix.kraytnewsblog_kz\",\"bitrix.kraytnewsblog_ua\",\"bitrix.kraytmakeupstudio_ru\",\"bitrix.kraytmakeupstudio_by\",\"bitrix.kraytmakeupstudio_kz\",\"bitrix.kraytmakeupstudio_ua\",\"bitrix.kraytlawyer_ru\",\"bitrix.kraytlawyer_by\",\"bitrix.kraytlawyer_kz\",\"bitrix.kraytlawyer_ua\",\"bitrix.kraytlandscapedesign_ru\",\"bitrix.kraytlandscapedesign_by\",\"bitrix.kraytlandscapedesign_kz\",\"bitrix.kraytlandscapedesign_ua\",\"bitrix.kraytjewelryrepairshop_ru\",\"bitrix.kraytjewelryrepairshop_by\",\"bitrix.kraytjewelryrepairshop_kz\",\"bitrix.kraytjewelryrepairshop_ua\",\"bitrix.kraytinteriordesign_ru\",\"bitrix.kraytinteriordesign_by\",\"bitrix.kraytinteriordesign_kz\",\"bitrix.kraytinsurancecompany_ru\",\"bitrix.kraytinsurancecompany_kz\",\"bitrix.kraytinsurancecompany_ua\",\"bitrix.kraytillustrator_ru\",\"bitrix.kraytillustrator_by\",\"bitrix.kraytillustrator_kz\",\"bitrix.kraytillustrator_ua\",\"bitrix.kraytgiftsvalentineday_ru\",\"bitrix.kraytgiftsvalentineday_by\",\"bitrix.kraytgiftsvalentineday_kz\",\"bitrix.kraytgiftsvalentineday_ua\",\"bitrix.kraytfebruary23_ru\",\"bitrix.kraytfebruary23_by\",\"bitrix.kraytfebruary23_kz\",\"bitrix.kraytfebruary23_ua\",\"bitrix.kraytequipmentrepair_ru\",\"bitrix.kraytequipmentrepair_by\",\"bitrix.kraytequipmentrepair_kz\",\"bitrix.kraytequipmentrepair_ua\",\"bitrix.kraytdentistry_ru\",\"bitrix.kraytdentistry_by\",\"bitrix.kraytdentistry_kz\",\"bitrix.kraytdentistry_ua\",\"bitrix.kraytdancemarathon_ru\",\"bitrix.kraytdancemarathon_by\",\"bitrix.kraytdancemarathon_kz\",\"bitrix.kraytdancemarathon_ua\",\"bitrix.kraytcourseformothers_ru\",\"bitrix.kraytcourseformothers_by\",\"bitrix.kraytcourseformothers_kz\",\"bitrix.kraytcourseformothers_ua\",\"bitrix.kraytcosmetologist_ru\",\"bitrix.kraytcosmetologist_by\",\"bitrix.kraytcosmetologist_kz\",\"bitrix.kraytcosmetologist_ua\",\"bitrix.kraytconstructionofprivatehouses_ru\",\"bitrix.kraytconstructionofprivatehouses_by\",\"bitrix.kraytconstructionofprivatehouses_kz\",\"bitrix.kraytconstructionofprivatehouses_ua\",\"bitrix.kraytconfectionery_ru\",\"bitrix.kraytconfectionery_by\",\"bitrix.kraytconfectionery_kz\",\"bitrix.kraytconfectionery_ua\",\"bitrix.kraytcoffeehouse_ru\",\"bitrix.kraytcoffeehouse_by\",\"bitrix.kraytcoffeehouse_kz\",\"bitrix.kraytcoffeehouse_ua\",\"bitrix.kraytcleaningservice_ru\",\"bitrix.kraytcleaningservice_by\",\"bitrix.kraytcleaningservice_kz\",\"bitrix.kraytcleaningservice_ua\",\"bitrix.kraytbeautystudio_ru\",\"bitrix.kraytbeautystudio_by\",\"bitrix.kraytbeautystudio_kz\",\"bitrix.kraytbeautystudio_ua\",\"bitrix.kraytbarbershop_ru\",\"bitrix.kraytbarbershop_by\",\"bitrix.kraytartworkshop_by\",\"bitrix.kraytbarbershop_kz\",\"bitrix.kraytbarbershop_ua\",\"bitrix.kraytartworkshop_ru\",\"bitrix.kraytartworkshop_kz\",\"bitrix.kraytartworkshop_ua\",\"bitrix.kraytaprilfoolsdaygifts_ru\",\"bitrix.kraytaprilfoolsdaygifts_by\",\"bitrix.kraytaprilfoolsdaygifts_kz\",\"bitrix.kraytaprilfoolsdaygifts_ua\",\"bitrix.kraytwindowinstallation_ru\",\"bitrix.kraytwindowinstallation_by\",\"bitrix.kraytwindowinstallation_kz\",\"bitrix.kraytwindowinstallation_ua\",\"bitrix.kraytwindowdesign_ru\",\"bitrix.kraytwindowdesign_by\",\"bitrix.kraytwindowdesign_kz\",\"bitrix.kraytwindowdesign_ua\",\"bitrix.krayttelecommunications_ru\",\"bitrix.krayttelecommunications_by\",\"bitrix.krayttelecommunications_kz\",\"bitrix.krayttelecommunications_ua\",\"bitrix.kraytsportsnutritionorder_ru\",\"bitrix.kraytsportsnutritionorder_by\",\"bitrix.kraytsportsnutritionorder_kz\",\"bitrix.kraytsportsnutritionorder_ua\",\"bitrix.kraytreconstructionoffices_ru\",\"bitrix.kraytreconstructionoffices_by\",\"bitrix.kraytreconstructionoffices_kz\",\"bitrix.kraytreconstructionoffices_ua\",\"bitrix.kraytpremisestrade_ru\",\"bitrix.kraytpremisestrade_by\",\"bitrix.kraytpremisestrade_ua\",\"bitrix.kraytinsulationhouses_ru\",\"bitrix.kraytinsulationhouses_by\",\"bitrix.kraytinsulationhouses_kz\",\"bitrix.kraytinsulationhouses_ua\",\"bitrix.kraytinstallsecuritysystems_ru\",\"bitrix.kraytinstallsecuritysystems_by\",\"bitrix.kraytinstallsecuritysystems_kz\",\"bitrix.kraytinstallsecuritysystems_ua\",\"bitrix.kraytinstallbathrooms_ru\",\"bitrix.kraytinstallbathrooms_by\",\"bitrix.kraytinstallbathrooms_kz\",\"bitrix.kraytinstallbathrooms_ua\",\"bitrix.kraythousedesign_ru\",\"bitrix.kraythousedesign_by\",\"bitrix.kraythousedesign_kz\",\"bitrix.kraythousedesign_ua\",\"bitrix.kraythospitalforfamily_ru\",\"bitrix.kraythospitalforfamily_by\",\"bitrix.kraythospitalforfamily_kz\",\"bitrix.kraythospitalforfamily_ua\",\"bitrix.kraythomedecoration_ru\",\"bitrix.kraythomedecoration_by\",\"bitrix.kraythomedecoration_kz\",\"bitrix.kraythomedecoration_ua\",\"bitrix.kraytfurniturettransformer_ru\",\"bitrix.kraytfurniturettransformer_by\",\"bitrix.kraytfurniturettransformer_kz\",\"bitrix.kraytfurniturettransformer_ua\",\"bitrix.kraytfloristics_ru\",\"bitrix.kraytfloristics_by\",\"bitrix.kraytfloristics_kz\",\"bitrix.kraytfloristics_ua\",\"bitrix.kraytfestiveevents_ru\",\"bitrix.kraytfestiveevents_by\",\"bitrix.kraytfestiveevents_kz\",\"bitrix.kraytfestiveevents_ua\",\"bitrix.kraytecogreen_ru\",\"bitrix.kraytecogreen_by\",\"bitrix.kraytecogreen_kz\",\"bitrix.kraytecogreen_ua\",\"bitrix.kraytdoorinstallation_ru\",\"bitrix.kraytdoorinstallation_by\",\"bitrix.kraytdoorinstallation_kz\",\"bitrix.kraytdoorinstallation_ua\",\"bitrix.kraytdoordesign_ru\",\"bitrix.kraytdoordesign_by\",\"bitrix.kraytdoordesign_kz\",\"bitrix.kraytdoordesign_ua\",\"bitrix.kraytdesigningpeopledisabilities_ru\",\"bitrix.kraytdesigningpeopledisabilities_by\",\"bitrix.kraytdesigningpeopledisabilities_kz\",\"bitrix.kraytdesigningpeopledisabilities_ua\",\"bitrix.delobotkindergarten_ru\",\"bitrix.kraytvideostudio_ru\",\"bitrix.kraytlegalservices_ru\",\"bitrix.kraytaccountingservices_ru\",\"bitrix.kraytbookannouncement_ru\",\"bitrix.kraytcharity_ru\",\"bitrix.kraytspa_ru\",\"bitrix.kraythandmadecosmetics_ru\",\"bitrix.delobotmusic_ru\",\"bitrix.kraythotelforanimals_ru\",\"bitrix.kraytcityguide_ru\",\"bitrix.delobotfoodblog_ru\",\"bitrix.delobotgamedeveloper_ru\",\"bitrix.delobotrenovationoffices_ru\",\"bitrix.delobotcourses_ru\",\"bitrix.delobotcityb__beautification_ru\",\"bitrix.delobotaidfund_ru\",\"bitrix.delobotnewsblog_ru\",\"bitrix.delobottransportservices_ru\",\"bitrix.delobotguide_ru\",\"bitrix.delobotnnturalcosmetic_ru\",\"bitrix.delobotboutiqueforsale_ru\",\"bitrix.delobotorganizationweddings_ru\",\"bitrix.delobotbeautyandrecreationcenter_ru\",\"bitrix.delobotwriter_ru\",\"bitrix.kraytotel\",\"bitrix.kraytigrovoyklub\",\"bitrix.kraytbazaotdykha\",\"bitrix.kraytkurspotiktoku\",\"bitrix.kraytkadrovoeagenstvo\",\"bitrix.kraytportfoliomodeli\",\"bitrix.kraytminecraftserver\",\"bitrix.kraytigrovayakompaniya\",\"bitrix.delobotuslugivideoproizvodstva\",\"bitrix.delobotportfolioaktera\",\"bitrix.delobotpub\",\"bitrix.delobotminihotel\",\"bitrix.delobotcamping\",\"bitrix.delobotcafe\",\"bitrix.delobotizgotovlenieduxov\",\"bitrix.delobotbuhgalterskoeobslujivanie\",\"bitrix.delobotarendanedvizimosti\",\"bitrix.delobotalternativnayaenergetika\",\"bitrix.delobotagentstvoponaimy\",\"bitrix.kraytpodarkikjenskomydny\",\"bitrix.kraytinstagramcontacts_ru1\",\"bitrix.kraytinstagramstock_ru1\",\"bitrix.kraytinstagramtarget_ru1\",\"bitrix.kraytkhimchistka\",\"bitrix.krayt_detskaya_odezhda_na_zakaz\",\"bitrix.krayt_retsepty_blyud\",\"bitrix.krayt_detskaya_mebel\",\"bitrix.krayt_biblioteka\",\"bitrix.krayt_pitomnik_rasteniy\",\"bitrix.delobot_lawyer\",\"bitrix.delobot_oformlenie_dverey\",\"bitrix.delobot_montaj_dverey\",\"bitrix.delobot_manicure_and_pedicure\",\"bitrix.delobot_printing_services\",\"bitrix.delobot_plants\",\"bitrix.delobot_nutritionist\",\"bitrix.delobot_designer_tableware\",\"bitrix.delobot_montaj_okon\",\"bitrix.delobot_oformlenie_okon\",\"bitrix.krayt_zhurnalist\",\"bitrix.krayt_tato_salon\",\"bitrix.krayt_massajist\",\"bitrix.krayt_consulting\",\"bitrix.krayt_elektromontazh\",\"bitrix.krayt_rezyume_spetsialista\",\"bitrix.kraytportfoliophotographer\",\"bitrix.kraytbeautystudio_en\",\"bitrix.kraytautomechanic_en\",\"bitrix.kraytequipmentrepair_en\",\"bitrix.delobot_furniture_for_children\",\"bitrix.delobot_architectural_projects\",\"bitrix.delobot_scientists_page\",\"bitrix.delobot_tatoo_studio\",\"bitrix.delobot_journalist_resume\",\"bitrix.delobot_leather_goods\",\"bitrix.delobot_dance_marathon\",\"bitrix.krayt_art_gallery\",\"bitrix.krayt_leather_products\",\"bitrix.krayt_scientific_researcher\",\"bitrix.krayt_bureau_of_architecture\",\"bitrix.krayt_jewelry_designer\",\"bitrix.krayt_food_photographer\",\"bitrix.krayt_acting_studio\",\"bitrix.krayt_farm\",\"bitrix.krayt_fashion_blog\",\"bitrix.krayt_birthday_cakes\",\"bitrix.krayt_plussize_fashion\",\"bitrix.krayt_diving\",\"bitrix.krayt_it_services\",\"bitrix.krayt_beauty_blog\",\"bitrix.krayt_aquarium\",\"bitrix.krayt_sport_blog\",\"bitrix.delobot_online_library\",\"bitrix.delobot_diving_center\",\"bitrix.delobot_designer_jewelry\",\"bitrix.delobot_nail_art_course\",\"bitrix.delobot_art_galery\",\"bitrix.delobot_fashion_for_everyone\",\"bitrix.delobot_handmade_chocolate\",\"bitrix.krayt_chocolate_shop\",\"bitrix.krayt_advertising_agency\",\"bitrix.krayt_asian_food\",\"bitrix.krayt_avtorskiy_master_klass\",\"bitrix.krayt_utilizatsiya_otkhodov\",\"bitrix.krayt_italyanskaya_kukhnya\",\"bitrix.krayt_kurs_po_nogtevomu_servisu\",\"bitrix.krayt_begovoy_klub\",\"bitrix.krayt_gornyy_turizm\",\"bitrix.krayt_biznes_prostranstvo\",\"bitrix.krayt_shkola_iskusstv\",\"bitrix.krayt_onlayn_intensiv_inostrannogo_yazyka\",\"bitrix.delobot_reklama_brenda\",\"bitrix.delobot_italyanskiy_restoran\",\"bitrix.delobot_modnaya_stranichka\",\"bitrix.delobot_fotografiya_edy\",\"bitrix.krayt_pishchevoe_proizvodstvo\",\"bitrix.krayt_appetitnyy_blog\",\"bitrix.krayt_uslugi_remonta\",\"bitrix.krayt_onlayn_kurs_kreativnogo_prodyusera\",\"bitrix.krayt_detskie_prazdniki\",\"bitrix.krayt_svetotekhnika\",\"bitrix.krayt_urbanistika\",\"bitrix.krayt_otdykh_na_prirode\",\"bitrix.krayt_sportivnye_ploshchadki\",\"bitrix.krayt_oborudovanie_dlya_turizma\",\"bitrix.krayt_meksikanskaya_kukhnya\",\"bitrix.delobot_sports_blog_20\",\"bitrix.delobot_aziatskie_blyuda\",\"bitrix.delobot_beauty_blog\",\"bitrix.delobot_meksikanskiy_restoran_2_0\",\"bitrix.delobot_urban_project\",\"bitrix.delobot_drawing_school\",\"bitrix.delobot_tourism\",\"bitrix.delobot_runnig_club\",\"bitrix.delobot_lighting_company\",\"bitrix.delobot_garbage_disposal\",\"bitrix.delobot_master_class\",\"bitrix.delobot_it_outsourcing\",\"bitrix.krayt_rent_car\",\"bitrix.krayt_aviation\",\"bitrix.krayt_street_sport_club\",\"bitrix.krayt_kofemaniya\",\"bitrix.krayt_corporate_events\",\"bitrix.krayt_cooking_school\",\"bitrix.krayt_blacksmith_craft\",\"bitrix.krayt_med_lab\",\"bitrix.krayt_music_studio\",\"bitrix.krayt_web_application_development\",\"bitrix.krayt_tennis_club\",\"bitrix.krayt_bank_services\",\"bitrix.krayt_smart_furniture\",\"bitrix.krayt_dom_pod_klyuch\",\"bitrix.krayt_uslugi_mediatora\",\"bitrix.krayt_child_club\",\"bitrix.delobot_custom_made_cakes\",\"bitrix.delobot_online_yoga_classes\",\"bitrix.krayt_pevitsa\",\"bitrix.krayt_ozelenenie_pomeshcheniy\",\"bitrix.krayt_internet_agentstvo\",\"bitrix.krayt_kinolog\",\"bitrix.krayt_poleznye_sneki\",\"bitrix.krayt_oformlenie_interera\",\"bitrix.delobot_tourist_equipment\",\"bitrix.delobot_creative_producer\",\"bitrix.delobot_aviation_services\",\"bitrix.delobot_blacksmith_services\",\"bitrix.delobot_coffee_subscription\",\"bitrix.delobot_construction_company\",\"bitrix.delobot_business_premises\",\"bitrix.delobot_pet_hotel\",\"bitrix.delobot_food_industry\",\"bitrix.delobot_cars_for_rent\",\"bitrix.krayt_klub_dlya_geymerov\",\"bitrix.krayt_relaks_uslugi\",\"bitrix.krayt_sportivnyy_inventar\",\"bitrix.krayt_universitet\",\"bitrix.delobot_uslugi_kinologa\",\"bitrix.delobot_business_training\",\"bitrix.krayt_vebinar\",\"bitrix.krayt_kurs_po_iskusstvennomu_intellektu\",\"bitrix.delobot_vypechka_na_zakaz\",\"bitrix.delobot_osennaya_rasprodazh\",\"bitrix.krayt_onlayn_shkola_dlya_detey\",\"bitrix.krayt_arkhitekturnaya_kompaniya\",\"bitrix.krayt_den_blagodareniya\",\"bitrix.krayt_uslugi_nyani\",\"bitrix.krayt_uslugi_repetitora\",\"bitrix.krayt_logoped\",\"bitrix.krayt_chyernaya_pyatnitsa\",\"bitrix.krayt_sladosti_na_rozhdestvo\",\"bitrix.krayt_podarki_na_novyy_god\",\"bitrix.delobot_laboratory\",\"bitrix.delobot_street_sports_grounds\",\"bitrix.delobot_about_webinar\",\"bitrix.krayt_dostavka_gruza\",\"bitrix.delobot_online_travel\",\"bitrix.delobot_youtube_channel\",\"bitrix.delobot_interior_design\",\"bitrix.krayt_kursy_po_interesam\",\"bitrix.krayt_zimnyaya_rasprodazha\",\"bitrix.krayt_tsifrovye_kommunikatsii\",\"bitrix.krayt_avtosalon\",\"bitrix.krayt_uslugi_stroitelnoy_kompanii\",\"bitrix.krayt_vysshee_uchebnoe_zavedenie\",\"bitrix.krayt_veterinar\",\"bitrix.krayt_akademiya_iskusstv\",\"bitrix.krayt_master_po_domu\",\"bitrix.krayt_onlayn_trenirovki\",\"bitrix.krayt_apart_otel\",\"bitrix.krayt_tsvety_i_bukety_na_zakaz\",\"bitrix.krayt_biznes_forum\",\"bitrix.krayt_uslugi_stomatologii\",\"bitrix.krayt_uslugi_avtoservisa\",\"bitrix.delobot_winter_sale\",\"bitrix.krayt_christmas_treats\",\"bitrix.krayt_eksperty_tochnogo_zemledeliya\",\"bitrix.krayt_servis_ukhoda_za_domom\",\"bitrix.delobot_repetitor\",\"bitrix.delobot_babysitter_for_children\",\"bitrix.delobot_speech_therapist_services\",\"bitrix.empty_template\",\"bitrix.krayt_gift_wrapping\",\"bitrix.delobot_fitness_clothes\",\"bitrix.delobot_bathroom_renovation\",\"bitrix.delobot_travel_arrangements\",\"bitrix.krayt_music_classes\",\"bitrix.delobot_klinika_dlya_mam_i_detok\",\"bitrix.delobot_bankovskie_uslugi\",\"bitrix.krayt_videoproizvodstvo\",\"bitrix.krayt_manikyur\",\"bitrix.krayt_meditsinskaya_pomoshch_onlayn\",\"bitrix.krayt_oblagorazhivanie_goroda\",\"bitrix.krayt_uslugi_barbershopa\",\"bitrix.krayt_taksi\",\"bitrix.delobot_optika\",\"bitrix.delobot_klinika_stomatologii\",\"bitrix.delobot_konditer\",\"bitrix.delobot_3d_print_services\",\"bitrix.delobot_uslugi_khimchistki\",\"bitrix.delobot_obuchenie_po_iskusstvennomu_intellektu\",\"bitrix.krayt_nutritsiologiya\",\"bitrix.krayt_salon_krasoty\",\"bitrix.krayt_uslugi_perevoda\",\"bitrix.krayt_landshaftnyy_dizayner\",\"bitrix.krayt_mebel_gotovaya_i_na_zakaz\",\"bitrix.krayt_uslugi_yurista\",\"bitrix.krayt_uslugi_po_bukhgalterii\",\"bitrix.krayt_yuvelir\",\"bitrix.krayt_stranichka_s_aktsiey\",\"bitrix.krayt_den_vsekh_vlyublennykh\",\"bitrix.krayt_stranichka_kontaktov\",\"bitrix.krayt_uslugi_massazhista\",\"bitrix.krayt_dostavka_edy_i_napitkov\",\"bitrix.krayt_podarki_na_zhenskiy_den\",\"bitrix.krayt_ekskursii\",\"bitrix.krayt_proizvodstvo_kosmetiki\",\"bitrix.krayt_logistika\",\"bitrix.krayt_fotograf\",\"bitrix.krayt_arenda_zhilya\",\"bitrix.krayt_kliningovye_uslugi\",\"bitrix.krayt_agentstvo_po_naymu\",\"bitrix.krayt_dukhi_na_zakaz\",\"bitrix.delobot_event_anounce\",\"bitrix.delobot_barbershop\",\"bitrix.delobot_italian_cafe\",\"bitrix.delobot_application_development\",\"bitrix.delobot_construction\",\"bitrix.delobot_uslugi_khudozhnika\",\"bitrix.krayt_prepodavatel\",\"bitrix.krayt_dveri_na_zakaz\",\"bitrix.krayt_kursy_po_gotovke\",\"bitrix.krayt_interernyy_dizayn\",\"bitrix.krayt_konsultatsii_po_zdorovyu\",\"bitrix.krayt_uslugi_atele\",\"bitrix.krayt_vizitka\",\"bitrix.krayt_remont_zhilya\",\"bitrix.krayt_voskhozhdenie_s_alpinistami\",\"bitrix.krayt_vesennyaya_rasprodazha\",\"bitrix.krayt_svadebnyy_salon\",\"bitrix.kraytlawyer_en\",\"bitrix.kraytinsurancecompany_en\",\"bitrix.krayt_interior_designer\",\"bitrix.delobot_bank\",\"bitrix.delobot_custom_made_clothes\",\"bitrix.delobot_telemedicine\",\"bitrix.krayt_spetsialist_po_nedvizhimosti\",\"bitrix.krayt_sportzal\",\"bitrix.krayt_mebel\",\"bitrix.krayt_tvorcheskie_kursy\",\"bitrix.krayt_kosmetologiya\",\"bitrix.krayt_remont_bytovoy_tekhniki\",\"bitrix.delobot_stylist_services\",\"bitrix.delobot_holidays_for_children\",\"bitrix.delobot_logistics_services\",\"bitrix.krayt_remont_avto\",\"bitrix.krayt_torgovoe_oborudovanie\",\"bitrix.krayt_rasteniya_i_zhivye_izgorodi\",\"bitrix.krayt_organizatsiya_meropriyatiy\",\"bitrix.krayt_o_psikhologe\",\"bitrix.krayt_prozhivanie_v_otele\",\"bitrix.krayt_dental_clinic\",\"bitrix.krayt_barbershop\",\"bitrix.krayt_personal_stylist\",\"bitrix.delobot_muzykalnaya_shkola\",\"bitrix.delobot_parfumer_services\",\"bitrix.delobot_uslugi_po_upakovke_podarkov\",\"bitrix.delobot_insurance\",\"bitrix.delobot_zabota_o_zhivotnyh\",\"bitrix.delobot_landscape_studio\",\"bitrix.krayt_dizayn_saytov\",\"bitrix.krayt_arenda_tekhniki\",\"bitrix.krayt_kursy_dlya_sotrudnikov\",\"bitrix.krayt_konditsionery_v_dom\",\"bitrix.krayt_promyshlennost\",\"bitrix.krayt_tantsy\",\"bitrix.krayt_pechat_3d_figur\",\"bitrix.krayt_o_biblioteke\",\"bitrix.krayt_vyrashchivanie_zeleni\",\"bitrix.krayt_okhrannye_sistemy\",\"bitrix.krayt_zvukozapis\",\"bitrix.krayt_rasprodazha\",\"bitrix.form_template_with_product_galery_for_social_media\",\"bitrix.form_template_with_offer\",\"bitrix.facebook_form_template_with_offer\",\"bitrix.facebook_form_template_with_product_images\",\"bitrix.facebook_form_template_with_extra_communication_channels\",\"bitrix.shablon_dlya_formy_v_vk_s_kartinkami_tovarov\",\"bitrix.shablon_dlya_formy_v_vk_s_kanalami_svyazi\",\"bitrix.shablon_dlya_formy_v_vk_s_promo_aktsiey\",\"bitrix.form_template_with_offer_for_social_media\",\"bitrix.form_template_with_contacts_for_social_media\",\"bitrix.form_template_with_product_images_for_social_media\",\"bitrix.form_template_with_communication_channels_for_social_media\",\"bitrix.krayt_vypechka\",\"bitrix.krayt_it_spetsialisty\",\"bitrix.krayt_modnyy_konsultant\",\"bitrix.krayt_agentstvo_po_turizmu\",\"bitrix.krayt_uslugi_vizazhista\",\"bitrix.krayt_fotostudiya\",\"bitrix.krayt_vyazanie\",\"bitrix.krayt_blagotvoritelnaya_organizatsiya\",\"bitrix.krayt_uslugi_illyustratora\",\"bitrix.delobot_intensiv_po_inostrannomu_yazyku\",\"bitrix.delobot_uslugi_po_remontu_tekhniki\",\"bitrix.delobot_stranichka_mobilnogo_prilozheniya\",\"bitrix.delobot_kreativnaya_mebel\",\"bitrix.delobot_klub_tsifrovykh_igr\",\"bitrix.delobot_dizayn_dlya_doma\",\"bitrix.krayt_studiya_spa\",\"bitrix.krayt_proekt_po_utepleniyu_doma\",\"bitrix.krayt_klining_kompaniya\",\"bitrix.krayt_arkhitektor\",\"bitrix.krayt_sladosti_na_zakaz\",\"bitrix.krayt_fotografiya\",\"bitrix.krayt_poligraficheskie_uslugi\",\"bitrix.krayt_manikyur_i_pedikyur\",\"bitrix.krayt_vyazanie_2\",\"bitrix.krayt_kofe\",\"bitrix.krayt_obuchenie_muzyke\",\"bitrix.krayt_novosti\",\"bitrix.delobot_spetsialist_po_tekstam\",\"bitrix.delobot_uslugi_elektrika\",\"bitrix.delobot_otslezhivanie_zdorovya\",\"bitrix.delobot_studiya_dlya_aktyerov\",\"bitrix.delobot_uslugi_kosmetologa\",\"bitrix.delobot_kottedzhnyy_posyelok\",\"bitrix.delobot_izdeliya_ot_yuvelira\",\"bitrix.krayt_montazh_panelnykh_domov\",\"bitrix.krayt_masterskaya_tekstilya\",\"bitrix.krayt_razrabotka_igr\",\"bitrix.krayt_organizatsiya_prazdnika\",\"bitrix.krayt_stilnaya_odezhda_na_zakaz\",\"bitrix.krayt_posuda_ot_dizaynera\",\"bitrix.krayt_pomeshchenie_dlya_kovorkinga\",\"bitrix.krayt_shokoladnaya_masterskaya\",\"bitrix.krayt_podbor_personala\",\"bitrix.krayt_uslugi_po_massazhu\",\"bitrix.krayt_prirodnyy_otdykh\",\"bitrix.krayt_agentstvo_po_reklame\",\"bitrix.krayt_stomatolog\",\"bitrix.krayt_povar_konditer\",\"bitrix.krayt_uslugi_po_strakhovaniyu\",\"bitrix.krayt_rasprodazha_osenyu\",\"bitrix.krayt_kukhni_na_zakaz\",\"bitrix.krayt_avtorskie_puteshestviya\",\"bitrix.krayt_remont_gadzhetov\",\"bitrix.krayt_proizvodstvo_produktsii\",\"bitrix.krayt_mezhdunarodnaya_biznes_konferentsiya\",\"bitrix.krayt_studiya_gibkosti\",\"bitrix.krayt_biznes_konsultatsii\",\"bitrix.krayt_brendingovoe_agentstvo\",\"bitrix.krayt_thanksgiving_day\",\"bitrix.krayt_architectural_company\",\"bitrix.krayt_online_school_for_children\",\"bitrix.krayt_ai_course\",\"bitrix.krayt_it_services_2\",\"bitrix.krayt_accounting_services\",\"bitrix.krayt_gaming_club\",\"bitrix.krayt_architectural_company_ru\",\"bitrix.delobot_beauty_blog_en\",\"bitrix.delobot_sladkoe_na_halloween\",\"bitrix.krayt_biznes_ru\",\"bitrix.krayt_business_en\",\"bitrix.krayt_vebinar_ru\",\"bitrix.delobot_music_band\",\"bitrix.delobot_courses\",\"bitrix.delobot_tours\",\"bitrix.krayt_uslugi_okhrany\",\"bitrix.krayt_agentstvo_nedvizhimosti\",\"bitrix.krayt_didzhital_illyustrator\",\"bitrix.krayt_landshaftnyy_dizayn\",\"bitrix.krayt_ochki_i_linzy_na_zakaz\",\"bitrix.krayt_organizatsiya_svadeb\",\"bitrix.krayt_pitanie_s_dietologom\",\"bitrix.krayt_uslugi_logistiki\",\"bitrix.krayt_uslugi_pekarya\",\"bitrix.krayt_uslugi_videostudii\",\"bitrix.krayt_home_construction_company\",\"bitrix.delobot_natural_cosmetics\",\"bitrix.krayt_real_estate_agent\",\"bitrix.krayt_spa_salon\",\"bitrix.krayt_yoga\",\"bitrix.krayt_uslugi_po_makiyajy\",\"bitrix.krayt_uslugi_psikhoterapevta\",\"bitrix.krayt_uslugi_advokat\",\"bitrix.krayt_uchitel_matematiki\",\"bitrix.krayt_portfolio_aktrisy\",\"bitrix.krayt_online_shkola_dlya_detey\",\"bitrix.krayt_odezhda_dlya_fitnesa\",\"bitrix.krayt_obuchenie_sotrudnikov\",\"bitrix.krayt_nabory_pravilnogo_pitaniya\",\"bitrix.krayt_kurs_po_ii\",\"bitrix.krayt_kontsert_gruppy\",\"bitrix.krayt_kokteylnyy_bar\",\"bitrix.krayt_khudozhnik\",\"bitrix.delobot_arenduemaya_tekhnika\",\"bitrix.delobot_franshiza_sportivnykh_zalov\",\"bitrix.delobot_massazh\",\"bitrix.delobot_oborudovanie_dlya_torgovli\",\"bitrix.delobot_remontnye_raboty\",\"bitrix.delobot_uslugi_po_remontu_avto\",\"bitrix.delobot_yuridicheskaya_kompaniya\",\"bitrix.delobot_yuridicheskiy_universitet\",\"bitrix.krayt_kiberponedelnik\",\"bitrix.krayt_koncert_gruppy\",\"bitrix.krayt_kurs_po_neyrosetyam\",\"bitrix.krayt_arenda_nedvizhimosti\",\"bitrix.krayt_nyanya_dlya_detok\",\"bitrix.krayt_uslugi_bukhgalterii\",\"bitrix.krayt_ozelenenie_goroda\",\"bitrix.krayt_proektirovanie_domov\",\"bitrix.krayt_ustanovka_konditsionerov\",\"bitrix.krayt_posuda\",\"bitrix.krayt_furniture_manufacturer\",\"bitrix.krayt_logistics\",\"bitrix.krayt_renovations\",\"bitrix.krayt_travel_agency\",\"bitrix.krayt_electrical_services\",\"bitrix.krayt_home_design_and_construction\",\"bitrix.krayt_legal_services\",\"bitrix.delobot_bathroom_renovations\",\"bitrix.delobot_it_services\",\"bitrix.delobot_konsaltingovaya_kompaniya\",\"bitrix.delobot_branding\",\"bitrix.delobot_mebel_dlya_rabochego_prostranstva\",\"bitrix.delobot_stroitelstvo_zhilya\",\"bitrix.delobot_zubnoy_vrach\",\"bitrix.delobot_furnituremanufacturing_en\",\"bitrix.krayt_university_en\",\"bitrix.delobot_newsblog_en\",\"bitrix.krayt_mobileapp_en\",\"bitrix.krayt_hotel_en\",\"bitrix.krayt_realestate_en\",\"bitrix.delobot_banking_services\",\"bitrix.krayt_website_designer\",\"bitrix.delobot_transport_services\",\"bitrix.krayt_recruitment_agency\",\"bitrix.krayt_camping_retreat\",\"bitrix.delobot_master_na_vse_ruki\",\"bitrix.delobot_apart_gostinitsa\",\"bitrix.delobot_tantsevalnye_kursy\",\"bitrix.delobot_zakaz_dverey\",\"bitrix.delobot_mediator\",\"bitrix.delobot_istoricheskiy_muzey\",\"bitrix.delobot_onlayn_vrach\",\"bitrix.delobot_uslugi_po_reklame\",\"bitrix.delobot_knigi_na_zakaz\",\"bitrix.delobot_avtozapchasti_i_avtoremont\",\"bitrix.delobot_blagotvoritelnyy_fond\",\"bitrix.delobot_it_konferentsiya\",\"bitrix.delobot_strakhovye_uslugi\",\"bitrix.delobot_tatu_i_pirsing\",\"bitrix.delobot_brendovye_ukrasheniya\",\"bitrix.delobot_divany_na_zakaz\",\"bitrix.delobot_kursy_dlya_dizaynerov\",\"bitrix.delobot_odezhda_dlya_aktivnykh_lyudey\",\"bitrix.delobot_podarochnye_nabory_sladostey\",\"bitrix.welcome_corp\",\"bitrix.welcome_prof\",\"bitrix.welcome_team\",\"bitrix.welcome_prof_en\",\"bitrix.welcome_corp_en\",\"bitrix.welcome_team_en\",\"bitrix.delobot_vrach_pediatr\",\"bitrix.delobot_personalnyy_trener\",\"bitrix.delobot_obuchenie_dlya_sotrudnikov\",\"bitrix.delobot_kulinarnaya_studiya\",\"bitrix.delobot_gastrobar_aziatskoy_kukhni\",\"bitrix.delobot_khudozhestvennaya_shkola\",\"bitrix.delobot_konsultatsii_tochnoe_zemledelie\",\"bitrix.delobot_uslugi_perevodchika\",\"bitrix.delobot_vizitka_professionala\",\"bitrix.delobot_skvosh_i_tennis\",\"bitrix.delobot_kosmetolog_estetist\",\"bitrix.delobot_kurs_po_analitike_dannykh\",\"bitrix.delobot_professionalnaya_fotosyemka\",\"bitrix.delobot_kursy_po_robototekhnike\",\"bitrix.delobot_proizvodstvennaya_masterskaya\",\"bitrix.delobot_remont_gadzhetov_i_elektroniki\"]', NULL, NULL),
('rest', 'entity_iblock_type', 'rest_entity', NULL, NULL),
('rest', 'server_path', '/rest', NULL, NULL),
('search', 'dbnode_id', 'N', NULL, NULL),
('search', 'dbnode_status', 'ok', NULL, NULL),
('search', 'version', 'v2.0', NULL, NULL),
('security', 'ipcheck_disable_file', '/bitrix/modules/ipcheck_disable_3573aef13bd53a2581a81221164dd2cc', NULL, NULL),
('security', 'redirect_sid', 'dvojfefpbzhdnfu2rm0i95f1ecr0zui1', NULL, NULL),
('socialservices', 'allow_encrypted_tokens', '1', NULL, NULL),
('socialservices', 'bitrix24net_domain', 'http://bitrix.local', NULL, NULL),
('socialservices', 'bitrix24net_id', 'ext.6717ee35ea4174.72829669', NULL, NULL),
('socialservices', 'bitrix24net_secret', 'JXO76eLBD4KEnwhNaHG2KfxYOpM6jckEw65rqFkWsBmdMgZSU0', NULL, NULL),
('socialservices', 'google_api_key', 'AIzaSyA7puwZwGDJgOjcAWsFsY7hQcrioC13A18', NULL, NULL),
('socialservices', 'google_appid', '798910771106.apps.googleusercontent.com', NULL, NULL),
('translate', 'BACKUP_FILES', 'N', NULL, NULL),
('translate', 'BACKUP_FOLDER', 'bitrix/backup/translate/', NULL, NULL),
('translate', 'BUTTON_LANG_FILES', 'Y', NULL, NULL),
('translate', 'DONT_SORT_LANGUAGES', 'ru', NULL, NULL),
('translate', 'EXPORT_CSV_DELIMITER', 'TZP', NULL, NULL),
('translate', 'EXPORT_FOLDER', '', NULL, NULL),
('translate', 'GROUP_DEFAULT_RIGHT', 'D', NULL, NULL),
('translate', 'INIT_FOLDERS', '/bitrix/,/local/', NULL, NULL),
('translate', 'SORT_PHRASES', 'Y', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_option_site`
--

CREATE TABLE IF NOT EXISTS `b_option_site` (
  `MODULE_ID` varchar(50) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `VALUE` mediumtext,
  PRIMARY KEY (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_site_module_site` (`MODULE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_cache`
--

CREATE TABLE IF NOT EXISTS `b_perf_cache` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `HIT_ID` int DEFAULT NULL,
  `COMPONENT_ID` int DEFAULT NULL,
  `NN` int DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) DEFAULT NULL,
  `MODULE_NAME` text,
  `COMPONENT_NAME` text,
  `BASE_DIR` text,
  `INIT_DIR` text,
  `FILE_NAME` text,
  `FILE_PATH` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_cluster`
--

CREATE TABLE IF NOT EXISTS `b_perf_cluster` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `THREADS` int DEFAULT NULL,
  `HITS` int DEFAULT NULL,
  `ERRORS` int DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_component`
--

CREATE TABLE IF NOT EXISTS `b_perf_component` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `HIT_ID` int DEFAULT NULL,
  `NN` int DEFAULT NULL,
  `CACHE_TYPE` char(1) DEFAULT NULL,
  `CACHE_SIZE` int DEFAULT NULL,
  `CACHE_COUNT_R` int DEFAULT NULL,
  `CACHE_COUNT_W` int DEFAULT NULL,
  `CACHE_COUNT_C` int DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_error`
--

CREATE TABLE IF NOT EXISTS `b_perf_error` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `HIT_ID` int DEFAULT NULL,
  `ERRNO` int DEFAULT NULL,
  `ERRSTR` text,
  `ERRFILE` text,
  `ERRLINE` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_history`
--

CREATE TABLE IF NOT EXISTS `b_perf_history` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_hit`
--

CREATE TABLE IF NOT EXISTS `b_perf_hit` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) DEFAULT NULL,
  `SERVER_NAME` varchar(50) DEFAULT NULL,
  `SERVER_PORT` int DEFAULT NULL,
  `SCRIPT_NAME` text,
  `REQUEST_URI` text,
  `INCLUDED_FILES` int DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int DEFAULT NULL,
  `CACHE_TYPE` char(1) DEFAULT NULL,
  `CACHE_SIZE` int DEFAULT NULL,
  `CACHE_COUNT_R` int DEFAULT NULL,
  `CACHE_COUNT_W` int DEFAULT NULL,
  `CACHE_COUNT_C` int DEFAULT NULL,
  `QUERIES` int DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_ban`
--

CREATE TABLE IF NOT EXISTS `b_perf_index_ban` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `BAN_TYPE` char(1) DEFAULT NULL,
  `TABLE_NAME` varchar(50) DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_complete`
--

CREATE TABLE IF NOT EXISTS `b_perf_index_complete` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `BANNED` char(1) DEFAULT NULL,
  `TABLE_NAME` varchar(50) DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) DEFAULT NULL,
  `INDEX_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_suggest`
--

CREATE TABLE IF NOT EXISTS `b_perf_index_suggest` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SQL_MD5` char(32) DEFAULT NULL,
  `SQL_COUNT` int DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) DEFAULT NULL,
  `SQL_TEXT` text,
  `SQL_EXPLAIN` longtext,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_suggest_sql`
--

CREATE TABLE IF NOT EXISTS `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int NOT NULL,
  `SQL_ID` int NOT NULL,
  PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_sql`
--

CREATE TABLE IF NOT EXISTS `b_perf_sql` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `HIT_ID` int DEFAULT NULL,
  `COMPONENT_ID` int DEFAULT NULL,
  `NN` int DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int DEFAULT NULL,
  `MODULE_NAME` text,
  `COMPONENT_NAME` text,
  `SQL_TEXT` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_sql_backtrace`
--

CREATE TABLE IF NOT EXISTS `b_perf_sql_backtrace` (
  `SQL_ID` int NOT NULL,
  `NN` int NOT NULL,
  `FILE_NAME` varchar(500) DEFAULT NULL,
  `LINE_NO` int DEFAULT NULL,
  `CLASS_NAME` varchar(500) DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`SQL_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_table`
--

CREATE TABLE IF NOT EXISTS `b_perf_table` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(64) DEFAULT NULL,
  `KEY_COLUMN` varchar(50) DEFAULT NULL,
  `REC_COUNT` int DEFAULT NULL,
  `LAST_ID` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_tab_column_stat`
--

CREATE TABLE IF NOT EXISTS `b_perf_tab_column_stat` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(50) DEFAULT NULL,
  `COLUMN_NAME` varchar(50) DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_tab_stat`
--

CREATE TABLE IF NOT EXISTS `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) NOT NULL,
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_test`
--

CREATE TABLE IF NOT EXISTS `b_perf_test` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int DEFAULT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating`
--

CREATE TABLE IF NOT EXISTS `b_rating` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL,
  `NAME` varchar(512) NOT NULL,
  `ENTITY_ID` varchar(50) NOT NULL,
  `CALCULATION_METHOD` varchar(3) NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) DEFAULT 'N',
  `AUTHORITY` char(1) DEFAULT 'N',
  `CALCULATED` char(1) NOT NULL DEFAULT 'N',
  `CONFIGS` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_rating`
--

INSERT INTO `b_rating` (`ID`, `ACTIVE`, `NAME`, `ENTITY_ID`, `CALCULATION_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_CALCULATED`, `POSITION`, `AUTHORITY`, `CALCULATED`, `CONFIGS`) VALUES
(1, 'N', 'Рейтинг', 'USER', 'SUM', '2024-10-22 21:22:25', NULL, NULL, 'Y', 'N', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}'),
(2, 'N', 'Авторитет', 'USER', 'SUM', '2024-10-22 21:22:25', NULL, NULL, 'Y', 'Y', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_component`
--

CREATE TABLE IF NOT EXISTS `b_rating_component` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RATING_ID` int NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `RATING_TYPE` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `COMPLEX_NAME` varchar(200) NOT NULL,
  `CLASS` varchar(255) NOT NULL,
  `CALC_METHOD` varchar(255) NOT NULL,
  `EXCEPTION_METHOD` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int NOT NULL,
  `CONFIG` text,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_component_results`
--

CREATE TABLE IF NOT EXISTS `b_rating_component_results` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RATING_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `RATING_TYPE` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `COMPLEX_NAME` varchar(200) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_prepare`
--

CREATE TABLE IF NOT EXISTS `b_rating_prepare` (
  `ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_results`
--

CREATE TABLE IF NOT EXISTS `b_rating_results` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RATING_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int DEFAULT '0',
  `PREVIOUS_POSITION` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_rule`
--

CREATE TABLE IF NOT EXISTS `b_rating_rule` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `NAME` varchar(256) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `CONDITION_NAME` varchar(200) NOT NULL,
  `CONDITION_MODULE` varchar(50) DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) NOT NULL,
  `CONDITION_METHOD` varchar(255) NOT NULL,
  `CONDITION_CONFIG` text,
  `ACTION_NAME` varchar(200) NOT NULL,
  `ACTION_CONFIG` text,
  `ACTIVATE` char(1) NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) NOT NULL,
  `ACTIVATE_METHOD` varchar(255) NOT NULL,
  `DEACTIVATE` char(1) NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_rating_rule`
--

INSERT INTO `b_rating_rule` (`ID`, `ACTIVE`, `NAME`, `ENTITY_TYPE_ID`, `CONDITION_NAME`, `CONDITION_MODULE`, `CONDITION_CLASS`, `CONDITION_METHOD`, `CONDITION_CONFIG`, `ACTION_NAME`, `ACTION_CONFIG`, `ACTIVATE`, `ACTIVATE_CLASS`, `ACTIVATE_METHOD`, `DEACTIVATE`, `DEACTIVATE_CLASS`, `DEACTIVATE_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_APPLIED`) VALUES
(1, 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2024-10-22 21:22:25', '2024-10-22 21:22:25', NULL),
(2, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2024-10-22 21:22:25', '2024-10-22 21:22:25', NULL),
(3, 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2024-10-22 21:22:25', '2024-10-22 21:22:25', NULL),
(4, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2024-10-22 21:22:25', '2024-10-22 21:22:25', NULL),
(5, 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', NULL, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.1;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.1;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2024-10-22 21:22:25', '2024-10-22 21:22:25', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_rule_vetting`
--

CREATE TABLE IF NOT EXISTS `b_rating_rule_vetting` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RULE_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ACTIVATE` char(1) NOT NULL DEFAULT 'N',
  `APPLIED` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_user`
--

CREATE TABLE IF NOT EXISTS `b_rating_user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RATING_ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  KEY `IX_B_RAT_USER_2` (`ENTITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_rating_user`
--

INSERT INTO `b_rating_user` (`ID`, `RATING_ID`, `ENTITY_ID`, `BONUS`, `VOTE_WEIGHT`, `VOTE_COUNT`) VALUES
(1, 2, 1, 3.0000, 30.0000, 13);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_vote`
--

CREATE TABLE IF NOT EXISTS `b_rating_vote` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `OWNER_ID` int NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int NOT NULL,
  `USER_IP` varchar(64) NOT NULL,
  `REACTION` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_10` (`USER_ID`,`OWNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_vote_group`
--

CREATE TABLE IF NOT EXISTS `b_rating_vote_group` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int NOT NULL,
  `TYPE` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_rating_vote_group`
--

INSERT INTO `b_rating_vote_group` (`ID`, `GROUP_ID`, `TYPE`) VALUES
(5, 1, 'A'),
(1, 1, 'R'),
(3, 1, 'R'),
(2, 3, 'R'),
(4, 3, 'R'),
(6, 4, 'A');

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting`
--

CREATE TABLE IF NOT EXISTS `b_rating_voting` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `OWNER_ID` int NOT NULL,
  `ACTIVE` char(1) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int NOT NULL,
  `TOTAL_POSITIVE_VOTES` int NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting_prepare`
--

CREATE TABLE IF NOT EXISTS `b_rating_voting_prepare` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int NOT NULL,
  `TOTAL_POSITIVE_VOTES` int NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting_reaction`
--

CREATE TABLE IF NOT EXISTS `b_rating_voting_reaction` (
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `REACTION` varchar(8) NOT NULL DEFAULT '',
  `TOTAL_VOTES` int NOT NULL,
  PRIMARY KEY (`ENTITY_TYPE_ID`,`ENTITY_ID`,`REACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_weight`
--

CREATE TABLE IF NOT EXISTS `b_rating_weight` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_rating_weight`
--

INSERT INTO `b_rating_weight` (`ID`, `RATING_FROM`, `RATING_TO`, `WEIGHT`, `COUNT`) VALUES
(1, -1000000.0000, 1000000.0000, 1.0000, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_ap`
--

CREATE TABLE IF NOT EXISTS `b_rest_ap` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `TITLE` varchar(255) DEFAULT '',
  `COMMENT` varchar(255) DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_ap` (`USER_ID`,`PASSWORD`,`ACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_app`
--

CREATE TABLE IF NOT EXISTS `b_rest_app` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` varchar(128) NOT NULL,
  `CODE` varchar(128) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `INSTALLED` char(1) NOT NULL DEFAULT 'N',
  `URL` varchar(1000) NOT NULL,
  `URL_DEMO` varchar(1000) DEFAULT NULL,
  `URL_INSTALL` varchar(1000) DEFAULT NULL,
  `VERSION` varchar(4) DEFAULT '1',
  `SCOPE` varchar(2000) NOT NULL,
  `STATUS` char(1) NOT NULL DEFAULT 'F',
  `DATE_FINISH` date DEFAULT NULL,
  `IS_TRIALED` char(1) DEFAULT 'N',
  `SHARED_KEY` varchar(32) DEFAULT NULL,
  `CLIENT_SECRET` varchar(100) DEFAULT NULL,
  `APP_NAME` varchar(1000) DEFAULT NULL,
  `ACCESS` varchar(2000) DEFAULT '',
  `APPLICATION_TOKEN` varchar(50) DEFAULT '',
  `MOBILE` char(1) DEFAULT 'N',
  `USER_INSTALL` char(1) DEFAULT 'N',
  `URL_SETTINGS` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app1` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_app_lang`
--

CREATE TABLE IF NOT EXISTS `b_rest_app_lang` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `APP_ID` int NOT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `MENU_NAME` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app_lang1` (`APP_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_app_log`
--

CREATE TABLE IF NOT EXISTS `b_rest_app_log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `APP_ID` int NOT NULL,
  `ACTION_TYPE` varchar(50) NOT NULL,
  `USER_ID` int NOT NULL,
  `USER_ADMIN` char(1) DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_app_log1` (`APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_ap_permission`
--

CREATE TABLE IF NOT EXISTS `b_rest_ap_permission` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PASSWORD_ID` int NOT NULL,
  `PERM` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_ap_perm1` (`PASSWORD_ID`,`PERM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_configuration_storage`
--

CREATE TABLE IF NOT EXISTS `b_rest_configuration_storage` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` timestamp NULL DEFAULT NULL,
  `CONTEXT` varchar(128) NOT NULL,
  `CODE` varchar(32) NOT NULL,
  `DATA` longtext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_event`
--

CREATE TABLE IF NOT EXISTS `b_rest_event` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `APP_ID` int DEFAULT NULL,
  `EVENT_NAME` varchar(255) NOT NULL,
  `EVENT_HANDLER` varchar(255) NOT NULL,
  `USER_ID` int DEFAULT '0',
  `TITLE` varchar(255) DEFAULT '',
  `COMMENT` varchar(255) DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `APPLICATION_TOKEN` varchar(50) DEFAULT '',
  `CONNECTOR_ID` varchar(255) DEFAULT '',
  `INTEGRATION_ID` int DEFAULT NULL,
  `OPTIONS` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_app_event` (`APP_ID`,`EVENT_NAME`(50),`EVENT_HANDLER`(180),`USER_ID`,`CONNECTOR_ID`(70)),
  KEY `ix_b_rest_event_event_name` (`EVENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_event_offline`
--

CREATE TABLE IF NOT EXISTS `b_rest_event_offline` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MESSAGE_ID` varchar(100) NOT NULL,
  `APP_ID` int NOT NULL,
  `EVENT_NAME` varchar(255) NOT NULL,
  `EVENT_DATA` text,
  `EVENT_ADDITIONAL` text,
  `PROCESS_ID` varchar(255) DEFAULT '',
  `CONNECTOR_ID` varchar(255) DEFAULT '',
  `ERROR` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_offline1` (`MESSAGE_ID`(50),`APP_ID`,`CONNECTOR_ID`(100),`PROCESS_ID`(50)),
  KEY `ix_b_rest_event_offline2` (`TIMESTAMP_X`),
  KEY `ix_b_rest_event_offline3` (`APP_ID`,`CONNECTOR_ID`),
  KEY `ix_b_rest_event_offline4` (`PROCESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_integration`
--

CREATE TABLE IF NOT EXISTS `b_rest_integration` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int DEFAULT NULL,
  `ELEMENT_CODE` varchar(256) NOT NULL,
  `TITLE` varchar(256) NOT NULL,
  `PASSWORD_ID` int DEFAULT NULL,
  `APP_ID` int DEFAULT NULL,
  `SCOPE` text,
  `QUERY` text,
  `OUTGOING_EVENTS` text,
  `OUTGOING_NEEDED` char(1) DEFAULT NULL,
  `OUTGOING_HANDLER_URL` varchar(2048) DEFAULT NULL,
  `WIDGET_NEEDED` char(1) DEFAULT NULL,
  `WIDGET_HANDLER_URL` varchar(2048) DEFAULT NULL,
  `WIDGET_LIST` text,
  `APPLICATION_TOKEN` varchar(50) DEFAULT NULL,
  `APPLICATION_NEEDED` char(1) DEFAULT NULL,
  `APPLICATION_ONLY_API` char(1) DEFAULT NULL,
  `BOT_ID` int DEFAULT NULL,
  `BOT_HANDLER_URL` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_log`
--

CREATE TABLE IF NOT EXISTS `b_rest_log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CLIENT_ID` varchar(45) DEFAULT NULL,
  `PASSWORD_ID` int DEFAULT NULL,
  `EVENT_ID` int DEFAULT NULL,
  `SCOPE` varchar(50) DEFAULT NULL,
  `METHOD` varchar(255) DEFAULT NULL,
  `REQUEST_METHOD` varchar(10) DEFAULT NULL,
  `REQUEST_URI` varchar(255) DEFAULT NULL,
  `REQUEST_AUTH` text,
  `REQUEST_DATA` text,
  `RESPONSE_STATUS` varchar(20) DEFAULT NULL,
  `RESPONSE_DATA` longtext,
  `MESSAGE` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_owner_entity`
--

CREATE TABLE IF NOT EXISTS `b_rest_owner_entity` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OWNER_TYPE` char(1) NOT NULL,
  `OWNER` int NOT NULL,
  `ENTITY_TYPE` varchar(32) NOT NULL,
  `ENTITY` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_rest_owner_entity` (`ENTITY_TYPE`,`ENTITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_placement`
--

CREATE TABLE IF NOT EXISTS `b_rest_placement` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `APP_ID` int DEFAULT NULL,
  `USER_ID` int DEFAULT '0',
  `PLACEMENT` varchar(255) NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) NOT NULL,
  `ICON_ID` int DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT '',
  `GROUP_NAME` varchar(255) DEFAULT '',
  `COMMENT` varchar(255) DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `ADDITIONAL` varchar(255) DEFAULT NULL,
  `OPTIONS` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_placement1` (`APP_ID`,`PLACEMENT`(100),`PLACEMENT_HANDLER`(200)),
  KEY `ix_b_rest_placement3` (`PLACEMENT`(100),`ADDITIONAL`(100)),
  KEY `ix_b_rest_placement4` (`PLACEMENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_placement_lang`
--

CREATE TABLE IF NOT EXISTS `b_rest_placement_lang` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PLACEMENT_ID` int NOT NULL,
  `LANGUAGE_ID` varchar(2) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `GROUP_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `b_rest_placement_lang_unique` (`PLACEMENT_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_stat`
--

CREATE TABLE IF NOT EXISTS `b_rest_stat` (
  `STAT_DATE` date NOT NULL,
  `APP_ID` int NOT NULL,
  `METHOD_ID` int NOT NULL,
  `HOUR_0` int NOT NULL DEFAULT '0',
  `HOUR_1` int NOT NULL DEFAULT '0',
  `HOUR_2` int NOT NULL DEFAULT '0',
  `HOUR_3` int NOT NULL DEFAULT '0',
  `HOUR_4` int NOT NULL DEFAULT '0',
  `HOUR_5` int NOT NULL DEFAULT '0',
  `HOUR_6` int NOT NULL DEFAULT '0',
  `HOUR_7` int NOT NULL DEFAULT '0',
  `HOUR_8` int NOT NULL DEFAULT '0',
  `HOUR_9` int NOT NULL DEFAULT '0',
  `HOUR_10` int NOT NULL DEFAULT '0',
  `HOUR_11` int NOT NULL DEFAULT '0',
  `HOUR_12` int NOT NULL DEFAULT '0',
  `HOUR_13` int NOT NULL DEFAULT '0',
  `HOUR_14` int NOT NULL DEFAULT '0',
  `HOUR_15` int NOT NULL DEFAULT '0',
  `HOUR_16` int NOT NULL DEFAULT '0',
  `HOUR_17` int NOT NULL DEFAULT '0',
  `HOUR_18` int NOT NULL DEFAULT '0',
  `HOUR_19` int NOT NULL DEFAULT '0',
  `HOUR_20` int NOT NULL DEFAULT '0',
  `HOUR_21` int NOT NULL DEFAULT '0',
  `HOUR_22` int NOT NULL DEFAULT '0',
  `HOUR_23` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`APP_ID`,`STAT_DATE`,`METHOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_stat_app`
--

CREATE TABLE IF NOT EXISTS `b_rest_stat_app` (
  `APP_ID` int NOT NULL,
  `APP_CODE` varchar(128) NOT NULL,
  PRIMARY KEY (`APP_ID`),
  KEY `ix_b_rest_stat_app_code` (`APP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_stat_method`
--

CREATE TABLE IF NOT EXISTS `b_rest_stat_method` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `METHOD_TYPE` char(1) DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_stat_method` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_usage_entity`
--

CREATE TABLE IF NOT EXISTS `b_rest_usage_entity` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` char(1) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_CODE` varchar(255) DEFAULT NULL,
  `SUB_ENTITY_TYPE` char(1) DEFAULT NULL,
  `SUB_ENTITY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_rest_usage_entity` (`ENTITY_TYPE`,`ENTITY_ID`,`SUB_ENTITY_TYPE`,`SUB_ENTITY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_usage_stat`
--

CREATE TABLE IF NOT EXISTS `b_rest_usage_stat` (
  `STAT_DATE` date NOT NULL,
  `ENTITY_ID` int NOT NULL DEFAULT '0',
  `IS_SENT` char(1) NOT NULL DEFAULT 'N',
  `HOUR_0` int NOT NULL DEFAULT '0',
  `HOUR_1` int NOT NULL DEFAULT '0',
  `HOUR_2` int NOT NULL DEFAULT '0',
  `HOUR_3` int NOT NULL DEFAULT '0',
  `HOUR_4` int NOT NULL DEFAULT '0',
  `HOUR_5` int NOT NULL DEFAULT '0',
  `HOUR_6` int NOT NULL DEFAULT '0',
  `HOUR_7` int NOT NULL DEFAULT '0',
  `HOUR_8` int NOT NULL DEFAULT '0',
  `HOUR_9` int NOT NULL DEFAULT '0',
  `HOUR_10` int NOT NULL DEFAULT '0',
  `HOUR_11` int NOT NULL DEFAULT '0',
  `HOUR_12` int NOT NULL DEFAULT '0',
  `HOUR_13` int NOT NULL DEFAULT '0',
  `HOUR_14` int NOT NULL DEFAULT '0',
  `HOUR_15` int NOT NULL DEFAULT '0',
  `HOUR_16` int NOT NULL DEFAULT '0',
  `HOUR_17` int NOT NULL DEFAULT '0',
  `HOUR_18` int NOT NULL DEFAULT '0',
  `HOUR_19` int NOT NULL DEFAULT '0',
  `HOUR_20` int NOT NULL DEFAULT '0',
  `HOUR_21` int NOT NULL DEFAULT '0',
  `HOUR_22` int NOT NULL DEFAULT '0',
  `HOUR_23` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`STAT_DATE`,`ENTITY_ID`),
  KEY `ix_b_rest_usage` (`ENTITY_ID`,`STAT_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content`
--

CREATE TABLE IF NOT EXISTS `b_search_content` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `ITEM_ID` varchar(255) NOT NULL,
  `CUSTOM_RANK` int NOT NULL DEFAULT '0',
  `USER_ID` int DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) DEFAULT NULL,
  `ENTITY_ID` varchar(255) DEFAULT NULL,
  `URL` text,
  `TITLE` text,
  `BODY` longtext,
  `TAGS` text,
  `PARAM1` text,
  `PARAM2` text,
  `UPD` varchar(32) DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_search_content`
--

INSERT INTO `b_search_content` (`ID`, `DATE_CHANGE`, `MODULE_ID`, `ITEM_ID`, `CUSTOM_RANK`, `USER_ID`, `ENTITY_TYPE_ID`, `ENTITY_ID`, `URL`, `TITLE`, `BODY`, `TAGS`, `PARAM1`, `PARAM2`, `UPD`, `DATE_FROM`, `DATE_TO`) VALUES
(1, '2024-10-23 05:07:18', 'main', 's1|/index.php', 0, NULL, NULL, NULL, '/index.php', 'Главная', '', '', '', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_freq`
--

CREATE TABLE IF NOT EXISTS `b_search_content_freq` (
  `STEM` int NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_param`
--

CREATE TABLE IF NOT EXISTS `b_search_content_param` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `PARAM_NAME` varchar(100) NOT NULL,
  `PARAM_VALUE` varchar(100) NOT NULL,
  KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_right`
--

CREATE TABLE IF NOT EXISTS `b_search_content_right` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `GROUP_CODE` varchar(100) NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_search_content_right`
--

INSERT INTO `b_search_content_right` (`SEARCH_CONTENT_ID`, `GROUP_CODE`) VALUES
(1, 'G2');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_site`
--

CREATE TABLE IF NOT EXISTS `b_search_content_site` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `URL` text,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_search_content_site`
--

INSERT INTO `b_search_content_site` (`SEARCH_CONTENT_ID`, `SITE_ID`, `URL`) VALUES
(1, 's1', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_stem`
--

CREATE TABLE IF NOT EXISTS `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `STEM` int NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_search_content_stem`
--

INSERT INTO `b_search_content_stem` (`SEARCH_CONTENT_ID`, `LANGUAGE_ID`, `STEM`, `TF`, `PS`) VALUES
(1, 'ru', 1, 0.2314, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_text`
--

CREATE TABLE IF NOT EXISTS `b_search_content_text` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) NOT NULL,
  `SEARCHABLE_CONTENT` longtext,
  PRIMARY KEY (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_search_content_text`
--

INSERT INTO `b_search_content_text` (`SEARCH_CONTENT_ID`, `SEARCH_CONTENT_MD5`, `SEARCHABLE_CONTENT`) VALUES
(1, 'f10591b306cc35ed567604af57dcb373', 'ГЛАВНАЯ\r\n\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_title`
--

CREATE TABLE IF NOT EXISTS `b_search_content_title` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `POS` int NOT NULL,
  `WORD` varchar(100) NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_search_content_title`
--

INSERT INTO `b_search_content_title` (`SEARCH_CONTENT_ID`, `SITE_ID`, `POS`, `WORD`) VALUES
(1, 's1', 0, 'ГЛАВНАЯ');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_custom_rank`
--

CREATE TABLE IF NOT EXISTS `b_search_custom_rank` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `APPLIED` char(1) NOT NULL DEFAULT 'N',
  `RANK` int NOT NULL DEFAULT '0',
  `SITE_ID` char(2) NOT NULL,
  `MODULE_ID` varchar(200) NOT NULL,
  `PARAM1` text,
  `PARAM2` text,
  `ITEM_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_phrase`
--

CREATE TABLE IF NOT EXISTS `b_search_phrase` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `RESULT_COUNT` int NOT NULL,
  `PAGES` int NOT NULL,
  `SESSION_ID` varchar(32) NOT NULL,
  `PHRASE` varchar(250) DEFAULT NULL,
  `TAGS` varchar(250) DEFAULT NULL,
  `URL_TO` text,
  `URL_TO_404` char(1) DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) DEFAULT NULL,
  `STAT_SESS_ID` int DEFAULT NULL,
  `EVENT1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_stem`
--

CREATE TABLE IF NOT EXISTS `b_search_stem` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `STEM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_search_stem`
--

INSERT INTO `b_search_stem` (`ID`, `STEM`) VALUES
(1, 'ГЛАВН');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_suggest`
--

CREATE TABLE IF NOT EXISTS `b_search_suggest` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `FILTER_MD5` varchar(32) NOT NULL,
  `PHRASE` varchar(250) NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_tags`
--

CREATE TABLE IF NOT EXISTS `b_search_tags` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci DELAY_KEY_WRITE=1;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_user_right`
--

CREATE TABLE IF NOT EXISTS `b_search_user_right` (
  `USER_ID` int NOT NULL,
  `GROUP_CODE` varchar(100) NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_security_sitecheck`
--

CREATE TABLE IF NOT EXISTS `b_security_sitecheck` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TEST_DATE` datetime DEFAULT NULL,
  `RESULTS` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_filter_mask`
--

CREATE TABLE IF NOT EXISTS `b_sec_filter_mask` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SORT` int NOT NULL DEFAULT '10',
  `SITE_ID` char(2) DEFAULT NULL,
  `FILTER_MASK` varchar(250) DEFAULT NULL,
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_frame_mask`
--

CREATE TABLE IF NOT EXISTS `b_sec_frame_mask` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SORT` int NOT NULL DEFAULT '10',
  `SITE_ID` char(2) DEFAULT NULL,
  `FRAME_MASK` varchar(250) DEFAULT NULL,
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule`
--

CREATE TABLE IF NOT EXISTS `b_sec_iprule` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RULE_TYPE` char(1) NOT NULL DEFAULT 'M',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `ADMIN_SECTION` char(1) NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_FROM_TIMESTAMP` int DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `ACTIVE_TO_TIMESTAMP` int DEFAULT NULL,
  `NAME` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_iprule_active_to` (`ACTIVE_TO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_excl_ip`
--

CREATE TABLE IF NOT EXISTS `b_sec_iprule_excl_ip` (
  `IPRULE_ID` int NOT NULL,
  `RULE_IP` varchar(50) NOT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `IP_START` bigint DEFAULT NULL,
  `IP_END` bigint DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_excl_mask`
--

CREATE TABLE IF NOT EXISTS `b_sec_iprule_excl_mask` (
  `IPRULE_ID` int NOT NULL,
  `RULE_MASK` varchar(250) NOT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_incl_ip`
--

CREATE TABLE IF NOT EXISTS `b_sec_iprule_incl_ip` (
  `IPRULE_ID` int NOT NULL,
  `RULE_IP` varchar(50) NOT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `IP_START` bigint DEFAULT NULL,
  `IP_END` bigint DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_incl_mask`
--

CREATE TABLE IF NOT EXISTS `b_sec_iprule_incl_mask` (
  `IPRULE_ID` int NOT NULL,
  `RULE_MASK` varchar(250) NOT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_recovery_codes`
--

CREATE TABLE IF NOT EXISTS `b_sec_recovery_codes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `CODE` varchar(255) NOT NULL,
  `USED` varchar(1) NOT NULL DEFAULT 'N',
  `USING_DATE` datetime DEFAULT NULL,
  `USING_IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_recovery_codes_user_id` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_redirect_url`
--

CREATE TABLE IF NOT EXISTS `b_sec_redirect_url` (
  `IS_SYSTEM` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int NOT NULL DEFAULT '500',
  `URL` varchar(250) NOT NULL,
  `PARAMETER_NAME` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_session`
--

CREATE TABLE IF NOT EXISTS `b_sec_session` (
  `SESSION_ID` varchar(250) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `SESSION_DATA` longtext,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_b_sec_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_user`
--

CREATE TABLE IF NOT EXISTS `b_sec_user` (
  `USER_ID` int NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `SECRET` varchar(64) DEFAULT NULL,
  `TYPE` varchar(16) NOT NULL,
  `INIT_PARAMS` text,
  `PARAMS` text,
  `ATTEMPTS` int DEFAULT NULL,
  `INITIAL_DATE` datetime DEFAULT NULL,
  `SKIP_MANDATORY` char(1) NOT NULL DEFAULT 'N',
  `DEACTIVATE_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_vendor_notification`
--

CREATE TABLE IF NOT EXISTS `b_sec_vendor_notification` (
  `VENDOR_ID` varchar(50) NOT NULL,
  `DATA` text,
  PRIMARY KEY (`VENDOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_vendor_notification_sign`
--

CREATE TABLE IF NOT EXISTS `b_sec_vendor_notification_sign` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `NOTIFICATION_VENDOR_ID` varchar(50) NOT NULL,
  `DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_ID` (`USER_ID`,`NOTIFICATION_VENDOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_virus`
--

CREATE TABLE IF NOT EXISTS `b_sec_virus` (
  `ID` varchar(32) NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `SENT` char(1) NOT NULL DEFAULT 'N',
  `INFO` longtext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_white_list`
--

CREATE TABLE IF NOT EXISTS `b_sec_white_list` (
  `ID` int NOT NULL,
  `WHITE_SUBSTR` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_wwall_rules`
--

CREATE TABLE IF NOT EXISTS `b_sec_wwall_rules` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DATA` text,
  `MODULE` varchar(50) NOT NULL,
  `MODULE_VERSION` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_xscan_results`
--

CREATE TABLE IF NOT EXISTS `b_sec_xscan_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(5) NOT NULL,
  `src` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `score` double NOT NULL,
  `mtime` datetime DEFAULT NULL,
  `ctime` datetime DEFAULT NULL,
  `tags` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_autolog`
--

CREATE TABLE IF NOT EXISTS `b_seo_adv_autolog` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `CAMPAIGN_ID` int NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) NOT NULL,
  `BANNER_ID` int NOT NULL,
  `BANNER_XML_ID` varchar(255) NOT NULL,
  `CAUSE_CODE` int DEFAULT '0',
  `SUCCESS` char(1) DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_banner`
--

CREATE TABLE IF NOT EXISTS `b_seo_adv_banner` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int NOT NULL,
  `OWNER_ID` varchar(255) NOT NULL,
  `OWNER_NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `XML_ID` varchar(255) NOT NULL,
  `LAST_UPDATE` datetime DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `SETTINGS` mediumtext,
  `CAMPAIGN_ID` int NOT NULL,
  `GROUP_ID` int DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_campaign`
--

CREATE TABLE IF NOT EXISTS `b_seo_adv_campaign` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) NOT NULL,
  `OWNER_NAME` varchar(255) NOT NULL,
  `XML_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `LAST_UPDATE` datetime DEFAULT NULL,
  `SETTINGS` mediumtext,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_group`
--

CREATE TABLE IF NOT EXISTS `b_seo_adv_group` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int NOT NULL,
  `OWNER_ID` varchar(255) NOT NULL,
  `OWNER_NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `XML_ID` varchar(255) NOT NULL,
  `LAST_UPDATE` datetime DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `SETTINGS` text,
  `CAMPAIGN_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_link`
--

CREATE TABLE IF NOT EXISTS `b_seo_adv_link` (
  `LINK_TYPE` char(1) NOT NULL,
  `LINK_ID` int NOT NULL,
  `BANNER_ID` int NOT NULL,
  PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_log`
--

CREATE TABLE IF NOT EXISTS `b_seo_adv_log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `REQUEST_URI` varchar(100) NOT NULL,
  `REQUEST_DATA` text,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int DEFAULT NULL,
  `RESPONSE_DATA` text,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_order`
--

CREATE TABLE IF NOT EXISTS `b_seo_adv_order` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `CAMPAIGN_ID` int NOT NULL,
  `BANNER_ID` int NOT NULL,
  `ORDER_ID` int NOT NULL,
  `SUM` float DEFAULT '0',
  `PROCESSED` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_region`
--

CREATE TABLE IF NOT EXISTS `b_seo_adv_region` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int NOT NULL,
  `OWNER_ID` varchar(255) NOT NULL,
  `OWNER_NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `XML_ID` varchar(255) NOT NULL,
  `LAST_UPDATE` datetime DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `SETTINGS` text,
  `PARENT_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_region1` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_keywords`
--

CREATE TABLE IF NOT EXISTS `b_seo_keywords` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `KEYWORDS` text,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_search_engine`
--

CREATE TABLE IF NOT EXISTS `b_seo_search_engine` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `SORT` int DEFAULT '100',
  `NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `SETTINGS` longtext,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_seo_search_engine`
--

INSERT INTO `b_seo_search_engine` (`ID`, `CODE`, `ACTIVE`, `SORT`, `NAME`, `CLIENT_ID`, `CLIENT_SECRET`, `REDIRECT_URI`, `SETTINGS`) VALUES
(1, 'google', 'Y', 200, 'Google', '868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com', 'EItMlJpZLC2WRPKB6QsA5bV9', 'urn:ietf:wg:oauth:2.0:oob', NULL),
(2, 'yandex', 'Y', 300, 'Yandex', 'f848c7bfc1d34a94ba6d05439f81bbd7', 'da0e73b2d9cc4e809f3170e49cb9df01', 'https://oauth.yandex.ru/verification_code', NULL),
(3, 'yandex_direct', 'Y', 400, 'Yandex.Direct', '', '', 'https://oauth.yandex.ru/verification_code', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_log`
--

CREATE TABLE IF NOT EXISTS `b_seo_service_log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `CODE` varchar(20) DEFAULT NULL,
  `MESSAGE` varchar(1000) NOT NULL,
  `GROUP_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_queue`
--

CREATE TABLE IF NOT EXISTS `b_seo_service_queue` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(20) NOT NULL,
  `SERVICE_TYPE` varchar(20) NOT NULL,
  `CLIENT_ID` int NOT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_QUEUE_TYPE` (`TYPE`),
  KEY `IX_B_SEO_SERVICE_SERVICE_TYPE_CLIENT_ID` (`SERVICE_TYPE`,`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_rtg_queue`
--

CREATE TABLE IF NOT EXISTS `b_seo_service_rtg_queue` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) NOT NULL,
  `CLIENT_ID` varchar(50) DEFAULT NULL,
  `ACCOUNT_ID` varchar(50) DEFAULT NULL,
  `AUDIENCE_ID` varchar(50) NOT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `CONTACT_TYPE` varchar(15) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `ACTION` char(3) NOT NULL,
  `DATE_AUTO_REMOVE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_1` (`ACTION`,`DATE_AUTO_REMOVE`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_2` (`TYPE`,`ACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_subscription`
--

CREATE TABLE IF NOT EXISTS `b_seo_service_subscription` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) NOT NULL,
  `GROUP_ID` varchar(50) NOT NULL,
  `CALLBACK_SERVER_ID` varchar(50) DEFAULT NULL,
  `HAS_AUTH` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_SUB_1` (`TYPE`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_webhook`
--

CREATE TABLE IF NOT EXISTS `b_seo_service_webhook` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) NOT NULL,
  `EXTERNAL_ID` varchar(50) NOT NULL,
  `SECURITY_CODE` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_WEBHOOK_1` (`TYPE`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap`
--

CREATE TABLE IF NOT EXISTS `b_seo_sitemap` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `SITE_ID` char(2) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `NAME` varchar(255) DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_entity`
--

CREATE TABLE IF NOT EXISTS `b_seo_sitemap_entity` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(255) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `SITEMAP_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_iblock`
--

CREATE TABLE IF NOT EXISTS `b_seo_sitemap_iblock` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int NOT NULL,
  `SITEMAP_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_job`
--

CREATE TABLE IF NOT EXISTS `b_seo_sitemap_job` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SITEMAP_ID` int NOT NULL DEFAULT '0',
  `RUNNING` char(1) NOT NULL DEFAULT 'N',
  `STATUS` char(1) NOT NULL DEFAULT 'R',
  `STATUS_MESSAGE` varchar(255) DEFAULT NULL,
  `STEP` int NOT NULL DEFAULT '0',
  `STATE` longtext,
  `DATE_MODIFY` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_job_sid` (`SITEMAP_ID`),
  KEY `ix_seo_sitemap_job_sid_status` (`SITEMAP_ID`,`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_runtime`
--

CREATE TABLE IF NOT EXISTS `b_seo_sitemap_runtime` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PID` int NOT NULL,
  `PROCESSED` char(1) NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) DEFAULT NULL,
  `ITEM_ID` int DEFAULT NULL,
  `ITEM_TYPE` char(1) NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_yandex_direct_stat`
--

CREATE TABLE IF NOT EXISTS `b_seo_yandex_direct_stat` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` int NOT NULL,
  `BANNER_ID` int NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) DEFAULT NULL,
  `SUM` float DEFAULT '0',
  `SUM_SEARCH` float DEFAULT '0',
  `SUM_CONTEXT` float DEFAULT '0',
  `CLICKS` int DEFAULT '0',
  `CLICKS_SEARCH` int DEFAULT '0',
  `CLICKS_CONTEXT` int DEFAULT '0',
  `SHOWS` int DEFAULT '0',
  `SHOWS_SEARCH` int DEFAULT '0',
  `SHOWS_CONTEXT` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_short_uri`
--

CREATE TABLE IF NOT EXISTS `b_short_uri` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `URI` varchar(2000) NOT NULL,
  `URI_CRC` int NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int NOT NULL,
  `STATUS` int NOT NULL DEFAULT '301',
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sidepanel_toolbar`
--

CREATE TABLE IF NOT EXISTS `b_sidepanel_toolbar` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `CONTEXT` varchar(50) NOT NULL,
  `COLLAPSED` char(1) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SIDEPANEL_TOOLBAR` (`USER_ID`,`CONTEXT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sidepanel_toolbar_item`
--

CREATE TABLE IF NOT EXISTS `b_sidepanel_toolbar_item` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `TOOLBAR_ID` bigint UNSIGNED NOT NULL,
  `URL` varchar(2000) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `ENTITY_TYPE` varchar(50) NOT NULL,
  `ENTITY_ID` varchar(50) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `LAST_USE_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TOOLBAR_ID` (`TOOLBAR_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `IX_SP_TOOLBAR_ITEM_TOOLBAR_ID_USE_DATE` (`TOOLBAR_ID`,`LAST_USE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_site_template`
--

CREATE TABLE IF NOT EXISTS `b_site_template` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `CONDITION` varchar(255) DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_site_template_site` (`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_site_template`
--

INSERT INTO `b_site_template` (`ID`, `SITE_ID`, `CONDITION`, `SORT`, `TEMPLATE`) VALUES
(1, 's1', '', 1, 'empty');

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile`
--

CREATE TABLE IF NOT EXISTS `b_smile` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) NOT NULL DEFAULT 'S',
  `SET_ID` int NOT NULL DEFAULT '0',
  `SORT` int NOT NULL DEFAULT '150',
  `TYPING` varchar(100) DEFAULT NULL,
  `CLICKABLE` char(1) NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) NOT NULL,
  `IMAGE_DEFINITION` varchar(10) NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_smile`
--

INSERT INTO `b_smile` (`ID`, `TYPE`, `SET_ID`, `SORT`, `TYPING`, `CLICKABLE`, `HIDDEN`, `IMAGE`, `IMAGE_DEFINITION`, `IMAGE_WIDTH`, `IMAGE_HEIGHT`) VALUES
(1, 'S', 2, 100, ':) :-)', 'Y', 'N', 'bx_smile_smile.png', 'UHD', 20, 20),
(2, 'S', 2, 105, ';) ;-)', 'Y', 'N', 'bx_smile_wink.png', 'UHD', 20, 20),
(3, 'S', 2, 110, ':D :-D', 'Y', 'N', 'bx_smile_biggrin.png', 'UHD', 20, 20),
(4, 'S', 2, 115, '8-)', 'Y', 'N', 'bx_smile_cool.png', 'UHD', 20, 20),
(5, 'S', 2, 120, ':facepalm:', 'Y', 'N', 'bx_smile_facepalm.png', 'UHD', 20, 20),
(6, 'S', 2, 125, ':{} :-{}', 'Y', 'N', 'bx_smile_kiss.png', 'UHD', 20, 20),
(7, 'S', 2, 130, ':( :-(', 'Y', 'N', 'bx_smile_sad.png', 'UHD', 20, 20),
(8, 'S', 2, 135, ':| :-|', 'Y', 'N', 'bx_smile_neutral.png', 'UHD', 20, 20),
(9, 'S', 2, 140, ':oops:', 'Y', 'N', 'bx_smile_redface.png', 'UHD', 20, 20),
(10, 'S', 2, 145, ':cry: :~(', 'Y', 'N', 'bx_smile_cry.png', 'UHD', 20, 20),
(11, 'S', 2, 150, ':evil: >:-<', 'Y', 'N', 'bx_smile_evil.png', 'UHD', 20, 20),
(12, 'S', 2, 155, ':o :-o :shock:', 'Y', 'N', 'bx_smile_eek.png', 'UHD', 20, 20),
(13, 'S', 2, 160, ':/ :-/', 'Y', 'N', 'bx_smile_confuse.png', 'UHD', 20, 20),
(14, 'S', 2, 165, ':idea:', 'Y', 'N', 'bx_smile_idea.png', 'UHD', 20, 20),
(15, 'S', 2, 170, ':?:', 'Y', 'N', 'bx_smile_question.png', 'UHD', 20, 20),
(16, 'S', 2, 175, ':!:', 'Y', 'N', 'bx_smile_exclaim.png', 'UHD', 20, 20),
(17, 'S', 2, 180, ':like:', 'Y', 'N', 'bx_smile_like.png', 'UHD', 20, 20),
(18, 'I', 2, 175, 'ICON_NOTE', 'Y', 'N', 'bx_icon_1.gif', 'SD', 15, 15),
(19, 'I', 2, 180, 'ICON_DIRRECTION', 'Y', 'N', 'bx_icon_2.gif', 'SD', 15, 15),
(20, 'I', 2, 185, 'ICON_IDEA', 'Y', 'N', 'bx_icon_3.gif', 'SD', 15, 15),
(21, 'I', 2, 190, 'ICON_ATTANSION', 'Y', 'N', 'bx_icon_4.gif', 'SD', 15, 15),
(22, 'I', 2, 195, 'ICON_QUESTION', 'Y', 'N', 'bx_icon_5.gif', 'SD', 15, 15),
(23, 'I', 2, 200, 'ICON_BAD', 'Y', 'N', 'bx_icon_6.gif', 'SD', 15, 15),
(24, 'I', 2, 205, 'ICON_GOOD', 'Y', 'N', 'bx_icon_7.gif', 'SD', 15, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile_lang`
--

CREATE TABLE IF NOT EXISTS `b_smile_lang` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) NOT NULL DEFAULT 'S',
  `SID` int NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_smile_lang`
--

INSERT INTO `b_smile_lang` (`ID`, `TYPE`, `SID`, `LID`, `NAME`) VALUES
(1, 'P', 1, 'ru', 'Стандартная галерея'),
(2, 'P', 1, 'en', 'Standard gallery'),
(3, 'G', 2, 'ru', 'Основной набор'),
(4, 'G', 2, 'en', 'Default pack'),
(5, 'S', 1, 'ru', 'С улыбкой'),
(6, 'S', 1, 'en', 'Smile'),
(7, 'S', 2, 'ru', 'Шутливо'),
(8, 'S', 2, 'en', 'Wink'),
(9, 'S', 3, 'ru', 'Широкая улыбка'),
(10, 'S', 3, 'en', 'Big grin'),
(11, 'S', 4, 'ru', 'Здорово'),
(12, 'S', 4, 'en', 'Cool'),
(13, 'S', 5, 'ru', 'Разочарование'),
(14, 'S', 5, 'en', 'Facepalm'),
(15, 'S', 6, 'ru', 'Поцелуй'),
(16, 'S', 6, 'en', 'Kiss'),
(17, 'S', 7, 'ru', 'Печально'),
(18, 'S', 7, 'en', 'Sad'),
(19, 'S', 8, 'ru', 'Скептически'),
(20, 'S', 8, 'en', 'Skeptic'),
(21, 'S', 9, 'ru', 'Смущенный'),
(22, 'S', 9, 'en', 'Embarrassed'),
(23, 'S', 10, 'ru', 'Очень грустно'),
(24, 'S', 10, 'en', 'Crying'),
(25, 'S', 11, 'ru', 'Со злостью'),
(26, 'S', 11, 'en', 'Angry'),
(27, 'S', 12, 'ru', 'Удивленно'),
(28, 'S', 12, 'en', 'Surprised'),
(29, 'S', 13, 'ru', 'Смущенно'),
(30, 'S', 13, 'en', 'Confused'),
(31, 'S', 14, 'ru', 'Идея'),
(32, 'S', 14, 'en', 'Idea'),
(33, 'S', 15, 'ru', 'Вопрос'),
(34, 'S', 15, 'en', 'Question'),
(35, 'S', 16, 'ru', 'Восклицание'),
(36, 'S', 16, 'en', 'Exclamation'),
(37, 'S', 17, 'ru', 'Нравится'),
(38, 'S', 17, 'en', 'Like');

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile_set`
--

CREATE TABLE IF NOT EXISTS `b_smile_set` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) NOT NULL DEFAULT 'G',
  `PARENT_ID` int NOT NULL DEFAULT '0',
  `STRING_ID` varchar(255) DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_smile_set`
--

INSERT INTO `b_smile_set` (`ID`, `TYPE`, `PARENT_ID`, `STRING_ID`, `SORT`) VALUES
(1, 'P', 0, 'bitrix', 150),
(2, 'G', 1, 'bitrix_main', 150);

-- --------------------------------------------------------

--
-- Структура таблицы `b_sms_template`
--

CREATE TABLE IF NOT EXISTS `b_sms_template` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SENDER` varchar(50) DEFAULT NULL,
  `RECEIVER` varchar(50) DEFAULT NULL,
  `MESSAGE` text,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_sms_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_sms_template`
--

INSERT INTO `b_sms_template` (`ID`, `EVENT_NAME`, `ACTIVE`, `SENDER`, `RECEIVER`, `MESSAGE`, `LANGUAGE_ID`) VALUES
(1, 'SMS_USER_CONFIRM_NUMBER', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код подтверждения #CODE#', 'ru'),
(2, 'SMS_USER_RESTORE_PASSWORD', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код для восстановления пароля #CODE#', 'ru'),
(3, 'SMS_EVENT_LOG_NOTIFICATION', 'Y', '#DEFAULT_SENDER#', '#PHONE_NUMBER#', '#NAME#: #ADDITIONAL_TEXT# (событий: #EVENT_COUNT#)', 'ru'),
(4, 'SMS_USER_CONFIRM_NUMBER', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Confirmation code: #CODE#', 'en'),
(5, 'SMS_USER_RESTORE_PASSWORD', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Code to recover password: #CODE#', 'en'),
(6, 'SMS_EVENT_LOG_NOTIFICATION', 'Y', '#DEFAULT_SENDER#', '#PHONE_NUMBER#', '#NAME#: #ADDITIONAL_TEXT# (events: #EVENT_COUNT#)', 'en');

-- --------------------------------------------------------

--
-- Структура таблицы `b_sms_template_site`
--

CREATE TABLE IF NOT EXISTS `b_sms_template_site` (
  `TEMPLATE_ID` int NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`TEMPLATE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_sms_template_site`
--

INSERT INTO `b_sms_template_site` (`TEMPLATE_ID`, `SITE_ID`) VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1'),
(5, 's1'),
(6, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_sm_version_history`
--

CREATE TABLE IF NOT EXISTS `b_sm_version_history` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `VERSIONS` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_ap`
--

CREATE TABLE IF NOT EXISTS `b_socialservices_ap` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int NOT NULL,
  `DOMAIN` varchar(255) NOT NULL,
  `ENDPOINT` varchar(255) DEFAULT NULL,
  `LOGIN` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `SETTINGS` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_socialservices_ap1` (`USER_ID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_contact`
--

CREATE TABLE IF NOT EXISTS `b_socialservices_contact` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int NOT NULL,
  `CONTACT_USER_ID` int DEFAULT NULL,
  `CONTACT_XML_ID` int DEFAULT NULL,
  `CONTACT_NAME` varchar(255) DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact1` (`USER_ID`),
  KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_contact_connect`
--

CREATE TABLE IF NOT EXISTS `b_socialservices_contact_connect` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTACT_ID` int DEFAULT NULL,
  `LINK_ID` int DEFAULT NULL,
  `CONTACT_PROFILE_ID` int NOT NULL,
  `CONTACT_PORTAL` varchar(255) NOT NULL,
  `CONNECT_TYPE` char(1) DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_message`
--

CREATE TABLE IF NOT EXISTS `b_socialservices_message` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `SOCSERV_USER_ID` int NOT NULL,
  `PROVIDER` varchar(100) NOT NULL,
  `MESSAGE` varchar(1000) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_user`
--

CREATE TABLE IF NOT EXISTS `b_socialservices_user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `LAST_NAME` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PERSONAL_PHOTO` int DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) NOT NULL,
  `USER_ID` int NOT NULL,
  `XML_ID` varchar(100) NOT NULL,
  `CAN_DELETE` char(1) NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) DEFAULT NULL,
  `PERMISSIONS` varchar(555) DEFAULT NULL,
  `OATOKEN` text,
  `OATOKEN_EXPIRES` int DEFAULT NULL,
  `OASECRET` text,
  `REFRESH_TOKEN` text,
  `SEND_ACTIVITY` char(1) DEFAULT 'Y',
  `SITE_ID` varchar(50) DEFAULT NULL,
  `INITIALIZED` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`),
  KEY `IX_B_SOCIALSERVICES_US_4` (`USER_ID`,`EXTERNAL_AUTH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_user_link`
--

CREATE TABLE IF NOT EXISTS `b_socialservices_user_link` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `SOCSERV_USER_ID` int NOT NULL,
  `LINK_USER_ID` int DEFAULT NULL,
  `LINK_UID` varchar(100) NOT NULL,
  `LINK_NAME` varchar(255) DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) DEFAULT NULL,
  `LINK_PICTURE` varchar(255) DEFAULT NULL,
  `LINK_EMAIL` varchar(255) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  KEY `ix_b_socialservices_user_link_7` (`LINK_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_zoom_meeting`
--

CREATE TABLE IF NOT EXISTS `b_socialservices_zoom_meeting` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(10) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `CONFERENCE_URL` varchar(255) NOT NULL,
  `CONFERENCE_EXTERNAL_ID` bigint UNSIGNED NOT NULL,
  `CONFERENCE_PASSWORD` text,
  `JOINED` char(1) DEFAULT NULL,
  `CONFERENCE_CREATED` datetime DEFAULT NULL,
  `CONFERENCE_STARTED` datetime DEFAULT NULL,
  `CONFERENCE_ENDED` datetime DEFAULT NULL,
  `DURATION` int DEFAULT NULL,
  `TITLE` text,
  `SHORT_LINK` varchar(255) DEFAULT NULL,
  `HAS_RECORDING` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_1` (`CONFERENCE_EXTERNAL_ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_zoom_meeting_recording`
--

CREATE TABLE IF NOT EXISTS `b_socialservices_zoom_meeting_recording` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EXTERNAL_ID` varchar(64) NOT NULL,
  `MEETING_ID` int NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `FILE_TYPE` varchar(16) NOT NULL,
  `FILE_SIZE` int NOT NULL,
  `PLAY_URL` varchar(500) DEFAULT NULL,
  `DOWNLOAD_URL` varchar(500) DEFAULT NULL,
  `RECORDING_TYPE` varchar(64) NOT NULL,
  `DOWNLOAD_TOKEN` text,
  `PASSWORD` text,
  `FILE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_RECORDING_1` (`MEETING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sticker`
--

CREATE TABLE IF NOT EXISTS `b_sticker` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) DEFAULT NULL,
  `PAGE_URL` varchar(255) NOT NULL,
  `PAGE_TITLE` varchar(255) NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int NOT NULL,
  `CREATED_BY` int NOT NULL,
  `PERSONAL` char(1) NOT NULL DEFAULT 'N',
  `CONTENT` text,
  `POS_TOP` int DEFAULT NULL,
  `POS_LEFT` int DEFAULT NULL,
  `WIDTH` int DEFAULT NULL,
  `HEIGHT` int DEFAULT NULL,
  `COLOR` int DEFAULT NULL,
  `COLLAPSED` char(1) NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) NOT NULL DEFAULT 'N',
  `CLOSED` char(1) NOT NULL DEFAULT 'N',
  `DELETED` char(1) NOT NULL DEFAULT 'N',
  `MARKER_TOP` int DEFAULT NULL,
  `MARKER_LEFT` int DEFAULT NULL,
  `MARKER_WIDTH` int DEFAULT NULL,
  `MARKER_HEIGHT` int DEFAULT NULL,
  `MARKER_ADJUST` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_sticker`
--

INSERT INTO `b_sticker` (`ID`, `SITE_ID`, `PAGE_URL`, `PAGE_TITLE`, `DATE_CREATE`, `DATE_UPDATE`, `MODIFIED_BY`, `CREATED_BY`, `PERSONAL`, `CONTENT`, `POS_TOP`, `POS_LEFT`, `WIDTH`, `HEIGHT`, `COLOR`, `COLLAPSED`, `COMPLETED`, `CLOSED`, `DELETED`, `MARKER_TOP`, `MARKER_LEFT`, `MARKER_WIDTH`, `MARKER_HEIGHT`, `MARKER_ADJUST`) VALUES
(1, 's1', '/', 'Главная', '2024-10-23 05:10:25', '2024-10-23 05:10:26', 1, 1, 'N', '[ST_TITLE]Сергей Майнек 23.10.2024 05:10:22[/ST_TITLE]', 326, 1084, 350, 200, 0, 'N', 'N', 'Y', 'N', 0, 0, 0, 0, 's:5:\"false\";');

-- --------------------------------------------------------

--
-- Структура таблицы `b_sticker_group_task`
--

CREATE TABLE IF NOT EXISTS `b_sticker_group_task` (
  `GROUP_ID` int NOT NULL,
  `TASK_ID` int NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_task`
--

CREATE TABLE IF NOT EXISTS `b_task` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `LETTER` char(1) DEFAULT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `SYS` char(1) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `BINDING` varchar(50) DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_task`
--

INSERT INTO `b_task` (`ID`, `NAME`, `LETTER`, `MODULE_ID`, `SYS`, `DESCRIPTION`, `BINDING`) VALUES
(1, 'main_denied', 'D', 'main', 'Y', NULL, 'module'),
(2, 'main_change_profile', 'P', 'main', 'Y', NULL, 'module'),
(3, 'main_view_all_settings', 'R', 'main', 'Y', NULL, 'module'),
(4, 'main_view_all_settings_change_profile', 'T', 'main', 'Y', NULL, 'module'),
(5, 'main_edit_subordinate_users', 'V', 'main', 'Y', NULL, 'module'),
(6, 'main_full_access', 'W', 'main', 'Y', NULL, 'module'),
(7, 'fm_folder_access_denied', 'D', 'main', 'Y', NULL, 'file'),
(8, 'fm_folder_access_read', 'R', 'main', 'Y', NULL, 'file'),
(9, 'fm_folder_access_write', 'W', 'main', 'Y', NULL, 'file'),
(10, 'fm_folder_access_full', 'X', 'main', 'Y', NULL, 'file'),
(11, 'fm_folder_access_workflow', 'U', 'main', 'Y', NULL, 'file'),
(12, 'bitrixcloud_deny', 'D', 'bitrixcloud', 'Y', NULL, 'module'),
(13, 'bitrixcloud_control', 'W', 'bitrixcloud', 'Y', NULL, 'module'),
(14, 'clouds_denied', 'D', 'clouds', 'Y', NULL, 'module'),
(15, 'clouds_browse', 'F', 'clouds', 'Y', NULL, 'module'),
(16, 'clouds_upload', 'U', 'clouds', 'Y', NULL, 'module'),
(17, 'clouds_full_access', 'W', 'clouds', 'Y', NULL, 'module'),
(18, 'fileman_denied', 'D', 'fileman', 'Y', NULL, 'module'),
(19, 'fileman_allowed_folders', 'F', 'fileman', 'Y', NULL, 'module'),
(20, 'fileman_full_access', 'W', 'fileman', 'Y', NULL, 'module'),
(21, 'medialib_denied', 'D', 'fileman', 'Y', NULL, 'medialib'),
(22, 'medialib_view', 'F', 'fileman', 'Y', NULL, 'medialib'),
(23, 'medialib_only_new', 'R', 'fileman', 'Y', NULL, 'medialib'),
(24, 'medialib_edit_items', 'V', 'fileman', 'Y', NULL, 'medialib'),
(25, 'medialib_editor', 'W', 'fileman', 'Y', NULL, 'medialib'),
(26, 'medialib_full', 'X', 'fileman', 'Y', NULL, 'medialib'),
(27, 'stickers_denied', 'D', 'fileman', 'Y', NULL, 'stickers'),
(28, 'stickers_read', 'R', 'fileman', 'Y', NULL, 'stickers'),
(29, 'stickers_edit', 'W', 'fileman', 'Y', NULL, 'stickers'),
(30, 'hblock_denied', 'D', 'highloadblock', 'Y', NULL, 'module'),
(31, 'hblock_read', 'R', 'highloadblock', 'Y', NULL, 'module'),
(32, 'hblock_write', 'W', 'highloadblock', 'Y', NULL, 'module'),
(33, 'iblock_deny', 'D', 'iblock', 'Y', NULL, 'iblock'),
(34, 'iblock_read', 'R', 'iblock', 'Y', NULL, 'iblock'),
(35, 'iblock_element_add', 'E', 'iblock', 'Y', NULL, 'iblock'),
(36, 'iblock_admin_read', 'S', 'iblock', 'Y', NULL, 'iblock'),
(37, 'iblock_admin_add', 'T', 'iblock', 'Y', NULL, 'iblock'),
(38, 'iblock_limited_edit', 'U', 'iblock', 'Y', NULL, 'iblock'),
(39, 'iblock_full_edit', 'W', 'iblock', 'Y', NULL, 'iblock'),
(40, 'iblock_full', 'X', 'iblock', 'Y', NULL, 'iblock'),
(41, 'landing_right_denied', 'D', 'landing', 'Y', NULL, 'module'),
(42, 'landing_right_read', 'R', 'landing', 'Y', NULL, 'module'),
(43, 'landing_right_edit', 'U', 'landing', 'Y', NULL, 'module'),
(44, 'landing_right_sett', 'V', 'landing', 'Y', NULL, 'module'),
(45, 'landing_right_public', 'W', 'landing', 'Y', NULL, 'module'),
(46, 'landing_right_delete', 'X', 'landing', 'Y', NULL, 'module'),
(47, 'security_denied', 'D', 'security', 'Y', NULL, 'module'),
(48, 'security_filter', 'F', 'security', 'Y', NULL, 'module'),
(49, 'security_otp', 'S', 'security', 'Y', NULL, 'module'),
(50, 'security_view_all_settings', 'T', 'security', 'Y', NULL, 'module'),
(51, 'security_full_access', 'W', 'security', 'Y', NULL, 'module'),
(52, 'seo_denied', 'D', 'seo', 'Y', NULL, 'module'),
(53, 'seo_edit', 'F', 'seo', 'Y', NULL, 'module'),
(54, 'seo_full_access', 'W', 'seo', 'Y', NULL, 'module');

-- --------------------------------------------------------

--
-- Структура таблицы `b_task_operation`
--

CREATE TABLE IF NOT EXISTS `b_task_operation` (
  `TASK_ID` int NOT NULL,
  `OPERATION_ID` int NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_task_operation`
--

INSERT INTO `b_task_operation` (`TASK_ID`, `OPERATION_ID`) VALUES
(2, 2),
(2, 3),
(3, 2),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 2),
(5, 3),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(8, 19),
(8, 20),
(8, 21),
(9, 19),
(9, 20),
(9, 21),
(9, 22),
(9, 23),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(9, 33),
(9, 34),
(10, 19),
(10, 20),
(10, 21),
(10, 22),
(10, 23),
(10, 24),
(10, 25),
(10, 26),
(10, 27),
(10, 28),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(11, 19),
(11, 20),
(11, 21),
(11, 24),
(11, 28),
(13, 36),
(13, 37),
(15, 38),
(16, 38),
(16, 39),
(17, 38),
(17, 39),
(17, 40),
(19, 41),
(19, 42),
(19, 43),
(19, 44),
(19, 45),
(19, 46),
(19, 47),
(19, 48),
(19, 49),
(20, 41),
(20, 42),
(20, 43),
(20, 44),
(20, 45),
(20, 46),
(20, 47),
(20, 48),
(20, 49),
(20, 50),
(20, 51),
(20, 52),
(20, 53),
(22, 54),
(23, 54),
(23, 55),
(23, 56),
(24, 54),
(24, 56),
(24, 57),
(24, 58),
(25, 54),
(25, 55),
(25, 56),
(25, 57),
(25, 58),
(25, 59),
(25, 60),
(26, 54),
(26, 55),
(26, 56),
(26, 57),
(26, 58),
(26, 59),
(26, 60),
(26, 61),
(28, 62),
(29, 62),
(29, 63),
(29, 64),
(29, 65),
(31, 66),
(32, 67),
(32, 68),
(34, 69),
(34, 70),
(35, 71),
(36, 69),
(36, 70),
(36, 72),
(37, 69),
(37, 70),
(37, 71),
(37, 72),
(38, 69),
(38, 70),
(38, 71),
(38, 72),
(38, 73),
(38, 74),
(38, 75),
(38, 76),
(39, 69),
(39, 70),
(39, 71),
(39, 72),
(39, 73),
(39, 74),
(39, 75),
(39, 76),
(39, 77),
(39, 78),
(39, 79),
(39, 80),
(40, 69),
(40, 70),
(40, 71),
(40, 72),
(40, 73),
(40, 74),
(40, 75),
(40, 76),
(40, 77),
(40, 78),
(40, 79),
(40, 80),
(40, 81),
(40, 82),
(40, 83),
(40, 84),
(40, 85),
(40, 86),
(42, 87),
(43, 88),
(44, 89),
(45, 90),
(46, 91),
(48, 92),
(49, 93),
(50, 94),
(50, 95),
(50, 96),
(50, 97),
(50, 98),
(50, 99),
(50, 100),
(50, 101),
(50, 102),
(50, 103),
(50, 104),
(51, 92),
(51, 93),
(51, 94),
(51, 95),
(51, 96),
(51, 97),
(51, 98),
(51, 99),
(51, 100),
(51, 101),
(51, 102),
(51, 103),
(51, 104),
(51, 105),
(51, 106),
(51, 107),
(51, 108),
(51, 109),
(51, 110),
(51, 111),
(51, 112),
(51, 113),
(51, 114),
(51, 115),
(51, 116),
(51, 117),
(53, 118),
(54, 118),
(54, 119);

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_file`
--

CREATE TABLE IF NOT EXISTS `b_translate_file` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PATH_ID` int NOT NULL,
  `LANG_ID` char(2) NOT NULL,
  `FULL_PATH` varchar(500) NOT NULL,
  `PHRASE_COUNT` int NOT NULL DEFAULT '0',
  `INDEXED` enum('Y','N') NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_FL_PATH` (`PATH_ID`,`LANG_ID`),
  KEY `IX_TRNSL_FULL_PATH` (`FULL_PATH`(255))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_translate_file`
--

INSERT INTO `b_translate_file` (`ID`, `PATH_ID`, `LANG_ID`, `FULL_PATH`, `PHRASE_COUNT`, `INDEXED`, `INDEXED_TIME`) VALUES
(9, 13, 'ru', 'D:/OpenServer/OSPanel/home/bitrix.local/local/templates/empty/lang/ru/description.php', 2, 'Y', '2024-10-23 05:12:42'),
(10, 13, 'en', 'D:/OpenServer/OSPanel/home/bitrix.local/local/templates/empty/lang/en/description.php', 2, 'Y', '2024-10-23 05:12:42'),
(11, 14, 'ru', 'D:/OpenServer/OSPanel/home/bitrix.local/local/templates/empty/lang/ru/header.php', 7, 'Y', '2024-10-23 05:12:42'),
(12, 14, 'en', 'D:/OpenServer/OSPanel/home/bitrix.local/local/templates/empty/lang/en/header.php', 7, 'Y', '2024-10-23 05:12:42'),
(13, 16, 'ru', 'D:/OpenServer/OSPanel/home/bitrix.local/local/templates/empty/lang/ru/page_templates/.content.php', 3, 'Y', '2024-10-23 05:12:42'),
(14, 16, 'en', 'D:/OpenServer/OSPanel/home/bitrix.local/local/templates/empty/lang/en/page_templates/.content.php', 3, 'Y', '2024-10-23 05:12:42');

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_path`
--

CREATE TABLE IF NOT EXISTS `b_translate_path` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int NOT NULL DEFAULT '0',
  `DEPTH_LEVEL` int NOT NULL DEFAULT '0',
  `SORT` int NOT NULL DEFAULT '0',
  `PATH` varchar(500) NOT NULL,
  `NAME` varbinary(255) NOT NULL,
  `IS_LANG` enum('Y','N') NOT NULL DEFAULT 'N',
  `IS_DIR` enum('Y','N') NOT NULL DEFAULT 'N',
  `OBLIGATORY_LANGS` char(50) DEFAULT NULL,
  `INDEXED` enum('Y','N') NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `ASSIGNMENT` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_PTH_NAME` (`PARENT_ID`,`NAME`),
  KEY `IX_TRNSL_PTH_PARENT` (`PARENT_ID`,`IS_DIR`,`IS_LANG`),
  KEY `IX_TRNSL_PTH_PATH` (`PATH`(255))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_translate_path`
--

INSERT INTO `b_translate_path` (`ID`, `PARENT_ID`, `DEPTH_LEVEL`, `SORT`, `PATH`, `NAME`, `IS_LANG`, `IS_DIR`, `OBLIGATORY_LANGS`, `INDEXED`, `INDEXED_TIME`, `MODULE_ID`, `ASSIGNMENT`) VALUES
(1, 0, 0, 0, '/local', 0x6c6f63616c, 'N', 'Y', NULL, 'N', NULL, NULL, NULL),
(2, 1, 1, 0, '/local/templates', 0x74656d706c61746573, 'N', 'Y', NULL, 'N', NULL, NULL, NULL),
(3, 2, 2, 0, '/local/templates/empty', 0x656d707479, 'N', 'Y', NULL, 'N', NULL, NULL, NULL),
(11, 3, 3, 0, '/local/templates/empty/lang', 0x6c616e67, 'Y', 'Y', NULL, 'Y', '2024-10-23 05:12:42', NULL, NULL),
(12, 11, 4, 0, '/local/templates/empty/lang/#LANG_ID#', 0x234c414e475f494423, 'Y', 'Y', NULL, 'Y', '2024-10-23 05:12:42', NULL, NULL),
(13, 12, 5, 0, '/local/templates/empty/lang/#LANG_ID#/description.php', 0x6465736372697074696f6e2e706870, 'Y', 'N', NULL, 'Y', '2024-10-23 05:12:42', NULL, NULL),
(14, 12, 5, 0, '/local/templates/empty/lang/#LANG_ID#/header.php', 0x6865616465722e706870, 'Y', 'N', NULL, 'Y', '2024-10-23 05:12:42', NULL, NULL),
(15, 12, 5, 0, '/local/templates/empty/lang/#LANG_ID#/page_templates', 0x706167655f74656d706c61746573, 'Y', 'Y', NULL, 'Y', '2024-10-23 05:12:42', NULL, NULL),
(16, 15, 6, 0, '/local/templates/empty/lang/#LANG_ID#/page_templates/.content.php', 0x2e636f6e74656e742e706870, 'Y', 'N', NULL, 'Y', '2024-10-23 05:12:42', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_path_lang`
--

CREATE TABLE IF NOT EXISTS `b_translate_path_lang` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PATH` varchar(500) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_TRNSL_LNG_PATH` (`PATH`(255))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_translate_path_lang`
--

INSERT INTO `b_translate_path_lang` (`ID`, `PATH`) VALUES
(2, '/local/templates/empty/lang');

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_path_tree`
--

CREATE TABLE IF NOT EXISTS `b_translate_path_tree` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int NOT NULL,
  `PATH_ID` int NOT NULL,
  `DEPTH_LEVEL` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_ANCESTOR` (`PARENT_ID`,`DEPTH_LEVEL`,`PATH_ID`),
  UNIQUE KEY `IX_TRNSL_DESCENDANT` (`PATH_ID`,`PARENT_ID`,`DEPTH_LEVEL`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_translate_path_tree`
--

INSERT INTO `b_translate_path_tree` (`ID`, `PARENT_ID`, `PATH_ID`, `DEPTH_LEVEL`) VALUES
(1, 1, 1, 0),
(2, 1, 2, 1),
(5, 1, 3, 2),
(57, 1, 11, 3),
(64, 1, 12, 4),
(71, 1, 13, 5),
(78, 1, 14, 5),
(85, 1, 15, 5),
(92, 1, 16, 6),
(3, 2, 2, 0),
(6, 2, 3, 1),
(58, 2, 11, 2),
(65, 2, 12, 3),
(72, 2, 13, 4),
(79, 2, 14, 4),
(86, 2, 15, 4),
(93, 2, 16, 5),
(7, 3, 3, 0),
(59, 3, 11, 1),
(66, 3, 12, 2),
(73, 3, 13, 3),
(80, 3, 14, 3),
(87, 3, 15, 3),
(94, 3, 16, 4),
(60, 11, 11, 0),
(67, 11, 12, 1),
(74, 11, 13, 2),
(81, 11, 14, 2),
(88, 11, 15, 2),
(95, 11, 16, 3),
(68, 12, 12, 0),
(75, 12, 13, 1),
(82, 12, 14, 1),
(89, 12, 15, 1),
(96, 12, 16, 2),
(76, 13, 13, 0),
(83, 14, 14, 0),
(90, 15, 15, 0),
(97, 15, 16, 1),
(98, 16, 16, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_phrase`
--

CREATE TABLE IF NOT EXISTS `b_translate_phrase` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FILE_ID` int NOT NULL,
  `PATH_ID` int NOT NULL,
  `LANG_ID` char(2) NOT NULL,
  `CODE` varbinary(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXU_TRNSL_PHR_PATH_CODE` (`PATH_ID`,`LANG_ID`,`CODE`),
  KEY `IX_TRNSL_PHR_PATH` (`PATH_ID`,`CODE`),
  KEY `IX_TRNSL_FILE` (`FILE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_translate_phrase`
--

INSERT INTO `b_translate_phrase` (`ID`, `FILE_ID`, `PATH_ID`, `LANG_ID`, `CODE`) VALUES
(1, 9, 13, 'ru', 0x545f44454641554c545f444553435f4e414d45),
(2, 9, 13, 'ru', 0x545f44454641554c545f444553435f44455343),
(3, 10, 13, 'en', 0x545f44454641554c545f444553435f4e414d45),
(4, 10, 13, 'en', 0x545f44454641554c545f444553435f44455343),
(5, 11, 14, 'ru', 0x4445465f54454d504c4154455f4e46),
(6, 11, 14, 'ru', 0x4445465f54454d504c4154455f4e465f534554),
(7, 11, 14, 'ru', 0x5a41474f4c4f564f4b),
(8, 11, 14, 'ru', 0x594e414d45),
(9, 11, 14, 'ru', 0x5950484f4e45),
(10, 11, 14, 'ru', 0x59454d41494c),
(11, 11, 14, 'ru', 0x53454e44),
(12, 12, 14, 'en', 0x4445465f54454d504c4154455f4e46),
(13, 12, 14, 'en', 0x4445465f54454d504c4154455f4e465f534554),
(14, 12, 14, 'en', 0x5a41474f4c4f564f4b),
(15, 12, 14, 'en', 0x594e414d45),
(16, 12, 14, 'en', 0x5950484f4e45),
(17, 12, 14, 'en', 0x59454d41494c),
(18, 12, 14, 'en', 0x53454e44),
(19, 13, 16, 'ru', 0x7374616e64617274),
(20, 13, 16, 'ru', 0x706167655f696e63),
(21, 13, 16, 'ru', 0x736563745f696e63),
(22, 14, 16, 'en', 0x7374616e64617274),
(23, 14, 16, 'en', 0x706167655f696e63),
(24, 14, 16, 'en', 0x736563745f696e63);

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_phrase_fts_en`
--

CREATE TABLE IF NOT EXISTS `b_translate_phrase_fts_en` (
  `ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `PATH_ID` int NOT NULL,
  `CODE` varbinary(255) NOT NULL,
  `PHRASE` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXU_TRNSL_FTS_PT_EN` (`PATH_ID`,`CODE`),
  UNIQUE KEY `IXU_TRNSL_FTS_FL_EN` (`FILE_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_translate_phrase_fts_en`
--

INSERT INTO `b_translate_phrase_fts_en` (`ID`, `FILE_ID`, `PATH_ID`, `CODE`, `PHRASE`) VALUES
(3, 10, 13, 0x545f44454641554c545f444553435f4e414d45, 'Common template'),
(4, 10, 13, 0x545f44454641554c545f444553435f44455343, 'Common include files (header.php and footer.php by default).'),
(12, 12, 14, 0x4445465f54454d504c4154455f4e46, 'Template is not found. Please set template for this site.'),
(13, 12, 14, 0x4445465f54454d504c4154455f4e465f534554, 'Set template'),
(14, 12, 14, 0x5a41474f4c4f564f4b, 'Application processing system'),
(15, 12, 14, 0x594e414d45, 'Your name'),
(16, 12, 14, 0x5950484f4e45, 'Your phone'),
(17, 12, 14, 0x59454d41494c, 'Your email'),
(18, 12, 14, 0x53454e44, 'Send'),
(22, 14, 16, 0x7374616e64617274, 'Standard page'),
(23, 14, 16, 0x706167655f696e63, 'Include area for page'),
(24, 14, 16, 0x736563745f696e63, 'Include area for section');

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_phrase_fts_ru`
--

CREATE TABLE IF NOT EXISTS `b_translate_phrase_fts_ru` (
  `ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `PATH_ID` int NOT NULL,
  `CODE` varbinary(255) NOT NULL,
  `PHRASE` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXU_TRNSL_FTS_PT_RU` (`PATH_ID`,`CODE`),
  UNIQUE KEY `IXU_TRNSL_FTS_FL_RU` (`FILE_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_translate_phrase_fts_ru`
--

INSERT INTO `b_translate_phrase_fts_ru` (`ID`, `FILE_ID`, `PATH_ID`, `CODE`, `PHRASE`) VALUES
(1, 9, 13, 0x545f44454641554c545f444553435f4e414d45, 'Общий шаблон'),
(2, 9, 13, 0x545f44454641554c545f444553435f44455343, 'Общие включаемые файлы, header.php и footer.php по умолчанию.'),
(5, 11, 14, 0x4445465f54454d504c4154455f4e46, 'Шаблон не найден. Установите шаблон для данного сайта.'),
(6, 11, 14, 0x4445465f54454d504c4154455f4e465f534554, 'Установить шаблон'),
(7, 11, 14, 0x5a41474f4c4f564f4b, 'Система обработки заявок'),
(8, 11, 14, 0x594e414d45, 'Ваше имя'),
(9, 11, 14, 0x5950484f4e45, 'Номер телефона'),
(10, 11, 14, 0x59454d41494c, 'Ваш email'),
(11, 11, 14, 0x53454e44, 'Отправить'),
(19, 13, 16, 0x7374616e64617274, 'Стандартная страница'),
(20, 13, 16, 0x706167655f696e63, 'Включаемая область для страницы'),
(21, 13, 16, 0x736563745f696e63, 'Включаемая область для раздела');

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_access`
--

CREATE TABLE IF NOT EXISTS `b_ui_avatar_mask_access` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ITEM_ID` int NOT NULL,
  `ACCESS_CODE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_UI_AVATAR_MASK_RIGHT_3` (`ITEM_ID`,`ACCESS_CODE`),
  KEY `B_UI_AVATAR_MASK_RIGHT_1` (`ITEM_ID`),
  KEY `B_UI_AVATAR_MASK_RIGHT_2` (`ACCESS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_file_deleted`
--

CREATE TABLE IF NOT EXISTS `b_ui_avatar_mask_file_deleted` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ENTITY` varchar(50) NOT NULL,
  `ORIGINAL_FILE_ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `ITEM_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `B_UI_AVATAR_MASK_FILE_DELETED_1` (`ENTITY`),
  KEY `B_UI_AVATAR_MASK_FILE_DELETED_2` (`ITEM_ID`),
  KEY `B_UI_AVATAR_MASK_FILE_DELETED_3` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_group`
--

CREATE TABLE IF NOT EXISTS `b_ui_avatar_mask_group` (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `OWNER_TYPE` varchar(100) NOT NULL,
  `OWNER_ID` varchar(20) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `TIMESTAMP_X` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_UI_AVATAR_MASK_GROUP_OWNER` (`OWNER_ID`,`OWNER_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_item`
--

CREATE TABLE IF NOT EXISTS `b_ui_avatar_mask_item` (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `OWNER_TYPE` varchar(100) NOT NULL,
  `OWNER_ID` varchar(20) NOT NULL,
  `FILE_ID` int NOT NULL,
  `GROUP_ID` int DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `TIMESTAMP_X` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `B_UI_AVATAR_MASK_ITEM_OWNER` (`OWNER_TYPE`,`OWNER_ID`),
  KEY `B_UI_AVATAR_MASK_ITEM_FILE_ID` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_item_applied_to`
--

CREATE TABLE IF NOT EXISTS `b_ui_avatar_mask_item_applied_to` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ORIGINAL_FILE_ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `ITEM_ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `b_ui_avatar_mask_item_applied1` (`FILE_ID`,`ITEM_ID`),
  KEY `b_ui_avatar_mask_item_applied2` (`ITEM_ID`),
  KEY `b_ui_avatar_mask_item_applied3` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_recently_used`
--

CREATE TABLE IF NOT EXISTS `b_ui_avatar_mask_recently_used` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ITEM_ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_UI_AVATAR_MASK_ITEM_R_OWNER` (`ITEM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_entity_editor_config`
--

CREATE TABLE IF NOT EXISTS `b_ui_entity_editor_config` (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `CATEGORY` varchar(20) NOT NULL,
  `ENTITY_TYPE_ID` varchar(60) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `CONFIG` text NOT NULL,
  `COMMON` varchar(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `CATEGORY` (`CATEGORY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_entity_editor_config_ac`
--

CREATE TABLE IF NOT EXISTS `b_ui_entity_editor_config_ac` (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ACCESS_CODE` varchar(10) NOT NULL,
  `CONFIG_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ACCESS_CODE` (`ACCESS_CODE`),
  KEY `CONFIG_ID` (`CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_file_uploader_temp_file`
--

CREATE TABLE IF NOT EXISTS `b_ui_file_uploader_temp_file` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `GUID` char(36) NOT NULL,
  `FILE_ID` int DEFAULT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `SIZE` bigint NOT NULL,
  `PATH` varchar(255) NOT NULL,
  `MIMETYPE` varchar(255) NOT NULL,
  `RECEIVED_SIZE` bigint NOT NULL DEFAULT '0',
  `WIDTH` int NOT NULL DEFAULT '0',
  `HEIGHT` int NOT NULL DEFAULT '0',
  `BUCKET_ID` int DEFAULT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `CONTROLLER` varchar(255) NOT NULL,
  `CLOUD` tinyint(1) NOT NULL DEFAULT '0',
  `UPLOADED` tinyint(1) NOT NULL DEFAULT '0',
  `DELETED` tinyint(1) NOT NULL DEFAULT '0',
  `CREATED_BY` int NOT NULL DEFAULT '0',
  `CREATED_AT` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_UI_UPLOADER_GUID` (`GUID`),
  KEY `IX_B_UI_UPLOADER_FILE_ID` (`FILE_ID`),
  KEY `IX_B_UI_UPLOADER_CREATED_AT` (`CREATED_AT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_undo`
--

CREATE TABLE IF NOT EXISTS `b_undo` (
  `ID` varchar(255) NOT NULL,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `UNDO_TYPE` varchar(50) DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) DEFAULT NULL,
  `CONTENT` mediumtext,
  `USER_ID` int DEFAULT NULL,
  `TIMESTAMP_X` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_undo`
--

INSERT INTO `b_undo` (`ID`, `MODULE_ID`, `UNDO_TYPE`, `UNDO_HANDLER`, `CONTENT`, `USER_ID`, `TIMESTAMP_X`) VALUES
('1000f255970a374b1b4e4543bbe3f00c4', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:49:\"D:/OpenServer/OSPanel/home/bitrix.local/index.php\";s:7:\"content\";s:515:\"<?\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/header.php\');\n$APPLICATION->SetTitle(\'Главная\');\n?>\n\n<form id=\"bx_custom_form\">\n		<div id=\"result\" class=\"result\"></div>\n    <input type=\"text\" name=\"name\" placeholder=\"Ваше имя\" />\n    <input type=\"email\" name=\"email\" placeholder=\"Ваш email\" />\n    <input type=\"text\" name=\"phone\" placeholder=\"Номер телефона\" />\n    <input type=\"submit\" value=\"Отправить\" />\n</form>\n<?\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/footer.php\');\n?>\";}', 1, 1729649237),
('11e1c805996921f23440fe78a200e4b70', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:49:\"D:/OpenServer/OSPanel/home/bitrix.local/index.php\";s:7:\"content\";s:443:\"<?\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/header.php\');\n$APPLICATION->SetTitle(\'Главная\');\n?> \n<form id=\"bx_custom_form\">\n    <input type=\"text\" name=\"name\" placeholder=\"Ваше имя\" />\n    <input type=\"text\" name=\"phone\" placeholder=\"Номер телефона\" />\n    <input type=\"file\" name=\"file\">\n    <input type=\"submit\" value=\"Отправить\" />\n</form>\n<?\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/footer.php\');\n?>\";}', 1, 1729631523),
('124456bdea81598fa23b853faf5c98c85', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:49:\"D:/OpenServer/OSPanel/home/bitrix.local/index.php\";s:7:\"content\";s:169:\"<?\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/header.php\');\n$APPLICATION->SetTitle(\'Главная\');\n?> \n\n<?\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/footer.php\');\n?>\";}', 1, 1729630618),
('14b112e57bd6e09246cab36a15cea3c0e', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:49:\"D:/OpenServer/OSPanel/home/bitrix.local/index.php\";s:7:\"content\";s:515:\"<?\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/header.php\');\n$APPLICATION->SetTitle(\'Главная\');\n?>\n\n<form id=\"bx_custom_form\">\n		<div id=\"result\" class=\"result\"></div>\n    <input type=\"text\" name=\"name\" placeholder=\"Ваше имя\" />\n    <input type=\"email\" name=\"email\" placeholder=\"Ваш email\" />\n    <input type=\"text\" name=\"phone\" placeholder=\"Номер телефона\" />\n    <input type=\"submit\" value=\"Отправить\" />\n</form>\n<?\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/footer.php\');\n?>\";}', 1, 1729649005),
('163c2674a9b1f9c4764b3a06209b41d42', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:49:\"D:/OpenServer/OSPanel/home/bitrix.local/index.php\";s:7:\"content\";s:474:\"<?\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/header.php\');\n$APPLICATION->SetTitle(\'Главная\');\n?> \n<form id=\"bx_custom_form\">\n    <input type=\"text\" name=\"name\" placeholder=\"Ваше имя\" />\n    <input type=\"email\" name=\"email\" placeholder=\"Ваш email\" />\n    <input type=\"text\" name=\"phone\" placeholder=\"Номер телефона\" />\n    <input type=\"submit\" value=\"Отправить\" />\n</form>\n<?\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/footer.php\');\n?>\";}', 1, 1729631575),
('1def769c5bfb2adff382beacc3a663d19', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:49:\"D:/OpenServer/OSPanel/home/bitrix.local/index.php\";s:7:\"content\";s:545:\"<?\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/header.php\');\n$APPLICATION->SetTitle(\'Главная\');\n?>\n\n<form id=\"bx_custom_form\">\n		<div id=\"result\" class=\"result\"></div>\n    <input type=\"text\" name=\"name\" placeholder=\"Ваше имя <?=GetMessage(\"ZAGOLOVOK\");?>\" />\n    <input type=\"email\" name=\"email\" placeholder=\"Ваш email\" />\n    <input type=\"text\" name=\"phone\" placeholder=\"Номер телефона\" />\n    <input type=\"submit\" value=\"Отправить\" />\n</form>\n<?\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/footer.php\');\n?>\";}', 1, 1729649014);

-- --------------------------------------------------------

--
-- Структура таблицы `b_urlpreview_metadata`
--

CREATE TABLE IF NOT EXISTS `b_urlpreview_metadata` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `URL` varchar(2000) NOT NULL,
  `TYPE` char(1) NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `DESCRIPTION` text,
  `IMAGE_ID` int DEFAULT NULL,
  `IMAGE` varchar(2000) DEFAULT NULL,
  `EMBED` mediumtext,
  `EXTRA` text,
  PRIMARY KEY (`ID`),
  KEY `IX_URLPREVIEW_METADATA_URL` (`URL`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_urlpreview_route`
--

CREATE TABLE IF NOT EXISTS `b_urlpreview_route` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ROUTE` varchar(2000) NOT NULL,
  `MODULE` varchar(50) NOT NULL,
  `CLASS` varchar(150) NOT NULL,
  `PARAMETERS` mediumtext,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`(255))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_urlpreview_route`
--

INSERT INTO `b_urlpreview_route` (`ID`, `ROUTE`, `MODULE`, `CLASS`, `PARAMETERS`) VALUES
(1, '/knowledge/#knowledgeCode#/', 'landing', '\\Bitrix\\Landing\\Landing\\UrlPreview', 'a:3:{s:13:\"knowledgeCode\";s:14:\"$knowledgeCode\";s:5:\"scope\";s:9:\"knowledge\";s:12:\"allowSlashes\";s:1:\"N\";}'),
(2, '/knowledge/group/#knowledgeCode#/', 'landing', '\\Bitrix\\Landing\\Landing\\UrlPreview', 'a:3:{s:13:\"knowledgeCode\";s:14:\"$knowledgeCode\";s:5:\"scope\";s:5:\"group\";s:12:\"allowSlashes\";s:1:\"N\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user`
--

CREATE TABLE IF NOT EXISTS `b_user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `LOGIN` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `CHECKWORD` varchar(255) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) DEFAULT NULL,
  `PERSONAL_GENDER` char(1) DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) DEFAULT NULL,
  `PERSONAL_PHOTO` int DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) DEFAULT NULL,
  `PERSONAL_STREET` text,
  `PERSONAL_MAILBOX` varchar(255) DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) DEFAULT NULL,
  `PERSONAL_NOTES` text,
  `WORK_COMPANY` varchar(255) DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) DEFAULT NULL,
  `WORK_POSITION` varchar(255) DEFAULT NULL,
  `WORK_WWW` varchar(255) DEFAULT NULL,
  `WORK_PHONE` varchar(255) DEFAULT NULL,
  `WORK_FAX` varchar(255) DEFAULT NULL,
  `WORK_PAGER` varchar(255) DEFAULT NULL,
  `WORK_STREET` text,
  `WORK_MAILBOX` varchar(255) DEFAULT NULL,
  `WORK_CITY` varchar(255) DEFAULT NULL,
  `WORK_STATE` varchar(255) DEFAULT NULL,
  `WORK_ZIP` varchar(255) DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) DEFAULT NULL,
  `WORK_PROFILE` text,
  `WORK_LOGO` int DEFAULT NULL,
  `WORK_NOTES` text,
  `ADMIN_NOTES` text,
  `STORED_HASH` varchar(32) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) DEFAULT NULL,
  `LOGIN_ATTEMPTS` int DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) DEFAULT NULL,
  `TIME_ZONE` varchar(50) DEFAULT NULL,
  `TIME_ZONE_OFFSET` int DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `BX_USER_ID` varchar(32) DEFAULT NULL,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  `BLOCKED` char(1) NOT NULL DEFAULT 'N',
  `PASSWORD_EXPIRED` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`),
  KEY `ix_user_last_login` (`LAST_LOGIN`),
  KEY `ix_user_date_register` (`DATE_REGISTER`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user`
--

INSERT INTO `b_user` (`ID`, `TIMESTAMP_X`, `LOGIN`, `PASSWORD`, `CHECKWORD`, `ACTIVE`, `NAME`, `LAST_NAME`, `EMAIL`, `LAST_LOGIN`, `DATE_REGISTER`, `LID`, `PERSONAL_PROFESSION`, `PERSONAL_WWW`, `PERSONAL_ICQ`, `PERSONAL_GENDER`, `PERSONAL_BIRTHDATE`, `PERSONAL_PHOTO`, `PERSONAL_PHONE`, `PERSONAL_FAX`, `PERSONAL_MOBILE`, `PERSONAL_PAGER`, `PERSONAL_STREET`, `PERSONAL_MAILBOX`, `PERSONAL_CITY`, `PERSONAL_STATE`, `PERSONAL_ZIP`, `PERSONAL_COUNTRY`, `PERSONAL_NOTES`, `WORK_COMPANY`, `WORK_DEPARTMENT`, `WORK_POSITION`, `WORK_WWW`, `WORK_PHONE`, `WORK_FAX`, `WORK_PAGER`, `WORK_STREET`, `WORK_MAILBOX`, `WORK_CITY`, `WORK_STATE`, `WORK_ZIP`, `WORK_COUNTRY`, `WORK_PROFILE`, `WORK_LOGO`, `WORK_NOTES`, `ADMIN_NOTES`, `STORED_HASH`, `XML_ID`, `PERSONAL_BIRTHDAY`, `EXTERNAL_AUTH_ID`, `CHECKWORD_TIME`, `SECOND_NAME`, `CONFIRM_CODE`, `LOGIN_ATTEMPTS`, `LAST_ACTIVITY_DATE`, `AUTO_TIME_ZONE`, `TIME_ZONE`, `TIME_ZONE_OFFSET`, `TITLE`, `BX_USER_ID`, `LANGUAGE_ID`, `BLOCKED`, `PASSWORD_EXPIRED`) VALUES
(1, NULL, 'admin', '$6$N4TCoAZYdoLk8ATe$NfsLFJ8iFXB16lL.TZ7RuNJITjOfbn.6ewlCzp0orU2QfAmySiVsH8lV5oILmo.6SDtYeZX3PP1KC2/G90aSc0', '$6$BXa19aXZoZIEqhy4$AFgA7/fNH1V6LbtRh2s8EUaZv8LoB1EMEQeyIyMEpZtGFRpXCvpOFW7XB2phIp/fU6lVHxIAdiWCWZhxEo5Jl/', 'Y', 'Сергей', 'Майнек', 'qwestor@list.ru', '2024-10-23 14:10:46', '2024-10-22 21:29:16', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-22 21:29:16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ru', 'N', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_access`
--

CREATE TABLE IF NOT EXISTS `b_user_access` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `USER_ID` int DEFAULT NULL,
  `PROVIDER_ID` varchar(50) DEFAULT NULL,
  `ACCESS_CODE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_access` (`ACCESS_CODE`),
  KEY `ix_ua_provider` (`PROVIDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_access`
--

INSERT INTO `b_user_access` (`ID`, `USER_ID`, `PROVIDER_ID`, `ACCESS_CODE`) VALUES
(1, 0, 'group', 'G2'),
(2, 1, 'group', 'G1'),
(3, 1, 'group', 'G3'),
(4, 1, 'group', 'G4'),
(5, 1, 'group', 'G2'),
(9, 1, 'user', 'U1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_access_check`
--

CREATE TABLE IF NOT EXISTS `b_user_access_check` (
  `USER_ID` int DEFAULT NULL,
  `PROVIDER_ID` varchar(50) DEFAULT NULL,
  `DATE_CHECK` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `ux_uac_user_provider_date` (`USER_ID`,`PROVIDER_ID`,`DATE_CHECK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_auth_action`
--

CREATE TABLE IF NOT EXISTS `b_user_auth_action` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `PRIORITY` int NOT NULL DEFAULT '100',
  `ACTION` varchar(20) DEFAULT NULL,
  `ACTION_DATE` datetime NOT NULL,
  `APPLICATION_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_auth_action_user` (`USER_ID`,`PRIORITY`),
  KEY `ix_auth_action_date` (`ACTION_DATE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_auth_action`
--

INSERT INTO `b_user_auth_action` (`ID`, `USER_ID`, `PRIORITY`, `ACTION`, `ACTION_DATE`, `APPLICATION_ID`) VALUES
(1, 1, 200, 'update', '2024-10-22 21:29:16', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_auth_code`
--

CREATE TABLE IF NOT EXISTS `b_user_auth_code` (
  `USER_ID` int NOT NULL,
  `CODE_TYPE` varchar(20) NOT NULL DEFAULT 'email',
  `OTP_SECRET` text,
  `ATTEMPTS` int DEFAULT '0',
  `DATE_SENT` datetime DEFAULT NULL,
  `DATE_RESENT` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_counter`
--

CREATE TABLE IF NOT EXISTS `b_user_counter` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `SITE_ID` char(2) NOT NULL DEFAULT '**',
  `CODE` varchar(50) NOT NULL,
  `CNT` int NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) DEFAULT NULL,
  `PARAMS` text,
  `SENT` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_counter_user_site_code` (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_code` (`CODE`),
  KEY `ix_buc_ts` (`TIMESTAMP_X`),
  KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_device`
--

CREATE TABLE IF NOT EXISTS `b_user_device` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint UNSIGNED NOT NULL,
  `DEVICE_UID` varchar(50) NOT NULL,
  `DEVICE_TYPE` int UNSIGNED NOT NULL DEFAULT '0',
  `BROWSER` varchar(100) DEFAULT NULL,
  `PLATFORM` varchar(25) DEFAULT NULL,
  `USER_AGENT` varchar(1000) DEFAULT NULL,
  `COOKABLE` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_user_device_user` (`USER_ID`,`DEVICE_UID`),
  KEY `ix_user_device_user_cookable` (`USER_ID`,`COOKABLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_device_login`
--

CREATE TABLE IF NOT EXISTS `b_user_device_login` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` bigint UNSIGNED NOT NULL,
  `LOGIN_DATE` datetime DEFAULT NULL,
  `IP` varchar(20) DEFAULT NULL,
  `CITY_GEOID` bigint DEFAULT NULL,
  `REGION_GEOID` bigint DEFAULT NULL,
  `COUNTRY_ISO_CODE` varchar(10) DEFAULT NULL,
  `APP_PASSWORD_ID` bigint UNSIGNED DEFAULT NULL,
  `STORED_AUTH_ID` bigint UNSIGNED DEFAULT NULL,
  `HIT_AUTH_ID` bigint UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_user_device_login_device` (`DEVICE_ID`),
  KEY `ix_user_device_login_date` (`LOGIN_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_digest`
--

CREATE TABLE IF NOT EXISTS `b_user_digest` (
  `USER_ID` int NOT NULL,
  `DIGEST_HA1` varchar(32) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field`
--

CREATE TABLE IF NOT EXISTS `b_user_field` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(50) DEFAULT NULL,
  `FIELD_NAME` varchar(50) DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `SORT` int DEFAULT NULL,
  `MULTIPLE` char(1) NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) NOT NULL DEFAULT 'N',
  `SETTINGS` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_field`
--

INSERT INTO `b_user_field` (`ID`, `ENTITY_ID`, `FIELD_NAME`, `USER_TYPE_ID`, `XML_ID`, `SORT`, `MULTIPLE`, `MANDATORY`, `SHOW_FILTER`, `SHOW_IN_LIST`, `EDIT_IN_LIST`, `IS_SEARCHABLE`, `SETTINGS`) VALUES
(1, 'HLBLOCK_1', 'UF_NAME', 'string', 'UF_NAME', 100, 'N', 'N', 'N', 'Y', 'Y', 'N', 'a:6:{s:4:\"SIZE\";i:20;s:4:\"ROWS\";i:1;s:6:\"REGEXP\";s:0:\"\";s:10:\"MIN_LENGTH\";i:0;s:10:\"MAX_LENGTH\";i:0;s:13:\"DEFAULT_VALUE\";s:0:\"\";}'),
(2, 'HLBLOCK_1', 'UF_PHONE', 'string', 'UF_PHONE', 100, 'N', 'N', 'N', 'Y', 'Y', 'N', 'a:6:{s:4:\"SIZE\";i:20;s:4:\"ROWS\";i:1;s:6:\"REGEXP\";s:0:\"\";s:10:\"MIN_LENGTH\";i:0;s:10:\"MAX_LENGTH\";i:0;s:13:\"DEFAULT_VALUE\";s:0:\"\";}'),
(3, 'HLBLOCK_1', 'UF_EMAIL', 'string', 'UF_EMAIL', 100, 'N', 'N', 'N', 'Y', 'Y', 'N', 'a:6:{s:4:\"SIZE\";i:20;s:4:\"ROWS\";i:1;s:6:\"REGEXP\";s:0:\"\";s:10:\"MIN_LENGTH\";i:0;s:10:\"MAX_LENGTH\";i:0;s:13:\"DEFAULT_VALUE\";s:0:\"\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_confirm`
--

CREATE TABLE IF NOT EXISTS `b_user_field_confirm` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `DATE_CHANGE` timestamp NULL DEFAULT NULL,
  `FIELD` varchar(255) NOT NULL,
  `FIELD_VALUE` varchar(255) NOT NULL,
  `CONFIRM_CODE` varchar(32) NOT NULL,
  `ATTEMPTS` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_enum`
--

CREATE TABLE IF NOT EXISTS `b_user_field_enum` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int DEFAULT NULL,
  `VALUE` varchar(255) NOT NULL,
  `DEF` char(1) NOT NULL DEFAULT 'N',
  `SORT` int NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_lang`
--

CREATE TABLE IF NOT EXISTS `b_user_field_lang` (
  `USER_FIELD_ID` int NOT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_field_lang`
--

INSERT INTO `b_user_field_lang` (`USER_FIELD_ID`, `LANGUAGE_ID`, `EDIT_FORM_LABEL`, `LIST_COLUMN_LABEL`, `LIST_FILTER_LABEL`, `ERROR_MESSAGE`, `HELP_MESSAGE`) VALUES
(1, 'en', 'Name', '', '', '', ''),
(1, 'ru', 'Имя', '', '', '', ''),
(2, 'en', 'Phone', '', '', '', ''),
(2, 'ru', 'Телефон', '', '', '', ''),
(3, 'en', 'Email', '', '', '', ''),
(3, 'ru', 'Email', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_permission`
--

CREATE TABLE IF NOT EXISTS `b_user_field_permission` (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` int NOT NULL,
  `USER_FIELD_ID` int UNSIGNED NOT NULL,
  `ACCESS_CODE` varchar(100) NOT NULL,
  `PERMISSION_ID` varchar(32) NOT NULL,
  `VALUE` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID` (`ENTITY_TYPE_ID`),
  KEY `GROUP_ID` (`USER_FIELD_ID`),
  KEY `PERMISSION_ID` (`PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_group`
--

CREATE TABLE IF NOT EXISTS `b_user_group` (
  `USER_ID` int NOT NULL,
  `GROUP_ID` int NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_group`
--

INSERT INTO `b_user_group` (`USER_ID`, `GROUP_ID`, `DATE_ACTIVE_FROM`, `DATE_ACTIVE_TO`) VALUES
(1, 1, NULL, NULL),
(1, 3, NULL, NULL),
(1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_hit_auth`
--

CREATE TABLE IF NOT EXISTS `b_user_hit_auth` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `HASH` varchar(32) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `VALID_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_index`
--

CREATE TABLE IF NOT EXISTS `b_user_index` (
  `USER_ID` int NOT NULL,
  `SEARCH_USER_CONTENT` text,
  `SEARCH_DEPARTMENT_CONTENT` text,
  `SEARCH_ADMIN_CONTENT` text,
  `NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `SECOND_NAME` varchar(50) DEFAULT NULL,
  `WORK_POSITION` varchar(255) DEFAULT NULL,
  `UF_DEPARTMENT_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_index`
--

INSERT INTO `b_user_index` (`USER_ID`, `SEARCH_USER_CONTENT`, `SEARCH_DEPARTMENT_CONTENT`, `SEARCH_ADMIN_CONTENT`, `NAME`, `LAST_NAME`, `SECOND_NAME`, `WORK_POSITION`, `UF_DEPARTMENT_NAME`) VALUES
(1, '001 Сергей Майнек ', '', '001 Сергей Майнек djrfgbe yvfg djrfgbe@yvfg.eh nqzva', 'Сергей', 'Майнек', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_option`
--

CREATE TABLE IF NOT EXISTS `b_user_option` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `CATEGORY` varchar(50) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` mediumtext,
  `COMMON` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_option`
--

INSERT INTO `b_user_option` (`ID`, `USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`) VALUES
(1, 0, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:\"GADGETS\";a:8:{s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:805:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\" alt=\"\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"https://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:33:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:25:\"ADMIN_SITESPEED@666666777\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";}}}}', 'Y'),
(2, 1, 'admin_panel', 'settings', 'a:1:{s:4:\"edit\";s:3:\"off\";}', 'N'),
(3, 1, 'hot_keys', 'user_defined', 'b:1;', 'N'),
(4, 1, 'favorite', 'favorite_menu', 'a:1:{s:5:\"stick\";s:1:\"N\";}', 'N'),
(5, 1, 'socialservices', 'networkPopup', 'a:1:{s:9:\"showcount\";i:5;}', 'N'),
(9, 1, 'admin_menu', 'pos', 'a:1:{s:8:\"sections\";s:106:\"menu_highloadblock,menu_iblock,iblock_admin,menu_util,menu_system,menu_lang,interface,menu_module_settings\";}', 'N'),
(31, 1, 'fileman', 'code_editor', 'a:1:{s:5:\"theme\";s:5:\"light\";}', 'N'),
(36, 1, 'filter', 'tbl_hlusers_filter_id', 'a:1:{s:4:\"rows\";s:1:\"0\";}', 'N'),
(68, 1, 'main.ui.filter', 'translate_filter', 'a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:0:{}s:11:\"filter_rows\";s:69:\"FILE_NAME,PHRASE_CODE,CODE_ENTRY,PHRASE_TEXT,LANGUAGE_ID,PHRASE_ENTRY\";}}}', 'N'),
(69, 1, 'main.interface.grid', 'translate_list', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:5:{i:0;s:5:\"TITLE\";i:1;s:4:\"PATH\";i:2;s:11:\"PHRASE_CODE\";i:3;s:7:\"RU_LANG\";i:4;s:7:\"EN_LANG\";}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(71, 1, 'translate', 'list_mode', 's:12:\"CountPhrases\";', 'N'),
(77, 1, 'fileman', 'stickers_last_color', 'i:0;', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_password`
--

CREATE TABLE IF NOT EXISTS `b_user_password` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `DATE_CHANGE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_user_password_user_date` (`USER_ID`,`DATE_CHANGE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_password`
--

INSERT INTO `b_user_password` (`ID`, `USER_ID`, `PASSWORD`, `DATE_CHANGE`) VALUES
(1, 1, '$6$N4TCoAZYdoLk8ATe$NfsLFJ8iFXB16lL.TZ7RuNJITjOfbn.6ewlCzp0orU2QfAmySiVsH8lV5oILmo.6SDtYeZX3PP1KC2/G90aSc0', '2024-10-22 21:29:16');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_phone_auth`
--

CREATE TABLE IF NOT EXISTS `b_user_phone_auth` (
  `USER_ID` int NOT NULL,
  `PHONE_NUMBER` varchar(25) NOT NULL,
  `OTP_SECRET` text,
  `ATTEMPTS` int DEFAULT '0',
  `CONFIRMED` char(1) DEFAULT 'N',
  `DATE_SENT` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `ix_user_phone_auth_number` (`PHONE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_profile_history`
--

CREATE TABLE IF NOT EXISTS `b_user_profile_history` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `EVENT_TYPE` int DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) DEFAULT NULL,
  `USER_AGENT` text,
  `REQUEST_URI` text,
  `UPDATED_BY_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_history_user` (`USER_ID`),
  KEY `ix_profile_history_date` (`DATE_INSERT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_profile_record`
--

CREATE TABLE IF NOT EXISTS `b_user_profile_record` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `HISTORY_ID` int NOT NULL,
  `FIELD` varchar(40) DEFAULT NULL,
  `DATA` mediumtext,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_record_history_field` (`HISTORY_ID`,`FIELD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_session`
--

CREATE TABLE IF NOT EXISTS `b_user_session` (
  `SESSION_ID` varchar(250) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `SESSION_DATA` longtext,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_user_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_stored_auth`
--

CREATE TABLE IF NOT EXISTS `b_user_stored_auth` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) NOT NULL,
  `TEMP_HASH` char(1) NOT NULL DEFAULT 'N',
  `IP_ADDR` int UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_stored_auth`
--

INSERT INTO `b_user_stored_auth` (`ID`, `USER_ID`, `DATE_REG`, `LAST_AUTH`, `STORED_HASH`, `TEMP_HASH`, `IP_ADDR`) VALUES
(1, 1, '2024-10-22 21:29:16', '2024-10-22 21:29:16', 'ux6KUyKtBJE4d5BpOKR6ACIRyo1cu25A', 'N', 2130706433);

-- --------------------------------------------------------

--
-- Структура таблицы `hlusers`
--

CREATE TABLE IF NOT EXISTS `hlusers` (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `UF_NAME` text,
  `UF_PHONE` text,
  `UF_EMAIL` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `hlusers`
--

INSERT INTO `hlusers` (`ID`, `UF_NAME`, `UF_PHONE`, `UF_EMAIL`) VALUES
(1, 'Сергей', '+79516443090', 'qwestor@list.ru'),
(6, 'Петр', '+79516443012', 'test@test.com'),
(7, 'test', '+79516143090', 'qwesto2r@list.ru');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `b_landing`
--
ALTER TABLE `b_landing` ADD FULLTEXT KEY `IX_B_LANDING_SEARCH` (`SEARCH_CONTENT`);

--
-- Индексы таблицы `b_landing_block`
--
ALTER TABLE `b_landing_block` ADD FULLTEXT KEY `IX_B_BLOCK_SEARCH` (`SEARCH_CONTENT`);

--
-- Индексы таблицы `b_translate_phrase_fts_en`
--
ALTER TABLE `b_translate_phrase_fts_en` ADD FULLTEXT KEY `IXF_TRNSL_FTS_PH_EN` (`PHRASE`);

--
-- Индексы таблицы `b_translate_phrase_fts_ru`
--
ALTER TABLE `b_translate_phrase_fts_ru` ADD FULLTEXT KEY `IXF_TRNSL_FTS_PH_RU` (`PHRASE`);

--
-- Индексы таблицы `b_user_index`
--
ALTER TABLE `b_user_index` ADD FULLTEXT KEY `IXF_B_USER_INDEX_1` (`SEARCH_USER_CONTENT`);
ALTER TABLE `b_user_index` ADD FULLTEXT KEY `IXF_B_USER_INDEX_2` (`SEARCH_DEPARTMENT_CONTENT`);
ALTER TABLE `b_user_index` ADD FULLTEXT KEY `IXF_B_USER_INDEX_3` (`SEARCH_ADMIN_CONTENT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
