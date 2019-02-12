<div id="myAccount" class="col-lg-12">
    <div class="box box-primary">
        <div class="box-body box-profile col-md-8 col-md-offset-2">
            <div class="WindowRegion" id="PaymentInformation">
                <form id="frmPaymentInfo" name="frmPaymentInfo" method="POST" action="../includes/mpepost.php">
                    <input type="hidden" name="Action" value="frmPaymentInfo">
                    <input type="hidden" name="show" value="mpe">
                    <input type="hidden" name="mpeAction" value="{$mpeAction}">
                    <input type="hidden" name="mpeUser" value="{$mpeUser}">
                    <input type="hidden" id="mpeSessionName" name="mpeSessionName" value="{$smarty.session.session_name}">
                    <input type="hidden" name="{$smarty.session.session_name}" value="{$smarty.session.SessionID}">
                    <input type="hidden" name="ModelID" value={$form.ModelID}>

                    <div class="FieldGroup lead text-center">
                        NOTE: Information in this section is for internal use only. It is never revealed publicly.
                    </div>


                    <div id="payment-info-container">
                        {if $mpeAction != $mpeInsert}
                            <!-- start -->
                            <div style="padding-left: 15px;">
                                <strong>Pay Periods</strong>
                                <div>Bi-Weekly - 1st through the 15th (paid on 25th) 16th through 30/31st (paid on 10th of following month)</div>
                               <div style="padding-top: 10px;">
                                   <strong>Payout Minimum</strong>
                                   <div>{include file="wcc1/components/min_payouts.tpl" methods=$paymentMethods}</div>
                               </div>
                            </div>

                            <div style="padding: 10px 15px; ">
                                <strong><label for="methodID">W9 Form:</label></strong>
                                {if $form.w9}
                                    {if $form.w9.status == "approved"}
                                        On File and Approved
                                    {else}
                                        On File and Pending
                                    {/if}
                                {else}
                                    Not On File
                                {/if}
                                <hr>
                            </div>
                            <!-- end -->
                        {/if}
                        <div class="payout-section col-sm-6" >
                            <div>*<b><label for="methodID">Payment Method:</label></b></div>
                            <div>
                                {if $mpeUser neq $mpeManager and ($mpeAction eq $mpeInsert or $mpeAction eq $mpeEdit)}
                                    <select name="methodID" id="methodID" onChange="ChangeMethod(this);" class="form-control">
                                        {foreach from=$paymentMethods key=k item=v}
                                            <option value="{$v.id}"{if $v.id == $form.method.id} selected{/if}>{$v.name}</option>
                                        {/foreach}
                                    </select>
                                {else}
                                    {$form.method.name}
                                {/if}
                            </div>
                        </div>

                        {if $mpeUser neq $mpeManager and ($mpeAction eq $mpeInsert or $mpeAction eq $mpeEdit)}
                            {***************************** CHECK INFO *****************************}
                            <div class="hide" id="layer_{$PAYOUT_METHOD_CHECK}">
                                {*** PAYABLE TO ***}
                                <div class="payout-section col-sm-6">
                                    <div>*<b><label for="checkPayableTo">Payable To:</label></b></div>
                                    <div>
                                        <input type="text" name="checkPayableTo" id="checkPayableTo_{$PAYOUT_METHOD_CHECK}" class="form-control"  value="{$form.method.checkPayableTo}">
                                    </div>
                                </div>

                                {*** Address ***}
                                <div class="payout-section col-sm-6">
                                    <div>* <b><label for="checkAddress">Address:</label></b></font></div>
                                    <div>
                                        <input type="text" name="checkAddress" id="checkAddress_{$PAYOUT_METHOD_CHECK}" class="form-control" value="{$form.method.checkAddress}">
                                    </div>
                                </div>

                                {*** City ***}
                                <div class="payout-section col-sm-6">
                                    <div>* <b><label for="checkCity">City:</label></b></font></div>
                                    <div>
                                        <input type="text" name="checkCity" id="checkCity_{$PAYOUT_METHOD_CHECK}" class="form-control"  value="{$form.method.checkCity}">
                                    </div>
                                </div>

                                {*** State ***}
                                <div class="payout-section col-sm-6">
                                    <div align="left">* <b><label for="checkStateID">State:</label></b></font></div>
                                    <div>
                                        <select name="checkStateID" id="checkStateID_{$PAYOUT_METHOD_CHECK}" class="form-control" onchange="fixCountryInput( document.getElementById('checkStateID'), document.getElementById('checkCountryID') );">
                                            {foreach from=$States key=k item=v}
                                                <option value="{$v.StateID}"{if $form.method && $v.StateID == $form.method.checkStateID} selected{/if}>{$v.StateName}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                                {*** Zip ***}
                                <div class="payout-section col-sm-6">
                                    <div>*<b><label for="checkZip">Zip Code:</label></b></div>
                                    <div>
                                        <input type="text" name="checkZip" id="checkZip_{$PAYOUT_METHOD_CHECK}" class="form-control" value="{$form.method.checkZip}">
                                    </div>
                                </div>
                                {*** Country ***}
                                <div class="payout-section col-sm-6">
                                    <div>*<b><label for="checkCountryID">Country:</label></b></font></div>
                                    <div>
                                        <select name="checkCountryID" id="checkCountryID_{$PAYOUT_METHOD_CHECK}" class="form-control" onchange="fixStateInput( document.getElementById('checkStateID'), document.getElementById('checkCountryID') );">
                                            {foreach from=$Countries key=k item=v}
                                                <option value="{$v.CountryID}"{if $form.method && $v.CountryID == $form.method.checkCountryID} selected{/if}>{$v.CountryName}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                {*** THRESHOLD ***}
                                <div class="col-lg-12">
                                    <strong>Note:</strong> The minimum payout for {$methods_sorted[$PAYOUT_METHOD_CHECK].name} is <b>${$methods_sorted[$PAYOUT_METHOD_CHECK].min_payout}</b>.
                                </div>
                            </div>
                            {***************************** Epassporte Info *****************************}
                            <div class="hide" id="layer_{$PAYOUT_METHOD_EPASSPORTE}">
                                {*** ID ***}
                                <div>
                                    <div>*<b><label for="epassporteID">Epassporte ID:</label></b></div>
                                    <input type="text" name="epassporteID" id="epassporteID_{$PAYOUT_METHOD_EPASSPORTE}" size="40" value="{$form.method.epassporteID}">
                                </div>

                                {*** THRESHOLD ***}
                                <div class="col-lg-12">
                                    <strong>Note:</strong> The minimum payout for {$methods_sorted[$PAYOUT_METHOD_EPASSPORTE].name} is <strong>${$methods_sorted[$PAYOUT_METHOD_EPASSPORTE].min_payout}</strong>.
                                </div>
                            </div>
                            {***************************** Paypal Info *****************************}
                            <div class="payout-section col-sm-6">
                                <div class="hide" id="layer_{$PAYOUT_METHOD_PAYPAL}">
                                    {*** email ***}
                                    <div>
                                        <div>* <strong><label for="paypalEmail">Email Address:</label></strong></div>
                                        <input
                                            type="text"
                                            name="paypalEmail"
                                            id="paypalEmail_{$PAYOUT_METHOD_PAYPAL}"
                                            class="form-control"
                                            value="{$form.method.paypalEmail}"
                                            {if $form.payment_information_locked}disabled{/if}
                                        >
                                    </div>
                                    {*** THRESHOLD ***}
                                    <div class="col-lg-12">
                                        <strong>Note:</strong> The minimum payout for {$methods_sorted[$PAYOUT_METHOD_PAYPAL].name} is <strong>${$methods_sorted[$PAYOUT_METHOD_PAYPAL].min_payout}</strong>.

                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>

                            {***************************** Payoneer *****************************}

                            <div class="payout-section col-sm-6">
                                <div class="hide" id="layer_{$PAYOUT_METHOD_PAYONEER}">
                                    {if $mpeAction == $mpeInsert}
                                        You will be provided with a link to register your Payoneer card in your models area after your model application has been approved.
                                    {else}
                                        {include file="wcc1/components/payoneer_history.tpl" history=$payoneer_history url=$payoneer_url method=$form.method}
                                    {/if}
                                </div>
                            </div>

                            {***************************** Paxum Info *****************************}

                            <div class="payout-section col-sm-6">
                                <div class="hide" id="layer_{$PAYOUT_METHOD_PAXUM}">
                                    {*** email ***}
                                    <div>
                                        <div>* <b><label for="paxum_email">Paxum Email:</label></b></div>
                                        <input
                                            type="text"
                                            name="paxum_email"
                                            id="paxum_email"
                                            class="form-control"
                                            value="{$form.method.paxum_email}"
                                            {if $form.payment_information_locked}disabled{/if}
                                        >
                                    </div>
                                    {*** THRESHOLD ***}
                                    <div class="col-lg-12">
                                        <strong>Note:</strong> The minimum payout for {$methods_sorted[$PAYOUT_METHOD_PAXUM].name} is <strong>${$methods_sorted[$PAYOUT_METHOD_PAXUM].min_payout}</strong>.
                                    </div>
                                </div>
                            </div>

                            {***************************** Bankwire Info *****************************}

                            <div class="hide" id="layer_{$PAYOUT_METHOD_BANKWIRE}">

                                {*** swift code ***}
                                <div class="payout-section col-sm-6">
                                    <div>* <b><label for="bankwireSwiftCode">Swift Code:</label></b></div>
                                    <div>
                                        <input
                                            type="text"
                                            name="bankwireSwiftCode"
                                            id="bankwireSwiftCode_{$PAYOUT_METHOD_BANKWIRE}"
                                            class="form-control"
                                            value="{$form.method.bankwireSwiftCode}"
                                        >
                                    </div>
                                </div>

                                {*** bank name ***}
                                <div class="payout-section col-sm-6">
                                    <div>* <b><label for="bankwireBankName">Bank Name:</label></b></div>
                                    <input
                                        type="text"
                                        name="bankwireBankName"
                                        id="bankwireBankName_{$PAYOUT_METHOD_BANKWIRE}"
                                        class="form-control"
                                        value="{$form.method.bankwireBankName}"
                                    >
                                </div>
                                {*** bank address ***}
                                <div class="payout-section col-sm-6">
                                    <div>*<strong><label for="bankwireBankAddress">Bank Address:</label></strong></div>
                                    <input
                                        type="text"
                                        name="bankwireBankAddress"
                                        id="bankwireBankAddress_{$PAYOUT_METHOD_BANKWIRE}"
                                        class="form-control"
                                        value="{$form.method.bankwireBankAddress}"
                                    >
                                </div>
                                {*** account name ***}
                                <div class="payout-section col-sm-6">
                                    <div>* <strong><label for="bankwireAccountName">Account Name:</label></strong></div>
                                    <input
                                        type="text"
                                        name="bankwireAccountName"
                                        id="bankwireAccountName_{$PAYOUT_METHOD_BANKWIRE}"
                                        class="form-control"
                                        value="{$form.method.bankwireAccountName}"
                                    >
                                </div>

                                {*** account number ***}
                                <div class="payout-section col-sm-6">
                                    <div align="left">* <b><label for="bankwireAccountNumber">Account Number:</label></b></div>
                                    <input
                                        type="text"
                                        name="bankwireAccountNumber"
                                        id="bankwireAccountNumber_{$PAYOUT_METHOD_BANKWIRE}"
                                        class="form-control"
                                        value="{$form.method.bankwireAccountNumber}"
                                    >
                                </div>

                                {*** routing number ***}
                                <div class="payout-section col-sm-6">
                                    <div>* <strong><label for="bankwireRoutingNumber">Routing Number:</label></strong></div>
                                    <input
                                        type="text"
                                        name="bankwireRoutingNumber"
                                        id="bankwireRoutingNumber_{$PAYOUT_METHOD_BANKWIRE}"
                                        class="form-control"
                                        value="{$form.method.bankwireRoutingNumber}"
                                    >
                                </div>

                                {*** iban ***}
                                <div class="payout-section col-sm-6">
                                    <div>* <b><label for="bankwireIban">Iban:</label></b></div>
                                    <input
                                        type="text"
                                        name="bankwireIban"
                                        id="bankwireIban_{$PAYOUT_METHOD_BANKWIRE}"
                                        class="form-control"
                                        value="{$form.method.bankwireIban}">
                                </div>

                                {*** other ***}
                                <div class="payout-section col-sm-6">
                                    <div>* <b><label for="bankwireOther">Other:</label></b></div>
                                    <textarea name="bankwireOther" id="bankwireOther_{$PAYOUT_METHOD_BANKWIRE}" rows="5" cols="35">{$form.method.bankwireOther}</textarea>
                                </div>
                                <div class="clearfix"></div>
                                {*** THRESHOLD ***}
                                <div>
                                    <div>&nbsp;</div>
                                    <div class="col-lg-12">
                                        <b>Note:</b> The minimum payout for {$methods_sorted[$PAYOUT_METHOD_BANKWIRE].name} is <b>${$methods_sorted[$PAYOUT_METHOD_BANKWIRE].min_payout}</b>.
                                    </div>
                                </div>
                            </div>
                        {/if}
                    </div>

                    {if $mpeUser == $mpeModels && $form.payment_information_locked}
                        <div class="clearfix"></div>
                        <div class="ButtonBar" style="padding-top: 15px">
                            <div align="center">
                                Please contact model liaison to modify or change your payment information.
                            </div>
                        </div>
                    {else}
                        <div class="ButtonBar">
                            <div class="LeftAlign">
                                <span class="ErrorMessage" id="PaymentInfoErrorMessage"></span>
                            </div>
                            <div class="RightAlign">
                                {if $mpeAction == $mpeEdit}
                                    <button type="reset"
                                        id="btnStateBlockingReset"
                                        name="btnStateBlockingReset"
                                        class="btn button-2"
                                    >Reset</button>
                                    <button type="button" class="btn button-1"
                                        onclick="myprofile.ajaxCall('#frmPaymentInfo',false. event)"> <i class="fa fa-save"></i> Update <i class="fa fa-refresh fa-spin" style="display: none"></i></button>
                                    <br>
                                {/if}
                            </div>
                        </div>
                    {/if}
                </form>
            </div>

        </div>
        <!-- /.box-body -->
        <div class="clearfix"></div>
    </div>
</div>
