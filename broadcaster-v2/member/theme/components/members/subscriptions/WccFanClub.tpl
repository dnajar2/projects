{if $can_join_fanclub}
    
    
    <div class="clear_both"></div>
    <div class="ashow_section subscription-container" id="subscription_{$subscription_id}">
    	<div id="subscription_response_{$subscription_id}" style="display: none;" class="ashow_notice subscription-response-message">
	    	<div class="ashow_sub_form_message subscription-response-sub-message info_box msg_show">
	    		<div class="msg_text subscription-response-message-txt" style="line-height:125%;"></div>
	    	    <div class="clear_both"></div>
	        </div>
	    </div>
	    {if $is_popup}
	    <div class="" style="float:left;clear:none;width:175px;">
    	    <div class="fanclub_ashow_model_photo">
                {include file="$_THEME/components/modelsgridcell.tpl" model=$model
                                                                      photo_url_key="photo_small_mid_url"
                                                                      mbox_class="mbox_smallmid"
                                                                      mboxtxt_class="mboxtxt_smallmid"
                                                                      minfo_bar_class="minfo_bar_smallmid"
                                                                      models_height=160
                                                                      mphoto_no_hover=true
                                                                      no_action=true
                                                                      hide_status=true
                                                                      hide_metadata=treu
                                                                      trim_username_length=18}
    	    </div>
	    </div>
	    {/if}
	    <div class="subscription-content" style="float: left;width:525px;">
	        {if $is_popup}
    		<div class="ashow_note txt subscription-note" style="font-weight:bold;font-size:14px;">Save on your private shows with this model along with other great savings!</div>
    		{else}
    		<div class="ashow_title subscription-title">Join my fan club and save!</div>
    		<div class="ashow_note txt subscription-note">Start saving on your private shows with this model along with other great savings.</div>
    		{/if}
    		<br />
    	
    		<div class="fanclub-saving-icon subscription-middle-content">
    			<div class="fanclub-money-icon">
    				<img src="{$_SITE_IMAGES_DEFAULT_}/global/fanclub_icon.png" />
    			</div>
    			<div class="fanclub-saving-content">
    			{if $package_details}
    			    {foreach from=$package_details key="k" item="package"}
    				<p>
    					<span class="check-img">
    						<img src="{$_SITE_IMAGES_DEFAULT_}/global/checkmark.png" />
    					</span>
    					<span class="check-text">{$package.display_label}</span>
    					<div class="clear_both"></div>
    				</p>
    			    {/foreach}
    			{/if}
    			</div>
    		</div>
    		
    		<div class="ashow_tip_btns hide-it subscription-btns">
    			<div class="button2 ashow_tip_btn hide-it subscription-btn form_submit_button" id="subscription_button_{$subscription_id}" style="margin-left: 30%; width: 200px;" onClick="Members.offer_subscribe( '{$subscription_params}' ); return false;">Join My Fan Club</div>
    			<div class="clear_both"></div>
    		</div>
    		<br /><br />
    	</div>
		{if $show_bottom_notice}
		<div style="float:left;clear:both;">
		<div class="subscription-content-note hide-it" style="font-size: 11px; margin-top: 10px;">{$subscription_note_txt}</div>
		</div>
		{/if}
		<div class="clear_both"></div>
    	</div>
    <div class="clear_both"></div>
{else}
	{if $is_subscribed}
	<div align="center" style="padding-top:60px;height:55px;">
		You already belong to <b>{$model_username}</b>'s fan club
	</div>
	{/if}
{/if}