<div class="col-lg-12">
    <div class="box box-solid">
        <div class="box-body">
            <div class="nav-tabs-custom">
                <ul id="refProgramTools" class="nav nav-tabs pull-left">
                    <li class="header" style="display: block"><i class="fa fa-th"></i> Referral Program Tools</li>
                    <li class="{if $optionVars.periodOption eq NULL}active{/if}"><a href="#tab_3-2" data-toggle="tab" aria-expanded="{if $optionVars.periodOption eq NULL}true{else}false{/if}">Link Codes</a></li>
                    <li class=""><a href="#tab_2-2" data-toggle="tab" aria-expanded="false">Banners</a></li>
                    <li class="{if $optionVars.periodOption neq NULL}active{/if}"><a href="#tab_1-1" data-toggle="tab" aria-expanded="{if $optionVars.periodOption neq NULL}true{else}false{/if}">Referred Members</a></li>
                </ul>
                <div class="clearfix"></div>
                <div class="tab-content clearfix">
                    <div class="tab-pane {if $optionVars.periodOption neq NULL}active{/if}" id="tab_1-1">
                        <div  class="table-header">Referred Members</div>
                        <form action="{$formAction}" method="post">
                            <div class="table-row">
                                <label for="filter" style="width: 365px"><span style="display: block; float: left; line-height: 30px;">Filter:</span>
                                    <select id="filter" name="ref_dd" class="mb-dropdown form-control">
                                        <option value="SIGNUPS" {if $optionVars.ref_dd=="SIGNUPS"}selected{/if}>Signups</option>
                                        <option value="PURCHASES" {if $optionVars.ref_dd=="PURCHASES"}selected{/if}>Purchases</option>
                                    </select>
                                </label>
                            </div>
                            <div class="table-row">
                                <span id="dateFromRef">
                                    <span style="display: block">
                                         <input id="periodOption_fromto" name="periodOption" type="radio" value="fromto" {if $optionVars.periodOption != "period" }checked{/if}>
                                        <label for="periodOption_fromto" >Date From:</label>
                                    </span>
                                    <span>
                                        {html_select_date class="mb-dropdown form-control" all_extra='onchange="changeFromToRadioBtn();"' prefix="date_from_" time=$optionVars.date_from start_year="2000" end_year="+0"}
                                    </span>
                                </span>
                                <span id="dateToRef">
                                    <span style="display: block">Date To:</span>
                                    <span>{html_select_date class="mb-dropdown form-control" all_extra='onchange="changeFromToRadioBtn();"' prefix="date_to_" time=$optionVars.date_to start_year="2000" end_year="+0"}</span>
                                </span>
                                <div class="clearfix"></div>
                            </div>

                            <div class="table-row">
                                <span style="display: block">
                                    <input id="periodOption_period" name="periodOption" type="radio" value="period" {if $optionVars.periodOption == "period"}checked{/if}>
                                    <label for="period" >Period</label>
                                </span>
                                <select id="period" name="periodId" class="mb-dropdown form-control" onchange="changePeriodRadioBtn();">
                                    {html_options values=$optionVars.periodIDArray output=$optionVars.periodDateArray selected=$optionVars.periodId}
                                </select>
                                <div class="clearfix"></div>
                            </div>
                            <div class="text-center" style="padding-top: 15px; margin-bottom: -15px">
                                <button type="submit" name="submit" class="btn button-2" onclick="$(this).find('i').addClass('fa-spin')"> <i class="fa fa-refresh"></i> Update</button>
                            </div>
                        </form>
                        <br class="clearfix" />
                        {if $optionVars.periodOption != NULL}
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <th><a href="{$members_link}">Member Name</a></th>
                                        <th><a href="{$date_link}">{if $optionVars.ref_dd == 'SIGNUPS'}Signup Date{else}Purchase Date{/if}</a></th>
                                        <th><a href="{$amount_link}">{if $optionVars.ref_dd == 'SIGNUPS'}Total Purchases{else}Purchase{/if}</a></th>
                                        <th>Action</th>
                                    </tr>
                                    <tr>
                                        {foreach from=$members key=k item=v}
                                        {cycle values="favDataDark, favDataLight" assign="rowClass"}
                                    <tr>
                                        <td>{$v.referred_username}</td>
                                        <td>{$v.signupDate}</td>
                                        <td>${$v.transaction_sum}</td>
                                        <td><a href='/models/?{'show=mailCompose'|base64_encode}' class="btn button-2 send-message"  onclick='utils.popNewMessage("{$v.referred_username}","{$v.referred_id}",event)'><i class="fa fa-envelope"></i> Send Message</a>
                                        </td>
                                    </tr>
                                    {/foreach}

                                </table>
                            </div>

                            {/if}

                            {if $optionVars.periodOption != NULL}
                                {if $pageCount > 1}
                                    <div align="left" class="defText">
                                        Page [ {$pageNumber} ]
                                    </div>
                                    <div align="right" class="defText">
                                        {if $pageNumber != 1}
                                            <a href="{$paging.prevLink}" class="defText">
                                                &#139; Prev
                                            </a> |
                                        {/if}
                                        {foreach from=$paging.pages item="page"}
                                            <a href="{$page.link}" class="defText">{if $pageNumber == $page.pageNo}<b>{/if}{$page.pageNo}{if $pageNumber == $page.pageNo}</b>{/if}</a> |
                                        {/foreach}
                                        {if $pageCount eq $pageNumber}
                                        {else}
                                            <a href="{$paging.nextLink}" class="defText">Next &#155;</a>
                                        {/if}
                                    </div>
                                {else}
                                    <div align="left" class="defText">
                                        Page [ {$pageNumber} ]
                                    </div>
                                {/if}
                            {/if}
                            {if $optionVars.periodOption != NULL}
                                <hr>
                                <div class="col-sm-6 col-sm-offset-3">
                                    <div class="col-xs-12 bg-aqua-active">Totals</div>
                                    <div class="col-xs-6">{if $optionVars.ref_dd == 'SIGNUPS'}Signups{else}Purchases{/if}</div>
                                    <div class="col-xs-6 text-right">{if $optionVars.ref_dd == 'SIGNUPS'}Purchases{else}Amount{/if}</div>
                                    <div class="col-xs-6">{$total_signups}</div>
                                    <div class="col-xs-6 text-right">${$total_amount}</div>
                                </div>
                            {/if}

                    </div>
                    <!-- /.tab-pane -->
                    <div class="tab-pane" id="tab_2-2">
                            <p class="clear_wl">Referral Banners</p>
                            <p class="clear_wl">Below are various banners you can use to promote yourself. Simply select the banner you want and select the place you would like it to link to. Then copy and paste the HTML code to anyplace you wish.</p>
                        <div id="banner150" class="clearfix">
                            <h4 class="title col-md-12">150x150 Banners</h4>
                            {assign var="banner_id" value=1}
                            {foreach from=$banners_150x150 item="banner_image"}
                                <div class="col-md-4 text-center with-border">
                                    <div class="banner-row">
                                        <p id="banner_test_{$banner_id}" class="text-center" >
                                            <a href='{$referrer_profile_url}' target="_blank"><img src='{$banner_image}'/></a>
                                        </p>
                                        <div class="form-group">
                                            <p class="caption">
                                                <label for="lp150_{$banner_id}">Select Landing Page</label>
                                                <select id="lp150_{$banner_id}" class="form-control" onchange="switch_tags(this,{$banner_id},'{$banner_image}');">
                                                    <option value=0>Profile Page</option>
                                                    <option value=1>Join Page</option>
                                                </select>
                                            </p>
                                        </div>

                                        <textarea
                                            class="form-control"
                                            id="banner_{$banner_id}"
                                            readonly="readonly"
                                            data-name="Landing Page"
                                            data-type="code"
                                            onclick="this.select();"><a href='{$referrer_profile_url}'><img src='{$banner_image}' border='0' /></a></textarea>
                                        <div class="wcc-tooltip">
                                            <p onclick="utils.copyText('#banner_{$banner_id}', '#banner_tip_{$banner_id}')" onmouseout="utils.clearToolTip('#banner_tip_{$banner_id}')">
                                                <span class="tooltiptext" id="banner_tip_{$banner_id}">click to Copy to clipboard</span>
                                                (<span class="link">copy code above</span>)
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                {assign var="banner_id" value=$banner_id+1}
                            {/foreach}
                        </div>
                        <div id="banners200" class="clearfix">
                            <h4 class="title col-md-12">200x150 Banners</h4>
                            {foreach from=$banners_200x150 item="banner_image"}
                                <div class="col-md-4">
                                    <div class="banner-row">
                                        <p id="banner_test_{$banner_id}" class="text-center">
                                            <a href='{$referrer_profile_url}' target="_blank"><img src='{$banner_image}' border='0' /></a>
                                        </p>
                                        <div class="form-group">
                                            <p class="caption">
                                                <label for="lp200">Select Landing Page</label>
                                                <select id="lp200" class="form-control" onchange="switch_tags(this,{$banner_id},'{$banner_image}');">
                                                    <option value=0>Profile Page</option>
                                                    <option value=1>Join Page</option>
                                                </select>
                                            </p>
                                        </div>
                                        <textarea
                                            class="form-control"
                                            id="banner_{$banner_id}"
                                            readonly="readonly"
                                            data-name="Landing Page"
                                            data-type="code"
                                            onclick="this.select();"><a href='{$referrer_profile_url}'><img src='{$banner_image}' border='0' /></a></textarea>
                                        <div class="wcc-tooltip">
                                            <p onclick="utils.copyText('#banner_{$banner_id}', '#banner_tip_{$banner_id}')" onmouseout="utils.clearToolTip('#banner_tip_{$banner_id}')">
                                                <span class="tooltiptext" id="banner_tip_{$banner_id}">click to Copy to clipboard</span>
                                                (<span class="link">copy code above</span>)
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                {assign var="banner_id" value=$banner_id+1}
                            {/foreach}
                        </div>
                    </div>
                    <!-- /.tab-pane -->
                    <div class="tab-pane {if $optionVars.periodOption eq NULL}active{/if}" id="tab_3-2">
                        <strong>Referral Program</strong>
                        <p class="clear_wl">Take advantage of our referral program and start earning <span class="text-light-blue">{$payout_percent}%</span> on any new member you refer who
                            purchases. We have provided you link codes and banners for you to promote yourself.</p>
                        <ul>
                            <li>{$payout_percent}% Referral Earnings</li>
                            <li>Lifetime Earnings on Referrals</li>
                            <li>Self Promotion</li>
                        </ul>
                        This is a great tool for you to market yourself and start earning more money! Referral earnings will
                        appear under the 'My Earnings' report as well as the 'Referred Members' report above.
                        <strong>Referral Link Codes</strong>
                        <p class="clear_wl">The link codes below are tied to your account. Any new member that signs up through these links will be considered your referral.</p>
                        <div id="link-one">
                            <label for="default-link">Your default link:</label>
                            <input id="default-link" class="form-control" onclick="this.select();" data-name="Default Link" data-type="link" value="{$referrer_profile_url_rewrite}" readonly="readonly" /></td>
                            <div class="wcc-tooltip">
                                <p onclick="utils.copyText('#default-link', '#default-page-tip')" onmouseout="utils.clearToolTip('#default-page-tip')">
                                    <span class="tooltiptext" id="default-page-tip">click to Copy to clipboard</span>
                                    (<span class="link">copy link above</span>)
                                </p>
                            </div>
                        </div>
                        <div id="link-two">
                            <label for="join-page">Join Page:</label>
                            <input id="join-page" class="form-control" onclick="this.select();" data-name="Join Page" data-type="link" value="{$referrer_joinpage_url}" readonly="readonly" />
                            <div class="wcc-tooltip">
                                <p onclick="utils.copyText('#join-page', '#join-page-tip')" onmouseout="utils.clearToolTip('#join-page-tip')">
                                    <span class="tooltiptext" id="join-page-tip">click to Copy to clipboard</span>
                                    (<span class="link">copy link above</span>)
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
            </div>
            <!-- tab -->
        </div>
    </div>
</div>

