<!-- my favorites -->
		 <section id="my-favorites" class="animated fadeIn" >
			<div class="account-panel">
				<div class="account-panel-title"><!-- title -->
					<div class="pull-left account-section-name">
						<i class="fa fa-heart"></i> &nbsp; Favorites
					</div>

					<div class="clearfix"></div>
				</div>
				<!-- end of title -->
				<div id="form_output" class="inverted-color text-center" style="display: none;"></div>
			   <div class="clearfix"></div>
				<!-- sart of rows -->
			<div class="section-light">
				<div class="col-sm-12" style="padding:0px 0px 0px 5px !important">

					<div class="grid">

					<form id="rem-favorites" action="/api/members/favorites.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
						<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
						<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
				  	  <!-- used as spacer -->
						<div class="gutter-sizer"></div>
						<!-- strat of grid items -->
						{if $favorites}
						{foreach from=$favorites item="favorite"}
						<div id="fav-{$favorite.id}" class="grid-item">
							<div class="remove-div text-center" style="display: none">
								<img alt="loading" src=""><br>
								<span class="sts-message">Removing model from Favorites!</span>
							</div>
							<span class="hide">
								<input type="checkbox" name="model_id[]" value="{$favorite.id}">
							</span>
							<a href="{if $favorite.online}/members/?{$favorite.model_chat_url}{else}/?{$favorite.model_profile_url}{/if}">
								<img src="{$favorite.photo_large_url}" alt="{$favorite.username}">
								</a>
							<div class="model-stats-label fav-sts-{if $favorite.online}available{else}offline{/if}">
								<div class="fav-model-satus col-xs-8">
									<i class="fa fa-comments"></i>
									{if $favorite.online}Available{else}Offline{/if}
								</div>
								<div class="fav-model-features col-xs-4 text-right">
									<i class="fa fa-volume-up"></i>
									<span class="hd">HD</span>
									<i class="fa fa-mobile"></i>
								</div>
							</div>
							<div class="model-information">
								<div class="fav-model-name col-xs-6">
									{$favorite.username}
								</div>
								<div class="fav-model-ratings col-xs-6">
									<span>
									{if $favorite.rating}
										{foreach from=$favorite.rating_full_stars item='k'}
											<i class="fa fa-star"></i>
										{/foreach}
										{if $favorite.rating_half_star}
										<i class="fa fa-star-half-o"></i>
									{/if}
									{else}
										<i class="fa fa-star-o"></i>
									{/if}
									</span>
								</div>
							</div>
							<div class="fav-model-icons">
								<a href="/?{$favorite.model_profile_url}">
									{if $favorite.gender eq 'Single - Female'}
										<i class="fa fa-female" title="View Profile"></i>
										{elseif $favorite.gender eq 'Single - Male'}
										<i class="fa fa-male" title="View Profile"></i>
										{else}
										<i class="fa fa-venus-mars" title="View Profile"></i>
									{/if}

									</a>
								<i class="fa fa-money" title="Send Tip" onclick="tipModel('{$favorite.id}', '{$favorite.username}')"></i>
								<i class="fa fa-star" title="Vote" onclick="model_raitings.vote('{$favorite.id}', '{$favorite.username}')"></i>
								<i class="fa fa-envelope"  title="Message" onclick="message.newMessagetoModel( '{$favorite.id}', '{$favorite.username}' )"></i>
								<i class="fa fa-bell"  title="Notifications"></i>
								<i class="heart fa fa-heart" title="Unfavorite"></i>
								<!--<i class="fa fa-times-circle"></i>-->
							</div>
						</div>
						{/foreach}
						{else}
							<div class="text-center">
								You have not selected any favorite models yet
							</div>
						{/if}
					</form>
			  	</div> <!-- End of grid-->
					{if $favorites and !$fav_limit}
						<div class="clearfix"></div>
						<button id="get_more_favs" class="btn btn-primary pull-right">Load More Models &nbsp; <i class="fa fa-refresh fa-spin hide"></i></button>
					{/if}
		  	</div> <!-- end of wrapper -->
			<div class="clearfix"></div>
		</div>
			<!-- end of rows -->

		</div><!-- end of col -->
		</section>

		<!-- end of my favorites section -->

		<script>
			var addMoreUrl = '/api/members/favorites.php?{$smarty.session.session_name}={$smarty.session.session_id}';
			{literal}
			var params = {
				{/literal}
				member_id : {$smarty.session.userid},
                {$smarty.session.session_name} : '{$smarty.session.session_id}',
				offset: {$smarty.session.fav_offset},
				get_more : null,
				model_id: null,
                {literal}
			}
			// Get more favs
			$('#get_more_favs').on('click',function(){
				params.get_more = 'get_more';
				params.model_id = null;

				$(this).find('i').toggleClass('hide');
				Members.loadMoreFavorites(addMoreUrl, params);

			})

			$('#my-favorites').on('click', '.fa.fa-heart.after', function(){
				var parentId = '#'+$(this).closest('.grid-item').attr('id')
				$(parentId+' .remove-div img').attr('src', wcc.wait_gif.src )
				$(parentId+' .remove-div').slideDown();
				var _model_id = [$(parentId).find('input').val()]
				console.log('click', parentId, _model_id)
				params.get_more = null,
				params.model_id = _model_id;
				Members.removeFavoriteModel(addMoreUrl, params)
			})
			{/literal}

		{if $member_cellphone_verified }
		{literal}
		$('#my-favorites').on('click', '.fa.fa-bell', function(e){
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

		$('#my-favorites').on('click', '.fa.fa-bell', function(){
			$('#form_output').removeClass('inverted-color').addClass('alert alert-danger').slideToggle().text('You are not set up to receive mobile alerts, add your phone number and try again.');
			setTimeout(function(){
				$('#setup_model_notification').slideToggle()
				},1500);
			setTimeout(function(){
				$('#form_output').slideToggle().text('').addClass('inverted-color').removeClass('alert alert-danger')
			},5500);
			console.log('else verified')
			});

		{/literal}
		{/if}
		</script>
