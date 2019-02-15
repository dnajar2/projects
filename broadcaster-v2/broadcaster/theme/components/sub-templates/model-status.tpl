{*wcc tool tip is css based*}
<div class="text-center">
    <ul class="model-status-list">
        {if $isMissingPrimePhoto}
            <li class="wcc-tooltip" style="display: block">
                <i class="fa fa-times text-danger"></i> Profile Photo - Missing
                <span class="tip-trigger pull-right">
                    <i class="fa fa-question"></i>
                </span>
                <span class="tooltiptext">
                    <a href="/models/?c2hvdz1teXBob3Rvcw==">Click here</a> to upload a photo</span>
            </li>
        {/if}
        {foreach from=$topNotifications k='key' item="notification" }
            {if $notification.class}
            <li class="wcc-tooltip" style="display: block">
                <i class="{$notification.class}"></i> {$notification.message}
                {if $notification.tool_tip}
                <span class="tip-trigger pull-right">
                    <i class="fa fa-question"></i>
                </span>
                <span class="{*tip-text*}tooltiptext">
                    {if $notification.id eq 'model_id'}
                    Upload a photo of your ID <a href="#" data-toggle="modal" data-target="#image-examples" @click="toggle('showModalIdExample')">click here</a> to see an example.
                    {elseif $notification.id eq 'holding_id'}
                       Upload of photo of you Holding your ID <a href="#" data-toggle="modal" data-target="#image-examples" @click="toggle('showHoldingIdExample')">click here</a> to see an example.
                    {elseif $notification.id eq 'docs'}
                        {if $show eq 'home'}
                       Please click the below button to complete the e-signing process
                        {else}
                        Please click the "e-sign documents button" below to complete the digital signature process.
                        {/if}
                    {/if}
                </span>
                    {/if}
            </li>
            {/if}
        {/foreach}
    </ul>
</div>

<!-- image modal -->
<div id="image-examples" class="modal fade" tabindex="-1" role="dialog" ref="vuemodal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">
                   <span v-if="showHoldingIdExample">Holding ID Example</span>
                   <span v-if="showModalIdExample">Model ID Example</span>

                </h4>
            </div>
            <div class="modal-body">
                <div v-if="showHoldingIdExample">
                    <p>Upload a photo of you holding  your ID Next to your face. Both your face and your ID must be in the
                    picture and the ID must be NEXT to your face, NOT blocking and part of yur face.</p>
                    <div class="col-md-8 col-md-offset-2">
                        <img src="{$_PATH_IMG}/GoodIDMatch.jpg" alt="Holding ID Example" class="img-responsive">
                    </div>
                </div>
                <div v-if="showModalIdExample">
                    <p>Upload a photo of your Government - issue photo ID. <br>Examples of acceptable ID's includes Driver's
                    License, State ID Card, Passport, Military ID, Postal ID, etc...</p>
                    <div class="col-md-8 col-md-offset-2">
                        <img src="{$_PATH_IMG}/GoodIDImage.jpg" alt="Model ID Example" class="img-responsive">
                    </div>

                </div>
                <div class="clearfix"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
