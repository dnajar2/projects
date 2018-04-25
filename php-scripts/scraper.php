<?php

	$html = file_get_contents( 'https://'.$_SERVER[ "HTTP_HOST" ].'/index.php');

	$dom = new DOMDocument;

	@$dom->loadHTML($html);
	$section = $dom->getElementById('models_grid');
	$links = $section->getElementsByTagName('a');

	$href = array();
	foreach ($links as $link){
		array_push($href, 'https://' . $_SERVER[ "HTTP_HOST" ] . $link->getAttribute('href'));
	}
	echo "<pre>";
	print_r($href);
	echo "</pre>";