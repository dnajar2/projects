<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">
            {if $smarty.request.from_model_swf}
                <i id="menuToggle" class="fa fa-bars" aria-hidden="true" onclick="siteMail.toggleMailMenu()"></i> &nbsp;
            {/if}
            {if $activeTab eq "Trash"}Deleted{else}{$activeTab}{/if} Messages
        </h3>

        <div class="box-tools pull-right">
            {*<div class="has-feedback">*}
                {*<input type="text" class="form-control input-sm" placeholder="Search Mail">*}
                {*<span class="glyphicon glyphicon-search form-control-feedback"></span>*}
            {*</div>*}
        </div>
        <!-- /.box-tools -->
    </div>
    <!-- /.box-header -->
    <div class="box-body no-padding">
        <div class="mailbox-controls">
            <!-- Check all button -->
            <button type="button" class="btn btn-default btn-sm checkbox-toggle {if $mailList[0].id eq 0}disabled{/if}">
                <label for="all_messages" class="fancy-checkbox" style="margin: 0">
                    <input type="checkbox" id="all_messages" />
                    <i class="fa fa-check-square-o checked"></i>
                    <i class="fa fa-square-o unchecked"></i>
                </label>
            </button>
            <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm" data-delete disabled><i class="fa fa-trash-o" title="Delete Message"></i></button>
                <button type="button" class="btn btn-default btn-sm" data-save disabled><i class="fa fa-save" title="Save Message"></i></button>
                {*<button type="button" class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>*}
            </div>
            <!-- /.btn-group -->
            <a href="/models/?{'show=maillist&activeTab=Inbox'|base64_encode}{if $smarty.request.from_model_swf}&from_model_swf=1{/if}" class="btn btn-default btn-sm">
                <i class="fa fa-refresh" title="Refresh message" onclick="$(this).addClass('fa-spin')"></i>
            </a>
            {*<div class="pull-right">*}
                {*1-50/200*}
                {*<div class="btn-group">*}
                    {*<button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>*}
                    {*<button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>*}
                {*</div>*}
                {*<!-- /.btn-group -->*}
            {*</div>*}
            <!-- /.pull-right -->
        </div>
        <div class="table-responsive mailbox-messages">
            <form id="mailList" action="">
            <table class="table table-hover table-striped">
                <tbody>
                {if $mailList[0].id neq 0}
                    <input type="hidden" name="ajax" value="yes">
                    <input type="hidden" name="requestType" id="requestType" value="">
                {foreach name=mailListLoop from=$mailList item=mailItem}
                {if $mailItem.id neq 0}
                <tr class="mailItemRow {$mailItem.StatusClass}">
                    <td style="width: 40px">
                        <div class="check-box-holder">
                            {if $mailItem.SelectState != "disabled"}
                            <label for="msg_{$mailItem.id}" class="fancy-checkbox">
                                <input type="checkbox" value="msg_{$mailItem.id}" id="msg_{$mailItem.id}" name="SelectedEmailItems[]" />
                                <i class="fa fa-check-square-o checked"></i>
                                <i class="fa fa-square-o unchecked" title="Select All Message"></i>
                            </label>
                            {else}&nbsp;{/if}
                        </div>
                    </td>
                    <td class="mailbox-star ">{if $mailItem.hasAttachment}&nbsp; <i class="fa fa-paperclip"></i>{/if}</td>
                    <td class="mailbox-name" {if $mailItem.readerLink}onClick="document.location.href='{$mailItem.readerLink}';"{/if}>

                            {if $activeTab == "Inbox"}
                                    {$mailItem.From}
                                {elseif $activeTab == "Sent"}
                                    {$mailItem.To}
                                {else}
                                    {$mailItem.To} {$mailItem.From}
                                {/if}

                    </td>
                    <td class="mailbox-subject" {if $mailItem.readerLink}onClick="document.location.href='{$mailItem.readerLink}';"{/if}>
                         <em>{$mailItem.Subject}...</em>
                    </td>
                    <td class="mailbox-attachment"></td>
                    <td class="mailbox-date">{$mailItem.sendRecvDate}</td>
                </tr>
                {/if}
                {/foreach}
                    <tr id="noMessages" style="display: none">
                        <td colspan="4" align="center">There are no more messages</td>
                    </tr>
                {else}
                    <tr>
                        <td colspan="4" align="center">There are no more messages</td>
                    </tr>
                {/if}
                </tbody>
            </table>
            </form>
            <!-- /.table -->
        </div>
        <!-- /.mail-box-messages -->
    </div>
    <!-- /.box-body -->
    <div class="box-footer no-padding">
        <div class="mailbox-controls">
            <!-- Check all button -->
            <button type="button" class="btn btn-default btn-sm checkbox-toggle">
                <label for="all_messages_sub" class="fancy-checkbox" style="margin: 0">
                    <input type="checkbox" id="all_messages_sub" />
                    <i class="fa fa-check-square-o checked"></i>
                    <i class="fa fa-square-o unchecked" title="Select All Message"></i>
                </label>
            </button>
            <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm" data-delete disabled><i class="fa fa-trash-o" title="delete message"></i></button>
                <button type="button" class="btn btn-default btn-sm" data-save disabled ><i class="fa fa-save" title="save message"></i></button>
                {*<button type="button" class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>*}
            </div>
            <!-- /.btn-group -->
            <a href="/models/?{'show=maillist&activeTab=Inbox'|base64_encode}" class="btn btn-default btn-sm">
                <i class="fa fa-refresh" title="Refresh message" onclick="$(this).addClass('fa-spin')"></i>
            </a>
            {*<div class="pull-right">*}
                {*1-50/200*}
                {*<div class="btn-group">*}
                    {*<button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>*}
                    {*<button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>*}
                {*</div>*}
                {*<!-- /.btn-group -->*}
            {*</div>*}
            <!-- /.pull-right -->
        </div>
    </div>
</div>
