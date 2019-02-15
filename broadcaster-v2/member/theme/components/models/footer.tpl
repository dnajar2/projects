<div id="models_footer" class="text-center" {if $model_registration_step eq 2 || $_SESSION.model_registration.step eq 2}style="position: absolute; bottom:0;"{/if}>
	<p>Copyright &copy; 2006 thru {$smarty.now|date_format:"%Y"} {if $whitelabel_settings.copyright_name}{$whitelabel_settings.copyright_name}{else} {$_CONFIG.SITE.SITE_NAME}{/if}. All right reserved.</p>
</div>
</div>
{include file="wcc3/components/javascripts.tpl" show=$show}
</body>
{include file="wcc3/components/html_footer.tpl" show=$show}
