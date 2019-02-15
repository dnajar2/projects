<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
{if $responsive_lp}
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">

{/if}

{include file="$_THEME/components/landing/html_header.tpl" preloadImages=$preloadImages}
{* added for responsive pages only*}
{if $responsive_lp}
    {if $models_list}
        <link rel="stylesheet" href="{$smarty.const.CDN_SCHEMA}/js/owl/dist/assets/owl.carousel.min.css{$CacheBuster->getFileRevision()}">
        <link rel="stylesheet" href="{$smarty.const.CDN_SCHEMA}/js/owl/dist/assets/owl.theme.default.min.css{$CacheBuster->getFileRevision()}">
    {/if}
    <link href="{$smarty.const.CDN_SCHEMA}/styles/landing/lp_main_style.css{$CacheBuster->getFileRevision()}" rel="stylesheet" type="text/css">
    <link href="{$smarty.const.CDN_SCHEMA}/styles/landing/{$lp_skin}.css{$CacheBuster->getFileRevision()}" rel="stylesheet" type="text/css">
        {* Get white label theme colors *}
        {if $lp_v3 }
            <link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/styles/custom/theme.css?id={$smarty.session.whitelabel.orig_theme_id}&wId={$smarty.session.whitelabel.id}&v={$CacheBuster->getFileRevision(false)}">
        {/if}
    <script src="{$smarty.const.CDN_SCHEMA}/js/landing/landing_join.js{$CacheBuster->getFileRevision()}"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
{/if}
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

<div id="container">
    {if !$hide_container_bg}
    <div id="container_bg">
    {/if}

        <div id="skin">

            {if !$hide_header }
            <div id="header">
                {include file="$_THEME/$landing_tpl_header"}
            </div>
            {/if}

            {include file="$_THEME/components/landing/$skin_script.tpl"}

            {if !$hide_footer}

                {include file="$_THEME/components/landing/footer.tpl"}

            {/if}

        </div>

    {if !$hide_container_bg}
    </div> {if $smarty.const.__IS_DEV_SERVER}<!-- ends <div id="container_bg"> -->{/if}
    {/if}
</div> {if $smarty.const.__IS_DEV_SERVER}<!-- ends <div id="container"> -->{/if}
<div class="clear_both;"> </div>
<div id="site_popup" class="hidden"></div>
<div id="site_popup_bg" class="hidden"></div>
<div id="popover_bg" class="hidden"></div>

<div class="clearfix"></div>
</body> {if $smarty.const.__IS_DEV_SERVER}<!-- ends <body> -->{/if}

{include file="$_THEME/components/html_footer.tpl"}

</html> {if $smarty.const.__IS_DEV_SERVER}<!-- ends <html> -->{/if}
