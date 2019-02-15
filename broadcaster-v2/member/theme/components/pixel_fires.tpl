{if $pixel_fires}
	{foreach from=$pixel_fires key="k" item="v"}
	<div id="pixel_{$v.type}_{$v.id}">
		{$v.code}
	</div>
	{/foreach}
	
	{assign var="pixel_fires" value=""}
{/if}