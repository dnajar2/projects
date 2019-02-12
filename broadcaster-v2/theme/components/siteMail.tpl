<div {if $smarty.get.from_model_swf}id="inbox-folders"{/if} class="col-md-3">
    {assign  var="fromModal" value=false}
        <div class="box box-solid" >
        <div class="box-header with-border">
            <h3 class="box-title">Folders</h3>

            <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
            </div>
        </div>
        <div class="box-body no-padding">
            <ul id="inboxMenu" class="clear_wl nav nav-pills nav-stacked">
                <li {if $activeTab == "Inbox"}class="active"{/if}><a href="{$tabGotoInboxURL}{if $smarty.request.from_model_swf}&from_model_swf=1{/if}">
                        <i class="fa fa-inbox"></i> Inbox
                        <span class="label label-primary pull-right">%%folderCount.inbox%%</span></a>
                </li>
                <li {if $activeTab == "Saved"}class="active"{/if}><a href="{$tabGotoSavedMailURL}{if $smarty.request.from_model_swf}&from_model_swf=1{/if}"><i class="fa fa-save"></i> Saved
                        <span class="label label-primary pull-right">%%folderCount.saved%%</span></a></li>
                <li {if $activeTab == "Sent"}class="active"{/if}><a href="{$tabGotoSentMailURL}{if $smarty.request.from_model_swf}&from_model_swf=1{/if}"><i class="fa fa-envelope-o"></i> Sent
                        <span class="label label-success pull-right">%%folderCount.sent%%</span></a></li>
                {*<li><a href="#"><i class="fa fa-file-text-o"></i> Drafts</a></li>*}
                {*<li><a href="#"><i class="fa fa-filter"></i> Junk <span class="label label-warning pull-right">65</span></a></li>*}
                <li {if $activeTab == "Trash"}class="active"{/if}><a href="{$tabGotoTrashURL}{if $smarty.request.from_model_swf}&from_model_swf=1{/if}"><i class="fa fa-trash-o"></i> Trash
                        {if $m_trashCount neq 0}<span class="label label-primary pull-right">%%folderCount.trash%%</span>{/if}</a></li>
            </ul>
        </div>
        <!-- /.box-body -->
    </div>
    <!-- /. box -->
    {if $smarty.get.show neq "mailReader" && !$smarty.get.compose }
    <div class="box box-solid">
        <div class="box-header with-border">
            <h3 class="box-title">Mailing Address List</h3>

            <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa {if $smarty.request.from_model_swf}fa-plus{else}fa-minus{/if}"></i>
                </button>
            </div>
        </div>
        <div id="siteMailMembers" class="box-body no-padding">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="margin-bottom: 0">
                <div class="clear_wl panel panel-default">
                    <div class="panel-heading" role="tab" id="online">

                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#onlineMembers" aria-expanded="true" aria-controls="collapseOne" @click = "getMembers()">
                                <h4 class="panel-title">
                                <i class="fa fa-circle text-green"></i> Members
                                </h4>
                            </a>

                    </div>
                    <div id="onlineMembers" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            {include file="models/v2/components/messages/memberList.tpl"}
                        </div>
                    </div>
                    {*<div class="panel-heading" role="tab" id="pastShows">*}
                        {*<h4 class="panel-title">*}
                            {*<a role="button" data-toggle="collapse" data-parent="#accordion" href="#membersPastShows" aria-expanded="true" aria-controls="collapseOne" @click = "getMembers()">*}
                                {*<i class="fa fa-circle-o text-light-blue"></i> Past Shows*}
                            {*</a>*}
                        {*</h4>*}
                    {*</div>*}
                    {*<div id="membersPastShows" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">*}
                        {*<div class="panel-body">*}
                            {*{include file="models/v2/components/messages/memberList.tpl"}*}
                        {*</div>*}
                    {*</div>*}
                    {*<div class="panel-heading" role="tab" id="favoriteMbr">*}
                        {*<h4 class="panel-title">*}
                            {*<a role="button" data-toggle="collapse" data-parent="#accordion" href="#favoriteMembers" aria-expanded="true" aria-controls="collapseOne" @click = "getMembers()">*}
                                {*<i class="fa fa-circle-o text-red"></i> Favorites*}
                            {*</a>*}
                        {*</h4>*}
                    {*</div>*}
                    {*<div id="favoriteMembers" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">*}
                        {*<div class="panel-body">*}
                            {*{include file="models/v2/components/messages/memberList.tpl"}*}
                        {*</div>*}
                    {*</div>*}
                </div>
            </div>
        </div>
        <!-- /.box-body -->
    </div>
    {/if}
    <!-- /.box -->
</div>
<div {if $smarty.get.from_model_swf}id="inbox-list"{/if} class="col-md-9">
    <form id="mainForm" action="{$mailFormAction}" method="POST" name="mailForm" enctype="multipart/form-data" autocomplete="off">
        <input type="hidden" name="post_type" :value="postType" v-if="postType != null">
        <input type="hidden" name="address_list" :value="addressList" v-if="addressList != null">
        <input type="hidden" name="folder_count" :value="folder_count" v-if="folder_count != null">
        <input type="hidden" name="show" id="show" value="{$mailShowAction}" />
        <input type="hidden" name="sendMessage" id="sendMessage" value="yes" />
        <input type="hidden" name="mailComposeFormAction" id="mailComposeFormAction" value="-1" />
        <input type="hidden" name="activeTab" value="{$activeTab}" />

        <input type="hidden" name="mailListFormAction" id="mailListFormAction" value="-1" />
        <input type="hidden" name="{$smarty.session.session_name}" value="{$smarty.session.SessionID}">
        <input type="hidden" name="modelId" id="modelId" value="{$modelInfo.ModelID}" />
        <input type="hidden" name="userID" id="userID" value="{$userID}{$messageDetail.from_id}" />
        <input type="hidden" name="model_name" value="{$smarty.session.username}">
        {if $smarty.get.username}
            <input type="hidden" name="username" value="{$smarty.get.username}">
        {/if}
        {if $smarty.request.from_model_swf}
            <input type="hidden" name="from_model_swf" value="1">
        {/if}
        {if $messageDetail and $mailShowAction neq "mailReader"}
            <input type="hidden" name="viewMessageID" value="{$messageDetail.id}">
            <input type="hidden" name="messageID" value="{$messageDetail.id}">
        {/if}
    {if $smarty.get.compose}
        {include file="models/v2/components/messages/compose.tpl"}
        {elseif $mailShowAction eq "mailReader"}
        {include file="models/v2/components/messages/readMessage.tpl" mailList=$mailList mailMessage=$mailMessage}
        {else}
        {include file="models/v2/components/messages/mailList.tpl" mailList=$mailList mailMessage=$mailMessage}
    {/if}
    </form>
    {if $smarty.get.show eq 'maillist'}
        <div class="compose-btn" {if $smarty.request.from_model_swf}style="bottom: 10px;" {/if}>
            <a href="/models/?{'show=mailCompose&compose=true'|base64_encode}{if $smarty.request.from_model_swf}&from_model_swf=1{/if}" class="btn button-2 btn-block button">
                <i class="fa fa-plus"></i> <span class="hidden-xs">New Message</span></a>
        </div>
    {/if}
</div>
