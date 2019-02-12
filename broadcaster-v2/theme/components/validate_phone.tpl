<form id="validatePhone" action="" method="POST" enctype="application/x-www-form-urlencoded">
    <div class="my_phone_data">
        <hr>
        <h2 class="subBar text-center">
            {if  $wps_phone.phone_number == ""}Specify your phone number{elseif $wps_phone.validated == 0}Validate Your Phone{else}Your WCC Phone Number{/if}
        </h2>

        {if $wps_phone.id}
            <input type="hidden" id="phoneId" name="phoneId" value="{$wps_phone.id}" />
        {/if}
        <input type="hidden" name="userType" value="models">
        <input type="hidden" name="userId" value="{$modelInfo.ModelID}">
        <div class="col-md-8 col-md-offset-2">
            <p class="clear_wl">Select your phone prefix below and enter your phone number then click "Submit" to validate your phone number. Once your phone number is validated a new button labeled "Phone2Phone" will show up for members when you're in private with them.
                <br /><br />
            <div class="alert alert-info"> You will not be able to accept calls until your phone number has been validated.</div><br /></p>
            {if $error_message}
                <div class="alert alert-danger">{$error_message}</div>
            {/if}
            <hr>
        </div>
        <div class="clearfix"></div>
        <div class="col-lg-4 col-lg-offset-4">

            <div class="form-group">
                <label for="id_prefix_id">country dial prefix:</label>
                <select id="id_prefix_id" name="prefixId" class="form-control">
                    <option value="-1">(select dial prefix)</option>
                    {foreach from=$prefix_directory item="prefix"}
                        <option class="item_select" value="{$prefix.id}" {if $prefix.id == $wps_phone.prefix_id}selected{/if}>{$prefix.description}</option>
                    {/foreach}
                </select>
            </div>
            <div class="form-group">
                <label for="phoneNumber">phone number:</label>&nbsp;
                <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" size="25" value="{$wps_phone.phone_number}" />
                <span class="item_caption" style="padding:0;margin:0;"><small>(DO NOT include country dial prefix from above)</small></span>
            </div>

            {if !empty($wps_phone.phone_number) && $wps_phone.validated == $smarty.const.WPS_VALIDATE_PHONE}
                <div class="form-group">
                    <label for="id_enabled_id">state:</label>&nbsp;
                    <select id="id_enabled_id" name="enabled" class="form-control">
                        <option class="item_select" value="{$smarty.const.WPS_PHONE_DISABLED}" {if $wps_phone.enabled == $smarty.const.WPS_PHONE_DISABLED}selected{/if}>disabled</option>
                        <option class="item_select" value="{$smarty.const.WPS_PHONE_ENABLED}" {if $wps_phone.enabled == $smarty.const.WPS_PHONE_ENABLED}selected{/if}>enabled</option>
                    </select>
                </div>
            {/if}
            <div class="form-group-sm">
                <label for="id_model_rate_id">rate:</label>
                <select id="id_model_rate_id" name="model_rate" class="form-control">
                    {foreach from=$model_rates item="rate"}
                        <option class="item_select" value="{$rate.id}" {if $rate.id == $wps_phone.model_rate_id}selected{/if}>${$rate.rate} p/minute</option>
                    {/foreach}
                </select>&nbsp;
                <span class="item_caption"><small>(this is what you will earn)</small></span>&nbsp;
            </div>
            <div class="item_data text-center" style="margin-top: 15px;">
                {if empty($wps_phone.phone_number)}
                        <button class="btn button-2" type="button" id="id_submit" name="submit" onclick="myphones.submit('insert', null, event);" ><i class="fa fa-save"></i><i class="fa fa-refresh fa-spin hide"></i> Submit</button>
                    {else}
                        <button class="btn button-2" type="button" id="id_submit" name="submit" onclick="myphones.submit('update', null, event);"><i class="fa fa-save"></i><i class="fa fa-refresh fa-spin hide"></i> Update</button>
                    {if $wps_phone.validated == $smarty.const.WPS_UNVALIDATED_PHONE}
                        <button class="btn button-2" type="button" id="id_submit" name="submit" onclick="myphones.submit('validate', 'request', event);"><i class="fa fa-save"></i><i class="fa fa-refresh fa-spin hide"></i> Validate</button>
                    {/if}
                {/if}
            </div>
        </div>
    </div>
</form>
