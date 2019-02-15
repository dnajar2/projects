
<section id="notifications" style="visibility: hidden" >
	<div class="account-panel">
		<div class="account-panel-title"><!-- title -->
			<div class="pull-left account-section-name">
				<i class="fa fa-bell"></i> &nbsp; NOTIFICATIONS
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- end of title -->
			<div class="clearfix"></div>
		<h2><i class="fa fa-chevron-right primary-color"></i> NOTIFICATION SETTINGS</h2>
		<!--  top section Notification settings -->
		<div class="notifications-panel col-md-12">
			<form id="notifications_form" action="/api/members/notifications.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
				<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
				<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
				<input type="hidden" id="request_type" name="request_type" value="Submit">

			<div class="col-md-6">
				<div class="notification-icon col-sm-5 text-center hidden-xs">
					<div class="col-sm-2">&nbsp;</div>
					<div class="col-sm-8">
						<img src="{$smarty.const.CDN_SCHEMA}/images/wcc3/assets/phone.png"  alt="my notifications"/>
					</div>
					<div class="col-sm-2">&nbsp;</div>
				</div>
				<div class="intorText col-sm-7 ">
					<img src="{$smarty.const.CDN_SCHEMA}/images/wcc3/assets/phone.png"  alt="my notifications" width="50" height="83" class="hidden-sm hidden-md hidden-lg" style="float:left; padding-right:15px; padding-top:5px"/>
					<h3 class="primary-color">YOU CAN RECEIVE FREE SMS TEXT MESSAGE ALERTS WHEN YOUR FAVORITE MODELS COME ONLINE.</h3>
					<p>Enter your phone number and specify your notifications settings.</p>
					<em>There is no charge for using this system, only carrier charges may apply.</em>
				</div>
			<div class="clearfix"></div>
			</div>
			<div id="nrsp" class="col-md-6" > <!-- nrsp notification right side pannel -->
	 		<!-- strat of row -->
	 		<input type="hidden" id="clearPhone" name="clearPhone" value="">
	 			<div id="initial_errors" class="col-sm-9 col-sm-offset-3  text-center alert" style="display:none">
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
				<div id="verification_code" class="col-sm-9 col-sm-offset-3" style="display:none" >
					<div class="col-xs-7" style="padding-left: 0">
						<input type="text" id="member_cellphone_verify_code" class="form-control" name="member_cellphone_verify_code" value="">
					</div>
					<div class="col-xs-5" style="padding:0">
						<button type="button" class="btn btn-primary pull-left" style="width: 100%" name="verification_code" value="verification code">Verify</button>
					</div>
					<div class="clearfix"></div>
				</div>
				<!--  end of sms verification -->


				<div id="if_cellphone_verified" style="display:none">
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
						{foreach from=$notify_times item="time" }
							<div data-value="{$time.value}">{$time.caption}</div>
						{/foreach}
						</div>
					</div>
					<div id="andSpacer" class="col-xs-2 text-center">
					AND
					</div>
					<div class="col-xs-5" style="padding:0">
						<div class="bfh-selectbox" data-name="member_cellphone_schedule[1]" data-value="{$cellphone_alert_schedule[1]}">
						{foreach from=$notify_times item="time" }
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

				<div class="col-sm-9 col-sm-offset-3 alert_checkbox text-center formElm" >
 					<label class="checkbox-inline">
  					<input type="checkbox" name="member_loggedin_alerts" id="member_loggedin_alerts" value="1" {if $loggedin_alerts} checked{/if}><span></span>
					</label>
					&nbsp; NO MODEL ALERTS WHILE I AM LOGGED IN
				</div>
				</div>

				<div class="col-sm-9 col-sm-offset-3 alert_checkbox text-center">
					<button id="verify_btn" type="button" class="btn btn-primary mobile-btn" {if !$member_cellphone_verified && $member_cellphone_verify_code}
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


		<div class="clearfix"></div>
		<!--  end of  top section Notification settings -->
		<!-- Alerts grid -->
			<div id="notifications_grid">
			<h2><i class="fa fa-chevron-right primary-color"></i> ALERT NOTIFICATIONS</h2>
			<div class="notifications-panel col-md-12" style="visibility: hidden">
				<div class="notifications">
					<div class="grid">
						<div class="grid-sizer"></div>
						{ foreach from=$alerts item="alert"}
						<div id="{$alert.id}" class="grid-item">
						<div class="request alert alert-info" style="display: none">
							<div class="req_warning row">
								Are you sure you want to remove { $alert.username }?<br>
								<div class="col-sm-3 col-sm-offset-3 btn btn-success" data-target="{$alert.id}" >YES</div>
								<div class="col-sm-3 btn btn-danger" data-target="{$alert.id}">NO</div>
							</div>
							<div class="proc_req" style="display:none">
							Removing "{ $alert.username }" from mobile aletrs.
							<img src="{$smarty.const.CDN_SCHEMA}/images/wcc3/loading-sm.gif">
							</div>

						</div>
							<img src="{ $alert.photo_mid_url }" alt="{ $alert.username }">
							<div class="model-stats-label fav-sts-{if $alert.online eq 0}offline {else}available{/if}">
								<div class="anmn col-xs-8"> <!-- anmn Alerts Notification Model Name -->
									{ $alert.username }
										</div>
								<div class="anms col-xs-4 text-right"><!-- anms Alerts Notifications Model Status -->
									<span>{if $alert.online eq 0}Offline{else}Online{/if}</span>
								</div>
							</div>
							<div class="stop-alerts">
								<i class="fa fa-times"></i> STOP ALERTS
							</div>
						</div>
					{/foreach}
					</div>
					{if !$member_cellphone_verified}
						<h3>NO CELL PHONE REGISTERED. TO RECEVIE ALERTS, ADD IT TODAY </h3>
					{/if}
					{ if $member_cellphone_verified and !$alerts}
					<h3>YOU HAVE NOT SELECTED ANY MODEL ALERTS YET</h3>
					{/if}
				</div>
			</div>
			</div>
			<div class="clearfix"></div>
	</div><!-- end of col -->

</section>
<!-- end of section -->

<script>

{if !$member_cellphone_verified && $member_cellphone_verify_code}
{literal}
	$(document).ready(function(){
		$('#verification_code').slideDown()
	});
{/literal}
{/if}
{if $member_cellphone_verified }
{literal}
$('#if_cellphone_verified').show();
{/literal}
{/if}
</script>
