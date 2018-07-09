<?php
/*
Process data coming in
*/
class data{
  public $return = null;
  public $res = null;

  public function checkPost($post){
    if(!empty($post)){
        $this->return = true;
    }
    return $this->return;
  }
  public function res(){
    $res = new stdClass;
    $res->message = "initial Message";
    return $res;
  }

}