<!-- start of my accont menu -->
<section id="maf" class="show animated fadeIn">
	<!-- maf My Account features -->
	<!-- start of my account features -->
		<!-- #13 -->
	{foreach from=$buttons key=k item="button"}
	{if $button.enabled && $button.is_desktop}
	<div id="my-{$button.title}" class="col-sm-3 accout-actions" onclick="location.href='{$button.url}';">
		<a href="{$button.url}" title="{$button.title}">
		<i class="fa {$button.icon}"></i>
		<h3>{$button.caption}</h3>
		<div class="you-got-mail badge">{if $button.count gt 0}{$button.count}{/if}</div>
		</a>
	</div><!-- end #13 -->
	{/if}
	{/foreach}
	
	<div class="clearfix"></div>
</section>
<!-- end of menu section -->

{literal}
<script>
$(document).ready(function(){
	$('.accout-actions').mouseover(function(){
		$(this).find('h3').css('color','#337ab7')
		$(this).find('i').css({'opacity':'1','top':'0px'});
	});

	$('.accout-actions').mouseout(function(){
		$(this).find('h3').css('color','#34495e')
		$(this).find('i').css({'opacity':'0.5','top':'5px'});
	});
});
$('.accout-actions').each(function(){
	var id = $(this).attr('id');
	id = id.replace(" ","-").toLowerCase();
	$(this).attr('id', id);
})



// test scripts debug
</script>
{/literal}