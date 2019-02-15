<div class="col-lg-6 col-md-8 col-lg-offset-3 col-md-offset-2">
    <div class="box box-solid">
        <div class="box-header with-border">
            <h3 class="box-title">Schedule</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <div id="schedule-text">
                <div>
                    {if $submissionSuccess}
                        <div class="text-center"><strong>Your schedule has been successfully updated!</strong></div><br>
                    {elseif $resetSuccess}
                        <div class="text-center"><strong>Your schedule has been successfully reset!</strong></div><br>
                    {/if}
                    Let your viewers know when you'll be online!  Choose the times and days below and then hit the "Update Schedule" button when you're done!
                    <br><br>
                    <strong>Note:</strong> Your current timezone is set to <strong><span id="myTimeZone">{$timeZone}{if !$timeZone}(detecting...){/if}</span></strong>.  This is the timezone used when displaying your schedule dates and times to your viewers.  If you are in a different timezone now, please <a href="{$myProfileURL}">update your profile</a>.

                    <br><br>
                </div>
            <form action="" method="POST" name="scheduleForm">
                <table>
                    <tr>
                        <td valign="top" align="left">
                            <div class="text-center">
                                <table class="table table-striped">
                                    {foreach from=$days key=index item=day}
                                        {assign var="checked" value=false}
                                        {if $schedule[$day]}
                                            {assign var="checked" value=true}
                                        {/if}
                                        <tr>
                                            <td valign="bottom" align="left"><input type="checkbox" name="schedule[{$day}][set]" id="{$day}" {if $checked} checked{/if}></td>
                                            <td valign="middle" align="left"><strong><label for="{$day}" style="cursor:pointer;">{$day|capitalize}</label></strong></td>
                                            <td valign="middle" align="left">
                                                <select name="schedule[{$day}][from_hour]" onChange="document.scheduleForm.{$day}.checked=true;">
                                                    {foreach from=$hours key=k item=v}
                                                        <option value="{$v}"{if $schedule[$day].fromHourModel == $v} selected{/if}>{$v}</option>
                                                    {/foreach}
                                                </select>
                                                &nbsp;
                                                <select name="schedule[{$day}][from_meridiem]" onChange="document.scheduleForm.{$day}.checked=true;">
                                                    {foreach from=$meridiems key=k item=v}
                                                        <option value="{$v}"{if $schedule[$day].fromMeridiemModel == $v} selected{/if}>{$v}</option>
                                                    {/foreach}
                                                </select>
                                            </td>

                                            <td valign="middle" align="left"> &nbsp;<font face="Tahoma" style="font-size:12px"><b>to</b></font>&nbsp; </td>

                                            <td valign="middle" align="left">
                                                <select name="schedule[{$day}][to_hour]" onChange="document.scheduleForm.{$day}.checked=true;">
                                                    {foreach from=$hours key=k item=v}
                                                        <option value="{$v}"{if $schedule[$day].toHourModel == $v} selected{/if}>{$v}</option>
                                                    {/foreach}
                                                </select>
                                                &nbsp;
                                                <select name="schedule[{$day}][to_meridiem]" onChange="document.scheduleForm.{$day}.checked=true;">
                                                    {foreach from=$meridiems key=k item=v}
                                                        <option value="{$v}"{if $schedule[$day].toMeridiemModel == $v} selected{/if}>{$v}</option>
                                                    {/foreach}
                                                </select>
                                            </td>

                                        </tr>
                                    {/foreach}
                                    <tr><td height="7px"><img src="/images/spacer.gif"></td></tr>
                                    <tr><td valign="top" align="center" colspan="10">
                                            <button type="submit" class="btn button-2" onclick="$(this).find('i').addClass('fa-spin')"> <i class="fa fa-refresh"></i> Update Schedule</button>
                                            <br><br>
                                            <p class="clear_wl">Do you want to reset your schedule?  <a href="{$resetURL}">Click here.</a></p>
                                        </td></tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                <input type="hidden" name="isSet" value="1">
            </form>
        </div>
        </div>
        <!-- /.box-body -->
    </div>
    <!-- /.box -->
</div>
{if !$timeZone}
{literal}
<script src="{$CDN_SCHEMA}/js/functions.js"></script>
<script src="{$CDN_SCHEMA}/js/schedule.js"></script>
<script type="text/javascript">
var tzInfo = GetBrowserTimeZoneInfo();
UpdateModelTimeZone( {/literal}{$modelID}{literal}, tzInfo[ "stdHourOffset" ], tzInfo[ "dst" ] );
</script>
{/literal}
{/if}
