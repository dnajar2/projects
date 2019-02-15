{assign var="no_card_msg" value="You do not currently have a card on file with us."}
{assign var="none" value="None"}
<section id="billing" style="visibility: hidden">
	<div class="account-panel">
		<div class="account-panel-title">
		<!-- title -->
			<div class="pull-left account-section-name">
				<i class="fa fa-file-text"></i> &nbsp; MY BILLING INFO
			</div>
			{*<!--
			<div class="pull-right account-panel-go-back">
				<a href="?{'show=myaccount'|base64_encode} " title="Go Back"><i class="fa fa-arrow-left"></i> <span class="hidden-xs">GO BACK</span></a>
			</div>
			-->*}
		<div class="clearfix"></div>
		</div>
			<!-- end of title -->
			<div class="clearfix"></div>
			<div class="section">


			{if $auto_buy_info}

				{if $auto_buy_info.disabled}
					<div class="alert alert-warning text-center" >
					<h2>CARD DISABLED</h2>
					Your credit card was unable to be processed.  If you feel this is in error you can click the section below to setup a new card and attempt
					to use this card again.  If you're still unable to use this card you may need to call your issuing bank or credit card company
					and make sure your purchase is being allowed to go through.  You can always choose to use a completely new card as well by clicking the section below.
					</div>
					<div class="clearfix"></div>
				{/if}


			<div class="col-md-7" style="padding-left: 0; padding-right: 0;">
				<div class="title"><i class="fa fa-chevron-right"></i>BILLING INFORMATION</div>
					<div id="billingInfo" class="table">
					<!-- left side -->
					<form id="user_info" method="post" action="lists/simple_post.php" enctype="multipart/form-data">
						<div class="col-sm-6 no-right-padding">
							<div class="section-label col-lg-6 col-md-12 col-xs-6"><i class="fa fa-user"></i> First Name</div>
							<div class="col-lg-6 col-md-12 col-xs-6 section-data">{$auto_buy_info.first_name}</div>
							{* <div class="col-lg-6 col-md-12 col-xs-6 section-input hide"><input type="text" name="first_name" id="first_name"></div> *}
							<div class="section-label col-lg-6 col-md-12 col-xs-6"><i class="fa fa-user"></i> Last Name</div>
							<div class="col-lg-6 col-md-12 col-xs-6 section-data">{$auto_buy_info.last_name}</div>
							{* <div class="col-lg-6 col-md-12 col-xs-6 section-input hide"><input type="text" name="last_name" id="last_name"></div> *}
							<div class="section-label col-lg-6 col-md-12 col-xs-6"><i class="fa fa-globe"></i> Country</div>
							<div class="col-lg-6 col-md-12 col-xs-6 section-data">{$auto_buy_info.billing_country}</div>
							{* <div class="col-lg-6 col-md-12 col-xs-6 section-input hide">
									<div class="bfh-selectbox" data-name="location" data-filter="true">
										<div data-value="">Select</div>
										<!-- sample data only -->
										<div data-value="val">Value</div>
									</div>
							</div> *}
							<div class="section-label col-lg-6 col-md-12 col-xs-6"><i class="fa fa-map"></i> State</div>
							<div class="col-lg-6 col-md-12 col-xs-6 section-data">{$auto_buy_info.billing_state}</div>
							{* <div class="col-lg-6 col-md-12 col-xs-6 section-input hide"><input type="text" name="state" id="state"></div> *}
						</div>
						<!-- end of left side -->
						<!-- right side -->
						<div class="col-sm-6">
							<div class="section-label col-lg-6 col-md-12 col-xs-6"><i class="fa fa-map-pin"></i> City/Town</div>
							<div class="col-lg-6 col-md-12 col-xs-6 section-data">{$auto_buy_info.billing_city}</div>
							{* <div class="col-lg-6 col-md-12 col-xs-6 section-input hide"><input type="text" name="city" id="city"></div> *}
							<div class="section-label col-lg-6 col-md-12 col-xs-6"><i class="fa fa-map-marker"></i> Zip Code</div>
							<div class="col-lg-6 col-md-12 col-xs-6 section-data">{$auto_buy_info.billing_zip}</div>
							{* <div class="col-lg-6 col-md-12 col-xs-6 section-input hide"><input type="text" name="zip" id="zip"></div> *}
							<div class="section-label col-lg-6 col-md-12 col-xs-6"><i class="fa fa-map-signs"></i> Address</div>
							<div class="col-lg-6 col-md-12 col-xs-6 section-data">{$auto_buy_info.billing_address}</div>
							{* <div class="col-lg-6 col-md-12 col-xs-6 section-input hide"><input type="text" name="address" id="address">< /div> *}
							<div class="section-label col-lg-6 col-md-12 col-xs-6"><i class="fa fa-mobile"></i> Phone</div>
							<div class="col-lg-6 col-md-12 col-xs-6 section-data">{$auto_buy_info.billing_phone}</div>
							{* <div class="col-lg-6 col-md-12 col-xs-6 section-input hide"><input type="text" name="phone" id="phone"></div> *}
						</div>
						{*
						<div class="col-xs-12 text-center">
							<button type="button" class="btn btn-primary"><i class="fa fa-pencil"></i> Edit</button>
						</div>
						*}
						<div class="clearfix"></div>
						</form>
						<!-- end of right side -->

					</div>
			</div>
			<div class="col-md-5">
				<div class="title"><i class="fa fa-chevron-right"></i>CARD ON FILE</div>
				<div id="ccCard" class="table">
				<form id="card_info" method="post" action="lists/simple_post.php" enctype="multipart/form-data">
					<div class="col-xs-12">
						<div class="section-label col-lg-6 col-md-12 col-xs-6"><i class="fa fa-credit-card"></i> Card Type</div>
						<div class="col-lg-6 col-md-12 col-xs-6 section-data">{$auto_buy_info.type}</div>
						<div class="section-label col-lg-6 col-md-12 col-xs-6"><i class="fa fa-asterisk"></i> Card <span class="hidden-xs">Number</span><span class="hidden-sm hidden-md hidden-lg">No</span> </div>
						<div class="col-lg-6 col-md-12 col-xs-6 section-data">{$auto_buy_info.cc_num_masked}</div>
						<div class="section-label col-lg-6 col-md-12 col-xs-6"><i class="fa fa-calendar"></i> Expiration</div>
						<div class="col-lg-6 col-md-12 col-xs-6 section-data">{$auto_buy_info.cc_exp}</div>
						<div class="section-label col-lg-6 col-md-12 col-xs-6"><i class="fa fa-lock"></i> CVV2 </div>
						<div class="col-lg-6 col-md-12 col-xs-6 section-data"><span class="mask">***</span></div>
					</div>
					</form>
					<div class="clearfix"></div>
				</div>
			</div>

				{elseif $external_card_info}
						<div class="alert alert-warning text-center" role="alert">
						You currently have a card on file with {$external_card_info.processor_name}.
						<br>To contact their customer service department, please click below.
						</div>

						<div>
							<input value="Customer Service" class="form_submit_button acctmngt_submit_btn" style="width: 160px;" onclick="open_blank( '{$external_processor_info.cancelURL}', 'externalprocessor'); this.blur(); return false;" type="button">
						</div>
					{else}
						<div class="col-sm-4 col-sm-offset-4 alert alert-warning text-center" role="alert">{$no_card_msg}
						<br>
							<a class="btn btn-primary" href="{$new_card_url}&addNewCard=true">Add New Card</a>
						</div>
					{/if}
		</div>
		<div class="clearfix"></div>
		{if !$external_card_info}
		<div id="billing_descriptor">
			<div class="title">
				<i class="fa fa-chevron-right"></i> Billing Descriptor &nbsp; <i class="fa fa-plus-circle" data-target="#descriptor"></i>
			</div>
			<div>
				{if $auto_buy_info}
				<div id="descriptor" class="panel col-md-9" style="display: none">
					{if $smarty.session.billing_type == $smarty.const.BILLING_TYPE_AUTH}
					The billed as description below is what will show on your bank or credit card statement for purchases made on the site. You will only be billed for the amount of money
					you spend in $25 increments depending on your site usage. For example if you spend $32.64 in a 24 hour period you will likely see a charge for $25 and a charge for $12.64 on your card. If you use a
					new credit card at any time please be sure to reference your new billed as descriptor as it may have changed.
					{else}
					The billed as description below is what will show on your bank or credit card statement for purchases made on the site.
					{/if} <br>
					<br>
					<div class="acctmngt_billing_row">
						<div class="acctmngt_billing_label acctmngt_form_label_txt">Billed As: {$auto_buy_info.mid_domain} {$auto_buy_info.mid_phone}</div>
					</div>
				</div>
				{else} {$no_card_msg} {/if}
			</div>
		</div>
		<div class="clearfix"></div>
		{/if}

		<!--  New, add new card -->
		{if !$auto_buy_info.disabled || $new_card_count_left == 0}

		<div id="acctmngt_new">
			<div class="title">
				<i class="fa fa-chevron-right" data-target="#acctmngt_form"></i>Use a New Credit Card {if $new_card_count_left > 0} &nbsp; <i class="fa fa-plus-circle" data-target="#acctmngt_form"></i>{/if}
			</div>
			<div id="acctmngt_desc">
				<div id="acctmngt_row_label">
					{if $new_card_count_left == 0}
					<p class="alert alert-warning">
						No new cards available </span>
					</p>
					{/if}
				</div>
			</div>
			<div id="acctmngt_form" style="display: none">
				{if $new_card_count_left > 0}
				<div class="alert alert-warning">
					<p>If your credit card was disabled or you would just like to use a
						new card you can do so by clicking below.</p>
					<p>
					<input value="Add New Card" class="btn btn-primary"
						style="width: 160px;"
						onclick="location.href='{$new_card_url}&addNewCard=true'; this.blur(); return true;"
						type="button">
					</p>
				</div>
				{else}
				<div class="alert alert-warning">
					You have used up all of your card attempts. Please <a
						href="{$contact_url}" class="normal_link">contact support</a> if
					you need additional assistance.
				</div>
				{/if}
			</div>
		</div>

	</div
	<!-- end of col -->
	{/if}
</section>
<script>
{literal}
$(document).ready(function(){
	$('#billing').removeAttr('style');
	$('.title .fa-plus-circle').on('click', function(){
		var target = $(this).attr('data-target');
		$(this).toggleClass('fa-minus-circle fa-plus-circle' );
		$(this).siblings().toggleClass('fa-chevron-down fa-chevron-right ')
		$(target).fadeToggle('slow','linear')
		})
});
{/literal}
</script>
