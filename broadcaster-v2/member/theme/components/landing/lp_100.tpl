<div id="lp100_top">
    <div id="lp100_top_box">
        <div id="lp100_top_box_txt">
            <img src="{$whitelabel_settings.lp_image_path}/{$join_type}_top_text.png" />
        </div>
        <div id="lp100_video_top">
            <div id="lp100_video_box">
                <div id="lp100_video_swf"></div>
            </div>
        </div>
        <div class="clear_both"></div>
    </div>
</div>
<div class="clear_both"></div>
<div id="lp100" style="{if $join_type == "ccjoin"}height:980px;{else}height:730px;{/if}background-image:url({$whitelabel_settings.lp_image_path}/{$join_type}_body_bg.jpg);">

	{if !$smarty.session.ccjoin.locked_out}
    	<div id="jff">
	        <div id="jff_arrow"><img src="{$whitelabel_settings.lp_image_path}/jff_arrow.png" /></div>
	    </div>
    {/if}

    <div id="lp100_account_info">
        <div id="lp100_account_info_form">
		    <div class="form"{if $smarty.session.ccjoin.locked_out} style="padding-top:0px;margin-top:0px;height:330px;"{/if}>
			    <div id="lp100_account_form_header">
				    <img id="lp100_account_form_header_img" src="{$whitelabel_settings.lp_image_path}/form_title.png" />
				</div>
		
				{if !$smarty.session.ccjoin.locked_out}
		            <div id="lp100_account_info_form_fields">
		                {if $join_type == "default"}
		                	{include file="$_THEME/components/members/joinpages/form_fields.tpl"}
		                {elseif $smarty.session.ccjoin.step == 1}
		                    {include file="$_THEME/components/members/joinpages/ccjoin/ccjoin1_fields.tpl" ccjoin_fields_only=true}
		                {else}
		                    {include file="$_THEME/components/members/joinpages/ccjoin/ccjoin2_fields.tpl" ccjoin_fields_only=true}
		                {/if}
		            </div>
		        {else}
		            <div class="lp100_lockout_container">{include file="$_THEME/components/members/joinpages/ccjoin/ccjoin_lockout.tpl"}</div>
		        {/if}
			</div>
		</div>
	</div>

    <div id="lp100_account_testiments"{if $join_type == "ccjoin"} class="lp100_account_testiments_ccjoin_{$smarty.session.ccjoin.step}{if $join_type == "ccjoin" && $smarty.session.ccjoin.locked_out}_locked_out{/if}"{/if}>
        
        <div id="lp100_testimonials">
        
            <div id="lp100_testiment_1">
                <div class="lp100_testiments">"{$blue691950_testiment}"</div>
            </div>
            <div id="lp100_testiment_2">
                <div class="lp100_testiments">"{$profger3_testiment}"</div>
            </div>
        </div>

    </div>

</div> {if $smarty.const.__IS_DEV_SERVER}<!-- ends <div id="lp_100"> -->{/if}
<div class="clear_both"></div>