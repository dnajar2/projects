<div id="join_default" style="margin-bottom:250px;">
   <div id="join_bkgrnd_top">
        <img src="{$_SITE_IMAGES_DEFAULT_}/global/landing/104/i{$girl_photo_id}/default_top_gid2.png" />
    </div>
    <div class="clear_both"></div>
    <div id="join_bkgrnd" style="background-image: url({$_SITE_IMAGES_DEFAULT_}/global/landing/104/i{$girl_photo_id}/default_middle_gid2.jpg);">
    	<div id="text-wrapper" style="width: 446px;float: right;left: -35px;position: relative;background-color: white;opacity: 0.9; border:1px solid grey; border-radius:10px; box-shadow:3px 3px 5px #888888;">
        <div style="clear: both;position: relative;float: right;width: 446px;height: 158px;text-align: center;padding-top: 20px;">
           	<img src="{$_SITE_IMAGES_DEFAULT_}/global/joinpages/top_text.png" />
        </div>
       <div class="clear_both"></div>
        <div id="join_form_div" style="position:relative;padding:0px;width:446px;">
    		<div class="form" style="width:426px;margin-left:10px;">
    			<div class="bar2" style="width:416px;clear:both;float:left;margin-bottom:10px;padding-bottom:10px;">
    				<div class="txt1" style="padding-left:5px;font-size:16px;"> Start Chatting in Less Than 60 Seconds! </div>
    			</div>

				<div data-module-box="true">
                	{include file="$_THEME/components/members/joinpages/form_fields.tpl" exit_pop_joinpage=$exit_pop_joinpage}
                </div>
            </div>
        </div>
        </div> {if $smarty.const.__IS_DEV_SERVER}<!-- ends <div id="text-wrapper"> -->{/if}
    </div>
    <div class="clear_both"></div>
    <div id="join_bkgrnd_bottom">
        <img src="{$_SITE_IMAGES_DEFAULT_}/global/landing/104/i{$girl_photo_id}/default_bottom_gid2.png" />
    </div>
    
</div>
<div class="clear_both"></div>