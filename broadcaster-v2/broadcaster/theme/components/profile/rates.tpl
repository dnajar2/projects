<div id="" class="col-lg-12">
    <div class="box box-primary">
        <div class="box-body box-profile">
            <div class="WindowRegion" id="RatesAndPercentages">
                <form id="frmRatesAndPercentages" name="frmRatesAndPercentages" method="POST" action="../includes/mpepost.php">
                    <input type="hidden" name="Action" value="frmRatesAndPercentages">
                    <input type="hidden" id="show" name="show" value="mpe">
                    <input type="hidden" id="mpeAction" name="mpeAction" value={$mpeAction}>
                    <input type="hidden" id="mpeUser" name="mpeUser" value={$mpeUser}>
                    <input type="hidden" id="mpeSessionName" name="mpeSessionName" value="{$smarty.session.session_name}">
                    <input type="hidden" name="{$smarty.session.session_name}" value="{$smarty.session.SessionID}">
                    <input type="hidden" id="ModelID" name="ModelID" value={$form.ModelID}>
                    <input type="hidden" id="ModelsPercentage" name="ModelsPercentage" value="{$form.ModelsPercentage}">

                    <div class="col-sm-12">
                        <p class="lead text-center">NOTE: Data in this section is for internal use, however, may also be displayed publicly.</p>
                    </div>


                        <div class="FieldGroup">
                            <div class="FieldEdit col-md-6 col-md-offset-3 form-group">
                                <div class="col-xs-12">
                                    <label for="FreeChatRate">Free Chat credits/min:</label>
                                </div>
                                <div class="col-sm-8">
                                    <select name="FreeChatRate" id="FreeChatRate" class="EditBox form-control" id="FreeChat"{if $mpeUser != $mpeAdmin && $form.fcs_status == 1} disabled="disabled"{/if}>
                                        {foreach from=$Rates item=Rate}
                                            {if $Rate.Rate >= $min_pvt_rate}
                                                <option value="{$Rate.Rate}" label="{$Rate.Rate}"
                                                    {if $Rate.Rate == $form.FreeChatRate} selected="selected" {/if} > {$Rate.Rate}</option>
                                            {/if}
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-sm-4 space-line">
                                    {if $mpeUser != $mpeAdmin && $form.fcs_status == 1}
                                    {**** Submit Buttons Disabled ****}
                                    {else}
                                    <button type="reset"
                                        id="btnStateBlockingReset"
                                        name="btnStateBlockingReset"
                                        class="btn btn-default"
                                    >Reset</button>
                                    <button type="button" class="btn button-2"
                                        onclick="myprofile.ajaxCall('#frmRatesAndPercentages',false, event)"> <i class="fa fa-save"></i> Update <i class="fa fa-refresh fa-spin" style="display: none"></i></button>
                                    {/if}
                                </div>

                            </div>
                            <div class="clearfix"></div>
                            <hr>
                            <div class="col-lg-6 col-lg-offset-3">
                                {if 1 eq 2 }
                                /min * Shows how much the model charges per minute for a private show
                                {else}
                                <div class="wlb-section">
                                    <p>This setting determines how much you charge per-minute for a private show.
                                    <strong>We initially set your rate to 2.49 credits/min and we suggest you leave it at that rate,
                                        at least until you've gotten a few private shows.</strong>
                                    <br><br>
                                    Once you start getting privates and you become more confident, you can <strong>gradually</strong> start increasing the rate.
                                    We encourage you to charge as much as possible, <strong>within reason</strong>, and we reward you with higher percentages when
                                    you charge more. If you increase the rate and you're not getting enough privates, try decreasing the rate
                                    until you start getting more privates.
                                    <br><br>
                                    You can change this setting whenever you want, <strong>except when you're broadcasting.</strong> If it doesn't allow you to change the setting,
                                    that means you're still logged into the broadcasting application. <strong>You can change your price while broadcasting from within the
                                        broadcast application.</strong>
                                    <br><br>
                                        The table below shows how much you earn for each of the available per-minute rates:</p>
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                            <tr>
                                                <th>Credits Per-Minute</th>
                                                <th>Each Credit Worth</th>
                                                <th>YOU Earn Per Minute</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>2.49 - 3.49</td>
                                                <td>$0.36</td>
                                                <td>$0.90 - $1.08</td>
                                            </tr>
                                            <tr>
                                                <td>3.99 - 4.49</td>
                                                <td>$0.41</td>
                                                <td>$1.64 - $1.84</td>
                                            </tr>
                                            <tr>
                                                <td>4.99 +</td>
                                                <td>$0.45</td>
                                                <td>$2.25+</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <p>In addition to your model commissions, you also earn a <strong>20% customer referral commission</strong>
                                        on every new customer you refer to the site. This is a <strong>lifetime commission</strong>, so <strong>you earn
                                        the 20% every time the customer spends money on our site, regardless of which models he spends
                                        it on</strong>. This means you can literally be earning money on customers <strong>even when you're not working!</strong>
                                    </p>
                                    <p>To qualify for a referral commission, the customer must visit the site for the first time, by clicking on one
                                        of the referral links or banners we provide to you.
                                    </p>
                                    <p class="text-center" style="font-size:18px">
                                        <strong><a href="/models/?c2hvdz1yZWZlcnJhbHByb2dyYW0=" class="btn button-3 btn-lg">Click here to obtain your referral links and banners.</a> </strong>
                                    </p>
                                </div>
                                {/if}
                            </div>
                            <div class="clearfix"></div>

                        </div>
                    {*need to check what to do about the bellow..... *}
                    {if $mpeUser neq $mpeModels}
                    <div class="FieldEdit">
                        <div class="col-sm-6">
                            <label for="ModelsPercentage">* Percentage:</label>
                            <input type="text" class="EditBox form-control" name="ModelsPercentage" id="ModelsPercentage" value="{$form.ModelsPercentage}" size="5" style="margin-left: 0px; margin-right: 0px">&nbsp;&nbsp;
                        </div>
                        <div class="col-xs-12">
                            <span class="EditNote col-sm-12"><strong>%</strong>&nbsp;Percentage must be between 0 and 100.</span><br>
                            <p>Model will get this % of the studio's % for every show.  <br/>
                                <strong>Example:</strong> a $100.00 show with 30% studio percentage and a 50% model percentage would net the model $15.00.</p>
                        </div>
                        <div class="clearfix"></div>

                    </div>
                    {/if}

                    {if $form.referral_code}
                        <hr/>
                        <div class="FieldGroup">
                            <span class="EditLabelRequired" id="LabelModelReferralCode"><label for="ModelReferralCode">Sign-up Referral Code:</label></span>
                            <input type="text" readonly="readonly" class="EditBox form-control" name="ModelReferralCode" id="ModelReferralCode" value="{$form.referral_code}" size="75" style="margin-left: 0px; margin-right: 0px">
                        </div>
                    {/if}
                    <div class="clearfix"></div>

                </form>
            </div>
        </div>
        <!-- /.box-body -->
    </div>
</div>
