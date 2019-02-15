{include file="wcc3/components/html_header.tpl" show=$show}
<body>
	{include file="wcc3/components/header.tpl" show=$show}
	<div class="page-header container-fluid" ><!-- page header -->
		<div class="title my-account-title col-lg-9 col-md-8 col-sm-6 no-padding">
			Live Status Updates
		</div>
		<div id="form_output" class="inverted-color text-center" style="display: none;">
		</div>
	</div>
	<p id="spinner"><img></p>
	<div style="min-height: 45vh">
		<div id="wccwall" style="display: none" >
			<div class="col-lg-5 col-md-6 col-sm-8 col-md-offset-1 col-lg-offset-2">
				<div class="th primary-bg-color text-center">What's Happening Right Now</div>
				<p id="loading-dots" style="display: none"><img src="images/wcc3/assets/loading_dots.gif"</p>
				<div class="wccwall_event" >
					<!-- wall events go here-->
				</div>
			</div>
			<div id="wall-images" class="col-lg-3 col-md-4 col-sm-4">
				<div class="th primary-bg-color text-center">Most Recent Pictures</div>
				<div id="most_recent_pictures">
					<div class="most_recent_pictures">
						<!-- images go here -->
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	{include file="wcc3/components/footer.tpl" show=$show}
	<!-- Bootstrap core JavaScript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<div id="fadeUp" style="display: none;">
		<span class="closeFadeUp"><i class="fa fa-times"></i> </span>
		<div class="event">

		</div>
	</div>

	<form id="add-favorites" action="/api/members/favorites.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
		<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
		<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
		<input type="hidden" id="request-type" name="request-type" value="add-model">
		<input type="hidden" name="model_id" id="wall_model_id" value="">
	</form>
<script>
	{*get value from Member class on page load*}
	// file wall.tpl
	wccAppCon.phone_verified = {if $Member.cellphone_verified eq ""}"false"{else}{$Member.cellphone_verified}{/if};
	{literal}
	$('.add_as_favorite').on('click', function(){

    })
    {/literal}
</script>
</body>
{include file="wcc3/components/html_footer.tpl" show=$show}
