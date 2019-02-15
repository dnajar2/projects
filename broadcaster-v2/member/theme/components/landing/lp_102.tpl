<div id="header">
    <div class="header_child">
        <img src="/images/whitelabels/img.php?g={$whitelabel_images.logo.guid}" border="0" />
    
    	<div id="counter_container_102">
    		<div id="counter_text_102">This is a limited-time-only offer...</div>
    		<div id="counter_inner_container_102">
    			<div id="counter_102"></div>
    		</div>
    	</div>
    	
    </div>
</div>
<div class="clear_both"></div>

	<div class="top_bar_102">
		<div class="top_bar_inner_102">
			<img class="top_text_102" alt="Hookup with a girl online for free!" src="{$whitelabel_settings.lp_image_path}/top_text.png" />
			<div class="jff_img_container_102">
				<img class="jff_img_102" alt="Join for Free!" src="{$whitelabel_settings.lp_image_path}/jff_arrow.png" />
			</div>
		</div>
	</div>

<div id="override_102" style="{if $join_type == "ccjoin"}height:980px;{else}height:730px;{/if}">
		
	<div class="content_102">
		<div class="left_panel_102">
			<div class="left_panel_child1_102">
				<div class="left_panel_text_102 txt"></div>
				<div class="swf_container_102">
					<div id="swf_container_id_102"></div>
				</div>
			</div>
		</div>
		
		<div class="right_panel_102">
    		<div class="form">
    			<div class="account_title_102">
    				<img class="account_title_image_102" alt="Account Information" src="{$whitelabel_settings.lp_image_path}/form_title.png" />
    			</div>
    			{if $join_type == "default"}
        		<div id="account_form_header">
        			<img id="account_form_header_img" src="{$whitelabel_settings.lp_image_path}/form_graphic.png" />
        		</div>
        		{/if}
                <div id="account_info_form_fields" class="form_fields_102">
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
                </div>
            </div>
		</div>
        {if $join_type == "ccjoin"}
			<div class="account_note_102">
				*There is no charge to take advantage of this offer and get your free private room time. We simply need to verify you're 18 years of age by validating your credit card information.
			</div>
		{/if}
		<div id="lp102_safety_img">
		    <img id="safe_secure_private{if $join_type == "ccjoin"}_ccjoin{/if}" alt="SAFE SECURE AND PRIVATE" src="{$whitelabel_settings.lp_image_path}/text.jpg" />
		</div>
    	<div class="shadow_testimonial_container_102">
    		<div class="shadow_102"></div>
    		<div class="testimonial_container_102">
    			<div class="left_testimonials_102">
    				"I appreciate the customer service that WebCamClub provides, you are all very helpful with more than just the basics.  It is very refreshing to be able to speak to a live person rather than an automated machine.  WebCamClub is the best adult site on the Internet.  My favorite model is such a pleasure.  I just love this site!"
    			</div>
    			<div class="right_testimonials_102">
    				"WebCamClub is such a pleasure, the models I have seen have been wonderful.  The customer service is great, they are always there when I need them.  Over all, this site is a lot of fun."
    			</div>
    		</div>
    	</div>
	</div>
</div>
<div class="clear_both"></div>
