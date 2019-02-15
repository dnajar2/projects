{include file="wcc3/components/html_header.tpl" show=$show}
<body>
{if $smarty.get.popup eq 'true'}
	{literal}
		<style type="text/css">
			body{
				padding-top: 25px !important;
				}
			.sub-page-title {
				padding-top: 0 !important;
				}
		</style>
	{/literal}
{/if}
	{if $smarty.get.popup neq 'true'}
		{include file="wcc3/components/header.tpl" show=$show}
	{/if}
	{include file="wcc3/components/terms.tpl" show=$show}

	<div class="clearfix"></div>
	<!--
==============================================================================
 -->{if $smarty.get.popup neq 'true'}
		{include file="wcc3/components/footer.tpl" show=$show}
	{/if}
	<!-- Bootstrap core JavaScript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script>
	{literal}

	{/literal}
	</script>
</body>
{include file="wcc3/components/html_footer.tpl" show=$show}
