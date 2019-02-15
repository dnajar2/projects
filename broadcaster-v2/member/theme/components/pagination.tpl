{if $pagination}
<!-- Pagination -->
<div class="bottomnav">
	<div class="row-fluid"></div>
	<div class="pagination pagination-info" >
		<ul>
			{if $pagination.previous_page && $pagination.previous_page_url}
			<li class="button-3"><a href="{$pagination.previous_page_url}" >Prev <i class="fui-arrow-left"></i> </a></li>
			{else}
			<li class="button-2"><a href="#"  onclick='return false;'>Prev <i class="fui-arrow-left"></i> </a></li>
			{/if}
			
			{foreach from=$pagination.pages item='page'}
			<li class='button-2 {if $page.page_no == $pagination.page_no}active{/if}'><a href='{$page.url}'>{$page.page_no}</a></li>
			{/foreach}
			
			{if $pagination.next_page && $pagination.next_page_url}
			<li class="button-2"><a  href="{$pagination.next_page_url}" >Next <i class="fui-arrow-right"></i> </a></li>
			{else}
			<li class="button-3"><a href="#"  'onclick='return false;'>Next <i class="fui-arrow-right"></i> </a></li>
			{/if}
		</ul>
	</div>
</div>	
<div class="clearfix"></div>
{/if}