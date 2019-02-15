{*<!-- purchase receipt modal -->*}
<div class="modal animated fadeIn" id="purchase-receipt" tabindex="-1" role="dialog" aria-labelledby="purchase-receipt">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header navbar-inverse">
				<h1 class="modal-title">CONGRATULATIONS!</h1>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<i class="fa fa-times fa-1x"></i>
				</button>
			</div>
			<div id="cardOnFile" class="modal-body">
				<div  class="col-sm-3">
					<div style="padding: 0" class="col-sm-12">
						<div id="receipt-txn-title" class="cardOnFleTitle hidden-xs" ></div>
						<div class="packageSelected">
							<div class="credits-modal">
								<div id="receipt-txn-credits" class="credit-amount-modal"></div>
								<div id="receipt-package-type" class="credits-text-modal"></div>
								<div class="free-credits ">&nbsp;</div>
							</div>
							<div id="receipt-txn-amount" class="credit-value-modal"></div>
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
					<div style="margin-top: 15px;" class="modal-lables hidden-xs">Your transaction has been approved.</div>
					<!-- show card on file -->
					<div class="col-sm-12 cardOnFile">
						<div class="col-sm-1 col-xs-1">
						</div>
						<div class="col-sm-11 col-xs-11">
							<div class="card-details">Purchase Date : <span class="rcpt-data" id="txn-date"> </span></div>
							<div class="card-details">Description : <span class="rcpt-data" id="txn-description"> </span></div>
							<div class="card-details">Transaction ID : <span class="rcpt-data" id="txn-id"> </span></div>
							<div class="card-details">Amount : <span class="rcpt-data" id="txn-amount"> </span></div>
							<div id="txn-billed-as-lbl" class="card-details">Billed As : <span class="rcpt-data" id="txn-billed-as"> </span></div>
							<div id="txn-billed-as-phone-lbl" class="card-details">Phone : <span class="rcpt-data" id="txn-billed-as-phone"> </span></div>
						</div>
						<div class="clearfix"></div>
					</div>
					<!-- end of show card on file -->
					<div class="processing">
						<div id="processed">
							<div class="clearfix"></div>
							<div class="text-center processed-txt congrats">The transaction was processed successfully<span id="receipt-txn-note"> </span>.</div>
							<div class="clearfix"></div>
							<div class="useMyCredits">
								<a href='#' id="txn-receipt-redirect" class="btn button-2" target="_self" data-dismiss="modal">USE MY CREDITS</a>
							</div>
						</div>
					</div><!-- end of processing div -->
				</div>
				<!-- end of right side content -->
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
{*<!--  end purcahse receipt modal  -->*}
