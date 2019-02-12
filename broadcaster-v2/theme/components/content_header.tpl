<section class="content-header secondary-color" {if $smarty.request.from_model_swf}style="display: none" {/if}>
    <h1> Models Home Page </h1>

    {if $whitelabel_settings.knowledge_base_link}
        <div id="linkContainer" class="text-center">
            {$whitelabel_settings.knowledge_base_link}
        </div>
    {/if}
    <ol class="breadcrumb">
        <li><a {if $show neq 'home'}href="/models/"{/if}><i class="fa fa-home"></i> Home</a></li>
        {if $show neq 'home'}
        <li {if !$prl_section}class="active"{/if}>{if $my_account}My Account{elseif $my_profile}My Profile{else}{$show}{/if}</li>
        {/if}
        {if $show eq 'myprofile'}
        <li class="active">
            {if $prl_section eq 'accInfo'}
                Account Information
            {elseif $prl_section eq 'docRev'}
                Application Status
            {elseif $prl_section eq 'info'}
                Personal Information
            {elseif $prl_section eq 'payment'}
                Personal Information
            {elseif $prl_section eq 'w9'}
                W9 Review
            {elseif $prl_section eq 'about'}
               About You
            {elseif $prl_section eq 'tellUsAbout'}
                Tell Us About Yourself
            {elseif $prl_section eq 'rates'}
                Private Show Rates
            {elseif $prl_section eq 'ctBlocking'}
                Country Blocking
            {elseif $prl_section eq 'usBlocking'}
                U.S. State Blocking
            {elseif $prl_section eq 'mailSettings'}
                Mail Settings
            {/if}
        </li>
        {/if}
    </ol>

    {if $message or $title}
        <div class="alert alert-info alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            {if $title}{$title}<br>{/if}
            {if $message} {$message}{/if}
            {if $f_error eq true}
                {foreach from=$error item=err}
                    {$err}
                {/foreach}
            {/if}
        </div>
    {/if}
</section>


