<?
if(!defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true)
	die();
?>
<!DOCTYPE html>
<html>
	<head>
	<?
	use Bitrix\Main\Page\Asset;
	\CJSCore::Init();
	Asset::getInstance()->addCss(SITE_TEMPLATE_PATH.'/lib/css/font-awesome.css');
	Asset::getInstance()->addCss(SITE_TEMPLATE_PATH.'/lib/css/style.css');
	Asset::getInstance()->addCss(SITE_TEMPLATE_PATH.'/lib/css/media.css');
	Asset::getInstance()->addJs(SITE_TEMPLATE_PATH.'/lib/js/script.js');
	?>
		<?$APPLICATION->ShowHead();?>
		<title><?$APPLICATION->ShowTitle();?></title>
		<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" /> 	
		<script>
</script>
	</head>
<body>
<div id="panel">
			<?$APPLICATION->ShowPanel();?>
</div>
<div class="main">
	<div class="innerwrapper">
		<div class="cwrp">
			<div class="hdr flex">
				<h1><?=GetMessage("ZAGOLOVOK");?> </h1>			
				<div class="langselect">
					<a href="/?user_lang=ru"><img src="/upload/russia-flag.webp"></a>
					<a href="/?user_lang=en"><img src="/upload/usa-flag.webp"></a>
					<p><?=GetMessage("CHOSELANGUAGE");?></p>
				</div>
			</div>
			<div class="message_wrp">
