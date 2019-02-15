<div id="myAccount" class="col-xs-12">
    <div class="box box-primary">
        <div class="box-body box-profile col-md-8 col-md-offset-2">
            <div class="WindowRegion" id="divCountryBlocking">
                <form id="frmCountryBlocking" name="frmCountryBlocking" method="POST" action="../includes/mpepost.php">
                    <input type="hidden" id="show" name="show" value="mpe">
                    <input type="hidden" name="Action" value="frmCountryBlocking">
                    <input type="hidden" id="mpeAction" name="mpeAction" value={$mpeAction}>
                    <input type="hidden" id="mpeUser" name="mpeUser" value={$mpeUser}>
                    <input type="hidden" id="mpeSessionName" name="mpeSessionName" value="{$smarty.session.session_name}">
                    <input type="hidden" name="{$smarty.session.session_name}" value="{$smarty.session.SessionID}">
                    <input type="hidden" id="ModelID" name="ModelID" value={$form.ModelID}>
                    <div class="FieldGroup text-center">
                        <h3 class="lead">NOTE: Selections made here are for internal use only and never revealed publicly.</h3>
                    </div>

                    <div class="FieldGroup">
                        <p id="LabelRequiredDocuments" class="text-center">The Countries you select below will prevent (block) members from those countries from seeing you online.</p>
                        <div class="FieldEdit">
                            <div class="alert alert-warning alert-dismissible col-sm-8 col-sm-offset-2">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <h4><i class="icon fa fa-warning"></i>Be careful... you could greatly reduce your online visibility!</h4>
                            </div>
                        </div>

                        <div class="FieldEdit col-md-6" style="padding-left: 15px">
                            <label for="id_regionblock_country_groups_list">Select a region to check those countries below:</label>
                            <select id="id_regionblock_country_groups_list" name="regionblock_country_groups" class="form-control">
                                <option value="no">select a country group</option>
                                {foreach from=$regionblock_country_groups item="region_data"}
                                    <option value="{$region_data.group_name}">{$region_data.description}</option>
                                {/foreach}
                            </select>
				        </div>
                        <div class="col-md-6" style="line-height: 80px">
                            <button type="button"
                                class="btn button-1"
                                onclick="check_blockregion_country_group();"
                            >Select Region</button>
                        </div>
                        <div class="clearfix"></div>
			        </div>
                    <div class="FieldGroup">
                        <div class="FieldEdit">
                            <p class="EditLabel" id="LabelBlockedCountries">Countries to block from seeing you online:</p>
                            <div>
                                {foreach from=$blockedCountries item=this name=rbCountries}
                                <div class="pull-left blocking_city">
                                    <input name="rbCountry{$this.CountryID}"
                                              id="rbCountry{$this.CountryID}_{$this.group_name}"
                                              {if $this.blocked } checked {/if}
                                              type="checkbox" value="1"/>
                                    <label for="rbCountry{$this.CountryID}_{$this.group_name}">{$this.CountryName}</label>
                                </div>
                                {/foreach}
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="text-right">
                        <button type="reset"
                            id="btnStateBlockingReset"
                            name="btnStateBlockingReset"
                            class="btn button-2"
                        >Reset</button>
                        <button type="button" class="btn button-1"
                            onclick="myprofile.ajaxCall('#frmCountryBlocking',false, event)"> <i class="fa fa-save"></i> Update <i class="fa fa-refresh fa-spin" style="display: none"></i></button>
                    </div>
                </form>
            </div>
        </div>
        <!-- /.box-body -->
        <div class="clearfix"></div>
    </div>
</div>
