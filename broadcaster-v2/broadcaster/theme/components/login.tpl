<div id="model-lp">
    <div id="login-register">
        <div id="login-container">
            <div id="login-form">
                <form name="model-login" method="POST" id="loginform" action="/api/verifylogin.php?{$smarty.session.session_name}={$smarty.session.session_id}" enctype="application/x-www-form-urlencoded" onsubmit="wcc.login(event);">
                    <input type="hidden" id="login_type" name="login_type" value="model">
                    <h2 class="text-center">Model Login</h2>
                    <!-- <p class="text-center">Model Login</p> -->
                    <p><br></p>
                    <p id="login-error" class="alert alert-danger" style="display: none"></p>
                    <div class="form-group">
                        <input class="form-control" type="text" id="username" name="username" placeholder="User Name" autocomplete="username" {if $smarty.cookies.model_login}value="{$smarty.cookies.model_login}"{/if}>
                        <span class="focus-border"></span>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="password" id="password" name="password" placeholder="Password" autocomplete="current-password">
                        <span class="focus-border"></span>
                    </div>
                    <div class="row">
                        <div id="remember-me-checkbox" class="row col-sm-12">
                            <div class="col-sm-6 text-left">
                                <label for="remember-me" class="fancy-checkbox">
                                    <input type="checkbox" id="remember-me" name="remember me"{if $smarty.cookies.model_login} checked{/if}>
                                    <i class="fa fa-square-o unchecked"></i>
                                    <i class="fa fa fa-check-square-o checked"></i>
                                    remember me
                                </label>
                            </div>
                            <div class="col-sm-6 text-right pointer" onclick="utils.toggle('login-form','reset-form')">
                                <i class="fa fa-lock text-secondary"></i> Forgot pwd?
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <button type="button" class="btn btn-lg btn-block text-uppercase waves-effect waves-light button-2" id='login-button' onclick="wcc.login(event)">
                                <i class="fa fa-refresh fa-spin" aria-hidden="true" style="display: none"></i>
                                <i class="fa fa-sign-in" aria-hidden="true"></i> Login
                            </button>
                            {* for new registration *}
                            {*<p class="text-center" style="padding-top: 15px;" onclick="utils.toggle('login-form','register-form')">Don't have an account? <span class="pointer text-primary">Sign Up</span></p>*}
                            <p class="text-center" style="padding-top: 15px;">Don't have an account? <span class="pointer text-primary"><a href="/model/join">Sign Up</a></span></p>
                        </div>
                    </div>
                </form>
            </div>
            <!-- Reset password -->
            <div id="reset-form" style="display: none;">
                <form id="pass-reset" action="/api/models/resetPass.php" method="post">
                    <h2 class="text-center">Recover Password</h2>
                    <p>Enter your Email and instructions will be sent to you!</p>
                    <p id="pass-reset-error" class="alert alert-danger" style="display: none"></p>
                    <div class="row">
                        <div class="col-sm-12 form-group">
                            <input type="text" name="email" id="passRecover" class="form-control" placeholder="email">
                        </div>
                        <br>
                        <div class="col-sm-12">
                            <button type="button"
                                id="btnResetPass"
                                class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light"
                                onclick="utils.recoverPassword('#pass-reset'); $(this).find('.fa').removeClass('hide')"
                                disabled>Reset <i class="fa fa-refresh fa-spin hide"></i>
                            </button>
                            <hr>
                            {$whitelabel_settings.login_message}

                            <p class="text-right pointer" onclick="utils.toggle('reset-form','login-form')"><i class="fa fa-sign-in" aria-hidden="true"></i> Model Login</p>
                        </div>
                    </div>

                </form>
            </div>
            <!-- Register Form -->
            <div id="register-form" style="display: none;">
                <form id="email-register" action="">
                    <h2 class="text-center">Sign Up Today</h2>
                    <p>Enter your Email and instructions will be sent to you!</p>
                    <p id="register-error" class="alert alert-danger" style="display: none"></p>
                    <div class="row">
                        <div class="col-sm-12 form-group">
                            <input type="text" name="reset" class="form-control" placeholder="email">
                        </div>
                        <br>
                        <div class="col-sm-12">
                            <button type="submit"
                                class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light"
                                onclick="utils.signUp('#email-register')"
                            >Sign Up</button>
                            <hr>
                            <p class="text-right pointer" onclick="utils.toggle('register-form','login-form')"><i class="fa fa-sign-in" aria-hidden="true"></i> Model Login</p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

