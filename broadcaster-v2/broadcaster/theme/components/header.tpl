
<header class="main-header" {if $smarty.request.from_model_swf}style="display: none" {/if}>

    <!-- Logo -->
    <a href="/models/" class="logo {if $smarty.session.whitelabel.themeId eq '69'}secondary-bg-color{else}primary-bg-color{/if}">
        <span class="logo-mini"><img src="{$whitelabel_settings.protocol}{$whitelabel_settings.domain}{$whitelabel_images.logo.uri}" alt=""></span>
        <span class="logo-lg"><img src="{$whitelabel_settings.protocol}{$whitelabel_settings.domain}{$whitelabel_images.logo.uri}" alt=""></span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav id="header" class="navbar navbar-static-top {if !$smarty.session.__logged_in}hidden-xs{/if}">
        {if $smarty.session.__logged_in}
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- Messages: style can be found in dropdown.less-->
                {if $whitelabel_settings.translate}
                    <li style="padding-top: 13px;">
                        <span id="translation">
					        <span id="google_translate_element"></span>
				        </span>
                    </li>
                {/if}
                <li class="dropdown messages-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-envelope-o"></i>
                        <span class="label label-success" v-if="mailCount > 0">%%mailCount%%</span>
                    </a>
                    <ul class="dropdown-menu">

                        <li class="header" v-if="mailCount > 0">You have %%mailCount%% messages</li>
                        <li class="header" v-else>You have No messages</li>
                        <li v-if="mailList.length > 0">
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                <li v-for="mailItem in mailList"><!-- start message -->
                                    <a v-bind:href="mailItem.readerLink">
                                        <div class="pull-left">
                                            <i class="fa fa-envelope-o" ></i>
                                        </div>
                                        <h4>
                                            %%mailItem.From%%
                                            <small><i class="fa fa-clock-o"></i> %%mailItem.sendRecvDate%%</small>
                                        </h4>
                                        <p>%%mailItem.Subject%%...</p>
                                    </a>
                                </li>
                                <!-- end message -->
                            </ul>
                        </li>
                        <li class="footer"><a href="/models/?{'show=maillist'|base64_encode}">See All Messages</a></li>
                    </ul>
                </li>
                {if $topNotifications}
                <!-- Notifications: style can be found in dropdown.less -->
                <li class="dropdown notifications-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <span class="label label-warning">{$topNotificationsCount}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">You have {$topNotificationsCount} notifications</li>
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                            {foreach from=$topNotifications item='notification'}
                                {if $notification}
                                <li>
                                    <a href="{$ProfileURL}&{$notification.url}"><i class="fa fa-warning text-yellow"></i> {$notification.message}</a>
                                </li>
                                {/if}
                                {/foreach}
                            </ul>
                        </li>
                        {*<li class="footer"><a href="#">View all</a></li>*}
                    </ul>
                </li>

                    {if 1 eq 2}
                    <!-- Tasks: style can be found in dropdown.less -->
                    <li class="dropdown tasks-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-flag-o"></i>
                        <span class="label label-danger">9</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">You have 9 tasks</li>
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                <li><!-- Task item -->
                                    <a href="#">
                                        <h3>
                                            Model Profile
                                            <small class="pull-right">45%</small>
                                        </h3>
                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100">
                                                <span class="sr-only">45% Complete</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <!-- end task item -->
                                <li><!-- Task item -->
                                    <a href="#">
                                        <h3>
                                            W9
                                            <small class="pull-right">0%</small>
                                        </h3>
                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                                <span class="sr-only">0% Complete</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <!-- end task item -->
                                <li><!-- Task item -->
                                    <a href="#">
                                        <h3>
                                            Some task I need to do
                                            <small class="pull-right">60%</small>
                                        </h3>
                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                <span class="sr-only">60% Complete</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <!-- end task item -->
                            </ul>
                        </li>
                        <li class="footer">
                            <a href="#">View all tasks</a>
                        </li>
                    </ul>
                </li>
                    {/if}
                {/if}
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="{$photoURL}" class="user-image" alt="{$modelInfo.Username}">
                        <span class="hidden-xs">{$modelInfo.Username}</span>
                    </a>
                    <ul id="model-profile" class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header {if $smarty.session.whitelabel.themeId eq '69'}secondary-bg-color{else}primary-bg-color{/if}">
                            <img src="{$photoURL}" class="user-image" alt="{$modelInfo.Username}">
                            <div class="user-name" >
                                {$modelInfo.Username}<br>
                                <small>Member since {$modelInfo.Created|date_format:"%Y"}</small>
                            </div>
                        </li>
                        <!-- Menu Body -->
                        <li class="user-body">
                            <div class="row">
                                <div class="col-xs-4 text-center">
                                    <a href="#">Fan Club</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">Earnings</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">Favorites</a>
                                </div>
                            </div>
                            <!-- /.row -->
                        </li>
                        <!-- Menu Footer-->
                        <li id="modelActionBtns" class="user-footer">
                            <div class="pull-left">
                                <a href="/models/?show=myprofile&Action=ModelID&mpeAction=1&mpeUser=2&ModelID={$modelInfo.ModelID}&section=about" class="btn btn-success btn-flat"> <i class="fa fa-user"></i> Profile</a>
                            </div>
                            <div  class="pull-right">
                                <a href="/models/?{'show=login&logout=true'|base64_encode}" class="btn btn-danger btn-flat"> <i class="fa fa-power-off"></i> Sign Out</a>
                            </div>
                        </li>
                    </ul>
                </li>
                {if 1 eq 2 and $smarty.const.__LOCAL_DEBUG and $show eq 'home'}
                <!-- Control Sidebar Toggle Button -->
                <li>
                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li>
                {/if}
            </ul>
        </div>
        {/if}
    </nav>
</header>

<div id="alerts">
    {if $smarty.session.__logged_in and $modelCantGoOnline and $show eq 'home'}
        <div id="modelCantGoOnline" class="alert alert-danger animated fadeInUp" style="display: none">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Go Online is disabled.  Please contact your studio manager.</strong>
        </div>
    {/if}

    <div id="alerts_container" class="alert alert-danger animated fadeInUp" style="display: none">
        <a href="#" class="close" onclick="ui_alerts.alerts_container.hide(); event.preventDefault()">&times;</a>
        <span id="alerts_text"></span>
    </div>
</div>
