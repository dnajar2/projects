{include file="wcc3/components/html_header.tpl" show=$show}

<body>
	{include file="wcc3/components/header.tpl" show=$show}
	<div class="page-header container-fluid">
		<!-- page header -->
			<div class="title my-account-title animated fadeIn">{$whitelabel_settings.name } Support</div>
	</div>
	<!-- end of page hader -->
	<!-- top row -->
	<section id="support">
		<div class="description container-fluid animated slideInRight"
			style="padding-left: 15px;">
			Need some help? We value you as a customer and we truly appreciate
			you choosing {$whitelabel_settings.name }. In order to provide you with the best
			assistance, please contact us through any of the choices below.<br>
			We are available 24 hours a day, 7 days a week. Find answers to the
			most common questions by visiting our <a href="/?{'show=faq'|base64_encode}" title="FAQ">FAQ
				page</a>.
		</div>


		<!-- support section -->
		<div class="row-fluid">
			<div class="clearfix"></div>
			<div class="supportSection ">
				<div
					class="animated slideInLeft col-sm-12 col-md-11 col-md-offset-1">

					<div class="supportItem col-sm-4 col-lg-3 col-lg-offset-1">
						<h2 class="bullet_blue">PHONE SUPPORT</h2>
						<div class="supportContact">
							<p>
								<span class="rwd-line">International Only:</span> 1-209-477-7676
							</p>
							<p>
								<span class="rwd-line">Domestic Only:</span> 1-888-201-5204
							</p>
						</div>
					</div>
					<!-- end of phone support -->
					{*<!--
					<div class="supportItem col-sm-4 col-lg-3 hidden">
						<h2 class="bullet_blue">BILLING SUPPORT</h2>
						<div class="supportContact">
							<p>Epoch-Open 24 Hours</p>
							<p>
								<span class="rwd-line">Phone Toll Free:</span> +1-800-893-8871<br>
								<span class="rwd-line">Phone Worldwide:</span> +1-310-664-810<br>
								Email: <a href="mailto:camsupport@webcamclub.com">billing@epoch.com</a>
							</p>
						</div>
					</div>
					<!-- end of billing support -->
					-->*}
					<div class="supportItem col-sm-4 col-lg-3">
						<h2 class="bullet_blue">MAILING ADDRESS</h2>
						<div class="supportContact">
							<p>
								{$whitelabel_settings.name }<br> P.O. Box 690192<br> Stockton,
								CA 95269<br> <a href="mailto:camsupport@webcamclub.com">camsupport@webcamclub.com</a>
							</p>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- contact form -->
		<div class="clearfix"></div>
		<div class="section animated slideInUp">
			<div class="container-fluid ">
				<div class="row-fluid col-sm-8 col-sm-offset-2">
					<div class="row-fluid">
						<div class="">
							<h2>SEND US A MESSAGE</h2>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-8">

						<div id="status_message" class="col-sm-9 col-sm-offset-3 field-message text-center has-error" style="display:none; margin-bottom:15px; border-radius:5px;"></div>
						<div id="status_message_gone" class="col-sm-9 col-sm-offset-3 text-center" style="display:none; ">
							<i class="fa fa-check-square"></i>
						</div>
						<div class="clearfix"></div>
						<form id="support_case" class="form-horizontal" name="contactus" method="POST"
							action="{$form_action}"
							enctype="application/x-www-form-urlencoded" autocomplete="off">
							<input name="show" id="id_show" value="contact" type="hidden" />
							<input name="act" id="id_act" value="process_message" type="hidden" />
							<input name="{$smarty.session.session_name}" id="id_{$smarty.session.session_name}" value="{$smarty.session.SessionID}" type="hidden" />
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label">Name:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="name" id="name"
										placeholder="Please enter your name">
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label">Display Name:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="displayname"
										id="displayname"
										{if $smarty.session.__logged_in}value="{$form.username}"
										{else}placeholder="Enter Display Name"{/if}>
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-sm-3 control-label">Email:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="email" id="email"
										{if $smarty.session.__logged_in}value="{$form.email}"
										{else}placeholder="Enter Email Address"{/if}>
								</div>
							</div>


							<div class="form-group">
								<label for="subject" class="col-sm-3 control-label">Subject:</label>
								<div class="col-sm-9">
									<div class="bfh-selectbox" data-name="subject" data-value="{$messageTopic.id}{$subject}">
										{foreach from=$messageTopics item="messageTopic"}
										<div data-value="{$messageTopic.id}">{$messageTopic.topic}</div>
										{/foreach}
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="message" class="col-sm-3 control-label">Message:</label>
								<div class="col-sm-9">
									<textarea class="form-control" name="message" id="message"
										rows="5"></textarea>

									<div class="form-group">
										<div class="g-recaptcha col-md-6" data-sitekey="6Le85R0TAAAAAM6cUYzuXCqK1VwEHHNQibm30Yvv" style="margin-top: 10px; margin-left:0;"></div>
										<div class="col-md-6 text-right" style="padding: 14px 12px;">
											<button type="submit" id="contact-support-button" class="btn button-2" style="width:134px; height:32px; ">SEND MESSAGE</button>
										</div>
									</div>
								</div>
							</div>

						</form>

					</div>
					<!-- end of form -->
					<div class="col-md-4">
						<div class="col-xs-3  col-sm-10 col-sm-offset-2 ">
							<img class="img-responsive"
								src="images/wcc3/live_chat_support_03.png"
								alt="live chat support" />
						</div>
						<div class="col-xs-9 col-sm-10 col-sm-offset-2 chatSupport">
							Need a quicker option? Try
							<div>
								<a href="#/" onclick="$('.livechat_button a').click()">
									LIVE CHAT SUPPORT
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			{if !$whitelabel_settings.disable_epoch}
            {*<!--
			<div class="col-md-8 col-md-offset-2">
				{ if $whitelabel_settings.type == $smarty.const.WHITELABEL_TYPE_VHOST || $whitelabel_settings.contact_epoch_msg }
				<div class="col-md-8 col-md-offset-2">
					<small>Billing Questions:</small><br>
					<small class="control-label">If your billing statement references "Epoch XXXX" please refer to <a href="http://www.epoch.com/billingsupport" class="normal_link" target="_blank">www.epoch.com/billingsupport</a> for support.
					</small>
				</div>
				{/if}
            </div>
            -->*}
			{/if}
			{if $mid_info && $whitelabel_settings.contact_phone_support}
				<div class="col-md-9 col-md-offset-3">
					<span class="contact_addl_note_title">Phone Support:</span> {$mid_info.phone}
				</div>
			{/if}
			{if $whitelabel_settings.contact_email_support}
				<div class="col-md-9 col-md-offset-3">
					<span class="contact_addl_note_title">Email Support:</span><br>
					{assign var="email_support" value="support@"|cat:$whitelabel_settings.domain}
					<a href="mailto:{$email_support}" class="normal_link">{$email_support}</a>
				</div>
			{/if}
			{if $mid_info && $whitelabel_settings.contact_full_address}
				<div class="col-md-9 col-md-offset-3">
					<span class="contact_addl_note_title">Address:</span><br>
					{$mid_info.company} - {$mid_info.address}
				</div>
			{/if}
			{if $whitelabel_settings.contact_default_support_email}
				<div class="col-md-9 col-md-offset-3">
					<span class="contact_addl_note_title">Support Questions:</span><br>
					For questions, please contact
					<a href="mailto:{$_SETTINGS.SITE_SUPPORT_EMAIL}" class="normal_link">{$_SETTINGS.SITE_SUPPORT_EMAIL}</a>
				</div>
			{/if}
			{if $mid_info && $whitelabel_settings.contact_mid_customer_support}
				<div class="col-md-9 col-md-offset-3">
					<span class="contact_addl_note_title">Customer Support:</span><br>
					<a href="http://www.{$mid_info.billDomain}" class="normal_link" target="_blank">www.{$mid_info.billDomain}</a><br>
					{$mid_info.phone} <br /> <br /> Corporate Information:<br />
						Hot Tamale Ltd.<br />
						11 Church Road <br />
						Great Bookham <br />
						Surrey <br />
						KT23 3PB<br />
						UK
				</div>
			{/if}
			<div class="clearfix"></div>
		</div>
	</section>

	{include file="wcc3/components/footer.tpl" show=$show}

	<!-- Bootstrap core JavaScript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script>
	{literal}
	$(document).ready(function(){
		$(function(){
			$('.view .fa').click(function(){
				$('.view .fa').css({color:"#cccccc"});
				$(this).css({color:"#34495e"});
			});

			$(window).scroll(function(){
				var wypos = $(window).scrollTop();
				var wh    = $(window).height();
			try{
				var aypos = $('.bottom_ad').position().top;
				var ah    = $('.bottom_ad').outerHeight();

				if ($(window).width() > 640 && wypos+wh >= aypos){
					var test =  '0 '+ (wypos - aypos + aypos / 10) / 5 + 'px';
					$('.bottom_ad').css({'background-position': test});
				} else {
					$('.bottom_ad').css({'background-position':'0 -40px'});
				}
			}catch(err){
			}
			});

			$('.bottom_ad').mouseenter(function(){
				$(this).stop().animate({"background-size":"104%"}, 1000);
			});

			$('.bottom_ad').mouseleave(function(){
				$(this).stop().animate({"background-size":"100%"}, 1000);
			});
		});
	});
	$('#support_case').submit(function(e){
		var formData = $('#support_case').serialize();
		wcc.support(formData)
		e.preventDefault()
	});

	{/literal}
	</script>

	<style type="text/css">
{
literal
}
.userNameBtn {
	margin-left: 0;
	margin-right: 0;
}

#my-tools {
	padding: 0;
	padding-left: 15px !important;
	*/
}

@media ( min-width : 425px) and ( max-width : 766px) {
	.select2-drop {
		top: 75px !important;
	}
}

@media ( min-width :768px) and (max-width:1023px) {
	.select2-drop {
		top: 79px !important;
	}
}

@media ( min-width :1024px) and (max-width:1123px) {
	#tabletUserTools {
		right: 35px;
	}
	.select2-drop {
		top: 70px !important;
	}
	#loggedOut li {
		top: 1px;
		margin-right: 10px;
	}
}

@media ( min-width :1400px) {
	.loggedInUserTopRight .dropdown-menu {
		min-width: 145px !important;
		width: 190px !important;
	}
}

@media ( min-width :1200px) and (max-width:1399px) {
	.tabletUserToolsPanel {
		padding: 0;
	}
	.btn-user-tools {
		margin-top: 0px;
	}
	.loggedInUserTopRight {
		padding-top: 4px;
		right: 25px;
	}
	#top-tool-icons.col-xs-4 {
		top: -2px;
	}
	.btn-user-tools {
		padding: 0px 3px 0 8px;
	}
	.userNameBtn .fa {
		float: none;
		padding-top: 0;
		padding-right: 0;
	}
	.btn-user-tools {
		min-width: 151px !important;
	}
	#header-tools {
		top: -93px;
	}
	.page-header {
		margin: 49px 0 5px 0 !important;
		height: 50px;
		line-height: 200%;
	}
	#top-tool-icons {
		padding-right: 0;
	}
	@media ( max-width :1199px) {
		i.fa.fa-search.top-search {
			top: 9px;
			height: 22px;
			line-height: 22px;
		}
		.btn-user-tools {
			margin-right: 42px !important;
			margin-top: 0;
			padding: 0px;
		}
		.falt-ui-search {
			top: 50px;
		}
	}
	@media ( min-width :768px) and (max-width:1023px) {
		.select2-drop {
			top: 78px !important;
		}
		#tabletUserTools .btn-user-tools {
			width: 180px;
			border: none;
		}
		#tabletUserTools .btn-user-tools {
			width: 175px;
			margin-top: 2px;
		}
		.btn-user-tools {
			min-width: 175px;
			margin-right: 18px !important;
		}
		#toggle-tools {
			width: 40px !important;
		}
	}
}
</style>
	{/literal}
</body>
{include file="wcc3/components/html_footer.tpl" show=$show}
