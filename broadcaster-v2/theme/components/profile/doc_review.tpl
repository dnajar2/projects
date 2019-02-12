{*on side menu as Application Status*}
{*{assign var="mpeInsert" value=0}*}
{*{assign var="mpeEdit" value=1}*}

{*{assign var="mpeAdmin" value=0}*}
{*{assign var="mpeManager" value=1}*}
{*{assign var="mpeModels" value=2}*}
{assign var="filler" value="..............................................."}
{assign var="no_delete_filler" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;....&nbsp;&nbsp;&nbsp;&nbsp;"}

{assign var="has_document_issues" value=false}
{assign var="can_submit" value=false}
<div id="myAccount" class="col-lg-12">
    <div class="box box-primary">
        <div class="box-body box-profile col-md-8 col-md-offset-2">
            <h3 class="lead text-center">Model Application Status</h3>
            <div class="application-status text-center">Your application is: <span class="text-bold {if $applicationStatus eq 'Approved'}text-success{else}text-danger{/if}">{$applicationStatus}</span> </div>
            {if $applicationStatus neq 'Approved'}
                {include file="models/v2/components/sub-templates/model-status.tpl"}
            {/if}
            <br>
            {if $notes }
                <div class="col-md-8 col-md-offset-2">
                        {******** NOTES *********}
                        <div class="notesTxt">
                            <div class="text-bold text-center">Your Model Application is Pending based on the following:</div>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                    <tr>
                                        <th>Date Reviewed</th>
                                        <th>Issue Found</th>
                                    </tr>
                                    {foreach from=$notes key=k item=v}
                                    <tr>
                                        <td><b>{$v.posted_datetime}</b></td>
                                        <td>{$v.note_text}</td>
                                    </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    <div class="clearfix"></div>
                    <p class="bold-text">
                        You must correct the above issue(s) before we can approve your model account. After you correct the issue(s), please allow
                        ONE BUSINESS DAY for us to review your updated ID photos and/or documents. This message will NOT change until AFTER we complete the review process.
                    </p>
                    <hr>
                </div>
            {/if}
            {*Document list*}
            <div class="col-md-10 col-md-offset-1 table-responsive" id="DocumentReview" {*style="background-color: #E6EBEE; height: 46vh;"*}>
                {*<iframe src="{$mpeModelsDocumentsFrame}"*}
                    {*id="DocumentReviewFrame" name="DocumentReviewFrame" width="100%" frameborder="0" align="center" scrolling="no" style="background-color: transparent; height: 44vh;">*}
                    {**}
                {*</iframe>*}
                <form id="frmDocumentReview" name="frmDocumentReview" method="POST" action="/includes/mpepost.php" enctype="multipart/form-data">
                    <input type="hidden" id="Action" name="Action" value="frmDocumentReview" />
                    <input type="hidden" id="ModelID" name="ModelID" value="{$ModelID}" />
                    <input type="hidden" id="mpeAction" name="mpeAction" value="{$mpeAction}" />
                    <input type="hidden" id="mpeUser" name="mpeUser" value="{$mpeUser}" />
                    <input type="hidden" id="num_doc_sets" name="num_doc_sets" value="{$num_doc_sets}" />
                    <input type="hidden" id="CompleteFlag" name="CompleteFlag" value="{$CompleteFlag}" />
                    <input type="hidden" id="mpeSessionName" name="mpeSessionName" value="{$smarty.session.session_name}" />
                    <input type="hidden" id="isAjax" name="isAjax" value="true" />

                    <table class="table">
                        <span class="lead">NOTE: Information in this section is for internal use only. It is never revealed publicly.</span>
                        {if $canAccessModelDocumentIssues}
                            <tr>
                                <td class="RequiredDocuments" style="height:28px;" align="left" height="28" width="150">General Document Issues</td>
                                <td class="DocumentsOnhand" style="text-align:right;height:28px;" align="right" height="28" width="132">
                                    <input type="button" name="btnDocumentIssues" id="btnDocumentIssues_0" value="Issues"
                                        onclick="docIssuesListDialog(0, 'General Document Issues', 0, {$ModelID}, false, '{$smarty.session.session_name}');" style="margin-right:32px !important;font-size: 10px" />
                                </td>
                                <td class="DocumentEdit" style="text-align: left; height:28px;" align="left" height="28" width="*">&nbsp;</td>
                            </tr>
                            <tr id="doc_tr_0_issue" {if !$general_document_issues}style="visibility:hidden;display:none;"{/if}>
                                <td colspan="3" style="width:565px;" class="doc_issue" id="doc_td_0_issue">{foreach from=$general_document_issues item="doc_issue"}{$doc_issue.issue_code}{/foreach}</td>
                            </tr>
                        {/if}
                        {foreach from=$required_documents_sets key="set_id" item="document_set"}
                            {if  $num_doc_sets gt 1}
                                <tr>
                                    <td class="RequiredDocuments" align="left" colspan="3">{if $set_id gt 1}<br><hr>{/if}<b>Model #{$set_id}</b></td>
                                </tr>
                            {/if}
                            {if $document_errors && $document_errors[$set_id]}
                                {foreach from=$document_errors[$set_id] item="doc_error"}
                                    <tr>
                                        <td class="RequiredDocuments" align="left" colspan="3"><span style="color:#AE2713;left-margin: 55px;">{$doc_error}</span></td>
                                    </tr>
                                {/foreach}
                            {/if}
                            {foreach from=$document_set.documents key="doc_idx" item="document"}
                                {if $document.model_doc_id neq null or $document.esign_ignore eq 0 or $can_delete_docs}
                                    <div class="col-sm-12">
                                        <div class="RequiredDocuments col-md-4">{$document.name}</div>
                                        <div class="DocumentsOnhand col-md-4"> &nbsp;
                                            {if $document.model_doc_id != null}
                                                <input type="button" name="btnDisplayDocument" id="btnDisplayDocument" value="Display" class="btn btn-default" onclick="myprofile.displayDocument({$document.model_doc_id}, '{$smarty.session.session_name}');" style="font-size: 10px" />
                                                {if $document.esign_ignore eq 0 and $can_delete_docs}
                                                    &nbsp;&nbsp;
                                                    <input type="button" name="btnDeleteDocument" id="btnDeleteDocument" value="Delete" class="btn btn-danger"
                                                        onclick="deleteDocument('{$document.name}',{$document.model_doc_id}, {$ModelID}, {$mpeAction}, {$mpeUser}, false, '{$smarty.session.session_name}');" style="font-size: 10px" />
                                                {else}
                                                    {$no_delete_filler}
                                                {/if}
                                                {if $canAccessModelDocumentIssues || $document.document_issue}
                                                    &nbsp;&nbsp;
                                                    <input type="button" name="btnDocumentIssues" id="btnDocumentIssues_{$document.model_doc_id}" value="Issues"
                                                        onclick="docIssuesListDialog({$document.id}, '{$document.name}',{$document.model_doc_id}, {$ModelID}, false, '{$smarty.session.session_name}');" style="font-size: 10px" />

                                                {/if}
                                            {elseif $document.esign_ignore neq 0}
                                                Document Not On File.
                                            {/if}
                                        </div>
                                        <div class="DocumentEdit col-md-4">
                                            {if $document.document_issue && !$model_pending_audit}
                                                {assign var="can_submit" value=true}
                                                <input type="file" id="document_{$document.id}_{$set_id}" name="{$document.input_name}" style="display: none" onchange="myprofile.applicationStatusPhotoUpload('#frmDocumentReview', event)" />
                                                <button type="button" class="btn button-2 btn-sm " onclick="myprofile.triggerFileInput(event)"><i class="fa fa-cloud-upload"></i> Choose File </button>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                                    </div>
                                                </div>
                                            {elseif $document.esign_ignore eq 0 && $document.model_doc_id == null}
                                                {if $document.esign_ignore eq 0 && $can_upload_docs}
                                                    <input type="file" id="document_{$document.id}_{$set_id}" name="{$document.input_name}" style="display: none" onchange="myprofile.applicationStatusPhotoUpload('#frmDocumentReview', event)" />
                                                    <button type="button" class="btn button-2 btn-sm" onclick="myprofile.triggerFileInput(event)"><i class="fa fa-cloud-upload"></i> Choose File</button>
                                                    <div class="progress" style="display: none">
                                                        <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                                        </div>
                                                    </div>
                                                {else}
                                                    {$no_delete_filler}
                                                {/if}
                                            {else}
                                                {$filler}
                                            {/if}
                                        </div>
                                    </div>
                                {/if}

                                {if $document.document_issue}
                                    {assign var="has_document_issues" value=true}
                                {/if}

                                <tr id="doc_tr_{$document.model_doc_id}_issue" {if !$document.document_issue}style="visibility:hidden;display:none;"{/if}>
                                    <td colspan="3" style="width:565px;" class="doc_issue" id="doc_td_{$document.model_doc_id}_issue" title="{$document.document_issue_hint}">
                                        {$document.document_issue}
                                    </td>
                                </tr>
                            {/foreach}
                            {if $mpeUser neq $mpeModels}
                                <tr>
                                    <td class="RequiredDocuments" align="left" height="32" width="175">&nbsp;</td>
                                    <td class="DocumentsOnhand" align="left" height="32" width="130">
                                        {if $document_set.display_all_js}
                                            <input type="button" value="Display All" onClick="{$document_set.display_all_js}" style="font-size: 10px" />
                                        {else}
                                            &nbsp;
                                        {/if}
                                    </td>
                                    <td class="DocumentEdit" style="text-align: left;" align="left" height="32" width="*">&nbsp;</td>
                                </tr>
                            {/if}
                            {if $documents_powerforms[$set_id]}
                                <div class="col-sm-12">
                                    <div class="RequiredDocuments col-md-4">{$documents_powerforms[$set_id].label}</div>
                                    <div class="DocumentsOnhand col-md-4">
                                        {$filler}
                                    </div>
                                    <div class="DocumentEdit col-md-4">
                                        <a id="{$documents_powerforms[$set_id].id}" class="buttons" href="#" target="_blank" style="font-size:12px;text-decoration:none;" onclick="{if $mpeUser eq $mpeModels}return esign('{$documents_powerforms[$set_id].id}', '{$documents_powerforms[$set_id].url}', '{$documents_powerforms[$set_id].auth_str}');{else}alert('Only models can e-sign document powerforms!'); return false;{/if}">{$documents_powerforms[$set_id].caption}</a>
                                    </div>
                                </div>
                            {/if}
                            {if $completed_esign[$set_id]}
                                <tr>
                                    <td class="RequiredDocuments" align="left" height="32" width="175">View E-Sign Certificate</td>
                                    <td class="DocumentsOnhand" align="left" height="32" width="130">
                                        <input type="button" value="E-Sign Certificate" class="btn btn-default" onClick="window.open('{$completed_esign[$set_id].certificate_url}'); return false" style="font-size: 10px" />
                                    </td>
                                    <td class="DocumentEdit" style="text-align: left;" align="left" height="32" width="*">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="RequiredDocuments" align="left" height="32" width="175">View Release Document</td>
                                    <td class="DocumentsOnhand" align="left" height="32" width="130">
                                        <input type="button" value="Release Document" class="btn btn-default" onClick="window.open('{$completed_esign[$set_id].release_url}'); return false" style="font-size: 10px" />
                                    </td>
                                    <td class="DocumentEdit" style="text-align: left;" align="left" height="32" width="*">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="RequiredDocuments" align="left" height="32" width="175">View Compliance Document</td>
                                    <td class="DocumentsOnhand" align="left" height="32" width="130">
                                        <input type="button" value="Compliance Document" class="btn btn-default" onClick="window.open('{$completed_esign[$set_id].compliance_url}'); return false" style="font-size: 10px" />
                                    </td>
                                    <td class="DocumentEdit" style="text-align: left;" align="left" height="32" width="*">&nbsp;</td>
                                </tr>
                                {if $can_delete_docs}
                                    {if 1==2}
                                        <tr>
                                            <td class="RequiredDocuments" align="left" height="32" width="175">Regenerate E-Sign Documents</td>
                                            <td class="DocumentsOnhand" align="left" height="32" width="130">
                                                <input type="button" value="Regenerate E-Sign" onClick="window.open('/esign/?cmd=build&s={$completed_esign[$set_id].auth_str}&render=1'); return false" style="font-size: 10px" />
                                            </td>
                                            <td class="DocumentEdit" style="text-align: left;" align="left" height="32" width="*">&nbsp;</td>
                                        </tr>
                                    {/if}
                                    <div class="col-sm-12">
                                        <div class="RequiredDocuments col-md-4">Delete E-Sign Document</div>
                                        <div class="DocumentsOnhand col-md-4">
                                            <input type="button" value="Delete E-Sign" class="btn btn-danger" onClick="deleteEsign('{$completed_esign[$set_id].auth_str}','{$smarty.session.session_name}'); return false" style="font-size: 10px" />
                                        </div>
                                        <div class="DocumentEdit col-md-4">&nbsp;</div>
                                    </div>
                                {/if}
                            {/if}

                            {if $model_audit[$set_id].can_esign_audit_addendum || $model_audit[$set_id].model_pending_audit}
                                <div class="col-sm-12">
                                    <div class="RequiredDocuments" >{$model_audit[$set_id].powerform.label}</div>
                                    <div class="DocumentsOnhand" >
                                        {if $model_audit[$set_id].data.model_doc_id != null}
                                            <input type="button" name="btnDisplayDocument" id="btnDisplayDocument" value="Display"
                                                onclick="displayDocument({$model_audit[$set_id].data.model_doc_id}, true, '{$smarty.session.session_name}');" style="font-size: 10px" />
                                            {if $can_delete_docs || $model_audit[$set_id].can_delete_docs}
                                                &nbsp;&nbsp;
                                                <input type="button" name="btnDeleteDocument" id="btnDeleteDocument" value="Delete"
                                                    onclick="deleteDocument('{$model_audit[$set_id].data.name}', {$model_audit[$set_id].data.model_doc_id}, {$ModelID}, {$mpeAction}, {$mpeUser}, true, '{$smarty.session.session_name}');" style="font-size: 10px" />
                                            {/if}
                                        {else}
                                            Due By {$model_audit[$set_id].data.corrections_by_fmt}
                                        {/if}
                                    </div>
                                    <div class="DocumentEdit">
                                        {if $model_audit[$set_id].data.model_doc_id == null && $model_audit[$set_id].powerform.url}
                                            {if $model_audit[$set_id].model_pending_audit && $mpeUser == $mpeModels}
                                                <button type="button"
                                                        id="powerform_{$set_id}_audit"
                                                        class="btn button-2"
                                                        onclick="return esign('powerform_{$set_id}_audit', '{$model_audit[$set_id].powerform.url}')">{$model_audit[$set_id].powerform.caption}</button>
                                            {/if}
                                        {elseif $model_audit[$set_id].data.completed_date}
                                            Completed {$model_audit[$set_id].data.completed_date}
                                        {/if}
                                    </div>
                                </div>
                            {/if}
                        {/foreach}
                    </table>
                    <br>
                    <hr>
                    <div style="width:100%;padding:10px;">
                        {*form submit*}
                        {*<div style="text-align: right;padding-right:15px;">*}
                            {*{if $mpeAction == $mpeEdit or $can_submit}*}
                                {*<input type="button" id="btnDocumentsSubmit" class="btn btn-success" value="Submit" onclick="document.frmDocumentReview.submit();" />*}
                            {*{/if}*}
                            {*<input type="button" id="btnDocRevRefresh" class="btn btn-default" value="Refresh"  onclick="refreshDocRev();">*}
                        {*</div>*}

                    </div>
                </form>
            </div>
        </div>
        <!-- /.box-body -->
        <div class="clearfix"></div>
    </div>
</div>
{*modal*}
<div id="imagePreview" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Image Preview</h4>
            </div>
            <div class="modal-body">
                <p class="text-center">
                    <img src="" alt="" id="photoId" class="img-responsive">
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
