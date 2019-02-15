<div id="myAccount" class="col-lg-12">
    <div class="box box-primary">
        <div class="box-body box-profile col-md-6 col-md-offset-3">
            <!--   Mail Settings.... -->
            <div class="WindowRegion" id="MailSettings">
                <form id="frmMailSettings" name="frmMailSettings" method="POST" action="../includes/mpepost.php" >
                    <input type="hidden" id="show"      name="show"      value="mpe" />
                    <input type="hidden" name="Action" value="frmMailSettings">
                    <input type="hidden" id="mpeAction" name="mpeAction" value={$mpeAction} />
                    <input type="hidden" id="mpeUser"   name="mpeUser"   value={$mpeUser} />
                    <input type="hidden" id="mpeSessionName" name="mpeSessionName" value="{$smarty.session.session_name}" />
                    <input type="hidden" name="{$smarty.session.session_name}" value="{$smarty.session.SessionID}" />
                    <input type="hidden" id="ModelID"   name="ModelID"   value={$form.ModelID} />
                    {if $mpeUser == $mpeModels || $mpeUser == $mpeManager}
                        <input type="hidden" id="ModelsPercentage" name="ModelsPercentage" value="{$form.ModelsPercentage}"  />
                    {/if}
                    <div class="FieldGroup">
                        <span class="FieldEdit">
                            <span class="EditLabelRequired" id="ModelsMailSettings">Mail Settings:</span> <i>(if checked; you will <b>not</b> receive these mailers; but will miss out on important information)</i>
                            <br />
                            <br />

                            {foreach from=$mail_settings key="setting" item="value" name="mail_settings_display"}
                                <div>
                                    {if $setting neq "model_id"}
                                        <div class="col-xs-4">
                                            <input type="checkbox" id="id_{$setting}" name="mail_settings[{$setting}]"{if $value} checked{/if} value="{$value}" />
                                            <label for="id_{$setting}">{$setting|replace:'_':' '|capitalize:true}</label>
                                        </div>
                                    {/if}
                                </div>
                            {/foreach}
                        <div class="clearfix"></div>
                        </span>
                        <div class="ButtonBar">
                            <div class="LeftAlign">
                                <span class="ErrorMessage" id="MailSettingsErrorMessage"></span>
                            </div>
                            <div class="pull-right">
                                {if $mpeAction == $smarty.const.MPE_EDIT}
                                    <button type="reset"
                                        id="btnMailSettingsReset"
                                        class="btn button-2"
                                    >Reset</button>
                                    <button type="button" class="btn button-1"
                                        onclick="myprofile.ajaxCall('#frmMailSettings',true, event)"> <i class="fa fa-save"></i> Update <i class="fa fa-refresh fa-spin" style="display: none"></i></button>

                                {/if}
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- /.box-body -->
        <div class="clearfix"></div>
    </div>
</div>

