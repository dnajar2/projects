<div class="col-lg-12">
    <div class="box box-primary direct-chat direct-chat-primary">
        <div class="box-header with-border">
            <h3 class="box-title">
                <span>
                    <strong>Server Date/Time:</strong>&nbsp;
                    {$smarty.now|date_format:"%m/%d/%Y %I:%M %p %Z"}
                </span>
                <br>
                <span id="local_date_time">
                    <strong>Local Date/Time:</strong>&nbsp;
                    <span></span>
                </span>
            </h3>
        </div>
        <!-- /.box-header -->
        <form action="/models/" method="post">
            <input type="hidden" name="show" value="myearnings">
            <input name="periodOption" type="hidden" value="{$optionVars.today}">
            <div class="box-body">
                <div class="col-xs-12 text-center table-heading">
                    <strong>Earnings Stat Date</strong>
                </div>

                <div class="clearfix">
                        <div class="col-md-6 border-top">
                            <div>
                                <label for="periodOptionTd">
                                    <input  name="periodOption" id="periodOptionTd" type="radio" value="today" {if $optionVars.periodOption=="today"}checked{/if}>
                                    <span class="label-earnings">Today</span> &nbsp; {$optionVars.today}
                                </label>
                            </div>
                            <div>
                                <label for="periodOptionYd">
                                    <input name="periodOption" id="periodOptionYd" type="radio" value="yesterday" {if $optionVars.periodOption=="yesterday"}checked{/if}>
                                    <span class="label-earnings">Yesterday</span> &nbsp; {$optionVars.yesterday}
                                </label>
                            </div>
                            <div>
                                <label for="periodOptionD" style="width: 100%">
                                    <span id="dateInput">
                                        <input name="periodOption" id="periodOptionD" type="radio" value="date" {if $optionVars.periodOption=="date"}checked{/if}>
                                        <span class="label-earnings">Date</span>
                                    </span>
                                    <span id="dateSelect">
                                        {html_select_date class="mb-dropdown form-control" prefix="date_" time=$optionVars.date_ts start_year="2000"  end_year="+0" month_format="%b"}
                                    </span>
                                </label>
                            </div>
                        </div>
                        {* periods *}
                        <div id="dateFrom" class="col-md-6">
                            <div id="datFromRadio"  class="clearfix" style="margin-bottom: 10px">
                                <div style="padding: 5px 0">
                                    <label for="periodOptionF">
                                    <input name="periodOption" id="periodOptionF" type="radio" value="fromto" {if $optionVars.periodOption=="fromto"}checked{/if}>
                                    <span class="label-earnings">From</span>
                                    </label>
                                </div>
                                {html_select_date class="mb-dropdown form-control" prefix="date_from_" time=$optionVars.date_from_ts start_year="2000" end_year="+0"}
                            </div>
                            <div id="datePeriod" class="clearfix">
                                <label for="periodOptionT" style="display: block;">
                                    {*<input name="periodOption" id="periodOptionT" type="radio" value="to"{if $optionVars.periodOption=="period"}checked{/if}>*}
                                    <span class="label-earnings" style="display: block; width: 100%;">To</span>
                                </label>
                                {html_select_date class="mb-dropdown form-control" prefix="date_to_" time=$optionVars.date_to_ts start_year="2000" end_year="+0"}
                            </div>
                            <div id="earnings_period">
                                <label for="periodOptionP">
                                    <input name="periodOption" id="periodOptionP" type="radio" value="period"{if $optionVars.periodOption=="period"}checked{/if}>
                                    <span class="label-earnings" style="display: inline-block; margin-top: 10px;">Period</span> &nbsp;
                                        <select id="periodId" class="form-control" name=periodId>{html_options values=$optionVars.periodIDArray
                                                                    output=$optionVars.periodDateArray
                                                                    selected=$optionVars.periodId
                                                                }
                                        </select>
                                </label>
                            </div>
                        </div>
                    </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
                <div class="text-center">
                    <button type="submit" name="getData" id="getData" class="btn button-2" onclick="$(this).find('i').addClass('fa-spin')"> <i class="fa fa-refresh"></i> Get Data</button>
                    <br>
                    {if $stats_run_wait_time_min > 0 }<font color="#596E83" face="Tahoma" style="font-size: 11px"> <b>Note: &nbsp;Stats can only be ran once every {$stats_run_wait_time_min} minutes.</b></font><br>
                        <img src="/images/spacer.gif" height="7px">
                    {/if}
                </div>
            </div>
        </form>
    </div>
</div>

{if $formPosted && !$statsRunError}
<div id="earningsRendered" class="col-lg-12">
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title"><strong>REVENUE </strong>from {$periodOption_start} to {$periodOption_end}</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <div class="col-sm-4">
                <canvas id="minutesCtx" width="100%" height="400" style="display: none"></canvas>
            </div>
            <div class="col-sm-4">
                <canvas id="creditsCtx" width="100%" height="400" style="display: none"></canvas>
            </div>
            <div class="col-sm-4">
                <canvas id="showsCtx" width="100%" height="400" style="display: none"></canvas>
            </div>
            <div class="clearfix"></div>
            <div id="report_header">
                <div class="table-row"><strong>Username:</strong> {$username}</div>
                <div class="table-row"><strong>Model Name:</strong> {$name}</div>
                <div class="table-row"><strong>Total Free Chat Duration</strong>&nbsp;({$free_chat_hours} hours)</div>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-striped dataTable">
                    <thead>
                    <tr role="row">
                        <th><strong>Customer</strong></th>
                        <th><strong>Product</strong></th>
                        <th><strong>Date</strong></th>
                        <th><strong>Minutes</strong></th>
                        <th><strong>Credits / Min</strong></th>
                        <th><strong>Show Credits</strong></th>
                        <th><strong>Credits Earned</strong></th>
                        <th><strong>Tip Credits Earned</strong></th>
                        <th><strong>Total </strong>
                            <a href="javascript:void(0)" onmouseout="UnTip()"
                                onclick="Tip(tip, SHADOW, true, TITLE, 'Total', PADDING, 9, WIDTH, 200);">
                                ?</a>
                        </th>
                    </tr>
                    </thead>
                    {foreach from=$form key=k item=v}
                        <tr>
                            <td class="client">{$v.client}</td>
                            <td class="product-type">{$v.product_type}<br>{$v.product_note}</td>
                            <td class="date">{$v.date_fmt}</td>
                            <td class="minutes">{$v.minute_count}</td>
                            <td class="cc-fee">{if $v.cc_fee}{$v.cc_fee}{else}n/a{/if}</td>
                            <td class="cc-gross">{$v.gross_fmt}</td>
                            <td class="cc-earned">{$v.creditsEarnedFmt}</td>
                            <td class="tip">{if $v.tip_amount}{$v.tip_amount}{else}n/a{/if}</td>
                            <td class="date-total">{$v.total_fmt}</td>
                        </tr>
                    {/foreach}
                </table>
            </div>
            <div class="text-right">
                <strong>Sub-Total: ${$totalcost}</strong>
            </div>
            {if $referral_details}
                <table class="table table-bordered table-striped dataTable">
                    <tr>
                        <td><strong>Member Referrals </strong></td>
                    </tr>
                    <tr>
                        <td><strong>Customer</strong></td>
                        <td><strong>Date</strong></td>
                        <td><strong>Purchased $</strong></td>
                        <td><strong>Referral %</strong></td>
                        <td><strong>Amount $</strong></td>
                    </tr>
                    {foreach from=$referral_details key=k item=v}
                        <tr>
                            <td>{$v.referred_username}</td>
                            <td>{$v.transaction_date}</td>
                            <td>{$v.transaction_amount}</td>
                            <td>{$v.payout_percent}%</td>
                            <td>{$v.payout_amount}</td>
                        </tr>
                    {/foreach}
                </table>
                <div class="text-right">
                    <strong>Member Referral Total: {$referral_total}</strong>
                </div>
            {/if}
            <div class="text-right">
                <strong>
                    Customer Returns
                    <span id="customerReturnsDetailsDiv"></span>
                    {if $totalChargebacksFmt neq "0.00"}
                    <a href="#"
                        onClick="CustomerReturnsDetailsAlertHandler( '{$customerReturnsDetailsPath}', '{$customerReturnsDetailsQryStr}', 'customerReturnsDetailsDiv' );return false;"
                        class="customerReturnsDetailsLink">(view details)</a>{/if}:</strong>
                    <strong>${$totalChargebacksFmt}</strong>
            </div>
            <div class="text-right">
                <strong>Total: ${$net}</strong>
            </div>
        </div>
        <!-- /.box-body -->
    </div>
</div>
{/if}
