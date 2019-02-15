<!-- Desktop User tools -->
<div class="pull-right loggedInUserTopRight hidden-xs hidden-sm hidden-md">
	<div id="current-credits" class="pull-left">
		{if $buttons.credits.enabled}
		<div id="credit-holder">
			<span id="creditsSpan" {if $desktop_button eq "credits" || $desktop_button eq "tickets"}onClick="location.href='#'"{else} onclick="Merchant.buyModal.getData()" {/if}>
					<span class="greenText tb_credits">{$buttons.credits.count}</span>
					<span id="credits_text">
						 &nbsp; <i id="topDataBase" class="fa fa-database fa-2x"></i>
					</span>
			</span>
            <span id="creditsSpinner" style="display: none; color: #fff; font-size: 3rem; line-height: 125%;">
                <i class="fa fa-refresh fa-spin" ></i>
            </span>
		</div>
		{/if}
	</div>
	<div id="top-tool-icons"  class="pull-left">
		{foreach from=$buttons key=k item="button"}
			{if $button.enabled && $button.is_topicon}
		<div class="topIcon">
			
			<!-- active count -->
			<div class="active-item-count">
				<div class="active-count {$button.count_placeholder}">{$button.count}</div>
			</div>
			
			<!-- end of active count -->
			<a href="{$button.url}" title='{$button.titles}'><i class="fa {$button.icon}"></i></a>
		</div>
			{/if}
		{/foreach}

	</div>
	<!--  member drop down menu -->
	<div id="my-tools" class="pull-left hidden-xs hidden-sm">
		<div class="dropdown pull-right close">
			<button class="btn-user-tools userNameBtn" type="button">
				{$smarty.session.cleansed_username} &nbsp; <i class="fa fa-chevron-down" aria-hidden="true"></i>
			</button>
			<ul id="desktop-dd-menu" class="navbar-inverse dropdown-menu pull-right">
				<li class="top-border"></li>
				{foreach from=$buttons item=button}
				{if $button.enabled && $button.is_dropdown}
				<li>
					<a href="{$button.url}"><i class="fa {$button.icon}"></i> {$button.caption}</a>
				</li>
				{/if}
				{/foreach}
			</ul>
		</div>
	</div><!--  end of member drop down menu -->
</div><!-- end of user tools desktop -->
<!-- tools tablet view -->
<div class="hidden-lg hidden-xs">
	<div id="tabletUserTools">
		<div class="tabletUserToolsPanel">
			<div class="dropdown">
				<button class="pull-right btn-user-tools dropdown-toggle text-right" type="button" data-toggle="dropdown">
					{$smarty.session.cleansed_username} &nbsp; <i class="fa fa-chevron-down" aria-hidden="true"></i>
				</button>
				<ul class="navbar-inverse dropdown-menu pull-right">
					<li>
						<ul id="table_dropdown_menu" style="padding:10px; margin:0; list-style:none">
							<li>
								<div id="top-tools">
									<div class="action-icons col-sm-9 pull-right no-padding">
										<div id="table_credits_text" class="col-sm-7 no-padding text-right" {if $desktop_button eq "credits"}onClick="location.href='{$buttons.credits.url}'"{else} onclick="Merchant.buyModal.getData()" {/if}>
											<span class="greenText tb_credits">{$top_bar.credits}</span>
											<span>
												 &nbsp; <i class="fa fa-database"></i>
											</span>
										</div>
                                        <span class="creditsSpinner col-xs-7 no-padding text-right" style="display: none; color: #fff; font-size: 1.8rem; line-height: 125%;">
                                            <i class="fa fa-refresh fa-spin" ></i>
                                        </span>
										{if $buttons.messages.enabled }
										<div class="col-sm-2">
											<!-- active count -->
											<div class="active-item-count">
												<div class="active-count tb_mail">{$top_bar.messages}</div>
											</div>
											<!-- end of active count -->
											<a href="{$buttons.messages.url}"><i class="fa {$buttons.messages.icon}"></i></a>
										</div>
										{/if}

										{if $buttons.favorites.enabled}
										<div class="col-sm-2">
											<!-- active count -->
											<div class="active-item-count">
												<div class="active-count tb_favorites">{$top_bar.favorites}</div>
											</div>
											<!-- end of active count -->
											<a href="{$buttons.favorites.url}"><i class="fa {$buttons.favorites.icon}"></i></a>
										</div>
										{/if}
										{if 1 eq 2 && $buttons.tickets.enabled}
										<div class="col-sm-2 hidden">
											<!-- active count -->
											<div class="active-item-count">
												<div class="active-count tb_tickets">{$top_bar.tickets}</div>
											</div>
											<!-- end of active count -->
											<a href="{$button.tickets.url}"><i class="fa {$button.tickets.icon}"></i></a>
										</div>
										{/if}
									</div>
									<div class="clearfix"></div>
								</div>
							</li>

							<!--  start of blocks  -->
							{foreach from=$buttons item=menu_item}
							{if $menu_item.enabled && $menu_item.is_dropdown}
							<li class="col-sm-6"><a href="{$menu_item.url}"><i class="fa {$menu_item.icon}"></i> <br> {$menu_item.caption}</a></li>
							{/if}
							{/foreach}
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- section one tools -->
</div>
