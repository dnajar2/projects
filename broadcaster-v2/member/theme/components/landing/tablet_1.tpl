<div id="tablet_container">
	<div id="tablet_content">
		<div id="top_text">
			<div id="device_notice_text">WebCamClub is currently not available on this device. Please use PC or Mac.</div>

			<div id="get_notified_text">
				 <div class="{if $form_submit_msg}{$form_submit_msg_type} msg_show{else}msg_hide{/if}" id="form_submit_msg">
	                <div class="msg_text" id="id_uname_msg_text">{$form_submit_msg}</div>
	                <div class="clear_both"></div>
	            </div>
				<div id="default_msg" {if $form_submit_msg}style="display: none;"{/if}>Get notified when it's ready</div>
				
				<div class="clear_both"></div>
			</div>
			
			<div id="email_entry_container">
				<form method="post" accept-charset="UTF-8">
					<input type="hidden" name="tablet" value="1" />
					<input id="email_input" name="email" type="text" value="Enter your email address" onfocus="email_onfocus(this)" onblur="email_onblur(this)" />
					<input id="email_submit" class="button" type="submit" value="Submit" onclick="return submit_check()"/>
				</form>
			</div>
			
			<div id="offer_notice">THE FOLLOWING OFFER MIGHT BE EXPIRING SOON, CHECK IT OUT TODAY! IT WON'T HURT YOU, WE PROMISE.</div>
		</div>	
		<div id="iframe_container">
			<iframe id='a0386328' name='a0386328' src='http://datingadzone.com/ads3/www/delivery/afr.php?zoneid=304&amp;target=_top&amp;cb=INSERT_RANDOM_NUMBER_HERE' frameborder='0' scrolling='no' width='500' height='400'><a href='http://datingadzone.com/ads3/www/delivery/ck.php?n=a4aeeaa3&amp;cb=INSERT_RANDOM_NUMBER_HERE' target='_top'><img src='http://datingadzone.com/ads3/www/delivery/avw.php?zoneid=304&amp;cb=INSERT_RANDOM_NUMBER_HERE&amp;n=a4aeeaa3' border='0' alt='' /></a></iframe>
		</div>
		<div id="nothanks">
			<a href="http://www.adsforsex.com/?ainfo=MzI4NTh8MjI2fDIyMDY=&skin=139&i=7">
				<img alt="No Thanks" src="{$nothanks_path}" />
			</a>
		</div>
	</div>
	<div class="clear_both"></div>
</div>
<div class="clear_both"></div>