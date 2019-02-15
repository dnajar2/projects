		<div class="account-panel-subtitle hidden-xs">
			<h2>YOU ARE JUST <span>ONE STEP</span> AWAY FROM:</h2>
			<div style="margin-top: 10px" class="col-md-7 col-sm-8 col-xs-6 col-md-offset-3 col-sm-offset-2 features">
				<ul>
					<li><i class="fa fa-check"></i>&nbsp;Private Shows</li>
					<li><i class="fa fa-check"></i>&nbsp;Voyeur Shows</li>
					<li><i class="fa fa-check"></i>&nbsp;Goal Shows</li>
					<li><i class="fa fa-check"></i>&nbsp;Party Shows</li>
				</ul>
			</div>
			<div class="col-md-7 col-sm-8 col-xs-6 col-md-offset-3 col-sm-offset-2 features">
				<ul>
					<li><i class="fa fa-check"></i>&nbsp;Offer Shows</li>
					<li><i class="fa fa-check"></i>&nbsp;Interactive Chat</li>
					<li><i class="fa fa-check"></i>&nbsp;Feature Shows</li>
					<li><i class="fa fa-check"></i>&nbsp;Phone 2 Phone</li>
					<li><i class="fa fa-check"></i>&nbsp;Tipping</li>
					<li><i class="fa fa-check"></i>&nbsp;Fan Clubs</li>
					<li><i class="fa fa-check"></i>&nbsp;Site Messaging</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>

		<!-- credit blocks -->
		<div class="account-panel-subtitle package-label">
			<h2 class="text-center primary-color">{if $membership_packages}<span id="optionOne">Option 1.</span>{/if}CREDIT PACKAGES<span>Purchase credits as you need them.</span><span class="credits-free-tickets-msg hide"></span></h2>
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
				<span class='package-type hide'>credits</span>
				<span class='num-free-tickets hide'>{$package.num_free_tickets}</span>
				<span class='free-tickets-value hide'>{$package.free_tickets_value}</span>
				{if $package.is_popular}
				<div class="popular-title primary-bg-color">
					MOST POPULAR!
				</div>
				{/if}
				<div class="credit-amount ">
					{$package.credits}
				</div>
				<div class="credit-amount-subtitle credits-spacer">
					CREDITS
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

		{if $membership_packages}
		<!-- membership blocks -->
		<div id="memberships_lead" class="account-panel-subtitle package-label">
			<h2 class="text-center primary-color"><span>Option 2</span>MEMBERSHIP PACKAGES <span>Credits given monthly and purchased when you need them.</span><span class="membership-free-tickets-msg hide"></span></h2>
		</div>
		<div id="memberships" class="col-sm-12">
			{if $filler_mp_sm_cols gt 0}
			<div id="mp-cols-filler" class="col-sm-{$filler_mp_sm_cols}"></div>
			{/if}
			{foreach from=$membership_packages item='package'}
				<!-- membership block -->
				<div class="credit-package package-box col-sm-2">
					<span class='package-id hide'>{$package.credit_id}</span>
					<span class='package-type hide'>membership</span>
					<span class='num-free-tickets hide'>{$package.num_free_tickets}</span>
					<span class='free-tickets-value hide'>{$package.free_tickets_value}</span>
					<div class="popular-title">
						{$package.name}
					</div>
					<div class="credit-amount ">
						{$package.credits}
					</div>
					<div class="credit-amount-subtitle credits-spacer">
						CREDITS
						<br><small> &nbsp; </small>
					</div>
					<div class="credit-value">
						${$package.price}
					</div>
					<div class="selected">
						<span class="show">SELECT</span>
					</div>
				</div>
			{/foreach}
			<!-- end of membership block-->
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
		{/if}

		<div class="payment-method">
			<div class="col-sm-12">
				<div class="account-panel-title">
					<h2><i class="fa fa-chevron-right"></i><span id="payment-method-title">{if $can_auto_buy} SELECT YOUR PAYMENT METHOD{else} ADD {if $can_auto_buy}NEW {/if}CREDIT CARD{/if}</span></h2>
				</div>
				<div class="col-sm-12">
					<div id="ecf" class="col-sm-6{if ! $can_auto_buy} hide{/if}">
						<button type="button" class="btn button-2"  data-keyboard="false" onclick="Merchant.processRebuy(this);">USE EXISTING CARD ON FILE</button>
						<div class="account-card-on-file">
							<strong>Card Name:</strong> <span id="card-onfile-name" class="card-name">{$auto_buy_info.first_name} {$auto_buy_info.last_name}</span> &nbsp;<br> <strong>Card Number:</strong> <span id="card-onfile-ccnum" class="card-name">{$auto_buy_info.cc_num_masked}</span>
						</div>
					</div>
					<div id="apm" class="col-sm-6">
						<button type="button" class="btn button-2" data-keyboard="false" onclick="Merchant.useNewCard(this);">ADD NEW CREDIT CARD</button>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>