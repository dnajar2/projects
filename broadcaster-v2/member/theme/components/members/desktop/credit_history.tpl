<section id="my-purchases" style="visibility: hidden">
	<div class="account-panel">
		<div class="account-panel-title">
			<!-- title -->
			<div class="pull-left account-section-name">
				<i class="fa {$buttons.credithistory.icon}"></i> &nbsp; {$buttons.credithistory.caption}
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- end of title -->
		<div class="clearfix"></div>
		<div class="section">
			<div class="col-sm-12">
				{if $past_purchases}
				<form action="/api/members/credit_history.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
					<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
					<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
					<input type="hidden" id="section_value" name="section_value" value="">
					<input type="hidden" id="section_id" name="section_id" value="">
					<input type="hidden" id="section_current_limit" name="section_current_limit" value="">
					<input type="hidden" id="section_total_spent" name="section_total_spent" value="">

				</form>
				<div id="last_five_purchases"> <!--  section  -->
					<div class="col-sm-12">
					<h2 class="title" data-target="#last_five_purchases">
						<i class="primary-color fa fa-chevron-right"></i> Video Purchases
					</h2>
					</div>
					<div class="clearfix"></div>
					<div class="table">
						<div class="th primary-bg-color">
							<!-- table head -->
							<div class="td col-sm-3 col-xs-3 ">Date</div>
							<div class="td col-sm-3 col-xs-3 ">Model</div>
							<div class="td col-sm-3 col-xs-3 ">Fan Club Savings</div>
							<div class="td col-sm-3 col-xs-3 text-right">{if $Member.is_auth_billing}Amount{else}Credits{/if}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table head end -->
						{if $video_purchases}
						{foreach from=$video_purchases item="video_purchase"
						name="past_video_purchases"}
						<div class="tr origina_rows">
							<!-- table row -->
							<div class="td col-sm-3 col-xs-3 long-date">{$video_purchase.date}</div>
							<div class="td col-sm-3 col-xs-3 ">{$video_purchase.model_username}</div>
							<div class="td col-sm-3 col-xs-3 ">{$video_purchase.discount}</div>
							<div class="td col-sm-3 col-xs-3 text-right">{$video_purchase.credits}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table row end -->
						{/foreach}
						{else}
						<div class="tr">
							<div class="td col-sm-12 text-center">You haven't purchased any videos.</div>
						</div>
						{/if}
						<div id="more_purchases_last_five_purchases" style="display:none"></div>
						<div id="loading_last_five_purchases" class="loader-img text-center" style="display:none" ><img src=""></div>
						<div class="td total" style="padding:15px 15px;" >
							{if $total_video_purchases gt 6 }
							<span class="pull-left load_more">
								<input type="hidden" name="total_video_purchases" value="{$total_video_purchases}">
								<input type="hidden" id="video_sessions_limit" name="video_sessions_limit" value="1">
								<button type="button" class="btn btn-primary button-2" data-target="#last_five_purchases">More</button>
							</span>
							{/if}
							<span class="pull-right">{if $video_purchase.total_credits_used}<strong>Total:</strong> <span id="grand_total">{$video_purchase.total_credits_used}</span>{/if}</span>
							<div class="clearfix"></div>
						</div>
					</div>
				</div><!--  end of section  -->
				<div id="last_five_featured_show"> <!--  section  -->
					<div class="col-sm-12" style="padding-right: 0">
					<div class="col-sm-6" style="padding-left: 0">
					<h2 class="title" data-target="#last_five_featured_show">
						<i class="primary-color fa fa-chevron-right"></i> Featured Show Tickets Used
					</h2>
					</div>
					<div class="col-sm-6" style="padding-right: 0">
						<h2 class="text-right">
							{if $ticketsAvailable neq 0}You have {$ticketsAvailable} Tickets Available{else}You have no tickets available {/if}
						</h2>
					</div>
					<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
					<div class="table">
						<div class="th primary-bg-color">
							<!-- table head -->
							<div class="td col-sm-2 col-xs-3 ">Show Date</div>
							<div class="td col-sm-2 col-xs-3 ">Model</div>
							<div class="td col-sm-3 col-xs-3 ">Date / Time Used</div>
							<div class="td col-sm-3 col-xs-3 hidden-sm hidden-xs "></div>
							<div class="td col-sm-2 col-xs-3 text-right">Viewed For</div>
							<div class="clearfix"></div>
						</div>
						<!-- table head end -->
						{if $mpTicketHistory}
						{foreach from=$mpTicketHistory item="ticketHistory"}
						<div class="tr origina_rows">
							<!-- table row -->
							<div class="td col-sm-2 col-xs-3 ">{$ticketHistory.show_date}</div>
							<div class="td col-sm-2 col-xs-3 ">{$ticketHistory.model_username}</div>
							<div class="td col-sm-3 col-xs-3 ">{$ticketHistory.col_3}</div>
							<div class="td col-sm-3 col-xs-3  hidden-sm hidden-xs"></div>
							<div class="td col-sm-2 col-xs-3 text-right">{$ticketHistory.credits_used}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table row end -->
						{/foreach}
						{else}
						<div class="tr">
							<div class="td col-sm-12 text-center">You haven't used any Featured Show Tickets.</div>
						</div>
						{/if}
						<div id="more_purchases_last_five_featured_show" style="display:none"></div>
						<div id="loading_last_five_featured_show" class="loader-img text-center" style="display:none" ><img src=""></div>
						<div class="td total" style="padding:15px 15px;" >
							{if $tickets_total_used gt 6 }
							<span class="pull-left load_more">
								<input type="hidden" name="tickets_total_used" value="{$tickets_total_used}">
								<input type="hidden" id="featured_sessions_limit" name="featured_sessions_limit" value="1">
								<input type="hidden" id="featured_total_spent" name="featured_total_spent" value="{$length_non_human}">
								<button type="button" class="btn btn-primary button-2" data-target="#last_five_featured_show">More</button>
							</span>
							{/if}
							{if $overAllLength}
							<span class="pull-right"><strong>Total:</strong> <span id="grand_total">{$overAllLength}</span></span>
							{/if}
							<div class="clearfix"></div>
						</div>
					</div>
				</div><!--  end of section  -->
				<div id="last_five_phone2phone"> <!--  section  -->
					<div class="col-sm-12">
					<h2 class="title" data-target="#last_five_phone2phone">
						<i class="primary-color fa fa-chevron-right"></i> Phone 2 Phone Call Purchases
					</h2>
					</div>
					<div class="clearfix"></div>
					<div class="table">
						<div class="th primary-bg-color">
							<!-- table head -->
							<div class="td col-sm-2 col-xs-3 ">date</div>
							<div class="td col-sm-2 col-xs-3 ">Model</div>
							<div class="td col-sm-3 col-xs-3 ">Cost Per Min</div>
							<div class="td col-sm-3 col-xs-3 hidden-xs">Minutes</div>
							<div class="td col-sm-2 col-xs-3 text-right">{if $Member.is_auth_billing}Amount{else}Credits{/if}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table head end -->
						{if $p2pCallHistory }
						{foreach from=$p2pCallHistory item="callhistory"}
						<div class="tr origina_rows">
							<!-- table row -->
							<div class="td col-sm-2 col-xs-3 ">{$callhistory.call_date_fmt}</div>
							<div class="td col-sm-2 col-xs-3 ">{$callhistory.model_username}</div>
							<div class="td col-sm-3 col-xs-3 ">{$callhistory.rate}</div>
							<div class="td col-sm-3 col-xs-3 hidden-xs">{$callhistory.minutesElapsed}</div>
							<div class="td col-sm-2 col-xs-3 text-right">{$callhistory.amount}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table row end -->
						{/foreach}
						{else}
						<div class="tr">
							<div class="td col-sm-12 text-center">You don't have any Phone 2 Phone Calls.</div>
						</div>
						{/if}
						<div id="more_purchases_last_five_phone2phone" style="display:none"></div>
						<div id="loading_last_five_phone2phone" class="loader-img text-center" style="display:none" ><img src=""></div>
						<div class="td total" style="padding:15px 15px;" >
							{if $totalp2pCallHistory gt 6 }
							<input type="hidden" name="totalp2pCallHistory" value="{$totalp2pCallHistory}">
							<input type="hidden" id="phone2phone_sessions_limit" name="phone2phone_sessions_limit" value="1">
							<input type="hidden" id="voyeur_total_spent" name="voyeur_total_spent" value="{$p2pCallStats.total_amount}">
							<span class="pull-left load_more">
								<button type="button" class="btn btn-primary button-2" data-target="#last_five_phone2phone">More</button>
							</span>
							{/if}
							<span class="pull-right">
								{if $p2pCallStats.total_amount}
								<strong>Total Minutes:</strong> <span>{$p2pCallStats.total_minutes}</span> |
								<strong>Total {if $Member.is_auth_billing}Amount{else}Credits Used{/if}:</strong> <span >{$p2pCallStats.total_amount}</span>
								{/if}
							</span>
							<div class="clearfix"></div>
						</div>
					</div>
				</div><!--  end of section  -->
				<div id="last_five_private_show"> <!--  section  -->
					<div class="col-sm-12">
					<h2 class="title" data-target="#last_five_private_show">
						<i class="primary-color fa fa-chevron-right"></i> Private Show Sessions
					</h2>
					</div>
					<div class="clearfix"></div>
					<div class="table">
						<div class="th primary-bg-color">
							<!-- table head -->
							<div class="td col-sm-2 col-xs-3 ">
								<span class="hidden-xs">purchase </span>date
							</div>
							<div class="td col-sm-2 col-xs-3 ">Model</div>
							<div class="td col-sm-3 col-xs-3 ">Video</div>
							<div class="td col-sm-3 col-xs-3 hidden-xs">Fan Club Savings</div>
							<div class="td col-sm-2 col-xs-3 text-right">{if $Member.is_auth_billing}Amount{else}Credits{/if}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table head end -->
						{if $private_shows}
						{foreach from=$private_shows item="privateshows"}
						<div class="tr origina_rows">
							<!-- table row -->
							<div class="td col-sm-2 col-xs-3 ">{$privateshows.show_date}</div>
							<div class="td col-sm-2 col-xs-3 ">{$privateshows.model_username}</div>
							<div class="td col-sm-3 col-xs-3 ">{if !$privateshows.video_info}N/A{else}{$privateshows.video_info}{/if}</div>
							<div class="td col-sm-3 col-xs-3 hidden-xs">{$privateshows.fanclub_savings}</div>
							<div class="td col-sm-2 col-xs-3 text-right">{$privateshows.credits_used}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table row end -->
						{/foreach}
						{else}
						<div class="tr">
							<div class="td col-sm-12 text-center">You don't have any Private Shows.</div>
						</div>
						{/if}
						<div id="more_purchases_last_five_private_show" style="display:none"></div>
						<div id="loading_last_five_private_show" class="loader-img text-center" style="display:none" ><img src=""></div>
						<div class="td total" style="padding:15px 15px;" >
							{if $private_shows_count gt 6 }
							<input type="hidden" name="private_shows_count" value="{$private_shows_count}">
							<input type="hidden" id="private_sessions_limit" name="private_sessions_limit" value="1">
							<input type="hidden" id="voyeur_total_spent" name="voyeur_total_spent" value="{$total_private_shows_spent}">
							<span class="pull-left load_more">
								<button type="button" class="btn btn-primary button-2" data-target="#last_five_private_show">More</button>
							</span>
							{/if}

							<span class="pull-right">
								<strong>Total:</strong> <span >{$total_private_shows_spent}</span>
							</span>
							<div class="clearfix"></div>
						</div>
					</div>
				</div><!--  end of section  -->
				<div id="last_five_goal_show"> <!--  section  -->
					<div class="col-sm-12">
					<h2 class="title" data-target="#last_five_goal_show">
						<i class="primary-color fa fa-chevron-right"></i> Goal Show Sessions
					</h2>
					</div>
					<div class="clearfix"></div>
					<div class="table">
						<div class="th primary-bg-color">
							<!-- table head -->
							<div class="td col-sm-2 col-xs-3 ">date</div>
							<div class="td col-sm-2 col-xs-3 ">Model</div>
							<div class="td col-sm-3 col-xs-3 "></div>
							<div class="td col-sm-3 col-xs-3 hidden-xs"></div>
							<div class="td col-sm-2 col-xs-3 text-right">{if $Member.is_auth_billing}Amount{else}Credits{/if}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table head end -->
						{if $goalShows}
						{foreach from=$goalShows item="goalshows"}
						<div class="tr origina_rows">
							<!-- table row -->
							<div class="td col-sm-2 col-xs-3 ">{$goalshows.show_date}</div>
							<div class="td col-sm-2 col-xs-3 ">{$goalshows.modelUsername}</div>
							<div class="td col-sm-3 col-xs-3 "></div>
							<div class="td col-sm-3 col-xs-3 hidden-xs"></div>
							<div class="td col-sm-2 col-xs-3 text-right">{$goalshows.moneyAbsorbed}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table row end -->
						{/foreach}
						{else}
						<div class="tr">
							<div class="td col-sm-12 text-center">You don't have any Goal Shows.</div>
						</div>
						{/if}
						<div id="more_purchases_last_five_goal_show" style="display:none"></div>
						<div id="loading_last_five_goal_show" class="loader-img text-center" style="display:none" ><img src=""></div>
						<div class="td total" style="padding:15px 15px;" >
							{if $goalShowsCount gt 6 }
							<input type="hidden" name="goalShowsCount" value="{$goalShowsCount}">
							<input type="hidden" id="gold_sessions_limit" name="gold_sessions_limit" value="1">
							<input type="hidden" id="voyeur_total_spent" name="voyeur_total_spent" value="{$totalGoalShowsSpent}">
							<span class="pull-left load_more">
								<button type="button" class="btn btn-primary button-2" data-target="#last_five_goal_show">More</button>
							</span>
							{/if}
							<span class="pull-right">
								{if $totalGoalShowsSpent}
								<strong>Total:</strong> <span >{$totalGoalShowsSpent}</span>
								{/if}
							</span>
							<div class="clearfix"></div>
						</div>
					</div>
				</div><!--  end of section  -->
				<div id="last_five_offer_show"> <!--  section  -->
					<div class="col-sm-12">
					<h2 class="title" data-target="#last_five_offer_show">
						<i class="primary-color fa fa-chevron-right"></i> Private Offer Show Sessions
					</h2>
					</div>
					<div class="clearfix"></div>
					<div class="table">
						<div class="th primary-bg-color">
							<!-- table head -->
							<div class="td col-sm-2 col-xs-3 ">date</div>
							<div class="td col-sm-2 col-xs-3 ">Model</div>
							<div class="td col-sm-3 col-xs-3 hidden-xs"></div>
							<div class="td col-sm-3 col-xs-3 "></div>
							<div class="td col-sm-2 col-xs-3 text-right">{if $Member.is_auth_billing}Amount{else}Credits{/if}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table head end -->
						{if $privateOfferShows}
						{foreach from=$privateOfferShows item="privateoffershow"}
						<div class="tr origina_rows">
							<!-- table row -->
							<div class="td col-sm-2 col-xs-3 ">{$privateoffershow.show_date}</div>
							<div class="td col-sm-2 col-xs-3 ">{$privateoffershow.model_username}</div>
							<div class="td col-sm-3 col-xs-3 hidden-xs"></div>
							<div class="td col-sm-3 col-xs-3 "></div>
							<div class="td col-sm-2 col-xs-3 text-right">{$privateoffershow.credits_used}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table row end -->
						{/foreach}
						{else}
						<div class="tr">
							<div class="td col-sm-12 text-center">You don't have any Private Offer Shows.</div>
						</div>
						{/if}
						<div id="more_purchases_last_five_offer_show" style="display:none"></div>
						<div id="loading_last_five_offer_show" class="loader-img text-center" style="display:none" ><img src=""></div>
						<div class="td total" style="padding:15px 15px;" >
							{if $totalprivateOfferShows gt 6 }
							<input type="hidden" name="totalprivateOfferShows" value="{$totalprivateOfferShows}">
							<input type="hidden" id="privateOffer_sessions_limit" name="privateOffer_sessions_limit" value="1">
							<input type="hidden" id="voyeur_total_spent" name="voyeur_total_spent" value="{$totalPrivateOfferShowsSpent}">
							<span class="pull-left load_more">
								<button type="button" class="btn btn-primary button-2" data-target="#last_five_offer_show">More</button>
							</span>
							{/if}
							<span class="pull-right">
								{if $totalPrivateOfferShowsSpent}
								<strong>Total:</strong> <span >{$totalPrivateOfferShowsSpent}</span>
								{/if}
							</span>
							<div class="clearfix"></div>
						</div>
					</div>
				</div><!--  end of section  -->
				<div id="last_five_voyeur_show"> <!--  section  -->
					<div class="col-sm-12">
					<h2 class="title" data-target="#last_five_voyeur_show">
						<i class="primary-color fa fa-chevron-right"></i> Voyeur Show Sessions
					</h2>
					</div>
					<div class="clearfix"></div>
					<div class="table">
						<div class="th primary-bg-color">
							<!-- table head -->
							<div class="td col-sm-2 col-xs-3 ">Date</div>
							<div class="td col-sm-2 col-xs-3 ">Model</div>
							<div class="td col-sm-3 col-xs-3 hidden-xs"></div>
							<div class="td col-sm-3 col-xs-3 ">Fan Club Savings</div>
							<div class="td col-sm-2 col-xs-3 text-right">{if $Member.is_auth_billing}Amount{else}Credits{/if}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table head end -->
						{if $voyeur_shows}
						{foreach from=$voyeur_shows item="voyeurshow"}
						<div class="tr origina_rows">
							<!-- table row -->
							<div class="td col-sm-2 col-xs-3 ">{$voyeurshow.show_date}</div>
							<div class="td col-sm-2 col-xs-3 ">{$voyeurshow.model_username}</div>
							<div class="td col-sm-3 col-xs-3 hidden-xs"></div>
							<div class="td col-sm-3 col-xs-3 ">{$voyeurshow.fanclub_savings}</div>
							<div class="td col-sm-2 col-xs-3 text-right">{$voyeurshow.credits_used}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table row end -->
						{/foreach}
						{else}
						<div class="tr">
							<div class="td col-sm-12 text-center">You have no voyeur shows.</div>
						</div>
						{/if}

						<div id="more_purchases_last_five_voyeur_show" style="display:none"></div>
						<div id="loading_last_five_voyeur_show" class="loader-img text-center" style="display:none" ><img src=""></div>
						<div class="td total" style="padding:15px 15px;" >
							{if $voyeur_shows_count gt 6 }
							<input type="hidden" name="voyeur_shows_count"  value="{$voyeur_shows_count}">
							<input type="hidden" id="voyeur_sessions_limit" name="voyeur_sessions_limit" value="1">
							<input type="hidden" id="voyeur_total_spent" name="voyeur_total_spent" value="{$total_voyeur_shows_spent}">
							<span class="pull-left load_more">
								<button type="button" class="btn btn-primary button-2" data-target="#last_five_voyeur_show">More</button>
							</span>
							{/if}
							<span class="pull-right">
								{if $total_voyeur_shows_spent}
								<strong>Total:</strong> <span >{$total_voyeur_shows_spent}</span>
								{/if}
							</span>
							<div class="clearfix"></div>
						</div>
					</div>
				</div><!--  end of section  -->
				<div id="last_five_tip_sessions"> <!--  section  -->
					<div class="col-sm-12">
					<h2 class="title" data-target="#last_five_tip_sessions">
						<i class="primary-color fa fa-chevron-right"></i> Tip Sessions
					</h2>
					</div>
					<div class="clearfix"></div>
					<div class="table">
						<div class="th primary-bg-color">
							<!-- table head -->
							<div class="td col-sm-2 col-xs-3 ">Date</div>
							<div class="td col-sm-2 col-xs-3 ">Model</div>
							<div class="td col-sm-3 col-xs-3 "></div>
							<div class="td col-sm-3 col-xs-3 hidden-xs"></div>
							<div class="td col-sm-2 col-xs-3 text-right">{if $Member.is_auth_billing}Amount{else}Credits{/if}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table head end -->
						{if $tips}
						{foreach from=$tips item="tip"}
						<div class="tr origina_rows">
							<!-- table row -->
							<div class="td col-sm-2 col-xs-3 ">{$tip.show_date}</div>
							<div class="td col-sm-2 col-xs-3 ">{$tip.model_username}</div>
							<div class="td col-sm-3 col-xs-3 "></div>
							<div class="td col-sm-3 col-xs-3 hidden-xs"></div>
							<div class="td col-sm-2 col-xs-3 text-right">{$tip.credits_used}</div>
							<div class="clearfix"></div>
						</div>
						<!-- table row end -->
						{/foreach}
						{else}
						<div class="tr">
							<div class="td col-sm-12 text-center">You haven't given any tips.</div>
						</div>
						{/if}

						<div id="more_purchases_last_five_tip_sessions" style="display:none"></div>
						<div id="loading_last_five_tip_sessions" class="loader-img text-center" style="display:none" ><img src=""></div>
						<div class="td total" style="padding:15px 15px;" >
							{if $tips_count gt 6 }
							<input type="hidden" name="tips_count" value="{$tips_count}">
							<input type="hidden" id="tip_sessions_limit" name="tip_sessions_limit" value="6">
							<input type="hidden" id="tip_total_spent" name="tip_total_spent" value="{$total_tips_spent}">
							<span class="pull-left load_more">
								<button type="button" class="btn btn-primary button-2" data-target="#last_five_tip_sessions">More</button>
							</span>
							{/if}
							<span class="pull-right">
								{if $total_tips_spent}
								<strong>Total:</strong> <span >{$total_tips_spent}</span>
								{/if}
							</span>
							<div class="clearfix"></div>
						</div>
					</div>
				</div><!--  end of section  -->

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
	<div class="clearfix"></div>
	</div>
	<!-- end of col -->
</section>
<script>
{literal}
	$(".table:not(:first)").hide()
	$("#last_five_purchases .title:first").css('cursor','default')
	$(document).ready(function(){
		$('#filterByDate input').datepicker({
			dateFormat: 'mm/dd/yy',
		});
		$('.title').on('click', function(e){
			var parentId = $(this).attr('data-target');

			if( parentId === '#last_five_purchases'){
					e.preventDefault()

				}else{
					$(parentId).find('.table').slideToggle('slow','linear');
					$(parentId).find('.fa').toggleClass('fa-chevron-down')
					console.log($(this).attr('data-target'))
				}

		})

		//if redirected from videos page
		{/literal}
		{if $smarty.get.ref eq 'videos'}
			{literal}
			$('html, body').animate({
				scrollTop: $("#last_five_phone2phone").offset().top - 40
			}, 2000);
			setTimeout(function(){
                $('#last_five_private_show .title').click()
            },300)
			{/literal}
		{/if}
		{literal}
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
	//date filtering
	$('#date_search').on('click', function(e){
		//e.preventDefault()
		var fromDate = $('#date_from').val();
		var toDate = $('#date_to').val();
		var url = $('#dateFilterForm').attr('action');
		var form_data = $('#dateFilterForm').serialize()

		console.log('From ' + fromDate + ' to ' + toDate);

		Members.past_purchasess_date_filters(form_data, url)
		});
	$('#my-purchases button').on('click', function(){
		var thisId = $(this).attr('data-target')

		var section_val = $(thisId).find('input:eq(0)').val();
		var section_limit = $(thisId).find('input:eq(1)').val();
		var total_spent = $(thisId).find('input:eq(2)').val();

		$('#section_value').val(section_val);
		$('#section_id').val(thisId);
		$('#section_current_limit').val(section_limit);
		$('#section_total_spent').val(total_spent);

		var form_data = $('#my-purchases form').serialize();
		var url = $('#my-purchases form').attr('action');

		Members.get_more_results(form_data, url, thisId);

	})
{/literal}

</script>
