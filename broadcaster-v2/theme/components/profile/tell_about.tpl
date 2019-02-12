<div id="myAccount" class="col-lg-12">
    <div class="box box-primary">
        <div class="box-body box-profile col-md-6 col-md-offset-3">
            <div class="WindowRegion" id="TellUsAboutYourself">
                <form id="frmAboutYourself" name="frmAboutYourself" method="POST" action="../includes/mpepost.php">
                    <input type="hidden" name="show" value="mpe">
                    <input type="hidden" name="Action" value="frmAboutYourself">
                    <input type="hidden" name="mpeAction" value={$mpeAction}>
                    <input type="hidden" name="mpeUser" value={$mpeUser}>
                    <input type="hidden" id="mpeSessionName" name="mpeSessionName" value="{$smarty.session.session_name}">
                    <input type="hidden" name="{$smarty.session.session_name}" value="{$smarty.session.SessionID}">
                    <input type="hidden" name="ModelID" value={$form.ModelID}>

                    <div class="FieldGroup">
                        <p class="lead">NOTE: Information in this section may be displayed and/or queried for publicly.</p>
                    </div>

                    <div class="form-group">
                        <label for="Quote">Your favorite "quote":</label>
                        <textarea class="EditBox form-control" id="Quote" name="Quote" cols="72" rows="7" onblur="stripHtmlTags( this );">{$form.quote}</textarea>
                    </div>
                    <hr/>
                    <div class="form-group">
                        <label for="Description">Describe yourself and what you want to do in your chat room:</label>
                        <textarea class="EditBox form-control" id="Description" name="Description" cols="72" rows="7" onblur="stripHtmlTags( this );">{$form.Description}</textarea>
                    </div>
                    <hr/>
                    <div class="form-group">
                        <label for="TurnOns">What are your Turn-On's</label>
                        <textarea class="EditBox form-control" id="TurnOns" name="TurnOns" cols="72" rows="7" onblur="stripHtmlTags( this );">{$form.TurnOns}</textarea>
                    </div>
                    <hr/>
                    <div class="form-group">
                        <label for="TurnOffs">What are your Turn-Off's</label>
                        <textarea class="EditBox form-control" id="TurnOffs" name="TurnOffs" cols="72" rows="7" onblur="stripHtmlTags( this );">{$form.TurnOffs}</textarea>
                    </div>
                    <div class="clearfix"></div>
                    <div class="text-right">
                        <button type="reset"
                            id="btnStateBlockingReset"
                            name="btnStateBlockingReset"
                            class="btn button-2">Reset</button>
                        <button type="button"
                            class="btn button-1"
                            onclick="myprofile.ajaxCall('#frmAboutYourself',false, event)"> <i class="fa fa-save"></i> Update <i class="fa fa-refresh fa-spin" style="display: none"></i></button>
                    </div>
                </form>
            </div>
        </div>
        <!-- /.box-body -->
        <div class="clearfix"></div>
    </div>
</div>
