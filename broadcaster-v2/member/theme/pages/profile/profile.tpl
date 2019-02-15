{include file="wcc3/components/html_header.tpl" show=$profile}
<body>
	{include file="wcc3/components/header.tpl" show=$profile}
<div id="header_margin" class="navbar-inverse hidden-xs">
	<div id="search-tools" class="hidden-xs" >
		<div class="clearfix"></div>
		<!-- Sub header -->
		<div id="loggedInSubHeader hidden-xs">
			<div id="loggedInTitle">
				<div class="title my-account-title">Model {$model_username}</div>
			</div>
		</div><!-- end of sub header -->
		<div class="clearfix"></div>
	</div>
</div>
<div id="form_output" class="inverted-color text-center" style="display: none;"></div>
<!-- Container -->
<div id="loggedInContent">
	<div id="model_info" class="col-md-12">
	<div class="col-md-3 col-sm-4">
		<div id="model_{$form.id}" class="model_pic">
			<div id="model_profile_picture">
				<a {if $smarty.session.__logged_in} href="{$form.pubChatLink}" title="Chat with {$model_username}" {else} href="#"data-toggle="modal" data-target="#joinModal" onclick="joinModalBranded( 'Chat' )" {/if} >
					<img src="{$prime_photo_url}" alt="{$model_username}">
				</a>
			</div>
			<div class="model-stats-label fav-sts-{if $form.online}available{else}offline{/if}">
				<div class="fav-model-satus pull-left">
					<i class="fa fa-comments"></i>
					{if $form.online}Available{else}Offline{/if}
				</div>
<!-- 				<div class="fav-model-features pull-right text-right"> -->
<!-- 					<i class="fa fa-volume-up"></i> -->
<!-- 					<span class="hd">HD</span> -->
<!-- 					<i class="fa fa-mobile"></i> -->
<!-- 				</div> -->
			</div>
			<div class="clearfix"></div>
			<!--	model stats count -->
			<div class="model_stats">
				<form id="add-favorites" action="/api/members/favorites.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
					<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
					<input type="hidden" id="{$smarty.session.session_name}" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
					<input type="hidden" id="request-type" name="request-type" value="add-model">
					<input type="hidden" name="model_id" id="model_id" value="">
			</form>
				<div class="stat_counts" {if $smarty.session.__logged_in}onclick="favoriteMe( '#model_{$form.id}' )"{else} data-toggle="modal" data-target="#joinModal" onclick="joinModalBranded( 'Favorite ', '{$model_username}' )" {/if}>
					<i class="fa fa-heart" title="Add to Favorites"></i><br>
					 <span id="fav_count">{$hasFavModelCount}</span> FAVS
				</div>
				<div class="stat_counts" {if $smarty.session.__logged_in} onclick="{if $is_fan}isClubMember(){else}siteModals.joinFanClubModal( '{$form.id}', '{$model_username}' ){/if}"{else} data-toggle="modal" data-target="#joinModal" onclick="joinModalBranded( 'Become a fan of ','{$model_username}' )" {/if} >
					<i class="fa fa-trophy yellow" title="Become a fan"></i><br>
					 <span id="fan_count">{$fan_count}</span> FANS
				</div>
				<div class="stat_counts" {if $smarty.session.__logged_in}onclick="showModelGallery()"{else} data-toggle="modal" data-target="#joinModal" onclick="joinModalBranded( 'See Photos of','{$model_username}' )"{/if}>
					<i class="fa fa-photo blue" title="View Pictures"></i><br>
					{$photosCount} PICS
				</div>
				<div class="stat_counts" style="opacity:0.5; cursor:default;">
					<i class="fa fa-film green"></i><br>
					{* {$recordedShowsCount} *}VIDS
				</div>
				<hr>
				<div class="stat_counts" {if $smarty.session.__logged_in} onclick="tipModel('{$form.id}', '{$model_username}')" {else} data-toggle="modal" data-target="#joinModal" onclick="joinModalBranded( 'Tip  ', '{$model_username}' )" {/if} >
					<i class="fa fa-money green"></i><br>
					TIP
				</div>
				<div class="stat_counts" {if $smarty.session.__logged_in} onclick="message.newMessagetoModel( '{$form.id}', '{$model_username}' )" {else} data-toggle="modal" data-target="#joinModal" onclick="joinModalBranded( ' Message ','{$model_username}' )"{/if}">
					<i class="fa fa-paper-plane blue"></i><br>
					MESSAGE
				</div>
				<div class="stat_counts" {if $smarty.session.__logged_in} onclick="{if $member_cellphone_verified }mobileAlerts.addModelAlerts('{$form.id}'){else}mobileAlerts.setupMobleNotifications({$form.id}){/if}"{else} data-toggle="modal" data-target="#joinModal" onclick="joinModalBranded( 'Get Alerts from ','{$model_username}' )"{/if} >
					<i class="fa fa-bell"></i><br>
					ALERT
				</div>
				<div class="stat_counts" {if $smarty.session.__logged_in} onclick=" window.location.href ='{$form.pubChatLink}'" {else} data-toggle="modal" data-target="#joinModal" onclick="joinModalBranded( 'Chat with ', '{$model_username}' )" {/if} >
					<i class="fa fa-commenting"></i><br>
					CHAT
				</div>

				<div class="clearfix"></div>
			</div>
			<!-- end of stat counts -->
		</div>
		<div id="model_pics" style="display: none">
		{foreach from=$photos item="photo" name="model_img"}

			<a href="{$photo.1}" title="{$model_username} gallery">
				<img src="{$photo.0}" alt="{$model_username} gallery">
			</a>
		{/foreach}

		</div>
			<div class="clearfix"></div>
		</div>

		<div class="col-md-9 col-sm-8">
			<div class="title_banner primary-bg-color">
				<div class="title_banner_text pull-left">
					<h2 class="pull-left modelName">{$model_username}</h2>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star-half-o"></i>
				</div>
				<div class="model_status pull-right">
					<div class="model_status_title">Last Online Status</div>
					<div class="time_stamp">{$form.last_online_status} EDT</div>
				</div>

			</div>
			<div class="m-p-t title">
				<i class="fa fa-list"></i> <span id="page_title">My Information </span>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="top-row">
					<div class="cat-title">About Me</div>
					<dl>
					  <dt>Name: </dt>
					  <dd> &nbsp;{$model_username}</dd>
					  <dt>Age: </dt>
					  <dd> &nbsp;{$form.Age}</dd>
					  <dt>Gender: </dt>
					  <dd> &nbsp;{$modelsGender}</dd>
					  <dt>Sexual Orientation: </dt>
					  <dd> &nbsp;{$form.SexualPreference} </dd>
					  <dt>Sign: </dt>
					  <dd> &nbsp;{$form.AstrologySign} ({$form.ChineseSign})</dd>
					</dl>
				</div>
				<div>
					<div class="cat-title">Appearance</div>
					<dl>
						<dt>Height: </dt>
						<dd> &nbsp;{$form.Height}</dd>
						<dt>Weight: </dt>
						<dd> &nbsp;{$form.Weight}</dd>
						<dt>Hair Color: </dt>
						<dd> &nbsp;{$form.HairColor}</dd>
						<dt>Eye Color: </dt>
						<dd>&nbsp;{$form.EyeColor}</dd>
						<dt>Ethnicity: </dt>
						<dd> &nbsp;{$form.Ethnicity}</dd>
						<dt>Cup Size: </dt>
						<dd> &nbsp;{$form.BraSize}</dd>
						<dt>Kinky Attributes: </dt>
						<dd>
						{foreach from=$KinkyAttributes item="attribute"}
							{if $attribute.FieldValue gt 0 }
								&nbsp;{$attribute.FieldName} &nbsp;
							{/if}
						{/foreach}
						</dd>
					</dl>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="col-lg-4 col-sm-6 borders">
				<div class="top-row">
					<div class="cat-title">Description</div>
					<p>{$form.Description}<br>
					<a  {if $smarty.session.__logged_in} href="{$form.pubChatLink}" title="Chat with {$model_username}" {else} href="#"data-toggle="modal" data-target="#joinModal" onclick="joinModalBranded( 'Chat' )" {/if} >Find me in Free Chat!</a></p>
				</div>
				<div>
					<div class="cat-title">Quote</div>
					<p>"<em>{$form.quote}</em>"</p>
				</div>
			</div>
			<div class="col-lg-5 col-sm-12">
				<div class="col-lg-12 col-sm-6 no-padding top-row">
					<div class="cat-title">Turn Ons</div>
					<p>{$form.TurnOns}</p>
				</div>
				<div class="col-lg-12 col-sm-6 no-right-padding">
					<div class="cat-title">Turn Offs</div>
					<p>{$form.TurnOffs}</p>
				</div>
				{if $hasSchedule}
				<div class="col-lg-12 col-sm-6 no-right-padding">
					<div class="cat-title">My Schedule</div>
					{foreach from=$scheduleDays key=dayKey item=day}
					{$day|capitalize}:&nbsp;
					{if $modelSchedule[$day]}
								<strong>
								{$modelSchedule[$day].fromHourServer}{$modelSchedule[$day].fromMeridiemServer} - {$modelSchedule[$day].toHourServer}{$modelSchedule[$day].toMeridiemServer} est
								</strong>
							{else}
								n/a - n/a
							{/if}
							<br>
					{/foreach}
				</div>
				{/if}
			</div>
			<div class="clearfix"></div>
		</div>

		</div><!-- end of col-md-12 -->
	<div class="clearfix"></div>
</div><!-- end of container -->
<!--  Image gallery container -->
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls " style="display: none;">
    <div class="slides" style="width: 11520px;"></div>
    <h3 class="title">{$model_username} gallery</h3>
    <a class="prev"><i class="fa fa-chevron-left"></i></a>
    <a class="next"><i class="fa fa-chevron-right"></i></a>
    <a class="close">x</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
</div>
<form id="fan_club_form" action="/api/members/fanclubs.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
	<input type="hidden"  name="member_id" value="{$smarty.session.userid}">
	<input type="hidden"  name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
</form>

{include file="wcc3/components/footer.tpl" show=$show}

</body>
<script type="text/javascript">
{literal}
$(document).ready(function(){
	document.getElementById('model_pics').onclick = function (event) {
		event = event || window.event;
		var target = event.target || event.srcElement,
		link = target.src ? target.parentNode : target,
		options = {index: link, event: event},
		links = this.getElementsByTagName('a');
		blueimp.Gallery(links, options);
	}
	$('.fa1.fa-bell').on('click', function(e){
		$('#request_type').val('mobile_notification');

		$('#setup_model_notification form').append('<input type="hidden" id="notification_model_id" name="notification_model_id" value="{/literal}{$form.id}{literal}"> ');
		var data = $('#setup_model_notification form').serialize();
		var url = $('#setup_model_notification form').attr('action');

		Members.addModelNotifications(data, url);

	})
});
function showModelGallery(){
	$('#model_pics').slideToggle()
}
{/literal}
</script>
{include file="wcc3/components/html_footer.tpl" show=$show}
