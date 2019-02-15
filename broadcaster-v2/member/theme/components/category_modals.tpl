<!-- modal category modals -->
<!--  Category modal -->
{foreach from=$groups key=k item="group" loop="category_group_modals"}
{assign var="htag" value=$group.htag}
<div class="modal animated slideInDown categories" id="{$group.htag}-modal" role="dialog">
	<div class="modal-dialog">	
		<!-- modal content-->
		<div class="modal-content sort">
			<div class="modal-header navbar-inverse">
				<button type="button" class="close" data-dismiss="modal">&times; </button>
				<h1 class="modal-title">{if $group.id == "0"}All Categories{else}{$group.label_name}{/if}</h1>
			</div>
			<div style="background:#ffffff;" id="{$group.htag}-categories" class="modal-body">
				<div class="cat-column-modal" >
					{include file="$_THEME/components/category_items.tpl" categories=$group_categories[$htag] ul_id=$htag ul_type="-modal"}
				</div>
			 	<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
{/foreach}
<!-- ==== end of all categories === -->
