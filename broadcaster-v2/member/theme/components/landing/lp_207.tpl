<!--suppress ALL -->
<div id="content_204">
    <div id="slogan-xs" class="col-lg-6 col-sm-9 no-padding">

        LOOKING FOR LIVE
        <span class="green primary-color"><span class="neutral-clr">SEX</span> FROM HOME?</span>

    </div>
    <div class="col-lg-4 col-sm-6 col-lg-offset-7 col-sm-offset-6">
        <div id="form_204">
            <h2 class="form-title primary-bg-color">
                {$form_title}
            </h2>
            <form id="lp_207" name="application" method="POST" action="/api/members/register.php?{$smarty.session.session_name}={$smarty.session.SessionID}" enctype="application/x-www-form-urlencoded" autocomplete="off">
                <input name="show" id="id_show" value="register_application" type="hidden">
                <input name="type" value="member" type="hidden" />

                    <input name="track_joinform" id="id_track_joinform" value="{if $skin_id}{$skin_id}{elseif $track_joinpage}{$track_joinpage}{else}default_joinpage{/if}" type="hidden" />
                    <input name="joinpage" id="id_joinpage" value="{if $track_joinpage}{$track_joinpage}{else}{$smarty.session.joinpage}{/if}" type="hidden" />

                <input name="{$smarty.session.session_name}" id="id_{$smarty.session.session_name}" value="{$smarty.session.SessionID}" type="hidden" />
                {if !$display_confirm_email}
                    <input id="id_cemail" name="cemail" type="hidden" value="{$form.cemail}" />
                {/if}
                {if $hide_country_select}
                    <input type="hidden" name="country" id="id_country_hidden" value="{$smarty.session.geoip_record.country_id}" />
                {/if}
                {if $additional_values}
                    {foreach from=$additional_values key=k item=i }
                        <input type="hidden" name="{$k}" val="{$i}"/>
                    {/foreach}
                {/if}
                {if $wccJoinIsAjax || $ajaxified || $exit_pop_joinpage}
                    <input name="ajax" id="id_ajax" value="1" type="hidden" />
                {/if}
                {if !$display_confirm_email}
                    <input name="hide_confirm_email" id="hide_confirm_email" value="1" type="hidden" />
                {/if}

                <div class="col-sm-12 ">
                    <!-- email-->
                    <div id="email_container" class="form-group">
                        {if !$hide_labels}
                            <label for="id_email" class="small-label" >Email:</label>
                        {/if}
                        <input id="id_email" class="form-control" type="email" name="email" value="{$form.email}" autofocus
                               title="Please enter a valid email address"
                               placeholder="Email"
                               onkeydown="wccJoin.show_processing(event, this.id);"
                               onkeyup="wccJoin.doValidate(event, this);"
                               onblur="wccJoin.notify(event, this);"

                        />
                        <div class="icon" style="display: none">
                            <i class="fa"></i>
                        </div>
                        <div class="input_state" id="id_email_input_state"></div>
                        <div id="id_email_msg" class="{if $p_error.email}error_box msg_show{else}msg_hide{/if}">
                            <div id="id_email_msg_text" class="msg_text">{$p_error.email}</div>
                            <div class="clear_both"></div>
                        </div>
                        <div class="clearfix"></div>
                    </div><!-- end of email -->

                    {if $display_confirm_email}
                        <div id="confirm_email_container" class="form-group">
                            {if !$hide_labels}
                                <label for="id_cemail" >Confirm Email:</label>
                            {/if}
                            <input id="id_cemail" class="form-control" type="email" name="cemail" size="28" value="{$form.email}"
                                   title="Please confirm your email address"
                                   placeholder="Confirm Email"
                            />
                            <div id="id_cemail_input_state" class="input_state"></div>
                            <div id="id_cemail_msg" class="{if $p_error.cemail}error_box msg_show{else}msg_hide{/if}" >
                                <div id="id_cemail_msg_text" class="msg_text">{$p_error.cemail}</div>
                                <div class="clear_both"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    {/if}
                    <!-- user name -->
                    <div id="uname_container" class="form-group">
                        {if !$hide_labels}
                            <label for="id_uname" class="small-label" >Username:</label>
                        {/if}
                        <input id="id_uname" class="form-control" type="text" name="username" size="28" maxlength="30" value="{$form.uname}"
                               title="Please enter a username; a-zA-Z0-9; 5-25 in length"
                               placeholder="Username"
                               onkeydown="wccJoin.show_processing(event, this.id);"
                               onkeyup="wccJoin.doValidate(event, this);"
                               onblur="wccJoin.notify(event, this);"
                        />
                        <div class="icon" style="display: none">
                            <i class="fa"></i>
                        </div>
                        <div id="id_uname_input_state" class="input_state"></div>
                        <div class="clear_both"></div>
                        <div class="{if $p_error.uname}error_box msg_show{else}msg_hide{/if}" id="id_uname_msg">
                            <div class="msg_text" id="id_uname_msg_text">{$p_error.uname}</div>
                            <div class="clear_both"></div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <!-- password -->
                    {if 1==1 || $display_password_input}
                        <div id="password_container" class="form-group">
                            {if !$hide_labels}
                                <label for="id_pwd" class="small-label">Password:</label>
                            {/if}
                            <input id="id_pwd" class="form-control" type="password" autocomplete="off" name="password" size="28" maxlength="32"
                                   title="Password must be between {$smarty.const.MEMBER_PASSWORD_MIN_CHAR} and {$smarty.const.MEMBER_PASSWORD_MAX_CHAR} characters."
                                   placeholder="Password"
                                   onkeydown="wccJoin.show_processing(event, this.id);"
                                   onkeyup="wccJoin.doValidate(event, this);"
                                   onblur="wccJoin.notify(event, this);"
                            />
                            <div class="icon" style="display: none">
                                <i class="fa"></i>
                            </div>
                            <div class="input_state" id="id_pwd_input_state"></div>
                            <div class="{if $p_error.pwd}error_box msg_show{else}msg_hide{/if}" id="id_pwd_msg">
                                <div class="msg_text" id="id_pwd_msg_text">{$p_error.pwd}</div>
                                <div class="clear_both"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    {/if}
                </div>
                <div class="col-sm-12 no-padding">
                    {if !$hide_country_select}
                        <div id="country_container" class="">
                            {if !$hide_labels}
                                <label for="id_country" >Country:</label>
                            {/if}
                            <div id="country_inner_container">
                                <select id="id_country" name="country" idx="3" class="form_input">
                                    {if !$form.country || $form.country == ""}
                                        {if $_CONFIG.SITE.COBRAND.countryID}
                                            {assign var='form_country' value=$_CONFIG.SITE.COBRAND.countryID}
                                        {else}
                                            {assign var='form_country' value=$smarty.session.geoip_record.country_id}
                                        {/if}
                                    {else}
                                        {assign var='form_country' value=$form.country}
                                    {/if}
                                    {html_options selected=$form_country options=$countries}
                                </select>
                            </div>
                            <div id="id_country_input_state" class="input_state"></div>
                            <div id="id_country_msg" class="{if $p_error.country}error_box msg_show{else}msg_hide{/if}">
                                <div  id="id_country_msg_text" class="msg_text">{$p_error.country}</div>
                                <div class="clear_both"></div>
                            </div>
                        </div>
                    {/if}

                    {if !$hide_birthday}
                        <div id="dob_container">
                            {if !$hide_labels}
                                <div id="dob_label" class="col-sm-3">
                                    <label for="birthday_Month" >Date of Birth:</label>
                                </div>
                            {/if}
                            <div id="dob-select">
                                <div class="col-xs-4">
                                    <select id="birthday_Month" name="birthday_Month" idx="5" class="form-control">
                                        <option value="0" v="0" label="month"{if $form.birthday_Month == "0"} selected{/if}>(month)</option>
                                        {foreach from=$age_bday_months key=k item=v}
                                            <option value="{$v}" v="{$v}" label="{$k}" {if $form.birthday_Month == $v}selected{/if}>{$k}</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-xs-4">
                                    <select id="birthday_Day" name="birthday_Day" idx="6" class="form-control">
                                        <option label="day" value="0" v="0"{if $form.birthday_Day == "0"} selected{/if}>(day)</option>
                                        {foreach from=$age_bday_days key=k item=v}
                                            <option label="{$v}" value="{$v}" v="{$v}"{if $form.birthday_Day == $v} selected{/if}>{$v}</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-xs-4">
                                    <select id="birthday_Year" name="birthday_Year" idx="7" class="form-control">
                                        <option label="year" value="0" v="0"{if $form.birthday_Year == "0"}selected{/if}>(year)</option>
                                        {foreach from=$age_bday_years key=k item=v}
                                            <option label="{$v}" value="{$v}" v="{$v}"{if $form.birthday_Year == $v} selected{/if}>{$v}</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="clearfix"></div>
                            </div>

                            <div id="id_birthday_input_state" class="input_state"></div>
                            <div id="id_birthday_msg" class="{if $p_error.birthday}error_box msg_show{else}msg_hide{/if}">
                                <div id="id_birthday_msg_text" class="msg_text">{$p_error.birthday}</div>
                                <div class="clear_both"></div>
                            </div>
                        </div>
                    {/if}
                    <div class="clearfix"></div>
                    <div id="the_terms_container" class="col-sm-12">
                        <div id="inner_container">
                            <div id="agree_checkbox">
                                <input id="id_termsAgree" name="terms" type="checkbox" onclick="this.blur();" />
                            </div>
                            <div id="terms_label">
                                <label for="id_termsAgree" class="txt terms_label primary-color" style="line-height:125%;">
                                    I'm 18+ and have read and agree to the <a href="/" onclick="window.open('/?{'show=terms&width=900'|base64_encode}','terms', 'toolbar=no,location=no,directories=no,status=yes,menubar=no,resizable=yes,copyhistory=no,scrollbars=yes,width=900,height=450'); return false;">Terms</a>, <a href="/" onclick="window.open('/?{'show=privacy&width=900'|base64_encode}','terms', 'toolbar=no,location=no,directories=no,status=yes,menubar=no,resizable=yes,copyhistory=no,scrollbars=yes,width=900,height=450'); return false;" >Privacy Policy</a>, and to receive email account updates sent by {if $whitelabel_settings.name}{$whitelabel_settings.name}{else}{$_CONFIG.SITE.SITE_COMPANY}{/if}.</label></label>
                            </div>
                            <div class="clearfix"></div>

                            <div id="terms_error_container" class="{if $p_error.terms}error_box msg_show{else}msg_hide{/if}" id="id_termsAgree_msg">
                                <div id="id_termsAgree_msg_text" class="msg_text">{$p_error.terms}</div>
                                <div class="clear_both"></div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div id="agree_section" class="text-center">
                        {if $register_button_replacement}
                            {$register_button_replacement}
                        {else}
                            {if !$register_button_text}
                                {assign var="register_button_text" value="Join for FREE!"}
                            {/if}
                            <div id="register_button" class="col-sm-12">
                                <div id="button_inner_container">
                                    <input id="register_submit" {if $wccJoinIsDisabled}disabled="disabled"{/if} class="btn btn-primary form-submit" type="button" name="register_submit" value="Join for FREE" onclick="lp_join.join('#lp_207')" />
                                </div>
                            </div>
                        {/if}
                        {if $display_joinpages_captcha}
                            <div id="captcha_container" class="form_row">
                                <div id="captcha_inner_container">
                                    <label for="id_security_code" >Security Code:</label>
                                    <input id="id_security_code" class="form_input" type="text" name="security_code" size="14"
                                           title="Please enter the security code to the right" />
                                    <img src="{$security_display_url}" class="security_code_img">
                                </div>
                                <div id="id_security_code_msg" class="{if $p_error.security_code}error_box msg_show{else}msg_hide{/if}">
                                    <div id="id_security_code_msg_text" class="msg_text">{$p_error.security_code}</div>
                                    <div class="clear_both"></div>
                                </div>
                            </div>
                        {/if}
                        {*{if !$whitelabel_settings.disable_epoch}*}
                            {*{if $whitelabel_settings.type == $smarty.const.WHITELABEL_TYPE_VHOST || $whitelabel_settings.contact_epoch_msg}*}
                                {*<div class="clear_both"></div>*}
                                {*<div id="epoch_section" class="col-sm-12">*}
                                    {*<div class="txt terms_label popup_terms_label secondary-color" >*}
                                        {*Please visit <a href="http://www.epoch.com/billingsupport" target="_blank">www.epoch.com</a>, our authorized sales agent, for billing support.*}
                                    {*</div>*}
                                {*</div>*}
                            {*{/if}*}
                        {*{/if}*}
                    </div>
                    <div class="clearfix"></div>
                </div>
            </form>
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="col-sm-12 no-padding" >
        <div class="col-lg-6 col-sm-3">

        </div>
        <div id="slogan" class="col-lg-6 col-sm-9 no-padding">

                LOOKING FOR LIVE
                <span class="green primary-color">SEX FROM HOME?</span>

        </div>
    </div>
    <div class="clearfix"></div>
</div>

<div id="footer_204" class="secondary-bg-color" >
    <div id="title" class="primary-bg-color">
    <span id="login_btn_xs" class="pull-left secondary-color">
        Account Login
    </span>

        <span class="pull-right logo">
        <img src="{$whitelabel_images.logo.uri}">
    </span>
    </div>
    <div class="footer-2">

        <div id="form_fields_left" class="col-sm-4">
            <div id="close-btn">&times;</div>
            <form autocomplete="off" name="memberLogin" method="POST" id="memberLogin"
                  action="/members/?{$__session_name}={$__session_id}"
                  enctype="application/x-www-form-urlencoded">
                    <input type="hidden" name="show" id="show" value="login_application" />
                    <div id="warning_div" class="alert alert-warning" {if empty($smarty.get.le)}style="display: none"{/if}>
                        {if !empty($smarty.get.le)}<span class="login_errors">Invalid Username/Password!</span>{/if}
                    </div>
                    <div class="col-lg-5 form-group">
                        <input name="login" type="text" id="username" class="form-control" autocomplete="off" placeholder="User name">
                    </div>
                    <div class="col-lg-5 form-group">
                        <input type="password" name="password" id="password" class="form-control" autocomplete="off" placeholder="Password">
                    </div>
                    <div class="col-lg-2">
                        <input type="hidden" name="sie" value="{$sie}">
                        <button type="submit" id="login_btn" class="btn btn-primary button-2">Login</button>
                    </div>
                    <div id="forgot_pass" class="col-xs-12">
                            <a href="/members/?{'show=forgot_password'|base64_encode}" class="forgot">Forgot your password?</a>
                    </div>
                     <div class="clearfix"></div>
            </form>
        </div>
        <div class="col-sm-8">
            <span class="ad-text hidden-xs">
            Not a member? <span class="primary-color"><br>Free Sign-up and FREE Credits!</span>
        </span>
            <div class="alignRight pull-right text-right primary-color">
                <div class="modelsAge"> All models appearing on this website are 18 years or older.</div>
                <div class="usc-2257">
                    <a href="http://www.webcamclub.com/?c2hvdz0yMjU3" target="_blank">18 U.S.C. 2257 Record Keeping Requirements Compliance Statement</a>
                </div>
                <div class="footer-links">
                    <a href="/?{'show=contact'|base64_encode}" >Customer Service |</a>
                    <a href="/?{'show=faq'|base64_encode}" >FAQ |</a>
                    <a href="/?{'show=terms&amp;width=900'|base64_encode}" rel="popup wccterms 900 525 0 0 center resizeable scrollbars noicon">Terms &amp; Conditions |</a>
                    <a href="/?{'show=privacy&amp;width=900'|base64_encode}" rel="popup wccprivacy 900 525 0 0 center resizeable scrollbars noicon">Privacy Policy |</a>
                    <a href="http://www.dmcanotice.com/Notice&amp;TakedownPolicy.html" rel="popup wccdmca 800 775 0 0 center resizeable scrollbars noicon">DMCA Notice</a>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-sm-5">
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<script type="text/javascript" src="/js/wcc_lp_join.js"></script>
    <script type="text/javascript">
        var LP_RESPONSIVE = {$responsive_lp};
        {literal}

        //generate a random number as image index
        var num = Math.floor(Math.random() * 5) + 1;

        function responsive_UI_elem(){

            if (window.matchMedia('(max-width: 767px)').matches) {

                $('body').css('background-image', 'url(images/lps/mobile/0' + num + '.jpg)');
            }else {
                $('body').css('background-image', 'url(images/lps/204/0' + num + '.jpg)');
            }

            $('#form_204 form').find('input[type=text]').on('change', function (e) {

                var id = $(this).attr('id');

                wccJoin.show_processing(e, id)
                console.log('value: ' + $(this).val())
//                wccJoin.doValidate(e, $(this));

            }).on('focusout', function (e) {
//                wccJoin.notify(e, $(this));
                console.log("focusout::fired")
            });
        }

        $(window).resize(function() {
            responsive_UI_elem()
        });

        if (window.matchMedia('(max-width: 767px)').matches) {
            responsive_UI_elem();
            //hide login form
            $('#form_fields_left').hide();
            //display login form
            $('#close-btn, #login_btn_xs').click(function () {
                $('#form_fields_left').slideToggle()
            });
        }

        $(document).ready(function(){
            $('#wcc_debug_data').removeAttr('style');
        });

        responsive_UI_elem();
        //reset input if error has occur
        $('.form-group input' ).on('focusin', function(){
            var parent = $(this).parent();
            var hasClassTimes = $(this).parent().find('.fa').hasClass('fa-times')

            if( $(this).val() != "" && hasClassTimes ){
                $(this).val("").removeAttr('style');
                console.log("has class times: " + hasClassTimes );
                parent.find('.fa').removeClass('fa-times');
            }
        })
        {/literal}
    </script>
