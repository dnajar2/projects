{*<!-- using existing credit card modal -->*}
<div class="modal animated fadeIn" id="existing-card" tabindex="-1" role="dialog" aria-labelledby="existing-card">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header navbar-inverse">
				<h1 class="modal-title">Processing Transaction!</h1>
				<button id="rebuy-close" type="button" class="close" onclick="$('#existing-card').modal('toggle');">
					<i class="fa fa-times fa-1x"></i>
				</button>
			</div>
			<div id="cardOnFile" class="modal-body">
				<div  class="col-sm-3">
					<div style="padding: 0" class="col-sm-12">
						<div class="cardOnFleTitle hidden-xs">
							Most Popular
						</div>
						<div class="packageSelected">
							<div class="credits-modal">
								<div class="credit-amount-modal"></div>
								<div class="credits-text-modal"></div>
								<div class="free-credits hidden-xs"></div>
							</div>
							<div class="credit-value-modal">
								${$popular_package.price}
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
				<div class="clearfix hidden-sm hidden-md hidden-lg"></div>
				<div class="col-sm-9 main-transaction">
					<form id="bp-rebuy" name="bp-rebuy" method="POST" action="/api/members/{$form_action_script}?{$smarty.session.session_name}={$smarty.session.session_id}" enctype="application/x-www-form-urlencoded">
						<input type="hidden" id="rebuy_member_id" name="member_id" value="{$smarty.session.userid}">
						<input type="hidden" id="rebuy_package_id" name="credit_id" value="{$popular_package_id}" class="bp-package-id">
						<input type="hidden" id="rebuy_session" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
						<input type="hidden" id="rebuy_type" name="type" value="rebuy">
						<input type="hidden" id="rebuy_payment_method_id" name="payment_method_id" value="0">
						<input type="hidden" id="rebuy_submitted_id" name="submitted" value="1">
					</form>
					<div style="margin-top: 15px;" class="modal-lables hidden-xs">Card On File</div>
					<!-- show card on file -->
					<div class="col-sm-12 cardOnFile">
						<div class="col-sm-1 col-xs-1">
						</div>
						<div class="col-sm-11 col-xs-11">
							<div class="card-details">Name: <span id="card-details-name">{$auto_buy_info.first_name} {$auto_buy_info.last_name}</span> &nbsp; Card Number: <span id="card-details-ccnum">{$auto_buy_info.cc_num_masked}</span></div>
							<div class="card-details">Card Type: <span id="card-details-cctype">{$auto_buy_info.type}</span> &nbsp; Expiration: <span id="card-details-ccexp">{$auto_buy_info.cc_exp}</span></div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
					<!-- end of show card on file -->
					<div id="rebuy-processing" class="processing">
						<h2 id="rebuy-message" class="show">Transaction is being processed! <span><img src="../images/wcc3/assets/ring-alt.svg" width="35px" height="35px"></span></h2>
						<div id="rebuy-error" class="col-sm-12 text-center">
						</div>
					</div><!-- end of processing div -->
					<div class="clearfix"></div>
					<div id="process-new-card" class="useMyCredits hide">
						<button href='/' id="txn-redirect" class="btn btn-primary" onclick="Merchant.useNewCard(event);">ADD NEW CREDIT CARD</button>
					</div>
				</div>
				<!-- end of right side content -->
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
{*<!-- end of existing card modal -->*}
