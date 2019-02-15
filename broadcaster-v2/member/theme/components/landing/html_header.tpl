<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>{$site_meta_data.title}<!--{$_CONFIG.SITE.SITE_TITLE}--></title>

<link href="{$smarty.const.CDN_SCHEMA}/styles/main.css.php{$CacheBuster->getFileRevision()}&themeId={$whitelabel_settings.theme_id}" rel="stylesheet" type="text/css" media="screen" />
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

{if $tablet_id}
<link href="{$smarty.const.CDN_SCHEMA}/styles/landing/tablet.css.php{$CacheBuster->getFileRevision()}&tablet={$tablet_id}" rel="stylesheet" type="text/css" media="screen" />
{else}
    {if !$lp_v3 }
        <link href="{$smarty.const.CDN_SCHEMA}/styles/landing/landing.css.php{$CacheBuster->getFileRevision()}&skin={$skin_id}{if $i}&i={$i}{/if}" rel="stylesheet" type="text/css" media="screen" />
    {/if}
{/if}

{if $cssFiles}
{foreach from=$cssFiles item="cssFile"}
{if substr($cssFile, 0, 4) == 'http'}
<link href="{$cssFile}{$CacheBuster->getFileRevision($cssFile)}&tId={$whitelabel_settings.theme_id}" rel="stylesheet" type="text/css" media="screen" />
{else}
<link href="{$smarty.const.CDN_SCHEMA}{$cssFile}{$CacheBuster->getFileRevision($cssFile)}&tId={$whitelabel_settings.theme_id}" rel="stylesheet" type="text/css" media="screen" />
{/if}
{/foreach}
{/if}

<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/functions.js{$CacheBuster->getFileRevision()}"></script>
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/jquery.min.js{$CacheBuster->getFileRevision()}"></script>
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/jquery_plugins/jquery.extensions.js{$CacheBuster->getFileRevision()}"></script>
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/jquery_plugins/jquery.checkboxradio.js{$CacheBuster->getFileRevision()}"></script>
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/jquery_plugins/jquery.dropdown.js{$CacheBuster->getFileRevision()}"></script>
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/php_namespaced_mini.js{$CacheBuster->getFileRevision()}"></script>
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/popups.js{$CacheBuster->getFileRevision()}"></script>
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/flash_detect.js{$CacheBuster->getFileRevision()}"></script>
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/ajax_queue.js{$CacheBuster->getFileRevision()}"></script>

{if $jsFiles}
{foreach from=$jsFiles item="jsFile"}
{if substr($jsFile, 0, 4) == 'http'}
<script language="JavaScript" type="text/javascript" src="{$jsFile}{$CacheBuster->getFileRevision($jsFile)}"></script>
{else}
<script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}{$jsFile}{$CacheBuster->getFileRevision($jsFile)}"></script>
{/if}
{/foreach}
{/if}

{if $header_injects}
{foreach from=$header_injects item="header_inject"}
{$header_inject}
{/foreach}
{/if}

{literal}
<script language="Javascript" type="text/javascript">
<!--
$(document).ready(function(){
	$("input").checkBoxRadios();
});
-->
</script>
<script type="text/javascript">
// Run the script on DOM ready:
$(document).ready(function()
{
    $P = new PHP_JS( window );
{/literal}
    {if stristr($smarty.session.browser.type, "Explorer")}
    isInternetExplorer = true;
    {else}
    isInternetExplorer = false;
    {/if}
	MM_preloadImages({$preloadImages});

	{if $img_preload_csv}
	MM_preloadImages( {$img_preload_csv} );
	{/if}

	{if $jsInit}
	{foreach from=$jsInit item="jsLine"}
	{$jsLine}
	{/foreach}
	{/if}

	ajax_queue.process();

	{**** Custom whitelabel code to inject into the body ****}
	{if $site_meta_data.wl_bodytext}
	// custom whitelabel bodytext
    	{literal}$('#wl_bodytext').appendTo($('#wl_container'));{/literal}
	{/if}
	{if $site_meta_data.wl_profiletext}
	// custom whitelabel profiletext
    	{literal}$('#wl_profiletext').appendTo($('#cmp_wl_profiletext'));{/literal}
	{/if}

{literal}
});
</script>
{/literal}
</head>
