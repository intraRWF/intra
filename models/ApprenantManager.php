<?php
class ApprenantManager extends Model{
  public function getApprenants(){
    return $this->getAll('Apprenants', 'Apprenant');
  }
}
?>
