<section id="my-purchases" style="visibility: hidden">
	<div class="account-panel">
		<div class="account-panel-title">
			<!-- title -->
			<div class="pull-left account-section-name">
				<i class="fa {$buttons.purchases.icon}"></i> &nbsp; {$buttons.purchases.title}
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- end of title -->
		<div class="clearfix"></div>
		<div class="section">
			<div class="col-sm-12">
				{if $total_count neq 0}
				<div id="last_five_purchases">
					<div class="col-sm-7">
					<h2 class="title">
						<i class="primary-color fa fa-chevron-right"></i> PURCHASES <br>(From  <span id="trans_from_date"></span> TO <span id="trans_to_date"></span> ) <span id="total_purchases" class="hidden-sm hidden-xs" style="display: none">&nbsp; &#124; </span>
					</h2>
					</div>
					<div class="col-sm-5">
					<!--  filter by DATE  -->
						<div id="filterByDate" class="pull-right">
							<form id="dateFilterForm" action="/api/members/purchases.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
								<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
								<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
								<i class="fa fa-calendar"></i> <span class="hidden-sm">FROM</span> <input type="text" name="date_from" id="date_from">
								<span class="hidden-sm">TO</span> <input type="text" name="date_to" id="date_to">
								<i id="date_search" class="fa fa-search" aria-hidden="false"></i>
							</form>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
					<div class="table">
						<div class="th primary-bg-color">
							<!-- table head -->
							<div class="td col-md-2 col-sm-2 col-xs-2 ">
								<span class="hidden-sm hidden-xs">purchase </span>date &nbsp; <i class="hide sort fa fa-sort"></i>
								<!--  SORT DATE  -->
								<form id="sort_date" action="/api/members/purchases.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
									<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
									<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
									<input type="hidden" id="sort_asc" name="sort_asc" value="sort_asc">
									<input type="hidden" id="sort_date_from" name="sort_date_from" val="">
									<input type="hidden" id="sort_date_to" name="sort_date_to" val="">
								</form>
							</div>
							<div class="td col-md-2 col-sm-3 col-xs-4 ">
								<span >transaction</span> id
							</div>
							<div class="td col-md-2 col-sm-2 col-xs-2  hidden-sm hidden-xs">Billed As</div>
							<div class="td col-md-2 col-sm-2 col-xs-2 hidden-xs">Card Used</div>
							<div class="td col-md-2 col-sm-3 col-xs-4 ">Packages</div>
							<div class="td col-md-2 col-sm-2 col-xs-2 text-right">Amount</div>
							<div class="clearfix"></div>
						</div>
						<!-- table head end -->
						{foreach from=$past_purchases item="purchase"
						name="past_purchases"}
						<div class="tr origina_rows">
							<!-- table row -->
							<div class="td col-md-2 col-sm-2 col-xs-2 ">{$purchase.date}</div>
							<div class="td col-md-2 col-sm-3 col-xs-4 ">{$purchase.txnID}</div>
							<div class="td col-md-2 col-sm-2 col-xs-2 hidden-sm hidden-xs">{$purchase.billed_as}</div>
							<div class="td col-md-2 col-sm-2 col-xs-2 hidden-xs">{$purchase.cc_card}</div>
							<div class="td col-md-2 col-sm-3 col-xs-4 ">{$purchase.cart_item}</div>
							<div class="td col-md-2 col-sm-2 col-xs-2 text-right">{$purchase.amount}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table row end -->
						{/foreach}
						<div id="loading" class="text-center" style="display:none" ><img src=""></div>
						<div id="more_purchases" style="display:none">
						</div>
						{if !$past_purchases}
							<div id="no_past_purchases" class="tr">
								<div class="td text-center"> No transactions found for this date period. </div>
							</div>
						{/if}
						<div class="td total" style="padding:15px 15px;" >
							<span class="pull-right"><strong>Total:</strong> <span id="grand_total">{$total_purchase_amount}</span></span>
							<form id="get_more" action="/api/members/purchases.php??{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
								<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
								<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
								<input id="transaction_limit" type="hidden" name="transaction_limit" value="{$transaction_limit}">
								<input id="transaction_count" type="hidden" name="transaction_count" value="{$total_count}">
							</form>
							<div class="clearfix"></div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				{else}
				<div class="tr">
					<div class="td">
						<h2>You have no purchases</h2>
					</div>
				</div>
				<!--  end of showt tickets -->
				{/if}
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	</div>
	<!-- end of col -->
</section>
<script>
{literal}
	$(document).ready(function(){
		$('#filterByDate input').datepicker({
			dateFormat: 'mm/dd/yy',
		});
	});

		var currentTime = new Date()
		var month = currentTime.getMonth() + 1
		var day = currentTime.getDate()
		var year = currentTime.getFullYear()
		var monthLeadingZ = '0'+month
		var thisMonth = monthLeadingZ.slice(-2)
		var leadingZero = '0'+day;
		var dayOf = leadingZero.slice(-2)
		var today = thisMonth + "/" + dayOf + "/" + year;
			//from

			var prevMonth = parseFloat(thisMonth) - 1
			var toDate = prevMonth + "/" + dayOf + "/" + year;

			$('#date_from').val(toDate)
			$('#date_to').val(today)

			$('#trans_from_date').text(toDate)
			$('#trans_to_date').text(today)

			$('#sort_date_from').val(toDate)
			$('#sort_date_to').val(today)

			//get more record by limit
			$('#get_more').submit(function(e){

				var data = $(this).serialize();
				var url = $(this).attr('action');

				Members.past_purchasess(data, url)
				e.preventDefault()
				});

			//date filtering
			$('#date_search').on('click', function(e){
				//e.preventDefault()

				var fromDate = $('#date_from').val();
				var toDate = $('#date_to').val();
				$('#sort_date_from').val(toDate)
				$('#sort_date_to').val(fromDate)

				var url = $('#dateFilterForm').attr('action');
				var form_data = $('#dateFilterForm').serialize()

				console.log('From ' + fromDate + ' to ' + toDate);

				Members.past_purchasess_date_filters(form_data, url)
		})
		$('.sort.fa.fa-sort').on('click', function(){
			var data = $('#sort_date').serialize();
			var url = $('#sort_date').attr('action');

			Members.sort(data, url)
		});
{/literal}

</script>
