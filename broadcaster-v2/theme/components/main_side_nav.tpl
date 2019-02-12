<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar primary-bg-color"  {if $smarty.request.from_model_swf}style="display: none"{/if}>
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar" style="height: auto;">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="{$photoURL}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info" {literal}v-bind:class="{ hide: !visible }"{/literal} style="padding-bottom: 5px;">
                <p>{$modelInfo.Username}</p>
                {if $modelInfo.fcs_status}
                    <a href="#" v-if="fcs_status"><i class="fa fa-circle text-success"></i> Online</a>
                    <a href="#" v-else><i class="fa fa-circle text-danger"></i> Offline</a>
                {else}
                    {if $modelCantGoOnline}
                    <a href="#" onclick="utils.cantGoOnline(event); return false"><i class="fa fa-circle text-danger"></i> Offline</a>
                    {else}
                    <a href="/models/"
                        data-startshow
                        onClick="{if $needsSignedNudeFreeChatAgreement || $needsUpdatedReleaseForm}open_nudity_freechat_notice();{else}openChatPopUp('/models/model_unload.php');{/if} utils.toggleFcsStatus(); return false;" v-if="!fcs_status"><i class="fa fa-circle text-danger"></i> Offline</a>
                    <span class="online-status" v-else><i class="fa fa-circle text-success"></i> Online</span>
                    {/if}
                {/if}
            </div>
        </div>
        <br>
        <div class="clearfix"></div>
        <!-- search form -->
        {*<form action="#" method="get" class="sidebar-form">*}
            {*<div class="input-group">*}
                {*<input type="text" name="q" class="form-control" placeholder="Search...">*}
                {*<span class="input-group-btn">*}
                {*<button type="submit" name="search" id="search-btn" class="btn btn-flat">*}
                  {*<i class="fa fa-search"></i>*}
                {*</button>*}
              {*</span>*}
            {*</div>*}
        {*</form>*}
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu tree" data-widget="tree">
            <li class="header primary-bg-color primary-color">MAIN NAVIGATION</li>
            <li {if $show eq 'home'}class="active"{/if}><a href="/models/?{'show=home'|base64_encode}">
                    <i class="fa fa-home"></i> <span>Home</span></a>
            </li>
            <li class="treeview {if $show eq "myprofile" && $my_account}active{/if}">
                <a href="#">
                    <i class="fa fa-gear"></i> <span>My Account</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li {if $prl_section eq 'accInfo'}class="active"{/if}>
                        <a href="{$ProfileURL}&section=accInfo"><i class="fa {if $prl_section eq 'accInfo'}fa-circle{else}fa-circle-o{/if}"></i>Account Information</a>
                    </li>
                    <li {if $prl_section eq 'info'}class="active"{/if}>
                        <a href="{$ProfileURL}&section=info"><i class="fa {if $prl_section eq 'info'}fa-circle{else}fa-circle-o{/if}"></i>Personal Information</a>
                    </li>
                    <li {if $prl_section eq 'docRev'}class="active"{/if}>
                        <a href="{$ProfileURL}&section=docRev"><i class="fa {if $prl_section eq 'docRev'}fa-circle{else}fa-circle-o{/if}"></i>Application Status</a>
                    </li>
                    {if $inHouseStudio or $inhouse_model}
                    <li {if $prl_section eq 'payment'}class="active"{/if}>
                        <a href="{$ProfileURL}&section=payment"><i class="fa {if $prl_section eq 'payment'}fa-circle{else}fa-circle-o{/if}"></i>Payment Information</a>
                    </li>
                    {/if}
                    {if  $w9_is_required}
                    <li {if $prl_section eq 'w9'}class="active"{/if}>
                        <a href="{$ProfileURL}&section=w9"><i class="fa {if $prl_section eq 'w9'}fa-circle{else}fa-circle-o{/if}"></i>W9 Review</a>
                    </li>
                    {/if}
                    <li {if $prl_section eq 'rates'}class="active"{/if}>
                        <a href="{$ProfileURL}&section=rates"><i class="fa {if $prl_section eq 'rates'}fa-circle{else}fa-circle-o{/if}"></i>Private Show Rates</a>
                    </li>
                </ul>
            </li>
            <li class="treeview {if $show eq "myprofile" && $my_profile}active{/if}">
                <a href="#">
                    <i class="fa fa-user"></i> <span>My Profile</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li {if $prl_section eq 'about'}class="active"{/if}>
                        <a href="{$ProfileURL}&section=about"><i class="fa {if $prl_section eq 'about'}fa-circle{else}fa-circle-o{/if}"></i>About You</a>
                    </li>
                    <li {if $prl_section eq 'tellUsAbout'}class="active"{/if}>
                        <a href="{$ProfileURL}&section=tellUsAbout"><i class="fa {if $prl_section eq 'tellUsAbout'}fa-circle{else}fa-circle-o{/if}"></i>Tell Us About Yourself</a>
                    </li>
                    <li {if $prl_section eq 'ctBlocking'}class="active"{/if}>
                        <a href="{$ProfileURL}&section=ctBlocking"><i class="fa {if $prl_section eq 'ctBlocking'}fa-circle{else}fa-circle-o{/if}"></i>Country Blocking</a>
                    </li>
                    <li {if $prl_section eq 'usBlocking'}class="active"{/if}>
                        <a href="{$ProfileURL}&section=usBlocking"><i class="fa {if $prl_section eq 'usBlocking'}fa-circle{else}fa-circle-o{/if}"></i>US States Blocking</a>
                    </li>
                    <li {if $prl_section eq 'mailSettings'}class="active"{/if}>
                        <a href="{$ProfileURL}&section=mailSettings"><i class="fa {if $prl_section eq 'mailSettings'}fa-circle{else}fa-circle-o{/if}"></i>Mail Settings</a>
                    </li>
                </ul>
            </li>
            <li {if $show eq 'referralprogram'}class="active"{/if}>
                <a href="/models/?{'show=referralprogram'|base64_encode}"><i class="fa fa-usd"></i> <span>Referral Program</span></a>
            </li>
            {*<li {if $show eq 'statusupdates'}class="active"{/if}><a href="/models/?{'show=statusupdates'|base64_encode}">*}
                    {*<i class="fa fa-refresh"></i> <span>Status Update</span></a>*}
            {*</li>*}
            <li {if $show eq 'myearnings'}class="active"{/if}>
                <a href="/models/?{'show=myearnings'|base64_encode}"><i class="fa fa-bar-chart" aria-hidden="true"></i> <span>My Earnings</span></a>
            </li>
            <li {if $show eq 'payments'}class="active"{/if}>
                <a href="/models/?{'show=payments'|base64_encode}"><i class="fa fa-money" aria-hidden="true"></i> <span>My Payments</span></a>
            </li>
            <li {if $show eq 'myschedule'}class="active"{/if}>
                <a href="/models/?{'show=myschedule'|base64_encode}"><i class="fa fa-calendar" aria-hidden="true"></i> <span>My Schedule</span></a>
            </li>
            <li {if $show eq 'myphotos'}class="active"{/if}>
                <a href="/models/?{'show=myphotos'|base64_encode}"><i class="fa fa-picture-o" aria-hidden="true"></i> <span>My Photos</span></a>
            </li>
            <li {if $show eq 'myfavorites'}class="active"{/if}>
                <a href="/models/?{'show=myfavorites'|base64_encode}"><i class="fa fa-star" aria-hidden="true"></i> <span>My Favorites</span></a>
            </li>
            <li {if $show eq 'members_notes'}class="active"{/if}>
                <a href="/models/?{'show=members_notes'|base64_encode}"><i class="fa fa-sticky-note" aria-hidden="true"></i> <span>Member Notes</span></a>
            </li>
            <li {if $show eq 'myfanclub'}class="active"{/if}>
                <a href="/models/?{'show=myfanclub'|base64_encode}"><i class="fa fa-users" aria-hidden="true"></i> <span>My Fan Club</span></a>
            </li>
            <li {if $show eq 'myphones'}class="active"{/if}>
                <a href="/models/?{'show=my_phones'|base64_encode}"><i class="fa fa-phone-square" aria-hidden="true"></i> <span>Phone 2 Phone</span></a>
            </li>
            <li {if $show eq 'siteMail'}class="active"{/if}>
                <a href="/models/?{'show=maillist'|base64_encode}"><i class="fa fa-envelope" aria-hidden="true"></i> <span>My Mail</span></a>
            </li>
            {if $modelCantGoOnline}
            <li class="goOnline" data-startshow>
                <a href="#" onclick="utils.cantGoOnline(event); return false"><i class="fa fa-toggle-on " aria-hidden="true"></i> <span>Go Online</span></a>
            </li>
            {else}
            <li class="goOnline"  {literal}v-bind:class="{ disabled: fcs_status }"{/literal} data-startshow>
                <a href="/models/" onClick="{if $needsSignedNudeFreeChatAgreement || $needsUpdatedReleaseForm}open_nudity_freechat_notice();{else}openChatPopUp('/models/model_unload.php');{/if} utils.toggleFcsStatus(); return false;"><i class="fa fa-toggle-on " aria-hidden="true"></i> <span>Go Online</span></a>
            </li>
            {/if}

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
