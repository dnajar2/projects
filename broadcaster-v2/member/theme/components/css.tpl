{*<!-- Latest compiled and minified CSS -->*}
<link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/css/v3/bootstrap.min.css{$CacheBuster->getFileRevision()}">
<link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/css/v3/bootstrap-formhelpers.min.css{$CacheBuster->getFileRevision()}" >

{*<!-- Font Awesome -->*}
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

{if $desktop_button eq 'messages'}
 <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" >
{/if}

{if $desktop_button eq 'content'}
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/css/members/video-player.css{$CacheBuster->getFileRevision()}">
 <link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/css/v3/owl.carousel.min.css{$CacheBuster->getFileRevision()}">
 <link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/css/v3/owl.theme.default.min.css{$CacheBuster->getFileRevision()}">
{/if}
{*<!-- site specific -->*}
<link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/styles/custom/styles.css{$CacheBuster->getFileRevision()}">
{*<!-- miscellaneous -->*}
{if $site_meta_data.show_page eq 'profile'}
<link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/css/v3/blueimp-gallery.min.css{$CacheBuster->getFileRevision()}">
<link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/css/v3/blueimp-gallery-indicator.css{$CacheBuster->getFileRevision()}">
{/if}
<link rel="stylesheet" type="text/css" href="{$smarty.const.CDN_SCHEMA}/css/v3/jquery-ui.css{$CacheBuster->getFileRevision()}" >
