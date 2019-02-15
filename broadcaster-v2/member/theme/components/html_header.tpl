<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
	<html class="no-js" lang="en">
	<!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=11,IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, minimal-ui">
	<link rel="apple-touch-icon" href="apple-touch-icon.png">

	{if ($show == 'site_index' || $show == 'home' || $show == '') && $whitelabel_settings.can_edit_meta_tags && $whitelabel_settings.title}
	<title>{$whitelabel_settings.title}</title>
	{else}
	<title>{$site_meta_data.title}</title>
	{/if}

	{if $whitelabel_settings.can_edit_meta_tags && $whitelabel_settings.meta_tag_description}
	<meta name="Description" content="{$whitelabel_settings.meta_tag_description}">
	{else}
	<meta name="Description" content="{$site_meta_data.description}" />
	{/if}
	{if $whitelabel_settings.can_edit_meta_tags && $whitelabel_settings.meta_tag_keywords}
	<meta name="Keywords" content="{$whitelabel_settings.meta_tag_keywords}">
	{else}
	<meta name="Keywords" content="{$site_meta_data.keywords}" />
	{/if}

	<meta name="google-site-verification" content="{$whitelabel_settings.meta_google_site_verification}" />
	<meta name="verify-v1" content="{$whitelabel_settings.meta_verify_v1}" />
	{if $whitelabel_settings.meta_msvalidate_01}
	<meta name="msvalidate.01" content="{$whitelabel_settings.meta_msvalidate_01}" />
	{/if}

	<link rel="meta" href="http://www.webcamclub.com/labels.rdf" type="application/rdf xml" title="ICRA labels" />
	<meta http-equiv="pics-Label" content='(pics-1.1 "http://www.icra.org/pics/vocabularyv03/" l gen true for "http://webcamclub.com" r (n 2 s 2 v 3 l 3 oa 2 ob 2 oc 2 od 2 oe 2 of 2 og 2 oh 2 c 2) gen true for "http://www.webcamclub.com" r (n 2 s 2 v 3 l 3 oa 2 ob 2 oc 2 od 2 oe 2 of 2 og 2 oh 2 c 2))' />
	<meta name="rating" content="RTA-5042-1996-1400-1577-RTA" />

	<meta name="Revisit-after" content="10" />
	<meta name="Robots" content="all" />
	<meta name="Page-topic" content="live sexy web cams and chat" />

	{*<!-- 3rd party css  -->*}
	{include file="wcc3/components/css.tpl" show=$show}

	{*<!-- This needs to load last #### ALWAYS #### Site Custom Whitelabel Theme -->*}
	<link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/styles/custom/theme.css?id={$smarty.session.whitelabel.themeId}&wId={$smarty.session.whitelabel.id}&v={$CacheBuster->getFileRevision(false)}">
	{*<!-- site specific css; becareful none of these css scripts do not over-write any settings in the /styles/custom/theme.css -->*}
    {if $cssFiles}
    {foreach from=$cssFiles item="cssFile"}
    {if substr($cssFile, 0, 4) == 'http'}
    <link href="{$cssFile}{$CacheBuster->getFileRevision($cssFile)}&tId={$whitelabel_settings.theme_id}" rel="stylesheet" type="text/css" media="screen" />
    {else}
    <link href="{$smarty.const.CDN_SCHEMA}{$cssFile}{$CacheBuster->getFileRevision($cssFile)}&tId={$whitelabel_settings.theme_id}" rel="stylesheet" type="text/css" media="screen" />
    {/if}
    {/foreach}
    {/if}

	{*<!-- Loading js scripts -->*}
    {if $whitelabel_settings.translate === '1'}
    <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/googleTransController.js{$CacheBuster->getFileRevision()}"></script>
	{/if}

	<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/wccConsole.js{$CacheBuster->getFileRevision()}"></script>
	{*<script language="JavaScript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>*}
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        {*<script src="https://code.jquery.com/jquery-migrate-3.0.1.js"></script>*}

	{*<!-- jquery mobile will only run if the below conditions are met... -->*}
	{*{if $show eq 'myaccount' && $desktop_button eq 'messages' && $smarty.session.mobile_detect.is_mobile eq true}*}
		{*<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>*}
	{*{/if}*}

	{*<!-- site specific scripts -->*}
	<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/wcc.js{$CacheBuster->getFileRevision()}"></script>
	<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/jquery_plugins/jquery.md5.min.js{$CacheBuster->getFileRevision()}"></script>



	{*<!-- custom header objects -->*}
	{if $header_injects}
	{foreach from=$header_injects item="header_inject"}
	{$header_inject}
	{/foreach}
	{/if}

	{if $show neq 'myaccount'}
	<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/fxt.js{$CacheBuster->getFileRevision()}"></script>
	<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/uivideocontroller.js{$CacheBuster->getFileRevision()}"></script>
	{/if}

	<link rel="icon" href="{$smarty.const.CDN_SCHEMA}/favicon3.ico" type="images/ico" />
	<link rel="shortcut icon" href="{$smarty.const.CDN_SCHEMA}/favicon3.ico" type="image/ico" />

	{if $ui_res_base_path}
	<base href="{$ui_res_base_path}" />
	{/if}
	<script language="JavaScript" src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.3/socket.io.js"></script>
	<script type="text/javascript">
    wcc.app = '{$chef.general.app}';
    wcc.env = '{$chef.general.env}';
    wcc.is_dev = {if $chef.general.env == 'dev'}true{else}false{/if};
    wcc.is_stage = {if $chef.general.env == 'stage'}true{else}false{/if};
    wcc.is_prod = {if $chef.general.env == 'prod'}true{else}false{/if};
	wcc.is_local = {if $smarty.const.__LOCAL_DEBUG}true{else}false{/if};
	wcc.page = '{$show}';
	wcc.can_run_nodeApp = ['wall'];
	wcc.is_logged_in = {if $smarty.session.__logged_in}true{else}false{/if};
	{literal}
	if(wcc.is_prod && !wcc.is_local){
		console.disable();
	}
	{/literal}
	wcc.theme_id = "{$whitelabel_themes.id}";
	wcc.st_theme = "{$whitelabel_themes.st_theme}";
	wcc.sid_name = "{$smarty.session.session_name}";
	wcc.sid = "{$smarty.session.session_id}";
	wcc.member_id = {$smarty.session.userid};
    wcc.cdn_schema = '{$chef.general.cdn_schema}';
    wcc.photos_schema = '{$chef.general.photos_schema}';
	wcc.wait_gif.src = wcc.cdn_schema + '/images/wcc3/spinner.svg';
    {if $loading_landing_page}
    var loading_landing_page = {$loading_landing_page};
    {else}
    var loading_landing_page = null;
    {/if}
	{if $preloadImages}
	wcc.preloadImages({$preloadImages});
	{/if}
	{if $img_preload_csv}
	wcc.preloadImages({$img_preload_csv});
	{/if}
	</script>
    {if $jsFiles}
    {foreach from=$jsFiles item="jsFile"}
        {if substr($jsFile, 0, 4) == 'http'}
        <script language="JavaScript" type="text/javascript" src="{$jsFile}{$CacheBuster->getFileRevision($jsFile)}"></script>
        {else}
        <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}{$jsFile}{$CacheBuster->getFileRevision($jsFile)}"></script>
        {/if}
    {/foreach}
    {/if}
        <script>
            {if $jsInit}
            {foreach from=$jsInit item="jsLine"}
            {$jsLine}
            {/foreach}
            {/if}
        </script>
    <style type="text/css">
    {literal}
    .goog-te-banner-frame.skiptranslate {
        position: absolute !important;
        top:17px !important;
        border-bottom: none;
        -moz-box-shadow: none;
         -webkit-box-shadow: none;
         box-shadow:none;
        z-index: 1 !important;
        opacity: 0 !important;
    }
    .goog-tooltip {
        display: none !important;
    }
    .goog-tooltip:hover {
        display: none !important;
    }
    {/literal}
    </style>
</head>
