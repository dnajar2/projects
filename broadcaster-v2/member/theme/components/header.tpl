<!--
	file name: header.tpl
	theme header tpl file
-->
{if $smarty.session.show_confirm_email}
{include file="wcc3/components/top_bar_message.tpl"}
{/if}
<div class="fixed-header-wrap">
	<nav id="header" class="navbar navbar-inverse " role="navigation">
		<div class="container-fluid" style="height:auto;">
			<div class="navbar-header">
                {if !$default_lp && !$show_splash_page }
				<button id="mobile-toggle" type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
                {/if}
				<div class="wl-logo-container">
					<p class="wl-top-logo">
						<a class="wl-logo" href="/" title="{$whitelabel_settings.name}" target="_self"><img src="{$smarty.const.CDN_SCHEMA}{if $whitelabel_images.logo.hashbrowns_uri}{$whitelabel_images.logo.hashbrowns_uri}{else}{$whitelabel_images.logo.uri}{/if}" alt="{$whitelabel_settings.name}"></a>
					</p>
				</div>

			</div>
            {if !$default_lp && !$show_splash_page }
			<div id="navbar" class="navbar-collapse collapse mainnav">

				{if $smarty.session.__logged_in}

				{include file="wcc3/components/members/mobile_toolbar.tpl"}
				{/if}

				<ul id="mobileMainNav" class="nav navbar-nav">
					<!-- not showing on small screens -->
					{if $show eq 'site_index'}
					<li id="drop-down" class="dropdown hidden-xs"> <a id="trigger" href="#">Categories <b class=" caret"></b></a>
						<!-- start of drop down menu -->
						<ul class="dropdown-menu ">
							<li>
								<div class="drop-down-section">
									<ul>
										<li>
											<div>
												<ul id="cat" class="nav nav-pills">
													{include file="wcc3/components/category_groups.tpl" groups=$groups}
												</ul>
												<div class="tab-content">
													{foreach from=$group_categories item=categories key="htag" loop="categories_loop"}
													<div class="tab-pane{if $htag == $selected_group_htag} active{/if}" id="{$htag}">
														<div class="cat-column">
														{include file="wcc3/components/category_items.tpl" categories=$categories ul_id=$htag ul_type="menu"}
														</div>
													</div>
													{/foreach}
												</div><!-- tab cat content end -->
											</div>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</li>
					{/if}<!--- end of drop down -->

					{if $smarty.const.__LOCAL_DEBUG}
					<li class="hidden-xs"><a href="/updates/" target="_self">Updates</a></li>
					{/if}

					{if ! $smarty.const.IS_MOBILE_DEVICE and ! $smarty.const.FEATURESHOWS_DISABLED}
					<li class="hidden-xs"><a href="/feature-shows/" target="_self">Feature Shows</a></li>
					{/if}

					{if $smarty.session.__logged_in}
					<li class="hidden-xs"><a href="{$buttons.myaccount.url}" target="_self">{$buttons.myaccount.caption}</a></li>
					{/if}
                    {if $smarty.session.__logged_in}
					<li class="wlb col-xs-6 mobile-menu hidden-lg hidden-md hidden-sm "><a href="/updates/" target="_self"><i class="fa fa-image"></i><br>Updates</a></li>
					{/if}

					{if ! $smarty.const.IS_MOBILE_DEVICE}
					<li class="wlb col-xs-6 mobile-menu hidden-lg hidden-md hidden-sm "><a href="/feature-shows/" target="_self"><i class="fa fa-image"></i><br>Feature Shows</a></li>
					{/if}

					{if $smarty.session.__logged_in}
					<li class="wlb col-xs-6 mobile-menu hidden-lg hidden-md hidden-sm "><a href="{$buttons.myaccount.url}" target="_self"><i class="fa {$buttons.myaccount.icon}"></i><br>{$buttons.myaccount.caption}</a></li>
					<li class="wlb col-xs-6 mobile-menu hidden-lg hidden-md hidden-sm "><a href="{$buttons.logout.url}" target="_self"><i class="fa {$buttons.logout.icon}"></i><br>{$buttons.logout.caption}</a></li>
					{/if}

				</ul>

				{if $smarty.session.__logged_in}
				{include file="wcc3/components/members/desktop_toolbar.tpl"}
				{/if}

				<div class="navbar-right headerbtn hidden-xs">
					<ul class="nav navbar-nav">
						<li>
						</li>
					</ul>
					{if ! $smarty.session.__logged_in}
                        <a href="{if $whitelabel_settings.studio_register}{$whitelabel_settings.model_register}{else}/model/join/{/if}" title="Model Application" class="btn button-2" target="_self">Become a Model</a>
					<button id='join_free_button' type="button" class="btn button-2" data-toggle="modal" data-backdrop="static" data-target="#joinModal" data-type="member" >Join FREE!</button>
					<button id='login_modal_button' type="button" class="btn form-submit" data-toggle="modal" data-backdrop="static" data-target="#loginModal" data-type="member" >Login</button>
					{/if}
				</div>

				<!-- join menu mobile -->
				<div class="clearfix"></div>
				<div class="headerbtn hidden-sm hidden-md hidden-lg">
					{if ! $smarty.session.__logged_in}
					<ul class="nav navbar-nav">
                        <li class="btn-info button-2 col-xs-6 mobile-menu">
                            <a href="{if $whitelabel_settings.studio_register}{$whitelabel_settings.model_register}{else}/model/join/{/if}" title="Model Application"><i class="fa fa-arrow-circle-right "></i><br>Become a Model!</a>
                        </li>
						<li class="btn-info button-2 col-xs-6 mobile-menu">
							<a href="#" data-toggle="modal" data-backdrop="static" data-target="#joinModal"><i class="fa fa-arrow-circle-right "></i><br>Join FREE!</a>
						</li>
						<li class="btn-default form-submit col-xs-6 mobile-menu">
							<a href="#" data-toggle="modal" data-backdrop="static" data-target="#loginModal" data-type="member"><i class="fa fa-sign-in"></i><br>Login</a>
						</li>
					</ul>
					{/if}
				</div>
			</div><!--/.navbar-collapse -->
		    {/if}
            {if $default_lp && !$show_splash_page }
                <div class="navbar-right headerbtn ">
                    <button id='login_modal_button' type="button" class="btn form-submit" data-type="member" >Login</button>
                </div>
            {/if}
        </div>
		<div class="clearfix"></div>
	</nav>
</div>
{*Nag join form*}
{if !$smarty.session.__logged_in}

    <div id="joinForm" style="display: none" class="hidden-sm hidden-xs">
        <div id="joinFormErrors" style="display: none">

        </div>
        <div class="col-lg-7 col-lg-offset-2 col-md-8  text-right">
            <h2 id="joinNowText"><span class="primary-color">
                    Join Now!
                </span> It's totally FREE!
                <small>No Credit Card Needed</small>
                <small id="joinFormLogin">Already A Member?
                    <span class="primary-color linkplain" style="cursor: pointer" data-toggle="modal" data-backdrop="static" data-target="#loginModal" data-type="member" onclick="$('#joinForm').slideToggle('slow')">LOGIN</span>
                </small>
            </h2>
            <form id="member_join_nag" name="member_register" method="POST" action="/api/members/register.php?{$smarty.session.session_name}={$smarty.session.session_id}" enctype="application/x-www-form-urlencoded" onsubmit="wcc.registerMember(event);">
                <input type="hidden" name="type" value="member">
                <input type="hidden" name="terms" value="1">

                <div class="col-lg-3 col-md-7">
                    <input type="text" name="username" placeholder="Create username" class="form-control" autocomplete="username">
                </div>
                <div class="col-lg-3 col-md-7">
                    <input type="password" name="password" placeholder="Choose Password" class="form-control" autocomplete="current-password">
                    <small>*case sensitive</small>
                </div>
                <div class="col-lg-6">
                    <div class="col-sm-7" style="padding-left: 0; padding-right: 12px;">
                        <input type="text" name="email" placeholder="Email Address" class="form-control" autocomplete='email'>
                    </div>
                    <div class="col-sm-5">
                        <button type="button" class="btn button-2 btn-large disabled" disabled="disabled" style="width: 100%; height: 42px;" onclick="wcc.registerMemberNag($('#member_join_nag'))">Join for Free</button>
                    </div>
                </div>
            </form>
            <div class="clearfix"></div>
            <div class="text-center">
                By registering on {$whitelabel_settings.name}, I acknowledge that I am 18+ years old, read, understood and accepted - {$whitelabel_settings.name}'s <span onclick="window.open('/?show=terms&width=900&popup=true','terms', 'toolbar=no,location=no,directories=no,status=yes,menubar=no,resizable=yes,copyhistory=no,scrollbars=yes,width=900,height=450');
;">Terms & Conditions</span>. Additionally, I agree to receive exclusive email offers and promotions. To manage your marketing choices please access the user settings page or contact customer support.
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div id="limitedOfferBox" class="col-md-10 col-sm-offset-1" style="position:relative;">
                <div class="triangle"></div>
                <div id="limitedOfferJoin">
                    <div id="addTitle1">Limited Time Offer</div>
                    <div id="addTitle2">Get 6 Free Credits</div>
                    <div id="addTitle3">When You Join Now</div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div id="closeJoinOffer">
            <i class="fa fa-times primary-color "></i>
        </div>
    </div>
{/if}
