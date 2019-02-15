
<section id="club-codes">
	<div class="account-panel">
		<div class="account-panel-title">
			<!-- title -->
			<div class="pull-left account-section-name">
				<i class="fa fa-barcode"></i> &nbsp; MY CLUB CODES
			</div>
			<div class="clearfix"></div>

		</div>
		<!-- end of title -->
		<div class="clearfix"></div>
		<div id="form_output" class="inverted-color text-center" style="display: none;"></div>
		<div class="clearfix"></div>

		<h2>
			<i class="fa fa-chevron-right"></i> UNUSED CLUB CODES
		</h2>
		{if $unused_club_codes}
		<div id="unused_codes" class="grid">
			<!-- used as spacer -->
			<div class="gutter-sizer"></div>
			<form id="redeem-clubcode" action="/api/members/clubcodes.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="POST" enctype="multipart/form-data">
			<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
			<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
			</form>
			{foreach from=$unused_club_codes key="k" item="clubcode"}
			<!-- start of clubcode #{$clubcode.id} -->
			<div id="clubcode-{$clubcode.id}" class="grid-item">
				<div class="code">
					<h2>
						<i class="fa fa-barcode"></i> {$clubcode.code}
					</h2>
					<div id="clubcode-expires-{$clubcode.id}" style="margin-top:-5px;margin-bottom:15px;">Expires {$clubcode.valid_until_fmt}</div>
				</div>
				<div class="redeem">
					<button id="clubcode-btn-{$clubcode.id}" type="button" class="btn btn-primary" onclick="Members.redeemClubCode('{$clubcode.id}', '{$clubcode.code}');">
						<span id="clubcode-working-{$clubcode.id}" style="display: none;"><img id="clubcode-working-img-{$clubcode.id}" class="spinner"></span>
						<span id="clubcode-redeem-btn-{$clubcode.id}" >REDEEM NOW!</span>
					</button>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- end of clubcode #{$clubcode.id} -->
			{/foreach}
		</div>
		{/if}
		<div id="no-unused-clubcodes" class="text-center {if $unused_club_codes}hide{else}show{/if}">
			You have no Club Codes to Redeem at this time
		</div>
		<div class="clearfix"></div>
		<br>
		<!-- used club codes -->
		<div class="clearfix"></div>
		<h2>
			<i class="fa fa-chevron-right"></i> REDEEMED/EXPIRED CODES
		</h2>

		<div id="used-codes" class="grid">
			<!-- used as spacer -->
			<div id="used-codes-gutter" class="gutter-sizer"></div>
			{if $expired_club_codes}
			{foreach from=$expired_club_codes key="k" item="clubcode"}
			<!-- strat of grid items -->
			<div id="clubcode-{$clubcode.id}" class="grid-item">
				<div class="code">
					<h2>
						<i class="fa fa-barcode"></i> {$clubcode.code}
					</h2>
				</div>
				<div class="redeem">
					<button type="button" class="btn btn-default">{if $clubcode.date_used}Redeemed <br> {$clubcode.date_used_fmt}{else}Expired <br> {$clubcode.valid_until_fmt}{/if}</button>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- end of item -->
			{/foreach}
			{/if}
		</div>
		<div id='no-used-codes' class="text-center {if $expired_club_codes}hide{else}show{/if}">
			You have no expired or used Club Codes
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- end of col -->
</section>
<!-- end of section -->
