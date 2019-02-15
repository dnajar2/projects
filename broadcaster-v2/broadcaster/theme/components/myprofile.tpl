{assign var="mpeInsert" value=0}
{assign var="mpeEdit" value=1}

{assign var="mpeAdmin" value=0}
{assign var="mpeManager" value=1}
{assign var="mpeModels" value=2}
<section class="content">
    <div class="row">
        {if $prl_section eq "accInfo"}
            {include file="models/v2/components/profile/account_info.tpl"}
        {elseif $prl_section eq "docRev"}
            {include file="models/v2/components/profile/doc_review.tpl"}
        {elseif $prl_section eq "info"}
            {include file="models/v2/components/profile/personal_info.tpl"}
        {elseif $prl_section eq "payment"}
            {include file="models/v2/components/profile/payment_info.tpl"}
        {elseif $prl_section eq "w9"}
            {if $mpeUser == $mpeAdmin || $w9.id == -1}
                {include file="models/v2/components/profile/w9_review.tpl" admin_edit="true" main_width="565" inner_width="525" background_color="#E6EBEE" mpe_action="frmW9Input" post_to="mpepost" }
            {else}
                {include file="models/v2/components/profile/w9_review.tpl" disable_edits="true" admin_edit="true" main_width="565" inner_width="525" background_color="#E6EBEE" }
            {/if}
        {elseif $prl_section eq "about"}
            {include file="models/v2/components/profile/about_you.tpl" show_checkboxes=true mpeEditor=true}
        {elseif $prl_section eq "tellUsAbout"}
            {include file="models/v2/components/profile/tell_about.tpl"}
        {elseif $prl_section eq "rates"}
            {include file="models/v2/components/profile/rates.tpl"}
        {elseif $prl_section eq "ctBlocking"}
            {include file="models/v2/components/profile/country_blocking.tpl"}
        {elseif $prl_section eq "usBlocking"}
            {include file="models/v2/components/profile/us_blocking.tpl"}
        {elseif $prl_section eq "mailSettings"}
            {include file="models/v2/components/profile/mail_settings.tpl"}
        {/if}
    </div>
</section>
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" style="display: none;">
    <div class="slides"></div>
    <h4 class="title">{$modelInfo.Username}</h4>
    <a class="prev"><i class="fa fa-chevron-left"></i></a>
    <a class="next"><i class="fa fa-chevron-right"></i></a>
    <a class="close">x</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
</div>
