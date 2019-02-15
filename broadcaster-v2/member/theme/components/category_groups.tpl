				{foreach from=$groups item="group" loop="category_groups"}
				<li{if $group.selected} class="active"{/if}>
					<a href="#{$group.htag}" data-toggle="pill" rel="nofollow">
						{$group.label_name} &nbsp; <span class="badge">{$group.online_count}</span>
					</a>
				</li>
				{/foreach}
