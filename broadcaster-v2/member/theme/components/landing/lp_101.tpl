{if $step == 1}
	<div id="override">
		<div id="page_container">
			<img id="logo" src="{$whitelabel_settings.lp_image_path}/logo.png" />
			<div id="slides_container">
				<div id="slide_view">
					<div id="slide_data">
						<div id="slide_headline_img_container">
							<img id="slide_headline_img" class="slide_txt_img" src="{$whitelabel_settings.lp_image_path}/slides/slide_txt_header1.png" />
						</div>
						<div id="slide_text_container" class="slide_txt txt">Get interactive with our performers and express yourself and the things you like to do in private.  Don't be shy these girls know how to put on a show and aim to please!</div>
					</div>
					<a id="slide_join_button" href="?skin=101&register=yes" class="slide_join_button button2">Get interactive with a free account&nbsp;&nbsp;&#9658;</a>
					<div id="red_band">&nbsp;</div>
				</div>
			</div>
			<div id="button_container">
				<ul id="slides_nav_buttons">
					<li id="slide_button1" class="slide_button slide_button_active" onclick="slide_to(1, 1)">&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li id="slide_button2" class="slide_button slide_button_inactive" onclick="slide_to(2, 1)">&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li id="slide_button3" class="slide_button slide_button_inactive" onclick="slide_to(3, 1)">&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li id="slide_button4" class="slide_button slide_button_inactive" onclick="slide_to(4, 1)">&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li id="slide_button5" class="slide_button slide_button_inactive" onclick="slide_to(5, 1)">&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ul>
			</div>
			<div id="bottom_half">
				<div id="badge_info_link">
					<div id="upper_hr" class="custom_hr"></div>
					<img id="badge" src="{$whitelabel_settings.lp_image_path}/badge.png" />
					<span id="info" class="txt">How it works?  Create your account for FREE now, browse thousands of women live, use our advanced search to find your favorite model and get unlimited access to all chatrooms for FREE... and because we are certain that you're gonna love it, we give you a $20 credit to use as you wish on <span id="info_bold_sitename">{$whitelabel_settings.copyright_name}</span></span>
					<img id="info_shadow" src="{$whitelabel_settings.lp_image_path}/vertical_s.png" />
					<a href="?skin=101&register=yes" id="join_link" class="button2">Sign up for FREE&nbsp;&nbsp;&#9658;</a>
					<div id="lower_hr" class="custom_hr"></div>
				</div>
				<div class="clear_both"></div>
				<div id="statements">
					<div id="statements_title">SAFE, SECURE, PRIVATE</div>
					<div id="what_you_get_title">WHAT YOU GET</div>
					<div class="clear_both"></div>
					<div id="safe_secure_private">
						<div id="safe">
							<p id="safe_title" class="titles">{$whitelabel_settings.copyright_name} is completely safe</p>
							<p id="safe_text" class="txt">No one has access to your information other than our trained staff. And we will not sell, trade, or give your information out to third parties.</p>
						</div>
						<div id="secure">
							<p id="secure_title" class="titles">{$whitelabel_settings.copyright_name} is 100% secure</p>
							<p id="secure_text" class="txt">All transactions are encrypted from your computer directly to our credit card processing partner sites and are guaranteed 100% secure.</p>
						</div>
						<div id="private">
							<p id="private_title" class="titles">Our commitment to your privacy</p>
							<p id="private_text" class="txt">to respect your privacy, all memberships are billed very discreetly.  The website name or the content of the website will not be mentioned on your credit card statement.</p>
						</div>
					</div>
					<div id="what_you_get">
						<ul id="what_you_get_list">
							<li>Real Amateurs &amp; Pornstars Live</li>
							<li>Direct and Control your Private show Live</li>
							<li>Unlimited Chat Access</li>
							<li>Uncensored Photos &amp; Videos</li>
							<li>Send &amp; Receive Private Messages</li>
							<li>Get Online Notifications</li>
							<li>Cam-toCam virtual Sex Experience</li>
							<li>Discounts &amp; Special Promotions</li>
							<li>Outstanding Customer Support</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="clear_both"></div>
		</div>
	</div>
{else}
	<div id="override">
		<div id="logo_container">
			<img id="logo2" src="{$whitelabel_settings.lp_image_path}/logo.png" />
		</div>
		<div id="form_container">
			<img id="free_ribbon" src="{$whitelabel_settings.lp_image_path}/step2_red_band-small.png" />
			<div id="left_panel">
				<img id="five_for_free" src="{$whitelabel_settings.lp_image_path}/5_minutes_for_free.png" />
				<div id="upper_hr2" class="custom_hr"></div>
				<p id="step2_info" class="txt step2_info" style="padding-left:30px;">
					Get interactive with our performers and express yourself and the things you like to do in private.  Don't be shy these girls know how to put on a show and aim to please!
				</p>
				<div id="lower_hr2" class="custom_hr"></div>
				<div id="safe_secure_private2" class="txt titles2">
					SAFE, SECURE, PRIVATE
				</div>
				<ul id="safe_secure_private_list2">
					<li>
						<div id="safe_title2" class="footer_title titles2">{$whitelabel_settings.copyright_name} is completely safe</div>
						<p class="txt step2_info">
							No one has access to your information other than our trained staff.  And we will not sell, trade, or give your information out to third parties.
						</p>
					</li>
					<li>
						<div id="secure_title2" class="footer_title titles2">{$whitelabel_settings.copyright_name} is 100% secure</div>
						<p class="txt step2_info">
							All transactions are encrypted from your computer directly to our credit card processing partner sites and are guaranteed 100% secure.
						</p>
					</li>
					<li>
						<div id="private_title2" class="footer_title titles2">Our commitment to your privacy</div>
						<p class="txt step2_info">
							To respect your privacy, all memberships are billed very discreetly. The website name or the content of the website will not be mentioned on your credit card statement.
						</p>
					</li>
				</ul>
			</div>
			<div id="right_panel">
				<div id="account_info">
			        <div id="account_info_form" style="{if $smarty.session.ccjoin.locked_out}padding-top:0px;margin-top:0px;height:630px;{elseif $join_type == "ccjoin"}min-height:630px;{else}min-height:370px;{/if}">
			            <div class="form"{if $smarty.session.ccjoin.locked_out} style="padding-top:0px;margin-top:0px;height:330px;"{/if}>
			        	    <div id="account_form_header">
			        		    <img id="account_form_header_img" src="{$whitelabel_settings.lp_image_path}/form_title.png" />
			        		</div>
			        		{if $join_type == "default"}
			        		<div id="account_form_header_img">
			        			<img id="account_form_header_img" src="{$whitelabel_settings.lp_image_path}/girl_arrow446.png" style="width:425px;margin-bottom:5px;" />
			        		</div>
			        		{/if}
			                {if !$smarty.session.ccjoin.locked_out}
			                    <div id="account_info_form_fields">
			                        {if $join_type == "default"}
			                        	{include file="$_THEME/components/members/joinpages/form_fields.tpl"}
			                        {elseif $smarty.session.ccjoin.step == 1}
			                        {include file="$_THEME/components/members/joinpages/ccjoin/ccjoin1_fields.tpl" ccjoin_fields_only=true}
			                        {else}
			                        {include file="$_THEME/components/members/joinpages/ccjoin/ccjoin2_fields.tpl" ccjoin_fields_only=true}
			                        {/if}
			                    </div>
			                {else}
			                    <div class="lockout_container_101">{include file="$_THEME/components/members/joinpages/ccjoin/ccjoin_lockout.tpl"}</div>
			                {/if}
			                <div class="clear_both"></div>
			        	</div>
			        </div>
			    </div>
			</div>
			<div class="clear_both"></div>
		</div>
	</div>
{/if}
	<div class="clear_both"></div>
