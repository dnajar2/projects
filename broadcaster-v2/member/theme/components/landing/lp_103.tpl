<div id="lp_103_container">
{assign var="showHorizNavBar" value=true}
{assign var="doNotShowTopLogin" value=true}
{assign var="hide_header" value=false}

{include file="$_THEME/components/header.tpl" branding=$branding  header_join_message=true showHorizNavBar=$showHorizNavBar hideSideBar=true showInactiveMemberMenu=true doNotShowTopLogin=$doNotShowTopLogin loadMemberCSS=true preloadImages=""}
	<div id="page_container">
		<div id="chatbox">
			<div id="chat_title">
				<span id="model_name">{$chat_model.username}</span> <span id="new_chat_request">wants to chat with you!</span>
			</div>
			<div id="chat" style='z-index:0'>
				<div style="clear:both"></div>
				<div id="model_image" style="width:475px; height:355px;" >
					{if $video != "1"}
						<a href='/register.php' onclick='Members.popup_offer_open( -1, 3 ); return false;'>
							<img src="{$model_image}" style="width:475px; height:355px" onerror="this.src = '{$chat_model.large_url}';" />
						</a>
					{else}
						<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="100%" height="100%" id="im_thumb" align="middle">
							<param name="movie" value="{$smarty.const.CDN_SCHEMA}/flashApps/swf/im_thumb.swf" />
							<param name="FlashVars" value="{$flashVars}" />
							<param name="quality" value="high" />
							<param name="bgcolor" value="#ffffff" />
							<param name="play" value="true" />
							<param name="loop" value="true" />
							<param name="wmode" value="transparent" />
							<param name="scale" value="showall" />
							<param name="menu" value="true" />
							<param name="devicefont" value="false" />
							<param name="salign" value="" />
							<param name="allowScriptAccess" value="always" />
						<!--[if !IE]>-->
								<object type="application/x-shockwave-flash" data="{$smarty.const.CDN_SCHEMA}/flashApps/swf/im_thumb.swf" width="100%" height="100%">
									<param name="movie" value="{$smarty.const.CDN_SCHEMA}/flashApps/swf/im_thumb.swf" />
									<param name="FlashVars" value="{$flashVars}" />
									<param name="quality" value="high" />
									<param name="bgcolor" value="#ffffff" />
									<param name="play" value="true" />
									<param name="loop" value="true" />
									<param name="wmode" value="transparent" />
									<param name="scale" value="showall" />
									<param name="menu" value="true" />
									<param name="devicefont" value="false" />
									<param name="salign" value="" />
									<param name="allowScriptAccess" value="always" />
								<!--<![endif]-->
									<a href="http://www.adobe.com/go/getflash">
										<img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" />
									</a>
								<!--[if !IE]>-->
								</object>
						<!--<![endif]-->
						</object>
					{/if}
				</div>
				<div id="online_button"><img id="online_button_flash" style="width:100%; height:auto;" src="{$_PATH_IMG}/global/online.png"></div>
				<div id="chat_text_area"></div>
				<div id="typing_container">
					<div id="typing">{$chat_model.username} typing...</div>
				</div>
				<div id="text_input">
					<input id="user_input" type="text" class="form_input" name="input_text" style="width:360px;height:26px;" value="" onkeydown="if (event.keyCode == 13){literal}{ Members.popup_offer_open( -1, 3 ); return false; }{/literal}">
				</div>
				<button id="send_button" class="form_submit_button" type="button" onclick="Members.popup_offer_open( -1, 3 ); return false;" >Send</button>
				<a href='/register.php' onclick='Members.popup_offer_open( -1, 3 ); return false;'>
					<div class="button2" style="width:49% !important; margin-left:9px; margin-top:30px; height:30px; padding-top: 8px; font-size: 20px; background-position: center;"><div class="button_txt">SEE HER PRIVATE ROOM!</div></div>
				</a>
				<div style="clear:both"></div>
			</div>
		</div>
		<div style="clear:both"></div>
		<div id="other_girls_title">
			Other girls online now
		</div>
		<div id="other_girls_container">
			{foreach from=$landingPageModels item="model"}
				<div class="other_model">
					<a href="/register.php" onclick='Members.popup_offer_open( -1, 3 ); return false;' title="{$model.username}">
					<div><img src="{$model.thumb_url}"></div>
					</a>
					<!--<div style="margin-top:2px;"><img style="width:100%;height:auto;" src="{$_PATH_IMG}/global/online.png"></div>-->
					{if ($model.online and ($model.in_pvt || $model.inGoalShow))}
					<img src="{$_PATH_IMG}/global/inshow.png" class="modelsgrid_badge" />
					{elseif $model.online && $model.inGoalShowPreShow}
					<img src="{$_PATH_IMG}/global/goalShow.png" class="modelsgrid_badge" />
					{elseif $model.online}
					<img src="{$_PATH_IMG}/global/online.png" class="modelsgrid_badge" />
					{else}
					<img src="{$_PATH_IMG}/global/offline.png" class="modelsgrid_badge" />
					{/if}
				</div>
			{/foreach}
			<div style="clear:both"></div>
		</div>
	</div>
</div>
{if $site_meta_data.wl_bodytext}
	<div id="wl_container">
	</div>
{/if}
