<div id="setup_model_notification" class="slide-up-notifications pop-under" style="display: none">
<div class="new_message_header">
			<div class="col-xs-9">Notifications Settings</div>
			<div class="col-xs-3 text-right" onclick="mobileAlerts.closeDialog()">
				<i class="fa fa-times"></i>
			</div>
			<div class="clearfix"></div>
		</div>
			<form  id="setup_mobile_notificatons" action="/api/members/notifications.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
				<input type="hidden" name="member_id" value="{$smarty.session.userid}">
				<input type="hidden" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
				<input type="hidden" id="request_type" name="request_type" value="">
                <!-- new code -->
                {if  $member_cellphone_verified eq "0" && $member_cellphone_verify_code}
                    <input type="hidden" id="new_code" name="new_code" value="{$Member.member_id}">
                {/if}
			<div class="col-md-12">
				<div class="intorText">
					<p>You can receive free sms text message alerts when your favorite models come online.</p>
                    <!-- <p>Enter your phone number and specify your notifications settings.</p> -->
					<em>There is no charge for using this system, only carrier charges may apply.</em>
				</div>
			</div>
			<div class="clearfix"></div>
			<hr>
			<div id="nrsp" class="col-md-12" >
			<!-- nrsp notification right side pannel -->
			<!-- strat of row -->
			<input type="hidden" id="clearPhone" name="clearPhone" value="">
				<div id="initial_errors" class="text-center alert" style="display:none">
				</div>
				<div class="col-sm-3">DIAL PREFIX:</div>
				<div class="col-sm-9">
					<div class="bfh-selectbox" data-name="member_dial_prefix" data-value="{$member_dial_prefix}">
						{foreach from=$sms_dial_prefixes item="prefix"}
						<div data-value="{$prefix.prefix}">{ $prefix.description}</div>
						{/foreach}
					</div>
				</div>
				<!-- end of row -->
				<!-- strat of row -->
				<div class="col-sm-3">MOBILE NUMBER:</div>
				<div class="col-sm-9">
					 <input type="text" id="member_cellphone" name="member_cellphone" class="form-control" value="{$member_cellphone}">
				</div><!-- end of row -->

				<!--  sms verification -->
				<div id="verification_code" class="col-sm-9 col-sm-offset-3" style="display:{if !$member_cellphone_verified && $member_cellphone_verify_code}block{else}none{/if}" >
					<div class="col-xs-7" style="padding-left: 0">
						<input type="text" id="member_cellphone_verify_code" class="form-control" name="member_cellphone_verify_code" value="">
					</div>
					<div class="col-xs-5" style="padding:0">
						<button type="button" class="btn btn-primary pull-left" style="width: 100%" name="verification_code" value="verification code">Verify</button>
					</div>
					<div class="clearfix"></div>
				</div>
				<!--  end of sms verification -->


				<div id="if_cellphone_verified hide" style="display:none">
				<div class="col-sm-9 col-sm-offset-3 text-right">
					<span id="clear_mobile">Clear mobile number</span>
				</div>
				<div id="warning" class="col-sm-9 col-sm-offset-3 text-center alert alert-danger" style="display:none">
					Are you sure you want to clear your mobile number?<br>
					<div class="col-xs-3 col-xs-offset-3">
						<div id="clear_yes" class="btn btn-success">Yes</div>
					</div>
					<div id="clear_no" class="col-xs-3">
						<div class="btn btn-danger">No</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div id="warning2" class="col-sm-9 col-sm-offset-3 text-center alert alert-info" style="display:none">
					Please give us a second to process your request.<br>
					<img src="{$smarty.const.CDN_SCHEMA}/images/wcc3/loading-sm.gif">
				</div>


				<!-- strat of row -->
				<div class="col-sm-3">NOTIFY BETWEEN:</div>
				<div class="col-sm-9">
					<div class="col-xs-5" style="padding:0">
						<div class="bfh-selectbox" data-name="member_cellphone_schedule[0]" data-value="{$cellphone_alert_schedule[0]}">
						{ foreach from=$notify_times item="time" }
							<div data-value="{$time.value}">{$time.caption}</div>
						{/foreach}
						</div>
					</div>
					<div id="andSpacer" class="col-xs-2 text-center">
					AND
					</div>
					<div class="col-xs-5" style="padding:0">
						<div class="bfh-selectbox" data-name="member_cellphone_schedule[1]" data-value="{$cellphone_alert_schedule[1]}">
						{ foreach from=$notify_times item="time" }
							<div data-value="{$time.value}">{$time.caption}</div>
						{/foreach}
						</div>
					</div>
					<div class="clearfix"></div>
				</div><!-- end of row -->
				<!-- strat of row -->
				<div class="col-sm-3">MAX ALERTS:</div>
				<div class="col-sm-9">
					<div class="bfh-selectbox" data-name="member_cellphone_schedule[2]" data-value="{$cellphone_alert_schedule[2]}">
					{foreach from=$sms_max_alerts item="max_alerts"}
					<div data-value="{$max_alerts.max_alerts}">{$max_alerts.label}</div>
					{/foreach}
					</div>
				</div><!-- end of row -->
				<div class="clearfix"></div>
				<div class="alert_checkbox text-center formElm" >
 					<label class="checkbox-inline">
  					<input type="checkbox" name="member_loggedin_alerts" id="member_loggedin_alerts" value="1" {if $loggedin_alerts} checked{/if}><span></span>
					</label>
					&nbsp; NO MODEL ALERTS WHILE I AM LOGGED IN
				</div>
				</div>
				<div class="clearfix"></div>
				<hr>
				<div class="col-sm-9 col-sm-offset-3 alert_checkbox text-right">
					<button type="button" id="verify_btn" class="btn btn-primary mobile-btn" {if
					!$member_cellphone_verified && $member_cellphone_verify_code}
						name="sms_resend_verify_code" value="Resend Verify Code"
						{else}
						name="submit_sms" value="Submit"
						{/if} >
						{if !$member_cellphone_verified && $member_cellphone_verify_code}
							Resend Verify Code
						{else}
							Submit
						{/if}
						</button>
				</div>
			</div>
		</form>
		</div>
