<?php


$contents = file_get_contents('https://yoursite.com/');

function getval($xpath , $query){
	//return $r = trim((string) $xpath->query($query)->item(0)->nodeValue);
	return $r = $xpath->query($query)->item(0)->nodeValue;	
}

$dom = new DOMDocument();
@$dom->loadHTML($contents);
$xpath = new DOMXpath($dom);	
$data = getval($xpath , 'your xpath copied from chrome or etc...');

?>
