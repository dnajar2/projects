<section id="mycontents" class="animated fadeIn">
	<div class="account-panel">
		<div class="account-panel-title">
			<!-- title -->
			<div class="pull-left account-section-name" style="padding-left: 0;">
				<i class="fa fa-star"></i> &nbsp; VIP MEMBERS
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- end of title -->
		<div class="clearfix"></div>
		<div class="section">
			<div class="mbr_vip_liaison_container col-sm-12">
				<div class="txt mbr_vip_liaison_top_text">
					<div id="liaison_hello_message" style="font-weight: bold;">Hello
						{$smarty.session.username},</div>
					<div id="liaison_first_passage">
						Thank you for being one of our most valued members and welcome to
						<span id="liaison_vip_club">VIP Club!</span> I have been assigned
						to your account and can assist you with anything you may need. <br>If
						you have any questions or concerns feel free to contact me at
						anytime. <br>I'm available via live help below Monday through Friday
						8:00 am to 4:30 pm (PST) or via email, phone or through Skype.
					</div>
					<div id="liaison_second_passage">I look forward to being your
						acount liaison and hope you continue to enjoy the services we have
						to offer.</div>
					<div div="liaison_signature">
						Best Regards,<br> <span id="liaison_name">{$liaison.liaison_first_name}
							{$liaison.liaison_last_name}</span><br> {$liaison.liaison_title}
					</div>
				</div>
				<hr>
				<div>
					<div class="col-md-1 col-md-offset-2 col-sm-3">
						<img src="{$liaison.photo_url}" />
					</div>
					<div id="liaison_box" class="liaison_box" >
						<div class="col-sm-5" style="padding-left: 0;">
							<div class="col-xs-3 liaison_email">
								Email:
							</div>
							<div class="col-xs-9">
								{$liaison.liaison_email}
							</div>
							<div class="col-xs-3 liaison_phone" >
								Phone:
							</div>
							<div class="col-xs-9">
								{$liaison.liaison_phone}
							</div>
							<div class="col-xs-3 liaison_skype">
								Skype:
							</div>
							<div class="col-xs-9">
								{$liaison.liaison_skype}
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="liaison_separator"
							style="margin-left: 2px !important;"></div>
						<div class="liaison_right" style="margin-left: -5px;">
							{literal}
							<script type="text/javascript">
								var __lc = {};
								__lc.license = 3495692;
								(function() {
									var lc = document.createElement('script'); lc.type = 'text/javascript'; lc.async = true;
									lc.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.livechatinc.com/tracking.js';
									var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(lc, s);
								})();
							</script>
							{/literal}
							<div data-id="VeM-hvABOvp" class="livechat_button">
								<a
									href="https://www.livechatinc.com/help-desk-software/?partner=lc_3495692&amp;utm_source=chat_button">help
									desk software</a>
							</div>
							<div class="clear:both;"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- end of col -->
</section>