{include file="wcc3/components/html_header.tpl" show=$show}

<body>
{include file="wcc3/components/header.tpl" show=$show}

<div class="page-header container-fluid" ><!-- page header -->
	<div class="title my-account-title">Frequently Asked Questions</div>

</div> <!-- end of page hader -->

 <!-- top row -->
<div id="faq" class="container-fluid section_light">
	<div class="description animated fadeIn">Welcome to {$whitelabel_settings.name} FAQ's. Our customer support team has assembled a number of the most frequently asked questions. If you don't find an answer to one of your questions here, contact our customer service department using the <a href="/?{'show=contact'|base64_encode}">Support </a>page.</div>

	<!-- start of FAQ -->
 	<section id="faq_section">
 	<div class="animated slideInLeft col-lg-5 col-md-6 col-lg-offset-1">
		<h3>General Questions</h3>
		<!-- start of accordion -->
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			<div class="panel panel-default"><!-- panel start -->
				<div class="panel-heading" role="tab" id="headingOne">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
							<i class="moveRight glyphicon glyphicon-plus"></i><div>What is {$whitelabel_settings.name}?</div>
						</a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">
						<p>We're the "Live Webcam Community"! If you're looking for a hot and sexy webcam experience then you've come to the right place! Here you can interact with hundreds of beautiful cam models from around the world. Have one-on-one private cam2cam sessions where anything goes. Live your wildest fantasies in this feature-rich cam experience. These aren't your typical internet videos, we're talking about a live experience with some very sexy women. Come and join all the fun! You won't be disappointed!</p>
					</div>
				</div>
			</div><!-- panel end -->

			<div class="panel panel-default"><!-- panel start -->
				<div class="panel-heading" role="tab" id="headingTwo">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
							<i class=" moveRight glyphicon glyphicon-plus"></i><div>Is your site secure? </div>
						</a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					<div class="panel-body">
						<p>Yes every single transaction is secured using high grade encryption. Your personal information stays safe so you can relax and enjoy the experience.</p>
					</div>
				</div>
			</div><!-- panel end -->

			<div class="panel panel-default"><!-- panel start -->
				<div class="panel-heading" role="tab" id="headingThree">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
							<i class=" moveRight glyphicon glyphicon-plus"></i><div>What is the Recorded Shows</div>
						</a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
					<div class="panel-body">
						<p>In the Recorded Shows you will find hundreds of recorded shows for your viewing pleasure. These are special shows recorded for this purpose only. These models know how to put on a good show and they do it well! With a great viewing price they're sure to please.</p>
					</div>
				</div>
			</div> <!-- panel end -->

			{if ! $Member.is_auth_billing}
			<div class="panel panel-default"><!-- panel start -->
				<div class="panel-heading" role="tab" id="headingFour">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
							<i class=" moveRight glyphicon glyphicon-plus"></i><div>How do I cancel my membership?</div>
						</a>
					</h4>
				</div>
				<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
					<div class="panel-body">
						<p>If you would like to cancel your membership please <a href="/?c2hvdz1jb250YWN0JnN1YmplY3Q9OA==">click here</a> (you must be logged into the site with your paid account).</p>
					</div>
				</div>
			</div> <!-- panel end -->

			<div class="panel panel-default"><!-- panel start -->
				<div class="panel-heading" role="tab" id="headingFive">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
							<i class=" moveRight glyphicon glyphicon-plus"></i><div>What are the Membership levels and their meaning?</div>
						</a>
					</h4>
				</div>
				<div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
					<div class="panel-body">
						<p>There are several different membership options to choose from.</p>
						<p>Platinum Membership - $39.95 / 45 credits (15% Savings!!!)<br>
						Gold Membership - $29.95 / 30 credits<br>
						Silver Membership - $24.95 / 25 credits</p>
					</div>
				</div>
			</div> <!-- panel end -->

			<div class="panel panel-default"><!-- panel start -->
				<div class="panel-heading" role="tab" id="headingSix">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
							<i class=" moveRight glyphicon glyphicon-plus"></i><div>Why should I upgrade to a Membership?</div>
						</a>
					</h4>
				</div>
				<div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
					<div class="panel-body">
						<p>One of the main reasons to upgrade to a Membership is the savings! Members save a great deal by becoming a member and can continue to enjoy new girls every month when they receive credits. Don't miss out on these savings and continue to enjoy these awesome live shows. Sign up today!</p>
					</div>
				</div>
			</div> <!-- panel end -->
			{/if}
            {if ! $smarty.const.FEATURESHOWS_DISABLED}
			<div class="panel panel-default"><!-- panel start -->
				<div class="panel-heading" role="tab" id="headingSeven">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
							<i class=" moveRight glyphicon glyphicon-plus"></i><div>What happens if I miss a show I bought a ticket for?</div>
						</a>
					</h4>
				</div>
				<div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
					<div class="panel-body">
						<p>Your ticket is still good and can be redeemed on any future scheduled shows.</p>
					</div>
				</div>
			</div> <!-- panel end -->

			<div class="panel panel-default"><!-- panel start -->
				<div class="panel-heading" role="tab" id="headingEight">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
							<i class=" moveRight glyphicon glyphicon-plus"></i><div> What if the feature show I bought a ticket for is canceled?</div>
						</a>
					</h4>
				</div>
				<div id="collapseEight" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingEight">
					<div class="panel-body">
						<p>Your ticket will still be valid and you can watch any other featured show of your choice. If you prefer your ticket can be refunded at your request.</p>
					</div>
				</div>
			</div> <!-- panel end -->

			<div class="panel panel-default"><!-- panel start -->
				<div class="panel-heading" role="tab" id="headingNine">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
							<i class=" moveRight glyphicon glyphicon-plus"></i><div>How long is the feature show ticket good for?</div>
						</a>
					</h4>
				</div>
				<div id="collapseNine" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingNine">
					<div class="panel-body">
						<p>Once you purchase a ticket it is good for life. You can use your ticket on any featured show you would like.</p>
					</div>
				</div>
			</div> <!-- panel end -->
            {/if}
			<div class="panel panel-default"><!-- panel start -->
				<div class="panel-heading" role="tab" id="headingTen">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
							<i class=" moveRight glyphicon glyphicon-plus"></i><div>How do I cancel my free account?</div>
						</a>
					</h4>
				</div>
				<div id="collapseTen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTen">
					<div class="panel-body">
						<p>If you're not a paying member of the site and would like to cancel your free account you can do so by clicking here. (you must be logged into the site with your free account)</p>
					</div>
				</div>
			</div> <!-- panel end -->

			<div class="panel panel-default"><!-- panel start -->
				<div class="panel-heading" role="tab" id="headingEleven">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven" aria-expanded="false" aria-controls="collapseEleven">
							<i class=" moveRight glyphicon glyphicon-plus"></i><div>What are coupon codes?</div>
						</a>
					</h4>
				</div>
				<div id="collapseEleven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingEleven">
					<div class="panel-body">
						<p>Coupon codes are promotional codes you enter when purchasing that will automatically give you additional (free) credits. Please note that you can only use a given coupon code once for your account.</p>
					</div>
				</div>
			</div> <!-- panel end -->
		</div>
	</div>

	<div class="animated slideInRight col-lg-5 col-md-6">
 		<h3>Member Questions</h3>
		<!-- strat of second accordion -->
		<div class="panel-group" id="accordion2" role="tablist" aria-multiselectable="true">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingTwelve">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwelve" aria-expanded="false" aria-controls="collapseTwelve">
							<i class=" moveRight glyphicon glyphicon-plus"></i><div>I'm not getting my password or other emails?</div>
						</a>
					</h4>
				</div>
				<div id="collapseTwelve" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwelve">
					<div class="panel-body">
						<p>Click on your email provider:
							<ul>
								<li><a role="button" data-toggle="collapse" href="#gmail" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-at"></i>  Gmail</a>
									<div class="collapse" id="gmail">
										<div>
											<ol>
												<li>From your mailbox screen, CLICK on Contacts.</li>
												<li>Click on the Create Contact link.</li>
												<li>Add billing@webcamclub.com in the Email input area and then CLICK the Save button.</li>
												<li>Finished! Messages from this sender will now be delivered straight to your inbox.</li>
												<li>Repeat steps 2 &amp; 3 for the following email addresses:
													<ul>
														<li>support@webcamclub.com</li>
													</ul>
												</li>
										</ol>
										</div>
									</div>
								</li>
								<li><a role="button" data-toggle="collapse" href="#hotmail" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-at"></i>  Hotmail</a>
									<div class="collapse" id="hotmail">
										<div>
											<ol>
												<li>Choose "Options" at the upper right of your inbox screen.</li>
												<li>Choose the first mail option, "Junk E-Mail Protection".</li>
												<li>Choose the link, "Safe List".</li>
												<li>Type "www.webcamclub.com" in the address box.</li>
												<li>Click the Add button.</li>
											</ol>
										</div>
									</div>
								</li>
								<!-- end of hotmail -->
								<li><a role="button" data-toggle="collapse" href="#yahoo" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-at"></i> Yahoo</a>
									<div class="collapse" id="yahoo">
										<div>
											<ol>
												<li>From your Inbox, select "Add Contact" from the "Addresses" pull-down menu.</li>
												<li>Fill out the "Email" field with the email address from which you'd like to receive mail.</li>
												<li>Choose "Save", then "Done."</li>
												<li>Repeat steps 2 &amp; 3 for the following email addresses:
													<ul>
														<li>billing@webcamclub.com</li>
														<li>support@webcamclub.com</li>
													</ul>
												</li>
											</ol>
										</div>
									</div>
								</li>
								<!-- end of yahoo -->
								<li><a role="button" data-toggle="collapse" href="#aol" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-at"></i> AOL</a>
									<div class="collapse" id="aol">
										<div>
											<ol>
												<li>In your AOL Mailbox, choose the Mail Tab menu, then select "Address Book."</li>
												<li>Choose "Add Icon," which is located at the bottom of the pop-up window.</li>
												<li>Fill out the "Other - Email" field with the email address from which you'd like to receive mail.</li>
												<li>Click the "Primary Email" box. Repeat steps 2 through 4 for these email addresses:
													<ul>
														<li>billing@webcamclub.com</li>
														<li>support@webcamclub.com</li>
													</ul>
												</li>
											</ol>
										</div>
									</div>
								</li>
								<!-- end of AOL -->
								<li><a role="button" data-toggle="collapse" href="#msn" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-at"></i> MSN</a>
									<div class="collapse" id="msn">
										<div>
											<ol>
												<li>Choose the "Junk E-mail" link at the bottom left of your inbox.</li>
												<li>Select the third Guard Settings link: "Safe List".</li>
												<li>Enter the email address from which you'd like to receive mail in the "Email" field of the pop-up window.</li>
												<li>Click Save.</li>
												<li>Repeat steps 3 &amp; 4 for the following email addresses:
										 			<ul>
														<li>billing@webcamclub.com</li>
														<li>support@webcamclub.com</li>
													</ul>
												</li>
											</ol>
										</div>
									</div>
								</li>
								<!-- end of MSN -->
								<li><a role="button" data-toggle="collapse" href="#outlook" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-at"></i> Microsoft Outlook</a>
									<div class="collapse" id="outlook">
										<div>
											<ol>
												<li>On the Tools menu, click Options.</li>
												<li>On the Preferences tab, under E-mail, click Junk E-mail.</li>
												<li>Click the Safe Senders or Safe Recipients tab.</li>
												<li>Click Add.</li>
												<li>Type "www.webcamclub.com" in the address box.</li>
												<li>Click the OK button.</li>
											</ol>
										</div>
									</div>
								</li>
								<!-- end of MS Outlook -->
								<li><a role="button" data-toggle="collapse" href="#isp" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-at"></i> Other ISP</a>
									<div class="collapse" id="isp">
										<div>
											<ol>
												<li>Add the following addresses to any address books or safe lists with your email service provider:
													<ul>
														<li>billing@webcamclub.com</li>
														<li>support@webcamclub.com</li>
													</ul>
												</li>
												<li>It's a good idea to routinely check your spam, junk and blocked email folders to see if any WebCamClub.com messages were routed there by mistake.</li>
											</ol>
										</div>
									</div>
								</li>
								<!-- end of other ISP -->
							</ul>
						</p>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingThirteen">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion2" href="#collapseThirteen" aria-expanded="false" aria-controls="collapseThirteen">
							<i class=" moveRight glyphicon glyphicon-plus"></i><div>Forgot your login or password?</div>
						</a>
					</h4>
				</div>
				<div id="collapseThirteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThirteen">
					<div class="panel-body">
						<p>If you have misplaced or can't find your login/password simply click on the "Forgot Password" link on the front page next to the login button. Enter your email address and submit. You should receive your login and password via the email address you provided. If you still have trouble receiving your password please contact support by clicking on the "Support" link at the bottom of the page.</p>
					</div>
				</div>
			</div>
			<div class="panel panel-default"><!-- panel start -->
				<div class="panel-heading" role="tab" id="headingFourteen">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion2" href="#collapseFourteen" aria-expanded="false" aria-controls="collapseFourteen">
							<i class=" moveRight glyphicon glyphicon-plus"></i><div>What kind of live shows are avaible?</div>
						</a>
					</h4>
				</div>
				<div id="collapseFourteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFourteen">
					<div class="panel-body">
						<p>Currently we offer private shows with various women that can be cam2cam or if you prefer just the model doing the show for you. We have lots of women to choose from and they all have special talents to spark your interest.</p>
					</div>
				</div>
			</div> <!-- panel end -->
			<div class="panel panel-default"><!-- panel start -->
				<div class="panel-heading" role="tab" id="headingFiveteen">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion2" href="#collapseFiveteen" aria-expanded="false" aria-controls="collapseFiveteen">
							<i class=" moveRight glyphicon glyphicon-plus"></i><div>How do I contact your customer service department?</div>
						</a>
					</h4>
				</div>
				<div id="collapseFiveteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFiveteen">
					<div class="panel-body">
						<p>If you have a question or support issue please contact support by clicking the <a href="/?c2hvdz1jb250YWN0">"Suport"</a> link at the bottom of the page and choose your topic. We will get back to you as soon as possible.</p>
					</div>
				</div>
			</div> <!-- panel end -->
			<div class="panel panel-default"><!-- panel start -->
				<div class="panel-heading" role="tab" id="headingSixteen">
					<h4 class="panel-title">
						<a role="button" data-toggle="collapse" data-parent="#accordion2" href="#collapseSixteen" aria-expanded="True" aria-controls="collapseSixteen">
							How do i submit a suggestion or comment? <i class=" moveRight glyphicon glyphicon-plus"></i>
						</a>
					</h4>
				</div>
				<div id="collapseSixteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSixteen">
					<div class="panel-body">
						<p>If you have a suggestion or comment please contact support by clicking the <a href="/?c2hvdz1jb250YWN0JnN1YmplY3Q9MTM=">"Support"</a> link at the bottom of the page and choose your topic. Suggestions and comments are always welcome as we strive to provide the very best in your user experience.</p>
					</div>
				</div>
			</div> <!-- panel end -->
		</div>
	</div>
	<div class="clearfix"></div>
	</section>
	<div class="clearfix"></div>
</div> <!-- end of row // -->

{include file="wcc3/components/footer.tpl" show=$show}

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
{literal}
<script>
$(function(){
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

$(document).ready(function(){
	$('#container').each(function(idx,el){
		el.style.marginTop='';
	});
});
//Safari
if (navigator.userAgent.indexOf('Safari') != -1 && navigator.userAgent.indexOf('Chrome') == -1) {
	$('.element_holder').addClass('safari');
	$('.status').css("font-weight","bolder");
	$('.overlay1 .col-lg-12').css("font-weight","bolder !important");
}

$(document).ready(function(){
	$('#drop-down .dropdown-toggle').on("click", function(e){
		$(this).next('ul').toggle();
		e.stopPropagation();
		e.preventDefault();
	});

	$(function(){
		$('#cat li  i').on('click', function() {
			$("li  i.caret").removeClass("caret");
			$(this).addClass('caret');
		});
	});
});

$(function(){
	$('#joinModal').find('a').on('click', function(){
		$('.modal').modal('hide');
	});
});

$("#drop-down2").find('a').on('click', function(){
	$('#mobil-cat-menu').toggleClass('cat-menu joinbtn')
});

$('#faq  a').click(function(f){
	$(this).next('a').slideToggle('500');
	$(this).find('i').toggleClass('glyphicon-plus glyphicon-minus');
});
$('a#trigger').on('click', function(){
	$('.dropdown-menu ').slideToggle()
});

new WOW().init();
</script>
{/literal}

</body>

{include file="wcc3/components/html_footer.tpl" show=$show}