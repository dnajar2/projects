<!-- loginModal -->
<div class="modal animated fadeIn" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" >
	<div class="modal-dialog-sm" role="document">
		<div class="modal-content">
			<div class="modal-header navbar-inverse">
				<h1 class="modal-title"><span id="member_type" class="member_type"></span> {if $loading_landing_page}Member{/if} Login</h1>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<i class="fa fa-times fa-1x"></i>
				</button>
			</div>
			<div id="login" class="modal-body">
				<div class="log-in">
					<div id="login_error" class="alert alert-danger alert-dismissible hide" role="alert">
						<span id='login_error_msg'></span>
					</div>
					<div id="modal_body"  style="padding: 10px">
					<form name="loginform" method="POST" id="loginform" action="/api/verifylogin.php?{$smarty.session.session_name}={$smarty.session.session_id}" enctype="application/x-www-form-urlencoded" onsubmit="wcc.login(event);">
						<input type="hidden" name="show" value="login">
						<input type="hidden" name="themeId" value="{$whitelabel_themes.id}">
						<input type="hidden" id="login_type" name="login_type" value="{if $lp_v3}member{/if}">
						<div class="form-group">
							<label class="sr-only" for="userName">username</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-2x fa-user"></i></div>
								<input type="text" class="form-control login-inputs" id="username" name="username" placeholder="username"{if $smarty.cookies.member_login} value="{$smarty.cookies.member_login}"{/if}>
							</div>
						</div>
						<div class="form-group">
							<label class="sr-only" for="password">password</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-2x fa-lock"></i></div>
								<input type="password" class="form-control login-inputs" id="password"
									   name="password" placeholder="password" autocomplete>
							</div>
						</div>
                        <div class="formElm" style="background-color: transparent; color: #fff; padding-left: 0; position: relative">
                            <label class="checkbox-inline">
                                <input type="checkbox" id="remember-me" name="remember me"{if $smarty.cookies.member_login} checked{/if}> <span></span>
                                &nbsp;
                            </label>
                            <p style="position: absolute; z-index: 1; top: -1px; left: 25px;">Remember me</p>
                        </div>
                        <div class="log-in-fields">
							<div class="login-btn">
								<button type="submit" id='login-button' class="login-button btn-primary button-2">
									Login
								</button>
							</div>
							<div class="forgotpass col-xs-5">
                                {if !$loading_landing_page}
								    <i class="fa fa-info-circle"></i><a id="idForgotPassword" href="#" data-toggle="modal" data-dismiss="modal" data-target="#resetModal">Forgot Password?</a>
                                    {else}
                                    <i class="fa fa-info-circle"></i><a id="idForgotPassword" href="#" data-dismiss="modal" data-target="#resetModal">Forgot Password?</a>
                                {/if}
							</div>
							{if ! $smarty.session.__logged_in && !$loading_landing_page}
							<div class="col-xs-7" style="text-align: right; display: block" >
								<span class="primary-color">Login as</span>
								<spand>
									<a {if $whitelabel_settings.model_login}href="{$whitelabel_settings.model_login}" target="_self" rel="nofollow"{else}href="#" onclick="whatAmI('model')" {/if} class="linkplain">Model</a>
									<span class="primary-color">|</span>
								</spand>
								<span>
									<a {if $whitelabel_settings.studio_login}href="{$whitelabel_settings.studio_login}" target="_self" rel="nofollow"{else}href="#" onclick="whatAmI('manager')"{/if} class="linkplain">Manager</a>
								</span>
								<span style="display:none">
									<span class="primary-color">|</span>
									<a href="#" onclick="whatAmI('member')" class="linkplain"  >Member</a>
								</span>

							</div>
							{/if}
							<div class="clearfix"></div>
						</div>
					</form>
					</div>
					<div id="type_member" class="text-center" style="display:none">
						<hr>
						<p class="non-member">Not A <span class="member_type"></span> yet?</p>
						<span id="closeModal" data-toggle="modal" data-dismiss="modal" data-target="#joinModal" style="margin-left:2px;">{if $signup_message}{$signup_message}{else}FREE Signup and FREE Credits!{/if}</span>
					</div>
					<div id="type_model" class="text-center" style="display:none; background-color:#f0f2f5; border-radius: 0 0 4px 4px;">
						<p class="non-member ">Not A <span class="member_type"></span> yet?</p>
						<a class="btn btn-default" href="/models/register.php" target="_blank" style="width: 60% !important; margin-bottom:20px;">Join Us Now!</a>
						<div class="clearfix"></div>
					</div>
					<div id="type_manager" class="text-center" style="display:none; background-color:#f0f2f5; border-radius: 0 0 4px 4px;">
						<p class="non-member ">Not A <span class="member_type"></span> yet?</p>
						<a class="btn btn-default" href="/?c2hvdz1yZWdpc3Rlcl9zdHVkaW9z" target="_blank" style="width: 80% !important; margin-bottom:20px;">Become a Studio Manager!</a>
						<div class="clearfix"></div>
					</div>
					<div style="clear:both;"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- rest passsword -->
<div class="modal" id="resetModal" tabindex="-1" role="dialog" aria-labelledby="resetModalLabel" >
	<div class="modal-dialog-sm" role="document">
		<div class="modal-content">
			<div class="modal-header navbar-inverse">
				<h1 class="modal-title">Retrieve <span class="member_type"></span> Password</h1>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div style="height:300px;" class="log-in" >
					<!-- form -->
					<div id="pw_retrieve_error" class="alert alert-danger alert-dismissible hide" role="alert">
						<span id='pw_error_msg'></span>
					</div>
					<form id="password_retrieve" name="password_retrieve" method="POST" action="/api/reminder.php" enctype="application/x-www-form-urlencoded" onsubmit="wcc.passwordRetrieve(event);">
						<input type="hidden" id="pwd_type" name="type" value="">
						<input type="hidden" id="grecaptcha_key" name="grecaptcha_key" value="{$google_captcha_form_key}">
						<div class="form-group">
							<label class="sr-only" for="email">email</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-2x fa-envelope"></i></div>
								<input type="text" class="form-control login-inputs" id="passwordRetrieve" name="passwordRetrieve" placeholder="Account Email" >
							</div>
						</div>
						<div class="g-recaptcha" data-sitekey="6Le85R0TAAAAAM6cUYzuXCqK1VwEHHNQibm30Yvv"></div>
						<ul class="log-in-fields">
							<li>
								<button type="submit" id="retrieve-pwd-button" class="login-button button-2">
									Submit
								</button>
							</li>
						</ul>
					</form>
					<!-- end of form -->
					<div style="clear:both;"></div>
				</div>
			</div>
		</div>
	</div>
</div>
