<?php
require_once('views/View.php');

class Router{
  private $_ctrl;
  private $_view;

  public function routeReq(){
    try{
      //chargement auto class
      spl_autoload_register(function($class){
        require_once('models/'.$class.'.php');
      });

      $url ='';
      // controller inclus selon action user
      if(isset($_GET['url'])){
        $url = explode('/', filter_var($_GET['url'],
        FILTER_SANITIZE_URL));

        $controller = ucfirst(strtolower($url[0]));
        $controllerClass = "controller".$controller;
        $controllerFile = "controllers/".$controllerClass.".php";

        if(file_exists($controllerFile)){
          require_once($controllerFile);
          $this->_ctrl = new $controllerClass($url);
        }else{
          throw new Exception('Page introuvable');
        }
      }else{
          require_once('controllers/ControllerAccueil.php');
          $this->_ctrl = new ControllerAccueil($url);
        }
      }
      //gestion erreurs
      catch(Exception $e){
      $errorMsg = $e->getMessage();
      //require_once('views/viewError.php');
      $this->_view =new View('Error');
      $this->_view->generate(array('errorMsg' => $errorMsg));
    }
  }
}
?>
