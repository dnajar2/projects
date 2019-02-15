<div class="clearfix"></div>
{if !$smarty.request.from_model_swf}
<footer class="main-footer primary-color secondary-bg-color footer">
    <div class="footernav">
        <div id="copy-right" class="pull-left">
            <p><strong>Copyright © 2006-{'Y'|date} <a href="{$whitelabel_settings.protocol}{$whitelabel_settings.domain}">{$whitelabel_settings.copyright_name}</a>.</strong> All rights
                reserved.</p>
        </div>
        <div class="pull-right hidden-xs">
            {*Right side footer content*}
            <ul id="footerNav" class="nav navbar-nav" style="position:relative;">
                {if !$_CONFIG.SITE.IS_COBRAND}
                    {if !$smarty.session.__logged_in}
                        <li><a href="https://www.datinggold.com/index.php?aid=10404" target="_blank">Affiliate Program</a></li>
                    {/if}
                {/if}
                {if !$_CONFIG.SITE.HIDE_STUDIOS_WANTED}
                    {if !$smarty.session.__logged_in}
                        <li><a href="/?{'show=register_studios'|base64_encode}">Studios Wanted</a></li>
                    {/if}
                {/if}
                {if !$smarty.session.__logged_in}
                    <li><a href="/managers/" title="Manages login">Studio Login</a></li>
                {/if}
                <li><a href="#" onclick='window.open("http://www.dmcanotice.com/Notice&TakedownPolicy.html","_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=500,width=800,height=600")'>DMCA Notice</a></li>
                <li><a href="#" onclick='window.open("/?{'show=privacy&popup=true&width=900'|base64_encode}","_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=500,width=800,height=600")'>Privacy Policy</a></li>
                <li><a href="#" onclick='window.open("/?{'show=terms&popup=true&width=900'|base64_encode}","_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=500,width=800,height=600")'>Terms and Conditions</a></li>
                <li><a href="#" onclick='window.open("/?{'show=2257&popup=true'|base64_encode}","_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=500,width=800,height=600")'>18 U.S.C. &sect;2257 Records Keeping</a></li>
                {if !$_CONFIG.SITE.IS_COBRAND || ($_CONFIG.SITE.IS_COBRAND && $_CONFIG.SITE.COBRAND.showFooterSafeButtons)}
                    <li><a href="http://www.rtalabel.org/" target="_blank"><img src="{$CDN_SCHEMA}/images/wcc1/88x31_RTA-5042-1996-1400-1577-RTA_c.gif" border="0" alt="rta" hspace="3" vspace="5" /></a></li>
                    <li><a href="http://www.asacp.org/ASACP.php" target="_blank"><img src="{$CDN_SCHEMA}/images/wcc1/asacp.jpg" border="0" alt="asacp" hspace="3" vspace="5"></a></li>
                {/if}
            </ul>
        </div>
    </div>
</footer>
{/if}
