<div id="confirm_email_top_bar" class="wlb" style="display: none">
	<div class="col-sm-6 primary-color" style="padding-top: 5px;">
		<i class="fa fa-envelope-o"></i> &nbsp;
		You must confirm your email address by clicking the link in the email that was sent to you.
	</div>
	<div class="col-sm-6">
		<span class="pull-right">
		{if $smarty.session.show_confirm_email.can_check_email}
			<button type="button" class="btn button-2" onclick="window.open('{$smarty.session.show_confirm_email.email_signin_url}');">Check email now</button>
		{/if}
			<button type="button" class="btn button-2" onclick="resend_email_conf()">Resend email</button>
			<button type="button" class="btn button-2" onclick="member_registration.change_email()">Change email address</button>
			<i class="close fa fa-times-circle" data-target="#confirm_email_top_bar"></i>
		</span>
	</div>
	<div class="clearfix"></div>
</div>
