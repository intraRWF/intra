<?php
abstract class Model{

  private static $_bdd;

  //instanciation de la connxion a la bdd
  private static function setBdd(){
    self::$_bdd = new PDO('mysql:host=localhost;dbname=intra;charset=utf8', 'root', '');
    self::$_bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
  }
  //récup la connxion a la bdd
  protected function getBdd(){
    if(self::$_bdd == null)
      self::setBdd();
      return self::$_bdd;
  }
  protected function getAll($table, $obj){
    $var = [];
    $req = $this->getBdd()->prepare('SELECT * FROM' .table. 'ORDER BY id desc');
    $req->execute();
    while($data = $req->fetch(PDO::FETCH_ASSOC)){
      $var[] = new $obj($data);
    }
    return $var;
    $req->closeCursor();
  }
}
/*function dbConnect()
{
    try
    {
        $db = new PDO('mysql:host=localhost;dbname=intra;charset=utf8', 'root', '');
        return $db;
    }
    catch(Exception $e)
    {
        die('Erreur : '.$e->getMessage());
    }
}*/
?>
