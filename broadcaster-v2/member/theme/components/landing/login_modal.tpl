<!-- modals -->
<div class="modal fade" id="user_login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header navbar-inverse">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Member Login</h4>
            </div>
            <form name="memberLogin" method="POST" id="memberLogin"
                  action="/members/?{$__session_name}={$__session_id}"
                  enctype="application/x-www-form-urlencoded">
                <input type="hidden" name="show" id="show" value="login_application" />
                <div class="modal-body">

                    <div id="warning_div" class="alert alert-warning" {if empty($smarty.get.le)}style="display: none"{/if}>
                        {if !empty($smarty.get.le)}<span class="login_errors">Invalid Username/Password!</span>{/if}
                    </div>
                    <div class="form-group">
                        <input name="login" type="text" id="username" class="form-control" autocomplete="off" placeholder="User name">
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" id="password" class="form-control" autocomplete="off" placeholder="Password">
                    </div>
                </div>
                <div class="modal-footer">
                    <div id="forgot_pass" class="col-xs-12 text-center">
                        <a href="/members/?{'show=forgot_password'|base64_encode}" class="forgot">Forgot your password?</a>
                    </div>

                    <div id="modal_footer_btn" class="col-xs-6">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                    <div class="col-xs-6">
                        <input type="hidden" name="sie" value="{$sie}">
                        <button type="submit" class="btn btn-primary button-2">Login</button>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </form>
        </div>
    </div>
</div>
