<!-- Footer -->
{if ! $smarty.session.__logged_in && ! $loading_landing_page && !$show_splash_page }
    <div class="container-fluid bottom_ad">
        <div class="light"></div>
        <div class="adtext">
            <div class="text1">UNLIMITED FREE CHAT</div>
            <div class="text2">+6 FREE Chat Credits</div>
            <div class="text3">to use on anything!</div>
            <div class="wccicon">
                <span></span>
            </div>
        </div>
    </div>
{/if}
<!-- footer W.L. ad -->
{if $smarty.session.mobile_detect.is_desktop && $whitelabel_settings.ad_home_bottom}
    <div id="ad_bottom" align="center" style="padding-bottom:20px;">
        {$whitelabel_settings.ad_home_bottom}
    </div>
    <div class="clearfix"></div>
{/if}
{if !$show_splash_page}
<div id="footer" class="footer">
	<div class="container-fluid footernav"
		{if $smarty.session.__logged_in} style='margin-top: 10px;'{/if}>
		<div class="row-fluid">
			<div>
				<div id="footer-login" class="pull-right" style="text-align: right; display: block" >
					{if ! $smarty.session.__logged_in}
					Login as <a {if $whitelabel_settings.model_login}href="{$whitelabel_settings.model_login}" target="_self" rel="nofollow"
								{else}
								href="#/models/login/" data-toggle="modal" data-target="#loginModal" data-type="model"
								{/if}
								class="linkplain">Model</a> | <a {if $whitelabel_settings.studio_login}href="{$whitelabel_settings.studio_login}" target="_self" rel="nofollow"
								{else}
								href="#/managers/login/" data-toggle="modal" data-target="#loginModal" data-type="manager"
								{/if} class="linkplain">Studio Manager</a>
					{/if}
				</div>
				<ul>
					<li><a href="/faq/">FAQ</a></li>
					<li><a href="/support/" title="Support">Support</a></li>
					<li><a href="{if $whitelabel_settings.studio_register}{$whitelabel_settings.model_register}{else}/model/join/{/if}" title="Model Application" target="_self">Become a Model</a></li>
					{if $whitelabel_settings.studio_register_hide neq "1" }
					<li><a href="{if $whitelabel_settings.studio_register}{$whitelabel_settings.studio_register}{else}/studio/registration/{/if}" >Become a Studio</a></li>
					{/if}
					{if $whitelabel_settings.show_resources}<li><a href="/?{'show=resources'|base64_encode}">Resources</a></li>{/if}
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid footerbottom">
		<div class="row-fluid">
			<div class="col-sm-6">
				<h4>Support</h4>
				<p>
					Our customer service representatives are Online to help assist you
					with any questions or concerns you may have. We offer live chat
					phone and email support. Also, feel free to visit our <a
						href="/faq/">FAQ&nbsp;Page.</a>
				</p>
				{if $whitelabel_settings.webmaster_hide neq "1" }
					<p><strong>Webmasters Make Money with Us</strong>
    					<br>Earn money by promoting and spreading the word about {$whitelabel_settings.name}.  Webmasters can get in touch with our talented sales staff to help you optimize your earnings.  Visit <a href="{if $whitelabel_settings.webmaster_link} {$whitelabel_settings.webmaster_link} {else} http://www.datinggold.com/index.php?aid=10404 {/if}" target="_blank">{if $whitelabel_settings.webmaster_name} {$whitelabel_settings.webmaster_name} {else} www.datinggold.com {/if}</a> to get started.
    				</p>

    			{/if}

				<div class="support">
					<button type="button" class="supportbtn">
						<a href="/" onclick="$('.livechat_button a').click()"><i
							class="fa fa-comments"></i></a>
					</button>
					<span data-id="TeOAYJVf4VD" class="livechat_button hide"> <a
						href="https://www.livechatinc.com/customer-service-software/?partner=lc_3495692&amp;utm_source=chat_button" target="_blank">
							LIVE CHAT SUPPORT </a>
					</span> <a href="mailto:support@{$whitelabel_settings.domain}?subject={$whitelabel_settings.name}+Support" target="_blank"><i
						class="fa fa-envelope"></i></a> <a data-toggle="modal"
						data-target="#call"><i class="fa fa-phone hidden-xs"></i></a> <a
						href="tel:+1888-888-8888" target="_blank"><i
						class="fa fa-phone hidden-lg hidden-md hidden-sm"></i></a>
                    {if $whitelabel_settings.translate}
					<span id="translation">
						<span id="google_translate_element"></span>
						<script type="text/javascript">
                            {literal}
                            function googleTranslateElementInit() {
                                new google.translate.TranslateElement({
                                        pageLanguage: 'en',
                                        layout: google.translate.TranslateElement.InlineLayout.SIMPLE
                                    },
                                    'google_translate_element');
                            };
                            {/literal}
						</script>
						<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
					</span>
					{/if}
				</div>

				{if $whitelabel_settings.facebook_url ||
				$whitelabel_settings.twitter_url ||
				$whitelabel_settings.instagram_url || $whitelabel_settings.tumblr_url}
				<h4 style="display: inline-block; margin-top: 0px;">Connect</h4>
				<div class="connect">
					<div>
					{if $whitelabel_settings.facebook_url} <a
						href="{$whitelabel_settings.facebook_url}"
						title="follow us on facebook" target="_blank"><i
						class="fa fa-facebook-square"></i></a>
					{/if}
					{if $whitelabel_settings.twitter_url}
					<a href="{$whitelabel_settings.twitter_url}" title="folow us on twitter"
						target="_blank"><i class="fa fa-twitter-square"></i></a>
					{/if}
					{if $whitelabel_settings.instagram_url}
					<a href="{$whitelabel_settings.instagram_url}"
						title="follow us on instagram" target="_blank"><i
						class="fa fa-instagram"></i></a>
					{/if}
					{if $whitelabel_settings.tumblr_url}
					<a href="{$whitelabel_settings.tumblr_url}"
						title="follow us on tumbler" target="_blank"><i
						class="fa fa-tumblr"></i></a>
					{/if}
					</div>
				</div>

				{/if}

			</div>
			<div class="col-sm-6 legal">
				<h4 style="padding-right: 160px;">Legal</h4>
				<p style="margin: 0;">All models appearing on this website are 18
					years or older.</p>
				<div>
					<a href="/2257/">18 U.S.C. 2257 Record
						Keeping Requirements Compliance Statement</a>
				</div>
				<div>
					<a href="/dmca/">DMCA Notice &amp; Copyright
						Infringement</a> | <a href="/terms/">Terms
						&amp; Conditions</a> | <a href="/privacy">Privacy
						Policy</a>
				</div>
				<div class="logos">
					<a onclick="wcc.rta()"><span class="rta"></span></a> <a
						onClick="wcc.asacp()"><span class="asacp"></span></a>
				</div>

				<br>
				<p>Copyright &copy; 2006 through {$smarty.now|date_format:"%Y"}
					{$whitelabel_settings.copyright_name}. All right reserved.</p>
				<div id="wl_logo_footer">
					<img src="{$whitelabel_images.logo.uri}" alt="{$whitelabel_settings.name}">

				</div>

			</div>
			<div class="clearfix"></div>

		</div>
	</div>
</div>
{/if}

<a href="#" class="back-to-top" style="display: none;"><i class="fa fa-arrow-circle-up"></i></a>
{if $SiteSettings.display_confirm_email eq "On" && $smarty.session.show_confirm_email.nag}
<form id="resend_email_conf" action="/api/members/settings.php?{$smarty.session.session_name}={$smarty.session.session_id}" method="post" enctype="multipart/form-data">
	<input type="hidden" name="member_id" value="{$smarty.session.userid}">
	<input type="hidden" name="{$smarty.session.session_name}" value="{$smarty.session.session_id}">
	<input type="hidden" name="request_type" value="{$Member.email}">
</form>
{/if}

<!-- Placed at the end of the document so the pages load faster -->
{include file="wcc3/components/javascripts.tpl" show=$show}
