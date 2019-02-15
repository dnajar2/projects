<div id="top">
    <div id="top_box">
        <div id="top_box_txt">
            <img src="{$_SITE_IMAGES_DEFAULT_}/global/landing/200/top_text.png" />
        </div>
        <div id="video_top">
            <div id="video_box">
                <div id="video_swf"></div>
            </div>
        </div>
        <div class="clear_both"></div>
    </div>
</div>
<div class="clear_both"></div>
<div id="lp_100" style="{if $join_type == "ccjoin"}height:880px;{else}height:680px;{/if}background-image:url({$_SITE_IMAGES_DEFAULT_}/global/landing/100/{$join_type}_body_bg.jpg);">

	{if !$smarty.session.ccjoin.locked_out}
    	<div id="jff">
	        <div id="jff_arrow"><img src="{$_SITE_IMAGES_DEFAULT_}/global/landing/200/jff_arrow.png" /></div>
	    </div>
    {/if}

    <div id="account_info">
        <div id="account_info_form">
		    <div class="form"{if $smarty.session.ccjoin.locked_out} style="padding-top:0px;margin-top:0px;height:330px;"{/if}>
			    <div id="account_form_header">
				    <img id="account_form_header_img" src="{$_SITE_IMAGES_DEFAULT_}/global/landing/100/form_title.png" />
				</div>
		
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
		            <div class="lockout_container_100">{include file="$_THEME/components/members/joinpages/ccjoin/ccjoin_lockout.tpl"}</div>
		        {/if}
			</div>
		</div>
	</div>

    <div id="account_testiments"{if $join_type == "ccjoin"} class="account_testiments_ccjoin_{$smarty.session.ccjoin.step}{if $join_type == "ccjoin" && $smarty.session.ccjoin.locked_out}_locked_out{/if}"{/if}>
        
        <div id="testimonials">
        
            <div id="testiment_1">
                <div class="testiments">"{$blue691950_testiment}"</div>
            </div>
            <div id="testiment_2">
                <div class="testiments">"{$profger3_testiment}"</div>
            </div>
        </div>

    </div>

</div> {if $smarty.const.__IS_DEV_SERVER}<!-- ends <div id="lp_100"> -->{/if}