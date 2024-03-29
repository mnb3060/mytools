<?php
$contents = file_get_contetnts('https://yoursite.com/');
$dom = new DOMDocument();
@$dom->loadHTML($contents);
$xpath = new DOMXpath($dom);	
$data = getval($xpath , 'your xpath copied from chrome or etc...');

?>
