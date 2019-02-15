<!-- my favorites -->
<section id="my-tickets" class="" style="visibility: hidden"  >
	<div class="account-panel">
		<div class="account-panel-title"><!-- title -->
			<div class="pull-left account-section-name">
				<i class="fa {$buttons.tickets.icon}"></i> &nbsp; {$buttons.tickets.caption}
			</div>

			<div class="clearfix"></div>
		</div>
		<!-- end of title -->
		<div id="form_output" class="inverted-color text-center" style="display: none;"></div>
		<div class="clearfix"></div>
		<!-- sart of rows -->
		<div class="section-light">
			<div class="col-sm-12" style="padding:0px 0px 0px 5px !important">
				{if $member_used_tickets }
					<div class="grid">
					{foreach from=$member_used_tickets item="ticket"}
						<div id="ticket-{$ticket.id}" class="cell-block item">
							<div class="grid-item-holder">
								<i class="fa {$buttons.tickets.icon} lay-over"></i>
								<div class="cell-block header">Date Used: &nbsp; {$ticket.usedDate}</div>
								<a href="{$ticket.model_info.last_shows[0].profile_url}" title="{$ticket.model_name}">
									<img src="{$ticket.model_image}" alt="{$ticket.model_name}">
								</a>
								<div class="cell-block info fav-sts-{if $ticket.online}available{else}offline{/if}">
									<div class="col-xs-8">
										<i class="fa fa-comments"></i>
                                        {if $ticket.model_info.online}Available{else}Offline{/if}
									</div>
									<div class="col-xs-4 text-right">
                                        {if $ticket.model_info.has_sound eq 1}
											<i class="fa fa-volume-up"></i>
                                        {/if}

                                        {if $ticket.model_info.hd eq 1}
											<span class="hd">HD</span>
                                        {/if}
										<i class="fa fa-mobile"></i>
									</div>
								</div>
								<div class="cell-block stats">
									<div class="col-xs-6 cell-block name">
                                        {$ticket.model_name}
									</div>

									<div class="fav-model-ratings col-xs-6 text-right">
									<span>
									{if $ticket.model_info.rating}
                                        {foreach from=$ticket.model_info.rating_full_stars item='k'}
										<i class="fa fa-star"></i>
                                        {/foreach}
										{if $ticket.model_info.rating_half_star}
										<i class="fa fa-star-half-o"></i>
                                   		 {/if}
									{else}
										<i class="fa fa-star-o"></i>
                                    {/if}
									</span>
									</div>
								</div>
								<div class="cell-block icons">
									<a href="{$ticket.model_info.last_shows[0].profile_url}">
                                        {if $ticket.model_info.gender eq 'Single - Female'}
											<i class="fa fa-female" title="View Profile"></i>
                                        {elseif $ticket.model_info.gender eq 'Single - Male'}
											<i class="fa fa-male" title="View Profile"></i>
                                        {else}
											<i class="fa fa-venus-mars" title="View Profile"></i>
                                        {/if}
									</a>
									<i class="fa fa-money" title="Send Tip" onclick="tipModel('{$ticket.modelID}', '{$ticket.model_name}')"></i>
									<i class="fa fa-star" title="Vote" onclick="model_raitings.vote('{$ticket.modelID}', '{$ticket.model_name}')"></i>
									<i class="fa fa-envelope"  title="Message" onclick="message.newMessagetoModel( '{$ticket.modelID}', '{$ticket.model_name}' )"></i>
									<i class="fa fa-bell"  title="Notifications" onclick="{if $member_cellphone_verified }mobileAlerts.addModelAlerts('{$ticket.modelID}'){else}mobileAlerts.setupMobleNotifications(){/if}"></i>
									<i class="fa fa-heart selected" title="Unfavorite"></i>
									<!--<i class="fa fa-times-circle"></i>-->
								</div>
							</div>
						</div>
					{/foreach}
					</div> <!-- End of grid-->
				{else}
					<h2>You haven't used any tickets, you can used them for <a href="?c2hvdz1mZWF0dXJlZFNob3dz" title="Feature Shows">Feature
							Shows</a></h2>
				{/if}
				<div class="clearfix"></div>
			</div> <!-- end of wrapper -->
		</div><!-- end of rows -->
	</div><!-- end of col -->
	<div class="clearfix"></div>
</section>
<!-- end of my favorites section -->
