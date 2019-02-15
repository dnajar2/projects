<link href='https://fonts.googleapis.com/css?family=Lato:400,900,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.min.css">
<div class="landing-header">
    <p><span>Thousands</span> of Hot Girls</p>
    <p>Ready To <span>Get Naked</span> For You</p>
</div>
<div class="form-container">
    <div class="form-header">
        <div class="form-header-left-line"></div>
        <p>Create Your Free Account</p>
        <div class="form-header-right-line"></div>
    </div>
    <form name="application" method="POST" action="{$form_action}" enctype="application/x-www-form-urlencoded" autocomplete="off">
    <div class="fieldContainer step1">
        <div id="uname_container" class="form_row">
            <label for="id_uname" class="form_label">Username:</label>
            <div id="id_uname_input_state" class="input_state"></div>
            <input id="id_uname" class="form_input usernameField" type="text" name="uname" size="28" maxlength="30" value="{$form.uname}" autofocus
                   title="Please enter a username; a-zA-Z0-9; 5-25 in length"
                   onkeydown="wccJoin.show_processing(event, this.id);"
                   onkeyup="wccJoin.doValidate(event, this);"
                   onblur="wccJoin.notify(event, this);" />
            <div class="clear_both"></div>
            <div class="{if $p_error.uname}error_box msg_show{else}msg_hide{/if}" id="id_uname_msg">
                <div class="msg_text" id="id_uname_msg_text">{$p_error.uname}</div>
                <div class="clear_both"></div>
            </div>
        </div>
        <div id="password_container" class="form_row">
            <label for="id_pwd" class="form_label">Password:</label>
            <div class="input_state" id="id_pwd_input_state"></div>
            <input id="id_pwd" class="passwordField form_input" type="password" autocomplete="off" name="pwd" size="28" maxlength="32"
                   title="Password must be between {$smarty.const.MEMBER_PASSWORD_MIN_CHAR} and {$smarty.const.MEMBER_PASSWORD_MAX_CHAR} characters."
                   onkeydown="wccJoin.show_processing(event, this.id);"
                   onkeyup="wccJoin.doValidate(event, this);"
                   onblur="wccJoin.notify(event, this);" />
            <div class="divider"></div>
            <div class="{if $p_error.pwd}error_box msg_show{else}msg_hide{/if}" id="id_pwd_msg">
                <div class="msg_text" id="id_pwd_msg_text">{$p_error.pwd}</div>
                <div class="clear_both"></div>
            </div>
        </div>
        <div id="email_container" class="form_row">
            <label for="id_email" class="form_label">Email:</label>
            <div class="input_state" id="id_email_input_state"></div>
            <input id="id_email"  class="form_input" type="email" name="email" size="28" value="{$form.email}"
                   title="Please enter a valid email address"
                   onkeydown="wccJoin.show_processing(event, this.id);"
                   onkeyup="wccJoin.doValidate(event, this);"
                   onblur="wccJoin.notify(event, this);" />
            <div class="divider"></div>
            <div id="id_email_msg" class="{if $p_error.email}error_box msg_show{else}msg_hide{/if}">
                <div id="id_email_msg_text" class="msg_text">{$p_error.email}</div>
                <div class="clear_both"></div>
            </div>
        </div>
    </div>
    <div class="step2">
        <div id="birthday_container" class="form_row">
            <label for="id_birthday_Month" class="form_label birthdayLabel">Birthday: </label>
            <div id="birthday_inner_container">
                <div class="divider"></div>
                <div id="bday_month_container">
                    <select placeholder="Month" id="id_birthday_Month" name="birthday_Month" idx="0" class="form_input">
                        <option value="0" v="0" label="month"{if $form.birthday_Month == "0"} selected{/if}>(month)</option>
                        {foreach from=$age_bday_months key=k item=v}
                            <option value="{$v}" v="{$v}" label="{$k}" {if $form.birthday_Month == $v}selected{/if}>{$k}</option>
                        {/foreach}
                    </select>
                </div>
                <div id="bday_day_container">
                    <select placeholder="Day" id="id_birthday_Day" name="birthday_Day" idx="1" class="form_input">
                        <option label="day" value="0" v="0"{if $form.birthday_Day == "0"} selected{/if}>(day)</option>
                        {foreach from=$age_bday_days key=k item=v}
                            <option label="{$v}" value="{$v}" v="{$v}"{if $form.birthday_Day == $v} selected{/if}>{$v}</option>
                        {/foreach}
                    </select>
                </div>
                <div id="bday_year_container">
                    <select placeholder="Year" id="id_birthday_Year" name="birthday_Year" idx="2" class="form_input">
                        <option label="year" value="0" v="0"{if $form.birthday_Year == "0"}selected{/if}>(year)</option>
                        {foreach from=$age_bday_years key=k item=v}
                            <option label="{$v}" value="{$v}" v="{$v}"{if $form.birthday_Year == $v} selected{/if}>{$v}</option>
                        {/foreach}
                    </select>
                </div>
                <div id="id_birthday_input_state" class="input_state"></div>
                <div id="id_birthday_msg" class="{if $p_error.birthday}error_box msg_show{else}msg_hide{/if}">
                    <div id="id_birthday_msg_text" class="msg_text">{$p_error.birthday}</div>
                    <div class="clear_both"></div>
                </div>
            </div>
            <div class="clear_both"></div>
            <div id="terms_container">
                <div id="terms_inner_container">
                    <input id="id_termsAgree" name="termsAgree" type="checkbox" onclick="this.blur();" />
                    <label for="id_termsAgree" class="txt terms_label" style="line-height:125%;">&nbsp;I'm 18+ and have read and agree to the <a href="/" onclick="window.open('/?{'show=terms&width=900'|base64_encode}','terms', 'toolbar=no,location=no,directories=no,status=yes,menubar=no,resizable=yes,copyhistory=no,scrollbars=yes,width=900,height=450'); return false;" class="normal_link">Terms</a>, <a href="/" onclick="window.open('/?{'show=privacy&width=900'|base64_encode}','terms', 'toolbar=no,location=no,directories=no,status=yes,menubar=no,resizable=yes,copyhistory=no,scrollbars=yes,width=900,height=450'); return false;" class="normal_link">Privacy Policy</a>, and to receive email account updates sent by {if $whitelabel_settings.name}{$whitelabel_settings.name}{else}{$_CONFIG.SITE.SITE_COMPANY}{/if}.</label></label>
                    <div id="terms_error_container" class="{if $p_error.terms}error_box msg_show{else}msg_hide{/if}" id="id_termsAgree_msg">
                        <div id="id_termsAgree_msg_text" class="msg_text">{$p_error.terms}</div>
                        <div class="clear_both"></div>
                    </div>
                </div>
            </div>
            <div id="register_button_container">
                <div id="register_button_inner_container">
                    <input id="register_submit" {if $wccJoinIsDisabled}disabled="disabled"{/if} class="{if $lp_104}button2{else}form_submit_button{/if}" type="button" name="register_submit" value="JOIN FOR FREE" onclick="{if $wccJoinIsAjax || $ajaxified || $exit_pop_joinpage}wccJoin.ajaxSubmit(this.id);return false;{else}wccJoin.submit(this.id);{/if}this.blur();" {if $button_text_large} style="font-size:28px; font-weight:normal" {/if} {if $lp_104} style="height: 45px;padding: 0px;font-size: 18px;padding-bottom: 2px;"{/if} />
                </div>
            </div>
        </div>
    </div>
    {* Additional Inputs *}
    <input name="show" id="id_show" value="register_application" type="hidden">
    {if $exit_pop_joinpage}
        <input name="track_joinform" value="upsellit_joinpage" type="hidden" />
        <input name="joinpage" id="id_joinpage" value="upsellit_joinpage" type="hidden" />
    {else}
        <input name="track_joinform" id="id_track_joinform" value="{if $skin_id}{$skin_id}{else}default_joinpage{/if}" type="hidden" />
        <input name="joinpage" id="id_joinpage" value="{$smarty.session.joinpage}" type="hidden" />
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
    </form>
    <div class="form-next" onclick="nextPage();">NEXT</div>
</div>
<div class="bottom-container">
    <div>
        <div class="bottom-advantage-text">
            <p>Take advantage of our special offer</p>
        </div>
        <div class="bottom-divider"></div>
        <div class="bottom-feature-list">
            <ul class="feature-list">
                <li class="feature-item">
                    <i class="fa fa-check-circle" aria-hidden="true"></i> Free Private Live Show On Us
                </li>
                <li class="feature-item">
                    <i class="fa fa-check-circle" aria-hidden="true"></i> Free Unlimited Chat Time With Models
                </li>
                <li class="feature-item">
                    <i class="fa fa-check-circle" aria-hidden="true"></i> Discreet, Safe, & Secure
                </li>
            </ul>
        </div>
    </div>
</div>

