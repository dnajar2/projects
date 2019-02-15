<div class="col-xs-12">
    <div id="wccwall_container">
        {if !$from_swf}
            <div class="mainBar">
                {$wall_caption_text}
                    {if $wccwall_auto_refresh == "true"}
                        <span style="padding-left:10px;font-size:9px;font-weight:normal;">(auto updating)</span>
                    {/if}
            </div>
            <div id="wccwall_message">&nbsp;</div>
            <div id="wccwall_submessage">&nbsp;</div>
        {/if}
        {if !$formodels && !$from_swf}
            <div>
                <a class="wccwall_a_link" style="font-size:12px;" href="/?{'show=wall&limit=-1&id=-1&auto_refresh=true&type=-1'|base64_encode}">Most Recent</a>
            </div>
        {/if}
        <div valign="top" align="center" width="{$wall_td_width}" id="wccwall_td" style="padding:0px; width: {$wall_td_width}px; background-color: {$wall_bg_color};">
            <div id="wccwall" style="background-color: {$wall_bg_color}; width: {$wall_td_width}px; height:{$wall_min_height}px;min-height:{$wall_min_height}px;max-height:{$wall_min_height}px;">
                {if $wall_events}
                {foreach from=$wall_events name="wcc_wall" item="event"}
                    <div class="wccwall_event_{$css_flag}">{$event.html}</div>
                    {if $css_flag == "odd"}
                        {assign var="css_flag" value="even"}
                    {else}
                        {assign var="css_flag" value="odd"}
                    {/if}
                {/foreach}
                    <script language="JavaScript" type="text/javascript">
                        WccWall.updateTimestamps();
                        <!--
                        WccWall.css_flag = '{$css_flag}';
                        -->
                    </script>
                {else}
                    <div>There are no Wall Events to display</div>
                {/if}
            </div>
            {if $this_is_not_configured == "so_dont_use_it_yet" && $wccwall_auto_refresh == "false"}
                <div id="wccwall_bottom">
                    <a class="wccwall_bottom_a" href="#">Older Posts</a>
                </div>
            {/if}
        </div>
    </div>
</div>
