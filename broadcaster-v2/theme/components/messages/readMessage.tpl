<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">
            {if $smarty.request.from_model_swf}
                <i id="menuToggle" class="fa fa-bars" aria-hidden="true" onclick="siteMail.toggleMailMenu()"></i> &nbsp;
            {/if}
            Read Mail</h3>
        {if $msgSentSuccessfully}
            {$msgSentSuccessfully}
        {else}
            {if $errorMessages}
                {$errorMessages}
            {/if}
        {/if}
        {*<div class="box-tools pull-right">*}
            {*<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="" data-original-title="Previous"><i class="fa fa-chevron-left"></i></a>*}
            {*<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="" data-original-title="Next"><i class="fa fa-chevron-right"></i></a>*}
        {*</div>*}
    </div>
    <!-- /.box-header -->
    <div class="box-body no-padding">
        <div class="mailbox-read-info">
            <h3>{$messageDetail.subject}</h3>
            <h5>From: {$messageDetail.from_username}
                <span class="mailbox-read-time pull-right">{$messageDetail.sendRecvDate}</span></h5>
        </div>
        <!-- /.mailbox-read-info -->
        <div class="mailbox-controls with-border text-center">
            <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-container="body" title="Delete" data-original-title="Delete" data-delete="mailReader">
                    <i class="fa fa-trash-o"></i></button>
                {if $activeTab neq "Sent"}
                <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-container="body" title="reply" data-original-title="Reply" data-reply>
                    <i class="fa fa-reply"></i></button>
                {/if}
                {*<button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-container="body" title="" data-original-title="Forward">*}
                    {*<i class="fa fa-share"></i></button>*}
            </div>
            <!-- /.btn-group -->
            {*<button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" title="" data-original-title="Print">*}
                {*<i class="fa fa-print"></i></button>*}
        </div>
        <!-- /.mailbox-controls -->
        <div class="mailbox-read-message">
            {$messageDetail.body}
        </div>
        <!-- /.mailbox-read-message -->
    </div>
    <!-- /.box-body -->
    {if $messageDetail.hasAttachment}
    <div class="box-footer">
        <h3>Attachments:</h3>
        <ul class="mailbox-attachments clearfix">
            <li>
                <span class="mailbox-attachment-icon"><a href="{$messageDetail.attachmentURL}"><img src="{$messageDetail.attachmentURL}" alt="" class="img-thumbnail"></a></span>

                <div class="mailbox-attachment-info" style="position: relative">
                    <a href="{$messageDetail.attachmentURL}" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> {$messageDetail.fileName}</a>
                    <span class="mailbox-attachment-size">
                          <a href="{$messageDetail.attachmentURL}" class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a>
                        </span>
                </div>
            </li>
        </ul>
    </div>
    {/if}
    <!-- /.box-footer -->
    <div class="box-footer">
            <input type="hidden" name="reply_to" value="{$messageDetail.id}">
            {*<input type="hidden" name="reply" value="yes">*}
            <input type="hidden" name="ajax" value="yes">
            <input type="hidden" name="mailSubject" value="{$messageDetail.subject}">
            <input type="hidden" name="username" value="{$messageDetail.from_username}">
            <div id="reply" class="form-group" style="display: none">
                <hr style="border-top:2px solid #292929">
                <div class="form-group col-md-6">
                    <label for="member">Reply To:</label>
                    <input type="text" name="member" id="member" class="form-control" value="{$messageDetail.from_username}" disabled>
                </div>
                <div class="form-group col-sm-12">
                    <label for="rpl_message">Message Reply: </label>
                    <textarea name="mailMessage" id="mailMessage" cols="30" rows="10" class="form-control"></textarea>
                    <br>
                </div>
                <div class="pull-right">
                    <button type="button" class="btn btn-default" data-trigger data-posttype="reply" onclick="$(this).find('.fa').show()" disabled> <i class="fa fa-envelope"></i> Send <i class="fa fa-refresh fa-spin" style="display:none;"></i></button>
                </div>
                <div class="pull-left">
                    <button type="button" class="btn btn-default" onclick="siteMail.close('#reply','#replyForm')"> <i class="fa fa-times"></i> Cancel</button>
                </div>
                <div class="clearfix"></div>
            </div>
        <div class="pull-right">
           {if $activeTab neq "Sent"}
               <button type="button" class="btn btn-default" title="reply" data-reply><i class="fa fa-reply"></i> Reply</button>
           {/if}
            {*<button type="button" class="btn btn-default"><i class="fa fa-share"></i> Forward</button>*}
        </div>
        <button type="button" class="btn btn-default" data-delete="mailReader" onclick="$(this).find('.fa-refresh').show()"><i class="fa fa-trash-o"></i> Delete <i class="fa fa-refresh fa-spin" style="display: none"></i></button>
        {*<button type="button" class="btn btn-default"><i class="fa fa-print"></i> Print</button>*}
    </div>
    <!-- /.box-footer -->
</div>
