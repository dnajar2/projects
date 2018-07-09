<?php
	require_once $_SERVER['DOCUMENT_ROOT']  . "/camsDev/cams-test-scrips/html/includes/data.Class.php";

	$data = new data();
	$res = $data->res();

	if($data->checkPost($_POST)){
		$res->status = $data->checkPost($_POST);
		$res->message = 'Changed Successfully to ' . $_POST['caption'] .'!';
		$res->cssClass = "success";
	}
	die(json_encode($res));
