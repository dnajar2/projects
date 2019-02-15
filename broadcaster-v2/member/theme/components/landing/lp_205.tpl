<div id="mask" style="display: none">
    <img src="" class="loading-image">
</div>
<div id="header">
    <span id="logo">
            <img src="{$whitelabel_images.logo.uri}" alt="{$whitelabel_settings.name}">
    </span>
    <span id="join_btn" class="pull-right">
        <span class="hidden-xs secondary-color">Already a Member?</span> <button class="btn btn-primary button-2" data-toggle="modal" data-target="#user_login">Log In <span class="hidden-xs">Now</span></button>
    </span>
</div>
<!-- end of header -->
<div id="content_207">
    <!-- models grid -->
    <div id="topModels">
        <div class="col-sm-7 model main primary-border"></div>
        <div class="col-sm-5 no-padding">
            <div class="col-sm-12 model middleModel top primary-border"></div>
            <div class="col-sm-6 model small-left primary-border"></div>
            <div class="col-sm-6 model small-right primary-border"></div>
        </div>
        <div class="clearfix"></div>
    </div>
    <!--end of models grid -->
    <div id="create" class="primary-color secondary-bg-color" >
        <h2>
            <i class="fa fa-chevron-circle-right"></i> CREATE YOUR FREE ACCOUNT
        </h2>
    </div>
    <!-- end of intro message -->
    <div id="form_container" class="secondary-bg-color">
        <div id="mobile_mask"></div>
        <div id="formContainer">

            <div id="title" class="col-md-4 text-center">
                <h2>
                    Looking For
                    <span class="big">Live Sex</span>
                    <span class="green primary-color">From Home?</span>
                </h2>
            </div>

            <div class="signupForm col-md-8" >
                <form name="application" method="POST" action="{$form_action}" enctype="application/x-www-form-urlencoded" autocomplete="off">
                    <input name="show" id="id_show" value="register_application" type="hidden">
                    <input name="id" id="id" type="hidden">
                    <input name="value" id="value" type="hidden">
                    <input name="type" id="type" type="hidden" value="member">
                    <input type="hidden" name="username" id="reg_user_name">
                    <input type="hidden" name="password" id="reg_user_pass">
                    <input type="hidden" name="email" id="reg_user_email">
                    {if $exit_pop_joinpage}
                        <input name="track_joinform" value="upsellit_joinpage" type="hidden" />
                        <input name="joinpage" id="id_joinpage" value="upsellit_joinpage" type="hidden" />
                    {else}
                        <input name="track_joinform" id="id_track_joinform" value="{if $skin_id}{$skin_id}{elseif $track_joinpage}{$track_joinpage}{else}default_joinpage{/if}" type="hidden" />
                        <input name="joinpage" id="id_joinpage" value="{if $track_joinpage}{$track_joinpage}{else}{$smarty.session.joinpage}{/if}" type="hidden" />
                    {/if}
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

                    <div class="col-sm-6 ">
                        <!-- email-->
                        <div id="email_container" class="form-group">
                            {if !$hide_labels}
                                <label for="id_email" >Email:</label>
                            {/if}
                            <input id="id_email" class="form-control" type="text" name="email" value="{$form.email}" autofocus
                                   title="Please enter a valid email address"
                                   placeholder="Email"
                                   onfocus="wcc_lp_join.prepareInput(this.id)";
                                   onfocusout="wcc_lp_join.checkInput(this.id)";
                                   onchange="wcc_lp_join.validateInput(this.id)";

                            />
                            <div class="icon" style="display: none">
                                <i class="fa"></i>
                            </div>
                            <div class="input_state" id="id_email_input_state">
                                <img src="" alt="pre-loader">
                            </div>
                            <div class="msg-box" style="display: none;"></div>
                        </div><!-- end of email -->

                        <!-- user name -->
                        <div id="uname_container" class="form-group">
                            {if !$hide_labels}
                                <label for="id_uname" >Username:</label>
                            {/if}
                            <input id="id_uname" class="form-control" type="text" name="uname" size="28" maxlength="30" value="{$form.uname}"
                                   title="Please enter a username; a-zA-Z0-9; 5-25 in length"
                                   placeholder="Username"
                                   onfocus="wcc_lp_join.prepareInput(this.id)";
                                   onchange="wcc_lp_join.validateInput(this.id)";
                                   onfocusout="wcc_lp_join.checkInput(this.id)";
                            />
                            <div class="icon" style="display: none">
                                <i class="fa"></i>
                            </div>
                            <div id="id_uname_input_state" class="input_state">
                                <img src="" alt="pre-loader">
                            </div>
                            <div class="msg-box" style="display: none;"></div>

                        </div>
                        <!-- password -->
                        {if 1==1 || $display_password_input}
                            <div id="password_container" class="form-group">
                                {if !$hide_labels}
                                    <label for="id_pwd" >Password:</label>
                                {/if}
                                <input id="id_pwd" class="form-control" type="password" autocomplete="off" name="pwd" size="28" maxlength="32"
                                       title="Password must be between {$smarty.const.MEMBER_PASSWORD_MIN_CHAR} and {$smarty.const.MEMBER_PASSWORD_MAX_CHAR} characters."
                                       placeholder="Password"
                                       onfocus="wcc_lp_join.prepareInput(this.id)";
                                       onchange="wcc_lp_join.validateInput(this.id)";
                                       onfocusout="wcc_lp_join.checkInput(this.id)";
                                />
                                <div class="icon" style="display: none">
                                    <i class="fa"></i>
                                </div>
                                <div class="input_state" id="id_pwd_input_state">
                                    <img src="" alt="pre-loader">
                                </div>
                                <div class="msg-box" style="display: none;"></div>
                            </div>
                        {/if}
                    </div>
                    <div class="col-sm-6">
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
                                    <div id="dob_label" class="col-sm-12">
                                        <label for="birthday_Month" >Date of Birth:</label>
                                    </div>
                                {/if}
                                <div class="col-sm-4 dob-date">
                                    <select id="birthday_Month" name="birthday_Month" idx="5" class="form-control">
                                        <option value="0" v="0" label="month"{if $form.birthday_Month == "0"} selected{/if}>(month)</option>
                                        {foreach from=$age_bday_months key=k item=v}
                                            <option value="{$v}" v="{$v}" label="{$k}" {if $form.birthday_Month == $v}selected{/if}>{$k}</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-sm-4 dob-date">
                                    <select id="birthday_Day" name="birthday_Day" idx="6" class="form-control">
                                        <option label="day" value="0" v="0"{if $form.birthday_Day == "0"} selected{/if}>(day)</option>
                                        {foreach from=$age_bday_days key=k item=v}
                                            <option label="{$v}" value="{$v}" v="{$v}"{if $form.birthday_Day == $v} selected{/if}>{$v}</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-sm-4 dob-date">
                                    <select id="birthday_Year" name="birthday_Year" idx="7" class="form-control">
                                        <option label="year" value="0" v="0"{if $form.birthday_Year == "0"}selected{/if}>(year)</option>
                                        {foreach from=$age_bday_years key=k item=v}
                                            <option label="{$v}" value="{$v}" v="{$v}"{if $form.birthday_Year == $v} selected{/if}>{$v}</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="clearfix"></div>
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
                                    <div class="msg-box error" style="display: none;"></div>
                                    <label>
                                        <input id="id_termsAgree" name="terms" type="checkbox" onclick="this.blur();wcc_lp_join.checkTerms()" />
                                        <span class="fa-icon">
                                            <i class="fa fa-check"></i>
                                        </span>
                                    </label>
                                    I'm 18+ and have read and agree to the <a href="/" onclick="window.open('/?{'show=terms&width=900'|base64_encode}','terms', 'toolbar=no,location=no,directories=no,status=yes,menubar=no,resizable=yes,copyhistory=no,scrollbars=yes,width=900,height=450'); return false;">Terms</a>,
                                    <a href="/" onclick="window.open('/?{'show=privacy&width=900'|base64_encode}','terms', 'toolbar=no,location=no,directories=no,status=yes,menubar=no,resizable=yes,copyhistory=no,scrollbars=yes,width=900,height=450'); return false;" >Privacy Policy</a>, and to receive email account updates sent by {if $whitelabel_settings.name}{$whitelabel_settings.name}{else}{$_CONFIG.SITE.SITE_COMPANY}{/if}.

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
                                        <input id="register_submit" {if $wccJoinIsDisabled}disabled="disabled"{/if} class="btn btn-primary form-submit" type="button" name="register_submit" value="SIGN ME UP" onclick="{if $wccJoinIsAjax || $ajaxified || $exit_pop_joinpage}wcc_lp_join.submitForm(this);this.blur();return false;{else}wcc_lp_join.submitForm(this);this.blur();{/if}" {if $button_text_large} style="font-size:28px; font-weight:normal" {/if} {if $lp_104} style="height: 45px;padding: 0px;font-size: 18px;padding-bottom: 2px;"{/if} />
                                        <div class="msg-box error" style="display: none">You must agree to the terms and conditions to continue!</div>
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

                            {if !$whitelabel_settings.disable_epoch}
                                {if $whitelabel_settings.type == $smarty.const.WHITELABEL_TYPE_VHOST || $whitelabel_settings.contact_epoch_msg}
                                    <div class="clear_both"></div>
                                    <div id="epoch_section" class="col-sm-12">
                                        <div class="txt terms_label popup_terms_label primary-color" >
                                            Please visit <a href="http://www.epoch.com/billingsupport" target="_blank">www.epoch.com</a>, our authorized sales agent, for billing support.
                                        </div>
                                    </div>
                                {/if}
                            {/if}
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </form>
            </div>
            <div class="clearfix"></div>
        </div>


    </div>
    <div class="clearfix"></div>
    <!-- copy right info -->
    <div id="footer" class="col-sm-12">
        <div class="copyright pull-left">
            Copyright &copy; 2006 through {$smarty.now|date_format:"%Y"}
            {$whitelabel_settings.copyright_name}. All right reserved.
        </div>
        <div class="alignRight pull-right text-right">
            <div class="modelsAge"> All models appearing on this website are 18 years or older.</div>
            <div>
                <a class="comply" target="_blank" href="http://www.webcamclub.com/?c2hvdz0yMjU3">18 U.S.C. 2257 Record Keeping Requirements Compliance Statement</a>
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
    <!-- end of copyright info -->
    <footer>
        <!-- bottom section -->
        <div class="bottomModels">
            <div class="col-sm-3 col-xs-3 model primary-border" style="background-image: url('images/lps/205/footer_model_1.jpg');"></div>
            <div class="col-sm-2 col-xs-3 model primary-border" style="background-image: url('images/lps/205/footer_model_2.jpg');"></div>
            <div class="col-sm-4 col-xs-3 model middleModel bottom primary-border" style="background-image: url('images/lps/205/footer_model_3.jpg');"></div>
            <div class="col-sm-3 col-xs-3 model primary-border" style="background-image: url('images/lps/205/footer_model_4.jpg');"></div>
        </div>
    </footer>
</div>

<!-- end of container -->


{include file="$_THEME/components/landing/login_modal.tpl"}

    <script>
        var LP_RESPONSIVE = {$responsive_lp};
        {literal}
        $(document).ready(function(){
            $('#wcc_debug_data').removeAttr('style');
        });
        if (window.matchMedia('(max-width: 767px)').matches){
            $(document).ready(function(){
                $('html, body').animate({
                    scrollTop: $( '#create' ).offset().top - 60
                }, 800);
            });
        }

        {/literal}
    </script>
