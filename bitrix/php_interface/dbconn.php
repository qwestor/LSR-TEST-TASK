<?php
$DBDebug = false;
$DBDebugToFile = false;

define("BX_FILE_PERMISSIONS", 0644);
define("BX_DIR_PERMISSIONS", 0755);
@umask(~(BX_FILE_PERMISSIONS | BX_DIR_PERMISSIONS) & 0777);

define("BX_DISABLE_INDEX_PAGE", true);

mb_internal_encoding("UTF-8");

$arLang = array("ru", "en");
if (isset($_GET["user_lang"]) && in_array($_GET["user_lang"], $arLang))
{
	setcookie("USER_LANG", $_GET["user_lang"], time()+9999999, "/");
	define("LANGUAGE_ID", $_GET["user_lang"]);
}
elseif (isset($_COOKIE["USER_LANG"]) && in_array($_COOKIE["USER_LANG"], $arLang))
{
   define("LANGUAGE_ID", $_COOKIE["USER_LANG"]);
}
