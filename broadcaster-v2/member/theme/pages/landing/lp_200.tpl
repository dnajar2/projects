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

<div id="container">
    <div id="container_bg">

        <div id="skin">

            {if !$hide_header}
            <div id="header">

                {include file="$_THEME/components/landing/lp_200_header.tpl"}

            </div>
            {/if}

            {include file="$_THEME/components/landing/$skin_script.tpl"}

            {if !$hide_footer}
{*<!--            <div id="footer"> -->*}

                {include file="$_THEME/components/landing/footer.tpl"}

{*<!--            </div> -->*}
            {/if}

        </div>

    </div> {if $smarty.const.__IS_DEV_SERVER}<!-- ends <div id="container_bg"> -->{/if}
</div> {if $smarty.const.__IS_DEV_SERVER}<!-- ends <div id="container"> -->{/if}

<div id="site_popup" class="hidden"></div>
<div id="site_popup_bg" class="hidden"></div>
<div id="popover_bg" class="hidden"></div>

</body> {if $smarty.const.__IS_DEV_SERVER}<!-- ends <body> -->{/if}

{include file="$_THEME/components/landing/html_footer.tpl"}

</html> {if $smarty.const.__IS_DEV_SERVER}<!-- ends <html> -->{/if}