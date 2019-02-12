<div id="myAccount" class="col-lg-12">
    <div class="box box-primary">
        <div class="box-body box-profile col-md-8 col-md-offset-2">
            {*doc review elements*}
            <div class="WindowRegion" id="divStateBlocking">
                <form id="frmStateBlocking" name="frmStateBlocking" method="POST" action="../includes/mpepost.php">
                    <input type="hidden" name="Action" value="frmStateBlocking">
                    <input type="hidden" id="show" name="show" value="mpe">
                    <input type="hidden" id="mpeAction" name="mpeAction" value={$mpeAction}>
                    <input type="hidden" id="mpeUser" name="mpeUser" value={$mpeUser}>
                    <input type="hidden" id="mpeSessionName" name="mpeSessionName" value="{$smarty.session.session_name}">
                    <input type="hidden" name="{$smarty.session.session_name}" value="{$smarty.session.SessionID}">
                    <input type="hidden" id="ModelID" name="ModelID" value={$form.ModelID}>
                    {if $mpeUser eq $mpeModels}
                    <div class="FieldEdit">
                        <h3 class="lead text-center">
                            NOTE: Selections made here are for internal use only and never revealed publicly.
                        </h3>
                    </div>
                    {/if}
                    <div class="FieldGroup">
                        <div class="FieldEdit">
                          <span class="EditLabel text-center" id="LabelRequiredDocuments">
                            The States you select below will prevent (block) members from those States from seeing you online.<br/>
                          </span>
                            <div class="alert alert-warning alert-dismissible col-sm-8 col-sm-offset-2">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <h4><i class="icon fa fa-warning"></i>Be careful... you could greatly reduce your online visibility!</h4>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="FieldEdit">
                        <p class="EditLabel" id="LabelBlockedStates">States to block from seeing you online:</p>
                        <div>
                        {foreach from=$blockedStates item=this name=rbStates}
                            <div class="pull-left blocking_city">
                                <input name="rbState{$this.StateID}" id="rbState{$this.StateID}" {if $this.blocked } checked="checked" {/if} type="checkbox" value="1"/>
                                <label for="rbState{$this.StateID}">{$this.StateName}</label>
                            </div>
                        {/foreach}
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="ButtonBar">
                    <div class="LeftAlign">
                        <span class="ErrorMessage" id="StateBlockingErrorMessage"></span>
                    </div>
                    <div class="RightAlign text-right">
                        <button type="reset"
                            id="btnStateBlockingReset"
                            name="btnStateBlockingReset"
                            class="btn button-2"
                        >Reset</button>
                        <button type="button" class="btn button-1"
                            onclick="myprofile.ajaxCall('#frmStateBlocking',false, event)"> <i class="fa fa-save"></i> Update <i class="fa fa-refresh fa-spin" style="display: none"></i></button>

                    </div>
                </div>
                </form>
            </div>
        </div>
        <!-- /.box-body -->
        <div class="clearfix"></div>
    </div>
</div>
