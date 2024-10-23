<?
require($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/main/include/prolog_before.php");
use Bitrix\Main\Loader,
Bitrix\Highloadblock as HL,
Bitrix\Main\Entity;
__IncludeLang($_SERVER["DOCUMENT_ROOT"].SITE_TEMPLATE_PATH."/lang/".LANGUAGE_ID."/header.php");


class sendForm{
	const hlblockId = 1; // ID HL блока
	var $output = [];
	
    public static function run() {
        $instance = new self();
        $instance->processRequest();
    }

    private function processRequest() {
		$output["error"] = "";
		$data = $_REQUEST;
		$data['phone'] = preg_replace('/[\s\-\(\)]/', '', $data['phone']);
		$output["error"] .= self::validatePhone($data['phone']);
		$output["error"] .= self::validateEmail($data['email']);
		if($output["error"]){
			echo json_encode($output);
			return;
		}
		else{
				Loader::includeModule("highloadblock"); 
				$hlblock = HL\HighloadBlockTable::getById(self::hlblockId)->fetch();
				if ($hlblock) {
					$entity = HL\HighloadBlockTable::compileEntity($hlblock);
					$entityClass = $entity->getDataClass();
					if (self::checkUnicParam($entityClass,$data['phone'],$data['email'])) {
						$output["error"] = GetMessage("ERRMAILEXISTS");
					} else {
							if (self::addNewUser($entityClass, $data)) {
								$output["result"] = GetMessage("OK");
							} else {
								$output["error"] = GetMessage("ERRUSERADD");
							}
					}
				} else {
					$output["error"] = GetMessage("ERRNOHL");
				}
				echo json_encode($output);
		}
	}
	
	
	
	private static function addNewUser($entityClass, $data){
		$data = [
			"UF_NAME"=>$data['name'],
			"UF_PHONE"=>$data['phone'],
			"UF_EMAIL"=>$data['email']
			];
		$result = $entityClass::add($data);
		return $result->isSuccess();
	}
	
	private static function checkUnicParam($entityClass, $phone, $email){
		$query = new Entity\Query($entityClass);
		$query->setFilter([
			'LOGIC' => 'OR',
			['=UF_EMAIL' => $email],
			['=UF_PHONE' => $phone]
			]);
		$result = $query->setSelect(['ID'])->exec();
		return $result->fetch();
	}

	
	private static function validatePhone($phone){
		$pattern = '/^(\+7|8)?[0-9]{10}$/';
		if (preg_match($pattern, $phone)) {
        return false;
		} else {
			return GetMessage("ERRWRONGPHONE");
		}
	}
	
	private static function validateEmail($email){
		$email = trim($email);
		if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        return false;
		} else {
			return GetMessage("ERRWRONGADDRESS");
		}
	}
}

SendForm::run();
?>