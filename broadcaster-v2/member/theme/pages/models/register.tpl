<!-- wcc3 model registration  -->
{include file="wcc3/components/html_header.tpl" show=$show}
{include file="wcc3/components/models/header.tpl" show=$show}
<div id="overlay" style="display: none">
	<img src="">
</div>
<div id="model_body" class="wcc-container">
	{if $model_registration_step eq 10 }
	<h2 class="text-center">
		If you have reached this page, your pictures and documents have been
		submitted and are pending review. <br> If you closed the application
		page and need help please contact support using the below information.
	</h2>
	{/if} {if $model_registration_step eq 1}
	<div class="row">
		<div id="registration_form_1"
			class="col-lg-4 col-lg-offset-2 col-md-6 hidden-xs">
			<h2>Learn about Webcam Modeling</h2>
			<hr>
			<div class="panel-group" id="accordion" role="tablist"
				aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#1" aria-expanded="true" aria-controls="collapseOne">
								Overview </a>
						</h4>
					</div>
					<div id="1" class="panel-collapse collapse in" role="tabpanel"
						aria-labelledby="headingOne">
						<div class="panel-body">
							We operate one of the largest and most popular adult webcam
							networks in the world. There are NO FEES to join and we pay some
							of the highest model commissions in the industry. We accept male
							and female models, couples, threesomes and transgenders. Approval
							time is normally one business day.
							<ul>
								<li>This form is for registering as a NEW model. If you're
									already a model, <a
									{if $whitelabel_settings.model_login}href="{$whitelabel_settings.model_login}"
									target="_self" rel="nofollow" {else} href=""
									data-toggle="modal" data-target="#loginModal" data-type="model"
									{/if} class="linkplain">click here to login.</a>
								</li>
								<li>If you want to register as a STUDIO and recruit models to
									work for you, please visit our <a
									href="{if $whitelabel_settings.studio_register}{$whitelabel_settings.studio_register}{else}/?{'show=register_studios'|base64_encode}{/if}"
									target="_blank">Studio registraion page.</a>
								</li>
								<li>We operate our own network of cam sites. We are NOT
									affiliated with Streamate or any of the other networks.</li>
								<li>We realize some of this information is personal in nature,
									but US federal law requires us to collect this information and
									to verify the age and identity of all our performers. We
									promise to hold your information in the strictest confidence.</li>
								<li>Your personal information, such as address, phone number,
									real name, etc... will NEVER appear on our website and will
									NEVER be shared with customers.</li>
							</ul>

						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#2" aria-expanded="false"
								aria-controls="collapseTwo"> How this Works </a>
						</h4>
					</div>
					<div id="2" class="panel-collapse collapse" role="tabpanel"
						aria-labelledby="headingTwo">
						<div class="panel-body">
							<p>Ready for an exciting and profitable career as a webcam model?
								Submit this application and you can start working from the
								privacy of your home within one business day.</p>
							<p>Working as a webcam model is similar to working as a dancer in
								a gentlemen's club. When you login to the site, you enter a free
								video chat room. Members enter the room and your job is to chat
								with them, flirt and entice them to tip you or buy private shows
								from you. This is like being a dancer on stage. While you're in
								free chat, you're only working for tips, but once a member takes
								you private, you start getting paid by the minute.</p>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#3" aria-expanded="false"
								aria-controls="collapseThree">Free Chat NOT : <em>Private Only
									Mode</em> and <em>Fake Private Shows</em></a>
						</h4>
					</div>
					<div id="3" class="panel-collapse collapse" role="tabpanel"
						aria-labelledby="headingThree">
						<div class="panel-body">
							We offer a unique <em>Private Only Mode</em>, that allows you to
							be online and available for private sessions, <strong>WITHOUT</strong>
							being in free chat. While free chat is great for promoting
							yourself on the site, we know you have a life and don't
							necessarily want to chat with members all day. You should spend
							as much time in free chat as possible, but when you're busy doing
							other stuff or just want to relax, you can enable <em>Private
								Only Mode.</em>
							<ul>
								<li>When you login to broadcast, you'll see a Private Only Mode
									button in the top-left corner of the broadcast application.</li>
								<li>When you enable Private Only Mode, it means you're online,
									but ONLY available for private shows, NOT free chat.</li>
								<li>Your status indicator on the website will show you as
									Available, rather than Online.</li>
								<li>Members who enter your room will see a message stating that
									they can NOT chat with you, but they CAN request a private
									show.</li>
								<li>In Private Only Mode, you can choose between broadcasting
									video or turning your video off. If your video is off, we'll
									display your profile photo where the video would normally
									appear.</li>
								<li>When members request a private, you'll receive a private
									chat request popup notification on your screen, along with an
									audio alert. Be sure to stay near your computer when Private
									Only mode is enabled, so you don't lose any privates!</li>
							</ul>
							<hr>
							We also offer <em>Fake Private shows:</em>
							<ul>
								<li>When you're broadcasting on multiple sites and you go into a
									private show on another site, instead of going on break or
									logging out, you can click the Fake Private Show button. This
									will make it appear to members that you're in a private show on
									our site, even though you're actually in private on another
									site. Some members may then watch your private in Voyeur Mode,
									allowing you to earn money on OUR site by doing a private on
									another site!</li>
								<li>Another way to use Fake Private Shows is if business is slow
									and you're having a hard time getting real privates. In that
									case, you can start a fake private and some members may use
									Voyeur Mode to watch the show. Your Voyeur Mode rate is less
									than your private show rate, so members may feel they're
									getting a deal by watching you do a private at a reduced rate.</li>
								<li>It's very important when you're doing a fake private to act
									as though you're doing a real private. You should be fully
									nude, dancing, masturbating, etc... If you're just sitting in
									front of the camera doing nothing, members will realize you're
									not really in a private and will not want to pay for Voyeur to
									watch you sitting there doing nothing.</li>
							</ul>

						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#4" aria-expanded="false"
								aria-controls="collapseThree"> Technology Requirements</a>
						</h4>
					</div>
					<div id="4" class="panel-collapse collapse" role="tabpanel"
						aria-labelledby="headingThree">
						<div class="panel-body">
							To broadcast as a model, you'll need the following:
							<ul>
								<li><strong>Fast internet connection</strong> - You need a
									broadband Internet connection, ideally having an UPLOAD speed
									of at least 1 Mbps. Most Internet providers advertise fast
									download speed, but they often don't mention the upload speed,
									so be sure you specify fast upload speed when ordering your
									Internet service.</li>
								<li><strong>Computer or Mobile Device</strong> - Any reasonably
									new computer should work, but the faster the better. Since our
									broadcasting technology is Flash-based, we don't support
									broadcasting from phones or tablets directly. However, there's
									an app called <a href="https://www.puffinbrowser.com">Puffin
										Browser</a>, available for iOS and Android, which allows you
									to run Flash apps on a mobile device. We've tested it with our
									site and it seems to work fairly well. If you don't have access
									to a computer, we suggest you give this a try.</li>
								<li><strong>Webcam</strong> - Although most laptops come with
									webcams built-in, these built-in cams are usually poor quality.
									You can broadcast using a built-in laptop cam, but we highly
									recommend you invest in an external cam, such as a Logitech
									C920. Any external cam will be better than your built-in cam,
									but you should buy the most expensive one you can afford. Even
									the high-end Logitech cams are only about $70 or so, so it's
									not a big expense and it's well worth the investment.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#5" aria-expanded="false"
								aria-controls="collapseThree"> Earning Money</a>
						</h4>
					</div>
					<div id="5" class="panel-collapse collapse" role="tabpanel"
						aria-labelledby="headingThree">
						<div class="panel-body">
							There are several ways to earn money working on our sites:
							<ul>
								<li>Private Shows - Members can take you into a private video
									chat. You get paid by the minute for as long as you remain in
									private with the member.</li>
								<li>Goal Shows - You set a tip goal and a time limit for members
									to reach the goal. If they reach the goal within your time
									limit, you perform a group show.</li>
								<li>Tips - Members can tip you at any time, whether you're in
									free chat, a private show or a goal show.</li>
								<li>Offer Show- Members can submit an offer to you for a private
									show, for example, 20 credits for 10 minutes. You can choose to
									accept, deny or send back an offer you prefer to the member.</li>
								<li>Interactive- Interactive mode is available for all models
									using their OhMiBod or Lovense Lush Interactive toys. While in
									Interactive Mode, paid members are able to control your toy's
									vibration by the amount of tips sent. Smaller tips send smaller
									shorter vibrations and the bigger the tips send longer and
									stronger vibrations.</li>
							</ul>

						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#6" aria-expanded="false"
								aria-controls="collapseThree"> Rates & Percentages</a>
						</h4>
					</div>
					<div id="6" class="panel-collapse collapse" role="tabpanel"
						aria-labelledby="headingThree">
						<div class="panel-body">
							Our models earn 37.5% as a model commission and rewards models for
							selling higher-priced private shows. Additionally, when YOU refer
							a new customer to the site, you earn a 20% referral commission
							based on the amount that the customer spends. The referral
							commission is a lifetime payout. Once you've referred a customer,
							you will earn 20% of every purchase the customer makes on our
							site regardless of which model he spends it on. To qualify for a
							referral commission, the customer must visit the site for the
							first time by clicking on one of the referral links or banners
							that we provide to you.<br> <br>

							{*<!-- <h2>By combining your model commission with your referral
								commission, your total payout can be up to 65%.</h2>
							All new models start out at 2.49 credits/min and receive $0.36
							per credit as the model commission. However, you can increase
							your commission rate by increasing your price for private shows.
							The table below shows the commission percentages for the
							available per-minute rates:
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th nowrap="nowrap">Credits/min</th>

										<th nowrap="nowrap">Model %</th>

										<th nowrap="nowrap">Referral %</th>

										<th nowrap="nowrap">Total %</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td>2.49 - 3.49</td>

										<td>36%</td>

										<td>20%</td>

										<td><strong>56%</strong></td>
									</tr>

									<tr>
										<td>3.99 - 4.49</td>

										<td>41%</td>

										<td>20%</td>

										<td><strong>61%</strong></td>
									</tr>

									<tr>
										<td>4.99 +</td>

										<td>45%</td>

										<td>20%</td>

										<td><strong>65%</strong></td>
									</tr>
								</tbody>
							</table> -->*}
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#7" aria-expanded="false"
								aria-controls="collapseThree"> Getting Paid</a>
						</h4>
					</div>
					<div id="7" class="panel-collapse collapse" role="tabpanel"
						aria-labelledby="headingThree">
						<div class="panel-body">
							<h2>Payment Methods</h2>
							<ul>
								<li>Check (US / Canada)</li>
								<li>Direct deposit to your bank account</li>
								<li>PayPal</li>
								<li>Payoneer</li>
								<li>Paxum</li>
							</ul>
							<h2>About Payoneer / FirstChoice</h2>
							We use Payoneer for international direct deposit and for payment
							via prepaid debit card. Payoneer works in almost every country on
							Earth, so if you live outside the United States, this is a great
							way to get paid. If you don't have a Payoneer account, you can
							sign up for free via the link in your model account. Please use
							the link in your model account, rather than signing up directly
							with Payoneer. This will ensure that your model account is
							properly linked to your Payoneer account. When you register for
							Payoneer, you have two options: Payoneer debit card mailed to you
							or International direct deposit If you already have a Payoneer
							account, you can link your model account to your existing
							Payoneer account. Payments are issued twice per month on the 10th
							and 25th. On the 10th you will be paid for the 16th through the
							end of the prior month and the 25th you will be paid for the
							1st-15th of the current month.
						</div>
					</div>
				</div>
				<!--
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#8" aria-expanded="false"
								aria-controls="collapseThree"> Our Webcam Sites</a>
						</h4>
					</div>
					<div id="8" class="panel-collapse collapse" role="tabpanel"
						aria-labelledby="headingThree">
						<div class="panel-body">We operate our own independent network of
							cam sites. We're NOT affiliated with Streammate, Video Secrets,
							Live Jasmin or any of the other networks. If you currently work
							for any of these companies, you're welcome to work on our sites
							as well and there will be no conflict. Our sites receive a LOT of
							traffic and we maintain a good balance between traffic and models
							online, so when you login, you'll always have customers in your
							room. Visit MongoCams to to view one of the MANY websites you
							will appear on.</div>
					</div>
				</div> -->
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#9" aria-expanded="false"
								aria-controls="collapseThree"> Privacy and Security</a>
						</h4>
					</div>
					<div id="9" class="panel-collapse collapse" role="tabpanel"
						aria-labelledby="headingThree">
						<div class="panel-body">We realize the information we're
							requesting on this sign up form is personal in nature. However,
							US FEDERAL LAW requires us to verify and document your age and
							identity. We promise to hold your information in the strictest
							confidence. Your personal information, such as address, phone
							number and real name, will NEVER appear on our website and will
							NEVER be shared with customers. We allow you to block US states,
							Canadian provinces and entire countries. If you block an area,
							users in that area will NOT be able to see you on our sites.
							We DO, make videos of private shows available for
							RENT OR PURCHASE, but only the member who originally bought the
							private may rental or purchase the recording. You earn an
							additional commission every time a member rents one of your
							privates and there's no option for the member to download the
							video; he must watch it on the site.</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#10" aria-expanded="false"
								aria-controls="collapseThree"> Contact Us / Ask Questions /
								Request Help</a>
						</h4>
					</div>
					<div id="10" class="panel-collapse collapse" role="tabpanel"
						aria-labelledby="headingThree">
						<div class="panel-body">
							Model inquiries: <a href="mailto:models@webcamclub.com?subject=Model inquiry">models@webcamclub.com</a><br>
							Studio inquiries: <a href="mailto:studios@webcamclub.com?subject=Studio inquiry">studios@webcamclub.com</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="registration_form_2" class="col-lg-4 col-md-6 no-padding">
			<h2>Webcam Model Application</h2>
			<h3 class="hidden-lg hidden-md hidden-sm">
				Please enter the below information to start the process of becoming
				a<br> <span class="primary-color"><em>webcam model</em></span>.
			</h3>
			<hr>

			{assign var="select_box_size" value=7}
			<form name="mpe" id="mpe" method="POST" action="{$register_post_url}"
				enctype="application/x-www-form-urlencoded" autocomplete="off"
				onsubmit="Register.submit();">
				<input type="hidden" name="register"  value="model" />
				<input type="hidden" name="mr_session_name"
					value="{$smarty.session.session_name}" /> <input type="hidden"
					name="{$smarty.session.session_name}"
					id="{$smarty.session.session_name}"
					value="{$smarty.session.SessionID}" /> <input type="hidden"
					name="step" id="id_step"
					value="{$smarty.const.MR_REGISTER_STEP_ONE}" /> <input
					type="hidden" name="form[id]" value="{$form.model_id}" /> <input
					type="hidden" name="form[model_id]"
					value="{$form.model_id}" /> <input type="hidden" name="mrc"
					 value="{$mrc_code}" /> <input type="hidden" name="st"
					id="id_st" value="wcc3" /> {if $smarty.session.modelsrep} <input
					type="hidden" name="rep_id" id="rep_id"
					value="{$smarty.session.modelsrep.id}" /> {/if}
				<div id="register_models">
					<div id="mpe_upper">
						<div id="mpe_upper_left">
							<div id="mpe_acct_form" class="form">
								<div class="bar2 mpe_left_bar">

									<h2>Account Information</h2>
								</div>
								<div data-module-box="true">
									<div class="form-group" id="form-group_username">
										<i class="fa fa-user"></i> <i class="glyphicon glyphicon-ok"
											style="display: none"></i> <input class="form-control"
											type="text" name="form[username]" id="id_username"
                                            placeholder="Model Username or Stage Name"
											value="{$form.username}" onblur="Register.vUsername();"
											onfocus="Register.clearMsg(this.id);"
											{literal}pattern="[A-Za-z0-9]{5,25}"
											{/literal} />
										<div
											class="{if $errors.username}{$errors.username.type}_box msg_show{else}msg_hide{/if}"
											id="id_username_msg">
											<div class="msg_text" id="id_username_msg_text">{$errors.username.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>
									<div class="form-group" id="form-group_email">
										<i class="fa fa-envelope"></i> <i
											class="glyphicon glyphicon-ok" style="display: none"></i> <input
											class="form-control" type="email" name="form[email]"
											id="id_email" value="{$form.email}"
											onblur="Register.vEmail(this.id);"
											onfocus="Register.clearMsg(this.id);" placeholder="Model Email" autocomplete="email" />
										<div
											class="{if $errors.email}{$errors.email.type}_box msg_show{else}msg_hide{/if}"
											id="id_email_msg">
											<div class="msg_text" id="id_email_msg_text">{$errors.email.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>
									<div id="form-group_password"
										class="split-input form-group col-md-6">
										<i class="fa fa-key"></i> <i class="glyphicon glyphicon-ok"
											style="display: none"></i> <input class="form-control"
											type="password" name="form[password]"
											value="{$form.password}" onblur="Register.vPassword();"
											onfocus="Register.clearMsg(this.id);"
                                            id="id_password"
											{literal}pattern="[A-Za-z0-9]{5,25}"
											{/literal}  placeholder="Password" autocomplete="password"  />
										<div
											class="{if $errors.password}{$errors.password.type}_box msg_show{else}msg_hide{/if}"
											id="id_password_msg">
											<div class="msg_text" id="id_password_msg_text">{$errors.password.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>
									<div id="form-group_confirm_password"
										class="split-input form-group col-md-6">
										<i class="fa fa-check" aria-hidden="true"></i> <i
											class="glyphicon glyphicon-ok" style="display: none"></i> <input
											class="form-control" type="password"
											name="form[confirm_password]" id="id_confirm_password"
											value="{$form.confirm_password}"
											onblur="Register.vConfirmPassword();"
											onfocus="Register.clearMsg(this.id);"
											{literal}pattern="[A-Za-z0-9]{5,25}"
											{/literal} placeholder="Confirm Password" autocomplete="Confirm Password" />
										<div
											class="{if $errors.confirm_password}{$errors.confirm_password.type}_box msg_show{else}msg_hide{/if}"
											id="id_confirm_password_msg">
											<div class="msg_text" id="id_confirm_password_msg_text">{$errors.confirm_password.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>
                                    <div class="clearfix"></div>
                                    <div id="model_type" class="form-group">
                                        <i class="fa fa-venus-mars"></i>
                                        <i class="glyphicon glyphicon-ok" style="display: none"></i>
                                        <div class="mpe_dropdown_container">
                                            <select idx="6" name="form[category]" id="id_category" class="form-control" {if $validate_onblur}onclick="Register.isSelectSet(this.id, 'Please select a Type of Model');" {/if} onfocus="Register.clearMsg(this.id);" onchange="Register.getOrientations( this.value );">
                                                <option value="." v="." label="(select model type)">(select model type)</option>
                                                {foreach from=$model_categories item=this}
                                                    <option value="{$this.id}" v="{$this.id}" label="{$this.name}" {if $form.category eq $this.id} selected="selected"{/if}>{$this.name}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    </div>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
						<div id="mpe_upper_right" class="hide">
							<div id="mpe_personal_information" class="form">
								<div class="bar2 mpe_upper_right_bar">
									<hr>
									<h2>Personal Information</h2>
								</div>
								<div data-module-box="true">


									<div class="form-group mpe_right_row col-md-6">
										<i class="fa fa-user" aria-hidden="true"></i> <i
											class="glyphicon glyphicon-ok" style="display: none"></i> <input
											class="form-control" type="text" name="form[fname]"
											id="id_fname" value="{$form.fname}" placeholder="First Name"
											{if $validate_onblur}onblur="Register.isSet(this.id, 'First name can not be blank');"
											{/if} onfocus="Register.clearMsg(this.id);" autocomplete="given-name" />
										<div
											class="{if $errors.fname}{$errors.fname.type}_box msg_show{else}msg_hide{/if}"
											id="id_fname_msg">
											<div class="msg_text" id="id_fname_msg_text">{$errors.fname.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>

									<div class="form-group mpe_right_row col-md-6">
										<i class="fa fa-user" aria-hidden="true"></i> <i
											class="glyphicon glyphicon-ok" style="display: none"></i> <input
											class="form-control" type="text" name="form[lname]"
											id="id_lname" value="{$form.lname}" placeholder="Last Name"
											{if $validate_onblur}onblur="Register.isSet(this.id, 'Last name can not be blank');"
											{/if} onfocus="Register.clearMsg(this.id);" autocomplete="family-name" />
										<div
											class="{if $errors.lname}{$errors.lname.type}_box msg_show{else}msg_hide{/if}"
											id="id_lname_msg">
											<div class="msg_text" id="id_lname_msg_text">{$errors.lname.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>

									<div class="form-group mpe_right_row col-md-6">
										<i class="fa fa-home" aria-hidden="true"></i> <i
											class="glyphicon glyphicon-ok" style="display: none"></i> <input
											class="form-control" type="text" name="form[address]"
											id="id_address" value="{$form.address}" placeholder="Address"
											{if $validate_onblur}onblur="Register.isSet(this.id, Address can not be blank');"
											{/if} onfocus="Register.clearMsg(this.id);" autocomplete="address-line1"/>
										<div
											class="{if $errors.address}{$errors.address.type}_box msg_show{else}msg_hide{/if}"
											id="id_address_msg">
											<div class="msg_text" id="id_address_msg_text">{$errors.address.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>

									<div class="form-group mpe_right_row col-md-6">
										<i class="fa fa-map-signs" aria-hidden="true"></i> <i
											class="glyphicon glyphicon-ok" style="display: none"></i> <input
											class="form-control" type="text" name="form[city]"
											id="id_city" value="{$form.city}"
											{if $validate_onblur}onblur="Register.isSet(this.id, 'City can not be blank');"
											{/if} onfocus="Register.clearMsg(this.id);"
											placeholder="City" autocomplete="address-level2" />
										<div
											class="{if $errors.city}{$errors.city.type}_box msg_show{else}msg_hide{/if}"
											id="id_city_msg">
											<div class="msg_text" id="id_city_msg_text">{$errors.city.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>

									<div class="form-group mpe_right_row col-md-4">
										<i class="fa fa-location-arrow" aria-hidden="true"></i> <i
											class="glyphicon glyphicon-ok" style="display: none"></i>
										<div class="mpe_dropdown_container">
											<select idx="3" name="form[state_id]" id="id_state" autocomplete="address-level1"
												class="form-control"
												{if $validate_onblur}onblur="Register.isSelectSet(this.id, 'Please select a State');"
												{/if} onfocus="Register.clearMsg(this.id);">
												<option value="0" v="0" label="(select)">(select)</option>
												{foreach from=$states item="state"}
												<option value="{$state.pkStateID}" v="{$state.pkStateID}"
													label="{$state.StateName} ({$state.StateID})"
													{if $state.pkStateID==$form.state_id}selected{/if}>{$state.StateName}
													({$state.StateID})</option> {/foreach}
											</select>
										</div>
										<div
											class="{if $errors.state_id}{$errors.state_id.type}_box msg_show{else}msg_hide{/if}"
											id="id_state_msg">
											<div class="msg_text" id="id_state_msg_text">{$errors.state_id.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>

									<div class="form-group mpe_right_row col-md-4">
										<i class="fa fa-map-marker" aria-hidden="true"></i> <i
											class="glyphicon glyphicon-ok" style="display: none"></i> <input
											class="form-control" type="text" name="form[zipcode]"
											id="id_zipcode" value="{$form.zipcode}"
											placeholder="Zip Code" autocomplete="postal-code"
											{if $validate_onblur}onblur="Register.isSet(this.id, 'Postal Code can not be blank');"
											{/if} onfocus="Register.clearMsg(this.id);" />
										<div
											class="{if $errors.zipcode}{$errors.zipcode.type}_box msg_show{else}msg_hide{/if}"
											id="id_zipcode_msg">
											<div class="msg_text" id="id_zipcode_msg_text">{$errors.zipcode.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>

									<div class="form-group mpe_right_row col-md-4">
										<i class="fa fa-globe" aria-hidden="true"></i> <i
											class="glyphicon glyphicon-ok" style="display: none"></i>
										<div class="mpe_dropdown_container">
											<select idx="4" name="form[country_id]" id="id_country" autocomplete="country-name"
												class="form-control"
												{if $validate_onblur}onblur="Register.isSelectSet(this.id, 'Please select a Country');"
												{/if} onfocus="Register.clearMsg(this.id);">
												<option value="0" v="0" label="(select)">(select)</option>
												{foreach from=$countries item="country"}
												<option value="{$country.pkCountryID}"
													v="{$country.pkCountryID}"
													label="{$country.CountryName} ({$country.CountryCode})"
													{if $country.pkCountryID==$form.country_id}selected{/if}>{$country.CountryName}
													({$country.CountryCode})</option> {/foreach}
											</select>
										</div>
										<div
											class="{if $errors.country_id}{$errors.country_id.type}_box msg_show{else}msg_hide{/if}"
											id="id_country_msg">
											<div class="msg_text" id="id_country_msg_text">{$errors.country_id.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>
									<div class="clearfix"></div>
									<div class="form-group mpe_right_row">
										<i class="fa fa-clock-o" aria-hidden="true"></i> <i
											class="glyphicon glyphicon-ok" style="display: none"></i>
										<div class="mpe_dropdown_container">
											<select idx="5" name="form[timezone]" id="id_timezone"
												class="form-control"
												{if $validate_onblur}onblur="Register.isSelectSet(this.id, 'Please select a Time Zone');"
												{/if} onfocus="Register.clearMsg(this.id);">
												<option value="0" v="0" label="0">(select)</option> {foreach
												from=$TimeZones item="tz"}
												<option value="{$tz.location}" v="{$tz.location}"
													label="{$tz.display}"
													{if $tz.location==$form.timezone}selected{/if}>{$tz.display}</option>
												{/foreach}
											</select>
										</div>
										<div
											class="{if $errors.timezone}{$errors.timezone.type}_box msg_show{else}msg_hide{/if}"
											id="id_timezone_msg">
											<div class="msg_text" id="id_timezone_msg_text">{$errors.timezone.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>
									<div class="split-input form-group col-md-6">
										<i class="fa fa-venus-mars" aria-hidden="true"></i> <i
											class="glyphicon glyphicon-ok" style="display: none"></i>
										<div class="mpe_dropdown_container">
											<select idx="16" name="form[sexual_preference_id]"
												id="id_sexual_orientation" class="form-control"
												{if $validate_onblur}onclick="Register.isSelectSet(this.id, 'Please select your Sexual Orientation');"
												{/if} onfocus="Register.clearMsg(this.id);">
												<option value="." v="." label="(select sexual orientation)">(select
													sexual oientation)</option> {foreach
												from=$sexual_preferences item=this} {if
												$this.SexualPreference == "(select)"}
												<option value="." v="." label="(select sexual orientation)">(select
													sexual orientation)</option> {else}
												<option value="{$this.pkSexualPreferenceID}"
													v="{$this.pkSexualPreferenceID}"
													label="{$this.SexualPreference}"
													{if $this.pkSexualPreferenceID==$form.sexual_preference_id}selected{/if}>{$this.SexualPreference}</option>
												{/if} {/foreach}
											</select>
										</div>
										<div
											class="{if $errors.sexual_orientation_id}{$errors.sexual_orientation_id.type}_box msg_show{else}msg_hide{/if}"
											id="id_sexual_orientation_msg">
											<div class="msg_text" id="id_sexual_orientation_msg_text">{$errors.sexual_orientation_id.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>
									<div class="form-group mpe_right_row col-md-6">
										<i class="fa fa-signal" aria-hidden="true"></i>
										<div class="mpe_dropdown_container">
											<select idx="5" name="form[cell_carrier_id]"
												id="id_cell_carrier" class="form-control"
												onfocus="Register.clearMsg(this.id);">
												<option value="0" v="0" label="(select carrier)">(select
													carrier)</option> {foreach from=$cell_carriers
												key="carrier_id" item="carrier"}
												<option value="{$carrier_id}" v="{$carrier_id}"
													label="{$carrier.name}"
													{if $carrier_id==$form.cell_carrier_id}selected{/if}>{$carrier.name}</option>
												{/foreach}
											</select>
										</div>
										<div
											class="{if $errors.cell_carrier_id}{$errors.cell_carrier_id.type}_box msg_show{else}msg_hide{/if}"
											id="id_cell_carrier_msg">
											<div class="msg_text" id="id_cell_carrier_msg_text">{$errors.cell_carrier_id.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>

									<div class="form-group mpe_right_row col-md-6">
										<i class="fa fa-hashtag" aria-hidden="true"></i> <i
											class="glyphicon glyphicon-ok" style="display: none"></i> <input
											class="form-control" type="text"
											name="form[cellphone_number]" id="id_cellphone_number"
											value="{$form.cellphone_number}"
											onfocus="Register.clearMsg(this.id);"
											placeholder="Cell Phone Number" autocomplete="tel-national" />
										<div
											class="{if $errors.cellphone_number}{$errors.cellphone_number.type}_box msg_show{else}msg_hide{/if}"
											id="id_cellphone_number_msg">
											<div class="msg_text" id="id_cellphone_number_msg_text">{$errors.cellphone_number.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>

								</div>

							</div>

						</div>

					</div>

					<div id="mpe_lower">

						<div id="mpe_profile_details" class="form">
							<div data-module-box="true">
								<div id="mpe_lower_left" class="hide">


									<div class="form-group">
										<input type="hidden" name="form[birthday]" id="id_birthday"
											value="{$form.birthday}"
											{if $validate_onblur} onchange="Register.setBirthday();" {/if} />
										<input type="hidden" name="form[age]" id="id_age"
											value="{$form.age}" /> <input type="hidden"
											name="form[astrology_sign]" id="id_astrology_sign"
											value="{$form.astrology_sign}" /> <input type="hidden"
											name="form[chinese_sign]" id="id_chinese_sign"
											value="{$form.chinese_sign}" /> <label
											for="id_birthday_month" class="form_label mpe_left_label">
											Date of Birth:</label>
										<div class="clearboth"></div>
										<div class="mpe_bday_month_container col-md-4">
											<i class="fa fa-calendar" aria-hidden="true"></i> <select
												idx="7" name="form[birthday_month]" id="id_birthday_month"
												class="form-control"
												{if $validate_onblur} onchange="Register.setBirthday();"
												{/if} onfocus="Register.clearMsg('id_birthday');"> {foreach
												from=$age_bday_months key=k item=v}
												<option value="{$v}" v="{$v}" label="{$k}" {if $v==
													$form.birthday_month} selected="selected"{/if}>{$k}</option>
												{/foreach}
											</select>
										</div>

										<div class="mpe_bday_day_container col-md-4">
											<i class="fa fa-calendar" aria-hidden="true"></i> <select
												idx="8" name="form[birthday_day]" id="id_birthday_day"
												class="form-control"
												{if $validate_onblur} onchange="Register.setBirthday();"
												{/if} onfocus="Register.clearMsg('id_birthday');"> {foreach
												from=$age_bday_days key=k item=v}
												<option value="{$v}" v="{$v}" label="{$v}" {if $v==
													$form.birthday_day} selected="selected"{/if}>{$v}</option>
												{/foreach}
											</select>
										</div>

										<div class="mpe_bday_year_container col-md-4">
											<i class="fa fa-calendar" aria-hidden="true"></i> <select
												idx="9" name="form[birthday_year]" id="id_birthday_year"
												class="form-control"
												{if $validate_onblur} onchange="Register.setBirthday();"
												{/if} onfocus="Register.clearMsg('id_birthday');"> {foreach
												from=$age_bday_years key=k item=v}
												<option value="{$v}" v="{$v}" label="{$v}" {if $v==
													$form.birthday_year} selected="selected"{/if}>{$v}</option>
												{/foreach}
											</select>
										</div>

										<div
											class="{if $errors.birthday}{$errors.birthday.type}_box msg_show{else}msg_hide{/if}"
											id="id_birthday_msg">
											<div class="msg_text" id="id_birthday_msg_text">{$errors.birthday.msg}</div>
											<div class="clear_both"></div>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="clear_both"></div>
				<div id="mpe_submit_button_container">
					<div id="mpe_submit_button_wrapper">
						<button type="submit" name="mpe_submit" id="mpe_submit"
							class="btn button-2"
							{if $validate_onsubmit} onclick="return Register.validate();"{/if}>Continue</button>
					</div>
				</div>
			</form>
		</div>
		<div class="clear_both"></div>
	</div>

	{/if}
	<!--  end of container -->
	{if $model_registration_step eq 2 || $_SESSION.model_registration.step
	eq 2}
	<div id="modle_content_body" class="row">
		<div class="col-md-8 col-md-offset-2">
			<div id="model_reg_step_2">
				<form name="mpe_profile_photo_form" id="mpe_profile_photo_form"
					method="POST" action="{$register_post_url}">
					<input type="hidden" name="register"  value="model" />
					<input type="hidden" name="mr_session_name"
						value="{$smarty.session.session_name}" /> <input type="hidden"
						name="{$smarty.session.session_name}"

						value="{$smarty.session.SessionID}" /> <input type="hidden"
						name="step"
						value="{$smarty.const.MR_REGISTER_STEP_TWO}" /> <input
						type="hidden" name="model_id"
						value="{$form.model_id}" /> <input type="hidden" name="mrc"
						 value="{$mrc_code}" /> <input type="hidden"
						name="action" value="profile_photo" /> {if
					$smarty.session.__debug} <input type="hidden" name="__debug"
						 value="{$smarty.session.__debug}" /> <input
						type="hidden" name="__pwd"
						value="{$smarty.session.__pwd}" /> {/if}
					<div id="mpe_step_two_profile_photo">
						<div id="mpe_profile_photo" class="form">
							<div data-module-box="true">
								<div class="col-md-5">
									<div id="mpe_profile_photo_bar" class="bar2">
										<h2>Profile Photo</h2>
									</div>
									<div class="pull-left">
										<img src="{$_SITE_IMAGES_DEFAULT_}/models/profile_photo.png" />
									</div>
									Select a profile photo for your account. You can browse your
									<span class="hidden-xs">computer</span>
									<span class="hidden-lg hidden-md hidden-sm">Phone</span>
									for a picture or choose to take a picture now with your
									<span class="hidden-xs">webcam</span>
									<span class="hidden-lg hidden-md hidden-sm">phone's camera. </span>
									You can always change your profile photo at a later time.
								</div>

								{if !$model_profile_photo_url}
								<div id="mpe_model_photo_upload" class="col-md-7">
									<div id="model_step_two_photo_upload" class="col-md-6">
										<div class="mpe_photo_buttons txt">
											<div class="form_label mpe_photo_label">
												Photo from
												<span class="hidden-xs">computer</span>
												<span class="hidden-lg hidden-md hidden-sm">phone</span>
											</div>
											<div id="profile_photo_uploader_status" class=""
												style="display: none;">
												<div id="profile_photo_upload_filename"
													class="upload_filename"
													style="display: none; margin: 0 auto;"></div>
												<div id="profile_photo_progress_bar" class="progress"
													style="display: none; margin: 0 auto;">
													<div id="profile_photo_progress_bar_number"
														class="progress-bar progress-bar-striped active"
														role="progressbar" aria-valuenow="0" aria-valuemin="0"
														aria-valuemax="100" style="width: 100%"></div>

												</div>

											</div>
											<div id="profile_photo_uploader" class="mpe_photo_buttons">
												<noscript></noscript>
											</div>
										</div>
									</div>
									<div id="model_step_two_swf_webcam" class="col-md-6 hidden-xs">
										<div class="mpe_photo_buttons txt">
											<div class="form_label mpe_photo_label">Photo from WebCam</div>
											<button type="button" name="mpe_photo_swf_webcam"
												id="mpe_photo_swf_webcam" class="btn form-submit"
												onclick="Register.takeSwfPhoto();">Take Picture with webcam</button>
										</div>
										<div id="model_photo_swf" style="display: none;">
											<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
												codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"
												name="model_snapshot" width="325" height="375"
												id="model_snapshot">
												<param name="movie"
													value="/flashApps/swf/model_snapshot.swf?model={$form.model_id}" />
												<param name="quality" value="high" />
												<param name="menu" value="false" />
												<param name="allowScriptAccess" value="always" />
												<param name="flashVars" value="model={$form.model_id}">
												<param name="wmode" value="transparent" />
												<embed
													src="/flashApps/swf/model_snapshot.swf?model={$form.model_id}"
													width="325" height="375" quality="high"
													pluginspage="http://www.macromedia.com/go/getflashplayer"
													type="application/x-shockwave-flash" name="model_snapshot"
													allowScriptAccess="always" wmode="transparent"></embed>
											</object>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								{/if}
								<div class="hidden-md hidden-lg">
									<div class="clearfix"></div>
								</div>
								<div id="mpe_step_two_model_photo" class="col-md-7"
									{if !$model_profile_photo_url} style="display: none;"{/if}>
									<div>
										<h2>Your Profile Photo</h2>
										<div class="model_profile_photo_url">
											<img id="model_profile_photo_url"
												src="{$model_profile_photo_url}" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</form>
			</div>


			{if $form.status neq "0" }
			<div id="mpe_photo_ids_div"
				{if !$model_profile_photo_url} style="display: none;"{/if}>
				<hr>
				<form name="mpe_photo_ids" id="mpe_photo_ids" method="POST"
					action="{$register_post_url}" enctype="multipart/form-data">
					<input type="hidden" name="register"  value="model" />
					<input type="hidden" name="mr_session_name"
						value="{$smarty.session.session_name}" /> <input type="hidden"
						name="{$smarty.session.session_name}"

						value="{$smarty.session.SessionID}" /> <input type="hidden"
						name="step"
						value="{$smarty.const.MR_REGISTER_STEP_TWO}" /> <input
						type="hidden" name="model_id"
						value="{$form.model_id}" /> <input type="hidden" name="mrc"
						 value="{$mrc_code}" /> <input type="hidden"
						name="action"  value="documents" /> {if
					$smarty.session.__debug} <input type="hidden" name="__debug"
						 value="{$smarty.session.__debug}" /> <input
						type="hidden" name="__pwd"
						value="{$smarty.session.__pwd}" /> {/if}
					<div id="mpe_step_two_photo_docs">
						<div id="mpe_photo_ids" class="form">
							<div id="mpe_photo_ids_bar" class="bar2">
								<h2>Photo ID Upload</h2>
							</div>
							<div data-module-box="true">

								<div
									class="mpe_step_two_note mpe_step_two_photo_id_note txt col-md-5">
									<div class="mpe_step_two_icon pull-left">
										<img src="{$_SITE_IMAGES_DEFAULT_}/models/photo_id.png" />
									</div>
                                    The following two images are required for account approval.
                                    The first image is a scan or photo of your ID. The ID must be
                                    government issued and have a picture of your face and include
                                    your birth date.<br> <br>The second image is a photo of
                                    you holding your ID next to your face which shows that you are
                                    indeed the holder of the ID Card.

                                     <button type="button" class="btn button-2" data-toggle="modal" data-target="#photoIdMatch">Photo ID and Photo Id match examples</button>
                                    {*<br> <br>You can skip this*}
                                    {*step if you don't have these pictures available now. You can*}
                                    {*upload them at a later time by logging into your model account*}
                                    {*and navigating to the "My Profile" page and locate the section*}
                                    {*"Document Review".*}
								</div>
								<!-- Id set  -->
								<div class="col-md-7">
									{foreach from=$powerform_urls key="doc_set" item="powerform_url"}
									<div id="mpe_photo_id_upload_{$doc_set}"
										class="mpe_photo_id_upload">
										<h2>Model {if $num_doc_sets gt 1}#{$doc_set} {/if}Photo ID</h2>
										<div id="mpe_step_two_photo_ids_{$doc_set}" class="col-sm-11">
											<div class="mpe_photo_buttons txt">
												<div class="form_label mpe_photo_label pull-left">
													<h3>Government/Passport ID:</h3>
												</div>
												<div id="mpe_photo_id_results_{$doc_set}"
													class="mpe_photo_id_results pull-right">
													<div id="photo_id_upload_filename_{$doc_set}"
														class="upload_filename" style="display: none;"></div>
													<div id="photo_id_progress_bar_{$doc_set}" class="progress"
														style="display: none;">
														<div id="photo_id_progress_bar_number_{$doc_set}"
															class="progress_bar_complete progress-bar progress-bar-striped active"
															role="progressbar" aria-valuenow="0" aria-valuemin="0"
															aria-valuemax="100" style="display: none;"></div>
													</div>

												</div>
												<div class="mpe_docs_buttons">
													<div id="photo_id_uploader_{$doc_set}"
														class="mpe_photo_id_uploader">
														<noscript></noscript>
													</div>
												</div>
											</div>
										</div>

										<div id="mpe_step_two_photo_id_match_{$doc_set}"
											class="mpe_step_two_photo_id_match col-sm-11">
											<div class="mpe_photo_buttons txt">
												<div class="form_label mpe_photo_label pull-left">
													<h3>Holding ID next to face:</h3>
												</div>
												<div id="mpe_photo_id_match_results_{$doc_set}"
													class="mpe_photo_id_match_results pull-right">
													<div id="photo_id_match_upload_filename_{$doc_set}"
														class="upload_filename" style="display: none;"></div>
													<div id="photo_id_match_progress_bar_{$doc_set}"
														class="progress" style="display: none;">
														<div id="photo_id_match_progress_bar_number_{$doc_set}"
															class="progress-bar progress-bar-striped active"
															role="progressbar" aria-valuenow="0" aria-valuemin="0"
															aria-valuemax="100" style="display: none;"></div>
													</div>
												</div>
												<div class="mpe_docs_buttons">
													<div id="photo_id_match_uploader_{$doc_set}"
														class="mpe_photo_id_match_uploader">
														<noscript></noscript>
													</div>
												</div>
											</div>
										</div>
										<hr>
										<div class="clearfix"></div>
									</div>
									{/foreach}
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="clearfix"></div>
			{else}
			<div
				class="mpe_step_two_note mpe_step_two_photo_id_note txt col-md-5">
				<div id="mpe_photo_ids_bar" class="bar2">
					<h2>Photo ID Upload</h2>
				</div>
				<div class="mpe_step_two_icon pull-left">
					<img src="{$_SITE_IMAGES_DEFAULT_}/models/photo_id.png" />
				</div>
				The require identification documents have been uploaded and are
				ready for review.
			</div>
			<div class="clearfix"></div>

			{/if}
			<div id="mpe_esign_div"
				{if !$model_profile_photo_url && !$model_photo_ids_exists} style="display: none;"
				{/if} class="wcc3">
				<hr>
				<form name="mpe_esign" id="mpe_esign" method="POST"
					action="{$register_post_url}"
					enctype="application/x-www-form-urlencoded">
					<input type="hidden" name="register"  value="model" />
					<input type="hidden" name="mr_session_name"
						value="{$smarty.session.session_name}" /> <input type="hidden"
						name="{$smarty.session.session_name}"

						value="{$smarty.session.SessionID}" /> <input type="hidden"
						name="step"
						value="{$smarty.const.MR_REGISTER_STEP_TWO}" /> <input
						type="hidden" name="model_id"
						value="{$form.model_id}" /> <input type="hidden" name="mrc"
						 value="{$mrc_code}" /> <input type="hidden"
						name="action"  value="esign" /> <input type="hidden"
						name="disable_btn" id="disable_btn" value="disable" /> {if
					$smarty.session.__debug} <input type="hidden" name="__debug"
						 value="{$smarty.session.__debug}" /> <input
						type="hidden" name="__pwd"
						value="{$smarty.session.__pwd}" /> {/if}
					<div id="mpe_step_two_esign">
						<div id="mpe_esign_email" class="form">
							<div data-module-box="true">
								<div class="mpe_step_two_note txt col-md-5">
									<div id="mpe_photo_ids_bar" class="bar2">
										<h2>E-Sign Documents</h2>
									</div>
									<div class="mpe_step_two_icon pull-left">
										<img src="{$_SITE_IMAGES_DEFAULT_}/models/esign.png" />
									</div>
                                    You will need to complete 2 documents using our electronic signing system.
                                    By clicking the 'E-Sign Documents' button the 2 additional documents will
                                    open in a new tab where you will be able to complete them. Be sure to have
                                    the photo id you just uploaded handy as you will need the information on
                                    it while e-signing.<br>
                                    {*bellow section does not apply as  of 2018-8-30*}
                                    {*<br> Follow the instructions in the browser and click*}
                                    {*"Finish" at the top right corner when completed. Once you have*}
                                    {*completed the e-signing process return to this page and*}
                                    {*finalize your registration by clicking 'Complete Signup' below.<br>*}
                                    <br> {if $form.num_doc_sets gt 1}
                                        <i>Note: Each model will
                                            need to complete the e-signing process by clicking the button
                                            below, one per model.</i>
									    {/if}
								</div>
								<div class="col-md-7">
									{foreach from=$powerform_urls key="doc_set"
									item="powerform_url"}
									<div id="mpe_step_two_esign_elem_{$doc_set}"
										class="mpe_step_two_esign_elem">
										<div id="mpe_step_two_esign_msg"
											class="mpe_step_two_esign_elem txt">
											<strong>{if $form.num_doc_sets gt 1}Model #{$doc_set}
												{/if}Click the button below to start the e-signing process.</strong>
										</div>
										<br>
										<div id="mpe_step_two_esign_button_container"
											class="mpe_step_two_esign_button_container">
											<button type="button" name="mpe_step_two_esign_button"
												id="mpe_step_two_esign_button_{$doc_set}"
												class="btn form-submit"
												onclick="return Register.eSign('{$doc_set}', '{$powerform_url}', m_r_LastStep('#mpe_step_two_esign_button_{$doc_set}') );">{if
												$form.num_doc_sets gt 1}Model #{$doc_set} {/if}E-Sign
												Documents</button>
										</div>
										<div class="clear_both"></div>
										<div id="mpe_step_two_esign_state_{$doc_set}_msg"
											class="msg_box mpe_step_two_esign_state_msg msg_hide">
											<div id="mpe_step_two_esign_state_{$doc_set}_msg_text"></div>
										</div>
									</div>
									{/foreach}
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="clearfix"></div>
		</div>
		{/if}
	</div>
	<div class="clearfix"></div>

	<div id="mpe_step_two_complete" {if $model_registration_step
		neq 10} {if !$model_profile_photo_url || !$model_photo_ids_exists || !$esign_complete } class="msg_hide"
		{/if}{else}class="msg_show"{/if}>
		<div id="mpe_step_two_complete_button_container">
			<h2 class="text-center">Model{if $form.num_doc_sets gt 1}'s{/if}
				registered successfully</h2>
			<div class="col-md-4 col-md-offset-4">
				<h3>Welcome to {$whitelabel_settings.name}</h3>
				<p>
					Thank you for registering as a model. We will need to review your
					application before you can be approved to go online. <br> <br> <strong>This
						process can take 24 to 48 hours to complete.</strong><br> <br>
					Please make sure you have <strong>submitted all the correct
						documentation</strong> to make the approval process faster. <br>
					You will receive an email when your application is approved..
				</p>
				<p>
					<strong>Your login credentials are below:</strong>
				</p>
				<div class="user-name">
					Username: <span>{$model_username}</span>
				</div>
				{*<div class="password">*}
					{*Password: <span>{$model_password}</span>*}
				{*</div>*}
				<form id="modelLoginForm">
					<input type="hidden" name="type" value="model">
                    <input type="hidden" name="username" value="">
                    <input type="hidden" name="password" value="">
				</form>
				<div class="text-center">
					<a href="{$model_auto_login_url}" title="model sign in page"
						id="auto_login_btn" class="btn button-2">Model's Log In Page</a>
				</div>

			</div>
		</div>
		<hr>
		<div id="mpe_complete_right" class="form col-md-4 col-md-offset-4">
			<div id="mpe_complete_bar" class="bar2">
				<h3>Contact Us</h3>
			</div>
			<div id="mpe_complete_content_right" class="mpe_complete_content"
				data-module-box="true">
				<div id="mpe_complete_text">If you have questions regarding your
					registration or need any other assistance feel free to contact us.</div>
				<div class="mpe_complete_elem"
					style="margin-top: 25px; margin-left: 30px;">
					<div class="form_label mpe_complete_label">Email:</div>
					<div class="mpe_complete_data">
						<a href="mailto:models@webcamclub.com" class="normal_link">models@webcamclub.com</a>
					</div>
				</div>
				<div class="mpe_complete_elem txt"
					style="margin-top: 25px; margin-left: 30px;">
					{literal}
					<div id="lpButDivID-1354562765895"></div>
					<script type="text/javascript" charset="UTF-8"
						src="https://server.iad.liveperson.net/hc/81564520/?cmd=mTagRepstate&site=81564520&buttonID=12&divID=lpButDivID-1354562765895&bt=1&c=1"></script>
					<!-- BEGIN LivePerson Button Code -->
					<!--
							<div class="form_label mpe_complete_label">Live Help:</div>
							<table border="0" cellspacing="2" cellpadding="2">
								<tr>
									<td align="left" valign="top">&nbsp;</td>
									<td align="right" valign="top"><a id="_lpChatBtn" href="http://server.iad.liveperson.net/hc/81564520/?cmd=file&file=visitorWantsToChat&site=81564520&byhref=1&imageUrl=http://server.iad.liveperson.net/hcp/Gallery/ChatButton-Gallery/English/General/3a" target="chat81564520"  onClick="lpButtonCTTUrl = 'http://server.iad.liveperson.net/hc/81564520/?cmd=file&file=visitorWantsToChat&site=81564520&imageUrl=http://server.iad.liveperson.net/hcp/Gallery/ChatButton-Gallery/English/General/3a&referrer='+escape(document.location); lpButtonCTTUrl = (typeof(lpAppendVisitorCookies) != 'undefined' ? lpAppendVisitorCookies(lpButtonCTTUrl) : lpButtonCTTUrl); window.open(lpButtonCTTUrl,'chat81564520','width=475,height=400,resizable=yes');return false;" ><img src="http://server.iad.liveperson.net/hc/81564520/?cmd=repstate&site=81564520&channel=web&&ver=1&imageUrl=http://server.iad.liveperson.net/hcp/Gallery/ChatButton-Gallery/English/General/3a" name="hcIcon" border="0"></a></td>
								</tr>
								<tr>
									<td align="left" valign="top">&nbsp;</td>
									<td align="right" valign="top"><a href="http://solutions.liveperson.com/customer-service/?site=81564520&domain=server.iad.liveperson.net&origin=chatbutton" target="_blank" onClick="javascript:window.open('http://solutions.liveperson.com/customer-service/?site=81564520&domain=server.iad.liveperson.net&origin=chatbutton&referrer='+escape(document.location));return false;" ><img src="http://server.iad.liveperson.net/hc/81564520/?cmd=rating&site=81564520&type=indicator" name="hcRating" alt="Customer Service Rating by LivePerson" border=0></a></td>
								</tr>
							</table>
							-->
					<!-- END LivePerson Button code -->
					{/literal}
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="clearfix"></div>
</div>
<!-- end of model_body -->
{*id and id match modal*}
<div class="modal fade" id="photoIdMatch" tabindex="-1" role="dialog" aria-labelledby="photoIdMatch" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header navbar-inverse">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h1 class="modal-title">ID and photo ID match</h1>
            </div>
            <div id="idMatchSection" class="modal-body section_light">
                <h2>Examples of expected ID and photo ID match.</h2>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="thumbnail">
                            <img src="/images/wcc3/models/GoodIDImage.jpg" alt="ID example">
                            <div class="caption">Good ID</div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="thumbnail">
                            <img src="/images/wcc3/models/GoodIDMatch.jpg" alt="ID example">
                            <div class="caption">Good ID Match</div>
                        </div>
                    </div>
                </div>
                <hr>
                <h2>Examples of bad ID and photo ID match.</h2>
                <div id="thumbNails" class="row">
                    <div class="col-sm-3">
                        <div class="thumbnail">
                            <img src="/images/wcc3/models/match_unclear_and_information_covered.jpg" alt="Match unclear and information covered">
                            <div class="caption">
                                ID Match, unclear and information covered.
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="thumbnail">
                            <img src="/images/wcc3/models/match_too_far_away.jpg" alt="Match too far away">
                            <div class="caption">
                                ID match, too far away.
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="thumbnail">
                            <img src="/images/wcc3/models/match_covering_photo.jpg" alt="Match covering photo with fingers">
                            <div class="caption">
                                ID match, fingers covering photo.
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="thumbnail">
                            <img src="/images/wcc3/models/match_covering_face.jpg" alt="Match covering photo with ID">
                            <div class="caption">
                                ID match, ID covering face.
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="thumbnail">
                            <img src="/images/wcc3/models/match_blurry.jpg" alt="Match covering photo with ID">
                            <div class="caption">
                                ID match, too blurry.
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="thumbnail">
                            <img src="/images/wcc3/models/id_number_cut_off_blurry.jpg" alt="Match covering photo with ID">
                            <div class="caption">
                                ID, too blurry and ID number cut off.
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="thumbnail">
                            <img src="/images/wcc3/models/id_glare_over_important_info.jpg" alt="Match covering photo with ID">
                            <div class="caption">
                                ID, glare over important information.
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="thumbnail">
                            <img src="/images/wcc3/models/id_covering_photo_with_finger.jpg" alt="Match covering photo with ID">
                            <div class="caption">
                                ID, covering ID photo with finger.
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer section_light">
                <button type="button" class="btn button-2" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
{*load image into this modal*}
<div class="modal fade" id="imagePop" tabindex="-1" data-backdrop="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header navbar-inverse">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-label="true">&times;</span>
                </button>
                <h1 class="modal-tile"></h1>
            </div>
            <div class="modal-body section_light">
                <img src="" alt="">
            </div>
            <div class="modal-footer section_light">
                <button type="button" class="btn button-2" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
{literal}
<script type="text/javascript">
	var log = console.log;

	$(document).ready(function(){
        var title_placeholder = $('#imagePop h1');
        var img_src = $('#imagePop img');

		if( $.cookie('esigning') == 'started' ){

			$('#mpe_esign_div, #mpe_photo_ids_div').hide();
			$('#mpe_step_two_complete').removeAttr('class');
			$('#model_body .row').hide();
		}
		$('#thumbNails img').on('click', function(){
            $(img_src).attr('src', this.currentSrc);
            $(title_placeholder).text(this.nextElementSibling.innerText);
            $('#imagePop').modal('toggle');
        })
	});
// end of doc ready

	function startTimer(){

		setTimeout(stopTimer, 1000);

	}

	function stopTimer () {

		setTimeout(styleQQbtn, 1000);
	}

	function styleQQbtn(){

		if($('#mpe_step_two_photo_docs .qq-upload-button').length ){
			$('#mpe_step_two_photo_docs .qq-upload-button').addClass('btn form-submit').removeAttr('style');
		}else{
			startTimer()
			}
	}

	//ajax call to remove submit button or disable it
	function m_r_LastStep(id){
		$(id).addClass('disabled').html('Waiting on signature! <img src="'+wcc.wait_gif.src+'" class="img-loader">');

		var data = $(id).closest('form').serialize();
		var url = $(id).closest('form').attr('action');

		log('button click '+ data, url);
		$.ajax({
			url : url,
			type : 'POST',
			cache : false,
			crossDomain : true,
			xhrFields : {
					withCredentials: true
					},
			data : data,
			dataType: 'json',
			success : function (data, status) {
				//success code here
				log(data, status)
				$.cookie('esigning', 'started');
				var res = data;
				$('.user-name span').text( res.user);
				$('.password span').text( res.pass);
				$('#auto_login_btn').attr('href', res.link)

				},
			error : function (status, error) {
				// error code here
				}
		});
	}
		if(window.matchMedia('(min-width: 768px)').matches && window.matchMedia('(max-width: 1023px)').matches){
			$(document).ready(function(){
				var registration_form_1 = $('#registration_form_1').html();
				var registration_form_2 = $('#registration_form_2').html();

				$('#registration_form_1').html(registration_form_2);
				$('#registration_form_2').html(registration_form_1);
				$('#model_step_two_swf_webcam').hide();
			});
			console.log( 'tablet' )
			}
	</script>

{/literal}
{include file="wcc3/components/footer.tpl" show=$show}
{include file="wcc3/components/html_footer.tpl" show=$show}
