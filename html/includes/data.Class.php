<?php
/*
Process data coming in
*/
class data{
  public $return = null;

  public function checkPost($post){

    if(!empty($post)){
        $this->return = true;
    }
  }
  public function res(){
    $res = new stdClass;
    $res->message = "initial Message";
    return $res;
  }

}

 ?>
