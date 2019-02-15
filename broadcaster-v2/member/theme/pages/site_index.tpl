{include file="wcc3/components/html_header.tpl" show=$show}

<body>
	{include file="wcc3/components/header.tpl"}

	<div class="page-header container-fluid" ><!-- page header -->
        {*wl ads*}
        {if $smarty.session.mobile_detect.is_desktop && $whitelabel_settings.ad_home_top}
            <div id="ad_top" class="col-lg-12" align="center" style="padding-top: 10px;">
                {$whitelabel_settings.ad_home_top}
            </div>
            <div class="clearfix"></div>
        {/if}

		<div class="title my-account-title col-lg-9 col-md-8 col-sm-6">
			Live WebCam Models{if $filter} ~ Filtered!{/if}
		</div>
		<div class="site-search col-lg-3 col-md-4 col-sm-6 text-right">
			{include file="wcc3/components/search.tpl"}
		</div>

	</div>
	<!-- end of page hader -->
	<div id="form_output" class="inverted-color text-center" style="display: none;">
		</div>
	<div id="isotope-container" style="visibility: hidden">
		<div id="body">
			<div class="col-lg-12">
				<div id="models_grid">
                    {* ad cell*}
                    {if $smarty.session.mobile_detect.is_desktop && $whitelabel_settings.ad_home_cell}
                    <div id="ad_home_cell" class="element item">
                        <div class="element_holder bar">
                            <div class="thumb">
                                {$whitelabel_settings.ad_home_cell}
                            </div>
                        </div>
                    </div>
                    {/if}
				{* $photo_url_key : the key name in the $models[#] array of the image to be displayed *}
				{if !$photo_url_key}
					{assign var="photo_url_key" value="large_url"}
				{/if}

				{if $models}
				{foreach from=$models key="k" item="model" name="modelsgrid_loop"}

					<div id="model_{$model.id}" class="element item{if $model.has_sound} audio{/if}{if $model.hd} hd{/if}{if $model.p2p_validated} phone{/if}">

						<div class="element_holder bar">
							<div class="thumb">
								<div class="{$model.dom.status_color} status opacity" style="opacity:1!important;">
									{if $model.interactive_toys}
										<img id="interactiveLeftIcon_{$model.id}" class="interactive_icon_img" src="{$smarty.const.CDN_SCHEMA}/flashApps/swf/assets/leftBracket.png">
										{$model.dom.status_name}
										<img id="interactiveRightIcon_{$model.id}" class="interactive_icon_img" src="{$smarty.const.CDN_SCHEMA}/flashApps/swf/assets/rightBracket.png">
									{else}
										<i class="fa {$model.dom.status_icon}"></i> {$model.dom.status_name}
									{/if}
									<div class="modelfeatures">
                                   		{if $model.mobile_video_type === 'wowza-hls' && $smarty.const.__LOCAL_DEBUG }
										<span><i class="fa fa-toggle-right"></i></span>
										{/if}
										{if $model.has_sound}
										<span><i class="fa fa-volume-up"></i></span>
										{/if}
										{if $model.hd}
										<span class="hd">HD</span>
										{/if}
										{if $model.p2p_validated}
										<span><i class="fa fa-mobile"></i></span>
										{/if}
									</div>
								</div>
								{* model actions*}
								{* display set via css*}
								<div class="home-page fav-model-icons {$model.dom.status_color}">
									<a href="/profile/{$model.username}">
                                        {if $ticket.model_info.gender eq 'Single - Female'}
											<i class="fa fa-female" title="View Profile"></i>
                                        {elseif $ticket.model_info.gender eq 'Single - Male'}
											<i class="fa fa-male" title="View Profile"></i>
                                        {else}
											<i class="fa fa-venus-mars" title="View Profile"></i>
                                        {/if}
									</a>
										<i class="fa fa-money" title="Send Tip" {if $smarty.session.__logged_in}onclick="tipModel('{$model.id}', '{$model.username}')"{else} data-toggle="modal" data-target="#joinModal" onclick="joinModalBranded( 'Tip', '{$model.username}' )"{/if}></i>
										<i class="fa fa-star" title="Vote" {if $smarty.session.__logged_in}onclick="model_raitings.vote('{$model.id}', '{$model.username}')" {else} data-toggle="modal" data-target="#joinModal" onclick="joinModalBranded( 'Vote for', '{$model.username}' )"{/if}></i>

										<i class="fa fa-envelope"  title="Message" {if $smarty.session.__logged_in}	onclick="message.newMessagetoModel( '{$model.id}', '{$model.username}' )" {else} data-toggle="modal" data-target="#joinModal" onclick="joinModalBranded( 'Send Emails to', '{$model.username}' )"{/if}></i>

										<i class="fa fa-bell"  title="Notifications" {if $smarty.session.__logged_in} onclick="{if $member_cellphone_verified }mobileAlerts.addModelAlerts('{$model.id}'){else}mobileAlerts.setupMobleNotifications(){/if}" {else} data-toggle="modal" data-target="#joinModal" onclick="joinModalBranded( 'Get Alerts from', '{$model.username}' )"{/if}></i>
										<i class="fa fa-heart" title="Favorite / Unfavored" {if $smarty.session.__logged_in}onclick="favoriteMe( '#model_{$model.id}' )"{else} data-toggle="modal" data-target="#joinModal" onclick="joinModalBranded( 'Favorite', '{$model.username}' )" {/if}></i>
								</div>
                                {* end model actions*}
								<a href="/performers/{$model.username}"{if $override_chat_url} onclick='{$override_chat_url}; return false;'{/if}>
									<img id="img_{$model.id}"
										 class="backdrop"
										 src="{$model[$photo_url_key]}"
                                        {if $model.mobile_fcs_status}
										 onMouseOver="UIVideoController.doMouseOver('{$model.id}','{$model[$photo_url_key]}','{$model.mobile_video_url}','{$model.live_large_url}','{$model.in_pvt}','{$model.inGoalShow}','{$model.party_chat}','{$model.interactive_toys}');"
										 onMouseOut="UIVideoController.doMouseOut('{$model.id}','{$model[$photo_url_key]}','{$model.mobile_video_url}');"
										 onerror="UIVideoController.onerror('{$model.id}','{$model[$photo_url_key]}')"
                                        {/if}
                                    >
								</a>
							</div><!-- end of thumb -->

							<div class="stats left">
								<div class="name">
									{$model.username} {if 1 == 2 &&  $smarty.const.__IS_DEV_SERVER} ({$model.id} ~ {$model.country_code} ~ {$model.rating}){/if}
								</div>
								<div class="rating">
									{if $model.rating}
										{foreach from=$model.rating_full_stars item='k'}
										<i class="fa fa-star"></i>
										{/foreach}
										{if $model.rating_half_star}
										<i class="fa fa-star-half-full"></i>
										{/if}
									{else}
										<i class="fa fa-star-o"></i>
									{/if}
								</div><!-- end of rating -->
							</div><!-- end of stats or rating -->
						</div><!-- end of holder -->
					</div><!-- end of element -->

				{/foreach}
				{else}
					<div style='padding:30px;'>No models found matching filter criteria!</div>
				{/if}

					<div class="spacer"></div> <!-- clears Isotope -->
				</div><!-- end of models_grid -->
			</div><!-- end something -->
			<div class="clearfix"></div>
		</div><!--  end div  -->
	</div> <!-- end isotope-container -->
	<form id="add-favorites" action="/api/members/favorites.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
		<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
		<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
		<input type="hidden" id="request-type" name="request-type" value="add-model">
		<input type="hidden" name="model_id" id="model_id" value="">
	</form>
	<div class="clearfix no-margin"></div>

	{include file="wcc3/components/pagination.tpl"}

	{include file="wcc3/components/footer.tpl" show=$show}

<!-- Bootstrap core JavaScript
================================================== -->

{literal}
<script type="text/javascript">
/**
 * detect IE
 * returns version of IE or false, if browser is not Internet Explorer
 */
function detectIE() {
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf('MSIE ');
    if (msie > 0) {
        // IE 10 or older => return version number
        return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
    }

    var trident = ua.indexOf('Trident/');
    if (trident > 0) {
        // IE 11 => return version number
        var rv = ua.indexOf('rv:');
        return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
    }

    var edge = ua.indexOf('Edge/');
    if (edge > 0) {
        // Edge (IE 12+) => return version number
        return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
    }

    // other browser
    return false;
}
$(function(){

	$(window).on('scroll', function(){
		var wypos = $(window).scrollTop();
		var wh	= $(window).height();
	try{
		var aypos = $('.bottom_ad').position().top;
		var ah	= $('.bottom_ad').outerHeight();

		if ($(window).width() > 640 && wypos+wh >= aypos){
			var test =  '0 '+ (wypos - aypos + aypos / 10) / 5 + 'px';
			$('.bottom_ad').css({'background-position': test});
		} else {
			$('.bottom_ad').css({'background-position':'0 -40px'});
		}
	}catch(err){
	}
	});

	$('.bottom_ad').on('mouseenter', function(){
		$(this).stop().animate({"background-size":"104%"}, 1000);
	});

	$('.bottom_ad').on('mouseleave', function(){
		$(this).stop().animate({"background-size":"100%"}, 1000);
	});


});
function deleteItem(id) {
	try{
		var $container = $('#models_grid');
		var $item = $('#'+e);
		$container.isotope('remove', $item).isotope('layout');
	}
	catch(e){}
}
//will load div using Isotope plugin.
//blank overlay has been added to #models_grid which is remove once DOM is ready.
function runIsotopeGrid(){
    $('#models_grid').isotope({
        itemSelector: '.element',
        masonry : {
            columnWidth : 1
        }
    });
    //removes overlay from istope elements
    setTimeout(function(){
        $('#isotope-container').removeAttr('style');
        if($('.element.item').length > 60){
            var el = $('.element').last();
            $('#models_grid').isotope('remove', el).isotope('layout');
        }
        }, 1);
}
$('#models_grid').imagesLoaded()
	.done( function( instance ) {
        runIsotopeGrid()
	}
).fail( function() {
    console.log('all images loaded, at least one is broken');
    	runIsotopeGrid()
	}
);

$('#models_grid a').on('hover', function(){
	$(this).find('.modelfeatures span').css('color','#fff');
})

$('#clearFilter').on('click', function () {
	$('#filterForm').find('input[type=checkbox]').removeAttr('checked');
	$('#filterForm').find('select option').removeAttr('selected').trigger('change');
	wcc.redirect( '/' );
});
if (window.matchMedia('(max-width: 767px)').matches){
	$('.on-model-menu').show()
	$('.on-model-menu').on('click', function(e){
		var setionid = '#'+$(this).closest('.item').attr('id');
		$(setionid+' .model-menu-open').show()
		console.log('tap '+setionid)
		e.preventDefault()
		e.stopPropagation()
	})
}


</script>
<style type="text/css">
#composer {
	bottom: 0px;
}
</style>
    <script>
        // Get IE or Edge browser version
        var version = detectIE();

        if (version === false || version >= 12) {
            var hoverCss = '<style type="text/css">';
                hoverCss += '.thumb:hover .home-page{\n' +
                    '\tdisplay: block;\n' +
                    '\t}\n' +
                    '.thumb:hover .status.opacity{\n' +
                    '\tdisplay: none;\n' +
                    '\ttransition: all ease-out 3s;\n' +
                    '\t}'
                hoverCss += '</style>'
            document.write(hoverCss)
        }
    </script>
{/literal}
<div id="cover-all" style="display: none"></div>
</body>

{include file="wcc3/components/html_footer.tpl" show=$show}
