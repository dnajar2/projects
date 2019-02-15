{include file="$_THEME/components/html_header.tpl" show=$show}
<body>
	{include file="$_THEME/components/header.tpl" show=$show}
<div id="header_margin" class="navbar-inverse hidden-xs">
	<div id="search-tools" class="hidden-xs" >
		<div class="clearfix"></div>
		<!-- Sub header -->
		<div id="loggedInSubHeader hidden-xs">
			<div id="loggedInTitle">
				<div class="title my-account-title">My Account</div>
			</div>
		</div><!-- end of sub header -->
		<div class="clearfix"></div>
	</div>
</div>

<!-- Container -->
<div id="loggedInContent">
	<div class="col-md-12">

		{if $desktop_button == 'settings'}

			{include file="$_THEME/components/members/desktop/settings.tpl"}

		{elseif $desktop_button == 'profile'}

			{include file="$_THEME/components/members/desktop/profile.tpl"}

		{elseif $desktop_button == 'credits'}

			{include file="$_THEME/components/members/desktop/credits.tpl"}

		{elseif $desktop_button == 'messages'}

			{include file="$_THEME/components/members/desktop/messages.tpl"}

		{elseif $desktop_button == 'favorites'}

			{include file="$_THEME/components/members/desktop/favorites.tpl"}

		{elseif $desktop_button == 'tickets'}

			{if $purchase_ticket}
				{include file="$_THEME/components/members/desktop/ticket_purchase.tpl"}
			{else}
				{include file="$_THEME/components/members/desktop/tickets.tpl"}
			{/if}

		{elseif $desktop_button == 'content'}

			{include file="$_THEME/components/members/desktop/content.tpl"}

		{elseif $desktop_button == 'fanclubs'}

			{include file="$_THEME/components/members/desktop/fanclubs.tpl"}

		{elseif $desktop_button == 'subscriptions'}

			{include file="$_THEME/components/members/desktop/subscriptions.tpl"}

		{elseif $desktop_button == 'clubcodes'}

			{include file="$_THEME/components/members/desktop/clubcodes.tpl"}

		{elseif $desktop_button == 'notifications'}

			{include file="$_THEME/components/members/desktop/notifications.tpl"}

		{elseif $desktop_button == 'calendar'}

			{include file="$_THEME/components/members/desktop/calendar.tpl"}

		{elseif $desktop_button == 'vipmembers'}

			{include file="$_THEME/components/members/desktop/vipmembers.tpl"}

		{elseif $desktop_button == 'purchases'}

			{include file="$_THEME/components/members/desktop/purchases.tpl"}

		{elseif $desktop_button == 'billing'}

			{include file="$_THEME/components/members/desktop/billing.tpl"}

		{elseif $desktop_button == 'help'}

			{include file="$_THEME/components/members/desktop/help.tpl"}

		{elseif $desktop_button == 'credithistory'}

			{include file="$_THEME/components/members/desktop/credit_history.tpl"}

		{else}

			{include file="$_THEME/components/members/desktop/desktop.tpl"}

		{/if}

	</div><!-- end of col-md-12 -->
	<div class="clearfix"></div>
</div><!-- end of container -->

{include file="$_THEME/components/footer.tpl" show=$show}

</body>

{include file="$_THEME/components/html_footer.tpl" show=$show}
