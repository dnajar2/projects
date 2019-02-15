<div class="col-md-12">
    <div class="box box-solid">
        <div class="box-header with-border col-md-8 col-md-offset-2">
            <h3 class="box-title">Favorites</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body col-md-8 col-md-offset-2">
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

            <div class="table-responsive">
                <table class="table" >
                    {if $Confirm}
                        <tr class="favConfirm">
                            <td class="favConfirm" >{$Confirm}</td>
                        </tr>
                    {/if}
                    <tr>
                        <td class="favoritesDD">
                            <form method="post" action="{$filterFormAction}">
                                <label for="myfavfilter">Select an Option bellow</label>
                                <select name="myfavfilter" id="myfavfilter" class="form-control" onchange="this.form.submit()" style="width: 300px;">
                                    {foreach from=$filterDropDown key=k item=v}
                                        <option {$k}>{$v}</option>
                                    {/foreach}
                                </select>
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table class="table" border="0" cellspacing="1" cellpadding="0" bgcolor="#D6DFE3" >
                                <tr class="favHeader" >
                                    <th><a href="{$obUsername}">Member Name</a></th>
                                    <th><a href="{$obLastLogin}">Last Login</a></th>
                                    <th><a href="{$obBalance}">Credits</a></th>
                                    <th>Action</th>
                                </tr>
                                {foreach from=$modelFavorites key=k item=v}
                                    {cycle values="favDataDark, favDataLight" assign="rowClass"}
                                    <tr>
                                        <td class="{$rowClass}">{$v.username}</td>
                                        <td class="{$rowClass}">{$v.lastLogin}</td>
                                        <td class="{$rowClass}">${$v.balance}</td>
                                        <td class="{$rowClass}">
                                            <a href='/models/?{'show=mailCompose'|base64_encode}' class="btn button-2 send-message"  onclick='utils.popNewMessage("{$v.username}","{$v.id}",event)'><i class="fa fa-envelope"></i> Send Message</a>

                                            <a href="{$v.deleteMemberURL}" class="btn button-3"><i class="fa fa-trash-o"></i> Delete</a>
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
            </div>
            <div class="Pagination">
                <div>
                    {if $pageCount > 1}

                        <div>
                            Page <span class="label label-default"> {$pageNumber} </span>
                        </div>
                        <div>
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                            {if $pageNumber != 1}
                                <li class="page-item"><a class="page-link" href="{$paging.prevLink}"> &#139; Previous</a></li>
                            {/if}
                            {foreach from=$paging.pages item="page"}
                                <li class="page-item {if $pageNumber == $page.pageNo}active{/if}"><a class="page-link" href="{$page.link}">{$page.pageNo}</a></li>
                            {/foreach}

                            {if $pageCount eq $pageNumber}
                            {else}
                                <li class="page-item"><a class="page-link" href="{$paging.nextLink}">Next  &#155;</a></li>
                            {/if}
                                </ul>
                            </nav>
                        </div>
                    {else}
                        <div>
                            Page <span class="label label-default"> {$pageNumber} </span>
                        </div>
                    {/if}
                </div>
            </div>


        </div>
        <div class="clearfix"></div>
    </div>
</div>


