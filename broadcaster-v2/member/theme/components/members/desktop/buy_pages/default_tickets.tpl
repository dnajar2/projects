		<!-- credit blocks -->
		<div class="account-panel-subtitle package-label">
			<h2 class="text-center">FEATURE SHOW TICKET<span>All Tickets are good for any show any time and NEVER Expires!.</span></h2>
		</div>
		<div id="credits" class="col-sm-12">
			<div id="credits_width">
			{if $filler_cp_sm_cols gt 0}
			<div id="cp-cols-filler" class="col-sm-{$filler_cp_sm_cols}"></div>
			{/if}
			{foreach from=$credit_packages item='package'}
			<!-- credit block -->
			<div id='package_{$package.credit_id}' class="{if $package.is_popular}popular primary-border credit-package-selected{else}credit-package{/if} package-box col-sm-2">
				<span class='package-id hide'>{$package.credit_id}</span>
				<span class='package-type hide'>ticket</span>
				<span class='num-free-tickets hide'>{$package.num_free_tickets}</span>
				<span class='free-tickets-value hide'>{$package.free_tickets_value}</span>
				<div class="popular-title primary-bg-color">
					FEATURE SHOW!
				</div>
				<div class="credit-amount ">
					1
				</div>
				<div class="credit-amount-subtitle credits-spacer">
					TICKET
					<br><small> &nbsp; </small>
				</div>
				<div class="credit-value">
					${$package.price}
				</div>
				<div class="selected">
					<span class="show">{if $package.is_popular}SELECTED{else}SELECT{/if}</span>
				</div>
			</div>
			<!-- end of credit block-->
			{/foreach}
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>

		<div class="payment-method">
			<div class="col-sm-12">
				<div class="account-panel-title">
					<h2><i class="fa fa-chevron-right"></i><span id="payment-method-title">{if $can_auto_buy} SELECT YOUR PAYMENT METHOD{else} ADD {if $can_auto_buy}NEW {/if}CREDIT CARD{/if}</span></h2>
				</div>
				<div class="col-sm-12">
					<div id="ecf" class="col-sm-6{if ! $can_auto_buy} hide{/if}">
						<button type="button" class="btn button-2" data-toggle="modal" data-target="#existing-card" data-backdrop="static" data-keyboard="false" onclick="Merchant.processRebuy(this);">USE EXISTING CARD ON FILE</button>
						<div class="account-card-on-file">
							<strong>Card Name:</strong> <span id="card-onfile-name" class="card-name">{$auto_buy_info.first_name} {$auto_buy_info.last_name}</span> &nbsp;<br> <strong>Card Number:</strong> <span id="card-onfile-ccnum" class="card-name">{$auto_buy_info.cc_num_masked}</span>
						</div>
					</div>
					<div id="apm" class="col-sm-6">
						<button type="button" class="btn button-2" data-toggle="modal" data-target="#add-card" data-backdrop="static" data-keyboard="false" onclick="Merchant.useNewCard(this);">ADD NEW CREDIT CARD</button>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
