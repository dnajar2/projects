<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{$whitelabel_settings.name}</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    {include file="models/v2/components/css.tpl"}

    <script language="JavaScript" type="text/javascript" src="{$CDN_SCHEMA}/js/models/v2/jquery.min.js{$CacheBuster->getFileRevision()}"></script>
    <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/wcc.js{$CacheBuster->getFileRevision()}"></script>
    <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/jquery_plugins/jquery.md5.min.js{$CacheBuster->getFileRevision()}"></script>
    <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/wccConsole.js{$CacheBuster->getFileRevision()}"></script>

    {*<!-- Loading js scripts -->*}
    {if $whitelabel_settings.translate === '1'}
        <script language="JavaScript" type="text/javascript" src="{$smarty.const.CDN_SCHEMA}/js/googleTransController.js{$CacheBuster->getFileRevision()}"></script>
    {/if}

    <script type="text/javascript">
    wcc.app = '{$chef.general.app}';
    wcc.env = '{$chef.general.env}';
    wcc.is_dev = {if $chef.general.env == 'dev'}true{else}false{/if};
    wcc.is_stage = {if $chef.general.env == 'stage'}true{else}false{/if};
    wcc.is_prod = {if $chef.general.env == 'prod'}true{else}false{/if};
    wcc.is_local = {if $smarty.const.__LOCAL_DEBUG}true{else}false{/if};
    wcc.page = '{$show}';
    wcc.can_run_nodeApp = false;
    wcc.is_logged_in = {if $smarty.session.__logged_in}true{else}false{/if};
    {literal}
        if(wcc.is_prod && !wcc.is_local){
        console.disable();
        }
    {/literal}
    wcc.theme_id = "v2";
    wcc.st_theme = "v2";
    wcc.sid_name = "{$smarty.session.session_name}";
    wcc.sid = "{$smarty.session.session_id}";
    wcc.model_id = {$smarty.session.userid};
    wcc.cdn_schema = '{$chef.general.cdn_schema}';
    wcc.photos_schema = '{$chef.general.photos_schema}';
    wcc.wait_gif.src = wcc.cdn_schema + '/images/wcc3/spinner.svg';
    {if $preloadImages}
        wcc.preloadImages({$preloadImages});
    {/if}
    {if $img_preload_csv}
        wcc.preloadImages({$img_preload_csv});
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

    {if $header_injects}
        {foreach from=$header_injects item="header_inject"}
            {$header_inject}
        {/foreach}
    {/if}
</head>
