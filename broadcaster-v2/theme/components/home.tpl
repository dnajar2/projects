<div id="grid">
    {if $applicationStatus neq 'Approved'}
        <!-- missing docs -->
        <div id="missingDoc" class="info-card col-lg-8">
            <div class="box box-primary">
                <div class="box no-top-border">
                    <div class="box-header with-border">
                        <h3 class="box-title">Application Status</h3>
                    </div>
                    <div class="box-body text-center col-md-10 col-md-offset-1" style="">
                        <strong>YOUR PROFILE IS NOT YET APPROVED.</strong>
                        <br><br>
                        {*To get your profile approved, submit any missing items listed in the Application Status section.*}
                        {*Also, make sure you've uploaded at least one photo to your.*}
                        {include file="models/v2/components/sub-templates/model-status.tpl"}
                        <br>
                        After you submit these items, it should take <strong>one day</strong> for us to approve your profile.
                        <br>
                        <strong>Note: our compliance department is closed on weekends.</strong>
                        <br><br>
                        {if $notes }
                            {******** NOTES *********}
                            <div class="notesTxt col-md-6 col-md-offset-3">
                                <div class="text-bold">Your Model Application is Pending based on the following:</div>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <tbody>
                                        <tr>
                                            <th>Date Reviewed</th>
                                            <th>Issue Found</th>
                                        </tr>
                                        {foreach from=$notes key=k item=v}
                                            <tr>
                                                <td style="width: 150px"><b>{$v.posted_datetime}</b></td>
                                                <td>{$v.note_text}</td>
                                            </tr>
                                        {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="clrearfix"></div>
                        {/if}
                        <div class="col-lg-12">
                            Please check this page daily.
                            <br>Click the button below to view and reply to updates on your application status.
                        </div>

                        <div class="text-center">
                            <a href="/models/?show=myprofile&Action=ModelID&mpeAction=1&mpeUser=2&ModelID={$modelInfo.ModelID}&section=docRev"
                                class="btn button-2"><i class="fa fa-hand-o-right" aria-hidden="true"></i> &nbsp; Click here to review application.</a>
                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- / end of profile-->
    {/if}
    <!-- model profile -->
    <div class="info-card col-lg-4 col-md-6 col-sm-6 col-xs-12">
        <div class="box box-primary">
            <div class="box no-top-border">
                <div class="box-header with-border">
                    <h3 class="box-title">Profile Photo</h3>
                </div>
                <div class="box-body text-center" style="">
                    <img class="profile-user-img img-responsive img-circle" src="{$photoURL}" alt="{$modelInfo.Username}">
                    <br>
                    <h3 class="profile-username">{$modelInfo.Username}</h3>
                    {if $modelInfo.Status neq "1"}
                    <p>
                        Model application status: <strong>{$applicationStatus}</strong>
                    </p>
                    {/if}
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="pull-right">
                        <a href="{$photosModifyURL}&tId=v2" class="btn button-2" title="Add More Photos"><i class="fa fa-pencil" aria-hidden="true"></i> &nbsp; Add More Photos</a>
                    </div>
                    {*go live button *}
                    <div class="pull-left goOnline{if $modelCantGoOnline} disabled{/if}" {literal}v-if="!fcs_status"{/literal}>
                        <span>
                            <a href="/models/"
                                class="btn btn-danger"
                                {if $modelCantGoOnline}
                                onclick="utils.cantGoOnline(event); return false"
                                {else}
                                data-startshow
                                onClick="{if $needsSignedNudeFreeChatAgreement || $needsUpdatedReleaseForm}open_nudity_freechat_notice();{else}openChatPopUp('/models/model_unload.php');{/if} utils.toggleFcsStatus(); return false;"
                                {/if}
                                ><i class="fa fa-toggle-on " aria-hidden="true"></i> <span>Go Online</span></a>
                        </span>
                    </div>

                </div>
                <!-- /.box-footer-->
            </div>
        </div>
    </div>
    <!-- / end of profile-->
    {if $modelInfo.status eq "1"}
    <div class="info-card col-lg-4 col-md-6 col-sm-6 col-xs-12">
        <div class="box box-primary">
            <div class="box no-top-border">
                <div class="box-header with-border">
                    <h3 class="box-title">Current Schedule</h3>
                </div>
                <div class="box-body" style="">
                    {foreach from=$days key=index item=day name="scheduleLoop"}
                        <div class="bottom-border">
                            <div class="col-xs-6 bg-info">
                                {$day|capitalize}
                            </div>
                            <div class="col-xs-6">
                                {if $schedule[$day]}
                                    {$schedule[$day].fromHourModel}{$schedule[$day].fromMeridiemModel} - {$schedule[$day].toHourModel}{$schedule[$day].toMeridiemModel}
                                {else}
                                    n/a
                                {/if}
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    {/foreach}
                </div>
                <!-- /.box-body -->
                <div class="box-footer text-right">
                    <a href="{$scheduleURL}" class="btn button-2" title="Modify My Online Schedule"><i class="fa fa-pencil" aria-hidden="true"></i> &nbsp; Modify My Online Schedule</a>
                </div>
                <!-- /.box-footer-->
            </div>
        </div>
    </div>
    <!-- / Schedule -->
    {/if}
    {*<!-- fix for small devices only -->*}
    {*<div class="clearfix visible-sm-block"></div>*}
    {if $modelInfo.status eq "1"}
    <div class="info-card col-lg-4 col-md-6 col-sm-6 col-xs-12">
        <div class="box box-primary">
            <div class="box no-top-border">
                <div class="box-header with-border">
                    <h3 class="box-title">Previous Private/Nude Shows</h3>
                </div>
                <div class="box-body">
                    {if !$premiumChats}
                        <p class="text-center"><strong>You haven't done any shows yet!</strong></p>
                    {else}
                        <div class="bottom-border clearfix">
                            <div class="col-xs-4"><strong>Member</strong></div>
                            <div class="col-xs-4 text-center"><strong>Date:</strong></div>
                            <div class="col-xs-4 no-padding"><strong>Send Message</strong></div>
                        </div>
                        {foreach from=$premiumChats key=k item=v}
                            <div class="clearfix table-row">
                                <div class="col-xs-4"><strong>
                                        <small>{$v.member}</small>
                                    </strong></div>
                                <div class="col-xs-4">{$v.dateStartFmtNoTime}</div>
                                <div class="col-xs-4 text-center">
                                    <a href='/models/?{'show=mailCompose'|base64_encode}'
                                        class="btn button-2 send-message btn-xs"
                                        onclick='utils.popNewMessage("{$v.member}","{$v.memberID}", event)'>
                                        <i class="fa fa-envelope"></i> Message
                                    </a>
                                </div>

                            </div>
                        {/foreach}
                    {/if}
                </div>
                <!-- /.box-body -->
                {if $premiumChats}
                    <div class="box-footer text-right">
                        <a href="{$statsURL}" class="btn button-2"><i class="fa fa-line-chart" aria-hidden="true"></i> &nbsp; View My Stats</a>
                    </div>
                    <!-- /.box-footer-->
                {/if}
            </div>
        </div>
    </div>
    <!-- / Previous shows -->
    {/if}

    <div class="info-card col-lg-4 col-md-6 col-sm-6 col-xs-12 ">
        <div class="box box-primary">
            <div class="box no-top-border">
                <div class="box-header with-border">
                    <h3 class="box-title">Profile Information</h3>
                </div>
                {if $modelInfo.Firstname}
                <div class="box-body no-padding table-responsive">
                    <table class="table table-striped">
                        <tr>
                            <td>
                                <strong>Name:</strong> {$modelInfo.Firstname} {$modelInfo.Lastname}
                            </td>
                            <td>
                                <strong>Height:</strong> {$modelInfo.Height}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Weight:</strong> {$modelInfo.Weight}
                            </td>
                            <td>
                                <strong>Bra Size:</strong> {$modelInfo.BraSize}
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <strong>Hair Color:</strong> {$modelInfo.HairColor}
                            </td>
                            <td>
                                <strong>Eye Color:</strong> {$modelInfo.EyeColor}
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <strong>Ethnicity:</strong> {$modelInfo.Ethnicity}
                            </td>
                        </tr>
                    </table>
                </div>
                {else}
                <div class="text-center">
                    click the bellow button to edit your personal information.
                    <br>
                    <a href="{$ProfileURL}&section=info" class="btn button-2"><i class="fa fa-pencil"></i> &nbsp; Personal Information</a>
                </div>
                {/if}
                <!-- /.box-body -->

                <div class="box-footer text-right" style="">
                    {if $modelInfo.Firstname}
                    <a href="/models/?show=myprofile&Action=ModelID&mpeAction=1&mpeUser=2&ModelID={$modelInfo.ModelID}&section=about"
                        class="btn button-2"
                        title="Modify My Profile Information"><i class="fa fa-pencil" aria-hidden="true"></i> &nbsp; Modify My Profile Information
                    </a>
                    {/if}
                </div>
                <!-- /.box-footer-->
            </div>
        </div>
    </div>
    <!-- / Brief Profile Information -->
    {if $modelInfo.status eq "1"}
    <!-- model referral -->
    <div class="info-card col-lg-4 col-md-6 col-sm-6 col-xs-12">
        <div class="box box-primary">
            <div class="box no-top-border">
                {*<div class="box-header with-border">*}
                    {*<h3 class="box-title">Referral Program</h3>*}
                {*</div>*}
                <div class="box-body text-center" style="position: relative">
                    <div class="lead">Make more money by referring NEW customers to your live chat room! Send them to:</div>
                    <input id="default-link"
                        onclick="this.select();"
                        data-name="Profile Link"
                        data-type="link"
                        value="{$referral_url}"
                        readonly="readonly"
                        class="form-control"
                    >
                    <div class="wcc-tooltip">
                        <span onclick="utils.copyText('#default-link', '#default-page-tip')" onmouseout="utils.clearToolTip('#default-page-tip')">
                        <span id="default-page-tip" class="tooltiptext">Click to Copy to Clipboard</span>
                        (<span class="link">copy link above</span>)
                    </span>
                    </div>

                    <div class="small">
                        If a <strong>NEW</strong> visitor signs up after clicking your link, you'll receive a <strong>20% BONUS commission</strong> on
                        everything he spends on the site for the <strong>rest of his life!</strong> This is <strong>in addition</strong> to the regular model commissions
                        you earn when he spends money on you. To get credit for a customer, he must click on your link the <strong>FIRST</strong> time he visits our site.
                        To get more links and banners and to view your referral stats, go to the <a href="/models/?{'show=referralprogram'|base64_encode}" class="link" title="Referral Program">Referral Program</a> page.
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer text-right">

                </div>
                <!-- /.box-footer-->
            </div>
        </div>
    </div>
    <!-- / end of model referral -->
    {/if}
    {if $whitelabel_settings.show_training_vids}
        <div class="info-card col-lg-4 col-md-6 col-sm-6 col-xs-12">
            <div class="box box-primary">
                <div class="box no-top-border">
                    <div class="box-header with-border">
                        <h3 class="box-title">Training Videos</h3>
                    </div>
                    <div class="box-body no-padding table-responsive">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/{$whitelabel_settings.show_training_vids}"></iframe>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
            </div>
        </div>
        <!-- / training videos -->
    {/if}
    {if $whitelabel_settings.model_support}
        <div class="info-card col-lg-4 col-md-6 col-sm-6 col-xs-12">
            <div class="box box-primary">
                <div class="box no-top-border">
                    <div class="box-header with-border">
                        <h3 class="box-title">Need Remote Support?</h3>
                    </div>
                    <div class="box-body">
                        <span><a href="http://support.webcamadmin.com" target="_blank">Run our remote support application</a> and a technician will connect to your computer to troubleshoot your issue. After you connect, <strong>please contact us via <a href="javascript:;" onclick="parent.$crisp.do('chat:open')">Live Support</a></strong> or send a text message to +1-305-930-6969, to inform us that you're connected and waiting for support.</span>

                    </div>
                    <!-- /.box-body -->
                </div>
            </div>
        </div>
        <!-- / Brief Tech support -->
    {/if}

</div>
