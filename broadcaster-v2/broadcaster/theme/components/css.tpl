<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="{$CDN_SCHEMA}/css/models/v2/bootstrap.min.css{$CacheBuster->getFileRevision()}">
<!-- Font Awesome -->
<link rel="stylesheet" href="{$CDN_SCHEMA}/css/models/v2/font-awesome.min.css{$CacheBuster->getFileRevision()}">
<!-- Ionicons -->
<link rel="stylesheet" href="{$CDN_SCHEMA}/css/models/v2/ionicons.min.css{$CacheBuster->getFileRevision()}">
<!-- jvectormap -->
<link rel="stylesheet" href="{$CDN_SCHEMA}/css/models/v2/jquery-jvectormap.css{$CacheBuster->getFileRevision()}">
{if $show eq 'myphotos' or $show eq 'myprofile'}
    <link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/css/v3/blueimp-gallery.min.css{$CacheBuster->getFileRevision()}">
    <link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/css/v3/blueimp-gallery-indicator.css{$CacheBuster->getFileRevision()}">
    <link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/css/models/v2/croppie.css{$CacheBuster->getFileRevision()}">
    <link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/themes/camtocam/calendar.css{$CacheBuster->getFileRevision()}">
{/if}
<!-- Theme style -->
<link rel="stylesheet" href="{$CDN_SCHEMA}/css/models/v2/AdminLTE.min.css{$CacheBuster->getFileRevision()}">
<link rel="stylesheet" href="{$CDN_SCHEMA}/css/models/v2/custom.css{$CacheBuster->getFileRevision()}">
<link rel="stylesheet" href="{$CDN_SCHEMA}/css/animate.css{$CacheBuster->getFileRevision()}">
<!-- AdminLTE Skins. Choose a skin from the css/skins
     folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="{$CDN_SCHEMA}/css/models/v2/_all-skins.min.css{$CacheBuster->getFileRevision()}">
<link rel="stylesheet" href="{$CDN_SCHEMA}/css/models/v2/gui.css{$CacheBuster->getFileRevision()}">

{if !$smarty.session.__logged_in}
<link rel="stylesheet" href="{$CDN_SCHEMA}/css/models/v2/login.css{$CacheBuster->getFileRevision()}">
{/if}
<!-- Google Font -->
<link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/styles/custom/theme.css?id={$smarty.session.whitelabel.themeId}&wId={$smarty.session.whitelabel.id}&v={$CacheBuster->getFileRevision(false)}">

