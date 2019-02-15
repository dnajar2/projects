<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
{include file="$_THEME/components/landing/html_header.tpl" preloadImages=$preloadImages}

<body>
{if $jsBody}
{foreach from=$jsBody item="jsFile"}
<script language="JavaScript" type="text/javascript" src="{$jsFile}"></script>
{/foreach}
{/if}
{**** Custom whitelabel code to inject into the body ****}
{if $site_meta_data.wl_bodytext}
<!-- custom whitelabel bodytext -->
{$site_meta_data.wl_bodytext}
{/if}

<div id="tablet">

	{if !$hide_header}
	    {include file="$_THEME/components/landing/tablet_header.tpl"}
	{/if}

	
    {include file="$_THEME/components/landing/$tablet_script.tpl"}


	{if !$hide_footer}
	    {include file="$_THEME/components/landing/tablet_footer.tpl"}
	{/if}

</div>
<div class="clear_both"></div>
</body> {if $smarty.const.__IS_DEV_SERVER}<!-- ends <body> -->{/if}

{include file="$_THEME/components/landing/html_footer.tpl"}

</html> {if $smarty.const.__IS_DEV_SERVER}<!-- ends <html> -->{/if}