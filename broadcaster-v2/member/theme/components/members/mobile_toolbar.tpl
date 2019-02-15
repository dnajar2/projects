<!-- user tools small mobile screens only -->
<div class="secondary-bg-color mobileTools hidden-sm hidden-md hidden-lg">
	<div class="userName col-xs-12">
		<div class="col-xs-12">

			<div class="mobileTopMenu">
				<!-- notification on landscape devices -->
				<div id="landscape">
					<div  class="col-xs-12 ">
					{if $buttons.credits.enabled}
						<div class="mobileTopMenu col-xs-3">
							<span class="greenText tb_credits">{$top_bar.credits}</span>
							<button class="btn btn-primary add-funds-btn" {if $desktop_button eq "credits"}onClick="location.href='{$buttons.credits.url}'"{else} onclick="Merchant.buyModal.getData()"{/if}><i class="fa {$buttons.credits.icon}"></i></button>
						</div>
					{/if}
						{if $button.messages.enabled}
						<div class="col-xs-3">
							<div class="NotificationIcons">
								<!-- active count -->
								<div class="active-item-count">
									<div class="active-count tb_mail">{$top_bar.messages}</div>
								</div>
								<!-- end of active count -->
								<a href="{$button.messages.url}" target="_self"><i class="fa {$button.messages.icon}"></i></a>
							</div>
						</div>
						{/if}
						{if $button.favorites.enabled}
						<div class="col-xs-3 ">
							<div class="NotificationIcons">
								<!-- active count -->
								<div class="active-item-count">
									<div class="active-count tb_favorites">{$top_bar.favorites}</div>
								</div>
								<!-- end of active count -->
								<a href="{$button.favorites.url}" target="_self"><i class="fa {$button.favorites.icon}"></i></a>
							</div>
						</div>
						{/if}
						{if $button.tickets.enabled }
						<div class="col-xs-3">
							<div class="NotificationIcons">
								<!-- active count -->
								<div class="active-item-count">
									<div class="active-count tb_tickets">{$top_bar.tickets}</div>
								</div>
								<!-- end of active count -->
								<a href="{$button.tickets.url}" target="_self"><i class="fa {$button.tickets.icon}"></i></a>
							</div>
						</div>
						{/if}
						<div class="clearfix"></div>
					</div>
				</div>
			<!-- end of landscape notifation -->
			</div>
			<div class="mobileTopMenu padding-right">
				<div id="userName" class="col-xs-4">{$smarty.session.cleansed_username}</div>
				<div id="top-tool-icons"  class="col-xs-8">
				{if $buttons.credits.enabled}
						<div id="mobile_credits_text" class="col-xs-7 no-padding text-right" {if $desktop_button eq "credits"}onClick="location.href='{$buttons.credits.url}'"{else}onclick="Merchant.buyModal.getData()"{/if}>
							<span id="credits_mobile_amount" class="greenText tb_credits">{$top_bar.credits}</span>
							<i class="fa {$buttons.credits.icon}"></i>
						</div>
                    <span class="creditsSpinner col-xs-7 no-padding text-right" style="display: none; color: #fff; font-size: 3rem; line-height: 125%;">
                            <i class="fa fa-refresh fa-spin" ></i>
                        </span>
					{/if}
					{if $buttons.messages.enabled}
					<div class="col-xs-2" style="padding-right: 0">
						<div class="NotificationIcons">
							<!-- active count -->
							<div class="active-item-count">
							<div class="active-count tb_mail">{$top_bar.messages}</div>
							</div>
							<!-- end of active count -->
							<a href="{$buttons.messages.url}" target="_self"><i class="fa {$buttons.messages.icon}"></i></a>
						</div>
					</div>
					{/if}
					{if  $buttons.favorites.enabled}
					<div class="col-xs-2 ">
						<div class="NotificationIcons">
							<!-- active count -->
							<div class="active-item-count">
							<div class="active-count tb_favorites">{$top_bar.favorites}</div>
							</div>
							<!-- end of active count -->
							<a href="{$buttons.favorites.url}" target="_self"><i class="fa {$buttons.favorites.icon}"></i></a>
						</div>
					</div>
					{/if}
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
</div>
<!-- end tag  user tools small mobile screens only -->
