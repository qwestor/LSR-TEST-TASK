<?
require($_SERVER['DOCUMENT_ROOT'].'/bitrix/header.php');
$APPLICATION->SetTitle('Главная');
?>

<form id="bx_custom_form" name="bx_custom_form">
		<div id="result" class="result"></div>
    <input type="text" name="name" placeholder="<?=GetMessage("YNAME");?>" />
    <input type="email" name="email" placeholder="<?=GetMessage("YEMAIL");?>" />
    <input type="text" name="phone" placeholder="<?=GetMessage("YPHONE");?>" />
    <input type="submit" value="<?=GetMessage("SEND");?>" />
</form>
<?
require($_SERVER['DOCUMENT_ROOT'].'/bitrix/footer.php');
?>