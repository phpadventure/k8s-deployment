<?php
echo 'Hello '. getenv('WHO_IS_YOUR_DADDY'). "<br />";
echo 'Pharse : '. getenv('SECRET_PHRASE');

$logDir = dirname(__FILE__).'/logs/';
$logFile = 'log';

$message = function() {
  return strtotime("now").' - request on '.__FILE__. ' . Method - '.$_SERVER['REQUEST_METHOD']. "\n";
};

$file = fopen($logDir. $logFile,'a');
fwrite($file, $message());
fclose($file);
