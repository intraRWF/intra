<?php
define('URL', str_replace('index.php', "", (isset($_server['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[PHP_SELF]"));

require_once('controllers/Router.php');

$router = new Router();
$router->routeReq();
?>
