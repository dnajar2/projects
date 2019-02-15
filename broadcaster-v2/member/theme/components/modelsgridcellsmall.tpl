{* $photo_url_key : the key name in the $models[#] array of the image to be displayed *}
{if !$photo_url_key}
    {assign var="photo_url_key" value="small_url"}
{/if}
{if !$photo_url_key_small}
    {assign var="photo_url_key_small" value="small_url"}
{/if}
{* $mbox_class : can either be one of the defined classes from the modelsgrid.css template or a custom css class (note: width should coincide with the photo width) *}
{if !$mbox_class}
    {assign var="mbox_class" value="mbox"}
{/if}
{* $mboxtxt_class : can either be one of the defined classes from the modelsgrid.css template or a custom css class (note: width should coincide with the photo width) *}
{if !$mboxtxt_class}
    {assign var="mboxtxt_class" value="mboxtxt"}
{/if}
{* $minfo_bar_class : can either be one of the defined classes from the modelsgrid.css template or a custom css class (note: width should coincide with the photo width) *}
{if !$minfo_bar_class}
    {assign var="minfo_bar_class" value="minfo_bar"}
{/if}
{* $models_height : overrides the height of the models div; needed if the description is not displayed *}
{if !$models_height}
{/if}
{* $models_height : overrides the height of the models div; needed if the description is not displayed *}
{if !$trim_username_length}
    {assign var="trim_username_length" value="18"}
{/if}

<div id="id_model_{$model.id}" class="model-img-holder">
    {if !$hide_username}
        <div class="model-name" title="{$model.username}">{$model.username|truncate:$trim_username_length:" ...":false:false}</div>
    {/if}
    <div {if $photo_id} id="{$photo_id}"{elseif $model.photo_id} id="{$model.photo_id}"{/if} {if !$mphoto_no_hover}title="{$model.username}"{/if}>
        {if !$no_action}<a{if $model.action_id} id="{$model.action_id}"{/if} href="{$model.action_url}{if $catid}&catid={$catid}{/if}"{if $model.onclick} onclick="{$model.onclick}"{/if}{if $model.action_rel} rel="{$model.action_rel}"{/if}{if $model.action_title} title="{$model.action_title}"{/if}>{/if}
            <img src="{$model[$photo_url_key_small]}" alt="{$model.img_alt}" border="0"{if $do_mouseover} onMouseOver="{$mouseover_handler}( '{$mouseover_data}' );"{/if}{if $do_mouseout} onMouseOut="{$mouseout_handler}( '{$mouseout_data}', event );"{/if} />
            {if $model.newModel}
                <div class="new_model">
                    <div>NEW</div>
                </div>
            {/if}
            {if !$hide_status}
                <div class="{if $custom_status} custom_status_box {/if}{$mbox_class}{if !$model.online && !$custom_status}_offline{/if}">
                    {if !($mbox_class=="mbox_tiny")}
                        {if !$custom_status}
                            {if ($model.online && ($model.in_pvt || $model.inGoalShow))}<div class="p-green status opacity"><div style="padding-left:3px;"><i class="fa fa-lock"></i> Private Show</div><div class="modelfeatures"></div></div> {elseif $model.online && $model.pvt_only_status} <div class="p-green status opacity"><div style="padding-left:3px;"><i class="fa fa-unlock-alt"></i> Private Only</div><div class="modelfeatures"></div></div> {elseif $model.online && $model.inGoalShowPreShow} <div class="p-yellow status opacity"><div style="padding-left:3px;"><i class="fa fa-database"></i> Goal Show</div><div class="modelfeatures"></div></div> {elseif $model.online && !$model.party_chat} <div class="p-darkblue status opacity"><div style="padding-left:3px;"><i class="fa fa-comments"></i> Online</div><div class="modelfeatures"></div></div> {elseif $model.online && $model.party_chat} <div class="p-red status opacity"><div style="padding-left:3px;"><i class="fa fa-glass"></i> Party Show</div><div class="modelfeatures"></div></div>{else} <div class="p-default status opacity"><div style="padding-left:3px;"><i class="fa fa-times"></i> Offline</div><div class="modelfeatures"></div></div>{/if}
                        {/if}
                    {/if}
                </div>
                <div class="{if !$custom_status} mbox_display {/if}{$mboxtxt_class}{if $model.online && !$custom_status} mboxtxt_online{else} mboxtxt_offline{/if}">
                    {if $custom_status}
                        {$model.custom_status}
                    {else}
                        {if $model.online} Online{else} Offline{/if}
                    {/if}
                </div>
            {/if}
            {if !$no_action}</a>{/if}
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>

    <div class="{if !$adjust_metadata}mmetadata{else}mmetadata2{/if}">
        {if !$hide_metadata}
            <div class="{if !$adjust_metadata}{$minfo_bar_class}{else}minfo_bar2{/if}">
                {if $model.p2p_validated}
                    <div class="{if !$adjust_metadata}micons{else}micons2{/if}"><i class="p-icon fa fa-mobile"></i></div>
                {/if}
                {if $model.hd}
                    <div class="{if !$adjust_metadata}micons{else}micons2{/if}"><div class="hd-div"><span class="hd p-icon">HD</span></div></div>
                {/if}
                {if $model.has_sound}
                    <div class="{if !$adjust_metadata}micons{else}micons2{/if}"><i class="p-icon fa fa-volume-up"></i></div>
                {/if}
                {if $model.diltron && $smarty.session.vstroker_site}
                    <div class="{if !$adjust_metadata}micons{else}micons2{/if}"><img src="{$_PATH_IMG}/global/st_icon2.gif" class="modelsgrid_icon" /></div>
                {/if}
                {if !$adjust_metadata}
                    <div class="minfo" style="position:absolute;right:5px">{$model.age}{if 1 eq 2 && !$model.hide_locale && $model.country_code}/{$model.country_code}{/if}</div>
                {/if}
            </div>
            {if !$hide_mdesc}
                <div class="mdesc {$minfo_bar_class}" {if $models_height} {else}style="width:98%; height:auto;"{/if}>{$model.description}</div>
            {/if}
            {if $adjust_metadata}
                <div class="mdesc2" style="width:98%; height:12px;">.</div>
            {/if}
        {/if}

        {if $metadata_text}
            {$metadata_text}
        {elseif $model.metadata_text}
            <div class="mdesc">
                {$model.metadata_text}
            </div>
        {/if}
    </div>
</div> {if $smarty.const.__IS_DEV_SERVER}<!-- ends <div id="id_model_{$model.id}" class="models"> -->{/if}