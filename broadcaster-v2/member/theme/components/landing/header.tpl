<div class="header_child">
    {if $whitelabel_settings.lp_image_path}
    <img src="/images/whitelabels/img.php?g={$whitelabel_images.logo.guid}" border="0" />
    {else}
    <img src="{$_SITE_IMAGES_DEFAULT_}/global/landing/100/logo.png" border="0" />
    {/if}
    {if $lp_105}
    <div id="lp_105_header_message">Live! Featuring {$model_username}</div>
    {/if}
</div>