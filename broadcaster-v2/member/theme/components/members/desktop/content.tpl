<!-- my videos -->
<div id="contentOverLay" style="display: none">
    <img src="" alt="" class="loader">
</div>
 <section id="my-favorites" style="visibility: hidden;">
	<div class="account-panel">
		<div class="account-panel-title" style="padding-right: 0"><!-- title -->
			<div class="">
                <div class="pull-left account-section-name"><i class="fa fa-film"></i> &nbsp; Videos</div>

                {if $videos || $available_videos}
                <div id="videoFilter" class="pull-right">
                    <div id="filterByModel" class="bfh-selectbox pull-left" data-name="modelFilter" data-value="{if $smarty.session.videoFilterByModel}{$smarty.session.videoFilterByModel}{else}0{/if}">
                        <div data-value="0">Filter by Model</div>
                        {foreach  from=$filter_model_list item='filter_model_list' key=k}
                            <div data-value="{$k}">{$filter_model_list}</div>
                        {/foreach}
                    </div>
                    <div style="padding-left: 20px">
                        <button class="btn button-2 reset-filter" onclick="videosFilter.filterModels('reset')"> <i class="fa fa-undo" aria-hidden="true"></i> Reset Filter</button>
                    </div>
                </div>
                <div id="backToGrid" class="text-right" style="display: none">
                    <button class="btn button-2"> <i class="fa fa-th" aria-hidden="true"></i> Back to Video Grid</button>
                </div>
                {/if}

			</div>
			<div class="clearfix"></div>
		</div>
		<!-- end of title -->
		<div id="form_output" class="inverted-color text-center" style="display: none;"></div>
	   <div class="clearfix"></div>
		<!-- start of rows -->

		<form id="add-favorites" action="/api/members/favorites.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
			<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
			<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
			<input type="hidden" id="request-type" name="request-type" value="add-model">
			<input type="hidden" name="model_id" id="model_id" value="">
		</form>

		<div class="section-light">
			<div class="col-sm-12" style="padding:0px 0px 0px 5px !important">
				<div id="acctmngt_message" style="display:{if !$purchased_show}none{/if};">
					<div id="form_message" class="{if $purchased_show}{$purchased_show.type}_box msg_show{else}msg_hide{/if}" style="margin:0 auto;width:99.5%;">
						<div id="form_message_txt" class="msg_text" style="line-height:125%;">{$purchased_show.message}</div>
						<div class="clear_both"></div>
					</div>
				</div>

				<div id="player-holder" style="display:none;">
					<div id="now-playing">
                        {*video player HTML5*}
						<div id="player">

							<div id="video-container">
								<div id="screen">
									<i id="screen-button" class="material-icons">play_circle_outline</i>
								</div>

								<video style="width:0px;height:0px;opacity:0;z-index:0;"  id="video" poster="../images/wcc3/site/misc/poster.png">
									<source src="" >
									please update your browser
								</video>
         						<div style="width:100%;height:100%;opacity:1;z-index:10;position:absolute;top:0px;" id="flashvideo-container">
                                	<object id='movie' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=11,0,0,0' width='100%' height='100%' align='middle'><param name='allowScriptAccess' value='always' /><param name='allowFullScreen' value='true' /><param name='movie' value='../flashApps/swf/videoPlayerPvt.swf?version=1' /><param name='quality' value='high' /><param name='bgcolor' value='#000000' /><param name='wmode' value='transparent' /><param name='flashvars' value='timestamp=&st=wcc3&site_domain=https://www.webcamclub.com&session_id={$session_id}&session_name={$session_name}&video_id=' /><embed src='../flashApps/swf/videoPlayerPvt.swf?version=1' flashvars='timestamp=&st=wcc3&site_domain=https://www.webcamclub.com&session_id={$session_id}&session_name={$session_name}&video_id=' quality='high' swliveconnect='true' bgcolor='#000000' width='100%' height='100%' wmode='transparent' name='movie' align='middle' allowscriptaccess='always' allowfullscreen='true' type='application/x-shockwave-flash' pluginspage='https://www.adobe.com/go/getflashplayer' /></object>
                                </div>
							</div>

							<div id="pbar-container">
								<div id=pbar></div>
							</div>

							<div id="buttons-container">
								<i id="play-button" class="material-icons">play_arrow</i>
								<div id="time-field">
									00:00 / 0:00
								</div>
								<i id="sound-button" class="material-icons">volume_up</i>
								<div id="sbar-container">
									<div id="sbar"></div>
								</div>
								<i id="fullscreen" class="material-icons">featured_video</i>
							</div>

						</div>
					</div>
                    {*video list*}
					<div id="video-list" class="owl-carousel">
                        {foreach from=$videos item="video_list"}
							<div class="video-item">
								<input type="hidden" name="vid-id" value="{$video_list.video_id}">
								<div style="width: 100%; position: relative">
									<div class="mbr_video_item_info">
                                        <strong>Type:</strong> {$video_list.purchase_type}
										{if $video_list.purchase_type == 'expires' }<span class="pull-right">{$video_list.time_left_fmt}</span>{/if}
									</div>
								</div>

								<div class="poster-play">
									<i class="poster-play-btn material-icons" onclick="h5player.loadAndPlay('{$video_list.video_id}')">play_circle_outline</i>
								</div>
								<img src="{$video_list.snapshot_url}" alt="{$video_list.model_username}">

								<div class="fav-model-name">{$video_list.model_username}</div>


							</div>

                        {/foreach}
					</div>
				</div>

				<div id="videos-grid" class="grid">

					{if $videos}
						<form id="video-purchased-form" action="/api/members/content.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
							<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
							<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
							<input type="hidden" id="type" name="type" value="purchased">
							<input type="hidden" name="videoFilterByModel">
							<input type="hidden" name="model_id">
						</form>
						{foreach from=$videos item="video"}
							<div id="mbr_video_{$video.video_id}" class="grid-item">
								<div class="video-holder">
									<div class="mbr_video_item_info">
										<div class="txt mbr_video_info_type" style="float:left;">
											<span style="font-weight:bold;">Type:</span>
											<span style="font-weight:normal;">{$video.purchase_type_fmt}</span>
										</div>
										<div class="txt mbr_video_info_type" style="float:right;">
											{if $video.purchase_type eq 'expires'}
												<span style="font-weight:normal;">{$video.time_left_fmt}</span>
											{else}
											<span style="font-weight:bold;">Date:</span>
											<span style="font-weight:normal;">{$video.date_fmt}</span>
											{/if}
										</div>
									</div>
									<div class="poster-play staged-videos">
										<i class="poster-play-btn material-icons" onclick="h5player.openPoster('{$video.video_id}')">play_circle_outline</i>
									</div>
									<img src="{$video.snapshot_url}" alt="{$video.model_username}" class="poster-image">
								</div>

								<div class="model-stats-label fav-sts-{if $video.online}available{else}offline{/if}">
									<div class="fav-model-satus col-xs-8">
										<i class="fa fa-comments"></i>
										{if $video.online}Available{else}Offline{/if}
									</div>
									<div class="fav-model-features col-xs-4 text-right">
										<i class="fa fa-volume-up"></i>
										<span class="hd">HD</span>
										<i class="fa fa-mobile"></i>
									</div>
								</div>
								<div class="model-information">
									<div class="fav-model-name col-xs-6">
										{$video.model_username}
									</div>
									<div class="fav-model-ratings col-xs-6">
									<span>
									{if $video.rating}
                                        {foreach from=$video.rating_full_stars item='k'}
											<i class="fa fa-star"></i>
                                        {/foreach}
										{if $video.rating_half_star}
										<i class="fa fa-star-half-o"></i>
                                    	{/if}
									{else}
										<i class="fa fa-star-o"></i>
                                    {/if}
									</span>
									</div>
								</div>
								<div class="fav-model-icons">
									<a href="{$video.profile_url}">
										{if $video.gender eq 'Female'}
											<i class="fa fa-female" title="View Profile"></i>
										{elseif $video.gender eq 'Male'}
											<i class="fa fa-male" title="View Profile"></i>
										{else}
											<i class="fa fa-venus-mars" title="View Profile"></i>
										{/if}
									</a>
									<i class="fa fa-money" title="Send Tip" onclick="tipModel('{$video.model_id}', '{$video.model_username}')"></i>
									<i class="fa fa-star" title="Vote" onclick="model_raitings.vote('{$video.model_id}', '{$video.model_username}')"></i>
									<i class="fa fa-envelope"  title="Message"></i>
									<i class="fa fa-bell"  title="Notifications"></i>
									{if $video.favorite}
									<i class="heart fa fa-heart" title="Favorite Model"></i>
									{else}
									<i id="fav_model_{$video.model_id}" class="heart fa fa-heart-o" title="Add to favorites" onclick="favoriteMe( '#model_{$video.model_id}' )"></i>
									{/if}
									<!--<i class="fa fa-times-circle"></i>-->
								</div>
							</div>
						{/foreach}
					{/if}
				</div><!-- End of grid-->
				{if $show_more_purchased}
					<div class="col-sm-12 col-sm-offset-11">
						<button id="btn_load_more_purchased" class="btn button-2" type="button" onclick="return Members.loadMoreVideos('purchased');">More&nbsp;&nbsp;<i class="fa fa-refresh fa-spin hidden"></i></button>
					</div>
					<div class="clearfix"></div>
				{/if}
				{if $total_videos_count lte 0}
					<div>
						<div class="txt empty_folder" style="width: 95%; margin: 10px 20px auto; padding-top: 10px;">You haven't purchased any private show recordings yet. Take a model private{if $available_videos} or select a show from below{/if} and you can purchase your show to watch it anytime you want!</div>
					</div>
				{/if}
                {if $available_videos}
				<div id="available_videos" style="display: none">
					<form id="video-available-form" action="/api/members/content.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
						<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
						<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
						<input type="hidden" id="type" name="type" value="available">
                        <input type="hidden" name="videoFilterByModel">
                        <input type="hidden" name="model_id">
					</form>
					<div id="account_content_available_videos_container" class="account_content_available_videos_container">
						<h2 class="title">
							<i class="primary-color fa fa-chevron-right"></i> Videos Available for Purchase
						</h2>
					</div>
					<div class="txt mbr_video_available_info">
						You have available private show videos you can purchase below to add to your video collection.
					</div>
					<hr>
					<div id="available_purchases">
						<div id="account_content_available_videos" data-module-box="true" >
							<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
							<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
							<div id="mbr_available_videos" class="grid">
                                {foreach from=$available_videos item="video" key="k" name="available_videos"}
									<div id="mbr_video_available_{$video.show_id}" class="mbr_video_available grid-item">
										<div class="img-loader-overlay" style="display: none">
											<img src="/images/wcc3/spinner.svg" >
										</div>
										<div class="mbr_video_available_show_info">
											<div class="video-holder">
												<div class="video-show-date">Show Date:<br> {$video.show_date}</div>
												<div class="video-show-length">Show Length:<br> {$video.show_length_fmt}</div>
												<div class="txt2">{$video.model_username}</div>
												<div class="clearfix"></div>
											</div>
											<div class="clear_both"></div>
                                            {if $video.fanclub_discount_amt}
												<div class="clear_both"></div>
												<div>
													<div>
                                                        {$video.fanclub_discount_amt}% Fan Club Membership discount applied
													</div>
												</div>
												<div class="clear_both"></div>
                                            {/if}
											<div class="mbr_video_available_show_photo">
												<img class="mphoto_no_hover" src="{$video.snapshot_url}"  />
											</div>
											<div id="purchase_show_buttons">
												<div style="padding-bottom: 5px;">
													<button type="button" name="rent_show" id="rent_show" class="form_submit_button btn full-width-btn"
															onclick="this.blur(); purchaseOrRentVideo.process('{$video.video_id}','mbr_video_available_{$video.show_id}', '{$video.show_id}', '{$video.show_type_expires_label}', null, '{$smarty.const.PREMIUM_CHATS_PURCHASE_SHOW_FROM_MY_VIDEOS}' ); return false;"
													>Rent for {$member_video_keep_days} days - {$video.video_cost_fmt}</button>
												</div>
												<div>
													<button type="button" name="buy_show" id="buy_show"  class="form_submit_button btn full-width-btn"
															onclick="this.blur(); purchaseOrRentVideo.process('{$video.video_id}','mbr_video_available_{$video.show_id}', '{$video.show_id}', '{$video.show_type_lifetime_label}', null, '{$smarty.const.PREMIUM_CHATS_PURCHASE_SHOW_FROM_MY_VIDEOS}' ); return false;"
													>Buy and Keep - {$video.video_cost_lifetime_fmt}</button>
												</div>
											</div>
										</div>
									</div>
                                {/foreach}
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
				{if $show_more_available}
					<div class="col-sm-12 col-sm-offset-11">
						<button id="btn_load_more_available" type="button" class="btn button-2" onclick="Members.loadMoreVideos('available');">More&nbsp;&nbsp;<i class="fa fa-refresh fa-spin hidden"></i></button>
					</div>
					<div class="clearfix"></div>
				{/if}
                {/if}
			</div>
		</div> <!-- end of wrapper -->
	 <div class="clearfix"></div>
	<!-- end of rows -->
</div><!-- end of col -->
</section>

<script>

{literal}

var purchaseOrRentVideo={
	process: function(video_id,section_id,show_id, EXPIRES, state, FROM_MY_VIDEOS){
		$('#'+section_id).find('.img-loader-overlay').slideDown('slow');

		var data = wcc.sid_name+'='+wcc.sid;
			data +='&member_id='+wcc.member_id;
			data +='&video_id='+video_id;
			data +='&show_id='+show_id;
			data +='&expires='+EXPIRES;
			data +='&state='+state;
			data +='&from='+FROM_MY_VIDEOS;
			data +='&section_id='+section_id;
			// encoding poster image url

            // data += encodeURI('&vid_img1='+vid_img[0]);
        	// data += encodeURI('&vid_img2='+vid_img[1]);
        	// data += encodeURI('&vid_img3='+vid_img[2]);
        $('#form_output').removeClass('has-success has-error').hide();
        $.ajax({
            url:window.location.origin+'/api/members/content.php',
            type : 'POST',
            cache : false,
            crossDomain : true,
            xhrFields : {
                withCredentials: true
            },
            data : data,
            success : function (data, status, jqXHR) {
                //success code here
				var res = JSON.parse(data);
				setTimeout(function(){
                    $('#form_output').slideDown().text(res.message);
                    if(res.status){
	                    var purchasedVideo = res.video;
	                    $('#form_output').addClass('has-success');
                        $.when(
                            $('#'+res.request.section_id).remove()
						).then(function(){
							$('#mbr_available_videos').isotope('reloadItems').isotope({sortBy: 'original-order'});
						}
						).done(
							setTimeout(function () {
								$('#form_output').hide();
								$('#mbr_video_' + purchasedVideo.video_id + ' .fav-sts-msg').addClass('hidden');
								$('#mbr_video_' + purchasedVideo.video_id + ' .fav-sts-available').removeClass('hidden');
								$('#mbr_video_' + purchasedVideo.video_id + ' .fav-sts-offline').removeClass('hidden');
							},5000)
						);

                        if( typeof purchasedVideo.msg === 'undefined' ) {

	                        $.extend(purchasedVideo, { msg : 'Video successfully '+res.transType+', enjoy!' } );
                        }
                        Members.renderPurchasedVideo( purchasedVideo );

                        $('#mbr_video_available_' + purchasedVideo.show_id).remove();
	                    $('#mbr_available_videos').isotope('reloadItems').isotope({sortBy: 'original-order'});

                        if($('.mbr_video_available').length === 0){
                            $('#available_purchases').html('<h2 class="text-center">No more videos available for rental or purchase!</h2>');
                        }
                    }
                    else{
                        $('#form_output').addClass('has-error');
                        $('#'+res.request.section_id).find('.img-loader-overlay').slideUp('slow');
                    }
				},1000);
            },
            error : function (jqXHR, status, error) {
                // error code here
            }
        });
	},
}


$(function(){

    $('#my-favorites').show();
	// disable right click on video element
	$('#video-container').bind('contextmenu',function() { return false; });
	$('#available_videos').show();
	$('#mbr_available_videos').isotope();

	$('.owl-carousel').owlCarousel({
		loop:true,
		nav:true,
		navigation: true,
		navigationText:['<i class="fa fa-chevron-left"></i>','<i class="fa fa-chevron-right"></i>'],
		dots:true,
		margin:10,
		responsiveClass:true,
		responsive:{
			0:{
				items:1,
				nav:true
			},
			600:{
				items:3,
				nav:false
			},
			1000:{
				items:4,
				loop:false
			}
		}
	});
	$('.owl-next').html('<i class="fa fa-chevron-right"></i>');
	$('.owl-prev').html('<i class="fa fa-chevron-left"></i>');
	$('.owl-next').addClass('pull-right');
	$('.owl-prev').addClass('pull-left')

});
{/literal}
{if $member_cellphone_verified }
{literal}
$('#my-favorites .fa.fa-bell').on('click', function(e){
	$('#request_type').val('mobile_notification');
	var parentId = '#'+$(this).parents(':eq(1)').attr('id');
	var inputVal = $(parentId).find('input').val(); //get model id
	$('#setup_model_notification form').append('<input type="hidden" id="notification_model_id" name="notification_model_id" value="'+inputVal+' "> ');
	var data = $('#setup_model_notification form').serialize();
	var url = $('#setup_model_notification form').attr('action');

	Members.addModelNotifications(data, url);

})
{/literal}
{else}
{literal}

$('#my-favorites .fa.fa-bell').on('click', function(){
	$('#form_output').removeClass('inverted-color').addClass('alert alert-danger').slideToggle().text('You are not set up to receive mobile alerts, add your phone number and try again.');
	setTimeout(function(){
		$('#setup_model_notification').slideToggle()
		},1500);
	setTimeout(function(){
		$('#form_output').slideToggle().text('').addClass('inverted-color').removeClass('alert alert-danger')
	},5500)
	console.log('else verified')
	});

{/literal}
{/if}
</script>
