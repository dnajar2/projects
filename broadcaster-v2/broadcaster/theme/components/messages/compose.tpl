<div id="newMessage" class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Compose New Message</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        {if $fromModal}
            <form id="newMail">
            <input type="hidden" name="{$smarty.session.session_name}" value="{$smarty.session.SessionID}">
            <input type="hidden" name="modelId" id="modelId" value="{$modelInfo.ModelID}" />
            <input type="hidden" name="userID" id="userID" value="{$userID}{$messageDetail.from_id}" />
            <input type="hidden" name="model_name" value="{$smarty.session.username}">
            <input type="hidden" name="post_type" value="new_message">
            <input type="hidden" name="username"  :value="mbr.name">
        {/if}
            <input type="hidden" name="user_id" {if $smarty.get.userID}value="{$smarty.get.userID}" {else}:value="mbr.id"{/if}>
            <input type="hidden" name="ajax" value="yes">
            <div class="form-group">
                <input class="form-control" name="username"
                    placeholder="To:"
                    {if $smarty.get.username}
                        value="{$smarty.get.username}"
                        disabled
                    {elseif $fromModal}
                        :value="mbr.name"
                        disabled
                    {else}
                        value=""
                        v-model="search"
                        @focus="showSearch = true; getMembers()"
                        autocomplete="off"
                    {/if}
                    >
                <div id="searchMemberList" v-show="showSearch">
                    <ul>
                        <li class="text-center" v-if="members.length === 0"><i class="fa fa-refresh fa-spin"></i></li>
                        <li v-for="member in filterMembers" @click="setMailMember(member.id,member.username); search = member.username; mbr.id = member.id;">
                               %%member.username%%
                        </li>
                    </ul>
                </div>
            </div>
            <div class="form-group">
                <input class="form-control" name="mailSubject" placeholder="Subject:" {if $fromModal}:value="msg.subject"{/if}>
            </div>
            <div class="form-group" >
                <textarea name="mailMessage" id="mailMessage" class="form-control" placeholder="Type your message here" {if $fromModal}:value="msg.textarea"{/if}></textarea>
            </div>
            {if !$fromModal}
            <div class="form-group" style="position:relative;">
                <div class="btn btn-default btn-file">
                    <i class="fa fa-paperclip"></i> Attachment
                    <input type="file" name="qqfile" id="qqfile">
                </div>
                <div id="fileNameInfo" style="display: none">
                    <small>File Name: <span id="fileName"></span> | File Size: <span id="fileSize"></span></small>
                </div>
                <div class="image-holder">
                    <img id="imgPreview" src="" alt="" class="img-responsive" style="display: none {if $smarty.request.from_model_swf};width: 20%{/if}" >
                </div>
                <p class="help-block">Max. 32MB <span id="kbReached"></span></p>
            </div>
            {/if}
    {if $fromModal}</form>{/if}
    </div>
    <!-- /.box-body -->
    <div class="box-footer">
        <div class="pull-right">
            {*<button type="button" class="btn btn-default"><i class="fa fa-pencil"></i> Draft</button>*}
            <button type="button" class="btn btn-primary" data-{if !$fromModal}trigger{else}modaltrigger{/if} data-posttype="new_message" onclick="$(this).find('.fa').show()" disabled> <i class="fa fa-envelope"></i> Send <i class="fa fa-refresh fa-spin" style="display:none;"></i></button>
        </div>

        <a href="{if !$fromModal}/models/?{'show=maillist&activeTab=Inbox'|base64_encode}{if $smarty.request.from_model_swf}&from_model_swf=1{/if}{else}#{/if}" class="btn btn-default"  {if $fromModal}data-dismiss="modal"{/if} ><i class="fa fa-times"></i> Discard</a>
    </div>
    <!-- /.box-footer -->
</div>
