{literal}
<style>
<!--
html,
body {
   margin:0;
   padding:0 !important;
   height:100%;
}
h2{
	font-size: 24px;
}
-->
</style>
{/literal}
<body>
<div id="model_container">
	<div id="model_header" class="navbar navbar-inverse ">
		<div class="wcc-container">
			<div id="model_logo_section">
				<a class="wl-logo" href="/" title="{$whitelabel_settings.name}" target="_self">
					<img src="{$smarty.const.CDN_SCHEMA}{if $whitelabel_images.logo.hashbrowns_uri}{$whitelabel_images.logo.hashbrowns_uri}{else}{$whitelabel_images.logo.uri}{/if}" alt="{$whitelabel_settings.name}'s logo">
				</a>
			</div>

		</div>
	</div>
