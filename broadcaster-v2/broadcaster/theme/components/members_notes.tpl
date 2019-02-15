<div class="col-md-9">
    <div class="box box-solid">
        <div class="box-header with-border">
            <h3 class="box-title">Members Notes</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            {*<table width="581" border="0" cellpadding="0" cellspacing="0">*}
                {*<tr>*}
                    {*<td width="581" align="center" class="defText" colspan="3" height="11">*}
                        {*<img src="{$CDN_SCHEMA}/images/wcc1/spacer.gif" height="11">*}

                        {*<br><b>Alphabetical Index</b><br>*}
                        {*{foreach from=$letterLinks name=lettersLoop key=k item=v}*}
                            {*<small>*}
                                {*<a href="{$v}" class="defText">{if $l == $k}<b>{/if}{$k}{if $l == $k}</b>{/if}</a>*}
                                {*{if $smarty.foreach.lettersLoop.iteration < $smarty.foreach.lettersLoop.total}*}
                                    {*|*}
                                {*{/if}*}
                            {*</small>*}
                        {*{/foreach}*}
                        {*<br><img src="{$CDN_SCHEMA}/images/wcc1/spacer.gif" height="7">*}
                    {*</td>*}
                {*</tr>*}
            {*</table>*}


            <table class="table">
                <tr>
                    <td >
                        <a class="newnote btn button-2" href="{$new_note_href}" ><i class="fa fa-sticky-note"></i> New Note</a>
                    </td>
                </tr>

                <tr>
                    <td align="center">
                        <table class="table">
                            <tr class="favHeader" >
                                <td><table><tr><td><a href="{$obMemberUsername}">Member Name</a></td><td>{if $orderby == "username" }<img src="{$CDN_SCHEMA}/images/wcc1/{$dirImage}" border="0" />{/if}</td></tr></table></td>
                                <td><table><tr><td><a href="{$obCreateDate}">Created</a></td><td>{if $orderby == "create_date" }<img src="{$CDN_SCHEMA}/images/wcc1/{$dirImage}" border="0" />{/if}</td></tr></table></td>
                                <td><table><tr><td><a href="{$obModifiedDate}">Last Updated</a></td><td>{if $orderby == "modified_date" }<img src="{$CDN_SCHEMA}/images/wcc1/{$dirImage}" border="0" />{/if}</td></tr></table></td>
                                <td style="padding: 5px; padding-left:57px;">Action</td>
                            </tr>
                            {foreach from=$members_notes key=k item=v}
                                {cycle values="favDataDark, favDataLight" assign="rowClass"}
                                <tr>
                                    <td class="{$rowClass}" >{$v.username}</td>
                                    <td class="{$rowClass}" >{$v.create_date}</td>
                                    <td class="{$rowClass}" >{$v.modified_date}</td>
                                    <td class="{$rowClass}" >
                                        <a href="{$v.url}" class="btn button-2 newnote edit" data-userid="{$v.member_id}" data-username="{$v.username}"><i class="fa fa-pencil"></i> Edit</a>
                                    </td>
                                </tr>
                            {/foreach}
                            <tr class="favHeader" style="height: 5px;" >
                                <td></td>
                            </tr>
                        </table></td>
                </tr>
                <tr>
                    <td><img src="{$CDN_SCHEMA}/images/wcc1/members/spacer.gif" width="6" height="8"></td>
                </tr>
            </table>

            <table width="581" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="581" align="center" class="defText" colspan="3" height="11">
                        <img src="{$CDN_SCHEMA}/images/wcc1/spacer.gif" height="11">
                        <table width="555" height="30" border="0" cellpadding="0" cellspacing="0">
                            <tr>

                                {if $pageCount > 1}
                                    <td width="100" align="left" class="defText">
                                        Page [ {$pageNumber} ]
                                    </td>
                                    <td align="right" class="defText">

                                        {if $pageNumber != 1}
                                            <a href="{$paging.prevLink}" class="defText">
                                                &#139; Prev
                                            </a> |
                                        {/if}
                                        {foreach from=$paging.pages item="page"}
                                            <a href="{$page.link}" class="defText">{if $pageNumber == $page.pageNo}<b>{/if}{$page.pageNo}{if $pageNumber == $page.pageNo}</b>{/if}</a> |
                                        {/foreach}
                                        {if $pageCount eq $pageNumber}
                                        {else}
                                            <a href="{$paging.nextLink}" class="defText">Next &#155;</a>
                                        {/if}
                                    </td>
                                {else}
                                    <td width="219" align="left" class="defText">
                                        Page [ {$pageNumber} ]
                                    </td>
                                {/if}
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
{*new note modal*}

<div id="newMemberNote" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Add New Member Note</h4>
            </div>
            <div class="modal-body">
                <div>
                    {if ($err_msg)}
                        <div>
                            <div>
                                <div class="EditLabel" style="float:left;margin-right:5px;padding-top: 5px; font-size:12px; font-family: tahoma; margin-left:10px;"><label>{$err_msg}</label></div>
                            </div>
                        </div>
                    {/if}
                    <form id="add_form" method="POST" action="{$add_url}">
                        <input type="hidden" id="userID" name="userID" value="-1">
                        <div class="form-group">
                            <div id="editLabel" class="EditLabel" style="position: relative">
                                <label for="username">Member Username:</label>
                                <input  list="members" id="username" class="EditBox form-control">
                                <img src="{$CDN_SCHEMA}/images/wcc1/group.png" onclick="$('#memberTabs').toggle()" style="cursor: pointer; position: absolute; top: 35px; right: 10px;" title="Add Member"  />
                            </div>

                            <div class="clearfix"></div>

                            <div id="memberTabs" style="display: none">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist">
                                    <li role="presentation" class="active"><a href="#Online" aria-controls="home" role="tab" data-toggle="tab">Online</a></li>
                                    <li role="presentation"><a href="#PastShows" aria-controls="profile" role="tab" data-toggle="tab">Past Shows</a></li>
                                    <li role="presentation"><a href="#Favorites" aria-controls="messages" role="tab" data-toggle="tab">Favorites</a></li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content wl-bg">
                                    {foreach from=$models_address_list key="tabName" item="tabData"}
                                    <div role="tabpanel" class="tab-pane fade {if $tabName eq "Online"}in active{/if}" id="{$tabName}">
                                        <div class="th">
                                            <div class="col-xs-8">
                                               <i class="fa fa-user"></i> Member Name
                                            </div>
                                            <div class="col-xs-4">
                                                <i class="fa fa-database"></i> Credits
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        {*foreloop*}
                                        {if $tabData}
                                        {foreach from=$tabData item="item"}
                                        {if !empty($item.username)}
                                        <div class="td">
                                            <div class="col-xs-8 member" data-memberId="{$item.id}" data-username="{$item.username}">
                                                <i class="fa fa-user"></i> {$item.username}
                                            </div>
                                            <div class="col-xs-4">
                                                <i class="fa fa-database"></i> {$item.balance}
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        {/if}
                                        {/foreach}
                                        {else}
                                        <div class="td">
                                            <div class="col-xs-8">
                                                 None
                                            </div>
                                            <div class="col-xs-4">
                                                 0
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        {/if}
                                        {*foreloop*}
                                        <div class="clearfix"></div>
                                    </div>
                                    {/foreach}
                                </div>

                            </div>
                        </div>
                        <div>
                            <div >

                                <div>
                                    <label for="mailSubject"></label>
                                    <textarea class="EditBox form-control" id="mailSubject" name="note" cols="72" rows="7">{$note}</textarea>
                                    <span class="pull-right">Character Limit<br /><span id="mailSubject_txt_count" > {math equation="x" x=$note|count_characters y=$notes_size_limit}</span>/{$notes_size_limit}</span>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <hr>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" id="saveBtn" class="btn btn-primary" onclick="members_notes.post_update('#add_form')" disabled>Save changes <i class="fa fa-refresh fa-spin" style="display: none"></i></button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
