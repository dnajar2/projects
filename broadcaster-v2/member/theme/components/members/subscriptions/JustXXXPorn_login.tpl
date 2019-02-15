<div id="jxp">
	<div class="tr">
		<div class="col-xs-4">
			Subscribed:
		</div>
		<div class="col-xs-8">
			<input class="form-control" type="text" name="acctmngt[subscription_datetime]" id="id_acctmngt_subscription_datetime_{$subscription->membership_id}" value="{$subscription->subscribe_datetime_fmt}" readonly="readonly" onclick="this.blur();" />
		</div>
	</div>
	<div class="tr">
		<div class="col-xs-4">
				{if $subscription->cancel_state == $smarty.const.SUBSCRIPTION_CANCEL_CAN_RESUBSCRIBE}
					Expired On:
				{elseif $subscription->cancel_state == $smarty.const.SUBSCRIPTION_CANCEL_PENDING}
					Expires On:
				{else}
					Recurrs:
				{/if}
		</div>
		<div class="col-xs-8">
			<input class="form-control" type="text" name="acctmngt[recurr_date]" id="id_acctmngt_recurr_date_{$subscription->membership_id}"{if $subscription->cancel_state == $smarty.const.SUBSCRIPTION_CANCEL_CAN_RESUBSCRIBE || $subscription->cancel_state == $smarty.const.SUBSCRIPTION_CANCEL_PENDING} value="{$subscription->cancelled_date_fmt}"{else} value="{$subscription->recurr_date_fmt}"{/if} readonly="readonly" />
		</div>
	</div>
	
	{if $subscription->cancel_state == $smarty.const.SUBSCRIPTION_CANCEL_CLEAR || $subscription->cancel_state == $smarty.const.SUBSCRIPTION_CANCEL_PENDING}
	<div class="tr">
		<div class="col-xs-4">
			Username:
		</div>
		<div class="col-xs-8">
			<input type="text" name="acctmngt[subscription_username]" id="id_acctmngt_subscription_username_{$subscription->membership_id}" class="form-control" value="{$subscription->username}" readonly="readonly" onclick="this.blur();" />
		</div>
	</div>
	<div class="tr">
		<div class="col-xs-4">
			Password:
		</div>
		<div class="col-xs-8">
			<input type="text" name="subscription_password" id="subscription_password" class="form-control" value="**********" readonly="readonly" />
			<input type="hidden" name="pass" id="pass" value="{$subscription->password}">
		</div>
	</div>
	<div class="tr">
		<div class="col-xs-4">
			Email:
		</div>
		<div class="col-xs-8">
			<input  type="text" name="acctmngt[subscription_email]" id="id_acctmngt_subscription_email_{$subscription->membership_id}" class="form-control" value="{$subscription->email}" readonly="readonly" onclick="this.blur();" />
		</div>
	</div>
	<div class="tr">
		<div class="col-xs-4">
			Login Url:
		</div>
		<div class="col-xs-8">
			<input type="text" name="acctmngt[subscription_login_url]" id="id_acctmngt_subscription_login_url_{$subscription->membership_id}" class="form-control" value="{$subscription->login_url}" readonly="readonly" onclick="this.blur();" />
		</div>
	</div>
	{/if}
	<div class="form_row acctmngt_submit_btn_row">
		<div class="tr">
			<div class="col-xs-4 text-left">
			{if $subscription->cancel_state == $smarty.const.SUBSCRIPTION_CANCEL_CLEAR || $subscription->cancel_state == $smarty.const.SUBSCRIPTION_CANCEL_PENDING}
			<button name="acctmngt_email_submit" id="acctmngt_subscription_login_{$subscription->membership_id}" class="btn button-2" onclick="window.open('{$subscription->loginUrl}');" >Login Now</button>
			{/if}
			</div>
			
			<div id="acctmngt_subscription_cancel_btn_{$subscription->membership_id}" class="col-xs-8 text-right">
			{if $subscription->cancel_state == $smarty.const.SUBSCRIPTION_CANCEL_PENDING}
				<div>Billing stopped on {$subscription->stop_date_fmt}. Access will expire on {$subscription->recurr_date_fmt}</div>
			{elseif $subscription->cancel_state == $smarty.const.SUBSCRIPTION_CANCEL_CAN_RESUBSCRIBE}
				<button  type ="button" name="acctmngt_email_cancel" id="acctmngt_subscription_cancel_{$subscription->membership_id}" class="btn button-2" >Re-Subscribe</button>
			{else}
				<button name="acctmngt_email_cancel" id="acctmngt_subscription_cancel_{$subscription->membership_id}" class="btn button-3"  >Cancel Subscription</button>
			{/if}
			</div>
		</div>
	</div>
</div>