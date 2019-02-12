<div class="col-md-12">
    <div class="box box-solid">
        <div class="box-header with-border col-md-8 col-md-offset-2">
            <h3 class="box-title">Fan Club</h3>
        </div>
        <!-- /.box-header -->
        <div class="table-responsive col-md-8 col-md-offset-2">
            <table class="table" >
                {if $Confirm}
                    <tr class="favConfirm">
                        <td class="favConfirm" >{$Confirm}</td>
                    </tr>
                {/if}
                <tr>
                    <td align="center">
                        <table class="table">
                            {if $modelFanclub}
                            <tr class="favHeader" >
                                <td><a href="{$obUsername}">Member Name {if $orderby == "username" }<img src="{$CDN_SCHEMA}/images/wcc1/{$dirImage}" border="0" />{/if}</a></td>
                                <td><a href="{$obLastLogin}">Last Login {if $orderby == "lastLogin" }<img src="{$CDN_SCHEMA}/images/wcc1/{$dirImage}" border="0" />{/if}</a></td>
                                <td>&nbsp;</td>
                            </tr>

                                {foreach from=$modelFanclub key=k item=v}
                                    {cycle values="favDataDark, favDataLight" assign="rowClass"}
                                    <tr>
                                        <td class="{$rowClass}">{$v.username}</td>
                                        <td class="{$rowClass}">{$v.lastLogin}</td>
                                        <td class="{$rowClass}">
                                            <a href='{$v.sendMessageURL}{"&compose=true"|base64_encode}' class="btn button-2 send-message"  onclick='utils.sendMessage("{$v.username}","{$v.member_id}",event)'><i class="fa fa-envelope"></i> Send Message</a>
                                        </td>
                                    </tr>
                                {/foreach}
                            {else}
                                <tr class="favDataLight">
                                    <td class="favDataLight" colspan="3">You have no members in your fan club.</td>
                                </tr>
                            {/if}
                            <tr class="favHeader" style="height: 5px;" >
                                <td colspan="3"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>

        <div class="col-md-8 col-md-offset-2" style="padding-bottom: 5px;">
            {if $pageCount > 1}
                <div >
                    Page <span class="badge"> {$pageNumber} </span>
                </div>
                <div>
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                    {if $pageNumber != 1}
                        <li>
                            <a href="{$paging.prevLink}" class="defText">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    {/if}
                    {foreach from=$paging.pages item="page"}
                        <li><a href="{$page.link}">{if $pageNumber == $page.pageNo}<b>{/if}{$page.pageNo}{if $pageNumber == $page.pageNo}</b>{/if}</a></li>
                    {/foreach}
                    {if $pageCount eq $pageNumber}
                    {else}
                        <li>
                            <a href="{$paging.nextLink}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    {/if}
                        </ul>
                    </nav>
                </div>
            {else}
                <div>
                    Page [ {$pageNumber} ]
                </div>
            {/if}
        </div>
        <div class="clearfix"></div>
    </div>
</div>
