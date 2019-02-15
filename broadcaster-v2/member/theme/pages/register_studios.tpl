{include file="$_THEME/components/html_header.tpl" show=$show}

<body style="padding-top: 45px">
	{include file="$_THEME/components/header.tpl"}
	<div class="main-container col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
		<div class="row">
			<div class="title text-center">
				<h1>Model Studios Wanted</h1>
			</div>
			{if !$registration_complete}
			
			<div id="sr_register_studios">
				<form name="register_studios" id="register_studios" method="POST"
					action="" enctype="application/x-www-form-urlencoded"
					autocomplete="off">
					<input type="hidden" name="show" value="register_studios" />

					<div id="sr_acct_info">
						<div id="sr_acct_info_data" class="form col-sm-6">
							<div class="wcc-label wlb">Account Information</div>
							<div data-module-box="true" id="register_studios_box_1">

								<div class="form_row sr_acct_data_row col-xs-6 inner-addon right-addon">
									<i class="fa fa-user"></i>
									<i class="glyphicon glyphicon-ok" style="display: none"></i> 
									<input class="form-control" type="text" name="Firstname" id="id_firstname" value="{$form.Firstname}" placeholder="First Name"  autofocus />
									<div class="{if $errors.Firstname}error_box msg_show{else}msg_hide{/if}" id="id_firstname_msg">
										<div class="msg_text" id="id_firstname_msg_text">{$errors.Firstname}</div>
										<div class="clear_both"></div>
									</div>
								</div>

								<div class="form_row sr_acct_data_row col-xs-6 inner-addon right-addon">
									<i class="fa fa-user "></i> 
									<i class="glyphicon glyphicon-ok" style="display: none"></i> 
									<input class="form-control" type="text" name="Lastname" id="id_lastname" value="{$form.Lastname}" placeholder="Last Name" />
									<div class="{if $errors.Lastname}error_box msg_show{else}msg_hide{/if}" id="id_lastname_msg">
								<div class="msg_text" id="id_lastname_msg_text">{$errors.Lastname}</div>
									<div class="clear_both"></div>
								</div>
								</div>
								<div class="clearfix"></div>
								<div class="form_row sr_acct_data_row inner-addon right-addon">
									<i class="fa fa-home" aria-hidden="true"></i> 
									<i class="glyphicon glyphicon-ok" style="display: none"></i> 
									<input class="form-control" type="text" name="Address" id="id_address" value="{$form.Address}" placeholder="Address" />
									<div class="{if $errors.Address}error_box msg_show{else}msg_hide{/if}" id="id_address_msg">
										<div class="msg_text" id="id_address_msg_text">{$errors.Address}</div>
										<div class="clear_both"></div>
									</div>
								</div>

								<div class="form_row sr_acct_data_row col-xs-6 inner-addon right-addon">
									<i class="fa fa-map-signs" aria-hidden="true"></i> 
									<i class="glyphicon glyphicon-ok" style="display: none"></i> 
									<input class="form-control" type="text" name="City" id="id_city" value="{$form.City}" placeholder="City" />
									<div class="{if $errors.City}error_box msg_show{else}msg_hide{/if}" id="id_city_msg">
										<div class="msg_text" id="id_city_msg_text">{$errors.City}</div>
										<div class="clear_both"></div>
									</div>
								</div>

								<div class="form_row sr_acct_data_row col-xs-6 inner-addon right-addon">
									<i class="fa fa-location-arrow" aria-hidden="true"></i>
									<i class="glyphicon glyphicon-ok" style="display: none"></i> 
									<div class="sr_dropdown_container">
										<select name="stateID" id="id_state"
											class="form-control sr_dropdown_select"
											onfocus="Managers.clearMsg(this.id);"
											{if $validate_onblur} onblur="Managers.isSelectSet(this.id, 'Please select a State');"{/if}>
											{if !$form.stateID || $form.stateID == ""} {assign
											var='form_state'
											value=$smarty.session.geoip_record.region_id} {else} {assign
											var='form_state' value=$form.stateID} {/if}
											<option value="0">(select)</option> {foreach from=$states
											item="state"}
											<option value="{$state.pkStateID}" {if $state.pkStateID==$form_state} selected{/if}>{$state.StateName} ({$state.StateID})</option>
											{/foreach}
										</select>
									</div>
									<div
										class="{if $errors.stateID}error_box msg_show{else}msg_hide{/if}"
										id="id_state_msg">
										<div class="msg_text" id="id_state_msg_text">{$errors.stateID}</div>
										<div class="clear_both"></div>
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="form_row sr_acct_data_row inner-addon right-addon">
									<i class="fa fa-globe"></i>
									<i class="glyphicon glyphicon-ok" style="display: none"></i> 
									<div class="sr_dropdown_container">
										<select name="countryID" id="id_country"
											class="form-control sr_dropdown_select"
											onfocus="Managers.clearMsg(this.id);"> {if !$form.countryID
											|| $form.countryID == ""} {if
											$_CONFIG.SITE.COBRAND.countryID} {assign var='form_country'
											value=$_CONFIG.SITE.COBRAND.countryID} {else} {assign
											var='form_country'
											value=$smarty.session.geoip_record.country_id} {/if} {else}
											{assign var='form_country' value=$form.countryID} {/if}
											<option value="0">(select)</option> {foreach from=$countries
											item="country"}
											<option value="{$country.pkCountryID}"
												{if $country.pkCountryID==$form_country} selected{/if}>{$country.CountryName} ({$country.CountryCode})</option>
											{/foreach}
										</select>
									</div>
									<div
										class="{if $errors.countryID}error_box msg_show{else}msg_hide{/if}"
										id="id_country_msg">
										<div class="msg_text" id="id_country_msg_text">{$errors.countryID}</div>
										<div class="clear_both"></div>
									</div>
								</div>

								<div class="form_row sr_acct_data_row inner-addon right-addon">
									<i class="fa fa-map-marker"></i>
									<i class="glyphicon glyphicon-ok" style="display: none"></i> 
									<input class="form-control" type="text" name="ZipCode" id="id_zipcode" 	value="{$form.ZipCode}" placeholder="Zip Code" />
									<div id="id_zipcode_msg"></div>
								</div>

								<div class="form_row sr_acct_data_row inner-addon right-addon">
									<i class="fa fa-phone" aria-hidden="true"></i>
									<i class="glyphicon glyphicon-ok" style="display: none"></i> 
									<input class="form-control" type="text" name="PhoneNumber" id="id_phonenumber" value="{$form.PhoneNumber}" placeholder="Phone Number" />
									<div
										class="{if $errors.stateID}error_box msg_show{else}msg_hide{/if}"
										id="id_phonenumber_msg">
										<div class="msg_text" id="id_phonenumber_msg_text">{$errors.PhoneNumber}</div>
										<div class="clear_both"></div>
									</div>
								</div>

								<div class="form_row sr_acct_data_row inner-addon right-addon">
									<i class="fa fa-users" aria-hidden="true"></i> 
									<i class="glyphicon glyphicon-ok" style="display: none"></i> 
									<input class="form-control" type="text" name="TotalModels" id="id_totalmodels" min="1" value="{$form.TotalModels}" placeholder="Total Models" />
									<div class="{if $errors.TotalModels}error_box msg_show{else}msg_hide{/if}" id="id_totalmodels_msg">
									<div class="msg_text" id="id_totalmodels_msg_text">{$errors.TotalModels}</div>
									<div class="clear_both"></div>
								</div>
								</div>

								<div class="form_row sr_acct_data_row inner-addon right-addon">
									<i class="fa fa-television" aria-hidden="true"></i>
									<i class="glyphicon glyphicon-ok" style="display: none"></i> 
									<input class="form-control" type="text" name="StudioName" id="id_studioname" value="{$form.StudioName}" placeholder="Studio Name" />
									<div
										class="{if $errors.StudioName}error_box msg_show{else}msg_hide{/if}"
										id="id_studioname_msg">
										<div class="msg_text" id="id_studioname_msg_text">{$errors.StudioName}</div>
										<div class="clear_both"></div>
									</div>
								</div>

								<div class="form_row sr_acct_data_row inner-addon right-addon">
									<i class="fa fa-sign-in" aria-hidden="true"></i>
									<i class="glyphicon glyphicon-ok" style="display: none"></i> 
									<input class="form-control" type="text" name="StudioLogin" id="id_studiologin" value="{$form.StudioLogin}" placeholder="Studio Login" />
									<div
										class="{if $errors.StudioLogin}error_box msg_show{else}msg_hide{/if}"
										id="id_studiologin_msg">
										<div class="msg_text" id="id_studiologin_msg_text">{$errors.StudioLogin}</div>
										<div class="clear_both"></div>
									</div>
								</div>

								<div class="form_row sr_acct_data_row inner-addon right-addon">
									<i class="fa fa-key" aria-hidden="true"></i> 
									<i class="glyphicon glyphicon-ok" style="display: none"></i> 
									<input class="form-control" type="password" name="StudioPassword" id="id_studiopassword" value="{$form.StudioPassword}" placeholder="Studio Password" />
									<div
										class="{if $errors.StudioPassword}error_box msg_show{else}msg_hide{/if}"
										id="id_studiopassword_msg">
										<div class="msg_text" id="id_studiopassword_msg_text">{$errors.StudioPassword}</div>
										<div class="clear_both"></div>
									</div>
								</div>

								<div class="form_row sr_acct_data_row inner-addon right-addon">
									<i class="fa fa-check" aria-hidden="true"></i>
									<i class="glyphicon glyphicon-ok" style="display: none"></i> 
									<input class="form-control" type="password" name="ConfirmPassword" id="id_confirmpassword" value="{$form.ConfirmPassword}" placeholder="Confirm Password" />
									<div class="{if $errors.ConfirmPassword}error_box msg_show{else}msg_hide{/if}" id="id_confirmpassword_msg">
									<div class="msg_text" id="id_confirmpassword_msg_text">{$errors.ConfirmPassword}</div>
										<div class="clear_both"></div>
									</div>
								</div>

								<div class="form_row ">
									<label for="id_message" class="form_label sr_acct_data_label">Message: 
									<span style="font-size: 10px; padding-right: 5px;"><span
											id="id_message_txt_count">{math equation="y-x"
												x=$form.Message|count_characters
												y=$smarty.const.MR_MESSAGE_SIZE}</span> characters</span></label>
									<textarea name="Message" id="id_message"
										onkeyup="return Managers.txtSize(this, {$smarty.const.MR_MESSAGE_SIZE});"
										onfocus="Managers.clearMsg(this.id);"
										{if $validate_onblur} onblur="stripTags(this);"{/if}>{$form.Message}</textarea>
									<div
										class="{if $errors.Message}error_box msg_show{else}msg_hide{/if}"
										id="id_message_msg">
										<div class="msg_text" id="id_message_msg_text">{$errors.Message}</div>
										<div class="clear_both"></div>
									</div>
								</div>

								<div class="clear_both"></div>
							</div>
						</div>
					</div>

					<div id="sr_middle" class="col-sm-6">
						<div id="sr_pymnt_info">
							<div id="sr_pymnt_info_data" class="form">
								<div id="sr_pymnt_info_data_bar" class="bar2">
									<div class="wcc-label wlb">Payment Information</div>
								</div>

								<div data-module-box="true" id="register_studios_box_2">

									<div class="form_row sr_pymnt_data_row">

										<i class="fa fa-money" aria-hidden="true"></i>
										<div class="sr_dropdown_container">
											<select name="methodID" id="id_method_id"
												class="form-control sr_dropdown_select"
												onfocus="Managers.clearMsg(this.id);"
												onchange="return Managers.changePaymentMethod(this.id);">
												{if !$form.methodID || $form.methodID == ""} {assign
												var='form_method' value=$methods[0].id} {else} {assign
												var='form_method' value=$form.methodID} {/if} {foreach
												from=$methods item="method"}
												<option value="{$method.id}" {if $method.id==$form_method} selected{/if}>{$method.name}</option>
												{/foreach}
											</select>
										</div>
										<div
											class="{if $errors.methodID}error_box msg_show{else}msg_hide{/if}"
											id="id_method_id_msg">
											<div class="msg_text" id="id_method_id_msg_text">{$errors.methodID}</div>
											<div class="clear_both"></div>
										</div>
									</div>

									<div class="form_row sr_pymnt_data_row">

										{*
										<!-- PAYOUT_METHOD_CHECK  -->
										*}
										<div id="sr_pm_{$PAYOUT_METHOD_CHECK}" class="sr_payment_methods" {if $form_method !=$PAYOUT_METHOD_CHECK} style="display: none;"{/if}>
											<div class="form_row sr_pymnt_data_row">
												<i class="fa fa-user"></i> 
												<input class="form-control" type="text" name="checkPayableTo" id="id_pm_check_payto" value="{$form.checkPayableTo}" placeholder="Pay to" />
												<div class="{if $errors.checkPayableTo}error_box msg_show{else}msg_hide{/if}" id="id_pm_check_payto_msg">
											<div class="msg_text" id="id_pm_check_payto_msg_text">{$errors.checkPayableTo}</div>
										<div class="clear_both"></div>
									</div>
											</div>

											<div class="form_row sr_pymnt_data_row">
												<i class="fa fa-home" aria-hidden="true"></i> 
												<input class="form-control" type="text" name="checkAddress" id="id_pm_check_address" value="{$form.checkAddress}" placeholder="Address" />
												<div class="{if $errors.checkAddress}error_box msg_show{else}msg_hide{/if}" id="id_pm_check_address_msg">
													<div class="msg_text" id="id_pm_check_address_msg_text">{$errors.checkAddress}</div>
													<div class="clear_both"></div>
												</div>
											</div>

											<div class="form_row sr_pymnt_data_row">
												<i class="fa fa-map-signs" aria-hidden="true"></i> 
												<input class="form-control" type="text" name="checkCity" id="id_pm_check_city" value="{$form.checkCity}" placeholder="City" />
												<div class="{if $errors.checkCity}error_box msg_show{else}msg_hide{/if}" id="id_pm_check_city_msg" >
													<div class="msg_text" id="id_pm_check_city_msg_text">{$errors.checkCity}</div>
													<div class="clear_both"></div>
												</div>
											</div>

											<div class="form_row sr_pymnt_data_row">
												<i class="fa fa-location-arrow" aria-hidden="true"></i>
												<div class="sr_dropdown_container">
													<select name="checkStateID" id="id_pm_check_state"
														class="form-control sr_dropdown_select"
														onfocus="Managers.clearMsg(this.id);"> {if
														!$form.checkStateID || $form.checkStateID == ""} {assign
														var='form_state'
														value=$smarty.session.geoip_record.region_id} {else}
														{assign var='form_state' value=$form.checkStateID} {/if}
														<option value="0">(select)</option> {foreach from=$states
														item="state"}
														<option value="{$state.pkStateID}" {if $state.pkStateID==$form_state} selected{/if}>{$state.StateName} ({$state.StateID})</option>
														{/foreach}
													</select>
												</div>
												<div class="{if $errors.checkStateID}error_box msg_show{else}msg_hide{/if}" id="id_pm_check_state_msg">
													<div class="msg_text" id="id_pm_check_state_msg_text">{$errors.checkStateID}</div>
													<div class="clear_both"></div>
												</div>
											</div>

											<div class="form_row sr_pymnt_data_row">
												<i class="fa fa-map-marker"></i> 
												<input class="form-control" type="text" name="checkZip" id="id_pm_check_zipcode" placeholder="Zip/Postal Code" value="{$form.checkZip}" {if $validate_onblur} onblur="Managers.isSet(this.id, 'Enter Pay To Zip Code');" {/if} />
												<div class="{if $errors.checkZip}error_box msg_show{else}msg_hide{/if}" id="id_pm_check_zipcode_msg" >
													<div class="msg_text" id="id_pm_check_zipcode_msg_text">{$errors.checkZip}</div>
													<div class="clear_both"></div>
												</div>
											</div>

											<div class="form_row sr_pymnt_data_row">
												<i class="fa fa-globe" aria-hidden="true"></i>
												<div class="sr_dropdown_container">
													<select name="checkCountryID" id="id_pm_check_country"
														class="form-control sr_dropdown_select"
														onfocus="Managers.clearMsg(this.id);"
														onchange="return Managers.changeCountry();"> {if
														!$form.checkCountryID || $form.checkCountryID == ""} {if
														$_CONFIG.SITE.COBRAND.checkCountryID} {assign
														var='form_country'
														value=$_CONFIG.SITE.COBRAND.checkCountryID} {else} {assign
														var='form_country'
														value=$smarty.session.geoip_record.country_id} {/if}
														{else} {assign var='form_country'
														value=$form.checkCountryID} {/if}
														<option value="0">(select)</option> {foreach
														from=$countries item="country"}
														<option value="{$country.pkCountryID}"
															{if $country.pkCountryID==$form_country} selected{/if}>{$country.CountryName} ({$country.CountryCode})</option>
														{/foreach}
													</select>
												</div>
												<div
													class="{if $errors.checkCountryID}error_box msg_show{else}msg_hide{/if}"
													id="id_pm_country_msg"
													style="margin-left: 131px; margin-bottom: 0px; width: 184px;">
													<div class="msg_text" id="id_pm_country_msg_text">{$errors.checkCountryID}</div>
													<div class="clear_both"></div>
												</div>
											</div>

										</div>

										{*
										<!-- PAYOUT_METHOD_BANKWIRE  -->
										*}
										<div id="sr_pm_{$PAYOUT_METHOD_BANKWIRE}"
											class="sr_payment_methods"
											{if $form_method !=$PAYOUT_METHOD_BANKWIRE}
											style="display: none;"{/if}>
											<div class="form_row sr_pymnt_data_row">
												<i class="fa fa-file-text-o" aria-hidden="true"></i> <input
													class="form-control" type="text" name="bankwireSwiftCode"
													id="id_pm_bankwire_swift_code" placeholder="SWIF Code"
													onfocus="Managers.clearMsg(this.id);"
													value="{$form.bankwireSwiftCode}"
													{if $validate_onblur} onblur="Managers.isSet(this.id, 'Please enter Bank Swift Code');" {/if} />
												<div class="{if $errors.bankwireSwiftCode}error_box msg_show{else}msg_hide{/if}" id="id_pm_bankwire_swift_code_msg">
													<div class="msg_text"
														id="id_pm_bankwire_swift_code_msg_text">{$errors.bankwireSwiftCode}</div>
													<div class="clear_both"></div>
												</div>
											</div>

											<div class="form_row sr_pymnt_data_row">
												<i class="fa fa-university" aria-hidden="true"></i> <input
													class="form-control" type="text" name="bankwireBankName"
													id="id_pm_bankwire_bankname" placeholder="Bank Name"
													onfocus="Managers.clearMsg(this.id);"
													value="{$form.bankwireBankName}"
													{if $validate_onblur} onblur="Managers.isSet(this.id, 'Please enter the Bank Name');" {/if} />
												<div class="{if $errors.bankwireBankName}error_box msg_show{else}msg_hide{/if}" id="id_pm_bankwire_bankname_msg" >
													<div class="msg_text" id="id_pm_bankwire_bankname_msg_text">{$errors.bankwireBankName}</div>
													<div class="clear_both"></div>
												</div>
											</div>

											<div class="form_row sr_pymnt_data_row">
												<i class="fa fa-university" aria-hidden="true"></i> <input
													class="form-control" type="text" name="bankwireBankAddress"
													id="id_pm_bankwire_bankaddress" placeholder="Bank Address"
													onfocus="Managers.clearMsg(this.id);"
													value="{$form.bankwireBankAddress}"
													{if $validate_onblur} onblur="Managers.isSet(this.id, 'Please enter the Bank Address');" {/if} />
												<div class="{if $errors.bankwireBankAddress}error_box msg_show{else}msg_hide{/if}" id="id_pm_bankwire_bankaddress_msg" >
													<div class="msg_text"
														id="id_pm_bankwire_bankaddress_msg_text">{$errors.bankwireBankAddress}</div>
													<div class="clear_both"></div>
												</div>
											</div>

											<div class="form_row sr_pymnt_data_row">
												<i class="fa fa-check" aria-hidden="true"></i> <input
													class="form-control" type="text" name="bankwireAccountName"
													id="id_pm_bankwire_accountname" placeholder="Account Name"
													onfocus="Managers.clearMsg(this.id);"
													value="{$form.bankwireAccountName}"
													{if $validate_onblur} onblur="Managers.isSet(this.id, 'Please enter the Account Number');" {/if} />
												<div class="{if $errors.bankwireAccountName}error_box msg_show{else}msg_hide{/if}" id="id_pm_bankwire_accountnamee_msg">
													<div class="msg_text"
														id="id_pm_bankwire_accountname_msg_text">{$errors.bankwireAccountName}</div>
													<div class="clear_both"></div>
												</div>
											</div>

											<div class="form_row sr_pymnt_data_row">
												<i class="fa fa-hashtag" aria-hidden="true"></i> <input
													class="form-control" type="text"
													name="bankwireAccountNumber"
													id="id_pm_bankwire_accountnumber"
													placeholder="Account Number"
													onfocus="Managers.clearMsg(this.id);"
													value="{$form.bankwireAccountNumber}"
													{if $validate_onblur} onblur="Managers.isSet(this.id, 'Please enter the Account Number');" {/if} />
												<div class="{if $errors.bankwireAccountNumber}error_box msg_show{else}msg_hide{/if}" id="id_pm_bankwire_accountnumber_msg">
													<div class="msg_text"
														id="id_pm_bankwire_accountnumber_msg_text">{$errors.bankwireAccountNumber}</div>
													<div class="clear_both"></div>
												</div>
											</div>

											<div class="form_row sr_pymnt_data_row">
												<i class="fa fa-random" aria-hidden="true"></i> <input
													class="form-control" type="text"
													name="bankwireRoutingNumber"
													id="id_pm_bankwire_routingnumber"
													placeholder="Routing Number"
													onfocus="Managers.clearMsg(this.id);"
													value="{$form.bankwireRoutingNumber}"
													{if $validate_onblur} onblur="Managers.isSet(this.id, 'Please enter the Routing Number');" {/if} />
												<div class="{if $errors.bankwireRoutingNumber}error_box msg_show{else}msg_hide{/if}" id="id_pm_bankwire_routingnumber_msg" >
													<div class="msg_text"
														id="id_pm_bankwire_routingnumber_msg_text">{$errors.bankwireRoutingNumber}</div>
													<div class="clear_both"></div>
												</div>
											</div>

											<div class="form_row sr_pymnt_data_row">
												<i class="fa fa-paragraph" aria-hidden="true"></i> <input
													class="form-control" type="text" name="bankwireIban"
													placeholder="Iban Code" id="id_pm_bankwire_iban"
													value="{$form.bankwireIban}"
													onfocus="Managers.clearMsg(this.id);"
													{if $validate_onblur} onblur="Managers.isSet(this.id, 'Please enter the Iban');" {/if} />
												<div class="{if $errors.bankwireIban}error_box msg_show{else}msg_hide{/if}" id="id_pm_bankwire_iban_msg" >
													<div class="msg_text" id="id_pm_bankwire_iban_msg_text">{$errors.bankwireIban}</div>
													<div class="clear_both"></div>
												</div>
											</div>

											<div class="form_row sr_pymnt_data_row">
												<label for="id_pm_bankwire_other"
													class="form_label sr_pymnt_data_label">Other:<br />
												<span style="font-size: 10px; padding-right: 5px;"><span
														id="id_pm_bankwire_other_txt_count">{math equation="y-x"
															x=$form.bankwireOther|count_characters
															y=$smarty.const.MR_MESSAGE_SIZE}</span> characters</span></label>
												<textarea class="form-control" type="text"
													name="bankwireOther" id="id_pm_bankwire_other"
													onfocus="Managers.clearMsg(this.id);"
													onkeyup="return Managers.txtSize(this, {$smarty.const.MR_MESSAGE_SIZE});"
													onblur="stripTags(this);">{$form.bankwireOther}</textarea>
												<div class="{if $errors.bankwireOther}error_box msg_show{else}msg_hide{/if}" id="id_pm_bankwire_other_msg" >
													<div class="msg_text" id="id_pm_bankwire_other_msg_text">{$errors.bankwireOther}</div>
													<div class="clear_both"></div>
												</div>
											</div>

										</div>

										{*
										<!-- PAYOUT_METHOD_PAYPAL  -->
										*}
										<div id="sr_pm_{$PAYOUT_METHOD_PAYPAL}"
											class="sr_payment_methods"
											{if $form_method !=$PAYOUT_METHOD_PAYPAL}
											style="display: none;"{/if}>
											<div class="form_row sr_pymnt_data_row">
												<i class="fa fa-envelope" aria-hidden="true"></i> <input
													class="form-control" type="email" name="paypalEmail"
													id="id_pm_paypal_email" value="{$form.paypalEmail}"
													placeholder="Paypal" onfocus="Managers.clearMsg(this.id);"
													{if $validate_onblur} onblur="Managers.vEmail(this.id);" {/if} />
												<div class="{if $errors.paypalEmail}error_box msg_show{else}msg_hide{/if}" id="id_pm_paypal_email_msg">
													<div class="msg_text" id="id_pm_paypal_email_msg_text">{$errors.paypalEmail}</div>
													<div class="clear_both"></div>
												</div>
											</div>

										</div>

										{*
										<!-- PAYOUT_METHOD_EPASSPORTE  -->
										*}
										<div id="sr_pm_{$PAYOUT_METHOD_EPASSPORTE}"
											class="sr_payment_methods"
											{if $form_methodD !=$PAYOUT_METHOD_EPASSPORTE}
											style="display: none;"{/if}>
											<div class="form_row sr_pymnt_data_row">
												<label for="id_pm_epassporte_id"
													class="form_label sr_pymnt_data_label">Epassporte ID:</label>
												<input class="form-control" type="email" name="epassporteID"
													id="id_pm_epassporte_id" value="{$form.epassporteID}"
													onfocus="Managers.clearMsg(this.id);"
													{if $validate_onblur} onblur="Managers.isSet(this.id, 'Please enter your E-Passport ID#');" {/if} />
												<div class="{if $errors.epassporteID}error_box msg_show{else}msg_hide{/if}" id="id_pm_epassporte_id_msg">
													<div class="msg_text" id="id_pm_epassporte_id_msg_text">{$errors.epassporteID}</div>
													<div class="clear_both"></div>
												</div>
											</div>

										</div>

										{*
										<!-- PAYOUT_METHOD_PAYONEER  -->
										*}
										<div id="sr_pm_{$PAYOUT_METHOD_PAYONEER}"
											class="sr_payment_methods"
											{if $form_method !=$PAYOUT_METHOD_PAYONEER}
											style="display: none;"{/if}>
											<div class="form_row sr_pymnt_data_row">
												<div>
													<p>Payoneer Note:</p>
													<br>
												</div>
												<div>{if $parent_studio_info} You will be provided with a
													link to register your Payoneer card from
													{$parent_studio_info.studio_name} after your studio
													application has been approved. {else} You will be provided
													with a link to register your Payoneer card in your managers
													area after your studio application has been approved. {/if}
												</div>
												<div class="{if $errors.Payoneer}error_box msg_show{else}msg_hide{/if}" id="id_pm_payoneer_msg">
													<div class="msg_text" id="id_pm_payoneer_msg_text">{$errors.Payoneer}</div>
													<div class="clear_both"></div>
												</div>
											</div>

										</div>

										{*
										<!-- PAYOUT_METHOD_PAXUM  -->
										*}
										<div id="sr_pm_{$PAYOUT_METHOD_PAXUM}"
											class="sr_payment_methods"
											{if $form_method !=$PAYOUT_METHOD_PAXUM}
											style="display: none;"{/if}>
											<div class="form_row sr_pymnt_data_row">
												<i class="fa fa-envelope" aria-hidden="true"></i> <input
													class="form-control" type="email" name="paxum_email"
													id="id_pm_paxum_email" value="{$form.paxum_email}"
													placeholder="Paxum email"
													onfocus="Managers.clearMsg(this.id);"
													{if $validate_onblur} onblur="Managers.vEmail(this.id);" {/if} />
												<div class="{if $errors.paxum_email}error_box msg_show{else}msg_hide{/if}" id="id_pm_paxum_email_msg" >
													<div class="msg_text" id="id_pm_paxum_email_msg_text">{$errors.paxum_email}</div>
													<div class="clear_both"></div>
												</div>
											</div>

										</div>

										<div class="clear_both"></div>
									</div>
								</div>

							</div>
						</div>

						<div id="sr_pymnt_info">
							<div id="sr_pymnt_info_data" class="form">
								<div id="sr_pymnt_info_data_bar" class="bar2">
									<div class="wcc-label wlb">Contact Information</div>
								</div>

								<div data-module-box="true" id="register_studios_box_3">

									<div class="form_row sr_pymnt_data_row">
										<i class="fa fa-envelope" aria-hidden="true"></i> 
										<input class="form-control" type="email" name="EMail" id="id_email" value="{$form.EMail}" placeholder="Email" {if $validate_onblur} onblur="Managers.vEmail(this.id);" {/if} />
										<div class="{if $errors.EMail}error_box msg_show{else}msg_hide{/if}" id="id_email_msg">
											<div class="msg_text" id="id_email_msg_text">{$errors.EMail}</div>
											<div class="clear_both"></div>
										</div>
									</div>

									<div class="form_row sr_pymnt_data_row">
										<i class="fa fa-commenting" aria-hidden="true"></i>
										<div class="sr_dropdown_container">
											<select name="im_type" id="id_im_type"
												class="form-control sr_dropdown_select"
												onfocus="Managers.clearMsg(this.id);Managers.clearMsg('id_im_data');">
												<option value="0">(select)</option>
												<option value="aol" {if $form.im_type=="aol"} selected{/if}>aol</option>
												<option value="icq" {if $form.im_type=="icq"} selected{/if}>icq</option>
												<option value="msn" {if $form.im_type=="msn"} selected{/if}>msn</option>
												<option value="yahoo" {if $form.im_type=="yahoo"} selected{/if}>Yahoo</option>
											</select>
										</div>
										<div class="{if $errors.im_type}error_box msg_show{else}msg_hide{/if}" id="id_im_id_msg" >
											<div class="msg_text" id="id_im_id_msg_text">{$errors.im_type}</div>
											<div class="clear_both"></div>
										</div>
									</div>

									<div class="form_row sr_pymnt_data_row">
										<i class="fa fa-comments-o" aria-hidden="true"></i> 
										<input class="form-control" type="text" name="imData" id="id_im_data" value="{$form.imData}" placeholder="IM #:" data-req="false"  />
										<div class="{if $errors.imData}error_box msg_show{else}msg_hide{/if}" id="id_im_data_msg" >
											<div class="msg_text" id="id_im_data_msg_text">{$errors.imData}</div>
											<div class="clear_both"></div>
										</div>
									</div>

									<div class="form_row sr_pymnt_data_row">
										<i class="fa fa-facebook-official" aria-hidden="true"></i> 
										<input class="form-control" type="text" name="Facebook" id="id_facebook" value="{$form.Facebook}" placeholder="facebook" data-req="false"/>
										<div class="{if $errors.Facebook}error_box msg_show{else}msg_hide{/if}" id="id_facebook_msg">
											<div class="msg_text" id="id_facebook_msg_text">{$errors.Facebook}</div>
											<div class="clear_both"></div>
										</div>
									</div>

									<div class="form_row sr_pymnt_data_row">
										<i class="fa fa-twitter" aria-hidden="true"></i>
										<input class="form-control" type="text" name="Twitter" id="id_twitter" value="{$form.Twitter}" placeholder="twitter" data-req="false" />
										<div class="{if $errors.Twitter}error_box msg_show{else}msg_hide{/if}" id="id_twitter_msg" >
											<div class="msg_text" id="id_twitter_msg_text">{$errors.Twitter}</div>
											<div class="clear_both"></div>
										</div>
									</div>

									<div class="clear_both"></div>
								</div>
							</div>
						</div>

					</div>
					<div class="clearfix"></div>
					<div id="sr_submit_button_container">
						<div id="sr_submit_button_wrapper" class="text-center col-sm-6 col-sm-offset-3">
							<button class="btn btn-primary form-submit">Submit</button>
						</div>
						<div class="clearfix"></div>
					</div>

					<input type="hidden" name="isSet" value="1" />
				</form>
				{else}
				<div class="page_title">Model Studios Wanted - Registration Completed!</div>
				<div id="sr_complete">
					<div id="sr_complete_form" class="form">
						<div id="sr_complete_data_bar" class="bar2">
							<h3>What's Next?</h3>
						</div>
						<div id="sr_complete_form_content" data-module-box="true" >
							<p>Thank you for registering as a studio. We will need to review
								your application before you can be approved to login and start
								submitting models for work. This process can take 24 to 48 hours
								to complete. You will receive a confirmation email when your
								account has been approved with more information on how to submit
								your models and get your studio setup.</p>
							<hr>
							<div class="col-sm-7">
								<div class="section-label sr_complete_label">
									<strong>Your login credentials are below</strong>
								</div>
								<div class="sr_complete_elem">
									<div class="section-label">Login URL:</div>
									<div class="sr_complete_data">{$manager_login_url}</div>
								</div>
								<div class="sr_complete_elem">
									<span class="section-label">Username:</span>
									<span class="sr_complete_data">{$form.StudioLogin}</span>
								</div>
								<div class="sr_complete_elem" >
									<span class="section-label">Password:</span>
									<span class="sr_complete_data">{$form.StudioPassword}</span>
								</div>
							</div>
							<div class="col-sm-5">
								<div id="sr_right_image" class="hidden-xs">
									<img src="{$_SITE_IMAGES_DEFAULT_}/step1_graphic.png" />
								</div>
	
								<div id="sr_continue">
									<a href="{$continue_url}">
										<div id="sr_continue_button" class="btn button-2">Continue</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				{/if}
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	{include file="$_THEME/components/footer.tpl" show=$show}
	{literal}
	<script>
	
	$('input').on('blur', function(){
		var $this = $(this);
		var id = $this.attr('id')
		console.log('id ' + id )
		if($this.attr('data-req') != "false" || $this.attr('data-req') ===  undefined){
			if( $this.val() == "" ){
				$this.css('border', '1px solid rgb(255, 17, 0)')
				var static_holder = $this.prop('placeholder');
				static_holder = static_holder.replace(' is required!', '');
				$this.prop('placeholder', static_holder+' is required!' )
				
				console.log('placeholder '+ $this.prop('placeholder') )
			}else{
				
				if( id == "id_confirmpassword" ){
						var pass = $('#id_studiopassword').val()
						var confirm = $this.val();
						if(confirm === pass ){
							$this.css('border', '1px solid #4CAF50');
							$this.parent().find('.glyphicon').show();
						}else{
							$this.css('border', '1px solid rgb(255, 17, 0)')
							}
					}
				else if( id == "id_zipcode" && $this.val().length < 5){
						$this.css('border', '1px solid rgb(255, 17, 0)')
				}else{
						$this.css('border', '1px solid #4CAF50');
						$this.parent().find('.glyphicon').show();
						$this.parent().find('.msg_text').hide()
					}
				
			}
		}else{
			console.log("Not req")
		}
		
	});
	
	</script>
	{/literal}
</body>
{include file="$_THEME/components/html_footer.tpl" show=$show}