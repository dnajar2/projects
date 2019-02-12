<div id="myAccount" class="col-lg-12">
    <div class="box box-primary">
        <div class="box-body box-profile col-md-8 col-md-offset-2">
            <form id="frmAboutYou" name="frmAboutYou" method="POST" action="../includes/mpepost.php" >
                <input type="hidden" name="Action" value="frmAboutYou">
                <input type="hidden" name="show" value="mpe">
                <input type="hidden" name="mpeAction" value={$mpeAction}>
                <input type="hidden" name="mpeUser" value={$mpeUser}>
                <input type="hidden" id="mpeSessionName" name="mpeSessionName" value="{$smarty.session.session_name}">
                <input type="hidden" name="{$smarty.session.session_name}" value="{$smarty.session.SessionID}" >
                <input type="hidden" name="ModelID" value={$form.ModelID}>
                {if !$mpeEditor}
                    <input type="hidden" name="fromApplicantList" value="1">
                {/if}
                <div class="col-sm-12 form-group">
                    <strong>NOTE: Information in this section may be displayed and/or queried for publicly.</strong>
                </div>


                <div class="FieldGroup">
                    <div class="FieldEdit col-sm-6">
                        <label for="category">* Model Category:</label>
                        {if $mpeAction == $smarty.const.MPE_INSERT || $mpeUser == $smarty.const.MPE_ADMIN}
                            <select id="category" name="category" class="EditBox form-control" onchange="getOrientations( this.value );{if $mpeUser == $smarty.const.MPE_ADMIN}getCategories( {$form.ModelID}, this.value );{/if}">
                            {foreach from=$model_categories item=this}
                                <option value="{$this.id}" {if $form.category == $this.id}selected="selected"{/if}>{$this.name}</option>
                            {/foreach}
                        </select>
                        {else}
                            {foreach from=$model_categories item=this}
                            {if $form.category == $this.id}
                                <input type="text" class="EditBox form-control" id="category_input" name="category_input" value="{$this.name}" onfocus="this.blur();" readonly >
                                <input type="hidden" class="EditBox" id="category" name="category" value="{$this.id}" onfocus="this.blur();" readonly >
                            {/if}
                        {/foreach}
                        {/if}
                    </div>
                    <div class="FieldEdit col-sm-6">
                        <label for="SexualPreferenceID">* Sexual Orientation:</label>
                        <select name="SexualPreferenceID" id="SexualPreferenceID" class="EditBox form-control">
                        {foreach from=$SexualPreferences item=this}
                            <option value="{$this.pkSexualPreferenceID}" label="{$this.SexualPreference}"
                                {if $this.pkSexualPreferenceID == $form.SexualPreferenceID} selected="selected" {/if} >{$this.SexualPreference}</option>
                        {/foreach}
                        </select>
                    </div>
                    <div class="FieldEdit col-sm-6">
                        <label for="Birthday">* Birthdate:</label>
                        <input type="text" class="EditBox form-control" id="Birthday" name="Birthday" value="{$form.Birthday}" onfocus="checkBirthdate();" onblur="checkBirthdate();">
                        <img src="{$CDN_SCHEMA}/images/wcc1/site/misc/calendar/cal.gif" border="0" onclick="displayDatePicker('Birthday', false, 'ymd', '-');" class="calendar_icon">
                    </div>
                    <div class="FieldEdit col-sm-6">
                      <span class="EditLabel" id="LabelAge" ><label for="Age">Age:</label></span>
                      <input type="text" class="EditBox form-control" name="Age" id="Age" value="{$form.Age}" onfocus="this.blur();">
                    </div>
                    <div class="FieldEdit col-sm-4">
                      <label for="AstrologySign">Zodiac Sign:</label>
                      <input type="text" class="EditBox form-control" name="AstrologySign" id="AstrologySign" value="{$form.AstrologySign}" onfocus="this.blur();">
                    </div>
                    <div class="FieldEdit col-sm-4">
                        <span class="EditLabel" id="LabelChineseSign" ><label for="ChineseSign">Year of the</label></span>
                        <input type="text" class="EditBox form-control" name="ChineseSign" id="ChineseSign" value="{$form.ChineseSign}" onfocus="this.blur();">
                    </div>
                    <div class="FieldEdit col-sm-4">
                        <label for="BraSizeID"><b>* Bra Sizes:</b></label>
                        <select name="BraSizeID" id="BraSizeID" class="EditBox form-control">
                        {foreach from=$BraSizes item=this}
                            <option value="{$this.BraSizeID}" label="{$this.BraSize}"
                                {if $this.BraSizeID == $form.BraSizeID} selected="selected" {/if} >{$this.BraSize}</option>
                        {/foreach}
                        </select>
                    </div>
                    <div class="FieldEdit col-sm-6">
                        <label for="HeightID"><b>* Height:</b></label>
                        <select name="HeightID" id="HeightID" class="EditBox form-control">
                        {foreach from=$Heights item=this}
                            <option value="{$this.HeightID}" label="{$this.Height}"
                                {if $this.HeightID == $form.HeightID} selected="selected" {/if} >{$this.Height}</option>
                        {/foreach}
                        </select>
                    </div>
                    <div class="FieldEdit col-sm-6">
                        <label for="WeightID"><b>* Weight:</b></label>
                        <select name="WeightID" id="WeightID" class="EditBox form-control">
                        {foreach from=$Weights item=this}
                            <option value="{$this.WeightID}" label="{$this.Weight}"
                                {if $this.WeightID == $form.WeightID} selected="selected" {/if} >{$this.Weight}</option>
                        {/foreach}
                        </select>
                    </div>
                    <div class="FieldEdit col-sm-6">
                        <label for="EyeColorID"><b>* Eye Color:</b></label>
                        <select name="EyeColorID" id="EyeColorID" class="EditBox form-control">
                        {foreach from=$EyeColors item=this}
                            <option value="{$this.EyeColorID}" label="{$this.EyeColor}"
                                {if $this.EyeColorID == $form.EyeColorID} selected="selected" {/if} >{$this.EyeColor}</option>
                        {/foreach}
                        </select>
                    </div>
                    <div class="FieldEdit col-sm-6">
                        <span class="EditLabelRequired" id="LabelHairColor"><label for="HairColorID"><b>* Hair Color:</b></label></span>
                        <select name="HairColorID" id="HairColorID" class="EditBox form-control">
                        {foreach from=$HairColors item=this}
                             <option value="{$this.HairColorID}" label="{$this.HairColor}"
                             {if $this.HairColorID == $form.HairColorID} selected="selected" {/if} >{$this.HairColor}</option>
                        {/foreach}
                        </select>
                    </div>
                    <div class="FieldEdit col-sm-6">
                        <label for="EthnicityID"><b>* Ethnicity:</b></label>
                        <select name="EthnicityID" id="EthnicityID" class="EditBox form-control" > {*<!-- size="$Ethnicities|@count}"> -->*}
                        {foreach from=$Ethnicities item=this}
                            <option value="{$this.EthnicityID}" label="{$this.Ethnicity}"
                            {if $this.EthnicityID == $form.EthnicityID} selected="selected" {/if} >{$this.Ethnicity}</option>
                        {/foreach}
                        </select>
                    </div>
                    <div class="FieldEdit col-sm-6">
                        <label for="SmokerID">Smoker:</label>
                        <select name="SmokerID" id="SmokerID" class="EditBox form-control">
                            {foreach from=$Smokers item=this}
                            <option value="{$this.SmokerID}" label="{$this.Smoker}"
                            {if $this.SmokerID == $form.SmokerID} selected="selected" {/if} >{$this.Smoker}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="clearfix"></div>
                </div>

                {if $show_checkboxes}
                <hr />
                <div class="FieldEdit">
                    <p><strong>Spoken Languages</strong></p>
                    <div>
                        {foreach from=$SpokenLanguages item=this name=LanguageLoop}
                            <div class="pull-left blocking_city">
                                <label for="{$this.FieldName}" class="fancy-checkbox">
                                    <input name="{$this.FieldName}"
                                        id="{$this.FieldName}" {if $this.FieldValue == 1}
                                        checked="checked" {/if}
                                        type="checkbox"
                                        value="1">
                                        <i class="fa fa-check-square-o checked"></i>
                                        <i class="fa fa-square-o unchecked"></i>
                                        {$this.FieldLabel}
                                </label>
                            </div>
                        {/foreach}
                        <div class="clearfix"></div>
                    </div>
                </div>
                <hr />
                <div class="FieldEdit">
                    <p class="bold-text">Favorite Positions: (select maximum of {$mpe_max_favorite_positions})</p>
                    <div border="0" cellpadding="0px" cellspacing="2px" >
                        {foreach from=$FavoritePositions item=this name=FavoritePositionLoop}
                            <div class="pull-left blocking_city">
                                <label for="id_favorite_positions_{$this.FieldName}" class="fancy-checkbox">
                                <input name="{$this.FieldName}"
                                    id="id_favorite_positions_{$this.FieldName}" {if $this.FieldValue == 1}
                                    checked="checked" {/if}
                                    type="checkbox"
                                    value="1">
                                <i class="fa fa-check-square-o checked"></i>
                                <i class="fa fa-square-o unchecked"></i>
                                {$this.FieldLabel}</label>
                            </div>
                        {/foreach}
                        <div class="clearfix"></div>
                    </div>
                </div>
                <hr />
                <div class="FieldEdit form-group">
                    <p class="bold-text">Fetishes (select maximum of {$mpe_max_fetishes})</p>
                    <div>
                        {foreach from=$Fetishes item=this name=FetishesLoop}
                            <div class="pull-left blocking_city">
                                <label for="id_fetishes_{$this.FieldName}" class="fancy-checkbox">
                                <input name="{$this.FieldName}"
                                    id="id_fetishes_{$this.FieldName}"
                                    type="checkbox" {if $this.FieldValue == 1} checked="checked" {/if}
                                    value="1" />
                                <i class="fa fa-check-square-o checked"></i>
                                <i class="fa fa-square-o unchecked"></i>
                                {$this.FieldLabel}</label>
                            </div>
                        {/foreach}
                        <div class="clearfix"></div>
                    </div>
                </div>
                {/if}

                <div class="clearfix">
                    <hr />
                    <div class="text-right">
                        <button type="reset"
                            id="btnStateBlockingReset"
                            name="btnStateBlockingReset"
                            class="btn button-2">Reset</button>
                        <button type="button"
                            class="btn button-1"
                            onclick="myprofile.ajaxCall('#frmAboutYou',false, event)"> <i class="fa fa-save"></i> Update <i class="fa fa-refresh fa-spin" style="display: none"></i></button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.box-body -->
        <div class="clearfix"></div>
    </div>
</div>
