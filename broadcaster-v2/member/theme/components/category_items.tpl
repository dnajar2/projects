<ul{if $ul_id} id="{$ul_id}{$ul_type}"{/if}>
	{foreach from=$categories item="category" loop="category_list"}
		<a href="{$category.url}" title="{$category.category_name}" rel="nofollow">
			<li{if $category.selected} class="active"{/if}>
				{$category.category_name} <span>{$category.online_count} &nbsp;<i class="fa fa-comments comments"></i>
				</span>
			</li>
		</a>
	{/foreach}
</ul>
