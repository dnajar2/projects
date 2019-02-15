<!-- Start of section -->
<section id="account-settings" >
	<div class="account-panel">
		<div class="account-panel-title"><!-- title -->
			<div class="pull-left account-section-name">
				<i class="fa fa-gear"></i> &nbsp; ACCOUNT SETTINGS
			</div>
			<!-- desktop only -->
			<div class="clearfix"></div>
		</div>
		<!-- end of title -->
		<div class="clearfix"></div>
        <div id="generalSettingsSection" class="col-sm-12">
            <h2 class="title"><i class="fa fa-chevron-right"></i> GENERAL SETTINGS</h2>
        </div>
        <div class="clearfix"></div>
		<div class="col-md-12 settings-pannel">
			<form name="settingsForm" method="POST" id="settingsForm" action="/api/members/settings.php?{$smarty.session.session_name}={$smarty.session.session_id}" enctype="application/x-www-form-urlencoded">
			<input type="hidden" id="member_id" name="member_id" value="{$smarty.session.userid}">
			<input type="hidden" id="session_name" name="session_name" value="{$smarty.session.session_name}">
			<input type="hidden" id="session_id" name="session_id" value="{$smarty.session.session_id}">
			<!-- left side -->
			<div class="col-md-6 section-pannel">
				<div class="col-lg-3 section-label section-row"><!-- ROW -->
					USERNAME:
				</div>
				<div class="col-lg-9 section-data  section-row">
					{$membersaccount_settings.username}
				</div><!--  END OF ROW -->
				<!-- password label  -->
				<div class="col-lg-3 section-label section-row"><!-- ROW -->
					PASSWORD:
				</div>
				<div id="pass1" class="col-lg-9 section-data section-row">
					<div class="field-mask show"><span id="pass-mask" class="mask">*********</span></div>
					<div class="hide field">
					<div class="field-message has-success hide"></div>
						<div id="curent" class="pass_input_section">
							<span class="pw_filds">Current:</span> &nbsp;
							<input type="password" name="password" id="password" class="input_text">
							<i class="valid_pass fa fa-check hide"></i><i class="not_valid_pass fa fa-times hide"></i>
						</div>
						<div id="new_pass1" class="pass_input_section">
							<span class="pw_filds">New:</span> &nbsp;
							<input type="password" name="new_password" id="new_password" class="input_text">
							<i class="valid_pass fa fa-check hide"></i><i class="not_valid_pass fa fa-times hide"></i>
						</div>
						<div id="new_pass2" class="pass_input_section">
							<span class="pw_filds">Re-type New:</span> &nbsp;
							<input type="password" name="match_password" id="match_password" class="input_text">
							<i class="valid_pass fa fa-check hide"></i><i class="not_valid_pass fa fa-times hide"></i>
						</div>
					</div>
					<span class="edit">
						<span class="edit-text show">Edit &nbsp; <i class="fa fa-pencil"></i></span>
						<span class="save hide" onclick="{literal}Members.changeSetting('login-pass', {'setting':'password','password':$.trim($('#password').val()),'new_password':$.trim($('#new_password').val()),'match_password':$.trim($('#match_password').val())});{/literal}">Save &nbsp; <i class="fa fa-floppy-o"></i></span>
						<span class="cancel hide">Cancel &nbsp; <i class="fa fa-times"></i></span>
					</span>
				</div><!--  END OF ROW -->

				<div class="col-lg-3 section-label section-row"><!-- ROW -->
					EMAIL:
				</div>
				<div id="email-section" class="col-lg-9 section-data  section-row">
					<div id="email-mask" class="field-mask show">
						{$membersaccount_settings.email}
					</div>
					<div class="hide field">
					<!-- if error use class has-error and remove class has-success -->
					<div class="field-message has-success hide"></div>
						<div id="new_email" class="pass_input_section">
							<span class="pw_filds">New Email:</span> &nbsp;
							<input type="email" name="email" id="email" class="input_text">
							<i class="valid_pass fa fa-check hide"></i><i class="not_valid_pass fa fa-times hide"></i>
						</div>
						<div id="conf_pass_f" class="pass_input_section">
						<span class="pw_filds">Password:</span> &nbsp;
							<input type="password" name="conf_pass" id="conf_pass" class="input_text">
							<i class="valid_pass fa fa-check hide"></i><i class="not_valid_pass fa fa-times hide"></i>
						</div>
					</div>
					<span class="edit">
						<span class="edit-text show">Edit &nbsp; <i class="fa fa-pencil"></i></span>
						<span class="save hide" onclick="{literal}Members.changeSetting('email-section', {'setting':'email', 'email':$.trim($('#email').val()), 'password':$.md5($.trim($('#conf_pass').val()))});{/literal}">Save &nbsp; <i class="fa fa-floppy-o"></i></span>
						<span class="cancel hide">Cancel &nbsp; <i class="fa fa-times"></i></span>
					</span>
				</div><!-- END OF ROW -->

				<div class="clearfix"></div>
			</div>
			<!-- ============ right side ================== -->
			<div class="col-md-6 section-pannel">
				<div class="col-lg-5 section-label section-row"><!-- ROW -->
					TIMEZONE:
				</div>
				<div id="timezone" class="col-lg-7 section-data section-row">
					<div id="selected_time" class="field-mask show">
						{$membersaccount_settings.timezone.display}
					</div>
					<div id="time_zone" class="hide field">
						<div class="field-message has-success hide" style="float:left; width:72%"></div>
						<div class="bfh-selectbox col-lg-9" data-name="time-zone" data-value="{$timezone.location}">
							<div data-value="0">(select)</div>
							{foreach from=$timezones item=timezone}
							<div data-value="{$timezone.location}">{$timezone.display}</div>
							{/foreach}
						</div>
					</div>
					<span class="edit">
						<span class="edit-text show">Edit &nbsp; <i class="fa fa-pencil"></i></span>
						<span class="save hide" onclick="{literal}Members.changeSetting('timezone', {'setting':'timezone', 'timezone':$.trim($('#time_zone input').val())});{/literal}">Save &nbsp; <i class="fa fa-floppy-o"></i></span>
						<span class="cancel hide">Cancel &nbsp; <i class="fa fa-times"></i></span>
					</span>
				</div><!--  END OF ROW -->

				<div class="col-lg-5 section-label section-row"><!-- ROW -->
					AUTO <span class="hidden-xs">CREDIT PURCHASE</span><span class="hidden-sm hidden-md hidden-lg">CREDITS</span>:
				</div>
				<div id="auto-credits-toggle" class="col-lg-7 section-data  section-row">

					<div id="auto-credits" class="field-mask show">{if $membersaccount_settings.auto_credit_purchase}ON{else}OFF{/if}</div>
					<div class="hide field">
					<div class="field-message has-success hide"></div>
						<input type="radio" name="creditstoggle" id="creditstoggle_on" value="on"{if $membersaccount_settings.auto_credit_purchase eq "1"} checked{/if}><label for="creditstoggle_on" style='margin-right:15px;'>ON</label>
						<input type="radio" name="creditstoggle" id="creditstoggle_off" value="off"{if $membersaccount_settings.auto_credit_purchase eq "0"} checked{/if}><label for="creditstoggle_off">OFF</label>
					</div>
					<span class="edit">
						<span class="edit-text show">Edit &nbsp; <i class="fa fa-pencil"></i></span>
						<span class="save hide" onclick="{literal}Members.changeSetting('auto-credits-toggle', {'setting':'auto-credits', 'auto-credits':$.trim($('#auto-credits-toggle input:checked').val())});{/literal}">Save &nbsp; <i class="fa fa-floppy-o"></i></span>
						<span class="cancel hide">Cancel &nbsp; <i class="fa fa-times"></i></span>
					</span>
				</div><!-- END OF ROW -->

				<div class="col-lg-5 section-label section-row"><!-- ROW -->
					BLOCKED MODEL MESSAGES:
				</div>
				<div id="blocked-models" class="col-lg-7 section-data section-row">

					<span id='blocked-model-txt'>
					{if $membersaccount_settings.blocked_models_count eq 0}
						No Blocked Models
					{else}
						{$membersaccount_settings.blocked_models_count} Blocked Model{if $membersaccount_settings.blocked_models_count gt 1}s{/if}
					{/if}
					</span>
					<span class="edit">
					{if $membersaccount_settings.blocked_models_count gt 0}
						<span class="edit-text show">Edit &nbsp; <i class="fa fa-pencil"></i></span>
						<span class="cancel closeThis hide">Close &nbsp; <i class="fa fa-times"></i></span>
					{/if}
					</span>
				</div><!-- END OF ROW -->
				 <div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
			</form>
		</div>
        <div class="clearfix"></div>

		<!-- blocked models -->
		<div id="unblock" class="notifications-panel col-md-12 hide">
			<div class="notifications">
				<div class="grid">
					<div class="grid-sizer"></div>
					{foreach from=$membersaccount_settings.blocked_models item="model"}
					<div id="modelId_{$model.id}" class="grid-item">
						<div class="field-message dim hide">
							<p class="has-success">{$model.username}<br> has been un-blocked!</p>
						</div>
						<img src="{$model.photo_large_url}" alt="{$model.username}">
						<div class="model-stats-label fav-sts-available">
							<div class="anmn col-xs-8"> <!-- anmn Alerts Notification Model Name -->
								{$model.username}
							</div>
							<div class="anms col-xs-4 text-right"><!-- anms Alerts Notifications Model Status -->
								<span>{if $model.online}ONLINE{else}OFFLINE{/if}</span>
							</div>
						</div>
						<div class="stop-alerts" onclick="{literal}Members.unblockModel('modelId_{/literal}{$model.id}{literal}', {setting: 'unblock', modelId:{/literal}{$model.id}{literal}});{/literal}">
							<i class="fa fa-times"></i> UN-BLOCK MODEL
						</div>
					</div>
					{/foreach}
				</div>
				<h3 class="hide">No Blocked Models</h3>
			</div>
		</div>
		<div class="clearfix"></div>
        <div id="emailSettingsSection" class="col-sm-12">
            <h2 class="title"><i class="fa fa-chevron-right"></i> EMAIL SETTINGS</h2>
        </div>
        <div class="clearfix"></div>
        <div  class="col-md-12 settings-pannel">
            <form name="emailSettings" method="POST" id="emailSettings" action="/api/members/settings.php?{$smarty.session.session_name}={$smarty.session.session_id}" enctype="application/x-www-form-urlencoded">
                <input type="hidden" name="member_id" value="{$smarty.session.userid}">
                <input type="hidden" name="session_name" value="{$smarty.session.session_name}">
                <input type="hidden" name="session_id" value="{$smarty.session.session_id}">
                <input type="hidden" name="item" value="mail" />
                {foreach from=$mail_settings key="setting" item="mail_setting" name="mail_settings_loop"}
                    {if $mail_setting.user_edit}
                        <div class="mail-setting col-sm-6">
                            <div class="col-md-6 section-label section-row">{$mail_setting.label}{if $setting == "paid" || $setting == "crm_liaison"} *{/if}</div>

                            <div id="{$setting}_toggle" class="col-md-6 section-data  section-row">
                                <div id="{$setting}" class="field-mask show text-uppercase" >{if $mail_setting.status == "1"}ON{else}OFF{/if}</div>
                                <div class="field-message has-success hide"></div>
                                <div class="hide field">
                                    <input type="radio" id="id_{$setting}_on" name="{$setting}" value="on" {if $mail_setting.status} checked{/if} /><label for="id_{$setting}_on">ON</label>
                                    <input type="radio" id="id_{$setting}_off" name="{$setting}" value="off" {if !$mail_setting.status} checked{/if} /><label for="id_{$setting}_off">OFF</label>
                                </div>
                                <span class="edit">
                                    <span class="edit-text show">Edit &nbsp; <i class="fa fa-pencil"></i></span>
                                    <span class="save hide"
                                            onclick="{literal}Members.changeSetting('{/literal}{$setting}{literal}_toggle',{'setting':'email_setting','setting_section':'{/literal}{$setting}',{literal}'status':''}{/literal})">Save &nbsp; <i class="fa fa-floppy-o"></i></span>
                                    <span class="cancel hide">Cancel &nbsp; <i class="fa fa-times"></i></span>
                                </span>
                            </div>
                        </div>
                    {/if}
                {/foreach}
                <div class="clearfix"></div>
            </form>
            <div class="acctmngt_mail_label txt col-sm-12">* If you are a paying member we recommend keeping this setting set to "ON" to receive special offers.</div>
            <div class="clearfix"></div>
        </div>
        <!-- end of mail settings -->
<!-- 		<div id="edit" class="hidden-sm hidden-md hidden-lg"> -->
<!-- 			<button class="btn btn-primary"><i class="fa fa-pencil"></i> &nbsp; Edit</button> -->
<!-- 		</div> -->
	</div><!-- end of col -->
</section>

{literal}
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {

    // applies to this page only
    if (window.matchMedia('(max-width: 767px)').matches) {
        var newTimeZoneTxt = $.trim($('#selected_time').text());
        var tzTrimmed = newTimeZoneTxt.substring(0, 22);
        $('#selected_time').text(tzTrimmed)
    }

    var timeSelected = ""
    $('#timezone').on('hidden.bfhselectbox', function () {
        timeSelected = $('#timezone').find('.bfh-selectbox-option').text();

    });

    var radioValue = "";

    $('.edit').click(function () {
        var getPrev = $(this).parent().attr('id');
        var sectionId = '#' + getPrev;
        var input = $.trim($(sectionId).find('.field-mask').text());
        var thisText = $(this).text();
        var text = $.trim($(this).find(".show").text());

        if (text === "Edit") {
            $(sectionId).find('.field-mask, .edit-text').removeClass('show').addClass('hide');
            $(sectionId).find('.save, .field, .cancel').removeClass('hide').addClass('show');
            $(sectionId).find('input[type=text], input[type=email] ').focus().val(input);
        }

        if (sectionId === '#timezone') {
            $(sectionId).find('.bfh-selectbox-option').text(input);
            $('#timezone').on('hidden.bfhselectbox', function () {
                $(sectionId).find('.field-mask').text(timeSelected);
                console.log('text = : ' + timeSelected, sectionId)
            });
        }

        if (getPrev == "blocked-models") {
            $('#unblock').toggleClass('hide show');
            $('.grid').isotope({
                layoutMode: 'fitRows',
                itemSelector: '.grid-item'
            });
        }
        if ($(sectionId).find('input').is(':radio')) {

            radioValue = $(sectionId).find('.field-mask').text()
            if (input == "ON") {
                $('input:nth-child(1)').val()
            }
            var Value = $(sectionId).find('input:checked').val();
            $(sectionId).find('.field-mask').text(Value);
        }
    });

    $('.cancel').click(function () {
        var getPrev = $(this).parent().parent().attr('id');
        var sectionId = '#' + getPrev;
        $(sectionId).find('.field-mask, .edit-text').removeClass('hide');
        $(sectionId).find('input[type=text]').not('input[type=email],input[type=radio]').val('')
        $(sectionId).find('.save, .field, .cancel').removeClass('show').addClass('hide');

        $(sectionId).delay(900).queue(function (resetShow) {
            $(sectionId).find('.field-mask, .edit-text').addClass('show');
            if ($(sectionId).find('input').is(':radio')) {
                $(sectionId).find('.field-mask').text(radioValue)
            }
            resetShow()
        });
    });
    // save functions
    $('.save').on('click', function (e) {
        $('#match_password').css('border-color', '');
        $('#valid_pass').removeClass('show').addClass('hide');

    });


    $('#edit button').on('click', function () {
        $('#unblock, .field-mask, .field').toggleClass('show hide');
        $('.section-label').css({'width': '100%'}).toggleClass('section-row section-row-edit');
        $('.section-data').css({'width': '100%', 'text-align': 'left'}).toggleClass('section-row section-row-edit');
        $('.section-data input[type="text"], input[type="password"]').css({'width': '100%', 'padding': '5px'});
        $('.pass_input_section span').toggleClass('pw_filds pw_filds-edit')

        $('.grid').isotope({
            layoutMode: 'fitRows',
            itemSelector: '.grid-item'
        });
    });

    $('#time_zone').on('show.bfhselectbox', function () {
        $('#time_zone').find('a.bfh-selectbox-toggle, .bfh-selectbox-options').css('border', 'solid 1px #3598DB')
    })
})
</script>
{/literal}

{if $smarty.get.scroll eq 'true'}
    {literal}
<script>
    $(function () {
        $('html, body').animate({
            scrollTop: $("#emailSettingsSection").offset().top + -55
        }, 2000);
    })
</script>

    {/literal}
{/if}