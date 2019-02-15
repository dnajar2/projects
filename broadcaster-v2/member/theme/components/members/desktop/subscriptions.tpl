<section id="my-subscriptions" class="animated fadeIn" ><!-- start of my subscriptions section -->
	<div class="account-panel">
		<div class="account-panel-title"><!-- title -->
			<div class="pull-left account-section-name">
				<i class="fa fa-retweet"></i> &nbsp; SUBSCRIPTIONS
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
		<div class="grid">
			<form id="memberships" action="/api/members/subscriptions.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
				<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
				<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
				<input type="hidden" id="membership_id" name="membership_id" value="">
			</form>
			<div class="grid-sizer"></div>
			{if $member_subscriptions}
				{foreach from=$member_subscriptions key="subscription_key" item="subscription" name="member_subscriptions"}
				<div id="{$subscription->membership_id}" class="section grid-item">
					<div class="subscribed-product"><!-- left side -->
						<div class="row">
							{if $subscription->cancel_state neq $smarty.const.SUBSCRIPTION_CANCEL_FAILED_BILLING}
							<div class="product_title">
								Product: {$subscription->name}
							</div>
							{assign var="login_template" value=$subscription->template_acctmngt_login}
							{include file="$_THEME/components/members/subscriptions/$login_template.tpl" subscription=$subscription}
							{/if}
						</div>
					</div>
					<div class="aler-slideup" style="display: none;">
						<div class="message text-center">
							Are you sure you want to cancel this subscription?<br>
							<div>
								<button type="button" class="btn btn-success"><img style="display: none;" class="spinner"><span class="acttion-yes">Yes</span></button> <button type="button" class="btn btn-danger">No</button>
							</div>

						</div>
					</div>
				</div>
				{/foreach}
				{else}
				You have no subscriptions
			{/if}

			<div class="clearfix"></div>
		</div>
	</div><!-- end of col -->
</section>
