 {include file="wcc3/components/html_header.tpl" show=$show}
<body>

	{include file="wcc3/components/header.tpl" show=$show}
	<div class="page-header container-fluid">
		<!-- page header -->
		<div class="my-account-title hidden-xs">Live Featured Shows Schedule</div>
	</div>
	<!-- end of page hader -->
	<section id="ft-shows">
		<div class="col-lg-8 col-lg-offset-2">
			<div id="main-ft-shows" class="col-sm-8">
				<div class="th primary-bg-color collapse-head">
					<i class="fa fa-chevron-right"></i> <span class="hidden-xs">Choose Your</span> Timezone <span
						class="pull-right"> {foreach from=$timezones key="k" item="v"} {if $v.id == $tz_id} {$v.display} {/if} {/foreach} </span>
				</div>
				<div id="tz-holder" class="tr collapse-body" style="display: none">
					<form method="GET" name="timezone_form" action="{$timezone_action}"
						onfocus="setTimeout( UIViewController.checkPageSizes, 10 )">
						<input type="hidden" name="show" value="{$show}">
						<div class="col-sm-9">
							<div id="tz_id" class="bfh-selectbox" data-name="tz_id" idx="0"
								tabindex="0" data-value="{$tz_id}" style="display: none">
								{foreach from=$timezones key="k" item="v"}
								<div data-value="{$v.id}">{$v.display}</div>
								{/foreach}
							</div>
						</div>
						<div col-sm-3 style="line-height: 40px;">
							<button class="btn button-2 full-size-btn"
								name="timezone_form_submit" id="timezone_form_submit"
								onclick="timezone_form.submit();this.blur();">
								<i class="fa fa-clock-o"></i> &nbsp; Choose
							</button>
						</div>
						<div class="clearfix"></div>
					</form>
				</div>
				<div class="clearfix">
					<br>
				</div>
				{* start of show grid*} 
				{foreach from=$shows.weeks key="week_key" item="week_item" name="week_loop"} 
				{if $week_key == 0} 
					{assign var="collapse_week" value=false} 
				{else} 
					{assign var="collapse_week" value=true} 
				{/if}

				<div
					class="th primary-bg-color {if $collapse_week}collapse-head{/if}">
					<div>
						{if $collapse_week}
						<span id="week_indicator_{$week_key}"> <i class="fa fa-chevron-right"></i></span> 
						{/if} 
						{$week_item.label}
					</div>
				</div>

				<div data-module-box="true" {if $collapse_week}class="collapse-body" style="display: none" {else} class="non-collapse-body"{/if}>
					<div id="week_{$week_key}">
						{foreach from=$week_item.days key="day_key" item="day_item"}
						<div class="txt mus_day">{$day_item.label}</div>
						<div class="col-sm-12 no-padding">
							<div class="show-details">
								<div class="mus_shows_container">
									{if $day_item.shows} 
										{foreach from=$day_item.show_arrays key="show_key" item="show_item"} 
											{assign var="show_id" value=$show_item[0].id}
											<div id="mp_upcoming_shows_popover_parent_{$show_id}" class="col-sm-4 model-box">
												{include file="wcc3/components/modelsgridsmall.tpl" models=$show_item hide_metadata=true custom_class="mus_models_upcoming_shows" custom_status=true photo_id="mp_upcoming_show_photo_id_$show_id" username_font_size=12}
											</div>
										{/foreach}
									{else}
										{if $day_item.is_today}
											<span class="txt">There are no more shows for today.</span> 
										{else} 
											<span class="txt">There are no shows scheduled for this day.</span> 
										{/if} 
									{/if}
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						{/foreach}
					</div>
					<div class="clearfix"></div>
				</div>
				{if !$smarty.foreach.week_loop.last}
				<div class="clearfix">&nbsp;</div>
				{/if} {/foreach}
			</div>

			<div id="coming-ft-shows" class="col-sm-4">
				<div class="th primary-bg-color">
					{if $shows.featured_show[0].status == $smarty.const.SHOWS_STATUS_ACTIVE}Show In Progress{else}Next Upcoming Show{/if}
				</div>
				{*right side content*}
				<div id="mus_right_module" class="mus_right_module">
					<div class="mus_featured_show_module">
						<div class="mus_featured_show" data-module-box="true">
							<div class="mus_modelsgrid_container">
								{include file="wcc3/components/modelsgridsmall.tpl" models=$shows.featured_show hide_metadata=true custom_class="mus_models_featured_show" custom_status=true no_action=true mbox_class="mbox_large" mboxtxt_class="mboxtxt_large" username_font_size=12}
							</div>
							<div class="clear_both"></div>

							<a href="#"
								onClick="featuredShows.watch_featured_show(); return false;">
								<div class="button2 mus_featured_show_btn">
									<span id="featured_show_watch_ele" class="btn button-2">
										{if $shows.featured_show[0].status == $smarty.const.SHOWS_STATUS_ACTIVE} Watch Live Show Now! {else} Watch Live Show In &nbsp;<span id="timer_{$shows.featured_show[0].id}">(loading...)</span>{/if}
									</span>
								</div>
							</a>

						</div>
					</div>

					<div class="">
						<div class="">
							<div class=""><br>Get Your Show Ticket NOW!<br><br></div>
						</div>

						<div class="" data-module-box="true">
							<div class="">
								Enjoy a full hour of great live entertainment. Watch these live
								models perform on cam and get down and dirty right in front of
								you. Tickets are valid on any featured show and won't expire so
								take your pick!<br>
								<br>Be sure to take your favorite model to a private
								one-on-one show when they get on chat. Enjoy the show!
								<br><br>
							</div>
							<div class="mus_tickets_icon col-xs-4">
								<img src="{$_PATH_IMG}/global/tickets_icon.png">
							</div>
							<div class="mus_purchase_ticket col-xs-8">
								<div class="mus_price_container txt">
									<span class="txt_price">{$ticket_price_fmt}</span> per ticket
								</div>
								<a href="#" class="btn button-2 full-size-btn"
									{if ! $smarty.session.__logged_in}
										data-toggle="modal"
										data-backdrop="static" data-target="#joinModal"
										data-type="member"
									{else} 
										onClick="featuredShows.check_purchase_ticket( '{$purchase_ticket_url}' ); return false;"
									{/if}
								>
									<div class="button2 full-size-btn">Purchase Ticket</div>
								</a>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="clearfix"></div>
	</section>

	{include file="wcc3/components/footer.tpl" show=$show}
</body>
<script>
{literal}
var comingftshows;
var div  = $('#coming-ft-shows');
function shuffleDivs(div){
    comingftshows = div;
    $(comingftshows).remove();
    $(comingftshows).insertBefore('#main-ft-shows')
}
function unShuffleDivs(div){
    comingftshows = div;
    $(comingftshows).remove();
    $(comingftshows).insertAfter('#main-ft-shows');
}
$( window ).resize(function() {


    if (window.matchMedia('(max-width: 767px)').matches){

        shuffleDivs(div);
    }else{
        unShuffleDivs(div);
    }

});
$(function(){
	$('#tz_id').show();
    if (window.matchMedia('(max-width: 767px)').matches){

        shuffleDivs(div);
    }else{
        unShuffleDivs(div);
    }
	//accordion
	$('.collapse-head').on('click', function(){
		//Expand or collapse this panel
		var clicks = $(this).data('clicks');
		if (clicks) {
				$(this).find('.fa').removeClass('fa-chevron-down').addClass('fa-chevron-right');
		}else{
			$(this)
				.find('.fa')
				.removeClass('fa-chevron-right')
				.addClass('fa-chevron-down');
		}
		$(this).data("clicks", !clicks);

		$(this)
			.next()
			.slideToggle('slow');


		//Hide the other panels
		$('.collapse-body')
			.not($(this).next())
			.slideUp('slow');
		$('.collapse-head')
			.not(this)
			.find('.fa')
			.addClass('fa-chevron-right')
			.removeClass('fa-chevron-down');
	});
});
{/literal}
</script>
{include file="wcc3/components/html_footer.tpl" show=$show}
