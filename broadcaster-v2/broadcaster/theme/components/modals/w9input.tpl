<div class="modal fade" id="modal-w9" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">
                    {if $admin_edit && $in_popup}
                        IRS Form W-9 Request for {$w9.username} - {$w9.user_id}
                    {elseif !$admin_edit}
                        IRS Form W-9 Request for Taxpayer Identification Number and Certification
                    {/if}
                </h4>
            </div>
            <div class="modal-body">
                <script src="{$CDN_SCHEMA}/js/php_namespaced_mini.js"></script>
                {literal}
                <script language="JavaScript" type="text/javascript">
                    <!--
                    $P = new PHP_JS;

                    function setW9Type()
                    {
                        with ( document )
                        {
                            if ( getElementById( "idW9TypeIndividual" ).checked )
                            {
                                setIndividual();
                                hideExemptCheckBox();
                            }
                            else if ( getElementById( "idW9TypeCorporation" ).checked )
                            {
                                setNotIndividual();
                                showExemptCheckBox();
                            }
                            else if ( getElementById( "idW9TypePartnership" ).checked )
                            {
                                setNotIndividual();
                                hideExemptCheckBox();
                            }
                            else if ( getElementById( "idW9TypeOther" ).checked )
                            {
                                setNotIndividual();
                                showExemptCheckBox();
                            }
                        }
                    }

                    function submitW9(){
                        if ( w9Validated() ){
                            document.frmW9Input.submit();
                        }
                    }

                    function resetW9()
                    {
                        document.frmW9Input.reset();
                        setW9Type();
                    }

                    function adminSubmitW9()
                    {
                        if ( w9Validated() )
                        {
                            with ( document )
                            {
                                var ajax = new oAjax( getElementById( "ajax_url" ).value, handleSubmit );
                                var params  = "&show="+getElementById( "post_to" ).value;
                                params += "&ajax_request=post";
                                params += "&mpeSessionName="+getElementById( "mpeSessionName" ).value;
                                params += "&Action="+getElementById( "Action" ).value;
                                params += "&w9[id]="+getElementById( "idW9Id" ).value;
                                params += "&w9[user_id]="+getElementById( "idW9User_Id" ).value;
                                params += "&w9[user_type]="+getElementById( "idW9User_Type" ).value;
                                params += "&w9[date_signed]="+getElementById( "idW9Date_Signed" ).value;
                                params += "&w9[ip_signed]="+getElementById( "idW9Ip_Signed" ).value;
                                params += "&w9[tin_type]="+getElementById( "idW9Tin_Type" ).value;
                                params += "&w9[tax_name]="+getElementById( "idTaxName" ).value;
                                params += "&w9[business_name]="+getElementById( "idBusiness_Name" ).value;
                                params += "&w9[address]="+getElementById( "idAddress" ).value;
                                params += "&w9[city]="+getElementById( "idCity" ).value;
                                params += "&w9[state_id]="+getElementById( "idState" ).value;
                                params += "&w9[zipcode]="+getElementById( "idZipcode" ).value;
                                params += "&w9[mail_address]="+getElementById( "idMailAddress" ).value;
                                params += "&w9[mail_city]="+getElementById( "idMailCity" ).value;
                                params += "&w9[mail_state_id]="+getElementById( "idMailState" ).value;
                                params += "&w9[mail_zipcode]="+getElementById( "idMailZipcode" ).value;

                                if ( getElementById( "idW9TypeIndividual" ).checked )
                                {
                                    params += "&w9[w9_type]="+getElementById( "idW9TypeIndividual" ).value;
                                }
                                else if ( getElementById( "idW9TypeCorporation" ).checked )
                                {
                                    params += "&w9[w9_type]="+getElementById( "idW9TypeCorporation" ).value;
                                }
                                else if ( getElementById( "idW9TypePartnership" ).checked )
                                {
                                    params += "&w9[w9_type]="+getElementById( "idW9TypePartnership" ).value;
                                }
                                else if ( getElementById( "idW9TypeOther" ).checked )
                                {
                                    params += "&w9[w9_type]="+getElementById( "idW9TypeOther" ).value;
                                }

                                params += "&w9[w9_type_other]="+getElementById( "idW9TypeOtherEdit" ).value;

                                if ( getElementById( "idIsLLC" ).checked )
                                {
                                    params += "&w9[is_llc]="+getElementById( "idIsLLC" ).value;
                                    params += "&w9[llc_classification]="+getElementById( "idLlcClassification" ).value;
                                }

                                params += "&w9[ein_1_tin]="+getElementById( "idEinTin1" ).value;
                                params += "&w9[ein_2_tin]="+getElementById( "idEinTin2" ).value;
                                params += "&w9[ssn_1_tin]="+getElementById( "idSsnTin1" ).value;
                                params += "&w9[ssn_2_tin]="+getElementById( "idSsnTin2" ).value;
                                params += "&w9[ssn_3_tin]="+getElementById( "idSsnTin3" ).value;

                                if ( getElementById( "idExemptBackupWithholding" ).checked )
                                {
                                    params += "&w9[exempt_backup_withholding]="+getElementById( "idExemptBackupWithholding" ).value;
                                }

                                if ( getElementById( "idIrsNotifiedBackWithholding" ).checked )
                                {
                                    params += "&w9[irs_notified_back_withholding]="+getElementById( "idIrsNotifiedBackWithholding" ).value;
                                }

                                params += "&w9[signature]="+getElementById( "idSignature" ).value;

                                try
                                {
                                    params += "&w9[status]="+getElementById( "idStatus" ).value;
                                }
                                catch (e)
                                {
                                    params += "&w9[status]=pending";
                                }

                                ajax.update( params, "POST"  );
                            }
                        }
                    }

                    function deleteW9( username )
                    {
                        if ( confirm( "Are you sure you want to delete " + username + "'s W9?\nThis will permanently remove it ..." ) )
                        {
                            with ( document )
                            {
                                var ajax = new oAjax( getElementById( "ajax_url" ).value, handleSubmit );
                                var params  = "&show="+getElementById( "post_to" ).value;
                                params += "&ajax_request=delete";
                                params += "&w9_id="+getElementById( "idW9Id" ).value;
                                params += "&w9_user_id="+getElementById( "idW9User_Id" ).value;
                                params += "&w9_user_type="+getElementById( "idW9User_Type" ).value;
                                params += "&mpeSessionName="+getElementById( "mpeSessionName" ).value;

                                ajax.update( params, "POST" );
                            }
                        }
                    }

                    function handleSubmit( r, s, p )
                    {
                        if ( s == 200 )
                        {
                            if ( r == "success" )
                            {
                                if ( window.opener == null )
                                {
                                    document.getElementById( "ajax_response" ).innerHTML = "<span style=\"color: #008000;\">The W9 Form was successfully posted!</span>";

                                    if ( document.getElementById( "idW9Id" ).value == -1 )
                                    {
                                        document.getElementById( "ajax_response" ).innerHTML = "<span style=\"color: #008000;\">The W9 Form was successfully posted! Reloading in 5 seconds...</span>";
                                        setTimeout( "window.location.reload();", 5000 );
                                    }
                                }
                                else
                                {
                                    window.opener.location.reload();
                                    window.close();
                                }
                            }
                            else
                            {
                                if ( document.getElementById( "ajax_response" ) )
                                {
                                    document.getElementById( "ajax_response" ).innerHTML = "<span style=\"color: #8B0000;\">There was an error posting the W9 Form!</span>";
                                }
                                else
                                {
                                    alert( "There was an error posting the changes to the W9" );
                                }
                            }
                        }
                    }

                    function closeW9()
                    {
                        window.close();
                    }

                    function viewW9( user_id, user_type )
                    {
                        var url = {/literal}"{$viewW9Url}";{literal}
                        OpenWindow( url + "?" + "show=w9manager&Action=frmW9Input&ajax_request=view&w9_user_id="+user_id+"&w9_user_type="+user_type+"&mpeSessionName="+document.getElementById("mpeSessionName").value, "viewW9", 1024, 768, true );

                        return (false);
                    }

                    function w9Validated()
                    {
                        var w9_is_valid = true;

                        with ( document )
                        {
                            try
                            {
                                if ( getElementById( "idTaxName" ).value == "" )
                                {
                                    getElementById( "idTaxName" ).focus();
                                    alert( "Name can not be empty or blank!" );
                                    w9_is_valid = false;
                                }
                                else if ( getElementById( "idAddress" ).value == "" )
                                {
                                    getElementById( "idAddress" ).focus();
                                    alert( "Permanent Residence can not be empty or blank!" );
                                    w9_is_valid = false;
                                }
                                else if ( hasPOBox( getElementById( "idAddress" ).value ) )
                                {
                                    getElementById( "idAddress" ).focus();
                                    getElementById( "idAddress" ).select();
                                    alert( "Please do not use a P.O. Box for your Permanent Residence" );
                                    w9_is_valid = false;
                                }
                                else if ( hasInCareOf( getElementById( "idAddress" ).value ) )
                                {
                                    getElementById( "idAddress" ).focus();
                                    getElementById( "idAddress" ).select();
                                    alert( "Please do not use \"in-care-of\" for your Permanent Residence" );
                                    w9_is_valid = false;
                                }
                                else if ( getElementById( "idCity" ).value == "" )
                                {
                                    getElementById( "idCity" ).focus();
                                    getElementById( "idCity" ).select();
                                    alert( "City or Town can not be empty or blank!" );
                                    w9_is_valid = false;
                                }
                                else if ( getElementById( "idState" ).value == "-1" )
                                {
                                    getElementById( "idState" ).focus();
                                    alert( "Please select a state!" );
                                    w9_is_valid = false;
                                }
                                else if ( !validateZipcode( getElementById( "idZipcode" ).value ) )
                                {
                                    getElementById( "idZipcode" ).focus();
                                    getElementById( "idZipcode" ).select();
                                    alert( "The zip code does not appear to be valid!" );
                                    w9_is_valid = false;
                                }

                                if ( w9_is_valid && getElementById( "idMailAddress" ).value != "" )
                                {
                                    if ( hasPOBox( getElementById( "idMailAddress" ).value ) )
                                    {
                                        getElementById( "idMailAddress" ).focus();
                                        getElementById( "idMailAddress" ).select();
                                        alert( "Please do not use a P.O. Box for your mailing address!" );
                                        w9_is_valid = false;
                                    }
                                    else if ( hasInCareOf( getElementById( "idMailAddress" ).value ) )
                                    {
                                        getElementById( "idMailAddress" ).focus();
                                        getElementById( "idMailAddress" ).select();
                                        alert( "Please do not use \"in-care-of\" for your mailing address!" );
                                        w9_is_valid = false;
                                    }
                                    else if ( getElementById( "idMailCity" ).value == "" )
                                    {
                                        getElementById( "idMailCity" ).focus();
                                        getElementById( "idMailCity" ).select();
                                        alert( "Mailing address city or town can not be empty or blank!" );
                                        w9_is_valid = false;
                                    }
                                    else if ( getElementById( "idMailState" ).value == "-1" )
                                    {
                                        getElementById( "idMailState" ).focus();
                                        alert( "Please select a mailing address state!" );
                                        w9_is_valid = false;
                                    }
                                    else if ( !validateZipcode( getElementById( "idMailZipcode" ).value ) )
                                    {
                                        getElementById( "idMailZipcode" ).focus();
                                        getElementById( "idMailZipcode" ).select();
                                        alert( "The mailing address zip code does not appear to be valid!" );
                                        w9_is_valid = false;
                                    }
                                }

                                if ( w9_is_valid && getElementById( "idW9TypeIndividual" ).checked )
                                {
                                    if ( getElementById( "idSsnTin1" ).value == "" )
                                    {
                                        getElementById( "idSsnTin1" ).focus();
                                        alert( "Please complete the social security number (SSN)!" );
                                        w9_is_valid = false;
                                    }
                                    else if ( !is_digits( getElementById( "idSsnTin1" ).value, 3 ) )
                                    {
                                        getElementById( "idSsnTin1" ).focus();
                                        getElementById( "idSsnTin1" ).select();
                                        alert( "The social security number (SSN) you've entered does not appear to be valid" );
                                        w9_is_valid = false;
                                    }
                                    else if ( getElementById( "idSsnTin2" ).value == "" )
                                    {
                                        getElementById( "idSsnTin2" ).focus();
                                        alert( "Please complete the social security number (SSN)!" );
                                        w9_is_valid = false;
                                    }
                                    else if ( !is_digits( getElementById( "idSsnTin2" ).value, 2 ) )
                                    {
                                        getElementById( "idSsnTin2" ).focus();
                                        getElementById( "idSsnTin2" ).select();
                                        alert( "The social security number (SSN) you've entered does not appear to be valid" );
                                        w9_is_valid = false;
                                    }
                                    else if ( getElementById( "idSsnTin3" ).value == "" )
                                    {
                                        getElementById( "idSsnTin3" ).focus();
                                        alert( "Please complete the social security number (SSN)!" );
                                        w9_is_valid = false;
                                    }
                                    else if ( !is_digits( getElementById( "idSsnTin3" ).value, 4 ) )
                                    {
                                        getElementById( "idSsnTin3" ).focus();
                                        getElementById( "idSsnTin3" ).select();
                                        alert( "The social security number (SSN) you've entered does not appear to be valid" );
                                        w9_is_valid = false;
                                    }
                                }
                                else if ( w9_is_valid && getElementById( "idW9TypeCorporation" ).checked || getElementById( "idW9TypePartnership" ).checked || getElementById( "idW9TypeOther" ).checked )
                                {
                                    if ( getElementById( "idW9TypeOther" ).checked && getElementById( "idW9TypeOtherEdit" ).value == "" )
                                    {
                                        getElementById( "idW9TypeOtherEdit" ).focus();
                                        alert( "Please specify a reason for Other!" );
                                        w9_is_valid = false;
                                    }
                                    else if ( getElementById( "idIsLLC" ).checked && getElementById( "idLlcClassification" ).value == "" )
                                    {
                                        getElementById( "idLlcClassification" ).focus();
                                        alert( "Please indicate the classification of the Limited Liability Corporation (LLC)!" );
                                        w9_is_valid = false;
                                    }
                                    else if ( getElementById( "idIsLLC" ).checked && getElementById( "idLlcClassification" ).value != "D" && getElementById( "idLlcClassification" ).value != "C" && getElementById( "idLlcClassification" ).value != "P" )
                                    {
                                        getElementById( "idLlcClassification" ).focus();
                                        getElementById( "idLlcClassification" ).select();
                                        alert( "In-correct LLC Classification; please only enter \"D\", \"C\", or \"P\"" );
                                        w9_is_valid = false;
                                    }
                                    else if ( getElementById( "idEinTin1" ).value == "" )
                                    {
                                        getElementById( "idEinTin1" ).focus();
                                        alert( "Please complete the employer identification number (EIN)!" );
                                        w9_is_valid = false;
                                    }
                                    else if (!is_digits( getElementById( "idEinTin1" ).value, 2 ) )
                                    {
                                        getElementById( "idEinTin1" ).focus();
                                        getElementById( "idEinTin1" ).select();
                                        alert( "The employer identification number (EIN) you've entered does not appear to be valid" );
                                        w9_is_valid = false;
                                    }
                                    else if ( getElementById( "idEinTin2" ).value == "" )
                                    {
                                        getElementById( "idEinTin2" ).focus();
                                        alert( "Please complete the employer identification number (EIN)!" );
                                        w9_is_valid = false;
                                    }
                                    else if (!is_digits( getElementById( "idEinTin2" ).value, 7 ) )
                                    {
                                        getElementById( "idEinTin2" ).focus();
                                        getElementById( "idEinTin2" ).select();
                                        alert( "The employer identification number (EIN) you've entered does not appear to be valid" );
                                        w9_is_valid = false;
                                    }
                                }

                                if ( w9_is_valid == true )
                                {
                                    if ( getElementById( "idSignature" ).value == "" || getElementById( "idSignature" ).value.length == 0 )
                                    {
                                        getElementById( "idSignature" ).focus();
                                        alert( "Please sign the form by typing your name!" );
                                        w9_is_valid = false;
                                    }
                                }
                            }
                            catch (e)
                            {
                                alert( e );
                            }
                        }

                        return ( w9_is_valid );
                    }

                    function hasPOBox( value )
                    {
                        value = $P.strtolower( $P.str_replace( " ", "", $P.str_replace( ".", "", value ) ) );

                        return ( $P.strpos( value, "pobox" ) !== false );
                    }

                    function hasInCareOf( value )
                    {
                        value = $P.strtolower( $P.str_replace( " ", "", $P.str_replace( "-", "", $P.str_replace( ".", "", value ) ) ) );

                        return ( $P.strpos( value, "incareof" ) !== false );
                    }

                    function validateZipcode( value )
                    {
                        return ( value.match(/\b[0-9]{5}(?:-[0-9]{4})?\b/) );
                    }

                    function is_digits( value, num_digits )
                    {
                        var digits = new RegExp( '\\b[0-9]{'+num_digits+'}\\b', "g" );
                        return digits.test( value );
                    }

                    function setIndividual()
                    {
                        with ( document )
                        {
                            getElementById( "idExemptBackupWithholding" ).checked = false;
                            getElementById( "exempt_backup_holding_check" ).className = "hidden";
                            getElementById( "employer_identification_number" ).className = "hidden";
                            getElementById( "individual_ssn" ).className = "visible";
                        }
                    }

                    function setNotIndividual()
                    {
                        with ( document )
                        {
                            getElementById( "exempt_backup_holding_check" ).className = "visible";
                            getElementById( "employer_identification_number" ).className = "visible";
                            getElementById( "individual_ssn" ).className = "hidden";
                        }
                    }

                    function showExemptCheckBox()
                    {
                        document.getElementById( "exempt_from_backup_withholding" ).className = "visible";
                    }

                    function hideExemptCheckBox()
                    {
                        document.getElementById( "exempt_from_backup_withholding" ).className = "hidden";
                    }

                    -->
                </script>
                {/literal}
                {if $mpeUser eq $mpeModels}
                    <div class="FieldGroup">
                        <span class="FieldEdit">
                            <div class="col-sm-12 form-group">
                                <span class="EditLabelRequired" id="LabelUsername">
                                    NOTE: Information in this section is for internal use only. It is never revealed publicly.
                                </span>
                            </div>
                        </span>
                    </div>
                {/if}
                <div>
                    {if !$admin_edit && $w9_submission_success == "success"}
                        <div  class="w9FormText formDescription">
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
                        </div>
                    {else}
                        <div id="formRegion" class="w9FormText">
                            <div id="main-row">
                                {if $w9_submission_errors}
                                    <div>
                                        <p class="text-center error">{$w9_submission_errors}</p>
                                    </div>
                                {/if}
                                {if !$admin_edit || $w9.id == -1}
                                    <div  class="w9FormText formDescription">
                                        {if $w9.user_type == "model"}
                                            Please fill out the following information accurately. Once you submit this form your W9 will go into a review
                                            queue for approval. You can however, go online and perform without approval.  You will not be paid commission
                                            until the approval is complete.  Approvals can take 24-48 hours to process.
                                        {else}
                                            Please fill out the following information accurately. Once you submit this form your W9 will go into a review
                                            queue for approval. Your models can however, go online and perform without approval of this form. You will not
                                            be paid commission until the approval is complete. Approvals can take 24-48 hours to process.
                                        {/if}
                                    </div>
                                {if $w9.user_type == "studio"}
                                    <div class="col-xs-12">
                                        <b>Studio Name</b>: {$w9.username}
                                    </div>
                                {/if}
                                {/if}
                                {if $smarty.const.__IS_DEV_SERVER}
                                    <div class="col-xs-12">
                                        SandBox Only&nbsp;&nbsp;&nbsp;&nbsp;<b>w9s ID:</b> {$w9.id}&nbsp;&nbsp;&nbsp;&nbsp;<b>User ID:</b> {$w9.user_id}&nbsp;&nbsp;&nbsp;&nbsp;<b>User Type:</b> {$w9.user_type}
                                    </div>
                                {/if}
                                <div class="w9FormText w9Form" width="100%" >
                                    <form name="frmW9Input" action="{$frmW9PostUrl}" method="POST" enctype="application/x-www-form-urlencoded">
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
                                        <div class="col-md-6">
                                            <label for="idTaxName">Name (as shown on your income tax return):</label>
                                            <input
                                                type="text"
                                                id="idTaxName"
                                                name="w9[tax_name]"
                                                class="form-control"
                                                value="{$w9.tax_name}"
                                                size="75"
                                                maxlength="128" {if $disable_edits}disabled="disabled"{/if} />
                                        </div>

                                        <div class="col-md-6">
                                            <label for="idBusiness_Name">Business name, if different from above:</label>
                                            <input
                                                type="text" id="idBusiness_Name"
                                                name="w9[business_name]"
                                                class="form-control"
                                                value="{$w9.business_name}"
                                                size="75"
                                                maxlength="128" {if $disable_edits}disabled="disabled"{/if} />
                                        </div>
                                        <div class="col-md-6">
                                            <label for="idAddress" class="labelHilight">
                                                Permanent Residence (street, apt. or suite no., or rural route).<br />Do not use a P.O. Box or in-care-of address:
                                            </label>
                                            <input type="text"
                                                id="idAddress"
                                                name="w9[address]"
                                                class="form-control"
                                                size="75"
                                                value="{$w9.address}" maxlength="128" {if $disable_edits}disabled="disabled"{/if} />
                                        </div>
                                        <div class="col-md-6">
                                            <table>
                                                <tr>
                                                    <td class="w9FormText labeltd" ><label for="idCity" class="labelHilight" >City or town:</label><br>
                                                        <input type="text" id="idCity" name="w9[city]" class="form-control" value="{$w9.city}" size="36"  maxlength="128" {if $disable_edits}disabled="disabled"{/if} />
                                                    </td>
                                                    <td class="w9FormText labeltd" ><label for="idState" class="labelHilight">State:</label><br>
                                                        <select id="idState" name="w9[state_id]" class="form-control" style="padding: 0" {if $disable_edits}disabled="disabled"{/if} >
                                                            <option value="-1">Select</option>
                                                            {foreach from=$states_list item="state"}
                                                                <option value="{$state.pkStateID}" {if $state.pkStateID == $w9.state_id}selected="selected"{/if}>{$state.StateID}</option>
                                                            {/foreach}
                                                        </select>
                                                    </td>
                                                    <td class="w9FormText labeltd" ><label for="idZipcode" class="labelHilight">Zip Code:</label><br>
                                                        <input type="text" id="idZipcode" name="w9[zipcode]" class="form-control" size="15" value="{$w9.zipcode}" maxlength="10"  {if $disable_edits}disabled="disabled"{/if} />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="clearfix">
                                            <hr>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="idMailAddress" class="labelHilight">Mailing address (if different from above):</label>
                                            <input type="text"
                                                id="idMailAddress"
                                                name="w9[mail_address]"
                                                class="form-control"
                                                size="75"
                                                value="{$w9.mail_address}"  {if $disable_edits}disabled="disabled"{/if} />
                                        </div>
                                        <div class="col-md-6">
                                            <table>
                                                <tr>
                                                    <td class="w9FormText labeltd"  style="padding-right: 0; padding-top: 0">
                                                        <label for="idMailCity" class="labelHilight" maxlength="128">City or town:</label><br>
                                                        <input type="text" id="idMailCity" name="w9[mail_city]" class="form-control" value="{$w9.mail_city}" size="36" {if $disable_edits}disabled="disabled"{/if}  />
                                                    </td>
                                                    <td class="w9FormText labeltd"  style="padding-right: 0; padding-top: 0">
                                                        <label for="idMailState" class="labelHilight">State:</label><br>
                                                        <select id="idMailState" name="w9[mail_state_id]" class="form-control" style="padding: 0" {if $disable_edits}disabled="disabled"{/if} >
                                                            <option value="-1">Select</option>
                                                            {foreach from=$states_list item="state"}
                                                                <option value="{$state.pkStateID}" {if $state.pkStateID == $w9.mail_state_id}selected="selected"{/if}>{$state.StateID}</option>
                                                            {/foreach}
                                                        </select>
                                                    </td>
                                                    <td class="w9FormText labeltd"  style="padding: 0"><label for="idMailZipcode" class="labelHilight">Zip Code:</label><br>
                                                        <input type="text" id="idMailZipcode" name="w9[mail_zipcode]" class="form-control" size="15" value="{$w9.mail_zipcode}" maxlength="10" {if $disable_edits}disabled="disabled"{/if} />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div><strong>Select one of the following:</strong></div>
                                        <div id="fillingStatus">
                                            <label for="idW9TypeIndividual">
                                                <input type="radio"
                                                    id="idW9TypeIndividual"
                                                    name="w9[w9_type]"
                                                    value="Individual/Sole Proprietor"
                                                    {if $w9.w9_type == "Individual/Sole Proprietor"}checked="checked"{/if}
                                                    onclick="setIndividual(); hideExemptCheckBox();"
                                                    {if $disable_edits}disabled="disabled"{/if} />Individual/Sole Proprietor</label>
                                            <label for="idW9TypeCorporation">
                                                <input type="radio"
                                                    id="idW9TypeCorporation"
                                                    name="w9[w9_type]"
                                                    value="Corporation"
                                                    {if $w9.w9_type == "Corporation"}checked="checked"{/if}
                                                    onclick="setNotIndividual();
                                                        showExemptCheckBox();"
                                                    {if $disable_edits}disabled="disabled"{/if}  />Corporation</label>
                                            <label for="idW9TypePartnership">
                                                <input type="radio"
                                                    id="idW9TypePartnership"
                                                    name="w9[w9_type]"
                                                    value="Partnership"
                                                    {if $w9.w9_type == "Partnership"}checked="checked"{/if}
                                                    onclick="setNotIndividual(); hideExemptCheckBox();"
                                                    {if $disable_edits}disabled="disabled"{/if} />Partnership</label>
                                            <label for="idW9TypeOther">
                                                <input type="radio"
                                                    id="idW9TypeOther"
                                                    name="w9[w9_type]"
                                                    value="Other" {if $w9.w9_type == "Other"}checked="checked"{/if}
                                                    onclick="setNotIndividual(); showExemptCheckBox(); document.getElementById( 'idW9TypeOtherEdit' ).focus();"
                                                    {if $disable_edits}disabled="disabled"{/if} />Other</label>
                                            <input type="text"
                                                id="idW9TypeOtherEdit"
                                                name="w9[w9_type_other]"
                                                class="form-control"
                                                size="10"
                                                tabindex="-1"
                                                value="{$w9.w9_type_other}"
                                                onfocus="document.getElementById( 'idW9TypeOther' ).checked = true;"
                                                {if $disable_edits}disabled="disabled"{/if}  />
                                        </div>
                                        <div border="0" cellspacing="0" cellpadding="0" {if $in_popup}style="padding-bottom: 10px;"{/if}>
                                            <div id="exempt_backup_holding_check"  class="hidden">
                                                <div class="w9FormText"  style="padding-top: 5px;">
                                                    <div border="0" cellspacing="0" cellpadding="0">
                                                        <div>
                                                            <div class="w9FormText" style="padding-right: 3px;">
                                                                <label for="idIsLLC">
                                                                <input type="checkbox" id="idIsLLC" name="w9[is_llc]" {if $w9.is_llc == "yes"}checked="checked"{/if} {if $disable_edits}disabled="disabled"{/if}  />
                                                                Limited Liability Company. Enter the tax classification below</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <label for="idLlcClassification">(D = disregarded entity, C = corporation, P = Partnership</label>
                                                        <input type="text" id="idLlcClassification" name="w9[llc_classification]" size="3" maxlength="1" value="{$w9.llc_classification}" onblur="this.value = $P.strtoupper( this.value );" {if $disable_edits}disabled="disabled"{/if}  />
                                                    </div>
                                                </div>
                                            </div>

                                            <div>
                                                <strong>Taxpayer Identification Number</strong>
                                            </div>
                                            <div id="employer_identification_number" class="hidden">
                                                <div class="w9FormText">Enter your TIN below. This is your employer identification number (EIN).</div>
                                                <div class="w9FormText"><label for="idEinTin1">Employer Identification Number (EIN):</label>
                                                    <input type="text" id="idEinTin1" name="w9[ein_1_tin]" size="3" value="{$w9.ein_1_tin}" maxlength="2" {if $disable_edits}disabled="disabled"{/if} />&nbsp;-&nbsp;
                                                    <input type="text"  id="idEinTin2" name="w9[ein_2_tin]" value="{$w9.ein_2_tin}" size="9" maxlength="7" {if $disable_edits}disabled="disabled"{/if} />
                                                </div>

                                            </div>

                                            <div id="individual_ssn" class="visible">
                                                <div class="w9FormText" colspan="2"  style="padding-top: 5px;">Enter your TIN below. Your TIN is your social security number (SSN).</div>
                                                <div>
                                                    <div class="w9FormText"  valign="middle"  style="padding-top: 10px; padding-left: 35px; padding-right: 5px;"><label for="idSsnTin1">Social Security Number (SSN):</label></div>
                                                    <div class="w9FormText"  valign="middle" style="padding-top: 10px; " >
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
                                            </div>
                                            <div id="exempt_from_backup_withholding" class="hidden">
                                                <div class="w9FormText">
                                                    <label for="idExemptBackupWithholding">
                                                        <input type="checkbox"
                                                                id="idExemptBackupWithholding"
                                                                name="w9[exempt_backup_withholding]"
                                                                {if $w9.exempt_backup_withholding == "yes"}checked="checked"{/if}
                                                                {if $disable_edits}disabled="disabled"{/if} />Exempt from backup withholding</label>
                                                </div>
                                            </div>
                                            {if !$admin_edit || $w9.id == -1}
                                                <div class="w9FormText labelHilight" style="padding-top: 15px;">Certification:</div>
                                                <div class="w9FormText" >Under penalties of perjury, I certify that:</div>
                                                <div class="w9FormText" >
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
                                            {/if}
                                            <div class="w9FormText" style="padding-right: 5px; width: 90%; margin: auto;">
                                                <label for="idIrsNotifiedBackWithholding">
                                                <input type="checkbox" id="idIrsNotifiedBackWithholding" name="w9[irs_notified_back_withholding]" {if $w9.irs_notified_back_withholding == "yes"}checked="checked"{/if}  {if $disable_edits}disabled="disabled"{/if} />
                                                Check here if you have been notified by the IRS that you are currently subject to backup withholding because you have failed to report all interest and dividends on your tax return.</label>
                                            </div>
                                            <div class="w9FormText text-center">Signature of U.S. person (Typing in your name acts as your signature):</div>
                                            <div class="w9FormText"  style="padding-top: 3px;">
                                                <div class="col-md-3">&nbsp;</div>
                                                <div class="col-md-6">
                                                    <input type="text"
                                                        id="idSignature"
                                                        name="w9[signature]"
                                                        class="form-control"
                                                        size="60"
                                                        value="{$w9.signature}" {if $disable_edits}disabled="disabled"{/if}  />
                                                </div>
                                            </div>
                                            {if !$admin_edit || $w9.id == -1}
                                                <div class="w9FormText text-center col-xs-12">
                                                    The date and time of submission and your computer's IP address<br />will be recorded when you click Submit information.
                                                </div>
                                            {else}
                                                <div class="w9FormText" >Signature Date: <b>{$w9.date_signed}</b></div>
                                                <div class="w9FormText" >Signature IP: <b>{$w9.ip_signed}</b></div>
                                                <div class="w9FormText"   style="padding-top: 15px;">
                                                    <div border="0" cellspacing="0" cellpadding="0" width="100%">
                                                        <div>
                                                            <div  valign="middle" width="50%" style="padding-right: 15px;"><label for="idStatus">Status:</label></div>
                                                            <div  valign="middle" width="50%"><select name="w9[status]" id="idStatus" {if $disable_edits}disabled="disabled"{/if} ><option value="pending" {if $w9.status == "pending"}selected="selected"{/if} >Pending</option><option value="approved" {if $w9.status == "approved"}selected="selected"{/if}>Approved</option></select></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            {/if}
                                            {if !$admin_edit}
                                                <div class="clearfix"></div>
                                                <div class="text-center"  style="padding-top: 25px; padding-bottom: 25px;">
                                                    <button class="btn button-2" onclick="submitW9(); this.blur();">SUBMIT</button>
                                                </div>
                                                <div class="w9FormText text-center"  style="padding-bottom: 15px;"><a href="{$homepage_url}">Skip this for now. I don't have this information ready yet. &raquo;</a></div>
                                            {elseif !$disable_edits}
                                            <div class="w9FormText"  id="ajax_response" name="ajax_response" style="padding-top: 15px;">&nbsp;</div>
                                            <div>
                                                {if $w9.id != -1}
                                                    <div  style="padding-top: 15px; padding-bottom: 5px; padding-right: 25px;"><input type="button" value="View" onclick="viewW9( {$w9.user_id}, '{$w9.user_type}' ); this.blur();" /></div>
                                                    {if $in_popup}
                                                        <div  style="padding-top: 15px; padding-bottom: 5px; padding-right: 25px;"><input type="button" value="Delete" onclick="deleteW9(); this.blur();" /></div>
                                                    {/if}
                                                {/if}
                                                <div  style="padding-top: 15px; padding-bottom: 5px; padding-right: 25px;">
                                                    <button type="button"
                                                        class="btn form-submit"
                                                        onclick="adminSubmitW9(); this.blur();"
                                                    >Submit</button>
                                                    <div  style="padding-top: 15px; padding-bottom: 5px; padding-right: 25px;">
                                                        <button type="button"
                                                            class="btn button-2"
                                                            onclick="resetW9(); this.blur();"
                                                        >Reset</button>
                                                        {if $in_popup}
                                                            <div  style="padding-top: 15px; padding-bottom: 5px;">
                                                                <button type="button" onclick="closeW9(); this.blur();">Close</button>
                                                            </div>
                                                        {/if}
                                                    </div>
                                                </div>
                                            </div>
                                            {/if}
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    {/if}
                </div>


                <script language="JavaScript" type="text/javascript">
                    <!--

                    setW9Type();

                    {if !$admin_edit && $w9_submission_success == null}
                    document.getElementById( "idTaxName" ).focus();
                    {/if}

                    -->
                </script>

            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

