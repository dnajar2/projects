{* $photo_url_key : the key name in the $models[#] array of the image to be displayed *}
{if !$photo_url_key}
    {assign var="photo_url_key" value="mid_url"}
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

{foreach from=$models key="k" item="v" name="modelsgrid_loop"}
    {include file="$_THEME/components/modelsgridcellsmall.tpl" model=$v
    photo_url_key=$photo_url_key
    photo_url_key_small=$photo_url_key_small
    mbox_class=$mbox_class
    mboxtxt_class=$mboxtxt_class
    minfo_bar_class=$minfo_bar_class
    models_height=$models_height
    trim_username_length=$trim_username_length
    }
{/foreach}