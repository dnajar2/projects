<div class="tr">
	<div class="col-xs-4">
		Model:
	</div>
	<div class="col-xs-8">
		<input class="form-control" type="text" name="acctmngt[subscription_datetime]" id="id_acctmngt_subscription_datetime_{$subscription->membership_id}" value="{$subscription->details.model_username}" readonly />
	</div>
</div>

<div class="tr">
	<div class="col-xs-4">
		Joined:
	</div>
	<div class="col-xs-8">
		<input class="form-control" type="email" name="acctmngt[subscription_datetime]" id="id_acctmngt_subscription_datetime_{$subscription->membership_id}" value="{$subscription->subscribe_datetime_fmt}" readonly />
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
		<input class="form-control" type="text" name="acctmngt[recurr_date]" id="id_acctmngt_recurr_date_{$subscription->membership_id}" {if $subscription->cancel_state == $smarty.const.SUBSCRIPTION_CANCEL_CAN_RESUBSCRIBE || $subscription->cancel_state == $smarty.const.SUBSCRIPTION_CANCEL_PENDING}value="{$subscription->cancelled_date_fmt}"{else}value="{$subscription->recurr_date_fmt}"{/if} readonly="readonly" onclick="this.blur();" />
	</div>
</div>
<div class="clearfix"></div>
<div id="acctmngt_subscription_cancel_btn_{$subscription->membership_id}" class="text-right" >
	{if $subscription->cancel_state == $smarty.const.SUBSCRIPTION_CANCEL_PENDING}
	    Billing stopped on {$subscription->stop_date_fmt}, <br>benefits will expire on {$subscription->recurr_date_fmt}
    {elseif $subscription->cancel_state == $smarty.const.SUBSCRIPTION_CANCEL_CAN_RESUBSCRIBE}
    	<button type="button" name="acctmngt_email_cancel" id="acctmngt_subscription_cancel_{$subscription->membership_id}" class="btn button-3" >Re-Subscribe</button>
    {else}
    	<button type="button" name="acctmngt_email_cancel" id="acctmngt_subscription_cancel_{$subscription->membership_id}"  class="btn button-3" >Cancel Membership</button>
    {/if}
</div>
