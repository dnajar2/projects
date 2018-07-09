<?php
/*
Process data coming in
*/
class data{
  public $return = null;
  public $res = null;

  public function __construct()
  {
	  $this->res = new stdClass;
  }

	public function checkPost($post){
    if(!empty($post)){
        $this->return = true;
    }
    return $this->return;
  }
  public function res(){

    $this->res->message = "initial Message";
    return  $this->res;
  }

}