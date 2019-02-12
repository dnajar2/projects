<div id="myAccount" class="col-lg-12">
    <div class="box box-primary ">
        <div class="box-body box-profile col-md-6 col-md-offset-3">
            <div class="WindowRegion" id="PersonalInformation">
                <form id="frmPersonalInfo" name="frmPersonalInfo" method="POST" action="../includes/mpepost.php">
                    <input type="hidden" name="Action" value="frmPersonalInfo">
                    <input type="hidden" name="show" value="mpe">
                    <input type="hidden" name="mpeAction" value={$mpeAction}>
                    <input type="hidden" id="mpeSessionName" name="mpeSessionName" value="{$smarty.session.session_name}">
                    <input type="hidden" name="{$smarty.session.session_name}" value="{$smarty.session.SessionID}">
                    <input type="hidden" name="mpeUser" value={$mpeUser}>
                    <input type="hidden" name="ModelID" value={$form.ModelID}>

                    <div class="col-sm-12 form-group">
                        <h3 class="lead">NOTE: Information in this section is for internal use only. It is never revealed publicly.</h3>
                    </div>
                    <div class="FieldGroup">
                        <div class="FieldEdit col-sm-6">
                          <label for="Firstname">* Firstname:</label>
                          <input class="EditBox form-control" type="text" name="Firstname" id="Firstname" value="{$form.fname}">
                        </div>
                        <div class="FieldEdit col-sm-6">
                            <label for="Lastname">* Lastname:</label>
                            <input class="EditBox form-control" type="text" name="Lastname" id="Lastname" value="{$form.lname}">
                        </div>
                        <div class="FieldEdit col-sm-6">
                            <label for="Address">* Address:</label>
                            <input class="EditBox form-control" type="text" name="Address" id="Address" value="{$form.address}">
                        </div>
                        <div class="FieldEdit col-sm-6">
                            <label for="City">* City:</label>
                            <input class="EditBox form-control" type="text" name="City" id="City" value="{$form.city}">
                        </div>
                        <div class="FieldEdit col-sm-6">
                            <label for="StateID">* State:</label><span class="EditLabel">&nbsp;(US & Canada)</span>
                            <select class="EditBox form-control" name="StateID" id="StateID" onchange="myprofile.fixCountryInput( document.getElementById('StateID'), document.getElementById('CountryID') ); ">
                               {foreach from=$States item=this}
                                   <option value="{$this.StateID}" label="{$this.StateName}"
                                       {if $this.StateID == $form.StateID} selected="selected" {/if} >{$this.StateName}</option>
                               {/foreach}
                            </select>
                        </div>
                        <div class="FieldEdit col-sm-6">
                            <label for="Zipcode">* Zipcode:</label>
                            <input class="EditBox form-control" type="text" name="Zipcode" id="Zipcode" value="{$form.zip}"/>
                        </div>
                        <div class="FieldEdit col-sm-6" style="position:relative;">
                            <label for="CountryID">* Country:</label>
                                <select class="EditBox form-control" name="CountryID" id="CountryID" onchange="myprofile.fixStateInput( document.getElementById('StateID'), document.getElementById('CountryID') );">
                                {foreach from=$Countries item=this}
                                    <option value="{$this.CountryID}" label="{$this.CountryName}"
                                    {if $this.CountryID == $form.CountryID} selected="selected" {/if} >{$this.CountryName}</option>
                                {/foreach}
                                </select>
                            <label for="HideLocale" class="fancy-checkbox" style="position: absolute; top: 0; right: 18px;"> &nbsp; Hide Locale:
                                <input class="EditBox" type="checkbox" name="hide_locale" id="HideLocale" {if $form.hide_locale == 1}checked{/if} value="1">
                                <i class="fa fa-check-square-o checked"></i>
                                <i class="fa fa-square-o unchecked"></i>
                            </label>
                        </div>
                        <div class="FieldEdit col-sm-6">
			                <label for="timezone">Time Zone:</label>
                            <select class="EditBox form-control" name="timezone" id="timezone">
                                {foreach from=$TimeZones item="tz"}
                                    <option value="{$tz.location},{$tz.stdHourOffset},{$tz.dst}" {if $tz.location == $form.timezone} selected="selected" {/if}>{$tz.display}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="FieldEdit col-sm-6">
                            <label for="cellDomain">Cell Carrier:</label>
                            <select class="EditBox form-control" name="cellDomain" id="cellDomain" onblur="updateSMSEmail();">
                                    <option value="0">(select)</option>
                                {foreach from=$cellDomains item="cellDomain"}
                                    <option value="{$cellDomain.id}" title="{$cellDomain.domain}" {if $cellDomain.id == $form.cellDomainID} selected="selected" {/if}>{$cellDomain.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="FieldEdit col-sm-6">
                            <label for="cellphone">Cell Phone:</label>
                            <input class="EditBox form-control" type="text" name="cellphone" id="cellphone" value="{$form.cellphone}">
                        </div>
                        <div class="FieldEdit col-sm-6">
                            <label for="smsemail">SMS Email:</label>
                            <input class="EditBox form-control" type="text" name="smsemail" id="smsemail" value="{$form.smsemail}">
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                    <hr>
                    <div class="text-right">
                        <button type="reset"
                            id="btnStateBlockingReset"
                            name="btnStateBlockingReset"
                            class="btn button-2">Reset</button>
                        <button type="button" class="btn button-1"
                            onclick="myprofile.ajaxCall('#frmPersonalInfo',false, event)"> <i class="fa fa-save"></i> Update <i class="fa fa-refresh fa-spin" style="display: none"></i></button>
                    </div>
                </form>
            </div>
        </div>
        <!-- /.box-body -->
        <div class="clearfix"></div>
    </div>
</div>
