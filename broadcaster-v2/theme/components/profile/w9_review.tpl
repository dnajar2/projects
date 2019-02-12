<div id="myAccount" class="col-lg-12">
    <div class="box box-primary ">
        <div class="box-body box-profile col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
            <p class="lead text-center">IRS Form W-9 Request for Taxpayer Identification Number and Certification</p>
            <p>NOTE: Information in this section is for internal use only. It is never revealed publicly.</p>

            <div class="table">
                <div>
                    {if !$admin_edit && $w9_submission_success == "success"}
                    {if $w9.user_type == "model"}
                        Your W9 has been successfully submitted into the review queue. While your W9 submission is pending review you
                        can continue to go online, however, you will not be paid commission until the approval is complete.  Approvals
                        can take 24-48 hours to process.<br />
                    {else}
                        Your W9 has been successfully submitted into the review queue. While your W9 submission is pending review your models
                        can continue to go online, however, you will not be paid commission until the approval is complete.
                        Approvals can take 24-48 hours to process.<br />
                    {/if}
                    <br />
                    You can contact support with any questions you may have regarding the review process or regarding the information
                    you've submitted for review by emailing <a href="mailto:{$_SETTINGS.SITE_PAYMENTS_EMAIL}">{$_SETTINGS.SITE_PAYMENTS_EMAIL}</a>.<br />
                    <br />
                    <a href="{$homepage_url}">Click here to continue</a> ...
                    {else}
                    <div id="formRegion" class="w9FormText">
                        {if $w9_submission_errors}
                            {$w9_submission_errors}
                        {/if}
                        {if !$admin_edit || $w9.id == -1}
                        <p>
                            {if $w9.user_type == "model"}
                                Please fill out the following information accurately. Once you submit this form your W9 will go into a review
                                queue for approval. You can however, go online and perform without approval.  You will not be paid commission
                                until the approval is complete.  Approvals can take 24-48 hours to process.
                            {else}
                                Please fill out the following information accurately. Once you submit this form your W9 will go into a review
                                queue for approval. Your models can however, go online and perform without approval of this form. You will not
                                be paid commission until the approval is complete. Approvals can take 24-48 hours to process.
                            {/if}
                        </p>
                        {if $w9.user_type == "studio"}
                            <div>
                                <strong>Studio Name</strong>: {$w9.username}
                            </div>
                        {/if}
                            {/if}
                            {if $smarty.const.__IS_DEV_SERVER}
                                <div class="text-center" style="color: #000000; border: 1px #cccccc solid;">SandBox Only&nbsp;&nbsp;&nbsp;&nbsp;<b>w9s ID:</b> {$w9.id}&nbsp;&nbsp;&nbsp;&nbsp;<b>User ID:</b> {$w9.user_id}&nbsp;&nbsp;&nbsp;&nbsp;<b>User Type:</b> {$w9.user_type}</div>
                            {/if}
                            <div class="w9FormText w9Form">
                                <div name="frmW9Input" action="{$frmW9PostUrl}" method="POST" enctype="application/x-www-form-urlencoded">
                                    <input type="hidden" name="show" id="show" value="{$show}" />
                                    <input type="hidden" name="ajax_url" id="ajax_url" value="{$frmW9PostUrl}" />
                                    <input type="hidden" name="post_to" id="post_to" value="{$post_to}" />
                                    <input type="hidden" name="admin_edit" id="admin_edit" value="{$admin_edit}" />
                                    <input type="hidden" name="Action" id="Action" value="{$mpe_action}" />
                                    <input type="hidden" id="idW9Id" name="w9[id]" value="{$w9.id}" />
                                    <input type="hidden" id="idW9Status" name="w9[status]" value="{$w9.status}" />
                                    <input type="hidden" id="idW9User_Id" name="w9[user_id]" value="{$w9.user_id}" />
                                    <input type="hidden" id="idW9User_Type" name="w9[user_type]" value="{$w9.user_type}" />
                                    <input type="hidden" id="idW9Date_Signed" name="w9[date_signed]" value="{$w9.date_signed}" />
                                    <input type="hidden" id="idW9Ip_Signed" name="w9[ip_signed]" value="{$w9.ip_signed}" />
                                    <input type="hidden" id="idW9Tin_Type" name="w9[tin_type]" value="{$w9.tin_type}" />
                                    <input type="hidden" id="mpeSessionName" name="mpeSessionName" value="{$smarty.session.session_name}" />
                                    <div id="wrapper">
                                        <div class="form-group col-md-6">
                                            <label for="idTaxName" class="w9FormText labelHilight">Name (as shown on your income tax return):</label>
                                            <input type="text" id="idTaxName" name="w9[tax_name]" class="form-control" value="{$w9.tax_name}" size="75"  maxlength="128" {if $disable_edits}disabled="disabled"{/if} />
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label for="idBusiness_Name" class="labelHilight">Business name, if different from above:</label>
                                                    <input type="text" id="idBusiness_Name" name="w9[business_name]" class="form-control" value="{$w9.business_name}" size="75"  maxlength="128" {if $disable_edits}disabled="disabled"{/if} />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group col-md-12">
                                            <label for="idAddress" class="labelHilight">Permanent Residence (street, apt. or suite no., or rural route).<br />Do not use a P.O. Box or in-care-of address:</label>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <input type="text" id="idAddress" name="w9[address]" class="form-control" size="75" value="{$w9.address}" maxlength="128" {if $disable_edits}disabled="disabled"{/if}  />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-4">
                                                <label for="idCity" class="labelHilight" >City or town:</label>
                                                <input type="text" id="idCity" name="w9[city]" class="form-control" value="{$w9.city}" size="42"  maxlength="128" {if $disable_edits}disabled="disabled"{/if} />
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="idState" class="labelHilight">State:</label>
                                                <select id="idState" name="w9[state_id]" class="form-control" {if $disable_edits}disabled="disabled"{/if} >
                                                    <option value="-1"></option>
                                                    {foreach from=$states_list item="state"}
                                                        <option value="{$state.pkStateID}" {if $state.pkStateID == $w9.state_id}selected="selected"{/if}>{$state.StateID}</option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="idZipcode" class="labelHilight">Zip Code:</label>
                                                <input type="text" id="idZipcode" name="w9[zipcode]" class="form-control" size="15" value="{$w9.zipcode}" maxlength="10"  {if $disable_edits}disabled="disabled"{/if} />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr>
                                        <div class="form-group col-md-12">
                                            <label for="idMailAddress" class="labelHilight">Mailing address (if different from above):</label>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <input type="text" id="idMailAddress" name="w9[mail_address]" class="form-control" size="75" value="{$w9.mail_address}"  {if $disable_edits}disabled="disabled"{/if} />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-4">
                                                <label for="idMailCity" class="labelHilight" maxlength="128">City or town:</label>
                                                <input type="text" id="idMailCity" name="w9[mail_city]" class="form-control" value="{$w9.mail_city}" size="42" {if $disable_edits}disabled="disabled"{/if}  />
                                            </div>
                                            <div class="col-md-4">
                                                <label for="idMailState" class="labelHilight">State:</label>
                                                <select id="idMailState" name="w9[mail_state_id]" class="form-control" {if $disable_edits}disabled="disabled"{/if} >
                                                    <option value="-1"></option>
                                                    {foreach from=$states_list item="state"}
                                                        <option value="{$state.pkStateID}" {if $state.pkStateID == $w9.mail_state_id}selected="selected"{/if}>{$state.StateID}</option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                            <div class="col-md-4">
                                                <label for="idMailZipcode" class="labelHilight">Zip Code:</label>
                                                <input type="text" id="idMailZipcode" name="w9[mail_zipcode]" class="form-control" size="15" value="{$w9.mail_zipcode}" maxlength="10" {if $disable_edits}disabled="disabled"{/if} />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr>
                                        <div class="form-group">
                                            <div class="col-md-12">Select one of the following:</div>
                                            <div class="custom-left text-sm">
                                                <input type="radio" id="idW9TypeIndividual" name="w9[w9_type]" value="Individual/Sole Proprietor" {if $w9.w9_type == "Individual/Sole Proprietor"}checked="checked"{/if} onclick="setIndividual(); hideExemptCheckBox();"  {if $disable_edits}disabled="disabled"{/if} />
                                                <label for="idW9TypeIndividual">Individual/Sole Proprietor</label>
                                            </div>
                                            <div class="custom-left text-sm">
                                                <input type="radio" id="idW9TypeCorporation" name="w9[w9_type]" value="Corporation" {if $w9.w9_type == "Corporation"}checked="checked"{/if} onclick="setNotIndividual(); showExemptCheckBox();" {if $disable_edits}disabled="disabled"{/if}  />
                                                <label for="idW9TypeCorporation">Corporation</label>
                                            </div>
                                            <div class="custom-left text-sm">
                                                <input type="radio" id="idW9TypePartnership" name="w9[w9_type]" value="Partnership" {if $w9.w9_type == "Partnership"}checked="checked"{/if} onclick="setNotIndividual(); hideExemptCheckBox();"  {if $disable_edits}disabled="disabled"{/if} />
                                                <label for="idW9TypePartnership">Partnership</label>
                                            </div>
                                            <div class="custom-left text-sm">
                                                <input type="radio" id="idW9TypeOther" name="w9[w9_type]" value="Other" {if $w9.w9_type == "Other"}checked="checked"{/if} onclick="setNotIndividual(); showExemptCheckBox(); document.getElementById( 'idW9TypeOtherEdit' ).focus();"  {if $disable_edits}disabled="disabled"{/if} />
                                                <label for="idW9TypeOther">Other</label>
                                                <input type="text" id="idW9TypeOtherEdit" name="w9[w9_type_other]" class="form-control" size="10" tabindex="-1" value="{$w9.w9_type_other}" onfocus="document.getElementById( 'idW9TypeOther' ).checked = true;" {if $disable_edits}disabled="disabled"{/if} placeholder="Other"  />
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div id="exempt_backup_holding_check"  class="hidden">
                                            <div class="form-group text-center">
                                                <input type="checkbox" id="idIsLLC" name="w9[is_llc]" {if $w9.is_llc == "yes"}checked="checked"{/if} {if $disable_edits}disabled="disabled"{/if}  />
                                                <label for="idIsLLC">Limited Liability Company. Enter the tax classification below</label>
                                                <label for="idLlcClassification">(D = disregarded entity, C = corporation, P = Partnership</label>
                                                <input type="input" id="idLlcClassification" name="w9[llc_classification]" size="3" maxlength="1" value="{$w9.llc_classification}" onblur="this.value = $P.strtoupper( this.value );" {if $disable_edits}disabled="disabled"{/if}  />
                                            </div>
                                        </div>
                                        <div>

                                        </div>
                                        <div id="employer_identification_number" class="hidden">
                                            <div class="w9FormText labelHilight" align="left" style="padding-top: 10px;">Taxpayer Identification Number</div>
                                            <div>
                                                <p>Enter your TIN below. This is your employer identification number (EIN).</p>
                                                <label for="idEinTin1">Employer Identification Number (EIN):</label></div>
                                            <input type="text" id="idEinTin1" name="w9[ein_1_tin]" size="3" value="{$w9.ein_1_tin}" maxlength="2" {if $disable_edits}disabled="disabled"{/if} />&nbsp;-&nbsp;
                                            <input type="text"  id="idEinTin2" name="w9[ein_2_tin]" value="{$w9.ein_2_tin}" size="9" maxlength="7" {if $disable_edits}disabled="disabled"{/if} />
                                        </div>
                                    </div>
                                    <div id="individual_ssn" class="visible">
                                        <div class="w9FormText" colspan="2" align="center" style="padding-top: 5px;">Enter your TIN below. Your TIN is your social security number (SSN).</div>
                                        <label for="idSsnTin1">Social Security Number (SSN):</label>
                                        <div class="w9FormText" align="left" valign="middle" style="padding-top: 10px; " >
                                                                    <span style="display: inline-flex;">
                                                                     <input type="text"
                                                                         id="idSsnTin1"
                                                                         name="w9[ssn_1_tin]"
                                                                         class="form-control"
                                                                         size="4"
                                                                         value="{$w9.ssn_1_tin}"
                                                                         maxlength="3"
                                                                         {if $disable_edits}disabled="disabled"{/if}
                                                                     />&nbsp;-
                                                                    </span>
                                            <span style="display: inline-flex;">
                                                                     <input type="text"
                                                                         id="idSsnTin2"
                                                                         name="w9[ssn_2_tin]"
                                                                         class="form-control"
                                                                         value="{$w9.ssn_2_tin}"
                                                                         size="2"
                                                                         maxlength="2"
                                                                         {if $disable_edits}disabled="disabled"{/if}
                                                                     />&nbsp;-&nbsp;
                                                                    </span>
                                            <span style="display: inline-flex;">
                                                                     <input type="text"
                                                                         id="idSsnTin3"
                                                                         name="w9[ssn_3_tin]"
                                                                         class="form-control"
                                                                         size="6"
                                                                         value="{$w9.ssn_3_tin}"
                                                                         maxlength="4"
                                                                         {if $disable_edits}disabled="disabled"{/if}
                                                                     />
                                                                    </span>
                                            &nbsp;</div>
                                    </div>
                                    <div id="exempt_from_backup_withholding" class="hidden">
                                        <input type="checkbox" id="idExemptBackupWithholding" name="w9[exempt_backup_withholding]" {if $w9.exempt_backup_withholding == "yes"}checked="checked"{/if}  {if $disable_edits}disabled="disabled"{/if} />
                                        <label for="idExemptBackupWithholding">Exempt from backup withholding</label>
                                    </div>
                                    {if !$admin_edit || $w9.id == -1}
                                        <div>
                                            <div class="w9FormText labelHilight"  align="left"style="padding-top: 15px;">Certification:</div>
                                        </div>
                                        <div>
                                            <div class="w9FormText" align="left">Under penalties of perjury, I certify that:</div>
                                        </div>
                                        <div>
                                            <div class="w9FormText" align="left">
                                                <ol style="list-style-type: decimal">
                                                    <li>The number shown on this form is my correct taxpayer identification number (or I am waiting for a number to be issued to me), and</li>
                                                    <li>
                                                        I am not subject to backup withholdings because:
                                                        <ol style="list-style-type: lower-alpha">
                                                            <li>I am exempt from backup withholdings, or</li>
                                                            <li>I have not been notified by the Internal Revenue Service (IRS) that I am subject to backup withholdings as a result of failure to report all interest or dividends, or</li>
                                                            <li>the IRS has notified me that I am no longer subject to backup withholdings</li>
                                                        </ol>
                                                        and,
                                                    </li>
                                                    <li>I am a U.S. person (including a U.S. resident alien</li>
                                                </ol>
                                            </div>
                                        </div>
                                    {/if}
                                    <div class="w9FormText" align="left"style="padding-top: 15px;">
                                        <div class="col-md-6 col-md-offset-3 text-center">
                                            <label for="idIrsNotifiedBackWithholding" class="w9FormText">
                                                <input type="checkbox"
                                                    id="idIrsNotifiedBackWithholding"
                                                    name="w9[irs_notified_back_withholding]"
                                                    {if $w9.irs_notified_back_withholding == "yes"}checked="checked"{/if}
                                                    {if $disable_edits}disabled="disabled"{/if} />
                                                Check here if you have been notified by the IRS that you are currently subject to backup withholding because you have failed to report all interest and dividends on your tax return.</label>
                                            <div class="w9FormText" align="center" style="padding-top: 15px;">Signature of U.S. person (Typing in your name acts as your signature):</div>
                                        </div>
                                    </div>


                                    <div>
                                        <div class="w9FormText col-md-6 col-md-offset-3" style="padding-top: 3px;">
                                            <input type="text" id="idSignature" name="w9[signature]" class="form-control" size="60" value="{$w9.signature}" {if $disable_edits}disabled="disabled"{/if}  />
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    {if !$admin_edit || $w9.id == -1}
                                        <div>
                                            <div class="w9FormText" align="center" style="padding-top: 15px; font-size: 10px; font-weight: bold;">The date and time of submission and your computer's IP address<br />will be recorded when you click Submit information.</div>
                                        </div>
                                    {else}
                                        <div>
                                            <div class="w9FormText" align="center">Signature Date: <b>{$w9.date_signed}</b></div>
                                        </div>
                                        <div>
                                            <div class="w9FormText" align="center">Signature IP: <b>{$w9.ip_signed}</b></div>
                                        </div>
                                        <div>
                                            <div class="w9FormText text-center">
                                                <label for="idStatus">Status:</label>
                                                <select name="w9[status]" id="idStatus" {if $disable_edits}disabled="disabled"{/if} >
                                                    <option value="pending" {if $w9.status == "pending"}selected="selected"{/if} >Pending</option>
                                                    <option value="approved" {if $w9.status == "approved"}selected="selected"{/if}>Approved</option>
                                                </select>
                                            </div>
                                        </div>
                                    {/if}
                                    {if !$admin_edit}
                                    <div>
                                        <div align="center" style="padding-top: 25px; padding-bottom: 25px;"><button type="button" class="btn button-1" onclick="submitW9(); this.blur();" >Submit</button></div>
                                    </div>
                                    <div>
                                        <div class="w9FormText" align="center" style="padding-bottom: 15px;"><a href="{$homepage_url}">Skip this for now. I don't have this information ready yet. &raquo;</a></div>
                                    </div>
                                    {elseif !$disable_edits}
                                    <div>
                                        <div class="w9FormText" align="center" valign="middle" id="ajax_response" name="ajax_response" style="padding-top: 15px;">&nbsp;</div>
                                    </div>
                                    <div>
                                        <div width="100%" align="center">
                                            <div border="0" cellspacing="0" cellpadding="0">
                                                <div>
                                                    {if $w9.id != -1}
                                                        <div align="center" style="padding-top: 15px; padding-bottom: 5px; padding-right: 25px;"><input type="button" value="View" onclick="viewW9( {$w9.user_id}, '{$w9.user_type}' ); this.blur();" /></div>
                                                        {if $in_popup}
                                                            <div align="center" style="padding-top: 15px; padding-bottom: 5px; padding-right: 25px;"><input type="button" value="Delete" onclick="deleteW9(); this.blur();" /></div>
                                                        {/if}
                                                    {/if}
                                                    <div align="center" style="padding-top: 15px; padding-bottom: 5px; padding-right: 25px;">
                                                        <button type="button"
                                                            class="btn form-submit"
                                                            onclick="adminSubmitW9(); this.blur();"
                                                        >Submit</button>
                                                        <button type="button"
                                                            class="btn button-2"
                                                            onclick="resetW9(); this.blur();"
                                                        >Reset</button>
                                                        {if $in_popup}
                                                            <input type="button" value="Close" onclick="closeW9(); this.blur();" />
                                                        {/if}
                                                    </div>
                                                </div>
                                            </div>
                                            {/if}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {if $mpeUser == $mpeModels && $w9.id != -1}
                            <div class="col-sm-12 text-center">
                                Please email support at <a href="mailto:{$_SETTINGS.SITE_PAYMENTS_EMAIL}">{$_SETTINGS.SITE_PAYMENTS_EMAIL}</a> to change your W9 details
                            </div>
                        {/if}
                    {/if}
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <!-- /.box-body -->
    </div>
</div>
