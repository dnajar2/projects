<div class="col-md-12">
    <div class="box box-solid">
        <div class="box-header with-border">
            <h3 class="box-title">Payments</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <div class="col-md-8 col-md-offset-2 table-responsive">
                {assign var="filler" value="---------"}

                {assign var="colspan" value="3"}
                {if $show_studio}
                    {assign var="colspan" value=$colspan+1}
                {/if}
                {if $show_model}
                    {assign var="colspan" value=$colspan+1}
                {/if}
                {if $show_payout_id}
                    {assign var="colspan" value=$colspan+1}
                {/if}

                {if $pending_payout}
                    <table class="table">

                        <tr class="{$pending_header_class}">
                            <td valign="top" align="left" colspan="{$colspan}"><b>Total Pending Balance</b></td>
                        </tr>

                        <tr class="{$pending_data_class}">
                            <td valign="left" align="center" width="*" colspan="{$colspan}">You have a total pending balance of {$pending_payout.total_fmt}.</td>
                        </tr>

                    </table>

                    <br>
                {/if}

                {if $payout_history}
                <table class="table table-striped">

                    <tr class="{$section_header_class}">
                        <td valign="top" align="left" colspan="{$colspan}"><b>Grand Totals</b></td>
                    </tr>

                    <tr class="grand_total_row_data">
                        <td valign="left" align="center" width="*" colspan="{$colspan}">For all of the years below, {$payout_history.grand_totals.num_payouts} payout{if $payout_history.grand_totals.num_payouts > 1}s{/if} were made totaling {$payout_history.grand_totals.total_fmt}</td>
                    </tr>

                    <tr><td>&nbsp;</td></tr>

                    {assign var="alt_class" value="altRow1"}
                    {foreach from=$payout_history.report key="year" item="year_item" name="year_loop"}

                        <tr class="{$section_header_class}">
                            <td valign="top" align="left" colspan="{$colspan}">{$year} &nbsp;({$payout_history.totals[$year].num_payouts} payout{if $payout_history.totals[$year].num_payouts > 1}s{/if})</td>
                        </tr>

                        <tr class="tableHeader">
                            {if $show_payout_id}
                                <td valign="top" align="left" width="12%"><b>Payout ID</b></td>
                            {/if}
                            <td valign="top" align="left" width="13%"><b>Paid Date</b></td>
                            {if $show_studio}
                                <td valign="top" align="left" width="15%"><b>Studio</b></td>
                            {/if}
                            {if $show_model}
                                <td valign="top" align="left" width="15%"><b>Model</b></td>
                            {/if}
                            <td valign="top" align="left" width="11%"><b>Method</b></td>
                            <td valign="top" align="right" width="10%"><b>Payout Amount</b></td>
                        </tr>

                        {foreach from=$year_item key="report_key" item="report_item" name="report_loop"}
                            {assign var="row_id_base" value="row_"|cat:$report_item.id}
                            <tr id="{$row_id_base}_1" class="{$alt_class}"{if $show_mouseovers} onMouseOver="payout_history.on_hilite_row( '{$row_id_base}', '{$alt_class}', 1 ); return false;" onMouseOut="payout_history.on_unhilite_row( '{$row_id_base}', '{$alt_class}', 1 ); return false;" onClick="payout_history.on_activate_row( '{$row_id_base}', '{$alt_class}', 1 ); return false;"{/if}>
                                {if $show_payout_id}
                                    <td valign="top" align="left">{$report_item.id}</td>
                                {/if}
                                <td valign="top" align="left">{$report_item.paid_date_fmt}</td>
                                {if $show_studio}
                                    <td valign="top" align="left">{$report_item.studio_name} ({$report_item.studio_id})</td>
                                {/if}
                                {if $show_model}
                                    <td valign="top" align="left">{if $report_item.model_username}{$report_item.model_username} ({$report_item.model_id}){else}{$filler}{/if}</td>
                                {/if}
                                <td valign="top" align="left">{$report_item.payout_method_name}</td>
                                <td valign="top" align="right">{$report_item.total_fmt}</td>
                            </tr>

                            {if $alt_class == "altRow1"}
                                {assign var="alt_class" value="altRow2"}
                            {else}
                                {assign var="alt_class" value="altRow1"}
                            {/if}
                        {/foreach}

                        <tr class="total_row">
                            <td valign="top" align="right" colspan="{$colspan}" class="total_row_data">Total: &nbsp;&nbsp;{$payout_history.totals[$year].total_fmt}</td>
                        </tr>

                        <tr><td>&nbsp;</td></tr>
                    {/foreach}
                </table>
            </div>
            <br>
            {else}
            <div class="text-center">You have no payments to show at this time.<br></div>
            {/if}
            </div>
        </div>
        <!-- /.box-body -->
    </div>
    <!-- /.box -->
</div>
