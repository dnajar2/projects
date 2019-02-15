{*<!-- adding a new credit card modal -->*}
<div class="modal animated fadeIn" id="add-card" tabindex="-1" role="dialog" aria-labelledby="add-card">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header navbar-inverse">
				<h1 class="modal-title">Add Payment Method{if $special_package.additional_title}{$special_package.additional_title}{/if}</h1>
				<button id="close-newcard" type="button" class="close" onclick="$('#add-card').modal('toggle');">
					<i class="fa fa-times fa-1x"></i>
				</button>
			</div>
			<div id="add-cc" class="modal-body">
				<div class="col-sm-3">
					<div style="padding: 0" class="col-sm-12">
						<div class="cardOnFleTitle hidden-xs">
							{if $special_package}{$special_package.title}{else}Most Popular{/if}
						</div>
						<div class="packageSelected">
							<div class="credits-modal">
								<div class="credit-amount-modal">{if $special_package}{$special_package.credit}{/if}</div>
								<div class="credits-text-modal">{if $special_package}{$special_package.name}{/if}</div>
								<div class="free-credits"> &nbsp; </div>
							</div>
							<div class="credit-value-modal">
								${if $special_package}{$special_package.price}{else}{$popular_package.price}{/if}
							</div>
						</div>
					</div>
					<div class="features-enabled col-sm-12 hidden-xs">
						<ul>
							<li><i class="fa fa-check"></i> Private Shows</li>
							<li><i class="fa fa-check"></i> Voyeur Shows</li>
							<li><i class="fa fa-check"></i> Goal Shows</li>
							<li><i class="fa fa-check"></i> Party Shows</li>
							<li><i class="fa fa-check"></i> Video on Demand</li>
							<li><i class="fa fa-check"></i> Phone 2 Phone</li>
							<li><i class="fa fa-check"></i> Tipping</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="clearfix hidden-sm hidden-md hidden-lg"></div>
			<div class="col-sm-9 main-transaction">
				<form id="apm-new-card" name="apm-new-card" method="POST" action="/api/members/{$form_action_script}?{$smarty.session.session_name}={$smarty.session.session_id}" enctype="application/x-www-form-urlencoded" onsubmit="Merchant.processCreditCard(event);">
					<input type="hidden" id="cc_type" name="type" value="sale">
					<input type="hidden" id="cc_member_id" name="member_id" value="{$smarty.session.userid}">
					<input type="hidden" id="cc_package_id" name="credit_id" value="{if $special_package}{$special_package.credit_id}{else}{$popular_package_id}{/if}" class="bp-package-id">
					<input type="hidden" id="cc_session_id" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
					<input type="hidden" id="cc_price_id" name="price" value="{$special_package.price}">
					<input type="hidden" id="last_step" name="last_step" value="yes">
					<input type="hidden" id="cc_submitted_id" name="submitted" value="1">
					<input type="hidden" id="mid_id" name="mid_id" value="{$form.mid_id}">
					<input type="hidden" id="cc_payment_method_id" name="payment_method_id" value="0">
					<input type="hidden" id="id_pg_ccc" name="pg_ccc" value={if $form.pg_ccc}{$form.pg_ccc}{else}"1"{/if} />
					<input type="hidden" id="id_pg_ccf" name="pg_ccf" value={if $form.pg_ccc lt 16}"0"{else}"1"{/if} />
					<input type="hidden" id="id_pg_ccs" name="pg_ccs" value="{if $form.pg_ccs}{$form.pg_ccs}{else}1{/if}" />
					<!-- add new card -->
					<div class="modal-lables col-sm-12">BILLING INFO</div>
					<div class="col-xs-6 bf-input" style="margin:0;margin-bottom:5px;"><i class="fa fa-user"></i><input name="firstName" id="id_firstName" type="text" placeholder="First Name" autocomplete="given-name"></div>
					<div class="col-xs-6 bf-input" style="margin:0;margin-bottom:5px; padding:0;"><i class="fa fa-user"></i><input name="lastName" id="id_lastName" type="text" placeholder="Last Name" autocomplete="family-name"></div>
					<div class="col-xs-6 bf-input" style="margin:0;margin-bottom:5px;"><i class="fa fa-map-marker"></i><input name="streetAddress" id="id_street_address" type="text" placeholder="Street Address" autocomplete="address-line1"></div>
					<div class="col-xs-6 bf-input" style="margin:0;margin-bottom:5px; padding:0;"><i class="fa fa-map-pin"></i><input name="city" id="id_city" type="text" placeholder="City/Town" autocomplete="address-level2"></div>
					<div class="col-xs-6 bf-input" style="margin:0;margin-bottom:5px;">
						<i class="fa fa-map-pin"></i>
						<select id="id_state_id" name="stateID" placeholder="State" autocomplete='address-level1'>
							{if !$form.state_id && $smarty.session.geoip_record.region}
							{assign var='form_state' value=$smarty.session.geoip_record.region}
							{else}
							{assign var='form_state' value=$form.state_id}
							{/if}
							{html_options selected=$form_state options=$states}
						</select>
					</div>
					<div class="col-xs-6 bf-input" style="margin:0;margin-bottom:5px; padding:0;">
						<i class="fa fa-globe"></i>
						<select id="id_country_id" name="countryID" placeholder="Country" autocomplete='country-name'>
							{if !$form.country_id && $smarty.session.geoip_record.country_id}
							{assign var='form_country' value=$smarty.session.geoip_record.country_id}
							{else}
							{assign var='form_country' value=$form.country_id}
							{/if}
							{html_options selected=$form_country options=$countries}
						</select>
					</div>
					<div class="col-xs-6 bf-input" style="margin:0;margin-bottom:5px;"><i class="fa fa-map-pin"></i><input name="zipcode" id="id_zipcode" type="text" placeholder="Zip Code" autocomplete='postal-code'></div>
					<div class="col-xs-6 bf-input" style="margin:0;margin-bottom:5px; padding:0;"><i class="fa fa-mobile"></i><input name="phone_number" id="id_phone_number" type="text" placeholder="Phone (optional)"  autocomplete='tel'></div>
					<div class="modal-lables col-sm-12">PAYMENT DETAILS</div>
					<div class="col-sm-6 bf-input" style="margin:0;margin-bottom:5px;"><i class="fa fa-user" style="height:36px !important;"></i><input name="cc_name" id="id_cc_name" type="text" class="apm-new-card-input" placeholder="Name on Card" autocomplete='cc-name'></div>
					<div class="col-sm-6 col-xs-8 bf-input" style="margin:0;margin-bottom:5px; padding-right:7px;"><i id="cc-fa-font-type" class="fa fa-credit-card cc-icon-card"></i><input name="cc_number" id="id_ccnum" type="text" class="apm-new-card-input ccFormatMonitor" placeholder="Card Number" autocomplete='cc-number'></div>
					<div id="cvv2" class="col-sm-6 col-xs-4 bf-input"><i class="fa fa-lock"></i><input class='apm-new-card-input' name="cc_vv" id="id_cc_vv" type="text" placeholder="CVV2" autocomplete="off"></div>
					<div class="col-sm-6" style="margin-bottom:5px;">
						<div id="expirationLabel" class="col-xs-5" style="padding-left: 0; padding-right: 0; padding-top: 10px;">Expiration: </div>
						<div id="month" class="bf-input col-xs-3" style="position:relative; left: 0px; padding-left: 0; padding-right: 0;">
							<select name="cc_exp_month" id="id_cc_exp_month">
								{foreach from=$cc_months key="month_name" item="month_number"}
								<option value="{$month_number}">{$month_number}</option>
								{/foreach}
							</select>
						</div>
						<div id="year" class="bf-input col-xs-4" style="padding-left: 0; padding-right: 0;">
							<select name="cc_exp_year" id="id_cc_exp_year">
								{foreach from=$cc_years item="year"}
								<option value="{$year}">{$year}</option>
								{/foreach}
							</select>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
					{if ! $special_package.hide_coupon}
					<div class="col-sm-6 bf-input" style="margin:0;margin-bottom:5px;"><i class="fa fa-share-alt"></i><input name="coupon" id="id_coupon" type="text" placeholder="Coupon Code" autocomplete="off"></div>
					<div class="clearfix"></div>
					{/if}
					<div id="ecf-extra">
						<div id="mid-info" class="col-sm-12">
							This charge will appear on your bill as <span id="mid_bill_domain">{$mid.billDomain}</span> <span id="mid_phone">{$mid.phone}</span><br>
						</div>
						<div class="clearfix"></div>
						<div id="ecf-ip" class="col-sm-12">
							Your IP address: <span id="bill_ip">{$smarty.session.ipSession}</span> (logged for fraud prevention)
						</div>
						{if $smarty.session.billing_type == $smarty.const.BILLING_TYPE_DEFAULT && $mid.buyPageNotice2}
						<div id="mid_notice" class="col-sm-12">
							{$mid.buyPageNotice2}
						</div>
						{/if}
						{if $member_disable_auto_credit_purchase}
						<div class="clearfix"></div>
						<div class="col-sm-12">Credits will be auto loaded during premium sessions</div>
						{/if}
						{if 1==2 && $can_show_xsale}
						<div class="clearfix"></div>
						<div class="col-sm-12">
							<div><input type="checkbox" id="id_wca" style="visibility: visible !important" name="wca" value="1"{if $form.wca} checked="checked"{/if}>&nbsp;&nbsp;I'd like to try a {$wca_period} day trial membership to {$wca_domain} for only {$wca_trial_price_fmt}*</div>
						</div>
						{/if}
						<div class="clearfix"></div>
					</div>
					<!-- end of add new card -->
					<div id="buy_credits" class="col-sm-12">
						<button type="submit" class="btn button-2 ecf-buy-credits"><span id="auth-trans-button">{if $special_package.button_label}{$special_package.button_label}{else}AUTHORIZE TRANSACTION{/if}</span></button>
					</div>
					<div id="newcard-processing" class="processing hide" style="margin-top:45px;">
						<div id="rebuy-processing" class="text-center">
							<span>PROCESSING TRANSACTION</span>&nbsp;&nbsp;<img src="../images/wcc3/assets/ring-alt.svg" width="25px" height="25px;">
						</div>
					</div><!-- end of processing div -->

				</form>
			</div>
			<!-- end of right side content -->
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
{*<!-- end of adding a card modal -->*}
