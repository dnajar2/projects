{include file="$_THEME/components/html_header.tpl" show=$show}
<body>
	{include file="$_THEME/components/header.tpl" show=$show}
    <div id="header_margin" class="navbar-inverse hidden-xs">
        <div id="header_title_container" class="header_title">
            <div class="title">My Account</div>
        </div>
    </div>
	<div id="loggedInContent">
		<div id="container_bg">
			<div id="app_container" style="opacity:0;{if $dating_ad_zone}margin-top:0px;padding-top:0px;{/if}">
			<script type="text/javascript">
			var useCompressed = true;
			var ldfldr = "js";
			var lddr = "members";
			var cb = '{$CacheBuster->getFileRevision(false)}';
			var member_id = '{$member_id}';
			var member_username = '{$member_username}';
			var session_id = '{$session_id}';
			var session_name = '{$session_name}';
			var dating_ad_zone_height = 0;
			var IS_DEV_SERVER = '{$smarty.const.__IS_DEV_SERVER}';
			var IS_STAGING = '{$smarty.const.__IS_STAGING}';
			var local_debug = '{$smarty.const.__LOCAL_DEBUG}';
			var canResizeLoader = true;
			var fullyLoaded = false;
			</script>

			{literal}
			<script type="text/javascript">
			console.log("mbr videos init getCurTime " + getCurLoadTime());

			var globalURI = "../..";
			var CDN_SCHEMA = globalURI;
			var fileref;
			var filesadded = "";
			var $window = $(window);
			var windowWidth;
			var windowHeight;
			var intMenuOpen = false;
			var animated = false;
			var fileCnt = 0;
			var useConverter = true;
			var usePS = true;
			var hasFlash = false;
			var version = cb;
			var curTimeStamp;
			var swfURI = "https://cdn.webcamclub.com/";
			var isIntegratedChat = false;

			if ( IS_DEV_SERVER || IS_STAGING ) {
				swfURI = "../../";
				CDN_SCHEMA = "../..";

				//ldfldr = "flashApps";
				//lddr = "js";
				//useCompressed = false;
			}

			console.log("globalURI " + globalURI );
			console.log("useCompressed " + useCompressed );
			console.log("ldfldr " + ldfldr );
			//console.log("local_debug " + local_debug );

			var MbrVideos = {
				loadjscssfile : function ( filename, filetype, callback ) {
					try {
						if ( filetype == "js" ) {
							fileref = document.createElement('script' );
							fileref.setAttribute( "type","text/javascript" );
							fileref.setAttribute( "src", filename );
							fileref.addEventListener( "load", callback );
						}
						else if ( filetype=="css" ) {
							fileref = document.createElement( "link" );
							fileref.setAttribute( "rel", "stylesheet");
							fileref.setAttribute( "type", "text/css");
							fileref.setAttribute( "href", filename );
							fileref.addEventListener( "load", callback );
						}

						if ( typeof fileref != "undefined" )
							document.getElementsByTagName("head")[0].appendChild( fileref );
					}
					catch ( e ) {
						console.log("loadjscssfile error: " + e.toString() );
					}
				},

				checkloadjscssfile: function ( filename, filetype ) {
					try {
						if ( filesadded.indexOf("["+filename+"]") == -1 ) {
							MbrVideos.loadjscssfile( filename, filetype, function() {
								 filesadded += "["+filename+"]";
								 fileCnt++

								 fileCntTxt = fileCnt * 5;
								 if ( fileCntTxt >=  100 )
									 fileCntTxt = 100;

								 if ( filename.indexOf("ext-all.js") != -1 ) {
									 console.log ( "ext-all.js is fully loaded");

									 if ( !useCompressed ) {
										console.log ( "loading mbr_videosUtils...");
										MbrVideos.checkloadjscssfile( "{/literal}{$smarty.const.CDN_SCHEMA}/"+ldfldr+"/"+lddr+"/app/mbr_videos/mbr_videosUtils.js{$CacheBuster->getFileRevision()}{literal}", "js");
									 }
									 else {
									 	console.log ( "loading mbr_videosVars.min...");
										MbrVideos.checkloadjscssfile( "{/literal}{$smarty.const.CDN_SCHEMA}/"+ldfldr+"/"+lddr+"/app/mbr_videos/mbr_videosVars.min.js{$CacheBuster->getFileRevision()}{literal}", "js");
									 }
								 }
								 if ( filename.indexOf("mbr_videosUtils.js") != -1 ) {
									 console.log ( "mbr_videosUtils is fully loaded");
									 MbrVideos.checkloadjscssfile( "{/literal}{$smarty.const.CDN_SCHEMA}/"+ldfldr+"/"+lddr+"/app/mbr_videos/mbr_videosVars.js{$CacheBuster->getFileRevision()}{literal}", "js");
								 }
								 if ( filename.indexOf("mbr_videosVars.js") != -1 ) {
									 console.log ( "mbr_videosVars is fully loaded init app");
									 MbrVideos.checkloadjscssfile( "{/literal}{$smarty.const.CDN_SCHEMA}/"+ldfldr+"/"+lddr+"/app/mbr_videos/mbr_videosRemoting.js{$CacheBuster->getFileRevision()}{literal}", "js");
								 }
								 if ( filename.indexOf("mbr_videosRemoting.js") != -1 ) {
									 console.log ( "mbr_videosRemoting is fully loaded init app");
									 MbrVideos.checkloadjscssfile( "{/literal}{$smarty.const.CDN_SCHEMA}/"+ldfldr+"/"+lddr+"/app/mbr_videos/mbr_videos_app.js{$CacheBuster->getFileRevision()}{literal}", "js");
								 }
								 if ( filename.indexOf("mbr_videos_app.js") != -1 || filename.indexOf("mbr_videosVars.min.js") != -1 ) {
									 console.log ( "mbr_videos_app.js or mbr_videosVars.min is fully loaded ");
									 if ( Modernizr.flash ) {
										 hasFlash = true;
									 }
									 else {
										 /*Modernizr only detects if Flash is installed so check for hasFlashPotential*/
										 detectFlash();
									 }
									 console.log("hasFlash " + hasFlash);
								 }
							});
						}
						else {
							console.log("file already added!");
						}
					}
					catch ( e ) {
						console.log("checkloadjscssfile error: " + e.toString() );
					}
				},

				removejscssfile: function (filename, filetype) {
					var targetelement = ( filetype == "js" )? "script" : ( filetype == "css" )? "link" : "none"
					var targetattr=(filetype=="js")? "src" : ( filetype == "css" ) ? "href" : "none"
					var allsuspects = document.getElementsByTagName( targetelement )
					for ( var i = allsuspects.length; i >= 0; i-- ) {
						if ( allsuspects[i] && allsuspects[i].getAttribute( targetattr )!= null && allsuspects[i].getAttribute( targetattr ).indexOf( filename )!=-1 )
							allsuspects[i].parentNode.removeChild( allsuspects[i] )
					}
					i = null;
				},
			};

			//check to see if we have loaded the EXTJS Framework already.
			if ( typeof Ext != "undefined" ) {
				console.log("Ext NOT null");

				if ( !useCompressed ) {
					console.log ( "loading mbr_videosUtils...");
					MbrVideos.checkloadjscssfile( "{/literal}{$smarty.const.CDN_SCHEMA}/"+ldfldr+"/"+lddr+"/app/mbr_videos/mbr_videosUtils.js{$CacheBuster->getFileRevision()}{literal}", "js");
					MbrVideos.checkloadjscssfile( "{/literal}{$smarty.const.CDN_SCHEMA}/"+ldfldr+"/"+lddr+"/app/view/Fxt.js{$CacheBuster->getFileRevision()}{literal}", "js");
					MbrVideos.checkloadjscssfile( "{/literal}{$smarty.const.CDN_SCHEMA}/"+ldfldr+"/"+lddr+"/app/view/binary.js{$CacheBuster->getFileRevision()}{literal}", "js");
					MbrVideos.checkloadjscssfile( "{/literal}{$smarty.const.CDN_SCHEMA}/"+ldfldr+"/"+lddr+"/app/mbr_videos/mbr_videosAlert.js{$CacheBuster->getFileRevision()}{literal}", "js");
					MbrVideos.checkloadjscssfile( "{/literal}{$smarty.const.CDN_SCHEMA}/"+ldfldr+"/"+lddr+"/app/mbr_videos/mbr_videosResize.js{$CacheBuster->getFileRevision()}{literal}", "js");
					MbrVideos.checkloadjscssfile( "{/literal}{$smarty.const.CDN_SCHEMA}/"+ldfldr+"/"+lddr+"/app/mbr_videos/mbr_videosVideoPlayer.js{$CacheBuster->getFileRevision()}{literal}", "js");
					MbrVideos.checkloadjscssfile( "{/literal}{$smarty.const.CDN_SCHEMA}/"+ldfldr+"/"+lddr+"/app/mbr_videos/mbr_videosLoadModels.js{$CacheBuster->getFileRevision()}{literal}", "js");
				}
			    else {
					console.log ( "loading mbr_videosVars.min...");
					MbrVideos.checkloadjscssfile( "{/literal}{$smarty.const.CDN_SCHEMA}/"+ldfldr+"/"+lddr+"/app/mbr_videos/mbr_videosVars.min.js{$CacheBuster->getFileRevision()}{literal}", "js");
				}
			}
			else {
				console.log("Ext WAS null loading ext-all now...");
				MbrVideos.checkloadjscssfile( "{/literal}{$smarty.const.CDN_SCHEMA}/js/ext/42/ext-all.js{$CacheBuster->getFileRevision()}{literal}", "js");
				MbrVideos.checkloadjscssfile( "{/literal}{$smarty.const.CDN_SCHEMA}/js/ext/42/resources/ext-theme-classic/ext-theme-classic-all.css{$CacheBuster->getFileRevision()}{literal}", "css");
			}

			function getCurLoadTime() {
				var now = new Date();
				var startTime = Math.round( now.getTime()/1000 );
				var str = now.getHours() + ":";
				var mins = now.getMinutes();
				str += ( mins >= 10 ) ? mins : "0" + mins;
				var myChatTimestamp = startTime;
				return myChatTimestamp;
			};

			function doLoaderResize() {
				if ( canResizeLoader ) {
					if ( document.getElementById("chat_swf_parent") != null ) {
						//console.log("window.innerHeight " + window.innerHeight);
						if ( parseFloat( window.innerWidth ) < 740 || parseFloat( window.innerHeight ) < 740 ) {
							document.getElementById("chat_swf_parent").style.height = parseFloat( window.innerHeight ) + "px";
						}
						else {
							document.getElementById("chat_swf_parent").style.height = parseFloat( window.innerHeight ) - 350 + "px";
						}

						if ( document.getElementById("chat_swf_waiting_loader") != null ) {
							document.getElementById("chat_swf_waiting").style.top = parseFloat( document.getElementById("chat_swf_parent").style.height ) / 2 + "px";
							document.getElementById("chat_swf_waiting_loader").style.left = parseFloat( window.innerWidth ) / 2 - 50 + "px";

							if ( !fullyLoaded )
								document.getElementById("chat_swf_waiting").style.opacity = 1;

							if ( parseFloat( window.innerWidth ) < 740 ) {
								document.getElementById("chat_swf_waiting_loader").style.left = parseFloat( window.innerWidth ) / 2 - 30 + "px";
								document.getElementById("chat_swf_waiting").style.top = parseFloat( window.innerHeight ) / 2 - 50 + "px";
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

        <div id="chat_swf_parent" style="position: relative; width:100%;height:753px; margin:0 auto; margin-top:{$chat_swf_parent_top_margin};">
            <div id="chat_swf" class="chat_swf" style="width:100%; height:100%; background:none; border:none;">
            <div id="apDiv2" style="width:100%; height:100%;"></div>
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
	font-weight: 400;
	font-family: 'Lato' !important;
	font-size: 16px;
	width: 85px;
	height: 78px;
    background-image: none;
    background-repeat: no-repeat;
	padding-left: 18px;
	background-position-y: 4px;
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
.x-panel-default {
    border-color: #CCCCCC!important;
}
.x-panel-body-default {
    border-color: #CCCCCC!important;
}
#header_margin.navbar-inverse {
    margin-top: 5px!important;
}
.header_title {
    margin-left:16px;
	height:30px;
}
.title {
    font-size: 16px!important;
}
label {
    font-weight: normal!important;
}
.goog-te-banner-frame.skiptranslate {
	top:-40px !important;
}

</style>
{/literal}

{include file="$_THEME/components/footer.tpl" show=$show}

<!-- Placed at the end of the document so the pages load faster -->
{include file="$_THEME/components/css.tpl" show=$show}

</body>

{include file="$_THEME/components/html_footer.tpl" show=$show}
