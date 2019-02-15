{include file="$_THEME/components/html_header.tpl"}

<body>
	{include file="$_THEME/components/header.tpl"}
	<div id="container">
		<div id="container_bg">
			<div id="chat_container" style="opacity:0;{if $dating_ad_zone}margin-top:0px;padding-top:0px;{/if}">
			<script type="text/javascript">
			var cur_model_id = '{$model_id}';
			var cur_model_username = '{$model_username}';
			var bg_color = '{$bg_color}';
			</script>

			{if $js_chat }
			<script type="text/javascript">

			var fileref;
			var filesadded = "";
			var $window = $(window);

			var windowWidth;
			var windowHeight;
			var intMenuOpen = false;
			var animated = false;
			var fileCnt = 0;
			var useCompressed = true;
			var ldfldr = "js";
			var lddr = "mobile";
			var cb = '{$cachebuster}';
			var member_id = '{$member_id}';
			var member_username = '{$member_username}';
			var session_id = '{$smarty.session.SessionID}';
			var session_name = '{$smarty.session.session_name}';
			var model_id = '{$model_id}';
			var model_rate = '{$model_rate}';
			var model_username = '{$model_username}';
			var model_server_id = '{$model_server_id}';
			var is_apple_device = '{$is_apple_device}';
			var images_url = '{$smarty.const.CDN_SCHEMA}/images/wcc2';
			var sid_name = '{$smarty.session.session_name}';
			var sid = '{$smarty.session.SessionID}';
			var site_version = '{$site_version}';
			var show_id = '{$show_id}';
			var show_type = '{$show_type}';
			var device_type = '{$smarty.session.mobile_detect.device_type}';

			var lvideo_server_url = '{$lvideo_server_url}';
			var lvideo_server_port = '{$lvideo_server_port}';
			var mobile_tomcat_server = '{$mobile_tomcat_server}';
			var mobile_streams_server = '{$mobile_streams_server}';
			var mobile_streams_feed_id = '{$mobile_streams_feed_id}';
			var dating_ad_zone_height = 0;

			var fms_server_url = '{$server_url}';
			var member_balance = '{$member_balance}';
			var member_has_bought = '{$hasBought}';

			var IS_DEV_SERVER = '{$smarty.const.__IS_DEV_SERVER}';
			var IS_STAGING = '{$smarty.const.__IS_STAGING}';
			var CDN_SCHEMA = '{$smarty.const.CDN_SCHEMA}';

			var loadSIO = false;
			var loadMPD = false;
			var loadEmbedChat = true;

			var canResizeLoader = true;
			</script>

			{literal}
            <script language="JavaScript" type="text/javascript" src="../flashApps/js/app/view/initializer.js"></script>
			<script type="text/javascript">

			function doLoaderResize() {
				if ( canResizeLoader ) {
					if ( document.getElementById("chat_swf_parent") != null ) {
						if ( parseFloat( window.innerWidth ) < 740 || parseFloat( window.innerHeight ) < 740 ) {
							document.getElementById("chat_swf_parent").style.height = parseFloat( window.innerHeight ) + "px";
						}
						else {
							document.getElementById("chat_swf_parent").style.height = parseFloat( window.innerHeight ) - 350 + "px";
						}

						if ( document.getElementById("chat_swf_waiting_loader") != null ) {
							document.getElementById("chat_swf_waiting").style.top = parseFloat( document.getElementById("chat_swf_parent").style.height ) / 2 + 80 + "px";
							document.getElementById("chat_swf_waiting_loader").style.left = parseFloat( window.innerWidth ) / 2 - 10 + "px";
							document.getElementById("chat_swf_waiting").style.opacity = 1;

							if ( parseFloat( window.innerWidth ) < 740 ) {
								document.getElementById("chat_swf_waiting_loader").style.left = parseFloat( window.innerWidth ) / 2 - 10 + "px";
								document.getElementById("chat_swf_waiting").style.top = parseFloat( window.innerHeight ) / 2 - 80 + "px";
							}
						}
					}
				}
			};

			var addEvent = function(object, type, callback) {
				if ( object == null || typeof(object) == 'undefined' )
					return;

				if ( object.addEventListener ) {
					object.addEventListener(type, callback, false);
				}
				else if ( object.attachEvent ) {
					object.attachEvent("on" + type, callback);
				}
				else {
					object["on"+type] = callback;
				}
			};

			addEvent(window, "resize", function(event) {
			    doLoaderResize();
			});

			setTimeout( doLoaderResize, 1000 );
			</script>
			{/literal}
			{/if}
		</div>

		<div id="tracking_pixel" style="width: 1px; height: 1px;"></div>

		{if $pgm}
            {literal}
				<script type="text/javascript">
                pgm_start_timer();
                window.onfocus = pgm_on_focus;
                window.onblur = pgm_on_blur;
                </script>
            {/literal}
		{/if}

		{if empty($chat_swf_parent_width)}
		{assign var="chat_swf_parent_width" value="980px"}
		{/if}
		{if empty($chat_swf_parent_height)}
			{assign var="chat_swf_parent_height" value="612px"}
		{/if}
		{if empty($chat_swf_parent_top_margin)}
			{assign var="chat_swf_parent_top_margin" value="20px"}
		{/if}

        <div id="chat_swf_parent" style="position: relative; width:100%;height:753px; margin:0 auto; margin-top:{$chat_swf_parent_top_margin};">
            <div id="chat_swf" class="chat_swf" style="width:100%; height:100%; background:none; border:none;">
            <div id="apDiv1" style="width:100%; height:100%;"></div>
        </div>
        <div id="chat_swf_waiting" style="width:100%;left:0px; top:48%; position:absolute;opacity:0;">
            <div style="left:48%; position:absolute;opacity:1;" id="chat_swf_waiting_loader">
            <img id="chat_swf_waiting_loader_img" src="../images/wcc2/global/AjaxLoader.gif" border="0" />
            </div>
        </div>
    </div>
{literal}
<script language="JavaScript" type="text/javascript">
	$('.fixed-header-wrap').attr('id','navBar');
    $('#navBar').removeClass('fixed-header-wrap');
</script>
<style>
a {
  text-decoration: none;
  -webkit-transition: .0s!important;
          transition: .0s!important;
}
p {
    margin: 0 0 15px;
    font-size: 18px;
    line-height: normal!important;
}
i.fa.fa-search.top-search{
	display:none;
}
.btn-user-tools {
    margin-top: 0px!important;
}
#chat_swf_waiting_loader {
	z-index:1000;
	width: 25px;
	height: 25px;
}
.fadeIn {
    -webkit-animation-name: fadeIn;
    animation-name: fadeIn;
}
.animated {
    -webkit-animation-duration: 1s;
    animation-duration: 1s;
    -webkit-animation-fill-mode: both;
    animation-fill-mode: both;
}
.row-fluid {
    text-align: left;
}
#container {
    text-align: left;
}
.modal {
    z-index: 10010!important;
}
.modal-backdrop {
    z-index: 10000;
}
#tabletUserTools {
    top: 8px;
    right: 15px!important;
}

.navbar {
    z-index: 0;
	display: none;
	height: 0px;
}

</style>
{/literal}

</body>

