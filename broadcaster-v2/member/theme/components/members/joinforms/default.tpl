<!-- joinModal -->
<div class="modal animated fadeIn" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="joinModalLabel" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modalgirl"></div>
			<div class="modal-header navbar-inverse">
				<h1 class="modal-title">Join For FREE</h1>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<i class="fa fa-times fa-1x"></i>
				</button>
			</div>
			<div id="close-modal" class="modal-body ">
				<div class="modalgirl-sm show primary-color"><h5>Unlimited Free Chat</h5></div>
				<h4>+6 FREE CREDITS !</h4>
				<div id="branded"></div>
				<div class="modal-form">
					<div id="register_error" class="alert alert-danger alert-dismissible hide" role="alert">
						<span id='register_error_msg'></span>
					</div>
					<form id="member_register" name="member_register" method="POST" action="/api/members/register.php?{$smarty.session.session_name}={$smarty.session.session_id}" enctype="application/x-www-form-urlencoded" onsubmit="wcc.registerMember(event);">
						<input type="hidden" id="register_type" name="register_type" value="member">
						<div class="form-group">
							<label class="sr-only" for="register_username">username</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-2x fa-user"></i></div>
								<input type="text" class="form-control" id="register_username" name="register_username" placeholder="username">
							</div>
						</div>
						<div class="form-group">
							<label class="sr-only" for="register_password">password</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-2x fa-lock"></i></div>
								<input type="password" class="form-control" id="register_password"
									   name="register_password" placeholder="password" autocomplete="current-password" >
							</div>
						</div>
						<div class="form-group">
							<label class="sr-only" for="register_email">email</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-2x fa-envelope"></i></div>
								<input type="text" class="form-control" id="register_email" name="register_email" placeholder="email" autocomplete="email">
							</div>
						</div>
						<ul class="fields">
							<li>
								<div class="terms">
									<div class="squaredThree">
										<input type="checkbox" value="0" id="register_terms" name="register_terms"  />
										<label for="register_terms"></label>
									</div>
									<div class="theTerms"> I acknowledge that I am 18+ years old, read, understood
										and accepted - {$whitelabel_settings.name}'s <span>Terms &amp; Conditions.
										</span> Additionally, I agree to receive exclusive email offers and promotions. To manage your marketing choices please access the user settings page or contact customer support.</div>
								</div>
							</li>
							<li>
								<button type="submit" id="member-register-button" class="btn btn-primary btn-info button-2">Join For FREE</button>
								<div class="mobile-sep"></div>
							</li>
							<li>
								<p>Already A Member? <a href="#" data-toggle="modal" data-target="#loginModal" style="margin-left:2px;" onclick="$('#login_type').val('member');$('#member_type').text('Member')"> LOGIN</a></p>
							</li>
						</ul>
					</form>
					<div style="clear:both;"></div>
				</div>
			</div>
		</div>
	</div>
</div>
